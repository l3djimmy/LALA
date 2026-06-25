package androidx.camera.core.imagecapture;

import android.graphics.Bitmap;
import androidx.camera.core.ImageCapture;
import androidx.camera.core.ImageCaptureException;
import androidx.camera.core.ImageProxy;
import androidx.camera.core.imagecapture.Bitmap2JpegBytes;
import androidx.camera.core.imagecapture.Image2JpegBytes;
import androidx.camera.core.imagecapture.JpegBytes2Disk;
import androidx.camera.core.imagecapture.ProcessingNode;
import androidx.camera.core.impl.Quirks;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.internal.compat.quirk.DeviceQuirks;
import androidx.camera.core.internal.compat.quirk.IncorrectJpegMetadataQuirk;
import androidx.camera.core.internal.compat.quirk.LowMemoryQuirk;
import androidx.camera.core.processing.Edge;
import androidx.camera.core.processing.InternalImageProcessor;
import androidx.camera.core.processing.Node;
import androidx.camera.core.processing.Operation;
import androidx.camera.core.processing.Packet;
import androidx.core.util.Consumer;
import androidx.core.util.Preconditions;
import java.util.Objects;
import java.util.concurrent.Executor;
/* loaded from: classes.dex */
public class ProcessingNode implements Node<In, Void> {
    private Operation<Bitmap2JpegBytes.In, Packet<byte[]>> mBitmap2JpegBytes;
    private Operation<Packet<Bitmap>, Packet<Bitmap>> mBitmapEffect;
    final Executor mBlockingExecutor;
    private final boolean mHasIncorrectJpegMetadataQuirk;
    private Operation<Image2JpegBytes.In, Packet<byte[]>> mImage2JpegBytes;
    final InternalImageProcessor mImageProcessor;
    private Operation<InputPacket, Packet<ImageProxy>> mInput2Packet;
    private In mInputEdge;
    private Operation<Packet<byte[]>, Packet<Bitmap>> mJpegBytes2CroppedBitmap;
    private Operation<JpegBytes2Disk.In, ImageCapture.OutputFileResults> mJpegBytes2Disk;
    private Operation<Packet<byte[]>, Packet<ImageProxy>> mJpegBytes2Image;
    private Operation<Packet<ImageProxy>, ImageProxy> mJpegImage2Result;
    private final Quirks mQuirks;

    ProcessingNode(Executor blockingExecutor) {
        this(blockingExecutor, null, DeviceQuirks.getAll());
    }

