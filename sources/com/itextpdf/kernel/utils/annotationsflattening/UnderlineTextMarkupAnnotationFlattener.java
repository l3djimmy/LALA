package com.itextpdf.kernel.utils.annotationsflattening;

import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.annot.PdfAnnotation;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
/* loaded from: classes12.dex */
public class UnderlineTextMarkupAnnotationFlattener extends AbstractTextMarkupAnnotationFlattener {
    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.kernel.utils.annotationsflattening.DefaultAnnotationFlattener
    public boolean draw(PdfAnnotation annotation, PdfPage page) {
        PdfCanvas under = createCanvas(page);
        float[] quadPoints = getQuadPointsAsFloatArray(annotation);
        under.saveState().setStrokeColor(getColor(annotation)).setLineWidth(1.0f).moveTo(quadPoints[4], quadPoints[5] + 1.25d).lineTo(quadPoints[6], quadPoints[7] + 1.25d).stroke().restoreState();
        return true;
    }
}
