package androidx.camera.core.imagecapture;

import android.graphics.Bitmap;
import androidx.camera.core.ImageCaptureException;
import androidx.camera.core.ImageProcessor;
import androidx.camera.core.ImageProxy;
import androidx.camera.core.impl.utils.Exif;
import androidx.camera.core.internal.utils.ImageUtil;
import androidx.camera.core.processing.ImageProcessorRequest;
import androidx.camera.core.processing.InternalImageProcessor;
import androidx.camera.core.processing.Operation;
import androidx.camera.core.processing.Packet;
import java.util.Objects;
/* loaded from: classes.dex */
public class BitmapEffect implements Operation<Packet<Bitmap>, Packet<Bitmap>> {
    private final InternalImageProcessor mProcessor;

    /* JADX INFO: Access modifiers changed from: package-private */
    public BitmapEffect(InternalImageProcessor imageProcessor) {
        this.mProcessor = imageProcessor;
    }

    @Override // androidx.camera.core.processing.Operation
    public Packet<Bitmap> apply(Packet<Bitmap> packet) throws ImageCaptureException {
        ImageProcessor.Response response = this.mProcessor.safeProcess(new ImageProcessorRequest(new RgbaImageProxy(packet), 1));
        ImageProxy imageOut = response.getOutputImage();
        Bitmap bitmapOut = ImageUtil.createBitmapFromPlane(((ImageProxy) Objects.requireNonNull(imageOut)).getPlanes(), imageOut.getWidth(), imageOut.getHeight());
        return Packet.of(bitmapOut, (Exif) Objects.requireNonNull(packet.getExif()), packet.getCropRect(), packet.getRotationDegrees(), packet.getSensorToBufferTransform(), packet.getCameraCaptureResult());
    }
}
