package androidx.camera.core;

import android.graphics.Matrix;
import android.graphics.Rect;
import android.util.Range;
import android.util.Size;
import androidx.camera.core.impl.CameraControlInternal;
import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.Config;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.ImageOutputConfig;
import androidx.camera.core.impl.MutableOptionsBundle;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.StreamSpec;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.UseCaseConfigFactory;
import androidx.camera.core.impl.utils.TransformUtils;
import androidx.camera.core.internal.TargetConfig;
import androidx.camera.core.internal.utils.UseCaseConfigUtil;
import androidx.camera.core.processing.TargetUtils;
import androidx.camera.core.resolutionselector.ResolutionSelector;
import androidx.core.util.Preconditions;
import java.util.Collections;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;
/* loaded from: classes.dex */
public abstract class UseCase {
    private StreamSpec mAttachedStreamSpec;
    private CameraInternal mCamera;
    private UseCaseConfig<?> mCameraConfig;
    private UseCaseConfig<?> mCurrentConfig;
    private CameraEffect mEffect;
    private UseCaseConfig<?> mExtendedConfig;
    private UseCaseConfig<?> mUseCaseConfig;
    private Rect mViewPortCropRect;
    private final Set<StateChangeCallback> mStateChangeCallbacks = new HashSet();
    private final Object mCameraLock = new Object();
    private State mState = State.INACTIVE;
    private Matrix mSensorToBufferTransformMatrix = new Matrix();
    private SessionConfig mAttachedSessionConfig = SessionConfig.defaultEmptySessionConfig();

    /* loaded from: classes.dex */
    public interface EventCallback {
        void onBind(CameraInfo cameraInfo);

        void onUnbind();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public enum State {
        ACTIVE,
        INACTIVE
    }

    /* loaded from: classes.dex */
    public interface StateChangeCallback {
        void onUseCaseActive(UseCase useCase);

        void onUseCaseInactive(UseCase useCase);

        void onUseCaseReset(UseCase useCase);

        void onUseCaseUpdated(UseCase useCase);
    }

    public abstract UseCaseConfig<?> getDefaultConfig(boolean z, UseCaseConfigFactory useCaseConfigFactory);

    public abstract UseCaseConfig.Builder<?, ?, ?> getUseCaseConfigBuilder(Config config);

    /* JADX INFO: Access modifiers changed from: protected */
    public UseCase(UseCaseConfig<?> currentConfig) {
        this.mUseCaseConfig = currentConfig;
        this.mCurrentConfig = currentConfig;
    }

