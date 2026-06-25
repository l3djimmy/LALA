package com.itextpdf.layout.borders;

import com.itextpdf.kernel.colors.Color;
import com.itextpdf.kernel.colors.ColorConstants;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.layout.borders.Border;
/* loaded from: classes12.dex */
public class FixedDashedBorder extends Border {
    public static final float DEFAULT_UNITS_VALUE = 3.0f;
    private final float phase;
    private final float unitsOff;
    private final float unitsOn;

    public FixedDashedBorder(float width) {
        this(ColorConstants.BLACK, width);
    }

    public FixedDashedBorder(Color color, float width) {
        this(color, width, 1.0f);
    }

    public FixedDashedBorder(Color color, float width, float opacity) {
        this(color, width, opacity, 3.0f, 3.0f, 0.0f);
    }

    public FixedDashedBorder(Color color, float width, float unitsOn, float unitsOff, float phase) {
        this(color, width, 1.0f, unitsOn, unitsOff, phase);
    }

    public FixedDashedBorder(Color color, float width, float opacity, float unitsOn, float unitsOff, float phase) {
        super(color, width, opacity);
        this.unitsOn = unitsOn;
        this.unitsOff = unitsOff;
        this.phase = phase;
    }

    @Override // com.itextpdf.layout.borders.Border
    public void draw(PdfCanvas canvas, float x1, float y1, float x2, float y2, Border.Side defaultSide, float borderWidthBefore, float borderWidthAfter) {
        float[] startingPoints = getStartingPointsForBorderSide(x1, y1, x2, y2, defaultSide);
        float x12 = startingPoints[0];
        float y12 = startingPoints[1];
        float x22 = startingPoints[2];
        float y22 = startingPoints[3];
        canvas.saveState().setLineWidth(this.width).setStrokeColor(this.transparentColor.getColor());
        this.transparentColor.applyStrokeTransparency(canvas);
        canvas.setLineDash(this.unitsOn, this.unitsOff, this.phase).moveTo(x12, y12).lineTo(x22, y22).stroke().restoreState();
    }

    @Override // com.itextpdf.layout.borders.Border
    public void draw(PdfCanvas canvas, float x1, float y1, float x2, float y2, float horizontalRadius1, float verticalRadius1, float horizontalRadius2, float verticalRadius2, Border.Side defaultSide, float borderWidthBefore, float borderWidthAfter) {
        canvas.saveState().setLineWidth(this.width).setStrokeColor(this.transparentColor.getColor());
        this.transparentColor.applyStrokeTransparency(canvas);
        canvas.setLineDash(this.unitsOn, this.unitsOff, this.phase);
        Rectangle boundingRectangle = new Rectangle(x1, y1, x2 - x1, y2 - y1);
        float[] horizontalRadii = {horizontalRadius1, horizontalRadius2};
        float[] verticalRadii = {verticalRadius1, verticalRadius2};
        drawDiscontinuousBorders(canvas, boundingRectangle, horizontalRadii, verticalRadii, defaultSide, borderWidthBefore, borderWidthAfter);
    }

    @Override // com.itextpdf.layout.borders.Border
    public void drawCellBorder(PdfCanvas canvas, float x1, float y1, float x2, float y2, Border.Side defaultSide) {
        canvas.saveState().setStrokeColor(this.transparentColor.getColor());
        this.transparentColor.applyStrokeTransparency(canvas);
        canvas.setLineDash(this.unitsOn, this.unitsOff, this.phase).setLineWidth(this.width).moveTo(x1, y1).lineTo(x2, y2).stroke().restoreState();
    }

    @Override // com.itextpdf.layout.borders.Border
    public int getType() {
        return 9;
    }
}
