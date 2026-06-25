package com.itextpdf.layout.borders;

import com.itextpdf.kernel.colors.Color;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.layout.borders.Border;
/* loaded from: classes12.dex */
public class DoubleBorder extends Border {
    public DoubleBorder(float width) {
        super(width);
    }

    public DoubleBorder(Color color, float width) {
        super(color, width);
    }

    public DoubleBorder(Color color, float width, float opacity) {
        super(color, width, opacity);
    }

    @Override // com.itextpdf.layout.borders.Border
    public int getType() {
        return 3;
    }

    @Override // com.itextpdf.layout.borders.Border
    public void draw(PdfCanvas canvas, float x1, float y1, float x2, float y2, Border.Side defaultSide, float borderWidthBefore, float borderWidthAfter) {
        float x3 = 0.0f;
        float y3 = 0.0f;
        float x4 = 0.0f;
        float y4 = 0.0f;
        float thirdOfWidth = this.width / 3.0f;
        float thirdOfWidthBefore = borderWidthBefore / 3.0f;
        float thirdOfWidthAfter = borderWidthAfter / 3.0f;
        float x12 = x1;
        float y12 = y1;
        float x22 = x2;
        float y22 = y2;
        Border.Side borderSide = getBorderSide(x12, y12, x22, y22, defaultSide);
        switch (borderSide) {
            case TOP:
                x3 = x22 + thirdOfWidthAfter;
                y3 = y22 + thirdOfWidth;
                x4 = x12 - thirdOfWidthBefore;
                y4 = y12 + thirdOfWidth;
                break;
            case RIGHT:
                x3 = x22 + thirdOfWidth;
                y3 = y22 - thirdOfWidthAfter;
                x4 = x12 + thirdOfWidth;
                y4 = y12 + thirdOfWidthBefore;
                break;
            case BOTTOM:
                x3 = x22 - thirdOfWidthAfter;
                y3 = y22 - thirdOfWidth;
                x4 = x12 + thirdOfWidthBefore;
                y4 = y12 - thirdOfWidth;
                break;
            case LEFT:
                x3 = x22 - thirdOfWidth;
                y3 = y22 + thirdOfWidthAfter;
                x4 = x12 - thirdOfWidth;
                y4 = y12 - thirdOfWidthBefore;
                break;
        }
        canvas.saveState().setFillColor(this.transparentColor.getColor());
        this.transparentColor.applyFillTransparency(canvas);
        canvas.moveTo(x12, y12).lineTo(x22, y22).lineTo(x3, y3).lineTo(x4, y4).lineTo(x12, y12).fill();
        switch (borderSide) {
            case TOP:
                x22 += thirdOfWidthAfter * 2.0f;
                y22 += thirdOfWidth * 2.0f;
                x3 += thirdOfWidthAfter * 2.0f;
                y3 += thirdOfWidth * 2.0f;
                x4 -= thirdOfWidthBefore * 2.0f;
                y4 += thirdOfWidth * 2.0f;
                x12 -= thirdOfWidthBefore * 2.0f;
                y12 += thirdOfWidth * 2.0f;
                break;
            case RIGHT:
                x22 += thirdOfWidth * 2.0f;
                y22 -= thirdOfWidthAfter * 2.0f;
                x3 += thirdOfWidth * 2.0f;
                y3 -= thirdOfWidthAfter * 2.0f;
                x4 += thirdOfWidth * 2.0f;
                y4 += thirdOfWidthBefore * 2.0f;
                x12 += thirdOfWidth * 2.0f;
                y12 += 2.0f * thirdOfWidthBefore;
                break;
            case BOTTOM:
                x22 -= thirdOfWidthAfter * 2.0f;
                y22 -= thirdOfWidth * 2.0f;
                x3 -= thirdOfWidthAfter * 2.0f;
                y3 -= thirdOfWidth * 2.0f;
                x4 += thirdOfWidthBefore * 2.0f;
                y4 -= thirdOfWidth * 2.0f;
                x12 += thirdOfWidthBefore * 2.0f;
                y12 -= thirdOfWidth * 2.0f;
                break;
            case LEFT:
                x22 -= thirdOfWidth * 2.0f;
                y22 += thirdOfWidthAfter * 2.0f;
                x3 -= thirdOfWidth * 2.0f;
                y3 += thirdOfWidthAfter * 2.0f;
                x4 -= thirdOfWidth * 2.0f;
                y4 -= thirdOfWidthBefore * 2.0f;
                x12 -= thirdOfWidth * 2.0f;
                y12 -= 2.0f * thirdOfWidthBefore;
                break;
        }
        canvas.moveTo(x12, y12).lineTo(x22, y22).lineTo(x3, y3).lineTo(x4, y4).lineTo(x12, y12).fill().restoreState();
    }

    @Override // com.itextpdf.layout.borders.Border
    public void drawCellBorder(PdfCanvas canvas, float x1, float y1, float x2, float y2, Border.Side defaultSide) {
        float x12;
        float x22;
        float y12;
        float thirdOfWidth = this.width / 3.0f;
        float x13 = x1;
        Border.Side borderSide = getBorderSide(x13, y1, x2, y2, defaultSide);
        switch (borderSide) {
            case TOP:
                x12 = y1 - thirdOfWidth;
                y12 = x12;
                x22 = x2;
                break;
            case RIGHT:
                x22 = x2 - thirdOfWidth;
                x13 -= thirdOfWidth;
                x12 = y1 + thirdOfWidth;
                y12 = y2 - thirdOfWidth;
                break;
            case BOTTOM:
            default:
                x12 = y1;
                x22 = x2;
                y12 = y2;
                break;
        }
        canvas.saveState().setLineWidth(thirdOfWidth).setStrokeColor(this.transparentColor.getColor());
        this.transparentColor.applyStrokeTransparency(canvas);
        canvas.moveTo(x13, x12).lineTo(x22, y12).stroke().restoreState();
        switch (borderSide) {
            case TOP:
                y12 += thirdOfWidth * 2.0f;
                x12 += 2.0f * thirdOfWidth;
                break;
            case RIGHT:
                x22 += thirdOfWidth * 2.0f;
                x13 += 2.0f * thirdOfWidth;
                break;
            case BOTTOM:
                x22 -= thirdOfWidth * 2.0f;
                y12 -= thirdOfWidth * 2.0f;
                x13 += thirdOfWidth * 2.0f;
                x12 -= 2.0f * thirdOfWidth;
                break;
            case LEFT:
                y12 += thirdOfWidth * 2.0f;
                x13 -= thirdOfWidth * 2.0f;
                x12 -= 2.0f * thirdOfWidth;
                break;
        }
        canvas.saveState().setLineWidth(thirdOfWidth).setStrokeColor(this.transparentColor.getColor());
        this.transparentColor.applyStrokeTransparency(canvas);
        canvas.moveTo(x13, x12).lineTo(x22, y12).stroke().restoreState();
    }
}
