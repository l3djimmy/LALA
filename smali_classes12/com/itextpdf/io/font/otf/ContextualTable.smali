.class public abstract Lcom/itextpdf/io/font/otf/ContextualTable;
.super Ljava/lang/Object;
.source "ContextualTable.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/itextpdf/io/font/otf/ContextualRule;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected lookupFlag:I

.field protected openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;


# direct methods
.method protected constructor <init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)V
    .locals 0
    .param p1, "openReader"    # Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;
    .param p2, "lookupFlag"    # I

    .line 32
    .local p0, "this":Lcom/itextpdf/io/font/otf/ContextualTable;, "Lcom/itextpdf/io/font/otf/ContextualTable<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/itextpdf/io/font/otf/ContextualTable;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    .line 34
    iput p2, p0, Lcom/itextpdf/io/font/otf/ContextualTable;->lookupFlag:I

    .line 35
    return-void
.end method


# virtual methods
.method protected checkIfContextMatch(Lcom/itextpdf/io/font/otf/GlyphLine;Lcom/itextpdf/io/font/otf/ContextualRule;)I
    .locals 4
    .param p1, "line"    # Lcom/itextpdf/io/font/otf/GlyphLine;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/io/font/otf/GlyphLine;",
            "TT;)I"
        }
    .end annotation

    .line 85
    .local p0, "this":Lcom/itextpdf/io/font/otf/ContextualTable;, "Lcom/itextpdf/io/font/otf/ContextualTable<TT;>;"
    .local p2, "rule":Lcom/itextpdf/io/font/otf/ContextualRule;, "TT;"
    new-instance v0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;

    invoke-direct {v0}, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;-><init>()V

    .line 86
    .local v0, "gidx":Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;
    iput-object p1, v0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 87
    iget v1, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    iput v1, v0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->idx:I

    .line 90
    const/4 v1, 0x1

    .local v1, "j":I
    :goto_0
    invoke-virtual {p2}, Lcom/itextpdf/io/font/otf/ContextualRule;->getContextLength()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 91
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/ContextualTable;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget v3, p0, Lcom/itextpdf/io/font/otf/ContextualTable;->lookupFlag:I

    invoke-virtual {v0, v2, v3}, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->nextGlyph(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)V

    .line 92
    iget-object v2, v0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->glyph:Lcom/itextpdf/io/font/otf/Glyph;

    if-eqz v2, :cond_1

    iget-object v2, v0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->glyph:Lcom/itextpdf/io/font/otf/Glyph;

    invoke-virtual {v2}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v2

    invoke-virtual {p2, v2, v1}, Lcom/itextpdf/io/font/otf/ContextualRule;->isGlyphMatchesInput(II)Z

    move-result v2

    if-nez v2, :cond_0

    .line 93
    goto :goto_1

    .line 90
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 97
    :cond_1
    :goto_1
    invoke-virtual {p2}, Lcom/itextpdf/io/font/otf/ContextualRule;->getContextLength()I

    move-result v2

    if-ne v1, v2, :cond_2

    const/4 v2, 0x1

    goto :goto_2

    :cond_2
    const/4 v2, 0x0

    .line 98
    .local v2, "isMatch":Z
    :goto_2
    if-eqz v2, :cond_3

    .line 99
    iget v3, v0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->idx:I

    return v3

    .line 101
    :cond_3
    const/4 v3, -0x1

    return v3
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

    .line 48
    .local p0, "this":Lcom/itextpdf/io/font/otf/ContextualTable;, "Lcom/itextpdf/io/font/otf/ContextualTable<TT;>;"
    iget v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    iget v1, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    const/4 v2, 0x0

    if-lt v0, v1, :cond_0

    .line 49
    return-object v2

    .line 52
    :cond_0
    iget v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    invoke-virtual {p1, v0}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    .line 53
    .local v0, "g":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/itextpdf/io/font/otf/ContextualTable;->getSetOfRulesForStartGlyph(I)Ljava/util/List;

    move-result-object v1

    .line 54
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

    .line 55
    .local v4, "rule":Lcom/itextpdf/io/font/otf/ContextualRule;, "TT;"
    invoke-virtual {p0, p1, v4}, Lcom/itextpdf/io/font/otf/ContextualTable;->checkIfContextMatch(Lcom/itextpdf/io/font/otf/GlyphLine;Lcom/itextpdf/io/font/otf/ContextualRule;)I

    move-result v5

    .line 56
    .local v5, "lastGlyphIndex":I
    const/4 v6, -0x1

    if-eq v5, v6, :cond_1

    .line 57
    iget v2, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    iput v2, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .line 58
    add-int/lit8 v2, v5, 0x1

    iput v2, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    .line 59
    return-object v4

    .line 61
    .end local v4    # "rule":Lcom/itextpdf/io/font/otf/ContextualRule;, "TT;"
    .end local v5    # "lastGlyphIndex":I
    :cond_1
    goto :goto_0

    .line 63
    :cond_2
    return-object v2
.end method

.method protected abstract getSetOfRulesForStartGlyph(I)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation
.end method
