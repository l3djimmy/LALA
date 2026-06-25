package androidx.camera.core.impl;
/* loaded from: classes.dex */
public abstract class Identifier {
    public abstract Object getValue();

    public static Identifier create(Object value) {
        return new AutoValue_Identifier(value);
    }
}
