.class public abstract Lcom/itextpdf/io/font/otf/ChainingContextualTable;
.super Lcom/itextpdf/io/font/otf/ContextualTable;
.source "ChainingContextualTable.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/itextpdf/io/font/otf/ContextualRule;",
        ">",
        "Lcom/itextpdf/io/font/otf/ContextualTable<",
        "TT;>;"
    }
.end annotation


# direct methods
.method protected constructor <init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)V
    .locals 0
    .param p1, "openReader"    # Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;
    .param p2, "lookupFlag"    # I

    .line 30
    .local p0, "this":Lcom/itextpdf/io/font/otf/ChainingContextualTable;, "Lcom/itextpdf/io/font/otf/ChainingContextualTable<TT;>;"
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/io/font/otf/ContextualTable;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)V

    .line 31
    return-void
.end method


# virtual methods
.method protected checkIfBacktrackContextMatch(Lcom/itextpdf/io/font/otf/GlyphLine;Lcom/itextpdf/io/font/otf/ContextualRule;)Z
    .locals 4
    .param p1, "line"    # Lcom/itextpdf/io/font/otf/GlyphLine;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/io/font/otf/GlyphLine;",
            "TT;)Z"
        }
    .end annotation

    .line 87
    .local p0, "this":Lcom/itextpdf/io/font/otf/ChainingContextualTable;, "Lcom/itextpdf/io/font/otf/ChainingContextualTable<TT;>;"
    .local p2, "rule":Lcom/itextpdf/io/font/otf/ContextualRule;, "TT;"
    new-instance v0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;

    invoke-direct {v0}, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;-><init>()V

    .line 88
    .local v0, "gidx":Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;
    iput-object p1, v0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 89
    iget v1, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    iput v1, v0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->idx:I

    .line 90
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_0
    invoke-virtual {p2}, Lcom/itextpdf/io/font/otf/ContextualRule;->getBacktrackContextLength()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 91
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/ChainingContextualTable;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget v3, p0, Lcom/itextpdf/io/font/otf/ChainingContextualTable;->lookupFlag:I

    invoke-virtual {v0, v2, v3}, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->previousGlyph(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)V

    .line 92
    iget-object v2, v0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->glyph:Lcom/itextpdf/io/font/otf/Glyph;

    if-eqz v2, :cond_1

    iget-object v2, v0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->glyph:Lcom/itextpdf/io/font/otf/Glyph;

    invoke-virtual {v2}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v2

    invoke-virtual {p2, v2, v1}, Lcom/itextpdf/io/font/otf/ContextualRule;->isGlyphMatchesBacktrack(II)Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_1

    .line 90
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 93
    :cond_1
    :goto_1
    const/4 v2, 0x0

    return v2

    .line 96
    .end local v1    # "j":I
    :cond_2
    const/4 v1, 0x1

    return v1
.end method

.method protected checkIfLookaheadContextMatch(Lcom/itextpdf/io/font/otf/GlyphLine;Lcom/itextpdf/io/font/otf/ContextualRule;I)Z
    .locals 4
    .param p1, "line"    # Lcom/itextpdf/io/font/otf/GlyphLine;
    .param p3, "startIdx"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/io/font/otf/GlyphLine;",
            "TT;I)Z"
        }
    .end annotation

    .line 67
    .local p0, "this":Lcom/itextpdf/io/font/otf/ChainingContextualTable;, "Lcom/itextpdf/io/font/otf/ChainingContextualTable<TT;>;"
    .local p2, "rule":Lcom/itextpdf/io/font/otf/ContextualRule;, "TT;"
    new-instance v0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;

    invoke-direct {v0}, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;-><init>()V

    .line 68
    .local v0, "gidx":Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;
    iput-object p1, v0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 69
    iput p3, v0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->idx:I

    .line 70
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_0
    invoke-virtual {p2}, Lcom/itextpdf/io/font/otf/ContextualRule;->getLookaheadContextLength()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 71
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/ChainingContextualTable;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget v3, p0, Lcom/itextpdf/io/font/otf/ChainingContextualTable;->lookupFlag:I

    invoke-virtual {v0, v2, v3}, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->nextGlyph(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)V

    .line 72
    iget-object v2, v0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->glyph:Lcom/itextpdf/io/font/otf/Glyph;

    if-eqz v2, :cond_1

    iget-object v2, v0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->glyph:Lcom/itextpdf/io/font/otf/Glyph;

    invoke-virtual {v2}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v2

    invoke-virtual {p2, v2, v1}, Lcom/itextpdf/io/font/otf/ContextualRule;->isGlyphMatchesLookahead(II)Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_1

    .line 70
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 73
    :cond_1
    :goto_1
    const/4 v2, 0x0

    return v2

    .line 76
    .end local v1    # "j":I
    :cond_2
    const/4 v1, 0x1

    return v1
.end method

.method public getMatchingContextRule(Lcom/itextpdf/io/font/otf/GlyphLine;)Lcom/itextpdf/io/font/otf/ContextualRule;
    .locals 7
    .param p1, "line"    # Lcom/itextpdf/io/font/otf/GlyphLine;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/io/font/otf/GlyphLine;",
            ")TT;"
        }
    .end annotation

    .line 35
    .local p0, "this":Lcom/itextpdf/io/font/otf/ChainingContextualTable;, "Lcom/itextpdf/io/font/otf/ChainingContextualTable<TT;>;"
    iget v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    iget v1, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    const/4 v2, 0x0

    if-lt v0, v1, :cond_0

    .line 36
    return-object v2

    .line 39
    :cond_0
    iget v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    invoke-virtual {p1, v0}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    .line 40
    .local v0, "g":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/itextpdf/io/font/otf/ChainingContextualTable;->getSetOfRulesForStartGlyph(I)Ljava/util/List;

    move-result-object v1

    .line 41
    .local v1, "rules":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/io/font/otf/ContextualRule;

    .line 42
    .local v4, "rule":Lcom/itextpdf/io/font/otf/ContextualRule;, "TT;"
    invoke-virtual {p0, p1, v4}, Lcom/itextpdf/io/font/otf/ChainingContextualTable;->checkIfContextMatch(Lcom/itextpdf/io/font/otf/GlyphLine;Lcom/itextpdf/io/font/otf/ContextualRule;)I

    move-result v5

    .line 44
    .local v5, "lastGlyphIndex":I
    const/4 v6, -0x1

    if-eq v5, v6, :cond_1

    .line 45
    invoke-virtual {p0, p1, v4, v5}, Lcom/itextpdf/io/font/otf/ChainingContextualTable;->checkIfLookaheadContextMatch(Lcom/itextpdf/io/font/otf/GlyphLine;Lcom/itextpdf/io/font/otf/ContextualRule;I)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 46
    invoke-virtual {p0, p1, v4}, Lcom/itextpdf/io/font/otf/ChainingContextualTable;->checkIfBacktrackContextMatch(Lcom/itextpdf/io/font/otf/GlyphLine;Lcom/itextpdf/io/font/otf/ContextualRule;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 48
    iget v2, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    iput v2, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .line 49
    add-int/lit8 v2, v5, 0x1

    iput v2, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    .line 50
    return-object v4

    .line 52
    .end local v4    # "rule":Lcom/itextpdf/io/font/otf/ContextualRule;, "TT;"
    .end local v5    # "lastGlyphIndex":I
    :cond_1
    goto :goto_0

    .line 54
    :cond_2
    return-object v2
.end method
