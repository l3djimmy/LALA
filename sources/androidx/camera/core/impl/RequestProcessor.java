package androidx.camera.core.impl;

import java.util.List;
/* loaded from: classes.dex */
public interface RequestProcessor {

    /* loaded from: classes.dex */
    public interface Request {
        Config getParameters();

        List<Integer> getTargetOutputConfigIds();

        int getTemplateId();
    }

    void abortCaptures();

    int setRepeating(Request request, Callback callback);

    void stopRepeating();

    int submit(Request request, Callback callback);

    int submit(List<Request> list, Callback callback);

    /* loaded from: classes.dex */
    public interface Callback {
        default void onCaptureStarted(Request request, long frameNumber, long timestamp) {
        }

        default void onCaptureProgressed(Request request, CameraCaptureResult captureResult) {
        }

        default void onCaptureCompleted(Request request, CameraCaptureResult captureResult) {
        }

        default void onCaptureFailed(Request request, CameraCaptureFailure captureFailure) {
        }

        default void onCaptureBufferLost(Request request, long frameNumber, int outputConfigId) {
        }

        default void onCaptureSequenceCompleted(int sequenceId, long frameNumber) {
        }

        default void onCaptureSequenceAborted(int sequenceId) {
        }
    }
}
