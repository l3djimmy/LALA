package com.itextpdf.io.font.otf;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes12.dex */
public class OpenTypeFeature {
    private OpenTypeFontTableReader openTypeReader;
    private List<FeatureRecord> records = new ArrayList();

    public OpenTypeFeature(OpenTypeFontTableReader openTypeReader, int locationFeatureTable) throws IOException {
        this.openTypeReader = openTypeReader;
        openTypeReader.rf.seek(locationFeatureTable);
        TagAndLocation[] tagsLocs = openTypeReader.readTagAndLocations(locationFeatureTable);
        for (TagAndLocation tagLoc : tagsLocs) {
            openTypeReader.rf.seek(tagLoc.location + 2);
            int lookupCount = openTypeReader.rf.readUnsignedShort();
            FeatureRecord rec = new FeatureRecord();
            rec.tag = tagLoc.tag;
            rec.lookups = openTypeReader.readUShortArray(lookupCount);
            this.records.add(rec);
        }
    }

    public List<FeatureRecord> getRecords() {
        return this.records;
    }

    public FeatureRecord getRecord(int idx) {
        if (idx < 0 || idx >= this.records.size()) {
            return null;
        }
        return this.records.get(idx);
    }
}
