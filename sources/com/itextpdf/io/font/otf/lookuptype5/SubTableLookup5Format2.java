package com.itextpdf.io.font.otf.lookuptype5;

import com.itextpdf.io.font.otf.ContextualSubstRule;
import com.itextpdf.io.font.otf.ContextualTable;
import com.itextpdf.io.font.otf.OpenTypeFontTableReader;
import com.itextpdf.io.font.otf.OtfClass;
import com.itextpdf.io.font.otf.SubstLookupRecord;
import java.util.Collections;
import java.util.List;
import java.util.Set;
/* loaded from: classes12.dex */
public class SubTableLookup5Format2 extends ContextualTable<ContextualSubstRule> {
    private OtfClass classDefinition;
    private List<List<ContextualSubstRule>> subClassSets;
    private Set<Integer> substCoverageGlyphIds;

    public SubTableLookup5Format2(OpenTypeFontTableReader openReader, int lookupFlag, Set<Integer> substCoverageGlyphIds, OtfClass classDefinition) {
        super(openReader, lookupFlag);
        this.substCoverageGlyphIds = substCoverageGlyphIds;
        this.classDefinition = classDefinition;
    }

    public void setSubClassSets(List<List<ContextualSubstRule>> subClassSets) {
        this.subClassSets = subClassSets;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.io.font.otf.ContextualTable
    public List<ContextualSubstRule> getSetOfRulesForStartGlyph(int startId) {
        if (this.substCoverageGlyphIds.contains(Integer.valueOf(startId)) && !this.openReader.isSkip(startId, this.lookupFlag)) {
            int gClass = this.classDefinition.getOtfClass(startId);
            return this.subClassSets.get(gClass);
        }
        return Collections.emptyList();
    }

    /* loaded from: classes12.dex */
    public static class SubstRuleFormat2 extends ContextualSubstRule {
        private OtfClass classDefinition;
        private int[] inputClassIds;
        private SubstLookupRecord[] substLookupRecords;

        public SubstRuleFormat2(SubTableLookup5Format2 subTable, int[] inputClassIds, SubstLookupRecord[] substLookupRecords) {
            this.inputClassIds = inputClassIds;
            this.substLookupRecords = substLookupRecords;
            this.classDefinition = subTable.classDefinition;
        }

        @Override // com.itextpdf.io.font.otf.ContextualRule
        public int getContextLength() {
            return this.inputClassIds.length + 1;
        }

        @Override // com.itextpdf.io.font.otf.ContextualSubstRule
        public SubstLookupRecord[] getSubstLookupRecords() {
            return this.substLookupRecords;
        }

        @Override // com.itextpdf.io.font.otf.ContextualRule
        public boolean isGlyphMatchesInput(int glyphId, int atIdx) {
            return this.classDefinition.getOtfClass(glyphId) == this.inputClassIds[atIdx + (-1)];
        }
    }
}
