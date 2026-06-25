package androidx.camera.core;

import androidx.camera.core.ImageReaderFormatRecommender;
/* loaded from: classes.dex */
final class AutoValue_ImageReaderFormatRecommender_FormatCombo extends ImageReaderFormatRecommender.FormatCombo {
    private final int imageAnalysisFormat;
    private final int imageCaptureFormat;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AutoValue_ImageReaderFormatRecommender_FormatCombo(int imageCaptureFormat, int imageAnalysisFormat) {
        this.imageCaptureFormat = imageCaptureFormat;
        this.imageAnalysisFormat = imageAnalysisFormat;
    }

    @Override // androidx.camera.core.ImageReaderFormatRecommender.FormatCombo
    int imageCaptureFormat() {
        return this.imageCaptureFormat;
    }

    @Override // androidx.camera.core.ImageReaderFormatRecommender.FormatCombo
    int imageAnalysisFormat() {
        return this.imageAnalysisFormat;
    }

    public String toString() {
        return "FormatCombo{imageCaptureFormat=" + this.imageCaptureFormat + ", imageAnalysisFormat=" + this.imageAnalysisFormat + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof ImageReaderFormatRecommender.FormatCombo) {
            ImageReaderFormatRecommender.FormatCombo that = (ImageReaderFormatRecommender.FormatCombo) o;
            return this.imageCaptureFormat == that.imageCaptureFormat() && this.imageAnalysisFormat == that.imageAnalysisFormat();
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((h$ ^ this.imageCaptureFormat) * 1000003) ^ this.imageAnalysisFormat;
    }
}
