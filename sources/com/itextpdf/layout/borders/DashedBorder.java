package com.itextpdf.layout.borders;

import com.itextpdf.kernel.colors.Color;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.layout.borders.Border;
/* loaded from: classes12.dex */
public class DashedBorder extends Border {
    private static final float DASH_MODIFIER = 5.0f;
    private static final float GAP_MODIFIER = 3.5f;

    public DashedBorder(float width) {
        super(width);
    }

    public DashedBorder(Color color, float width) {
        super(color, width);
    }

    public DashedBorder(Color color, float width, float opacity) {
        super(color, width, opacity);
    }

    @Override // com.itextpdf.layout.borders.Border
    public int getType() {
        return 1;
    }

    @Override // com.itextpdf.layout.borders.Border
    public void draw(PdfCanvas canvas, float x1, float y1, float x2, float y2, Border.Side defaultSide, float borderWidthBefore, float borderWidthAfter) {
        float adjustedGap;
        float initialGap = this.width * GAP_MODIFIER;
        float dash = this.width * DASH_MODIFIER;
        float dx = x2 - x1;
        float dy = y2 - y1;
        double borderLength = Math.sqrt((dx * dx) + (dy * dy));
        float adjustedGap2 = super.getDotsGap(borderLength, initialGap + dash);
        if (adjustedGap2 <= dash) {
            adjustedGap = adjustedGap2;
        } else {
            adjustedGap = adjustedGap2 - dash;
        }
        new FixedDashedBorder(getColor(), this.width, getOpacity(), dash, adjustedGap, dash + (adjustedGap / 2.0f)).draw(canvas, x1, y1, x2, y2, defaultSide, borderWidthBefore, borderWidthAfter);
    }

    @Override // com.itextpdf.layout.borders.Border
    public void draw(PdfCanvas canvas, float x1, float y1, float x2, float y2, float horizontalRadius1, float verticalRadius1, float horizontalRadius2, float verticalRadius2, Border.Side defaultSide, float borderWidthBefore, float borderWidthAfter) {
        float adjustedGap;
        float initialGap = this.width * GAP_MODIFIER;
        float dash = this.width * DASH_MODIFIER;
        float dx = x2 - x1;
        float dy = y2 - y1;
        double borderLength = Math.sqrt((dx * dx) + (dy * dy));
        float adjustedGap2 = super.getDotsGap(borderLength, initialGap + dash);
        if (adjustedGap2 <= dash) {
            adjustedGap = adjustedGap2;
        } else {
            adjustedGap = adjustedGap2 - dash;
        }
        new FixedDashedBorder(getColor(), this.width, getOpacity(), dash, adjustedGap, (adjustedGap / 2.0f) + dash).draw(canvas, x1, y1, x2, y2, horizontalRadius1, verticalRadius1, horizontalRadius2, verticalRadius2, defaultSide, borderWidthBefore, borderWidthAfter);
    }

    @Override // com.itextpdf.layout.borders.Border
    public void drawCellBorder(PdfCanvas canvas, float x1, float y1, float x2, float y2, Border.Side defaultSide) {
        float adjustedGap;
        float initialGap = this.width * GAP_MODIFIER;
        float dash = this.width * DASH_MODIFIER;
        float dx = x2 - x1;
        float dy = y2 - y1;
        double borderLength = Math.sqrt((dx * dx) + (dy * dy));
        float adjustedGap2 = super.getDotsGap(borderLength, initialGap + dash);
        if (adjustedGap2 <= dash) {
            adjustedGap = adjustedGap2;
        } else {
            adjustedGap = adjustedGap2 - dash;
        }
        new FixedDashedBorder(getColor(), this.width, getOpacity(), dash, adjustedGap, dash + (adjustedGap / 2.0f)).drawCellBorder(canvas, x1, y1, x2, y2, defaultSide);
    }
}
