package com.itextpdf.layout.element;

import com.itextpdf.layout.renderer.IRenderer;
import com.itextpdf.layout.renderer.TabRenderer;
/* loaded from: classes12.dex */
public class Tab extends AbstractElement<Tab> implements ILeafElement {
    @Override // com.itextpdf.layout.element.AbstractElement
    protected IRenderer makeNewRenderer() {
        return new TabRenderer(this);
    }
}
