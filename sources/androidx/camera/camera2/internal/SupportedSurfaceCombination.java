package androidx.camera.camera2.internal;

import android.content.Context;
import android.graphics.SurfaceTexture;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.params.StreamConfigurationMap;
import android.media.CamcorderProfile;
import android.media.MediaRecorder;
import android.os.Build;
import android.util.Pair;
import android.util.Range;
import android.util.Rational;
import android.util.Size;
import androidx.camera.camera2.internal.compat.CameraAccessExceptionCompat;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.camera2.internal.compat.CameraManagerCompat;
import androidx.camera.camera2.internal.compat.StreamConfigurationMapCompat;
import androidx.camera.camera2.internal.compat.workaround.ExtraSupportedSurfaceCombinationsContainer;
import androidx.camera.camera2.internal.compat.workaround.ResolutionCorrector;
import androidx.camera.camera2.internal.compat.workaround.TargetAspectRatio;
import androidx.camera.core.CameraUnavailableException;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.impl.AttachedSurfaceInfo;
import androidx.camera.core.impl.CameraMode;
import androidx.camera.core.impl.StreamSpec;
import androidx.camera.core.impl.SurfaceCombination;
import androidx.camera.core.impl.SurfaceConfig;
import androidx.camera.core.impl.SurfaceSizeDefinition;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.utils.AspectRatioUtil;
import androidx.camera.core.impl.utils.CompareSizesByArea;
import androidx.camera.core.internal.utils.SizeUtil;
import androidx.core.util.Preconditions;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
/* loaded from: classes.dex */
final class SupportedSurfaceCombination {
    private static final String TAG = "SupportedSurfaceCombination";
    private final CamcorderProfileHelper mCamcorderProfileHelper;
    private final String mCameraId;
    private final CameraCharacteristicsCompat mCharacteristics;
    private final DisplayInfoManager mDisplayInfoManager;
    private final DynamicRangeResolver mDynamicRangeResolver;
    private final int mHardwareLevel;
    private boolean mIsBurstCaptureSupported;
    private boolean mIsConcurrentCameraModeSupported;
    private boolean mIsRawSupported;
    private boolean mIsStreamUseCaseSupported;
    private boolean mIsUltraHighResolutionSensorSupported;
    SurfaceSizeDefinition mSurfaceSizeDefinition;
    private final List<SurfaceCombination> mSurfaceCombinations = new ArrayList();
    private final List<SurfaceCombination> mUltraHighSurfaceCombinations = new ArrayList();
    private final List<SurfaceCombination> mConcurrentSurfaceCombinations = new ArrayList();
    private final Map<FeatureSettings, List<SurfaceCombination>> mFeatureSettingsToSupportedCombinationsMap = new HashMap();
    private final List<SurfaceCombination> mSurfaceCombinations10Bit = new ArrayList();
    private final List<SurfaceCombination> mSurfaceCombinationsStreamUseCase = new ArrayList();
    List<Integer> mSurfaceSizeDefinitionFormats = new ArrayList();
    private final TargetAspectRatio mTargetAspectRatio = new TargetAspectRatio();
    private final ResolutionCorrector mResolutionCorrector = new ResolutionCorrector();
    private final ExtraSupportedSurfaceCombinationsContainer mExtraSupportedSurfaceCombinationsContainer = new ExtraSupportedSurfaceCombinationsContainer();

    /* JADX INFO: Access modifiers changed from: package-private */
    public SupportedSurfaceCombination(Context context, String cameraId, CameraManagerCompat cameraManagerCompat, CamcorderProfileHelper camcorderProfileHelper) throws CameraUnavailableException {
        this.mIsRawSupported = false;
        this.mIsBurstCaptureSupported = false;
        this.mIsConcurrentCameraModeSupported = false;
        this.mIsStreamUseCaseSupported = false;
        this.mIsUltraHighResolutionSensorSupported = false;
        this.mCameraId = (String) Preconditions.checkNotNull(cameraId);
        this.mCamcorderProfileHelper = (CamcorderProfileHelper) Preconditions.checkNotNull(camcorderProfileHelper);
        this.mDisplayInfoManager = DisplayInfoManager.getInstance(context);
        try {
            this.mCharacteristics = cameraManagerCompat.getCameraCharacteristicsCompat(this.mCameraId);
            Integer keyValue = (Integer) this.mCharacteristics.get(CameraCharacteristics.INFO_SUPPORTED_HARDWARE_LEVEL);
            this.mHardwareLevel = keyValue != null ? keyValue.intValue() : 2;
            int[] availableCapabilities = (int[]) this.mCharacteristics.get(CameraCharacteristics.REQUEST_AVAILABLE_CAPABILITIES);
            if (availableCapabilities != null) {
                for (int capability : availableCapabilities) {
                    if (capability == 3) {
                        this.mIsRawSupported = true;
                    } else if (capability == 6) {
                        this.mIsBurstCaptureSupported = true;
                    } else if (Build.VERSION.SDK_INT >= 31 && capability == 16) {
                        this.mIsUltraHighResolutionSensorSupported = true;
                    }
                }
            }
            this.mDynamicRangeResolver = new DynamicRangeResolver(this.mCharacteristics);
            generateSupportedCombinationList();
            if (this.mIsUltraHighResolutionSensorSupported) {
                generateUltraHighSupportedCombinationList();
            }
            this.mIsConcurrentCameraModeSupported = context.getPackageManager().hasSystemFeature("android.hardware.camera.concurrent");
            if (this.mIsConcurrentCameraModeSupported) {
                generateConcurrentSupportedCombinationList();
            }
            if (this.mDynamicRangeResolver.is10BitDynamicRangeSupported()) {
                generate10BitSupportedCombinationList();
            }
            this.mIsStreamUseCaseSupported = StreamUseCaseUtil.isStreamUseCaseSupported(this.mCharacteristics);
            if (this.mIsStreamUseCaseSupported) {
                generateStreamUseCaseSupportedCombinationList();
            }
            generateSurfaceSizeDefinition();
            checkCustomization();
        } catch (CameraAccessExceptionCompat e) {
            throw CameraUnavailableExceptionHelper.createFrom(e);
        }
    }

    String getCameraId() {
        return this.mCameraId;
    }

    boolean isRawSupported() {
        return this.mIsRawSupported;
    }

    boolean isBurstCaptureSupported() {
        return this.mIsBurstCaptureSupported;
    }

    boolean checkSupported(FeatureSettings featureSettings, List<SurfaceConfig> surfaceConfigList) {
        boolean isSupported = false;
        for (SurfaceCombination surfaceCombination : getSurfaceCombinationsByFeatureSettings(featureSettings)) {
            isSupported = surfaceCombination.getOrderedSupportedSurfaceConfigList(surfaceConfigList) != null;
            if (isSupported) {
                break;
            }
        }
        return isSupported;
    }

