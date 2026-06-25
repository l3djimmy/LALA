package com.itextpdf.io.font;

import androidx.autofill.HintConstants;
import com.itextpdf.io.exceptions.IoExceptionMessageConstant;
import com.itextpdf.io.source.RandomAccessFileOrArray;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
/* loaded from: classes12.dex */
class TrueTypeFontSubset {
    private static final int ARG_1_AND_2_ARE_WORDS = 1;
    private static final int HEAD_LOCA_FORMAT_OFFSET = 51;
    private static final int MORE_COMPONENTS = 32;
    private static final int TABLE_CHECKSUM = 0;
    private static final int TABLE_LENGTH = 2;
    private static final int TABLE_OFFSET = 1;
    private static final int WE_HAVE_AN_X_AND_Y_SCALE = 64;
    private static final int WE_HAVE_A_SCALE = 8;
    private static final int WE_HAVE_A_TWO_BY_TWO = 128;
    private int directoryOffset;
    private String fileName;
    private int fontPtr;
    private int glyfTableRealSize;
    private List<Integer> glyphsInList;
    private Set<Integer> glyphsUsed;
    private boolean locaShortTable;
    private int[] locaTable;
    private int locaTableRealSize;
    private byte[] newGlyfTable;
    private int[] newLocaTable;
    private byte[] newLocaTableOut;
    private byte[] outFont;
    protected RandomAccessFileOrArray rf;
    private Map<String, int[]> tableDirectory;
    private int tableGlyphOffset;
    private final String[] tableNames;
    private static final String[] TABLE_NAMES_SUBSET = {"cvt ", "fpgm", "glyf", "head", "hhea", "hmtx", "loca", "maxp", "prep", "cmap", "OS/2"};
    private static final String[] TABLE_NAMES = {"cvt ", "fpgm", "glyf", "head", "hhea", "hmtx", "loca", "maxp", "prep", "cmap", "OS/2", HintConstants.AUTOFILL_HINT_NAME, "post"};
    private static final int[] entrySelectors = {0, 0, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4};

