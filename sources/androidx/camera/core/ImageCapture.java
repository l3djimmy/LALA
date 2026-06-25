package androidx.camera.core;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.location.Location;
import android.net.Uri;
import android.os.Looper;
import android.util.Log;
import android.util.Pair;
import android.util.Rational;
import android.util.Size;
import androidx.arch.core.util.Function;
import androidx.camera.core.ImageCapture;
import androidx.camera.core.ImageProxy;
import androidx.camera.core.UseCase;
import androidx.camera.core.imagecapture.ImageCaptureControl;
import androidx.camera.core.imagecapture.ImagePipeline;
import androidx.camera.core.imagecapture.TakePictureManager;
import androidx.camera.core.imagecapture.TakePictureRequest;
import androidx.camera.core.impl.CameraConfig;
import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.Config;
import androidx.camera.core.impl.ConfigProvider;
import androidx.camera.core.impl.ImageCaptureConfig;
import androidx.camera.core.impl.ImageInputConfig;
import androidx.camera.core.impl.ImageOutputConfig;
import androidx.camera.core.impl.ImageReaderProxy;
import androidx.camera.core.impl.MutableConfig;
import androidx.camera.core.impl.MutableOptionsBundle;
import androidx.camera.core.impl.OptionsBundle;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.SessionProcessor;
import androidx.camera.core.impl.StreamSpec;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.UseCaseConfigFactory;
import androidx.camera.core.impl.utils.CameraOrientationUtil;
import androidx.camera.core.impl.utils.Exif;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.impl.utils.TransformUtils;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.core.internal.IoConfig;
import androidx.camera.core.internal.TargetConfig;
import androidx.camera.core.internal.compat.quirk.SoftwareJpegEncodingPreferredQuirk;
import androidx.camera.core.internal.compat.workaround.ExifRotationAvailability;
import androidx.camera.core.internal.utils.ImageUtil;
import androidx.camera.core.resolutionselector.AspectRatioStrategy;
import androidx.camera.core.resolutionselector.ResolutionSelector;
import androidx.camera.core.resolutionselector.ResolutionStrategy;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.nio.ByteBuffer;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes.dex */
public final class ImageCapture extends UseCase {
    public static final int CAPTURE_MODE_MAXIMIZE_QUALITY = 0;
    public static final int CAPTURE_MODE_MINIMIZE_LATENCY = 1;
    public static final int CAPTURE_MODE_ZERO_SHUTTER_LAG = 2;
    private static final int DEFAULT_CAPTURE_MODE = 1;
    private static final int DEFAULT_FLASH_MODE = 2;
    public static final int ERROR_CAMERA_CLOSED = 3;
    public static final int ERROR_CAPTURE_FAILED = 2;
    public static final int ERROR_FILE_IO = 1;
    public static final int ERROR_INVALID_CAMERA = 4;
    public static final int ERROR_UNKNOWN = 0;
    public static final int FLASH_MODE_AUTO = 0;
    public static final int FLASH_MODE_OFF = 2;
    public static final int FLASH_MODE_ON = 1;
    private static final int FLASH_MODE_UNKNOWN = -1;
    public static final int FLASH_TYPE_ONE_SHOT_FLASH = 0;
    public static final int FLASH_TYPE_USE_TORCH_AS_FLASH = 1;
    private static final byte JPEG_QUALITY_MAXIMIZE_QUALITY_MODE = 100;
    private static final byte JPEG_QUALITY_MINIMIZE_LATENCY_MODE = 95;
    private static final int MAX_IMAGES = 2;
    private static final String TAG = "ImageCapture";
    private final int mCaptureMode;
    private final ImageReaderProxy.OnImageAvailableListener mClosingListener;
    private Rational mCropAspectRatio;
    private int mFlashMode;
    private final int mFlashType;
    private final ImageCaptureControl mImageCaptureControl;
    private ImagePipeline mImagePipeline;
    private final AtomicReference<Integer> mLockedFlashMode;
    SessionConfig.Builder mSessionConfigBuilder;
    private TakePictureManager mTakePictureManager;
    public static final Defaults DEFAULT_CONFIG = new Defaults();
    static final ExifRotationAvailability EXIF_ROTATION_AVAILABILITY = new ExifRotationAvailability();

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: classes.dex */
    public @interface CaptureMode {
    }

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: classes.dex */
    public @interface FlashMode {
    }

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: classes.dex */
    public @interface FlashType {
    }

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: classes.dex */
    public @interface ImageCaptureError {
    }

    /* loaded from: classes.dex */
    public interface OnImageSavedCallback {
        void onError(ImageCaptureException imageCaptureException);

        void onImageSaved(OutputFileResults outputFileResults);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ void lambda$new$0(ImageReaderProxy imageReader) {
        try {
            ImageProxy image = imageReader.acquireLatestImage();
            Log.d(TAG, "Discarding ImageProxy which was inadvertently acquired: " + image);
            if (image != null) {
                image.close();
            }
        } catch (IllegalStateException e) {
            Log.e(TAG, "Failed to acquire latest image.", e);
        }
    }

    ImageCapture(ImageCaptureConfig userConfig) {
        super(userConfig);
        this.mClosingListener = new ImageReaderProxy.OnImageAvailableListener() { // from class: androidx.camera.core.ImageCapture$$ExternalSyntheticLambda3
            @Override // androidx.camera.core.impl.ImageReaderProxy.OnImageAvailableListener
            public final void onImageAvailable(ImageReaderProxy imageReaderProxy) {
                ImageCapture.lambda$new$0(imageReaderProxy);
            }
        };
        this.mLockedFlashMode = new AtomicReference<>(null);
        this.mFlashMode = -1;
        this.mCropAspectRatio = null;
        this.mImageCaptureControl = new ImageCaptureControl() { // from class: androidx.camera.core.ImageCapture.1
            @Override // androidx.camera.core.imagecapture.ImageCaptureControl
            public void lockFlashMode() {
                ImageCapture.this.lockFlashMode();
            }

            @Override // androidx.camera.core.imagecapture.ImageCaptureControl
            public void unlockFlashMode() {
                ImageCapture.this.unlockFlashMode();
            }

            @Override // androidx.camera.core.imagecapture.ImageCaptureControl
            public ListenableFuture<Void> submitStillCaptureRequests(List<CaptureConfig> captureConfigs) {
                return ImageCapture.this.submitStillCaptureRequest(captureConfigs);
            }
        };
        ImageCaptureConfig useCaseConfig = (ImageCaptureConfig) getCurrentConfig();
        if (useCaseConfig.containsOption(ImageCaptureConfig.OPTION_IMAGE_CAPTURE_MODE)) {
            this.mCaptureMode = useCaseConfig.getCaptureMode();
        } else {
            this.mCaptureMode = 1;
        }
        this.mFlashType = useCaseConfig.getFlashType(0);
    }

