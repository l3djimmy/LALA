package com.itextpdf.layout.renderer;

import com.itextpdf.layout.minmaxwidth.MinMaxWidth;
/* loaded from: classes12.dex */
public class MaxMaxWidthHandler extends AbstractWidthHandler {
    public MaxMaxWidthHandler(MinMaxWidth minMaxWidth) {
        super(minMaxWidth);
    }

    @Override // com.itextpdf.layout.renderer.AbstractWidthHandler
    public void updateMinChildWidth(float childMinWidth) {
        this.minMaxWidth.setChildrenMinWidth(Math.max(this.minMaxWidth.getChildrenMinWidth(), childMinWidth));
    }

    @Override // com.itextpdf.layout.renderer.AbstractWidthHandler
    public void updateMaxChildWidth(float childMaxWidth) {
        this.minMaxWidth.setChildrenMaxWidth(Math.max(this.minMaxWidth.getChildrenMaxWidth(), childMaxWidth));
    }
}
