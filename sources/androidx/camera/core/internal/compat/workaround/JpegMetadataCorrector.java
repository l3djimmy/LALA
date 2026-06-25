package androidx.camera.core.internal.compat.workaround;

import androidx.camera.core.ImageProxy;
import androidx.camera.core.impl.Quirks;
import androidx.camera.core.internal.compat.quirk.IncorrectJpegMetadataQuirk;
import java.nio.ByteBuffer;
/* loaded from: classes.dex */
public class JpegMetadataCorrector {
    private final IncorrectJpegMetadataQuirk mQuirk;

    public JpegMetadataCorrector(Quirks quirks) {
        this.mQuirk = (IncorrectJpegMetadataQuirk) quirks.get(IncorrectJpegMetadataQuirk.class);
    }

    public boolean needCorrectJpegMetadata() {
        return this.mQuirk != null;
    }

    public byte[] jpegImageToJpegByteArray(ImageProxy image) {
        if (this.mQuirk == null) {
            ImageProxy.PlaneProxy[] planes = image.getPlanes();
            ByteBuffer buffer = planes[0].getBuffer();
            byte[] data = new byte[buffer.capacity()];
            buffer.rewind();
            buffer.get(data);
            return data;
        }
        return this.mQuirk.jpegImageToJpegByteArray(image);
    }
}