    private boolean isSessionProcessorEnabledInCurrentCamera() {
        if (getCamera() == null) {
            return false;
        }
        CameraConfig cameraConfig = getCamera().getExtendedConfig();
        return cameraConfig.getSessionProcessor(null) != null;
    }

    /* JADX WARN: Type inference failed for: r1v2, types: [androidx.camera.core.impl.UseCaseConfig, androidx.camera.core.impl.UseCaseConfig<?>] */
    @Override // androidx.camera.core.UseCase
    public UseCaseConfig<?> getDefaultConfig(boolean applyDefaultConfig, UseCaseConfigFactory factory) {
        Config captureConfig = factory.getConfig(DEFAULT_CONFIG.getConfig().getCaptureType(), getCaptureMode());
        if (applyDefaultConfig) {
            captureConfig = Config.mergeConfigs(captureConfig, DEFAULT_CONFIG.getConfig());
        }
        if (captureConfig == null) {
            return null;
        }
        return getUseCaseConfigBuilder(captureConfig).getUseCaseConfig();
    }

    @Override // androidx.camera.core.UseCase
    public UseCaseConfig.Builder<?, ?, ?> getUseCaseConfigBuilder(Config config) {
        return Builder.fromConfig(config);
    }

    /* JADX WARN: Type inference failed for: r1v6, types: [androidx.camera.core.impl.UseCaseConfig, androidx.camera.core.impl.UseCaseConfig<?>] */
    @Override // androidx.camera.core.UseCase
    protected UseCaseConfig<?> onMergeConfig(CameraInfoInternal cameraInfo, UseCaseConfig.Builder<?, ?, ?> builder) {
        boolean z = true;
        if (cameraInfo.getCameraQuirks().contains(SoftwareJpegEncodingPreferredQuirk.class)) {
            if (Boolean.FALSE.equals(builder.getMutableConfig().retrieveOption(ImageCaptureConfig.OPTION_USE_SOFTWARE_JPEG_ENCODER, true))) {
                Logger.w(TAG, "Device quirk suggests software JPEG encoder, but it has been explicitly disabled.");
            } else {
                Logger.i(TAG, "Requesting software JPEG due to device quirk.");
                builder.getMutableConfig().insertOption(ImageCaptureConfig.OPTION_USE_SOFTWARE_JPEG_ENCODER, true);
            }
        }
        boolean useSoftwareJpeg = enforceSoftwareJpegConstraints(builder.getMutableConfig());
        Integer bufferFormat = (Integer) builder.getMutableConfig().retrieveOption(ImageCaptureConfig.OPTION_BUFFER_FORMAT, null);
        if (bufferFormat != null) {
            if (isSessionProcessorEnabledInCurrentCamera() && bufferFormat.intValue() != 256) {
                z = false;
            }
            Preconditions.checkArgument(z, "Cannot set non-JPEG buffer format with Extensions enabled.");
            builder.getMutableConfig().insertOption(ImageInputConfig.OPTION_INPUT_FORMAT, Integer.valueOf(useSoftwareJpeg ? 35 : bufferFormat.intValue()));
        } else if (useSoftwareJpeg) {
            builder.getMutableConfig().insertOption(ImageInputConfig.OPTION_INPUT_FORMAT, 35);
        } else {
            List<Pair<Integer, Size[]>> supportedSizes = (List) builder.getMutableConfig().retrieveOption(ImageCaptureConfig.OPTION_SUPPORTED_RESOLUTIONS, null);
            if (supportedSizes == null) {
                builder.getMutableConfig().insertOption(ImageInputConfig.OPTION_INPUT_FORMAT, 256);
            } else if (isImageFormatSupported(supportedSizes, 256)) {
                builder.getMutableConfig().insertOption(ImageInputConfig.OPTION_INPUT_FORMAT, 256);
            } else if (isImageFormatSupported(supportedSizes, 35)) {
                builder.getMutableConfig().insertOption(ImageInputConfig.OPTION_INPUT_FORMAT, 35);
            }
        }
        return builder.getUseCaseConfig();
    }

    private static boolean isImageFormatSupported(List<Pair<Integer, Size[]>> supportedSizes, int imageFormat) {
        if (supportedSizes == null) {
            return false;
        }
        for (Pair<Integer, Size[]> supportedSize : supportedSizes) {
            if (((Integer) supportedSize.first).equals(Integer.valueOf(imageFormat))) {
                return true;
            }
        }
        return false;
    }

    @Override // androidx.camera.core.UseCase
    public void onCameraControlReady() {
        trySetFlashModeToCameraControl();
    }

    public int getFlashMode() {
        int flashMode;
        synchronized (this.mLockedFlashMode) {
            flashMode = this.mFlashMode != -1 ? this.mFlashMode : ((ImageCaptureConfig) getCurrentConfig()).getFlashMode(2);
        }
        return flashMode;
    }

    public void setFlashMode(int flashMode) {
        if (flashMode != 0 && flashMode != 1 && flashMode != 2) {
            throw new IllegalArgumentException("Invalid flash mode: " + flashMode);
        }
        synchronized (this.mLockedFlashMode) {
            this.mFlashMode = flashMode;
            trySetFlashModeToCameraControl();
        }
    }

