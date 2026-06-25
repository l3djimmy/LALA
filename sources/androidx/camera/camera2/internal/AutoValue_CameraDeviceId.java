package androidx.camera.camera2.internal;
/* loaded from: classes.dex */
final class AutoValue_CameraDeviceId extends CameraDeviceId {
    private final String brand;
    private final String cameraId;
    private final String device;
    private final String model;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_CameraDeviceId(String brand, String device, String model, String cameraId) {
        if (brand == null) {
            throw new NullPointerException("Null brand");
        }
        this.brand = brand;
        if (device == null) {
            throw new NullPointerException("Null device");
        }
        this.device = device;
        if (model == null) {
            throw new NullPointerException("Null model");
        }
        this.model = model;
        if (cameraId == null) {
            throw new NullPointerException("Null cameraId");
        }
        this.cameraId = cameraId;
    }

    @Override // androidx.camera.camera2.internal.CameraDeviceId
    public String getBrand() {
        return this.brand;
    }

    @Override // androidx.camera.camera2.internal.CameraDeviceId
    public String getDevice() {
        return this.device;
    }

    @Override // androidx.camera.camera2.internal.CameraDeviceId
    public String getModel() {
        return this.model;
    }

    @Override // androidx.camera.camera2.internal.CameraDeviceId
    public String getCameraId() {
        return this.cameraId;
    }

    public String toString() {
        return "CameraDeviceId{brand=" + this.brand + ", device=" + this.device + ", model=" + this.model + ", cameraId=" + this.cameraId + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof CameraDeviceId) {
            CameraDeviceId that = (CameraDeviceId) o;
            return this.brand.equals(that.getBrand()) && this.device.equals(that.getDevice()) && this.model.equals(that.getModel()) && this.cameraId.equals(that.getCameraId());
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((h$ ^ this.brand.hashCode()) * 1000003) ^ this.device.hashCode()) * 1000003) ^ this.model.hashCode()) * 1000003) ^ this.cameraId.hashCode();
    }
}
