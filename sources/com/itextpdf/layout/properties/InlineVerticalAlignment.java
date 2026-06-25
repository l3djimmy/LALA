package com.itextpdf.layout.properties;

import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.layout.exceptions.LayoutExceptionMessageConstant;
/* loaded from: classes12.dex */
public class InlineVerticalAlignment {
    private InlineVerticalAlignmentType type;
    private float value;

    public InlineVerticalAlignment() {
        this.type = InlineVerticalAlignmentType.BASELINE;
    }

    public InlineVerticalAlignment(InlineVerticalAlignmentType type) {
        this.type = type;
    }

    public InlineVerticalAlignment(InlineVerticalAlignmentType type, float value) {
        if (type != InlineVerticalAlignmentType.FRACTION && type != InlineVerticalAlignmentType.FIXED) {
            throw new PdfException(LayoutExceptionMessageConstant.INLINE_VERTICAL_ALIGNMENT_DOESN_T_NEED_A_VALUE).setMessageParams(type);
        }
        this.type = type;
        this.value = value;
    }

    public InlineVerticalAlignmentType getType() {
        return this.type;
    }

    public void setType(InlineVerticalAlignmentType type) {
        this.type = type;
    }

    public float getValue() {
        return this.value;
    }

    public void setValue(float value) {
        this.value = value;
    }
}
