package com.itextpdf.layout.borders;

import com.itextpdf.kernel.colors.Color;
import com.itextpdf.kernel.geom.Point;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.layout.borders.Border;
/* loaded from: classes12.dex */
public class SolidBorder extends Border {
    public SolidBorder(float width) {
        super(width);
    }

    public SolidBorder(Color color, float width) {
        super(color, width);
    }

    public SolidBorder(Color color, float width, float opacity) {
        super(color, width, opacity);
    }

    @Override // com.itextpdf.layout.borders.Border
    public int getType() {
        return 0;
    }

    @Override // com.itextpdf.layout.borders.Border
    public void draw(PdfCanvas canvas, float x1, float y1, float x2, float y2, Border.Side defaultSide, float borderWidthBefore, float borderWidthAfter) {
        float x3 = 0.0f;
        float y3 = 0.0f;
        float x4 = 0.0f;
        float y4 = 0.0f;
        Border.Side borderSide = getBorderSide(x1, y1, x2, y2, defaultSide);
        switch (borderSide) {
            case TOP:
                x3 = x2 + borderWidthAfter;
                y3 = y2 + this.width;
                x4 = x1 - borderWidthBefore;
                y4 = y1 + this.width;
                break;
            case RIGHT:
                x3 = x2 + this.width;
                y3 = y2 - borderWidthAfter;
                x4 = x1 + this.width;
                y4 = y1 + borderWidthBefore;
                break;
            case BOTTOM:
                x3 = x2 - borderWidthAfter;
                y3 = y2 - this.width;
                x4 = x1 + borderWidthBefore;
                y4 = y1 - this.width;
                break;
            case LEFT:
                x3 = x2 - this.width;
                y3 = y2 + borderWidthAfter;
                x4 = x1 - this.width;
                y4 = y1 - borderWidthBefore;
                break;
        }
        canvas.saveState().setFillColor(this.transparentColor.getColor());
        this.transparentColor.applyFillTransparency(canvas);
        canvas.moveTo(x1, y1).lineTo(x2, y2).lineTo(x3, y3).lineTo(x4, y4).lineTo(x1, y1).fill().restoreState();
    }

