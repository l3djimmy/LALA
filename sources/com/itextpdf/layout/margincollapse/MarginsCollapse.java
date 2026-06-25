package com.itextpdf.layout.margincollapse;
/* loaded from: classes12.dex */
class MarginsCollapse implements Cloneable {
    private float maxPositiveMargin = 0.0f;
    private float minNegativeMargin = 0.0f;

    /* JADX INFO: Access modifiers changed from: package-private */
    public void joinMargin(float margin) {
        if (this.maxPositiveMargin < margin) {
            this.maxPositiveMargin = margin;
        } else if (this.minNegativeMargin > margin) {
            this.minNegativeMargin = margin;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void joinMargin(MarginsCollapse marginsCollapse) {
        joinMargin(marginsCollapse.maxPositiveMargin);
        joinMargin(marginsCollapse.minNegativeMargin);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public float getCollapsedMarginsSize() {
        return this.maxPositiveMargin + this.minNegativeMargin;
    }

    /* renamed from: clone */
    public MarginsCollapse m7333clone() {
        try {
            return (MarginsCollapse) super.clone();
        } catch (CloneNotSupportedException e) {
            return null;
        }
    }
}
