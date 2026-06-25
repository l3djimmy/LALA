package androidx.camera.core;

import android.view.Surface;
import androidx.camera.core.SurfaceRequest;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class AutoValue_SurfaceRequest_Result extends SurfaceRequest.Result {
    private final int resultCode;
    private final Surface surface;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_SurfaceRequest_Result(int resultCode, Surface surface) {
        this.resultCode = resultCode;
        if (surface == null) {
            throw new NullPointerException("Null surface");
        }
        this.surface = surface;
    }

    @Override // androidx.camera.core.SurfaceRequest.Result
    public int getResultCode() {
        return this.resultCode;
    }

    @Override // androidx.camera.core.SurfaceRequest.Result
    public Surface getSurface() {
        return this.surface;
    }

    public String toString() {
        return "Result{resultCode=" + this.resultCode + ", surface=" + this.surface + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof SurfaceRequest.Result) {
            SurfaceRequest.Result that = (SurfaceRequest.Result) o;
            return this.resultCode == that.getResultCode() && this.surface.equals(that.getSurface());
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((h$ ^ this.resultCode) * 1000003) ^ this.surface.hashCode();
    }
}
