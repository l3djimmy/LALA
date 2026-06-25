package androidx.camera.video;

import androidx.camera.video.Quality;
/* loaded from: classes.dex */
final class AutoValue_Quality_ConstantQuality extends Quality.ConstantQuality {
    private final String name;
    private final int value;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_Quality_ConstantQuality(int value, String name) {
        this.value = value;
        if (name == null) {
            throw new NullPointerException("Null name");
        }
        this.name = name;
    }

    @Override // androidx.camera.video.Quality.ConstantQuality
    int getValue() {
        return this.value;
    }

    @Override // androidx.camera.video.Quality.ConstantQuality
    String getName() {
        return this.name;
    }

    public String toString() {
        return "ConstantQuality{value=" + this.value + ", name=" + this.name + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof Quality.ConstantQuality) {
            Quality.ConstantQuality that = (Quality.ConstantQuality) o;
            return this.value == that.getValue() && this.name.equals(that.getName());
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((h$ ^ this.value) * 1000003) ^ this.name.hashCode();
    }
}
