package com.itextpdf.layout.element;

import com.itextpdf.layout.renderer.IRenderer;
import com.itextpdf.layout.renderer.MulticolRenderer;
/* loaded from: classes12.dex */
public class MulticolContainer extends Div {
    @Override // com.itextpdf.layout.element.Div, com.itextpdf.layout.element.AbstractElement
    protected IRenderer makeNewRenderer() {
        return new MulticolRenderer(this);
    }
}
