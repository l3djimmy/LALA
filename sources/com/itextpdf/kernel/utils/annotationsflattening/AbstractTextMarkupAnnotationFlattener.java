package com.itextpdf.kernel.utils.annotationsflattening;

import com.itextpdf.kernel.colors.Color;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.annot.PdfAnnotation;
/* loaded from: classes12.dex */
public abstract class AbstractTextMarkupAnnotationFlattener extends DefaultAnnotationFlattener {
    private static final int AMOUNT_OF_QUAD_POINTS = 8;

    public static float[] getQuadPointsAsFloatArray(PdfAnnotation annotation) {
        PdfArray pdfArray = annotation.getPdfObject().getAsArray(PdfName.QuadPoints);
        if (pdfArray == null) {
            return convertFloatToQuadPoints(annotation.getRectangle().toRectangle());
        }
        float[] floats = pdfArray.toFloatArray();
        if (floats.length == 8) {
            return pdfArray.toFloatArray();
        }
        return convertFloatToQuadPoints(annotation.getRectangle().toRectangle());
    }

    @Override // com.itextpdf.kernel.utils.annotationsflattening.DefaultAnnotationFlattener, com.itextpdf.kernel.utils.annotationsflattening.IAnnotationFlattener
    public boolean flatten(PdfAnnotation annotation, PdfPage page) {
        boolean flattenSucceeded = super.flatten(annotation, page);
        if (!flattenSucceeded) {
            draw(annotation, page);
            page.removeAnnotation(annotation);
            return true;
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Color getColor(PdfAnnotation annotation) {
        return Color.createColorWithColorSpace(annotation.getColorObject().toFloatArray());
    }

    private static float[] convertFloatToQuadPoints(Rectangle rectangle) {
        float[] quadPoints = {rectangle.getLeft(), rectangle.getTop(), rectangle.getRight(), rectangle.getTop(), rectangle.getLeft(), rectangle.getBottom(), rectangle.getRight(), rectangle.getBottom()};
        return quadPoints;
    }
}
