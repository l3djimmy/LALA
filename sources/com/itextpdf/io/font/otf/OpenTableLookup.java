package com.itextpdf.io.font.otf;

import java.io.IOException;
/* loaded from: classes12.dex */
public abstract class OpenTableLookup {
    protected int lookupFlag;
    protected OpenTypeFontTableReader openReader;
    protected int[] subTableLocations;

    protected abstract void readSubTable(int i) throws IOException;

    public abstract boolean transformOne(GlyphLine glyphLine);

    /* JADX INFO: Access modifiers changed from: protected */
    public OpenTableLookup(OpenTypeFontTableReader openReader, int lookupFlag, int[] subTableLocations) {
        this.lookupFlag = lookupFlag;
        this.subTableLocations = subTableLocations;
        this.openReader = openReader;
    }

    public int getLookupFlag() {
        return this.lookupFlag;
    }

    public boolean transformLine(GlyphLine line) {
        boolean changed = false;
        line.idx = line.start;
        while (line.idx < line.end && line.idx >= line.start) {
            changed = transformOne(line) || changed;
        }
        return changed;
    }

    public boolean hasSubstitution(int index) {
        return false;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void readSubTables() throws IOException {
        int[] iArr;
        for (int subTableLocation : this.subTableLocations) {
            readSubTable(subTableLocation);
        }
    }

    /* loaded from: classes12.dex */
    public static class GlyphIndexer {
        public Glyph glyph;
        public int idx;
        public GlyphLine line;

        public void nextGlyph(OpenTypeFontTableReader openReader, int lookupFlag) {
            Glyph g;
            this.glyph = null;
            do {
                int i = this.idx + 1;
                this.idx = i;
                if (i < this.line.end) {
                    g = this.line.get(this.idx);
                } else {
                    return;
                }
            } while (openReader.isSkip(g.getCode(), lookupFlag));
            this.glyph = g;
        }

        public void previousGlyph(OpenTypeFontTableReader openReader, int lookupFlag) {
            Glyph g;
            this.glyph = null;
            do {
                int i = this.idx - 1;
                this.idx = i;
                if (i >= this.line.start) {
                    g = this.line.get(this.idx);
                } else {
                    return;
                }
            } while (openReader.isSkip(g.getCode(), lookupFlag));
            this.glyph = g;
        }
    }
}
