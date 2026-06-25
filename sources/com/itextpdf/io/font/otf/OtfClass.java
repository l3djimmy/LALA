package com.itextpdf.io.font.otf;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.io.source.RandomAccessFileOrArray;
import com.itextpdf.io.util.IntHashtable;
import java.io.IOException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class OtfClass {
    public static final int GLYPH_BASE = 1;
    public static final int GLYPH_LIGATURE = 2;
    public static final int GLYPH_MARK = 3;
    private IntHashtable mapClass = new IntHashtable();

    private OtfClass(RandomAccessFileOrArray rf, int classLocation) throws IOException {
        rf.seek(classLocation);
        int classFormat = rf.readUnsignedShort();
        if (classFormat == 1) {
            int startGlyph = rf.readUnsignedShort();
            int glyphCount = rf.readUnsignedShort();
            int endGlyph = startGlyph + glyphCount;
            for (int k = startGlyph; k < endGlyph; k++) {
                int cl = rf.readUnsignedShort();
                this.mapClass.put(k, cl);
            }
        } else if (classFormat == 2) {
            int classRangeCount = rf.readUnsignedShort();
            for (int k2 = 0; k2 < classRangeCount; k2++) {
                int glyphEnd = rf.readUnsignedShort();
                int cl2 = rf.readUnsignedShort();
                for (int glyphStart = rf.readUnsignedShort(); glyphStart <= glyphEnd; glyphStart++) {
                    this.mapClass.put(glyphStart, cl2);
                }
            }
        } else {
            throw new IOException("Invalid class format " + classFormat);
        }
    }

    public static OtfClass create(RandomAccessFileOrArray rf, int classLocation) {
        try {
            OtfClass otfClass = new OtfClass(rf, classLocation);
            return otfClass;
        } catch (IOException e) {
            Logger logger = LoggerFactory.getLogger(OtfClass.class);
            logger.error(MessageFormatUtil.format(IoLogMessageConstant.OPENTYPE_GDEF_TABLE_ERROR, e.getMessage()));
            return null;
        }
    }

    public int getOtfClass(int glyph) {
        return this.mapClass.get(glyph);
    }

    public boolean isMarkOtfClass(int glyph) {
        return hasClass(glyph) && getOtfClass(glyph) == 3;
    }

    public boolean hasClass(int glyph) {
        return this.mapClass.containsKey(glyph);
    }

    public int getOtfClass(int glyph, boolean strict) {
        IntHashtable intHashtable = this.mapClass;
        if (strict) {
            if (intHashtable.containsKey(glyph)) {
                return this.mapClass.get(glyph);
            }
            return -1;
        }
        return intHashtable.get(glyph);
    }
}
