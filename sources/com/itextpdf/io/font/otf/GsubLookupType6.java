package com.itextpdf.io.font.otf;

import com.itextpdf.io.font.otf.lookuptype6.SubTableLookup6Format1;
import com.itextpdf.io.font.otf.lookuptype6.SubTableLookup6Format2;
import com.itextpdf.io.font.otf.lookuptype6.SubTableLookup6Format3;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
/* loaded from: classes12.dex */
public class GsubLookupType6 extends GsubLookupType5 {
    /* JADX INFO: Access modifiers changed from: protected */
    public GsubLookupType6(OpenTypeFontTableReader openReader, int lookupFlag, int[] subTableLocations) throws IOException {
        super(openReader, lookupFlag, subTableLocations);
    }

    @Override // com.itextpdf.io.font.otf.GsubLookupType5
    protected void readSubTableFormat1(int subTableLocation) throws IOException {
        Map<Integer, List<ContextualSubstRule>> substMap = new HashMap<>();
        int coverageOffset = this.openReader.rf.readUnsignedShort();
        int chainSubRuleSetCount = this.openReader.rf.readUnsignedShort();
        int[] chainSubRuleSetOffsets = this.openReader.readUShortArray(chainSubRuleSetCount, subTableLocation);
        List<Integer> coverageGlyphIds = this.openReader.readCoverageFormat(subTableLocation + coverageOffset);
        for (int i = 0; i < chainSubRuleSetCount; i++) {
            this.openReader.rf.seek(chainSubRuleSetOffsets[i]);
            int chainSubRuleCount = this.openReader.rf.readUnsignedShort();
            int[] chainSubRuleOffsets = this.openReader.readUShortArray(chainSubRuleCount, chainSubRuleSetOffsets[i]);
            List<ContextualSubstRule> chainSubRuleSet = new ArrayList<>(chainSubRuleCount);
            int j = 0;
            while (j < chainSubRuleCount) {
                this.openReader.rf.seek(chainSubRuleOffsets[j]);
                int backtrackGlyphCount = this.openReader.rf.readUnsignedShort();
                int[] backtrackGlyphIds = this.openReader.readUShortArray(backtrackGlyphCount);
                int inputGlyphCount = this.openReader.rf.readUnsignedShort();
                int[] inputGlyphIds = this.openReader.readUShortArray(inputGlyphCount - 1);
                int lookAheadGlyphCount = this.openReader.rf.readUnsignedShort();
                int coverageOffset2 = coverageOffset;
                int[] lookAheadGlyphIds = this.openReader.readUShortArray(lookAheadGlyphCount);
                int chainSubRuleSetCount2 = chainSubRuleSetCount;
                int substCount = this.openReader.rf.readUnsignedShort();
                int[] chainSubRuleSetOffsets2 = chainSubRuleSetOffsets;
                SubstLookupRecord[] substLookupRecords = this.openReader.readSubstLookupRecords(substCount);
                chainSubRuleSet.add(new SubTableLookup6Format1.SubstRuleFormat1(backtrackGlyphIds, inputGlyphIds, lookAheadGlyphIds, substLookupRecords));
                j++;
                coverageOffset = coverageOffset2;
                chainSubRuleSetCount = chainSubRuleSetCount2;
                chainSubRuleSetOffsets = chainSubRuleSetOffsets2;
            }
            substMap.put(coverageGlyphIds.get(i), chainSubRuleSet);
        }
        this.subTables.add(new SubTableLookup6Format1(this.openReader, this.lookupFlag, substMap));
    }

