package androidx.camera.core;

import android.util.Size;
import androidx.camera.core.ImageProxy;
import java.nio.ByteBuffer;
import kotlin.UByte;
/* loaded from: classes.dex */
final class ImageProxyDownsampler {

    /* loaded from: classes.dex */
    enum DownsamplingMethod {
        NEAREST_NEIGHBOR,
        AVERAGING
    }

    private ImageProxyDownsampler() {
    }

    static ForwardingImageProxy downsample(ImageProxy image, int downsampledWidth, int downsampledHeight, DownsamplingMethod downsamplingMethod) {
        if (image.getFormat() != 35) {
            throw new UnsupportedOperationException("Only YUV_420_888 format is currently supported.");
        }
        if (image.getWidth() < downsampledWidth || image.getHeight() < downsampledHeight) {
            throw new IllegalArgumentException("Downsampled dimension " + new Size(downsampledWidth, downsampledHeight) + " is not <= original dimension " + new Size(image.getWidth(), image.getHeight()) + ".");
        }
        if (image.getWidth() != downsampledWidth || image.getHeight() != downsampledHeight) {
            int[] inputWidths = {image.getWidth(), image.getWidth() / 2, image.getWidth() / 2};
            int[] inputHeights = {image.getHeight(), image.getHeight() / 2, image.getHeight() / 2};
            int[] outputWidths = {downsampledWidth, downsampledWidth / 2, downsampledWidth / 2};
            int[] outputHeights = {downsampledHeight, downsampledHeight / 2, downsampledHeight / 2};
            ImageProxy.PlaneProxy[] outputPlanes = new ImageProxy.PlaneProxy[3];
            for (int i = 0; i < 3; i++) {
                ImageProxy.PlaneProxy inputPlane = image.getPlanes()[i];
                ByteBuffer inputBuffer = inputPlane.getBuffer();
                byte[] output = new byte[outputWidths[i] * outputHeights[i]];
                switch (downsamplingMethod) {
                    case NEAREST_NEIGHBOR:
                        resizeNearestNeighbor(inputBuffer, inputWidths[i], inputPlane.getPixelStride(), inputPlane.getRowStride(), inputHeights[i], output, outputWidths[i], outputHeights[i]);
                        output = output;
                        break;
                    case AVERAGING:
                        resizeAveraging(inputBuffer, inputWidths[i], inputPlane.getPixelStride(), inputPlane.getRowStride(), inputHeights[i], output, outputWidths[i], outputHeights[i]);
                        output = output;
                        break;
                }
                outputPlanes[i] = createPlaneProxy(outputWidths[i], 1, output);
            }
            return new ForwardingImageProxyImpl(image, outputPlanes, downsampledWidth, downsampledHeight);
        }
        return new ForwardingImageProxyImpl(image, image.getPlanes(), downsampledWidth, downsampledHeight);
    }

    private static void resizeNearestNeighbor(ByteBuffer input, int inputWidth, int inputPixelStride, int inputRowStride, int inputHeight, byte[] output, int outputWidth, int outputHeight) {
        float scaleX = inputWidth / outputWidth;
        float scaleY = inputHeight / outputHeight;
        byte[] row = new byte[inputRowStride];
        int[] sourceIndices = new int[outputWidth];
        for (int ix = 0; ix < outputWidth; ix++) {
            float sourceX = ix * scaleX;
            int floorSourceX = (int) sourceX;
            sourceIndices[ix] = floorSourceX * inputPixelStride;
        }
        synchronized (input) {
            input.rewind();
            int ix2 = 0;
            while (ix2 < outputHeight) {
                float sourceY = ix2 * scaleY;
                int floorSourceY = (int) sourceY;
                int rowOffsetSource = Math.min(floorSourceY, inputHeight - 1) * inputRowStride;
                int rowOffsetTarget = ix2 * outputWidth;
                input.position(rowOffsetSource);
                int iy = ix2;
                input.get(row, 0, Math.min(inputRowStride, input.remaining()));
                for (int ix3 = 0; ix3 < outputWidth; ix3++) {
                    output[rowOffsetTarget + ix3] = row[sourceIndices[ix3]];
                }
                ix2 = iy + 1;
            }
        }
    }

