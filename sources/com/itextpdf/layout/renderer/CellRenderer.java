package com.itextpdf.layout.renderer;

import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.geom.AffineTransform;
import com.itextpdf.kernel.geom.Matrix;
import com.itextpdf.kernel.geom.NoninvertibleTransformException;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.layout.IPropertyContainer;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.properties.BorderCollapsePropertyValue;
import com.itextpdf.layout.properties.Property;
import com.itextpdf.layout.properties.UnitValue;
/* loaded from: classes12.dex */
public class CellRenderer extends BlockRenderer {
    static final /* synthetic */ boolean $assertionsDisabled = false;

    public CellRenderer(Cell modelElement) {
        super(modelElement);
        if (modelElement == null) {
            throw new AssertionError();
        }
        setProperty(60, Integer.valueOf(modelElement.getRowspan()));
        setProperty(16, Integer.valueOf(modelElement.getColspan()));
    }

    @Override // com.itextpdf.layout.renderer.AbstractRenderer, com.itextpdf.layout.renderer.IRenderer
    public IPropertyContainer getModelElement() {
        return super.getModelElement();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public Float retrieveWidth(float parentBoxWidth) {
        return null;
    }

    @Override // com.itextpdf.layout.renderer.BlockRenderer
    protected AbstractRenderer createSplitRenderer(int layoutResult) {
        CellRenderer splitRenderer = (CellRenderer) getNextRenderer();
        splitRenderer.parent = this.parent;
        splitRenderer.modelElement = this.modelElement;
        splitRenderer.occupiedArea = this.occupiedArea;
        splitRenderer.isLastRendererForModelElement = false;
        splitRenderer.addAllProperties(getOwnProperties());
        return splitRenderer;
    }

    @Override // com.itextpdf.layout.renderer.BlockRenderer
    protected AbstractRenderer createOverflowRenderer(int layoutResult) {
        CellRenderer overflowRenderer = (CellRenderer) getNextRenderer();
        overflowRenderer.parent = this.parent;
        overflowRenderer.modelElement = this.modelElement;
        overflowRenderer.addAllProperties(getOwnProperties());
        return overflowRenderer;
    }

    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public void drawBackground(DrawContext drawContext) {
        CellRenderer cellRenderer;
        PdfCanvas canvas = drawContext.getCanvas();
        Matrix ctm = canvas.getGraphicsState().getCtm();
        Float angle = getPropertyAsFloat(55);
        boolean avoidRotation = angle != null && hasProperty(6);
        boolean restoreRotation = hasOwnProperty(55);
        if (!avoidRotation) {
            cellRenderer = this;
        } else {
            try {
                AffineTransform transform = new AffineTransform(ctm.get(0), ctm.get(1), ctm.get(3), ctm.get(4), ctm.get(6), ctm.get(7)).createInverse();
                transform.concatenate(new AffineTransform());
                canvas.concatMatrix(transform);
                cellRenderer = this;
                cellRenderer.setProperty(55, null);
            } catch (NoninvertibleTransformException e) {
                throw new PdfException("A noninvertible matrix has been parsed. The behaviour is unpredictable.", (Throwable) e);
            }
        }
        super.drawBackground(drawContext);
        if (avoidRotation) {
            if (restoreRotation) {
                cellRenderer.setProperty(55, angle);
            } else {
                cellRenderer.deleteOwnProperty(55);
            }
            canvas.concatMatrix(new AffineTransform(ctm.get(0), ctm.get(1), ctm.get(3), ctm.get(4), ctm.get(6), ctm.get(7)));
        }
    }

    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public void drawBorder(DrawContext drawContext) {
        if (BorderCollapsePropertyValue.SEPARATE.equals(this.parent.getProperty(Property.BORDER_COLLAPSE))) {
            super.drawBorder(drawContext);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public Rectangle applyBorderBox(Rectangle rect, Border[] borders, boolean reverse) {
        if (BorderCollapsePropertyValue.SEPARATE.equals(this.parent.getProperty(Property.BORDER_COLLAPSE))) {
            super.applyBorderBox(rect, borders, reverse);
        }
        return rect;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.layout.renderer.AbstractRenderer
    public Rectangle applyMargins(Rectangle rect, UnitValue[] margins, boolean reverse) {
        if (BorderCollapsePropertyValue.SEPARATE.equals(this.parent.getProperty(Property.BORDER_COLLAPSE))) {
            applySpacings(rect, reverse);
        }
        return rect;
    }

    protected Rectangle applySpacings(Rectangle rect, boolean reverse) {
        if (BorderCollapsePropertyValue.SEPARATE.equals(this.parent.getProperty(Property.BORDER_COLLAPSE))) {
            Float verticalBorderSpacing = (Float) this.parent.getProperty(Property.VERTICAL_BORDER_SPACING);
            Float horizontalBorderSpacing = (Float) this.parent.getProperty(Property.HORIZONTAL_BORDER_SPACING);
            float[] cellSpacings = new float[4];
            for (int i = 0; i < cellSpacings.length; i++) {
                float f = 0.0f;
                if (i % 2 == 0) {
                    if (verticalBorderSpacing != null) {
                        f = verticalBorderSpacing.floatValue();
                    }
                } else if (horizontalBorderSpacing != null) {
                    f = horizontalBorderSpacing.floatValue();
                }
                cellSpacings[i] = f;
            }
            applySpacings(rect, cellSpacings, reverse);
        }
        return rect;
    }

    protected Rectangle applySpacings(Rectangle rect, float[] spacings, boolean reverse) {
        if (!BorderCollapsePropertyValue.SEPARATE.equals(this.parent.getProperty(Property.BORDER_COLLAPSE))) {
            return rect;
        }
        rect.applyMargins(spacings[0] / 2.0f, spacings[1] / 2.0f, spacings[2] / 2.0f, spacings[3] / 2.0f, reverse);
        return rect;
    }

    @Override // com.itextpdf.layout.renderer.IRenderer
    public IRenderer getNextRenderer() {
        logWarningIfGetNextRendererNotOverridden(CellRenderer.class, getClass());
        return new CellRenderer((Cell) getModelElement());
    }
}
