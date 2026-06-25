package androidx.camera.camera2.internal;

import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CaptureRequest;
import android.os.Handler;
import android.view.Surface;
import androidx.camera.camera2.internal.SynchronizedCaptureSession;
import androidx.camera.camera2.internal.SynchronizedCaptureSessionOpener;
import androidx.camera.camera2.internal.compat.CameraCaptureSessionCompat;
import androidx.camera.camera2.internal.compat.CameraDeviceCompat;
import androidx.camera.camera2.internal.compat.params.OutputConfigurationCompat;
import androidx.camera.camera2.internal.compat.params.SessionConfigurationCompat;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.DeferrableSurfaces;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.AsyncFunction;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.FutureChain;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.CancellationException;
import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledExecutorService;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class SynchronizedCaptureSessionBaseImpl extends SynchronizedCaptureSession.StateCallback implements SynchronizedCaptureSession, SynchronizedCaptureSessionOpener.OpenerImpl {
    private static final String TAG = "SyncCaptureSessionBase";
    CameraCaptureSessionCompat mCameraCaptureSessionCompat;
    final CaptureSessionRepository mCaptureSessionRepository;
    SynchronizedCaptureSession.StateCallback mCaptureSessionStateCallback;
    final Handler mCompatHandler;
    final Executor mExecutor;
    CallbackToFutureAdapter.Completer<Void> mOpenCaptureSessionCompleter;
    ListenableFuture<Void> mOpenCaptureSessionFuture;
    private final ScheduledExecutorService mScheduledExecutorService;
    private ListenableFuture<List<Surface>> mStartingSurface;
    final Object mLock = new Object();
    private List<DeferrableSurface> mHeldDeferrableSurfaces = null;
    private boolean mClosed = false;
    private boolean mOpenerDisabled = false;
    private boolean mSessionFinished = false;

    /* JADX INFO: Access modifiers changed from: package-private */
    public SynchronizedCaptureSessionBaseImpl(CaptureSessionRepository repository, Executor executor, ScheduledExecutorService scheduledExecutorService, Handler compatHandler) {
        this.mCaptureSessionRepository = repository;
        this.mCompatHandler = compatHandler;
        this.mExecutor = executor;
        this.mScheduledExecutorService = scheduledExecutorService;
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession
    public SynchronizedCaptureSession.StateCallback getStateCallback() {
        return this;
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession
    public ListenableFuture<Void> getOpeningBlocker() {
        return Futures.immediateFuture(null);
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSessionOpener.OpenerImpl
    public ListenableFuture<Void> openCaptureSession(CameraDevice cameraDevice, final SessionConfigurationCompat sessionConfigurationCompat, final List<DeferrableSurface> deferrableSurfaces) {
        synchronized (this.mLock) {
            if (this.mOpenerDisabled) {
                return Futures.immediateFailedFuture(new CancellationException("Opener is disabled"));
            }
            this.mCaptureSessionRepository.onCreateCaptureSession(this);
            final CameraDeviceCompat cameraDeviceCompat = CameraDeviceCompat.toCameraDeviceCompat(cameraDevice, this.mCompatHandler);
            this.mOpenCaptureSessionFuture = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.camera2.internal.SynchronizedCaptureSessionBaseImpl$$ExternalSyntheticLambda3
                @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                    return SynchronizedCaptureSessionBaseImpl.this.m60x73bfea20(deferrableSurfaces, cameraDeviceCompat, sessionConfigurationCompat, completer);
                }
            });
            Futures.addCallback(this.mOpenCaptureSessionFuture, new FutureCallback<Void>() { // from class: androidx.camera.camera2.internal.SynchronizedCaptureSessionBaseImpl.1
                @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                public void onSuccess(Void result) {
                }

                @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                public void onFailure(Throwable t) {
                    SynchronizedCaptureSessionBaseImpl.this.finishClose();
                    SynchronizedCaptureSessionBaseImpl.this.mCaptureSessionRepository.onCaptureSessionConfigureFail(SynchronizedCaptureSessionBaseImpl.this);
                }
            }, CameraXExecutors.directExecutor());
            return Futures.nonCancellationPropagating(this.mOpenCaptureSessionFuture);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$openCaptureSession$0$androidx-camera-camera2-internal-SynchronizedCaptureSessionBaseImpl  reason: not valid java name */
    public /* synthetic */ Object m60x73bfea20(List deferrableSurfaces, CameraDeviceCompat cameraDeviceCompat, SessionConfigurationCompat sessionConfigurationCompat, CallbackToFutureAdapter.Completer completer) throws Exception {
        String str;
        synchronized (this.mLock) {
            holdDeferrableSurfaces(deferrableSurfaces);
            Preconditions.checkState(this.mOpenCaptureSessionCompleter == null, "The openCaptureSessionCompleter can only set once!");
            this.mOpenCaptureSessionCompleter = completer;
            cameraDeviceCompat.createCaptureSession(sessionConfigurationCompat);
            str = "openCaptureSession[session=" + this + "]";
        }
        return str;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isCameraCaptureSessionOpen() {
        boolean z;
        synchronized (this.mLock) {
            z = this.mOpenCaptureSessionFuture != null;
        }
        return z;
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSessionOpener.OpenerImpl
    public SessionConfigurationCompat createSessionConfigurationCompat(int sessionType, List<OutputConfigurationCompat> outputsCompat, SynchronizedCaptureSession.StateCallback stateCallback) {
        this.mCaptureSessionStateCallback = stateCallback;
        return new SessionConfigurationCompat(sessionType, outputsCompat, getExecutor(), new CameraCaptureSession.StateCallback() { // from class: androidx.camera.camera2.internal.SynchronizedCaptureSessionBaseImpl.2
            @Override // android.hardware.camera2.CameraCaptureSession.StateCallback
            public void onReady(CameraCaptureSession session) {
                SynchronizedCaptureSessionBaseImpl.this.createCaptureSessionCompat(session);
                SynchronizedCaptureSessionBaseImpl.this.onReady(SynchronizedCaptureSessionBaseImpl.this);
            }

            @Override // android.hardware.camera2.CameraCaptureSession.StateCallback
            public void onActive(CameraCaptureSession session) {
                SynchronizedCaptureSessionBaseImpl.this.createCaptureSessionCompat(session);
                SynchronizedCaptureSessionBaseImpl.this.onActive(SynchronizedCaptureSessionBaseImpl.this);
            }

            @Override // android.hardware.camera2.CameraCaptureSession.StateCallback
            public void onCaptureQueueEmpty(CameraCaptureSession session) {
                SynchronizedCaptureSessionBaseImpl.this.createCaptureSessionCompat(session);
                SynchronizedCaptureSessionBaseImpl.this.onCaptureQueueEmpty(SynchronizedCaptureSessionBaseImpl.this);
            }

            @Override // android.hardware.camera2.CameraCaptureSession.StateCallback
            public void onSurfacePrepared(CameraCaptureSession session, Surface surface) {
                SynchronizedCaptureSessionBaseImpl.this.createCaptureSessionCompat(session);
                SynchronizedCaptureSessionBaseImpl.this.onSurfacePrepared(SynchronizedCaptureSessionBaseImpl.this, surface);
            }

            @Override // android.hardware.camera2.CameraCaptureSession.StateCallback
            public void onConfigured(CameraCaptureSession session) {
                CallbackToFutureAdapter.Completer<Void> completer;
                try {
                    SynchronizedCaptureSessionBaseImpl.this.createCaptureSessionCompat(session);
                    SynchronizedCaptureSessionBaseImpl.this.onConfigured(SynchronizedCaptureSessionBaseImpl.this);
                    synchronized (SynchronizedCaptureSessionBaseImpl.this.mLock) {
                        Preconditions.checkNotNull(SynchronizedCaptureSessionBaseImpl.this.mOpenCaptureSessionCompleter, "OpenCaptureSession completer should not null");
                        completer = SynchronizedCaptureSessionBaseImpl.this.mOpenCaptureSessionCompleter;
                        SynchronizedCaptureSessionBaseImpl.this.mOpenCaptureSessionCompleter = null;
                    }
                    completer.set(null);
                } catch (Throwable th) {
                    synchronized (SynchronizedCaptureSessionBaseImpl.this.mLock) {
                        Preconditions.checkNotNull(SynchronizedCaptureSessionBaseImpl.this.mOpenCaptureSessionCompleter, "OpenCaptureSession completer should not null");
                        CallbackToFutureAdapter.Completer<Void> completer2 = SynchronizedCaptureSessionBaseImpl.this.mOpenCaptureSessionCompleter;
                        SynchronizedCaptureSessionBaseImpl.this.mOpenCaptureSessionCompleter = null;
                        completer2.set(null);
                        throw th;
                    }
                }
            }

            @Override // android.hardware.camera2.CameraCaptureSession.StateCallback
            public void onConfigureFailed(CameraCaptureSession session) {
                CallbackToFutureAdapter.Completer<Void> completer;
                try {
                    SynchronizedCaptureSessionBaseImpl.this.createCaptureSessionCompat(session);
                    SynchronizedCaptureSessionBaseImpl.this.onConfigureFailed(SynchronizedCaptureSessionBaseImpl.this);
                    synchronized (SynchronizedCaptureSessionBaseImpl.this.mLock) {
                        Preconditions.checkNotNull(SynchronizedCaptureSessionBaseImpl.this.mOpenCaptureSessionCompleter, "OpenCaptureSession completer should not null");
                        completer = SynchronizedCaptureSessionBaseImpl.this.mOpenCaptureSessionCompleter;
                        SynchronizedCaptureSessionBaseImpl.this.mOpenCaptureSessionCompleter = null;
                    }
                    completer.setException(new IllegalStateException("onConfigureFailed"));
                } catch (Throwable th) {
                    synchronized (SynchronizedCaptureSessionBaseImpl.this.mLock) {
                        Preconditions.checkNotNull(SynchronizedCaptureSessionBaseImpl.this.mOpenCaptureSessionCompleter, "OpenCaptureSession completer should not null");
                        CallbackToFutureAdapter.Completer<Void> completer2 = SynchronizedCaptureSessionBaseImpl.this.mOpenCaptureSessionCompleter;
                        SynchronizedCaptureSessionBaseImpl.this.mOpenCaptureSessionCompleter = null;
                        completer2.setException(new IllegalStateException("onConfigureFailed"));
                        throw th;
                    }
                }
            }

            @Override // android.hardware.camera2.CameraCaptureSession.StateCallback
            public void onClosed(CameraCaptureSession session) {
                SynchronizedCaptureSessionBaseImpl.this.createCaptureSessionCompat(session);
                SynchronizedCaptureSessionBaseImpl.this.onClosed(SynchronizedCaptureSessionBaseImpl.this);
            }
        });
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSessionOpener.OpenerImpl
    public Executor getExecutor() {
        return this.mExecutor;
    }

    void createCaptureSessionCompat(CameraCaptureSession session) {
        if (this.mCameraCaptureSessionCompat == null) {
            this.mCameraCaptureSessionCompat = CameraCaptureSessionCompat.toCameraCaptureSessionCompat(session, this.mCompatHandler);
        }
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSessionOpener.OpenerImpl
    public ListenableFuture<List<Surface>> startWithDeferrableSurface(final List<DeferrableSurface> deferrableSurfaces, long timeout) {
        synchronized (this.mLock) {
            try {
                try {
                    if (this.mOpenerDisabled) {
                        try {
                            return Futures.immediateFailedFuture(new CancellationException("Opener is disabled"));
                        } catch (Throwable th) {
                            th = th;
                            throw th;
                        }
                    }
                    this.mStartingSurface = FutureChain.from(DeferrableSurfaces.surfaceListWithTimeout(deferrableSurfaces, false, timeout, getExecutor(), this.mScheduledExecutorService)).transformAsync(new AsyncFunction() { // from class: androidx.camera.camera2.internal.SynchronizedCaptureSessionBaseImpl$$ExternalSyntheticLambda4
                        @Override // androidx.camera.core.impl.utils.futures.AsyncFunction
                        public final ListenableFuture apply(Object obj) {
                            return SynchronizedCaptureSessionBaseImpl.this.m61x2071bdd2(deferrableSurfaces, (List) obj);
                        }
                    }, getExecutor());
                    return Futures.nonCancellationPropagating(this.mStartingSurface);
                } catch (Throwable th2) {
                    th = th2;
                }
            } catch (Throwable th3) {
                th = th3;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$startWithDeferrableSurface$1$androidx-camera-camera2-internal-SynchronizedCaptureSessionBaseImpl  reason: not valid java name */
    public /* synthetic */ ListenableFuture m61x2071bdd2(List deferrableSurfaces, List surfaces) throws Exception {
        Logger.d(TAG, "[" + this + "] getSurface...done");
        if (surfaces.contains(null)) {
            DeferrableSurface deferrableSurface = (DeferrableSurface) deferrableSurfaces.get(surfaces.indexOf(null));
            return Futures.immediateFailedFuture(new DeferrableSurface.SurfaceClosedException("Surface closed", deferrableSurface));
        } else if (surfaces.isEmpty()) {
            return Futures.immediateFailedFuture(new IllegalArgumentException("Unable to open capture session without surfaces"));
        } else {
            return Futures.immediateFuture(surfaces);
        }
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSessionOpener.OpenerImpl
    public boolean stop() {
        boolean z;
        ListenableFuture<List<Surface>> startingSurface = null;
        try {
            synchronized (this.mLock) {
                if (!this.mOpenerDisabled) {
                    if (this.mStartingSurface != null) {
                        startingSurface = this.mStartingSurface;
                    }
                    this.mOpenerDisabled = true;
                }
                z = !isCameraCaptureSessionOpen();
            }
            return z;
        } finally {
            if (startingSurface != null) {
                startingSurface.cancel(true);
            }
        }
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession
    public CameraCaptureSessionCompat toCameraCaptureSessionCompat() {
        Preconditions.checkNotNull(this.mCameraCaptureSessionCompat);
        return this.mCameraCaptureSessionCompat;
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession
    public CameraDevice getDevice() {
        Preconditions.checkNotNull(this.mCameraCaptureSessionCompat);
        return this.mCameraCaptureSessionCompat.toCameraCaptureSession().getDevice();
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession
    public Surface getInputSurface() {
        Preconditions.checkNotNull(this.mCameraCaptureSessionCompat);
        return Api23Impl.getInputSurface(this.mCameraCaptureSessionCompat.toCameraCaptureSession());
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession
    public int captureSingleRequest(CaptureRequest request, CameraCaptureSession.CaptureCallback listener) throws CameraAccessException {
        Preconditions.checkNotNull(this.mCameraCaptureSessionCompat, "Need to call openCaptureSession before using this API.");
        return this.mCameraCaptureSessionCompat.captureSingleRequest(request, getExecutor(), listener);
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession
    public int captureBurstRequests(List<CaptureRequest> requests, CameraCaptureSession.CaptureCallback listener) throws CameraAccessException {
        Preconditions.checkNotNull(this.mCameraCaptureSessionCompat, "Need to call openCaptureSession before using this API.");
        return this.mCameraCaptureSessionCompat.captureBurstRequests(requests, getExecutor(), listener);
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession
    public int setSingleRepeatingRequest(CaptureRequest request, CameraCaptureSession.CaptureCallback listener) throws CameraAccessException {
        Preconditions.checkNotNull(this.mCameraCaptureSessionCompat, "Need to call openCaptureSession before using this API.");
        return this.mCameraCaptureSessionCompat.setSingleRepeatingRequest(request, getExecutor(), listener);
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession
    public int setRepeatingBurstRequests(List<CaptureRequest> requests, CameraCaptureSession.CaptureCallback listener) throws CameraAccessException {
        Preconditions.checkNotNull(this.mCameraCaptureSessionCompat, "Need to call openCaptureSession before using this API.");
        return this.mCameraCaptureSessionCompat.setRepeatingBurstRequests(requests, getExecutor(), listener);
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession
    public int captureSingleRequest(CaptureRequest request, Executor executor, CameraCaptureSession.CaptureCallback listener) throws CameraAccessException {
        Preconditions.checkNotNull(this.mCameraCaptureSessionCompat, "Need to call openCaptureSession before using this API.");
        return this.mCameraCaptureSessionCompat.captureSingleRequest(request, executor, listener);
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession
    public int captureBurstRequests(List<CaptureRequest> requests, Executor executor, CameraCaptureSession.CaptureCallback listener) throws CameraAccessException {
        Preconditions.checkNotNull(this.mCameraCaptureSessionCompat, "Need to call openCaptureSession before using this API.");
        return this.mCameraCaptureSessionCompat.captureBurstRequests(requests, executor, listener);
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession
    public int setSingleRepeatingRequest(CaptureRequest request, Executor executor, CameraCaptureSession.CaptureCallback listener) throws CameraAccessException {
        Preconditions.checkNotNull(this.mCameraCaptureSessionCompat, "Need to call openCaptureSession before using this API.");
        return this.mCameraCaptureSessionCompat.setSingleRepeatingRequest(request, executor, listener);
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession
    public int setRepeatingBurstRequests(List<CaptureRequest> requests, Executor executor, CameraCaptureSession.CaptureCallback listener) throws CameraAccessException {
        Preconditions.checkNotNull(this.mCameraCaptureSessionCompat, "Need to call openCaptureSession before using this API.");
        return this.mCameraCaptureSessionCompat.setRepeatingBurstRequests(requests, executor, listener);
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession
    public void stopRepeating() throws CameraAccessException {
        Preconditions.checkNotNull(this.mCameraCaptureSessionCompat, "Need to call openCaptureSession before using this API.");
        this.mCameraCaptureSessionCompat.toCameraCaptureSession().stopRepeating();
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession
    public void abortCaptures() throws CameraAccessException {
        Preconditions.checkNotNull(this.mCameraCaptureSessionCompat, "Need to call openCaptureSession before using this API.");
        this.mCameraCaptureSessionCompat.toCameraCaptureSession().abortCaptures();
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession
    public void close() {
        Preconditions.checkNotNull(this.mCameraCaptureSessionCompat, "Need to call openCaptureSession before using this API.");
        this.mCaptureSessionRepository.onCaptureSessionClosing(this);
        this.mCameraCaptureSessionCompat.toCameraCaptureSession().close();
        getExecutor().execute(new Runnable() { // from class: androidx.camera.camera2.internal.SynchronizedCaptureSessionBaseImpl$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                SynchronizedCaptureSessionBaseImpl.this.m57x23111ba6();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$close$2$androidx-camera-camera2-internal-SynchronizedCaptureSessionBaseImpl  reason: not valid java name */
    public /* synthetic */ void m57x23111ba6() {
        onSessionFinished(this);
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession.StateCallback
    public void onReady(SynchronizedCaptureSession session) {
        Objects.requireNonNull(this.mCaptureSessionStateCallback);
        this.mCaptureSessionStateCallback.onReady(session);
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession.StateCallback
    public void onActive(SynchronizedCaptureSession session) {
        Objects.requireNonNull(this.mCaptureSessionStateCallback);
        this.mCaptureSessionStateCallback.onActive(session);
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession.StateCallback
    public void onCaptureQueueEmpty(SynchronizedCaptureSession session) {
        Objects.requireNonNull(this.mCaptureSessionStateCallback);
        this.mCaptureSessionStateCallback.onCaptureQueueEmpty(session);
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession.StateCallback
    public void onSurfacePrepared(SynchronizedCaptureSession session, Surface surface) {
        Objects.requireNonNull(this.mCaptureSessionStateCallback);
        this.mCaptureSessionStateCallback.onSurfacePrepared(session, surface);
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession.StateCallback
    public void onConfigured(SynchronizedCaptureSession session) {
        Objects.requireNonNull(this.mCaptureSessionStateCallback);
        this.mCaptureSessionRepository.onCaptureSessionCreated(this);
        this.mCaptureSessionStateCallback.onConfigured(session);
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession.StateCallback
    public void onConfigureFailed(SynchronizedCaptureSession session) {
        Objects.requireNonNull(this.mCaptureSessionStateCallback);
        finishClose();
        this.mCaptureSessionRepository.onCaptureSessionConfigureFail(this);
        this.mCaptureSessionStateCallback.onConfigureFailed(session);
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession.StateCallback
    public void onClosed(final SynchronizedCaptureSession session) {
        ListenableFuture<Void> openFuture = null;
        synchronized (this.mLock) {
            if (!this.mClosed) {
                this.mClosed = true;
                Preconditions.checkNotNull(this.mOpenCaptureSessionFuture, "Need to call openCaptureSession before using this API.");
                openFuture = this.mOpenCaptureSessionFuture;
            }
        }
        finishClose();
        if (openFuture != null) {
            openFuture.addListener(new Runnable() { // from class: androidx.camera.camera2.internal.SynchronizedCaptureSessionBaseImpl$$ExternalSyntheticLambda2
                @Override // java.lang.Runnable
                public final void run() {
                    SynchronizedCaptureSessionBaseImpl.this.m58x46877ef4(session);
                }
            }, CameraXExecutors.directExecutor());
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$onClosed$3$androidx-camera-camera2-internal-SynchronizedCaptureSessionBaseImpl  reason: not valid java name */
    public /* synthetic */ void m58x46877ef4(SynchronizedCaptureSession session) {
        this.mCaptureSessionRepository.onCaptureSessionClosed(this);
        onSessionFinished(session);
        Objects.requireNonNull(this.mCaptureSessionStateCallback);
        this.mCaptureSessionStateCallback.onClosed(session);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession.StateCallback
    public void onSessionFinished(final SynchronizedCaptureSession session) {
        ListenableFuture<Void> openFuture = null;
        synchronized (this.mLock) {
            if (!this.mSessionFinished) {
                this.mSessionFinished = true;
                Preconditions.checkNotNull(this.mOpenCaptureSessionFuture, "Need to call openCaptureSession before using this API.");
                openFuture = this.mOpenCaptureSessionFuture;
            }
        }
        if (openFuture != null) {
            openFuture.addListener(new Runnable() { // from class: androidx.camera.camera2.internal.SynchronizedCaptureSessionBaseImpl$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    SynchronizedCaptureSessionBaseImpl.this.m59x5333f8b9(session);
                }
            }, CameraXExecutors.directExecutor());
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$onSessionFinished$4$androidx-camera-camera2-internal-SynchronizedCaptureSessionBaseImpl  reason: not valid java name */
    public /* synthetic */ void m59x5333f8b9(SynchronizedCaptureSession session) {
        Objects.requireNonNull(this.mCaptureSessionStateCallback);
        this.mCaptureSessionStateCallback.onSessionFinished(session);
    }

    void holdDeferrableSurfaces(List<DeferrableSurface> deferrableSurfaces) throws DeferrableSurface.SurfaceClosedException {
        synchronized (this.mLock) {
            releaseDeferrableSurfaces();
            DeferrableSurfaces.incrementAll(deferrableSurfaces);
            this.mHeldDeferrableSurfaces = deferrableSurfaces;
        }
    }

    void releaseDeferrableSurfaces() {
        synchronized (this.mLock) {
            if (this.mHeldDeferrableSurfaces != null) {
                DeferrableSurfaces.decrementAll(this.mHeldDeferrableSurfaces);
                this.mHeldDeferrableSurfaces = null;
            }
        }
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession
    public void finishClose() {
        releaseDeferrableSurfaces();
    }

    /* loaded from: classes.dex */
    private static class Api23Impl {
        private Api23Impl() {
        }

        static Surface getInputSurface(CameraCaptureSession cameraCaptureSession) {
            return cameraCaptureSession.getInputSurface();
        }
    }
}