    ProcessingNode(Executor blockingExecutor, Quirks quirks) {
        this(blockingExecutor, null, quirks);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ProcessingNode(Executor blockingExecutor, InternalImageProcessor imageProcessor) {
        this(blockingExecutor, imageProcessor, DeviceQuirks.getAll());
    }

    ProcessingNode(Executor blockingExecutor, InternalImageProcessor imageProcessor, Quirks quirks) {
        boolean isLowMemoryDevice = DeviceQuirks.get(LowMemoryQuirk.class) != null;
        if (isLowMemoryDevice) {
            this.mBlockingExecutor = CameraXExecutors.newSequentialExecutor(blockingExecutor);
        } else {
            this.mBlockingExecutor = blockingExecutor;
        }
        this.mImageProcessor = imageProcessor;
        this.mQuirks = quirks;
        this.mHasIncorrectJpegMetadataQuirk = quirks.contains(IncorrectJpegMetadataQuirk.class);
    }

    @Override // androidx.camera.core.processing.Node
    public Void transform(In inputEdge) {
        this.mInputEdge = inputEdge;
        inputEdge.getEdge().setListener(new Consumer() { // from class: androidx.camera.core.imagecapture.ProcessingNode$$ExternalSyntheticLambda0
            @Override // androidx.core.util.Consumer
            public final void accept(Object obj) {
                ProcessingNode.this.m135xc5c546f5((ProcessingNode.InputPacket) obj);
            }
        });
        this.mInput2Packet = new ProcessingInput2Packet();
        this.mImage2JpegBytes = new Image2JpegBytes(this.mQuirks);
        this.mJpegBytes2CroppedBitmap = new JpegBytes2CroppedBitmap();
        this.mBitmap2JpegBytes = new Bitmap2JpegBytes();
        this.mJpegBytes2Disk = new JpegBytes2Disk();
        this.mJpegImage2Result = new JpegImage2Result();
        if (inputEdge.getInputFormat() == 35 || this.mImageProcessor != null || this.mHasIncorrectJpegMetadataQuirk) {
            this.mJpegBytes2Image = new JpegBytes2Image();
        }
        if (this.mImageProcessor != null) {
            this.mBitmapEffect = new BitmapEffect(this.mImageProcessor);
            return null;
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$transform$1$androidx-camera-core-imagecapture-ProcessingNode  reason: not valid java name */
    public /* synthetic */ void m135xc5c546f5(final InputPacket inputPacket) {
        if (inputPacket.getProcessingRequest().isAborted()) {
            return;
        }
        this.mBlockingExecutor.execute(new Runnable() { // from class: androidx.camera.core.imagecapture.ProcessingNode$$ExternalSyntheticLambda4
            @Override // java.lang.Runnable
            public final void run() {
                ProcessingNode.this.m134xd41ba0d6(inputPacket);
            }
        });
    }

    @Override // androidx.camera.core.processing.Node
    public void release() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: processInputPacket */
    public void m134xd41ba0d6(InputPacket inputPacket) {
        final ProcessingRequest request = inputPacket.getProcessingRequest();
        try {
            if (inputPacket.getProcessingRequest().isInMemoryCapture()) {
                final ImageProxy result = processInMemoryCapture(inputPacket);
                CameraXExecutors.mainThreadExecutor().execute(new Runnable() { // from class: androidx.camera.core.imagecapture.ProcessingNode$$ExternalSyntheticLambda2
                    @Override // java.lang.Runnable
                    public final void run() {
                        ProcessingRequest.this.onFinalResult(result);
                    }
                });
            } else {
                final ImageCapture.OutputFileResults result2 = processOnDiskCapture(inputPacket);
                CameraXExecutors.mainThreadExecutor().execute(new Runnable() { // from class: androidx.camera.core.imagecapture.ProcessingNode$$ExternalSyntheticLambda3
                    @Override // java.lang.Runnable
                    public final void run() {
                        ProcessingRequest.this.onFinalResult(result2);
                    }
                });
            }
        } catch (ImageCaptureException e) {
            sendError(request, e);
        } catch (OutOfMemoryError e2) {
            sendError(request, new ImageCaptureException(0, "Processing failed due to low memory.", e2));
        } catch (RuntimeException e3) {
            sendError(request, new ImageCaptureException(0, "Processing failed.", e3));
        }
    }

    ImageCapture.OutputFileResults processOnDiskCapture(InputPacket inputPacket) throws ImageCaptureException {
        Preconditions.checkArgument(this.mInputEdge.getOutputFormat() == 256, String.format("On-disk capture only support JPEG output format. Output format: %s", Integer.valueOf(this.mInputEdge.getOutputFormat())));
        ProcessingRequest request = inputPacket.getProcessingRequest();
        Packet<ImageProxy> originalImage = this.mInput2Packet.apply(inputPacket);
        Packet<byte[]> jpegBytes = this.mImage2JpegBytes.apply(Image2JpegBytes.In.of(originalImage, request.getJpegQuality()));
        if (jpegBytes.hasCropping() || this.mBitmapEffect != null) {
            jpegBytes = cropAndMaybeApplyEffect(jpegBytes, request.getJpegQuality());
        }
        return this.mJpegBytes2Disk.apply(JpegBytes2Disk.In.of(jpegBytes, (ImageCapture.OutputFileOptions) Objects.requireNonNull(request.getOutputFileOptions())));
    }

    ImageProxy processInMemoryCapture(InputPacket inputPacket) throws ImageCaptureException {
        ProcessingRequest request = inputPacket.getProcessingRequest();
        Packet<ImageProxy> image = this.mInput2Packet.apply(inputPacket);
        if ((image.getFormat() == 35 || this.mBitmapEffect != null || this.mHasIncorrectJpegMetadataQuirk) && this.mInputEdge.getOutputFormat() == 256) {
            Packet<byte[]> jpegBytes = this.mImage2JpegBytes.apply(Image2JpegBytes.In.of(image, request.getJpegQuality()));
            if (this.mBitmapEffect != null) {
                jpegBytes = cropAndMaybeApplyEffect(jpegBytes, request.getJpegQuality());
            }
            image = this.mJpegBytes2Image.apply(jpegBytes);
        }
        return this.mJpegImage2Result.apply(image);
    }

    private Packet<byte[]> cropAndMaybeApplyEffect(Packet<byte[]> jpegPacket, int jpegQuality) throws ImageCaptureException {
        Preconditions.checkState(jpegPacket.getFormat() == 256);
        Packet<Bitmap> bitmapPacket = this.mJpegBytes2CroppedBitmap.apply(jpegPacket);
        if (this.mBitmapEffect != null) {
            bitmapPacket = this.mBitmapEffect.apply(bitmapPacket);
        }
        return this.mBitmap2JpegBytes.apply(Bitmap2JpegBytes.In.of(bitmapPacket, jpegQuality));
    }

    private static void sendError(final ProcessingRequest request, final ImageCaptureException e) {
        CameraXExecutors.mainThreadExecutor().execute(new Runnable() { // from class: androidx.camera.core.imagecapture.ProcessingNode$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                ProcessingRequest.this.onProcessFailure(e);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static abstract class InputPacket {
        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract ImageProxy getImageProxy();

        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract ProcessingRequest getProcessingRequest();

        /* JADX INFO: Access modifiers changed from: package-private */
        public static InputPacket of(ProcessingRequest processingRequest, ImageProxy imageProxy) {
            return new AutoValue_ProcessingNode_InputPacket(processingRequest, imageProxy);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static abstract class In {
        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract Edge<InputPacket> getEdge();

        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract int getInputFormat();

        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract int getOutputFormat();

        /* JADX INFO: Access modifiers changed from: package-private */
        public static In of(int inputFormat, int outputFormat) {
            return new AutoValue_ProcessingNode_In(new Edge(), inputFormat, outputFormat);
        }
    }

    void injectProcessingInput2Packet(Operation<InputPacket, Packet<ImageProxy>> input2Packet) {
        this.mInput2Packet = input2Packet;
    }
}
