.class public Lcom/itextpdf/io/font/otf/ActualTextIterator;
.super Ljava/lang/Object;
.source "ActualTextIterator.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;",
        ">;"
    }
.end annotation


# instance fields
.field private glyphLine:Lcom/itextpdf/io/font/otf/GlyphLine;

.field private pos:I


# direct methods
.method public constructor <init>(Lcom/itextpdf/io/font/otf/GlyphLine;)V
    .locals 1
    .param p1, "glyphLine"    # Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/itextpdf/io/font/otf/ActualTextIterator;->glyphLine:Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 35
    iget v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    iput v0, p0, Lcom/itextpdf/io/font/otf/ActualTextIterator;->pos:I

    .line 36
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/io/font/otf/GlyphLine;II)V
    .locals 3
    .param p1, "glyphLine"    # Lcom/itextpdf/io/font/otf/GlyphLine;
    .param p2, "start"    # I
    .param p3, "end"    # I

    .line 39
    new-instance v0, Lcom/itextpdf/io/font/otf/GlyphLine;

    iget-object v1, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    iget-object v2, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    invoke-direct {v0, v1, v2, p2, p3}, Lcom/itextpdf/io/font/otf/GlyphLine;-><init>(Ljava/util/List;Ljava/util/List;II)V

    invoke-direct {p0, v0}, Lcom/itextpdf/io/font/otf/ActualTextIterator;-><init>(Lcom/itextpdf/io/font/otf/GlyphLine;)V

    .line 40
    return-void
.end method

.method private glyphLinePartNeedsActualText(Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;)Z
    .locals 6
    .param p1, "glyphLinePart"    # Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;

    .line 97
    iget-object v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;->actualText:Ljava/lang/String;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 98
    return v1

    .line 100
    :cond_0
    const/4 v0, 0x0

    .line 101
    .local v0, "needsActualText":Z
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 102
    .local v2, "toUnicodeMapResult":Ljava/lang/StringBuilder;
    iget v3, p1, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;->start:I

    .local v3, "i":I
    :goto_0
    iget v4, p1, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;->end:I

    if-ge v3, v4, :cond_2

    .line 103
    iget-object v4, p0, Lcom/itextpdf/io/font/otf/ActualTextIterator;->glyphLine:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget-object v4, v4, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/io/font/otf/Glyph;

    .line 104
    .local v4, "currentGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-virtual {v4}, Lcom/itextpdf/io/font/otf/Glyph;->hasValidUnicode()Z

    move-result v5

    if-nez v5, :cond_1

    .line 105
    const/4 v0, 0x1

    .line 106
    goto :goto_1

    .line 108
    :cond_1
    invoke-virtual {v4}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v5

    invoke-static {v5}, Lcom/itextpdf/io/util/TextUtil;->convertFromUtf32(I)[C

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 102
    .end local v4    # "currentGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 111
    .end local v3    # "i":I
    :cond_2
    :goto_1
    if-nez v0, :cond_3

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p1, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;->actualText:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    :cond_3
    const/4 v1, 0x1

    :cond_4
    return v1
.end method

.method private nextGlyphLinePart(I)Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;
    .locals 4
    .param p1, "pos"    # I

    .line 85
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/ActualTextIterator;->glyphLine:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v0, v0, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    const/4 v1, 0x0

    if-lt p1, v0, :cond_0

    .line 86
    return-object v1

    .line 88
    :cond_0
    move v0, p1

    .line 89
    .local v0, "startPos":I
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/ActualTextIterator;->glyphLine:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget-object v2, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/io/font/otf/GlyphLine$ActualText;

    .line 90
    .local v2, "startActualText":Lcom/itextpdf/io/font/otf/GlyphLine$ActualText;
    :goto_0
    iget-object v3, p0, Lcom/itextpdf/io/font/otf/ActualTextIterator;->glyphLine:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v3, v3, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-ge p1, v3, :cond_1

    iget-object v3, p0, Lcom/itextpdf/io/font/otf/ActualTextIterator;->glyphLine:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget-object v3, v3, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    if-ne v3, v2, :cond_1

    .line 91
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 93
    :cond_1
    new-instance v3, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;

    if-eqz v2, :cond_2

    iget-object v1, v2, Lcom/itextpdf/io/font/otf/GlyphLine$ActualText;->value:Ljava/lang/String;

    :cond_2
    invoke-direct {v3, v0, p1, v1}, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;-><init>(IILjava/lang/String;)V

    return-object v3
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .line 46
    iget v0, p0, Lcom/itextpdf/io/font/otf/ActualTextIterator;->pos:I

    iget-object v1, p0, Lcom/itextpdf/io/font/otf/ActualTextIterator;->glyphLine:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v1, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public next()Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;
    .locals 4

    .line 51
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/ActualTextIterator;->glyphLine:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget-object v0, v0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 52
    new-instance v0, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;

    iget v2, p0, Lcom/itextpdf/io/font/otf/ActualTextIterator;->pos:I

    iget-object v3, p0, Lcom/itextpdf/io/font/otf/ActualTextIterator;->glyphLine:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v3, v3, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    invoke-direct {v0, v2, v3, v1}, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;-><init>(IILjava/lang/String;)V

    .line 53
    .local v0, "result":Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/ActualTextIterator;->glyphLine:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v1, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    iput v1, p0, Lcom/itextpdf/io/font/otf/ActualTextIterator;->pos:I

    .line 54
    return-object v0

    .line 56
    .end local v0    # "result":Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;
    :cond_0
    iget v0, p0, Lcom/itextpdf/io/font/otf/ActualTextIterator;->pos:I

    invoke-direct {p0, v0}, Lcom/itextpdf/io/font/otf/ActualTextIterator;->nextGlyphLinePart(I)Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;

    move-result-object v0

    .line 57
    .local v0, "currentResult":Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;
    if-nez v0, :cond_1

    .line 58
    return-object v1

    .line 60
    :cond_1
    iget v2, v0, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;->end:I

    iput v2, p0, Lcom/itextpdf/io/font/otf/ActualTextIterator;->pos:I

    .line 62
    invoke-direct {p0, v0}, Lcom/itextpdf/io/font/otf/ActualTextIterator;->glyphLinePartNeedsActualText(Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 63
    iput-object v1, v0, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;->actualText:Ljava/lang/String;

    .line 65
    :goto_0
    iget v1, p0, Lcom/itextpdf/io/font/otf/ActualTextIterator;->pos:I

    iget-object v2, p0, Lcom/itextpdf/io/font/otf/ActualTextIterator;->glyphLine:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v2, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-ge v1, v2, :cond_2

    .line 66
    iget v1, p0, Lcom/itextpdf/io/font/otf/ActualTextIterator;->pos:I

    invoke-direct {p0, v1}, Lcom/itextpdf/io/font/otf/ActualTextIterator;->nextGlyphLinePart(I)Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;

    move-result-object v1

    .line 67
    .local v1, "nextResult":Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;
    if-eqz v1, :cond_2

    invoke-direct {p0, v1}, Lcom/itextpdf/io/font/otf/ActualTextIterator;->glyphLinePartNeedsActualText(Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 68
    iget v2, v1, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;->end:I

    iput v2, v0, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;->end:I

    .line 69
    iget v2, v1, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;->end:I

    iput v2, p0, Lcom/itextpdf/io/font/otf/ActualTextIterator;->pos:I

    .line 73
    .end local v1    # "nextResult":Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;
    goto :goto_0

    .line 75
    :cond_2
    return-object v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .line 29
    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/ActualTextIterator;->next()Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 2

    .line 81
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Operation not supported"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
