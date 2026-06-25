package androidx.camera.core.imagecapture;

import androidx.camera.core.ImageCaptureException;
import androidx.camera.core.ImageInfo;
import androidx.camera.core.ImageProxy;
import androidx.camera.core.ImmutableImageInfo;
import androidx.camera.core.SettableImageProxy;
import androidx.camera.core.processing.Operation;
import androidx.camera.core.processing.Packet;
/* loaded from: classes.dex */
public class JpegImage2Result implements Operation<Packet<ImageProxy>, ImageProxy> {
    @Override // androidx.camera.core.processing.Operation
    public ImageProxy apply(Packet<ImageProxy> input) throws ImageCaptureException {
        ImageProxy image = input.getData();
        ImageInfo imageInfo = ImmutableImageInfo.create(image.getImageInfo().getTagBundle(), image.getImageInfo().getTimestamp(), input.getRotationDegrees(), input.getSensorToBufferTransform());
        ImageProxy imageWithUpdatedInfo = new SettableImageProxy(image, input.getSize(), imageInfo);
        imageWithUpdatedInfo.setCropRect(input.getCropRect());
        return imageWithUpdatedInfo;
    }
}
