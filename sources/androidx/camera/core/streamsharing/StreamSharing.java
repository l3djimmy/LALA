package androidx.camera.core.streamsharing;

import android.graphics.Rect;
import android.util.Log;
import android.util.Size;
import androidx.camera.core.UseCase;
import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.Config;
import androidx.camera.core.impl.ImageInputConfig;
import androidx.camera.core.impl.ImageOutputConfig;
import androidx.camera.core.impl.MutableConfig;
import androidx.camera.core.impl.MutableOptionsBundle;
import androidx.camera.core.impl.OptionsBundle;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.StreamSpec;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.UseCaseConfigFactory;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.impl.utils.TransformUtils;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.core.processing.DefaultSurfaceProcessor;
import androidx.camera.core.processing.SurfaceEdge;
import androidx.camera.core.processing.SurfaceProcessorNode;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
/* loaded from: classes.dex */
public class StreamSharing extends UseCase {
    private static final String TAG = "StreamSharing";
    private SurfaceEdge mCameraEdge;
    private final StreamSharingConfig mDefaultConfig;
    private SurfaceProcessorNode mEffectNode;
    SessionConfig.Builder mSessionConfigBuilder;
    private SurfaceEdge mSharingInputEdge;
    private SurfaceProcessorNode mSharingNode;
    private final VirtualCamera mVirtualCamera;

    /* loaded from: classes.dex */
    interface Control {
        ListenableFuture<Void> jpegSnapshot(int i, int i2);
    }

    private static StreamSharingConfig getDefaultConfig(Set<UseCase> children) {
        MutableConfig mutableConfig = new StreamSharingBuilder().getMutableConfig();
        mutableConfig.insertOption(ImageInputConfig.OPTION_INPUT_FORMAT, 34);
        mutableConfig.insertOption(UseCaseConfig.OPTION_CAPTURE_TYPE, UseCaseConfigFactory.CaptureType.STREAM_SHARING);
        ArrayList arrayList = new ArrayList();
        for (UseCase child : children) {
            if (child.getCurrentConfig().containsOption(UseCaseConfig.OPTION_CAPTURE_TYPE)) {
                arrayList.add(child.getCurrentConfig().getCaptureType());
            } else {
                Log.e(TAG, "A child does not have capture type.");
            }
        }
        mutableConfig.insertOption(StreamSharingConfig.OPTION_CAPTURE_TYPES, arrayList);
        mutableConfig.insertOption(ImageOutputConfig.OPTION_MIRROR_MODE, 2);
        return new StreamSharingConfig(OptionsBundle.from(mutableConfig));
    }

