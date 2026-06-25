package androidx.camera.lifecycle;

import android.content.Context;
import androidx.arch.core.util.Function;
import androidx.camera.core.Camera;
import androidx.camera.core.CameraEffect;
import androidx.camera.core.CameraFilter;
import androidx.camera.core.CameraInfo;
import androidx.camera.core.CameraInfoUnavailableException;
import androidx.camera.core.CameraSelector;
import androidx.camera.core.CameraX;
import androidx.camera.core.CameraXConfig;
import androidx.camera.core.ConcurrentCamera;
import androidx.camera.core.UseCase;
import androidx.camera.core.UseCaseGroup;
import androidx.camera.core.ViewPort;
import androidx.camera.core.impl.CameraConfig;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.ExtendedCameraConfigProviderStore;
import androidx.camera.core.impl.utils.ContextUtil;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.AsyncFunction;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.FutureChain;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.core.internal.CameraUseCaseAdapter;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Preconditions;
import androidx.lifecycle.LifecycleOwner;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;
/* loaded from: classes.dex */
public final class ProcessCameraProvider implements LifecycleCameraProvider {
    private static final ProcessCameraProvider sAppInstance = new ProcessCameraProvider();
    private CameraX mCameraX;
    private ListenableFuture<CameraX> mCameraXInitializeFuture;
    private Context mContext;
    private final Object mLock = new Object();
    private CameraXConfig.Provider mCameraXConfigProvider = null;
    private ListenableFuture<Void> mCameraXShutdownFuture = Futures.immediateFuture(null);
    private final LifecycleCameraRepository mLifecycleCameraRepository = new LifecycleCameraRepository();

    public static ListenableFuture<ProcessCameraProvider> getInstance(final Context context) {
        Preconditions.checkNotNull(context);
        return Futures.transform(sAppInstance.getOrCreateCameraXInstance(context), new Function() { // from class: androidx.camera.lifecycle.ProcessCameraProvider$$ExternalSyntheticLambda3
            @Override // androidx.arch.core.util.Function
            public final Object apply(Object obj) {
                return ProcessCameraProvider.lambda$getInstance$0(context, (CameraX) obj);
            }
        }, CameraXExecutors.directExecutor());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ ProcessCameraProvider lambda$getInstance$0(Context context, CameraX cameraX) {
        sAppInstance.setCameraX(cameraX);
        sAppInstance.setContext(ContextUtil.getApplicationContext(context));
        return sAppInstance;
    }

    private ListenableFuture<CameraX> getOrCreateCameraXInstance(Context context) {
        synchronized (this.mLock) {
            if (this.mCameraXInitializeFuture != null) {
                return this.mCameraXInitializeFuture;
            }
            final CameraX cameraX = new CameraX(context, this.mCameraXConfigProvider);
            this.mCameraXInitializeFuture = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.lifecycle.ProcessCameraProvider$$ExternalSyntheticLambda0
                @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                    return ProcessCameraProvider.this.m182x6ee14178(cameraX, completer);
                }
            });
            return this.mCameraXInitializeFuture;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$getOrCreateCameraXInstance$2$androidx-camera-lifecycle-ProcessCameraProvider  reason: not valid java name */
    public /* synthetic */ Object m182x6ee14178(final CameraX cameraX, final CallbackToFutureAdapter.Completer completer) throws Exception {
        synchronized (this.mLock) {
            ListenableFuture<Void> future = FutureChain.from(this.mCameraXShutdownFuture).transformAsync(new AsyncFunction() { // from class: androidx.camera.lifecycle.ProcessCameraProvider$$ExternalSyntheticLambda4
                @Override // androidx.camera.core.impl.utils.futures.AsyncFunction
                public final ListenableFuture apply(Object obj) {
                    ListenableFuture initializeFuture;
                    Void r2 = (Void) obj;
                    initializeFuture = CameraX.this.getInitializeFuture();
                    return initializeFuture;
                }
            }, CameraXExecutors.directExecutor());
            Futures.addCallback(future, new FutureCallback<Void>() { // from class: androidx.camera.lifecycle.ProcessCameraProvider.1
                @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                public void onSuccess(Void result) {
                    completer.set(cameraX);
                }

                @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                public void onFailure(Throwable t) {
                    completer.setException(t);
                }
            }, CameraXExecutors.directExecutor());
        }
        return "ProcessCameraProvider-initializeCameraX";
    }

    public static void configureInstance(CameraXConfig cameraXConfig) {
        sAppInstance.configureInstanceInternal(cameraXConfig);
    }

