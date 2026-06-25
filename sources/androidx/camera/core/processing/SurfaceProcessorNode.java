package androidx.camera.core.processing;

import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.util.Size;
import androidx.camera.core.Logger;
import androidx.camera.core.ProcessingException;
import androidx.camera.core.SurfaceOutput;
import androidx.camera.core.SurfaceRequest;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.StreamSpec;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.impl.utils.TransformUtils;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
/* loaded from: classes.dex */
public class SurfaceProcessorNode implements Node<In, Out> {
    private static final String TAG = "SurfaceProcessorNode";
    final CameraInternal mCameraInternal;
    private In mInput;
    private Out mOutput;
    final SurfaceProcessorInternal mSurfaceProcessor;

    /* loaded from: classes.dex */
    public static class Out extends HashMap<OutConfig, SurfaceEdge> {
    }

    public SurfaceProcessorNode(CameraInternal cameraInternal, SurfaceProcessorInternal surfaceProcessor) {
        this.mCameraInternal = cameraInternal;
        this.mSurfaceProcessor = surfaceProcessor;
    }

    @Override // androidx.camera.core.processing.Node
    public Out transform(In input) {
        Threads.checkMainThread();
        this.mInput = input;
        this.mOutput = new Out();
        SurfaceEdge inputSurface = input.getSurfaceEdge();
        for (OutConfig config : input.getOutConfigs()) {
            this.mOutput.put(config, transformSingleOutput(inputSurface, config));
        }
        sendSurfaceRequest(inputSurface, this.mOutput);
        sendSurfaceOutputs(inputSurface, this.mOutput);
        return this.mOutput;
    }

    private SurfaceEdge transformSingleOutput(SurfaceEdge input, OutConfig outConfig) {
        Rect cropRect = outConfig.getCropRect();
        int rotationDegrees = outConfig.getRotationDegrees();
        boolean mirroring = outConfig.getMirroring();
        Matrix sensorToBufferTransform = new Matrix(input.getSensorToBufferTransform());
        Matrix imageTransform = TransformUtils.getRectToRect(new RectF(cropRect), TransformUtils.sizeToRectF(outConfig.getSize()), rotationDegrees, mirroring);
        sensorToBufferTransform.postConcat(imageTransform);
        Size rotatedCropSize = TransformUtils.getRotatedSize(cropRect, rotationDegrees);
        Preconditions.checkArgument(TransformUtils.isAspectRatioMatchingWithRoundingError(rotatedCropSize, outConfig.getSize()));
        StreamSpec streamSpec = input.getStreamSpec().toBuilder().setResolution(outConfig.getSize()).build();
        SurfaceEdge outputSurface = new SurfaceEdge(outConfig.getTargets(), outConfig.getFormat(), streamSpec, sensorToBufferTransform, false, TransformUtils.sizeToRect(outConfig.getSize()), input.getRotationDegrees() - rotationDegrees, -1, input.getMirroring() != mirroring);
        return outputSurface;
    }

    private void sendSurfaceRequest(SurfaceEdge input, Map<OutConfig, SurfaceEdge> outputs) {
        SurfaceRequest surfaceRequest = input.createSurfaceRequest(this.mCameraInternal);
        setUpRotationUpdates(surfaceRequest, outputs);
        try {
            this.mSurfaceProcessor.onInputSurface(surfaceRequest);
        } catch (ProcessingException e) {
            Logger.e(TAG, "Failed to send SurfaceRequest to SurfaceProcessor.", e);
        }
    }

