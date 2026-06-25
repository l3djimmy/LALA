.class Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat1;
.super Lcom/itextpdf/io/font/otf/OpenTableLookup;
.source "GposLookupType2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/otf/GposLookupType2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PairPosAdjustmentFormat1"
.end annotation


# instance fields
.field private gposMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;II)V
    .locals 1
    .param p1, "openReader"    # Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;
    .param p2, "lookupFlag"    # I
    .param p3, "subtableLocation"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 86
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/itextpdf/io/font/otf/OpenTableLookup;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I[I)V

    .line 83
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat1;->gposMap:Ljava/util/Map;

    .line 87
    invoke-virtual {p0, p3}, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat1;->readFormat(I)V

    .line 88
    return-void
.end method


# virtual methods
.method protected readFormat(I)V
    .locals 13
    .param p1, "subTableLocation"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 116
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v0, v0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v0

    add-int/2addr v0, p1

    .line 117
    .local v0, "coverage":I
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v1, v1, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v1

    .line 118
    .local v1, "valueFormat1":I
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v2, v2, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v2

    .line 119
    .local v2, "valueFormat2":I
    iget-object v3, p0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v3, v3, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v3

    .line 120
    .local v3, "pairSetCount":I
    iget-object v4, p0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-virtual {v4, v3, p1}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readUShortArray(II)[I

    move-result-object v4

    .line 121
    .local v4, "locationRule":[I
    iget-object v5, p0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-virtual {v5, v0}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readCoverageFormat(I)Ljava/util/List;

    move-result-object v5

    .line 122
    .local v5, "coverageList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v6, 0x0

    .local v6, "k":I
    :goto_0
    if-ge v6, v3, :cond_1

    .line 123
    iget-object v7, p0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v7, v7, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    aget v8, v4, v6

    int-to-long v8, v8

    invoke-virtual {v7, v8, v9}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 124
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 125
    .local v7, "pairs":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;>;"
    iget-object v8, p0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat1;->gposMap:Ljava/util/Map;

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    invoke-interface {v8, v9, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    iget-object v8, p0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v8, v8, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v8}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v8

    .line 127
    .local v8, "pairValueCount":I
    const/4 v9, 0x0

    .local v9, "j":I
    :goto_1
    if-ge v9, v8, :cond_0

    .line 128
    iget-object v10, p0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v10, v10, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v10}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v10

    .line 129
    .local v10, "glyph2":I
    new-instance v11, Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;

    const/4 v12, 0x0

    invoke-direct {v11, v12}, Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;-><init>(Lcom/itextpdf/io/font/otf/GposLookupType2$1;)V

    .line 130
    .local v11, "pair":Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;
    iget-object v12, p0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-static {v12, v1}, Lcom/itextpdf/io/font/otf/OtfReadCommon;->readGposValueRecord(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)Lcom/itextpdf/io/font/otf/GposValueRecord;

    move-result-object v12

    iput-object v12, v11, Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;->first:Lcom/itextpdf/io/font/otf/GposValueRecord;

    .line 131
    iget-object v12, p0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-static {v12, v2}, Lcom/itextpdf/io/font/otf/OtfReadCommon;->readGposValueRecord(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)Lcom/itextpdf/io/font/otf/GposValueRecord;

    move-result-object v12

    iput-object v12, v11, Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;->second:Lcom/itextpdf/io/font/otf/GposValueRecord;

    .line 132
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-interface {v7, v12, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    .end local v10    # "glyph2":I
    .end local v11    # "pair":Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 122
    .end local v7    # "pairs":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;>;"
    .end local v8    # "pairValueCount":I
    .end local v9    # "j":I
    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 135
    .end local v6    # "k":I
    :cond_1
    return-void
.end method

.method protected readSubTable(I)V
    .locals 0
    .param p1, "subTableLocation"    # I

    .line 140
    return-void
.end method

.method public transformOne(Lcom/itextpdf/io/font/otf/GlyphLine;)Z
    .locals 20
    .param p1, "line"    # Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 91
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget v2, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    iget v3, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-ge v2, v3, :cond_2

    iget v2, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    iget v3, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    if-ge v2, v3, :cond_0

    goto/16 :goto_0

    .line 93
    :cond_0
    const/4 v2, 0x0

    .line 94
    .local v2, "changed":Z
    iget v3, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    invoke-virtual {v1, v3}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v5

    .line 95
    .local v5, "g1":Lcom/itextpdf/io/font/otf/Glyph;
    iget-object v3, v0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat1;->gposMap:Ljava/util/Map;

    invoke-virtual {v5}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    .line 96
    .local v3, "m":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;>;"
    if-eqz v3, :cond_1

    .line 97
    new-instance v4, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;

    invoke-direct {v4}, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;-><init>()V

    move-object v11, v4

    .line 98
    .local v11, "gi":Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;
    iput-object v1, v11, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 99
    iget v4, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    iput v4, v11, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->idx:I

    .line 100
    iget-object v4, v0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget v6, v0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat1;->lookupFlag:I

    invoke-virtual {v11, v4, v6}, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->nextGlyph(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)V

    .line 101
    iget-object v4, v11, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->glyph:Lcom/itextpdf/io/font/otf/Glyph;

    if-eqz v4, :cond_1

    .line 102
    iget-object v4, v11, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->glyph:Lcom/itextpdf/io/font/otf/Glyph;

    invoke-virtual {v4}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v12, v4

    check-cast v12, Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;

    .line 103
    .local v12, "pv":Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;
    if-eqz v12, :cond_1

    .line 104
    iget-object v14, v11, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->glyph:Lcom/itextpdf/io/font/otf/Glyph;

    .line 105
    .local v14, "g2":Lcom/itextpdf/io/font/otf/Glyph;
    iget v13, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    new-instance v4, Lcom/itextpdf/io/font/otf/Glyph;

    iget-object v6, v12, Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;->first:Lcom/itextpdf/io/font/otf/GposValueRecord;

    iget v8, v6, Lcom/itextpdf/io/font/otf/GposValueRecord;->XAdvance:I

    iget-object v6, v12, Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;->first:Lcom/itextpdf/io/font/otf/GposValueRecord;

    iget v9, v6, Lcom/itextpdf/io/font/otf/GposValueRecord;->YAdvance:I

    const/4 v10, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct/range {v4 .. v10}, Lcom/itextpdf/io/font/otf/Glyph;-><init>(Lcom/itextpdf/io/font/otf/Glyph;IIIII)V

    invoke-virtual {v1, v13, v4}, Lcom/itextpdf/io/font/otf/GlyphLine;->set(ILcom/itextpdf/io/font/otf/Glyph;)Lcom/itextpdf/io/font/otf/Glyph;

    .line 106
    iget v4, v11, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->idx:I

    new-instance v13, Lcom/itextpdf/io/font/otf/Glyph;

    iget-object v6, v12, Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;->second:Lcom/itextpdf/io/font/otf/GposValueRecord;

    iget v6, v6, Lcom/itextpdf/io/font/otf/GposValueRecord;->XAdvance:I

    iget-object v7, v12, Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;->second:Lcom/itextpdf/io/font/otf/GposValueRecord;

    iget v7, v7, Lcom/itextpdf/io/font/otf/GposValueRecord;->YAdvance:I

    const/16 v19, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    move/from16 v17, v6

    move/from16 v18, v7

    invoke-direct/range {v13 .. v19}, Lcom/itextpdf/io/font/otf/Glyph;-><init>(Lcom/itextpdf/io/font/otf/Glyph;IIIII)V

    invoke-virtual {v1, v4, v13}, Lcom/itextpdf/io/font/otf/GlyphLine;->set(ILcom/itextpdf/io/font/otf/Glyph;)Lcom/itextpdf/io/font/otf/Glyph;

    .line 107
    iget v4, v11, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->idx:I

    iput v4, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    .line 108
    const/4 v2, 0x1

    .line 112
    .end local v11    # "gi":Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;
    .end local v12    # "pv":Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;
    .end local v14    # "g2":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_1
    return v2

    .line 92
    .end local v2    # "changed":Z
    .end local v3    # "m":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;>;"
    .end local v5    # "g1":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_2
    :goto_0
    const/4 v2, 0x0

    return v2
.end method
