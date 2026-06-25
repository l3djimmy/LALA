package androidx.camera.core.imagecapture;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapRegionDecoder;
import android.graphics.Rect;
import androidx.camera.core.ImageCaptureException;
import androidx.camera.core.impl.utils.Exif;
import androidx.camera.core.impl.utils.TransformUtils;
import androidx.camera.core.processing.Operation;
import androidx.camera.core.processing.Packet;
import java.io.IOException;
import java.util.Objects;
/* loaded from: classes.dex */
final class JpegBytes2CroppedBitmap implements Operation<Packet<byte[]>, Packet<Bitmap>> {
    @Override // androidx.camera.core.processing.Operation
    public Packet<Bitmap> apply(Packet<byte[]> packet) throws ImageCaptureException {
        Rect cropRect = packet.getCropRect();
        Bitmap bitmap = createCroppedBitmap(packet.getData(), cropRect);
        return Packet.of(bitmap, (Exif) Objects.requireNonNull(packet.getExif()), new Rect(0, 0, bitmap.getWidth(), bitmap.getHeight()), packet.getRotationDegrees(), TransformUtils.updateSensorToBufferTransform(packet.getSensorToBufferTransform(), cropRect), packet.getCameraCaptureResult());
    }

    private Bitmap createCroppedBitmap(byte[] jpegBytes, Rect cropRect) throws ImageCaptureException {
        try {
            BitmapRegionDecoder decoder = BitmapRegionDecoder.newInstance(jpegBytes, 0, jpegBytes.length, false);
            return decoder.decodeRegion(cropRect, new BitmapFactory.Options());
        } catch (IOException e) {
            throw new ImageCaptureException(1, "Failed to decode JPEG.", e);
        }
    }
}
