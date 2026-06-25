package com.itextpdf.io.font.otf.lookuptype8;

import com.itextpdf.io.font.otf.ChainingContextualTable;
import com.itextpdf.io.font.otf.ContextualPositionRule;
import com.itextpdf.io.font.otf.OpenTypeFontTableReader;
import com.itextpdf.io.font.otf.PosLookupRecord;
import java.util.Collections;
import java.util.List;
import java.util.Map;
/* loaded from: classes12.dex */
public class PosTableLookup8Format1 extends ChainingContextualTable<ContextualPositionRule> {
    private Map<Integer, List<ContextualPositionRule>> posMap;

    public PosTableLookup8Format1(OpenTypeFontTableReader openReader, int lookupFlag, Map<Integer, List<ContextualPositionRule>> posMap) {
        super(openReader, lookupFlag);
        this.posMap = posMap;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.io.font.otf.ContextualTable
    public List<ContextualPositionRule> getSetOfRulesForStartGlyph(int startGlyphId) {
        if (this.posMap.containsKey(Integer.valueOf(startGlyphId)) && !this.openReader.isSkip(startGlyphId, this.lookupFlag)) {
            return this.posMap.get(Integer.valueOf(startGlyphId));
        }
        return Collections.emptyList();
    }

    /* loaded from: classes12.dex */
    public static class PosRuleFormat1 extends ContextualPositionRule {
        private static final long serialVersionUID = 2777822503157518715L;
        private int[] backtrackGlyphIds;
        private int[] inputGlyphIds;
        private int[] lookAheadGlyphIds;
        private PosLookupRecord[] posLookupRecords;

        public PosRuleFormat1(int[] backtrackGlyphIds, int[] inputGlyphIds, int[] lookAheadGlyphIds, PosLookupRecord[] posLookupRecords) {
            this.backtrackGlyphIds = backtrackGlyphIds;
            this.inputGlyphIds = inputGlyphIds;
            this.lookAheadGlyphIds = lookAheadGlyphIds;
            this.posLookupRecords = posLookupRecords;
        }

        @Override // com.itextpdf.io.font.otf.ContextualRule
        public int getContextLength() {
            return this.inputGlyphIds.length + 1;
        }

        @Override // com.itextpdf.io.font.otf.ContextualRule
        public int getLookaheadContextLength() {
            return this.lookAheadGlyphIds.length;
        }

        @Override // com.itextpdf.io.font.otf.ContextualRule
        public int getBacktrackContextLength() {
            return this.backtrackGlyphIds.length;
        }

        @Override // com.itextpdf.io.font.otf.ContextualPositionRule
        public PosLookupRecord[] getPosLookupRecords() {
            return this.posLookupRecords;
        }

        @Override // com.itextpdf.io.font.otf.ContextualRule
        public boolean isGlyphMatchesInput(int glyphId, int atIdx) {
            return glyphId == this.inputGlyphIds[atIdx + (-1)];
        }

        @Override // com.itextpdf.io.font.otf.ContextualRule
        public boolean isGlyphMatchesLookahead(int glyphId, int atIdx) {
            return glyphId == this.lookAheadGlyphIds[atIdx];
        }

        @Override // com.itextpdf.io.font.otf.ContextualRule
        public boolean isGlyphMatchesBacktrack(int glyphId, int atIdx) {
            return glyphId == this.backtrackGlyphIds[atIdx];
        }
    }
}
