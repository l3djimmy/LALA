package androidx.camera.core.impl;
/* loaded from: classes.dex */
public interface EncoderProfilesProvider {
    public static final EncoderProfilesProvider EMPTY = new EncoderProfilesProvider() { // from class: androidx.camera.core.impl.EncoderProfilesProvider.1
        @Override // androidx.camera.core.impl.EncoderProfilesProvider
        public boolean hasProfile(int quality) {
            return false;
        }

        @Override // androidx.camera.core.impl.EncoderProfilesProvider
        public EncoderProfilesProxy getAll(int quality) {
            return null;
        }
    };

    EncoderProfilesProxy getAll(int i);

    boolean hasProfile(int i);
}
