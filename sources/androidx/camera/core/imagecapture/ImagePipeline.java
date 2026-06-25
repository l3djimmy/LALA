package androidx.camera.core.imagecapture;

import android.util.Size;
import androidx.camera.core.CameraEffect;
import androidx.camera.core.CaptureBundles;
import androidx.camera.core.ForwardingImageProxy;
import androidx.camera.core.ImageCaptureException;
import androidx.camera.core.MetadataImageReader;
import androidx.camera.core.imagecapture.CaptureNode;
import androidx.camera.core.imagecapture.ProcessingNode;
import androidx.camera.core.impl.CaptureBundle;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.CaptureStage;
import androidx.camera.core.impl.ImageCaptureConfig;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.impl.utils.TransformUtils;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.internal.compat.workaround.ExifRotationAvailability;
import androidx.camera.core.processing.InternalImageProcessor;
import androidx.core.util.Pair;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.Executor;
/* loaded from: classes.dex */
public class ImagePipeline {
    static final ExifRotationAvailability EXIF_ROTATION_AVAILABILITY = new ExifRotationAvailability();
    static final byte JPEG_QUALITY_MAX_QUALITY = 100;
    static final byte JPEG_QUALITY_MIN_LATENCY = 95;
    private final SingleBundlingNode mBundlingNode;
    private final CaptureConfig mCaptureConfig;
    private final CaptureNode mCaptureNode;
    private final CaptureNode.In mPipelineIn;
    private final ProcessingNode mProcessingNode;
    private final ImageCaptureConfig mUseCaseConfig;

    public ImagePipeline(ImageCaptureConfig useCaseConfig, Size cameraSurfaceSize) {
        this(useCaseConfig, cameraSurfaceSize, null, false);
    }

    public ImagePipeline(ImageCaptureConfig useCaseConfig, Size cameraSurfaceSize, CameraEffect cameraEffect, boolean isVirtualCamera) {
        Threads.checkMainThread();
        this.mUseCaseConfig = useCaseConfig;
        this.mCaptureConfig = CaptureConfig.Builder.createFrom(useCaseConfig).build();
        this.mCaptureNode = new CaptureNode();
        this.mBundlingNode = new SingleBundlingNode();
        this.mProcessingNode = new ProcessingNode((Executor) Objects.requireNonNull(this.mUseCaseConfig.getIoExecutor(CameraXExecutors.ioExecutor())), cameraEffect != null ? new InternalImageProcessor(cameraEffect) : null);
        this.mPipelineIn = CaptureNode.In.of(cameraSurfaceSize, this.mUseCaseConfig.getInputFormat(), getOutputFormat(), isVirtualCamera, this.mUseCaseConfig.getImageReaderProxyProvider());
        CaptureNode.Out captureOut = this.mCaptureNode.transform(this.mPipelineIn);
        ProcessingNode.In processingIn = this.mBundlingNode.transform(captureOut);
        this.mProcessingNode.transform(processingIn);
    }

    public SessionConfig.Builder createSessionConfigBuilder(Size resolution) {
        SessionConfig.Builder builder = SessionConfig.Builder.createFrom(this.mUseCaseConfig, resolution);
        builder.addNonRepeatingSurface(this.mPipelineIn.getSurface());
        return builder;
    }

    public void close() {
        Threads.checkMainThread();
        this.mCaptureNode.release();
        this.mBundlingNode.release();
        this.mProcessingNode.release();
    }

    public int getCapacity() {
        Threads.checkMainThread();
        return this.mCaptureNode.getCapacity();
    }

