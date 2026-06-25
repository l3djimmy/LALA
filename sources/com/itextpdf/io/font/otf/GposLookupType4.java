package com.itextpdf.io.font.otf;

import com.itextpdf.io.font.otf.OpenTableLookup;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
/* loaded from: classes12.dex */
public class GposLookupType4 extends OpenTableLookup {
    private final List<MarkToBase> marksbases;

    /* loaded from: classes12.dex */
    public static class MarkToBase {
        public final Map<Integer, OtfMarkRecord> marks = new HashMap();
        public final Map<Integer, GposAnchor[]> bases = new HashMap();
    }

    public GposLookupType4(OpenTypeFontTableReader openReader, int lookupFlag, int[] subTableLocations) throws IOException {
        super(openReader, lookupFlag, subTableLocations);
        this.marksbases = new ArrayList();
        readSubTables();
    }

    @Override // com.itextpdf.io.font.otf.OpenTableLookup
    public boolean transformOne(GlyphLine line) {
        int xPlacement;
        int yPlacement;
        if (line.idx >= line.end) {
            return false;
        }
        if (this.openReader.isSkip(line.get(line.idx).getCode(), this.lookupFlag)) {
            line.idx++;
            return false;
        }
        boolean changed = false;
        OpenTableLookup.GlyphIndexer gi = null;
        Iterator<MarkToBase> it = this.marksbases.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            MarkToBase mb = it.next();
            OtfMarkRecord omr = mb.marks.get(Integer.valueOf(line.get(line.idx).getCode()));
            if (omr != null) {
                if (gi == null) {
                    OpenTableLookup.GlyphIndexer gi2 = new OpenTableLookup.GlyphIndexer();
                    gi2.idx = line.idx;
                    gi2.line = line;
                    do {
                        gi2.previousGlyph(this.openReader, this.lookupFlag);
                        if (gi2.glyph == null) {
                            break;
                        }
                    } while (this.openReader.getGlyphClass(gi2.glyph.getCode()) == 3);
                    if (gi2.glyph == null) {
                        break;
                    }
                    gi = gi2;
                }
                GposAnchor[] gpas = mb.bases.get(Integer.valueOf(gi.glyph.getCode()));
                if (gpas != null) {
                    int markClass = omr.markClass;
                    int xPlacement2 = 0;
                    int yPlacement2 = 0;
                    GposAnchor baseAnchor = gpas[markClass];
                    if (baseAnchor != null) {
                        xPlacement2 = baseAnchor.XCoordinate;
                        yPlacement2 = baseAnchor.YCoordinate;
                    }
                    GposAnchor markAnchor = omr.anchor;
                    if (markAnchor == null) {
                        xPlacement = xPlacement2;
                        yPlacement = yPlacement2;
                    } else {
                        xPlacement = xPlacement2 - markAnchor.XCoordinate;
                        yPlacement = yPlacement2 - markAnchor.YCoordinate;
                    }
                    int xPlacement3 = line.idx;
                    line.set(xPlacement3, new Glyph(line.get(line.idx), xPlacement, yPlacement, 0, 0, gi.idx - line.idx));
                    changed = true;
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
        MarkToBase markToBase = new MarkToBase();
        for (int k = 0; k < markCoverage.size(); k++) {
            markToBase.marks.put(markCoverage.get(k), markRecords.get(k));
        }
        List<GposAnchor[]> baseArray = OtfReadCommon.readBaseArray(this.openReader, classCount, baseArrayLocation);
        for (int k2 = 0; k2 < baseCoverage.size(); k2++) {
            markToBase.bases.put(baseCoverage.get(k2), baseArray.get(k2));
        }
        this.marksbases.add(markToBase);
    }
}
