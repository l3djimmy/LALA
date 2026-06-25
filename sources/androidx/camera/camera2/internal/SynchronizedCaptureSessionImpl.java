package androidx.camera.camera2.internal;

import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CaptureRequest;
import android.os.Handler;
import android.view.Surface;
import androidx.camera.camera2.internal.compat.params.SessionConfigurationCompat;
import androidx.camera.camera2.internal.compat.workaround.ForceCloseCaptureSession;
import androidx.camera.camera2.internal.compat.workaround.ForceCloseDeferrableSurface;
import androidx.camera.camera2.internal.compat.workaround.WaitForRepeatingRequestStart;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.Quirks;
import androidx.camera.core.impl.utils.futures.Futures;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledExecutorService;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class SynchronizedCaptureSessionImpl extends SynchronizedCaptureSessionBaseImpl {
    private static final String TAG = "SyncCaptureSessionImpl";
    private final ForceCloseDeferrableSurface mCloseSurfaceQuirk;
    private List<DeferrableSurface> mDeferrableSurfaces;
    private final ForceCloseCaptureSession mForceCloseSessionQuirk;
    private final Object mObjectLock;
    ListenableFuture<Void> mOpeningCaptureSession;
    private final WaitForRepeatingRequestStart mWaitForOtherSessionCompleteQuirk;

    /* JADX INFO: Access modifiers changed from: package-private */
    public SynchronizedCaptureSessionImpl(Quirks cameraQuirks, Quirks deviceQuirks, CaptureSessionRepository repository, Executor executor, ScheduledExecutorService scheduledExecutorService, Handler compatHandler) {
        super(repository, executor, scheduledExecutorService, compatHandler);
        this.mObjectLock = new Object();
        this.mCloseSurfaceQuirk = new ForceCloseDeferrableSurface(cameraQuirks, deviceQuirks);
        this.mWaitForOtherSessionCompleteQuirk = new WaitForRepeatingRequestStart(cameraQuirks);
        this.mForceCloseSessionQuirk = new ForceCloseCaptureSession(deviceQuirks);
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSessionBaseImpl, androidx.camera.camera2.internal.SynchronizedCaptureSessionOpener.OpenerImpl
    public ListenableFuture<Void> openCaptureSession(CameraDevice cameraDevice, SessionConfigurationCompat sessionConfigurationCompat, List<DeferrableSurface> deferrableSurfaces) {
        Throwable th;
        synchronized (this.mObjectLock) {
            try {
                try {
                    this.mOpeningCaptureSession = this.mWaitForOtherSessionCompleteQuirk.openCaptureSession(cameraDevice, sessionConfigurationCompat, deferrableSurfaces, this.mCaptureSessionRepository.getClosingCaptureSession(), new WaitForRepeatingRequestStart.OpenCaptureSession() { // from class: androidx.camera.camera2.internal.SynchronizedCaptureSessionImpl$$ExternalSyntheticLambda3
                        @Override // androidx.camera.camera2.internal.compat.workaround.WaitForRepeatingRequestStart.OpenCaptureSession
                        public final ListenableFuture run(CameraDevice cameraDevice2, SessionConfigurationCompat sessionConfigurationCompat2, List list) {
                            return SynchronizedCaptureSessionImpl.this.m64xe055f2f(cameraDevice2, sessionConfigurationCompat2, list);
                        }
                    });
                    return Futures.nonCancellationPropagating(this.mOpeningCaptureSession);
                } catch (Throwable th2) {
                    th = th2;
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$openCaptureSession$0$androidx-camera-camera2-internal-SynchronizedCaptureSessionImpl  reason: not valid java name */
    public /* synthetic */ ListenableFuture m64xe055f2f(CameraDevice x$0, SessionConfigurationCompat x$1, List x$2) {
        return super.openCaptureSession(x$0, x$1, x$2);
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSessionBaseImpl, androidx.camera.camera2.internal.SynchronizedCaptureSession
    public ListenableFuture<Void> getOpeningBlocker() {
        return this.mWaitForOtherSessionCompleteQuirk.getStartStreamFuture();
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSessionBaseImpl, androidx.camera.camera2.internal.SynchronizedCaptureSessionOpener.OpenerImpl
    public ListenableFuture<List<Surface>> startWithDeferrableSurface(List<DeferrableSurface> deferrableSurfaces, long timeout) {
        ListenableFuture<List<Surface>> startWithDeferrableSurface;
        synchronized (this.mObjectLock) {
            this.mDeferrableSurfaces = deferrableSurfaces;
            startWithDeferrableSurface = super.startWithDeferrableSurface(deferrableSurfaces, timeout);
        }
        return startWithDeferrableSurface;
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSessionBaseImpl, androidx.camera.camera2.internal.SynchronizedCaptureSessionOpener.OpenerImpl
    public boolean stop() {
        boolean stop;
        synchronized (this.mObjectLock) {
            if (isCameraCaptureSessionOpen()) {
                this.mCloseSurfaceQuirk.onSessionEnd(this.mDeferrableSurfaces);
            } else if (this.mOpeningCaptureSession != null) {
                this.mOpeningCaptureSession.cancel(true);
            }
            stop = super.stop();
        }
        return stop;
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSessionBaseImpl, androidx.camera.camera2.internal.SynchronizedCaptureSession
    public int setSingleRepeatingRequest(CaptureRequest request, CameraCaptureSession.CaptureCallback listener) throws CameraAccessException {
        return this.mWaitForOtherSessionCompleteQuirk.setSingleRepeatingRequest(request, listener, new WaitForRepeatingRequestStart.SingleRepeatingRequest() { // from class: androidx.camera.camera2.internal.SynchronizedCaptureSessionImpl$$ExternalSyntheticLambda0
            @Override // androidx.camera.camera2.internal.compat.workaround.WaitForRepeatingRequestStart.SingleRepeatingRequest
            public final int run(CaptureRequest captureRequest, CameraCaptureSession.CaptureCallback captureCallback) {
                return SynchronizedCaptureSessionImpl.this.m65x8c3ed34e(captureRequest, captureCallback);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$setSingleRepeatingRequest$1$androidx-camera-camera2-internal-SynchronizedCaptureSessionImpl  reason: not valid java name */
    public /* synthetic */ int m65x8c3ed34e(CaptureRequest x$0, CameraCaptureSession.CaptureCallback x$1) throws CameraAccessException {
        return super.setSingleRepeatingRequest(x$0, x$1);
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSessionBaseImpl, androidx.camera.camera2.internal.SynchronizedCaptureSession.StateCallback
    public void onConfigured(SynchronizedCaptureSession session) {
        debugLog("Session onConfigured()");
        this.mForceCloseSessionQuirk.onSessionConfigured(session, this.mCaptureSessionRepository.getCreatingCaptureSessions(), this.mCaptureSessionRepository.getCaptureSessions(), new ForceCloseCaptureSession.OnConfigured() { // from class: androidx.camera.camera2.internal.SynchronizedCaptureSessionImpl$$ExternalSyntheticLambda1
            @Override // androidx.camera.camera2.internal.compat.workaround.ForceCloseCaptureSession.OnConfigured
            public final void run(SynchronizedCaptureSession synchronizedCaptureSession) {
                SynchronizedCaptureSessionImpl.this.m63xf1a34454(synchronizedCaptureSession);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$onConfigured$2$androidx-camera-camera2-internal-SynchronizedCaptureSessionImpl  reason: not valid java name */
    public /* synthetic */ void m63xf1a34454(SynchronizedCaptureSession x$0) {
        super.onConfigured(x$0);
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSessionBaseImpl, androidx.camera.camera2.internal.SynchronizedCaptureSession
    public void close() {
        debugLog("Session call close()");
        this.mWaitForOtherSessionCompleteQuirk.onSessionEnd();
        this.mWaitForOtherSessionCompleteQuirk.getStartStreamFuture().addListener(new Runnable() { // from class: androidx.camera.camera2.internal.SynchronizedCaptureSessionImpl$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() {
                SynchronizedCaptureSessionImpl.this.m62x47c7bbb6();
            }
        }, getExecutor());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$close$3$androidx-camera-camera2-internal-SynchronizedCaptureSessionImpl  reason: not valid java name */
    public /* synthetic */ void m62x47c7bbb6() {
        debugLog("Session call super.close()");
        super.close();
    }

    @Override // androidx.camera.camera2.internal.SynchronizedCaptureSessionBaseImpl, androidx.camera.camera2.internal.SynchronizedCaptureSession.StateCallback
    public void onClosed(SynchronizedCaptureSession session) {
        synchronized (this.mObjectLock) {
            this.mCloseSurfaceQuirk.onSessionEnd(this.mDeferrableSurfaces);
        }
        debugLog("onClosed()");
        super.onClosed(session);
    }

    void debugLog(String message) {
        Logger.d(TAG, "[" + this + "] " + message);
    }
}
