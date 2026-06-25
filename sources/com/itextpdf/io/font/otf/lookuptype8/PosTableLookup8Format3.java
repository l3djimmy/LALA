package com.itextpdf.io.font.otf.lookuptype8;

import com.itextpdf.io.font.otf.ChainingContextualTable;
import com.itextpdf.io.font.otf.ContextualPositionRule;
import com.itextpdf.io.font.otf.OpenTypeFontTableReader;
import com.itextpdf.io.font.otf.PosLookupRecord;
import java.util.Collections;
import java.util.List;
import java.util.Set;
/* loaded from: classes12.dex */
public class PosTableLookup8Format3 extends ChainingContextualTable<ContextualPositionRule> {
    private PosRuleFormat3 posRule;

    public PosTableLookup8Format3(OpenTypeFontTableReader openReader, int lookupFlag, PosRuleFormat3 rule) {
        super(openReader, lookupFlag);
        this.posRule = rule;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.io.font.otf.ContextualTable
    public List<ContextualPositionRule> getSetOfRulesForStartGlyph(int startId) {
        PosRuleFormat3 ruleFormat3 = this.posRule;
        if (ruleFormat3.getInputCoverage(0).contains(Integer.valueOf(startId)) && !this.openReader.isSkip(startId, this.lookupFlag)) {
            return Collections.singletonList(this.posRule);
        }
        return Collections.emptyList();
    }

    /* loaded from: classes12.dex */
    public static class PosRuleFormat3 extends ContextualPositionRule {
        private List<Set<Integer>> backtrackCoverages;
        private List<Set<Integer>> inputCoverages;
        private List<Set<Integer>> lookaheadCoverages;
        private PosLookupRecord[] posLookupRecords;

        public PosRuleFormat3(List<Set<Integer>> backtrackCoverages, List<Set<Integer>> inputCoverages, List<Set<Integer>> lookaheadCoverages, PosLookupRecord[] posLookupRecords) {
            this.backtrackCoverages = backtrackCoverages;
            this.inputCoverages = inputCoverages;
            this.lookaheadCoverages = lookaheadCoverages;
            this.posLookupRecords = posLookupRecords;
        }

        @Override // com.itextpdf.io.font.otf.ContextualPositionRule
        public PosLookupRecord[] getPosLookupRecords() {
            return this.posLookupRecords;
        }

        @Override // com.itextpdf.io.font.otf.ContextualRule
        public int getContextLength() {
            return this.inputCoverages.size();
        }

        public Set<Integer> getInputCoverage(int idx) {
            return this.inputCoverages.get(idx);
        }

        @Override // com.itextpdf.io.font.otf.ContextualRule
        public boolean isGlyphMatchesInput(int glyphId, int atIdx) {
            return getInputCoverage(atIdx).contains(Integer.valueOf(glyphId));
        }

        @Override // com.itextpdf.io.font.otf.ContextualRule
        public int getLookaheadContextLength() {
            return this.lookaheadCoverages.size();
        }

        @Override // com.itextpdf.io.font.otf.ContextualRule
        public boolean isGlyphMatchesLookahead(int glyphId, int atIdx) {
            return this.lookaheadCoverages.get(atIdx).contains(Integer.valueOf(glyphId));
        }

        @Override // com.itextpdf.io.font.otf.ContextualRule
        public int getBacktrackContextLength() {
            return this.backtrackCoverages.size();
        }

        @Override // com.itextpdf.io.font.otf.ContextualRule
        public boolean isGlyphMatchesBacktrack(int glyphId, int atIdx) {
            return this.backtrackCoverages.get(atIdx).contains(Integer.valueOf(glyphId));
        }
    }
}