    List<SurfaceConfig> getOrderedSupportedStreamUseCaseSurfaceConfigList(FeatureSettings featureSettings, List<SurfaceConfig> surfaceConfigList) {
        if (StreamUseCaseUtil.shouldUseStreamUseCase(featureSettings)) {
            for (SurfaceCombination surfaceCombination : this.mSurfaceCombinationsStreamUseCase) {
                List<SurfaceConfig> orderedSurfaceConfigList = surfaceCombination.getOrderedSupportedSurfaceConfigList(surfaceConfigList);
                if (orderedSurfaceConfigList != null) {
                    return orderedSurfaceConfigList;
                }
            }
            return null;
        }
        return null;
    }

    private List<SurfaceCombination> getSurfaceCombinationsByFeatureSettings(FeatureSettings featureSettings) {
        if (this.mFeatureSettingsToSupportedCombinationsMap.containsKey(featureSettings)) {
            return this.mFeatureSettingsToSupportedCombinationsMap.get(featureSettings);
        }
        List<SurfaceCombination> supportedSurfaceCombinations = new ArrayList<>();
        if (featureSettings.getRequiredMaxBitDepth() == 8) {
            switch (featureSettings.getCameraMode()) {
                case 1:
                    supportedSurfaceCombinations = this.mConcurrentSurfaceCombinations;
                    break;
                case 2:
                    supportedSurfaceCombinations.addAll(this.mUltraHighSurfaceCombinations);
                    supportedSurfaceCombinations.addAll(this.mSurfaceCombinations);
                    break;
                default:
                    supportedSurfaceCombinations.addAll(this.mSurfaceCombinations);
                    break;
            }
        } else if (featureSettings.getRequiredMaxBitDepth() == 10 && featureSettings.getCameraMode() == 0) {
            supportedSurfaceCombinations.addAll(this.mSurfaceCombinations10Bit);
        }
        this.mFeatureSettingsToSupportedCombinationsMap.put(featureSettings, supportedSurfaceCombinations);
        return supportedSurfaceCombinations;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public SurfaceConfig transformSurfaceConfig(int cameraMode, int imageFormat, Size size) {
        return SurfaceConfig.transformSurfaceConfig(cameraMode, imageFormat, size, getUpdatedSurfaceSizeDefinitionByFormat(imageFormat));
    }

    static int getMaxFrameRate(CameraCharacteristicsCompat characteristics, int imageFormat, Size size) {
        try {
            int maxFramerate = (int) (1.0E9d / ((StreamConfigurationMap) characteristics.get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP)).getOutputMinFrameDuration(imageFormat, size));
            return maxFramerate;
        } catch (Exception e) {
            return 0;
        }
    }

    private static int getRangeLength(Range<Integer> range) {
        return (range.getUpper().intValue() - range.getLower().intValue()) + 1;
    }

    private static int getRangeDistance(Range<Integer> firstRange, Range<Integer> secondRange) {
        Preconditions.checkState((firstRange.contains((Range<Integer>) secondRange.getUpper()) || firstRange.contains((Range<Integer>) secondRange.getLower())) ? false : true, "Ranges must not intersect");
        if (firstRange.getLower().intValue() > secondRange.getUpper().intValue()) {
            return firstRange.getLower().intValue() - secondRange.getUpper().intValue();
        }
        return secondRange.getLower().intValue() - firstRange.getUpper().intValue();
    }

    private static Range<Integer> compareIntersectingRanges(Range<Integer> targetFps, Range<Integer> storedRange, Range<Integer> newRange) {
        double storedIntersectionsize = getRangeLength(storedRange.intersect(targetFps));
        double newIntersectionSize = getRangeLength(newRange.intersect(targetFps));
        double newRangeRatio = newIntersectionSize / getRangeLength(newRange);
        double storedRangeRatio = storedIntersectionsize / getRangeLength(storedRange);
        if (newIntersectionSize > storedIntersectionsize) {
            if (newRangeRatio >= 0.5d || newRangeRatio >= storedRangeRatio) {
                return newRange;
            }
        } else if (newIntersectionSize == storedIntersectionsize) {
            if (newRangeRatio > storedRangeRatio) {
                return newRange;
            }
            if (newRangeRatio == storedRangeRatio && newRange.getLower().intValue() > storedRange.getLower().intValue()) {
                return newRange;
            }
        } else if (storedRangeRatio < 0.5d && newRangeRatio > storedRangeRatio) {
            return newRange;
        }
        return storedRange;
    }

    private Range<Integer> getClosestSupportedDeviceFrameRate(Range<Integer> targetFrameRate, int maxFps) {
        if (targetFrameRate == null || targetFrameRate.equals(StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED)) {
            return StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED;
        }
        Range<Integer>[] availableFpsRanges = (Range[]) this.mCharacteristics.get(CameraCharacteristics.CONTROL_AE_AVAILABLE_TARGET_FPS_RANGES);
        if (availableFpsRanges == null) {
            return StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED;
        }
        Range<Integer> targetFrameRate2 = new Range<>(Integer.valueOf(Math.min(targetFrameRate.getLower().intValue(), maxFps)), Integer.valueOf(Math.min(targetFrameRate.getUpper().intValue(), maxFps)));
        Range<Integer> bestRange = StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED;
        int currentIntersectSize = 0;
        for (Range<Integer> potentialRange : availableFpsRanges) {
            if (maxFps >= potentialRange.getLower().intValue()) {
                if (bestRange.equals(StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED)) {
                    bestRange = potentialRange;
                }
                if (potentialRange.equals(targetFrameRate2)) {
                    return potentialRange;
                }
                try {
                    Range<Integer> newIntersection = potentialRange.intersect(targetFrameRate2);
                    int newIntersectSize = getRangeLength(newIntersection);
                    if (currentIntersectSize == 0) {
                        bestRange = potentialRange;
                        currentIntersectSize = newIntersectSize;
                    } else if (newIntersectSize >= currentIntersectSize) {
                        bestRange = compareIntersectingRanges(targetFrameRate2, bestRange, potentialRange);
                        currentIntersectSize = getRangeLength(targetFrameRate2.intersect(bestRange));
                    }
                } catch (IllegalArgumentException e) {
                    if (currentIntersectSize == 0) {
                        if (getRangeDistance(potentialRange, targetFrameRate2) < getRangeDistance(bestRange, targetFrameRate2)) {
                            bestRange = potentialRange;
                        } else if (getRangeDistance(potentialRange, targetFrameRate2) == getRangeDistance(bestRange, targetFrameRate2)) {
                            if (potentialRange.getLower().intValue() > bestRange.getUpper().intValue()) {
                                bestRange = potentialRange;
                            } else if (getRangeLength(potentialRange) < getRangeLength(bestRange)) {
                                bestRange = potentialRange;
                            }
                        }
                    }
                }
            }
        }
        return bestRange;
    }

