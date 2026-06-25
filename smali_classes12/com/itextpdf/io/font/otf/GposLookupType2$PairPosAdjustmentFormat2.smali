.class Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat2;
.super Lcom/itextpdf/io/font/otf/OpenTableLookup;
.source "GposLookupType2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/otf/GposLookupType2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PairPosAdjustmentFormat2"
.end annotation


# instance fields
.field private classDef1:Lcom/itextpdf/io/font/otf/OtfClass;

.field private classDef2:Lcom/itextpdf/io/font/otf/OtfClass;

.field private coverageSet:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private posSubs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "[",
            "Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;",
            ">;"
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

    .line 150
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/itextpdf/io/font/otf/OpenTableLookup;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I[I)V

    .line 147
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat2;->posSubs:Ljava/util/Map;

    .line 151
    invoke-virtual {p0, p3}, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat2;->readFormat(I)V

    .line 152
    return-void
.end method


# virtual methods
.method protected readFormat(I)V
    .locals 12
    .param p1, "subTableLocation"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 182
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat2;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v0, v0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v0

    add-int/2addr v0, p1

    .line 183
    .local v0, "coverage":I
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat2;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v1, v1, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v1

    .line 184
    .local v1, "valueFormat1":I
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat2;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v2, v2, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v2

    .line 185
    .local v2, "valueFormat2":I
    iget-object v3, p0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat2;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v3, v3, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v3

    add-int/2addr v3, p1

    .line 186
    .local v3, "locationClass1":I
    iget-object v4, p0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat2;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v4, v4, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v4

    add-int/2addr v4, p1

    .line 187
    .local v4, "locationClass2":I
    iget-object v5, p0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat2;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v5, v5, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v5}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v5

    .line 188
    .local v5, "class1Count":I
    iget-object v6, p0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat2;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v6, v6, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v6}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v6

    .line 190
    .local v6, "class2Count":I
    const/4 v7, 0x0

    .local v7, "k":I
    :goto_0
    if-ge v7, v5, :cond_1

    .line 191
    new-array v8, v6, [Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;

    .line 192
    .local v8, "pairs":[Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;
    iget-object v9, p0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat2;->posSubs:Ljava/util/Map;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-interface {v9, v10, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    const/4 v9, 0x0

    .local v9, "j":I
    :goto_1
    if-ge v9, v6, :cond_0

    .line 194
    new-instance v10, Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;

    const/4 v11, 0x0

    invoke-direct {v10, v11}, Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;-><init>(Lcom/itextpdf/io/font/otf/GposLookupType2$1;)V

    .line 195
    .local v10, "pair":Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;
    iget-object v11, p0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat2;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-static {v11, v1}, Lcom/itextpdf/io/font/otf/OtfReadCommon;->readGposValueRecord(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)Lcom/itextpdf/io/font/otf/GposValueRecord;

    move-result-object v11

    iput-object v11, v10, Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;->first:Lcom/itextpdf/io/font/otf/GposValueRecord;

    .line 196
    iget-object v11, p0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat2;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-static {v11, v2}, Lcom/itextpdf/io/font/otf/OtfReadCommon;->readGposValueRecord(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)Lcom/itextpdf/io/font/otf/GposValueRecord;

    move-result-object v11

    iput-object v11, v10, Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;->second:Lcom/itextpdf/io/font/otf/GposValueRecord;

    .line 197
    aput-object v10, v8, v9

    .line 193
    .end local v10    # "pair":Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 190
    .end local v8    # "pairs":[Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;
    .end local v9    # "j":I
    :cond_0
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 201
    .end local v7    # "k":I
    :cond_1
    new-instance v7, Ljava/util/HashSet;

    iget-object v8, p0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat2;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-virtual {v8, v0}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readCoverageFormat(I)Ljava/util/List;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    iput-object v7, p0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat2;->coverageSet:Ljava/util/HashSet;

    .line 202
    iget-object v7, p0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat2;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-virtual {v7, v3}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readClassDefinition(I)Lcom/itextpdf/io/font/otf/OtfClass;

    move-result-object v7

    iput-object v7, p0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat2;->classDef1:Lcom/itextpdf/io/font/otf/OtfClass;

    .line 203
    iget-object v7, p0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat2;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-virtual {v7, v4}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readClassDefinition(I)Lcom/itextpdf/io/font/otf/OtfClass;

    move-result-object v7

    iput-object v7, p0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat2;->classDef2:Lcom/itextpdf/io/font/otf/OtfClass;

    .line 204
    return-void
.end method

.method protected readSubTable(I)V
    .locals 0
    .param p1, "subTableLocation"    # I

    .line 209
    return-void
.end method

.method public transformOne(Lcom/itextpdf/io/font/otf/GlyphLine;)Z
    .locals 20
    .param p1, "line"    # Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 155
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget v2, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    iget v3, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    const/4 v4, 0x0

    if-ge v2, v3, :cond_5

    iget v2, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    iget v3, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    if-ge v2, v3, :cond_0

    goto/16 :goto_0

    .line 157
    :cond_0
    iget v2, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v6

    .line 158
    .local v6, "g1":Lcom/itextpdf/io/font/otf/Glyph;
    iget-object v2, v0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat2;->coverageSet:Ljava/util/HashSet;

    invoke-virtual {v6}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 159
    return v4

    .line 160
    :cond_1
    iget-object v2, v0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat2;->classDef1:Lcom/itextpdf/io/font/otf/OtfClass;

    invoke-virtual {v6}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/io/font/otf/OtfClass;->getOtfClass(I)I

    move-result v2

    .line 161
    .local v2, "c1":I
    iget-object v3, v0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat2;->posSubs:Ljava/util/Map;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;

    .line 162
    .local v3, "pvs":[Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;
    if-nez v3, :cond_2

    .line 163
    return v4

    .line 164
    :cond_2
    new-instance v5, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;

    invoke-direct {v5}, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;-><init>()V

    move-object v12, v5

    .line 165
    .local v12, "gi":Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;
    iput-object v1, v12, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 166
    iget v5, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    iput v5, v12, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->idx:I

    .line 167
    iget-object v5, v0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat2;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget v7, v0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat2;->lookupFlag:I

    invoke-virtual {v12, v5, v7}, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->nextGlyph(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)V

    .line 168
    iget-object v5, v12, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->glyph:Lcom/itextpdf/io/font/otf/Glyph;

    if-nez v5, :cond_3

    .line 169
    return v4

    .line 170
    :cond_3
    iget-object v14, v12, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->glyph:Lcom/itextpdf/io/font/otf/Glyph;

    .line 171
    .local v14, "g2":Lcom/itextpdf/io/font/otf/Glyph;
    iget-object v5, v0, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat2;->classDef2:Lcom/itextpdf/io/font/otf/OtfClass;

    invoke-virtual {v14}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v7

    invoke-virtual {v5, v7}, Lcom/itextpdf/io/font/otf/OtfClass;->getOtfClass(I)I

    move-result v13

    .line 172
    .local v13, "c2":I
    array-length v5, v3

    if-lt v13, v5, :cond_4

    .line 173
    return v4

    .line 174
    :cond_4
    aget-object v4, v3, v13

    .line 175
    .local v4, "pv":Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;
    iget v15, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    new-instance v5, Lcom/itextpdf/io/font/otf/Glyph;

    iget-object v7, v4, Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;->first:Lcom/itextpdf/io/font/otf/GposValueRecord;

    iget v9, v7, Lcom/itextpdf/io/font/otf/GposValueRecord;->XAdvance:I

    iget-object v7, v4, Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;->first:Lcom/itextpdf/io/font/otf/GposValueRecord;

    iget v10, v7, Lcom/itextpdf/io/font/otf/GposValueRecord;->YAdvance:I

    const/4 v11, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-direct/range {v5 .. v11}, Lcom/itextpdf/io/font/otf/Glyph;-><init>(Lcom/itextpdf/io/font/otf/Glyph;IIIII)V

    invoke-virtual {v1, v15, v5}, Lcom/itextpdf/io/font/otf/GlyphLine;->set(ILcom/itextpdf/io/font/otf/Glyph;)Lcom/itextpdf/io/font/otf/Glyph;

    .line 176
    iget v5, v12, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->idx:I

    move v7, v13

    .end local v13    # "c2":I
    .local v7, "c2":I
    new-instance v13, Lcom/itextpdf/io/font/otf/Glyph;

    iget-object v8, v4, Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;->second:Lcom/itextpdf/io/font/otf/GposValueRecord;

    iget v8, v8, Lcom/itextpdf/io/font/otf/GposValueRecord;->XAdvance:I

    iget-object v9, v4, Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;->second:Lcom/itextpdf/io/font/otf/GposValueRecord;

    iget v9, v9, Lcom/itextpdf/io/font/otf/GposValueRecord;->YAdvance:I

    const/16 v19, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    move/from16 v17, v8

    move/from16 v18, v9

    invoke-direct/range {v13 .. v19}, Lcom/itextpdf/io/font/otf/Glyph;-><init>(Lcom/itextpdf/io/font/otf/Glyph;IIIII)V

    invoke-virtual {v1, v5, v13}, Lcom/itextpdf/io/font/otf/GlyphLine;->set(ILcom/itextpdf/io/font/otf/Glyph;)Lcom/itextpdf/io/font/otf/Glyph;

    .line 177
    iget v5, v12, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->idx:I

    iput v5, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    .line 178
    const/4 v5, 0x1

    return v5

    .line 156
    .end local v2    # "c1":I
    .end local v3    # "pvs":[Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;
    .end local v4    # "pv":Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;
    .end local v6    # "g1":Lcom/itextpdf/io/font/otf/Glyph;
    .end local v7    # "c2":I
    .end local v12    # "gi":Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;
    .end local v14    # "g2":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_5
    :goto_0
    return v4
.end method
