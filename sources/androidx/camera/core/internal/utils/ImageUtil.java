package androidx.camera.core.internal.utils;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapRegionDecoder;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.YuvImage;
import android.util.Rational;
import android.util.Size;
import androidx.camera.core.ImageProcessingUtil;
import androidx.camera.core.ImageProxy;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.utils.ExifData;
import androidx.camera.core.impl.utils.ExifOutputStream;
import androidx.core.util.Preconditions;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;
/* loaded from: classes.dex */
public final class ImageUtil {
    public static final int DEFAULT_RGBA_PIXEL_STRIDE = 4;
    private static final String TAG = "ImageUtil";

    private ImageUtil() {
    }

    public static Bitmap createBitmapFromImageProxy(ImageProxy imageProxy) {
        switch (imageProxy.getFormat()) {
            case 1:
                return createBitmapFromRgbaImage(imageProxy);
            case 35:
                return ImageProcessingUtil.convertYUVToBitmap(imageProxy);
            case 256:
                return createBitmapFromJpegImage(imageProxy);
            default:
                throw new IllegalArgumentException("Incorrect image format of the input image proxy: " + imageProxy.getFormat() + ", only ImageFormat.YUV_420_888 and PixelFormat.RGBA_8888 are supported");
        }
    }

    public static Bitmap createBitmapFromPlane(ImageProxy.PlaneProxy[] planes, int width, int height) {
        Preconditions.checkArgument(planes.length == 1, "Expect a single plane");
        Preconditions.checkArgument(planes[0].getPixelStride() == 4, "Expect pixelStride=4");
        Preconditions.checkArgument(planes[0].getRowStride() == width * 4, "Expect rowStride=width*4");
        Bitmap bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        planes[0].getBuffer().rewind();
        ImageProcessingUtil.copyByteBufferToBitmap(bitmap, planes[0].getBuffer(), planes[0].getRowStride());
        return bitmap;
    }

    public static ByteBuffer createDirectByteBuffer(Bitmap bitmap) {
        Preconditions.checkArgument(bitmap.getConfig() == Bitmap.Config.ARGB_8888, "Only accept Bitmap with ARGB_8888 format for now.");
        ByteBuffer byteBuffer = ByteBuffer.allocateDirect(bitmap.getAllocationByteCount());
        ImageProcessingUtil.copyBitmapToByteBuffer(bitmap, byteBuffer, bitmap.getRowBytes());
        byteBuffer.rewind();
        return byteBuffer;
    }

    public static float[] sizeToVertexes(Size size) {
        return new float[]{0.0f, 0.0f, size.getWidth(), 0.0f, size.getWidth(), size.getHeight(), 0.0f, size.getHeight()};
    }

    public static float min(float value1, float value2, float value3, float value4) {
        return Math.min(Math.min(value1, value2), Math.min(value3, value4));
    }

    public static Rational getRotatedAspectRatio(int rotationDegrees, Rational aspectRatio) {
        if (rotationDegrees == 90 || rotationDegrees == 270) {
            return inverseRational(aspectRatio);
        }
        return new Rational(aspectRatio.getNumerator(), aspectRatio.getDenominator());
    }

    public static byte[] jpegImageToJpegByteArray(ImageProxy image) {
        if (image.getFormat() != 256) {
            throw new IllegalArgumentException("Incorrect image format of the input image proxy: " + image.getFormat());
        }
        ImageProxy.PlaneProxy[] planes = image.getPlanes();
        ByteBuffer buffer = planes[0].getBuffer();
        byte[] data = new byte[buffer.capacity()];
        buffer.rewind();
        buffer.get(data);
        return data;
    }

    public static byte[] jpegImageToJpegByteArray(ImageProxy image, Rect cropRect, int jpegQuality) throws CodecFailedException {
        if (image.getFormat() != 256) {
            throw new IllegalArgumentException("Incorrect image format of the input image proxy: " + image.getFormat());
        }
        byte[] data = jpegImageToJpegByteArray(image);
        return cropJpegByteArray(data, cropRect, jpegQuality);
    }

    public static byte[] yuvImageToJpegByteArray(ImageProxy image, Rect cropRect, int jpegQuality, int rotationDegrees) throws CodecFailedException {
        if (image.getFormat() != 35) {
            throw new IllegalArgumentException("Incorrect image format of the input image proxy: " + image.getFormat());
        }
        byte[] yuvBytes = yuv_420_888toNv21(image);
        YuvImage yuv = new YuvImage(yuvBytes, 17, image.getWidth(), image.getHeight(), null);
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        OutputStream out = new ExifOutputStream(byteArrayOutputStream, ExifData.create(image, rotationDegrees));
        if (cropRect == null) {
            cropRect = new Rect(0, 0, image.getWidth(), image.getHeight());
        }
        boolean success = yuv.compressToJpeg(cropRect, jpegQuality, out);
        if (!success) {
            throw new CodecFailedException("YuvImage failed to encode jpeg.", CodecFailedException.FailureType.ENCODE_FAILED);
        }
        return byteArrayOutputStream.toByteArray();
    }