    public UseCaseConfig<?> mergeConfigs(CameraInfoInternal cameraInfo, UseCaseConfig<?> extendedConfig, UseCaseConfig<?> cameraDefaultConfig) {
        MutableOptionsBundle mergedConfig;
        if (cameraDefaultConfig != null) {
            mergedConfig = MutableOptionsBundle.from((Config) cameraDefaultConfig);
            mergedConfig.removeOption(TargetConfig.OPTION_TARGET_NAME);
        } else {
            mergedConfig = MutableOptionsBundle.create();
        }
        if ((this.mUseCaseConfig.containsOption(ImageOutputConfig.OPTION_TARGET_ASPECT_RATIO) || this.mUseCaseConfig.containsOption(ImageOutputConfig.OPTION_TARGET_RESOLUTION)) && mergedConfig.containsOption(ImageOutputConfig.OPTION_RESOLUTION_SELECTOR)) {
            mergedConfig.removeOption(ImageOutputConfig.OPTION_RESOLUTION_SELECTOR);
        }
        if (this.mUseCaseConfig.containsOption(ImageOutputConfig.OPTION_RESOLUTION_SELECTOR) && mergedConfig.containsOption(ImageOutputConfig.OPTION_MAX_RESOLUTION)) {
            ResolutionSelector resolutionSelector = (ResolutionSelector) this.mUseCaseConfig.retrieveOption(ImageOutputConfig.OPTION_RESOLUTION_SELECTOR);
            if (resolutionSelector.getResolutionStrategy() != null) {
                mergedConfig.removeOption(ImageOutputConfig.OPTION_MAX_RESOLUTION);
            }
        }
        for (Config.Option<?> opt : this.mUseCaseConfig.listOptions()) {
            Config.mergeOptionValue(mergedConfig, mergedConfig, this.mUseCaseConfig, opt);
        }
        if (extendedConfig != null) {
            for (Config.Option<?> opt2 : extendedConfig.listOptions()) {
                if (!opt2.getId().equals(TargetConfig.OPTION_TARGET_NAME.getId())) {
                    Config.mergeOptionValue(mergedConfig, mergedConfig, extendedConfig, opt2);
                }
            }
        }
        if (mergedConfig.containsOption(ImageOutputConfig.OPTION_TARGET_RESOLUTION) && mergedConfig.containsOption(ImageOutputConfig.OPTION_TARGET_ASPECT_RATIO)) {
            mergedConfig.removeOption(ImageOutputConfig.OPTION_TARGET_ASPECT_RATIO);
        }
        if (mergedConfig.containsOption(ImageOutputConfig.OPTION_RESOLUTION_SELECTOR) && ((ResolutionSelector) mergedConfig.retrieveOption(ImageOutputConfig.OPTION_RESOLUTION_SELECTOR)).getAllowedResolutionMode() != 0) {
            mergedConfig.insertOption(UseCaseConfig.OPTION_ZSL_DISABLED, true);
        }
        return onMergeConfig(cameraInfo, getUseCaseConfigBuilder(mergedConfig));
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [androidx.camera.core.impl.UseCaseConfig, androidx.camera.core.impl.UseCaseConfig<?>] */
    protected UseCaseConfig<?> onMergeConfig(CameraInfoInternal cameraInfo, UseCaseConfig.Builder<?, ?, ?> builder) {
        return builder.getUseCaseConfig();
    }

    public static int snapToSurfaceRotation(int orientation) {
        Preconditions.checkArgumentInRange(orientation, 0, 359, "orientation");
        if (orientation >= 315 || orientation < 45) {
            return 0;
        }
        if (orientation >= 225) {
            return 1;
        }
        if (orientation >= 135) {
            return 2;
        }
        return 3;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: Type inference failed for: r3v0, types: [androidx.camera.core.impl.UseCaseConfig, androidx.camera.core.impl.UseCaseConfig<?>] */
    public boolean setTargetRotationInternal(int targetRotation) {
        ImageOutputConfig oldConfig = (ImageOutputConfig) getCurrentConfig();
        int oldRotation = oldConfig.getTargetRotation(-1);
        if (oldRotation == -1 || oldRotation != targetRotation) {
            UseCaseConfig.Builder<?, ?, ?> builder = getUseCaseConfigBuilder(this.mUseCaseConfig);
            UseCaseConfigUtil.updateTargetRotationAndRelatedConfigs(builder, targetRotation);
            this.mUseCaseConfig = builder.getUseCaseConfig();
            CameraInternal camera = getCamera();
            if (camera == null) {
                this.mCurrentConfig = this.mUseCaseConfig;
                return true;
            }
            this.mCurrentConfig = mergeConfigs(camera.getCameraInfoInternal(), this.mExtendedConfig, this.mCameraConfig);
            return true;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public int getTargetRotationInternal() {
        return ((ImageOutputConfig) this.mCurrentConfig).getTargetRotation(0);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Range<Integer> getTargetFrameRateInternal() {
        return this.mCurrentConfig.getTargetFrameRate(StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public int getMirrorModeInternal() {
        return ((ImageOutputConfig) this.mCurrentConfig).getMirrorMode(0);
    }

    public boolean isMirroringRequired(CameraInternal camera) {
        int mirrorMode = getMirrorModeInternal();
        switch (mirrorMode) {
            case 0:
                return false;
            case 1:
                return true;
            case 2:
                return camera.isFrontFacing();
            default:
                throw new AssertionError("Unknown mirrorMode: " + mirrorMode);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public int getAppTargetRotation() {
        return ((ImageOutputConfig) this.mCurrentConfig).getAppTargetRotation(-1);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public int getRelativeRotation(CameraInternal cameraInternal) {
        return getRelativeRotation(cameraInternal, false);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public int getRelativeRotation(CameraInternal cameraInternal, boolean requireMirroring) {
        int rotation = cameraInternal.getCameraInfoInternal().getSensorRotationDegrees(getTargetRotationInternal());
        boolean inputStreamMirrored = !cameraInternal.getHasTransform() && requireMirroring;
        if (inputStreamMirrored) {
            return TransformUtils.within360(-rotation);
        }
        return rotation;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void updateSessionConfig(SessionConfig sessionConfig) {
        this.mAttachedSessionConfig = sessionConfig;
        for (DeferrableSurface surface : sessionConfig.getSurfaces()) {
            if (surface.getContainerClass() == null) {
                surface.setContainerClass(getClass());
            }
        }
    }

    private void addStateChangeCallback(StateChangeCallback callback) {
        this.mStateChangeCallbacks.add(callback);
    }

    private void removeStateChangeCallback(StateChangeCallback callback) {
        this.mStateChangeCallbacks.remove(callback);
    }

    public SessionConfig getSessionConfig() {
        return this.mAttachedSessionConfig;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final void notifyActive() {
        this.mState = State.ACTIVE;
        notifyState();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final void notifyInactive() {
        this.mState = State.INACTIVE;
        notifyState();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final void notifyUpdated() {
        for (StateChangeCallback stateChangeCallback : this.mStateChangeCallbacks) {
            stateChangeCallback.onUseCaseUpdated(this);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final void notifyReset() {
        for (StateChangeCallback stateChangeCallback : this.mStateChangeCallbacks) {
            stateChangeCallback.onUseCaseReset(this);
        }
    }

    public final void notifyState() {
        switch (this.mState) {
            case INACTIVE:
                for (StateChangeCallback stateChangeCallback : this.mStateChangeCallbacks) {
                    stateChangeCallback.onUseCaseInactive(this);
                }
                return;
            case ACTIVE:
                for (StateChangeCallback stateChangeCallback2 : this.mStateChangeCallbacks) {
                    stateChangeCallback2.onUseCaseActive(this);
                }
                return;
            default:
                return;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public String getCameraId() {
        return ((CameraInternal) Preconditions.checkNotNull(getCamera(), "No camera attached to use case: " + this)).getCameraInfoInternal().getCameraId();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean isCurrentCamera(String cameraId) {
        if (getCamera() == null) {
            return false;
        }
        return Objects.equals(cameraId, getCameraId());
    }

    public String getName() {
        return (String) Objects.requireNonNull(this.mCurrentConfig.getTargetName("<UnknownUseCase-" + hashCode() + ">"));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public UseCaseConfig<?> getAppConfig() {
        return this.mUseCaseConfig;
    }

    public UseCaseConfig<?> getCurrentConfig() {
        return this.mCurrentConfig;
    }

    public CameraInternal getCamera() {
        CameraInternal cameraInternal;
        synchronized (this.mCameraLock) {
            cameraInternal = this.mCamera;
        }
        return cameraInternal;
    }

    public Size getAttachedSurfaceResolution() {
        if (this.mAttachedStreamSpec != null) {
            return this.mAttachedStreamSpec.getResolution();
        }
        return null;
    }

    public StreamSpec getAttachedStreamSpec() {
        return this.mAttachedStreamSpec;
    }

    public void updateSuggestedStreamSpec(StreamSpec suggestedStreamSpec) {
        this.mAttachedStreamSpec = onSuggestedStreamSpecUpdated(suggestedStreamSpec);
    }

    protected StreamSpec onSuggestedStreamSpecUpdated(StreamSpec suggestedStreamSpec) {
        return suggestedStreamSpec;
    }

    public void updateSuggestedStreamSpecImplementationOptions(Config config) {
        this.mAttachedStreamSpec = onSuggestedStreamSpecImplementationOptionsUpdated(config);
    }

    protected StreamSpec onSuggestedStreamSpecImplementationOptionsUpdated(Config config) {
        if (this.mAttachedStreamSpec == null) {
            throw new UnsupportedOperationException("Attempt to update the implementation options for a use case without attached stream specifications.");
        }
        return this.mAttachedStreamSpec.toBuilder().setImplementationOptions(config).build();
    }

    public void onCameraControlReady() {
    }

    public final void bindToCamera(CameraInternal camera, UseCaseConfig<?> extendedConfig, UseCaseConfig<?> cameraConfig) {
        synchronized (this.mCameraLock) {
            this.mCamera = camera;
            addStateChangeCallback(camera);
        }
        this.mExtendedConfig = extendedConfig;
        this.mCameraConfig = cameraConfig;
        this.mCurrentConfig = mergeConfigs(camera.getCameraInfoInternal(), this.mExtendedConfig, this.mCameraConfig);
        EventCallback eventCallback = this.mCurrentConfig.getUseCaseEventCallback(null);
        if (eventCallback != null) {
            eventCallback.onBind(camera.getCameraInfoInternal());
        }
        onBind();
    }

    public void onBind() {
    }

    public final void unbindFromCamera(CameraInternal camera) {
        onUnbind();
        EventCallback eventCallback = this.mCurrentConfig.getUseCaseEventCallback(null);
        if (eventCallback != null) {
            eventCallback.onUnbind();
        }
        synchronized (this.mCameraLock) {
            Preconditions.checkArgument(camera == this.mCamera);
            removeStateChangeCallback(this.mCamera);
            this.mCamera = null;
        }
        this.mAttachedStreamSpec = null;
        this.mViewPortCropRect = null;
        this.mCurrentConfig = this.mUseCaseConfig;
        this.mExtendedConfig = null;
        this.mCameraConfig = null;
    }

    public void onUnbind() {
    }

    public void onStateAttached() {
    }

    public void onStateDetached() {
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public CameraControlInternal getCameraControl() {
        synchronized (this.mCameraLock) {
            if (this.mCamera == null) {
                return CameraControlInternal.DEFAULT_EMPTY_INSTANCE;
            }
            return this.mCamera.getCameraControlInternal();
        }
    }

    public void setViewPortCropRect(Rect viewPortCropRect) {
        this.mViewPortCropRect = viewPortCropRect;
    }

    public void setEffect(CameraEffect effect) {
        Preconditions.checkArgument(effect == null || isEffectTargetsSupported(effect.getTargets()));
        this.mEffect = effect;
    }

    public CameraEffect getEffect() {
        return this.mEffect;
    }

    public Rect getViewPortCropRect() {
        return this.mViewPortCropRect;
    }

    public void setSensorToBufferTransformMatrix(Matrix sensorToBufferTransformMatrix) {
        this.mSensorToBufferTransformMatrix = new Matrix(sensorToBufferTransformMatrix);
    }

    public Matrix getSensorToBufferTransformMatrix() {
        return this.mSensorToBufferTransformMatrix;
    }

    public int getImageFormat() {
        return this.mCurrentConfig.getInputFormat();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public ResolutionInfo getResolutionInfoInternal() {
        CameraInternal camera = getCamera();
        Size resolution = getAttachedSurfaceResolution();
        if (camera == null || resolution == null) {
            return null;
        }
        Rect cropRect = getViewPortCropRect();
        if (cropRect == null) {
            cropRect = new Rect(0, 0, resolution.getWidth(), resolution.getHeight());
        }
        int rotationDegrees = getRelativeRotation(camera);
        return new ResolutionInfo(resolution, cropRect, rotationDegrees);
    }

    protected Set<Integer> getSupportedEffectTargets() {
        return Collections.emptySet();
    }

    public boolean isEffectTargetsSupported(int effectTargets) {
        for (Integer useCaseTargets : getSupportedEffectTargets()) {
            if (TargetUtils.isSuperset(effectTargets, useCaseTargets.intValue())) {
                return true;
            }
        }
        return false;
    }
}
