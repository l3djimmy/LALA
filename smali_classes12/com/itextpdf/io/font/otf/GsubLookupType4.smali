.class public Lcom/itextpdf/io/font/otf/GsubLookupType4;
.super Lcom/itextpdf/io/font/otf/OpenTableLookup;
.source "GsubLookupType4.java"


# instance fields
.field private ligatures:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "[I>;>;"
        }
    .end annotation
.end field


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

    .line 41
    invoke-direct {p0, p1, p2, p3}, Lcom/itextpdf/io/font/otf/OpenTableLookup;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I[I)V

    .line 42
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/GsubLookupType4;->ligatures:Ljava/util/Map;

    .line 43
    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/GsubLookupType4;->readSubTables()V

    .line 44
    return-void
.end method


# virtual methods
.method protected readSubTable(I)V
    .locals 14
    .param p1, "subTableLocation"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 82
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GsubLookupType4;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v0, v0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 84
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GsubLookupType4;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v0, v0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    .line 85
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GsubLookupType4;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v0, v0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v0

    add-int/2addr v0, p1

    .line 86
    .local v0, "coverage":I
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/GsubLookupType4;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v1, v1, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v1

    .line 87
    .local v1, "ligSetCount":I
    new-array v2, v1, [I

    .line 88
    .local v2, "ligatureSet":[I
    const/4 v3, 0x0

    .local v3, "k":I
    :goto_0
    if-ge v3, v1, :cond_0

    .line 89
    iget-object v4, p0, Lcom/itextpdf/io/font/otf/GsubLookupType4;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v4, v4, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v4

    add-int/2addr v4, p1

    aput v4, v2, v3

    .line 88
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 91
    .end local v3    # "k":I
    :cond_0
    iget-object v3, p0, Lcom/itextpdf/io/font/otf/GsubLookupType4;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-virtual {v3, v0}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readCoverageFormat(I)Ljava/util/List;

    move-result-object v3

    .line 92
    .local v3, "coverageGlyphIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v4, 0x0

    .local v4, "k":I
    :goto_1
    if-ge v4, v1, :cond_4

    .line 93
    iget-object v5, p0, Lcom/itextpdf/io/font/otf/GsubLookupType4;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v5, v5, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    aget v6, v2, v4

    int-to-long v6, v6

    invoke-virtual {v5, v6, v7}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 94
    iget-object v5, p0, Lcom/itextpdf/io/font/otf/GsubLookupType4;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v5, v5, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v5}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v5

    .line 95
    .local v5, "ligatureCount":I
    new-array v6, v5, [I

    .line 96
    .local v6, "ligature":[I
    const/4 v7, 0x0

    .local v7, "j":I
    :goto_2
    if-ge v7, v5, :cond_1

    .line 97
    iget-object v8, p0, Lcom/itextpdf/io/font/otf/GsubLookupType4;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v8, v8, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v8}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v8

    aget v9, v2, v4

    add-int/2addr v8, v9

    aput v8, v6, v7

    .line 96
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 99
    .end local v7    # "j":I
    :cond_1
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 100
    .local v7, "components":Ljava/util/List;, "Ljava/util/List<[I>;"
    const/4 v8, 0x0

    .local v8, "j":I
    :goto_3
    if-ge v8, v5, :cond_3

    .line 101
    iget-object v9, p0, Lcom/itextpdf/io/font/otf/GsubLookupType4;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v9, v9, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    aget v10, v6, v8

    int-to-long v10, v10

    invoke-virtual {v9, v10, v11}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 102
    iget-object v9, p0, Lcom/itextpdf/io/font/otf/GsubLookupType4;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v9, v9, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v9}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v9

    .line 103
    .local v9, "ligGlyph":I
    iget-object v10, p0, Lcom/itextpdf/io/font/otf/GsubLookupType4;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v10, v10, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v10}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v10

    .line 104
    .local v10, "compCount":I
    new-array v11, v10, [I

    .line 105
    .local v11, "component":[I
    const/4 v12, 0x0

    aput v9, v11, v12

    .line 106
    const/4 v12, 0x1

    .local v12, "i":I
    :goto_4
    if-ge v12, v10, :cond_2

    .line 107
    iget-object v13, p0, Lcom/itextpdf/io/font/otf/GsubLookupType4;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v13, v13, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v13}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v13

    aput v13, v11, v12

    .line 106
    add-int/lit8 v12, v12, 0x1

    goto :goto_4

    .line 109
    .end local v12    # "i":I
    :cond_2
    invoke-interface {v7, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    .end local v9    # "ligGlyph":I
    .end local v10    # "compCount":I
    .end local v11    # "component":[I
    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    .line 111
    .end local v8    # "j":I
    :cond_3
    iget-object v8, p0, Lcom/itextpdf/io/font/otf/GsubLookupType4;->ligatures:Ljava/util/Map;

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    invoke-interface {v8, v9, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    .end local v5    # "ligatureCount":I
    .end local v6    # "ligature":[I
    .end local v7    # "components":Ljava/util/List;, "Ljava/util/List<[I>;"
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 113
    .end local v4    # "k":I
    :cond_4
    return-void
.end method

.method public transformOne(Lcom/itextpdf/io/font/otf/GlyphLine;)Z
    .locals 11
    .param p1, "line"    # Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 48
    iget v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    iget v1, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    const/4 v2, 0x0

    if-lt v0, v1, :cond_0

    .line 49
    return v2

    .line 50
    :cond_0
    const/4 v0, 0x0

    .line 51
    .local v0, "changed":Z
    iget v1, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    invoke-virtual {p1, v1}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v1

    .line 52
    .local v1, "g":Lcom/itextpdf/io/font/otf/Glyph;
    const/4 v3, 0x0

    .line 53
    .local v3, "match":Z
    iget-object v4, p0, Lcom/itextpdf/io/font/otf/GsubLookupType4;->ligatures:Ljava/util/Map;

    invoke-virtual {v1}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    iget-object v4, p0, Lcom/itextpdf/io/font/otf/GsubLookupType4;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-virtual {v1}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v5

    iget v6, p0, Lcom/itextpdf/io/font/otf/GsubLookupType4;->lookupFlag:I

    invoke-virtual {v4, v5, v6}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->isSkip(II)Z

    move-result v4

    if-nez v4, :cond_5

    .line 54
    new-instance v4, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;

    invoke-direct {v4}, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;-><init>()V

    .line 55
    .local v4, "gidx":Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;
    iput-object p1, v4, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 56
    iget-object v5, p0, Lcom/itextpdf/io/font/otf/GsubLookupType4;->ligatures:Ljava/util/Map;

    invoke-virtual {v1}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 57
    .local v5, "ligs":Ljava/util/List;, "Ljava/util/List<[I>;"
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_5

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [I

    .line 58
    .local v7, "lig":[I
    const/4 v3, 0x1

    .line 59
    iget v8, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    iput v8, v4, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->idx:I

    .line 60
    const/4 v8, 0x1

    .local v8, "j":I
    :goto_1
    array-length v9, v7

    if-ge v8, v9, :cond_3

    .line 61
    iget-object v9, p0, Lcom/itextpdf/io/font/otf/GsubLookupType4;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget v10, p0, Lcom/itextpdf/io/font/otf/GsubLookupType4;->lookupFlag:I

    invoke-virtual {v4, v9, v10}, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->nextGlyph(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)V

    .line 62
    iget-object v9, v4, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->glyph:Lcom/itextpdf/io/font/otf/Glyph;

    if-eqz v9, :cond_2

    iget-object v9, v4, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->glyph:Lcom/itextpdf/io/font/otf/Glyph;

    invoke-virtual {v9}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v9

    aget v10, v7, v8

    if-eq v9, v10, :cond_1

    goto :goto_2

    .line 60
    :cond_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 63
    :cond_2
    :goto_2
    const/4 v3, 0x0

    .line 64
    nop

    .line 67
    .end local v8    # "j":I
    :cond_3
    if-eqz v3, :cond_4

    .line 68
    iget-object v6, p0, Lcom/itextpdf/io/font/otf/GsubLookupType4;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget v8, p0, Lcom/itextpdf/io/font/otf/GsubLookupType4;->lookupFlag:I

    array-length v9, v7

    add-int/lit8 v9, v9, -0x1

    aget v2, v7, v2

    invoke-virtual {p1, v6, v8, v9, v2}, Lcom/itextpdf/io/font/otf/GlyphLine;->substituteManyToOne(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;III)V

    .line 69
    goto :goto_3

    .line 71
    .end local v7    # "lig":[I
    :cond_4
    goto :goto_0

    .line 73
    .end local v4    # "gidx":Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;
    .end local v5    # "ligs":Ljava/util/List;, "Ljava/util/List<[I>;"
    :cond_5
    :goto_3
    if-eqz v3, :cond_6

    .line 74
    const/4 v0, 0x1

    .line 76
    :cond_6
    iget v2, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    .line 77
    return v0
.end method
