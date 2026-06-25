package androidx.camera.core.processing;

import androidx.camera.core.processing.DefaultSurfaceProcessor;
import androidx.concurrent.futures.CallbackToFutureAdapter;
/* loaded from: classes.dex */
final class AutoValue_DefaultSurfaceProcessor_PendingSnapshot extends DefaultSurfaceProcessor.PendingSnapshot {
    private final CallbackToFutureAdapter.Completer<Void> completer;
    private final int jpegQuality;
    private final int rotationDegrees;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_DefaultSurfaceProcessor_PendingSnapshot(int jpegQuality, int rotationDegrees, CallbackToFutureAdapter.Completer<Void> completer) {
        this.jpegQuality = jpegQuality;
        this.rotationDegrees = rotationDegrees;
        if (completer == null) {
            throw new NullPointerException("Null completer");
        }
        this.completer = completer;
    }

    @Override // androidx.camera.core.processing.DefaultSurfaceProcessor.PendingSnapshot
    int getJpegQuality() {
        return this.jpegQuality;
    }

    @Override // androidx.camera.core.processing.DefaultSurfaceProcessor.PendingSnapshot
    int getRotationDegrees() {
        return this.rotationDegrees;
    }

    @Override // androidx.camera.core.processing.DefaultSurfaceProcessor.PendingSnapshot
    CallbackToFutureAdapter.Completer<Void> getCompleter() {
        return this.completer;
    }

    public String toString() {
        return "PendingSnapshot{jpegQuality=" + this.jpegQuality + ", rotationDegrees=" + this.rotationDegrees + ", completer=" + this.completer + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof DefaultSurfaceProcessor.PendingSnapshot) {
            DefaultSurfaceProcessor.PendingSnapshot that = (DefaultSurfaceProcessor.PendingSnapshot) o;
            return this.jpegQuality == that.getJpegQuality() && this.rotationDegrees == that.getRotationDegrees() && this.completer.equals(that.getCompleter());
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((h$ ^ this.jpegQuality) * 1000003) ^ this.rotationDegrees) * 1000003) ^ this.completer.hashCode();
    }
}
