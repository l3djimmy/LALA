package com.itextpdf.layout.margincollapse;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.layout.IPropertyContainer;
import com.itextpdf.layout.properties.FloatPropertyValue;
import com.itextpdf.layout.properties.UnitValue;
import com.itextpdf.layout.renderer.AbstractRenderer;
import com.itextpdf.layout.renderer.BlockFormattingContextUtil;
import com.itextpdf.layout.renderer.BlockRenderer;
import com.itextpdf.layout.renderer.CellRenderer;
import com.itextpdf.layout.renderer.IRenderer;
import com.itextpdf.layout.renderer.LineRenderer;
import com.itextpdf.layout.renderer.TableRenderer;
import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class MarginsCollapseHandler {
    private MarginsCollapseInfo backupCollapseInfo;
    private Rectangle backupLayoutBox;
    private MarginsCollapseInfo childMarginInfo;
    private MarginsCollapseInfo collapseInfo;
    private boolean lastKidCollapsedAfterHasClearanceApplied;
    private MarginsCollapseInfo prevChildMarginInfo;
    private IRenderer renderer;
    private int firstNotEmptyKidIndex = 0;
    private int processedChildrenNum = 0;
    private List<IRenderer> rendererChildren = new ArrayList();

    public MarginsCollapseHandler(IRenderer renderer, MarginsCollapseInfo marginsCollapseInfo) {
        this.renderer = renderer;
        this.collapseInfo = marginsCollapseInfo != null ? marginsCollapseInfo : new MarginsCollapseInfo();
    }

    public void processFixedHeightAdjustment(float heightDelta) {
        this.collapseInfo.setBufferSpaceOnTop(this.collapseInfo.getBufferSpaceOnTop() + heightDelta);
        this.collapseInfo.setBufferSpaceOnBottom(this.collapseInfo.getBufferSpaceOnBottom() + heightDelta);
    }

    public MarginsCollapseInfo startChildMarginsHandling(IRenderer child, Rectangle layoutBox) {
        boolean childIsBlockElement = true;
        if (this.backupLayoutBox != null) {
            restoreLayoutBoxAfterFailedLayoutAttempt(layoutBox);
            int i = this.processedChildrenNum - 1;
            this.processedChildrenNum = i;
            removeRendererChild(i);
            this.childMarginInfo = null;
        }
        this.rendererChildren.add(child);
        int childIndex = this.processedChildrenNum;
        this.processedChildrenNum = childIndex + 1;
        childIsBlockElement = (rendererIsFloated(child) || !isBlockElement(child)) ? false : false;
        this.backupLayoutBox = layoutBox.mo7327clone();
        this.backupCollapseInfo = new MarginsCollapseInfo();
        this.collapseInfo.copyTo(this.backupCollapseInfo);
        prepareBoxForLayoutAttempt(layoutBox, childIndex, childIsBlockElement);
        if (childIsBlockElement) {
            this.childMarginInfo = createMarginsInfoForBlockChild(childIndex);
        }
        return this.childMarginInfo;
    }

    public void applyClearance(float clearHeightCorrection) {
        this.collapseInfo.setClearanceApplied(true);
        this.collapseInfo.getCollapseBefore().joinMargin(clearHeightCorrection);
    }

    private MarginsCollapseInfo createMarginsInfoForBlockChild(int childIndex) {
        MarginsCollapse childCollapseBefore;
        boolean ignoreChildTopMargin = false;
        boolean ignoreChildBottomMargin = lastChildMarginAdjoinedToParent(this.renderer);
        if (childIndex == this.firstNotEmptyKidIndex) {
            ignoreChildTopMargin = firstChildMarginAdjoinedToParent(this.renderer);
        }
        if (childIndex == 0) {
            MarginsCollapse parentCollapseBefore = this.collapseInfo.getCollapseBefore();
            childCollapseBefore = ignoreChildTopMargin ? parentCollapseBefore : new MarginsCollapse();
        } else {
            MarginsCollapse prevChildCollapseAfter = this.prevChildMarginInfo != null ? this.prevChildMarginInfo.getOwnCollapseAfter() : null;
            childCollapseBefore = prevChildCollapseAfter != null ? prevChildCollapseAfter : new MarginsCollapse();
        }
        MarginsCollapse parentCollapseAfter = this.collapseInfo.getCollapseAfter().m7333clone();
        MarginsCollapse childCollapseAfter = ignoreChildBottomMargin ? parentCollapseAfter : new MarginsCollapse();
        MarginsCollapseInfo childMarginsInfo = new MarginsCollapseInfo(ignoreChildTopMargin, ignoreChildBottomMargin, childCollapseBefore, childCollapseAfter);
        if (ignoreChildTopMargin && childIndex == this.firstNotEmptyKidIndex) {
            childMarginsInfo.setBufferSpaceOnTop(this.collapseInfo.getBufferSpaceOnTop());
        }
        if (ignoreChildBottomMargin) {
            childMarginsInfo.setBufferSpaceOnBottom(this.collapseInfo.getBufferSpaceOnBottom());
        }
        return childMarginsInfo;
    }

    public void endChildMarginsHandling(Rectangle layoutBox) {
        boolean z = true;
        int childIndex = this.processedChildrenNum - 1;
        if (rendererIsFloated(getRendererChild(childIndex))) {
            return;
        }
        if (this.childMarginInfo != null) {
            if (this.firstNotEmptyKidIndex == childIndex && this.childMarginInfo.isSelfCollapsing()) {
                this.firstNotEmptyKidIndex = childIndex + 1;
            }
            this.collapseInfo.setSelfCollapsing(this.collapseInfo.isSelfCollapsing() && this.childMarginInfo.isSelfCollapsing());
            if (!this.childMarginInfo.isSelfCollapsing() || !this.childMarginInfo.isClearanceApplied()) {
                z = false;
            }
            this.lastKidCollapsedAfterHasClearanceApplied = z;
        } else {
            this.lastKidCollapsedAfterHasClearanceApplied = false;
            this.collapseInfo.setSelfCollapsing(false);
        }
        if (this.prevChildMarginInfo != null) {
            fixPrevChildOccupiedArea(childIndex);
            updateCollapseBeforeIfPrevKidIsFirstAndSelfCollapsed(this.prevChildMarginInfo.getOwnCollapseAfter());
        }
        if (this.firstNotEmptyKidIndex == childIndex && firstChildMarginAdjoinedToParent(this.renderer) && !this.collapseInfo.isSelfCollapsing()) {
            getRidOfCollapseArtifactsAtopOccupiedArea();
            if (this.childMarginInfo != null) {
                processUsedChildBufferSpaceOnTop(layoutBox);
            }
        }
        this.prevChildMarginInfo = this.childMarginInfo;
        this.childMarginInfo = null;
        this.backupLayoutBox = null;
        this.backupCollapseInfo = null;
    }

    public void startMarginsCollapse(Rectangle parentBBox) {
        this.collapseInfo.getCollapseBefore().joinMargin(defineTopMarginValueForCollapse(this.renderer));
        this.collapseInfo.getCollapseAfter().joinMargin(defineBottomMarginValueForCollapse(this.renderer));
        if (!firstChildMarginAdjoinedToParent(this.renderer)) {
            float topIndent = this.collapseInfo.getCollapseBefore().getCollapsedMarginsSize();
            applyTopMargin(parentBBox, topIndent);
        }
        if (!lastChildMarginAdjoinedToParent(this.renderer)) {
            float bottomIndent = this.collapseInfo.getCollapseAfter().getCollapsedMarginsSize();
            applyBottomMargin(parentBBox, bottomIndent);
        }
        ignoreModelTopMargin(this.renderer);
        ignoreModelBottomMargin(this.renderer);
    }

    public void endMarginsCollapse(Rectangle layoutBox) {
        MarginsCollapse ownCollapseAfter;
        if (this.backupLayoutBox != null) {
            restoreLayoutBoxAfterFailedLayoutAttempt(layoutBox);
        }
        if (this.prevChildMarginInfo != null) {
            updateCollapseBeforeIfPrevKidIsFirstAndSelfCollapsed(this.prevChildMarginInfo.getCollapseAfter());
        }
        boolean lastChildMarginJoinedToParent = true;
        boolean couldBeSelfCollapsing = marginsCouldBeSelfCollapsing(this.renderer) && !this.lastKidCollapsedAfterHasClearanceApplied;
        boolean blockHasNoKidsWithContent = this.collapseInfo.isSelfCollapsing();
        if (firstChildMarginAdjoinedToParent(this.renderer) && blockHasNoKidsWithContent && !couldBeSelfCollapsing) {
            addNotYetAppliedTopMargin(layoutBox);
        }
        this.collapseInfo.setSelfCollapsing(this.collapseInfo.isSelfCollapsing() && couldBeSelfCollapsing);
        if (!blockHasNoKidsWithContent && this.lastKidCollapsedAfterHasClearanceApplied) {
            applySelfCollapsedKidMarginWithClearance(layoutBox);
        }
        if (this.prevChildMarginInfo == null || !this.prevChildMarginInfo.isIgnoreOwnMarginBottom() || this.lastKidCollapsedAfterHasClearanceApplied) {
            lastChildMarginJoinedToParent = false;
        }
        if (lastChildMarginJoinedToParent) {
            ownCollapseAfter = this.prevChildMarginInfo.getOwnCollapseAfter();
        } else {
            ownCollapseAfter = new MarginsCollapse();
        }
        ownCollapseAfter.joinMargin(defineBottomMarginValueForCollapse(this.renderer));
        this.collapseInfo.setOwnCollapseAfter(ownCollapseAfter);
        if (this.collapseInfo.isSelfCollapsing()) {
            MarginsCollapseInfo marginsCollapseInfo = this.prevChildMarginInfo;
            MarginsCollapseInfo marginsCollapseInfo2 = this.collapseInfo;
            if (marginsCollapseInfo != null) {
                marginsCollapseInfo2.setCollapseAfter(this.prevChildMarginInfo.getCollapseAfter());
            } else {
                marginsCollapseInfo2.getCollapseAfter().joinMargin(this.collapseInfo.getCollapseBefore());
                this.collapseInfo.getOwnCollapseAfter().joinMargin(this.collapseInfo.getCollapseBefore());
            }
            if (!this.collapseInfo.isIgnoreOwnMarginBottom() && !this.collapseInfo.isIgnoreOwnMarginTop()) {
                float collapsedMargins = this.collapseInfo.getCollapseAfter().getCollapsedMarginsSize();
                overrideModelBottomMargin(this.renderer, collapsedMargins);
            }
        } else {
            MarginsCollapse marginsCollapseBefore = this.collapseInfo.getCollapseBefore();
            if (!this.collapseInfo.isIgnoreOwnMarginTop()) {
                float collapsedMargins2 = marginsCollapseBefore.getCollapsedMarginsSize();
                overrideModelTopMargin(this.renderer, collapsedMargins2);
            }
            if (lastChildMarginJoinedToParent) {
                this.collapseInfo.setCollapseAfter(this.prevChildMarginInfo.getCollapseAfter());
            }
            if (!this.collapseInfo.isIgnoreOwnMarginBottom()) {
                float collapsedMargins3 = this.collapseInfo.getCollapseAfter().getCollapsedMarginsSize();
                overrideModelBottomMargin(this.renderer, collapsedMargins3);
            }
        }
        if (lastChildMarginAdjoinedToParent(this.renderer)) {
            if (this.prevChildMarginInfo != null || blockHasNoKidsWithContent) {
                float collapsedMargins4 = this.collapseInfo.getCollapseAfter().getCollapsedMarginsSize();
                applyBottomMargin(layoutBox, collapsedMargins4);
            }
        }
    }

    private void updateCollapseBeforeIfPrevKidIsFirstAndSelfCollapsed(MarginsCollapse collapseAfter) {
        if (this.prevChildMarginInfo.isSelfCollapsing() && this.prevChildMarginInfo.isIgnoreOwnMarginTop()) {
            this.collapseInfo.getCollapseBefore().joinMargin(collapseAfter);
        }
    }

    private void prepareBoxForLayoutAttempt(Rectangle layoutBox, int childIndex, boolean childIsBlockElement) {
        if (this.prevChildMarginInfo != null) {
            boolean prevChildCanApplyCollapseAfter = true;
            boolean prevChildHasAppliedCollapseAfter = (this.prevChildMarginInfo.isIgnoreOwnMarginBottom() || (this.prevChildMarginInfo.isSelfCollapsing() && this.prevChildMarginInfo.isIgnoreOwnMarginTop())) ? false : true;
            if (prevChildHasAppliedCollapseAfter) {
                layoutBox.setHeight(layoutBox.getHeight() + this.prevChildMarginInfo.getCollapseAfter().getCollapsedMarginsSize());
            }
            if (this.prevChildMarginInfo.isSelfCollapsing() && this.prevChildMarginInfo.isIgnoreOwnMarginTop()) {
                prevChildCanApplyCollapseAfter = false;
            }
            if (!childIsBlockElement && prevChildCanApplyCollapseAfter) {
                MarginsCollapse ownCollapseAfter = this.prevChildMarginInfo.getOwnCollapseAfter();
                float ownCollapsedMargins = ownCollapseAfter != null ? ownCollapseAfter.getCollapsedMarginsSize() : 0.0f;
                layoutBox.setHeight(layoutBox.getHeight() - ownCollapsedMargins);
            }
        } else if (childIndex > this.firstNotEmptyKidIndex && lastChildMarginAdjoinedToParent(this.renderer)) {
            float bottomIndent = this.collapseInfo.getCollapseAfter().getCollapsedMarginsSize() - this.collapseInfo.getUsedBufferSpaceOnBottom();
            this.collapseInfo.setBufferSpaceOnBottom(this.collapseInfo.getBufferSpaceOnBottom() + this.collapseInfo.getUsedBufferSpaceOnBottom());
            this.collapseInfo.setUsedBufferSpaceOnBottom(0.0f);
            layoutBox.setY(layoutBox.getY() - bottomIndent);
            layoutBox.setHeight(layoutBox.getHeight() + bottomIndent);
        }
        if (!childIsBlockElement) {
            if (childIndex == this.firstNotEmptyKidIndex && firstChildMarginAdjoinedToParent(this.renderer)) {
                float topIndent = this.collapseInfo.getCollapseBefore().getCollapsedMarginsSize();
                applyTopMargin(layoutBox, topIndent);
            }
            if (lastChildMarginAdjoinedToParent(this.renderer)) {
                applyBottomMargin(layoutBox, this.collapseInfo.getCollapseAfter().getCollapsedMarginsSize());
            }
        }
    }

    private void restoreLayoutBoxAfterFailedLayoutAttempt(Rectangle layoutBox) {
        layoutBox.setX(this.backupLayoutBox.getX()).setY(this.backupLayoutBox.getY()).setWidth(this.backupLayoutBox.getWidth()).setHeight(this.backupLayoutBox.getHeight());
        this.backupCollapseInfo.copyTo(this.collapseInfo);
        this.backupLayoutBox = null;
        this.backupCollapseInfo = null;
    }

    private void applyTopMargin(Rectangle box, float topIndent) {
        float bufferLeftoversOnTop = this.collapseInfo.getBufferSpaceOnTop() - topIndent;
        float usedTopBuffer = bufferLeftoversOnTop > 0.0f ? topIndent : this.collapseInfo.getBufferSpaceOnTop();
        this.collapseInfo.setUsedBufferSpaceOnTop(usedTopBuffer);
        subtractUsedTopBufferFromBottomBuffer(usedTopBuffer);
        int i = (bufferLeftoversOnTop > 0.0f ? 1 : (bufferLeftoversOnTop == 0.0f ? 0 : -1));
        MarginsCollapseInfo marginsCollapseInfo = this.collapseInfo;
        if (i >= 0) {
            marginsCollapseInfo.setBufferSpaceOnTop(bufferLeftoversOnTop);
            box.moveDown(topIndent);
            return;
        }
        box.moveDown(marginsCollapseInfo.getBufferSpaceOnTop());
        this.collapseInfo.setBufferSpaceOnTop(0.0f);
        box.setHeight(box.getHeight() + bufferLeftoversOnTop);
    }

    private void applyBottomMargin(Rectangle box, float bottomIndent) {
        float bottomIndentLeftovers = bottomIndent - this.collapseInfo.getBufferSpaceOnBottom();
        int i = (bottomIndentLeftovers > 0.0f ? 1 : (bottomIndentLeftovers == 0.0f ? 0 : -1));
        MarginsCollapseInfo marginsCollapseInfo = this.collapseInfo;
        if (i < 0) {
            marginsCollapseInfo.setUsedBufferSpaceOnBottom(bottomIndent);
            this.collapseInfo.setBufferSpaceOnBottom(-bottomIndentLeftovers);
            return;
        }
        marginsCollapseInfo.setUsedBufferSpaceOnBottom(this.collapseInfo.getBufferSpaceOnBottom());
        this.collapseInfo.setBufferSpaceOnBottom(0.0f);
        box.setY(box.getY() + bottomIndentLeftovers);
        box.setHeight(box.getHeight() - bottomIndentLeftovers);
    }

    private void processUsedChildBufferSpaceOnTop(Rectangle layoutBox) {
        float childUsedBufferSpaceOnTop = this.childMarginInfo.getUsedBufferSpaceOnTop();
        if (childUsedBufferSpaceOnTop > 0.0f) {
            if (childUsedBufferSpaceOnTop > this.collapseInfo.getBufferSpaceOnTop()) {
                childUsedBufferSpaceOnTop = this.collapseInfo.getBufferSpaceOnTop();
            }
            this.collapseInfo.setBufferSpaceOnTop(this.collapseInfo.getBufferSpaceOnTop() - childUsedBufferSpaceOnTop);
            this.collapseInfo.setUsedBufferSpaceOnTop(childUsedBufferSpaceOnTop);
            layoutBox.moveDown(childUsedBufferSpaceOnTop);
            subtractUsedTopBufferFromBottomBuffer(childUsedBufferSpaceOnTop);
        }
    }

    private void subtractUsedTopBufferFromBottomBuffer(float usedTopBuffer) {
        int i = (this.collapseInfo.getBufferSpaceOnTop() > this.collapseInfo.getBufferSpaceOnBottom() ? 1 : (this.collapseInfo.getBufferSpaceOnTop() == this.collapseInfo.getBufferSpaceOnBottom() ? 0 : -1));
        MarginsCollapseInfo marginsCollapseInfo = this.collapseInfo;
        if (i > 0) {
            float bufferLeftoversOnTop = marginsCollapseInfo.getBufferSpaceOnTop() - usedTopBuffer;
            if (bufferLeftoversOnTop < this.collapseInfo.getBufferSpaceOnBottom()) {
                this.collapseInfo.setBufferSpaceOnBottom(bufferLeftoversOnTop);
                return;
            }
            return;
        }
        marginsCollapseInfo.setBufferSpaceOnBottom(this.collapseInfo.getBufferSpaceOnBottom() - usedTopBuffer);
    }

    private void fixPrevChildOccupiedArea(int childIndex) {
        IRenderer prevRenderer = getRendererChild(childIndex - 1);
        Rectangle bBox = prevRenderer.getOccupiedArea().getBBox();
        boolean prevChildCanApplyCollapseAfter = false;
        boolean prevChildHasAppliedCollapseAfter = (this.prevChildMarginInfo.isIgnoreOwnMarginBottom() || (this.prevChildMarginInfo.isSelfCollapsing() && this.prevChildMarginInfo.isIgnoreOwnMarginTop())) ? false : true;
        if (prevChildHasAppliedCollapseAfter) {
            float bottomMargin = this.prevChildMarginInfo.getCollapseAfter().getCollapsedMarginsSize();
            bBox.setHeight(bBox.getHeight() - bottomMargin);
            bBox.moveUp(bottomMargin);
            ignoreModelBottomMargin(prevRenderer);
        }
        boolean isNotBlockChild = !isBlockElement(getRendererChild(childIndex));
        if (!this.prevChildMarginInfo.isSelfCollapsing() || !this.prevChildMarginInfo.isIgnoreOwnMarginTop()) {
            prevChildCanApplyCollapseAfter = true;
        }
        if (isNotBlockChild && prevChildCanApplyCollapseAfter) {
            float ownCollapsedMargins = this.prevChildMarginInfo.getOwnCollapseAfter().getCollapsedMarginsSize();
            bBox.setHeight(bBox.getHeight() + ownCollapsedMargins);
            bBox.moveDown(ownCollapsedMargins);
            overrideModelBottomMargin(prevRenderer, ownCollapsedMargins);
        }
    }

    private void addNotYetAppliedTopMargin(Rectangle layoutBox) {
        float indentTop = this.collapseInfo.getCollapseBefore().getCollapsedMarginsSize();
        this.renderer.getOccupiedArea().getBBox().moveDown(indentTop);
        applyTopMargin(layoutBox, indentTop);
    }

    private void applySelfCollapsedKidMarginWithClearance(Rectangle layoutBox) {
        float clearedKidMarginWithClearance = this.prevChildMarginInfo.getOwnCollapseAfter().getCollapsedMarginsSize();
        this.renderer.getOccupiedArea().getBBox().increaseHeight(clearedKidMarginWithClearance).moveDown(clearedKidMarginWithClearance);
        layoutBox.decreaseHeight(clearedKidMarginWithClearance);
    }

    private IRenderer getRendererChild(int index) {
        return this.rendererChildren.get(index);
    }

    private IRenderer removeRendererChild(int index) {
        return this.rendererChildren.remove(index);
    }

    private void getRidOfCollapseArtifactsAtopOccupiedArea() {
        Rectangle bBox = this.renderer.getOccupiedArea().getBBox();
        bBox.decreaseHeight(this.collapseInfo.getCollapseBefore().getCollapsedMarginsSize());
    }

    private static boolean marginsCouldBeSelfCollapsing(IRenderer renderer) {
        return ((renderer instanceof TableRenderer) || rendererIsFloated(renderer) || hasBottomBorders(renderer) || hasTopBorders(renderer) || hasBottomPadding(renderer) || hasTopPadding(renderer) || hasPositiveHeight(renderer) || (isBlockElement(renderer) && (renderer instanceof AbstractRenderer) && (((AbstractRenderer) renderer).getParent() instanceof LineRenderer))) ? false : true;
    }

    private static boolean firstChildMarginAdjoinedToParent(IRenderer parent) {
        return (BlockFormattingContextUtil.isRendererCreateBfc(parent) || (parent instanceof TableRenderer) || hasTopBorders(parent) || hasTopPadding(parent)) ? false : true;
    }

    private static boolean lastChildMarginAdjoinedToParent(IRenderer parent) {
        return (BlockFormattingContextUtil.isRendererCreateBfc(parent) || (parent instanceof TableRenderer) || hasBottomBorders(parent) || hasBottomPadding(parent) || hasHeightProp(parent)) ? false : true;
    }

    private static boolean isBlockElement(IRenderer renderer) {
        return (renderer instanceof BlockRenderer) || (renderer instanceof TableRenderer);
    }

    private static boolean hasHeightProp(IRenderer renderer) {
        return renderer.getModelElement().hasProperty(27);
    }

    private static boolean hasPositiveHeight(IRenderer renderer) {
        float f;
        float height = renderer.getOccupiedArea().getBBox().getHeight();
        if (height == 0.0f) {
            UnitValue heightPropVal = (UnitValue) renderer.getProperty(27);
            UnitValue minHeightPropVal = (UnitValue) renderer.getProperty(85);
            if (minHeightPropVal != null) {
                f = minHeightPropVal.getValue();
            } else if (heightPropVal == null) {
                f = 0.0f;
            } else {
                f = heightPropVal.getValue();
            }
            height = f;
        }
        return height > 0.0f;
    }

    private static boolean hasTopPadding(IRenderer renderer) {
        return hasPadding(renderer, 50);
    }

    private static boolean hasBottomPadding(IRenderer renderer) {
        return hasPadding(renderer, 47);
    }

    private static boolean hasTopBorders(IRenderer renderer) {
        return hasBorders(renderer, 13);
    }

    private static boolean hasBottomBorders(IRenderer renderer) {
        return hasBorders(renderer, 10);
    }

    private static boolean rendererIsFloated(IRenderer renderer) {
        FloatPropertyValue floatPropertyValue;
        return (renderer == null || (floatPropertyValue = (FloatPropertyValue) renderer.getProperty(99)) == null || floatPropertyValue.equals(FloatPropertyValue.NONE)) ? false : true;
    }

    private static float defineTopMarginValueForCollapse(IRenderer renderer) {
        return defineMarginValueForCollapse(renderer, 46);
    }

    private static void ignoreModelTopMargin(IRenderer renderer) {
        overrideModelTopMargin(renderer, 0.0f);
    }

    private static void overrideModelTopMargin(IRenderer renderer, float collapsedMargins) {
        overrideModelMargin(renderer, 46, collapsedMargins);
    }

    private static float defineBottomMarginValueForCollapse(IRenderer renderer) {
        return defineMarginValueForCollapse(renderer, 43);
    }

    private static void ignoreModelBottomMargin(IRenderer renderer) {
        overrideModelBottomMargin(renderer, 0.0f);
    }

    private static void overrideModelBottomMargin(IRenderer renderer, float collapsedMargins) {
        overrideModelMargin(renderer, 43, collapsedMargins);
    }

    private static float defineMarginValueForCollapse(IRenderer renderer, int property) {
        UnitValue marginUV = (UnitValue) renderer.getModelElement().getProperty(property);
        if (marginUV != null && !marginUV.isPointValue()) {
            Logger logger = LoggerFactory.getLogger(MarginsCollapseHandler.class);
            logger.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, Integer.valueOf(property)));
        }
        if (marginUV == null || (renderer instanceof CellRenderer)) {
            return 0.0f;
        }
        return marginUV.getValue();
    }

    private static void overrideModelMargin(IRenderer renderer, int property, float collapsedMargins) {
        renderer.setProperty(property, UnitValue.createPointValue(collapsedMargins));
    }

    private static boolean hasPadding(IRenderer renderer, int property) {
        UnitValue padding = (UnitValue) renderer.getModelElement().getProperty(property);
        if (padding != null && !padding.isPointValue()) {
            Logger logger = LoggerFactory.getLogger(MarginsCollapseHandler.class);
            logger.error(MessageFormatUtil.format(IoLogMessageConstant.PROPERTY_IN_PERCENTS_NOT_SUPPORTED, Integer.valueOf(property)));
        }
        return padding != null && padding.getValue() > 0.0f;
    }

    private static boolean hasBorders(IRenderer renderer, int property) {
        IPropertyContainer modelElement = renderer.getModelElement();
        return modelElement.hasProperty(property) || modelElement.hasProperty(9);
    }
}
