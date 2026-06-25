package androidx.camera.video.internal.encoder;
/* loaded from: classes.dex */
final class AutoValue_VideoEncoderDataSpace extends VideoEncoderDataSpace {
    private final int range;
    private final int standard;
    private final int transfer;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_VideoEncoderDataSpace(int standard, int transfer, int range) {
        this.standard = standard;
        this.transfer = transfer;
        this.range = range;
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderDataSpace
    public int getStandard() {
        return this.standard;
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderDataSpace
    public int getTransfer() {
        return this.transfer;
    }

    @Override // androidx.camera.video.internal.encoder.VideoEncoderDataSpace
    public int getRange() {
        return this.range;
    }

    public String toString() {
        return "VideoEncoderDataSpace{standard=" + this.standard + ", transfer=" + this.transfer + ", range=" + this.range + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof VideoEncoderDataSpace) {
            VideoEncoderDataSpace that = (VideoEncoderDataSpace) o;
            return this.standard == that.getStandard() && this.transfer == that.getTransfer() && this.range == that.getRange();
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((h$ ^ this.standard) * 1000003) ^ this.transfer) * 1000003) ^ this.range;
    }
}