    public void setCropAspectRatio(Rational aspectRatio) {
        this.mCropAspectRatio = aspectRatio;
    }

    public int getTargetRotation() {
        return getTargetRotationInternal();
    }

    public void setTargetRotation(int rotation) {
        int oldRotation = getTargetRotation();
        if (setTargetRotationInternal(rotation) && this.mCropAspectRatio != null) {
            int oldRotationDegrees = CameraOrientationUtil.surfaceRotationToDegrees(oldRotation);
            int newRotationDegrees = CameraOrientationUtil.surfaceRotationToDegrees(rotation);
            this.mCropAspectRatio = ImageUtil.getRotatedAspectRatio(Math.abs(newRotationDegrees - oldRotationDegrees), this.mCropAspectRatio);
        }
    }

    public int getCaptureMode() {
        return this.mCaptureMode;
    }

    public int getJpegQuality() {
        return getJpegQualityInternal();
    }

    public ResolutionInfo getResolutionInfo() {
        return getResolutionInfoInternal();
    }

    @Override // androidx.camera.core.UseCase
    protected ResolutionInfo getResolutionInfoInternal() {
        CameraInternal camera = getCamera();
        Size resolution = getAttachedSurfaceResolution();
        if (camera == null || resolution == null) {
            return null;
        }
        Rect cropRect = getViewPortCropRect();
        Rational cropAspectRatio = this.mCropAspectRatio;
        if (cropRect == null) {
            if (cropAspectRatio != null) {
                cropRect = ImageUtil.computeCropRectFromAspectRatio(resolution, cropAspectRatio);
            } else {
                cropRect = new Rect(0, 0, resolution.getWidth(), resolution.getHeight());
            }
        }
        int rotationDegrees = getRelativeRotation(camera);
        return new ResolutionInfo(resolution, (Rect) Objects.requireNonNull(cropRect), rotationDegrees);
    }

    public ResolutionSelector getResolutionSelector() {
        return ((ImageOutputConfig) getCurrentConfig()).getResolutionSelector(null);
    }

    /* renamed from: takePicture */
    public void m116lambda$takePicture$1$androidxcameracoreImageCapture(final Executor executor, final OnImageCapturedCallback callback) {
        if (Looper.getMainLooper() != Looper.myLooper()) {
            CameraXExecutors.mainThreadExecutor().execute(new Runnable() { // from class: androidx.camera.core.ImageCapture$$ExternalSyntheticLambda1
                @Override // java.lang.Runnable
                public final void run() {
                    ImageCapture.this.m116lambda$takePicture$1$androidxcameracoreImageCapture(executor, callback);
                }
            });
        } else {
            takePictureInternal(executor, callback, null, null);
        }
    }

    /* renamed from: takePicture */
    public void m117lambda$takePicture$2$androidxcameracoreImageCapture(final OutputFileOptions outputFileOptions, final Executor executor, final OnImageSavedCallback imageSavedCallback) {
        if (Looper.getMainLooper() != Looper.myLooper()) {
            CameraXExecutors.mainThreadExecutor().execute(new Runnable() { // from class: androidx.camera.core.ImageCapture$$ExternalSyntheticLambda2
                @Override // java.lang.Runnable
                public final void run() {
                    ImageCapture.this.m117lambda$takePicture$2$androidxcameracoreImageCapture(outputFileOptions, executor, imageSavedCallback);
                }
            });
        } else {
            takePictureInternal(executor, null, imageSavedCallback, outputFileOptions);
        }
    }

    static Rect computeDispatchCropRect(Rect viewPortCropRect, Rational cropAspectRatio, int rotationDegrees, Size dispatchResolution, int dispatchRotationDegrees) {
        if (viewPortCropRect != null) {
            return ImageUtil.computeCropRectFromDispatchInfo(viewPortCropRect, rotationDegrees, dispatchResolution, dispatchRotationDegrees);
        }
        if (cropAspectRatio != null) {
            Rational aspectRatio = cropAspectRatio;
            if (dispatchRotationDegrees % 180 != 0) {
                aspectRatio = new Rational(cropAspectRatio.getDenominator(), cropAspectRatio.getNumerator());
            }
            if (ImageUtil.isAspectRatioValid(dispatchResolution, aspectRatio)) {
                return (Rect) Objects.requireNonNull(ImageUtil.computeCropRectFromAspectRatio(dispatchResolution, aspectRatio));
            }
        }
        return new Rect(0, 0, dispatchResolution.getWidth(), dispatchResolution.getHeight());
    }

    @Override // androidx.camera.core.UseCase
    public void onStateDetached() {
        abortImageCaptureRequests();
    }

    private void abortImageCaptureRequests() {
        if (this.mTakePictureManager != null) {
            this.mTakePictureManager.abortRequests();
        }
    }

    void lockFlashMode() {
        synchronized (this.mLockedFlashMode) {
            if (this.mLockedFlashMode.get() != null) {
                return;
            }
            this.mLockedFlashMode.set(Integer.valueOf(getFlashMode()));
        }
    }

    void unlockFlashMode() {
        synchronized (this.mLockedFlashMode) {
            Integer lockedFlashMode = this.mLockedFlashMode.getAndSet(null);
            if (lockedFlashMode == null) {
                return;
            }
            if (lockedFlashMode.intValue() != getFlashMode()) {
                trySetFlashModeToCameraControl();
            }
        }
    }

    private void trySetFlashModeToCameraControl() {
        synchronized (this.mLockedFlashMode) {
            if (this.mLockedFlashMode.get() != null) {
                return;
            }
            getCameraControl().setFlashMode(getFlashMode());
        }
    }

    private int getJpegQualityInternal() {
        ImageCaptureConfig imageCaptureConfig = (ImageCaptureConfig) getCurrentConfig();
        if (imageCaptureConfig.containsOption(ImageCaptureConfig.OPTION_JPEG_COMPRESSION_QUALITY)) {
            return imageCaptureConfig.getJpegQuality();
        }
        switch (this.mCaptureMode) {
            case 0:
                return 100;
            case 1:
            case 2:
                return 95;
            default:
                throw new IllegalStateException("CaptureMode " + this.mCaptureMode + " is invalid");
        }
    }

