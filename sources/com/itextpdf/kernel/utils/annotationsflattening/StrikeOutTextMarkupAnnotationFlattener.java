package com.itextpdf.kernel.utils.annotationsflattening;

import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.annot.PdfAnnotation;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
/* loaded from: classes12.dex */
public class StrikeOutTextMarkupAnnotationFlattener extends AbstractTextMarkupAnnotationFlattener {
    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.kernel.utils.annotationsflattening.DefaultAnnotationFlattener
    public boolean draw(PdfAnnotation annotation, PdfPage page) {
        PdfCanvas under = createCanvas(page);
        float[] quadPoints = getQuadPointsAsFloatArray(annotation);
        double height = quadPoints[7] + ((quadPoints[1] - quadPoints[7]) / 2.0f);
        under.saveState().setStrokeColor(getColor(annotation)).moveTo(quadPoints[4], height).lineTo(quadPoints[6], height).stroke().restoreState();
        return true;
    }
}
