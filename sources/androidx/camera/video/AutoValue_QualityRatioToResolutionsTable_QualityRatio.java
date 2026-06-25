package androidx.camera.video;

import androidx.camera.video.QualityRatioToResolutionsTable;
/* loaded from: classes.dex */
final class AutoValue_QualityRatioToResolutionsTable_QualityRatio extends QualityRatioToResolutionsTable.QualityRatio {
    private final int aspectRatio;
    private final Quality quality;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_QualityRatioToResolutionsTable_QualityRatio(Quality quality, int aspectRatio) {
        if (quality == null) {
            throw new NullPointerException("Null quality");
        }
        this.quality = quality;
        this.aspectRatio = aspectRatio;
    }

    @Override // androidx.camera.video.QualityRatioToResolutionsTable.QualityRatio
    Quality getQuality() {
        return this.quality;
    }

    @Override // androidx.camera.video.QualityRatioToResolutionsTable.QualityRatio
    int getAspectRatio() {
        return this.aspectRatio;
    }

    public String toString() {
        return "QualityRatio{quality=" + this.quality + ", aspectRatio=" + this.aspectRatio + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof QualityRatioToResolutionsTable.QualityRatio) {
            QualityRatioToResolutionsTable.QualityRatio that = (QualityRatioToResolutionsTable.QualityRatio) o;
            return this.quality.equals(that.getQuality()) && this.aspectRatio == that.getAspectRatio();
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((h$ ^ this.quality.hashCode()) * 1000003) ^ this.aspectRatio;
    }
}
