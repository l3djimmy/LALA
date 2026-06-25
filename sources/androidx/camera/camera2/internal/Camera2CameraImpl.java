package androidx.camera.camera2.internal;

import android.graphics.SurfaceTexture;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CameraManager;
import android.os.Build;
import android.os.Handler;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Rational;
import android.util.Size;
import android.view.Surface;
import androidx.camera.camera2.internal.Camera2CameraImpl;
import androidx.camera.camera2.internal.MeteringRepeatingSession;
import androidx.camera.camera2.internal.SynchronizedCaptureSessionOpener;
import androidx.camera.camera2.internal.compat.ApiCompat;
import androidx.camera.camera2.internal.compat.CameraAccessExceptionCompat;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.camera2.internal.compat.CameraManagerCompat;
import androidx.camera.camera2.internal.compat.params.DynamicRangesCompat;
import androidx.camera.camera2.internal.compat.quirk.DeviceQuirks;
import androidx.camera.core.CameraState;
import androidx.camera.core.CameraUnavailableException;
import androidx.camera.core.Logger;
import androidx.camera.core.Preview;
import androidx.camera.core.UseCase;
import androidx.camera.core.concurrent.CameraCoordinator;
import androidx.camera.core.impl.CameraConfig;
import androidx.camera.core.impl.CameraConfigs;
import androidx.camera.core.impl.CameraControlInternal;
import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.CameraStateRegistry;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.ImmediateSurface;
import androidx.camera.core.impl.LiveDataObservable;
import androidx.camera.core.impl.Observable;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.SessionProcessor;
import androidx.camera.core.impl.UseCaseAttachState;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicInteger;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class Camera2CameraImpl implements CameraInternal {
    private static final int ERROR_NONE = 0;
    private static final String TAG = "Camera2CameraImpl";
    final CameraAvailability mCameraAvailability;
    private final CameraCharacteristicsCompat mCameraCharacteristicsCompat;
    final CameraConfigureAvailable mCameraConfigureAvailable;
    private final Camera2CameraControlImpl mCameraControlInternal;
    final CameraCoordinator mCameraCoordinator;
    CameraDevice mCameraDevice;
    final Camera2CameraInfoImpl mCameraInfoInternal;
    private final CameraManagerCompat mCameraManager;
    private final CameraStateMachine mCameraStateMachine;
    final CameraStateRegistry mCameraStateRegistry;
    CaptureSessionInterface mCaptureSession;
    private final SynchronizedCaptureSessionOpener.Builder mCaptureSessionOpenerBuilder;
    private final CaptureSessionRepository mCaptureSessionRepository;
    private final DisplayInfoManager mDisplayInfoManager;
    private final DynamicRangesCompat mDynamicRangesCompat;
    private final Executor mExecutor;
    private MeteringRepeatingSession mMeteringRepeatingSession;
    private final ScheduledExecutorService mScheduledExecutorService;
    private SessionProcessor mSessionProcessor;
    private final StateCallback mStateCallback;
    private final UseCaseAttachState mUseCaseAttachState;
    ListenableFuture<Void> mUserReleaseFuture;
    CallbackToFutureAdapter.Completer<Void> mUserReleaseNotifier;
    volatile InternalState mState = InternalState.INITIALIZED;
    private final LiveDataObservable<CameraInternal.State> mObservableState = new LiveDataObservable<>();
    int mCameraDeviceError = 0;
    final AtomicInteger mReleaseRequestCount = new AtomicInteger(0);
    final Map<CaptureSessionInterface, ListenableFuture<Void>> mReleasedCaptureSessions = new LinkedHashMap();
    final Set<CaptureSession> mConfiguringForClose = new HashSet();
    private final Set<String> mNotifyStateAttachedSet = new HashSet();
    private CameraConfig mCameraConfig = CameraConfigs.emptyConfig();
    final Object mLock = new Object();
    boolean mIsActiveResumingMode = false;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public enum InternalState {
        INITIALIZED,
        PENDING_OPEN,
        OPENING,
        OPENED,
        CONFIGURED,
        CLOSING,
        REOPENING,
        RELEASING,
        RELEASED
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Camera2CameraImpl(CameraManagerCompat cameraManager, String cameraId, Camera2CameraInfoImpl cameraInfoImpl, CameraCoordinator cameraCoordinator, CameraStateRegistry cameraStateRegistry, Executor executor, Handler schedulerHandler, DisplayInfoManager displayInfoManager) throws CameraUnavailableException {
        this.mCameraManager = cameraManager;
        this.mCameraCoordinator = cameraCoordinator;
        this.mCameraStateRegistry = cameraStateRegistry;
        this.mScheduledExecutorService = CameraXExecutors.newHandlerExecutor(schedulerHandler);
        this.mExecutor = CameraXExecutors.newSequentialExecutor(executor);
        this.mStateCallback = new StateCallback(this.mExecutor, this.mScheduledExecutorService);
        this.mUseCaseAttachState = new UseCaseAttachState(cameraId);
        this.mObservableState.postValue(CameraInternal.State.CLOSED);
        this.mCameraStateMachine = new CameraStateMachine(cameraStateRegistry);
        this.mCaptureSessionRepository = new CaptureSessionRepository(this.mExecutor);
        this.mDisplayInfoManager = displayInfoManager;
        try {
            this.mCameraCharacteristicsCompat = this.mCameraManager.getCameraCharacteristicsCompat(cameraId);
            this.mCameraControlInternal = new Camera2CameraControlImpl(this.mCameraCharacteristicsCompat, this.mScheduledExecutorService, this.mExecutor, new ControlUpdateListenerInternal(), cameraInfoImpl.getCameraQuirks());
            try {
                this.mCameraInfoInternal = cameraInfoImpl;
                this.mCameraInfoInternal.linkWithCameraControl(this.mCameraControlInternal);
                this.mCameraInfoInternal.setCameraStateSource(this.mCameraStateMachine.getStateLiveData());
                this.mDynamicRangesCompat = DynamicRangesCompat.fromCameraCharacteristics(this.mCameraCharacteristicsCompat);
                this.mCaptureSession = newCaptureSession();
                this.mCaptureSessionOpenerBuilder = new SynchronizedCaptureSessionOpener.Builder(this.mExecutor, this.mScheduledExecutorService, schedulerHandler, this.mCaptureSessionRepository, cameraInfoImpl.getCameraQuirks(), DeviceQuirks.getAll());
                this.mCameraAvailability = new CameraAvailability(cameraId);
                this.mCameraConfigureAvailable = new CameraConfigureAvailable();
                this.mCameraStateRegistry.registerCamera(this, this.mExecutor, this.mCameraConfigureAvailable, this.mCameraAvailability);
                this.mCameraManager.registerAvailabilityCallback(this.mExecutor, this.mCameraAvailability);
            } catch (CameraAccessExceptionCompat e) {
                e = e;
                throw CameraUnavailableExceptionHelper.createFrom(e);
            }
        } catch (CameraAccessExceptionCompat e2) {
            e = e2;
        }
    }

    private CaptureSessionInterface newCaptureSession() {
        synchronized (this.mLock) {
            if (this.mSessionProcessor == null) {
                return new CaptureSession(this.mDynamicRangesCompat);
            }
            return new ProcessingCaptureSession(this.mSessionProcessor, this.mCameraInfoInternal, this.mDynamicRangesCompat, this.mExecutor, this.mScheduledExecutorService);
        }
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public void open() {
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraImpl.this.openInternal();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void openInternal() {
        switch (this.mState) {
            case INITIALIZED:
            case PENDING_OPEN:
                tryForceOpenCameraDevice(false);
                return;
            case CLOSING:
                setState(InternalState.REOPENING);
                if (!isSessionCloseComplete() && this.mCameraDeviceError == 0) {
                    Preconditions.checkState(this.mCameraDevice != null, "Camera Device should be open if session close is not complete");
                    setState(InternalState.OPENED);
                    openCaptureSession();
                    return;
                }
                return;
            default:
                debugLog("open() ignored due to being in state: " + this.mState);
                return;
        }
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public void close() {
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraImpl.this.closeInternal();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void closeInternal() {
        debugLog("Closing camera.");
        switch (this.mState) {
            case PENDING_OPEN:
                Preconditions.checkState(this.mCameraDevice == null);
                setState(InternalState.INITIALIZED);
                return;
            case CLOSING:
            default:
                debugLog("close() ignored due to being in state: " + this.mState);
                return;
            case OPENED:
            case CONFIGURED:
                setState(InternalState.CLOSING);
                closeCamera(false);
                return;
            case OPENING:
            case REOPENING:
                boolean canFinish = this.mStateCallback.cancelScheduledReopen();
                setState(InternalState.CLOSING);
                if (canFinish) {
                    Preconditions.checkState(isSessionCloseComplete());
                    finishClose();
                    return;
                }
                return;
        }
    }

    private void configAndClose(boolean abortInFlightCaptures) {
        final CaptureSession noOpSession = new CaptureSession(this.mDynamicRangesCompat);
        this.mConfiguringForClose.add(noOpSession);
        resetCaptureSession(abortInFlightCaptures);
        final SurfaceTexture surfaceTexture = new SurfaceTexture(0);
        surfaceTexture.setDefaultBufferSize(640, 480);
        final Surface surface = new Surface(surfaceTexture);
        final Runnable closeAndCleanupRunner = new Runnable() { // from class: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraImpl.lambda$configAndClose$0(surface, surfaceTexture);
            }
        };
        SessionConfig.Builder builder = new SessionConfig.Builder();
        final DeferrableSurface deferrableSurface = new ImmediateSurface(surface);
        builder.addNonRepeatingSurface(deferrableSurface);
        builder.setTemplateType(1);
        debugLog("Start configAndClose.");
        ListenableFuture<Void> openNoOpCaptureSession = noOpSession.open(builder.build(), (CameraDevice) Preconditions.checkNotNull(this.mCameraDevice), this.mCaptureSessionOpenerBuilder.build());
        openNoOpCaptureSession.addListener(new Runnable() { // from class: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraImpl.this.m14x2a0cb35d(noOpSession, deferrableSurface, closeAndCleanupRunner);
            }
        }, this.mExecutor);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ void lambda$configAndClose$0(Surface surface, SurfaceTexture surfaceTexture) {
        surface.release();
        surfaceTexture.release();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: releaseNoOpSession */
    public void m14x2a0cb35d(CaptureSession noOpSession, DeferrableSurface deferrableSurface, Runnable closeAndCleanupRunner) {
        this.mConfiguringForClose.remove(noOpSession);
        ListenableFuture<Void> releaseFuture = releaseSession(noOpSession, false);
        deferrableSurface.close();
        Futures.successfulAsList(Arrays.asList(releaseFuture, deferrableSurface.getTerminationFuture())).addListener(closeAndCleanupRunner, CameraXExecutors.directExecutor());
    }

    boolean isSessionCloseComplete() {
        return this.mReleasedCaptureSessions.isEmpty() && this.mConfiguringForClose.isEmpty();
    }

    void finishClose() {
        Preconditions.checkState(this.mState == InternalState.RELEASING || this.mState == InternalState.CLOSING);
        Preconditions.checkState(this.mReleasedCaptureSessions.isEmpty());
        this.mCameraDevice = null;
        if (this.mState == InternalState.CLOSING) {
            setState(InternalState.INITIALIZED);
            return;
        }
        this.mCameraManager.unregisterAvailabilityCallback(this.mCameraAvailability);
        setState(InternalState.RELEASED);
        if (this.mUserReleaseNotifier != null) {
            this.mUserReleaseNotifier.set(null);
            this.mUserReleaseNotifier = null;
        }
    }

    void closeCamera(boolean abortInFlightCaptures) {
        Preconditions.checkState(this.mState == InternalState.CLOSING || this.mState == InternalState.RELEASING || (this.mState == InternalState.REOPENING && this.mCameraDeviceError != 0), "closeCamera should only be called in a CLOSING, RELEASING or REOPENING (with error) state. Current state: " + this.mState + " (error: " + getErrorMessage(this.mCameraDeviceError) + ")");
        if (Build.VERSION.SDK_INT < 29 && isLegacyDevice() && this.mCameraDeviceError == 0) {
            configAndClose(abortInFlightCaptures);
        } else {
            resetCaptureSession(abortInFlightCaptures);
        }
        this.mCaptureSession.cancelIssuedCaptureRequests();
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public ListenableFuture<Void> release() {
        return CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda11
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return Camera2CameraImpl.this.m25xc715f071(completer);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$release$3$androidx-camera-camera2-internal-Camera2CameraImpl  reason: not valid java name */
    public /* synthetic */ Object m25xc715f071(final CallbackToFutureAdapter.Completer completer) throws Exception {
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda14
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraImpl.this.m24x993d5612(completer);
            }
        });
        return "Release[request=" + this.mReleaseRequestCount.getAndIncrement() + "]";
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$release$2$androidx-camera-camera2-internal-Camera2CameraImpl  reason: not valid java name */
    public /* synthetic */ void m24x993d5612(CallbackToFutureAdapter.Completer completer) {
        Futures.propagate(releaseInternal(), completer);
    }

    private ListenableFuture<Void> releaseInternal() {
        ListenableFuture<Void> future = getOrCreateUserReleaseFuture();
        switch (this.mState) {
            case INITIALIZED:
            case PENDING_OPEN:
                Preconditions.checkState(this.mCameraDevice == null);
                setState(InternalState.RELEASING);
                Preconditions.checkState(isSessionCloseComplete());
                finishClose();
                break;
            case CLOSING:
            case OPENING:
            case REOPENING:
            case RELEASING:
                boolean canFinish = this.mStateCallback.cancelScheduledReopen();
                setState(InternalState.RELEASING);
                if (canFinish) {
                    Preconditions.checkState(isSessionCloseComplete());
                    finishClose();
                    break;
                }
                break;
            case OPENED:
            case CONFIGURED:
                setState(InternalState.RELEASING);
                closeCamera(false);
                break;
            default:
                debugLog("release() ignored due to being in state: " + this.mState);
                break;
        }
        return future;
    }

    private ListenableFuture<Void> getOrCreateUserReleaseFuture() {
        if (this.mUserReleaseFuture == null) {
            if (this.mState != InternalState.RELEASED) {
                this.mUserReleaseFuture = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda17
                    @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                    public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                        return Camera2CameraImpl.this.m16x42886673(completer);
                    }
                });
            } else {
                this.mUserReleaseFuture = Futures.immediateFuture(null);
            }
        }
        return this.mUserReleaseFuture;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$getOrCreateUserReleaseFuture$4$androidx-camera-camera2-internal-Camera2CameraImpl  reason: not valid java name */
    public /* synthetic */ Object m16x42886673(CallbackToFutureAdapter.Completer completer) throws Exception {
        Preconditions.checkState(this.mUserReleaseNotifier == null, "Camera can only be released once, so release completer should be null on creation.");
        this.mUserReleaseNotifier = completer;
        return "Release[camera=" + this + "]";
    }

    ListenableFuture<Void> releaseSession(final CaptureSessionInterface captureSession, boolean abortInFlightCaptures) {
        captureSession.close();
        ListenableFuture<Void> releaseFuture = captureSession.release(abortInFlightCaptures);
        debugLog("Releasing session in state " + this.mState.name());
        this.mReleasedCaptureSessions.put(captureSession, releaseFuture);
        Futures.addCallback(releaseFuture, new FutureCallback<Void>() { // from class: androidx.camera.camera2.internal.Camera2CameraImpl.1
            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onSuccess(Void result) {
                Camera2CameraImpl.this.mReleasedCaptureSessions.remove(captureSession);
                switch (AnonymousClass3.$SwitchMap$androidx$camera$camera2$internal$Camera2CameraImpl$InternalState[Camera2CameraImpl.this.mState.ordinal()]) {
                    case 3:
                    case 8:
                        break;
                    default:
                        return;
                    case 7:
                        if (Camera2CameraImpl.this.mCameraDeviceError == 0) {
                            return;
                        }
                        break;
                }
                if (Camera2CameraImpl.this.isSessionCloseComplete() && Camera2CameraImpl.this.mCameraDevice != null) {
                    ApiCompat.Api21Impl.close(Camera2CameraImpl.this.mCameraDevice);
                    Camera2CameraImpl.this.mCameraDevice = null;
                }
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable t) {
            }
        }, CameraXExecutors.directExecutor());
        return releaseFuture;
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public Observable<CameraInternal.State> getCameraState() {
        return this.mObservableState;
    }

    @Override // androidx.camera.core.UseCase.StateChangeCallback
    public void onUseCaseActive(UseCase useCase) {
        Preconditions.checkNotNull(useCase);
        final String useCaseId = getUseCaseId(useCase);
        final SessionConfig sessionConfig = useCase.getSessionConfig();
        final UseCaseConfig<?> useCaseConfig = useCase.getCurrentConfig();
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda9
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraImpl.this.m21xeff284f8(useCaseId, sessionConfig, useCaseConfig);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$onUseCaseActive$5$androidx-camera-camera2-internal-Camera2CameraImpl  reason: not valid java name */
    public /* synthetic */ void m21xeff284f8(String useCaseId, SessionConfig sessionConfig, UseCaseConfig useCaseConfig) {
        debugLog("Use case " + useCaseId + " ACTIVE");
        this.mUseCaseAttachState.setUseCaseActive(useCaseId, sessionConfig, useCaseConfig);
        this.mUseCaseAttachState.updateUseCase(useCaseId, sessionConfig, useCaseConfig);
        updateCaptureSessionConfig();
    }

    @Override // androidx.camera.core.UseCase.StateChangeCallback
    public void onUseCaseInactive(UseCase useCase) {
        Preconditions.checkNotNull(useCase);
        final String useCaseId = getUseCaseId(useCase);
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda8
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraImpl.this.m22x8da1a1d2(useCaseId);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$onUseCaseInactive$6$androidx-camera-camera2-internal-Camera2CameraImpl  reason: not valid java name */
    public /* synthetic */ void m22x8da1a1d2(String useCaseId) {
        debugLog("Use case " + useCaseId + " INACTIVE");
        this.mUseCaseAttachState.setUseCaseInactive(useCaseId);
        updateCaptureSessionConfig();
    }

    @Override // androidx.camera.core.UseCase.StateChangeCallback
    public void onUseCaseUpdated(UseCase useCase) {
        Preconditions.checkNotNull(useCase);
        final String useCaseId = getUseCaseId(useCase);
        final SessionConfig sessionConfig = useCase.getSessionConfig();
        final UseCaseConfig<?> useCaseConfig = useCase.getCurrentConfig();
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda7
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraImpl.this.m23xe8973177(useCaseId, sessionConfig, useCaseConfig);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$onUseCaseUpdated$7$androidx-camera-camera2-internal-Camera2CameraImpl  reason: not valid java name */
    public /* synthetic */ void m23xe8973177(String useCaseId, SessionConfig sessionConfig, UseCaseConfig useCaseConfig) {
        debugLog("Use case " + useCaseId + " UPDATED");
        this.mUseCaseAttachState.updateUseCase(useCaseId, sessionConfig, useCaseConfig);
        updateCaptureSessionConfig();
    }

    @Override // androidx.camera.core.UseCase.StateChangeCallback
    public void onUseCaseReset(UseCase useCase) {
        Preconditions.checkNotNull(useCase);
        SessionConfig sessionConfig = useCase.getSessionConfig();
        UseCaseConfig<?> useCaseConfig = useCase.getCurrentConfig();
        resetUseCase(getUseCaseId(useCase), sessionConfig, useCaseConfig);
    }

    private void resetUseCase(final String useCaseId, final SessionConfig sessionConfig, final UseCaseConfig<?> useCaseConfig) {
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda5
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraImpl.this.m26xeadc7491(useCaseId, sessionConfig, useCaseConfig);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$resetUseCase$8$androidx-camera-camera2-internal-Camera2CameraImpl  reason: not valid java name */
    public /* synthetic */ void m26xeadc7491(String useCaseId, SessionConfig sessionConfig, UseCaseConfig useCaseConfig) {
        debugLog("Use case " + useCaseId + " RESET");
        this.mUseCaseAttachState.updateUseCase(useCaseId, sessionConfig, useCaseConfig);
        addOrRemoveMeteringRepeatingUseCase();
        resetCaptureSession(false);
        updateCaptureSessionConfig();
        if (this.mState == InternalState.OPENED) {
            openCaptureSession();
        }
    }

    boolean isUseCaseAttached(UseCase useCase) {
        try {
            final String useCaseId = getUseCaseId(useCase);
            return ((Boolean) CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda15
                @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                    return Camera2CameraImpl.this.m19x9bdb441b(useCaseId, completer);
                }
            }).get()).booleanValue();
        } catch (InterruptedException | ExecutionException e) {
            throw new RuntimeException("Unable to check if use case is attached.", e);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$isUseCaseAttached$10$androidx-camera-camera2-internal-Camera2CameraImpl  reason: not valid java name */
    public /* synthetic */ Object m19x9bdb441b(final String useCaseId, final CallbackToFutureAdapter.Completer completer) throws Exception {
        try {
            this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda16
                @Override // java.lang.Runnable
                public final void run() {
                    Camera2CameraImpl.this.m20x93ceab21(completer, useCaseId);
                }
            });
            return "isUseCaseAttached";
        } catch (RejectedExecutionException e) {
            completer.setException(new RuntimeException("Unable to check if use case is attached. Camera executor shut down."));
            return "isUseCaseAttached";
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$isUseCaseAttached$9$androidx-camera-camera2-internal-Camera2CameraImpl  reason: not valid java name */
    public /* synthetic */ void m20x93ceab21(CallbackToFutureAdapter.Completer completer, String useCaseId) {
        completer.set(Boolean.valueOf(this.mUseCaseAttachState.isUseCaseAttached(useCaseId)));
    }

    boolean isMeteringRepeatingAttached() {
        try {
            return ((Boolean) CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda6
                @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                    return Camera2CameraImpl.this.m18xded872b0(completer);
                }
            }).get()).booleanValue();
        } catch (InterruptedException | ExecutionException e) {
            throw new RuntimeException("Unable to check if MeteringRepeating is attached.", e);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$isMeteringRepeatingAttached$12$androidx-camera-camera2-internal-Camera2CameraImpl  reason: not valid java name */
    public /* synthetic */ Object m18xded872b0(final CallbackToFutureAdapter.Completer completer) throws Exception {
        try {
            this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda10
                @Override // java.lang.Runnable
                public final void run() {
                    Camera2CameraImpl.this.m17xb0ffd851(completer);
                }
            });
            return "isMeteringRepeatingAttached";
        } catch (RejectedExecutionException e) {
            completer.setException(new RuntimeException("Unable to check if MeteringRepeating is attached. Camera executor shut down."));
            return "isMeteringRepeatingAttached";
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$isMeteringRepeatingAttached$11$androidx-camera-camera2-internal-Camera2CameraImpl  reason: not valid java name */
    public /* synthetic */ void m17xb0ffd851(CallbackToFutureAdapter.Completer completer) {
        if (this.mMeteringRepeatingSession == null) {
            completer.set(false);
            return;
        }
        String id = getMeteringRepeatingId(this.mMeteringRepeatingSession);
        completer.set(Boolean.valueOf(this.mUseCaseAttachState.isUseCaseAttached(id)));
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public void attachUseCases(Collection<UseCase> inputUseCases) {
        Collection<UseCase> useCases = new ArrayList<>(inputUseCases);
        if (useCases.isEmpty()) {
            return;
        }
        this.mCameraControlInternal.incrementUseCount();
        notifyStateAttachedAndCameraControlReady(new ArrayList(useCases));
        final List<UseCaseInfo> useCaseInfos = new ArrayList<>(toUseCaseInfos(useCases));
        try {
            this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda4
                @Override // java.lang.Runnable
                public final void run() {
                    Camera2CameraImpl.this.m13xc14743a2(useCaseInfos);
                }
            });
        } catch (RejectedExecutionException e) {
            debugLog("Unable to attach use cases.", e);
            this.mCameraControlInternal.decrementUseCount();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$attachUseCases$13$androidx-camera-camera2-internal-Camera2CameraImpl  reason: not valid java name */
    public /* synthetic */ void m13xc14743a2(List useCaseInfos) {
        try {
            tryAttachUseCases(useCaseInfos);
        } finally {
            this.mCameraControlInternal.decrementUseCount();
        }
    }

    private void tryAttachUseCases(Collection<UseCaseInfo> useCaseInfos) {
        Size resolution;
        boolean attachUseCaseFromEmpty = this.mUseCaseAttachState.getAttachedSessionConfigs().isEmpty();
        List<String> useCaseIdsToAttach = new ArrayList<>();
        Rational previewAspectRatio = null;
        for (UseCaseInfo useCaseInfo : useCaseInfos) {
            if (!this.mUseCaseAttachState.isUseCaseAttached(useCaseInfo.getUseCaseId())) {
                this.mUseCaseAttachState.setUseCaseAttached(useCaseInfo.getUseCaseId(), useCaseInfo.getSessionConfig(), useCaseInfo.getUseCaseConfig());
                useCaseIdsToAttach.add(useCaseInfo.getUseCaseId());
                if (useCaseInfo.getUseCaseType() == Preview.class && (resolution = useCaseInfo.getSurfaceResolution()) != null) {
                    previewAspectRatio = new Rational(resolution.getWidth(), resolution.getHeight());
                }
            }
        }
        if (useCaseIdsToAttach.isEmpty()) {
            return;
        }
        debugLog("Use cases [" + TextUtils.join(", ", useCaseIdsToAttach) + "] now ATTACHED");
        if (attachUseCaseFromEmpty) {
            this.mCameraControlInternal.setActive(true);
            this.mCameraControlInternal.incrementUseCount();
        }
        addOrRemoveMeteringRepeatingUseCase();
        updateZslDisabledByUseCaseConfigStatus();
        updateCaptureSessionConfig();
        resetCaptureSession(false);
        if (this.mState == InternalState.OPENED) {
            openCaptureSession();
        } else {
            openInternal();
        }
        if (previewAspectRatio != null) {
            this.mCameraControlInternal.setPreviewAspectRatio(previewAspectRatio);
        }
    }

    private Collection<UseCaseInfo> toUseCaseInfos(Collection<UseCase> useCases) {
        List<UseCaseInfo> useCaseInfos = new ArrayList<>();
        for (UseCase useCase : useCases) {
            useCaseInfos.add(UseCaseInfo.from(useCase));
        }
        return useCaseInfos;
    }

    @Override // androidx.camera.core.impl.CameraInternal, androidx.camera.core.Camera
    public void setExtendedConfig(CameraConfig cameraConfig) {
        if (cameraConfig == null) {
            cameraConfig = CameraConfigs.emptyConfig();
        }
        SessionProcessor sessionProcessor = cameraConfig.getSessionProcessor(null);
        this.mCameraConfig = cameraConfig;
        synchronized (this.mLock) {
            this.mSessionProcessor = sessionProcessor;
        }
    }

    @Override // androidx.camera.core.impl.CameraInternal, androidx.camera.core.Camera
    public CameraConfig getExtendedConfig() {
        return this.mCameraConfig;
    }

    private void notifyStateAttachedAndCameraControlReady(List<UseCase> useCases) {
        for (UseCase useCase : useCases) {
            String useCaseId = getUseCaseId(useCase);
            if (!this.mNotifyStateAttachedSet.contains(useCaseId)) {
                this.mNotifyStateAttachedSet.add(useCaseId);
                useCase.onStateAttached();
                useCase.onCameraControlReady();
            }
        }
    }

    private void notifyStateDetachedToUseCases(List<UseCase> useCases) {
        for (UseCase useCase : useCases) {
            String useCaseId = getUseCaseId(useCase);
            if (this.mNotifyStateAttachedSet.contains(useCaseId)) {
                useCase.onStateDetached();
                this.mNotifyStateAttachedSet.remove(useCaseId);
            }
        }
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public void detachUseCases(Collection<UseCase> inputUseCases) {
        Collection<UseCase> useCases = new ArrayList<>(inputUseCases);
        if (useCases.isEmpty()) {
            return;
        }
        final List<UseCaseInfo> useCaseInfos = new ArrayList<>(toUseCaseInfos(useCases));
        notifyStateDetachedToUseCases(new ArrayList(useCases));
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda18
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraImpl.this.m15xe41392cf(useCaseInfos);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: tryDetachUseCases */
    public void m15xe41392cf(Collection<UseCaseInfo> useCaseInfos) {
        List<String> useCaseIdsToDetach = new ArrayList<>();
        boolean clearPreviewAspectRatio = false;
        for (UseCaseInfo useCaseInfo : useCaseInfos) {
            if (this.mUseCaseAttachState.isUseCaseAttached(useCaseInfo.getUseCaseId())) {
                this.mUseCaseAttachState.removeUseCase(useCaseInfo.getUseCaseId());
                useCaseIdsToDetach.add(useCaseInfo.getUseCaseId());
                if (useCaseInfo.getUseCaseType() == Preview.class) {
                    clearPreviewAspectRatio = true;
                }
            }
        }
        if (useCaseIdsToDetach.isEmpty()) {
            return;
        }
        debugLog("Use cases [" + TextUtils.join(", ", useCaseIdsToDetach) + "] now DETACHED for camera");
        if (clearPreviewAspectRatio) {
            this.mCameraControlInternal.setPreviewAspectRatio(null);
        }
        addOrRemoveMeteringRepeatingUseCase();
        if (this.mUseCaseAttachState.getAttachedUseCaseConfigs().isEmpty()) {
            this.mCameraControlInternal.setZslDisabledByUserCaseConfig(false);
        } else {
            updateZslDisabledByUseCaseConfigStatus();
        }
        boolean allUseCasesDetached = this.mUseCaseAttachState.getAttachedSessionConfigs().isEmpty();
        if (allUseCasesDetached) {
            this.mCameraControlInternal.decrementUseCount();
            resetCaptureSession(false);
            this.mCameraControlInternal.setActive(false);
            this.mCaptureSession = newCaptureSession();
            closeInternal();
            return;
        }
        updateCaptureSessionConfig();
        resetCaptureSession(false);
        if (this.mState == InternalState.OPENED) {
            openCaptureSession();
        }
    }

    private void updateZslDisabledByUseCaseConfigStatus() {
        boolean isZslDisabledByUseCaseConfig = false;
        for (UseCaseConfig<?> useCaseConfig : this.mUseCaseAttachState.getAttachedUseCaseConfigs()) {
            isZslDisabledByUseCaseConfig |= useCaseConfig.isZslDisabled(false);
        }
        this.mCameraControlInternal.setZslDisabledByUserCaseConfig(isZslDisabledByUseCaseConfig);
    }

    private void addOrRemoveMeteringRepeatingUseCase() {
        SessionConfig.ValidatingBuilder validatingBuilder = this.mUseCaseAttachState.getAttachedBuilder();
        SessionConfig sessionConfig = validatingBuilder.build();
        CaptureConfig captureConfig = sessionConfig.getRepeatingCaptureConfig();
        int sizeRepeatingSurfaces = captureConfig.getSurfaces().size();
        int sizeSessionSurfaces = sessionConfig.getSurfaces().size();
        if (!sessionConfig.getSurfaces().isEmpty()) {
            if (captureConfig.getSurfaces().isEmpty()) {
                if (this.mMeteringRepeatingSession == null) {
                    this.mMeteringRepeatingSession = new MeteringRepeatingSession(this.mCameraInfoInternal.getCameraCharacteristicsCompat(), this.mDisplayInfoManager, new MeteringRepeatingSession.SurfaceResetCallback() { // from class: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda13
                        @Override // androidx.camera.camera2.internal.MeteringRepeatingSession.SurfaceResetCallback
                        public final void onSurfaceReset() {
                            Camera2CameraImpl.this.m12x32573096();
                        }
                    });
                }
                addMeteringRepeating();
            } else if (sizeSessionSurfaces == 1 && sizeRepeatingSurfaces == 1) {
                removeMeteringRepeating();
            } else if (sizeRepeatingSurfaces >= 2) {
                removeMeteringRepeating();
            } else {
                Logger.d(TAG, "mMeteringRepeating is ATTACHED, SessionConfig Surfaces: " + sizeSessionSurfaces + ", CaptureConfig Surfaces: " + sizeRepeatingSurfaces);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$addOrRemoveMeteringRepeatingUseCase$15$androidx-camera-camera2-internal-Camera2CameraImpl  reason: not valid java name */
    public /* synthetic */ void m12x32573096() {
        if (!isMeteringRepeatingAttached()) {
            return;
        }
        SessionConfig sessionConfigMeteringRepeating = this.mMeteringRepeatingSession.getSessionConfig();
        UseCaseConfig<?> useCaseConfig = this.mMeteringRepeatingSession.getUseCaseConfig();
        resetUseCase(getMeteringRepeatingId(this.mMeteringRepeatingSession), sessionConfigMeteringRepeating, useCaseConfig);
    }

    private void removeMeteringRepeating() {
        if (this.mMeteringRepeatingSession != null) {
            this.mUseCaseAttachState.setUseCaseDetached(this.mMeteringRepeatingSession.getName() + this.mMeteringRepeatingSession.hashCode());
            this.mUseCaseAttachState.setUseCaseInactive(this.mMeteringRepeatingSession.getName() + this.mMeteringRepeatingSession.hashCode());
            this.mMeteringRepeatingSession.clear();
            this.mMeteringRepeatingSession = null;
        }
    }

    private void addMeteringRepeating() {
        if (this.mMeteringRepeatingSession != null) {
            String id = getMeteringRepeatingId(this.mMeteringRepeatingSession);
            this.mUseCaseAttachState.setUseCaseAttached(id, this.mMeteringRepeatingSession.getSessionConfig(), this.mMeteringRepeatingSession.getUseCaseConfig());
            this.mUseCaseAttachState.setUseCaseActive(id, this.mMeteringRepeatingSession.getSessionConfig(), this.mMeteringRepeatingSession.getUseCaseConfig());
        }
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public CameraInfoInternal getCameraInfoInternal() {
        return this.mCameraInfoInternal;
    }

    public CameraAvailability getCameraAvailability() {
        return this.mCameraAvailability;
    }

    void tryForceOpenCameraDevice(boolean fromScheduledCameraReopen) {
        debugLog("Attempting to force open the camera.");
        boolean shouldTryOpenCamera = this.mCameraStateRegistry.tryOpenCamera(this);
        if (!shouldTryOpenCamera) {
            debugLog("No cameras available. Waiting for available camera before opening camera.");
            setState(InternalState.PENDING_OPEN);
            return;
        }
        openCameraDevice(fromScheduledCameraReopen);
    }

    void tryOpenCameraDevice(boolean fromScheduledCameraReopen) {
        debugLog("Attempting to open the camera.");
        boolean shouldTryOpenCamera = this.mCameraAvailability.isCameraAvailable() && this.mCameraStateRegistry.tryOpenCamera(this);
        if (!shouldTryOpenCamera) {
            debugLog("No cameras available. Waiting for available camera before opening camera.");
            setState(InternalState.PENDING_OPEN);
            return;
        }
        openCameraDevice(fromScheduledCameraReopen);
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public void setActiveResumingMode(final boolean enabled) {
        this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda19
            @Override // java.lang.Runnable
            public final void run() {
                Camera2CameraImpl.this.m27x27a43cd9(enabled);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$setActiveResumingMode$16$androidx-camera-camera2-internal-Camera2CameraImpl  reason: not valid java name */
    public /* synthetic */ void m27x27a43cd9(boolean enabled) {
        this.mIsActiveResumingMode = enabled;
        if (enabled && this.mState == InternalState.PENDING_OPEN) {
            tryForceOpenCameraDevice(false);
        }
    }

    private void openCameraDevice(boolean fromScheduledCameraReopen) {
        if (!fromScheduledCameraReopen) {
            this.mStateCallback.resetReopenMonitor();
        }
        this.mStateCallback.cancelScheduledReopen();
        debugLog("Opening camera.");
        setState(InternalState.OPENING);
        try {
            this.mCameraManager.openCamera(this.mCameraInfoInternal.getCameraId(), this.mExecutor, createDeviceStateCallback());
        } catch (CameraAccessExceptionCompat e) {
            debugLog("Unable to open camera due to " + e.getMessage());
            switch (e.getReason()) {
                case CameraAccessExceptionCompat.CAMERA_UNAVAILABLE_DO_NOT_DISTURB /* 10001 */:
                    setState(InternalState.INITIALIZED, CameraState.StateError.create(7, e));
                    return;
                default:
                    return;
            }
        } catch (SecurityException e2) {
            debugLog("Unable to open camera due to " + e2.getMessage());
            setState(InternalState.REOPENING);
            this.mStateCallback.scheduleCameraReopen();
        }
    }

    void updateCaptureSessionConfig() {
        SessionConfig.ValidatingBuilder validatingBuilder = this.mUseCaseAttachState.getActiveAndAttachedBuilder();
        if (validatingBuilder.isValid()) {
            SessionConfig useCaseSessionConfig = validatingBuilder.build();
            this.mCameraControlInternal.setTemplate(useCaseSessionConfig.getTemplateType());
            validatingBuilder.add(this.mCameraControlInternal.getSessionConfig());
            SessionConfig sessionConfig = validatingBuilder.build();
            this.mCaptureSession.setSessionConfig(sessionConfig);
            return;
        }
        this.mCameraControlInternal.resetTemplate();
        this.mCaptureSession.setSessionConfig(this.mCameraControlInternal.getSessionConfig());
    }

    void openCaptureSession() {
        Preconditions.checkState(this.mState == InternalState.OPENED);
        SessionConfig.ValidatingBuilder validatingBuilder = this.mUseCaseAttachState.getAttachedBuilder();
        if (!validatingBuilder.isValid()) {
            debugLog("Unable to create capture session due to conflicting configurations");
        } else if (!this.mCameraStateRegistry.tryOpenCaptureSession(this.mCameraDevice.getId(), this.mCameraCoordinator.getPairedConcurrentCameraId(this.mCameraDevice.getId()))) {
            debugLog("Unable to create capture session in camera operating mode = " + this.mCameraCoordinator.getCameraOperatingMode());
        } else {
            Map<DeferrableSurface, Long> streamUseCaseMap = new HashMap<>();
            StreamUseCaseUtil.populateSurfaceToStreamUseCaseMapping(this.mUseCaseAttachState.getAttachedSessionConfigs(), this.mUseCaseAttachState.getAttachedUseCaseConfigs(), streamUseCaseMap);
            this.mCaptureSession.setStreamUseCaseMap(streamUseCaseMap);
            CaptureSessionInterface captureSession = this.mCaptureSession;
            ListenableFuture<Void> openCaptureSession = captureSession.open(validatingBuilder.build(), (CameraDevice) Preconditions.checkNotNull(this.mCameraDevice), this.mCaptureSessionOpenerBuilder.build());
            Futures.addCallback(openCaptureSession, new FutureCallback<Void>() { // from class: androidx.camera.camera2.internal.Camera2CameraImpl.2
                @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                public void onSuccess(Void result) {
                    if (Camera2CameraImpl.this.mCameraCoordinator.getCameraOperatingMode() == 2 && Camera2CameraImpl.this.mState == InternalState.OPENED) {
                        Camera2CameraImpl.this.setState(InternalState.CONFIGURED);
                    }
                }

                @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                public void onFailure(Throwable t) {
                    if (t instanceof DeferrableSurface.SurfaceClosedException) {
                        SessionConfig sessionConfig = Camera2CameraImpl.this.findSessionConfigForSurface(((DeferrableSurface.SurfaceClosedException) t).getDeferrableSurface());
                        if (sessionConfig != null) {
                            Camera2CameraImpl.this.postSurfaceClosedError(sessionConfig);
                            return;
                        }
                        return;
                    }
                    boolean z = t instanceof CancellationException;
                    Camera2CameraImpl camera2CameraImpl = Camera2CameraImpl.this;
                    if (z) {
                        camera2CameraImpl.debugLog("Unable to configure camera cancelled");
                        return;
                    }
                    if (camera2CameraImpl.mState == InternalState.OPENED) {
                        Camera2CameraImpl.this.setState(InternalState.OPENED, CameraState.StateError.create(4, t));
                    }
                    if (t instanceof CameraAccessException) {
                        Camera2CameraImpl.this.debugLog("Unable to configure camera due to " + t.getMessage());
                    } else if (t instanceof TimeoutException) {
                        Logger.e(Camera2CameraImpl.TAG, "Unable to configure camera " + Camera2CameraImpl.this.mCameraInfoInternal.getCameraId() + ", timeout!");
                    }
                }
            }, this.mExecutor);
        }
    }

    private boolean isLegacyDevice() {
        Camera2CameraInfoImpl camera2CameraInfo = (Camera2CameraInfoImpl) getCameraInfoInternal();
        return camera2CameraInfo.getSupportedHardwareLevel() == 2;
    }

    SessionConfig findSessionConfigForSurface(DeferrableSurface surface) {
        for (SessionConfig sessionConfig : this.mUseCaseAttachState.getAttachedSessionConfigs()) {
            if (sessionConfig.getSurfaces().contains(surface)) {
                return sessionConfig;
            }
        }
        return null;
    }

    void postSurfaceClosedError(final SessionConfig sessionConfig) {
        Executor executor = CameraXExecutors.mainThreadExecutor();
        List<SessionConfig.ErrorListener> errorListeners = sessionConfig.getErrorListeners();
        if (!errorListeners.isEmpty()) {
            final SessionConfig.ErrorListener errorListener = errorListeners.get(0);
            debugLog("Posting surface closed", new Throwable());
            executor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.Camera2CameraImpl$$ExternalSyntheticLambda12
                @Override // java.lang.Runnable
                public final void run() {
                    SessionConfig.ErrorListener.this.onError(sessionConfig, SessionConfig.SessionError.SESSION_ERROR_SURFACE_NEEDS_RESET);
                }
            });
        }
    }

    void resetCaptureSession(boolean abortInFlightCaptures) {
        Preconditions.checkState(this.mCaptureSession != null);
        debugLog("Resetting Capture Session");
        CaptureSessionInterface oldCaptureSession = this.mCaptureSession;
        SessionConfig previousSessionConfig = oldCaptureSession.getSessionConfig();
        List<CaptureConfig> unissuedCaptureConfigs = oldCaptureSession.getCaptureConfigs();
        this.mCaptureSession = newCaptureSession();
        this.mCaptureSession.setSessionConfig(previousSessionConfig);
        this.mCaptureSession.issueCaptureRequests(unissuedCaptureConfigs);
        releaseSession(oldCaptureSession, abortInFlightCaptures);
    }

    private CameraDevice.StateCallback createDeviceStateCallback() {
        SessionConfig config = this.mUseCaseAttachState.getAttachedBuilder().build();
        List<CameraDevice.StateCallback> configuredStateCallbacks = config.getDeviceStateCallbacks();
        List<CameraDevice.StateCallback> allStateCallbacks = new ArrayList<>(configuredStateCallbacks);
        allStateCallbacks.add(this.mCaptureSessionRepository.getCameraStateCallback());
        allStateCallbacks.add(this.mStateCallback);
        return CameraDeviceStateCallbacks.createComboCallback(allStateCallbacks);
    }

    private boolean checkAndAttachRepeatingSurface(CaptureConfig.Builder captureConfigBuilder) {
        if (!captureConfigBuilder.getSurfaces().isEmpty()) {
            Logger.w(TAG, "The capture config builder already has surface inside.");
            return false;
        }
        for (SessionConfig sessionConfig : this.mUseCaseAttachState.getActiveAndAttachedSessionConfigs()) {
            List<DeferrableSurface> surfaces = sessionConfig.getRepeatingCaptureConfig().getSurfaces();
            if (!surfaces.isEmpty()) {
                for (DeferrableSurface surface : surfaces) {
                    captureConfigBuilder.addSurface(surface);
                }
            }
        }
        if (captureConfigBuilder.getSurfaces().isEmpty()) {
            Logger.w(TAG, "Unable to find a repeating surface to attach to CaptureConfig");
            return false;
        }
        return true;
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public CameraControlInternal getCameraControlInternal() {
        return this.mCameraControlInternal;
    }

    void submitCaptureRequests(List<CaptureConfig> captureConfigs) {
        List<CaptureConfig> captureConfigsWithSurface = new ArrayList<>();
        for (CaptureConfig captureConfig : captureConfigs) {
            CaptureConfig.Builder builder = CaptureConfig.Builder.from(captureConfig);
            if (captureConfig.getTemplateType() == 5 && captureConfig.getCameraCaptureResult() != null) {
                builder.setCameraCaptureResult(captureConfig.getCameraCaptureResult());
            }
            if (!captureConfig.getSurfaces().isEmpty() || !captureConfig.isUseRepeatingSurface() || checkAndAttachRepeatingSurface(builder)) {
                captureConfigsWithSurface.add(builder.build());
            }
        }
        debugLog("Issue capture request");
        this.mCaptureSession.issueCaptureRequests(captureConfigsWithSurface);
    }

    public String toString() {
        return String.format(Locale.US, "Camera@%x[id=%s]", Integer.valueOf(hashCode()), this.mCameraInfoInternal.getCameraId());
    }

    static String getUseCaseId(UseCase useCase) {
        return useCase.getName() + useCase.hashCode();
    }

    static String getMeteringRepeatingId(MeteringRepeatingSession meteringRepeating) {
        return meteringRepeating.getName() + meteringRepeating.hashCode();
    }

    void debugLog(String msg) {
        debugLog(msg, null);
    }

    private void debugLog(String msg, Throwable throwable) {
        String msgString = String.format("{%s} %s", toString(), msg);
        Logger.d(TAG, msgString, throwable);
    }

    void setState(InternalState state) {
        setState(state, null);
    }

    void setState(InternalState state, CameraState.StateError stateError) {
        setState(state, stateError, true);
    }

    void setState(InternalState state, CameraState.StateError stateError, boolean notifyImmediately) {
        CameraInternal.State publicState;
        debugLog("Transitioning camera internal state: " + this.mState + " --> " + state);
        this.mState = state;
        switch (state) {
            case INITIALIZED:
                publicState = CameraInternal.State.CLOSED;
                break;
            case PENDING_OPEN:
                publicState = CameraInternal.State.PENDING_OPEN;
                break;
            case CLOSING:
                publicState = CameraInternal.State.CLOSING;
                break;
            case OPENED:
                publicState = CameraInternal.State.OPEN;
                break;
            case CONFIGURED:
                publicState = CameraInternal.State.CONFIGURED;
                break;
            case OPENING:
            case REOPENING:
                publicState = CameraInternal.State.OPENING;
                break;
            case RELEASING:
                publicState = CameraInternal.State.RELEASING;
                break;
            case RELEASED:
                publicState = CameraInternal.State.RELEASED;
                break;
            default:
                throw new IllegalStateException("Unknown state: " + state);
        }
        this.mCameraStateRegistry.markCameraState(this, publicState, notifyImmediately);
        this.mObservableState.postValue(publicState);
        this.mCameraStateMachine.updateState(publicState, stateError);
    }

    static String getErrorMessage(int errorCode) {
        switch (errorCode) {
            case 0:
                return "ERROR_NONE";
            case 1:
                return "ERROR_CAMERA_IN_USE";
            case 2:
                return "ERROR_MAX_CAMERAS_IN_USE";
            case 3:
                return "ERROR_CAMERA_DISABLED";
            case 4:
                return "ERROR_CAMERA_DEVICE";
            case 5:
                return "ERROR_CAMERA_SERVICE";
            default:
                return "UNKNOWN ERROR";
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static abstract class UseCaseInfo {
        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract SessionConfig getSessionConfig();

        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract Size getSurfaceResolution();

        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract UseCaseConfig<?> getUseCaseConfig();

        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract String getUseCaseId();

        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract Class<?> getUseCaseType();

        static UseCaseInfo create(String useCaseId, Class<?> useCaseType, SessionConfig sessionConfig, UseCaseConfig<?> useCaseConfig, Size surfaceResolution) {
            return new AutoValue_Camera2CameraImpl_UseCaseInfo(useCaseId, useCaseType, sessionConfig, useCaseConfig, surfaceResolution);
        }

        static UseCaseInfo from(UseCase useCase) {
            return create(Camera2CameraImpl.getUseCaseId(useCase), useCase.getClass(), useCase.getSessionConfig(), useCase.getCurrentConfig(), useCase.getAttachedSurfaceResolution());
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public final class StateCallback extends CameraDevice.StateCallback {
        private final CameraReopenMonitor mCameraReopenMonitor = new CameraReopenMonitor();
        private final Executor mExecutor;
        ScheduledFuture<?> mScheduledReopenHandle;
        private ScheduledReopen mScheduledReopenRunnable;
        private final ScheduledExecutorService mScheduler;

        StateCallback(Executor executor, ScheduledExecutorService scheduler) {
            this.mExecutor = executor;
            this.mScheduler = scheduler;
        }

        @Override // android.hardware.camera2.CameraDevice.StateCallback
        public void onOpened(CameraDevice cameraDevice) {
            Camera2CameraImpl.this.debugLog("CameraDevice.onOpened()");
            Camera2CameraImpl.this.mCameraDevice = cameraDevice;
            Camera2CameraImpl.this.mCameraDeviceError = 0;
            resetReopenMonitor();
            switch (Camera2CameraImpl.this.mState) {
                case CLOSING:
                case RELEASING:
                    Preconditions.checkState(Camera2CameraImpl.this.isSessionCloseComplete());
                    Camera2CameraImpl.this.mCameraDevice.close();
                    Camera2CameraImpl.this.mCameraDevice = null;
                    return;
                case OPENED:
                case CONFIGURED:
                default:
                    throw new IllegalStateException("onOpened() should not be possible from state: " + Camera2CameraImpl.this.mState);
                case OPENING:
                case REOPENING:
                    Camera2CameraImpl.this.setState(InternalState.OPENED);
                    if (Camera2CameraImpl.this.mCameraStateRegistry.tryOpenCaptureSession(cameraDevice.getId(), Camera2CameraImpl.this.mCameraCoordinator.getPairedConcurrentCameraId(Camera2CameraImpl.this.mCameraDevice.getId()))) {
                        Camera2CameraImpl.this.openCaptureSession();
                        return;
                    }
                    return;
            }
        }

        @Override // android.hardware.camera2.CameraDevice.StateCallback
        public void onClosed(CameraDevice cameraDevice) {
            Camera2CameraImpl.this.debugLog("CameraDevice.onClosed()");
            Preconditions.checkState(Camera2CameraImpl.this.mCameraDevice == null, "Unexpected onClose callback on camera device: " + cameraDevice);
            switch (Camera2CameraImpl.this.mState) {
                case CLOSING:
                case RELEASING:
                    Preconditions.checkState(Camera2CameraImpl.this.isSessionCloseComplete());
                    Camera2CameraImpl.this.finishClose();
                    return;
                case REOPENING:
                    int i = Camera2CameraImpl.this.mCameraDeviceError;
                    Camera2CameraImpl camera2CameraImpl = Camera2CameraImpl.this;
                    if (i != 0) {
                        camera2CameraImpl.debugLog("Camera closed due to error: " + Camera2CameraImpl.getErrorMessage(Camera2CameraImpl.this.mCameraDeviceError));
                        scheduleCameraReopen();
                        return;
                    }
                    camera2CameraImpl.tryOpenCameraDevice(false);
                    return;
                default:
                    throw new IllegalStateException("Camera closed while in state: " + Camera2CameraImpl.this.mState);
            }
        }

        @Override // android.hardware.camera2.CameraDevice.StateCallback
        public void onDisconnected(CameraDevice cameraDevice) {
            Camera2CameraImpl.this.debugLog("CameraDevice.onDisconnected()");
            onError(cameraDevice, 1);
        }

        @Override // android.hardware.camera2.CameraDevice.StateCallback
        public void onError(CameraDevice cameraDevice, int error) {
            Camera2CameraImpl.this.mCameraDevice = cameraDevice;
            Camera2CameraImpl.this.mCameraDeviceError = error;
            switch (Camera2CameraImpl.this.mState) {
                case CLOSING:
                case RELEASING:
                    Logger.e(Camera2CameraImpl.TAG, String.format("CameraDevice.onError(): %s failed with %s while in %s state. Will finish closing camera.", cameraDevice.getId(), Camera2CameraImpl.getErrorMessage(error), Camera2CameraImpl.this.mState.name()));
                    Camera2CameraImpl.this.closeCamera(false);
                    return;
                case OPENED:
                case CONFIGURED:
                case OPENING:
                case REOPENING:
                    Logger.d(Camera2CameraImpl.TAG, String.format("CameraDevice.onError(): %s failed with %s while in %s state. Will attempt recovering from error.", cameraDevice.getId(), Camera2CameraImpl.getErrorMessage(error), Camera2CameraImpl.this.mState.name()));
                    handleErrorOnOpen(cameraDevice, error);
                    return;
                default:
                    throw new IllegalStateException("onError() should not be possible from state: " + Camera2CameraImpl.this.mState);
            }
        }

        private void handleErrorOnOpen(CameraDevice cameraDevice, int error) {
            int publicErrorCode;
            Preconditions.checkState(Camera2CameraImpl.this.mState == InternalState.OPENING || Camera2CameraImpl.this.mState == InternalState.OPENED || Camera2CameraImpl.this.mState == InternalState.CONFIGURED || Camera2CameraImpl.this.mState == InternalState.REOPENING, "Attempt to handle open error from non open state: " + Camera2CameraImpl.this.mState);
            switch (error) {
                case 1:
                case 2:
                case 4:
                    Logger.d(Camera2CameraImpl.TAG, String.format("Attempt to reopen camera[%s] after error[%s]", cameraDevice.getId(), Camera2CameraImpl.getErrorMessage(error)));
                    reopenCameraAfterError(error);
                    return;
                case 3:
                default:
                    Logger.e(Camera2CameraImpl.TAG, "Error observed on open (or opening) camera device " + cameraDevice.getId() + ": " + Camera2CameraImpl.getErrorMessage(error) + " closing camera.");
                    if (error == 3) {
                        publicErrorCode = 5;
                    } else {
                        publicErrorCode = 6;
                    }
                    Camera2CameraImpl.this.setState(InternalState.CLOSING, CameraState.StateError.create(publicErrorCode));
                    Camera2CameraImpl.this.closeCamera(false);
                    return;
            }
        }

        private void reopenCameraAfterError(int error) {
            int publicErrorCode;
            Preconditions.checkState(Camera2CameraImpl.this.mCameraDeviceError != 0, "Can only reopen camera device after error if the camera device is actually in an error state.");
            switch (error) {
                case 1:
                    publicErrorCode = 2;
                    break;
                case 2:
                    publicErrorCode = 1;
                    break;
                default:
                    publicErrorCode = 3;
                    break;
            }
            Camera2CameraImpl.this.setState(InternalState.REOPENING, CameraState.StateError.create(publicErrorCode));
            Camera2CameraImpl.this.closeCamera(false);
        }

        void scheduleCameraReopen() {
            Preconditions.checkState(this.mScheduledReopenRunnable == null);
            Preconditions.checkState(this.mScheduledReopenHandle == null);
            if (this.mCameraReopenMonitor.canScheduleCameraReopen()) {
                this.mScheduledReopenRunnable = new ScheduledReopen(this.mExecutor);
                Camera2CameraImpl.this.debugLog("Attempting camera re-open in " + this.mCameraReopenMonitor.getReopenDelayMs() + "ms: " + this.mScheduledReopenRunnable + " activeResuming = " + Camera2CameraImpl.this.mIsActiveResumingMode);
                this.mScheduledReopenHandle = this.mScheduler.schedule(this.mScheduledReopenRunnable, this.mCameraReopenMonitor.getReopenDelayMs(), TimeUnit.MILLISECONDS);
                return;
            }
            Logger.e(Camera2CameraImpl.TAG, "Camera reopening attempted for " + this.mCameraReopenMonitor.getReopenLimitMs() + "ms without success.");
            Camera2CameraImpl.this.setState(InternalState.PENDING_OPEN, null, false);
        }

        boolean cancelScheduledReopen() {
            if (this.mScheduledReopenHandle == null) {
                return false;
            }
            Camera2CameraImpl.this.debugLog("Cancelling scheduled re-open: " + this.mScheduledReopenRunnable);
            this.mScheduledReopenRunnable.cancel();
            this.mScheduledReopenRunnable = null;
            this.mScheduledReopenHandle.cancel(false);
            this.mScheduledReopenHandle = null;
            return true;
        }

        void resetReopenMonitor() {
            this.mCameraReopenMonitor.reset();
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* loaded from: classes.dex */
        public class ScheduledReopen implements Runnable {
            private boolean mCancelled = false;
            private Executor mExecutor;

            ScheduledReopen(Executor executor) {
                this.mExecutor = executor;
            }

            void cancel() {
                this.mCancelled = true;
            }

            @Override // java.lang.Runnable
            public void run() {
                this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.Camera2CameraImpl$StateCallback$ScheduledReopen$$ExternalSyntheticLambda0
                    @Override // java.lang.Runnable
                    public final void run() {
                        Camera2CameraImpl.StateCallback.ScheduledReopen.this.m28x10b58748();
                    }
                });
            }

            /* JADX INFO: Access modifiers changed from: package-private */
            /* renamed from: lambda$run$0$androidx-camera-camera2-internal-Camera2CameraImpl$StateCallback$ScheduledReopen  reason: not valid java name */
            public /* synthetic */ void m28x10b58748() {
                if (!this.mCancelled) {
                    Preconditions.checkState(Camera2CameraImpl.this.mState == InternalState.REOPENING);
                    boolean shouldActiveResume = StateCallback.this.shouldActiveResume();
                    StateCallback stateCallback = StateCallback.this;
                    if (shouldActiveResume) {
                        Camera2CameraImpl.this.tryForceOpenCameraDevice(true);
                    } else {
                        Camera2CameraImpl.this.tryOpenCameraDevice(true);
                    }
                }
            }
        }

        boolean shouldActiveResume() {
            return Camera2CameraImpl.this.mIsActiveResumingMode && (Camera2CameraImpl.this.mCameraDeviceError == 1 || Camera2CameraImpl.this.mCameraDeviceError == 2);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* loaded from: classes.dex */
        public class CameraReopenMonitor {
            static final int ACTIVE_REOPEN_DELAY_BASE_MS = 1000;
            static final int ACTIVE_REOPEN_LIMIT_MS = 1800000;
            static final int INVALID_TIME = -1;
            static final int REOPEN_DELAY_MS = 700;
            static final int REOPEN_LIMIT_MS = 10000;
            private long mFirstReopenTime = -1;

            CameraReopenMonitor() {
            }

            int getReopenDelayMs() {
                if (!StateCallback.this.shouldActiveResume()) {
                    return 700;
                }
                long elapsedTime = getElapsedTime();
                if (elapsedTime <= 120000) {
                    return 1000;
                }
                if (elapsedTime <= 300000) {
                    return 2000;
                }
                return 4000;
            }

            int getReopenLimitMs() {
                if (!StateCallback.this.shouldActiveResume()) {
                    return REOPEN_LIMIT_MS;
                }
                return ACTIVE_REOPEN_LIMIT_MS;
            }

            long getElapsedTime() {
                long now = SystemClock.uptimeMillis();
                if (this.mFirstReopenTime == -1) {
                    this.mFirstReopenTime = now;
                }
                return now - this.mFirstReopenTime;
            }

            boolean canScheduleCameraReopen() {
                boolean hasReachedLimit = getElapsedTime() >= ((long) getReopenLimitMs());
                if (hasReachedLimit) {
                    reset();
                    return false;
                }
                return true;
            }

            void reset() {
                this.mFirstReopenTime = -1L;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public final class CameraAvailability extends CameraManager.AvailabilityCallback implements CameraStateRegistry.OnOpenAvailableListener {
        private boolean mCameraAvailable = true;
        private final String mCameraId;

        CameraAvailability(String cameraId) {
            this.mCameraId = cameraId;
        }

        @Override // android.hardware.camera2.CameraManager.AvailabilityCallback
        public void onCameraAvailable(String cameraId) {
            if (!this.mCameraId.equals(cameraId)) {
                return;
            }
            this.mCameraAvailable = true;
            if (Camera2CameraImpl.this.mState == InternalState.PENDING_OPEN) {
                Camera2CameraImpl.this.tryOpenCameraDevice(false);
            }
        }

        @Override // android.hardware.camera2.CameraManager.AvailabilityCallback
        public void onCameraUnavailable(String cameraId) {
            if (!this.mCameraId.equals(cameraId)) {
                return;
            }
            this.mCameraAvailable = false;
        }

        @Override // androidx.camera.core.impl.CameraStateRegistry.OnOpenAvailableListener
        public void onOpenAvailable() {
            if (Camera2CameraImpl.this.mState == InternalState.PENDING_OPEN) {
                Camera2CameraImpl.this.tryOpenCameraDevice(false);
            }
        }

        boolean isCameraAvailable() {
            return this.mCameraAvailable;
        }
    }

    /* loaded from: classes.dex */
    final class CameraConfigureAvailable implements CameraStateRegistry.OnConfigureAvailableListener {
        CameraConfigureAvailable() {
        }

        @Override // androidx.camera.core.impl.CameraStateRegistry.OnConfigureAvailableListener
        public void onConfigureAvailable() {
            if (Camera2CameraImpl.this.mState == InternalState.OPENED) {
                Camera2CameraImpl.this.openCaptureSession();
            }
        }
    }

    /* loaded from: classes.dex */
    final class ControlUpdateListenerInternal implements CameraControlInternal.ControlUpdateCallback {
        ControlUpdateListenerInternal() {
        }

        @Override // androidx.camera.core.impl.CameraControlInternal.ControlUpdateCallback
        public void onCameraControlUpdateSessionConfig() {
            Camera2CameraImpl.this.updateCaptureSessionConfig();
        }

        @Override // androidx.camera.core.impl.CameraControlInternal.ControlUpdateCallback
        public void onCameraControlCaptureRequests(List<CaptureConfig> captureConfigs) {
            Camera2CameraImpl.this.submitCaptureRequests((List) Preconditions.checkNotNull(captureConfigs));
        }
    }
}
