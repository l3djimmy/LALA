package androidx.camera.camera2.internal;

import android.hardware.camera2.CameraCharacteristics;
import androidx.camera.camera2.internal.compat.CameraAccessExceptionCompat;
import androidx.camera.camera2.internal.compat.CameraManagerCompat;
import androidx.camera.core.CameraInfo;
import androidx.camera.core.CameraSelector;
import androidx.camera.core.CameraUnavailableException;
import androidx.camera.core.InitializationException;
import androidx.camera.core.impl.CameraInfoInternal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
/* loaded from: classes.dex */
class CameraSelectionOptimizer {
    private CameraSelectionOptimizer() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static List<String> getSelectedAvailableCameraIds(Camera2CameraFactory cameraFactory, CameraSelector availableCamerasSelector) throws InitializationException {
        String skippedCameraId;
        try {
            List<String> availableCameraIds = new ArrayList<>();
            List<String> cameraIdList = Arrays.asList(cameraFactory.getCameraManager().getCameraIdList());
            if (availableCamerasSelector == null) {
                for (String id : cameraIdList) {
                    availableCameraIds.add(id);
                }
                return availableCameraIds;
            }
            try {
                Integer lensFacingInteger = availableCamerasSelector.getLensFacing();
                skippedCameraId = decideSkippedCameraIdByHeuristic(cameraFactory.getCameraManager(), lensFacingInteger, cameraIdList);
            } catch (IllegalStateException e) {
                skippedCameraId = null;
            }
            List<CameraInfo> cameraInfos = new ArrayList<>();
            for (String id2 : cameraIdList) {
                if (!id2.equals(skippedCameraId)) {
                    Camera2CameraInfoImpl cameraInfo = cameraFactory.getCameraInfo(id2);
                    cameraInfos.add(cameraInfo);
                }
            }
            List<CameraInfo> filteredCameraInfos = availableCamerasSelector.filter(cameraInfos);
            for (CameraInfo cameraInfo2 : filteredCameraInfos) {
                String cameraId = ((CameraInfoInternal) cameraInfo2).getCameraId();
                availableCameraIds.add(cameraId);
            }
            return availableCameraIds;
        } catch (CameraAccessExceptionCompat e2) {
            throw new InitializationException(CameraUnavailableExceptionHelper.createFrom(e2));
        } catch (CameraUnavailableException e3) {
            throw new InitializationException(e3);
        }
    }

    private static String decideSkippedCameraIdByHeuristic(CameraManagerCompat cameraManager, Integer lensFacingInteger, List<String> cameraIdList) throws CameraAccessExceptionCompat {
        if (lensFacingInteger == null || !cameraIdList.contains("0") || !cameraIdList.contains("1")) {
            return null;
        }
        if (lensFacingInteger.intValue() == 1) {
            if (((Integer) cameraManager.getCameraCharacteristicsCompat("0").get(CameraCharacteristics.LENS_FACING)).intValue() != 1) {
                return null;
            }
            return "1";
        } else if (lensFacingInteger.intValue() != 0 || ((Integer) cameraManager.getCameraCharacteristicsCompat("1").get(CameraCharacteristics.LENS_FACING)).intValue() != 0) {
            return null;
        } else {
            return "0";
        }
    }
}
