package androidx.camera.core.impl;
/* loaded from: classes.dex */
final class AutoValue_DeviceProperties extends DeviceProperties {
    private final String manufacturer;
    private final String model;
    private final int sdkVersion;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_DeviceProperties(String manufacturer, String model, int sdkVersion) {
        if (manufacturer == null) {
            throw new NullPointerException("Null manufacturer");
        }
        this.manufacturer = manufacturer;
        if (model == null) {
            throw new NullPointerException("Null model");
        }
        this.model = model;
        this.sdkVersion = sdkVersion;
    }

    @Override // androidx.camera.core.impl.DeviceProperties
    public String manufacturer() {
        return this.manufacturer;
    }

    @Override // androidx.camera.core.impl.DeviceProperties
    public String model() {
        return this.model;
    }

    @Override // androidx.camera.core.impl.DeviceProperties
    public int sdkVersion() {
        return this.sdkVersion;
    }

    public String toString() {
        return "DeviceProperties{manufacturer=" + this.manufacturer + ", model=" + this.model + ", sdkVersion=" + this.sdkVersion + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof DeviceProperties) {
            DeviceProperties that = (DeviceProperties) o;
            return this.manufacturer.equals(that.manufacturer()) && this.model.equals(that.model()) && this.sdkVersion == that.sdkVersion();
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((h$ ^ this.manufacturer.hashCode()) * 1000003) ^ this.model.hashCode()) * 1000003) ^ this.sdkVersion;
    }
}
