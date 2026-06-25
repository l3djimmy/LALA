.class public Lcom/itextpdf/layout/layout/TextLayoutResult;
.super Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;
.source "TextLayoutResult.java"


# instance fields
.field protected containsPossibleBreak:Z

.field protected endsWithSplitCharacter:Z

.field protected leftMinWidth:F

.field protected rightMinWidth:F

.field protected splitForcedByNewline:Z

.field protected startsWithSplitCharacterWhiteSpace:Z

.field protected wordHasBeenSplit:Z


# direct methods
.method public constructor <init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V
    .locals 1
    .param p1, "status"    # I
    .param p2, "occupiedArea"    # Lcom/itextpdf/layout/layout/LayoutArea;
    .param p3, "splitRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p4, "overflowRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 61
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 41
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/layout/layout/TextLayoutResult;->containsPossibleBreak:Z

    .line 43
    iput-boolean v0, p0, Lcom/itextpdf/layout/layout/TextLayoutResult;->startsWithSplitCharacterWhiteSpace:Z

    .line 45
    iput-boolean v0, p0, Lcom/itextpdf/layout/layout/TextLayoutResult;->endsWithSplitCharacter:Z

    .line 62
    return-void
.end method

.method public constructor <init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V
    .locals 1
    .param p1, "status"    # I
    .param p2, "occupiedArea"    # Lcom/itextpdf/layout/layout/LayoutArea;
    .param p3, "splitRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p4, "overflowRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p5, "cause"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 74
    invoke-direct/range {p0 .. p5}, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 41
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/layout/layout/TextLayoutResult;->containsPossibleBreak:Z

    .line 43
    iput-boolean v0, p0, Lcom/itextpdf/layout/layout/TextLayoutResult;->startsWithSplitCharacterWhiteSpace:Z

    .line 45
    iput-boolean v0, p0, Lcom/itextpdf/layout/layout/TextLayoutResult;->endsWithSplitCharacter:Z

    .line 75
    return-void
.end method


# virtual methods
.method public getLeftMinWidth()F
    .locals 1

    .line 209
    iget v0, p0, Lcom/itextpdf/layout/layout/TextLayoutResult;->leftMinWidth:F

    return v0
.end method

.method public getRightMinWidth()F
    .locals 1

    .line 235
    iget v0, p0, Lcom/itextpdf/layout/layout/TextLayoutResult;->rightMinWidth:F

    return v0
.end method

.method public isContainsPossibleBreak()Z
    .locals 1

    .line 129
    iget-boolean v0, p0, Lcom/itextpdf/layout/layout/TextLayoutResult;->containsPossibleBreak:Z

    return v0
.end method

.method public isEndsWithSplitCharacter()Z
    .locals 1

    .line 185
    iget-boolean v0, p0, Lcom/itextpdf/layout/layout/TextLayoutResult;->endsWithSplitCharacter:Z

    return v0
.end method

.method public isSplitForcedByNewline()Z
    .locals 1

    .line 106
    iget-boolean v0, p0, Lcom/itextpdf/layout/layout/TextLayoutResult;->splitForcedByNewline:Z

    return v0
.end method

.method public isStartsWithSplitCharacterWhiteSpace()Z
    .locals 1

    .line 163
    iget-boolean v0, p0, Lcom/itextpdf/layout/layout/TextLayoutResult;->startsWithSplitCharacterWhiteSpace:Z

    return v0
.end method

.method public isWordHasBeenSplit()Z
    .locals 1

    .line 84
    iget-boolean v0, p0, Lcom/itextpdf/layout/layout/TextLayoutResult;->wordHasBeenSplit:Z

    return v0
.end method

.method public setContainsPossibleBreak(Z)Lcom/itextpdf/layout/layout/TextLayoutResult;
    .locals 0
    .param p1, "containsPossibleBreak"    # Z

    .line 140
    iput-boolean p1, p0, Lcom/itextpdf/layout/layout/TextLayoutResult;->containsPossibleBreak:Z

    .line 141
    return-object p0
.end method

.method public setEndsWithSplitCharacter(Z)Lcom/itextpdf/layout/layout/TextLayoutResult;
    .locals 0
    .param p1, "endsWithSplitCharacter"    # Z

    .line 174
    iput-boolean p1, p0, Lcom/itextpdf/layout/layout/TextLayoutResult;->endsWithSplitCharacter:Z

    .line 175
    return-object p0
.end method

.method public setLeftMinWidth(F)Lcom/itextpdf/layout/layout/TextLayoutResult;
    .locals 0
    .param p1, "leftMinWidth"    # F

    .line 197
    iput p1, p0, Lcom/itextpdf/layout/layout/TextLayoutResult;->leftMinWidth:F

    .line 198
    return-object p0
.end method

.method public setRightMinWidth(F)Lcom/itextpdf/layout/layout/TextLayoutResult;
    .locals 0
    .param p1, "rightMinWidth"    # F

    .line 222
    iput p1, p0, Lcom/itextpdf/layout/layout/TextLayoutResult;->rightMinWidth:F

    .line 223
    return-object p0
.end method

.method public setSplitForcedByNewline(Z)Lcom/itextpdf/layout/layout/TextLayoutResult;
    .locals 0
    .param p1, "isSplitForcedByNewline"    # Z

    .line 117
    iput-boolean p1, p0, Lcom/itextpdf/layout/layout/TextLayoutResult;->splitForcedByNewline:Z

    .line 118
    return-object p0
.end method

.method public setStartsWithSplitCharacterWhiteSpace(Z)Lcom/itextpdf/layout/layout/TextLayoutResult;
    .locals 0
    .param p1, "startsWithSplitCharacterWhiteSpace"    # Z

    .line 153
    iput-boolean p1, p0, Lcom/itextpdf/layout/layout/TextLayoutResult;->startsWithSplitCharacterWhiteSpace:Z

    .line 154
    return-object p0
.end method

.method public setWordHasBeenSplit(Z)Lcom/itextpdf/layout/layout/TextLayoutResult;
    .locals 0
    .param p1, "wordHasBeenSplit"    # Z

    .line 94
    iput-boolean p1, p0, Lcom/itextpdf/layout/layout/TextLayoutResult;->wordHasBeenSplit:Z

    .line 95
    return-object p0
.end method