    private void configureInstanceInternal(final CameraXConfig cameraXConfig) {
        synchronized (this.mLock) {
            Preconditions.checkNotNull(cameraXConfig);
            Preconditions.checkState(this.mCameraXConfigProvider == null, "CameraX has already been configured. To use a different configuration, shutdown() must be called.");
            this.mCameraXConfigProvider = new CameraXConfig.Provider() { // from class: androidx.camera.lifecycle.ProcessCameraProvider$$ExternalSyntheticLambda1
                @Override // androidx.camera.core.CameraXConfig.Provider
                public final CameraXConfig getCameraXConfig() {
                    return ProcessCameraProvider.lambda$configureInstanceInternal$3(CameraXConfig.this);
                }
            };
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ CameraXConfig lambda$configureInstanceInternal$3(CameraXConfig cameraXConfig) {
        return cameraXConfig;
    }

    public ListenableFuture<Void> shutdown() {
        Threads.runOnMainSync(new Runnable() { // from class: androidx.camera.lifecycle.ProcessCameraProvider$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() {
                ProcessCameraProvider.this.m183x331eedbd();
            }
        });
        if (this.mCameraX != null) {
            this.mCameraX.getCameraFactory().getCameraCoordinator().shutdown();
        }
        ListenableFuture<Void> shutdownFuture = this.mCameraX != null ? this.mCameraX.shutdown() : Futures.immediateFuture(null);
        synchronized (this.mLock) {
            this.mCameraXConfigProvider = null;
            this.mCameraXInitializeFuture = null;
            this.mCameraXShutdownFuture = shutdownFuture;
        }
        this.mCameraX = null;
        this.mContext = null;
        return shutdownFuture;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$shutdown$4$androidx-camera-lifecycle-ProcessCameraProvider  reason: not valid java name */
    public /* synthetic */ void m183x331eedbd() {
        unbindAll();
        this.mLifecycleCameraRepository.clear();
    }

    private void setCameraX(CameraX cameraX) {
        this.mCameraX = cameraX;
    }

    private void setContext(Context context) {
        this.mContext = context;
    }

    public Camera bindToLifecycle(LifecycleOwner lifecycleOwner, CameraSelector cameraSelector, UseCase... useCases) {
        if (getCameraOperatingMode() != 2) {
            setCameraOperatingMode(1);
            Camera camera = bindToLifecycle(lifecycleOwner, cameraSelector, null, Collections.emptyList(), useCases);
            return camera;
        }
        throw new UnsupportedOperationException("bindToLifecycle for single camera is not supported in concurrent camera mode, call unbindAll() first");
    }

    public Camera bindToLifecycle(LifecycleOwner lifecycleOwner, CameraSelector cameraSelector, UseCaseGroup useCaseGroup) {
        if (getCameraOperatingMode() != 2) {
            setCameraOperatingMode(1);
            Camera camera = bindToLifecycle(lifecycleOwner, cameraSelector, useCaseGroup.getViewPort(), useCaseGroup.getEffects(), (UseCase[]) useCaseGroup.getUseCases().toArray(new UseCase[0]));
            return camera;
        }
        throw new UnsupportedOperationException("bindToLifecycle for single camera is not supported in concurrent camera mode, call unbindAll() first");
    }

    public ConcurrentCamera bindToLifecycle(List<ConcurrentCamera.SingleCameraConfig> singleCameraConfigs) {
        if (!this.mContext.getPackageManager().hasSystemFeature("android.hardware.camera.concurrent")) {
            throw new UnsupportedOperationException("Concurrent camera is not supported on the device");
        }
        if (getCameraOperatingMode() == 1) {
            throw new UnsupportedOperationException("Camera is already running, call unbindAll() before binding more cameras");
        }
        if (singleCameraConfigs.size() < 2) {
            throw new IllegalArgumentException("Concurrent camera needs two camera configs");
        }
        if (singleCameraConfigs.size() > 2) {
            throw new IllegalArgumentException("Concurrent camera is only supporting two  cameras at maximum.");
        }
        List<CameraInfo> cameraInfosToBind = new ArrayList<>();
        List<CameraInfo> availableCameraInfos = getAvailableCameraInfos();
        CameraInfo firstCameraInfo = getCameraInfoFromCameraSelector(singleCameraConfigs.get(0).getCameraSelector(), availableCameraInfos);
        CameraInfo secondCameraInfo = getCameraInfoFromCameraSelector(singleCameraConfigs.get(1).getCameraSelector(), availableCameraInfos);
        if (firstCameraInfo == null || secondCameraInfo == null) {
            throw new IllegalArgumentException("Invalid camera selectors in camera configs");
        }
        cameraInfosToBind.add(firstCameraInfo);
        cameraInfosToBind.add(secondCameraInfo);
        if (!getActiveConcurrentCameraInfos().isEmpty() && !cameraInfosToBind.equals(getActiveConcurrentCameraInfos())) {
            throw new UnsupportedOperationException("Cameras are already running, call unbindAll() before binding more cameras");
        }
        setCameraOperatingMode(2);
        List<Camera> cameras = new ArrayList<>();
        for (ConcurrentCamera.SingleCameraConfig config : singleCameraConfigs) {
            Camera camera = bindToLifecycle(config.getLifecycleOwner(), config.getCameraSelector(), config.getUseCaseGroup().getViewPort(), config.getUseCaseGroup().getEffects(), (UseCase[]) config.getUseCaseGroup().getUseCases().toArray(new UseCase[0]));
            cameras.add(camera);
        }
        setActiveConcurrentCameraInfos(cameraInfosToBind);
        return new ConcurrentCamera(cameras);
    }

    Camera bindToLifecycle(LifecycleOwner lifecycleOwner, CameraSelector cameraSelector, ViewPort viewPort, List<CameraEffect> effects, UseCase... useCases) {
        LifecycleCamera lifecycleCameraToBind;
        CameraConfig extendedCameraConfig;
        Threads.checkMainThread();
        CameraSelector.Builder selectorBuilder = CameraSelector.Builder.fromSelector(cameraSelector);
        for (UseCase useCase : useCases) {
            CameraSelector selector = useCase.getCurrentConfig().getCameraSelector(null);
            if (selector != null) {
                Iterator<CameraFilter> it = selector.getCameraFilterSet().iterator();
                while (it.hasNext()) {
                    CameraFilter filter = it.next();
                    selectorBuilder.addCameraFilter(filter);
                }
            }
        }
        CameraSelector modifiedSelector = selectorBuilder.build();
        LinkedHashSet<CameraInternal> cameraInternals = modifiedSelector.filter(this.mCameraX.getCameraRepository().getCameras());
        if (cameraInternals.isEmpty()) {
            throw new IllegalArgumentException("Provided camera selector unable to resolve a camera for the given use case");
        }
        CameraUseCaseAdapter.CameraId cameraId = CameraUseCaseAdapter.generateCameraId(cameraInternals);
        LifecycleCamera lifecycleCameraToBind2 = this.mLifecycleCameraRepository.getLifecycleCamera(lifecycleOwner, cameraId);
        Collection<LifecycleCamera> lifecycleCameras = this.mLifecycleCameraRepository.getLifecycleCameras();
        for (UseCase useCase2 : useCases) {
            for (LifecycleCamera lifecycleCamera : lifecycleCameras) {
                if (lifecycleCamera.isBound(useCase2) && lifecycleCamera != lifecycleCameraToBind2) {
                    throw new IllegalStateException(String.format("Use case %s already bound to a different lifecycle.", useCase2));
                }
            }
        }
        if (lifecycleCameraToBind2 != null) {
            lifecycleCameraToBind = lifecycleCameraToBind2;
        } else {
            lifecycleCameraToBind = this.mLifecycleCameraRepository.createLifecycleCamera(lifecycleOwner, new CameraUseCaseAdapter(cameraInternals, this.mCameraX.getCameraFactory().getCameraCoordinator(), this.mCameraX.getCameraDeviceSurfaceManager(), this.mCameraX.getDefaultConfigFactory()));
        }
        CameraConfig cameraConfig = null;
        Iterator<CameraFilter> it2 = cameraSelector.getCameraFilterSet().iterator();
        while (it2.hasNext()) {
            CameraFilter cameraFilter = it2.next();
            if (cameraFilter.getIdentifier() != CameraFilter.DEFAULT_ID && (extendedCameraConfig = ExtendedCameraConfigProviderStore.getConfigProvider(cameraFilter.getIdentifier()).getConfig(lifecycleCameraToBind.getCameraInfo(), this.mContext)) != null) {
                if (cameraConfig != null) {
                    throw new IllegalArgumentException("Cannot apply multiple extended camera configs at the same time.");
                }
                cameraConfig = extendedCameraConfig;
            }
        }
        lifecycleCameraToBind.setExtendedConfig(cameraConfig);
        if (useCases.length == 0) {
            return lifecycleCameraToBind;
        }
        this.mLifecycleCameraRepository.bindToLifecycleCamera(lifecycleCameraToBind, viewPort, effects, Arrays.asList(useCases), this.mCameraX.getCameraFactory().getCameraCoordinator());
        return lifecycleCameraToBind;
    }

    @Override // androidx.camera.lifecycle.LifecycleCameraProvider
    public boolean isBound(UseCase useCase) {
        for (LifecycleCamera lifecycleCamera : this.mLifecycleCameraRepository.getLifecycleCameras()) {
            if (lifecycleCamera.isBound(useCase)) {
                return true;
            }
        }
        return false;
    }

    @Override // androidx.camera.lifecycle.LifecycleCameraProvider
    public void unbind(UseCase... useCases) {
        Threads.checkMainThread();
        if (getCameraOperatingMode() == 2) {
            throw new UnsupportedOperationException("unbind usecase is not supported in concurrent camera mode, call unbindAll() first");
        }
        this.mLifecycleCameraRepository.unbind(Arrays.asList(useCases));
    }

    @Override // androidx.camera.lifecycle.LifecycleCameraProvider
    public void unbindAll() {
        Threads.checkMainThread();
        setCameraOperatingMode(0);
        this.mLifecycleCameraRepository.unbindAll();
    }

    @Override // androidx.camera.core.CameraProvider
    public boolean hasCamera(CameraSelector cameraSelector) throws CameraInfoUnavailableException {
        try {
            cameraSelector.select(this.mCameraX.getCameraRepository().getCameras());
            return true;
        } catch (IllegalArgumentException e) {
            return false;
        }
    }

    @Override // androidx.camera.core.CameraProvider
    public List<CameraInfo> getAvailableCameraInfos() {
        List<CameraInfo> availableCameraInfos = new ArrayList<>();
        Set<CameraInternal> cameras = this.mCameraX.getCameraRepository().getCameras();
        for (CameraInternal camera : cameras) {
            availableCameraInfos.add(camera.getCameraInfo());
        }
        return availableCameraInfos;
    }

    public List<List<CameraInfo>> getAvailableConcurrentCameraInfos() {
        Objects.requireNonNull(this.mCameraX);
        Objects.requireNonNull(this.mCameraX.getCameraFactory().getCameraCoordinator());
        List<List<CameraSelector>> concurrentCameraSelectorLists = this.mCameraX.getCameraFactory().getCameraCoordinator().getConcurrentCameraSelectors();
        List<CameraInfo> availableCameraInfos = getAvailableCameraInfos();
        List<List<CameraInfo>> availableConcurrentCameraInfos = new ArrayList<>();
        for (List<CameraSelector> cameraSelectors : concurrentCameraSelectorLists) {
            List<CameraInfo> cameraInfos = new ArrayList<>();
            for (CameraSelector cameraSelector : cameraSelectors) {
                CameraInfo cameraInfo = getCameraInfoFromCameraSelector(cameraSelector, availableCameraInfos);
                if (cameraInfo != null) {
                    cameraInfos.add(cameraInfo);
                }
            }
            availableConcurrentCameraInfos.add(cameraInfos);
        }
        return availableConcurrentCameraInfos;
    }

    public boolean isConcurrentCameraModeOn() {
        return getCameraOperatingMode() == 2;
    }

    private int getCameraOperatingMode() {
        if (this.mCameraX == null) {
            return 0;
        }
        return this.mCameraX.getCameraFactory().getCameraCoordinator().getCameraOperatingMode();
    }

    private void setCameraOperatingMode(int cameraOperatingMode) {
        if (this.mCameraX == null) {
            return;
        }
        this.mCameraX.getCameraFactory().getCameraCoordinator().setCameraOperatingMode(cameraOperatingMode);
    }

    private List<CameraInfo> getActiveConcurrentCameraInfos() {
        if (this.mCameraX == null) {
            return new ArrayList();
        }
        return this.mCameraX.getCameraFactory().getCameraCoordinator().getActiveConcurrentCameraInfos();
    }

    private void setActiveConcurrentCameraInfos(List<CameraInfo> cameraInfos) {
        if (this.mCameraX == null) {
            return;
        }
        this.mCameraX.getCameraFactory().getCameraCoordinator().setActiveConcurrentCameraInfos(cameraInfos);
    }

    private CameraInfo getCameraInfoFromCameraSelector(CameraSelector cameraSelector, List<CameraInfo> availableCameraInfos) {
        List<CameraInfo> cameraInfos = cameraSelector.filter(availableCameraInfos);
        if (cameraInfos.isEmpty()) {
            return null;
        }
        return cameraInfos.get(0);
    }

    private ProcessCameraProvider() {
    }
}