    public String toString() {
        return "ImageCapture:" + getName();
    }

    static int getError(Throwable throwable) {
        if (throwable instanceof CameraClosedException) {
            return 3;
        }
        if (throwable instanceof ImageCaptureException) {
            return ((ImageCaptureException) throwable).getImageCaptureError();
        }
        return 0;
    }

    boolean enforceSoftwareJpegConstraints(MutableConfig mutableConfig) {
        if (!Boolean.TRUE.equals(mutableConfig.retrieveOption(ImageCaptureConfig.OPTION_USE_SOFTWARE_JPEG_ENCODER, false))) {
            return false;
        }
        boolean supported = true;
        if (isSessionProcessorEnabledInCurrentCamera()) {
            Logger.w(TAG, "Software JPEG cannot be used with Extensions.");
            supported = false;
        }
        Integer bufferFormat = (Integer) mutableConfig.retrieveOption(ImageCaptureConfig.OPTION_BUFFER_FORMAT, null);
        if (bufferFormat != null && bufferFormat.intValue() != 256) {
            Logger.w(TAG, "Software JPEG cannot be used with non-JPEG output buffer format.");
            supported = false;
        }
        if (!supported) {
            Logger.w(TAG, "Unable to support software JPEG. Disabling.");
            mutableConfig.insertOption(ImageCaptureConfig.OPTION_USE_SOFTWARE_JPEG_ENCODER, false);
        }
        return supported;
    }

    @Override // androidx.camera.core.UseCase
    public void onUnbind() {
        abortImageCaptureRequests();
        clearPipeline();
    }

    @Override // androidx.camera.core.UseCase
    public void onBind() {
        CameraInternal camera = getCamera();
        Preconditions.checkNotNull(camera, "Attached camera cannot be null");
    }

    @Override // androidx.camera.core.UseCase
    protected StreamSpec onSuggestedStreamSpecUpdated(StreamSpec suggestedStreamSpec) {
        this.mSessionConfigBuilder = createPipeline(getCameraId(), (ImageCaptureConfig) getCurrentConfig(), suggestedStreamSpec);
        updateSessionConfig(this.mSessionConfigBuilder.build());
        notifyActive();
        return suggestedStreamSpec;
    }

    @Override // androidx.camera.core.UseCase
    protected StreamSpec onSuggestedStreamSpecImplementationOptionsUpdated(Config config) {
        this.mSessionConfigBuilder.addImplementationOptions(config);
        updateSessionConfig(this.mSessionConfigBuilder.build());
        return getAttachedStreamSpec().toBuilder().setImplementationOptions(config).build();
    }

