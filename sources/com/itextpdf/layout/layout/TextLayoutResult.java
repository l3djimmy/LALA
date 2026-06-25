package com.itextpdf.layout.layout;

import com.itextpdf.layout.renderer.IRenderer;
/* loaded from: classes12.dex */
public class TextLayoutResult extends MinMaxWidthLayoutResult {
    protected boolean containsPossibleBreak;
    protected boolean endsWithSplitCharacter;
    protected float leftMinWidth;
    protected float rightMinWidth;
    protected boolean splitForcedByNewline;
    protected boolean startsWithSplitCharacterWhiteSpace;
    protected boolean wordHasBeenSplit;

    public TextLayoutResult(int status, LayoutArea occupiedArea, IRenderer splitRenderer, IRenderer overflowRenderer) {
        super(status, occupiedArea, splitRenderer, overflowRenderer);
        this.containsPossibleBreak = false;
        this.startsWithSplitCharacterWhiteSpace = false;
        this.endsWithSplitCharacter = false;
    }

    public TextLayoutResult(int status, LayoutArea occupiedArea, IRenderer splitRenderer, IRenderer overflowRenderer, IRenderer cause) {
        super(status, occupiedArea, splitRenderer, overflowRenderer, cause);
        this.containsPossibleBreak = false;
        this.startsWithSplitCharacterWhiteSpace = false;
        this.endsWithSplitCharacter = false;
    }

    public boolean isWordHasBeenSplit() {
        return this.wordHasBeenSplit;
    }

    public TextLayoutResult setWordHasBeenSplit(boolean wordHasBeenSplit) {
        this.wordHasBeenSplit = wordHasBeenSplit;
        return this;
    }

    public boolean isSplitForcedByNewline() {
        return this.splitForcedByNewline;
    }

    public TextLayoutResult setSplitForcedByNewline(boolean isSplitForcedByNewline) {
        this.splitForcedByNewline = isSplitForcedByNewline;
        return this;
    }

    public boolean isContainsPossibleBreak() {
        return this.containsPossibleBreak;
    }

    public TextLayoutResult setContainsPossibleBreak(boolean containsPossibleBreak) {
        this.containsPossibleBreak = containsPossibleBreak;
        return this;
    }

    public TextLayoutResult setStartsWithSplitCharacterWhiteSpace(boolean startsWithSplitCharacterWhiteSpace) {
        this.startsWithSplitCharacterWhiteSpace = startsWithSplitCharacterWhiteSpace;
        return this;
    }

    public boolean isStartsWithSplitCharacterWhiteSpace() {
        return this.startsWithSplitCharacterWhiteSpace;
    }

    public TextLayoutResult setEndsWithSplitCharacter(boolean endsWithSplitCharacter) {
        this.endsWithSplitCharacter = endsWithSplitCharacter;
        return this;
    }

    public boolean isEndsWithSplitCharacter() {
        return this.endsWithSplitCharacter;
    }

    public TextLayoutResult setLeftMinWidth(float leftMinWidth) {
        this.leftMinWidth = leftMinWidth;
        return this;
    }

    public float getLeftMinWidth() {
        return this.leftMinWidth;
    }

    public TextLayoutResult setRightMinWidth(float rightMinWidth) {
        this.rightMinWidth = rightMinWidth;
        return this;
    }

    public float getRightMinWidth() {
        return this.rightMinWidth;
    }
}
