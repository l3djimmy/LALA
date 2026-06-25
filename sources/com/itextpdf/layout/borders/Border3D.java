package com.itextpdf.layout.borders;

import com.itextpdf.kernel.colors.Color;
import com.itextpdf.kernel.colors.DeviceCmyk;
import com.itextpdf.kernel.colors.DeviceGray;
import com.itextpdf.kernel.colors.DeviceRgb;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.layout.borders.Border;
/* loaded from: classes12.dex */
public abstract class Border3D extends Border {
    private static final DeviceRgb GRAY = new DeviceRgb(212, 208, 200);

    protected abstract void setInnerHalfColor(PdfCanvas pdfCanvas, Border.Side side);

    protected abstract void setOuterHalfColor(PdfCanvas pdfCanvas, Border.Side side);

    /* JADX INFO: Access modifiers changed from: protected */
    public Border3D(float width) {
        this(GRAY, width);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Border3D(DeviceRgb color, float width) {
        super(color, width);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Border3D(DeviceCmyk color, float width) {
        super(color, width);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Border3D(DeviceGray color, float width) {
        super(color, width);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Border3D(DeviceRgb color, float width, float opacity) {
        super(color, width, opacity);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Border3D(DeviceCmyk color, float width, float opacity) {
        super(color, width, opacity);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Border3D(DeviceGray color, float width, float opacity) {
        super(color, width, opacity);
    }

    @Override // com.itextpdf.layout.borders.Border
    public void draw(PdfCanvas canvas, float x1, float y1, float x2, float y2, Border.Side defaultSide, float borderWidthBefore, float borderWidthAfter) {
        float x3 = 0.0f;
        float y3 = 0.0f;
        float x4 = 0.0f;
        float y4 = 0.0f;
        float widthHalf = this.width / 2.0f;
        float halfOfWidthBefore = borderWidthBefore / 2.0f;
        float halfOfWidthAfter = borderWidthAfter / 2.0f;
        float x12 = x1;
        float y12 = y1;
        float x22 = x2;
        float y22 = y2;
        Border.Side borderSide = getBorderSide(x12, y12, x22, y22, defaultSide);
        switch (borderSide) {
            case TOP:
                x3 = x22 + halfOfWidthAfter;
                y3 = y22 + widthHalf;
                x4 = x12 - halfOfWidthBefore;
                y4 = y12 + widthHalf;
                break;
            case RIGHT:
                x3 = x22 + widthHalf;
                y3 = y22 - halfOfWidthAfter;
                x4 = x12 + widthHalf;
                y4 = y12 + halfOfWidthBefore;
                break;
            case BOTTOM:
                x3 = x22 - halfOfWidthAfter;
                y3 = y22 - widthHalf;
                x4 = x12 + halfOfWidthBefore;
                y4 = y12 - widthHalf;
                break;
            case LEFT:
                x3 = x22 - widthHalf;
                y3 = y22 + halfOfWidthAfter;
                x4 = x12 - widthHalf;
                y4 = y12 - halfOfWidthBefore;
                break;
        }
        canvas.saveState();
        this.transparentColor.applyFillTransparency(canvas);
        setInnerHalfColor(canvas, borderSide);
        canvas.moveTo(x12, y12).lineTo(x22, y22).lineTo(x3, y3).lineTo(x4, y4).lineTo(x12, y12).fill();
        switch (borderSide) {
            case TOP:
                x22 += borderWidthAfter;
                y22 += this.width;
                x12 -= borderWidthBefore;
                y12 += this.width;
                break;
            case RIGHT:
                x22 += this.width;
                y22 -= borderWidthAfter;
                x12 += this.width;
                y12 += borderWidthBefore;
                break;
            case BOTTOM:
                x22 -= borderWidthAfter;
                y22 -= this.width;
                x12 += borderWidthBefore;
                y12 -= this.width;
                break;
            case LEFT:
                x22 -= this.width;
                y22 += borderWidthAfter;
                x12 -= this.width;
                y12 -= borderWidthBefore;
                break;
        }
        setOuterHalfColor(canvas, borderSide);
        canvas.moveTo(x12, y12).lineTo(x22, y22).lineTo(x3, y3).lineTo(x4, y4).lineTo(x12, y12).fill();
        canvas.restoreState();
    }

    @Override // com.itextpdf.layout.borders.Border
    public void drawCellBorder(PdfCanvas canvas, float x1, float y1, float x2, float y2, Border.Side defaultSide) {
        canvas.saveState().setStrokeColor(this.transparentColor.getColor());
        this.transparentColor.applyStrokeTransparency(canvas);
        canvas.setLineWidth(this.width).moveTo(x1, y1).lineTo(x2, y2).stroke().restoreState();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Color getDarkerColor() {
        Color color = this.transparentColor.getColor();
        if (color instanceof DeviceRgb) {
            return DeviceRgb.makeDarker((DeviceRgb) color);
        }
        if (color instanceof DeviceCmyk) {
            return DeviceCmyk.makeDarker((DeviceCmyk) color);
        }
        if (color instanceof DeviceGray) {
            return DeviceGray.makeDarker((DeviceGray) color);
        }
        return color;
    }
}
