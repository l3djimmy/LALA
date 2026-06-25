.class public Lcom/itextpdf/io/font/otf/GposLookupType1;
.super Lcom/itextpdf/io/font/otf/OpenTableLookup;
.source "GposLookupType1.java"


# instance fields
.field private valueRecordMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/io/font/otf/GposValueRecord;",
            ">;"
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

    .line 40
    invoke-direct {p0, p1, p2, p3}, Lcom/itextpdf/io/font/otf/OpenTableLookup;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I[I)V

    .line 36
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/GposLookupType1;->valueRecordMap:Ljava/util/Map;

    .line 41
    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/GposLookupType1;->readSubTables()V

    .line 42
    return-void
.end method


# virtual methods
.method protected readSubTable(I)V
    .locals 10
    .param p1, "subTableLocation"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 69
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GposLookupType1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v0, v0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 70
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GposLookupType1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v0, v0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v0

    .line 71
    .local v0, "subTableFormat":I
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/GposLookupType1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v1, v1, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v1

    .line 72
    .local v1, "coverageOffset":I
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GposLookupType1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v2, v2, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v2

    .line 73
    .local v2, "valueFormat":I
    const/4 v3, 0x1

    if-ne v0, v3, :cond_1

    .line 74
    iget-object v3, p0, Lcom/itextpdf/io/font/otf/GposLookupType1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-static {v3, v2}, Lcom/itextpdf/io/font/otf/OtfReadCommon;->readGposValueRecord(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)Lcom/itextpdf/io/font/otf/GposValueRecord;

    move-result-object v3

    .line 75
    .local v3, "valueRecord":Lcom/itextpdf/io/font/otf/GposValueRecord;
    iget-object v4, p0, Lcom/itextpdf/io/font/otf/GposLookupType1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    add-int v5, p1, v1

    invoke-virtual {v4, v5}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readCoverageFormat(I)Ljava/util/List;

    move-result-object v4

    .line 76
    .local v4, "coverageGlyphIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    .line 77
    .local v6, "glyphId":Ljava/lang/Integer;
    iget-object v7, p0, Lcom/itextpdf/io/font/otf/GposLookupType1;->valueRecordMap:Ljava/util/Map;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v7, v8, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    .end local v6    # "glyphId":Ljava/lang/Integer;
    goto :goto_0

    .line 79
    .end local v3    # "valueRecord":Lcom/itextpdf/io/font/otf/GposValueRecord;
    .end local v4    # "coverageGlyphIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_0
    goto :goto_3

    :cond_1
    const/4 v3, 0x2

    if-ne v0, v3, :cond_4

    .line 80
    iget-object v3, p0, Lcom/itextpdf/io/font/otf/GposLookupType1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v3, v3, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v3

    .line 81
    .local v3, "valueCount":I
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 82
    .local v4, "valueRecords":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/GposValueRecord;>;"
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    if-ge v5, v3, :cond_2

    .line 83
    iget-object v6, p0, Lcom/itextpdf/io/font/otf/GposLookupType1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-static {v6, v2}, Lcom/itextpdf/io/font/otf/OtfReadCommon;->readGposValueRecord(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)Lcom/itextpdf/io/font/otf/GposValueRecord;

    move-result-object v6

    .line 84
    .local v6, "valueRecord":Lcom/itextpdf/io/font/otf/GposValueRecord;
    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    .end local v6    # "valueRecord":Lcom/itextpdf/io/font/otf/GposValueRecord;
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 86
    .end local v5    # "i":I
    :cond_2
    iget-object v5, p0, Lcom/itextpdf/io/font/otf/GposLookupType1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    add-int v6, p1, v1

    invoke-virtual {v5, v6}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readCoverageFormat(I)Ljava/util/List;

    move-result-object v5

    .line 87
    .local v5, "coverageGlyphIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_2
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v7

    if-ge v6, v7, :cond_3

    .line 88
    iget-object v7, p0, Lcom/itextpdf/io/font/otf/GposLookupType1;->valueRecordMap:Ljava/util/Map;

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    invoke-interface {v7, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 90
    .end local v3    # "valueCount":I
    .end local v4    # "valueRecords":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/GposValueRecord;>;"
    .end local v5    # "coverageGlyphIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v6    # "i":I
    :cond_3
    nop

    .line 93
    :goto_3
    return-void

    .line 91
    :cond_4
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Bad subtable format identifier: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public transformOne(Lcom/itextpdf/io/font/otf/GlyphLine;)Z
    .locals 6
    .param p1, "line"    # Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 46
    iget v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    iget v1, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    const/4 v2, 0x0

    if-lt v0, v1, :cond_0

    .line 47
    return v2

    .line 49
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GposLookupType1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget v1, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    invoke-virtual {p1, v1}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v1

    iget v3, p0, Lcom/itextpdf/io/font/otf/GposLookupType1;->lookupFlag:I

    invoke-virtual {v0, v1, v3}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->isSkip(II)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 50
    iget v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    .line 51
    return v2

    .line 53
    :cond_1
    iget v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    invoke-virtual {p1, v0}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v0

    .line 54
    .local v0, "glyphCode":I
    const/4 v1, 0x0

    .line 55
    .local v1, "positionApplied":Z
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GposLookupType1;->valueRecordMap:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/io/font/otf/GposValueRecord;

    .line 56
    .local v2, "valueRecord":Lcom/itextpdf/io/font/otf/GposValueRecord;
    if-eqz v2, :cond_2

    .line 57
    new-instance v3, Lcom/itextpdf/io/font/otf/Glyph;

    iget v4, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    invoke-virtual {p1, v4}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/itextpdf/io/font/otf/Glyph;-><init>(Lcom/itextpdf/io/font/otf/Glyph;)V

    .line 58
    .local v3, "newGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-virtual {v3}, Lcom/itextpdf/io/font/otf/Glyph;->getXAdvance()S

    move-result v4

    iget v5, v2, Lcom/itextpdf/io/font/otf/GposValueRecord;->XAdvance:I

    add-int/2addr v4, v5

    int-to-short v4, v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/font/otf/Glyph;->setXAdvance(S)V

    .line 59
    invoke-virtual {v3}, Lcom/itextpdf/io/font/otf/Glyph;->getYAdvance()S

    move-result v4

    iget v5, v2, Lcom/itextpdf/io/font/otf/GposValueRecord;->YAdvance:I

    add-int/2addr v4, v5

    int-to-short v4, v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/font/otf/Glyph;->setYAdvance(S)V

    .line 60
    iget v4, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    invoke-virtual {p1, v4, v3}, Lcom/itextpdf/io/font/otf/GlyphLine;->set(ILcom/itextpdf/io/font/otf/Glyph;)Lcom/itextpdf/io/font/otf/Glyph;

    .line 61
    const/4 v1, 0x1

    .line 63
    .end local v3    # "newGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_2
    iget v3, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    .line 64
    return v1
.end method
