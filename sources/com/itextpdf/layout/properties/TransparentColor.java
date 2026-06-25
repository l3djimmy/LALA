package com.itextpdf.layout.properties;

import com.itextpdf.kernel.colors.Color;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.kernel.pdf.extgstate.PdfExtGState;
/* loaded from: classes12.dex */
public class TransparentColor {
    private Color color;
    private float opacity;

    public TransparentColor(Color color) {
        this.color = color;
        this.opacity = 1.0f;
    }

    public TransparentColor(Color color, float opacity) {
        this.color = color;
        this.opacity = opacity;
    }

    public Color getColor() {
        return this.color;
    }

    public float getOpacity() {
        return this.opacity;
    }

    public void applyFillTransparency(PdfCanvas canvas) {
        applyTransparency(canvas, false);
    }

    public void applyStrokeTransparency(PdfCanvas canvas) {
        applyTransparency(canvas, true);
    }

    private void applyTransparency(PdfCanvas canvas, boolean isStroke) {
        if (isTransparent()) {
            PdfExtGState extGState = new PdfExtGState();
            float f = this.opacity;
            if (isStroke) {
                extGState.setStrokeOpacity(f);
            } else {
                extGState.setFillOpacity(f);
            }
            canvas.setExtGState(extGState);
        }
    }

    private boolean isTransparent() {
        return this.opacity < 1.0f;
    }
}
