package com.itextpdf.io.font.otf.lookuptype8;

import com.itextpdf.io.font.otf.ChainingContextualTable;
import com.itextpdf.io.font.otf.ContextualPositionRule;
import com.itextpdf.io.font.otf.OpenTypeFontTableReader;
import com.itextpdf.io.font.otf.OtfClass;
import com.itextpdf.io.font.otf.PosLookupRecord;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
/* loaded from: classes12.dex */
public class PosTableLookup8Format2 extends ChainingContextualTable<ContextualPositionRule> {
    private OtfClass backtrackClassDefinition;
    private OtfClass inputClassDefinition;
    private OtfClass lookaheadClassDefinition;
    private List<List<ContextualPositionRule>> posClassSets;
    private Set<Integer> posCoverageGlyphIds;

    public PosTableLookup8Format2(OpenTypeFontTableReader openReader, int lookupFlag, Set<Integer> posCoverageGlyphIds, OtfClass backtrackClassDefinition, OtfClass inputClassDefinition, OtfClass lookaheadClassDefinition) {
        super(openReader, lookupFlag);
        this.posCoverageGlyphIds = posCoverageGlyphIds;
        this.backtrackClassDefinition = backtrackClassDefinition;
        this.inputClassDefinition = inputClassDefinition;
        this.lookaheadClassDefinition = lookaheadClassDefinition;
        this.posClassSets = new ArrayList();
    }

    public void addPosClassSet(List<ContextualPositionRule> posClassSet) {
        for (ContextualPositionRule rule : posClassSet) {
            if (((PosRuleFormat2) rule).getPosTable() != this) {
                throw new IllegalArgumentException("Position class set is invalid. Position rule refers to another table");
            }
        }
        this.posClassSets.add(posClassSet);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.io.font.otf.ContextualTable
    public List<ContextualPositionRule> getSetOfRulesForStartGlyph(int startId) {
        if (this.posCoverageGlyphIds.contains(Integer.valueOf(startId)) && !this.openReader.isSkip(startId, this.lookupFlag)) {
            int gClass = this.inputClassDefinition.getOtfClass(startId);
            return this.posClassSets.get(gClass);
        }
        return Collections.emptyList();
    }

    /* loaded from: classes12.dex */
    public static class PosRuleFormat2 extends ContextualPositionRule {
        private static final long serialVersionUID = 8583758144617770335L;
        private int[] backtrackClassIds;
        private int[] inputClassIds;
        private int[] lookAheadClassIds;
        private PosLookupRecord[] posLookupRecords;
        private PosTableLookup8Format2 posTable;

        public PosRuleFormat2(PosTableLookup8Format2 posTable, int[] backtrackClassIds, int[] inputClassIds, int[] lookAheadClassIds, PosLookupRecord[] posLookupRecords) {
            this.posTable = posTable;
            this.backtrackClassIds = backtrackClassIds;
            this.inputClassIds = inputClassIds;
            this.lookAheadClassIds = lookAheadClassIds;
            this.posLookupRecords = posLookupRecords;
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

        @Override // com.itextpdf.io.font.otf.ContextualPositionRule
        public PosLookupRecord[] getPosLookupRecords() {
            return this.posLookupRecords;
        }

        @Override // com.itextpdf.io.font.otf.ContextualRule
        public boolean isGlyphMatchesInput(int glyphId, int atIdx) {
            return this.posTable.inputClassDefinition.getOtfClass(glyphId) == this.inputClassIds[atIdx + (-1)];
        }

        @Override // com.itextpdf.io.font.otf.ContextualRule
        public boolean isGlyphMatchesLookahead(int glyphId, int atIdx) {
            return this.posTable.lookaheadClassDefinition.getOtfClass(glyphId) == this.lookAheadClassIds[atIdx];
        }

        @Override // com.itextpdf.io.font.otf.ContextualRule
        public boolean isGlyphMatchesBacktrack(int glyphId, int atIdx) {
            return this.posTable.backtrackClassDefinition.getOtfClass(glyphId) == this.backtrackClassIds[atIdx];
        }

        public PosTableLookup8Format2 getPosTable() {
            return this.posTable;
        }
    }
}
