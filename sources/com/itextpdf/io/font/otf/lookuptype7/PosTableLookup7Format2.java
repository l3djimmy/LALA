package com.itextpdf.io.font.otf.lookuptype7;

import com.itextpdf.io.font.otf.ContextualPositionRule;
import com.itextpdf.io.font.otf.ContextualTable;
import com.itextpdf.io.font.otf.OpenTypeFontTableReader;
import com.itextpdf.io.font.otf.OtfClass;
import com.itextpdf.io.font.otf.PosLookupRecord;
import java.util.Collections;
import java.util.List;
import java.util.Set;
/* loaded from: classes12.dex */
public class PosTableLookup7Format2 extends ContextualTable<ContextualPositionRule> {
    private OtfClass classDefinition;
    private Set<Integer> posCoverageGlyphIds;
    private List<List<ContextualPositionRule>> subClassSets;

    public PosTableLookup7Format2(OpenTypeFontTableReader openReader, int lookupFlag, Set<Integer> posCoverageGlyphIds, OtfClass classDefinition) {
        super(openReader, lookupFlag);
        this.posCoverageGlyphIds = posCoverageGlyphIds;
        this.classDefinition = classDefinition;
    }

    public void setPosClassSets(List<List<ContextualPositionRule>> subClassSets) {
        this.subClassSets = subClassSets;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.io.font.otf.ContextualTable
    public List<ContextualPositionRule> getSetOfRulesForStartGlyph(int startId) {
        if (this.posCoverageGlyphIds.contains(Integer.valueOf(startId)) && !this.openReader.isSkip(startId, this.lookupFlag)) {
            int gClass = this.classDefinition.getOtfClass(startId);
            return this.subClassSets.get(gClass);
        }
        return Collections.emptyList();
    }

    /* loaded from: classes12.dex */
    public static class PosRuleFormat2 extends ContextualPositionRule {
        private OtfClass classDefinition;
        private int[] inputClassIds;
        private PosLookupRecord[] posLookupRecords;

        public PosRuleFormat2(PosTableLookup7Format2 subTable, int[] inputClassIds, PosLookupRecord[] posLookupRecords) {
            this.inputClassIds = inputClassIds;
            this.posLookupRecords = posLookupRecords;
            this.classDefinition = subTable.classDefinition;
        }

        @Override // com.itextpdf.io.font.otf.ContextualRule
        public int getContextLength() {
            return this.inputClassIds.length + 1;
        }

        @Override // com.itextpdf.io.font.otf.ContextualPositionRule
        public PosLookupRecord[] getPosLookupRecords() {
            return this.posLookupRecords;
        }

        @Override // com.itextpdf.io.font.otf.ContextualRule
        public boolean isGlyphMatchesInput(int glyphId, int atIdx) {
            return this.classDefinition.getOtfClass(glyphId) == this.inputClassIds[atIdx + (-1)];
        }
    }
}