    private Range<Integer> getUpdatedTargetFramerate(Range<Integer> newTargetFramerate, Range<Integer> storedTargetFramerate) {
        if (storedTargetFramerate == null) {
            return newTargetFramerate;
        }
        if (newTargetFramerate == null) {
            return storedTargetFramerate;
        }
        try {
            Range<Integer> updatedTarget = storedTargetFramerate.intersect(newTargetFramerate);
            return updatedTarget;
        } catch (IllegalArgumentException e) {
            return storedTargetFramerate;
        }
    }

    private int getUpdatedMaximumFps(int currentMaxFps, int imageFormat, Size size) {
        return Math.min(currentMaxFps, getMaxFrameRate(this.mCharacteristics, imageFormat, size));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Pair<Map<UseCaseConfig<?>, StreamSpec>, Map<AttachedSurfaceInfo, StreamSpec>> getSuggestedStreamSpecifications(int cameraMode, List<AttachedSurfaceInfo> attachedSurfaces, Map<UseCaseConfig<?>, List<Size>> newUseCaseConfigsSupportedSizeMap) {
        Map<UseCaseConfig<?>, StreamSpec> suggestedStreamSpecMap;
        Map<Integer, AttachedSurfaceInfo> surfaceConfigIndexAttachedSurfaceInfoMap;
        Range<Integer> targetFpsRange;
        Map<Integer, UseCaseConfig<?>> surfaceConfigIndexUseCaseConfigMap;
        Map<Integer, UseCaseConfig<?>> surfaceConfigIndexUseCaseConfigMap2;
        String str;
        String str2;
        Map<Integer, AttachedSurfaceInfo> surfaceConfigIndexAttachedSurfaceInfoMap2;
        List<Size> savedSizes;
        List<Size> savedSizesForStreamUseCase;
        Map<AttachedSurfaceInfo, StreamSpec> attachedSurfaceStreamSpecMap;
        List<Size> possibleSizeList;
        int savedConfigMaxFpsForStreamUseCase;
        boolean isSurfaceCombinationSupported;
        refreshPreviewSize();
        List<UseCaseConfig<?>> newUseCaseConfigs = new ArrayList<>(newUseCaseConfigsSupportedSizeMap.keySet());
        List<Integer> useCasesPriorityOrder = getUseCasesPriorityOrder(newUseCaseConfigs);
        Map<UseCaseConfig<?>, DynamicRange> resolvedDynamicRanges = this.mDynamicRangeResolver.resolveAndValidateDynamicRanges(attachedSurfaces, newUseCaseConfigs, useCasesPriorityOrder);
        FeatureSettings featureSettings = createFeatureSettings(cameraMode, resolvedDynamicRanges);
        boolean isSurfaceCombinationSupported2 = isUseCasesCombinationSupported(featureSettings, attachedSurfaces, newUseCaseConfigsSupportedSizeMap);
        String str3 = " New configs: ";
        String str4 = "No supported surface combination is found for camera device - Id : ";
        if (!isSurfaceCombinationSupported2) {
            throw new IllegalArgumentException("No supported surface combination is found for camera device - Id : " + this.mCameraId + ".  May be attempting to bind too many use cases. Existing surfaces: " + attachedSurfaces + " New configs: " + newUseCaseConfigs);
        }
        Range<Integer> targetFpsRange2 = getTargetFpsRange(attachedSurfaces, newUseCaseConfigs, useCasesPriorityOrder);
        Map<UseCaseConfig<?>, List<Size>> useCaseConfigToFilteredSupportedSizesMap = filterSupportedSizes(newUseCaseConfigsSupportedSizeMap, featureSettings, targetFpsRange2);
        List<List<Size>> supportedOutputSizesList = new ArrayList<>();
        for (Integer index : useCasesPriorityOrder) {
            UseCaseConfig<?> useCaseConfig = newUseCaseConfigs.get(index.intValue());
            List<Size> supportedOutputSizes = useCaseConfigToFilteredSupportedSizesMap.get(useCaseConfig);
            supportedOutputSizesList.add(applyResolutionSelectionOrderRelatedWorkarounds(supportedOutputSizes, useCaseConfig.getInputFormat()));
            targetFpsRange2 = targetFpsRange2;
        }
        Range<Integer> targetFpsRange3 = targetFpsRange2;
        List<List<Size>> allPossibleSizeArrangements = getAllPossibleSizeArrangements(supportedOutputSizesList);
        Map<AttachedSurfaceInfo, StreamSpec> attachedSurfaceStreamSpecMap2 = new HashMap<>();
        Map<UseCaseConfig<?>, StreamSpec> suggestedStreamSpecMap2 = new HashMap<>();
        Map<Integer, AttachedSurfaceInfo> surfaceConfigIndexAttachedSurfaceInfoMap3 = new HashMap<>();
        Map<Integer, UseCaseConfig<?>> surfaceConfigIndexUseCaseConfigMap3 = new HashMap<>();
        boolean containsZsl = StreamUseCaseUtil.containsZslUseCase(attachedSurfaces, newUseCaseConfigs);
        List<SurfaceConfig> orderedSurfaceConfigListForStreamUseCase = null;
        int maxSupportedFps = getMaxSupportedFpsFromAttachedSurfaces(attachedSurfaces);
        if (!this.mIsStreamUseCaseSupported || containsZsl) {
            suggestedStreamSpecMap = suggestedStreamSpecMap2;
            surfaceConfigIndexAttachedSurfaceInfoMap = surfaceConfigIndexAttachedSurfaceInfoMap3;
            targetFpsRange = targetFpsRange3;
            surfaceConfigIndexUseCaseConfigMap = surfaceConfigIndexUseCaseConfigMap3;
        } else {
            Iterator<List<Size>> it = allPossibleSizeArrangements.iterator();
            while (true) {
                if (!it.hasNext()) {
                    suggestedStreamSpecMap = suggestedStreamSpecMap2;
                    surfaceConfigIndexAttachedSurfaceInfoMap = surfaceConfigIndexAttachedSurfaceInfoMap3;
                    targetFpsRange = targetFpsRange3;
                    surfaceConfigIndexUseCaseConfigMap = surfaceConfigIndexUseCaseConfigMap3;
                    isSurfaceCombinationSupported = isSurfaceCombinationSupported2;
                    break;
                }
                suggestedStreamSpecMap = suggestedStreamSpecMap2;
                targetFpsRange = targetFpsRange3;
                List<List<Size>> supportedOutputSizesList2 = supportedOutputSizesList;
                Map<Integer, AttachedSurfaceInfo> surfaceConfigIndexAttachedSurfaceInfoMap4 = surfaceConfigIndexAttachedSurfaceInfoMap3;
                Map<Integer, UseCaseConfig<?>> surfaceConfigIndexUseCaseConfigMap4 = surfaceConfigIndexUseCaseConfigMap3;
                isSurfaceCombinationSupported = isSurfaceCombinationSupported2;
                surfaceConfigIndexUseCaseConfigMap = surfaceConfigIndexUseCaseConfigMap4;
                List<SurfaceConfig> surfaceConfigs = (List) getSurfaceConfigListAndFpsCeiling(cameraMode, attachedSurfaces, it.next(), newUseCaseConfigs, useCasesPriorityOrder, maxSupportedFps, surfaceConfigIndexAttachedSurfaceInfoMap4, surfaceConfigIndexUseCaseConfigMap4).first;
                List<SurfaceConfig> orderedSurfaceConfigListForStreamUseCase2 = getOrderedSupportedStreamUseCaseSurfaceConfigList(featureSettings, surfaceConfigs);
                if (orderedSurfaceConfigListForStreamUseCase2 != null && !StreamUseCaseUtil.areCaptureTypesEligible(surfaceConfigIndexAttachedSurfaceInfoMap4, surfaceConfigIndexUseCaseConfigMap, orderedSurfaceConfigListForStreamUseCase2)) {
                    orderedSurfaceConfigListForStreamUseCase2 = null;
                }
                if (orderedSurfaceConfigListForStreamUseCase2 == null) {
                    surfaceConfigIndexAttachedSurfaceInfoMap = surfaceConfigIndexAttachedSurfaceInfoMap4;
                    orderedSurfaceConfigListForStreamUseCase = orderedSurfaceConfigListForStreamUseCase2;
                } else {
                    surfaceConfigIndexAttachedSurfaceInfoMap = surfaceConfigIndexAttachedSurfaceInfoMap4;
                    if (StreamUseCaseUtil.areStreamUseCasesAvailableForSurfaceConfigs(this.mCharacteristics, orderedSurfaceConfigListForStreamUseCase2)) {
                        orderedSurfaceConfigListForStreamUseCase = orderedSurfaceConfigListForStreamUseCase2;
                        break;
                    }
                    orderedSurfaceConfigListForStreamUseCase = null;
                }
                surfaceConfigIndexAttachedSurfaceInfoMap.clear();
                surfaceConfigIndexUseCaseConfigMap.clear();
                supportedOutputSizesList = supportedOutputSizesList2;
                isSurfaceCombinationSupported2 = isSurfaceCombinationSupported;
                surfaceConfigIndexAttachedSurfaceInfoMap3 = surfaceConfigIndexAttachedSurfaceInfoMap;
                surfaceConfigIndexUseCaseConfigMap3 = surfaceConfigIndexUseCaseConfigMap;
                targetFpsRange3 = targetFpsRange;
                suggestedStreamSpecMap2 = suggestedStreamSpecMap;
            }
            if (orderedSurfaceConfigListForStreamUseCase == null && !isSurfaceCombinationSupported) {
                throw new IllegalArgumentException("No supported surface combination is found for camera device - Id : " + this.mCameraId + ".  May be attempting to bind too many use cases. Existing surfaces: " + attachedSurfaces + " New configs: " + newUseCaseConfigs);
            }
        }
        List<SurfaceConfig> orderedSurfaceConfigListForStreamUseCase3 = orderedSurfaceConfigListForStreamUseCase;
        Iterator<List<Size>> it2 = allPossibleSizeArrangements.iterator();
        boolean supportedSizesFound = false;
        int savedConfigMaxFps = Integer.MAX_VALUE;
        boolean supportedSizesForStreamUseCaseFound = false;
        int savedConfigMaxFpsForStreamUseCase2 = Integer.MAX_VALUE;
        List<Size> savedSizesForStreamUseCase2 = null;
        List<Size> savedSizes2 = null;
        while (true) {
            if (!it2.hasNext()) {
                surfaceConfigIndexUseCaseConfigMap2 = surfaceConfigIndexUseCaseConfigMap;
                str = str3;
                str2 = str4;
                surfaceConfigIndexAttachedSurfaceInfoMap2 = surfaceConfigIndexAttachedSurfaceInfoMap;
                savedSizes = savedSizes2;
                savedSizesForStreamUseCase = savedSizesForStreamUseCase2;
                break;
            }
            List<Size> possibleSizeList2 = it2.next();
            int savedConfigMaxFpsForStreamUseCase3 = savedConfigMaxFpsForStreamUseCase2;
            str = str3;
            Iterator<List<Size>> it3 = it2;
            surfaceConfigIndexUseCaseConfigMap2 = surfaceConfigIndexUseCaseConfigMap;
            int savedConfigMaxFps2 = savedConfigMaxFps;
            str2 = str4;
            surfaceConfigIndexAttachedSurfaceInfoMap2 = surfaceConfigIndexAttachedSurfaceInfoMap;
            Pair<List<SurfaceConfig>, Integer> resultPair = getSurfaceConfigListAndFpsCeiling(cameraMode, attachedSurfaces, possibleSizeList2, newUseCaseConfigs, useCasesPriorityOrder, maxSupportedFps, null, null);
            List<SurfaceConfig> surfaceConfigList = (List) resultPair.first;
            int currentConfigFramerateCeiling = ((Integer) resultPair.second).intValue();
            boolean isConfigFrameRateAcceptable = true;
            if (targetFpsRange == null) {
                possibleSizeList = possibleSizeList2;
            } else if (maxSupportedFps <= currentConfigFramerateCeiling) {
                possibleSizeList = possibleSizeList2;
            } else {
                possibleSizeList = possibleSizeList2;
                if (currentConfigFramerateCeiling < targetFpsRange.getLower().intValue()) {
                    isConfigFrameRateAcceptable = false;
                }
            }
            if (!supportedSizesFound && checkSupported(featureSettings, surfaceConfigList)) {
                if (savedConfigMaxFps2 == Integer.MAX_VALUE) {
                    savedConfigMaxFps2 = currentConfigFramerateCeiling;
                    savedSizes2 = possibleSizeList;
                } else if (savedConfigMaxFps2 < currentConfigFramerateCeiling) {
                    savedConfigMaxFps2 = currentConfigFramerateCeiling;
                    savedSizes2 = possibleSizeList;
                }
                if (isConfigFrameRateAcceptable) {
                    savedConfigMaxFps2 = currentConfigFramerateCeiling;
                    savedSizes2 = possibleSizeList;
                    supportedSizesFound = true;
                    if (supportedSizesForStreamUseCaseFound) {
                        savedConfigMaxFps = savedConfigMaxFps2;
                        savedConfigMaxFpsForStreamUseCase2 = savedConfigMaxFpsForStreamUseCase3;
                        savedSizes = savedSizes2;
                        savedSizesForStreamUseCase = savedSizesForStreamUseCase2;
                        break;
                    }
                }
            }
            if (orderedSurfaceConfigListForStreamUseCase3 != null && !supportedSizesForStreamUseCaseFound && getOrderedSupportedStreamUseCaseSurfaceConfigList(featureSettings, surfaceConfigList) != null) {
                if (savedConfigMaxFpsForStreamUseCase3 == Integer.MAX_VALUE) {
                    savedConfigMaxFpsForStreamUseCase = currentConfigFramerateCeiling;
                    savedSizesForStreamUseCase2 = possibleSizeList;
                } else if (savedConfigMaxFpsForStreamUseCase3 >= currentConfigFramerateCeiling) {
                    savedConfigMaxFpsForStreamUseCase = savedConfigMaxFpsForStreamUseCase3;
                } else {
                    savedConfigMaxFpsForStreamUseCase = currentConfigFramerateCeiling;
                    savedSizesForStreamUseCase2 = possibleSizeList;
                }
                if (!isConfigFrameRateAcceptable) {
                    savedConfigMaxFpsForStreamUseCase2 = savedConfigMaxFpsForStreamUseCase;
                } else {
                    savedSizesForStreamUseCase2 = possibleSizeList;
                    supportedSizesForStreamUseCaseFound = true;
                    if (!supportedSizesFound) {
                        savedConfigMaxFpsForStreamUseCase2 = currentConfigFramerateCeiling;
                    } else {
                        savedConfigMaxFpsForStreamUseCase2 = currentConfigFramerateCeiling;
                        savedConfigMaxFps = savedConfigMaxFps2;
                        savedSizes = savedSizes2;
                        savedSizesForStreamUseCase = savedSizesForStreamUseCase2;
                        break;
                    }
                }
            } else {
                savedConfigMaxFpsForStreamUseCase2 = savedConfigMaxFpsForStreamUseCase3;
            }
            savedConfigMaxFps = savedConfigMaxFps2;
            surfaceConfigIndexAttachedSurfaceInfoMap = surfaceConfigIndexAttachedSurfaceInfoMap2;
            str3 = str;
            str4 = str2;
            it2 = it3;
            surfaceConfigIndexUseCaseConfigMap = surfaceConfigIndexUseCaseConfigMap2;
        }
        if (savedSizes == null) {
            throw new IllegalArgumentException(str2 + this.mCameraId + " and Hardware level: " + this.mHardwareLevel + ". May be the specified resolution is too large and not supported. Existing surfaces: " + attachedSurfaces + str + newUseCaseConfigs);
        }
        Range<Integer> targetFramerateForDevice = null;
        if (targetFpsRange != null) {
            targetFramerateForDevice = getClosestSupportedDeviceFrameRate(targetFpsRange, savedConfigMaxFps);
        }
        for (UseCaseConfig<?> useCaseConfig2 : newUseCaseConfigs) {
            int maxSupportedFps2 = maxSupportedFps;
            Range<Integer> targetFpsRange4 = targetFpsRange;
            Size resolutionForUseCase = savedSizes.get(useCasesPriorityOrder.indexOf(Integer.valueOf(newUseCaseConfigs.indexOf(useCaseConfig2))));
            List<Integer> useCasesPriorityOrder2 = useCasesPriorityOrder;
            StreamSpec.Builder streamSpecBuilder = StreamSpec.builder(resolutionForUseCase).setDynamicRange((DynamicRange) Preconditions.checkNotNull(resolvedDynamicRanges.get(useCaseConfig2))).setImplementationOptions(StreamUseCaseUtil.getStreamSpecImplementationOptions(useCaseConfig2));
            if (targetFramerateForDevice != null) {
                streamSpecBuilder.setExpectedFrameRateRange(targetFramerateForDevice);
            }
            suggestedStreamSpecMap.put(useCaseConfig2, streamSpecBuilder.build());
            useCasesPriorityOrder = useCasesPriorityOrder2;
            maxSupportedFps = maxSupportedFps2;
            targetFpsRange = targetFpsRange4;
        }
        Map<UseCaseConfig<?>, StreamSpec> suggestedStreamSpecMap3 = suggestedStreamSpecMap;
        if (orderedSurfaceConfigListForStreamUseCase3 == null || savedConfigMaxFps != savedConfigMaxFpsForStreamUseCase2) {
            attachedSurfaceStreamSpecMap = attachedSurfaceStreamSpecMap2;
        } else if (savedSizes.size() != savedSizesForStreamUseCase.size()) {
            attachedSurfaceStreamSpecMap = attachedSurfaceStreamSpecMap2;
        } else {
            boolean hasDifferenceSavedSizes = false;
            int i = 0;
            while (true) {
                if (i < savedSizes.size()) {
                    if (savedSizes.get(i).equals(savedSizesForStreamUseCase.get(i))) {
                        i++;
                    } else {
                        hasDifferenceSavedSizes = true;
                        break;
                    }
                } else {
                    break;
                }
            }
            if (hasDifferenceSavedSizes) {
                attachedSurfaceStreamSpecMap = attachedSurfaceStreamSpecMap2;
            } else {
                attachedSurfaceStreamSpecMap = attachedSurfaceStreamSpecMap2;
                boolean hasStreamUseCaseOverride = StreamUseCaseUtil.populateStreamUseCaseStreamSpecOptionWithInteropOverride(this.mCharacteristics, attachedSurfaces, suggestedStreamSpecMap3, attachedSurfaceStreamSpecMap);
                if (!hasStreamUseCaseOverride) {
                    StreamUseCaseUtil.populateStreamUseCaseStreamSpecOptionWithSupportedSurfaceConfigs(suggestedStreamSpecMap3, attachedSurfaceStreamSpecMap, surfaceConfigIndexAttachedSurfaceInfoMap2, surfaceConfigIndexUseCaseConfigMap2, orderedSurfaceConfigListForStreamUseCase3);
                }
            }
        }
        return new Pair<>(suggestedStreamSpecMap3, attachedSurfaceStreamSpecMap);
    }

    private FeatureSettings createFeatureSettings(int cameraMode, Map<UseCaseConfig<?>, DynamicRange> resolvedDynamicRanges) {
        int requiredMaxBitDepth = getRequiredMaxBitDepth(resolvedDynamicRanges);
        if (cameraMode != 0 && requiredMaxBitDepth == 10) {
            throw new IllegalArgumentException(String.format("Camera device id is %s. 10 bit dynamic range is not currently supported in %s camera mode.", this.mCameraId, CameraMode.toLabelString(cameraMode)));
        }
        return FeatureSettings.of(cameraMode, requiredMaxBitDepth);
    }

    private boolean isUseCasesCombinationSupported(FeatureSettings featureSettings, List<AttachedSurfaceInfo> attachedSurfaces, Map<UseCaseConfig<?>, List<Size>> newUseCaseConfigsSupportedSizeMap) {
        List<SurfaceConfig> surfaceConfigs = new ArrayList<>();
        for (AttachedSurfaceInfo attachedSurface : attachedSurfaces) {
            surfaceConfigs.add(attachedSurface.getSurfaceConfig());
        }
        CompareSizesByArea compareSizesByArea = new CompareSizesByArea();
        for (UseCaseConfig<?> useCaseConfig : newUseCaseConfigsSupportedSizeMap.keySet()) {
            List<Size> supportedSizes = newUseCaseConfigsSupportedSizeMap.get(useCaseConfig);
            Preconditions.checkArgument((supportedSizes == null || supportedSizes.isEmpty()) ? false : true, "No available output size is found for " + useCaseConfig + ".");
            Size minSize = (Size) Collections.min(supportedSizes, compareSizesByArea);
            int imageFormat = useCaseConfig.getInputFormat();
            surfaceConfigs.add(SurfaceConfig.transformSurfaceConfig(featureSettings.getCameraMode(), imageFormat, minSize, getUpdatedSurfaceSizeDefinitionByFormat(imageFormat)));
        }
        return checkSupported(featureSettings, surfaceConfigs);
    }

    private Range<Integer> getTargetFpsRange(List<AttachedSurfaceInfo> attachedSurfaces, List<UseCaseConfig<?>> newUseCaseConfigs, List<Integer> useCasesPriorityOrder) {
        Range<Integer> targetFramerateForConfig = null;
        for (AttachedSurfaceInfo attachedSurfaceInfo : attachedSurfaces) {
            targetFramerateForConfig = getUpdatedTargetFramerate(attachedSurfaceInfo.getTargetFrameRate(), targetFramerateForConfig);
        }
        for (Integer index : useCasesPriorityOrder) {
            targetFramerateForConfig = getUpdatedTargetFramerate(newUseCaseConfigs.get(index.intValue()).getTargetFrameRate(null), targetFramerateForConfig);
        }
        return targetFramerateForConfig;
    }

    private int getMaxSupportedFpsFromAttachedSurfaces(List<AttachedSurfaceInfo> attachedSurfaces) {
        int existingSurfaceFrameRateCeiling = Integer.MAX_VALUE;
        for (AttachedSurfaceInfo attachedSurfaceInfo : attachedSurfaces) {
            existingSurfaceFrameRateCeiling = getUpdatedMaximumFps(existingSurfaceFrameRateCeiling, attachedSurfaceInfo.getImageFormat(), attachedSurfaceInfo.getSize());
        }
        return existingSurfaceFrameRateCeiling;
    }

    private Map<UseCaseConfig<?>, List<Size>> filterSupportedSizes(Map<UseCaseConfig<?>, List<Size>> newUseCaseConfigsSupportedSizeMap, FeatureSettings featureSettings, Range<Integer> targetFpsRange) {
        Map<UseCaseConfig<?>, List<Size>> filteredUseCaseConfigToSupportedSizesMap = new HashMap<>();
        for (UseCaseConfig<?> useCaseConfig : newUseCaseConfigsSupportedSizeMap.keySet()) {
            List<Size> reducedSizeList = new ArrayList<>();
            Map<SurfaceConfig.ConfigSize, Set<Integer>> configSizeUniqueMaxFpsMap = new HashMap<>();
            for (Size size : newUseCaseConfigsSupportedSizeMap.get(useCaseConfig)) {
                int imageFormat = useCaseConfig.getInputFormat();
                SurfaceConfig.ConfigSize configSize = SurfaceConfig.transformSurfaceConfig(featureSettings.getCameraMode(), imageFormat, size, getUpdatedSurfaceSizeDefinitionByFormat(imageFormat)).getConfigSize();
                int maxFrameRate = Integer.MAX_VALUE;
                if (targetFpsRange != null) {
                    maxFrameRate = getMaxFrameRate(this.mCharacteristics, imageFormat, size);
                }
                Set<Integer> uniqueMaxFrameRates = configSizeUniqueMaxFpsMap.get(configSize);
                if (uniqueMaxFrameRates == null) {
                    uniqueMaxFrameRates = new HashSet<>();
                    configSizeUniqueMaxFpsMap.put(configSize, uniqueMaxFrameRates);
                }
                if (!uniqueMaxFrameRates.contains(Integer.valueOf(maxFrameRate))) {
                    reducedSizeList.add(size);
                    uniqueMaxFrameRates.add(Integer.valueOf(maxFrameRate));
                }
            }
            filteredUseCaseConfigToSupportedSizesMap.put(useCaseConfig, reducedSizeList);
        }
        return filteredUseCaseConfigToSupportedSizesMap;
    }

    private Pair<List<SurfaceConfig>, Integer> getSurfaceConfigListAndFpsCeiling(int cameraMode, List<AttachedSurfaceInfo> attachedSurfaces, List<Size> possibleSizeList, List<UseCaseConfig<?>> newUseCaseConfigs, List<Integer> useCasesPriorityOrder, int currentConfigFramerateCeiling, Map<Integer, AttachedSurfaceInfo> surfaceConfigIndexAttachedSurfaceInfoMap, Map<Integer, UseCaseConfig<?>> surfaceConfigIndexUseCaseConfigMap) {
        List<SurfaceConfig> surfaceConfigList = new ArrayList<>();
        for (AttachedSurfaceInfo attachedSurfaceInfo : attachedSurfaces) {
            surfaceConfigList.add(attachedSurfaceInfo.getSurfaceConfig());
            if (surfaceConfigIndexAttachedSurfaceInfoMap != null) {
                surfaceConfigIndexAttachedSurfaceInfoMap.put(Integer.valueOf(surfaceConfigList.size() - 1), attachedSurfaceInfo);
            }
        }
        for (int i = 0; i < possibleSizeList.size(); i++) {
            Size size = possibleSizeList.get(i);
            UseCaseConfig<?> newUseCase = newUseCaseConfigs.get(useCasesPriorityOrder.get(i).intValue());
            int imageFormat = newUseCase.getInputFormat();
            SurfaceConfig surfaceConfig = SurfaceConfig.transformSurfaceConfig(cameraMode, imageFormat, size, getUpdatedSurfaceSizeDefinitionByFormat(imageFormat));
            surfaceConfigList.add(surfaceConfig);
            if (surfaceConfigIndexUseCaseConfigMap != null) {
                surfaceConfigIndexUseCaseConfigMap.put(Integer.valueOf(surfaceConfigList.size() - 1), newUseCase);
            }
            currentConfigFramerateCeiling = getUpdatedMaximumFps(currentConfigFramerateCeiling, newUseCase.getInputFormat(), size);
        }
        return new Pair<>(surfaceConfigList, Integer.valueOf(currentConfigFramerateCeiling));
    }

    List<Size> applyResolutionSelectionOrderRelatedWorkarounds(List<Size> sizeList, int imageFormat) {
        List<Size> aspectRatioMatchedSizeList;
        int targetAspectRatio = this.mTargetAspectRatio.get(this.mCameraId, this.mCharacteristics);
        Rational ratio = null;
        switch (targetAspectRatio) {
            case 0:
                ratio = AspectRatioUtil.ASPECT_RATIO_4_3;
                break;
            case 1:
                ratio = AspectRatioUtil.ASPECT_RATIO_16_9;
                break;
            case 2:
                Size maxJpegSize = getUpdatedSurfaceSizeDefinitionByFormat(256).getMaximumSize(256);
                ratio = new Rational(maxJpegSize.getWidth(), maxJpegSize.getHeight());
                break;
            case 3:
                ratio = null;
                break;
        }
        if (ratio == null) {
            aspectRatioMatchedSizeList = sizeList;
        } else {
            ArrayList arrayList = new ArrayList();
            List<Size> arrayList2 = new ArrayList<>();
            for (Size size : sizeList) {
                if (AspectRatioUtil.hasMatchingAspectRatio(size, ratio)) {
                    arrayList.add(size);
                } else {
                    arrayList2.add(size);
                }
            }
            arrayList2.addAll(0, arrayList);
            aspectRatioMatchedSizeList = arrayList2;
        }
        return this.mResolutionCorrector.insertOrPrioritize(SurfaceConfig.getConfigType(imageFormat), aspectRatioMatchedSizeList);
    }

    private static int getRequiredMaxBitDepth(Map<UseCaseConfig<?>, DynamicRange> resolvedDynamicRanges) {
        for (DynamicRange dynamicRange : resolvedDynamicRanges.values()) {
            if (dynamicRange.getBitDepth() == 10) {
                return 10;
            }
        }
        return 8;
    }

    private List<Integer> getUseCasesPriorityOrder(List<UseCaseConfig<?>> newUseCaseConfigs) {
        List<Integer> priorityOrder = new ArrayList<>();
        List<Integer> priorityValueList = new ArrayList<>();
        for (UseCaseConfig<?> config : newUseCaseConfigs) {
            int priority = config.getSurfaceOccupancyPriority(0);
            if (!priorityValueList.contains(Integer.valueOf(priority))) {
                priorityValueList.add(Integer.valueOf(priority));
            }
        }
        Collections.sort(priorityValueList);
        Collections.reverse(priorityValueList);
        for (Integer num : priorityValueList) {
            int priorityValue = num.intValue();
            for (UseCaseConfig<?> config2 : newUseCaseConfigs) {
                if (priorityValue == config2.getSurfaceOccupancyPriority(0)) {
                    priorityOrder.add(Integer.valueOf(newUseCaseConfigs.indexOf(config2)));
                }
            }
        }
        return priorityOrder;
    }

    private List<List<Size>> getAllPossibleSizeArrangements(List<List<Size>> supportedOutputSizesList) {
        int totalArrangementsCount = 1;
        for (List<Size> supportedOutputSizes : supportedOutputSizesList) {
            totalArrangementsCount *= supportedOutputSizes.size();
        }
        if (totalArrangementsCount == 0) {
            throw new IllegalArgumentException("Failed to find supported resolutions.");
        }
        List<List<Size>> allPossibleSizeArrangements = new ArrayList<>();
        for (int i = 0; i < totalArrangementsCount; i++) {
            List<Size> sizeList = new ArrayList<>();
            allPossibleSizeArrangements.add(sizeList);
        }
        int currentRunCount = totalArrangementsCount;
        int nextRunCount = currentRunCount / supportedOutputSizesList.get(0).size();
        for (int currentIndex = 0; currentIndex < supportedOutputSizesList.size(); currentIndex++) {
            List<Size> supportedOutputSizes2 = supportedOutputSizesList.get(currentIndex);
            for (int i2 = 0; i2 < totalArrangementsCount; i2++) {
                List<Size> surfaceConfigList = allPossibleSizeArrangements.get(i2);
                surfaceConfigList.add(supportedOutputSizes2.get((i2 % currentRunCount) / nextRunCount));
            }
            int i3 = supportedOutputSizesList.size();
            if (currentIndex < i3 - 1) {
                currentRunCount = nextRunCount;
                nextRunCount = currentRunCount / supportedOutputSizesList.get(currentIndex + 1).size();
            }
        }
        return allPossibleSizeArrangements;
    }

    private Size getMaxOutputSizeByFormat(StreamConfigurationMap map, int imageFormat, boolean highResolutionIncluded) {
        Size[] outputSizes;
        Size[] highResolutionOutputSizes;
        if (imageFormat == 34) {
            outputSizes = map.getOutputSizes(SurfaceTexture.class);
        } else {
            outputSizes = map.getOutputSizes(imageFormat);
        }
        if (outputSizes == null || outputSizes.length == 0) {
            return null;
        }
        CompareSizesByArea compareSizesByArea = new CompareSizesByArea();
        Size maxSize = (Size) Collections.max(Arrays.asList(outputSizes), compareSizesByArea);
        Size maxHighResolutionSize = SizeUtil.RESOLUTION_ZERO;
        if (highResolutionIncluded && (highResolutionOutputSizes = Api23Impl.getHighResolutionOutputSizes(map, imageFormat)) != null && highResolutionOutputSizes.length > 0) {
            maxHighResolutionSize = (Size) Collections.max(Arrays.asList(highResolutionOutputSizes), compareSizesByArea);
        }
        return (Size) Collections.max(Arrays.asList(maxSize, maxHighResolutionSize), compareSizesByArea);
    }

    private void generateSupportedCombinationList() {
        this.mSurfaceCombinations.addAll(GuaranteedConfigurationsUtil.generateSupportedCombinationList(this.mHardwareLevel, this.mIsRawSupported, this.mIsBurstCaptureSupported));
        this.mSurfaceCombinations.addAll(this.mExtraSupportedSurfaceCombinationsContainer.get(this.mCameraId, this.mHardwareLevel));
    }

    private void generateUltraHighSupportedCombinationList() {
        this.mUltraHighSurfaceCombinations.addAll(GuaranteedConfigurationsUtil.getUltraHighResolutionSupportedCombinationList());
    }

    private void generateConcurrentSupportedCombinationList() {
        this.mConcurrentSurfaceCombinations.addAll(GuaranteedConfigurationsUtil.getConcurrentSupportedCombinationList());
    }

    private void generate10BitSupportedCombinationList() {
        this.mSurfaceCombinations10Bit.addAll(GuaranteedConfigurationsUtil.get10BitSupportedCombinationList());
    }

    private void generateStreamUseCaseSupportedCombinationList() {
        if (Build.VERSION.SDK_INT >= 33) {
            this.mSurfaceCombinationsStreamUseCase.addAll(GuaranteedConfigurationsUtil.getStreamUseCaseSupportedCombinationList());
        }
    }

    private void checkCustomization() {
    }

    private void generateSurfaceSizeDefinition() {
        Size previewSize = this.mDisplayInfoManager.getPreviewSize();
        Size recordSize = getRecordSize();
        this.mSurfaceSizeDefinition = SurfaceSizeDefinition.create(SizeUtil.RESOLUTION_VGA, new HashMap(), previewSize, new HashMap(), recordSize, new HashMap(), new HashMap());
    }

    SurfaceSizeDefinition getUpdatedSurfaceSizeDefinitionByFormat(int format) {
        if (!this.mSurfaceSizeDefinitionFormats.contains(Integer.valueOf(format))) {
            updateS720pOrS1440pSizeByFormat(this.mSurfaceSizeDefinition.getS720pSizeMap(), SizeUtil.RESOLUTION_720P, format);
            updateS720pOrS1440pSizeByFormat(this.mSurfaceSizeDefinition.getS1440pSizeMap(), SizeUtil.RESOLUTION_1440P, format);
            updateMaximumSizeByFormat(this.mSurfaceSizeDefinition.getMaximumSizeMap(), format);
            updateUltraMaximumSizeByFormat(this.mSurfaceSizeDefinition.getUltraMaximumSizeMap(), format);
            this.mSurfaceSizeDefinitionFormats.add(Integer.valueOf(format));
        }
        return this.mSurfaceSizeDefinition;
    }

    private void updateS720pOrS1440pSizeByFormat(Map<Integer, Size> sizeMap, Size targetSize, int format) {
        if (!this.mIsConcurrentCameraModeSupported) {
            return;
        }
        StreamConfigurationMap originalMap = this.mCharacteristics.getStreamConfigurationMapCompat().toStreamConfigurationMap();
        Size maxOutputSize = getMaxOutputSizeByFormat(originalMap, format, false);
        sizeMap.put(Integer.valueOf(format), maxOutputSize == null ? targetSize : (Size) Collections.min(Arrays.asList(targetSize, maxOutputSize), new CompareSizesByArea()));
    }

    private void updateMaximumSizeByFormat(Map<Integer, Size> sizeMap, int format) {
        StreamConfigurationMap originalMap = this.mCharacteristics.getStreamConfigurationMapCompat().toStreamConfigurationMap();
        Size maxOutputSize = getMaxOutputSizeByFormat(originalMap, format, true);
        if (maxOutputSize != null) {
            sizeMap.put(Integer.valueOf(format), maxOutputSize);
        }
    }

    private void updateUltraMaximumSizeByFormat(Map<Integer, Size> sizeMap, int format) {
        StreamConfigurationMap maximumResolutionMap;
        if (Build.VERSION.SDK_INT < 31 || !this.mIsUltraHighResolutionSensorSupported || (maximumResolutionMap = (StreamConfigurationMap) this.mCharacteristics.get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP_MAXIMUM_RESOLUTION)) == null) {
            return;
        }
        sizeMap.put(Integer.valueOf(format), getMaxOutputSizeByFormat(maximumResolutionMap, format, true));
    }

