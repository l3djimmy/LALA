package com.itextpdf.kernel.pdf.canvas.parser;

import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.canvas.parser.listener.IEventListener;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes12.dex */
public class PdfDocumentContentParser {
    private final PdfDocument pdfDocument;

    public PdfDocumentContentParser(PdfDocument pdfDocument) {
        this.pdfDocument = pdfDocument;
    }

    public <E extends IEventListener> E processContent(int pageNumber, E renderListener, Map<String, IContentOperator> additionalContentOperators) {
        PdfCanvasProcessor processor = new PdfCanvasProcessor(renderListener, additionalContentOperators);
        processor.processPageContent(this.pdfDocument.getPage(pageNumber));
        return renderListener;
    }

    public <E extends IEventListener> E processContent(int pageNumber, E renderListener) {
        return (E) processContent(pageNumber, renderListener, new HashMap());
    }
}
