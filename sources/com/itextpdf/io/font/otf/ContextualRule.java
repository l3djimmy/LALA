package com.itextpdf.io.font.otf;
/* loaded from: classes12.dex */
public abstract class ContextualRule {
    public abstract int getContextLength();

    public abstract boolean isGlyphMatchesInput(int i, int i2);

    public int getLookaheadContextLength() {
        return 0;
    }

    public int getBacktrackContextLength() {
        return 0;
    }

    public boolean isGlyphMatchesLookahead(int glyphId, int atIdx) {
        return false;
    }

    public boolean isGlyphMatchesBacktrack(int glyphId, int atIdx) {
        return false;
    }
}
