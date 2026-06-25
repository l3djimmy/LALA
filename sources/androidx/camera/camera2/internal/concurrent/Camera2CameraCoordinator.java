package androidx.camera.camera2.internal.concurrent;

import android.hardware.camera2.CameraCharacteristics;
import androidx.camera.camera2.internal.compat.CameraAccessExceptionCompat;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.camera2.internal.compat.CameraManagerCompat;
import androidx.camera.camera2.interop.Camera2CameraInfo;
import androidx.camera.core.CameraFilter;
import androidx.camera.core.CameraInfo;
import androidx.camera.core.CameraSelector;
import androidx.camera.core.Logger;
import androidx.camera.core.concurrent.CameraCoordinator;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
/* loaded from: classes.dex */
public class Camera2CameraCoordinator implements CameraCoordinator {
    private static final String TAG = "Camera2CameraCoordinator";
    private final CameraManagerCompat mCameraManager;
    private int mCameraOperatingMode = 0;
    private final Map<String, List<String>> mConcurrentCameraIdMap = new HashMap();
    private Set<Set<String>> mConcurrentCameraIds = new HashSet();
    private final List<CameraCoordinator.ConcurrentCameraModeListener> mConcurrentCameraModeListeners = new ArrayList();
    private List<CameraInfo> mActiveConcurrentCameraInfos = new ArrayList();

    public Camera2CameraCoordinator(CameraManagerCompat cameraManager) {
        this.mCameraManager = cameraManager;
        retrieveConcurrentCameraIds();
    }

    @Override // androidx.camera.core.concurrent.CameraCoordinator
    public List<List<CameraSelector>> getConcurrentCameraSelectors() {
        List<List<CameraSelector>> concurrentCameraSelectorLists = new ArrayList<>();
        for (Set<String> concurrentCameraIdList : this.mConcurrentCameraIds) {
            List<CameraSelector> cameraSelectors = new ArrayList<>();
            for (String concurrentCameraId : concurrentCameraIdList) {
                cameraSelectors.add(createCameraSelectorById(this.mCameraManager, concurrentCameraId));
            }
            concurrentCameraSelectorLists.add(cameraSelectors);
        }
        return concurrentCameraSelectorLists;
    }

    @Override // androidx.camera.core.concurrent.CameraCoordinator
    public List<CameraInfo> getActiveConcurrentCameraInfos() {
        return this.mActiveConcurrentCameraInfos;
    }

    @Override // androidx.camera.core.concurrent.CameraCoordinator
    public void setActiveConcurrentCameraInfos(List<CameraInfo> cameraInfos) {
        this.mActiveConcurrentCameraInfos = new ArrayList(cameraInfos);
    }

    @Override // androidx.camera.core.concurrent.CameraCoordinator
    public String getPairedConcurrentCameraId(String cameraId) {
        if (this.mConcurrentCameraIdMap.containsKey(cameraId)) {
            for (String pairedCameraId : this.mConcurrentCameraIdMap.get(cameraId)) {
                for (CameraInfo cameraInfo : this.mActiveConcurrentCameraInfos) {
                    if (pairedCameraId.equals(Camera2CameraInfo.from(cameraInfo).getCameraId())) {
                        return pairedCameraId;
                    }
                }
            }
            return null;
        }
        return null;
    }

    @Override // androidx.camera.core.concurrent.CameraCoordinator
    public int getCameraOperatingMode() {
        return this.mCameraOperatingMode;
    }

    @Override // androidx.camera.core.concurrent.CameraCoordinator
    public void setCameraOperatingMode(int cameraOperatingMode) {
        if (cameraOperatingMode != this.mCameraOperatingMode) {
            for (CameraCoordinator.ConcurrentCameraModeListener listener : this.mConcurrentCameraModeListeners) {
                listener.onCameraOperatingModeUpdated(this.mCameraOperatingMode, cameraOperatingMode);
            }
        }
        if (this.mCameraOperatingMode == 2 && cameraOperatingMode != 2) {
            this.mActiveConcurrentCameraInfos.clear();
        }
        this.mCameraOperatingMode = cameraOperatingMode;
    }

    @Override // androidx.camera.core.concurrent.CameraCoordinator
    public void addListener(CameraCoordinator.ConcurrentCameraModeListener listener) {
        this.mConcurrentCameraModeListeners.add(listener);
    }

    @Override // androidx.camera.core.concurrent.CameraCoordinator
    public void removeListener(CameraCoordinator.ConcurrentCameraModeListener listener) {
        this.mConcurrentCameraModeListeners.remove(listener);
    }

    @Override // androidx.camera.core.concurrent.CameraCoordinator
    public void shutdown() {
        this.mConcurrentCameraModeListeners.clear();
        this.mConcurrentCameraIdMap.clear();
        this.mActiveConcurrentCameraInfos.clear();
        this.mConcurrentCameraIds.clear();
        this.mCameraOperatingMode = 0;
    }

    private void retrieveConcurrentCameraIds() {
        try {
            this.mConcurrentCameraIds = this.mCameraManager.getConcurrentCameraIds();
        } catch (CameraAccessExceptionCompat e) {
            Logger.e(TAG, "Failed to get concurrent camera ids");
        }
        for (Set<String> concurrentCameraIdList : this.mConcurrentCameraIds) {
            List<String> cameraIdList = new ArrayList<>(concurrentCameraIdList);
            if (cameraIdList.size() >= 2) {
                String cameraId1 = cameraIdList.get(0);
                String cameraId2 = cameraIdList.get(1);
                if (!this.mConcurrentCameraIdMap.containsKey(cameraId1)) {
                    this.mConcurrentCameraIdMap.put(cameraId1, new ArrayList());
                }
                if (!this.mConcurrentCameraIdMap.containsKey(cameraId2)) {
                    this.mConcurrentCameraIdMap.put(cameraId2, new ArrayList());
                }
                this.mConcurrentCameraIdMap.get(cameraId1).add(cameraIdList.get(1));
                this.mConcurrentCameraIdMap.get(cameraId2).add(cameraIdList.get(0));
            }
        }
    }

    private static CameraSelector createCameraSelectorById(CameraManagerCompat cameraManager, final String cameraId) {
        CameraSelector.Builder builder = new CameraSelector.Builder().addCameraFilter(new CameraFilter() { // from class: androidx.camera.camera2.internal.concurrent.Camera2CameraCoordinator$$ExternalSyntheticLambda0
            @Override // androidx.camera.core.CameraFilter
            public final List filter(List list) {
                return Camera2CameraCoordinator.lambda$createCameraSelectorById$0(cameraId, list);
            }
        });
        try {
            CameraCharacteristicsCompat cameraCharacteristics = cameraManager.getCameraCharacteristicsCompat(cameraId);
            Integer cameraLensFacing = (Integer) cameraCharacteristics.get(CameraCharacteristics.LENS_FACING);
            builder.requireLensFacing(cameraLensFacing.intValue());
            return builder.build();
        } catch (CameraAccessExceptionCompat e) {
            throw new RuntimeException(e);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ List lambda$createCameraSelectorById$0(String cameraId, List cameraInfos) {
        Iterator it = cameraInfos.iterator();
        while (it.hasNext()) {
            CameraInfo cameraInfo = (CameraInfo) it.next();
            if (cameraId.equals(Camera2CameraInfo.from(cameraInfo).getCameraId())) {
                return Collections.singletonList(cameraInfo);
            }
        }
        throw new IllegalArgumentException("No camera can be find for id: " + cameraId);
    }
}
