package com.itextpdf.layout.margincollapse;
/* loaded from: classes12.dex */
public class MarginsCollapseInfo {
    private float bufferSpaceOnBottom;
    private float bufferSpaceOnTop;
    private boolean clearanceApplied;
    private MarginsCollapse collapseAfter;
    private MarginsCollapse collapseBefore;
    private boolean ignoreOwnMarginBottom;
    private boolean ignoreOwnMarginTop;
    private boolean isSelfCollapsing;
    private MarginsCollapse ownCollapseAfter;
    private float usedBufferSpaceOnBottom;
    private float usedBufferSpaceOnTop;

    /* JADX INFO: Access modifiers changed from: package-private */
    public MarginsCollapseInfo() {
        this.ignoreOwnMarginTop = false;
        this.ignoreOwnMarginBottom = false;
        this.collapseBefore = new MarginsCollapse();
        this.collapseAfter = new MarginsCollapse();
        this.isSelfCollapsing = true;
        this.bufferSpaceOnTop = 0.0f;
        this.bufferSpaceOnBottom = 0.0f;
        this.usedBufferSpaceOnTop = 0.0f;
        this.usedBufferSpaceOnBottom = 0.0f;
        this.clearanceApplied = false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public MarginsCollapseInfo(boolean ignoreOwnMarginTop, boolean ignoreOwnMarginBottom, MarginsCollapse collapseBefore, MarginsCollapse collapseAfter) {
        this.ignoreOwnMarginTop = ignoreOwnMarginTop;
        this.ignoreOwnMarginBottom = ignoreOwnMarginBottom;
        this.collapseBefore = collapseBefore;
        this.collapseAfter = collapseAfter;
        this.isSelfCollapsing = true;
        this.bufferSpaceOnTop = 0.0f;
        this.bufferSpaceOnBottom = 0.0f;
        this.usedBufferSpaceOnTop = 0.0f;
        this.usedBufferSpaceOnBottom = 0.0f;
        this.clearanceApplied = false;
    }

    public void copyTo(MarginsCollapseInfo destInfo) {
        destInfo.ignoreOwnMarginTop = this.ignoreOwnMarginTop;
        destInfo.ignoreOwnMarginBottom = this.ignoreOwnMarginBottom;
        destInfo.collapseBefore = this.collapseBefore;
        destInfo.collapseAfter = this.collapseAfter;
        destInfo.setOwnCollapseAfter(this.ownCollapseAfter);
        destInfo.setSelfCollapsing(this.isSelfCollapsing);
        destInfo.setBufferSpaceOnTop(this.bufferSpaceOnTop);
        destInfo.setBufferSpaceOnBottom(this.bufferSpaceOnBottom);
        destInfo.setUsedBufferSpaceOnTop(this.usedBufferSpaceOnTop);
        destInfo.setUsedBufferSpaceOnBottom(this.usedBufferSpaceOnBottom);
        destInfo.setClearanceApplied(this.clearanceApplied);
    }

    public static MarginsCollapseInfo createDeepCopy(MarginsCollapseInfo instance) {
        MarginsCollapseInfo copy = new MarginsCollapseInfo();
        instance.copyTo(copy);
        copy.collapseBefore = instance.collapseBefore.m7333clone();
        copy.collapseAfter = instance.collapseAfter.m7333clone();
        if (instance.ownCollapseAfter != null) {
            copy.setOwnCollapseAfter(instance.ownCollapseAfter.m7333clone());
        }
        return copy;
    }

    public static void updateFromCopy(MarginsCollapseInfo originalInstance, MarginsCollapseInfo processedCopy) {
        originalInstance.ignoreOwnMarginTop = processedCopy.ignoreOwnMarginTop;
        originalInstance.ignoreOwnMarginBottom = processedCopy.ignoreOwnMarginBottom;
        originalInstance.collapseBefore.joinMargin(processedCopy.collapseBefore);
        originalInstance.collapseAfter.joinMargin(processedCopy.collapseAfter);
        if (processedCopy.getOwnCollapseAfter() != null) {
            if (originalInstance.getOwnCollapseAfter() == null) {
                originalInstance.setOwnCollapseAfter(new MarginsCollapse());
            }
            originalInstance.getOwnCollapseAfter().joinMargin(processedCopy.getOwnCollapseAfter());
        }
        originalInstance.setSelfCollapsing(processedCopy.isSelfCollapsing);
        originalInstance.setBufferSpaceOnTop(processedCopy.bufferSpaceOnTop);
        originalInstance.setBufferSpaceOnBottom(processedCopy.bufferSpaceOnBottom);
        originalInstance.setUsedBufferSpaceOnTop(processedCopy.usedBufferSpaceOnTop);
        originalInstance.setUsedBufferSpaceOnBottom(processedCopy.usedBufferSpaceOnBottom);
        originalInstance.setClearanceApplied(processedCopy.clearanceApplied);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public MarginsCollapse getCollapseBefore() {
        return this.collapseBefore;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public MarginsCollapse getCollapseAfter() {
        return this.collapseAfter;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setCollapseAfter(MarginsCollapse collapseAfter) {
        this.collapseAfter = collapseAfter;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public MarginsCollapse getOwnCollapseAfter() {
        return this.ownCollapseAfter;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setOwnCollapseAfter(MarginsCollapse marginsCollapse) {
        this.ownCollapseAfter = marginsCollapse;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setSelfCollapsing(boolean selfCollapsing) {
        this.isSelfCollapsing = selfCollapsing;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isSelfCollapsing() {
        return this.isSelfCollapsing;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isIgnoreOwnMarginTop() {
        return this.ignoreOwnMarginTop;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isIgnoreOwnMarginBottom() {
        return this.ignoreOwnMarginBottom;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public float getBufferSpaceOnTop() {
        return this.bufferSpaceOnTop;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setBufferSpaceOnTop(float bufferSpaceOnTop) {
        this.bufferSpaceOnTop = bufferSpaceOnTop;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public float getBufferSpaceOnBottom() {
        return this.bufferSpaceOnBottom;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setBufferSpaceOnBottom(float bufferSpaceOnBottom) {
        this.bufferSpaceOnBottom = bufferSpaceOnBottom;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public float getUsedBufferSpaceOnTop() {
        return this.usedBufferSpaceOnTop;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setUsedBufferSpaceOnTop(float usedBufferSpaceOnTop) {
        this.usedBufferSpaceOnTop = usedBufferSpaceOnTop;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public float getUsedBufferSpaceOnBottom() {
        return this.usedBufferSpaceOnBottom;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setUsedBufferSpaceOnBottom(float usedBufferSpaceOnBottom) {
        this.usedBufferSpaceOnBottom = usedBufferSpaceOnBottom;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isClearanceApplied() {
        return this.clearanceApplied;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setClearanceApplied(boolean clearanceApplied) {
        this.clearanceApplied = clearanceApplied;
    }
}
