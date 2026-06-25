package com.itextpdf.layout.renderer;

import com.itextpdf.layout.element.Div;
/* loaded from: classes12.dex */
public class DivRenderer extends BlockRenderer {
    public DivRenderer(Div modelElement) {
        super(modelElement);
    }

    @Override // com.itextpdf.layout.renderer.IRenderer
    public IRenderer getNextRenderer() {
        logWarningIfGetNextRendererNotOverridden(DivRenderer.class, getClass());
        return new DivRenderer((Div) this.modelElement);
    }
}
