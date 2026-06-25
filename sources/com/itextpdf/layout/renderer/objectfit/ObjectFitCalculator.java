package com.itextpdf.layout.renderer.objectfit;

import com.itextpdf.layout.properties.ObjectFit;
/* loaded from: classes12.dex */
public final class ObjectFitCalculator {
    private ObjectFitCalculator() {
    }

    public static ObjectFitApplyingResult calculateRenderedImageSize(ObjectFit objectFit, double absoluteImageWidth, double absoluteImageHeight, double imageContainerWidth, double imageContainerHeight) {
        switch (objectFit) {
            case FILL:
                return processFill(imageContainerWidth, imageContainerHeight);
            case CONTAIN:
                return processContain(absoluteImageWidth, absoluteImageHeight, imageContainerWidth, imageContainerHeight);
            case COVER:
                return processCover(absoluteImageWidth, absoluteImageHeight, imageContainerWidth, imageContainerHeight);
            case SCALE_DOWN:
                return processScaleDown(absoluteImageWidth, absoluteImageHeight, imageContainerWidth, imageContainerHeight);
            case NONE:
                return processNone(absoluteImageWidth, absoluteImageHeight, imageContainerWidth, imageContainerHeight);
            default:
                throw new IllegalArgumentException("Object fit parameter cannot be null!");
        }
    }

    private static ObjectFitApplyingResult processFill(double imageContainerWidth, double imageContainerHeight) {
        return new ObjectFitApplyingResult(imageContainerWidth, imageContainerHeight, false);
    }

    private static ObjectFitApplyingResult processContain(double absoluteImageWidth, double absoluteImageHeight, double imageContainerWidth, double imageContainerHeight) {
        return processToFitSide(absoluteImageWidth, absoluteImageHeight, imageContainerWidth, imageContainerHeight, false);
    }

    private static ObjectFitApplyingResult processCover(double absoluteImageWidth, double absoluteImageHeight, double imageContainerWidth, double imageContainerHeight) {
        return processToFitSide(absoluteImageWidth, absoluteImageHeight, imageContainerWidth, imageContainerHeight, true);
    }

    private static ObjectFitApplyingResult processScaleDown(double absoluteImageWidth, double absoluteImageHeight, double imageContainerWidth, double imageContainerHeight) {
        if (imageContainerWidth >= absoluteImageWidth && imageContainerHeight >= absoluteImageHeight) {
            return new ObjectFitApplyingResult(absoluteImageWidth, absoluteImageHeight, false);
        }
        return processToFitSide(absoluteImageWidth, absoluteImageHeight, imageContainerWidth, imageContainerHeight, false);
    }

    private static ObjectFitApplyingResult processNone(double absoluteImageWidth, double absoluteImageHeight, double imageContainerWidth, double imageContainerHeight) {
        boolean doesObjectFitRequireCutting = imageContainerWidth <= absoluteImageWidth || imageContainerHeight <= absoluteImageHeight;
        return new ObjectFitApplyingResult(absoluteImageWidth, absoluteImageHeight, doesObjectFitRequireCutting);
    }

    private static ObjectFitApplyingResult processToFitSide(double absoluteImageWidth, double absoluteImageHeight, double imageContainerWidth, double imageContainerHeight, boolean clipToFit) {
        double renderedImageWidth;
        double renderedImageHeight;
        double widthCoeff = imageContainerWidth / absoluteImageWidth;
        double heightCoeff = imageContainerHeight / absoluteImageHeight;
        boolean isWidthFitted = (heightCoeff > widthCoeff) ^ clipToFit;
        if (isWidthFitted) {
            renderedImageWidth = imageContainerWidth;
            renderedImageHeight = (absoluteImageHeight * imageContainerWidth) / absoluteImageWidth;
        } else {
            renderedImageWidth = (absoluteImageWidth * imageContainerHeight) / absoluteImageHeight;
            renderedImageHeight = imageContainerHeight;
        }
        return new ObjectFitApplyingResult(renderedImageWidth, renderedImageHeight, clipToFit);
    }
}
