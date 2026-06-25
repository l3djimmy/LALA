package com.itextpdf.layout.renderer;

import com.itextpdf.layout.minmaxwidth.MinMaxWidth;
/* loaded from: classes12.dex */
class SumSumWidthHandler extends AbstractWidthHandler {
    public SumSumWidthHandler(MinMaxWidth minMaxWidth) {
        super(minMaxWidth);
    }

    @Override // com.itextpdf.layout.renderer.AbstractWidthHandler
    public void updateMinChildWidth(float childMinWidth) {
        this.minMaxWidth.setChildrenMinWidth(this.minMaxWidth.getChildrenMinWidth() + childMinWidth);
    }

    @Override // com.itextpdf.layout.renderer.AbstractWidthHandler
    public void updateMaxChildWidth(float childMaxWidth) {
        this.minMaxWidth.setChildrenMaxWidth(this.minMaxWidth.getChildrenMaxWidth() + childMaxWidth);
    }
}
