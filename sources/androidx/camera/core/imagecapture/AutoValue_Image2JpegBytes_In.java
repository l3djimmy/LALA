package androidx.camera.core.imagecapture;

import androidx.camera.core.ImageProxy;
import androidx.camera.core.imagecapture.Image2JpegBytes;
import androidx.camera.core.processing.Packet;
/* loaded from: classes.dex */
final class AutoValue_Image2JpegBytes_In extends Image2JpegBytes.In {
    private final int jpegQuality;
    private final Packet<ImageProxy> packet;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_Image2JpegBytes_In(Packet<ImageProxy> packet, int jpegQuality) {
        if (packet == null) {
            throw new NullPointerException("Null packet");
        }
        this.packet = packet;
        this.jpegQuality = jpegQuality;
    }

    @Override // androidx.camera.core.imagecapture.Image2JpegBytes.In
    Packet<ImageProxy> getPacket() {
        return this.packet;
    }

    @Override // androidx.camera.core.imagecapture.Image2JpegBytes.In
    int getJpegQuality() {
        return this.jpegQuality;
    }

    public String toString() {
        return "In{packet=" + this.packet + ", jpegQuality=" + this.jpegQuality + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof Image2JpegBytes.In) {
            Image2JpegBytes.In that = (Image2JpegBytes.In) o;
            return this.packet.equals(that.getPacket()) && this.jpegQuality == that.getJpegQuality();
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((h$ ^ this.packet.hashCode()) * 1000003) ^ this.jpegQuality;
    }
}
