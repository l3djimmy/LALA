package com.itextpdf.layout.renderer;

import com.itextpdf.kernel.geom.Rectangle;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public class FlexItemInfo {
    private Rectangle rectangle;
    private AbstractRenderer renderer;

    public FlexItemInfo(AbstractRenderer renderer, Rectangle rectangle) {
        this.renderer = renderer;
        this.rectangle = rectangle;
    }

    public AbstractRenderer getRenderer() {
        return this.renderer;
    }

    public Rectangle getRectangle() {
        return this.rectangle;
    }
}
