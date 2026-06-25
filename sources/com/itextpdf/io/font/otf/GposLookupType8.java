package com.itextpdf.io.font.otf;

import com.itextpdf.io.exceptions.IOException;
import com.itextpdf.io.font.otf.lookuptype8.PosTableLookup8Format1;
import com.itextpdf.io.font.otf.lookuptype8.PosTableLookup8Format2;
import com.itextpdf.io.font.otf.lookuptype8.PosTableLookup8Format3;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
/* loaded from: classes12.dex */
public class GposLookupType8 extends GposLookupType7 {
    /* JADX INFO: Access modifiers changed from: protected */
    public GposLookupType8(OpenTypeFontTableReader openReader, int lookupFlag, int[] subTableLocations) throws IOException, java.io.IOException {
        super(openReader, lookupFlag, subTableLocations);
        this.subTables = new ArrayList();
        readSubTables();
    }

    @Override // com.itextpdf.io.font.otf.GposLookupType7, com.itextpdf.io.font.otf.OpenTableLookup
    protected void readSubTable(int subTableLocation) throws java.io.IOException {
        this.openReader.rf.seek(subTableLocation);
        int substFormat = this.openReader.rf.readShort();
        switch (substFormat) {
            case 1:
                readSubTableFormat1(subTableLocation);
                return;
            case 2:
                readSubTableFormat2(subTableLocation);
                return;
            case 3:
                readSubTableFormat3(subTableLocation);
                return;
            default:
                throw new IllegalArgumentException("Bad subtable format identifier: " + substFormat);
        }
    }

    @Override // com.itextpdf.io.font.otf.GposLookupType7
    protected void readSubTableFormat2(int subTableLocation) throws java.io.IOException {
        int coverageOffset = this.openReader.rf.readUnsignedShort();
        int backtrackClassDefOffset = this.openReader.rf.readUnsignedShort();
        int inputClassDefOffset = this.openReader.rf.readUnsignedShort();
        int lookaheadClassDefOffset = this.openReader.rf.readUnsignedShort();
        int chainPosClassSetCount = this.openReader.rf.readUnsignedShort();
        int[] chainPosClassSetOffsets = this.openReader.readUShortArray(chainPosClassSetCount, subTableLocation);
        Set<Integer> coverageGlyphIds = new HashSet<>(this.openReader.readCoverageFormat(subTableLocation + coverageOffset));
        OtfClass backtrackClassDefinition = this.openReader.readClassDefinition(subTableLocation + backtrackClassDefOffset);
        OtfClass inputClassDefinition = this.openReader.readClassDefinition(subTableLocation + inputClassDefOffset);
        OtfClass lookaheadClassDefinition = this.openReader.readClassDefinition(subTableLocation + lookaheadClassDefOffset);
        PosTableLookup8Format2 t = new PosTableLookup8Format2(this.openReader, this.lookupFlag, coverageGlyphIds, backtrackClassDefinition, inputClassDefinition, lookaheadClassDefinition);
        int i = 0;
        while (i < chainPosClassSetCount) {
            List<ContextualPositionRule> posClassSet = Collections.emptyList();
            if (chainPosClassSetOffsets[i] != 0) {
                this.openReader.rf.seek(chainPosClassSetOffsets[i]);
                int chainPosClassRuleCount = this.openReader.rf.readUnsignedShort();
                int[] chainPosClassRuleOffsets = this.openReader.readUShortArray(chainPosClassRuleCount, chainPosClassSetOffsets[i]);
                posClassSet = new ArrayList(chainPosClassRuleCount);
                int j = 0;
                while (j < chainPosClassRuleCount) {
                    int coverageOffset2 = coverageOffset;
                    int backtrackClassDefOffset2 = backtrackClassDefOffset;
                    this.openReader.rf.seek(chainPosClassRuleOffsets[j]);
                    int backtrackClassCount = this.openReader.rf.readUnsignedShort();
                    int[] backtrackClassIds = this.openReader.readUShortArray(backtrackClassCount);
                    int inputClassCount = this.openReader.rf.readUnsignedShort();
                    int backtrackClassCount2 = inputClassCount - 1;
                    int[] inputClassIds = this.openReader.readUShortArray(backtrackClassCount2);
                    int lookAheadClassCount = this.openReader.rf.readUnsignedShort();
                    int[] lookAheadClassIds = this.openReader.readUShortArray(lookAheadClassCount);
                    int substCount = this.openReader.rf.readUnsignedShort();
                    PosLookupRecord[] posLookupRecords = this.openReader.readPosLookupRecords(substCount);
                    PosTableLookup8Format2.PosRuleFormat2 rule = new PosTableLookup8Format2.PosRuleFormat2(t, backtrackClassIds, inputClassIds, lookAheadClassIds, posLookupRecords);
                    posClassSet.add(rule);
                    j++;
                    t = t;
                    coverageOffset = coverageOffset2;
                    backtrackClassDefOffset = backtrackClassDefOffset2;
                }
            }
            PosTableLookup8Format2 t2 = t;
            t2.addPosClassSet(posClassSet);
            i++;
            t = t2;
            coverageOffset = coverageOffset;
            backtrackClassDefOffset = backtrackClassDefOffset;
        }
        this.subTables.add(t);
    }

