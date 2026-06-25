package com.itextpdf.layout.renderer;

import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.layout.layout.LayoutArea;
import com.itextpdf.layout.layout.LayoutContext;
import com.itextpdf.layout.layout.LayoutResult;
import com.itextpdf.layout.margincollapse.MarginsCollapseInfo;
import com.itextpdf.layout.properties.ParagraphOrphansControl;
import com.itextpdf.layout.properties.ParagraphWidowsControl;
import java.util.ArrayList;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public class OrphansWidowsLayoutHelper {
    private OrphansWidowsLayoutHelper() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static LayoutResult orphansWidowsAwareLayout(ParagraphRenderer renderer, LayoutContext context, ParagraphOrphansControl orphansControl, ParagraphWidowsControl widowsControl) {
        int extraWidows;
        OrphansWidowsLayoutAttempt layoutAttempt = attemptLayout(renderer, context, context.getArea().mo7332clone());
        if (context.isClippedHeight() || renderer.isPositioned() || layoutAttempt.attemptResult.getStatus() != 2 || layoutAttempt.attemptResult.getSplitRenderer() == null) {
            return handleAttemptAsSuccessful(layoutAttempt, context);
        }
        ParagraphRenderer splitRenderer = (ParagraphRenderer) layoutAttempt.attemptResult.getSplitRenderer();
        boolean orphansViolation = (orphansControl == null || splitRenderer == null || splitRenderer.getLines().size() >= orphansControl.getMinOrphans() || renderer.isFirstOnRootArea()) ? false : true;
        boolean forcedPlacement = Boolean.TRUE.equals(renderer.getPropertyAsBoolean(26));
        if (orphansViolation && forcedPlacement) {
            orphansControl.handleViolatedOrphans(splitRenderer, "Ignored orphans constraint due to forced placement.");
        }
        if (orphansViolation && !forcedPlacement) {
            layoutAttempt = null;
        } else if (widowsControl != null && splitRenderer != null && layoutAttempt.attemptResult.getOverflowRenderer() != null) {
            ParagraphRenderer overflowRenderer = (ParagraphRenderer) layoutAttempt.attemptResult.getOverflowRenderer();
            LayoutArea simulationArea = new LayoutArea(context.getArea().getPageNumber(), context.getArea().getBBox().mo7327clone().setHeight(3500));
            LayoutContext simulationContext = new LayoutContext(simulationArea);
            LayoutResult simulationResult = overflowRenderer.directLayout(simulationContext);
            if (simulationResult.getStatus() == 1 && (extraWidows = widowsControl.getMinWidows() - overflowRenderer.getLines().size()) > 0) {
                int extraLinesToMove = orphansControl != null ? Math.max(orphansControl.getMinOrphans(), 1) : 1;
                if (extraWidows <= widowsControl.getMaxLinesToMove() && splitRenderer.getLines().size() - extraWidows >= extraLinesToMove) {
                    LineRenderer lastLine = splitRenderer.getLines().get(splitRenderer.getLines().size() - 1);
                    LineRenderer lastLineToLeave = splitRenderer.getLines().get((splitRenderer.getLines().size() - extraWidows) - 1);
                    float d = (lastLineToLeave.getOccupiedArea().getBBox().getY() - lastLine.getOccupiedArea().getBBox().getY()) - 1.0E-4f;
                    Rectangle smallerBBox = new Rectangle(context.getArea().getBBox());
                    smallerBBox.decreaseHeight(d);
                    smallerBBox.moveUp(d);
                    LayoutArea smallerAvailableArea = new LayoutArea(context.getArea().getPageNumber(), smallerBBox);
                    layoutAttempt = attemptLayout(renderer, context, smallerAvailableArea);
                } else if (forcedPlacement || renderer.isFirstOnRootArea() || !widowsControl.isOverflowOnWidowsViolation()) {
                    if (forcedPlacement) {
                        widowsControl.handleViolatedWidows(overflowRenderer, "forced placement");
                    } else {
                        widowsControl.handleViolatedWidows(overflowRenderer, "inability to fix it");
                    }
                } else {
                    layoutAttempt = null;
                }
            }
        }
        if (layoutAttempt == null) {
            return new LayoutResult(3, null, null, renderer);
        }
        return handleAttemptAsSuccessful(layoutAttempt, context);
    }

    private static OrphansWidowsLayoutAttempt attemptLayout(ParagraphRenderer renderer, LayoutContext originalContext, LayoutArea attemptArea) {
        OrphansWidowsLayoutAttempt attemptResult = new OrphansWidowsLayoutAttempt();
        MarginsCollapseInfo copiedMarginsCollapseInfo = null;
        if (originalContext.getMarginsCollapseInfo() != null) {
            copiedMarginsCollapseInfo = MarginsCollapseInfo.createDeepCopy(originalContext.getMarginsCollapseInfo());
        }
        ArrayList<Rectangle> attemptFloatRectsList = new ArrayList<>(originalContext.getFloatRendererAreas());
        LayoutContext attemptContext = new LayoutContext(attemptArea, copiedMarginsCollapseInfo, attemptFloatRectsList, originalContext.isClippedHeight());
        attemptResult.attemptContext = attemptContext;
        attemptResult.attemptResult = renderer.directLayout(attemptContext);
        return attemptResult;
    }

    private static LayoutResult handleAttemptAsSuccessful(OrphansWidowsLayoutAttempt attemptResult, LayoutContext originalContext) {
        originalContext.getFloatRendererAreas().clear();
        originalContext.getFloatRendererAreas().addAll(attemptResult.attemptContext.getFloatRendererAreas());
        if (originalContext.getMarginsCollapseInfo() != null) {
            MarginsCollapseInfo.updateFromCopy(originalContext.getMarginsCollapseInfo(), attemptResult.attemptContext.getMarginsCollapseInfo());
        }
        return attemptResult.attemptResult;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class OrphansWidowsLayoutAttempt {
        LayoutContext attemptContext;
        LayoutResult attemptResult;

        private OrphansWidowsLayoutAttempt() {
        }
    }
}
