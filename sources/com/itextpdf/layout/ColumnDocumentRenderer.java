package com.itextpdf.layout;

import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.layout.layout.LayoutArea;
import com.itextpdf.layout.layout.LayoutResult;
import com.itextpdf.layout.layout.RootLayoutArea;
import com.itextpdf.layout.properties.AreaBreakType;
import com.itextpdf.layout.renderer.DocumentRenderer;
import com.itextpdf.layout.renderer.IRenderer;
/* loaded from: classes12.dex */
public class ColumnDocumentRenderer extends DocumentRenderer {
    protected Rectangle[] columns;
    protected int nextAreaNumber;

    public ColumnDocumentRenderer(Document document, Rectangle[] columns) {
        super(document);
        this.columns = columns;
    }

    public ColumnDocumentRenderer(Document document, boolean immediateFlush, Rectangle[] columns) {
        super(document, immediateFlush);
        this.columns = columns;
    }

    public int getNextAreaNumber() {
        return this.nextAreaNumber;
    }

    @Override // com.itextpdf.layout.renderer.DocumentRenderer, com.itextpdf.layout.renderer.IRenderer
    public IRenderer getNextRenderer() {
        return new ColumnDocumentRenderer(this.document, this.immediateFlush, this.columns);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.layout.renderer.DocumentRenderer, com.itextpdf.layout.renderer.RootRenderer
    public LayoutArea updateCurrentArea(LayoutResult overflowResult) {
        if (overflowResult != null && overflowResult.getAreaBreak() != null && overflowResult.getAreaBreak().getType() != AreaBreakType.NEXT_AREA) {
            this.nextAreaNumber = 0;
        }
        if (this.nextAreaNumber % this.columns.length == 0) {
            super.updateCurrentArea(overflowResult);
        }
        int pageNumber = this.currentArea.getPageNumber();
        Rectangle[] rectangleArr = this.columns;
        int i = this.nextAreaNumber;
        this.nextAreaNumber = i + 1;
        RootLayoutArea rootLayoutArea = new RootLayoutArea(pageNumber, rectangleArr[i % this.columns.length].mo7327clone());
        this.currentArea = rootLayoutArea;
        return rootLayoutArea;
    }
}
