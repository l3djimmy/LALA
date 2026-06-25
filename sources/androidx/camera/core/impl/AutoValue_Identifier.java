package androidx.camera.core.impl;
/* loaded from: classes.dex */
final class AutoValue_Identifier extends Identifier {
    private final Object value;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_Identifier(Object value) {
        if (value == null) {
            throw new NullPointerException("Null value");
        }
        this.value = value;
    }

    @Override // androidx.camera.core.impl.Identifier
    public Object getValue() {
        return this.value;
    }

    public String toString() {
        return "Identifier{value=" + this.value + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof Identifier) {
            Identifier that = (Identifier) o;
            return this.value.equals(that.getValue());
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return h$ ^ this.value.hashCode();
    }
}
