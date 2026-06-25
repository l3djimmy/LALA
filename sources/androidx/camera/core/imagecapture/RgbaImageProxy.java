package androidx.camera.core.imagecapture;

import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.media.Image;
import androidx.camera.core.ImageInfo;
import androidx.camera.core.ImageProxy;
import androidx.camera.core.impl.TagBundle;
import androidx.camera.core.impl.utils.ExifData;
import androidx.camera.core.internal.utils.ImageUtil;
import androidx.camera.core.processing.Packet;
import androidx.core.util.Preconditions;
import java.nio.ByteBuffer;
import java.util.Objects;
/* loaded from: classes.dex */
public final class RgbaImageProxy implements ImageProxy {
    private final Rect mCropRect;
    private final int mHeight;
    private final ImageInfo mImageInfo;
    private final Object mLock;
    ImageProxy.PlaneProxy[] mPlaneProxy;
    private final int mWidth;

    public RgbaImageProxy(Packet<Bitmap> packet) {
        this(packet.getData(), packet.getCropRect(), packet.getRotationDegrees(), packet.getSensorToBufferTransform(), packet.getCameraCaptureResult().getTimestamp());
    }

    public RgbaImageProxy(Bitmap bitmap, Rect cropRect, int rotationDegrees, Matrix sensorToBuffer, long timestamp) {
        this(ImageUtil.createDirectByteBuffer(bitmap), 4, bitmap.getWidth(), bitmap.getHeight(), cropRect, rotationDegrees, sensorToBuffer, timestamp);
    }

    public RgbaImageProxy(ByteBuffer byteBuffer, int pixelStride, int width, int height, Rect cropRect, int rotationDegrees, Matrix sensorToBuffer, long timestamp) {
        this.mLock = new Object();
        this.mWidth = width;
        this.mHeight = height;
        this.mCropRect = cropRect;
        this.mImageInfo = createImageInfo(timestamp, rotationDegrees, sensorToBuffer);
        byteBuffer.rewind();
        this.mPlaneProxy = new ImageProxy.PlaneProxy[]{createPlaneProxy(byteBuffer, width * pixelStride, pixelStride)};
    }

    @Override // androidx.camera.core.ImageProxy, java.lang.AutoCloseable
    public void close() {
        synchronized (this.mLock) {
            checkNotClosed();
            this.mPlaneProxy = null;
        }
    }

    @Override // androidx.camera.core.ImageProxy
    public Rect getCropRect() {
        Rect rect;
        synchronized (this.mLock) {
            checkNotClosed();
            rect = this.mCropRect;
        }
        return rect;
    }

    @Override // androidx.camera.core.ImageProxy
    public void setCropRect(Rect rect) {
        synchronized (this.mLock) {
            checkNotClosed();
            if (rect != null) {
                this.mCropRect.set(rect);
            }
        }
    }

    @Override // androidx.camera.core.ImageProxy
    public int getFormat() {
        synchronized (this.mLock) {
            checkNotClosed();
        }
        return 1;
    }

    @Override // androidx.camera.core.ImageProxy
    public int getHeight() {
        int i;
        synchronized (this.mLock) {
            checkNotClosed();
            i = this.mHeight;
        }
        return i;
    }

    @Override // androidx.camera.core.ImageProxy
    public int getWidth() {
        int i;
        synchronized (this.mLock) {
            checkNotClosed();
            i = this.mWidth;
        }
        return i;
    }

    @Override // androidx.camera.core.ImageProxy
    public ImageProxy.PlaneProxy[] getPlanes() {
        ImageProxy.PlaneProxy[] planeProxyArr;
        synchronized (this.mLock) {
            checkNotClosed();
            planeProxyArr = (ImageProxy.PlaneProxy[]) Objects.requireNonNull(this.mPlaneProxy);
        }
        return planeProxyArr;
    }

    @Override // androidx.camera.core.ImageProxy
    public ImageInfo getImageInfo() {
        ImageInfo imageInfo;
        synchronized (this.mLock) {
            checkNotClosed();
            imageInfo = this.mImageInfo;
        }
        return imageInfo;
    }

    @Override // androidx.camera.core.ImageProxy
    public Image getImage() {
        synchronized (this.mLock) {
            checkNotClosed();
        }
        return null;
    }

    public Bitmap createBitmap() {
        Bitmap createBitmapFromPlane;
        synchronized (this.mLock) {
            checkNotClosed();
            createBitmapFromPlane = ImageUtil.createBitmapFromPlane(getPlanes(), getWidth(), getHeight());
        }
        return createBitmapFromPlane;
    }

    private void checkNotClosed() {
        synchronized (this.mLock) {
            Preconditions.checkState(this.mPlaneProxy != null, "The image is closed.");
        }
    }

    private static ImageProxy.PlaneProxy createPlaneProxy(final ByteBuffer byteBuffer, final int rowStride, final int pixelStride) {
        return new ImageProxy.PlaneProxy() { // from class: androidx.camera.core.imagecapture.RgbaImageProxy.1
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
                return byteBuffer;
            }
        };
    }

    private static ImageInfo createImageInfo(final long timestamp, final int rotationDegrees, final Matrix sensorToBuffer) {
        return new ImageInfo() { // from class: androidx.camera.core.imagecapture.RgbaImageProxy.2
            @Override // androidx.camera.core.ImageInfo
            public TagBundle getTagBundle() {
                throw new UnsupportedOperationException("Custom ImageProxy does not contain TagBundle");
            }

            @Override // androidx.camera.core.ImageInfo
            public long getTimestamp() {
                return timestamp;
            }

            @Override // androidx.camera.core.ImageInfo
            public int getRotationDegrees() {
                return rotationDegrees;
            }

            @Override // androidx.camera.core.ImageInfo
            public Matrix getSensorToBufferTransformMatrix() {
                return new Matrix(sensorToBuffer);
            }

            @Override // androidx.camera.core.ImageInfo
            public void populateExifData(ExifData.Builder exifBuilder) {
                throw new UnsupportedOperationException("Custom ImageProxy does not contain Exif data.");
            }
        };
    }
}
