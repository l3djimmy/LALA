package androidx.camera.camera2.internal;

import android.hardware.camera2.CameraDevice;
import android.os.Handler;
import android.view.Surface;
import androidx.camera.camera2.internal.SynchronizedCaptureSession;
import androidx.camera.camera2.internal.compat.params.OutputConfigurationCompat;
import androidx.camera.camera2.internal.compat.params.SessionConfigurationCompat;
import androidx.camera.camera2.internal.compat.workaround.ForceCloseCaptureSession;
import androidx.camera.camera2.internal.compat.workaround.ForceCloseDeferrableSurface;
import androidx.camera.camera2.internal.compat.workaround.WaitForRepeatingRequestStart;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.Quirks;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledExecutorService;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class SynchronizedCaptureSessionOpener {
    private final OpenerImpl mImpl;

    /* loaded from: classes.dex */
    interface OpenerImpl {
        SessionConfigurationCompat createSessionConfigurationCompat(int i, List<OutputConfigurationCompat> list, SynchronizedCaptureSession.StateCallback stateCallback);

        Executor getExecutor();

        ListenableFuture<Void> openCaptureSession(CameraDevice cameraDevice, SessionConfigurationCompat sessionConfigurationCompat, List<DeferrableSurface> list);

        ListenableFuture<List<Surface>> startWithDeferrableSurface(List<DeferrableSurface> list, long j);

        boolean stop();
    }

    SynchronizedCaptureSessionOpener(OpenerImpl impl) {
        this.mImpl = impl;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ListenableFuture<Void> openCaptureSession(CameraDevice cameraDevice, SessionConfigurationCompat sessionConfigurationCompat, List<DeferrableSurface> deferrableSurfaces) {
        return this.mImpl.openCaptureSession(cameraDevice, sessionConfigurationCompat, deferrableSurfaces);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public SessionConfigurationCompat createSessionConfigurationCompat(int sessionType, List<OutputConfigurationCompat> outputsCompat, SynchronizedCaptureSession.StateCallback stateCallback) {
        return this.mImpl.createSessionConfigurationCompat(sessionType, outputsCompat, stateCallback);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ListenableFuture<List<Surface>> startWithDeferrableSurface(List<DeferrableSurface> deferrableSurfaces, long timeout) {
        return this.mImpl.startWithDeferrableSurface(deferrableSurfaces, timeout);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean stop() {
        return this.mImpl.stop();
    }

    public Executor getExecutor() {
        return this.mImpl.getExecutor();
    }

    /* loaded from: classes.dex */
    static class Builder {
        private final Quirks mCameraQuirks;
        private final CaptureSessionRepository mCaptureSessionRepository;
        private final Handler mCompatHandler;
        private final Quirks mDeviceQuirks;
        private final Executor mExecutor;
        private final boolean mQuirkExist;
        private final ScheduledExecutorService mScheduledExecutorService;

        /* JADX INFO: Access modifiers changed from: package-private */
        public Builder(Executor executor, ScheduledExecutorService scheduledExecutorService, Handler compatHandler, CaptureSessionRepository captureSessionRepository, Quirks cameraQuirks, Quirks deviceQuirks) {
            this.mExecutor = executor;
            this.mScheduledExecutorService = scheduledExecutorService;
            this.mCompatHandler = compatHandler;
            this.mCaptureSessionRepository = captureSessionRepository;
            this.mCameraQuirks = cameraQuirks;
            this.mDeviceQuirks = deviceQuirks;
            this.mQuirkExist = new ForceCloseDeferrableSurface(this.mCameraQuirks, this.mDeviceQuirks).shouldForceClose() || new WaitForRepeatingRequestStart(this.mCameraQuirks).shouldWaitRepeatingSubmit() || new ForceCloseCaptureSession(this.mDeviceQuirks).shouldForceClose();
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public SynchronizedCaptureSessionOpener build() {
            return new SynchronizedCaptureSessionOpener(this.mQuirkExist ? new SynchronizedCaptureSessionImpl(this.mCameraQuirks, this.mDeviceQuirks, this.mCaptureSessionRepository, this.mExecutor, this.mScheduledExecutorService, this.mCompatHandler) : new SynchronizedCaptureSessionBaseImpl(this.mCaptureSessionRepository, this.mExecutor, this.mScheduledExecutorService, this.mCompatHandler));
        }
    }
}
