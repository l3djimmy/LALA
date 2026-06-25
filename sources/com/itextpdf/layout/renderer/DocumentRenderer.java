package com.itextpdf.layout.renderer;

import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.AreaBreak;
import com.itextpdf.layout.exceptions.LayoutExceptionMessageConstant;
import com.itextpdf.layout.layout.LayoutArea;
import com.itextpdf.layout.layout.LayoutResult;
import com.itextpdf.layout.layout.RootLayoutArea;
import com.itextpdf.layout.properties.AreaBreakType;
import com.itextpdf.layout.properties.Transform;
import com.itextpdf.layout.tagging.LayoutTaggingHelper;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes12.dex */
public class DocumentRenderer extends RootRenderer {
    protected Document document;
    protected TargetCounterHandler targetCounterHandler;
    protected List<Integer> wrappedContentPage;

    public DocumentRenderer(Document document) {
        this(document, true);
    }

    public DocumentRenderer(Document document, boolean immediateFlush) {
        this.wrappedContentPage = new ArrayList();
        this.targetCounterHandler = new TargetCounterHandler();
        this.document = document;
        this.immediateFlush = immediateFlush;
        this.modelElement = document;
    }

    public TargetCounterHandler getTargetCounterHandler() {
        return this.targetCounterHandler;
    }

    public boolean isRelayoutRequired() {
        return this.targetCounterHandler.isRelayoutRequired();
    }

    @Override // com.itextpdf.layout.renderer.AbstractRenderer, com.itextpdf.layout.renderer.IRenderer
    public LayoutArea getOccupiedArea() {
        throw new IllegalStateException("Not applicable for DocumentRenderer");
    }

    @Override // com.itextpdf.layout.renderer.IRenderer
    public IRenderer getNextRenderer() {
        DocumentRenderer renderer = new DocumentRenderer(this.document, this.immediateFlush);
        renderer.targetCounterHandler = new TargetCounterHandler(this.targetCounterHandler);
        return renderer;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.layout.renderer.RootRenderer
    public LayoutArea updateCurrentArea(LayoutResult overflowResult) {
        AreaBreak areaBreak;
        flushWaitingDrawingElements(false);
        LayoutTaggingHelper taggingHelper = (LayoutTaggingHelper) getProperty(108);
        if (taggingHelper != null) {
            taggingHelper.releaseFinishedHints();
        }
        if (overflowResult == null || overflowResult.getAreaBreak() == null) {
            areaBreak = null;
        } else {
            areaBreak = overflowResult.getAreaBreak();
        }
        int currentPageNumber = this.currentArea != null ? this.currentArea.getPageNumber() : 0;
        if (areaBreak != null && areaBreak.getType() == AreaBreakType.LAST_PAGE) {
            while (currentPageNumber < this.document.getPdfDocument().getNumberOfPages()) {
                possiblyFlushPreviousPage(currentPageNumber);
                currentPageNumber++;
            }
        } else {
            possiblyFlushPreviousPage(currentPageNumber);
            currentPageNumber++;
        }
        PageSize customPageSize = areaBreak != null ? areaBreak.getPageSize() : null;
        while (this.document.getPdfDocument().getNumberOfPages() >= currentPageNumber && this.document.getPdfDocument().getPage(currentPageNumber).isFlushed()) {
            currentPageNumber++;
        }
        PageSize lastPageSize = ensureDocumentHasNPages(currentPageNumber, customPageSize);
        if (lastPageSize == null) {
            lastPageSize = new PageSize(this.document.getPdfDocument().getPage(currentPageNumber).getTrimBox());
        }
        RootLayoutArea rootLayoutArea = new RootLayoutArea(currentPageNumber, getCurrentPageEffectiveArea(lastPageSize));
        this.currentArea = rootLayoutArea;
        return rootLayoutArea;
    }

    @Override // com.itextpdf.layout.renderer.RootRenderer
    protected void flushSingleRenderer(IRenderer resultRenderer) {
        linkRenderToDocument(resultRenderer, this.document.getPdfDocument());
        Transform transformProp = (Transform) resultRenderer.getProperty(53);
        if (!this.waitingDrawingElements.contains(resultRenderer)) {
            processWaitingDrawing(resultRenderer, transformProp, this.waitingDrawingElements);
            if (FloatingHelper.isRendererFloating(resultRenderer) || transformProp != null) {
                return;
            }
        }
        if (!resultRenderer.isFlushed() && resultRenderer.getOccupiedArea() != null) {
            int pageNum = resultRenderer.getOccupiedArea().getPageNumber();
            PdfDocument pdfDocument = this.document.getPdfDocument();
            ensureDocumentHasNPages(pageNum, null);
            PdfPage correspondingPage = pdfDocument.getPage(pageNum);
            if (correspondingPage.isFlushed()) {
                throw new PdfException(LayoutExceptionMessageConstant.CANNOT_DRAW_ELEMENTS_ON_ALREADY_FLUSHED_PAGES);
            }
            boolean wrapOldContent = pdfDocument.getReader() != null && pdfDocument.getWriter() != null && correspondingPage.getContentStreamCount() > 0 && correspondingPage.getLastContentStream().getLength() > 0 && !this.wrappedContentPage.contains(Integer.valueOf(pageNum)) && pdfDocument.getNumberOfPages() >= pageNum;
            this.wrappedContentPage.add(Integer.valueOf(pageNum));
            if (pdfDocument.isTagged()) {
                pdfDocument.getTagStructureContext().getAutoTaggingPointer().setPageForTagging(correspondingPage);
            }
            resultRenderer.draw(new DrawContext(pdfDocument, new PdfCanvas(correspondingPage, wrapOldContent), pdfDocument.isTagged()));
        }
    }

    protected PageSize addNewPage(PageSize customPageSize) {
        Document document = this.document;
        if (customPageSize != null) {
            document.getPdfDocument().addNewPage(customPageSize);
        } else {
            document.getPdfDocument().addNewPage();
        }
        return customPageSize != null ? customPageSize : this.document.getPdfDocument().getDefaultPageSize();
    }

    protected PageSize ensureDocumentHasNPages(int n, PageSize customPageSize) {
        PageSize lastPageSize = null;
        while (this.document.getPdfDocument().getNumberOfPages() < n) {
            lastPageSize = addNewPage(customPageSize);
        }
        return lastPageSize;
    }

    private Rectangle getCurrentPageEffectiveArea(PageSize pageSize) {
        float leftMargin = getPropertyAsFloat(44).floatValue();
        float bottomMargin = getPropertyAsFloat(43).floatValue();
        float topMargin = getPropertyAsFloat(46).floatValue();
        float rightMargin = getPropertyAsFloat(45).floatValue();
        return new Rectangle(pageSize.getLeft() + leftMargin, pageSize.getBottom() + bottomMargin, (pageSize.getWidth() - leftMargin) - rightMargin, (pageSize.getHeight() - bottomMargin) - topMargin);
    }

    private void possiblyFlushPreviousPage(int currentPageNumber) {
        if (this.immediateFlush && currentPageNumber > 1) {
            this.document.getPdfDocument().getPage(currentPageNumber - 1).flush();
        }
    }
}
