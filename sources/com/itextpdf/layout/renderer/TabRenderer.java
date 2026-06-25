package com.itextpdf.layout.renderer;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.canvas.CanvasArtifact;
import com.itextpdf.kernel.pdf.canvas.draw.ILineDrawer;
import com.itextpdf.layout.element.Tab;
import com.itextpdf.layout.layout.LayoutArea;
import com.itextpdf.layout.layout.LayoutContext;
import com.itextpdf.layout.layout.LayoutResult;
import com.itextpdf.layout.properties.UnitValue;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class TabRenderer extends AbstractRenderer {
    public TabRenderer(Tab tab) {
        super(tab);
    }

    @Override // com.itextpdf.layout.renderer.IRenderer
    public LayoutResult layout(LayoutContext layoutContext) {
        LayoutArea area = layoutContext.getArea();
        Float width = retrieveWidth(area.getBBox().getWidth());
        UnitValue height = (UnitValue) getProperty(85);
        this.occupiedArea = new LayoutArea(area.getPageNumber(), new Rectangle(area.getBBox().getX(), area.getBBox().getY() + area.getBBox().getHeight(), width.floatValue(), height.getValue()));
        TargetCounterHandler.addPageByID(this);
        return new LayoutResult(1, this.occupiedArea, null, null);
    }

    @Override // com.itextpdf.layout.renderer.AbstractRenderer, com.itextpdf.layout.renderer.IRenderer
    public void draw(DrawContext drawContext) {
        if (this.occupiedArea == null) {
            Logger logger = LoggerFactory.getLogger(TabRenderer.class);
            logger.error(MessageFormatUtil.format(IoLogMessageConstant.OCCUPIED_AREA_HAS_NOT_BEEN_INITIALIZED, "Drawing won't be performed."));
            return;
        }
        ILineDrawer leader = (ILineDrawer) getProperty(68);
        if (leader == null) {
            return;
        }
        boolean isTagged = drawContext.isTaggingEnabled();
        if (isTagged) {
            drawContext.getCanvas().openTag(new CanvasArtifact());
        }
        beginElementOpacityApplying(drawContext);
        leader.draw(drawContext.getCanvas(), this.occupiedArea.getBBox());
        endElementOpacityApplying(drawContext);
        if (isTagged) {
            drawContext.getCanvas().closeTag();
        }
    }

    @Override // com.itextpdf.layout.renderer.IRenderer
    public IRenderer getNextRenderer() {
        logWarningIfGetNextRendererNotOverridden(TabRenderer.class, getClass());
        return new TabRenderer((Tab) this.modelElement);
    }
}
