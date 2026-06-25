package androidx.camera.core.impl;

import android.hardware.camera2.CaptureResult;
import android.util.Pair;
import androidx.camera.core.CameraInfo;
import java.util.Collections;
import java.util.Map;
import java.util.Set;
/* loaded from: classes.dex */
public interface SessionProcessor {
    void abortCapture(int i);

    void deInitSession();

    SessionConfig initSession(CameraInfo cameraInfo, OutputSurface outputSurface, OutputSurface outputSurface2, OutputSurface outputSurface3);

    void onCaptureSessionEnd();

    void onCaptureSessionStart(RequestProcessor requestProcessor);

    void setParameters(Config config);

    int startCapture(CaptureCallback captureCallback);

    int startRepeating(CaptureCallback captureCallback);

    void stopRepeating();

    default int startTrigger(Config config, CaptureCallback callback) {
        return -1;
    }

    default Set<Integer> getSupportedCameraOperations() {
        return Collections.emptySet();
    }

    default Pair<Long, Long> getRealtimeCaptureLatency() {
        return null;
    }

    /* loaded from: classes.dex */
    public interface CaptureCallback {
        default void onCaptureStarted(int captureSequenceId, long timestamp) {
        }

        default void onCaptureProcessStarted(int captureSequenceId) {
        }

        default void onCaptureFailed(int captureSequenceId) {
        }

        default void onCaptureSequenceCompleted(int captureSequenceId) {
        }

        default void onCaptureSequenceAborted(int captureSequenceId) {
        }

        default void onCaptureCompleted(long timestamp, int captureSequenceId, Map<CaptureResult.Key, Object> result) {
        }
    }
}
