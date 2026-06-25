package androidx.camera.core.internal;

import android.util.Rational;
import android.util.Size;
import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.ImageOutputConfig;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.utils.AspectRatioUtil;
import androidx.camera.core.impl.utils.CameraOrientationUtil;
import androidx.camera.core.impl.utils.CompareSizesByArea;
import androidx.camera.core.internal.utils.SizeUtil;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class SupportedOutputSizesSorterLegacy {
    private static final String TAG = "SupportedOutputSizesCollector";
    private final Rational mFullFovRatio;
    private final boolean mIsSensorLandscapeResolution;
    private final int mLensFacing;
    private final int mSensorOrientation;

    /* JADX INFO: Access modifiers changed from: package-private */
    public SupportedOutputSizesSorterLegacy(CameraInfoInternal cameraInfoInternal, Rational fullFovRatio) {
        this.mSensorOrientation = cameraInfoInternal.getSensorRotationDegrees();
        this.mLensFacing = cameraInfoInternal.getLensFacing();
        this.mFullFovRatio = fullFovRatio;
        boolean z = true;
        if (this.mFullFovRatio != null && this.mFullFovRatio.getNumerator() < this.mFullFovRatio.getDenominator()) {
            z = false;
        }
        this.mIsSensorLandscapeResolution = z;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public List<Size> sortSupportedOutputSizes(List<Size> resolutionCandidateList, UseCaseConfig<?> useCaseConfig) {
        if (resolutionCandidateList.isEmpty()) {
            return resolutionCandidateList;
        }
        List<Size> descendingSizeList = new ArrayList<>(resolutionCandidateList);
        Collections.sort(descendingSizeList, new CompareSizesByArea(true));
        List<Size> filteredSizeList = new ArrayList<>();
        ImageOutputConfig imageOutputConfig = (ImageOutputConfig) useCaseConfig;
        Size maxSize = imageOutputConfig.getMaxResolution(null);
        Size maxSupportedOutputSize = descendingSizeList.get(0);
        if (maxSize == null || SizeUtil.getArea(maxSupportedOutputSize) < SizeUtil.getArea(maxSize)) {
            maxSize = maxSupportedOutputSize;
        }
        Size targetSize = getTargetSize(imageOutputConfig);
        Size minSize = SizeUtil.RESOLUTION_VGA;
        int defaultSizeArea = SizeUtil.getArea(SizeUtil.RESOLUTION_VGA);
        int maxSizeArea = SizeUtil.getArea(maxSize);
        if (maxSizeArea < defaultSizeArea) {
            minSize = SizeUtil.RESOLUTION_ZERO;
        } else if (targetSize != null && SizeUtil.getArea(targetSize) < defaultSizeArea) {
            minSize = targetSize;
        }
        for (Size outputSize : descendingSizeList) {
            if (SizeUtil.getArea(outputSize) <= SizeUtil.getArea(maxSize) && SizeUtil.getArea(outputSize) >= SizeUtil.getArea(minSize) && !filteredSizeList.contains(outputSize)) {
                filteredSizeList.add(outputSize);
            }
        }
        if (filteredSizeList.isEmpty()) {
            throw new IllegalArgumentException("All supported output sizes are filtered out according to current resolution selection settings. \nminSize = " + minSize + "\nmaxSize = " + maxSize + "\ninitial size list: " + descendingSizeList);
        }
        Rational aspectRatio = getTargetAspectRatioByLegacyApi(imageOutputConfig, filteredSizeList);
        Size targetSize2 = targetSize == null ? imageOutputConfig.getDefaultResolution(null) : targetSize;
        List<Size> resultSizeList = new ArrayList<>();
        new HashMap();
        if (aspectRatio == null) {
            resultSizeList.addAll(filteredSizeList);
            if (targetSize2 != null) {
                SupportedOutputSizesSorter.sortSupportedSizesByFallbackRuleClosestHigherThenLower(resultSizeList, targetSize2, true);
            }
        } else {
            Map<Rational, List<Size>> aspectRatioSizeListMap = SupportedOutputSizesSorter.groupSizesByAspectRatio(filteredSizeList);
            if (targetSize2 != null) {
                for (Rational key : aspectRatioSizeListMap.keySet()) {
                    SupportedOutputSizesSorter.sortSupportedSizesByFallbackRuleClosestHigherThenLower(aspectRatioSizeListMap.get(key), targetSize2, true);
                    filteredSizeList = filteredSizeList;
                }
            }
            List<Rational> aspectRatios = new ArrayList<>(aspectRatioSizeListMap.keySet());
            Collections.sort(aspectRatios, new AspectRatioUtil.CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace(aspectRatio, this.mFullFovRatio));
            for (Rational rational : aspectRatios) {
                for (Size size : aspectRatioSizeListMap.get(rational)) {
                    if (!resultSizeList.contains(size)) {
                        resultSizeList.add(size);
                    }
                }
            }
        }
        return resultSizeList;
    }

    private Rational getTargetAspectRatioByLegacyApi(ImageOutputConfig imageOutputConfig, List<Size> resolutionCandidateList) {
        if (imageOutputConfig.hasTargetAspectRatio()) {
            int aspectRatio = imageOutputConfig.getTargetAspectRatio();
            Rational outputRatio = SupportedOutputSizesSorter.getTargetAspectRatioRationalValue(aspectRatio, this.mIsSensorLandscapeResolution);
            return outputRatio;
        }
        Size targetSize = getTargetSize(imageOutputConfig);
        if (targetSize == null) {
            return null;
        }
        Rational outputRatio2 = getAspectRatioGroupKeyOfTargetSize(targetSize, resolutionCandidateList);
        return outputRatio2;
    }

    private Size getTargetSize(ImageOutputConfig imageOutputConfig) {
        int targetRotation = imageOutputConfig.getTargetRotation(0);
        Size targetSize = imageOutputConfig.getTargetResolution(null);
        return flipSizeByRotation(targetSize, targetRotation, this.mLensFacing, this.mSensorOrientation);
    }

    private static Rational getAspectRatioGroupKeyOfTargetSize(Size targetSize, List<Size> resolutionCandidateList) {
        if (targetSize == null) {
            return null;
        }
        List<Rational> aspectRatios = SupportedOutputSizesSorter.getResolutionListGroupingAspectRatioKeys(resolutionCandidateList);
        for (Rational aspectRatio : aspectRatios) {
            if (AspectRatioUtil.hasMatchingAspectRatio(targetSize, aspectRatio)) {
                return aspectRatio;
            }
        }
        return new Rational(targetSize.getWidth(), targetSize.getHeight());
    }

    private static Size flipSizeByRotation(Size size, int targetRotation, int lensFacing, int sensorOrientation) {
        if (size == null || !isRotationNeeded(targetRotation, lensFacing, sensorOrientation)) {
            return size;
        }
        Size outputSize = new Size(size.getHeight(), size.getWidth());
        return outputSize;
    }

    private static boolean isRotationNeeded(int targetRotation, int lensFacing, int sensorOrientation) {
        int relativeRotationDegrees = CameraOrientationUtil.surfaceRotationToDegrees(targetRotation);
        boolean isOppositeFacingScreen = 1 == lensFacing;
        int sensorRotationDegrees = CameraOrientationUtil.getRelativeImageRotation(relativeRotationDegrees, sensorOrientation, isOppositeFacingScreen);
        return sensorRotationDegrees == 90 || sensorRotationDegrees == 270;
    }
}
