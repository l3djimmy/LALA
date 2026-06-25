package androidx.camera.camera2.internal;

import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.params.InputConfiguration;
import android.hardware.camera2.params.StreamConfigurationMap;
import android.media.Image;
import android.media.ImageWriter;
import android.util.Size;
import android.view.Surface;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.camera2.internal.compat.quirk.DeviceQuirks;
import androidx.camera.camera2.internal.compat.quirk.ZslDisablerQuirk;
import androidx.camera.core.ImageProxy;
import androidx.camera.core.Logger;
import androidx.camera.core.MetadataImageReader;
import androidx.camera.core.SafeCloseImageReaderProxy;
import androidx.camera.core.impl.CameraCaptureCallback;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.ImageReaderProxy;
import androidx.camera.core.impl.ImmediateSurface;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.utils.CompareSizesByArea;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.internal.compat.ImageWriterCompat;
import androidx.camera.core.internal.utils.RingBuffer;
import androidx.camera.core.internal.utils.ZslRingBuffer;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Objects;
/* loaded from: classes.dex */
public final class ZslControlImpl implements ZslControl {
    static final int MAX_IMAGES = 9;
    static final int RING_BUFFER_CAPACITY = 3;
    private static final String TAG = "ZslControlImpl";
    private final CameraCharacteristicsCompat mCameraCharacteristicsCompat;
    final ZslRingBuffer mImageRingBuffer;
    private boolean mIsPrivateReprocessingSupported;
    private CameraCaptureCallback mMetadataMatchingCaptureCallback;
    private DeferrableSurface mReprocessingImageDeferrableSurface;
    SafeCloseImageReaderProxy mReprocessingImageReader;
    ImageWriter mReprocessingImageWriter;
    private boolean mShouldZslDisabledByQuirks;
    private boolean mIsZslDisabledByUseCaseConfig = false;
    private boolean mIsZslDisabledByFlashMode = false;

    public ZslControlImpl(CameraCharacteristicsCompat cameraCharacteristicsCompat) {
        this.mIsPrivateReprocessingSupported = false;
        this.mShouldZslDisabledByQuirks = false;
        this.mCameraCharacteristicsCompat = cameraCharacteristicsCompat;
        this.mIsPrivateReprocessingSupported = ZslUtil.isCapabilitySupported(this.mCameraCharacteristicsCompat, 4);
        this.mShouldZslDisabledByQuirks = DeviceQuirks.get(ZslDisablerQuirk.class) != null;
        this.mImageRingBuffer = new ZslRingBuffer(3, new RingBuffer.OnRemoveCallback() { // from class: androidx.camera.camera2.internal.ZslControlImpl$$ExternalSyntheticLambda1
            @Override // androidx.camera.core.internal.utils.RingBuffer.OnRemoveCallback
            public final void onRemove(Object obj) {
                ((ImageProxy) obj).close();
            }
        });
    }

    @Override // androidx.camera.camera2.internal.ZslControl
    public void setZslDisabledByUserCaseConfig(boolean disabled) {
        this.mIsZslDisabledByUseCaseConfig = disabled;
    }

    @Override // androidx.camera.camera2.internal.ZslControl
    public boolean isZslDisabledByUserCaseConfig() {
        return this.mIsZslDisabledByUseCaseConfig;
    }

    @Override // androidx.camera.camera2.internal.ZslControl
    public void setZslDisabledByFlashMode(boolean disabled) {
        this.mIsZslDisabledByFlashMode = disabled;
    }

    @Override // androidx.camera.camera2.internal.ZslControl
    public boolean isZslDisabledByFlashMode() {
        return this.mIsZslDisabledByFlashMode;
    }

    @Override // androidx.camera.camera2.internal.ZslControl
    public void addZslConfig(SessionConfig.Builder sessionConfigBuilder) {
        cleanup();
        if (this.mIsZslDisabledByUseCaseConfig || this.mShouldZslDisabledByQuirks) {
            return;
        }
        Map<Integer, Size> mReprocessingInputSizeMap = createReprocessingInputSizeMap(this.mCameraCharacteristicsCompat);
        if (!this.mIsPrivateReprocessingSupported || mReprocessingInputSizeMap.isEmpty() || !mReprocessingInputSizeMap.containsKey(34) || !isJpegValidOutputForInputFormat(this.mCameraCharacteristicsCompat, 34)) {
            return;
        }
        Size resolution = mReprocessingInputSizeMap.get(34);
        MetadataImageReader metadataImageReader = new MetadataImageReader(resolution.getWidth(), resolution.getHeight(), 34, 9);
        this.mMetadataMatchingCaptureCallback = metadataImageReader.getCameraCaptureCallback();
        this.mReprocessingImageReader = new SafeCloseImageReaderProxy(metadataImageReader);
        metadataImageReader.setOnImageAvailableListener(new ImageReaderProxy.OnImageAvailableListener() { // from class: androidx.camera.camera2.internal.ZslControlImpl$$ExternalSyntheticLambda2
            @Override // androidx.camera.core.impl.ImageReaderProxy.OnImageAvailableListener
            public final void onImageAvailable(ImageReaderProxy imageReaderProxy) {
                ZslControlImpl.this.m73xd491ced0(imageReaderProxy);
            }
        }, CameraXExecutors.ioExecutor());
        this.mReprocessingImageDeferrableSurface = new ImmediateSurface(this.mReprocessingImageReader.getSurface(), new Size(this.mReprocessingImageReader.getWidth(), this.mReprocessingImageReader.getHeight()), 34);
        SafeCloseImageReaderProxy reprocessingImageReaderProxy = this.mReprocessingImageReader;
        ListenableFuture<Void> terminationFuture = this.mReprocessingImageDeferrableSurface.getTerminationFuture();
        Objects.requireNonNull(reprocessingImageReaderProxy);
        terminationFuture.addListener(new ZslControlImpl$$ExternalSyntheticLambda0(reprocessingImageReaderProxy), CameraXExecutors.mainThreadExecutor());
        sessionConfigBuilder.addSurface(this.mReprocessingImageDeferrableSurface);
        sessionConfigBuilder.addCameraCaptureCallback(this.mMetadataMatchingCaptureCallback);
        sessionConfigBuilder.addSessionStateCallback(new CameraCaptureSession.StateCallback() { // from class: androidx.camera.camera2.internal.ZslControlImpl.1
            {
                ZslControlImpl.this = this;
            }

            @Override // android.hardware.camera2.CameraCaptureSession.StateCallback
            public void onConfigured(CameraCaptureSession cameraCaptureSession) {
                Surface surface = cameraCaptureSession.getInputSurface();
                if (surface != null) {
                    ZslControlImpl.this.mReprocessingImageWriter = ImageWriterCompat.newInstance(surface, 1);
                }
            }

            @Override // android.hardware.camera2.CameraCaptureSession.StateCallback
            public void onConfigureFailed(CameraCaptureSession cameraCaptureSession) {
            }
        });
        sessionConfigBuilder.setInputConfiguration(new InputConfiguration(this.mReprocessingImageReader.getWidth(), this.mReprocessingImageReader.getHeight(), this.mReprocessingImageReader.getImageFormat()));
    }