    private void refreshPreviewSize() {
        this.mDisplayInfoManager.refresh();
        if (this.mSurfaceSizeDefinition == null) {
            generateSurfaceSizeDefinition();
            return;
        }
        Size previewSize = this.mDisplayInfoManager.getPreviewSize();
        this.mSurfaceSizeDefinition = SurfaceSizeDefinition.create(this.mSurfaceSizeDefinition.getAnalysisSize(), this.mSurfaceSizeDefinition.getS720pSizeMap(), previewSize, this.mSurfaceSizeDefinition.getS1440pSizeMap(), this.mSurfaceSizeDefinition.getRecordSize(), this.mSurfaceSizeDefinition.getMaximumSizeMap(), this.mSurfaceSizeDefinition.getUltraMaximumSizeMap());
    }

    private Size getRecordSize() {
        try {
            int cameraId = Integer.parseInt(this.mCameraId);
            CamcorderProfile profile = null;
            if (this.mCamcorderProfileHelper.hasProfile(cameraId, 1)) {
                profile = this.mCamcorderProfileHelper.get(cameraId, 1);
            }
            if (profile != null) {
                return new Size(profile.videoFrameWidth, profile.videoFrameHeight);
            }
            return getRecordSizeByHasProfile(cameraId);
        } catch (NumberFormatException e) {
            return getRecordSizeFromStreamConfigurationMap();
        }
    }

