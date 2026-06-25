package androidx.camera.core.imagecapture;

import android.graphics.Bitmap;
import androidx.camera.core.imagecapture.Bitmap2JpegBytes;
import androidx.camera.core.processing.Packet;
/* loaded from: classes.dex */
final class AutoValue_Bitmap2JpegBytes_In extends Bitmap2JpegBytes.In {
    private final int jpegQuality;
    private final Packet<Bitmap> packet;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_Bitmap2JpegBytes_In(Packet<Bitmap> packet, int jpegQuality) {
        if (packet == null) {
            throw new NullPointerException("Null packet");
        }
        this.packet = packet;
        this.jpegQuality = jpegQuality;
    }

    @Override // androidx.camera.core.imagecapture.Bitmap2JpegBytes.In
    Packet<Bitmap> getPacket() {
        return this.packet;
    }

    @Override // androidx.camera.core.imagecapture.Bitmap2JpegBytes.In
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
        if (o instanceof Bitmap2JpegBytes.In) {
            Bitmap2JpegBytes.In that = (Bitmap2JpegBytes.In) o;
            return this.packet.equals(that.getPacket()) && this.jpegQuality == that.getJpegQuality();
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((h$ ^ this.packet.hashCode()) * 1000003) ^ this.jpegQuality;
    }
}