    private void readSubTableFormat1(int subTableLocation) throws java.io.IOException {
        Map<Integer, List<ContextualPositionRule>> posMap = new HashMap<>();
        int coverageOffset = this.openReader.rf.readUnsignedShort();
        int chainPosRuleSetCount = this.openReader.rf.readUnsignedShort();
        int[] chainPosRuleSetOffsets = this.openReader.readUShortArray(chainPosRuleSetCount, subTableLocation);
        List<Integer> coverageGlyphIds = this.openReader.readCoverageFormat(subTableLocation + coverageOffset);
        for (int i = 0; i < chainPosRuleSetCount; i++) {
            this.openReader.rf.seek(chainPosRuleSetOffsets[i]);
            int chainPosRuleCount = this.openReader.rf.readUnsignedShort();
            int[] chainPosRuleOffsets = this.openReader.readUShortArray(chainPosRuleCount, chainPosRuleSetOffsets[i]);
            List<ContextualPositionRule> chainPosRuleSet = new ArrayList<>(chainPosRuleCount);
            int j = 0;
            while (j < chainPosRuleCount) {
                this.openReader.rf.seek(chainPosRuleOffsets[j]);
                int backtrackGlyphCount = this.openReader.rf.readUnsignedShort();
                int[] backtrackGlyphIds = this.openReader.readUShortArray(backtrackGlyphCount);
                int inputGlyphCount = this.openReader.rf.readUnsignedShort();
                int[] inputGlyphIds = this.openReader.readUShortArray(inputGlyphCount - 1);
                int lookAheadGlyphCount = this.openReader.rf.readUnsignedShort();
                int coverageOffset2 = coverageOffset;
                int[] lookAheadGlyphIds = this.openReader.readUShortArray(lookAheadGlyphCount);
                int chainPosRuleSetCount2 = chainPosRuleSetCount;
                int posCount = this.openReader.rf.readUnsignedShort();
                int[] chainPosRuleSetOffsets2 = chainPosRuleSetOffsets;
                PosLookupRecord[] posLookupRecords = this.openReader.readPosLookupRecords(posCount);
                chainPosRuleSet.add(new PosTableLookup8Format1.PosRuleFormat1(backtrackGlyphIds, inputGlyphIds, lookAheadGlyphIds, posLookupRecords));
                j++;
                coverageOffset = coverageOffset2;
                chainPosRuleSetCount = chainPosRuleSetCount2;
                chainPosRuleSetOffsets = chainPosRuleSetOffsets2;
            }
            posMap.put(coverageGlyphIds.get(i), chainPosRuleSet);
        }
        this.subTables.add(new PosTableLookup8Format1(this.openReader, this.lookupFlag, posMap));
    }

    private void readSubTableFormat3(int subTableLocation) throws java.io.IOException {
        int backtrackGlyphCount = this.openReader.rf.readUnsignedShort();
        int[] backtrackCoverageOffsets = this.openReader.readUShortArray(backtrackGlyphCount, subTableLocation);
        int inputGlyphCount = this.openReader.rf.readUnsignedShort();
        int[] inputCoverageOffsets = this.openReader.readUShortArray(inputGlyphCount, subTableLocation);
        int lookaheadGlyphCount = this.openReader.rf.readUnsignedShort();
        int[] lookaheadCoverageOffsets = this.openReader.readUShortArray(lookaheadGlyphCount, subTableLocation);
        int posCount = this.openReader.rf.readUnsignedShort();
        PosLookupRecord[] posLookupRecords = this.openReader.readPosLookupRecords(posCount);
        List<Set<Integer>> backtrackCoverages = new ArrayList<>(backtrackGlyphCount);
        this.openReader.readCoverages(backtrackCoverageOffsets, backtrackCoverages);
        List<Set<Integer>> inputCoverages = new ArrayList<>(inputGlyphCount);
        this.openReader.readCoverages(inputCoverageOffsets, inputCoverages);
        List<Set<Integer>> lookaheadCoverages = new ArrayList<>(lookaheadGlyphCount);
        this.openReader.readCoverages(lookaheadCoverageOffsets, lookaheadCoverages);
        PosTableLookup8Format3.PosRuleFormat3 rule = new PosTableLookup8Format3.PosRuleFormat3(backtrackCoverages, inputCoverages, lookaheadCoverages, posLookupRecords);
        this.subTables.add(new PosTableLookup8Format3(this.openReader, this.lookupFlag, rule));
    }
}
