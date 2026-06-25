package com.itextpdf.io.font.otf.lookuptype6;

import com.itextpdf.io.font.otf.ChainingContextualTable;
import com.itextpdf.io.font.otf.ContextualSubstRule;
import com.itextpdf.io.font.otf.OpenTypeFontTableReader;
import com.itextpdf.io.font.otf.SubstLookupRecord;
import java.util.Collections;
import java.util.List;
import java.util.Map;
/* loaded from: classes12.dex */
public class SubTableLookup6Format1 extends ChainingContextualTable<ContextualSubstRule> {
    private Map<Integer, List<ContextualSubstRule>> substMap;

    public SubTableLookup6Format1(OpenTypeFontTableReader openReader, int lookupFlag, Map<Integer, List<ContextualSubstRule>> substMap) {
        super(openReader, lookupFlag);
        this.substMap = substMap;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.io.font.otf.ContextualTable
    public List<ContextualSubstRule> getSetOfRulesForStartGlyph(int startGlyphId) {
        if (this.substMap.containsKey(Integer.valueOf(startGlyphId)) && !this.openReader.isSkip(startGlyphId, this.lookupFlag)) {
            return this.substMap.get(Integer.valueOf(startGlyphId));
        }
        return Collections.emptyList();
    }

    /* loaded from: classes12.dex */
    public static class SubstRuleFormat1 extends ContextualSubstRule {
        private int[] backtrackGlyphIds;
        private int[] inputGlyphIds;
        private int[] lookAheadGlyphIds;
        private SubstLookupRecord[] substLookupRecords;

        public SubstRuleFormat1(int[] backtrackGlyphIds, int[] inputGlyphIds, int[] lookAheadGlyphIds, SubstLookupRecord[] substLookupRecords) {
            this.backtrackGlyphIds = backtrackGlyphIds;
            this.inputGlyphIds = inputGlyphIds;
            this.lookAheadGlyphIds = lookAheadGlyphIds;
            this.substLookupRecords = substLookupRecords;
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

        @Override // com.itextpdf.io.font.otf.ContextualSubstRule
        public SubstLookupRecord[] getSubstLookupRecords() {
            return this.substLookupRecords;
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
