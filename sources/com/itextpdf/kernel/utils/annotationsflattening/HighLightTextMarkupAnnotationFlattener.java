package com.itextpdf.kernel.utils.annotationsflattening;

import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.annot.PdfAnnotation;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
/* loaded from: classes12.dex */
public class HighLightTextMarkupAnnotationFlattener extends AbstractTextMarkupAnnotationFlattener {
    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.kernel.utils.annotationsflattening.DefaultAnnotationFlattener
    public PdfCanvas createCanvas(PdfPage page) {
        return new PdfCanvas(page.newContentStreamBefore(), page.getResources(), page.getDocument());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.kernel.utils.annotationsflattening.DefaultAnnotationFlattener
    public boolean draw(PdfAnnotation annotation, PdfPage page) {
        PdfCanvas under = createCanvas(page);
        float[] values = getQuadPointsAsFloatArray(annotation);
        under.saveState().setColor(getColor(annotation), true).moveTo(values[0], values[1]).lineTo(values[2], values[3]).lineTo(values[6], values[7]).lineTo(values[4], values[5]).lineTo(values[0], values[1]).fill().restoreState();
        return true;
    }
}
