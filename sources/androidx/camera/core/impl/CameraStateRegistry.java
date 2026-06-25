package androidx.camera.core.impl;

import androidx.camera.core.Camera;
import androidx.camera.core.Logger;
import androidx.camera.core.concurrent.CameraCoordinator;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.CameraStateRegistry;
import androidx.core.util.Preconditions;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
/* loaded from: classes.dex */
public final class CameraStateRegistry implements CameraCoordinator.ConcurrentCameraModeListener {
    private static final int MAX_ALLOWED_CONCURRENT_CAMERAS_IN_CONCURRENT_MODE = 2;
    private static final int MAX_ALLOWED_CONCURRENT_CAMERAS_IN_SINGLE_MODE = 1;
    private static final String TAG = "CameraStateRegistry";
    private int mAvailableCameras;
    private final CameraCoordinator mCameraCoordinator;
    private int mMaxAllowedOpenedCameras;
    private final StringBuilder mDebugString = new StringBuilder();
    private final Object mLock = new Object();
    private final Map<Camera, CameraRegistration> mCameraStates = new HashMap();

    /* loaded from: classes.dex */
    public interface OnConfigureAvailableListener {
        void onConfigureAvailable();
    }

    /* loaded from: classes.dex */
    public interface OnOpenAvailableListener {
        void onOpenAvailable();
    }

    public CameraStateRegistry(CameraCoordinator cameraCoordinator, int maxAllowedOpenedCameras) {
        this.mMaxAllowedOpenedCameras = maxAllowedOpenedCameras;
        synchronized (this.mLock) {
            this.mCameraCoordinator = cameraCoordinator;
            this.mAvailableCameras = this.mMaxAllowedOpenedCameras;
        }
    }

    public void registerCamera(Camera camera, Executor notifyExecutor, OnConfigureAvailableListener onConfigureAvailableListener, OnOpenAvailableListener onOpenAvailableListener) {
        synchronized (this.mLock) {
            Preconditions.checkState(!this.mCameraStates.containsKey(camera), "Camera is already registered: " + camera);
            this.mCameraStates.put(camera, new CameraRegistration(null, notifyExecutor, onConfigureAvailableListener, onOpenAvailableListener));
        }
    }

