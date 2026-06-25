package com.itextpdf.layout.renderer.objectfit;
/* loaded from: classes12.dex */
public class ObjectFitApplyingResult {
    private boolean imageCuttingRequired;
    private double renderedImageHeight;
    private double renderedImageWidth;

    public ObjectFitApplyingResult() {
    }

    public ObjectFitApplyingResult(double renderedImageWidth, double renderedImageHeight, boolean imageCuttingRequired) {
        this.renderedImageWidth = renderedImageWidth;
        this.renderedImageHeight = renderedImageHeight;
        this.imageCuttingRequired = imageCuttingRequired;
    }

    public double getRenderedImageWidth() {
        return this.renderedImageWidth;
    }

    public void setRenderedImageWidth(double renderedImageWidth) {
        this.renderedImageWidth = renderedImageWidth;
    }

    public double getRenderedImageHeight() {
        return this.renderedImageHeight;
    }

    public void setRenderedImageHeight(double renderedImageHeight) {
        this.renderedImageHeight = renderedImageHeight;
    }

    public boolean isImageCuttingRequired() {
        return this.imageCuttingRequired;
    }

    public void setImageCuttingRequired(boolean imageCuttingRequired) {
        this.imageCuttingRequired = imageCuttingRequired;
    }
}
