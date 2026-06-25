package com.itextpdf.io.font.otf;

import com.itextpdf.io.font.otf.ContextualRule;
import com.itextpdf.io.font.otf.OpenTableLookup;
import java.util.List;
/* loaded from: classes12.dex */
public abstract class ChainingContextualTable<T extends ContextualRule> extends ContextualTable<T> {
    /* JADX INFO: Access modifiers changed from: protected */
    public ChainingContextualTable(OpenTypeFontTableReader openReader, int lookupFlag) {
        super(openReader, lookupFlag);
    }

    @Override // com.itextpdf.io.font.otf.ContextualTable
    public T getMatchingContextRule(GlyphLine line) {
        if (line.idx >= line.end) {
            return null;
        }
        Glyph g = line.get(line.idx);
        List<T> rules = getSetOfRulesForStartGlyph(g.getCode());
        for (T rule : rules) {
            int lastGlyphIndex = checkIfContextMatch(line, rule);
            if (lastGlyphIndex != -1 && checkIfLookaheadContextMatch(line, rule, lastGlyphIndex) && checkIfBacktrackContextMatch(line, rule)) {
                line.start = line.idx;
                line.end = lastGlyphIndex + 1;
                return rule;
            }
        }
        return null;
    }

    protected boolean checkIfLookaheadContextMatch(GlyphLine line, T rule, int startIdx) {
        OpenTableLookup.GlyphIndexer gidx = new OpenTableLookup.GlyphIndexer();
        gidx.line = line;
        gidx.idx = startIdx;
        for (int j = 0; j < rule.getLookaheadContextLength(); j++) {
            gidx.nextGlyph(this.openReader, this.lookupFlag);
            if (gidx.glyph == null || !rule.isGlyphMatchesLookahead(gidx.glyph.getCode(), j)) {
                return false;
            }
        }
        return true;
    }

    protected boolean checkIfBacktrackContextMatch(GlyphLine line, T rule) {
        OpenTableLookup.GlyphIndexer gidx = new OpenTableLookup.GlyphIndexer();
        gidx.line = line;
        gidx.idx = line.idx;
        for (int j = 0; j < rule.getBacktrackContextLength(); j++) {
            gidx.previousGlyph(this.openReader, this.lookupFlag);
            if (gidx.glyph == null || !rule.isGlyphMatchesBacktrack(gidx.glyph.getCode(), j)) {
                return false;
            }
        }
        return true;
    }
}
