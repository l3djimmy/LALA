package com.itextpdf.kernel.pdf.canvas;

import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfResources;
import com.itextpdf.kernel.pdf.PdfStream;
import com.itextpdf.kernel.pdf.colorspace.PdfColorSpace;
import com.itextpdf.kernel.pdf.colorspace.PdfPattern;
/* loaded from: classes12.dex */
public class PdfPatternCanvas extends PdfCanvas {
    private final PdfPattern.Tiling tilingPattern;

    public PdfPatternCanvas(PdfStream contentStream, PdfResources resources, PdfDocument document) {
        super(contentStream, resources, document);
        this.tilingPattern = new PdfPattern.Tiling(contentStream);
    }

    public PdfPatternCanvas(PdfPattern.Tiling pattern, PdfDocument document) {
        super((PdfStream) pattern.getPdfObject(), pattern.getResources(), document);
        this.tilingPattern = pattern;
    }

    @Override // com.itextpdf.kernel.pdf.canvas.PdfCanvas
    public PdfCanvas setColor(PdfColorSpace colorSpace, float[] colorValue, PdfPattern pattern, boolean fill) {
        checkNoColor();
        return super.setColor(colorSpace, colorValue, pattern, fill);
    }

    private void checkNoColor() {
        if (!this.tilingPattern.isColored()) {
            throw new PdfException(KernelExceptionMessageConstant.CONTENT_STREAM_MUST_NOT_INVOKE_OPERATORS_THAT_SPECIFY_COLORS_OR_OTHER_COLOR_RELATED_PARAMETERS);
        }
    }
}