    /* JADX INFO: Access modifiers changed from: package-private */
    public TrueTypeFontSubset(String fileName, RandomAccessFileOrArray rf, Set<Integer> glyphsUsed, int directoryOffset, boolean subset) {
        this.fileName = fileName;
        this.rf = rf;
        this.glyphsUsed = new HashSet(glyphsUsed);
        this.directoryOffset = directoryOffset;
        if (subset) {
            this.tableNames = TABLE_NAMES_SUBSET;
        } else {
            this.tableNames = TABLE_NAMES;
        }
        this.glyphsInList = new ArrayList(glyphsUsed);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public byte[] process() throws IOException {
        try {
            createTableDirectory();
            readLoca();
            flatGlyphs();
            createNewGlyphTables();
            locaToBytes();
            assembleFont();
            return this.outFont;
        } finally {
            try {
                this.rf.close();
            } catch (Exception e) {
            }
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    private void assembleFont() throws IOException {
        char c;
        String[] strArr;
        int i;
        int i2;
        int fullFontSize;
        char c2;
        char c3;
        int len;
        int[] tableLocation;
        int fullFontSize2 = 0;
        int tablesUsed = 2;
        String[] strArr2 = this.tableNames;
        int length = strArr2.length;
        int i3 = 0;
        int i4 = 0;
        while (true) {
            c = 2;
            if (i4 >= length) {
                break;
            }
            String name = strArr2[i4];
            if (!name.equals("glyf") && !name.equals("loca") && (tableLocation = this.tableDirectory.get(name)) != null) {
                tablesUsed++;
                fullFontSize2 += (tableLocation[2] + 3) & (-4);
            }
            i4++;
        }
        int reference = (tablesUsed * 16) + 12;
        int fullFontSize3 = fullFontSize2 + this.newLocaTableOut.length + this.newGlyfTable.length + reference;
        this.outFont = new byte[fullFontSize3];
        this.fontPtr = 0;
        writeFontInt(65536);
        writeFontShort(tablesUsed);
        int selector = entrySelectors[tablesUsed];
        int i5 = 1;
        writeFontShort((1 << selector) * 16);
        writeFontShort(selector);
        writeFontShort((tablesUsed - (1 << selector)) * 16);
        for (String name2 : this.tableNames) {
            int[] tableLocation2 = this.tableDirectory.get(name2);
            if (tableLocation2 != null) {
                writeFontString(name2);
                switch (name2.hashCode()) {
                    case 3176114:
                        if (name2.equals("glyf")) {
                            c3 = 0;
                            break;
                        }
                        c3 = 65535;
                        break;
                    case 3327265:
                        if (name2.equals("loca")) {
                            c3 = 1;
                            break;
                        }
                        c3 = 65535;
                        break;
                    default:
                        c3 = 65535;
                        break;
                }
                switch (c3) {
                    case 0:
                        writeFontInt(calculateChecksum(this.newGlyfTable));
                        len = this.glyfTableRealSize;
                        break;
                    case 1:
                        writeFontInt(calculateChecksum(this.newLocaTableOut));
                        len = this.locaTableRealSize;
                        break;
                    default:
                        writeFontInt(tableLocation2[0]);
                        len = tableLocation2[2];
                        break;
                }
                writeFontInt(reference);
                writeFontInt(len);
                reference += (len + 3) & (-4);
            }
        }
        String[] strArr3 = this.tableNames;
        int length2 = strArr3.length;
        int i6 = 0;
        while (i6 < length2) {
            String name3 = strArr3[i6];
            int[] tableLocation3 = this.tableDirectory.get(name3);
            if (tableLocation3 == null) {
                fullFontSize = fullFontSize3;
                i2 = i5;
                c2 = c;
            } else {
                switch (name3.hashCode()) {
                    case 3176114:
                        if (name3.equals("glyf")) {
                            i = i3;
                            break;
                        }
                        i = -1;
                        break;
                    case 3327265:
                        if (name3.equals("loca")) {
                            i = i5;
                            break;
                        }
                        i = -1;
                        break;
                    default:
                        i = -1;
                        break;
                }
                i2 = i5;
                switch (i) {
                    case 0:
                        fullFontSize = fullFontSize3;
                        c2 = c;
                        System.arraycopy(this.newGlyfTable, i3, this.outFont, this.fontPtr, this.newGlyfTable.length);
                        this.fontPtr += this.newGlyfTable.length;
                        this.newGlyfTable = null;
                        continue;
                    case 1:
                        c2 = c;
                        fullFontSize = fullFontSize3;
                        System.arraycopy(this.newLocaTableOut, i3, this.outFont, this.fontPtr, this.newLocaTableOut.length);
                        this.fontPtr += this.newLocaTableOut.length;
                        this.newLocaTableOut = null;
                        continue;
                    default:
                        fullFontSize = fullFontSize3;
                        c2 = c;
                        this.rf.seek(tableLocation3[i2]);
                        this.rf.readFully(this.outFont, this.fontPtr, tableLocation3[c2]);
                        this.fontPtr += (tableLocation3[c2] + 3) & (-4);
                        continue;
                }
            }
            i6++;
            c = c2;
            i5 = i2;
            fullFontSize3 = fullFontSize;
            i3 = 0;
        }
    }

    private void createTableDirectory() throws IOException {
        this.tableDirectory = new HashMap();
        this.rf.seek(this.directoryOffset);
        int id = this.rf.readInt();
        if (id != 65536) {
            throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.NOT_AT_TRUE_TYPE_FILE).setMessageParams(this.fileName);
        }
        int num_tables = this.rf.readUnsignedShort();
        this.rf.skipBytes(6);
        for (int k = 0; k < num_tables; k++) {
            String tag = readStandardString(4);
            int[] tableLocation = {this.rf.readInt(), this.rf.readInt(), this.rf.readInt()};
            this.tableDirectory.put(tag, tableLocation);
        }
    }

    private void readLoca() throws IOException {
        int[] tableLocation = this.tableDirectory.get("head");
        if (tableLocation == null) {
            throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.TABLE_DOES_NOT_EXISTS_IN).setMessageParams("head", this.fileName);
        }
        this.rf.seek(tableLocation[1] + 51);
        this.locaShortTable = this.rf.readUnsignedShort() == 0;
        int[] tableLocation2 = this.tableDirectory.get("loca");
        if (tableLocation2 == null) {
            throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.TABLE_DOES_NOT_EXISTS_IN).setMessageParams("loca", this.fileName);
        }
        this.rf.seek(tableLocation2[1]);
        if (this.locaShortTable) {
            int entries = tableLocation2[2] / 2;
            this.locaTable = new int[entries];
            for (int k = 0; k < entries; k++) {
                this.locaTable[k] = this.rf.readUnsignedShort() * 2;
            }
            return;
        }
        int entries2 = tableLocation2[2] / 4;
        this.locaTable = new int[entries2];
        for (int k2 = 0; k2 < entries2; k2++) {
            this.locaTable[k2] = this.rf.readInt();
        }
    }

    private void createNewGlyphTables() throws IOException {
        this.newLocaTable = new int[this.locaTable.length];
        int[] activeGlyphs = new int[this.glyphsInList.size()];
        for (int k = 0; k < activeGlyphs.length; k++) {
            activeGlyphs[k] = this.glyphsInList.get(k).intValue();
        }
        Arrays.sort(activeGlyphs);
        int glyfSize = 0;
        for (int glyph : activeGlyphs) {
            glyfSize += this.locaTable[glyph + 1] - this.locaTable[glyph];
        }
        this.glyfTableRealSize = glyfSize;
        this.newGlyfTable = new byte[(glyfSize + 3) & (-4)];
        int glyfPtr = 0;
        int listGlyf = 0;
        for (int k2 = 0; k2 < this.newLocaTable.length; k2++) {
            this.newLocaTable[k2] = glyfPtr;
            if (listGlyf < activeGlyphs.length && activeGlyphs[listGlyf] == k2) {
                listGlyf++;
                this.newLocaTable[k2] = glyfPtr;
                int start = this.locaTable[k2];
                int len = this.locaTable[k2 + 1] - start;
                if (len > 0) {
                    this.rf.seek(this.tableGlyphOffset + start);
                    this.rf.readFully(this.newGlyfTable, glyfPtr, len);
                    glyfPtr += len;
                }
            }
        }
    }

