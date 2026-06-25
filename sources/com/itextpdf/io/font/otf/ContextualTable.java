package com.itextpdf.io.font.otf;

import com.itextpdf.io.font.otf.ContextualRule;
import com.itextpdf.io.font.otf.OpenTableLookup;
import java.util.List;
/* loaded from: classes12.dex */
public abstract class ContextualTable<T extends ContextualRule> {
    protected int lookupFlag;
    protected OpenTypeFontTableReader openReader;

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract List<T> getSetOfRulesForStartGlyph(int i);

    /* JADX INFO: Access modifiers changed from: protected */
    public ContextualTable(OpenTypeFontTableReader openReader, int lookupFlag) {
        this.openReader = openReader;
        this.lookupFlag = lookupFlag;
    }

    public T getMatchingContextRule(GlyphLine line) {
        if (line.idx >= line.end) {
            return null;
        }
        Glyph g = line.get(line.idx);
        List<T> rules = getSetOfRulesForStartGlyph(g.getCode());
        for (T rule : rules) {
            int lastGlyphIndex = checkIfContextMatch(line, rule);
            if (lastGlyphIndex != -1) {
                line.start = line.idx;
                line.end = lastGlyphIndex + 1;
                return rule;
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public int checkIfContextMatch(GlyphLine line, T rule) {
        OpenTableLookup.GlyphIndexer gidx = new OpenTableLookup.GlyphIndexer();
        gidx.line = line;
        gidx.idx = line.idx;
        int j = 1;
        while (j < rule.getContextLength()) {
            gidx.nextGlyph(this.openReader, this.lookupFlag);
            if (gidx.glyph == null || !rule.isGlyphMatchesInput(gidx.glyph.getCode(), j)) {
                break;
            }
            j++;
        }
        boolean isMatch = j == rule.getContextLength();
        if (isMatch) {
            return gidx.idx;
        }
        return -1;
    }
}
