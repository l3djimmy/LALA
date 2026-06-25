package androidx.camera.core.impl;

import androidx.camera.core.impl.Config;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class AutoValue_Config_Option<T> extends Config.Option<T> {
    private final String id;
    private final Object token;
    private final Class<T> valueClass;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_Config_Option(String id, Class<T> valueClass, Object token) {
        if (id == null) {
            throw new NullPointerException("Null id");
        }
        this.id = id;
        if (valueClass == null) {
            throw new NullPointerException("Null valueClass");
        }
        this.valueClass = valueClass;
        this.token = token;
    }

    @Override // androidx.camera.core.impl.Config.Option
    public String getId() {
        return this.id;
    }

    @Override // androidx.camera.core.impl.Config.Option
    public Class<T> getValueClass() {
        return this.valueClass;
    }

    @Override // androidx.camera.core.impl.Config.Option
    public Object getToken() {
        return this.token;
    }

    public String toString() {
        return "Option{id=" + this.id + ", valueClass=" + this.valueClass + ", token=" + this.token + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof Config.Option) {
            Config.Option<?> that = (Config.Option) o;
            if (this.id.equals(that.getId()) && this.valueClass.equals(that.getValueClass())) {
                if (this.token == null) {
                    if (that.getToken() == null) {
                        return true;
                    }
                } else if (this.token.equals(that.getToken())) {
                    return true;
                }
            }
            return false;
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((h$ ^ this.id.hashCode()) * 1000003) ^ this.valueClass.hashCode()) * 1000003) ^ (this.token == null ? 0 : this.token.hashCode());
    }
}
