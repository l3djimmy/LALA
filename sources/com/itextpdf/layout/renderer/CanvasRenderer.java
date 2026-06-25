package com.itextpdf.layout.renderer;

import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.pdf.tagutils.TagTreePointer;
import com.itextpdf.layout.Canvas;
import com.itextpdf.layout.layout.LayoutArea;
import com.itextpdf.layout.layout.LayoutResult;
import com.itextpdf.layout.layout.RootLayoutArea;
import com.itextpdf.layout.properties.Transform;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class CanvasRenderer extends RootRenderer {
    protected Canvas canvas;

    public CanvasRenderer(Canvas canvas) {
        this(canvas, true);
    }

    public CanvasRenderer(Canvas canvas, boolean immediateFlush) {
        this.canvas = canvas;
        this.modelElement = canvas;
        this.immediateFlush = immediateFlush;
    }

    @Override // com.itextpdf.layout.renderer.RootRenderer, com.itextpdf.layout.renderer.AbstractRenderer, com.itextpdf.layout.renderer.IRenderer
    public void addChild(IRenderer renderer) {
        if (Boolean.TRUE.equals(getPropertyAsBoolean(25))) {
            LoggerFactory.getLogger(CanvasRenderer.class).warn(IoLogMessageConstant.CANVAS_ALREADY_FULL_ELEMENT_WILL_BE_SKIPPED);
        } else {
            super.addChild(renderer);
        }
    }

    @Override // com.itextpdf.layout.renderer.RootRenderer
    protected void flushSingleRenderer(IRenderer resultRenderer) {
        linkRenderToDocument(resultRenderer, this.canvas.getPdfDocument());
        Transform transformProp = (Transform) resultRenderer.getProperty(53);
        if (!this.waitingDrawingElements.contains(resultRenderer)) {
            processWaitingDrawing(resultRenderer, transformProp, this.waitingDrawingElements);
            if (FloatingHelper.isRendererFloating(resultRenderer) || transformProp != null) {
                return;
            }
        }
        if (!resultRenderer.isFlushed()) {
            boolean toTag = this.canvas.getPdfDocument().isTagged() && this.canvas.isAutoTaggingEnabled();
            TagTreePointer tagPointer = null;
            if (toTag) {
                tagPointer = this.canvas.getPdfDocument().getTagStructureContext().getAutoTaggingPointer();
                tagPointer.setPageForTagging(this.canvas.getPage());
                boolean pageStream = false;
                int i = this.canvas.getPage().getContentStreamCount() - 1;
                while (true) {
                    if (i < 0) {
                        break;
                    } else if (!this.canvas.getPage().getContentStream(i).equals(this.canvas.getPdfCanvas().getContentStream())) {
                        i--;
                    } else {
                        pageStream = true;
                        break;
                    }
                }
                if (!pageStream) {
                    tagPointer.setContentStreamForTagging(this.canvas.getPdfCanvas().getContentStream());
                }
            }
            resultRenderer.draw(new DrawContext(this.canvas.getPdfDocument(), this.canvas.getPdfCanvas(), toTag));
            if (toTag) {
                tagPointer.setContentStreamForTagging(null);
            }
        }
    }

    @Override // com.itextpdf.layout.renderer.RootRenderer
    protected LayoutArea updateCurrentArea(LayoutResult overflowResult) {
        if (this.currentArea == null) {
            int pageNumber = this.canvas.isCanvasOfPage() ? this.canvas.getPdfDocument().getPageNumber(this.canvas.getPage()) : 0;
            this.currentArea = new RootLayoutArea(pageNumber, this.canvas.getRootArea().mo7327clone());
        } else {
            setProperty(25, true);
            this.currentArea = null;
        }
        return this.currentArea;
    }

    @Override // com.itextpdf.layout.renderer.IRenderer
    public IRenderer getNextRenderer() {
        return new CanvasRenderer(this.canvas, this.immediateFlush);
    }
}
