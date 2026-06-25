package androidx.camera.core.imagecapture;

import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.util.Size;
import androidx.camera.core.ImageCaptureException;
import androidx.camera.core.ImageProxy;
import androidx.camera.core.imagecapture.ProcessingNode;
import androidx.camera.core.impl.CameraCaptureResult;
import androidx.camera.core.impl.utils.Exif;
import androidx.camera.core.impl.utils.TransformUtils;
import androidx.camera.core.internal.CameraCaptureResultImageInfo;
import androidx.camera.core.processing.Operation;
import androidx.camera.core.processing.Packet;
import androidx.core.util.Preconditions;
import java.io.IOException;
/* loaded from: classes.dex */
final class ProcessingInput2Packet implements Operation<ProcessingNode.InputPacket, Packet<ImageProxy>> {
    @Override // androidx.camera.core.processing.Operation
    public Packet<ImageProxy> apply(ProcessingNode.InputPacket inputPacket) throws ImageCaptureException {
        ImageProxy image = inputPacket.getImageProxy();
        ProcessingRequest request = inputPacket.getProcessingRequest();
        Exif exif = null;
        if (image.getFormat() == 256) {
            try {
                exif = Exif.createFromImageProxy(image);
                image.getPlanes()[0].getBuffer().rewind();
            } catch (IOException e) {
                throw new ImageCaptureException(1, "Failed to extract EXIF data.", e);
            }
        }
        if (ImagePipeline.EXIF_ROTATION_AVAILABILITY.shouldUseExifOrientation(image)) {
            Preconditions.checkNotNull(exif, "JPEG image must have exif.");
            return createPacketWithHalRotation(request, exif, image);
        }
        return createPacket(request, exif, image);
    }

    private static Packet<ImageProxy> createPacket(ProcessingRequest request, Exif exif, ImageProxy image) {
        return Packet.of(image, exif, request.getCropRect(), request.getRotationDegrees(), request.getSensorToBufferTransform(), getCameraCaptureResult(image));
    }

    private static Packet<ImageProxy> createPacketWithHalRotation(ProcessingRequest request, Exif exif, ImageProxy image) {
        Size surfaceSize = new Size(image.getWidth(), image.getHeight());
        int halRotationDegrees = request.getRotationDegrees() - exif.getRotation();
        Size imageSize = getRotatedSize(halRotationDegrees, surfaceSize);
        Matrix halTransform = TransformUtils.getRectToRect(new RectF(0.0f, 0.0f, surfaceSize.getWidth(), surfaceSize.getHeight()), new RectF(0.0f, 0.0f, imageSize.getWidth(), imageSize.getHeight()), halRotationDegrees);
        return Packet.of(image, exif, imageSize, getUpdatedCropRect(request.getCropRect(), halTransform), exif.getRotation(), getUpdatedTransform(request.getSensorToBufferTransform(), halTransform), getCameraCaptureResult(image));
    }

    private static CameraCaptureResult getCameraCaptureResult(ImageProxy image) {
        return ((CameraCaptureResultImageInfo) image.getImageInfo()).getCameraCaptureResult();
    }

    private static Matrix getUpdatedTransform(Matrix sensorToSurface, Matrix halTransform) {
        Matrix sensorToBuffer = new Matrix(sensorToSurface);
        sensorToBuffer.postConcat(halTransform);
        return sensorToBuffer;
    }

    private static Rect getUpdatedCropRect(Rect cropRect, Matrix halTransform) {
        RectF rectF = new RectF(cropRect);
        halTransform.mapRect(rectF);
        rectF.sort();
        Rect rect = new Rect();
        rectF.round(rect);
        return rect;
    }

    private static Size getRotatedSize(int rotationDegrees, Size size) {
        if (TransformUtils.is90or270(TransformUtils.within360(rotationDegrees))) {
            return new Size(size.getHeight(), size.getWidth());
        }
        return size;
    }
}