    private void locaToBytes() {
        int[] iArr;
        boolean z = this.locaShortTable;
        int[] iArr2 = this.newLocaTable;
        if (z) {
            this.locaTableRealSize = iArr2.length * 2;
        } else {
            this.locaTableRealSize = iArr2.length * 4;
        }
        this.newLocaTableOut = new byte[(this.locaTableRealSize + 3) & (-4)];
        this.outFont = this.newLocaTableOut;
        this.fontPtr = 0;
        for (int location : this.newLocaTable) {
            if (this.locaShortTable) {
                writeFontShort(location / 2);
            } else {
                writeFontInt(location);
            }
        }
    }

    private void flatGlyphs() throws IOException {
        int[] tableLocation = this.tableDirectory.get("glyf");
        if (tableLocation == null) {
            throw new com.itextpdf.io.exceptions.IOException(IoExceptionMessageConstant.TABLE_DOES_NOT_EXISTS_IN).setMessageParams("glyf", this.fileName);
        }
        if (!this.glyphsUsed.contains(0)) {
            this.glyphsUsed.add(0);
            this.glyphsInList.add(0);
        }
        this.tableGlyphOffset = tableLocation[1];
        for (int i = 0; i < this.glyphsInList.size(); i++) {
            checkGlyphComposite(this.glyphsInList.get(i).intValue());
        }
    }

    private void checkGlyphComposite(int glyph) throws IOException {
        int skip;
        int start = this.locaTable[glyph];
        if (start == this.locaTable[glyph + 1]) {
            return;
        }
        this.rf.seek(this.tableGlyphOffset + start);
        int numContours = this.rf.readShort();
        if (numContours >= 0) {
            return;
        }
        this.rf.skipBytes(8);
        while (true) {
            int flags = this.rf.readUnsignedShort();
            int cGlyph = this.rf.readUnsignedShort();
            if (!this.glyphsUsed.contains(Integer.valueOf(cGlyph))) {
                this.glyphsUsed.add(Integer.valueOf(cGlyph));
                this.glyphsInList.add(Integer.valueOf(cGlyph));
            }
            if ((flags & 32) == 0) {
                return;
            }
            if ((flags & 1) != 0) {
                skip = 4;
            } else {
                skip = 2;
            }
            if ((flags & 8) != 0) {
                skip += 2;
            } else if ((flags & 64) != 0) {
                skip += 4;
            }
            if ((flags & 128) != 0) {
                skip += 8;
            }
            this.rf.skipBytes(skip);
        }
    }

    private String readStandardString(int length) throws IOException {
        byte[] buf = new byte[length];
        this.rf.readFully(buf);
        try {
            return new String(buf, "Cp1252");
        } catch (Exception e) {
            throw new com.itextpdf.io.exceptions.IOException("TrueType font", (Throwable) e);
        }
    }

    private void writeFontShort(int n) {
        byte[] bArr = this.outFont;
        int i = this.fontPtr;
        this.fontPtr = i + 1;
        bArr[i] = (byte) (n >> 8);
        byte[] bArr2 = this.outFont;
        int i2 = this.fontPtr;
        this.fontPtr = i2 + 1;
        bArr2[i2] = (byte) n;
    }

    private void writeFontInt(int n) {
        byte[] bArr = this.outFont;
        int i = this.fontPtr;
        this.fontPtr = i + 1;
        bArr[i] = (byte) (n >> 24);
        byte[] bArr2 = this.outFont;
        int i2 = this.fontPtr;
        this.fontPtr = i2 + 1;
        bArr2[i2] = (byte) (n >> 16);
        byte[] bArr3 = this.outFont;
        int i3 = this.fontPtr;
        this.fontPtr = i3 + 1;
        bArr3[i3] = (byte) (n >> 8);
        byte[] bArr4 = this.outFont;
        int i4 = this.fontPtr;
        this.fontPtr = i4 + 1;
        bArr4[i4] = (byte) n;
    }

    private void writeFontString(String s) {
        byte[] b = PdfEncodings.convertToBytes(s, "Cp1252");
        System.arraycopy(b, 0, this.outFont, this.fontPtr, b.length);
        this.fontPtr += b.length;
    }

    private int calculateChecksum(byte[] b) {
        int len = b.length / 4;
        int v0 = 0;
        int v1 = 0;
        int v2 = 0;
        int v3 = 0;
        int ptr = 0;
        for (int k = 0; k < len; k++) {
            int ptr2 = ptr + 1;
            v3 += b[ptr] & 255;
            int ptr3 = ptr2 + 1;
            v2 += b[ptr2] & 255;
            int ptr4 = ptr3 + 1;
            v1 += b[ptr3] & 255;
            ptr = ptr4 + 1;
            v0 += b[ptr4] & 255;
        }
        int k2 = v1 << 8;
        return k2 + v0 + (v2 << 16) + (v3 << 24);
    }
}
