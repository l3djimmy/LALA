package com.itextpdf.io.font.otf;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/* loaded from: classes12.dex */
public class GposLookupType1 extends OpenTableLookup {
    private Map<Integer, GposValueRecord> valueRecordMap;

    public GposLookupType1(OpenTypeFontTableReader openReader, int lookupFlag, int[] subTableLocations) throws IOException {
        super(openReader, lookupFlag, subTableLocations);
        this.valueRecordMap = new HashMap();
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
        int glyphCode = line.get(line.idx).getCode();
        boolean positionApplied = false;
        GposValueRecord valueRecord = this.valueRecordMap.get(Integer.valueOf(glyphCode));
        if (valueRecord != null) {
            Glyph newGlyph = new Glyph(line.get(line.idx));
            newGlyph.setXAdvance((short) (newGlyph.getXAdvance() + valueRecord.XAdvance));
            newGlyph.setYAdvance((short) (newGlyph.getYAdvance() + valueRecord.YAdvance));
            line.set(line.idx, newGlyph);
            positionApplied = true;
        }
        line.idx++;
        return positionApplied;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.itextpdf.io.font.otf.OpenTableLookup
    protected void readSubTable(int subTableLocation) throws IOException {
        this.openReader.rf.seek(subTableLocation);
        int subTableFormat = this.openReader.rf.readShort();
        int coverageOffset = this.openReader.rf.readUnsignedShort();
        int valueFormat = this.openReader.rf.readUnsignedShort();
        if (subTableFormat == 1) {
            GposValueRecord valueRecord = OtfReadCommon.readGposValueRecord(this.openReader, valueFormat);
            for (Integer glyphId : this.openReader.readCoverageFormat(subTableLocation + coverageOffset)) {
                this.valueRecordMap.put(Integer.valueOf(glyphId.intValue()), valueRecord);
            }
        } else if (subTableFormat == 2) {
            int valueCount = this.openReader.rf.readUnsignedShort();
            List<GposValueRecord> valueRecords = new ArrayList<>();
            for (int i = 0; i < valueCount; i++) {
                GposValueRecord valueRecord2 = OtfReadCommon.readGposValueRecord(this.openReader, valueFormat);
                valueRecords.add(valueRecord2);
            }
            List<Integer> coverageGlyphIds = this.openReader.readCoverageFormat(subTableLocation + coverageOffset);
            for (int i2 = 0; i2 < coverageGlyphIds.size(); i2++) {
                this.valueRecordMap.put(Integer.valueOf(coverageGlyphIds.get(i2).intValue()), valueRecords.get(i2));
            }
        } else {
            throw new IllegalArgumentException("Bad subtable format identifier: " + subTableFormat);
        }
    }
}
