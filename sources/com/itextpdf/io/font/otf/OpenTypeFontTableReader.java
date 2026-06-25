package com.itextpdf.io.font.otf;

import com.itextpdf.io.source.RandomAccessFileOrArray;
import com.itextpdf.io.util.IntHashtable;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
/* loaded from: classes12.dex */
public abstract class OpenTypeFontTableReader {
    protected OpenTypeFeature featuresType;
    private final OpenTypeGdefTableReader gdef;
    private final Map<Integer, Glyph> indexGlyphMap;
    protected List<OpenTableLookup> lookupList;
    protected final RandomAccessFileOrArray rf;
    protected OpenTypeScript scriptsType;
    protected final int tableLocation;
    private final int unitsPerEm;

    protected abstract OpenTableLookup readLookupTable(int i, int i2, int[] iArr) throws IOException;

    /* JADX INFO: Access modifiers changed from: protected */
    public OpenTypeFontTableReader(RandomAccessFileOrArray rf, int tableLocation, OpenTypeGdefTableReader gdef, Map<Integer, Glyph> indexGlyphMap, int unitsPerEm) {
        this.rf = rf;
        this.tableLocation = tableLocation;
        this.indexGlyphMap = indexGlyphMap;
        this.gdef = gdef;
        this.unitsPerEm = unitsPerEm;
    }

    public Glyph getGlyph(int index) {
        return this.indexGlyphMap.get(Integer.valueOf(index));
    }

    public OpenTableLookup getLookupTable(int idx) {
        if (idx < 0 || idx >= this.lookupList.size()) {
            return null;
        }
        return this.lookupList.get(idx);
    }

    public List<ScriptRecord> getScriptRecords() {
        return this.scriptsType.getScriptRecords();
    }

    public List<FeatureRecord> getFeatureRecords() {
        return this.featuresType.getRecords();
    }

    public List<FeatureRecord> getFeatures(String[] scripts, String language) {
        int[] iArr;
        LanguageRecord rec = this.scriptsType.getLanguageRecord(scripts, language);
        if (rec == null) {
            return null;
        }
        List<FeatureRecord> ret = new ArrayList<>();
        for (int f : rec.features) {
            ret.add(this.featuresType.getRecord(f));
        }
        return ret;
    }

    public List<FeatureRecord> getSpecificFeatures(List<FeatureRecord> features, String[] specific) {
        if (specific == null) {
            return features;
        }
        Set<String> hs = new HashSet<>();
        for (String s : specific) {
            hs.add(s);
        }
        List<FeatureRecord> recs = new ArrayList<>();
        for (FeatureRecord rec : features) {
            if (hs.contains(rec.tag)) {
                recs.add(rec);
            }
        }
        return recs;
    }

    public FeatureRecord getRequiredFeature(String[] scripts, String language) {
        LanguageRecord rec = this.scriptsType.getLanguageRecord(scripts, language);
        if (rec == null) {
            return null;
        }
        return this.featuresType.getRecord(rec.featureRequired);
    }

    public List<OpenTableLookup> getLookups(FeatureRecord[] features) {
        int[] orderedKeys;
        int[] iArr;
        IntHashtable hash = new IntHashtable();
        for (FeatureRecord rec : features) {
            for (int idx : rec.lookups) {
                hash.put(idx, 1);
            }
        }
        List<OpenTableLookup> ret = new ArrayList<>();
        for (int idx2 : hash.toOrderedKeys()) {
            ret.add(this.lookupList.get(idx2));
        }
        return ret;
    }

    public List<OpenTableLookup> getLookups(FeatureRecord feature) {
        int[] iArr;
        List<OpenTableLookup> ret = new ArrayList<>(feature.lookups.length);
        for (int idx : feature.lookups) {
            ret.add(this.lookupList.get(idx));
        }
        return ret;
    }

    public boolean isSkip(int glyph, int flag) {
        return this.gdef.isSkip(glyph, flag);
    }

