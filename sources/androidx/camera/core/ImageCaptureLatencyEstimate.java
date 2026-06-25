package androidx.camera.core;

import java.util.Objects;
/* loaded from: classes.dex */
public class ImageCaptureLatencyEstimate {
    public static final long UNDEFINED_CAPTURE_LATENCY = -1;
    public static final ImageCaptureLatencyEstimate UNDEFINED_IMAGE_CAPTURE_LATENCY = new ImageCaptureLatencyEstimate(-1, -1);
    public static final long UNDEFINED_PROCESSING_LATENCY = -1;
    public final long captureLatencyMillis;
    public final long processingLatencyMillis;

    /* JADX INFO: Access modifiers changed from: package-private */
    public ImageCaptureLatencyEstimate(long captureLatencyMillis, long processingLatencyMillis) {
        this.captureLatencyMillis = captureLatencyMillis;
        this.processingLatencyMillis = processingLatencyMillis;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o instanceof ImageCaptureLatencyEstimate) {
            ImageCaptureLatencyEstimate that = (ImageCaptureLatencyEstimate) o;
            return this.captureLatencyMillis == that.captureLatencyMillis && this.processingLatencyMillis == that.processingLatencyMillis;
        }
        return false;
    }

    public int hashCode() {
        return Objects.hash(Long.valueOf(this.captureLatencyMillis), Long.valueOf(this.processingLatencyMillis));
    }

    public String toString() {
        return "captureLatencyMillis=" + this.captureLatencyMillis + ", processingLatencyMillis=" + this.processingLatencyMillis;
    }
}