    @Override // com.itextpdf.io.font.otf.GsubLookupType5
    protected void readSubTableFormat2(int subTableLocation) throws IOException {
        int coverageOffset;
        int coverageOffset2 = this.openReader.rf.readUnsignedShort();
        int backtrackClassDefOffset = this.openReader.rf.readUnsignedShort();
        int inputClassDefOffset = this.openReader.rf.readUnsignedShort();
        int lookaheadClassDefOffset = this.openReader.rf.readUnsignedShort();
        int chainSubClassSetCount = this.openReader.rf.readUnsignedShort();
        int[] chainSubClassSetOffsets = this.openReader.readUShortArray(chainSubClassSetCount, subTableLocation);
        Set<Integer> coverageGlyphIds = new HashSet<>(this.openReader.readCoverageFormat(subTableLocation + coverageOffset2));
        OtfClass backtrackClassDefinition = this.openReader.readClassDefinition(subTableLocation + backtrackClassDefOffset);
        OtfClass inputClassDefinition = this.openReader.readClassDefinition(subTableLocation + inputClassDefOffset);
        OtfClass lookaheadClassDefinition = this.openReader.readClassDefinition(subTableLocation + lookaheadClassDefOffset);
        SubTableLookup6Format2 t = new SubTableLookup6Format2(this.openReader, this.lookupFlag, coverageGlyphIds, backtrackClassDefinition, inputClassDefinition, lookaheadClassDefinition);
        List<List<ContextualSubstRule>> subClassSets = new ArrayList<>(chainSubClassSetCount);
        int i = 0;
        while (i < chainSubClassSetCount) {
            List<ContextualSubstRule> subClassSet = null;
            if (chainSubClassSetOffsets[i] == 0) {
                coverageOffset = coverageOffset2;
            } else {
                coverageOffset = coverageOffset2;
                this.openReader.rf.seek(chainSubClassSetOffsets[i]);
                int chainSubClassRuleCount = this.openReader.rf.readUnsignedShort();
                int[] chainSubClassRuleOffsets = this.openReader.readUShortArray(chainSubClassRuleCount, chainSubClassSetOffsets[i]);
                subClassSet = new ArrayList<>(chainSubClassRuleCount);
                int j = 0;
                while (j < chainSubClassRuleCount) {
                    int chainSubClassRuleCount2 = chainSubClassRuleCount;
                    int[] chainSubClassRuleOffsets2 = chainSubClassRuleOffsets;
                    this.openReader.rf.seek(chainSubClassRuleOffsets[j]);
                    int backtrackClassCount = this.openReader.rf.readUnsignedShort();
                    int[] backtrackClassIds = this.openReader.readUShortArray(backtrackClassCount);
                    int inputClassCount = this.openReader.rf.readUnsignedShort();
                    int backtrackClassCount2 = inputClassCount - 1;
                    int[] inputClassIds = this.openReader.readUShortArray(backtrackClassCount2);
                    int lookAheadClassCount = this.openReader.rf.readUnsignedShort();
                    int[] lookAheadClassIds = this.openReader.readUShortArray(lookAheadClassCount);
                    int substCount = this.openReader.rf.readUnsignedShort();
                    SubstLookupRecord[] substLookupRecords = this.openReader.readSubstLookupRecords(substCount);
                    SubTableLookup6Format2.SubstRuleFormat2 rule = new SubTableLookup6Format2.SubstRuleFormat2(t, backtrackClassIds, inputClassIds, lookAheadClassIds, substLookupRecords);
                    subClassSet.add(rule);
                    j++;
                    t = t;
                    chainSubClassRuleCount = chainSubClassRuleCount2;
                    chainSubClassRuleOffsets = chainSubClassRuleOffsets2;
                }
            }
            subClassSets.add(subClassSet);
            i++;
            t = t;
            coverageOffset2 = coverageOffset;
        }
        SubTableLookup6Format2 t2 = t;
        t2.setSubClassSets(subClassSets);
        this.subTables.add(t2);
    }

    @Override // com.itextpdf.io.font.otf.GsubLookupType5
    protected void readSubTableFormat3(int subTableLocation) throws IOException {
        int backtrackGlyphCount = this.openReader.rf.readUnsignedShort();
        int[] backtrackCoverageOffsets = this.openReader.readUShortArray(backtrackGlyphCount, subTableLocation);
        int inputGlyphCount = this.openReader.rf.readUnsignedShort();
        int[] inputCoverageOffsets = this.openReader.readUShortArray(inputGlyphCount, subTableLocation);
        int lookaheadGlyphCount = this.openReader.rf.readUnsignedShort();
        int[] lookaheadCoverageOffsets = this.openReader.readUShortArray(lookaheadGlyphCount, subTableLocation);
        int substCount = this.openReader.rf.readUnsignedShort();
        SubstLookupRecord[] substLookupRecords = this.openReader.readSubstLookupRecords(substCount);
        List<Set<Integer>> backtrackCoverages = new ArrayList<>(backtrackGlyphCount);
        this.openReader.readCoverages(backtrackCoverageOffsets, backtrackCoverages);
        List<Set<Integer>> inputCoverages = new ArrayList<>(inputGlyphCount);
        this.openReader.readCoverages(inputCoverageOffsets, inputCoverages);
        List<Set<Integer>> lookaheadCoverages = new ArrayList<>(lookaheadGlyphCount);
        this.openReader.readCoverages(lookaheadCoverageOffsets, lookaheadCoverages);
        SubTableLookup6Format3.SubstRuleFormat3 rule = new SubTableLookup6Format3.SubstRuleFormat3(backtrackCoverages, inputCoverages, lookaheadCoverages, substLookupRecords);
        this.subTables.add(new SubTableLookup6Format3(this.openReader, this.lookupFlag, rule));
    }
}
