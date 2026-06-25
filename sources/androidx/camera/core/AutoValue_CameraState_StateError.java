package androidx.camera.core;

import androidx.camera.core.CameraState;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class AutoValue_CameraState_StateError extends CameraState.StateError {
    private final Throwable cause;
    private final int code;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_CameraState_StateError(int code, Throwable cause) {
        this.code = code;
        this.cause = cause;
    }

    @Override // androidx.camera.core.CameraState.StateError
    public int getCode() {
        return this.code;
    }

    @Override // androidx.camera.core.CameraState.StateError
    public Throwable getCause() {
        return this.cause;
    }

    public String toString() {
        return "StateError{code=" + this.code + ", cause=" + this.cause + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof CameraState.StateError) {
            CameraState.StateError that = (CameraState.StateError) o;
            if (this.code == that.getCode()) {
                if (this.cause == null) {
                    if (that.getCause() == null) {
                        return true;
                    }
                } else if (this.cause.equals(that.getCause())) {
                    return true;
                }
            }
            return false;
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((h$ ^ this.code) * 1000003) ^ (this.cause == null ? 0 : this.cause.hashCode());
    }
}