    private void sendSurfaceOutputs(final SurfaceEdge input, Map<OutConfig, SurfaceEdge> outputs) {
        for (final Map.Entry<OutConfig, SurfaceEdge> output : outputs.entrySet()) {
            m177x8baeb245(input, output);
            output.getValue().addOnInvalidatedListener(new Runnable() { // from class: androidx.camera.core.processing.SurfaceProcessorNode$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    SurfaceProcessorNode.this.m177x8baeb245(input, output);
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: createAndSendSurfaceOutput */
    public void m177x8baeb245(SurfaceEdge input, Map.Entry<OutConfig, SurfaceEdge> output) {
        ListenableFuture<SurfaceOutput> future = output.getValue().createSurfaceOutputFuture(input.getStreamSpec().getResolution(), output.getKey().getFormat(), output.getKey().getCropRect(), output.getKey().getRotationDegrees(), output.getKey().getMirroring(), input.hasCameraTransform() ? this.mCameraInternal : null);
        Futures.addCallback(future, new FutureCallback<SurfaceOutput>() { // from class: androidx.camera.core.processing.SurfaceProcessorNode.1
            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onSuccess(SurfaceOutput output2) {
                Preconditions.checkNotNull(output2);
                try {
                    SurfaceProcessorNode.this.mSurfaceProcessor.onOutputSurface(output2);
                } catch (ProcessingException e) {
                    Logger.e(SurfaceProcessorNode.TAG, "Failed to send SurfaceOutput to SurfaceProcessor.", e);
                }
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable t) {
                Logger.w(SurfaceProcessorNode.TAG, "Downstream node failed to provide Surface.", t);
            }
        }, CameraXExecutors.mainThreadExecutor());
    }

    void setUpRotationUpdates(SurfaceRequest inputSurfaceRequest, final Map<OutConfig, SurfaceEdge> outputs) {
        inputSurfaceRequest.setTransformationInfoListener(CameraXExecutors.mainThreadExecutor(), new SurfaceRequest.TransformationInfoListener() { // from class: androidx.camera.core.processing.SurfaceProcessorNode$$ExternalSyntheticLambda2
            @Override // androidx.camera.core.SurfaceRequest.TransformationInfoListener
            public final void onTransformationInfoUpdate(SurfaceRequest.TransformationInfo transformationInfo) {
                SurfaceProcessorNode.lambda$setUpRotationUpdates$1(outputs, transformationInfo);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ void lambda$setUpRotationUpdates$1(Map outputs, SurfaceRequest.TransformationInfo info) {
        for (Map.Entry<OutConfig, SurfaceEdge> output : outputs.entrySet()) {
            int rotationDegrees = info.getRotationDegrees() - output.getKey().getRotationDegrees();
            if (output.getKey().getMirroring()) {
                rotationDegrees = -rotationDegrees;
            }
            output.getValue().updateTransformation(TransformUtils.within360(rotationDegrees), -1);
        }
    }

    @Override // androidx.camera.core.processing.Node
    public void release() {
        this.mSurfaceProcessor.release();
        CameraXExecutors.mainThreadExecutor().execute(new Runnable() { // from class: androidx.camera.core.processing.SurfaceProcessorNode$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                SurfaceProcessorNode.this.m176xa4033323();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$release$2$androidx-camera-core-processing-SurfaceProcessorNode  reason: not valid java name */
    public /* synthetic */ void m176xa4033323() {
        if (this.mOutput != null) {
            for (SurfaceEdge surface : this.mOutput.values()) {
                surface.close();
            }
        }
    }

    public SurfaceProcessorInternal getSurfaceProcessor() {
        return this.mSurfaceProcessor;
    }

    /* loaded from: classes.dex */
    public static abstract class In {
        public abstract List<OutConfig> getOutConfigs();

        public abstract SurfaceEdge getSurfaceEdge();

        public static In of(SurfaceEdge edge, List<OutConfig> configs) {
            return new AutoValue_SurfaceProcessorNode_In(edge, configs);
        }
    }

    /* loaded from: classes.dex */
    public static abstract class OutConfig {
        public abstract Rect getCropRect();

        public abstract int getFormat();

        public abstract boolean getMirroring();

        public abstract int getRotationDegrees();

        public abstract Size getSize();

        public abstract int getTargets();

        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract UUID getUuid();

        public static OutConfig of(SurfaceEdge inputEdge) {
            return of(inputEdge.getTargets(), inputEdge.getFormat(), inputEdge.getCropRect(), TransformUtils.getRotatedSize(inputEdge.getCropRect(), inputEdge.getRotationDegrees()), inputEdge.getRotationDegrees(), inputEdge.getMirroring());
        }

        public static OutConfig of(int targets, int format, Rect cropRect, Size size, int rotationDegrees, boolean mirroring) {
            return new AutoValue_SurfaceProcessorNode_OutConfig(UUID.randomUUID(), targets, format, cropRect, size, rotationDegrees, mirroring);
        }
    }
}