    public int getGlyphClass(int glyphCode) {
        return this.gdef.getGlyphClassTable().getOtfClass(glyphCode);
    }

    public int getUnitsPerEm() {
        return this.unitsPerEm;
    }

    public LanguageRecord getLanguageRecord(String otfScriptTag) {
        return getLanguageRecord(otfScriptTag, null);
    }

    public LanguageRecord getLanguageRecord(String otfScriptTag, String langTag) {
        LanguageRecord[] languageRecordArr;
        if (otfScriptTag == null) {
            return null;
        }
        for (ScriptRecord record : getScriptRecords()) {
            if (otfScriptTag.equals(record.tag)) {
                if (langTag == null) {
                    return record.defaultLanguage;
                }
                for (LanguageRecord lang : record.languages) {
                    if (langTag.equals(lang.tag)) {
                        return lang;
                    }
                }
                continue;
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final OtfClass readClassDefinition(int classLocation) {
        return OtfClass.create(this.rf, classLocation);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final int[] readUShortArray(int size, int location) throws IOException {
        return OtfReadCommon.readUShortArray(this.rf, size, location);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final int[] readUShortArray(int size) throws IOException {
        return OtfReadCommon.readUShortArray(this.rf, size);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void readCoverages(int[] locations, List<Set<Integer>> coverage) throws IOException {
        OtfReadCommon.readCoverages(this.rf, locations, coverage);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final List<Integer> readCoverageFormat(int coverageLocation) throws IOException {
        return OtfReadCommon.readCoverageFormat(this.rf, coverageLocation);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public SubstLookupRecord[] readSubstLookupRecords(int substCount) throws IOException {
        return OtfReadCommon.readSubstLookupRecords(this.rf, substCount);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PosLookupRecord[] readPosLookupRecords(int substCount) throws IOException {
        return OtfReadCommon.readPosLookupRecords(this.rf, substCount);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public TagAndLocation[] readTagAndLocations(int baseLocation) throws IOException {
        int count = this.rf.readUnsignedShort();
        TagAndLocation[] tagslLocs = new TagAndLocation[count];
        for (int k = 0; k < count; k++) {
            TagAndLocation tl = new TagAndLocation();
            tl.tag = this.rf.readString(4, "utf-8");
            tl.location = this.rf.readUnsignedShort() + baseLocation;
            tagslLocs[k] = tl;
        }
        return tagslLocs;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void startReadingTable() throws FontReadingException {
        try {
            this.rf.seek(this.tableLocation);
            this.rf.readInt();
            int scriptListOffset = this.rf.readUnsignedShort();
            int featureListOffset = this.rf.readUnsignedShort();
            int lookupListOffset = this.rf.readUnsignedShort();
            this.scriptsType = new OpenTypeScript(this, this.tableLocation + scriptListOffset);
            this.featuresType = new OpenTypeFeature(this, this.tableLocation + featureListOffset);
            readLookupListTable(this.tableLocation + lookupListOffset);
        } catch (IOException e) {
            throw new FontReadingException("Error reading font file", e);
        }
    }

    private void readLookupListTable(int lookupListTableLocation) throws IOException {
        this.lookupList = new ArrayList();
        this.rf.seek(lookupListTableLocation);
        int lookupCount = this.rf.readUnsignedShort();
        int[] lookupTableLocations = readUShortArray(lookupCount, lookupListTableLocation);
        for (int lookupLocation : lookupTableLocations) {
            if (lookupLocation != 0) {
                readLookupTable(lookupLocation);
            }
        }
    }

    private void readLookupTable(int lookupTableLocation) throws IOException {
        this.rf.seek(lookupTableLocation);
        int lookupType = this.rf.readUnsignedShort();
        int lookupFlag = this.rf.readUnsignedShort();
        int subTableCount = this.rf.readUnsignedShort();
        int[] subTableLocations = readUShortArray(subTableCount, lookupTableLocation);
        this.lookupList.add(readLookupTable(lookupType, lookupFlag, subTableLocations));
    }
}
