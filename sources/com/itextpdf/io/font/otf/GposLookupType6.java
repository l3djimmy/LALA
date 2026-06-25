package com.itextpdf.io.font.otf;

import com.itextpdf.io.font.otf.OpenTableLookup;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
/* loaded from: classes12.dex */
public class GposLookupType6 extends OpenTableLookup {
    private final List<MarkToBaseMark> marksbases;

    public GposLookupType6(OpenTypeFontTableReader openReader, int lookupFlag, int[] subTableLocations) throws IOException {
        super(openReader, lookupFlag, subTableLocations);
        this.marksbases = new ArrayList();
        readSubTables();
    }

    @Override // com.itextpdf.io.font.otf.OpenTableLookup
    public boolean transformOne(GlyphLine line) {
        if (line.idx >= line.end) {
            return false;
        }
        if (this.openReader.isSkip(line.get(line.idx).getCode(), this.lookupFlag)) {
            line.idx++;
            return false;
        }
        boolean changed = false;
        OpenTableLookup.GlyphIndexer gi = null;
        Iterator<MarkToBaseMark> it = this.marksbases.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            MarkToBaseMark mb = it.next();
            OtfMarkRecord omr = mb.marks.get(Integer.valueOf(line.get(line.idx).getCode()));
            if (omr != null) {
                if (gi == null) {
                    OpenTableLookup.GlyphIndexer gi2 = new OpenTableLookup.GlyphIndexer();
                    gi2.idx = line.idx;
                    gi2.line = line;
                    while (true) {
                        int prev = gi2.idx;
                        boolean foundBaseGlyph = false;
                        gi2.previousGlyph(this.openReader, this.lookupFlag);
                        if (gi2.idx != -1) {
                            int i = gi2.idx;
                            while (true) {
                                if (i >= prev) {
                                    break;
                                } else if (this.openReader.getGlyphClass(line.get(i).getCode()) != 1) {
                                    i++;
                                } else {
                                    foundBaseGlyph = true;
                                    break;
                                }
                            }
                        }
                        if (foundBaseGlyph) {
                            gi2.glyph = null;
                            break;
                        } else if (gi2.glyph == null) {
                            break;
                        } else if (mb.baseMarks.containsKey(Integer.valueOf(gi2.glyph.getCode()))) {
                            break;
                        }
                    }
                    if (gi2.glyph == null) {
                        break;
                    }
                    gi = gi2;
                }
                GposAnchor[] gpas = mb.baseMarks.get(Integer.valueOf(gi.glyph.getCode()));
                if (gpas != null) {
                    int markClass = omr.markClass;
                    GposAnchor baseAnchor = gpas[markClass];
                    GposAnchor markAnchor = omr.anchor;
                    line.set(line.idx, new Glyph(line.get(line.idx), (-markAnchor.XCoordinate) + baseAnchor.XCoordinate, (-markAnchor.YCoordinate) + baseAnchor.YCoordinate, 0, 0, gi.idx - line.idx));
                    changed = true;
                    break;
                }
            }
        }
        line.idx++;
        return changed;
    }

    @Override // com.itextpdf.io.font.otf.OpenTableLookup
    protected void readSubTable(int subTableLocation) throws IOException {
        this.openReader.rf.seek(subTableLocation);
        this.openReader.rf.readUnsignedShort();
        int markCoverageLocation = this.openReader.rf.readUnsignedShort() + subTableLocation;
        int baseCoverageLocation = this.openReader.rf.readUnsignedShort() + subTableLocation;
        int classCount = this.openReader.rf.readUnsignedShort();
        int markArrayLocation = this.openReader.rf.readUnsignedShort() + subTableLocation;
        int baseArrayLocation = this.openReader.rf.readUnsignedShort() + subTableLocation;
        List<Integer> markCoverage = this.openReader.readCoverageFormat(markCoverageLocation);
        List<Integer> baseCoverage = this.openReader.readCoverageFormat(baseCoverageLocation);
        List<OtfMarkRecord> markRecords = OtfReadCommon.readMarkArray(this.openReader, markArrayLocation);
        MarkToBaseMark markToBaseMark = new MarkToBaseMark();
        for (int k = 0; k < markCoverage.size(); k++) {
            markToBaseMark.marks.put(markCoverage.get(k), markRecords.get(k));
        }
        List<GposAnchor[]> baseArray = OtfReadCommon.readBaseArray(this.openReader, classCount, baseArrayLocation);
        for (int k2 = 0; k2 < baseCoverage.size(); k2++) {
            markToBaseMark.baseMarks.put(baseCoverage.get(k2), baseArray.get(k2));
        }
        this.marksbases.add(markToBaseMark);
    }

    /* loaded from: classes12.dex */
    private static class MarkToBaseMark {
        public final Map<Integer, GposAnchor[]> baseMarks;
        public final Map<Integer, OtfMarkRecord> marks;

        private MarkToBaseMark() {
            this.marks = new HashMap();
            this.baseMarks = new HashMap();
        }
    }
}
