package com.itextpdf.kernel.pdf.canvas.wmf;
/* loaded from: classes12.dex */
public class MetaObject {
    public static final int META_BRUSH = 2;
    public static final int META_FONT = 3;
    public static final int META_NOT_SUPPORTED = 0;
    public static final int META_PEN = 1;
    private int type;

    public MetaObject() {
        this.type = 0;
    }

    public MetaObject(int type) {
        this.type = 0;
        this.type = type;
    }

    public int getType() {
        return this.type;
    }
}