    public static byte[] yuv_420_888toNv21(ImageProxy image) {
        ImageProxy.PlaneProxy yPlane = image.getPlanes()[0];
        ImageProxy.PlaneProxy uPlane = image.getPlanes()[1];
        ImageProxy.PlaneProxy vPlane = image.getPlanes()[2];
        ByteBuffer yBuffer = yPlane.getBuffer();
        ByteBuffer uBuffer = uPlane.getBuffer();
        ByteBuffer vBuffer = vPlane.getBuffer();
        yBuffer.rewind();
        uBuffer.rewind();
        vBuffer.rewind();
        int ySize = yBuffer.remaining();
        int position = 0;
        byte[] nv21 = new byte[((image.getWidth() * image.getHeight()) / 2) + ySize];
        for (int row = 0; row < image.getHeight(); row++) {
            yBuffer.get(nv21, position, image.getWidth());
            position += image.getWidth();
            yBuffer.position(Math.min(ySize, (yBuffer.position() - image.getWidth()) + yPlane.getRowStride()));
        }
        int row2 = image.getHeight();
        int chromaHeight = row2 / 2;
        int chromaWidth = image.getWidth() / 2;
        int vRowStride = vPlane.getRowStride();
        int uRowStride = uPlane.getRowStride();
        int vPixelStride = vPlane.getPixelStride();
        int uPixelStride = uPlane.getPixelStride();
        byte[] vLineBuffer = new byte[vRowStride];
        byte[] uLineBuffer = new byte[uRowStride];
        int vLineBufferPosition = 0;
        while (vLineBufferPosition < chromaHeight) {
            int row3 = vLineBufferPosition;
            int row4 = vBuffer.remaining();
            ImageProxy.PlaneProxy vPlane2 = vPlane;
            vBuffer.get(vLineBuffer, 0, Math.min(vRowStride, row4));
            uBuffer.get(uLineBuffer, 0, Math.min(uRowStride, uBuffer.remaining()));
            int vLineBufferPosition2 = 0;
            int uLineBufferPosition = 0;
            for (int col = 0; col < chromaWidth; col++) {
                int position2 = position + 1;
                nv21[position] = vLineBuffer[vLineBufferPosition2];
                position = position2 + 1;
                nv21[position2] = uLineBuffer[uLineBufferPosition];
                vLineBufferPosition2 += vPixelStride;
                uLineBufferPosition += uPixelStride;
            }
            vLineBufferPosition = row3 + 1;
            vPlane = vPlane2;
        }
        return nv21;
    }

    private static byte[] cropJpegByteArray(byte[] data, Rect cropRect, int jpegQuality) throws CodecFailedException {
        try {
            BitmapRegionDecoder decoder = BitmapRegionDecoder.newInstance(data, 0, data.length, false);
            Bitmap bitmap = decoder.decodeRegion(cropRect, new BitmapFactory.Options());
            decoder.recycle();
            if (bitmap == null) {
                throw new CodecFailedException("Decode byte array failed.", CodecFailedException.FailureType.DECODE_FAILED);
            }
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            boolean success = bitmap.compress(Bitmap.CompressFormat.JPEG, jpegQuality, out);
            if (!success) {
                throw new CodecFailedException("Encode bitmap failed.", CodecFailedException.FailureType.ENCODE_FAILED);
            }
            bitmap.recycle();
            return out.toByteArray();
        } catch (IOException e) {
            throw new CodecFailedException("Decode byte array failed.", CodecFailedException.FailureType.DECODE_FAILED);
        } catch (IllegalArgumentException e2) {
            throw new CodecFailedException("Decode byte array failed with illegal argument." + e2, CodecFailedException.FailureType.DECODE_FAILED);
        }
    }

    public static boolean isAspectRatioValid(Rational aspectRatio) {
        return (aspectRatio == null || aspectRatio.floatValue() <= 0.0f || aspectRatio.isNaN()) ? false : true;
    }

    public static boolean isAspectRatioValid(Size sourceSize, Rational aspectRatio) {
        return aspectRatio != null && aspectRatio.floatValue() > 0.0f && isCropAspectRatioHasEffect(sourceSize, aspectRatio) && !aspectRatio.isNaN();
    }