    private SessionConfig.Builder createPipeline(final String cameraId, final ImageCaptureConfig config, final StreamSpec streamSpec) {
        Threads.checkMainThread();
        Log.d(TAG, String.format("createPipeline(cameraId: %s, streamSpec: %s)", cameraId, streamSpec));
        Size resolution = streamSpec.getResolution();
        boolean isVirtualCamera = !((CameraInternal) Objects.requireNonNull(getCamera())).getHasTransform() || isSessionProcessorEnabledInCurrentCamera();
        if (this.mImagePipeline != null) {
            Preconditions.checkState(isVirtualCamera);
            this.mImagePipeline.close();
        }
        this.mImagePipeline = new ImagePipeline(config, resolution, getEffect(), isVirtualCamera);
        if (this.mTakePictureManager == null) {
            this.mTakePictureManager = new TakePictureManager(this.mImageCaptureControl);
        }
        this.mTakePictureManager.setImagePipeline(this.mImagePipeline);
        SessionConfig.Builder sessionConfigBuilder = this.mImagePipeline.createSessionConfigBuilder(streamSpec.getResolution());
        if (getCaptureMode() == 2) {
            getCameraControl().addZslConfig(sessionConfigBuilder);
        }
        if (streamSpec.getImplementationOptions() != null) {
            sessionConfigBuilder.addImplementationOptions(streamSpec.getImplementationOptions());
        }
        sessionConfigBuilder.addErrorListener(new SessionConfig.ErrorListener() { // from class: androidx.camera.core.ImageCapture$$ExternalSyntheticLambda0
            @Override // androidx.camera.core.impl.SessionConfig.ErrorListener
            public final void onError(SessionConfig sessionConfig, SessionConfig.SessionError sessionError) {
                ImageCapture.this.m115lambda$createPipeline$3$androidxcameracoreImageCapture(cameraId, config, streamSpec, sessionConfig, sessionError);
            }
        });
        return sessionConfigBuilder;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$createPipeline$3$androidx-camera-core-ImageCapture  reason: not valid java name */
    public /* synthetic */ void m115lambda$createPipeline$3$androidxcameracoreImageCapture(String cameraId, ImageCaptureConfig config, StreamSpec streamSpec, SessionConfig sessionConfig, SessionConfig.SessionError error) {
        if (isCurrentCamera(cameraId)) {
            this.mTakePictureManager.pause();
            clearPipeline(true);
            this.mSessionConfigBuilder = createPipeline(cameraId, config, streamSpec);
            updateSessionConfig(this.mSessionConfigBuilder.build());
            notifyReset();
            this.mTakePictureManager.resume();
            return;
        }
        clearPipeline();
    }

    private void takePictureInternal(Executor executor, OnImageCapturedCallback inMemoryCallback, OnImageSavedCallback onDiskCallback, OutputFileOptions outputFileOptions) {
        Threads.checkMainThread();
        Log.d(TAG, "takePictureInternal");
        CameraInternal camera = getCamera();
        if (camera == null) {
            sendInvalidCameraError(executor, inMemoryCallback, onDiskCallback);
        } else {
            ((TakePictureManager) Objects.requireNonNull(this.mTakePictureManager)).offerRequest(TakePictureRequest.of(executor, inMemoryCallback, onDiskCallback, outputFileOptions, getTakePictureCropRect(), getSensorToBufferTransformMatrix(), getRelativeRotation(camera), getJpegQualityInternal(), getCaptureMode(), this.mSessionConfigBuilder.getSingleCameraCaptureCallbacks()));
        }
    }

    private void sendInvalidCameraError(Executor executor, OnImageCapturedCallback inMemoryCallback, OnImageSavedCallback onDiskCallback) {
        ImageCaptureException exception = new ImageCaptureException(4, "Not bound to a valid Camera [" + this + "]", null);
        if (inMemoryCallback != null) {
            inMemoryCallback.onError(exception);
        } else if (onDiskCallback != null) {
            onDiskCallback.onError(exception);
        } else {
            throw new IllegalArgumentException("Must have either in-memory or on-disk callback.");
        }
    }

    private Rect getTakePictureCropRect() {
        Rect rect = getViewPortCropRect();
        Size resolution = (Size) Objects.requireNonNull(getAttachedSurfaceResolution());
        if (rect != null) {
            return rect;
        }
        if (ImageUtil.isAspectRatioValid(this.mCropAspectRatio)) {
            int rotationDegrees = getRelativeRotation((CameraInternal) Objects.requireNonNull(getCamera()));
            Rational rotatedAspectRatio = new Rational(this.mCropAspectRatio.getDenominator(), this.mCropAspectRatio.getNumerator());
            Rational sensorCropRatio = TransformUtils.is90or270(rotationDegrees) ? rotatedAspectRatio : this.mCropAspectRatio;
            return (Rect) Objects.requireNonNull(ImageUtil.computeCropRectFromAspectRatio(resolution, sensorCropRatio));
        }
        return new Rect(0, 0, resolution.getWidth(), resolution.getHeight());
    }

    private void clearPipeline() {
        clearPipeline(false);
    }

    private void clearPipeline(boolean keepTakePictureManager) {
        Log.d(TAG, "clearPipeline");
        Threads.checkMainThread();
        if (this.mImagePipeline != null) {
            this.mImagePipeline.close();
            this.mImagePipeline = null;
        }
        if (!keepTakePictureManager && this.mTakePictureManager != null) {
            this.mTakePictureManager.abortRequests();
            this.mTakePictureManager = null;
        }
    }

    ListenableFuture<Void> submitStillCaptureRequest(List<CaptureConfig> captureConfigs) {
        Threads.checkMainThread();
        return Futures.transform(getCameraControl().submitStillCaptureRequests(captureConfigs, this.mCaptureMode, this.mFlashType), new Function() { // from class: androidx.camera.core.ImageCapture$$ExternalSyntheticLambda4
            @Override // androidx.arch.core.util.Function
            public final Object apply(Object obj) {
                return ImageCapture.lambda$submitStillCaptureRequest$4((List) obj);
            }
        }, CameraXExecutors.directExecutor());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ Void lambda$submitStillCaptureRequest$4(List input) {
        return null;
    }

    boolean isProcessingPipelineEnabled() {
        return (this.mImagePipeline == null || this.mTakePictureManager == null) ? false : true;
    }

    ImagePipeline getImagePipeline() {
        return this.mImagePipeline;
    }

    TakePictureManager getTakePictureManager() {
        return (TakePictureManager) Objects.requireNonNull(this.mTakePictureManager);
    }

    @Override // androidx.camera.core.UseCase
    public Set<Integer> getSupportedEffectTargets() {
        Set<Integer> targets = new HashSet<>();
        targets.add(4);
        return targets;
    }

    public ImageCaptureLatencyEstimate getRealtimeCaptureLatencyEstimate() {
        CameraInternal camera = getCamera();
        if (camera == null) {
            return ImageCaptureLatencyEstimate.UNDEFINED_IMAGE_CAPTURE_LATENCY;
        }
        CameraConfig config = camera.getExtendedConfig();
        SessionProcessor sessionProcessor = config.getSessionProcessor();
        Pair<Long, Long> latencyEstimate = sessionProcessor.getRealtimeCaptureLatency();
        if (latencyEstimate == null) {
            return ImageCaptureLatencyEstimate.UNDEFINED_IMAGE_CAPTURE_LATENCY;
        }
        return new ImageCaptureLatencyEstimate(((Long) latencyEstimate.first).longValue(), ((Long) latencyEstimate.second).longValue());
    }

    /* loaded from: classes.dex */
    public static abstract class OnImageCapturedCallback {
        public void onCaptureSuccess(ImageProxy image) {
        }

        public void onError(ImageCaptureException exception) {
        }
    }

    /* loaded from: classes.dex */
    public static final class Defaults implements ConfigProvider<ImageCaptureConfig> {
        private static final int DEFAULT_ASPECT_RATIO = 0;
        private static final ImageCaptureConfig DEFAULT_CONFIG;
        private static final int DEFAULT_SURFACE_OCCUPANCY_PRIORITY = 4;
        private static final ResolutionSelector DEFAULT_RESOLUTION_SELECTOR = new ResolutionSelector.Builder().setAspectRatioStrategy(AspectRatioStrategy.RATIO_4_3_FALLBACK_AUTO_STRATEGY).setResolutionStrategy(ResolutionStrategy.HIGHEST_AVAILABLE_STRATEGY).build();
        private static final DynamicRange DEFAULT_DYNAMIC_RANGE = DynamicRange.SDR;

        static {
            Builder builder = new Builder().setSurfaceOccupancyPriority(4).setTargetAspectRatio(0).setResolutionSelector(DEFAULT_RESOLUTION_SELECTOR).setCaptureType(UseCaseConfigFactory.CaptureType.IMAGE_CAPTURE).setDynamicRange(DEFAULT_DYNAMIC_RANGE);
            DEFAULT_CONFIG = builder.getUseCaseConfig();
        }

        @Override // androidx.camera.core.impl.ConfigProvider
        public ImageCaptureConfig getConfig() {
            return DEFAULT_CONFIG;
        }
    }

    /* loaded from: classes.dex */
    public static final class OutputFileOptions {
        private final ContentResolver mContentResolver;
        private final ContentValues mContentValues;
        private final File mFile;
        private final Metadata mMetadata;
        private final OutputStream mOutputStream;
        private final Uri mSaveCollection;

        OutputFileOptions(File file, ContentResolver contentResolver, Uri saveCollection, ContentValues contentValues, OutputStream outputStream, Metadata metadata) {
            this.mFile = file;
            this.mContentResolver = contentResolver;
            this.mSaveCollection = saveCollection;
            this.mContentValues = contentValues;
            this.mOutputStream = outputStream;
            this.mMetadata = metadata == null ? new Metadata() : metadata;
        }

        public File getFile() {
            return this.mFile;
        }

        public ContentResolver getContentResolver() {
            return this.mContentResolver;
        }

        public Uri getSaveCollection() {
            return this.mSaveCollection;
        }

        public ContentValues getContentValues() {
            return this.mContentValues;
        }

        public OutputStream getOutputStream() {
            return this.mOutputStream;
        }

        public Metadata getMetadata() {
            return this.mMetadata;
        }

        public String toString() {
            return "OutputFileOptions{mFile=" + this.mFile + ", mContentResolver=" + this.mContentResolver + ", mSaveCollection=" + this.mSaveCollection + ", mContentValues=" + this.mContentValues + ", mOutputStream=" + this.mOutputStream + ", mMetadata=" + this.mMetadata + "}";
        }

        /* loaded from: classes.dex */
        public static final class Builder {
            private ContentResolver mContentResolver;
            private ContentValues mContentValues;
            private File mFile;
            private Metadata mMetadata;
            private OutputStream mOutputStream;
            private Uri mSaveCollection;

            public Builder(File file) {
                this.mFile = file;
            }

            public Builder(ContentResolver contentResolver, Uri saveCollection, ContentValues contentValues) {
                this.mContentResolver = contentResolver;
                this.mSaveCollection = saveCollection;
                this.mContentValues = contentValues;
            }

            public Builder(OutputStream outputStream) {
                this.mOutputStream = outputStream;
            }

            public Builder setMetadata(Metadata metadata) {
                this.mMetadata = metadata;
                return this;
            }

            public OutputFileOptions build() {
                return new OutputFileOptions(this.mFile, this.mContentResolver, this.mSaveCollection, this.mContentValues, this.mOutputStream, this.mMetadata);
            }
        }
    }

    /* loaded from: classes.dex */
    public static class OutputFileResults {
        private final Uri mSavedUri;

        public OutputFileResults(Uri savedUri) {
            this.mSavedUri = savedUri;
        }

        public Uri getSavedUri() {
            return this.mSavedUri;
        }
    }

    /* loaded from: classes.dex */
    public static final class Metadata {
        private boolean mIsReversedHorizontal;
        private boolean mIsReversedHorizontalSet = false;
        private boolean mIsReversedVertical;
        private Location mLocation;

        public boolean isReversedHorizontal() {
            return this.mIsReversedHorizontal;
        }

        public boolean isReversedHorizontalSet() {
            return this.mIsReversedHorizontalSet;
        }

        public void setReversedHorizontal(boolean isReversedHorizontal) {
            this.mIsReversedHorizontal = isReversedHorizontal;
            this.mIsReversedHorizontalSet = true;
        }

        public boolean isReversedVertical() {
            return this.mIsReversedVertical;
        }

        public void setReversedVertical(boolean isReversedVertical) {
            this.mIsReversedVertical = isReversedVertical;
        }

        public Location getLocation() {
            return this.mLocation;
        }

        public void setLocation(Location location) {
            this.mLocation = location;
        }

        public String toString() {
            return "Metadata{mIsReversedHorizontal=" + this.mIsReversedHorizontal + ", mIsReversedVertical=" + this.mIsReversedVertical + ", mLocation=" + this.mLocation + "}";
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static class ImageCaptureRequest {
        private final OnImageCapturedCallback mCallback;
        AtomicBoolean mDispatched = new AtomicBoolean(false);
        final int mJpegQuality;
        private final Executor mListenerExecutor;
        final int mRotationDegrees;
        private final Matrix mSensorToBufferTransformMatrix;
        private final Rational mTargetRatio;
        private final Rect mViewPortCropRect;

        ImageCaptureRequest(int rotationDegrees, int jpegQuality, Rational targetRatio, Rect viewPortCropRect, Matrix sensorToBufferTransformMatrix, Executor executor, OnImageCapturedCallback callback) {
            this.mRotationDegrees = rotationDegrees;
            this.mJpegQuality = jpegQuality;
            if (targetRatio != null) {
                Preconditions.checkArgument(!targetRatio.isZero(), "Target ratio cannot be zero");
                Preconditions.checkArgument(targetRatio.floatValue() > 0.0f, "Target ratio must be positive");
            }
            this.mTargetRatio = targetRatio;
            this.mViewPortCropRect = viewPortCropRect;
            this.mSensorToBufferTransformMatrix = sensorToBufferTransformMatrix;
            this.mListenerExecutor = executor;
            this.mCallback = callback;
        }

        void dispatchImage(ImageProxy image) {
            Size dispatchResolution;
            int dispatchRotationDegrees;
            if (!this.mDispatched.compareAndSet(false, true)) {
                image.close();
                return;
            }
            if (ImageCapture.EXIF_ROTATION_AVAILABILITY.shouldUseExifOrientation(image)) {
                try {
                    ImageProxy.PlaneProxy[] planes = image.getPlanes();
                    ByteBuffer buffer = planes[0].getBuffer();
                    buffer.rewind();
                    byte[] data = new byte[buffer.capacity()];
                    buffer.get(data);
                    Exif exif = Exif.createFromInputStream(new ByteArrayInputStream(data));
                    buffer.rewind();
                    dispatchResolution = new Size(exif.getWidth(), exif.getHeight());
                    dispatchRotationDegrees = exif.getRotation();
                } catch (IOException e) {
                    notifyCallbackError(1, "Unable to parse JPEG exif", e);
                    image.close();
                    return;
                }
            } else {
                dispatchResolution = new Size(image.getWidth(), image.getHeight());
                dispatchRotationDegrees = this.mRotationDegrees;
            }
            ImageInfo imageInfo = ImmutableImageInfo.create(image.getImageInfo().getTagBundle(), image.getImageInfo().getTimestamp(), dispatchRotationDegrees, this.mSensorToBufferTransformMatrix);
            final ImageProxy dispatchedImageProxy = new SettableImageProxy(image, dispatchResolution, imageInfo);
            Rect cropRect = ImageCapture.computeDispatchCropRect(this.mViewPortCropRect, this.mTargetRatio, this.mRotationDegrees, dispatchResolution, dispatchRotationDegrees);
            dispatchedImageProxy.setCropRect(cropRect);
            try {
                this.mListenerExecutor.execute(new Runnable() { // from class: androidx.camera.core.ImageCapture$ImageCaptureRequest$$ExternalSyntheticLambda1
                    @Override // java.lang.Runnable
                    public final void run() {
                        ImageCapture.ImageCaptureRequest.this.m118xf35699e1(dispatchedImageProxy);
                    }
                });
            } catch (RejectedExecutionException e2) {
                Logger.e(ImageCapture.TAG, "Unable to post to the supplied executor.");
                image.close();
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$dispatchImage$0$androidx-camera-core-ImageCapture$ImageCaptureRequest  reason: not valid java name */
        public /* synthetic */ void m118xf35699e1(ImageProxy dispatchedImageProxy) {
            this.mCallback.onCaptureSuccess(dispatchedImageProxy);
        }

        void notifyCallbackError(final int imageCaptureError, final String message, final Throwable cause) {
            if (!this.mDispatched.compareAndSet(false, true)) {
                return;
            }
            try {
                this.mListenerExecutor.execute(new Runnable() { // from class: androidx.camera.core.ImageCapture$ImageCaptureRequest$$ExternalSyntheticLambda0
                    @Override // java.lang.Runnable
                    public final void run() {
                        ImageCapture.ImageCaptureRequest.this.m119xe8eba4db(imageCaptureError, message, cause);
                    }
                });
            } catch (RejectedExecutionException e) {
                Logger.e(ImageCapture.TAG, "Unable to post to the supplied executor.");
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$notifyCallbackError$1$androidx-camera-core-ImageCapture$ImageCaptureRequest  reason: not valid java name */
        public /* synthetic */ void m119xe8eba4db(int imageCaptureError, String message, Throwable cause) {
            this.mCallback.onError(new ImageCaptureException(imageCaptureError, message, cause));
        }
    }

    /* loaded from: classes.dex */
    public static final class Builder implements UseCaseConfig.Builder<ImageCapture, ImageCaptureConfig, Builder>, ImageOutputConfig.Builder<Builder>, IoConfig.Builder<Builder>, ImageInputConfig.Builder<Builder> {
        private final MutableOptionsBundle mMutableConfig;

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public /* bridge */ /* synthetic */ Builder setCustomOrderedResolutions(List list) {
            return setCustomOrderedResolutions((List<Size>) list);
        }

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public /* bridge */ /* synthetic */ Builder setSupportedResolutions(List list) {
            return setSupportedResolutions((List<Pair<Integer, Size[]>>) list);
        }

        @Override // androidx.camera.core.internal.TargetConfig.Builder
        public /* bridge */ /* synthetic */ Object setTargetClass(Class cls) {
            return setTargetClass((Class<ImageCapture>) cls);
        }

        public Builder() {
            this(MutableOptionsBundle.create());
        }

        private Builder(MutableOptionsBundle mutableConfig) {
            this.mMutableConfig = mutableConfig;
            Class<?> oldConfigClass = (Class) mutableConfig.retrieveOption(TargetConfig.OPTION_TARGET_CLASS, null);
            if (oldConfigClass != null && !oldConfigClass.equals(ImageCapture.class)) {
                throw new IllegalArgumentException("Invalid target class configuration for " + this + ": " + oldConfigClass);
            }
            setTargetClass(ImageCapture.class);
        }

        public static Builder fromConfig(Config configuration) {
            return new Builder(MutableOptionsBundle.from(configuration));
        }

        static Builder fromConfig(ImageCaptureConfig configuration) {
            return new Builder(MutableOptionsBundle.from((Config) configuration));
        }

        @Override // androidx.camera.core.ExtendableBuilder
        public MutableConfig getMutableConfig() {
            return this.mMutableConfig;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public ImageCaptureConfig getUseCaseConfig() {
            return new ImageCaptureConfig(OptionsBundle.from(this.mMutableConfig));
        }

        @Override // androidx.camera.core.ExtendableBuilder
        public ImageCapture build() {
            Integer flashMode;
            Integer bufferFormat = (Integer) getMutableConfig().retrieveOption(ImageCaptureConfig.OPTION_BUFFER_FORMAT, null);
            if (bufferFormat != null) {
                getMutableConfig().insertOption(ImageInputConfig.OPTION_INPUT_FORMAT, bufferFormat);
            } else {
                getMutableConfig().insertOption(ImageInputConfig.OPTION_INPUT_FORMAT, 256);
            }
            ImageCaptureConfig imageCaptureConfig = getUseCaseConfig();
            ImageOutputConfig.validateConfig(imageCaptureConfig);
            ImageCapture imageCapture = new ImageCapture(imageCaptureConfig);
            Size targetResolution = (Size) getMutableConfig().retrieveOption(ImageCaptureConfig.OPTION_TARGET_RESOLUTION, null);
            if (targetResolution != null) {
                imageCapture.setCropAspectRatio(new Rational(targetResolution.getWidth(), targetResolution.getHeight()));
            }
            Preconditions.checkNotNull((Executor) getMutableConfig().retrieveOption(ImageCaptureConfig.OPTION_IO_EXECUTOR, CameraXExecutors.ioExecutor()), "The IO executor can't be null");
            if (getMutableConfig().containsOption(ImageCaptureConfig.OPTION_FLASH_MODE) && ((flashMode = (Integer) getMutableConfig().retrieveOption(ImageCaptureConfig.OPTION_FLASH_MODE)) == null || (flashMode.intValue() != 0 && flashMode.intValue() != 1 && flashMode.intValue() != 2))) {
                throw new IllegalArgumentException("The flash mode is not allowed to set: " + flashMode);
            }
            return imageCapture;
        }

        public Builder setCaptureMode(int captureMode) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_IMAGE_CAPTURE_MODE, Integer.valueOf(captureMode));
            return this;
        }

        public Builder setFlashMode(int flashMode) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_FLASH_MODE, Integer.valueOf(flashMode));
            return this;
        }

        public Builder setBufferFormat(int bufferImageFormat) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_BUFFER_FORMAT, Integer.valueOf(bufferImageFormat));
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder setSupportedResolutions(List<Pair<Integer, Size[]>> resolutions) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_SUPPORTED_RESOLUTIONS, resolutions);
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder setCustomOrderedResolutions(List<Size> resolutions) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_CUSTOM_ORDERED_RESOLUTIONS, resolutions);
            return this;
        }

        @Override // androidx.camera.core.internal.TargetConfig.Builder
        public Builder setTargetClass(Class<ImageCapture> targetClass) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_TARGET_CLASS, targetClass);
            if (getMutableConfig().retrieveOption(ImageCaptureConfig.OPTION_TARGET_NAME, null) == null) {
                String targetName = targetClass.getCanonicalName() + "-" + UUID.randomUUID();
                setTargetName(targetName);
            }
            return this;
        }

