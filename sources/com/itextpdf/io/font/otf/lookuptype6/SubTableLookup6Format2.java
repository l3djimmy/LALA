package com.itextpdf.io.font.otf.lookuptype6;

import com.itextpdf.io.font.otf.ChainingContextualTable;
import com.itextpdf.io.font.otf.ContextualSubstRule;
import com.itextpdf.io.font.otf.OpenTypeFontTableReader;
import com.itextpdf.io.font.otf.OtfClass;
import com.itextpdf.io.font.otf.SubstLookupRecord;
import java.util.Collections;
import java.util.List;
import java.util.Set;
/* loaded from: classes12.dex */
public class SubTableLookup6Format2 extends ChainingContextualTable<ContextualSubstRule> {
    private OtfClass backtrackClassDefinition;
    private OtfClass inputClassDefinition;
    private OtfClass lookaheadClassDefinition;
    private List<List<ContextualSubstRule>> subClassSets;
    private Set<Integer> substCoverageGlyphIds;

    public SubTableLookup6Format2(OpenTypeFontTableReader openReader, int lookupFlag, Set<Integer> substCoverageGlyphIds, OtfClass backtrackClassDefinition, OtfClass inputClassDefinition, OtfClass lookaheadClassDefinition) {
        super(openReader, lookupFlag);
        this.substCoverageGlyphIds = substCoverageGlyphIds;
        this.backtrackClassDefinition = backtrackClassDefinition;
        this.inputClassDefinition = inputClassDefinition;
        this.lookaheadClassDefinition = lookaheadClassDefinition;
    }

    public void setSubClassSets(List<List<ContextualSubstRule>> subClassSets) {
        this.subClassSets = subClassSets;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.io.font.otf.ContextualTable
    public List<ContextualSubstRule> getSetOfRulesForStartGlyph(int startId) {
        if (this.substCoverageGlyphIds.contains(Integer.valueOf(startId)) && !this.openReader.isSkip(startId, this.lookupFlag)) {
            int gClass = this.inputClassDefinition.getOtfClass(startId);
            return this.subClassSets.get(gClass);
        }
        return Collections.emptyList();
    }

    /* loaded from: classes12.dex */
    public static class SubstRuleFormat2 extends ContextualSubstRule {
        private int[] backtrackClassIds;
        private int[] inputClassIds;
        private int[] lookAheadClassIds;
        private SubTableLookup6Format2 subTable;
        private SubstLookupRecord[] substLookupRecords;

        public SubstRuleFormat2(SubTableLookup6Format2 subTable, int[] backtrackClassIds, int[] inputClassIds, int[] lookAheadClassIds, SubstLookupRecord[] substLookupRecords) {
            this.subTable = subTable;
            this.backtrackClassIds = backtrackClassIds;
            this.inputClassIds = inputClassIds;
            this.lookAheadClassIds = lookAheadClassIds;
            this.substLookupRecords = substLookupRecords;
        }

        @Override // com.itextpdf.io.font.otf.ContextualRule
        public int getContextLength() {
            return this.inputClassIds.length + 1;
        }

        @Override // com.itextpdf.io.font.otf.ContextualRule
        public int getLookaheadContextLength() {
            return this.lookAheadClassIds.length;
        }

        @Override // com.itextpdf.io.font.otf.ContextualRule
        public int getBacktrackContextLength() {
            return this.backtrackClassIds.length;
        }

        @Override // com.itextpdf.io.font.otf.ContextualSubstRule
        public SubstLookupRecord[] getSubstLookupRecords() {
            return this.substLookupRecords;
        }

        @Override // com.itextpdf.io.font.otf.ContextualRule
        public boolean isGlyphMatchesInput(int glyphId, int atIdx) {
            return this.subTable.inputClassDefinition.getOtfClass(glyphId) == this.inputClassIds[atIdx + (-1)];
        }

        @Override // com.itextpdf.io.font.otf.ContextualRule
        public boolean isGlyphMatchesLookahead(int glyphId, int atIdx) {
            return this.subTable.lookaheadClassDefinition.getOtfClass(glyphId) == this.lookAheadClassIds[atIdx];
        }

        @Override // com.itextpdf.io.font.otf.ContextualRule
        public boolean isGlyphMatchesBacktrack(int glyphId, int atIdx) {
            return this.subTable.backtrackClassDefinition.getOtfClass(glyphId) == this.backtrackClassIds[atIdx];
        }
    }
}