    public static Rect computeCropRectFromAspectRatio(Size sourceSize, Rational aspectRatio) {
        if (!isAspectRatioValid(aspectRatio)) {
            Logger.w(TAG, "Invalid view ratio.");
            return null;
        }
        int sourceWidth = sourceSize.getWidth();
        int sourceHeight = sourceSize.getHeight();
        float srcRatio = sourceWidth / sourceHeight;
        int cropLeft = 0;
        int cropTop = 0;
        int outputWidth = sourceWidth;
        int outputHeight = sourceHeight;
        int numerator = aspectRatio.getNumerator();
        int denominator = aspectRatio.getDenominator();
        if (aspectRatio.floatValue() > srcRatio) {
            outputHeight = Math.round((sourceWidth / numerator) * denominator);
            cropTop = (sourceHeight - outputHeight) / 2;
        } else {
            outputWidth = Math.round((sourceHeight / denominator) * numerator);
            cropLeft = (sourceWidth - outputWidth) / 2;
        }
        return new Rect(cropLeft, cropTop, cropLeft + outputWidth, cropTop + outputHeight);
    }

    public static Rect computeCropRectFromDispatchInfo(Rect surfaceCropRect, int surfaceToOutputDegrees, Size dispatchResolution, int dispatchToOutputDegrees) {
        Matrix matrix = new Matrix();
        matrix.setRotate(dispatchToOutputDegrees - surfaceToOutputDegrees);
        float[] vertexes = sizeToVertexes(dispatchResolution);
        matrix.mapPoints(vertexes);
        float left = min(vertexes[0], vertexes[2], vertexes[4], vertexes[6]);
        float top = min(vertexes[1], vertexes[3], vertexes[5], vertexes[7]);
        matrix.postTranslate(-left, -top);
        matrix.invert(matrix);
        RectF dispatchCropRectF = new RectF();
        matrix.mapRect(dispatchCropRectF, new RectF(surfaceCropRect));
        dispatchCropRectF.sort();
        Rect dispatchCropRect = new Rect();
        dispatchCropRectF.round(dispatchCropRect);
        return dispatchCropRect;
    }

    private static boolean isCropAspectRatioHasEffect(Size sourceSize, Rational aspectRatio) {
        int sourceWidth = sourceSize.getWidth();
        int sourceHeight = sourceSize.getHeight();
        int numerator = aspectRatio.getNumerator();
        int denominator = aspectRatio.getDenominator();
        return (sourceHeight == Math.round((((float) sourceWidth) / ((float) numerator)) * ((float) denominator)) && sourceWidth == Math.round((((float) sourceHeight) / ((float) denominator)) * ((float) numerator))) ? false : true;
    }

    private static Rational inverseRational(Rational rational) {
        if (rational == null) {
            return rational;
        }
        return new Rational(rational.getDenominator(), rational.getNumerator());
    }

    private static Bitmap createBitmapFromRgbaImage(ImageProxy imageProxy) {
        Bitmap bitmap = Bitmap.createBitmap(imageProxy.getWidth(), imageProxy.getHeight(), Bitmap.Config.ARGB_8888);
        imageProxy.getPlanes()[0].getBuffer().rewind();
        ImageProcessingUtil.copyByteBufferToBitmap(bitmap, imageProxy.getPlanes()[0].getBuffer(), imageProxy.getPlanes()[0].getRowStride());
        return bitmap;
    }

    private static Bitmap createBitmapFromJpegImage(ImageProxy imageProxy) {
        byte[] bytes = jpegImageToJpegByteArray(imageProxy);
        Bitmap bitmap = BitmapFactory.decodeByteArray(bytes, 0, bytes.length, null);
        if (bitmap == null) {
            throw new UnsupportedOperationException("Decode jpeg byte array failed");
        }
        return bitmap;
    }

    public static boolean shouldCropImage(ImageProxy image) {
        return shouldCropImage(image.getWidth(), image.getHeight(), image.getCropRect().width(), image.getCropRect().height());
    }

    public static boolean shouldCropImage(int sourceWidth, int sourceHeight, int cropRectWidth, int cropRectHeight) {
        return (sourceWidth == cropRectWidth && sourceHeight == cropRectHeight) ? false : true;
    }

    /* loaded from: classes.dex */
    public static final class CodecFailedException extends Exception {
        private final FailureType mFailureType;

        /* loaded from: classes.dex */
        public enum FailureType {
            ENCODE_FAILED,
            DECODE_FAILED,
            UNKNOWN
        }

        CodecFailedException(String message) {
            super(message);
            this.mFailureType = FailureType.UNKNOWN;
        }

        CodecFailedException(String message, FailureType failureType) {
            super(message);
            this.mFailureType = failureType;
        }

        public FailureType getFailureType() {
            return this.mFailureType;
        }
    }
}