    private Size getRecordSizeFromStreamConfigurationMap() {
        StreamConfigurationMapCompat mapCompat = this.mCharacteristics.getStreamConfigurationMapCompat();
        Size[] videoSizeArr = mapCompat.toStreamConfigurationMap().getOutputSizes(MediaRecorder.class);
        if (videoSizeArr == null) {
            return SizeUtil.RESOLUTION_480P;
        }
        Arrays.sort(videoSizeArr, new CompareSizesByArea(true));
        for (Size size : videoSizeArr) {
            if (size.getWidth() <= SizeUtil.RESOLUTION_1080P.getWidth() && size.getHeight() <= SizeUtil.RESOLUTION_1080P.getHeight()) {
                return size;
            }
        }
        return SizeUtil.RESOLUTION_480P;
    }

    private Size getRecordSizeByHasProfile(int cameraId) {
        Size recordSize = SizeUtil.RESOLUTION_480P;
        CamcorderProfile profile = null;
        boolean hasProfile = this.mCamcorderProfileHelper.hasProfile(cameraId, 10);
        CamcorderProfileHelper camcorderProfileHelper = this.mCamcorderProfileHelper;
        if (hasProfile) {
            profile = camcorderProfileHelper.get(cameraId, 10);
        } else {
            boolean hasProfile2 = camcorderProfileHelper.hasProfile(cameraId, 8);
            CamcorderProfileHelper camcorderProfileHelper2 = this.mCamcorderProfileHelper;
            if (hasProfile2) {
                profile = camcorderProfileHelper2.get(cameraId, 8);
            } else {
                boolean hasProfile3 = camcorderProfileHelper2.hasProfile(cameraId, 12);
                CamcorderProfileHelper camcorderProfileHelper3 = this.mCamcorderProfileHelper;
                if (hasProfile3) {
                    profile = camcorderProfileHelper3.get(cameraId, 12);
                } else {
                    boolean hasProfile4 = camcorderProfileHelper3.hasProfile(cameraId, 6);
                    CamcorderProfileHelper camcorderProfileHelper4 = this.mCamcorderProfileHelper;
                    if (hasProfile4) {
                        profile = camcorderProfileHelper4.get(cameraId, 6);
                    } else {
                        boolean hasProfile5 = camcorderProfileHelper4.hasProfile(cameraId, 5);
                        CamcorderProfileHelper camcorderProfileHelper5 = this.mCamcorderProfileHelper;
                        if (hasProfile5) {
                            profile = camcorderProfileHelper5.get(cameraId, 5);
                        } else if (camcorderProfileHelper5.hasProfile(cameraId, 4)) {
                            profile = this.mCamcorderProfileHelper.get(cameraId, 4);
                        }
                    }
                }
            }
        }
        if (profile != null) {
            Size recordSize2 = new Size(profile.videoFrameWidth, profile.videoFrameHeight);
            return recordSize2;
        }
        return recordSize;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static class Api23Impl {
        private Api23Impl() {
        }

        static Size[] getHighResolutionOutputSizes(StreamConfigurationMap streamConfigurationMap, int format) {
            return streamConfigurationMap.getHighResolutionOutputSizes(format);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static abstract class FeatureSettings {
        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract int getCameraMode();

        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract int getRequiredMaxBitDepth();

        static FeatureSettings of(int cameraMode, int requiredMaxBitDepth) {
            return new AutoValue_SupportedSurfaceCombination_FeatureSettings(cameraMode, requiredMaxBitDepth);
        }
    }
}
