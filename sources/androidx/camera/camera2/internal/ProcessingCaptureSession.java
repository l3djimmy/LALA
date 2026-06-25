package androidx.camera.camera2.internal;

import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureResult;
import android.util.Size;
import androidx.arch.core.util.Function;
import androidx.camera.camera2.impl.Camera2ImplConfig;
import androidx.camera.camera2.internal.ProcessingCaptureSession;
import androidx.camera.camera2.internal.compat.params.DynamicRangesCompat;
import androidx.camera.camera2.interop.CaptureRequestOptions;
import androidx.camera.core.ImageAnalysis;
import androidx.camera.core.ImageCapture;
import androidx.camera.core.Logger;
import androidx.camera.core.Preview;
import androidx.camera.core.impl.CameraCaptureCallback;
import androidx.camera.core.impl.CameraCaptureFailure;
import androidx.camera.core.impl.CameraCaptureResult;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.DeferrableSurfaces;
import androidx.camera.core.impl.OutputSurface;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.SessionProcessor;
import androidx.camera.core.impl.SessionProcessorSurface;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.AsyncFunction;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.FutureChain;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledExecutorService;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class ProcessingCaptureSession implements CaptureSessionInterface {
    private static final String TAG = "ProcessingCaptureSession";
    private static final long TIMEOUT_GET_SURFACE_IN_MS = 5000;
    private static List<DeferrableSurface> sHeldProcessorSurfaces = new ArrayList();
    private static int sNextInstanceId = 0;
    private final Camera2CameraInfoImpl mCamera2CameraInfoImpl;
    private final CaptureSession mCaptureSession;
    final Executor mExecutor;
    private int mInstanceId;
    private SessionConfig mProcessorSessionConfig;
    private Camera2RequestProcessor mRequestProcessor;
    private final ScheduledExecutorService mScheduledExecutorService;
    private SessionConfig mSessionConfig;
    private final SessionProcessor mSessionProcessor;
    private List<DeferrableSurface> mOutputSurfaces = new ArrayList();
    private volatile List<CaptureConfig> mPendingCaptureConfigs = null;
    volatile boolean mIsExecutingStillCaptureRequest = false;
    private CaptureRequestOptions mSessionOptions = new CaptureRequestOptions.Builder().build();
    private CaptureRequestOptions mStillCaptureOptions = new CaptureRequestOptions.Builder().build();
    private ProcessorState mProcessorState = ProcessorState.UNINITIALIZED;
    private final SessionProcessorCaptureCallback mSessionProcessorCaptureCallback = new SessionProcessorCaptureCallback();

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public enum ProcessorState {
        UNINITIALIZED,
        SESSION_INITIALIZED,
        ON_CAPTURE_SESSION_STARTED,
        ON_CAPTURE_SESSION_ENDED,
        DE_INITIALIZED
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ProcessingCaptureSession(SessionProcessor sessionProcessor, Camera2CameraInfoImpl camera2CameraInfoImpl, DynamicRangesCompat dynamicRangesCompat, Executor executor, ScheduledExecutorService scheduledExecutorService) {
        this.mInstanceId = 0;
        this.mCaptureSession = new CaptureSession(dynamicRangesCompat);
        this.mSessionProcessor = sessionProcessor;
        this.mCamera2CameraInfoImpl = camera2CameraInfoImpl;
        this.mExecutor = executor;
        this.mScheduledExecutorService = scheduledExecutorService;
        int i = sNextInstanceId;
        sNextInstanceId = i + 1;
        this.mInstanceId = i;
        Logger.d(TAG, "New ProcessingCaptureSession (id=" + this.mInstanceId + ")");
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public ListenableFuture<Void> open(final SessionConfig sessionConfig, final CameraDevice cameraDevice, final SynchronizedCaptureSessionOpener opener) {
        Preconditions.checkArgument(this.mProcessorState == ProcessorState.UNINITIALIZED, "Invalid state state:" + this.mProcessorState);
        Preconditions.checkArgument(!sessionConfig.getSurfaces().isEmpty(), "SessionConfig contains no surfaces");
        Logger.d(TAG, "open (id=" + this.mInstanceId + ")");
        this.mOutputSurfaces = sessionConfig.getSurfaces();
        ListenableFuture<Void> future = FutureChain.from(DeferrableSurfaces.surfaceListWithTimeout(this.mOutputSurfaces, false, 5000L, this.mExecutor, this.mScheduledExecutorService)).transformAsync(new AsyncFunction() { // from class: androidx.camera.camera2.internal.ProcessingCaptureSession$$ExternalSyntheticLambda2
            @Override // androidx.camera.core.impl.utils.futures.AsyncFunction
            public final ListenableFuture apply(Object obj) {
                return ProcessingCaptureSession.this.m54x6ab9d420(sessionConfig, cameraDevice, opener, (List) obj);
            }
        }, this.mExecutor).transform(new Function() { // from class: androidx.camera.camera2.internal.ProcessingCaptureSession$$ExternalSyntheticLambda3
            @Override // androidx.arch.core.util.Function
            public final Object apply(Object obj) {
                return ProcessingCaptureSession.this.m55x7b6fa0e1((Void) obj);
            }
        }, this.mExecutor);
        return future;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$open$2$androidx-camera-camera2-internal-ProcessingCaptureSession  reason: not valid java name */
    public /* synthetic */ ListenableFuture m54x6ab9d420(SessionConfig sessionConfig, CameraDevice cameraDevice, SynchronizedCaptureSessionOpener opener, List surfaceList) throws Exception {
        Logger.d(TAG, "-- getSurfaces done, start init (id=" + this.mInstanceId + ")");
        if (this.mProcessorState == ProcessorState.DE_INITIALIZED) {
            return Futures.immediateFailedFuture(new IllegalStateException("SessionProcessorCaptureSession is closed."));
        }
        if (surfaceList.contains(null)) {
            DeferrableSurface deferrableSurface = sessionConfig.getSurfaces().get(surfaceList.indexOf(null));
            return Futures.immediateFailedFuture(new DeferrableSurface.SurfaceClosedException("Surface closed", deferrableSurface));
        }
        OutputSurface previewOutputSurface = null;
        OutputSurface captureOutputSurface = null;
        OutputSurface analysisOutputSurface = null;
        for (int i = 0; i < sessionConfig.getSurfaces().size(); i++) {
            DeferrableSurface dSurface = sessionConfig.getSurfaces().get(i);
            if (Objects.equals(dSurface.getContainerClass(), Preview.class)) {
                previewOutputSurface = OutputSurface.create(dSurface.getSurface().get(), new Size(dSurface.getPrescribedSize().getWidth(), dSurface.getPrescribedSize().getHeight()), dSurface.getPrescribedStreamFormat());
            } else if (Objects.equals(dSurface.getContainerClass(), ImageCapture.class)) {
                captureOutputSurface = OutputSurface.create(dSurface.getSurface().get(), new Size(dSurface.getPrescribedSize().getWidth(), dSurface.getPrescribedSize().getHeight()), dSurface.getPrescribedStreamFormat());
            } else if (Objects.equals(dSurface.getContainerClass(), ImageAnalysis.class)) {
                analysisOutputSurface = OutputSurface.create(dSurface.getSurface().get(), new Size(dSurface.getPrescribedSize().getWidth(), dSurface.getPrescribedSize().getHeight()), dSurface.getPrescribedStreamFormat());
            }
        }
        this.mProcessorState = ProcessorState.SESSION_INITIALIZED;
        try {
            DeferrableSurfaces.incrementAll(this.mOutputSurfaces);
            Logger.w(TAG, "== initSession (id=" + this.mInstanceId + ")");
            try {
                this.mProcessorSessionConfig = this.mSessionProcessor.initSession(this.mCamera2CameraInfoImpl, previewOutputSurface, captureOutputSurface, analysisOutputSurface);
                this.mProcessorSessionConfig.getSurfaces().get(0).getTerminationFuture().addListener(new Runnable() { // from class: androidx.camera.camera2.internal.ProcessingCaptureSession$$ExternalSyntheticLambda0
                    @Override // java.lang.Runnable
                    public final void run() {
                        ProcessingCaptureSession.this.m53x494e3a9e();
                    }
                }, CameraXExecutors.directExecutor());
                for (final DeferrableSurface surface : this.mProcessorSessionConfig.getSurfaces()) {
                    sHeldProcessorSurfaces.add(surface);
                    surface.getTerminationFuture().addListener(new Runnable() { // from class: androidx.camera.camera2.internal.ProcessingCaptureSession$$ExternalSyntheticLambda1
                        @Override // java.lang.Runnable
                        public final void run() {
                            ProcessingCaptureSession.sHeldProcessorSurfaces.remove(DeferrableSurface.this);
                        }
                    }, this.mExecutor);
                }
                SessionConfig.ValidatingBuilder validatingBuilder = new SessionConfig.ValidatingBuilder();
                validatingBuilder.add(sessionConfig);
                validatingBuilder.clearSurfaces();
                validatingBuilder.add(this.mProcessorSessionConfig);
                Preconditions.checkArgument(validatingBuilder.isValid(), "Cannot transform the SessionConfig");
                SessionConfig transformedConfig = validatingBuilder.build();
                ListenableFuture<Void> openSessionFuture = this.mCaptureSession.open(transformedConfig, (CameraDevice) Preconditions.checkNotNull(cameraDevice), opener);
                Futures.addCallback(openSessionFuture, new FutureCallback<Void>() { // from class: androidx.camera.camera2.internal.ProcessingCaptureSession.1
                    @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                    public void onSuccess(Void result) {
                    }

                    @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                    public void onFailure(Throwable t) {
                        Logger.e(ProcessingCaptureSession.TAG, "open session failed ", t);
                        ProcessingCaptureSession.this.close();
                        ProcessingCaptureSession.this.release(false);
                    }
                }, this.mExecutor);
                return openSessionFuture;
            } catch (Throwable e) {
                DeferrableSurfaces.decrementAll(this.mOutputSurfaces);
                throw e;
            }
        } catch (DeferrableSurface.SurfaceClosedException e2) {
            return Futures.immediateFailedFuture(e2);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$open$0$androidx-camera-camera2-internal-ProcessingCaptureSession  reason: not valid java name */
    public /* synthetic */ void m53x494e3a9e() {
        DeferrableSurfaces.decrementAll(this.mOutputSurfaces);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$open$3$androidx-camera-camera2-internal-ProcessingCaptureSession  reason: not valid java name */
    public /* synthetic */ Void m55x7b6fa0e1(Void v) {
        onConfigured(this.mCaptureSession);
        return null;
    }

    private static void cancelRequests(List<CaptureConfig> captureConfigs) {
        for (CaptureConfig captureConfig : captureConfigs) {
            for (CameraCaptureCallback cameraCaptureCallback : captureConfig.getCameraCaptureCallbacks()) {
                cameraCaptureCallback.onCaptureCancelled();
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:5:0x0025  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    void issueTriggerRequest(androidx.camera.core.impl.CaptureConfig r7) {
        /*
            r6 = this;
            java.lang.String r0 = "ProcessingCaptureSession"
            java.lang.String r1 = "issueTriggerRequest"
            androidx.camera.core.Logger.d(r0, r1)
            androidx.camera.core.impl.Config r0 = r7.getImplementationOptions()
            androidx.camera.camera2.interop.CaptureRequestOptions$Builder r0 = androidx.camera.camera2.interop.CaptureRequestOptions.Builder.from(r0)
            androidx.camera.camera2.interop.CaptureRequestOptions r0 = r0.build()
            r1 = 0
            java.util.Set r2 = r0.listOptions()
            java.util.Iterator r2 = r2.iterator()
        L1f:
            boolean r3 = r2.hasNext()
            if (r3 == 0) goto L45
            java.lang.Object r3 = r2.next()
            androidx.camera.core.impl.Config$Option r3 = (androidx.camera.core.impl.Config.Option) r3
            java.lang.Object r4 = r3.getToken()
            android.hardware.camera2.CaptureRequest$Key r4 = (android.hardware.camera2.CaptureRequest.Key) r4
            android.hardware.camera2.CaptureRequest$Key r5 = android.hardware.camera2.CaptureRequest.CONTROL_AF_TRIGGER
            boolean r5 = r4.equals(r5)
            if (r5 != 0) goto L43
            android.hardware.camera2.CaptureRequest$Key r5 = android.hardware.camera2.CaptureRequest.CONTROL_AE_PRECAPTURE_TRIGGER
            boolean r5 = r4.equals(r5)
            if (r5 == 0) goto L42
            goto L43
        L42:
            goto L1f
        L43:
            r1 = 1
        L45:
            if (r1 != 0) goto L55
            r2 = 1
            androidx.camera.core.impl.CaptureConfig[] r2 = new androidx.camera.core.impl.CaptureConfig[r2]
            r3 = 0
            r2[r3] = r7
            java.util.List r2 = java.util.Arrays.asList(r2)
            cancelRequests(r2)
            return
        L55:
            androidx.camera.core.impl.SessionProcessor r2 = r6.mSessionProcessor
            androidx.camera.camera2.internal.ProcessingCaptureSession$2 r3 = new androidx.camera.camera2.internal.ProcessingCaptureSession$2
            r3.<init>(r7)
            r2.startTrigger(r0, r3)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.camera2.internal.ProcessingCaptureSession.issueTriggerRequest(androidx.camera.core.impl.CaptureConfig):void");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: androidx.camera.camera2.internal.ProcessingCaptureSession$2  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass2 implements SessionProcessor.CaptureCallback {
        final /* synthetic */ CaptureConfig val$captureConfig;

        AnonymousClass2(CaptureConfig captureConfig) {
            this.val$captureConfig = captureConfig;
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public void onCaptureFailed(int captureSequenceId) {
            Executor executor = ProcessingCaptureSession.this.mExecutor;
            final CaptureConfig captureConfig = this.val$captureConfig;
            executor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.ProcessingCaptureSession$2$$ExternalSyntheticLambda1
                @Override // java.lang.Runnable
                public final void run() {
                    ProcessingCaptureSession.AnonymousClass2.lambda$onCaptureFailed$0(CaptureConfig.this);
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public static /* synthetic */ void lambda$onCaptureFailed$0(CaptureConfig captureConfig) {
            for (CameraCaptureCallback cameraCaptureCallback : captureConfig.getCameraCaptureCallbacks()) {
                cameraCaptureCallback.onCaptureFailed(new CameraCaptureFailure(CameraCaptureFailure.Reason.ERROR));
            }
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public void onCaptureSequenceCompleted(int captureSequenceId) {
            Executor executor = ProcessingCaptureSession.this.mExecutor;
            final CaptureConfig captureConfig = this.val$captureConfig;
            executor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.ProcessingCaptureSession$2$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    ProcessingCaptureSession.AnonymousClass2.lambda$onCaptureSequenceCompleted$1(CaptureConfig.this);
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public static /* synthetic */ void lambda$onCaptureSequenceCompleted$1(CaptureConfig captureConfig) {
            for (CameraCaptureCallback cameraCaptureCallback : captureConfig.getCameraCaptureCallbacks()) {
                cameraCaptureCallback.onCaptureCompleted(new CameraCaptureResult.EmptyCameraCaptureResult());
            }
        }
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public void issueCaptureRequests(List<CaptureConfig> captureConfigs) {
        if (captureConfigs.isEmpty()) {
            return;
        }
        Logger.d(TAG, "issueCaptureRequests (id=" + this.mInstanceId + ") + state =" + this.mProcessorState);
        switch (this.mProcessorState) {
            case UNINITIALIZED:
            case SESSION_INITIALIZED:
                this.mPendingCaptureConfigs = captureConfigs;
                return;
            case ON_CAPTURE_SESSION_STARTED:
                for (CaptureConfig captureConfig : captureConfigs) {
                    if (captureConfig.getTemplateType() == 2) {
                        issueStillCaptureRequest(captureConfig);
                    } else {
                        issueTriggerRequest(captureConfig);
                    }
                }
                return;
            case ON_CAPTURE_SESSION_ENDED:
            case DE_INITIALIZED:
                Logger.d(TAG, "Run issueCaptureRequests in wrong state, state = " + this.mProcessorState);
                cancelRequests(captureConfigs);
                return;
            default:
                return;
        }
    }

    void issueStillCaptureRequest(CaptureConfig captureConfig) {
        CaptureRequestOptions.Builder builder = CaptureRequestOptions.Builder.from(captureConfig.getImplementationOptions());
        if (captureConfig.getImplementationOptions().containsOption(CaptureConfig.OPTION_ROTATION)) {
            builder.setCaptureRequestOption(CaptureRequest.JPEG_ORIENTATION, (Integer) captureConfig.getImplementationOptions().retrieveOption(CaptureConfig.OPTION_ROTATION));
        }
        if (captureConfig.getImplementationOptions().containsOption(CaptureConfig.OPTION_JPEG_QUALITY)) {
            builder.setCaptureRequestOption(CaptureRequest.JPEG_QUALITY, Byte.valueOf(((Integer) captureConfig.getImplementationOptions().retrieveOption(CaptureConfig.OPTION_JPEG_QUALITY)).byteValue()));
        }
        this.mStillCaptureOptions = builder.build();
        updateParameters(this.mSessionOptions, this.mStillCaptureOptions);
        this.mSessionProcessor.startCapture(new AnonymousClass3(captureConfig));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: androidx.camera.camera2.internal.ProcessingCaptureSession$3  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass3 implements SessionProcessor.CaptureCallback {
        final /* synthetic */ CaptureConfig val$captureConfig;

        AnonymousClass3(CaptureConfig captureConfig) {
            this.val$captureConfig = captureConfig;
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public void onCaptureFailed(int captureSequenceId) {
            Executor executor = ProcessingCaptureSession.this.mExecutor;
            final CaptureConfig captureConfig = this.val$captureConfig;
            executor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.ProcessingCaptureSession$3$$ExternalSyntheticLambda1
                @Override // java.lang.Runnable
                public final void run() {
                    ProcessingCaptureSession.AnonymousClass3.lambda$onCaptureFailed$0(CaptureConfig.this);
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public static /* synthetic */ void lambda$onCaptureFailed$0(CaptureConfig captureConfig) {
            for (CameraCaptureCallback cameraCaptureCallback : captureConfig.getCameraCaptureCallbacks()) {
                cameraCaptureCallback.onCaptureFailed(new CameraCaptureFailure(CameraCaptureFailure.Reason.ERROR));
            }
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public void onCaptureSequenceCompleted(int captureSequenceId) {
            Executor executor = ProcessingCaptureSession.this.mExecutor;
            final CaptureConfig captureConfig = this.val$captureConfig;
            executor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.ProcessingCaptureSession$3$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    ProcessingCaptureSession.AnonymousClass3.lambda$onCaptureSequenceCompleted$1(CaptureConfig.this);
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public static /* synthetic */ void lambda$onCaptureSequenceCompleted$1(CaptureConfig captureConfig) {
            for (CameraCaptureCallback cameraCaptureCallback : captureConfig.getCameraCaptureCallbacks()) {
                cameraCaptureCallback.onCaptureCompleted(new CameraCaptureResult.EmptyCameraCaptureResult());
            }
        }
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public ListenableFuture<Void> release(boolean abortInFlightCaptures) {
        Logger.d(TAG, "release (id=" + this.mInstanceId + ") mProcessorState=" + this.mProcessorState);
        ListenableFuture<Void> future = this.mCaptureSession.release(abortInFlightCaptures);
        switch (this.mProcessorState) {
            case SESSION_INITIALIZED:
            case ON_CAPTURE_SESSION_ENDED:
                future.addListener(new Runnable() { // from class: androidx.camera.camera2.internal.ProcessingCaptureSession$$ExternalSyntheticLambda4
                    @Override // java.lang.Runnable
                    public final void run() {
                        ProcessingCaptureSession.this.m56x14d78e45();
                    }
                }, CameraXExecutors.directExecutor());
                break;
        }
        this.mProcessorState = ProcessorState.DE_INITIALIZED;
        return future;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$release$4$androidx-camera-camera2-internal-ProcessingCaptureSession  reason: not valid java name */
    public /* synthetic */ void m56x14d78e45() {
        Logger.d(TAG, "== deInitSession (id=" + this.mInstanceId + ")");
        this.mSessionProcessor.deInitSession();
    }

    private static List<SessionProcessorSurface> getSessionProcessorSurfaceList(List<DeferrableSurface> deferrableSurfaceList) {
        ArrayList<SessionProcessorSurface> outputSurfaceList = new ArrayList<>();
        for (DeferrableSurface deferrableSurface : deferrableSurfaceList) {
            Preconditions.checkArgument(deferrableSurface instanceof SessionProcessorSurface, "Surface must be SessionProcessorSurface");
            outputSurfaceList.add((SessionProcessorSurface) deferrableSurface);
        }
        return outputSurfaceList;
    }

    void onConfigured(CaptureSession captureSession) {
        Preconditions.checkArgument(this.mProcessorState == ProcessorState.SESSION_INITIALIZED, "Invalid state state:" + this.mProcessorState);
        this.mRequestProcessor = new Camera2RequestProcessor(captureSession, getSessionProcessorSurfaceList(this.mProcessorSessionConfig.getSurfaces()));
        Logger.d(TAG, "== onCaptureSessinStarted (id = " + this.mInstanceId + ")");
        this.mSessionProcessor.onCaptureSessionStart(this.mRequestProcessor);
        this.mProcessorState = ProcessorState.ON_CAPTURE_SESSION_STARTED;
        if (this.mSessionConfig != null) {
            setSessionConfig(this.mSessionConfig);
        }
        if (this.mPendingCaptureConfigs != null) {
            issueCaptureRequests(this.mPendingCaptureConfigs);
            this.mPendingCaptureConfigs = null;
        }
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public SessionConfig getSessionConfig() {
        return this.mSessionConfig;
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public List<CaptureConfig> getCaptureConfigs() {
        return this.mPendingCaptureConfigs != null ? this.mPendingCaptureConfigs : Collections.emptyList();
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public void cancelIssuedCaptureRequests() {
        Logger.d(TAG, "cancelIssuedCaptureRequests (id=" + this.mInstanceId + ")");
        if (this.mPendingCaptureConfigs != null) {
            for (CaptureConfig captureConfig : this.mPendingCaptureConfigs) {
                for (CameraCaptureCallback cameraCaptureCallback : captureConfig.getCameraCaptureCallbacks()) {
                    cameraCaptureCallback.onCaptureCancelled();
                }
            }
            this.mPendingCaptureConfigs = null;
        }
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public void close() {
        Logger.d(TAG, "close (id=" + this.mInstanceId + ") state=" + this.mProcessorState);
        if (this.mProcessorState == ProcessorState.ON_CAPTURE_SESSION_STARTED) {
            Logger.d(TAG, "== onCaptureSessionEnd (id = " + this.mInstanceId + ")");
            this.mSessionProcessor.onCaptureSessionEnd();
            if (this.mRequestProcessor != null) {
                this.mRequestProcessor.close();
            }
            this.mProcessorState = ProcessorState.ON_CAPTURE_SESSION_ENDED;
        }
        this.mCaptureSession.close();
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public void setSessionConfig(SessionConfig sessionConfig) {
        Logger.d(TAG, "setSessionConfig (id=" + this.mInstanceId + ")");
        this.mSessionConfig = sessionConfig;
        if (sessionConfig == null) {
            return;
        }
        if (this.mRequestProcessor != null) {
            this.mRequestProcessor.updateSessionConfig(sessionConfig);
        }
        if (this.mProcessorState == ProcessorState.ON_CAPTURE_SESSION_STARTED) {
            this.mSessionOptions = CaptureRequestOptions.Builder.from(sessionConfig.getImplementationOptions()).build();
            updateParameters(this.mSessionOptions, this.mStillCaptureOptions);
            boolean hasPreviewSurface = hasPreviewSurface(sessionConfig.getRepeatingCaptureConfig());
            SessionProcessor sessionProcessor = this.mSessionProcessor;
            if (!hasPreviewSurface) {
                sessionProcessor.stopRepeating();
            } else {
                sessionProcessor.startRepeating(this.mSessionProcessorCaptureCallback);
            }
        }
    }

    private boolean hasPreviewSurface(CaptureConfig captureConfig) {
        for (DeferrableSurface surface : captureConfig.getSurfaces()) {
            if (Objects.equals(surface.getContainerClass(), Preview.class)) {
                return true;
            }
        }
        return false;
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public void setStreamUseCaseMap(Map<DeferrableSurface, Long> streamUseCaseMap) {
    }

    private void updateParameters(CaptureRequestOptions sessionOptions, CaptureRequestOptions stillCaptureOptions) {
        Camera2ImplConfig.Builder builder = new Camera2ImplConfig.Builder();
        builder.insertAllOptions(sessionOptions);
        builder.insertAllOptions(stillCaptureOptions);
        this.mSessionProcessor.setParameters(builder.build());
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class SessionProcessorCaptureCallback implements SessionProcessor.CaptureCallback {
        SessionProcessorCaptureCallback() {
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public void onCaptureStarted(int captureSequenceId, long timestamp) {
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public void onCaptureProcessStarted(int captureSequenceId) {
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public void onCaptureFailed(int captureSequenceId) {
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public void onCaptureSequenceCompleted(int captureSequenceId) {
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public void onCaptureSequenceAborted(int captureSequenceId) {
        }

        @Override // androidx.camera.core.impl.SessionProcessor.CaptureCallback
        public void onCaptureCompleted(long timestamp, int captureSequenceId, Map<CaptureResult.Key, Object> result) {
        }
    }
}