    public StreamSharing(CameraInternal parentCamera, Set<UseCase> children, UseCaseConfigFactory useCaseConfigFactory) {
        super(getDefaultConfig(children));
        this.mDefaultConfig = getDefaultConfig(children);
        this.mVirtualCamera = new VirtualCamera(parentCamera, children, useCaseConfigFactory, new Control() { // from class: androidx.camera.core.streamsharing.StreamSharing$$ExternalSyntheticLambda1
            @Override // androidx.camera.core.streamsharing.StreamSharing.Control
            public final ListenableFuture jpegSnapshot(int i, int i2) {
                return StreamSharing.this.m181lambda$new$0$androidxcameracorestreamsharingStreamSharing(i, i2);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$new$0$androidx-camera-core-streamsharing-StreamSharing  reason: not valid java name */
    public /* synthetic */ ListenableFuture m181lambda$new$0$androidxcameracorestreamsharingStreamSharing(int jpegQuality, int rotationDegrees) {
        SurfaceProcessorNode sharingNode = this.mSharingNode;
        if (sharingNode != null) {
            return sharingNode.getSurfaceProcessor().snapshot(jpegQuality, rotationDegrees);
        }
        return Futures.immediateFailedFuture(new Exception("Failed to take picture: pipeline is not ready."));
    }

    /* JADX WARN: Type inference failed for: r1v2, types: [androidx.camera.core.impl.UseCaseConfig, androidx.camera.core.impl.UseCaseConfig<?>] */
    @Override // androidx.camera.core.UseCase
    public UseCaseConfig<?> getDefaultConfig(boolean applyDefaultConfig, UseCaseConfigFactory factory) {
        Config captureConfig = factory.getConfig(this.mDefaultConfig.getCaptureType(), 1);
        if (applyDefaultConfig) {
            captureConfig = Config.mergeConfigs(captureConfig, this.mDefaultConfig.getConfig());
        }
        if (captureConfig == null) {
            return null;
        }
        return getUseCaseConfigBuilder(captureConfig).getUseCaseConfig();
    }

    @Override // androidx.camera.core.UseCase
    public UseCaseConfig.Builder<?, ?, ?> getUseCaseConfigBuilder(Config config) {
        return new StreamSharingBuilder(MutableOptionsBundle.from(config));
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [androidx.camera.core.impl.UseCaseConfig, androidx.camera.core.impl.UseCaseConfig<?>] */
    @Override // androidx.camera.core.UseCase
    protected UseCaseConfig<?> onMergeConfig(CameraInfoInternal cameraInfo, UseCaseConfig.Builder<?, ?, ?> builder) {
        this.mVirtualCamera.mergeChildrenConfigs(builder.getMutableConfig());
        return builder.getUseCaseConfig();
    }

    @Override // androidx.camera.core.UseCase
    protected StreamSpec onSuggestedStreamSpecUpdated(StreamSpec streamSpec) {
        updateSessionConfig(createPipelineAndUpdateChildrenSpecs(getCameraId(), getCurrentConfig(), streamSpec));
        notifyActive();
        return streamSpec;
    }

    @Override // androidx.camera.core.UseCase
    protected StreamSpec onSuggestedStreamSpecImplementationOptionsUpdated(Config config) {
        this.mSessionConfigBuilder.addImplementationOptions(config);
        updateSessionConfig(this.mSessionConfigBuilder.build());
        return getAttachedStreamSpec().toBuilder().setImplementationOptions(config).build();
    }

    @Override // androidx.camera.core.UseCase
    public void onBind() {
        super.onBind();
        this.mVirtualCamera.bindChildren();
    }

    @Override // androidx.camera.core.UseCase
    public void onUnbind() {
        super.onUnbind();
        clearPipeline();
        this.mVirtualCamera.unbindChildren();
    }

    @Override // androidx.camera.core.UseCase
    public void onStateAttached() {
        super.onStateAttached();
        this.mVirtualCamera.notifyStateAttached();
    }

    @Override // androidx.camera.core.UseCase
    public void onStateDetached() {
        super.onStateDetached();
        this.mVirtualCamera.notifyStateDetached();
    }

    public Set<UseCase> getChildren() {
        return this.mVirtualCamera.getChildren();
    }

    @Override // androidx.camera.core.UseCase
    public Set<Integer> getSupportedEffectTargets() {
        Set<Integer> targets = new HashSet<>();
        targets.add(3);
        return targets;
    }

    private SessionConfig createPipelineAndUpdateChildrenSpecs(String cameraId, UseCaseConfig<?> config, StreamSpec streamSpec) {
        Threads.checkMainThread();
        CameraInternal camera = (CameraInternal) Preconditions.checkNotNull(getCamera());
        this.mCameraEdge = new SurfaceEdge(3, 34, streamSpec, getSensorToBufferTransformMatrix(), camera.getHasTransform(), (Rect) Objects.requireNonNull(getCropRect(streamSpec.getResolution())), getRelativeRotation(camera), -1, isMirroringRequired(camera));
        this.mSharingInputEdge = getSharingInputEdge(this.mCameraEdge, camera);
        this.mSharingNode = new SurfaceProcessorNode(camera, DefaultSurfaceProcessor.Factory.newInstance(streamSpec.getDynamicRange()));
        Map<UseCase, SurfaceProcessorNode.OutConfig> outConfigMap = this.mVirtualCamera.getChildrenOutConfigs(this.mSharingInputEdge);
        SurfaceProcessorNode.Out out = this.mSharingNode.transform(SurfaceProcessorNode.In.of(this.mSharingInputEdge, new ArrayList(outConfigMap.values())));
        Map<UseCase, SurfaceEdge> outputEdges = new HashMap<>();
        for (Map.Entry<UseCase, SurfaceProcessorNode.OutConfig> entry : outConfigMap.entrySet()) {
            outputEdges.put(entry.getKey(), out.get(entry.getValue()));
        }
        this.mVirtualCamera.setChildrenEdges(outputEdges);
        SessionConfig.Builder builder = SessionConfig.Builder.createFrom(config, streamSpec.getResolution());
        builder.addSurface(this.mCameraEdge.getDeferrableSurface());
        builder.addRepeatingCameraCaptureCallback(this.mVirtualCamera.getParentMetadataCallback());
        if (streamSpec.getImplementationOptions() != null) {
            builder.addImplementationOptions(streamSpec.getImplementationOptions());
        }
        addCameraErrorListener(builder, cameraId, config, streamSpec);
        this.mSessionConfigBuilder = builder;
        return builder.build();
    }

    private SurfaceEdge getSharingInputEdge(SurfaceEdge cameraEdge, CameraInternal camera) {
        if (getEffect() == null) {
            return cameraEdge;
        }
        this.mEffectNode = new SurfaceProcessorNode(camera, getEffect().createSurfaceProcessorInternal());
        SurfaceProcessorNode.OutConfig outConfig = SurfaceProcessorNode.OutConfig.of(cameraEdge.getTargets(), cameraEdge.getFormat(), cameraEdge.getCropRect(), TransformUtils.getRotatedSize(cameraEdge.getCropRect(), 0), 0, false);
        SurfaceProcessorNode.In in = SurfaceProcessorNode.In.of(cameraEdge, Collections.singletonList(outConfig));
        SurfaceProcessorNode.Out out = this.mEffectNode.transform(in);
        return (SurfaceEdge) Objects.requireNonNull(out.get(outConfig));
    }

    private void addCameraErrorListener(SessionConfig.Builder sessionConfigBuilder, final String cameraId, final UseCaseConfig<?> config, final StreamSpec streamSpec) {
        sessionConfigBuilder.addErrorListener(new SessionConfig.ErrorListener() { // from class: androidx.camera.core.streamsharing.StreamSharing$$ExternalSyntheticLambda0
            @Override // androidx.camera.core.impl.SessionConfig.ErrorListener
            public final void onError(SessionConfig sessionConfig, SessionConfig.SessionError sessionError) {
                StreamSharing.this.m180x83a3b685(cameraId, config, streamSpec, sessionConfig, sessionError);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$addCameraErrorListener$1$androidx-camera-core-streamsharing-StreamSharing  reason: not valid java name */
    public /* synthetic */ void m180x83a3b685(String cameraId, UseCaseConfig config, StreamSpec streamSpec, SessionConfig sessionConfig, SessionConfig.SessionError error) {
        clearPipeline();
        if (isCurrentCamera(cameraId)) {
            updateSessionConfig(createPipelineAndUpdateChildrenSpecs(cameraId, config, streamSpec));
            notifyReset();
            this.mVirtualCamera.resetChildren();
        }
    }

    private void clearPipeline() {
        if (this.mCameraEdge != null) {
            this.mCameraEdge.close();
            this.mCameraEdge = null;
        }
        if (this.mSharingInputEdge != null) {
            this.mSharingInputEdge.close();
            this.mSharingInputEdge = null;
        }
        if (this.mSharingNode != null) {
            this.mSharingNode.release();
            this.mSharingNode = null;
        }
        if (this.mEffectNode != null) {
            this.mEffectNode.release();
            this.mEffectNode = null;
        }
    }

    private Rect getCropRect(Size surfaceResolution) {
        if (getViewPortCropRect() != null) {
            return getViewPortCropRect();
        }
        return new Rect(0, 0, surfaceResolution.getWidth(), surfaceResolution.getHeight());
    }

    SurfaceEdge getCameraEdge() {
        return this.mCameraEdge;
    }

    SurfaceProcessorNode getSharingNode() {
        return this.mSharingNode;
    }

    VirtualCamera getVirtualCamera() {
        return this.mVirtualCamera;
    }
}
