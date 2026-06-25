package com.itextpdf.layout.renderer;

import com.itextpdf.commons.actions.EventManager;
import com.itextpdf.commons.actions.sequence.AbstractIdentifiableElement;
import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.actions.events.LinkDocumentIdEvent;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.layout.IPropertyContainer;
import com.itextpdf.layout.layout.LayoutArea;
import com.itextpdf.layout.layout.LayoutContext;
import com.itextpdf.layout.layout.LayoutResult;
import com.itextpdf.layout.layout.RootLayoutArea;
import com.itextpdf.layout.logs.LayoutLogMessageConstant;
import com.itextpdf.layout.margincollapse.MarginsCollapseHandler;
import com.itextpdf.layout.tagging.LayoutTaggingHelper;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public abstract class RootRenderer extends AbstractRenderer {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    protected RootLayoutArea currentArea;
    List<Rectangle> floatRendererAreas;
    private LayoutArea initialCurrentArea;
    private IRenderer keepWithNextHangingRenderer;
    private LayoutResult keepWithNextHangingRendererLayoutResult;
    private MarginsCollapseHandler marginsCollapseHandler;
    protected boolean immediateFlush = true;
    protected List<IRenderer> waitingDrawingElements = new ArrayList();
    private List<IRenderer> waitingNextPageRenderers = new ArrayList();
    private boolean floatOverflowedCompletely = false;

    protected abstract void flushSingleRenderer(IRenderer iRenderer);

    protected abstract LayoutArea updateCurrentArea(LayoutResult layoutResult);

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:115:0x029e  */
    /* JADX WARN: Removed duplicated region for block: B:117:0x02ab  */
    /* JADX WARN: Removed duplicated region for block: B:119:0x02b0  */
    /* JADX WARN: Removed duplicated region for block: B:120:0x02c6  */
    /* JADX WARN: Removed duplicated region for block: B:122:0x02c9  */
    /* JADX WARN: Removed duplicated region for block: B:125:0x02dd A[ADDED_TO_REGION] */
    @Override // com.itextpdf.layout.renderer.AbstractRenderer, com.itextpdf.layout.renderer.IRenderer
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void addChild(com.itextpdf.layout.renderer.IRenderer r24) {
        /*
            Method dump skipped, instructions count: 934
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.layout.renderer.RootRenderer.addChild(com.itextpdf.layout.renderer.IRenderer):void");
    }

    public void flush() {
        for (IRenderer resultRenderer : this.childRenderers) {
            flushSingleRenderer(resultRenderer);
        }
        for (IRenderer resultRenderer2 : this.positionedRenderers) {
            flushSingleRenderer(resultRenderer2);
        }
        this.childRenderers.clear();
        this.positionedRenderers.clear();
    }

    public void close() {
        addAllWaitingNextPageRenderers();
        if (this.keepWithNextHangingRenderer != null) {
            this.keepWithNextHangingRenderer.setProperty(81, false);
            IRenderer rendererToBeAdded = this.keepWithNextHangingRenderer;
            this.keepWithNextHangingRenderer = null;
            addChild(rendererToBeAdded);
        }
        if (!this.immediateFlush) {
            flush();
        }
        flushWaitingDrawingElements(true);
        LayoutTaggingHelper taggingHelper = (LayoutTaggingHelper) getProperty(108);
        if (taggingHelper != null) {
            taggingHelper.releaseAllHints();
        }
    }

    @Override // com.itextpdf.layout.renderer.IRenderer
    public LayoutResult layout(LayoutContext layoutContext) {
        throw new IllegalStateException("Layout is not supported for root renderers.");
    }

    public LayoutArea getCurrentArea() {
        if (this.currentArea == null) {
            updateCurrentAndInitialArea(null);
        }
        return this.currentArea;
    }

    protected void shrinkCurrentAreaAndProcessRenderer(IRenderer renderer, List<IRenderer> resultRenderers, LayoutResult result) {
        if (this.currentArea != null) {
            float resultRendererHeight = result.getOccupiedArea().getBBox().getHeight();
            this.currentArea.getBBox().setHeight(this.currentArea.getBBox().getHeight() - resultRendererHeight);
            if (this.currentArea.isEmptyArea() && (resultRendererHeight > 0.0f || FloatingHelper.isRendererFloating(renderer))) {
                this.currentArea.setEmptyArea(false);
            }
            processRenderer(renderer, resultRenderers);
        }
        if (!this.immediateFlush) {
            this.childRenderers.addAll(resultRenderers);
        }
    }

    protected void flushWaitingDrawingElements() {
        flushWaitingDrawingElements(true);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void flushWaitingDrawingElements(boolean force) {
        Set<IRenderer> flushedElements = new HashSet<>();
        int i = 0;
        while (true) {
            int size = this.waitingDrawingElements.size();
            List<IRenderer> list = this.waitingDrawingElements;
            if (i < size) {
                IRenderer waitingDrawingElement = list.get(i);
                if (force || (waitingDrawingElement.getOccupiedArea() != null && waitingDrawingElement.getOccupiedArea().getPageNumber() < this.currentArea.getPageNumber())) {
                    flushSingleRenderer(waitingDrawingElement);
                    flushedElements.add(waitingDrawingElement);
                } else if (waitingDrawingElement.getOccupiedArea() == null) {
                    flushedElements.add(waitingDrawingElement);
                }
                i++;
            } else {
                list.removeAll(flushedElements);
                return;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void linkRenderToDocument(IRenderer renderer, PdfDocument pdfDocument) {
        if (renderer == null) {
            return;
        }
        IPropertyContainer container = renderer.getModelElement();
        if (container instanceof AbstractIdentifiableElement) {
            EventManager.getInstance().onEvent(new LinkDocumentIdEvent(pdfDocument, (AbstractIdentifiableElement) container));
        }
        List<IRenderer> children = renderer.getChildRenderers();
        if (children != null) {
            for (IRenderer child : children) {
                linkRenderToDocument(child, pdfDocument);
            }
        }
    }

    private void processRenderer(IRenderer renderer, List<IRenderer> resultRenderers) {
        alignChildHorizontally(renderer, this.currentArea.getBBox());
        if (this.immediateFlush) {
            flushSingleRenderer(renderer);
        } else {
            resultRenderers.add(renderer);
        }
    }

    private void processWaitingKeepWithNextElement(IRenderer renderer) {
        LayoutArea rest;
        if (this.keepWithNextHangingRenderer != null) {
            LayoutArea rest2 = this.currentArea.mo7332clone();
            rest2.getBBox().setHeight(rest2.getBBox().getHeight() - this.keepWithNextHangingRendererLayoutResult.getOccupiedArea().getBBox().getHeight());
            boolean ableToProcessKeepWithNext = false;
            int i = 1;
            if (renderer.setParent(this).layout(new LayoutContext(rest2)).getStatus() != 3) {
                shrinkCurrentAreaAndProcessRenderer(this.keepWithNextHangingRenderer, new ArrayList(), this.keepWithNextHangingRendererLayoutResult);
                ableToProcessKeepWithNext = true;
            } else {
                float originalElementHeight = this.keepWithNextHangingRendererLayoutResult.getOccupiedArea().getBBox().getHeight();
                List<Float> trySplitHeightPoints = new ArrayList<>();
                for (int i2 = 1; i2 <= 5 && originalElementHeight - (i2 * 35.0f) > originalElementHeight / 2.0f; i2++) {
                    trySplitHeightPoints.add(Float.valueOf(originalElementHeight - (i2 * 35.0f)));
                }
                int i3 = 0;
                while (i3 < trySplitHeightPoints.size() && !ableToProcessKeepWithNext) {
                    float curElementSplitHeight = trySplitHeightPoints.get(i3).floatValue();
                    RootLayoutArea firstElementSplitLayoutArea = (RootLayoutArea) this.currentArea.mo7332clone();
                    firstElementSplitLayoutArea.getBBox().setHeight(curElementSplitHeight).moveUp(this.currentArea.getBBox().getHeight() - curElementSplitHeight);
                    LayoutResult firstElementSplitLayoutResult = this.keepWithNextHangingRenderer.setParent(this).layout(new LayoutContext(firstElementSplitLayoutArea.mo7332clone()));
                    if (firstElementSplitLayoutResult.getStatus() != 2) {
                        rest = rest2;
                    } else {
                        RootLayoutArea storedArea = this.currentArea;
                        updateCurrentAndInitialArea(firstElementSplitLayoutResult);
                        LayoutResult firstElementOverflowLayoutResult = firstElementSplitLayoutResult.getOverflowRenderer().layout(new LayoutContext(this.currentArea.mo7332clone()));
                        if (firstElementOverflowLayoutResult.getStatus() != i) {
                            rest = rest2;
                        } else {
                            LayoutArea secondElementLayoutArea = this.currentArea.mo7332clone();
                            secondElementLayoutArea.getBBox().setHeight(secondElementLayoutArea.getBBox().getHeight() - firstElementOverflowLayoutResult.getOccupiedArea().getBBox().getHeight());
                            LayoutResult secondElementLayoutResult = renderer.setParent(this).layout(new LayoutContext(secondElementLayoutArea));
                            rest = rest2;
                            if (secondElementLayoutResult.getStatus() != 3) {
                                ableToProcessKeepWithNext = true;
                                this.currentArea = firstElementSplitLayoutArea;
                                shrinkCurrentAreaAndProcessRenderer(firstElementSplitLayoutResult.getSplitRenderer(), new ArrayList(), firstElementSplitLayoutResult);
                                updateCurrentAndInitialArea(firstElementSplitLayoutResult);
                                shrinkCurrentAreaAndProcessRenderer(firstElementSplitLayoutResult.getOverflowRenderer(), new ArrayList(), firstElementOverflowLayoutResult);
                            }
                        }
                        if (!ableToProcessKeepWithNext) {
                            this.currentArea = storedArea;
                        }
                    }
                    i3++;
                    rest2 = rest;
                    i = 1;
                }
            }
            if (!ableToProcessKeepWithNext && !this.currentArea.isEmptyArea()) {
                RootLayoutArea storedArea2 = this.currentArea;
                updateCurrentAndInitialArea(null);
                LayoutResult firstElementLayoutResult = this.keepWithNextHangingRenderer.setParent(this).layout(new LayoutContext(this.currentArea.mo7332clone()));
                if (firstElementLayoutResult.getStatus() == 1) {
                    LayoutArea secondElementLayoutArea2 = this.currentArea.mo7332clone();
                    secondElementLayoutArea2.getBBox().setHeight(secondElementLayoutArea2.getBBox().getHeight() - firstElementLayoutResult.getOccupiedArea().getBBox().getHeight());
                    LayoutResult secondElementLayoutResult2 = renderer.setParent(this).layout(new LayoutContext(secondElementLayoutArea2));
                    if (secondElementLayoutResult2.getStatus() != 3) {
                        ableToProcessKeepWithNext = true;
                        shrinkCurrentAreaAndProcessRenderer(this.keepWithNextHangingRenderer, new ArrayList(), this.keepWithNextHangingRendererLayoutResult);
                    }
                }
                if (!ableToProcessKeepWithNext) {
                    this.currentArea = storedArea2;
                }
            }
            if (!ableToProcessKeepWithNext) {
                Logger logger = LoggerFactory.getLogger(RootRenderer.class);
                logger.warn(IoLogMessageConstant.RENDERER_WAS_NOT_ABLE_TO_PROCESS_KEEP_WITH_NEXT);
                shrinkCurrentAreaAndProcessRenderer(this.keepWithNextHangingRenderer, new ArrayList(), this.keepWithNextHangingRendererLayoutResult);
            }
            this.keepWithNextHangingRenderer = null;
            this.keepWithNextHangingRendererLayoutResult = null;
        }
    }

    private void updateCurrentAndInitialArea(LayoutResult overflowResult) {
        this.floatRendererAreas = new ArrayList();
        updateCurrentArea(overflowResult);
        this.initialCurrentArea = this.currentArea == null ? null : this.currentArea.mo7332clone();
        addWaitingNextPageRenderers();
    }

    private void addAllWaitingNextPageRenderers() {
        boolean marginsCollapsingEnabled = Boolean.TRUE.equals(getPropertyAsBoolean(89));
        while (!this.waitingNextPageRenderers.isEmpty()) {
            if (marginsCollapsingEnabled) {
                this.marginsCollapseHandler = new MarginsCollapseHandler(this, null);
            }
            updateCurrentAndInitialArea(null);
        }
    }

    private void addWaitingNextPageRenderers() {
        this.floatOverflowedCompletely = false;
        List<IRenderer> waitingFloatRenderers = new ArrayList<>(this.waitingNextPageRenderers);
        this.waitingNextPageRenderers.clear();
        for (IRenderer renderer : waitingFloatRenderers) {
            addChild(renderer);
        }
    }

    private boolean updateForcedPlacement(IRenderer currentRenderer, IRenderer overflowRenderer) {
        if (Boolean.TRUE.equals(currentRenderer.getProperty(26))) {
            return false;
        }
        overflowRenderer.setProperty(26, true);
        Logger logger = LoggerFactory.getLogger(RootRenderer.class);
        if (logger.isWarnEnabled()) {
            logger.warn(MessageFormatUtil.format(LayoutLogMessageConstant.ELEMENT_DOES_NOT_FIT_AREA, ""));
        }
        return true;
    }

    private boolean tryDisableKeepTogether(LayoutResult result, boolean rendererIsFloat, RootRendererAreaStateHandler rootRendererStateHandler) {
        IRenderer toDisableKeepTogether = null;
        for (IRenderer current = result.getCauseOfNothing(); current != null; current = current.getParent()) {
            if (Boolean.TRUE.equals(current.getProperty(32))) {
                toDisableKeepTogether = current;
            }
        }
        if (toDisableKeepTogether != null) {
            toDisableKeepTogether.setProperty(32, false);
            Logger logger = LoggerFactory.getLogger(RootRenderer.class);
            if (logger.isWarnEnabled()) {
                logger.warn(MessageFormatUtil.format(LayoutLogMessageConstant.ELEMENT_DOES_NOT_FIT_AREA, "KeepTogether property will be ignored."));
            }
            if (!rendererIsFloat) {
                rootRendererStateHandler.attemptGoBackToStoredPreviousStateAndStoreNextState(this);
                return true;
            }
            return true;
        }
        return false;
    }
}
