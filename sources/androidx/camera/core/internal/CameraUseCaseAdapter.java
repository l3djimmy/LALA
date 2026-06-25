package androidx.camera.core.internal;

import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.SurfaceTexture;
import android.util.Pair;
import android.util.Size;
import android.view.Surface;
import androidx.camera.core.Camera;
import androidx.camera.core.CameraControl;
import androidx.camera.core.CameraEffect;
import androidx.camera.core.CameraInfo;
import androidx.camera.core.ImageCapture;
import androidx.camera.core.Logger;
import androidx.camera.core.Preview;
import androidx.camera.core.SurfaceRequest;
import androidx.camera.core.UseCase;
import androidx.camera.core.ViewPort;
import androidx.camera.core.concurrent.CameraCoordinator;
import androidx.camera.core.impl.AttachedSurfaceInfo;
import androidx.camera.core.impl.CameraConfig;
import androidx.camera.core.impl.CameraConfigs;
import androidx.camera.core.impl.CameraControlInternal;
import androidx.camera.core.impl.CameraDeviceSurfaceManager;
import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.Config;
import androidx.camera.core.impl.RestrictedCameraControl;
import androidx.camera.core.impl.RestrictedCameraInfo;
import androidx.camera.core.impl.SessionProcessor;
import androidx.camera.core.impl.StreamSpec;
import androidx.camera.core.impl.SurfaceConfig;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.UseCaseConfigFactory;
import androidx.camera.core.impl.utils.TransformUtils;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.processing.TargetUtils;
import androidx.camera.core.streamsharing.StreamSharing;
import androidx.core.util.Consumer;
import androidx.core.util.Preconditions;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
/* loaded from: classes.dex */
public final class CameraUseCaseAdapter implements Camera {
    private static final String TAG = "CameraUseCaseAdapter";
    private final CameraCoordinator mCameraCoordinator;
    private final CameraDeviceSurfaceManager mCameraDeviceSurfaceManager;
    private final CameraInternal mCameraInternal;
    private final LinkedHashSet<CameraInternal> mCameraInternals;
    private final CameraId mId;
    private UseCase mPlaceholderForExtensions;
    private final RestrictedCameraControl mRestrictedCameraControl;
    private final RestrictedCameraInfo mRestrictedCameraInfo;
    private StreamSharing mStreamSharing;
    private final UseCaseConfigFactory mUseCaseConfigFactory;
    private ViewPort mViewPort;
    private final List<UseCase> mAppUseCases = new ArrayList();
    private final List<UseCase> mCameraUseCases = new ArrayList();
    private List<CameraEffect> mEffects = Collections.emptyList();
    private CameraConfig mCameraConfig = CameraConfigs.emptyConfig();
    private final Object mLock = new Object();
    private boolean mAttached = true;
    private Config mInteropConfig = null;

    public CameraUseCaseAdapter(LinkedHashSet<CameraInternal> cameras, CameraCoordinator cameraCoordinator, CameraDeviceSurfaceManager cameraDeviceSurfaceManager, UseCaseConfigFactory useCaseConfigFactory) {
        this.mCameraInternal = cameras.iterator().next();
        this.mCameraInternals = new LinkedHashSet<>(cameras);
        this.mId = new CameraId(this.mCameraInternals);
        this.mCameraCoordinator = cameraCoordinator;
        this.mCameraDeviceSurfaceManager = cameraDeviceSurfaceManager;
        this.mUseCaseConfigFactory = useCaseConfigFactory;
        this.mRestrictedCameraControl = new RestrictedCameraControl(this.mCameraInternal.getCameraControlInternal());
        this.mRestrictedCameraInfo = new RestrictedCameraInfo(this.mCameraInternal.getCameraInfoInternal(), this.mRestrictedCameraControl);
    }

    public static CameraId generateCameraId(LinkedHashSet<CameraInternal> cameras) {
        return new CameraId(cameras);
    }

    public CameraId getCameraId() {
        return this.mId;
    }

    public boolean isEquivalent(CameraUseCaseAdapter cameraUseCaseAdapter) {
        return this.mId.equals(cameraUseCaseAdapter.getCameraId());
    }

