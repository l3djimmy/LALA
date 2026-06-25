package androidx.camera.core;

import androidx.camera.core.CameraState;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class AutoValue_CameraState extends CameraState {
    private final CameraState.StateError error;
    private final CameraState.Type type;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_CameraState(CameraState.Type type, CameraState.StateError error) {
        if (type == null) {
            throw new NullPointerException("Null type");
        }
        this.type = type;
        this.error = error;
    }

    @Override // androidx.camera.core.CameraState
    public CameraState.Type getType() {
        return this.type;
    }

    @Override // androidx.camera.core.CameraState
    public CameraState.StateError getError() {
        return this.error;
    }

    public String toString() {
        return "CameraState{type=" + this.type + ", error=" + this.error + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof CameraState) {
            CameraState that = (CameraState) o;
            if (this.type.equals(that.getType())) {
                if (this.error == null) {
                    if (that.getError() == null) {
                        return true;
                    }
                } else if (this.error.equals(that.getError())) {
                    return true;
                }
            }
            return false;
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((h$ ^ this.type.hashCode()) * 1000003) ^ (this.error == null ? 0 : this.error.hashCode());
    }
}
