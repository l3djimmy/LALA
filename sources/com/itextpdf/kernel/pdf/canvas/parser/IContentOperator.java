package com.itextpdf.kernel.pdf.canvas.parser;

import com.itextpdf.kernel.pdf.PdfLiteral;
import com.itextpdf.kernel.pdf.PdfObject;
import java.util.List;
/* loaded from: classes12.dex */
public interface IContentOperator {
    void invoke(PdfCanvasProcessor pdfCanvasProcessor, PdfLiteral pdfLiteral, List<PdfObject> list);
}