    public void setViewPort(ViewPort viewPort) {
        synchronized (this.mLock) {
            this.mViewPort = viewPort;
        }
    }

    public void setEffects(List<CameraEffect> effects) {
        synchronized (this.mLock) {
            this.mEffects = effects;
        }
    }

    public void addUseCases(Collection<UseCase> appUseCasesToAdd) throws CameraException {
        synchronized (this.mLock) {
            Set<UseCase> appUseCases = new LinkedHashSet<>(this.mAppUseCases);
            appUseCases.addAll(appUseCasesToAdd);
            try {
                updateUseCases(appUseCases);
            } catch (IllegalArgumentException e) {
                throw new CameraException(e.getMessage());
            }
        }
    }

    public void removeUseCases(Collection<UseCase> useCasesToRemove) {
        synchronized (this.mLock) {
            Set<UseCase> appUseCases = new LinkedHashSet<>(this.mAppUseCases);
            appUseCases.removeAll(useCasesToRemove);
            updateUseCases(appUseCases);
        }
    }

    void updateUseCases(Collection<UseCase> appUseCases) {
        updateUseCases(appUseCases, false);
    }

    void updateUseCases(Collection<UseCase> appUseCases, boolean applyStreamSharing) {
        StreamSpec newStreamSpec;
        Config config;
        synchronized (this.mLock) {
            UseCase placeholderForExtensions = calculatePlaceholderForExtensions(appUseCases);
            StreamSharing streamSharing = createOrReuseStreamSharing(appUseCases, applyStreamSharing);
            Collection<UseCase> cameraUseCases = calculateCameraUseCases(appUseCases, placeholderForExtensions, streamSharing);
            List<UseCase> cameraUseCasesToAttach = new ArrayList<>(cameraUseCases);
            cameraUseCasesToAttach.removeAll(this.mCameraUseCases);
            List<UseCase> cameraUseCasesToKeep = new ArrayList<>(cameraUseCases);
            cameraUseCasesToKeep.retainAll(this.mCameraUseCases);
            List<UseCase> cameraUseCasesToDetach = new ArrayList<>(this.mCameraUseCases);
            cameraUseCasesToDetach.removeAll(cameraUseCases);
            Map<UseCase, ConfigPair> configs = getConfigs(cameraUseCasesToAttach, this.mCameraConfig.getUseCaseConfigFactory(), this.mUseCaseConfigFactory);
            try {
                Map<UseCase, StreamSpec> suggestedStreamSpecMap = calculateSuggestedStreamSpecs(getCameraMode(), this.mCameraInternal.getCameraInfoInternal(), cameraUseCasesToAttach, cameraUseCasesToKeep, configs);
                updateViewPort(suggestedStreamSpecMap, cameraUseCases);
                updateEffects(this.mEffects, cameraUseCases, appUseCases);
                for (UseCase useCase : cameraUseCasesToDetach) {
                    useCase.unbindFromCamera(this.mCameraInternal);
                }
                this.mCameraInternal.detachUseCases(cameraUseCasesToDetach);
                if (!cameraUseCasesToDetach.isEmpty()) {
                    for (UseCase useCase2 : cameraUseCasesToKeep) {
                        if (suggestedStreamSpecMap.containsKey(useCase2) && (config = (newStreamSpec = suggestedStreamSpecMap.get(useCase2)).getImplementationOptions()) != null && hasImplementationOptionChanged(newStreamSpec, useCase2.getSessionConfig())) {
                            useCase2.updateSuggestedStreamSpecImplementationOptions(config);
                        }
                    }
                }
                for (Iterator<UseCase> it = cameraUseCasesToAttach.iterator(); it.hasNext(); it = it) {
                    UseCase useCase3 = it.next();
                    ConfigPair configPair = (ConfigPair) Objects.requireNonNull(configs.get(useCase3));
                    useCase3.bindToCamera(this.mCameraInternal, configPair.mExtendedConfig, configPair.mCameraConfig);
                    useCase3.updateSuggestedStreamSpec((StreamSpec) Preconditions.checkNotNull(suggestedStreamSpecMap.get(useCase3)));
                }
                if (this.mAttached) {
                    this.mCameraInternal.attachUseCases(cameraUseCasesToAttach);
                }
                for (UseCase useCase4 : cameraUseCasesToAttach) {
                    useCase4.notifyState();
                }
                this.mAppUseCases.clear();
                this.mAppUseCases.addAll(appUseCases);
                this.mCameraUseCases.clear();
                this.mCameraUseCases.addAll(cameraUseCases);
                this.mPlaceholderForExtensions = placeholderForExtensions;
                this.mStreamSharing = streamSharing;
            } catch (IllegalArgumentException exception) {
                if (applyStreamSharing || !hasNoExtension() || this.mCameraCoordinator.getCameraOperatingMode() == 2) {
                    throw exception;
                }
                updateUseCases(appUseCases, true);
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x002e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static boolean hasImplementationOptionChanged(androidx.camera.core.impl.StreamSpec r7, androidx.camera.core.impl.SessionConfig r8) {
        /*
            androidx.camera.core.impl.Config r0 = r7.getImplementationOptions()
            androidx.camera.core.impl.Config r1 = r8.getImplementationOptions()
            java.util.Set r2 = r0.listOptions()
            int r2 = r2.size()
            androidx.camera.core.impl.Config r3 = r8.getImplementationOptions()
            java.util.Set r3 = r3.listOptions()
            int r3 = r3.size()
            r4 = 1
            if (r2 == r3) goto L20
            return r4
        L20:
            java.util.Set r2 = r0.listOptions()
            java.util.Iterator r2 = r2.iterator()
        L28:
            boolean r3 = r2.hasNext()
            if (r3 == 0) goto L4b
            java.lang.Object r3 = r2.next()
            androidx.camera.core.impl.Config$Option r3 = (androidx.camera.core.impl.Config.Option) r3
            boolean r5 = r1.containsOption(r3)
            if (r5 == 0) goto L4a
            java.lang.Object r5 = r1.retrieveOption(r3)
            java.lang.Object r6 = r0.retrieveOption(r3)
            boolean r5 = java.util.Objects.equals(r5, r6)
            if (r5 != 0) goto L49
            goto L4a
        L49:
            goto L28
        L4a:
            return r4
        L4b:
            r2 = 0
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.core.internal.CameraUseCaseAdapter.hasImplementationOptionChanged(androidx.camera.core.impl.StreamSpec, androidx.camera.core.impl.SessionConfig):boolean");
    }

    private int getCameraMode() {
        synchronized (this.mLock) {
            return this.mCameraCoordinator.getCameraOperatingMode() == 2 ? 1 : 0;
        }
    }

    private boolean hasNoExtension() {
        boolean z;
        synchronized (this.mLock) {
            z = this.mCameraConfig == CameraConfigs.emptyConfig();
        }
        return z;
    }

    private Set<UseCase> getStreamSharingChildren(Collection<UseCase> appUseCases, boolean forceSharingToPreviewAndVideo) {
        Set<UseCase> children = new HashSet<>();
        int sharingTargets = getSharingTargets(forceSharingToPreviewAndVideo);
        for (UseCase useCase : appUseCases) {
            Preconditions.checkArgument(!isStreamSharing(useCase), "Only support one level of sharing for now.");
            if (useCase.isEffectTargetsSupported(sharingTargets)) {
                children.add(useCase);
            }
        }
        return children;
    }

    private int getSharingTargets(boolean forceSharingToPreviewAndVideo) {
        int sharingTargets;
        synchronized (this.mLock) {
            CameraEffect sharingEffect = null;
            Iterator<CameraEffect> it = this.mEffects.iterator();
            while (true) {
                sharingTargets = 0;
                if (!it.hasNext()) {
                    break;
                }
                CameraEffect effect = it.next();
                if (TargetUtils.getNumberOfTargets(effect.getTargets()) > 1) {
                    Preconditions.checkState(sharingEffect == null, "Can only have one sharing effect.");
                    sharingEffect = effect;
                }
            }
            if (sharingEffect != null) {
                sharingTargets = sharingEffect.getTargets();
            }
            if (forceSharingToPreviewAndVideo) {
                sharingTargets |= 3;
            }
        }
        return sharingTargets;
    }

    private StreamSharing createOrReuseStreamSharing(Collection<UseCase> appUseCases, boolean forceSharingToPreviewAndVideo) {
        synchronized (this.mLock) {
            Set<UseCase> newChildren = getStreamSharingChildren(appUseCases, forceSharingToPreviewAndVideo);
            if (newChildren.size() < 2) {
                return null;
            }
            if (this.mStreamSharing != null && this.mStreamSharing.getChildren().equals(newChildren)) {
                return (StreamSharing) Objects.requireNonNull(this.mStreamSharing);
            } else if (isStreamSharingChildrenCombinationValid(newChildren)) {
                return new StreamSharing(this.mCameraInternal, newChildren, this.mUseCaseConfigFactory);
            } else {
                return null;
            }
        }
    }

    static boolean isStreamSharingChildrenCombinationValid(Collection<UseCase> children) {
        int[] validChildrenTypes = {1, 2, 4};
        Set<Integer> childrenTypes = new HashSet<>();
        for (UseCase child : children) {
            for (int type : validChildrenTypes) {
                if (child.isEffectTargetsSupported(type)) {
                    if (childrenTypes.contains(Integer.valueOf(type))) {
                        return false;
                    }
                    childrenTypes.add(Integer.valueOf(type));
                }
            }
        }
        return true;
    }

    static Collection<UseCase> calculateCameraUseCases(Collection<UseCase> appUseCases, UseCase placeholderForExtensions, StreamSharing streamSharing) {
        List<UseCase> useCases = new ArrayList<>(appUseCases);
        if (placeholderForExtensions != null) {
            useCases.add(placeholderForExtensions);
        }
        if (streamSharing != null) {
            useCases.add(streamSharing);
            useCases.removeAll(streamSharing.getChildren());
        }
        return useCases;
    }

    public List<UseCase> getUseCases() {
        ArrayList arrayList;
        synchronized (this.mLock) {
            arrayList = new ArrayList(this.mAppUseCases);
        }
        return arrayList;
    }

    Collection<UseCase> getCameraUseCases() {
        ArrayList arrayList;
        synchronized (this.mLock) {
            arrayList = new ArrayList(this.mCameraUseCases);
        }
        return arrayList;
    }

    public void attachUseCases() {
        synchronized (this.mLock) {
            if (!this.mAttached) {
                this.mCameraInternal.attachUseCases(this.mCameraUseCases);
                restoreInteropConfig();
                for (UseCase useCase : this.mCameraUseCases) {
                    useCase.notifyState();
                }
                this.mAttached = true;
            }
        }
    }

    public void setActiveResumingMode(boolean enabled) {
        this.mCameraInternal.setActiveResumingMode(enabled);
    }

    public void detachUseCases() {
        synchronized (this.mLock) {
            if (this.mAttached) {
                this.mCameraInternal.detachUseCases(new ArrayList(this.mCameraUseCases));
                cacheInteropConfig();
                this.mAttached = false;
            }
        }
    }

    private void restoreInteropConfig() {
        synchronized (this.mLock) {
            if (this.mInteropConfig != null) {
                this.mCameraInternal.getCameraControlInternal().addInteropConfig(this.mInteropConfig);
            }
        }
    }

    private void cacheInteropConfig() {
        synchronized (this.mLock) {
            CameraControlInternal cameraControlInternal = this.mCameraInternal.getCameraControlInternal();
            this.mInteropConfig = cameraControlInternal.getInteropConfig();
            cameraControlInternal.clearInteropConfig();
        }
    }

    private Map<UseCase, StreamSpec> calculateSuggestedStreamSpecs(int cameraMode, CameraInfoInternal cameraInfoInternal, Collection<UseCase> newUseCases, Collection<UseCase> currentUseCases, Map<UseCase, ConfigPair> configPairMap) {
        Rect sensorRect;
        List<AttachedSurfaceInfo> existingSurfaces = new ArrayList<>();
        String cameraId = cameraInfoInternal.getCameraId();
        Map<UseCase, StreamSpec> suggestedStreamSpecs = new HashMap<>();
        Map<AttachedSurfaceInfo, UseCase> surfaceInfoUseCaseMap = new HashMap<>();
        Iterator<UseCase> it = currentUseCases.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            UseCase useCase = it.next();
            SurfaceConfig surfaceConfig = this.mCameraDeviceSurfaceManager.transformSurfaceConfig(cameraMode, cameraId, useCase.getImageFormat(), useCase.getAttachedSurfaceResolution());
            AttachedSurfaceInfo attachedSurfaceInfo = AttachedSurfaceInfo.create(surfaceConfig, useCase.getImageFormat(), useCase.getAttachedSurfaceResolution(), ((StreamSpec) Preconditions.checkNotNull(useCase.getAttachedStreamSpec())).getDynamicRange(), getCaptureTypes(useCase), useCase.getAttachedStreamSpec().getImplementationOptions(), useCase.getCurrentConfig().getTargetFrameRate(null));
            existingSurfaces.add(attachedSurfaceInfo);
            surfaceInfoUseCaseMap.put(attachedSurfaceInfo, useCase);
            suggestedStreamSpecs.put(useCase, useCase.getAttachedStreamSpec());
        }
        if (!newUseCases.isEmpty()) {
            Map<UseCaseConfig<?>, UseCase> configToUseCaseMap = new HashMap<>();
            Map<UseCaseConfig<?>, List<Size>> configToSupportedSizesMap = new HashMap<>();
            try {
                sensorRect = this.mCameraInternal.getCameraControlInternal().getSensorRect();
            } catch (NullPointerException e) {
                sensorRect = null;
            }
            SupportedOutputSizesSorter supportedOutputSizesSorter = new SupportedOutputSizesSorter(cameraInfoInternal, sensorRect != null ? TransformUtils.rectToSize(sensorRect) : null);
            for (UseCase useCase2 : newUseCases) {
                ConfigPair configPair = configPairMap.get(useCase2);
                Rect sensorRect2 = sensorRect;
                UseCaseConfig<?> combinedUseCaseConfig = useCase2.mergeConfigs(cameraInfoInternal, configPair.mExtendedConfig, configPair.mCameraConfig);
                configToUseCaseMap.put(combinedUseCaseConfig, useCase2);
                configToSupportedSizesMap.put(combinedUseCaseConfig, supportedOutputSizesSorter.getSortedSupportedOutputSizes(combinedUseCaseConfig));
                sensorRect = sensorRect2;
            }
            Pair<Map<UseCaseConfig<?>, StreamSpec>, Map<AttachedSurfaceInfo, StreamSpec>> streamSpecMaps = this.mCameraDeviceSurfaceManager.getSuggestedStreamSpecs(cameraMode, cameraId, existingSurfaces, configToSupportedSizesMap);
            for (Map.Entry<UseCaseConfig<?>, UseCase> entry : configToUseCaseMap.entrySet()) {
                suggestedStreamSpecs.put(entry.getValue(), (StreamSpec) ((Map) streamSpecMaps.first).get(entry.getKey()));
            }
            for (Map.Entry<AttachedSurfaceInfo, StreamSpec> entry2 : ((Map) streamSpecMaps.second).entrySet()) {
                if (surfaceInfoUseCaseMap.containsKey(entry2.getKey())) {
                    suggestedStreamSpecs.put(surfaceInfoUseCaseMap.get(entry2.getKey()), entry2.getValue());
                }
            }
        }
        return suggestedStreamSpecs;
    }

    static void updateEffects(List<CameraEffect> effects, Collection<UseCase> cameraUseCases, Collection<UseCase> appUseCases) {
        List<CameraEffect> unusedEffects = setEffectsOnUseCases(effects, cameraUseCases);
        List<UseCase> appOnlyUseCases = new ArrayList<>(appUseCases);
        appOnlyUseCases.removeAll(cameraUseCases);
        List<CameraEffect> unusedEffects2 = setEffectsOnUseCases(unusedEffects, appOnlyUseCases);
        if (unusedEffects2.size() > 0) {
            Logger.w(TAG, "Unused effects: " + unusedEffects2);
        }
    }

    private static List<UseCaseConfigFactory.CaptureType> getCaptureTypes(UseCase useCase) {
        List<UseCaseConfigFactory.CaptureType> result = new ArrayList<>();
        if (isStreamSharing(useCase)) {
            for (UseCase child : ((StreamSharing) useCase).getChildren()) {
                result.add(child.getCurrentConfig().getCaptureType());
            }
        } else {
            result.add(useCase.getCurrentConfig().getCaptureType());
        }
        return result;
    }

    private static List<CameraEffect> setEffectsOnUseCases(List<CameraEffect> effects, Collection<UseCase> useCases) {
        List<CameraEffect> unusedEffects = new ArrayList<>(effects);
        for (UseCase useCase : useCases) {
            useCase.setEffect(null);
            for (CameraEffect effect : effects) {
                if (useCase.isEffectTargetsSupported(effect.getTargets())) {
                    Preconditions.checkState(useCase.getEffect() == null, useCase + " already has effect" + useCase.getEffect());
                    useCase.setEffect(effect);
                    unusedEffects.remove(effect);
                }
            }
        }
        return unusedEffects;
    }

    private void updateViewPort(Map<UseCase, StreamSpec> suggestedStreamSpecMap, Collection<UseCase> useCases) {
        boolean isFrontCamera;
        synchronized (this.mLock) {
            try {
                try {
                    if (this.mViewPort != null) {
                        Integer lensFacing = Integer.valueOf(this.mCameraInternal.getCameraInfoInternal().getLensFacing());
                        if (lensFacing == null) {
                            try {
                                Logger.w(TAG, "The lens facing is null, probably an external.");
                                isFrontCamera = true;
                            } catch (Throwable th) {
                                th = th;
                                throw th;
                            }
                        } else {
                            isFrontCamera = lensFacing.intValue() == 0;
                        }
                        Map<UseCase, Rect> cropRectMap = ViewPorts.calculateViewPortRects(this.mCameraInternal.getCameraControlInternal().getSensorRect(), isFrontCamera, this.mViewPort.getAspectRatio(), this.mCameraInternal.getCameraInfoInternal().getSensorRotationDegrees(this.mViewPort.getRotation()), this.mViewPort.getScaleType(), this.mViewPort.getLayoutDirection(), suggestedStreamSpecMap);
                        for (UseCase useCase : useCases) {
                            useCase.setViewPortCropRect((Rect) Preconditions.checkNotNull(cropRectMap.get(useCase)));
                            useCase.setSensorToBufferTransformMatrix(calculateSensorToBufferTransformMatrix(this.mCameraInternal.getCameraControlInternal().getSensorRect(), ((StreamSpec) Preconditions.checkNotNull(suggestedStreamSpecMap.get(useCase))).getResolution()));
                        }
                    }
                } catch (Throwable th2) {
                    th = th2;
                }
            } catch (Throwable th3) {
                th = th3;
            }
        }
    }

    private static Matrix calculateSensorToBufferTransformMatrix(Rect fullSensorRect, Size useCaseSize) {
        Preconditions.checkArgument(fullSensorRect.width() > 0 && fullSensorRect.height() > 0, "Cannot compute viewport crop rects zero sized sensor rect.");
        RectF fullSensorRectF = new RectF(fullSensorRect);
        Matrix sensorToUseCaseTransformation = new Matrix();
        RectF srcRect = new RectF(0.0f, 0.0f, useCaseSize.getWidth(), useCaseSize.getHeight());
        sensorToUseCaseTransformation.setRectToRect(srcRect, fullSensorRectF, Matrix.ScaleToFit.CENTER);
        sensorToUseCaseTransformation.invert(sensorToUseCaseTransformation);
        return sensorToUseCaseTransformation;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class ConfigPair {
        UseCaseConfig<?> mCameraConfig;
        UseCaseConfig<?> mExtendedConfig;

        ConfigPair(UseCaseConfig<?> extendedConfig, UseCaseConfig<?> cameraConfig) {
            this.mExtendedConfig = extendedConfig;
            this.mCameraConfig = cameraConfig;
        }
    }

    private Map<UseCase, ConfigPair> getConfigs(Collection<UseCase> useCases, UseCaseConfigFactory extendedFactory, UseCaseConfigFactory cameraFactory) {
        Map<UseCase, ConfigPair> configs = new HashMap<>();
        for (UseCase useCase : useCases) {
            configs.put(useCase, new ConfigPair(useCase.getDefaultConfig(false, extendedFactory), useCase.getDefaultConfig(true, cameraFactory)));
        }
        return configs;
    }

    /* loaded from: classes.dex */
    public static final class CameraId {
        private final List<String> mIds = new ArrayList();

        CameraId(LinkedHashSet<CameraInternal> cameraInternals) {
            Iterator<CameraInternal> it = cameraInternals.iterator();
            while (it.hasNext()) {
                CameraInternal cameraInternal = it.next();
                this.mIds.add(cameraInternal.getCameraInfoInternal().getCameraId());
            }
        }

        public boolean equals(Object cameraId) {
            if (cameraId instanceof CameraId) {
                return this.mIds.equals(((CameraId) cameraId).mIds);
            }
            return false;
        }

        public int hashCode() {
            return this.mIds.hashCode() * 53;
        }
    }

    /* loaded from: classes.dex */
    public static final class CameraException extends Exception {
        public CameraException() {
        }

        public CameraException(String message) {
            super(message);
        }

        public CameraException(Throwable cause) {
            super(cause);
        }
    }

    @Override // androidx.camera.core.Camera
    public CameraControl getCameraControl() {
        return this.mRestrictedCameraControl;
    }

    @Override // androidx.camera.core.Camera
    public CameraInfo getCameraInfo() {
        return this.mRestrictedCameraInfo;
    }

    @Override // androidx.camera.core.Camera
    public LinkedHashSet<CameraInternal> getCameraInternals() {
        return this.mCameraInternals;
    }

    @Override // androidx.camera.core.Camera
    public CameraConfig getExtendedConfig() {
        CameraConfig cameraConfig;
        synchronized (this.mLock) {
            cameraConfig = this.mCameraConfig;
        }
        return cameraConfig;
    }

    @Override // androidx.camera.core.Camera
    public void setExtendedConfig(CameraConfig cameraConfig) {
        synchronized (this.mLock) {
            if (cameraConfig == null) {
                cameraConfig = CameraConfigs.emptyConfig();
            }
            if (!this.mAppUseCases.isEmpty() && !this.mCameraConfig.getCompatibilityId().equals(cameraConfig.getCompatibilityId())) {
                throw new IllegalStateException("Need to unbind all use cases before binding with extension enabled");
            }
            this.mCameraConfig = cameraConfig;
            SessionProcessor sessionProcessor = this.mCameraConfig.getSessionProcessor(null);
            if (sessionProcessor != null) {
                Set<Integer> supportedOps = sessionProcessor.getSupportedCameraOperations();
                this.mRestrictedCameraControl.enableRestrictedOperations(true, supportedOps);
            } else {
                this.mRestrictedCameraControl.enableRestrictedOperations(false, null);
            }
            this.mCameraInternal.setExtendedConfig(this.mCameraConfig);
        }
    }

    @Override // androidx.camera.core.Camera
    public boolean isUseCasesCombinationSupported(UseCase... useCases) {
        synchronized (this.mLock) {
            try {
                try {
                    Map<UseCase, ConfigPair> configs = getConfigs(Arrays.asList(useCases), this.mCameraConfig.getUseCaseConfigFactory(), this.mUseCaseConfigFactory);
                    calculateSuggestedStreamSpecs(getCameraMode(), this.mCameraInternal.getCameraInfoInternal(), Arrays.asList(useCases), Collections.emptyList(), configs);
                } catch (IllegalArgumentException e) {
                    return false;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return true;
    }

    /* JADX WARN: Multi-variable type inference failed */
    UseCase calculatePlaceholderForExtensions(Collection<UseCase> appUseCases) {
        UseCase placeholder;
        synchronized (this.mLock) {
            placeholder = null;
            if (isCoexistingPreviewImageCaptureRequired()) {
                if (isExtraPreviewRequired(appUseCases)) {
                    placeholder = isPreview(this.mPlaceholderForExtensions) ? this.mPlaceholderForExtensions : createExtraPreview();
                } else if (isExtraImageCaptureRequired(appUseCases)) {
                    placeholder = isImageCapture(this.mPlaceholderForExtensions) ? this.mPlaceholderForExtensions : createExtraImageCapture();
                }
            }
        }
        return placeholder;
    }

    private boolean isCoexistingPreviewImageCaptureRequired() {
        boolean z;
        synchronized (this.mLock) {
            z = true;
            if (this.mCameraConfig.getUseCaseCombinationRequiredRule() != 1) {
                z = false;
            }
        }
        return z;
    }

    private boolean isExtraPreviewRequired(Collection<UseCase> useCases) {
        boolean hasPreview = false;
        boolean hasImageCapture = false;
        for (UseCase useCase : useCases) {
            if (isPreview(useCase)) {
                hasPreview = true;
            } else if (isImageCapture(useCase)) {
                hasImageCapture = true;
            }
        }
        return hasImageCapture && !hasPreview;
    }

    private boolean isExtraImageCaptureRequired(Collection<UseCase> useCases) {
        boolean hasPreview = false;
        boolean hasImageCapture = false;
        for (UseCase useCase : useCases) {
            if (isPreview(useCase)) {
                hasPreview = true;
            } else if (isImageCapture(useCase)) {
                hasImageCapture = true;
            }
        }
        return hasPreview && !hasImageCapture;
    }

    private static boolean isStreamSharing(UseCase useCase) {
        return useCase instanceof StreamSharing;
    }

    private static boolean isPreview(UseCase useCase) {
        return useCase instanceof Preview;
    }

    private static boolean isImageCapture(UseCase useCase) {
        return useCase instanceof ImageCapture;
    }

    private Preview createExtraPreview() {
        Preview preview = new Preview.Builder().setTargetName("Preview-Extra").build();
        preview.setSurfaceProvider(new Preview.SurfaceProvider() { // from class: androidx.camera.core.internal.CameraUseCaseAdapter$$ExternalSyntheticLambda1
            @Override // androidx.camera.core.Preview.SurfaceProvider
            public final void onSurfaceRequested(SurfaceRequest surfaceRequest) {
                CameraUseCaseAdapter.lambda$createExtraPreview$1(surfaceRequest);
            }
        });
        return preview;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ void lambda$createExtraPreview$1(SurfaceRequest surfaceRequest) {
        final SurfaceTexture surfaceTexture = new SurfaceTexture(0);
        surfaceTexture.setDefaultBufferSize(surfaceRequest.getResolution().getWidth(), surfaceRequest.getResolution().getHeight());
        surfaceTexture.detachFromGLContext();
        final Surface surface = new Surface(surfaceTexture);
        surfaceRequest.provideSurface(surface, CameraXExecutors.directExecutor(), new Consumer() { // from class: androidx.camera.core.internal.CameraUseCaseAdapter$$ExternalSyntheticLambda0
            @Override // androidx.core.util.Consumer
            public final void accept(Object obj) {
                CameraUseCaseAdapter.lambda$createExtraPreview$0(surface, surfaceTexture, (SurfaceRequest.Result) obj);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ void lambda$createExtraPreview$0(Surface surface, SurfaceTexture surfaceTexture, SurfaceRequest.Result surfaceResponse) {
        surface.release();
        surfaceTexture.release();
    }

    private ImageCapture createExtraImageCapture() {
        return new ImageCapture.Builder().setTargetName("ImageCapture-Extra").build();
    }
}
