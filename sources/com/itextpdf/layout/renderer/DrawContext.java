package com.itextpdf.layout.renderer;

import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
/* loaded from: classes12.dex */
public class DrawContext {
    private PdfCanvas canvas;
    private PdfDocument document;
    private boolean taggingEnabled;

    public DrawContext(PdfDocument document, PdfCanvas canvas) {
        this(document, canvas, false);
    }

    public DrawContext(PdfDocument document, PdfCanvas canvas, boolean enableTagging) {
        this.document = document;
        this.canvas = canvas;
        this.taggingEnabled = enableTagging;
    }

    public PdfDocument getDocument() {
        return this.document;
    }

    public PdfCanvas getCanvas() {
        return this.canvas;
    }

    public boolean isTaggingEnabled() {
        return this.taggingEnabled;
    }

    public void setTaggingEnabled(boolean taggingEnabled) {
        this.taggingEnabled = taggingEnabled;
    }
}
