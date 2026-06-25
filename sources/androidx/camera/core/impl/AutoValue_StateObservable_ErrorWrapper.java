package androidx.camera.core.impl;

import androidx.camera.core.impl.StateObservable;
/* loaded from: classes.dex */
final class AutoValue_StateObservable_ErrorWrapper extends StateObservable.ErrorWrapper {
    private final Throwable error;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_StateObservable_ErrorWrapper(Throwable error) {
        if (error == null) {
            throw new NullPointerException("Null error");
        }
        this.error = error;
    }

    @Override // androidx.camera.core.impl.StateObservable.ErrorWrapper
    public Throwable getError() {
        return this.error;
    }

    public String toString() {
        return "ErrorWrapper{error=" + this.error + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof StateObservable.ErrorWrapper) {
            StateObservable.ErrorWrapper that = (StateObservable.ErrorWrapper) o;
            return this.error.equals(that.getError());
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return h$ ^ this.error.hashCode();
    }
}