    /* renamed from: lambda$addZslConfig$1$androidx-camera-camera2-internal-ZslControlImpl */
    public /* synthetic */ void m73xd491ced0(ImageReaderProxy imageReader) {
        try {
            ImageProxy imageProxy = imageReader.acquireLatestImage();
            if (imageProxy != null) {
                this.mImageRingBuffer.enqueue(imageProxy);
            }
        } catch (IllegalStateException e) {
            Logger.e(TAG, "Failed to acquire latest image IllegalStateException = " + e.getMessage());
        }
    }

    @Override // androidx.camera.camera2.internal.ZslControl
    public ImageProxy dequeueImageFromBuffer() {
        try {
            ImageProxy imageProxy = this.mImageRingBuffer.dequeue();
            return imageProxy;
        } catch (NoSuchElementException e) {
            Logger.e(TAG, "dequeueImageFromBuffer no such element");
            return null;
        }
    }

    @Override // androidx.camera.camera2.internal.ZslControl
    public boolean enqueueImageToImageWriter(ImageProxy imageProxy) {
        Image image = imageProxy.getImage();
        if (this.mReprocessingImageWriter == null || image == null) {
            return false;
        }
        try {
            ImageWriterCompat.queueInputImage(this.mReprocessingImageWriter, image);
            return true;
        } catch (IllegalStateException e) {
            Logger.e(TAG, "enqueueImageToImageWriter throws IllegalStateException = " + e.getMessage());
            return false;
        }
    }

    private void cleanup() {
        ZslRingBuffer imageRingBuffer = this.mImageRingBuffer;
        while (!imageRingBuffer.isEmpty()) {
            ImageProxy imageProxy = imageRingBuffer.dequeue();
            imageProxy.close();
        }
        DeferrableSurface reprocessingImageDeferrableSurface = this.mReprocessingImageDeferrableSurface;
        if (reprocessingImageDeferrableSurface != null) {
            SafeCloseImageReaderProxy reprocessingImageReaderProxy = this.mReprocessingImageReader;
            if (reprocessingImageReaderProxy != null) {
                ListenableFuture<Void> terminationFuture = reprocessingImageDeferrableSurface.getTerminationFuture();
                Objects.requireNonNull(reprocessingImageReaderProxy);
                terminationFuture.addListener(new ZslControlImpl$$ExternalSyntheticLambda0(reprocessingImageReaderProxy), CameraXExecutors.mainThreadExecutor());
                this.mReprocessingImageReader = null;
            }
            reprocessingImageDeferrableSurface.close();
            this.mReprocessingImageDeferrableSurface = null;
        }
        ImageWriter reprocessingImageWriter = this.mReprocessingImageWriter;
        if (reprocessingImageWriter != null) {
            reprocessingImageWriter.close();
            this.mReprocessingImageWriter = null;
        }
    }

    private Map<Integer, Size> createReprocessingInputSizeMap(CameraCharacteristicsCompat cameraCharacteristicsCompat) {
        int[] inputFormats;
        StreamConfigurationMap map = null;
        try {
            map = (StreamConfigurationMap) cameraCharacteristicsCompat.get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP);
        } catch (AssertionError e) {
            Logger.e(TAG, "Failed to retrieve StreamConfigurationMap, error = " + e.getMessage());
        }
        if (map == null || map.getInputFormats() == null) {
            return new HashMap();
        }
        Map<Integer, Size> inputSizeMap = new HashMap<>();
        for (int format : map.getInputFormats()) {
            Size[] inputSizes = map.getInputSizes(format);
            if (inputSizes != null) {
                Arrays.sort(inputSizes, new CompareSizesByArea(true));
                inputSizeMap.put(Integer.valueOf(format), inputSizes[0]);
            }
        }
        return inputSizeMap;
    }

    private boolean isJpegValidOutputForInputFormat(CameraCharacteristicsCompat cameraCharacteristicsCompat, int inputFormat) {
        int[] validOutputFormats;
        StreamConfigurationMap map = (StreamConfigurationMap) cameraCharacteristicsCompat.get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP);
        if (map == null || (validOutputFormats = map.getValidOutputFormatsForInput(inputFormat)) == null) {
            return false;
        }
        for (int outputFormat : validOutputFormats) {
            if (outputFormat == 256) {
                return true;
            }
        }
        return false;
    }
}