        @Override // androidx.camera.core.internal.TargetConfig.Builder
        public Builder setTargetName(String targetName) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_TARGET_NAME, targetName);
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        @Deprecated
        public Builder setTargetAspectRatio(int aspectRatio) {
            if (aspectRatio == -1) {
                aspectRatio = 0;
            }
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_TARGET_ASPECT_RATIO, Integer.valueOf(aspectRatio));
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder setTargetRotation(int rotation) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_TARGET_ROTATION, Integer.valueOf(rotation));
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder setMirrorMode(int mirrorMode) {
            throw new UnsupportedOperationException("setMirrorMode is not supported.");
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        @Deprecated
        public Builder setTargetResolution(Size resolution) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_TARGET_RESOLUTION, resolution);
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder setDefaultResolution(Size resolution) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_DEFAULT_RESOLUTION, resolution);
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder setMaxResolution(Size resolution) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_MAX_RESOLUTION, resolution);
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder setResolutionSelector(ResolutionSelector resolutionSelector) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_RESOLUTION_SELECTOR, resolutionSelector);
            return this;
        }

        public Builder setImageReaderProxyProvider(ImageReaderProxyProvider imageReaderProxyProvider) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_IMAGE_READER_PROXY_PROVIDER, imageReaderProxyProvider);
            return this;
        }

        public Builder setSoftwareJpegEncoderRequested(boolean requestSoftwareJpeg) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_USE_SOFTWARE_JPEG_ENCODER, Boolean.valueOf(requestSoftwareJpeg));
            return this;
        }

        public Builder setFlashType(int flashType) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_FLASH_TYPE, Integer.valueOf(flashType));
            return this;
        }

        public Builder setJpegQuality(int jpegQuality) {
            Preconditions.checkArgumentInRange(jpegQuality, 1, 100, "jpegQuality");
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_JPEG_COMPRESSION_QUALITY, Integer.valueOf(jpegQuality));
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.internal.IoConfig.Builder
        public Builder setIoExecutor(Executor executor) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_IO_EXECUTOR, executor);
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder setDefaultSessionConfig(SessionConfig sessionConfig) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_DEFAULT_SESSION_CONFIG, sessionConfig);
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder setDefaultCaptureConfig(CaptureConfig captureConfig) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_DEFAULT_CAPTURE_CONFIG, captureConfig);
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder setSessionOptionUnpacker(SessionConfig.OptionUnpacker optionUnpacker) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_SESSION_CONFIG_UNPACKER, optionUnpacker);
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder setCaptureOptionUnpacker(CaptureConfig.OptionUnpacker optionUnpacker) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_CAPTURE_CONFIG_UNPACKER, optionUnpacker);
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder setCameraSelector(CameraSelector cameraSelector) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_CAMERA_SELECTOR, cameraSelector);
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder setSurfaceOccupancyPriority(int priority) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_SURFACE_OCCUPANCY_PRIORITY, Integer.valueOf(priority));
            return this;
        }

        @Override // androidx.camera.core.internal.UseCaseEventConfig.Builder
        public Builder setUseCaseEventCallback(UseCase.EventCallback useCaseEventCallback) {
            getMutableConfig().insertOption(ImageCaptureConfig.OPTION_USE_CASE_EVENT_CALLBACK, useCaseEventCallback);
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder setZslDisabled(boolean disabled) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_ZSL_DISABLED, Boolean.valueOf(disabled));
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder setHighResolutionDisabled(boolean disabled) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_HIGH_RESOLUTION_DISABLED, Boolean.valueOf(disabled));
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder setCaptureType(UseCaseConfigFactory.CaptureType captureType) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_CAPTURE_TYPE, captureType);
            return this;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.core.impl.ImageInputConfig.Builder
        public Builder setDynamicRange(DynamicRange dynamicRange) {
            if (!Objects.equals(DynamicRange.SDR, dynamicRange)) {
                throw new UnsupportedOperationException("ImageCapture currently only supports SDR");
            }
            getMutableConfig().insertOption(ImageInputConfig.OPTION_INPUT_DYNAMIC_RANGE, dynamicRange);
            return this;
        }
    }
}
