.class public Lcom/itextpdf/io/font/otf/GsubLookupType1;
.super Lcom/itextpdf/io/font/otf/OpenTableLookup;
.source "GsubLookupType1.java"


# instance fields
.field private substMap:Lcom/itextpdf/io/util/IntHashtable;


# direct methods
.method public constructor <init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I[I)V
    .locals 1
    .param p1, "openReader"    # Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;
    .param p2, "lookupFlag"    # I
    .param p3, "subTableLocations"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lcom/itextpdf/io/font/otf/OpenTableLookup;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I[I)V

    .line 35
    new-instance v0, Lcom/itextpdf/io/util/IntHashtable;

    invoke-direct {v0}, Lcom/itextpdf/io/util/IntHashtable;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/GsubLookupType1;->substMap:Lcom/itextpdf/io/util/IntHashtable;

    .line 36
    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/GsubLookupType1;->readSubTables()V

    .line 37
    return-void
.end method


# virtual methods
.method public hasSubstitution(I)Z
    .locals 1
    .param p1, "index"    # I

    .line 89
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GsubLookupType1;->substMap:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/util/IntHashtable;->containsKey(I)Z

    move-result v0

    return v0
.end method

.method protected readSubTable(I)V
    .locals 9
    .param p1, "subTableLocation"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 61
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GsubLookupType1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v0, v0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 62
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GsubLookupType1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v0, v0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v0

    .line 63
    .local v0, "substFormat":I
    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 64
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/GsubLookupType1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v1, v1, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v1

    .line 65
    .local v1, "coverage":I
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GsubLookupType1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v2, v2, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v2

    .line 66
    .local v2, "deltaGlyphID":I
    iget-object v3, p0, Lcom/itextpdf/io/font/otf/GsubLookupType1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    add-int v4, p1, v1

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readCoverageFormat(I)Ljava/util/List;

    move-result-object v3

    .line 67
    .local v3, "coverageGlyphIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 68
    .local v5, "coverageGlyphId":I
    add-int v6, v5, v2

    .line 69
    .local v6, "substituteGlyphId":I
    iget-object v7, p0, Lcom/itextpdf/io/font/otf/GsubLookupType1;->substMap:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v7, v5, v6}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 70
    .end local v5    # "coverageGlyphId":I
    .end local v6    # "substituteGlyphId":I
    goto :goto_0

    .line 71
    .end local v1    # "coverage":I
    .end local v2    # "deltaGlyphID":I
    .end local v3    # "coverageGlyphIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_0
    goto :goto_3

    :cond_1
    const/4 v1, 0x2

    if-ne v0, v1, :cond_4

    .line 72
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/GsubLookupType1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v1, v1, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v1

    .line 73
    .restart local v1    # "coverage":I
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GsubLookupType1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v2, v2, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v2

    .line 74
    .local v2, "glyphCount":I
    new-array v3, v2, [I

    .line 75
    .local v3, "substitute":[I
    const/4 v4, 0x0

    .local v4, "k":I
    :goto_1
    if-ge v4, v2, :cond_2

    .line 76
    iget-object v5, p0, Lcom/itextpdf/io/font/otf/GsubLookupType1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v5, v5, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v5}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v5

    aput v5, v3, v4

    .line 75
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 78
    .end local v4    # "k":I
    :cond_2
    iget-object v4, p0, Lcom/itextpdf/io/font/otf/GsubLookupType1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    add-int v5, p1, v1

    invoke-virtual {v4, v5}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readCoverageFormat(I)Ljava/util/List;

    move-result-object v4

    .line 79
    .local v4, "coverageGlyphIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v5, 0x0

    .local v5, "k":I
    :goto_2
    if-ge v5, v2, :cond_3

    .line 80
    iget-object v6, p0, Lcom/itextpdf/io/font/otf/GsubLookupType1;->substMap:Lcom/itextpdf/io/util/IntHashtable;

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    aget v8, v3, v5

    invoke-virtual {v6, v7, v8}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 79
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 82
    .end local v1    # "coverage":I
    .end local v2    # "glyphCount":I
    .end local v3    # "substitute":[I
    .end local v4    # "coverageGlyphIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v5    # "k":I
    :cond_3
    nop

    .line 85
    :goto_3
    return-void

    .line 83
    :cond_4
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Bad substFormat: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public transformOne(Lcom/itextpdf/io/font/otf/GlyphLine;)Z
    .locals 5
    .param p1, "line"    # Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 41
    iget v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    iget v1, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-lt v0, v1, :cond_0

    .line 42
    const/4 v0, 0x0

    return v0

    .line 44
    :cond_0
    iget v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    invoke-virtual {p1, v0}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    .line 45
    .local v0, "g":Lcom/itextpdf/io/font/otf/Glyph;
    const/4 v1, 0x0

    .line 46
    .local v1, "changed":Z
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GsubLookupType1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v3

    iget v4, p0, Lcom/itextpdf/io/font/otf/GsubLookupType1;->lookupFlag:I

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->isSkip(II)Z

    move-result v2

    if-nez v2, :cond_1

    .line 47
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GsubLookupType1;->substMap:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/io/util/IntHashtable;->get(I)I

    move-result v2

    .line 50
    .local v2, "substCode":I
    if-eqz v2, :cond_1

    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v3

    if-eq v2, v3, :cond_1

    .line 51
    iget-object v3, p0, Lcom/itextpdf/io/font/otf/GsubLookupType1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-virtual {p1, v3, v2}, Lcom/itextpdf/io/font/otf/GlyphLine;->substituteOneToOne(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)V

    .line 52
    const/4 v1, 0x1

    .line 55
    .end local v2    # "substCode":I
    :cond_1
    iget v2, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    .line 56
    return v1
.end method