    private static void resizeAveraging(ByteBuffer input, int inputWidth, int inputPixelStride, int inputRowStride, int inputHeight, byte[] output, int outputWidth, int outputHeight) {
        int i = inputRowStride;
        int i2 = inputHeight;
        int i3 = outputHeight;
        float scaleX = inputWidth / outputWidth;
        float scaleY = i2 / i3;
        byte[] row0 = new byte[i];
        byte[] row1 = new byte[i];
        int[] sourceIndices = new int[outputWidth];
        for (int ix = 0; ix < outputWidth; ix++) {
            float sourceX = ix * scaleX;
            int floorSourceX = (int) sourceX;
            sourceIndices[ix] = floorSourceX * inputPixelStride;
        }
        synchronized (input) {
            input.rewind();
            int rowOffsetSource1 = 0;
            while (rowOffsetSource1 < i3) {
                float sourceY = rowOffsetSource1 * scaleY;
                int floorSourceY = (int) sourceY;
                int rowOffsetSource0 = Math.min(floorSourceY, i2 - 1) * i;
                int iy = rowOffsetSource1;
                int rowOffsetSource12 = Math.min(floorSourceY + 1, i2 - 1) * i;
                int rowOffsetTarget = iy * outputWidth;
                input.position(rowOffsetSource0);
                input.get(row0, 0, Math.min(i, input.remaining()));
                input.position(rowOffsetSource12);
                input.get(row1, 0, Math.min(i, input.remaining()));
                int ix2 = 0;
                while (ix2 < outputWidth) {
                    int sampleA = row0[sourceIndices[ix2]] & UByte.MAX_VALUE;
                    int rowOffsetSource13 = rowOffsetSource12;
                    int rowOffsetSource14 = row0[sourceIndices[ix2] + inputPixelStride];
                    int sampleB = rowOffsetSource14 & 255;
                    int sampleB2 = row1[sourceIndices[ix2]];
                    int sampleC = sampleB2 & 255;
                    int sampleC2 = row1[sourceIndices[ix2] + inputPixelStride];
                    int sampleD = sampleC2 & 255;
                    int mixed = (((sampleA + sampleB) + sampleC) + sampleD) / 4;
                    output[rowOffsetTarget + ix2] = (byte) (mixed & 255);
                    ix2++;
                    rowOffsetSource12 = rowOffsetSource13;
                }
                rowOffsetSource1 = iy + 1;
                i = inputRowStride;
                i2 = inputHeight;
                i3 = outputHeight;
            }
        }
    }

    private static ImageProxy.PlaneProxy createPlaneProxy(final int rowStride, final int pixelStride, final byte[] data) {
        return new ImageProxy.PlaneProxy() { // from class: androidx.camera.core.ImageProxyDownsampler.1
            final ByteBuffer mBuffer;

            {
                this.mBuffer = ByteBuffer.wrap(data);
            }

            @Override // androidx.camera.core.ImageProxy.PlaneProxy
            public int getRowStride() {
                return rowStride;
            }

            @Override // androidx.camera.core.ImageProxy.PlaneProxy
            public int getPixelStride() {
                return pixelStride;
            }

            @Override // androidx.camera.core.ImageProxy.PlaneProxy
            public ByteBuffer getBuffer() {
                return this.mBuffer;
            }
        };
    }

    /* loaded from: classes.dex */
    private static final class ForwardingImageProxyImpl extends ForwardingImageProxy {
        private final int mDownsampledHeight;
        private final ImageProxy.PlaneProxy[] mDownsampledPlanes;
        private final int mDownsampledWidth;

        ForwardingImageProxyImpl(ImageProxy originalImage, ImageProxy.PlaneProxy[] downsampledPlanes, int downsampledWidth, int downsampledHeight) {
            super(originalImage);
            this.mDownsampledPlanes = downsampledPlanes;
            this.mDownsampledWidth = downsampledWidth;
            this.mDownsampledHeight = downsampledHeight;
        }

        @Override // androidx.camera.core.ForwardingImageProxy, androidx.camera.core.ImageProxy
        public int getWidth() {
            return this.mDownsampledWidth;
        }

        @Override // androidx.camera.core.ForwardingImageProxy, androidx.camera.core.ImageProxy
        public int getHeight() {
            return this.mDownsampledHeight;
        }

        @Override // androidx.camera.core.ForwardingImageProxy, androidx.camera.core.ImageProxy
        public ImageProxy.PlaneProxy[] getPlanes() {
            return this.mDownsampledPlanes;
        }
    }
}
