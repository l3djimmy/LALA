.class final Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping;
.super Ljava/lang/Object;
.source "TextSequenceWordWrapping.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingTextRendererSequenceInfo;,
        Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$LastFittingChildRendererData;,
        Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;,
        Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;
    }
.end annotation


# static fields
.field private static final OCCUPIED_AREA_RELAYOUT_EPS:F = 1.0E-4f


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    return-void
.end method

.method private static convertPossibleBreakPointsToGlyphLineBased(Ljava/util/List;Ljava/util/List;Ljava/util/List;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 658
    .local p0, "possibleBreakPoints":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local p1, "amountOfChars":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local p2, "indices":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 659
    const/4 v0, -0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 660
    return-object p0

    .line 662
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 664
    .local v0, "glyphLineBased":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 665
    .local v2, "j":I
    const/4 v3, 0x1

    invoke-static {p1, v2, v3}, Lcom/itextpdf/layout/renderer/TextRenderer;->findPossibleBreaksSplitPosition(Ljava/util/List;IZ)I

    move-result v3

    .line 666
    .local v3, "found":I
    if-ltz v3, :cond_1

    .line 667
    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 669
    .end local v2    # "j":I
    .end local v3    # "found":I
    :cond_1
    goto :goto_0

    .line 670
    :cond_2
    return-object v0
.end method

.method static distributePossibleBreakPointsOverSequentialTextRenderers(Lcom/itextpdf/layout/renderer/LineRenderer;IILjava/util/List;Ljava/util/List;)V
    .locals 11
    .param p0, "lineRenderer"    # Lcom/itextpdf/layout/renderer/LineRenderer;
    .param p1, "childPos"    # I
    .param p2, "numberOfSequentialTextRenderers"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/renderer/LineRenderer;",
            "II",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 507
    .local p3, "possibleBreakPointsGlobal":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local p4, "indicesOfFloating":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v0, 0x0

    .line 508
    .local v0, "alreadyProcessedNumberOfCharsWithinGlyphLines":I
    const/4 v1, 0x0

    .line 509
    .local v1, "indexToBeginWith":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, p2, :cond_3

    .line 510
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {p4, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 511
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    add-int v4, p1, v2

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/renderer/TextRenderer;

    .line 512
    .local v3, "childTextRenderer":Lcom/itextpdf/layout/renderer/TextRenderer;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 513
    .local v4, "amountOfCharsBetweenTextStartAndActualTextChunk":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 515
    .local v5, "glyphLineBasedIndicesOfActualTextChunkEnds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/TextRenderer;->getText()Lcom/itextpdf/io/font/otf/GlyphLine;

    move-result-object v6

    invoke-static {v6, v4, v5}, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping;->fillActualTextChunkRelatedLists(Lcom/itextpdf/io/font/otf/GlyphLine;Ljava/util/List;Ljava/util/List;)V

    .line 518
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 519
    .local v6, "possibleBreakPoints":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    move v7, v1

    .local v7, "j":I
    :goto_1
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v8

    if-ge v7, v8, :cond_1

    .line 520
    invoke-interface {p3, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    sub-int/2addr v8, v0

    .line 522
    .local v8, "shiftedBreakPoint":I
    nop

    .line 523
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    invoke-interface {v4, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    .line 524
    .local v9, "amountOfCharsBetweenTextStartAndTextEnd":I
    if-le v8, v9, :cond_0

    .line 525
    move v1, v7

    .line 526
    add-int/2addr v0, v9

    .line 527
    goto :goto_2

    .line 529
    :cond_0
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-interface {v6, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 519
    .end local v8    # "shiftedBreakPoint":I
    .end local v9    # "amountOfCharsBetweenTextStartAndTextEnd":I
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 532
    .end local v7    # "j":I
    :cond_1
    :goto_2
    invoke-static {v6, v4, v5}, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping;->convertPossibleBreakPointsToGlyphLineBased(Ljava/util/List;Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    move-result-object v7

    .line 535
    .local v7, "glyphLineBasedPossibleBreakPoints":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-virtual {v3, v7}, Lcom/itextpdf/layout/renderer/TextRenderer;->setSpecialScriptsWordBreakPoints(Ljava/util/List;)V

    .line 509
    .end local v3    # "childTextRenderer":Lcom/itextpdf/layout/renderer/TextRenderer;
    .end local v4    # "amountOfCharsBetweenTextStartAndActualTextChunk":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v5    # "glyphLineBasedIndicesOfActualTextChunkEnds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v6    # "possibleBreakPoints":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v7    # "glyphLineBasedPossibleBreakPoints":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 538
    .end local v2    # "i":I
    :cond_3
    return-void
.end method

.method private static fillActualTextChunkRelatedLists(Lcom/itextpdf/io/font/otf/GlyphLine;Ljava/util/List;Ljava/util/List;)V
    .locals 8
    .param p0, "glyphLine"    # Lcom/itextpdf/io/font/otf/GlyphLine;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/io/font/otf/GlyphLine;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 679
    .local p1, "amountOfCharsBetweenTextStartAndActualTextChunk":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local p2, "glyphLineBasedIndicesOfActualTextChunkEnds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    new-instance v0, Lcom/itextpdf/io/font/otf/ActualTextIterator;

    invoke-direct {v0, p0}, Lcom/itextpdf/io/font/otf/ActualTextIterator;-><init>(Lcom/itextpdf/io/font/otf/GlyphLine;)V

    .line 681
    .local v0, "actualTextIterator":Lcom/itextpdf/io/font/otf/ActualTextIterator;
    const/4 v1, 0x0

    .line 682
    .local v1, "amountOfCharsBetweenTextStartAndCurrentActualTextStartOrGlyph":I
    :goto_0
    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/ActualTextIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 683
    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/ActualTextIterator;->next()Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;

    move-result-object v2

    .line 684
    .local v2, "part":Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;
    const/4 v3, 0x0

    .line 685
    .local v3, "amountOfCharsWithinCurrentActualTextOrGlyph":I
    iget-object v4, v2, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;->actualText:Ljava/lang/String;

    if-eqz v4, :cond_0

    .line 686
    iget-object v4, v2, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;->actualText:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v3

    .line 687
    add-int v4, v3, v1

    .line 689
    .local v4, "nextAmountOfChars":I
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {p1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 690
    iget v5, v2, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;->end:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {p2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 691
    nop

    .line 692
    .end local v1    # "amountOfCharsBetweenTextStartAndCurrentActualTextStartOrGlyph":I
    .local v4, "amountOfCharsBetweenTextStartAndCurrentActualTextStartOrGlyph":I
    move v1, v4

    goto :goto_3

    .line 693
    .end local v4    # "amountOfCharsBetweenTextStartAndCurrentActualTextStartOrGlyph":I
    .restart local v1    # "amountOfCharsBetweenTextStartAndCurrentActualTextStartOrGlyph":I
    :cond_0
    iget v4, v2, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;->start:I

    .local v4, "j":I
    :goto_1
    iget v5, v2, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;->end:I

    if-ge v4, v5, :cond_2

    .line 694
    invoke-virtual {p0, v4}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/io/font/otf/Glyph;->getChars()[C

    move-result-object v5

    .line 695
    .local v5, "chars":[C
    if-eqz v5, :cond_1

    array-length v6, v5

    goto :goto_2

    :cond_1
    const/4 v6, 0x0

    :goto_2
    move v3, v6

    .line 696
    add-int v6, v3, v1

    .line 698
    .local v6, "nextAmountOfChars":I
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {p1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 699
    add-int/lit8 v7, v4, 0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {p2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 700
    move v1, v6

    .line 693
    .end local v5    # "chars":[C
    .end local v6    # "nextAmountOfChars":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 703
    .end local v2    # "part":Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;
    .end local v3    # "amountOfCharsWithinCurrentActualTextOrGlyph":I
    .end local v4    # "j":I
    :cond_2
    :goto_3
    goto :goto_0

    .line 704
    :cond_3
    return-void
.end method

.method static getCurWidthRelayoutedTextSequenceDecrement(IILjava/util/Map;)F
    .locals 3
    .param p0, "childPos"    # I
    .param p1, "newChildPos"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/layout/layout/LayoutResult;",
            ">;)F"
        }
    .end annotation

    .line 591
    .local p2, "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    const/4 v0, 0x0

    .line 594
    .local v0, "decrement":F
    if-eq p0, p1, :cond_1

    .line 595
    add-int/lit8 v1, p0, -0x1

    .local v1, "i":I
    :goto_0
    if-lt v1, p1, :cond_1

    .line 596
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {p2, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 597
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {p2, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/layout/LayoutResult;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutResult;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    add-float/2addr v0, v2

    .line 595
    :cond_0
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 602
    .end local v1    # "i":I
    :cond_1
    return v0
.end method

.method public static getIndexAndLayoutResultOfTheLastTextRendererContainingSpecialScripts(Lcom/itextpdf/layout/renderer/LineRenderer;ILjava/util/Map;ZZ)Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$LastFittingChildRendererData;
    .locals 18
    .param p0, "lineRenderer"    # Lcom/itextpdf/layout/renderer/LineRenderer;
    .param p1, "childPos"    # I
    .param p3, "wasParentsHeightClipped"    # Z
    .param p4, "isOverflowFit"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/renderer/LineRenderer;",
            "I",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/layout/layout/LayoutResult;",
            ">;ZZ)",
            "Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$LastFittingChildRendererData;"
        }
    .end annotation

    .line 285
    .local p2, "specialScriptLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p1

    .line 286
    .local v2, "indexOfRendererContainingLastFullyFittingWord":I
    const/4 v3, 0x0

    .line 287
    .local v3, "splitPosition":I
    const/4 v4, 0x0

    .line 288
    .local v4, "needToSplitRendererContainingLastFullyFittingWord":Z
    const/4 v5, 0x0

    .line 289
    .local v5, "fittingLengthWithTrailingRightSideSpaces":I
    const/4 v6, 0x0

    .line 290
    .local v6, "amountOfTrailingRightSideSpaces":I
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    move-object/from16 v8, p2

    invoke-interface {v8, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/layout/layout/LayoutResult;

    .line 291
    .local v7, "childPosLayoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    const/4 v9, 0x0

    .line 292
    .local v9, "returnLayoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    move/from16 v10, p1

    .local v10, "analyzedTextRendererIndex":I
    :goto_0
    if-ltz v10, :cond_e

    .line 294
    iget-object v14, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v14, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/itextpdf/layout/renderer/TextRenderer;

    .line 295
    .local v14, "textRenderer":Lcom/itextpdf/layout/renderer/TextRenderer;
    if-eq v10, v1, :cond_0

    .line 296
    invoke-virtual {v14}, Lcom/itextpdf/layout/renderer/TextRenderer;->length()I

    move-result v5

    const/16 v16, 0x0

    goto :goto_2

    .line 297
    :cond_0
    invoke-virtual {v7}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v15

    if-eqz v15, :cond_1

    .line 298
    invoke-virtual {v7}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v15

    check-cast v15, Lcom/itextpdf/layout/renderer/TextRenderer;

    .line 299
    .local v15, "splitTextRenderer":Lcom/itextpdf/layout/renderer/TextRenderer;
    const/16 v16, 0x0

    iget-object v11, v15, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 300
    .local v11, "splitText":Lcom/itextpdf/io/font/otf/GlyphLine;
    invoke-virtual {v15}, Lcom/itextpdf/layout/renderer/TextRenderer;->length()I

    move-result v17

    if-lez v17, :cond_2

    .line 301
    invoke-virtual {v15}, Lcom/itextpdf/layout/renderer/TextRenderer;->length()I

    move-result v5

    .line 302
    :goto_1
    iget v12, v11, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    add-int/2addr v12, v6

    invoke-virtual {v11}, Lcom/itextpdf/io/font/otf/GlyphLine;->size()I

    move-result v13

    if-ge v12, v13, :cond_2

    iget v12, v11, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    add-int/2addr v12, v6

    .line 303
    invoke-virtual {v11, v12}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v12

    invoke-static {v12}, Lcom/itextpdf/io/util/TextUtil;->isWhitespace(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 304
    add-int/lit8 v5, v5, 0x1

    .line 305
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 297
    .end local v11    # "splitText":Lcom/itextpdf/io/font/otf/GlyphLine;
    .end local v15    # "splitTextRenderer":Lcom/itextpdf/layout/renderer/TextRenderer;
    :cond_1
    const/16 v16, 0x0

    .line 311
    :cond_2
    :goto_2
    const/4 v11, 0x0

    if-lez v5, :cond_5

    .line 312
    invoke-virtual {v14}, Lcom/itextpdf/layout/renderer/TextRenderer;->getSpecialScriptsWordBreakPoints()Ljava/util/List;

    move-result-object v13

    .line 313
    .local v13, "breakPoints":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    if-eqz v13, :cond_5

    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v15

    if-lez v15, :cond_5

    invoke-interface {v13, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/Integer;

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v15

    const/4 v12, -0x1

    if-eq v15, v12, :cond_5

    .line 314
    nop

    .line 315
    invoke-virtual {v14}, Lcom/itextpdf/layout/renderer/TextRenderer;->getSpecialScriptsWordBreakPoints()Ljava/util/List;

    move-result-object v15

    iget-object v12, v14, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v12, v12, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    add-int/2addr v12, v5

    .line 314
    invoke-static {v15, v12, v11}, Lcom/itextpdf/layout/renderer/TextRenderer;->findPossibleBreaksSplitPosition(Ljava/util/List;IZ)I

    move-result v12

    .line 317
    .local v12, "possibleBreakPointPosition":I
    const/4 v15, -0x1

    if-le v12, v15, :cond_5

    .line 318
    invoke-interface {v13, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/Integer;

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v15

    sub-int v3, v15, v6

    .line 319
    iget-object v15, v14, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v15, v15, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-eq v3, v15, :cond_3

    const/4 v11, 0x1

    :cond_3
    move v4, v11

    .line 320
    if-nez v4, :cond_4

    .line 321
    add-int/lit8 v10, v10, 0x1

    .line 323
    :cond_4
    move v2, v10

    .line 324
    goto :goto_3

    .line 329
    .end local v12    # "possibleBreakPointPosition":I
    .end local v13    # "breakPoints":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_5
    nop

    .line 330
    invoke-static {v0, v10}, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping;->getSpecialScriptsContainingSequenceStatus(Lcom/itextpdf/layout/renderer/LineRenderer;I)Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;

    move-result-object v12

    .line 337
    .local v12, "status":Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;
    sget-object v13, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;->FORCED_SPLIT:Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;

    if-ne v12, v13, :cond_c

    .line 338
    iget-object v13, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    .line 339
    invoke-interface {v13, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/itextpdf/layout/renderer/IRenderer;

    const/16 v15, 0x66

    invoke-interface {v13, v15}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;

    .line 341
    .local v13, "overflowWrapValue":Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;
    sget-object v15, Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;->ANYWHERE:Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;

    if-eq v13, v15, :cond_6

    sget-object v15, Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;->BREAK_WORD:Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;

    if-ne v13, v15, :cond_7

    :cond_6
    const/4 v11, 0x1

    .line 343
    .local v11, "overflowWrapNotNormal":Z
    :cond_7
    if-eqz v11, :cond_8

    invoke-virtual {v7}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v15

    const/4 v1, 0x3

    if-ne v15, v1, :cond_9

    :cond_8
    if-eqz p4, :cond_b

    .line 345
    :cond_9
    invoke-virtual {v7}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v1

    const/4 v15, 0x3

    if-eq v1, v15, :cond_a

    .line 346
    move-object v9, v7

    .line 348
    :cond_a
    move/from16 v2, p1

    .line 349
    goto :goto_3

    .line 351
    :cond_b
    return-object v16

    .line 357
    .end local v11    # "overflowWrapNotNormal":Z
    .end local v13    # "overflowWrapValue":Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;
    :cond_c
    sget-object v1, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;->MOVE_SEQUENCE_CONTAINING_SPECIAL_SCRIPTS_ON_NEXT_LINE:Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;

    if-ne v12, v1, :cond_d

    .line 359
    move v2, v10

    .line 360
    goto :goto_3

    .line 292
    .end local v12    # "status":Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;
    .end local v14    # "textRenderer":Lcom/itextpdf/layout/renderer/TextRenderer;
    :cond_d
    add-int/lit8 v10, v10, -0x1

    move/from16 v1, p1

    goto/16 :goto_0

    :cond_e
    const/16 v16, 0x0

    .line 364
    .end local v10    # "analyzedTextRendererIndex":I
    :goto_3
    if-nez v9, :cond_11

    .line 365
    move-object v1, v7

    .line 367
    .end local v9    # "returnLayoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .local v1, "returnLayoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    iget-object v9, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    .line 368
    invoke-interface {v9, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/layout/renderer/TextRenderer;

    .line 370
    .local v9, "childRenderer":Lcom/itextpdf/layout/renderer/TextRenderer;
    if-eqz v4, :cond_10

    .line 371
    sub-int v10, v5, v6

    iget-object v11, v9, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v11, v11, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    add-int/2addr v10, v11

    .line 374
    .local v10, "amountOfFitOnTheFirstLayout":I
    if-eq v10, v3, :cond_f

    .line 375
    invoke-virtual {v9}, Lcom/itextpdf/layout/renderer/TextRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v11

    invoke-virtual {v11}, Lcom/itextpdf/layout/layout/LayoutArea;->clone()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v11

    .line 376
    .local v11, "layoutArea":Lcom/itextpdf/layout/layout/LayoutArea;
    invoke-virtual {v11}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v12

    .line 377
    const v13, 0x38d1b717    # 1.0E-4f

    invoke-virtual {v12, v13}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v12

    .line 378
    invoke-virtual {v12, v13}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 379
    invoke-virtual {v9, v3}, Lcom/itextpdf/layout/renderer/TextRenderer;->setSpecialScriptFirstNotFittingIndex(I)V

    .line 386
    new-instance v12, Lcom/itextpdf/layout/layout/LayoutContext;

    move/from16 v13, p3

    invoke-direct {v12, v11, v13}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;Z)V

    invoke-virtual {v9, v12}, Lcom/itextpdf/layout/renderer/TextRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v1

    .line 387
    const/4 v12, -0x1

    invoke-virtual {v9, v12}, Lcom/itextpdf/layout/renderer/TextRenderer;->setSpecialScriptFirstNotFittingIndex(I)V

    goto :goto_4

    .line 374
    .end local v11    # "layoutArea":Lcom/itextpdf/layout/layout/LayoutArea;
    :cond_f
    move/from16 v13, p3

    .line 389
    .end local v10    # "amountOfFitOnTheFirstLayout":I
    :goto_4
    move-object v9, v1

    goto :goto_5

    .line 390
    :cond_10
    move/from16 v13, p3

    new-instance v10, Lcom/itextpdf/layout/layout/TextLayoutResult;

    move-object/from16 v11, v16

    const/4 v15, 0x3

    invoke-direct {v10, v15, v11, v11, v9}, Lcom/itextpdf/layout/layout/TextLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    move-object v9, v10

    .end local v1    # "returnLayoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .local v10, "returnLayoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    goto :goto_5

    .line 364
    .end local v10    # "returnLayoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .local v9, "returnLayoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    :cond_11
    move/from16 v13, p3

    .line 394
    :goto_5
    new-instance v1, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$LastFittingChildRendererData;

    invoke-direct {v1, v2, v9}, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$LastFittingChildRendererData;-><init>(ILcom/itextpdf/layout/layout/LayoutResult;)V

    return-object v1
.end method

.method public static getIndexAndLayoutResultOfTheLastTextRendererWithNoSpecialScripts(Lcom/itextpdf/layout/renderer/LineRenderer;ILjava/util/Map;ZZZ)Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$LastFittingChildRendererData;
    .locals 16
    .param p0, "lineRenderer"    # Lcom/itextpdf/layout/renderer/LineRenderer;
    .param p1, "childPos"    # I
    .param p3, "wasParentsHeightClipped"    # Z
    .param p4, "isOverflowFit"    # Z
    .param p5, "floatsPlaced"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/renderer/LineRenderer;",
            "I",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/layout/layout/LayoutResult;",
            ">;ZZZ)",
            "Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$LastFittingChildRendererData;"
        }
    .end annotation

    .line 185
    .local p2, "textSequenceLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/layout/LayoutResult;

    .line 186
    .local v3, "lastAnalyzedTextLayoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v4

    const/4 v5, 0x2

    if-ne v4, v5, :cond_0

    move-object v4, v3

    check-cast v4, Lcom/itextpdf/layout/layout/TextLayoutResult;

    .line 187
    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/TextLayoutResult;->isWordHasBeenSplit()Z

    move-result v4

    if-nez v4, :cond_0

    .line 189
    new-instance v4, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$LastFittingChildRendererData;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/layout/layout/LayoutResult;

    invoke-direct {v4, v1, v5}, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$LastFittingChildRendererData;-><init>(ILcom/itextpdf/layout/layout/LayoutResult;)V

    return-object v4

    .line 192
    :cond_0
    const/4 v3, 0x0

    .line 193
    move/from16 v4, p1

    .line 195
    .local v4, "lastAnalyzedTextRenderer":I
    move/from16 v5, p1

    .local v5, "i":I
    :goto_0
    const/4 v6, 0x1

    const/4 v7, 0x3

    const/4 v8, 0x0

    if-ltz v5, :cond_a

    .line 196
    iget-object v9, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v9, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    instance-of v9, v9, Lcom/itextpdf/layout/renderer/TextRenderer;

    if-eqz v9, :cond_8

    iget-object v9, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    .line 197
    invoke-interface {v9, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 196
    invoke-static {v9}, Lcom/itextpdf/layout/renderer/LineRenderer;->isChildFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v9

    if-nez v9, :cond_8

    .line 198
    iget-object v9, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v9, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/layout/renderer/TextRenderer;

    .line 199
    .local v9, "textRenderer":Lcom/itextpdf/layout/renderer/TextRenderer;
    invoke-virtual {v9, v6}, Lcom/itextpdf/layout/renderer/TextRenderer;->textContainsSpecialScriptGlyphs(Z)Z

    move-result v10

    if-nez v10, :cond_7

    .line 200
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-interface {v2, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/layout/layout/TextLayoutResult;

    .line 201
    .local v10, "textLayoutResult":Lcom/itextpdf/layout/layout/TextLayoutResult;
    nop

    .line 202
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v2, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/itextpdf/layout/layout/TextLayoutResult;

    .line 203
    .local v11, "previousTextLayoutResult":Lcom/itextpdf/layout/layout/TextLayoutResult;
    if-eq v5, v4, :cond_3

    invoke-virtual {v10}, Lcom/itextpdf/layout/layout/TextLayoutResult;->getStatus()I

    move-result v12

    if-ne v12, v6, :cond_3

    .line 204
    invoke-virtual {v11}, Lcom/itextpdf/layout/layout/TextLayoutResult;->isStartsWithSplitCharacterWhiteSpace()Z

    move-result v12

    if-nez v12, :cond_1

    .line 205
    invoke-virtual {v10}, Lcom/itextpdf/layout/layout/TextLayoutResult;->isEndsWithSplitCharacter()Z

    move-result v12

    if-eqz v12, :cond_3

    .line 206
    :cond_1
    invoke-virtual {v11}, Lcom/itextpdf/layout/layout/TextLayoutResult;->getStatus()I

    move-result v12

    if-ne v12, v7, :cond_2

    move-object v12, v11

    goto :goto_1

    :cond_2
    new-instance v12, Lcom/itextpdf/layout/layout/TextLayoutResult;

    iget-object v13, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    .line 209
    invoke-interface {v13, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-direct {v12, v7, v8, v8, v13}, Lcom/itextpdf/layout/layout/TextLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    :goto_1
    move-object v3, v12

    .line 210
    move/from16 v14, p3

    goto/16 :goto_3

    .line 212
    :cond_3
    invoke-virtual {v10}, Lcom/itextpdf/layout/layout/TextLayoutResult;->isContainsPossibleBreak()Z

    move-result v12

    if-eqz v12, :cond_6

    .line 213
    invoke-virtual {v10}, Lcom/itextpdf/layout/layout/TextLayoutResult;->getStatus()I

    move-result v12

    if-eq v12, v7, :cond_5

    .line 214
    iget-object v12, v9, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v12, v12, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    invoke-virtual {v9, v12}, Lcom/itextpdf/layout/renderer/TextRenderer;->setIndexOfFirstCharacterToBeForcedToOverflow(I)V

    .line 215
    invoke-virtual {v9}, Lcom/itextpdf/layout/renderer/TextRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v12

    invoke-virtual {v12}, Lcom/itextpdf/layout/layout/LayoutArea;->clone()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v12

    .line 216
    .local v12, "layoutArea":Lcom/itextpdf/layout/layout/LayoutArea;
    invoke-virtual {v12}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v13

    .line 217
    const v14, 0x38d1b717    # 1.0E-4f

    invoke-virtual {v13, v14}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v13

    .line 218
    invoke-virtual {v13, v14}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 225
    new-instance v13, Lcom/itextpdf/layout/layout/LayoutContext;

    move/from16 v14, p3

    invoke-direct {v13, v12, v14}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;Z)V

    .line 226
    invoke-virtual {v9, v13}, Lcom/itextpdf/layout/renderer/TextRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v13

    .line 227
    .local v13, "newChildLayoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    const v15, 0x7fffffff

    invoke-virtual {v9, v15}, Lcom/itextpdf/layout/renderer/TextRenderer;->setIndexOfFirstCharacterToBeForcedToOverflow(I)V

    .line 228
    invoke-virtual {v13}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v15

    if-ne v15, v6, :cond_4

    .line 229
    new-instance v15, Lcom/itextpdf/layout/layout/TextLayoutResult;

    iget-object v6, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    .line 230
    invoke-interface {v6, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-direct {v15, v7, v8, v8, v6}, Lcom/itextpdf/layout/layout/TextLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    move-object v3, v15

    goto :goto_3

    .line 232
    :cond_4
    move-object v3, v13

    .line 233
    move v4, v5

    .line 235
    goto :goto_3

    .line 213
    .end local v12    # "layoutArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .end local v13    # "newChildLayoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    :cond_5
    move/from16 v14, p3

    goto :goto_2

    .line 212
    :cond_6
    move/from16 v14, p3

    .line 237
    :goto_2
    move v4, v5

    .line 238
    .end local v10    # "textLayoutResult":Lcom/itextpdf/layout/layout/TextLayoutResult;
    .end local v11    # "previousTextLayoutResult":Lcom/itextpdf/layout/layout/TextLayoutResult;
    nop

    .line 244
    .end local v9    # "textRenderer":Lcom/itextpdf/layout/renderer/TextRenderer;
    nop

    .line 195
    add-int/lit8 v5, v5, -0x1

    goto/16 :goto_0

    .line 239
    .restart local v9    # "textRenderer":Lcom/itextpdf/layout/renderer/TextRenderer;
    :cond_7
    move/from16 v14, p3

    new-instance v6, Lcom/itextpdf/layout/layout/TextLayoutResult;

    iget-object v10, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    .line 240
    invoke-interface {v10, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-direct {v6, v7, v8, v8, v10}, Lcom/itextpdf/layout/layout/TextLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    move-object v3, v6

    .line 241
    goto :goto_3

    .line 196
    .end local v9    # "textRenderer":Lcom/itextpdf/layout/renderer/TextRenderer;
    :cond_8
    move/from16 v14, p3

    .line 244
    iget-object v6, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-static {v6}, Lcom/itextpdf/layout/renderer/LineRenderer;->isChildFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v6

    if-nez v6, :cond_9

    iget-object v6, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    .line 245
    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    instance-of v6, v6, Lcom/itextpdf/layout/renderer/ImageRenderer;

    if-nez v6, :cond_9

    iget-object v6, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    .line 246
    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-static {v6}, Lcom/itextpdf/layout/renderer/LineRenderer;->isInlineBlockChild(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v6

    if-eqz v6, :cond_b

    .line 247
    :cond_9
    new-instance v6, Lcom/itextpdf/layout/layout/TextLayoutResult;

    iget-object v9, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    .line 248
    invoke-interface {v9, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-direct {v6, v7, v8, v8, v9}, Lcom/itextpdf/layout/layout/TextLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    move-object v3, v6

    .line 249
    goto :goto_3

    .line 195
    :cond_a
    move/from16 v14, p3

    .line 255
    .end local v5    # "i":I
    :cond_b
    :goto_3
    if-nez v3, :cond_12

    .line 256
    iget-object v5, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    .line 257
    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/layout/renderer/IRenderer;

    const/16 v6, 0x66

    invoke-interface {v5, v6}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;

    .line 259
    .local v5, "overflowWrapValue":Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;
    sget-object v6, Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;->ANYWHERE:Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;

    if-eq v5, v6, :cond_d

    sget-object v6, Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;->BREAK_WORD:Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;

    if-ne v5, v6, :cond_c

    goto :goto_4

    :cond_c
    const/4 v6, 0x0

    goto :goto_5

    :cond_d
    :goto_4
    const/4 v6, 0x1

    .line 261
    .local v6, "overflowWrapNotNormal":Z
    :goto_5
    if-eqz v6, :cond_e

    .line 262
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v2, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/layout/layout/LayoutResult;

    invoke-virtual {v9}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v9

    if-ne v9, v7, :cond_f

    :cond_e
    if-eqz p4, :cond_10

    .line 264
    :cond_f
    move/from16 v4, p1

    .line 265
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v2, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    move-object v3, v7

    check-cast v3, Lcom/itextpdf/layout/layout/LayoutResult;

    goto :goto_6

    .line 266
    :cond_10
    if-eqz p5, :cond_11

    .line 267
    new-instance v9, Lcom/itextpdf/layout/layout/TextLayoutResult;

    iget-object v10, v0, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    .line 268
    invoke-interface {v10, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-direct {v9, v7, v8, v8, v10}, Lcom/itextpdf/layout/layout/TextLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    move-object v3, v9

    goto :goto_6

    .line 270
    :cond_11
    return-object v8

    .line 274
    .end local v5    # "overflowWrapValue":Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;
    .end local v6    # "overflowWrapNotNormal":Z
    :cond_12
    :goto_6
    if-eqz v3, :cond_13

    .line 275
    new-instance v5, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$LastFittingChildRendererData;

    invoke-direct {v5, v4, v3}, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$LastFittingChildRendererData;-><init>(ILcom/itextpdf/layout/layout/LayoutResult;)V

    return-object v5

    .line 278
    :cond_13
    return-object v8
.end method

.method static getSpecialScriptsContainingSequenceStatus(Lcom/itextpdf/layout/renderer/LineRenderer;I)Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;
    .locals 5
    .param p0, "lineRenderer"    # Lcom/itextpdf/layout/renderer/LineRenderer;
    .param p1, "analyzedTextRendererIndex"    # I

    .line 559
    const/4 v0, 0x0

    .line 560
    .local v0, "moveSequenceContainingSpecialScriptsOnNextLine":Z
    const/4 v1, 0x0

    .line 562
    .local v1, "moveToPreviousTextRendererContainingSpecialScripts":Z
    const/4 v2, 0x1

    if-lez p1, :cond_3

    .line 563
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    add-int/lit8 v4, p1, -0x1

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 564
    .local v3, "prevChildRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    instance-of v4, v3, Lcom/itextpdf/layout/renderer/TextRenderer;

    if-eqz v4, :cond_1

    invoke-static {v3}, Lcom/itextpdf/layout/renderer/LineRenderer;->isChildFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 565
    move-object v4, v3

    check-cast v4, Lcom/itextpdf/layout/renderer/TextRenderer;

    invoke-virtual {v4, v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->textContainsSpecialScriptGlyphs(Z)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 566
    const/4 v1, 0x1

    goto :goto_0

    .line 568
    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    .line 570
    :cond_1
    invoke-static {v3}, Lcom/itextpdf/layout/renderer/LineRenderer;->isChildFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v4

    if-nez v4, :cond_2

    instance-of v4, v3, Lcom/itextpdf/layout/renderer/ImageRenderer;

    if-nez v4, :cond_2

    .line 572
    invoke-static {v3}, Lcom/itextpdf/layout/renderer/LineRenderer;->isInlineBlockChild(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 573
    :cond_2
    const/4 v0, 0x1

    .line 577
    .end local v3    # "prevChildRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_3
    :goto_0
    if-nez v1, :cond_4

    if-nez v0, :cond_4

    goto :goto_1

    :cond_4
    const/4 v2, 0x0

    .line 580
    .local v2, "forcedSplit":Z
    :goto_1
    if-eqz v0, :cond_5

    .line 581
    sget-object v3, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;->MOVE_SEQUENCE_CONTAINING_SPECIAL_SCRIPTS_ON_NEXT_LINE:Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;

    return-object v3

    .line 582
    :cond_5
    if-eqz v2, :cond_6

    .line 583
    sget-object v3, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;->FORCED_SPLIT:Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;

    return-object v3

    .line 585
    :cond_6
    sget-object v3, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;->MOVE_TO_PREVIOUS_TEXT_RENDERER_CONTAINING_SPECIAL_SCRIPTS:Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingSequenceStatus;

    return-object v3
.end method

.method static getSpecialScriptsContainingTextRendererSequenceInfo(Lcom/itextpdf/layout/renderer/LineRenderer;I)Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingTextRendererSequenceInfo;
    .locals 6
    .param p0, "lineRenderer"    # Lcom/itextpdf/layout/renderer/LineRenderer;
    .param p1, "childPos"    # I

    .line 481
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 482
    .local v0, "sequentialTextContentBuilder":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .line 483
    .local v1, "numberOfSequentialTextRenderers":I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 484
    .local v2, "indicesOfFloating":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    move v3, p1

    .local v3, "i":I
    :goto_0
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_1

    .line 485
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-static {v4}, Lcom/itextpdf/layout/renderer/LineRenderer;->isChildFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 486
    add-int/lit8 v1, v1, 0x1

    .line 487
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 489
    :cond_0
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    instance-of v4, v4, Lcom/itextpdf/layout/renderer/TextRenderer;

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    .line 490
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/renderer/TextRenderer;

    .line 491
    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/itextpdf/layout/renderer/TextRenderer;->textContainsSpecialScriptGlyphs(Z)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 492
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    .line 493
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/renderer/TextRenderer;

    iget-object v4, v4, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-virtual {v4}, Lcom/itextpdf/io/font/otf/GlyphLine;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 494
    add-int/lit8 v1, v1, 0x1

    .line 484
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 500
    .end local v3    # "i":I
    :cond_1
    new-instance v3, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingTextRendererSequenceInfo;

    .line 501
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v1, v4, v2}, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingTextRendererSequenceInfo;-><init>(ILjava/lang/String;Ljava/util/List;)V

    .line 500
    return-object v3
.end method

.method public static isTextRendererAndRequiresSpecialScriptPreLayoutProcessing(Lcom/itextpdf/layout/renderer/IRenderer;)Z
    .locals 2
    .param p0, "childRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 48
    instance-of v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/renderer/TextRenderer;

    .line 49
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->getSpecialScriptsWordBreakPoints()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_0

    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/renderer/TextRenderer;

    .line 50
    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->textContainsSpecialScriptGlyphs(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 51
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/LineRenderer;->isChildFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    nop

    .line 48
    :goto_0
    return v1
.end method

.method public static postprocessTextSequenceOverflowX(Lcom/itextpdf/layout/renderer/LineRenderer;ZILcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/layout/LayoutResult;Z)Z
    .locals 6
    .param p0, "lineRenderer"    # Lcom/itextpdf/layout/renderer/LineRenderer;
    .param p1, "textSequenceOverflowXProcessing"    # Z
    .param p2, "childPos"    # I
    .param p3, "childRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p4, "childResult"    # Lcom/itextpdf/layout/layout/LayoutResult;
    .param p5, "wasXOverflowChanged"    # Z

    .line 448
    instance-of v0, p3, Lcom/itextpdf/layout/renderer/TextRenderer;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    move-object v0, p3

    check-cast v0, Lcom/itextpdf/layout/renderer/TextRenderer;

    .line 449
    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->textContainsSpecialScriptGlyphs(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    .line 450
    .local v0, "specialScripts":Z
    :goto_0
    const/4 v3, 0x0

    .line 451
    .local v3, "shouldBreakLayouting":Z
    add-int/lit8 v4, p2, 0x1

    iget-object v5, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-eq v4, v5, :cond_1

    iget-object v4, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    add-int/lit8 v5, p2, 0x1

    .line 452
    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-static {v4}, Lcom/itextpdf/layout/renderer/LineRenderer;->isChildFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v4

    if-nez v4, :cond_1

    iget-object v4, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    add-int/lit8 v5, p2, 0x1

    .line 453
    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    instance-of v4, v4, Lcom/itextpdf/layout/renderer/TextRenderer;

    if-nez v4, :cond_2

    :cond_1
    move v1, v2

    .line 455
    .local v1, "lastElemOfTextSequence":Z
    :cond_2
    const/16 v2, 0x67

    if-eqz p1, :cond_5

    if-eqz v0, :cond_5

    .line 456
    move-object v4, p3

    check-cast v4, Lcom/itextpdf/layout/renderer/TextRenderer;

    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/TextRenderer;->getSpecialScriptFirstNotFittingIndex()I

    move-result v4

    if-gtz v4, :cond_3

    if-eqz v1, :cond_4

    .line 458
    :cond_3
    const/4 v3, 0x1

    .line 460
    :cond_4
    move-object v4, p3

    check-cast v4, Lcom/itextpdf/layout/renderer/TextRenderer;

    const/4 v5, -0x1

    invoke-virtual {v4, v5}, Lcom/itextpdf/layout/renderer/TextRenderer;->setSpecialScriptFirstNotFittingIndex(I)V

    .line 461
    if-eqz p5, :cond_5

    .line 462
    sget-object v4, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->FIT:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    invoke-virtual {p0, v2, v4}, Lcom/itextpdf/layout/renderer/LineRenderer;->setProperty(ILjava/lang/Object;)V

    .line 466
    :cond_5
    if-eqz p1, :cond_9

    if-nez v0, :cond_9

    .line 467
    instance-of v4, p4, Lcom/itextpdf/layout/layout/TextLayoutResult;

    if-eqz v4, :cond_6

    move-object v4, p4

    check-cast v4, Lcom/itextpdf/layout/layout/TextLayoutResult;

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/TextLayoutResult;->isContainsPossibleBreak()Z

    move-result v4

    if-nez v4, :cond_7

    :cond_6
    if-eqz v1, :cond_8

    .line 469
    :cond_7
    const/4 v3, 0x1

    .line 471
    :cond_8
    if-eqz p5, :cond_9

    .line 472
    sget-object v4, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->FIT:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    invoke-virtual {p0, v2, v4}, Lcom/itextpdf/layout/renderer/LineRenderer;->setProperty(ILjava/lang/Object;)V

    .line 476
    :cond_9
    return v3
.end method

.method public static preprocessTextSequenceOverflowX(Lcom/itextpdf/layout/renderer/LineRenderer;ZLcom/itextpdf/layout/renderer/IRenderer;ZLcom/itextpdf/layout/properties/OverflowPropertyValue;)V
    .locals 4
    .param p0, "lineRenderer"    # Lcom/itextpdf/layout/renderer/LineRenderer;
    .param p1, "textSequenceOverflowXProcessing"    # Z
    .param p2, "childRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p3, "wasXOverflowChanged"    # Z
    .param p4, "oldXOverflow"    # Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    .line 415
    instance-of v0, p2, Lcom/itextpdf/layout/renderer/TextRenderer;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    move-object v0, p2

    check-cast v0, Lcom/itextpdf/layout/renderer/TextRenderer;

    .line 416
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->textContainsSpecialScriptGlyphs(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    move v2, v1

    .line 417
    .local v2, "specialScripts":Z
    :goto_0
    const/16 v0, 0x67

    if-eqz p1, :cond_2

    if-eqz v2, :cond_2

    .line 418
    move-object v3, p2

    check-cast v3, Lcom/itextpdf/layout/renderer/TextRenderer;

    .line 419
    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/TextRenderer;->getSpecialScriptsWordBreakPoints()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 420
    .local v1, "firstPossibleBreakWithinTheRenderer":I
    const/4 v3, -0x1

    if-eq v1, v3, :cond_1

    .line 421
    move-object v3, p2

    check-cast v3, Lcom/itextpdf/layout/renderer/TextRenderer;

    .line 422
    invoke-virtual {v3, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->setSpecialScriptFirstNotFittingIndex(I)V

    .line 424
    :cond_1
    if-eqz p3, :cond_2

    .line 425
    invoke-virtual {p0, v0, p4}, Lcom/itextpdf/layout/renderer/LineRenderer;->setProperty(ILjava/lang/Object;)V

    .line 429
    .end local v1    # "firstPossibleBreakWithinTheRenderer":I
    :cond_2
    if-eqz p1, :cond_3

    if-nez v2, :cond_3

    if-eqz p3, :cond_3

    .line 430
    invoke-virtual {p0, v0, p4}, Lcom/itextpdf/layout/renderer/LineRenderer;->setProperty(ILjava/lang/Object;)V

    .line 432
    :cond_3
    return-void
.end method

.method public static processSpecialScriptPreLayout(Lcom/itextpdf/layout/renderer/LineRenderer;I)V
    .locals 5
    .param p0, "lineRenderer"    # Lcom/itextpdf/layout/renderer/LineRenderer;
    .param p1, "childPos"    # I

    .line 84
    nop

    .line 85
    invoke-static {p0, p1}, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping;->getSpecialScriptsContainingTextRendererSequenceInfo(Lcom/itextpdf/layout/renderer/LineRenderer;I)Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingTextRendererSequenceInfo;

    move-result-object v0

    .line 86
    .local v0, "info":Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingTextRendererSequenceInfo;
    iget v1, v0, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingTextRendererSequenceInfo;->numberOfSequentialTextRenderers:I

    .line 87
    .local v1, "numberOfSequentialTextRenderers":I
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingTextRendererSequenceInfo;->sequentialTextContent:Ljava/lang/String;

    .line 88
    .local v2, "sequentialTextContent":Ljava/lang/String;
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$SpecialScriptsContainingTextRendererSequenceInfo;->indicesOfFloating:Ljava/util/List;

    .line 89
    .local v3, "indicesOfFloating":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-static {v2}, Lcom/itextpdf/layout/renderer/TypographyUtils;->getPossibleBreaks(Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    .line 91
    .local v4, "possibleBreakPointsGlobal":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-static {p0, p1, v1, v4, v3}, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping;->distributePossibleBreakPointsOverSequentialTextRenderers(Lcom/itextpdf/layout/renderer/LineRenderer;IILjava/util/List;Ljava/util/List;)V

    .line 94
    return-void
.end method

.method public static resetTextSequenceIfItEnded(Ljava/util/Map;ZLcom/itextpdf/layout/renderer/IRenderer;ILcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;ZLcom/itextpdf/layout/renderer/AbstractWidthHandler;)V
    .locals 7
    .param p1, "specialScripts"    # Z
    .param p2, "childRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p3, "childPos"    # I
    .param p4, "minMaxWidthOfTextRendererSequenceHelper"    # Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;
    .param p5, "noSoftWrap"    # Z
    .param p6, "widthHandler"    # Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/layout/layout/LayoutResult;",
            ">;Z",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            "I",
            "Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;",
            "Z",
            "Lcom/itextpdf/layout/renderer/AbstractWidthHandler;",
            ")V"
        }
    .end annotation

    .line 113
    .local p0, "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    instance-of v0, p2, Lcom/itextpdf/layout/renderer/TextRenderer;

    if-eqz v0, :cond_0

    move-object v0, p2

    check-cast v0, Lcom/itextpdf/layout/renderer/TextRenderer;

    .line 114
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->textContainsSpecialScriptGlyphs(Z)Z

    move-result v0

    if-ne v0, p1, :cond_0

    .line 115
    invoke-static {p2}, Lcom/itextpdf/layout/renderer/LineRenderer;->isChildFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 116
    return-void

    .line 118
    :cond_0
    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    .line 119
    move v0, p3

    move v2, v0

    .line 120
    .local v2, "lastChildInTextSequence":I
    :goto_0
    if-ltz v2, :cond_2

    .line 121
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 122
    goto :goto_1

    .line 124
    :cond_1
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 127
    :cond_2
    :goto_1
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lcom/itextpdf/layout/layout/LayoutResult;

    .line 128
    .local v3, "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    move-object v6, p0

    move-object v5, p4

    move v1, p5

    move-object v4, p6

    .end local p0    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .end local p4    # "minMaxWidthOfTextRendererSequenceHelper":Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;
    .end local p5    # "noSoftWrap":Z
    .end local p6    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v1, "noSoftWrap":Z
    .local v4, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v5, "minMaxWidthOfTextRendererSequenceHelper":Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;
    .local v6, "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    invoke-static/range {v1 .. v6}, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping;->updateMinMaxWidthOfLineRendererAfterTextRendererSequenceProcessing(ZILcom/itextpdf/layout/layout/LayoutResult;Lcom/itextpdf/layout/renderer/AbstractWidthHandler;Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;Ljava/util/Map;)V

    .line 130
    invoke-interface {v6}, Ljava/util/Map;->clear()V

    goto :goto_2

    .line 118
    .end local v1    # "noSoftWrap":Z
    .end local v2    # "lastChildInTextSequence":I
    .end local v3    # "childResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .end local v4    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .end local v5    # "minMaxWidthOfTextRendererSequenceHelper":Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;
    .end local v6    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .restart local p0    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .restart local p4    # "minMaxWidthOfTextRendererSequenceHelper":Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;
    .restart local p5    # "noSoftWrap":Z
    .restart local p6    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    :cond_3
    move-object v6, p0

    move-object v5, p4

    move v1, p5

    move-object v4, p6

    .line 132
    .end local p0    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .end local p4    # "minMaxWidthOfTextRendererSequenceHelper":Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;
    .end local p5    # "noSoftWrap":Z
    .end local p6    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .restart local v1    # "noSoftWrap":Z
    .restart local v4    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .restart local v5    # "minMaxWidthOfTextRendererSequenceHelper":Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;
    .restart local v6    # "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    :goto_2
    return-void
.end method

.method private static updateMinMaxWidthOfLineRendererAfterTextRendererSequenceProcessing(ZILcom/itextpdf/layout/layout/LayoutResult;Lcom/itextpdf/layout/renderer/AbstractWidthHandler;Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;Ljava/util/Map;)V
    .locals 14
    .param p0, "noSoftWrap"    # Z
    .param p1, "childPos"    # I
    .param p2, "layoutResult"    # Lcom/itextpdf/layout/layout/LayoutResult;
    .param p3, "widthHandler"    # Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .param p4, "minMaxWidthOfTextRendererSequenceHelper"    # Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZI",
            "Lcom/itextpdf/layout/layout/LayoutResult;",
            "Lcom/itextpdf/layout/renderer/AbstractWidthHandler;",
            "Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/layout/layout/LayoutResult;",
            ">;)V"
        }
    .end annotation

    .line 609
    .local p5, "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    move-object/from16 v0, p4

    move-object/from16 v1, p5

    if-eqz p0, :cond_0

    .line 610
    return-void

    .line 612
    :cond_0
    move-object/from16 v2, p2

    check-cast v2, Lcom/itextpdf/layout/layout/TextLayoutResult;

    .line 613
    .local v2, "currLayoutResult":Lcom/itextpdf/layout/layout/TextLayoutResult;
    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/TextLayoutResult;->getLeftMinWidth()F

    move-result v3

    .line 614
    .local v3, "leftMinWidthCurrRenderer":F
    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/TextLayoutResult;->getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMinWidth()F

    move-result v4

    .line 615
    .local v4, "generalMinWidthCurrRenderer":F
    move v5, v3

    .line 616
    .local v5, "widthOfUnbreakableChunkSplitAcrossRenderers":F
    move v6, v4

    .line 618
    .local v6, "minWidthOfTextRendererSequence":F
    add-int/lit8 v7, p1, -0x1

    .local v7, "prevRendererIndex":I
    :goto_0
    if-ltz v7, :cond_5

    .line 619
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v1, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_4

    .line 620
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v1, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/layout/layout/TextLayoutResult;

    .line 621
    .local v8, "prevLayoutResult":Lcom/itextpdf/layout/layout/TextLayoutResult;
    invoke-virtual {v8}, Lcom/itextpdf/layout/layout/TextLayoutResult;->getLeftMinWidth()F

    move-result v9

    .line 622
    .local v9, "leftMinWidthPrevRenderer":F
    invoke-virtual {v8}, Lcom/itextpdf/layout/layout/TextLayoutResult;->getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v10

    invoke-virtual {v10}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMinWidth()F

    move-result v10

    .line 623
    .local v10, "generalMinWidthPrevRenderer":F
    invoke-virtual {v8}, Lcom/itextpdf/layout/layout/TextLayoutResult;->getRightMinWidth()F

    move-result v11

    .line 624
    .local v11, "rightMinWidthPrevRenderer":F
    invoke-static {v6, v10}, Ljava/lang/Math;->max(FF)F

    move-result v6

    .line 626
    invoke-virtual {v8}, Lcom/itextpdf/layout/layout/TextLayoutResult;->isEndsWithSplitCharacter()Z

    move-result v12

    if-nez v12, :cond_2

    .line 627
    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/TextLayoutResult;->isStartsWithSplitCharacterWhiteSpace()Z

    move-result v12

    if-nez v12, :cond_2

    .line 628
    const/high16 v12, -0x40800000    # -1.0f

    cmpl-float v13, v11, v12

    if-lez v13, :cond_1

    .line 629
    add-float/2addr v5, v11

    goto :goto_1

    .line 631
    :cond_1
    add-float/2addr v5, v9

    .line 633
    :goto_1
    invoke-static {v6, v5}, Ljava/lang/Math;->max(FF)F

    move-result v6

    .line 635
    cmpl-float v12, v11, v12

    if-lez v12, :cond_3

    .line 636
    move v5, v9

    goto :goto_2

    .line 639
    :cond_2
    move v5, v9

    .line 641
    :cond_3
    :goto_2
    move-object v2, v8

    .line 618
    .end local v8    # "prevLayoutResult":Lcom/itextpdf/layout/layout/TextLayoutResult;
    .end local v9    # "leftMinWidthPrevRenderer":F
    .end local v10    # "generalMinWidthPrevRenderer":F
    .end local v11    # "rightMinWidthPrevRenderer":F
    :cond_4
    add-int/lit8 v7, v7, -0x1

    goto :goto_0

    .line 645
    .end local v7    # "prevRendererIndex":I
    :cond_5
    iget-boolean v7, v0, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;->anythingPlacedBeforeTextRendererSequence:Z

    if-nez v7, :cond_6

    .line 646
    iget v7, v0, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;->textIndent:F

    add-float/2addr v5, v7

    .line 647
    invoke-static {v6, v5}, Ljava/lang/Math;->max(FF)F

    move-result v6

    .line 651
    :cond_6
    iget v7, v0, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;->minWidthPreSequence:F

    invoke-static {v6, v7}, Ljava/lang/Math;->max(FF)F

    move-result v7

    .line 653
    .local v7, "lineMinWidth":F
    move-object/from16 v8, p3

    iget-object v9, v8, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->minMaxWidth:Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    invoke-virtual {v9, v7}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->setChildrenMinWidth(F)V

    .line 654
    return-void
.end method

.method public static updateTextRendererSequenceAscentDescent(Lcom/itextpdf/layout/renderer/LineRenderer;Ljava/util/Map;I[FLcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;)Lcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;
    .locals 6
    .param p0, "lineRenderer"    # Lcom/itextpdf/layout/renderer/LineRenderer;
    .param p2, "childPos"    # I
    .param p3, "childAscentDescent"    # [F
    .param p4, "preTextSequenceAscentDescent"    # Lcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/renderer/LineRenderer;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "[F>;I[F",
            "Lcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;",
            ")",
            "Lcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;"
        }
    .end annotation

    .line 139
    .local p1, "textRendererSequenceAscentDescent":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;[F>;"
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 140
    .local v0, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    instance-of v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;

    if-eqz v1, :cond_1

    move-object v1, v0

    check-cast v1, Lcom/itextpdf/layout/renderer/TextRenderer;

    .line 141
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->textContainsSpecialScriptGlyphs(Z)Z

    move-result v1

    if-nez v1, :cond_1

    .line 142
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 143
    new-instance v1, Lcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;

    iget v2, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxAscent:F

    iget v3, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxDescent:F

    iget v4, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxTextAscent:F

    iget v5, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->maxTextDescent:F

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;-><init>(FFFF)V

    move-object p4, v1

    .line 147
    :cond_0
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p1, v1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 148
    :cond_1
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 149
    invoke-interface {p1}, Ljava/util/Map;->clear()V

    .line 150
    const/4 p4, 0x0

    .line 152
    :cond_2
    :goto_0
    return-object p4
.end method

.method public static updateTextRendererSequenceMinMaxWidth(Lcom/itextpdf/layout/renderer/LineRenderer;Lcom/itextpdf/layout/renderer/AbstractWidthHandler;ILcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;ZLjava/util/Map;Ljava/util/Map;F)Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;
    .locals 5
    .param p0, "lineRenderer"    # Lcom/itextpdf/layout/renderer/LineRenderer;
    .param p1, "widthHandler"    # Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .param p2, "childPos"    # I
    .param p3, "minMaxWidthOfTextRendererSequenceHelper"    # Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;
    .param p4, "anythingPlaced"    # Z
    .param p7, "textIndent"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/renderer/LineRenderer;",
            "Lcom/itextpdf/layout/renderer/AbstractWidthHandler;",
            "I",
            "Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;",
            "Z",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/layout/layout/LayoutResult;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/layout/layout/LayoutResult;",
            ">;F)",
            "Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;"
        }
    .end annotation

    .line 162
    .local p5, "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    .local p6, "specialScriptLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/LineRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 163
    .local v0, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    instance-of v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;

    if-eqz v1, :cond_4

    .line 164
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/layout/renderer/TextRenderer;

    .line 165
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->textContainsSpecialScriptGlyphs(Z)Z

    move-result v1

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    .line 166
    invoke-interface {p6}, Ljava/util/Map;->size()I

    move-result v1

    if-ne v1, v2, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    move v1, v3

    .line 167
    .local v1, "firstTextRendererWithSpecialScripts":Z
    :goto_0
    move-object v4, v0

    check-cast v4, Lcom/itextpdf/layout/renderer/TextRenderer;

    .line 168
    invoke-virtual {v4, v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->textContainsSpecialScriptGlyphs(Z)Z

    move-result v4

    if-nez v4, :cond_1

    .line 169
    invoke-interface {p5}, Ljava/util/Map;->size()I

    move-result v4

    if-ne v4, v2, :cond_1

    goto :goto_1

    :cond_1
    move v2, v3

    .line 170
    .local v2, "firstTextRendererWithoutSpecialScripts":Z
    :goto_1
    if-nez v2, :cond_2

    if-eqz v1, :cond_3

    .line 171
    :cond_2
    new-instance v3, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;

    iget-object v4, p1, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->minMaxWidth:Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    .line 172
    invoke-virtual {v4}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getChildrenMinWidth()F

    move-result v4

    invoke-direct {v3, v4, p7, p4}, Lcom/itextpdf/layout/renderer/TextSequenceWordWrapping$MinMaxWidthOfTextRendererSequenceHelper;-><init>(FFZ)V

    move-object p3, v3

    .line 174
    :cond_3
    return-object p3

    .line 176
    .end local v1    # "firstTextRendererWithSpecialScripts":Z
    .end local v2    # "firstTextRendererWithoutSpecialScripts":Z
    :cond_4
    const/4 v1, 0x0

    return-object v1
.end method

.method public static updateTextSequenceLayoutResults(Ljava/util/Map;ZLcom/itextpdf/layout/renderer/IRenderer;ILcom/itextpdf/layout/layout/LayoutResult;)V
    .locals 2
    .param p1, "specialScripts"    # Z
    .param p2, "childRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p3, "childPos"    # I
    .param p4, "childResult"    # Lcom/itextpdf/layout/layout/LayoutResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/layout/layout/LayoutResult;",
            ">;Z",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            "I",
            "Lcom/itextpdf/layout/layout/LayoutResult;",
            ")V"
        }
    .end annotation

    .line 101
    .local p0, "textRendererLayoutResults":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/layout/LayoutResult;>;"
    instance-of v0, p2, Lcom/itextpdf/layout/renderer/TextRenderer;

    if-eqz v0, :cond_0

    move-object v0, p2

    check-cast v0, Lcom/itextpdf/layout/renderer/TextRenderer;

    .line 102
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->textContainsSpecialScriptGlyphs(Z)Z

    move-result v0

    if-ne v0, p1, :cond_0

    .line 103
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    :cond_0
    return-void
.end method
