package androidx.camera.core.impl.utils;

import android.graphics.RectF;
import android.util.Rational;
import android.util.Size;
import androidx.camera.core.internal.utils.SizeUtil;
import androidx.core.util.Preconditions;
import java.util.Comparator;
/* loaded from: classes.dex */
public final class AspectRatioUtil {
    private static final int ALIGN16 = 16;
    public static final Rational ASPECT_RATIO_4_3 = new Rational(4, 3);
    public static final Rational ASPECT_RATIO_3_4 = new Rational(3, 4);
    public static final Rational ASPECT_RATIO_16_9 = new Rational(16, 9);
    public static final Rational ASPECT_RATIO_9_16 = new Rational(9, 16);

    private AspectRatioUtil() {
    }

    public static boolean hasMatchingAspectRatio(Size resolution, Rational aspectRatio) {
        return hasMatchingAspectRatio(resolution, aspectRatio, SizeUtil.RESOLUTION_VGA);
    }

    public static boolean hasMatchingAspectRatio(Size resolution, Rational aspectRatio, Size mod16ResolutionLowerBound) {
        if (aspectRatio == null) {
            return false;
        }
        if (aspectRatio.equals(new Rational(resolution.getWidth(), resolution.getHeight()))) {
            return true;
        }
        if (SizeUtil.getArea(resolution) < SizeUtil.getArea(mod16ResolutionLowerBound)) {
            return false;
        }
        boolean isMatch = isPossibleMod16FromAspectRatio(resolution, aspectRatio);
        return isMatch;
    }

    private static boolean isPossibleMod16FromAspectRatio(Size resolution, Rational aspectRatio) {
        int width = resolution.getWidth();
        int height = resolution.getHeight();
        Rational invAspectRatio = new Rational(aspectRatio.getDenominator(), aspectRatio.getNumerator());
        if (width % 16 == 0 && height % 16 == 0) {
            return ratioIntersectsMod16Segment(Math.max(0, height + (-16)), width, aspectRatio) || ratioIntersectsMod16Segment(Math.max(0, width + (-16)), height, invAspectRatio);
        } else if (width % 16 == 0) {
            return ratioIntersectsMod16Segment(height, width, aspectRatio);
        } else {
            if (height % 16 == 0) {
                return ratioIntersectsMod16Segment(width, height, invAspectRatio);
            }
            return false;
        }
    }

    private static boolean ratioIntersectsMod16Segment(int height, int mod16Width, Rational aspectRatio) {
        Preconditions.checkArgument(mod16Width % 16 == 0);
        double aspectRatioWidth = (aspectRatio.getNumerator() * height) / aspectRatio.getDenominator();
        return aspectRatioWidth > ((double) Math.max(0, mod16Width + (-16))) && aspectRatioWidth < ((double) (mod16Width + 16));
    }

    /* loaded from: classes.dex */
    public static final class CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace implements Comparator<Rational> {
        private final Rational mFullFovRatio;
        private final Rational mTargetRatio;
        private final RectF mTransformedMappingArea;

        public CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace(Rational targetRatio, Rational fullFovRatio) {
            this.mTargetRatio = targetRatio;
            this.mFullFovRatio = fullFovRatio != null ? fullFovRatio : new Rational(4, 3);
            this.mTransformedMappingArea = getTransformedMappingArea(this.mTargetRatio);
        }

        @Override // java.util.Comparator
        public int compare(Rational lhs, Rational rhs) {
            if (lhs.equals(rhs)) {
                return 0;
            }
            RectF lhsMappingArea = getTransformedMappingArea(lhs);
            RectF rhsMappingArea = getTransformedMappingArea(rhs);
            boolean isCoveredByLhs = isMappingAreaCovered(lhsMappingArea, this.mTransformedMappingArea);
            boolean isCoveredByRhs = isMappingAreaCovered(rhsMappingArea, this.mTransformedMappingArea);
            if (isCoveredByLhs && isCoveredByRhs) {
                return (int) Math.signum(getMappingAreaSize(lhsMappingArea) - getMappingAreaSize(rhsMappingArea));
            }
            if (isCoveredByLhs) {
                return -1;
            }
            if (isCoveredByRhs) {
                return 1;
            }
            float lhsOverlappingArea = getOverlappingAreaSize(lhsMappingArea, this.mTransformedMappingArea);
            float rhsOverlappingArea = getOverlappingAreaSize(rhsMappingArea, this.mTransformedMappingArea);
            return -((int) Math.signum(lhsOverlappingArea - rhsOverlappingArea));
        }

        private RectF getTransformedMappingArea(Rational ratio) {
            if (ratio.floatValue() == this.mFullFovRatio.floatValue()) {
                return new RectF(0.0f, 0.0f, this.mFullFovRatio.getNumerator(), this.mFullFovRatio.getDenominator());
            }
            if (ratio.floatValue() > this.mFullFovRatio.floatValue()) {
                return new RectF(0.0f, 0.0f, this.mFullFovRatio.getNumerator(), (ratio.getDenominator() * this.mFullFovRatio.getNumerator()) / ratio.getNumerator());
            }
            return new RectF(0.0f, 0.0f, (ratio.getNumerator() * this.mFullFovRatio.getDenominator()) / ratio.getDenominator(), this.mFullFovRatio.getDenominator());
        }

        private boolean isMappingAreaCovered(RectF sourceMappingArea, RectF targetMappingArea) {
            return sourceMappingArea.width() >= targetMappingArea.width() && sourceMappingArea.height() >= targetMappingArea.height();
        }

        private float getMappingAreaSize(RectF mappingArea) {
            return mappingArea.width() * mappingArea.height();
        }

        private float getOverlappingAreaSize(RectF mappingArea1, RectF mappingArea2) {
            float overlappingAreaWidth = mappingArea1.width() < mappingArea2.width() ? mappingArea1.width() : mappingArea2.width();
            float overlappingAreaHeight = mappingArea1.height() < mappingArea2.height() ? mappingArea1.height() : mappingArea2.height();
            return overlappingAreaWidth * overlappingAreaHeight;
        }
    }
}
