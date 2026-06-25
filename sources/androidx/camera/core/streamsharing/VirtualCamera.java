package androidx.camera.core.streamsharing;

import android.util.Size;
import androidx.camera.core.ImageCapture;
import androidx.camera.core.Preview;
import androidx.camera.core.UseCase;
import androidx.camera.core.impl.CameraCaptureCallback;
import androidx.camera.core.impl.CameraCaptureResult;
import androidx.camera.core.impl.CameraControlInternal;
import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.ImageOutputConfig;
import androidx.camera.core.impl.MutableConfig;
import androidx.camera.core.impl.Observable;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.UseCaseConfigFactory;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.impl.utils.TransformUtils;
import androidx.camera.core.processing.SurfaceEdge;
import androidx.camera.core.processing.SurfaceProcessorNode;
import androidx.camera.core.streamsharing.StreamSharing;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class VirtualCamera implements CameraInternal {
    private static final String UNSUPPORTED_MESSAGE = "Operation not supported by VirtualCamera.";
    final Set<UseCase> mChildren;
    private final CameraInternal mParentCamera;
    private final UseCaseConfigFactory mUseCaseConfigFactory;
    private final VirtualCameraControl mVirtualCameraControl;
    final Map<UseCase, SurfaceEdge> mChildrenEdges = new HashMap();
    final Map<UseCase, Boolean> mChildrenActiveState = new HashMap();
    private final CameraCaptureCallback mParentMetadataCallback = createCameraCaptureCallback();

    /* JADX INFO: Access modifiers changed from: package-private */
    public VirtualCamera(CameraInternal parentCamera, Set<UseCase> children, UseCaseConfigFactory useCaseConfigFactory, StreamSharing.Control streamSharingControl) {
        this.mParentCamera = parentCamera;
        this.mUseCaseConfigFactory = useCaseConfigFactory;
        this.mChildren = children;
        this.mVirtualCameraControl = new VirtualCameraControl(parentCamera.getCameraControlInternal(), streamSharingControl);
        for (UseCase child : children) {
            this.mChildrenActiveState.put(child, false);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void mergeChildrenConfigs(MutableConfig mutableConfig) {
        Set<UseCaseConfig<?>> childrenConfigs = new HashSet<>();
        for (UseCase useCase : this.mChildren) {
            childrenConfigs.add(useCase.mergeConfigs(this.mParentCamera.getCameraInfoInternal(), null, useCase.getDefaultConfig(true, this.mUseCaseConfigFactory)));
        }
        List<Size> supportedResolutions = new ArrayList<>(this.mParentCamera.getCameraInfoInternal().getSupportedResolutions(34));
        Size sensorSize = TransformUtils.rectToSize(this.mParentCamera.getCameraControlInternal().getSensorRect());
        mutableConfig.insertOption(ImageOutputConfig.OPTION_CUSTOM_ORDERED_RESOLUTIONS, ResolutionUtils.getMergedResolutions(supportedResolutions, sensorSize, childrenConfigs));
        mutableConfig.insertOption(UseCaseConfig.OPTION_SURFACE_OCCUPANCY_PRIORITY, Integer.valueOf(getHighestSurfacePriority(childrenConfigs)));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void bindChildren() {
        for (UseCase useCase : this.mChildren) {
            useCase.bindToCamera(this, null, useCase.getDefaultConfig(true, this.mUseCaseConfigFactory));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void unbindChildren() {
        for (UseCase useCase : this.mChildren) {
            useCase.unbindFromCamera(this);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void notifyStateAttached() {
        for (UseCase useCase : this.mChildren) {
            useCase.onStateAttached();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void notifyStateDetached() {
        for (UseCase useCase : this.mChildren) {
            useCase.onStateDetached();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Set<UseCase> getChildren() {
        return this.mChildren;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Map<UseCase, SurfaceProcessorNode.OutConfig> getChildrenOutConfigs(SurfaceEdge cameraEdge) {
        Map<UseCase, SurfaceProcessorNode.OutConfig> outConfigs = new HashMap<>();
        for (UseCase useCase : this.mChildren) {
            int rotationDegrees = getChildRotationDegrees(useCase);
            outConfigs.put(useCase, SurfaceProcessorNode.OutConfig.of(getChildTargetType(useCase), getChildFormat(useCase), cameraEdge.getCropRect(), TransformUtils.getRotatedSize(cameraEdge.getCropRect(), rotationDegrees), rotationDegrees, useCase.isMirroringRequired(this)));
        }
        return outConfigs;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setChildrenEdges(Map<UseCase, SurfaceEdge> childrenEdges) {
        this.mChildrenEdges.clear();
        this.mChildrenEdges.putAll(childrenEdges);
        for (Map.Entry<UseCase, SurfaceEdge> entry : this.mChildrenEdges.entrySet()) {
            UseCase useCase = entry.getKey();
            SurfaceEdge surfaceEdge = entry.getValue();
            useCase.setViewPortCropRect(surfaceEdge.getCropRect());
            useCase.setSensorToBufferTransformMatrix(surfaceEdge.getSensorToBufferTransform());
            useCase.updateSuggestedStreamSpec(surfaceEdge.getStreamSpec());
            useCase.notifyState();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void resetChildren() {
        Threads.checkMainThread();
        for (UseCase useCase : this.mChildren) {
            onUseCaseReset(useCase);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public CameraCaptureCallback getParentMetadataCallback() {
        return this.mParentMetadataCallback;
    }

    @Override // androidx.camera.core.UseCase.StateChangeCallback
    public void onUseCaseActive(UseCase useCase) {
        Threads.checkMainThread();
        if (isUseCaseActive(useCase)) {
            return;
        }
        this.mChildrenActiveState.put(useCase, true);
        DeferrableSurface childSurface = getChildSurface(useCase);
        if (childSurface != null) {
            forceSetProvider(getUseCaseEdge(useCase), childSurface, useCase.getSessionConfig());
        }
    }

    @Override // androidx.camera.core.UseCase.StateChangeCallback
    public void onUseCaseInactive(UseCase useCase) {
        Threads.checkMainThread();
        if (!isUseCaseActive(useCase)) {
            return;
        }
        this.mChildrenActiveState.put(useCase, false);
        getUseCaseEdge(useCase).disconnect();
    }

    @Override // androidx.camera.core.UseCase.StateChangeCallback
    public void onUseCaseUpdated(UseCase useCase) {
        Threads.checkMainThread();
        if (!isUseCaseActive(useCase)) {
            return;
        }
        SurfaceEdge edge = getUseCaseEdge(useCase);
        DeferrableSurface childSurface = getChildSurface(useCase);
        if (childSurface != null) {
            forceSetProvider(edge, childSurface, useCase.getSessionConfig());
        } else {
            edge.disconnect();
        }
    }

    @Override // androidx.camera.core.UseCase.StateChangeCallback
    public void onUseCaseReset(UseCase useCase) {
        DeferrableSurface childSurface;
        Threads.checkMainThread();
        SurfaceEdge edge = getUseCaseEdge(useCase);
        edge.invalidate();
        if (isUseCaseActive(useCase) && (childSurface = getChildSurface(useCase)) != null) {
            forceSetProvider(edge, childSurface, useCase.getSessionConfig());
        }
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public boolean getHasTransform() {
        return false;
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public CameraControlInternal getCameraControlInternal() {
        return this.mVirtualCameraControl;
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public CameraInfoInternal getCameraInfoInternal() {
        return this.mParentCamera.getCameraInfoInternal();
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public Observable<CameraInternal.State> getCameraState() {
        return this.mParentCamera.getCameraState();
    }

    private int getChildRotationDegrees(UseCase child) {
        if (child instanceof Preview) {
            return this.mParentCamera.getCameraInfo().getSensorRotationDegrees(((Preview) child).getTargetRotation());
        }
        return 0;
    }

    private static int getChildFormat(UseCase useCase) {
        return useCase instanceof ImageCapture ? 256 : 34;
    }

    private static int getChildTargetType(UseCase useCase) {
        if (useCase instanceof Preview) {
            return 1;
        }
        if (useCase instanceof ImageCapture) {
            return 4;
        }
        return 2;
    }

    private static int getHighestSurfacePriority(Set<UseCaseConfig<?>> childrenConfigs) {
        int highestPriority = 0;
        for (UseCaseConfig<?> childConfig : childrenConfigs) {
            highestPriority = Math.max(highestPriority, childConfig.getSurfaceOccupancyPriority());
        }
        return highestPriority;
    }

    private SurfaceEdge getUseCaseEdge(UseCase useCase) {
        return (SurfaceEdge) Objects.requireNonNull(this.mChildrenEdges.get(useCase));
    }

    private boolean isUseCaseActive(UseCase useCase) {
        return ((Boolean) Objects.requireNonNull(this.mChildrenActiveState.get(useCase))).booleanValue();
    }

    private void forceSetProvider(SurfaceEdge edge, DeferrableSurface childSurface, SessionConfig childSessionConfig) {
        edge.invalidate();
        try {
            edge.setProvider(childSurface);
        } catch (DeferrableSurface.SurfaceClosedException e) {
            for (SessionConfig.ErrorListener listener : childSessionConfig.getErrorListeners()) {
                listener.onError(childSessionConfig, SessionConfig.SessionError.SESSION_ERROR_SURFACE_NEEDS_RESET);
            }
        }
    }

    static DeferrableSurface getChildSurface(UseCase child) {
        List<DeferrableSurface> surfaces;
        if (child instanceof ImageCapture) {
            surfaces = child.getSessionConfig().getSurfaces();
        } else {
            surfaces = child.getSessionConfig().getRepeatingCaptureConfig().getSurfaces();
        }
        Preconditions.checkState(surfaces.size() <= 1);
        if (surfaces.size() == 1) {
            return surfaces.get(0);
        }
        return null;
    }

    CameraCaptureCallback createCameraCaptureCallback() {
        return new CameraCaptureCallback() { // from class: androidx.camera.core.streamsharing.VirtualCamera.1
            @Override // androidx.camera.core.impl.CameraCaptureCallback
            public void onCaptureCompleted(CameraCaptureResult cameraCaptureResult) {
                super.onCaptureCompleted(cameraCaptureResult);
                for (UseCase child : VirtualCamera.this.mChildren) {
                    VirtualCamera.sendCameraCaptureResultToChild(cameraCaptureResult, child.getSessionConfig());
                }
            }
        };
    }

    static void sendCameraCaptureResultToChild(CameraCaptureResult cameraCaptureResult, SessionConfig sessionConfig) {
        for (CameraCaptureCallback callback : sessionConfig.getRepeatingCameraCaptureCallbacks()) {
            callback.onCaptureCompleted(new VirtualCameraCaptureResult(sessionConfig.getRepeatingCaptureConfig().getTagBundle(), cameraCaptureResult));
        }
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public void open() {
        throw new UnsupportedOperationException(UNSUPPORTED_MESSAGE);
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public void close() {
        throw new UnsupportedOperationException(UNSUPPORTED_MESSAGE);
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public ListenableFuture<Void> release() {
        throw new UnsupportedOperationException(UNSUPPORTED_MESSAGE);
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public void attachUseCases(Collection<UseCase> useCases) {
        throw new UnsupportedOperationException(UNSUPPORTED_MESSAGE);
    }

    @Override // androidx.camera.core.impl.CameraInternal
    public void detachUseCases(Collection<UseCase> useCases) {
        throw new UnsupportedOperationException(UNSUPPORTED_MESSAGE);
    }
}
