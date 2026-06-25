package com.itextpdf.io.font;

import com.itextpdf.io.font.otf.Glyph;
/* loaded from: classes12.dex */
class GidAwareGlyph extends Glyph {
    private int gid;

    public GidAwareGlyph(int code, int width, int unicode, int[] bbox) {
        super(code, width, unicode, bbox);
    }

    public void setGid(int index) {
        this.gid = index;
    }

    public int getGid() {
        return this.gid;
    }
}
