package androidx.camera.camera2.internal;

import android.hardware.camera2.CameraCharacteristics;
import android.os.Build;
import android.text.TextUtils;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.camera2.internal.compat.params.DynamicRangeConversions;
import androidx.camera.camera2.internal.compat.params.DynamicRangesCompat;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.AttachedSurfaceInfo;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.core.util.Preconditions;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
/* loaded from: classes.dex */
final class DynamicRangeResolver {
    private static final String TAG = "DynamicRangeResolver";
    private final CameraCharacteristicsCompat mCharacteristics;
    private final DynamicRangesCompat mDynamicRangesInfo;
    private final boolean mIs10BitSupported;

    /* JADX INFO: Access modifiers changed from: package-private */
    public DynamicRangeResolver(CameraCharacteristicsCompat characteristics) {
        this.mCharacteristics = characteristics;
        this.mDynamicRangesInfo = DynamicRangesCompat.fromCameraCharacteristics(characteristics);
        int[] availableCapabilities = (int[]) this.mCharacteristics.get(CameraCharacteristics.REQUEST_AVAILABLE_CAPABILITIES);
        boolean is10BitSupported = false;
        if (availableCapabilities != null) {
            int length = availableCapabilities.length;
            int i = 0;
            while (true) {
                if (i >= length) {
                    break;
                }
                int capability = availableCapabilities[i];
                if (capability != 18) {
                    i++;
                } else {
                    is10BitSupported = true;
                    break;
                }
            }
        }
        this.mIs10BitSupported = is10BitSupported;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean is10BitDynamicRangeSupported() {
        return this.mIs10BitSupported;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Map<UseCaseConfig<?>, DynamicRange> resolveAndValidateDynamicRanges(List<AttachedSurfaceInfo> existingSurfaces, List<UseCaseConfig<?>> newUseCaseConfigs, List<Integer> useCasePriorityOrder) {
        Set<DynamicRange> orderedExistingDynamicRanges = new LinkedHashSet<>();
        for (AttachedSurfaceInfo asi : existingSurfaces) {
            orderedExistingDynamicRanges.add(asi.getDynamicRange());
        }
        Set<DynamicRange> supportedDynamicRanges = this.mDynamicRangesInfo.getSupportedDynamicRanges();
        Set<DynamicRange> combinedConstraints = new HashSet<>(supportedDynamicRanges);
        for (DynamicRange dynamicRange : orderedExistingDynamicRanges) {
            updateConstraints(combinedConstraints, dynamicRange, this.mDynamicRangesInfo);
        }
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        ArrayList arrayList3 = new ArrayList();
        for (Integer num : useCasePriorityOrder) {
            int priorityIdx = num.intValue();
            UseCaseConfig<?> config = newUseCaseConfigs.get(priorityIdx);
            DynamicRange requestedDynamicRange = config.getDynamicRange();
            if (isFullyUnspecified(requestedDynamicRange)) {
                arrayList3.add(config);
            } else if (isPartiallySpecified(requestedDynamicRange)) {
                arrayList2.add(config);
            } else {
                arrayList.add(config);
            }
        }
        Map<UseCaseConfig<?>, DynamicRange> resolvedDynamicRanges = new HashMap<>();
        Set<DynamicRange> orderedNewDynamicRanges = new LinkedHashSet<>();
        List<UseCaseConfig<?>> orderedUseCaseConfigs = new ArrayList<>();
        orderedUseCaseConfigs.addAll(arrayList);
        orderedUseCaseConfigs.addAll(arrayList2);
        orderedUseCaseConfigs.addAll(arrayList3);
        for (UseCaseConfig<?> config2 : orderedUseCaseConfigs) {
            DynamicRange resolvedDynamicRange = resolveDynamicRangeAndUpdateConstraints(supportedDynamicRanges, orderedExistingDynamicRanges, orderedNewDynamicRanges, config2, combinedConstraints);
            resolvedDynamicRanges.put(config2, resolvedDynamicRange);
            if (!orderedExistingDynamicRanges.contains(resolvedDynamicRange)) {
                orderedNewDynamicRanges.add(resolvedDynamicRange);
            }
        }
        return resolvedDynamicRanges;
    }

    private DynamicRange resolveDynamicRangeAndUpdateConstraints(Set<DynamicRange> supportedDynamicRanges, Set<DynamicRange> orderedExistingDynamicRanges, Set<DynamicRange> orderedNewDynamicRanges, UseCaseConfig<?> config, Set<DynamicRange> outCombinedConstraints) {
        DynamicRange requestedDynamicRange = config.getDynamicRange();
        DynamicRange resolvedDynamicRange = resolveDynamicRange(requestedDynamicRange, outCombinedConstraints, orderedExistingDynamicRanges, orderedNewDynamicRanges, config.getTargetName());
        if (resolvedDynamicRange != null) {
            updateConstraints(outCombinedConstraints, resolvedDynamicRange, this.mDynamicRangesInfo);
            return resolvedDynamicRange;
        }
        throw new IllegalArgumentException(String.format("Unable to resolve supported dynamic range. The dynamic range may not be supported on the device or may not be allowed concurrently with other attached use cases.\nUse case:\n  %s\nRequested dynamic range:\n  %s\nSupported dynamic ranges:\n  %s\nConstrained set of concurrent dynamic ranges:\n  %s", config.getTargetName(), requestedDynamicRange, TextUtils.join("\n  ", supportedDynamicRanges), TextUtils.join("\n  ", outCombinedConstraints)));
    }

    private DynamicRange resolveDynamicRange(DynamicRange requestedDynamicRange, Set<DynamicRange> combinedConstraints, Set<DynamicRange> orderedExistingDynamicRanges, Set<DynamicRange> orderedNewDynamicRanges, String rangeOwnerLabel) {
        if (requestedDynamicRange.isFullySpecified()) {
            if (combinedConstraints.contains(requestedDynamicRange)) {
                return requestedDynamicRange;
            }
            return null;
        }
        int requestedEncoding = requestedDynamicRange.getEncoding();
        int requestedBitDepth = requestedDynamicRange.getBitDepth();
        if (requestedEncoding == 1 && requestedBitDepth == 0) {
            if (combinedConstraints.contains(DynamicRange.SDR)) {
                return DynamicRange.SDR;
            }
            return null;
        }
        DynamicRange resolvedDynamicRange = findSupportedHdrMatch(requestedDynamicRange, orderedExistingDynamicRanges, combinedConstraints);
        if (resolvedDynamicRange != null) {
            Logger.d(TAG, String.format("Resolved dynamic range for use case %s from existing attached surface.\n%s\n->\n%s", rangeOwnerLabel, requestedDynamicRange, resolvedDynamicRange));
            return resolvedDynamicRange;
        }
        DynamicRange resolvedDynamicRange2 = findSupportedHdrMatch(requestedDynamicRange, orderedNewDynamicRanges, combinedConstraints);
        if (resolvedDynamicRange2 != null) {
            Logger.d(TAG, String.format("Resolved dynamic range for use case %s from concurrently bound use case.\n%s\n->\n%s", rangeOwnerLabel, requestedDynamicRange, resolvedDynamicRange2));
            return resolvedDynamicRange2;
        } else if (canResolveWithinConstraints(requestedDynamicRange, DynamicRange.SDR, combinedConstraints)) {
            Logger.d(TAG, String.format("Resolved dynamic range for use case %s to no compatible HDR dynamic ranges.\n%s\n->\n%s", rangeOwnerLabel, requestedDynamicRange, DynamicRange.SDR));
            return DynamicRange.SDR;
        } else {
            if (requestedEncoding == 2 && (requestedBitDepth == 10 || requestedBitDepth == 0)) {
                Set<DynamicRange> hdrDefaultRanges = new LinkedHashSet<>();
                DynamicRange recommendedRange = null;
                if (Build.VERSION.SDK_INT >= 33 && (recommendedRange = Api33Impl.getRecommended10BitDynamicRange(this.mCharacteristics)) != null) {
                    hdrDefaultRanges.add(recommendedRange);
                }
                hdrDefaultRanges.add(DynamicRange.HLG_10_BIT);
                DynamicRange resolvedDynamicRange3 = findSupportedHdrMatch(requestedDynamicRange, hdrDefaultRanges, combinedConstraints);
                if (resolvedDynamicRange3 != null) {
                    Logger.d(TAG, String.format("Resolved dynamic range for use case %s from %s 10-bit supported dynamic range.\n%s\n->\n%s", rangeOwnerLabel, Objects.equals(resolvedDynamicRange3, recommendedRange) ? "recommended" : "required", requestedDynamicRange, resolvedDynamicRange3));
                    return resolvedDynamicRange3;
                }
            }
            for (DynamicRange candidateRange : combinedConstraints) {
                Preconditions.checkState(candidateRange.isFullySpecified(), "Candidate dynamic range must be fully specified.");
                if (!candidateRange.equals(DynamicRange.SDR) && canResolve(requestedDynamicRange, candidateRange)) {
                    Logger.d(TAG, String.format("Resolved dynamic range for use case %s from validated dynamic range constraints or supported HDR dynamic ranges.\n%s\n->\n%s", rangeOwnerLabel, requestedDynamicRange, candidateRange));
                    return candidateRange;
                }
            }
            return null;
        }
    }

    private static void updateConstraints(Set<DynamicRange> combinedConstraints, DynamicRange newDynamicRange, DynamicRangesCompat dynamicRangesInfo) {
        Preconditions.checkState(!combinedConstraints.isEmpty(), "Cannot update already-empty constraints.");
        Set<DynamicRange> newConstraints = dynamicRangesInfo.getDynamicRangeCaptureRequestConstraints(newDynamicRange);
        if (!newConstraints.isEmpty()) {
            Set<DynamicRange> previousConstraints = new HashSet<>(combinedConstraints);
            combinedConstraints.retainAll(newConstraints);
            if (combinedConstraints.isEmpty()) {
                throw new IllegalArgumentException(String.format("Constraints of dynamic range cannot be combined with existing constraints.\nDynamic range:\n  %s\nConstraints:\n  %s\nExisting constraints:\n  %s", newDynamicRange, TextUtils.join("\n  ", newConstraints), TextUtils.join("\n  ", previousConstraints)));
            }
        }
    }

    private static DynamicRange findSupportedHdrMatch(DynamicRange rangeToMatch, Collection<DynamicRange> fullySpecifiedCandidateRanges, Set<DynamicRange> constraints) {
        if (rangeToMatch.getEncoding() == 1) {
            return null;
        }
        for (DynamicRange candidateRange : fullySpecifiedCandidateRanges) {
            Preconditions.checkNotNull(candidateRange, "Fully specified DynamicRange cannot be null.");
            int candidateEncoding = candidateRange.getEncoding();
            Preconditions.checkState(candidateRange.isFullySpecified(), "Fully specified DynamicRange must have fully defined encoding.");
            if (candidateEncoding != 1 && canResolveWithinConstraints(rangeToMatch, candidateRange, constraints)) {
                return candidateRange;
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static final class Api33Impl {
        private Api33Impl() {
        }

        static DynamicRange getRecommended10BitDynamicRange(CameraCharacteristicsCompat characteristics) {
            Long recommendedProfile = (Long) characteristics.get(CameraCharacteristics.REQUEST_RECOMMENDED_TEN_BIT_DYNAMIC_RANGE_PROFILE);
            if (recommendedProfile != null) {
                return DynamicRangeConversions.profileToDynamicRange(recommendedProfile.longValue());
            }
            return null;
        }
    }

    private static boolean isFullyUnspecified(DynamicRange dynamicRange) {
        return Objects.equals(dynamicRange, DynamicRange.UNSPECIFIED);
    }

    private static boolean isPartiallySpecified(DynamicRange dynamicRange) {
        return dynamicRange.getEncoding() == 2 || (dynamicRange.getEncoding() != 0 && dynamicRange.getBitDepth() == 0) || (dynamicRange.getEncoding() == 0 && dynamicRange.getBitDepth() != 0);
    }

    private static boolean canResolveWithinConstraints(DynamicRange rangeToResolve, DynamicRange candidateRange, Set<DynamicRange> constraints) {
        if (!constraints.contains(candidateRange)) {
            Logger.d(TAG, String.format("Candidate Dynamic range is not within constraints.\nDynamic range to resolve:\n  %s\nCandidate dynamic range:\n  %s", rangeToResolve, candidateRange));
            return false;
        }
        return canResolve(rangeToResolve, candidateRange);
    }

    private static boolean canResolve(DynamicRange testRange, DynamicRange fullySpecifiedRange) {
        Preconditions.checkState(fullySpecifiedRange.isFullySpecified(), "Fully specified range is not actually fully specified.");
        if (testRange.getEncoding() == 2 && fullySpecifiedRange.getEncoding() == 1) {
            return false;
        }
        if (testRange.getEncoding() == 2 || testRange.getEncoding() == 0 || testRange.getEncoding() == fullySpecifiedRange.getEncoding()) {
            return testRange.getBitDepth() == 0 || testRange.getBitDepth() == fullySpecifiedRange.getBitDepth();
        }
        return false;
    }
}
