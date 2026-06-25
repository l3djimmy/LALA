package com.itextpdf.kernel.utils.annotationsflattening;

import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.annot.PdfAnnotation;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
/* loaded from: classes12.dex */
public class SquigglyTextMarkupAnnotationFlattener extends AbstractTextMarkupAnnotationFlattener {
    private static final double ADVANCE = 1.0d;
    private static final double HEIGHT = 1.0d;

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.kernel.utils.annotationsflattening.DefaultAnnotationFlattener
    public boolean draw(PdfAnnotation annotation, PdfPage page) {
        PdfCanvas under = createCanvas(page);
        float[] quadPoints = getQuadPointsAsFloatArray(annotation);
        double baseLineHeight = quadPoints[7] + 1.25d;
        double maxHeight = baseLineHeight + 1.0d;
        double minHeight = baseLineHeight - 1.0d;
        double maxWidth = page.getPageSize().getWidth();
        double xCoordinate = quadPoints[4];
        double endX = quadPoints[6];
        under.saveState().setStrokeColor(getColor(annotation));
        while (xCoordinate <= endX && xCoordinate < maxWidth) {
            under.moveTo(xCoordinate, baseLineHeight);
            double xCoordinate2 = xCoordinate + 1.0d;
            under.lineTo(xCoordinate2, maxHeight);
            double xCoordinate3 = xCoordinate2 + 2.0d;
            under.lineTo(xCoordinate3, minHeight);
            xCoordinate = xCoordinate3 + 1.0d;
            under.lineTo(xCoordinate, baseLineHeight);
            under.stroke();
        }
        under.restoreState();
        return true;
    }
}
