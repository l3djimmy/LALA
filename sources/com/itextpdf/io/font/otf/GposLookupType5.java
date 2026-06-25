package com.itextpdf.io.font.otf;

import com.itextpdf.io.font.otf.OpenTableLookup;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
/* loaded from: classes12.dex */
public class GposLookupType5 extends OpenTableLookup {
    private final List<MarkToLigature> marksligatures;

    /* loaded from: classes12.dex */
    public static class MarkToLigature {
        public final Map<Integer, OtfMarkRecord> marks = new HashMap();
        public final Map<Integer, List<GposAnchor[]>> ligatures = new HashMap();
    }

    public GposLookupType5(OpenTypeFontTableReader openReader, int lookupFlag, int[] subTableLocations) throws IOException {
        super(openReader, lookupFlag, subTableLocations);
        this.marksligatures = new ArrayList();
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
        OpenTableLookup.GlyphIndexer ligatureGlyphIndexer = null;
        Iterator<MarkToLigature> it = this.marksligatures.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            MarkToLigature mb = it.next();
            OtfMarkRecord omr = mb.marks.get(Integer.valueOf(line.get(line.idx).getCode()));
            if (omr != null) {
                if (ligatureGlyphIndexer == null) {
                    OpenTableLookup.GlyphIndexer ligatureGlyphIndexer2 = new OpenTableLookup.GlyphIndexer();
                    ligatureGlyphIndexer2.idx = line.idx;
                    ligatureGlyphIndexer2.line = line;
                    do {
                        ligatureGlyphIndexer2.previousGlyph(this.openReader, this.lookupFlag);
                        if (ligatureGlyphIndexer2.glyph == null) {
                            break;
                        }
                    } while (mb.marks.containsKey(Integer.valueOf(ligatureGlyphIndexer2.glyph.getCode())));
                    if (ligatureGlyphIndexer2.glyph == null) {
                        break;
                    }
                    ligatureGlyphIndexer = ligatureGlyphIndexer2;
                }
                List<GposAnchor[]> componentAnchors = mb.ligatures.get(Integer.valueOf(ligatureGlyphIndexer.glyph.getCode()));
                if (componentAnchors != null) {
                    int markClass = omr.markClass;
                    int component = componentAnchors.size() - 1;
                    while (true) {
                        if (component < 0) {
                            break;
                        } else if (componentAnchors.get(component)[markClass] == null) {
                            component--;
                        } else {
                            GposAnchor baseAnchor = componentAnchors.get(component)[markClass];
                            GposAnchor markAnchor = omr.anchor;
                            line.set(line.idx, new Glyph(line.get(line.idx), baseAnchor.XCoordinate - markAnchor.XCoordinate, baseAnchor.YCoordinate - markAnchor.YCoordinate, 0, 0, ligatureGlyphIndexer.idx - line.idx));
                            changed = true;
                            break;
                        }
                    }
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
        int ligatureCoverageLocation = this.openReader.rf.readUnsignedShort() + subTableLocation;
        int classCount = this.openReader.rf.readUnsignedShort();
        int markArrayLocation = this.openReader.rf.readUnsignedShort() + subTableLocation;
        int ligatureArrayLocation = this.openReader.rf.readUnsignedShort() + subTableLocation;
        List<Integer> markCoverage = this.openReader.readCoverageFormat(markCoverageLocation);
        List<Integer> ligatureCoverage = this.openReader.readCoverageFormat(ligatureCoverageLocation);
        List<OtfMarkRecord> markRecords = OtfReadCommon.readMarkArray(this.openReader, markArrayLocation);
        MarkToLigature markToLigature = new MarkToLigature();
        for (int k = 0; k < markCoverage.size(); k++) {
            markToLigature.marks.put(markCoverage.get(k), markRecords.get(k));
        }
        List<List<GposAnchor[]>> ligatureArray = OtfReadCommon.readLigatureArray(this.openReader, classCount, ligatureArrayLocation);
        for (int k2 = 0; k2 < ligatureCoverage.size(); k2++) {
            markToLigature.ligatures.put(ligatureCoverage.get(k2), ligatureArray.get(k2));
        }
        this.marksligatures.add(markToLigature);
    }
}
