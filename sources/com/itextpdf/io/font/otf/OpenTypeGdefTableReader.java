package com.itextpdf.io.font.otf;

import com.itextpdf.io.source.RandomAccessFileOrArray;
import java.io.IOException;
/* loaded from: classes12.dex */
public class OpenTypeGdefTableReader {
    static final int FLAG_IGNORE_BASE = 2;
    static final int FLAG_IGNORE_LIGATURE = 4;
    static final int FLAG_IGNORE_MARK = 8;
    private OtfClass glyphClass;
    private OtfClass markAttachmentClass;
    private final RandomAccessFileOrArray rf;
    private final int tableLocation;

    public OpenTypeGdefTableReader(RandomAccessFileOrArray rf, int tableLocation) {
        this.rf = rf;
        this.tableLocation = tableLocation;
    }

    public void readTable() throws IOException {
        if (this.tableLocation > 0) {
            this.rf.seek(this.tableLocation);
            this.rf.readUnsignedInt();
            int glyphClassDefOffset = this.rf.readUnsignedShort();
            this.rf.readUnsignedShort();
            this.rf.readUnsignedShort();
            int markAttachClassDefOffset = this.rf.readUnsignedShort();
            if (glyphClassDefOffset > 0) {
                this.glyphClass = OtfClass.create(this.rf, this.tableLocation + glyphClassDefOffset);
            }
            if (markAttachClassDefOffset > 0) {
                this.markAttachmentClass = OtfClass.create(this.rf, this.tableLocation + markAttachClassDefOffset);
            }
        }
    }

    public boolean isSkip(int glyph, int flag) {
        if (this.glyphClass != null && (flag & 14) != 0) {
            int cla = this.glyphClass.getOtfClass(glyph);
            if (cla == 1 && (flag & 2) != 0) {
                return true;
            }
            if (cla == 3 && (flag & 8) != 0) {
                return true;
            }
            if (cla == 2 && (flag & 4) != 0) {
                return true;
            }
        }
        int cla2 = flag >> 8;
        if (cla2 == 0 || this.glyphClass == null) {
            return false;
        }
        int currentGlyphClass = this.glyphClass.getOtfClass(glyph);
        int glyphMarkAttachmentClass = this.markAttachmentClass != null ? this.markAttachmentClass.getOtfClass(glyph) : 0;
        return currentGlyphClass == 3 && glyphMarkAttachmentClass != cla2;
    }

    public OtfClass getGlyphClassTable() {
        return this.glyphClass;
    }
}