    public boolean tryOpenCamera(Camera camera) {
        boolean success;
        synchronized (this.mLock) {
            CameraRegistration registration = (CameraRegistration) Preconditions.checkNotNull(this.mCameraStates.get(camera), "Camera must first be registered with registerCamera()");
            success = false;
            if (Logger.isDebugEnabled(TAG)) {
                this.mDebugString.setLength(0);
                this.mDebugString.append(String.format(Locale.US, "tryOpenCamera(%s) [Available Cameras: %d, Already Open: %b (Previous state: %s)]", camera, Integer.valueOf(this.mAvailableCameras), Boolean.valueOf(isOpen(registration.getState())), registration.getState()));
            }
            if (this.mAvailableCameras > 0 || isOpen(registration.getState())) {
                registration.setState(CameraInternal.State.OPENING);
                success = true;
            }
            if (Logger.isDebugEnabled(TAG)) {
                this.mDebugString.append(String.format(Locale.US, " --> %s", success ? "SUCCESS" : "FAIL"));
                Logger.d(TAG, this.mDebugString.toString());
            }
            if (success) {
                recalculateAvailableCameras();
            }
        }
        return success;
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x005d A[ADDED_TO_REGION] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean tryOpenCaptureSession(java.lang.String r8, java.lang.String r9) {
        /*
            r7 = this;
            java.lang.Object r0 = r7.mLock
            monitor-enter(r0)
            androidx.camera.core.concurrent.CameraCoordinator r1 = r7.mCameraCoordinator     // Catch: java.lang.Throwable -> L63
            int r1 = r1.getCameraOperatingMode()     // Catch: java.lang.Throwable -> L63
            r2 = 2
            r3 = 1
            if (r1 == r2) goto Lf
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L63
            return r3
        Lf:
            androidx.camera.core.impl.CameraStateRegistry$CameraRegistration r1 = r7.getCameraRegistration(r8)     // Catch: java.lang.Throwable -> L63
            r2 = 0
            if (r1 == 0) goto L1f
            androidx.camera.core.impl.CameraStateRegistry$CameraRegistration r1 = r7.getCameraRegistration(r8)     // Catch: java.lang.Throwable -> L63
            androidx.camera.core.impl.CameraInternal$State r1 = r1.getState()     // Catch: java.lang.Throwable -> L63
            goto L20
        L1f:
            r1 = r2
        L20:
            if (r9 == 0) goto L31
            androidx.camera.core.impl.CameraStateRegistry$CameraRegistration r4 = r7.getCameraRegistration(r9)     // Catch: java.lang.Throwable -> L63
            if (r4 == 0) goto L31
            androidx.camera.core.impl.CameraStateRegistry$CameraRegistration r2 = r7.getCameraRegistration(r9)     // Catch: java.lang.Throwable -> L63
            androidx.camera.core.impl.CameraInternal$State r2 = r2.getState()     // Catch: java.lang.Throwable -> L63
            goto L32
        L31:
        L32:
            androidx.camera.core.impl.CameraInternal$State r4 = androidx.camera.core.impl.CameraInternal.State.OPEN     // Catch: java.lang.Throwable -> L63
            boolean r4 = r4.equals(r1)     // Catch: java.lang.Throwable -> L63
            r5 = 0
            if (r4 != 0) goto L46
            androidx.camera.core.impl.CameraInternal$State r4 = androidx.camera.core.impl.CameraInternal.State.CONFIGURED     // Catch: java.lang.Throwable -> L63
            boolean r4 = r4.equals(r1)     // Catch: java.lang.Throwable -> L63
            if (r4 == 0) goto L44
            goto L46
        L44:
            r4 = r5
            goto L47
        L46:
            r4 = r3
        L47:
            androidx.camera.core.impl.CameraInternal$State r6 = androidx.camera.core.impl.CameraInternal.State.OPEN     // Catch: java.lang.Throwable -> L63
            boolean r6 = r6.equals(r2)     // Catch: java.lang.Throwable -> L63
            if (r6 != 0) goto L5a
            androidx.camera.core.impl.CameraInternal$State r6 = androidx.camera.core.impl.CameraInternal.State.CONFIGURED     // Catch: java.lang.Throwable -> L63
            boolean r6 = r6.equals(r2)     // Catch: java.lang.Throwable -> L63
            if (r6 == 0) goto L58
            goto L5a
        L58:
            r6 = r5
            goto L5b
        L5a:
            r6 = r3
        L5b:
            if (r4 == 0) goto L60
            if (r6 == 0) goto L60
            goto L61
        L60:
            r3 = r5
        L61:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L63
            return r3
        L63:
            r1 = move-exception
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L63
            throw r1
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.core.impl.CameraStateRegistry.tryOpenCaptureSession(java.lang.String, java.lang.String):boolean");
    }

    public void markCameraState(Camera camera, CameraInternal.State state) {
        markCameraState(camera, state, true);
    }

    public void markCameraState(Camera camera, CameraInternal.State state, boolean notifyImmediately) {
        CameraInternal.State previousState;
        Map<Camera, CameraRegistration> camerasToNotifyOpen = null;
        CameraRegistration cameraToNotifyConfigure = null;
        synchronized (this.mLock) {
            int previousAvailableCameras = this.mAvailableCameras;
            if (state == CameraInternal.State.RELEASED) {
                previousState = unregisterCamera(camera);
            } else {
                previousState = updateAndVerifyState(camera, state);
            }
            if (previousState == state) {
                return;
            }
            if (this.mCameraCoordinator.getCameraOperatingMode() == 2 && state == CameraInternal.State.CONFIGURED) {
                String cameraId = ((CameraInfoInternal) camera.getCameraInfo()).getCameraId();
                String pairedCameraId = this.mCameraCoordinator.getPairedConcurrentCameraId(cameraId);
                if (pairedCameraId != null) {
                    cameraToNotifyConfigure = getCameraRegistration(pairedCameraId);
                }
            }
            if (previousAvailableCameras < 1 && this.mAvailableCameras > 0) {
                camerasToNotifyOpen = new HashMap<>();
                for (Map.Entry<Camera, CameraRegistration> entry : this.mCameraStates.entrySet()) {
                    if (entry.getValue().getState() == CameraInternal.State.PENDING_OPEN) {
                        camerasToNotifyOpen.put(entry.getKey(), entry.getValue());
                    }
                }
            } else if (state == CameraInternal.State.PENDING_OPEN && this.mAvailableCameras > 0) {
                camerasToNotifyOpen = new HashMap<>();
                camerasToNotifyOpen.put(camera, this.mCameraStates.get(camera));
            }
            if (camerasToNotifyOpen != null && !notifyImmediately) {
                camerasToNotifyOpen.remove(camera);
            }
            if (camerasToNotifyOpen != null) {
                for (CameraRegistration registration : camerasToNotifyOpen.values()) {
                    registration.notifyOnOpenAvailableListener();
                }
            }
            if (cameraToNotifyConfigure != null) {
                cameraToNotifyConfigure.notifyOnConfigureAvailableListener();
            }
        }
    }

    @Override // androidx.camera.core.concurrent.CameraCoordinator.ConcurrentCameraModeListener
    public void onCameraOperatingModeUpdated(int prevMode, int currMode) {
        int i;
        boolean isConcurrentCameraModeOn;
        synchronized (this.mLock) {
            boolean isConcurrentCameraModeOff = true;
            if (currMode == 2) {
                i = 2;
            } else {
                i = 1;
            }
            this.mMaxAllowedOpenedCameras = i;
            if (prevMode != 2 && currMode == 2) {
                isConcurrentCameraModeOn = true;
            } else {
                isConcurrentCameraModeOn = false;
            }
            if (prevMode != 2 || currMode == 2) {
                isConcurrentCameraModeOff = false;
            }
            if (isConcurrentCameraModeOn || isConcurrentCameraModeOff) {
                recalculateAvailableCameras();
            }
        }
    }

    private CameraInternal.State unregisterCamera(Camera camera) {
        CameraRegistration registration = this.mCameraStates.remove(camera);
        if (registration != null) {
            recalculateAvailableCameras();
            return registration.getState();
        }
        return null;
    }

    private CameraInternal.State updateAndVerifyState(Camera camera, CameraInternal.State state) {
        CameraInternal.State previousState = ((CameraRegistration) Preconditions.checkNotNull(this.mCameraStates.get(camera), "Cannot update state of camera which has not yet been registered. Register with CameraStateRegistry.registerCamera()")).setState(state);
        if (state == CameraInternal.State.OPENING) {
            Preconditions.checkState(isOpen(state) || previousState == CameraInternal.State.OPENING, "Cannot mark camera as opening until camera was successful at calling CameraStateRegistry.tryOpenCamera()");
        }
        if (previousState != state) {
            recalculateAvailableCameras();
        }
        return previousState;
    }

    private static boolean isOpen(CameraInternal.State state) {
        return state != null && state.holdsCameraSlot();
    }

    private void recalculateAvailableCameras() {
        if (Logger.isDebugEnabled(TAG)) {
            this.mDebugString.setLength(0);
            this.mDebugString.append("Recalculating open cameras:\n");
            this.mDebugString.append(String.format(Locale.US, "%-45s%-22s\n", "Camera", "State"));
            this.mDebugString.append("-------------------------------------------------------------------\n");
        }
        int openCount = 0;
        for (Map.Entry<Camera, CameraRegistration> entry : this.mCameraStates.entrySet()) {
            if (Logger.isDebugEnabled(TAG)) {
                String stateString = entry.getValue().getState() != null ? entry.getValue().getState().toString() : "UNKNOWN";
                this.mDebugString.append(String.format(Locale.US, "%-45s%-22s\n", entry.getKey().toString(), stateString));
            }
            if (isOpen(entry.getValue().getState())) {
                openCount++;
            }
        }
        if (Logger.isDebugEnabled(TAG)) {
            this.mDebugString.append("-------------------------------------------------------------------\n");
            this.mDebugString.append(String.format(Locale.US, "Open count: %d (Max allowed: %d)", Integer.valueOf(openCount), Integer.valueOf(this.mMaxAllowedOpenedCameras)));
            Logger.d(TAG, this.mDebugString.toString());
        }
        this.mAvailableCameras = Math.max(this.mMaxAllowedOpenedCameras - openCount, 0);
    }

    public boolean isCameraClosing() {
        synchronized (this.mLock) {
            for (Map.Entry<Camera, CameraRegistration> entry : this.mCameraStates.entrySet()) {
                if (entry.getValue().getState() == CameraInternal.State.CLOSING) {
                    return true;
                }
            }
            return false;
        }
    }

    private CameraRegistration getCameraRegistration(String targetCameraId) {
        for (Camera camera : this.mCameraStates.keySet()) {
            String cameraId = ((CameraInfoInternal) camera.getCameraInfo()).getCameraId();
            if (targetCameraId.equals(cameraId)) {
                return this.mCameraStates.get(camera);
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class CameraRegistration {
        private final Executor mNotifyExecutor;
        private final OnConfigureAvailableListener mOnConfigureAvailableListener;
        private final OnOpenAvailableListener mOnOpenAvailableListener;
        private CameraInternal.State mState;

        CameraRegistration(CameraInternal.State initialState, Executor notifyExecutor, OnConfigureAvailableListener onConfigureAvailableListener, OnOpenAvailableListener onOpenAvailableListener) {
            this.mState = initialState;
            this.mNotifyExecutor = notifyExecutor;
            this.mOnConfigureAvailableListener = onConfigureAvailableListener;
            this.mOnOpenAvailableListener = onOpenAvailableListener;
        }

        CameraInternal.State setState(CameraInternal.State state) {
            CameraInternal.State previousState = this.mState;
            this.mState = state;
            return previousState;
        }

        CameraInternal.State getState() {
            return this.mState;
        }

        void notifyOnConfigureAvailableListener() {
            try {
                Executor executor = this.mNotifyExecutor;
                final OnConfigureAvailableListener onConfigureAvailableListener = this.mOnConfigureAvailableListener;
                Objects.requireNonNull(onConfigureAvailableListener);
                executor.execute(new Runnable() { // from class: androidx.camera.core.impl.CameraStateRegistry$CameraRegistration$$ExternalSyntheticLambda1
                    @Override // java.lang.Runnable
                    public final void run() {
                        CameraStateRegistry.OnConfigureAvailableListener.this.onConfigureAvailable();
                    }
                });
            } catch (RejectedExecutionException e) {
                Logger.e(CameraStateRegistry.TAG, "Unable to notify camera to configure.", e);
            }
        }

        void notifyOnOpenAvailableListener() {
            try {
                Executor executor = this.mNotifyExecutor;
                final OnOpenAvailableListener onOpenAvailableListener = this.mOnOpenAvailableListener;
                Objects.requireNonNull(onOpenAvailableListener);
                executor.execute(new Runnable() { // from class: androidx.camera.core.impl.CameraStateRegistry$CameraRegistration$$ExternalSyntheticLambda0
                    @Override // java.lang.Runnable
                    public final void run() {
                        CameraStateRegistry.OnOpenAvailableListener.this.onOpenAvailable();
                    }
                });
            } catch (RejectedExecutionException e) {
                Logger.e(CameraStateRegistry.TAG, "Unable to notify camera to open.", e);
            }
        }
    }
}
