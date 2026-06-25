.class public Lcom/itextpdf/io/font/otf/GposLookupType8;
.super Lcom/itextpdf/io/font/otf/GposLookupType7;
.source "GposLookupType8.java"


# direct methods
.method protected constructor <init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I[I)V
    .locals 1
    .param p1, "openReader"    # Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;
    .param p2, "lookupFlag"    # I
    .param p3, "subTableLocations"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/io/exceptions/IOException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 48
    invoke-direct {p0, p1, p2, p3}, Lcom/itextpdf/io/font/otf/GposLookupType7;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I[I)V

    .line 49
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/GposLookupType8;->subTables:Ljava/util/List;

    .line 50
    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/GposLookupType8;->readSubTables()V

    .line 51
    return-void
.end method

.method private readSubTableFormat1(I)V
    .locals 20
    .param p1, "subTableLocation"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 121
    move-object/from16 v0, p0

    move/from16 v1, p1

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 123
    .local v2, "posMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/io/font/otf/ContextualPositionRule;>;>;"
    iget-object v3, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v3, v3, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v3

    .line 124
    .local v3, "coverageOffset":I
    iget-object v4, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v4, v4, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v4

    .line 125
    .local v4, "chainPosRuleSetCount":I
    iget-object v5, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-virtual {v5, v4, v1}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readUShortArray(II)[I

    move-result-object v5

    .line 127
    .local v5, "chainPosRuleSetOffsets":[I
    iget-object v6, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    add-int v7, v1, v3

    invoke-virtual {v6, v7}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readCoverageFormat(I)Ljava/util/List;

    move-result-object v6

    .line 128
    .local v6, "coverageGlyphIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    if-ge v7, v4, :cond_1

    .line 129
    iget-object v8, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v8, v8, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    aget v9, v5, v7

    int-to-long v9, v9

    invoke-virtual {v8, v9, v10}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 130
    iget-object v8, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v8, v8, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v8}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v8

    .line 131
    .local v8, "chainPosRuleCount":I
    iget-object v9, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    aget v10, v5, v7

    invoke-virtual {v9, v8, v10}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readUShortArray(II)[I

    move-result-object v9

    .line 133
    .local v9, "chainPosRuleOffsets":[I
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 134
    .local v10, "chainPosRuleSet":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/ContextualPositionRule;>;"
    const/4 v11, 0x0

    .local v11, "j":I
    :goto_1
    if-ge v11, v8, :cond_0

    .line 135
    iget-object v12, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v12, v12, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    aget v13, v9, v11

    int-to-long v13, v13

    invoke-virtual {v12, v13, v14}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 136
    iget-object v12, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v12, v12, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v12}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v12

    .line 137
    .local v12, "backtrackGlyphCount":I
    iget-object v13, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-virtual {v13, v12}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readUShortArray(I)[I

    move-result-object v13

    .line 138
    .local v13, "backtrackGlyphIds":[I
    iget-object v14, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v14, v14, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v14}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v14

    .line 139
    .local v14, "inputGlyphCount":I
    iget-object v15, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    add-int/lit8 v1, v14, -0x1

    invoke-virtual {v15, v1}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readUShortArray(I)[I

    move-result-object v1

    .line 140
    .local v1, "inputGlyphIds":[I
    iget-object v15, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v15, v15, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v15}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v15

    .line 141
    .local v15, "lookAheadGlyphCount":I
    move/from16 v16, v3

    .end local v3    # "coverageOffset":I
    .local v16, "coverageOffset":I
    iget-object v3, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-virtual {v3, v15}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readUShortArray(I)[I

    move-result-object v3

    .line 142
    .local v3, "lookAheadGlyphIds":[I
    move/from16 v17, v4

    .end local v4    # "chainPosRuleSetCount":I
    .local v17, "chainPosRuleSetCount":I
    iget-object v4, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v4, v4, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v4

    .line 143
    .local v4, "posCount":I
    move-object/from16 v18, v5

    .end local v5    # "chainPosRuleSetOffsets":[I
    .local v18, "chainPosRuleSetOffsets":[I
    iget-object v5, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-virtual {v5, v4}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readPosLookupRecords(I)[Lcom/itextpdf/io/font/otf/PosLookupRecord;

    move-result-object v5

    .line 145
    .local v5, "posLookupRecords":[Lcom/itextpdf/io/font/otf/PosLookupRecord;
    move/from16 v19, v4

    .end local v4    # "posCount":I
    .local v19, "posCount":I
    new-instance v4, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format1$PosRuleFormat1;

    invoke-direct {v4, v13, v1, v3, v5}, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format1$PosRuleFormat1;-><init>([I[I[I[Lcom/itextpdf/io/font/otf/PosLookupRecord;)V

    invoke-interface {v10, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 134
    .end local v1    # "inputGlyphIds":[I
    .end local v3    # "lookAheadGlyphIds":[I
    .end local v5    # "posLookupRecords":[Lcom/itextpdf/io/font/otf/PosLookupRecord;
    .end local v12    # "backtrackGlyphCount":I
    .end local v13    # "backtrackGlyphIds":[I
    .end local v14    # "inputGlyphCount":I
    .end local v15    # "lookAheadGlyphCount":I
    .end local v19    # "posCount":I
    add-int/lit8 v11, v11, 0x1

    move/from16 v1, p1

    move/from16 v3, v16

    move/from16 v4, v17

    move-object/from16 v5, v18

    goto :goto_1

    .end local v16    # "coverageOffset":I
    .end local v17    # "chainPosRuleSetCount":I
    .end local v18    # "chainPosRuleSetOffsets":[I
    .local v3, "coverageOffset":I
    .local v4, "chainPosRuleSetCount":I
    .local v5, "chainPosRuleSetOffsets":[I
    :cond_0
    move/from16 v16, v3

    move/from16 v17, v4

    move-object/from16 v18, v5

    .line 148
    .end local v3    # "coverageOffset":I
    .end local v4    # "chainPosRuleSetCount":I
    .end local v5    # "chainPosRuleSetOffsets":[I
    .end local v11    # "j":I
    .restart local v16    # "coverageOffset":I
    .restart local v17    # "chainPosRuleSetCount":I
    .restart local v18    # "chainPosRuleSetOffsets":[I
    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v2, v1, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    .end local v8    # "chainPosRuleCount":I
    .end local v9    # "chainPosRuleOffsets":[I
    .end local v10    # "chainPosRuleSet":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/ContextualPositionRule;>;"
    add-int/lit8 v7, v7, 0x1

    move/from16 v1, p1

    goto/16 :goto_0

    .end local v16    # "coverageOffset":I
    .end local v17    # "chainPosRuleSetCount":I
    .end local v18    # "chainPosRuleSetOffsets":[I
    .restart local v3    # "coverageOffset":I
    .restart local v4    # "chainPosRuleSetCount":I
    .restart local v5    # "chainPosRuleSetOffsets":[I
    :cond_1
    move/from16 v16, v3

    move/from16 v17, v4

    move-object/from16 v18, v5

    .line 151
    .end local v3    # "coverageOffset":I
    .end local v4    # "chainPosRuleSetCount":I
    .end local v5    # "chainPosRuleSetOffsets":[I
    .end local v7    # "i":I
    .restart local v16    # "coverageOffset":I
    .restart local v17    # "chainPosRuleSetCount":I
    .restart local v18    # "chainPosRuleSetOffsets":[I
    iget-object v1, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->subTables:Ljava/util/List;

    new-instance v3, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format1;

    iget-object v4, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget v5, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->lookupFlag:I

    invoke-direct {v3, v4, v5, v2}, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format1;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;ILjava/util/Map;)V

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 152
    return-void
.end method

.method private readSubTableFormat3(I)V
    .locals 17
    .param p1, "subTableLocation"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 155
    move-object/from16 v0, p0

    move/from16 v1, p1

    iget-object v2, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v2, v2, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v2

    .line 156
    .local v2, "backtrackGlyphCount":I
    iget-object v3, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-virtual {v3, v2, v1}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readUShortArray(II)[I

    move-result-object v3

    .line 157
    .local v3, "backtrackCoverageOffsets":[I
    iget-object v4, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v4, v4, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v4

    .line 158
    .local v4, "inputGlyphCount":I
    iget-object v5, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-virtual {v5, v4, v1}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readUShortArray(II)[I

    move-result-object v5

    .line 159
    .local v5, "inputCoverageOffsets":[I
    iget-object v6, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v6, v6, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v6}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v6

    .line 160
    .local v6, "lookaheadGlyphCount":I
    iget-object v7, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-virtual {v7, v6, v1}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readUShortArray(II)[I

    move-result-object v7

    .line 161
    .local v7, "lookaheadCoverageOffsets":[I
    iget-object v8, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v8, v8, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v8}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v8

    .line 162
    .local v8, "posCount":I
    iget-object v9, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-virtual {v9, v8}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readPosLookupRecords(I)[Lcom/itextpdf/io/font/otf/PosLookupRecord;

    move-result-object v9

    .line 164
    .local v9, "posLookupRecords":[Lcom/itextpdf/io/font/otf/PosLookupRecord;
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 165
    .local v10, "backtrackCoverages":Ljava/util/List;, "Ljava/util/List<Ljava/util/Set<Ljava/lang/Integer;>;>;"
    iget-object v11, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-virtual {v11, v3, v10}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readCoverages([ILjava/util/List;)V

    .line 167
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 168
    .local v11, "inputCoverages":Ljava/util/List;, "Ljava/util/List<Ljava/util/Set<Ljava/lang/Integer;>;>;"
    iget-object v12, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-virtual {v12, v5, v11}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readCoverages([ILjava/util/List;)V

    .line 170
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 171
    .local v12, "lookaheadCoverages":Ljava/util/List;, "Ljava/util/List<Ljava/util/Set<Ljava/lang/Integer;>;>;"
    iget-object v13, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-virtual {v13, v7, v12}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readCoverages([ILjava/util/List;)V

    .line 173
    new-instance v13, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format3$PosRuleFormat3;

    invoke-direct {v13, v10, v11, v12, v9}, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format3$PosRuleFormat3;-><init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;[Lcom/itextpdf/io/font/otf/PosLookupRecord;)V

    .line 175
    .local v13, "rule":Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format3$PosRuleFormat3;
    iget-object v14, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->subTables:Ljava/util/List;

    new-instance v15, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format3;

    iget-object v1, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    move/from16 v16, v2

    .end local v2    # "backtrackGlyphCount":I
    .local v16, "backtrackGlyphCount":I
    iget v2, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->lookupFlag:I

    invoke-direct {v15, v1, v2, v13}, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format3;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;ILcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format3$PosRuleFormat3;)V

    invoke-interface {v14, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 176
    return-void
.end method


# virtual methods
.method protected readSubTable(I)V
    .locals 4
    .param p1, "subTableLocation"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 55
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v0, v0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 56
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v0, v0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v0

    .line 57
    .local v0, "substFormat":I
    packed-switch v0, :pswitch_data_0

    .line 68
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Bad subtable format identifier: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 65
    :pswitch_0
    invoke-direct {p0, p1}, Lcom/itextpdf/io/font/otf/GposLookupType8;->readSubTableFormat3(I)V

    .line 66
    goto :goto_0

    .line 62
    :pswitch_1
    invoke-virtual {p0, p1}, Lcom/itextpdf/io/font/otf/GposLookupType8;->readSubTableFormat2(I)V

    .line 63
    goto :goto_0

    .line 59
    :pswitch_2
    invoke-direct {p0, p1}, Lcom/itextpdf/io/font/otf/GposLookupType8;->readSubTableFormat1(I)V

    .line 60
    nop

    .line 70
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected readSubTableFormat2(I)V
    .locals 27
    .param p1, "subTableLocation"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 74
    move-object/from16 v0, p0

    move/from16 v1, p1

    iget-object v2, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v2, v2, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v2

    .line 75
    .local v2, "coverageOffset":I
    iget-object v3, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v3, v3, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v3

    .line 76
    .local v3, "backtrackClassDefOffset":I
    iget-object v4, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v4, v4, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v4

    .line 77
    .local v4, "inputClassDefOffset":I
    iget-object v5, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v5, v5, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v5}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v5

    .line 78
    .local v5, "lookaheadClassDefOffset":I
    iget-object v6, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v6, v6, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v6}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v6

    .line 79
    .local v6, "chainPosClassSetCount":I
    iget-object v7, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-virtual {v7, v6, v1}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readUShortArray(II)[I

    move-result-object v7

    .line 81
    .local v7, "chainPosClassSetOffsets":[I
    new-instance v8, Ljava/util/HashSet;

    iget-object v9, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    add-int v10, v1, v2

    invoke-virtual {v9, v10}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readCoverageFormat(I)Ljava/util/List;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    move-object v13, v8

    .line 82
    .local v13, "coverageGlyphIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    iget-object v8, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    add-int v9, v1, v3

    invoke-virtual {v8, v9}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readClassDefinition(I)Lcom/itextpdf/io/font/otf/OtfClass;

    move-result-object v14

    .line 83
    .local v14, "backtrackClassDefinition":Lcom/itextpdf/io/font/otf/OtfClass;
    iget-object v8, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    add-int v9, v1, v4

    invoke-virtual {v8, v9}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readClassDefinition(I)Lcom/itextpdf/io/font/otf/OtfClass;

    move-result-object v15

    .line 84
    .local v15, "inputClassDefinition":Lcom/itextpdf/io/font/otf/OtfClass;
    iget-object v8, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    add-int v9, v1, v5

    invoke-virtual {v8, v9}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readClassDefinition(I)Lcom/itextpdf/io/font/otf/OtfClass;

    move-result-object v16

    .line 86
    .local v16, "lookaheadClassDefinition":Lcom/itextpdf/io/font/otf/OtfClass;
    new-instance v10, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;

    iget-object v11, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget v12, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->lookupFlag:I

    invoke-direct/range {v10 .. v16}, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;ILjava/util/Set;Lcom/itextpdf/io/font/otf/OtfClass;Lcom/itextpdf/io/font/otf/OtfClass;Lcom/itextpdf/io/font/otf/OtfClass;)V

    move-object/from16 v18, v10

    .line 89
    .local v18, "t":Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_0
    if-ge v8, v6, :cond_2

    .line 90
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v9

    .line 91
    .local v9, "posClassSet":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/ContextualPositionRule;>;"
    aget v10, v7, v8

    if-eqz v10, :cond_1

    .line 92
    iget-object v10, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v10, v10, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    aget v11, v7, v8

    int-to-long v11, v11

    invoke-virtual {v10, v11, v12}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 93
    iget-object v10, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v10, v10, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v10}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v10

    .line 94
    .local v10, "chainPosClassRuleCount":I
    iget-object v11, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    aget v12, v7, v8

    .line 95
    invoke-virtual {v11, v10, v12}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readUShortArray(II)[I

    move-result-object v11

    .line 97
    .local v11, "chainPosClassRuleOffsets":[I
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12, v10}, Ljava/util/ArrayList;-><init>(I)V

    move-object v9, v12

    .line 98
    const/4 v12, 0x0

    .local v12, "j":I
    :goto_1
    if-ge v12, v10, :cond_0

    .line 99
    iget-object v1, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v1, v1, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    move/from16 v23, v2

    .end local v2    # "coverageOffset":I
    .local v23, "coverageOffset":I
    aget v2, v11, v12

    move/from16 v24, v3

    .end local v3    # "backtrackClassDefOffset":I
    .local v24, "backtrackClassDefOffset":I
    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 101
    iget-object v1, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v1, v1, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v1

    .line 102
    .local v1, "backtrackClassCount":I
    iget-object v2, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-virtual {v2, v1}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readUShortArray(I)[I

    move-result-object v19

    .line 103
    .local v19, "backtrackClassIds":[I
    iget-object v2, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v2, v2, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v2

    .line 104
    .local v2, "inputClassCount":I
    iget-object v3, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    move/from16 v25, v1

    .end local v1    # "backtrackClassCount":I
    .local v25, "backtrackClassCount":I
    add-int/lit8 v1, v2, -0x1

    invoke-virtual {v3, v1}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readUShortArray(I)[I

    move-result-object v20

    .line 105
    .local v20, "inputClassIds":[I
    iget-object v1, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v1, v1, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v1

    .line 106
    .local v1, "lookAheadClassCount":I
    iget-object v3, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-virtual {v3, v1}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readUShortArray(I)[I

    move-result-object v21

    .line 107
    .local v21, "lookAheadClassIds":[I
    iget-object v3, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v3, v3, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v3

    .line 108
    .local v3, "substCount":I
    move/from16 v26, v1

    .end local v1    # "lookAheadClassCount":I
    .local v26, "lookAheadClassCount":I
    iget-object v1, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-virtual {v1, v3}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readPosLookupRecords(I)[Lcom/itextpdf/io/font/otf/PosLookupRecord;

    move-result-object v22

    .line 110
    .local v22, "posLookupRecords":[Lcom/itextpdf/io/font/otf/PosLookupRecord;
    new-instance v17, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2$PosRuleFormat2;

    invoke-direct/range {v17 .. v22}, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2$PosRuleFormat2;-><init>(Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;[I[I[I[Lcom/itextpdf/io/font/otf/PosLookupRecord;)V

    move-object/from16 v1, v18

    .end local v18    # "t":Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;
    .local v1, "t":Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;
    move-object/from16 v18, v17

    .line 111
    .local v18, "rule":Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2$PosRuleFormat2;
    move/from16 v17, v2

    move-object/from16 v2, v18

    .end local v18    # "rule":Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2$PosRuleFormat2;
    .local v2, "rule":Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2$PosRuleFormat2;
    .local v17, "inputClassCount":I
    invoke-interface {v9, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    .end local v2    # "rule":Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2$PosRuleFormat2;
    .end local v3    # "substCount":I
    .end local v17    # "inputClassCount":I
    .end local v19    # "backtrackClassIds":[I
    .end local v20    # "inputClassIds":[I
    .end local v21    # "lookAheadClassIds":[I
    .end local v22    # "posLookupRecords":[Lcom/itextpdf/io/font/otf/PosLookupRecord;
    .end local v25    # "backtrackClassCount":I
    .end local v26    # "lookAheadClassCount":I
    add-int/lit8 v12, v12, 0x1

    move-object/from16 v18, v1

    move/from16 v2, v23

    move/from16 v3, v24

    move/from16 v1, p1

    goto :goto_1

    .end local v1    # "t":Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;
    .end local v23    # "coverageOffset":I
    .end local v24    # "backtrackClassDefOffset":I
    .local v2, "coverageOffset":I
    .local v3, "backtrackClassDefOffset":I
    .local v18, "t":Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;
    :cond_0
    move/from16 v23, v2

    move/from16 v24, v3

    move-object/from16 v1, v18

    .end local v2    # "coverageOffset":I
    .end local v3    # "backtrackClassDefOffset":I
    .end local v18    # "t":Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;
    .restart local v1    # "t":Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;
    .restart local v23    # "coverageOffset":I
    .restart local v24    # "backtrackClassDefOffset":I
    goto :goto_2

    .line 91
    .end local v1    # "t":Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;
    .end local v10    # "chainPosClassRuleCount":I
    .end local v11    # "chainPosClassRuleOffsets":[I
    .end local v12    # "j":I
    .end local v23    # "coverageOffset":I
    .end local v24    # "backtrackClassDefOffset":I
    .restart local v2    # "coverageOffset":I
    .restart local v3    # "backtrackClassDefOffset":I
    .restart local v18    # "t":Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;
    :cond_1
    move/from16 v23, v2

    move/from16 v24, v3

    move-object/from16 v1, v18

    .line 114
    .end local v2    # "coverageOffset":I
    .end local v3    # "backtrackClassDefOffset":I
    .end local v18    # "t":Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;
    .restart local v1    # "t":Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;
    .restart local v23    # "coverageOffset":I
    .restart local v24    # "backtrackClassDefOffset":I
    :goto_2
    invoke-virtual {v1, v9}, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;->addPosClassSet(Ljava/util/List;)V

    .line 89
    .end local v9    # "posClassSet":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/ContextualPositionRule;>;"
    add-int/lit8 v8, v8, 0x1

    move-object/from16 v18, v1

    move/from16 v2, v23

    move/from16 v3, v24

    move/from16 v1, p1

    goto/16 :goto_0

    .end local v1    # "t":Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;
    .end local v23    # "coverageOffset":I
    .end local v24    # "backtrackClassDefOffset":I
    .restart local v2    # "coverageOffset":I
    .restart local v3    # "backtrackClassDefOffset":I
    .restart local v18    # "t":Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;
    :cond_2
    move/from16 v23, v2

    move-object/from16 v1, v18

    .line 117
    .end local v2    # "coverageOffset":I
    .end local v8    # "i":I
    .end local v18    # "t":Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;
    .restart local v1    # "t":Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;
    .restart local v23    # "coverageOffset":I
    iget-object v2, v0, Lcom/itextpdf/io/font/otf/GposLookupType8;->subTables:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 118
    return-void
.end method