    @Override // com.itextpdf.layout.borders.Border
    public void draw(PdfCanvas canvas, float x1, float y1, float x2, float y2, float horizontalRadius1, float verticalRadius1, float horizontalRadius2, float verticalRadius2, Border.Side defaultSide, float borderWidthBefore, float borderWidthAfter) {
        float x22;
        float x3;
        float y3;
        float innerRadiusSecond;
        float y22;
        float x12;
        float y12;
        float x32;
        float y32;
        float x33;
        float y33;
        float innerRadiusSecond2;
        float x34;
        float y34;
        float innerRadiusSecond3;
        float innerRadiusAfter;
        float x35;
        float y35;
        float f;
        float innerRadiusSecond4;
        float x36 = 0.0f;
        float y36 = 0.0f;
        float x4 = 0.0f;
        float y4 = 0.0f;
        float x13 = x1;
        float y13 = y1;
        Border.Side borderSide = getBorderSide(x13, y13, x2, y2, defaultSide);
        switch (borderSide) {
            case TOP:
                x22 = x2;
                float x37 = x22 + borderWidthAfter;
                float y37 = y2 + this.width;
                float x42 = x13 - borderWidthBefore;
                float y42 = y13 + this.width;
                float innerRadiusBefore = Math.max(0.0f, horizontalRadius1 - borderWidthBefore);
                float innerRadiusFirst = Math.max(0.0f, verticalRadius1 - this.width);
                float innerRadiusSecond5 = Math.max(0.0f, verticalRadius2 - this.width);
                float innerRadiusAfter2 = Math.max(0.0f, horizontalRadius2 - borderWidthAfter);
                if (innerRadiusBefore > innerRadiusFirst) {
                    x3 = x37;
                    y3 = y37;
                    innerRadiusSecond = innerRadiusSecond5;
                    x13 = (float) getIntersectionPoint(new Point(x13, y13), new Point(x42, y42), new Point(x42, y13 - innerRadiusFirst), new Point(x13 + innerRadiusBefore, y13 - innerRadiusFirst)).getX();
                    y13 -= innerRadiusFirst;
                } else {
                    x3 = x37;
                    y3 = y37;
                    innerRadiusSecond = innerRadiusSecond5;
                    if (0.0f != innerRadiusBefore && 0.0f != innerRadiusFirst) {
                        y13 = (float) getIntersectionPoint(new Point(x13, y13), new Point(x42, y42), new Point(x13 + innerRadiusBefore, y13), new Point(x13 + innerRadiusBefore, y13 - innerRadiusFirst)).getY();
                        x13 += innerRadiusBefore;
                    }
                }
                if (innerRadiusAfter2 > innerRadiusSecond) {
                    x36 = x3;
                    y36 = y3;
                    x22 = (float) getIntersectionPoint(new Point(x22, y2), new Point(x36, y36), new Point(x22, y2 - innerRadiusSecond), new Point(x22 - innerRadiusAfter2, y2 - innerRadiusSecond)).getX();
                    y22 = y2 - innerRadiusSecond;
                    x4 = x42;
                    y4 = y42;
                    x13 = x13;
                    y13 = y13;
                    break;
                } else {
                    y22 = y2;
                    x12 = x13;
                    y12 = y13;
                    x36 = x3;
                    y36 = y3;
                    x32 = x42;
                    y32 = y42;
                    if (0.0f != innerRadiusAfter2 && 0.0f != innerRadiusSecond) {
                        y22 = (float) getIntersectionPoint(new Point(x22, y22), new Point(x36, y36), new Point(x22 - innerRadiusAfter2, y22), new Point(x22 - innerRadiusAfter2, y22 - innerRadiusSecond)).getY();
                        x22 -= innerRadiusAfter2;
                        x4 = x32;
                        y4 = y32;
                        x13 = x12;
                        y13 = y12;
                        break;
                    }
                    x13 = x12;
                    y13 = y12;
                    x4 = x32;
                    y4 = y32;
                    break;
                }
                break;
            case RIGHT:
                x22 = x2;
                float x38 = x22 + this.width;
                float y38 = y2 - borderWidthAfter;
                float x43 = x13 + this.width;
                float y43 = y13 + borderWidthBefore;
                float innerRadiusBefore2 = Math.max(0.0f, verticalRadius1 - borderWidthBefore);
                float innerRadiusFirst2 = Math.max(0.0f, horizontalRadius1 - this.width);
                float innerRadiusSecond6 = Math.max(0.0f, horizontalRadius2 - this.width);
                float innerRadiusAfter3 = Math.max(0.0f, verticalRadius2 - borderWidthAfter);
                if (innerRadiusFirst2 > innerRadiusBefore2) {
                    x33 = x38;
                    y33 = y38;
                    innerRadiusSecond2 = innerRadiusSecond6;
                    x13 = (float) getIntersectionPoint(new Point(x13, y13), new Point(x43, y43), new Point(x13, y13 - innerRadiusBefore2), new Point(x13 - innerRadiusFirst2, y13 - innerRadiusBefore2)).getX();
                    y13 -= innerRadiusBefore2;
                } else {
                    x33 = x38;
                    y33 = y38;
                    innerRadiusSecond2 = innerRadiusSecond6;
                    if (0.0f != innerRadiusBefore2 && 0.0f != innerRadiusFirst2) {
                        y13 = (float) getIntersectionPoint(new Point(x13, y13), new Point(x43, y43), new Point(x13 - innerRadiusFirst2, y13), new Point(x13 - innerRadiusFirst2, y13 - innerRadiusBefore2)).getY();
                        x13 -= innerRadiusFirst2;
                    }
                }
                if (innerRadiusAfter3 > innerRadiusSecond2) {
                    x36 = x33;
                    y36 = y33;
                    y22 = (float) getIntersectionPoint(new Point(x22, y2), new Point(x36, y36), new Point(x22 - innerRadiusSecond2, y2), new Point(x22 - innerRadiusSecond2, y2 + innerRadiusAfter3)).getY();
                    x22 -= innerRadiusSecond2;
                    x4 = x43;
                    y4 = y43;
                    x13 = x13;
                    y13 = y13;
                    break;
                } else {
                    y22 = y2;
                    x12 = x13;
                    y12 = y13;
                    x36 = x33;
                    y36 = y33;
                    x32 = x43;
                    y32 = y43;
                    if (0.0f != innerRadiusAfter3 && 0.0f != innerRadiusSecond2) {
                        x22 = (float) getIntersectionPoint(new Point(x22, y22), new Point(x36, y36), new Point(x22, y22 + innerRadiusAfter3), new Point(x22 - innerRadiusSecond2, y22 + innerRadiusAfter3)).getX();
                        y22 += innerRadiusAfter3;
                        x4 = x32;
                        y4 = y32;
                        x13 = x12;
                        y13 = y12;
                        break;
                    }
                    x13 = x12;
                    y13 = y12;
                    x4 = x32;
                    y4 = y32;
                    break;
                }
                break;
            case BOTTOM:
                x22 = x2;
                float x39 = x22 - borderWidthAfter;
                float y39 = y2 - this.width;
                float x44 = x13 + borderWidthBefore;
                float y44 = y13 - this.width;
                float innerRadiusBefore3 = Math.max(0.0f, horizontalRadius1 - borderWidthBefore);
                float innerRadiusFirst3 = Math.max(0.0f, verticalRadius1 - this.width);
                float innerRadiusSecond7 = Math.max(0.0f, verticalRadius2 - this.width);
                float innerRadiusAfter4 = Math.max(0.0f, horizontalRadius2 - borderWidthAfter);
                if (innerRadiusFirst3 > innerRadiusBefore3) {
                    innerRadiusSecond3 = innerRadiusSecond7;
                    innerRadiusAfter = innerRadiusAfter4;
                    x34 = x39;
                    y34 = y39;
                    y13 = (float) getIntersectionPoint(new Point(x13, y13), new Point(x44, y44), new Point(x13 - innerRadiusBefore3, y13), new Point(x13 - innerRadiusBefore3, y13 + innerRadiusFirst3)).getY();
                    x13 -= innerRadiusBefore3;
                } else {
                    x34 = x39;
                    y34 = y39;
                    innerRadiusSecond3 = innerRadiusSecond7;
                    innerRadiusAfter = innerRadiusAfter4;
                    if (0.0f != innerRadiusBefore3 && 0.0f != innerRadiusFirst3) {
                        x13 = (float) getIntersectionPoint(new Point(x13, y13), new Point(x44, y44), new Point(x13, y13 + innerRadiusFirst3), new Point(x13 - innerRadiusBefore3, y13 + innerRadiusFirst3)).getX();
                        y13 += innerRadiusFirst3;
                    }
                }
                if (innerRadiusAfter > innerRadiusSecond3) {
                    x36 = x34;
                    y36 = y34;
                    x22 = (float) getIntersectionPoint(new Point(x22, y2), new Point(x36, y36), new Point(x22, y2 + innerRadiusSecond3), new Point(x22 + innerRadiusAfter, y2 + innerRadiusSecond3)).getX();
                    y22 = y2 + innerRadiusSecond3;
                    x4 = x44;
                    y4 = y44;
                    x13 = x13;
                    y13 = y13;
                    break;
                } else {
                    y22 = y2;
                    float x14 = x13;
                    float y14 = y13;
                    x36 = x34;
                    y36 = y34;
                    if (0.0f != innerRadiusAfter && 0.0f != innerRadiusSecond3) {
                        y22 = (float) getIntersectionPoint(new Point(x22, y22), new Point(x36, y36), new Point(x22 + innerRadiusAfter, y22), new Point(x22 + innerRadiusAfter, y22 + innerRadiusSecond3)).getY();
                        x22 += innerRadiusAfter;
                        x4 = x44;
                        y4 = y44;
                        x13 = x14;
                        y13 = y14;
                        break;
                    } else {
                        x13 = x14;
                        y13 = y14;
                        x4 = x44;
                        y4 = y44;
                        break;
                    }
                }
                break;
            case LEFT:
                float x310 = x2 - this.width;
                float y310 = y2 + borderWidthAfter;
                float x45 = x13 - this.width;
                float y45 = y13 - borderWidthBefore;
                float innerRadiusBefore4 = Math.max(0.0f, verticalRadius1 - borderWidthBefore);
                float innerRadiusFirst4 = Math.max(0.0f, horizontalRadius1 - this.width);
                float innerRadiusSecond8 = Math.max(0.0f, horizontalRadius2 - this.width);
                float innerRadiusAfter5 = Math.max(0.0f, verticalRadius2 - borderWidthAfter);
                if (innerRadiusFirst4 > innerRadiusBefore4) {
                    f = 0.0f;
                    innerRadiusSecond4 = innerRadiusSecond8;
                    x35 = x310;
                    y35 = y310;
                    x13 = (float) getIntersectionPoint(new Point(x13, y13), new Point(x45, y45), new Point(x13, y13 + innerRadiusBefore4), new Point(x13 + innerRadiusFirst4, y13 + innerRadiusBefore4)).getX();
                    y13 += innerRadiusBefore4;
                } else {
                    x35 = x310;
                    y35 = y310;
                    f = 0.0f;
                    innerRadiusSecond4 = innerRadiusSecond8;
                    if (0.0f != innerRadiusBefore4 && 0.0f != innerRadiusFirst4) {
                        y13 = (float) getIntersectionPoint(new Point(x13, y13), new Point(x45, y45), new Point(x13 + innerRadiusFirst4, y13), new Point(x13 + innerRadiusFirst4, y13 + innerRadiusBefore4)).getY();
                        x13 += innerRadiusFirst4;
                    }
                }
                if (innerRadiusAfter5 > innerRadiusSecond4) {
                    float x311 = x35;
                    float y311 = y35;
                    y22 = (float) getIntersectionPoint(new Point(x2, y2), new Point(x311, y311), new Point(x2 + innerRadiusSecond4, y2), new Point(x2 + innerRadiusSecond4, y2 - innerRadiusAfter5)).getY();
                    x22 = x2 + innerRadiusSecond4;
                    x36 = x311;
                    y36 = y311;
                    x4 = x45;
                    y4 = y45;
                    x13 = x13;
                    y13 = y13;
                    break;
                } else {
                    x22 = x2;
                    y22 = y2;
                    float x15 = x13;
                    float y15 = y13;
                    float x312 = x35;
                    float y312 = y35;
                    if (f != innerRadiusAfter5 && f != innerRadiusSecond4) {
                        x22 = (float) getIntersectionPoint(new Point(x22, y22), new Point(x312, y312), new Point(x22, y22 - innerRadiusAfter5), new Point(x22 + innerRadiusSecond4, y22 - innerRadiusAfter5)).getX();
                        y22 -= innerRadiusAfter5;
                        x36 = x312;
                        y36 = y312;
                        x4 = x45;
                        y4 = y45;
                        x13 = x15;
                        y13 = y15;
                        break;
                    } else {
                        x13 = x15;
                        y13 = y15;
                        x36 = x312;
                        y36 = y312;
                        x4 = x45;
                        y4 = y45;
                        break;
                    }
                }
                break;
            default:
                x22 = x2;
                y22 = y2;
                break;
        }
        canvas.saveState().setFillColor(this.transparentColor.getColor());
        this.transparentColor.applyFillTransparency(canvas);
        canvas.moveTo(x13, y13).lineTo(x22, y22).lineTo(x36, y36).lineTo(x4, y4).lineTo(x13, y13).fill().restoreState();
    }

    @Override // com.itextpdf.layout.borders.Border
    public void drawCellBorder(PdfCanvas canvas, float x1, float y1, float x2, float y2, Border.Side defaultSide) {
        canvas.saveState().setStrokeColor(this.transparentColor.getColor());
        this.transparentColor.applyStrokeTransparency(canvas);
        canvas.setLineWidth(this.width).moveTo(x1, y1).lineTo(x2, y2).stroke().restoreState();
    }
}
