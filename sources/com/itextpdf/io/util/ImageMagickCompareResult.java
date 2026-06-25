package com.itextpdf.io.util;
/* loaded from: classes12.dex */
public final class ImageMagickCompareResult {
    private final long diffPixels;
    private final boolean result;

    public ImageMagickCompareResult(boolean result, long diffPixels) {
        this.result = result;
        this.diffPixels = diffPixels;
    }

    public boolean isComparingResultSuccessful() {
        return this.result;
    }

    public long getDiffPixels() {
        return this.diffPixels;
    }
}
