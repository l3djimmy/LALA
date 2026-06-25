package androidx.camera.camera2.internal;

import androidx.camera.core.CameraState;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.CameraStateRegistry;
import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import java.util.Objects;
/* loaded from: classes.dex */
class CameraStateMachine {
    private static final String TAG = "CameraStateMachine";
    private final CameraStateRegistry mCameraStateRegistry;
    private final MutableLiveData<CameraState> mCameraStates = new MutableLiveData<>();

    /* JADX INFO: Access modifiers changed from: package-private */
    public CameraStateMachine(CameraStateRegistry cameraStateRegistry) {
        this.mCameraStateRegistry = cameraStateRegistry;
        this.mCameraStates.postValue(CameraState.create(CameraState.Type.CLOSED));
    }

    public void updateState(CameraInternal.State newInternalState, CameraState.StateError stateError) {
        CameraState newPublicState;
        switch (newInternalState) {
            case PENDING_OPEN:
                newPublicState = onCameraPendingOpen();
                break;
            case OPENING:
                newPublicState = CameraState.create(CameraState.Type.OPENING, stateError);
                break;
            case OPEN:
            case CONFIGURED:
                newPublicState = CameraState.create(CameraState.Type.OPEN, stateError);
                break;
            case CLOSING:
            case RELEASING:
                newPublicState = CameraState.create(CameraState.Type.CLOSING, stateError);
                break;
            case CLOSED:
            case RELEASED:
                newPublicState = CameraState.create(CameraState.Type.CLOSED, stateError);
                break;
            default:
                throw new IllegalStateException("Unknown internal camera state: " + newInternalState);
        }
        Logger.d(TAG, "New public camera state " + newPublicState + " from " + newInternalState + " and " + stateError);
        CameraState currentPublicState = this.mCameraStates.getValue();
        if (!Objects.equals(currentPublicState, newPublicState)) {
            Logger.d(TAG, "Publishing new public camera state " + newPublicState);
            this.mCameraStates.postValue(newPublicState);
        }
    }

    private CameraState onCameraPendingOpen() {
        return this.mCameraStateRegistry.isCameraClosing() ? CameraState.create(CameraState.Type.OPENING) : CameraState.create(CameraState.Type.PENDING_OPEN);
    }

    public LiveData<CameraState> getStateLiveData() {
        return this.mCameraStates;
    }
}
