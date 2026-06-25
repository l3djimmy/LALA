package com.itextpdf.layout;

import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.kernel.pdf.xobject.PdfFormXObject;
import com.itextpdf.layout.element.IElement;
import com.itextpdf.layout.exceptions.LayoutExceptionMessageConstant;
import com.itextpdf.layout.renderer.CanvasRenderer;
import com.itextpdf.layout.renderer.IRenderer;
import com.itextpdf.layout.renderer.RootRenderer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class Canvas extends RootElement<Canvas> {
    private boolean isCanvasOfPage;
    protected PdfPage page;
    protected PdfCanvas pdfCanvas;
    protected Rectangle rootArea;

    public Canvas(PdfPage page, Rectangle rootArea) {
        this(initPdfCanvasOrThrowIfPageIsFlushed(page), rootArea);
        enableAutoTagging(page);
        this.isCanvasOfPage = true;
    }

    public Canvas(PdfCanvas pdfCanvas, Rectangle rootArea) {
        this.pdfDocument = pdfCanvas.getDocument();
        this.pdfCanvas = pdfCanvas;
        this.rootArea = rootArea;
    }

    public Canvas(PdfCanvas pdfCanvas, Rectangle rootArea, boolean immediateFlush) {
        this(pdfCanvas, rootArea);
        this.immediateFlush = immediateFlush;
    }

    public Canvas(PdfFormXObject formXObject, PdfDocument pdfDocument) {
        this(new PdfCanvas(formXObject, pdfDocument), formXObject.getBBox().toRectangle());
    }

    public PdfDocument getPdfDocument() {
        return this.pdfDocument;
    }

    public Rectangle getRootArea() {
        return this.rootArea;
    }

    public PdfCanvas getPdfCanvas() {
        return this.pdfCanvas;
    }

    public void setRenderer(CanvasRenderer canvasRenderer) {
        this.rootRenderer = canvasRenderer;
    }

    public PdfPage getPage() {
        return this.page;
    }

    public void enableAutoTagging(PdfPage page) {
        if (isCanvasOfPage() && this.page != page) {
            Logger logger = LoggerFactory.getLogger(Canvas.class);
            logger.error(IoLogMessageConstant.PASSED_PAGE_SHALL_BE_ON_WHICH_CANVAS_WILL_BE_RENDERED);
        }
        this.page = page;
        this.pdfCanvas.setDrawingOnPage(isAutoTaggingEnabled());
    }

    public boolean isAutoTaggingEnabled() {
        return this.page != null;
    }

    public boolean isCanvasOfPage() {
        return this.isCanvasOfPage;
    }

    public void relayout() {
        if (this.immediateFlush) {
            throw new IllegalStateException("Operation not supported with immediate flush");
        }
        IRenderer nextRelayoutRenderer = this.rootRenderer != null ? this.rootRenderer.getNextRenderer() : null;
        if (nextRelayoutRenderer == null || !(nextRelayoutRenderer instanceof RootRenderer)) {
            nextRelayoutRenderer = new CanvasRenderer(this, this.immediateFlush);
        }
        this.rootRenderer = (RootRenderer) nextRelayoutRenderer;
        for (IElement element : this.childElements) {
            createAndAddRendererSubTree(element);
        }
    }

    public void flush() {
        this.rootRenderer.flush();
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        if (this.rootRenderer != null) {
            this.rootRenderer.close();
        }
    }

    @Override // com.itextpdf.layout.RootElement
    protected RootRenderer ensureRootRendererNotNull() {
        if (this.rootRenderer == null) {
            this.rootRenderer = new CanvasRenderer(this, this.immediateFlush);
        }
        return this.rootRenderer;
    }

    private static PdfCanvas initPdfCanvasOrThrowIfPageIsFlushed(PdfPage page) {
        if (page.isFlushed()) {
            throw new PdfException(LayoutExceptionMessageConstant.CANNOT_DRAW_ELEMENTS_ON_ALREADY_FLUSHED_PAGES);
        }
        return new PdfCanvas(page);
    }
}
