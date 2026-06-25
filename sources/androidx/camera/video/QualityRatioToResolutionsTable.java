package androidx.camera.video;

import android.util.Range;
import android.util.Rational;
import android.util.Size;
import androidx.camera.core.impl.utils.AspectRatioUtil;
import androidx.camera.core.internal.utils.SizeUtil;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
/* loaded from: classes.dex */
class QualityRatioToResolutionsTable {
    private static final Map<Integer, Rational> sAspectRatioMap;
    private static final Map<Quality, Range<Integer>> sQualityRangeMap = new HashMap();
    private final Map<QualityRatio, List<Size>> mTable = new HashMap();

    static {
        sQualityRangeMap.put(Quality.UHD, Range.create(2160, 4319));
        sQualityRangeMap.put(Quality.FHD, Range.create(1080, 1439));
        sQualityRangeMap.put(Quality.HD, Range.create(720, 1079));
        sQualityRangeMap.put(Quality.SD, Range.create(241, 719));
        sAspectRatioMap = new HashMap();
        sAspectRatioMap.put(0, AspectRatioUtil.ASPECT_RATIO_4_3);
        sAspectRatioMap.put(1, AspectRatioUtil.ASPECT_RATIO_16_9);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public QualityRatioToResolutionsTable(List<Size> resolutions, Map<Quality, Size> profileQualityToSizeMap) {
        for (Quality quality : sQualityRangeMap.keySet()) {
            this.mTable.put(QualityRatio.of(quality, -1), new ArrayList());
            for (Integer aspectRatio : sAspectRatioMap.keySet()) {
                this.mTable.put(QualityRatio.of(quality, aspectRatio.intValue()), new ArrayList());
            }
        }
        addProfileSizesToTable(profileQualityToSizeMap);
        addResolutionsToTable(resolutions);
        sortQualityRatioRow(profileQualityToSizeMap);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public List<Size> getResolutions(Quality quality, int aspectRatio) {
        List<Size> qualityRatioRow = getQualityRatioRow(quality, aspectRatio);
        return qualityRatioRow != null ? new ArrayList(qualityRatioRow) : new ArrayList(0);
    }

    private void addProfileSizesToTable(Map<Quality, Size> profileQualityToSizeMap) {
        for (Map.Entry<Quality, Size> entry : profileQualityToSizeMap.entrySet()) {
            ((List) Objects.requireNonNull(getQualityRatioRow(entry.getKey(), -1))).add(entry.getValue());
        }
    }

    private void addResolutionsToTable(List<Size> resolutions) {
        Integer aspectRatio;
        for (Size resolution : resolutions) {
            Quality quality = findMappedQuality(resolution);
            if (quality != null && (aspectRatio = findMappedAspectRatio(resolution)) != null) {
                List<Size> qualityRatioRow = (List) Objects.requireNonNull(getQualityRatioRow(quality, aspectRatio.intValue()));
                qualityRatioRow.add(resolution);
            }
        }
    }

    private void sortQualityRatioRow(Map<Quality, Size> profileQualityToSizeMap) {
        for (Map.Entry<QualityRatio, List<Size>> entry : this.mTable.entrySet()) {
            Size profileSize = profileQualityToSizeMap.get(entry.getKey().getQuality());
            if (profileSize != null) {
                final int qualitySizeArea = SizeUtil.getArea(profileSize);
                Collections.sort(entry.getValue(), new Comparator() { // from class: androidx.camera.video.QualityRatioToResolutionsTable$$ExternalSyntheticLambda0
                    @Override // java.util.Comparator
                    public final int compare(Object obj, Object obj2) {
                        return QualityRatioToResolutionsTable.lambda$sortQualityRatioRow$0(qualitySizeArea, (Size) obj, (Size) obj2);
                    }
                });
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ int lambda$sortQualityRatioRow$0(int qualitySizeArea, Size s1, Size s2) {
        int s1Diff = Math.abs(SizeUtil.getArea(s1) - qualitySizeArea);
        int s2Diff = Math.abs(SizeUtil.getArea(s2) - qualitySizeArea);
        return s1Diff - s2Diff;
    }

    private static Quality findMappedQuality(Size resolution) {
        for (Map.Entry<Quality, Range<Integer>> entry : sQualityRangeMap.entrySet()) {
            if (entry.getValue().contains((Range<Integer>) Integer.valueOf(resolution.getHeight()))) {
                return entry.getKey();
            }
        }
        return null;
    }

    private static Integer findMappedAspectRatio(Size resolution) {
        for (Map.Entry<Integer, Rational> entry : sAspectRatioMap.entrySet()) {
            if (AspectRatioUtil.hasMatchingAspectRatio(resolution, entry.getValue(), SizeUtil.RESOLUTION_QVGA)) {
                return entry.getKey();
            }
        }
        return null;
    }

    private List<Size> getQualityRatioRow(Quality quality, int aspectRatio) {
        return this.mTable.get(QualityRatio.of(quality, aspectRatio));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static abstract class QualityRatio {
        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract int getAspectRatio();

        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract Quality getQuality();

        static QualityRatio of(Quality quality, int aspectRatio) {
            return new AutoValue_QualityRatioToResolutionsTable_QualityRatio(quality, aspectRatio);
        }
    }
}
