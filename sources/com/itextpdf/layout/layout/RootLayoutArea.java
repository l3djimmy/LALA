package com.itextpdf.layout.layout;

import com.itextpdf.kernel.geom.Rectangle;
/* loaded from: classes12.dex */
public class RootLayoutArea extends LayoutArea implements Cloneable {
    protected boolean emptyArea;

    public RootLayoutArea(int pageNumber, Rectangle bBox) {
        super(pageNumber, bBox);
        this.emptyArea = true;
    }

    public boolean isEmptyArea() {
        return this.emptyArea;
    }

    public void setEmptyArea(boolean emptyArea) {
        this.emptyArea = emptyArea;
    }

    @Override // com.itextpdf.layout.layout.LayoutArea
    /* renamed from: clone */
    public LayoutArea mo7332clone() {
        RootLayoutArea area = (RootLayoutArea) super.mo7332clone();
        area.setEmptyArea(this.emptyArea);
        return area;
    }
}
