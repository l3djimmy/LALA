package androidx.camera.core.impl;

import androidx.camera.core.FocusMeteringAction;
import androidx.camera.core.FocusMeteringResult;
import androidx.camera.core.impl.utils.futures.Futures;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
/* loaded from: classes.dex */
public class RestrictedCameraControl extends ForwardingCameraControl {
    public static final int AE_REGION = 3;
    public static final int AF_REGION = 2;
    public static final int AUTO_FOCUS = 1;
    public static final int AWB_REGION = 4;
    public static final int EXPOSURE_COMPENSATION = 7;
    public static final int FLASH = 5;
    public static final int TORCH = 6;
    public static final int ZOOM = 0;
    private final CameraControlInternal mCameraControl;
    private volatile Set<Integer> mRestrictedCameraOperations;
    private volatile boolean mUseRestrictedCameraOperations;

    /* loaded from: classes.dex */
    public @interface CameraOperation {
    }

    public RestrictedCameraControl(CameraControlInternal cameraControl) {
        super(cameraControl);
        this.mUseRestrictedCameraOperations = false;
        this.mCameraControl = cameraControl;
    }

    public void enableRestrictedOperations(boolean enable, Set<Integer> restrictedOperations) {
        this.mUseRestrictedCameraOperations = enable;
        this.mRestrictedCameraOperations = restrictedOperations;
    }

    @Override // androidx.camera.core.impl.ForwardingCameraControl, androidx.camera.core.impl.CameraControlInternal
    public CameraControlInternal getImplementation() {
        return this.mCameraControl;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isOperationSupported(int... operations) {
        if (!this.mUseRestrictedCameraOperations || this.mRestrictedCameraOperations == null) {
            return true;
        }
        List<Integer> operationList = new ArrayList<>(operations.length);
        for (int operation : operations) {
            operationList.add(Integer.valueOf(operation));
        }
        return this.mRestrictedCameraOperations.containsAll(operationList);
    }

    @Override // androidx.camera.core.impl.ForwardingCameraControl, androidx.camera.core.CameraControl
    public ListenableFuture<Void> enableTorch(boolean torch) {
        if (!isOperationSupported(6)) {
            return Futures.immediateFailedFuture(new IllegalStateException("Torch is not supported"));
        }
        return this.mCameraControl.enableTorch(torch);
    }

    @Override // androidx.camera.core.impl.ForwardingCameraControl, androidx.camera.core.CameraControl
    public ListenableFuture<FocusMeteringResult> startFocusAndMetering(FocusMeteringAction action) {
        FocusMeteringAction modifiedAction = getModifiedFocusMeteringAction(action);
        if (modifiedAction == null) {
            return Futures.immediateFailedFuture(new IllegalStateException("FocusMetering is not supported"));
        }
        return this.mCameraControl.startFocusAndMetering(modifiedAction);
    }

    @Override // androidx.camera.core.impl.ForwardingCameraControl, androidx.camera.core.CameraControl
    public ListenableFuture<Void> cancelFocusAndMetering() {
        return this.mCameraControl.cancelFocusAndMetering();
    }

    @Override // androidx.camera.core.impl.ForwardingCameraControl, androidx.camera.core.CameraControl
    public ListenableFuture<Void> setZoomRatio(float ratio) {
        if (!isOperationSupported(0)) {
            return Futures.immediateFailedFuture(new IllegalStateException("Zoom is not supported"));
        }
        return this.mCameraControl.setZoomRatio(ratio);
    }

    @Override // androidx.camera.core.impl.ForwardingCameraControl, androidx.camera.core.CameraControl
    public ListenableFuture<Void> setLinearZoom(float linearZoom) {
        if (!isOperationSupported(0)) {
            return Futures.immediateFailedFuture(new IllegalStateException("Zoom is not supported"));
        }
        return this.mCameraControl.setLinearZoom(linearZoom);
    }

    @Override // androidx.camera.core.impl.ForwardingCameraControl, androidx.camera.core.CameraControl
    public ListenableFuture<Integer> setExposureCompensationIndex(int value) {
        if (!isOperationSupported(7)) {
            return Futures.immediateFailedFuture(new IllegalStateException("ExposureCompensation is not supported"));
        }
        return this.mCameraControl.setExposureCompensationIndex(value);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public FocusMeteringAction getModifiedFocusMeteringAction(FocusMeteringAction action) {
        boolean shouldModify = false;
        FocusMeteringAction.Builder builder = new FocusMeteringAction.Builder(action);
        if (!action.getMeteringPointsAf().isEmpty() && !isOperationSupported(1, 2)) {
            shouldModify = true;
            builder.removePoints(1);
        }
        if (!action.getMeteringPointsAe().isEmpty() && !isOperationSupported(3)) {
            shouldModify = true;
            builder.removePoints(2);
        }
        if (!action.getMeteringPointsAwb().isEmpty() && !isOperationSupported(4)) {
            shouldModify = true;
            builder.removePoints(4);
        }
        if (!shouldModify) {
            return action;
        }
        FocusMeteringAction modifyAction = builder.build();
        if (modifyAction.getMeteringPointsAf().isEmpty() && modifyAction.getMeteringPointsAe().isEmpty() && modifyAction.getMeteringPointsAwb().isEmpty()) {
            return null;
        }
        return builder.build();
    }
}