    public void setOnImageCloseListener(ForwardingImageProxy.OnImageCloseListener listener) {
        Threads.checkMainThread();
        this.mCaptureNode.setOnImageCloseListener(listener);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Pair<CameraRequest, ProcessingRequest> createRequests(TakePictureRequest takePictureRequest, TakePictureCallback takePictureCallback, ListenableFuture<Void> captureFuture) {
        Threads.checkMainThread();
        CaptureBundle captureBundle = createCaptureBundle();
        return new Pair<>(createCameraRequest(captureBundle, takePictureRequest, takePictureCallback), createProcessingRequest(captureBundle, takePictureRequest, takePictureCallback, captureFuture));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void submitProcessingRequest(ProcessingRequest request) {
        Threads.checkMainThread();
        this.mPipelineIn.getRequestEdge().accept(request);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void notifyCaptureError(ImageCaptureException e) {
        Threads.checkMainThread();
        this.mPipelineIn.getErrorEdge().accept(e);
    }

    private int getOutputFormat() {
        Integer bufferFormat = (Integer) this.mUseCaseConfig.retrieveOption(ImageCaptureConfig.OPTION_BUFFER_FORMAT, null);
        if (bufferFormat != null) {
            return bufferFormat.intValue();
        }
        return 256;
    }

    private CaptureBundle createCaptureBundle() {
        return (CaptureBundle) Objects.requireNonNull(this.mUseCaseConfig.getCaptureBundle(CaptureBundles.singleDefaultCaptureBundle()));
    }

    private ProcessingRequest createProcessingRequest(CaptureBundle captureBundle, TakePictureRequest takePictureRequest, TakePictureCallback takePictureCallback, ListenableFuture<Void> captureFuture) {
        return new ProcessingRequest(captureBundle, takePictureRequest.getOutputFileOptions(), takePictureRequest.getCropRect(), takePictureRequest.getRotationDegrees(), takePictureRequest.getJpegQuality(), takePictureRequest.getSensorToBufferTransform(), takePictureCallback, captureFuture);
    }

    private CameraRequest createCameraRequest(CaptureBundle captureBundle, TakePictureRequest takePictureRequest, TakePictureCallback takePictureCallback) {
        List<CaptureConfig> captureConfigs = new ArrayList<>();
        String tagBundleKey = String.valueOf(captureBundle.hashCode());
        for (CaptureStage captureStage : (List) Objects.requireNonNull(captureBundle.getCaptureStages())) {
            CaptureConfig.Builder builder = new CaptureConfig.Builder();
            builder.setTemplateType(this.mCaptureConfig.getTemplateType());
            builder.addImplementationOptions(this.mCaptureConfig.getImplementationOptions());
            builder.addAllCameraCaptureCallbacks(takePictureRequest.getSessionConfigCameraCaptureCallbacks());
            builder.addSurface(this.mPipelineIn.getSurface());
            if (this.mPipelineIn.getInputFormat() == 256) {
                if (EXIF_ROTATION_AVAILABILITY.isRotationOptionSupported()) {
                    builder.addImplementationOption(CaptureConfig.OPTION_ROTATION, Integer.valueOf(takePictureRequest.getRotationDegrees()));
                }
                builder.addImplementationOption(CaptureConfig.OPTION_JPEG_QUALITY, Integer.valueOf(getCameraRequestJpegQuality(takePictureRequest)));
            }
            builder.addImplementationOptions(captureStage.getCaptureConfig().getImplementationOptions());
            builder.addTag(tagBundleKey, Integer.valueOf(captureStage.getId()));
            builder.addCameraCaptureCallback(this.mPipelineIn.getCameraCaptureCallback());
            captureConfigs.add(builder.build());
        }
        return new CameraRequest(captureConfigs, takePictureCallback);
    }

    int getCameraRequestJpegQuality(TakePictureRequest request) {
        boolean isOnDisk = request.getOnDiskCallback() != null;
        boolean hasCropping = TransformUtils.hasCropping(request.getCropRect(), this.mPipelineIn.getSize());
        if (isOnDisk && hasCropping) {
            if (request.getCaptureMode() == 0) {
                return 100;
            }
            return 95;
        }
        return request.getJpegQuality();
    }

    CaptureNode getCaptureNode() {
        return this.mCaptureNode;
    }

    ProcessingNode getProcessingNode() {
        return this.mProcessingNode;
    }

    public boolean expectsMetadata() {
        return this.mCaptureNode.getSafeCloseImageReaderProxy().getImageReaderProxy() instanceof MetadataImageReader;
    }
}
