package androidx.camera.camera2.internal;

import android.hardware.camera2.CameraDevice;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Executor;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class CaptureSessionRepository {
    final Executor mExecutor;
    final Object mLock = new Object();
    final Set<SynchronizedCaptureSession> mCaptureSessions = new LinkedHashSet();
    final Set<SynchronizedCaptureSession> mClosingCaptureSession = new LinkedHashSet();
    final Set<SynchronizedCaptureSession> mCreatingCaptureSessions = new LinkedHashSet();
    private final CameraDevice.StateCallback mCameraStateCallback = new AnonymousClass1();

    /* JADX INFO: Access modifiers changed from: package-private */
    public CaptureSessionRepository(Executor executor) {
        this.mExecutor = executor;
    }

    /* renamed from: androidx.camera.camera2.internal.CaptureSessionRepository$1  reason: invalid class name */
    /* loaded from: classes.dex */
    class AnonymousClass1 extends CameraDevice.StateCallback {
        AnonymousClass1() {
        }

        @Override // android.hardware.camera2.CameraDevice.StateCallback
        public void onOpened(CameraDevice camera) {
        }

        @Override // android.hardware.camera2.CameraDevice.StateCallback
        public void onError(CameraDevice camera, int error) {
            forceOnClosedCaptureSessions();
            cameraClosed();
        }

        @Override // android.hardware.camera2.CameraDevice.StateCallback
        public void onClosed(CameraDevice camera) {
            cameraClosed();
        }

        @Override // android.hardware.camera2.CameraDevice.StateCallback
        public void onDisconnected(CameraDevice camera) {
            forceOnClosedCaptureSessions();
            cameraClosed();
        }

        private void forceOnClosedCaptureSessions() {
            final LinkedHashSet<SynchronizedCaptureSession> sessions = new LinkedHashSet<>();
            synchronized (CaptureSessionRepository.this.mLock) {
                sessions.addAll(CaptureSessionRepository.this.mCreatingCaptureSessions);
                sessions.addAll(CaptureSessionRepository.this.mCaptureSessions);
            }
            CaptureSessionRepository.this.mExecutor.execute(new Runnable() { // from class: androidx.camera.camera2.internal.CaptureSessionRepository$1$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    CaptureSessionRepository.forceOnClosed(sessions);
                }
            });
        }

        private void cameraClosed() {
            List<SynchronizedCaptureSession> sessions;
            synchronized (CaptureSessionRepository.this.mLock) {
                sessions = CaptureSessionRepository.this.getSessionsInOrder();
                CaptureSessionRepository.this.mCreatingCaptureSessions.clear();
                CaptureSessionRepository.this.mCaptureSessions.clear();
                CaptureSessionRepository.this.mClosingCaptureSession.clear();
            }
            for (SynchronizedCaptureSession s : sessions) {
                s.finishClose();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public CameraDevice.StateCallback getCameraStateCallback() {
        return this.mCameraStateCallback;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void forceOnClosed(Set<SynchronizedCaptureSession> sessions) {
        for (SynchronizedCaptureSession session : sessions) {
            session.getStateCallback().onClosed(session);
        }
    }

    private void forceFinishCloseStaleSessions(SynchronizedCaptureSession session) {
        SynchronizedCaptureSession s;
        List<SynchronizedCaptureSession> sessions = getSessionsInOrder();
        Iterator<SynchronizedCaptureSession> it = sessions.iterator();
        while (it.hasNext() && (s = it.next()) != session) {
            s.finishClose();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public List<SynchronizedCaptureSession> getCaptureSessions() {
        ArrayList arrayList;
        synchronized (this.mLock) {
            arrayList = new ArrayList(this.mCaptureSessions);
        }
        return arrayList;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public List<SynchronizedCaptureSession> getClosingCaptureSession() {
        ArrayList arrayList;
        synchronized (this.mLock) {
            arrayList = new ArrayList(this.mClosingCaptureSession);
        }
        return arrayList;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public List<SynchronizedCaptureSession> getCreatingCaptureSessions() {
        ArrayList arrayList;
        synchronized (this.mLock) {
            arrayList = new ArrayList(this.mCreatingCaptureSessions);
        }
        return arrayList;
    }

    List<SynchronizedCaptureSession> getSessionsInOrder() {
        List<SynchronizedCaptureSession> sessions;
        synchronized (this.mLock) {
            sessions = new ArrayList<>();
            sessions.addAll(getCaptureSessions());
            sessions.addAll(getCreatingCaptureSessions());
        }
        return sessions;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void onCreateCaptureSession(SynchronizedCaptureSession synchronizedCaptureSession) {
        synchronized (this.mLock) {
            this.mCreatingCaptureSessions.add(synchronizedCaptureSession);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void onCaptureSessionConfigureFail(SynchronizedCaptureSession synchronizedCaptureSession) {
        forceFinishCloseStaleSessions(synchronizedCaptureSession);
        synchronized (this.mLock) {
            this.mCreatingCaptureSessions.remove(synchronizedCaptureSession);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void onCaptureSessionCreated(SynchronizedCaptureSession synchronizedCaptureSession) {
        synchronized (this.mLock) {
            this.mCaptureSessions.add(synchronizedCaptureSession);
            this.mCreatingCaptureSessions.remove(synchronizedCaptureSession);
        }
        forceFinishCloseStaleSessions(synchronizedCaptureSession);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void onCaptureSessionClosed(SynchronizedCaptureSession synchronizedCaptureSession) {
        synchronized (this.mLock) {
            this.mCaptureSessions.remove(synchronizedCaptureSession);
            this.mClosingCaptureSession.remove(synchronizedCaptureSession);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void onCaptureSessionClosing(SynchronizedCaptureSession synchronizedCaptureSession) {
        synchronized (this.mLock) {
            this.mClosingCaptureSession.add(synchronizedCaptureSession);
        }
    }
}
