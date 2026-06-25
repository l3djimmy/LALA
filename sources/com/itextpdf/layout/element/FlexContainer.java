package com.itextpdf.layout.element;

import com.itextpdf.layout.renderer.FlexContainerRenderer;
import com.itextpdf.layout.renderer.IRenderer;
/* loaded from: classes12.dex */
class FlexContainer extends Div {
    @Override // com.itextpdf.layout.element.Div, com.itextpdf.layout.element.AbstractElement
    protected IRenderer makeNewRenderer() {
        return new FlexContainerRenderer(this);
    }
}
