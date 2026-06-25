.class public Lcom/itextpdf/io/font/otf/GposLookupType7;
.super Lcom/itextpdf/io/font/otf/OpenTableLookup;
.source "GposLookupType7.java"


# static fields
.field private static final LOGGER:Lorg/slf4j/Logger;


# instance fields
.field protected subTables:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/ContextualTable<",
            "Lcom/itextpdf/io/font/otf/ContextualPositionRule;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 42
    const-class v0, Lcom/itextpdf/io/font/otf/GposLookupType7;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/io/font/otf/GposLookupType7;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

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

    .line 48
    invoke-direct {p0, p1, p2, p3}, Lcom/itextpdf/io/font/otf/OpenTableLookup;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I[I)V

    .line 49
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/GposLookupType7;->subTables:Ljava/util/List;

    .line 50
    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/GposLookupType7;->readSubTables()V

    .line 51
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

    .line 96
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GposLookupType7;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v0, v0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 97
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GposLookupType7;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v0, v0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v0

    .line 98
    .local v0, "substFormat":I
    packed-switch v0, :pswitch_data_0

    .line 108
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

    .line 100
    :pswitch_0
    invoke-virtual {p0, p1}, Lcom/itextpdf/io/font/otf/GposLookupType7;->readSubTableFormat2(I)V

    .line 101
    goto :goto_0

    .line 104
    :pswitch_1
    sget-object v1, Lcom/itextpdf/io/font/otf/GposLookupType7;->LOGGER:Lorg/slf4j/Logger;

    .line 105
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x7

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v2, v3}, [Ljava/lang/Object;

    move-result-object v2

    .line 104
    const-string v3, "Subtable format {0} of GPOS Lookup Type {1} is not supported yet"

    invoke-static {v3, v2}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 106
    nop

    .line 110
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected readSubTableFormat2(I)V
    .locals 19
    .param p1, "subTableLocation"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 113
    move-object/from16 v0, p0

    move/from16 v1, p1

    iget-object v2, v0, Lcom/itextpdf/io/font/otf/GposLookupType7;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v2, v2, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v2

    .line 114
    .local v2, "coverageOffset":I
    iget-object v3, v0, Lcom/itextpdf/io/font/otf/GposLookupType7;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v3, v3, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v3

    .line 115
    .local v3, "classDefOffset":I
    iget-object v4, v0, Lcom/itextpdf/io/font/otf/GposLookupType7;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v4, v4, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v4

    .line 116
    .local v4, "posClassSetCount":I
    iget-object v5, v0, Lcom/itextpdf/io/font/otf/GposLookupType7;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-virtual {v5, v4, v1}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readUShortArray(II)[I

    move-result-object v5

    .line 118
    .local v5, "posClassSetOffsets":[I
    new-instance v6, Ljava/util/HashSet;

    iget-object v7, v0, Lcom/itextpdf/io/font/otf/GposLookupType7;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    add-int v8, v1, v2

    invoke-virtual {v7, v8}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readCoverageFormat(I)Ljava/util/List;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 119
    .local v6, "coverageGlyphIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    iget-object v7, v0, Lcom/itextpdf/io/font/otf/GposLookupType7;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    add-int v8, v1, v3

    invoke-virtual {v7, v8}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readClassDefinition(I)Lcom/itextpdf/io/font/otf/OtfClass;

    move-result-object v7

    .line 121
    .local v7, "classDefinition":Lcom/itextpdf/io/font/otf/OtfClass;
    new-instance v8, Lcom/itextpdf/io/font/otf/lookuptype7/PosTableLookup7Format2;

    iget-object v9, v0, Lcom/itextpdf/io/font/otf/GposLookupType7;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget v10, v0, Lcom/itextpdf/io/font/otf/GposLookupType7;->lookupFlag:I

    invoke-direct {v8, v9, v10, v6, v7}, Lcom/itextpdf/io/font/otf/lookuptype7/PosTableLookup7Format2;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;ILjava/util/Set;Lcom/itextpdf/io/font/otf/OtfClass;)V

    .line 124
    .local v8, "t":Lcom/itextpdf/io/font/otf/lookuptype7/PosTableLookup7Format2;
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 125
    .local v9, "subClassSets":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Lcom/itextpdf/io/font/otf/ContextualPositionRule;>;>;"
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_0
    if-ge v10, v4, :cond_2

    .line 126
    const/4 v11, 0x0

    .line 127
    .local v11, "subClassSet":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/ContextualPositionRule;>;"
    aget v12, v5, v10

    if-eqz v12, :cond_1

    .line 128
    iget-object v12, v0, Lcom/itextpdf/io/font/otf/GposLookupType7;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v12, v12, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    aget v13, v5, v10

    int-to-long v13, v13

    invoke-virtual {v12, v13, v14}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 129
    iget-object v12, v0, Lcom/itextpdf/io/font/otf/GposLookupType7;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v12, v12, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v12}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v12

    .line 130
    .local v12, "posClassRuleCount":I
    iget-object v13, v0, Lcom/itextpdf/io/font/otf/GposLookupType7;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    aget v14, v5, v10

    invoke-virtual {v13, v12, v14}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readUShortArray(II)[I

    move-result-object v13

    .line 132
    .local v13, "posClassRuleOffsets":[I
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14, v12}, Ljava/util/ArrayList;-><init>(I)V

    move-object v11, v14

    .line 133
    const/4 v14, 0x0

    .local v14, "j":I
    :goto_1
    if-ge v14, v12, :cond_0

    .line 135
    iget-object v15, v0, Lcom/itextpdf/io/font/otf/GposLookupType7;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v15, v15, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    aget v1, v13, v14

    move/from16 v16, v2

    .end local v2    # "coverageOffset":I
    .local v16, "coverageOffset":I
    int-to-long v1, v1

    invoke-virtual {v15, v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 137
    iget-object v1, v0, Lcom/itextpdf/io/font/otf/GposLookupType7;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v1, v1, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v1

    .line 138
    .local v1, "glyphCount":I
    iget-object v2, v0, Lcom/itextpdf/io/font/otf/GposLookupType7;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v2, v2, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v2

    .line 139
    .local v2, "posCount":I
    iget-object v15, v0, Lcom/itextpdf/io/font/otf/GposLookupType7;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    move/from16 v17, v1

    .end local v1    # "glyphCount":I
    .local v17, "glyphCount":I
    add-int/lit8 v1, v17, -0x1

    invoke-virtual {v15, v1}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readUShortArray(I)[I

    move-result-object v1

    .line 140
    .local v1, "inputClassIds":[I
    iget-object v15, v0, Lcom/itextpdf/io/font/otf/GposLookupType7;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-virtual {v15, v2}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readPosLookupRecords(I)[Lcom/itextpdf/io/font/otf/PosLookupRecord;

    move-result-object v15

    .line 142
    .local v15, "posLookupRecords":[Lcom/itextpdf/io/font/otf/PosLookupRecord;
    move/from16 v18, v2

    .end local v2    # "posCount":I
    .local v18, "posCount":I
    new-instance v2, Lcom/itextpdf/io/font/otf/lookuptype7/PosTableLookup7Format2$PosRuleFormat2;

    invoke-direct {v2, v8, v1, v15}, Lcom/itextpdf/io/font/otf/lookuptype7/PosTableLookup7Format2$PosRuleFormat2;-><init>(Lcom/itextpdf/io/font/otf/lookuptype7/PosTableLookup7Format2;[I[Lcom/itextpdf/io/font/otf/PosLookupRecord;)V

    .line 143
    .local v2, "rule":Lcom/itextpdf/io/font/otf/ContextualPositionRule;
    invoke-interface {v11, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 133
    .end local v1    # "inputClassIds":[I
    .end local v2    # "rule":Lcom/itextpdf/io/font/otf/ContextualPositionRule;
    .end local v15    # "posLookupRecords":[Lcom/itextpdf/io/font/otf/PosLookupRecord;
    .end local v17    # "glyphCount":I
    .end local v18    # "posCount":I
    add-int/lit8 v14, v14, 0x1

    move/from16 v1, p1

    move/from16 v2, v16

    goto :goto_1

    .end local v16    # "coverageOffset":I
    .local v2, "coverageOffset":I
    :cond_0
    move/from16 v16, v2

    .end local v2    # "coverageOffset":I
    .restart local v16    # "coverageOffset":I
    goto :goto_2

    .line 127
    .end local v12    # "posClassRuleCount":I
    .end local v13    # "posClassRuleOffsets":[I
    .end local v14    # "j":I
    .end local v16    # "coverageOffset":I
    .restart local v2    # "coverageOffset":I
    :cond_1
    move/from16 v16, v2

    .line 146
    .end local v2    # "coverageOffset":I
    .restart local v16    # "coverageOffset":I
    :goto_2
    invoke-interface {v9, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 125
    .end local v11    # "subClassSet":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/ContextualPositionRule;>;"
    add-int/lit8 v10, v10, 0x1

    move/from16 v1, p1

    move/from16 v2, v16

    goto :goto_0

    .line 149
    .end local v10    # "i":I
    .end local v16    # "coverageOffset":I
    .restart local v2    # "coverageOffset":I
    :cond_2
    invoke-virtual {v8, v9}, Lcom/itextpdf/io/font/otf/lookuptype7/PosTableLookup7Format2;->setPosClassSets(Ljava/util/List;)V

    .line 150
    iget-object v1, v0, Lcom/itextpdf/io/font/otf/GposLookupType7;->subTables:Ljava/util/List;

    invoke-interface {v1, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 151
    return-void
.end method

.method public transformOne(Lcom/itextpdf/io/font/otf/GlyphLine;)Z
    .locals 19
    .param p1, "line"    # Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 55
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const/4 v2, 0x0

    .line 56
    .local v2, "changed":Z
    iget v3, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .line 57
    .local v3, "oldLineStart":I
    iget v4, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    .line 58
    .local v4, "oldLineEnd":I
    iget v5, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    .line 60
    .local v5, "initialLineIndex":I
    iget-object v6, v0, Lcom/itextpdf/io/font/otf/GposLookupType7;->subTables:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_5

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/io/font/otf/ContextualTable;

    .line 61
    .local v7, "subTable":Lcom/itextpdf/io/font/otf/ContextualTable;, "Lcom/itextpdf/io/font/otf/ContextualTable<Lcom/itextpdf/io/font/otf/ContextualPositionRule;>;"
    invoke-virtual {v7, v1}, Lcom/itextpdf/io/font/otf/ContextualTable;->getMatchingContextRule(Lcom/itextpdf/io/font/otf/GlyphLine;)Lcom/itextpdf/io/font/otf/ContextualRule;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/io/font/otf/ContextualPositionRule;

    .line 62
    .local v9, "contextRule":Lcom/itextpdf/io/font/otf/ContextualPositionRule;
    if-nez v9, :cond_0

    .line 63
    goto :goto_0

    .line 66
    :cond_0
    iget v6, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    .line 67
    .local v6, "lineEndBeforeTransformations":I
    invoke-virtual {v9}, Lcom/itextpdf/io/font/otf/ContextualPositionRule;->getPosLookupRecords()[Lcom/itextpdf/io/font/otf/PosLookupRecord;

    move-result-object v10

    .line 68
    .local v10, "posLookupRecords":[Lcom/itextpdf/io/font/otf/PosLookupRecord;
    new-instance v11, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;

    invoke-direct {v11}, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;-><init>()V

    .line 69
    .local v11, "gidx":Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;
    iput-object v1, v11, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 70
    array-length v12, v10

    const/4 v14, 0x0

    :goto_1
    if-ge v14, v12, :cond_4

    aget-object v15, v10, v14

    .line 73
    .local v15, "posRecord":Lcom/itextpdf/io/font/otf/PosLookupRecord;
    iput v5, v11, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->idx:I

    .line 74
    const/16 v16, 0x0

    move/from16 v8, v16

    const/16 v17, 0x1

    .local v8, "i":I
    :goto_2
    iget v13, v15, Lcom/itextpdf/io/font/otf/PosLookupRecord;->sequenceIndex:I

    if-ge v8, v13, :cond_1

    .line 75
    iget-object v13, v0, Lcom/itextpdf/io/font/otf/GposLookupType7;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    move/from16 v18, v2

    .end local v2    # "changed":Z
    .local v18, "changed":Z
    iget v2, v0, Lcom/itextpdf/io/font/otf/GposLookupType7;->lookupFlag:I

    invoke-virtual {v11, v13, v2}, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->nextGlyph(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)V

    .line 74
    add-int/lit8 v8, v8, 0x1

    move/from16 v2, v18

    goto :goto_2

    .end local v18    # "changed":Z
    .restart local v2    # "changed":Z
    :cond_1
    move/from16 v18, v2

    .line 78
    .end local v2    # "changed":Z
    .end local v8    # "i":I
    .restart local v18    # "changed":Z
    iget v2, v11, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->idx:I

    iput v2, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    .line 79
    iget-object v2, v0, Lcom/itextpdf/io/font/otf/GposLookupType7;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget v8, v15, Lcom/itextpdf/io/font/otf/PosLookupRecord;->lookupListIndex:I

    invoke-virtual {v2, v8}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->getLookupTable(I)Lcom/itextpdf/io/font/otf/OpenTableLookup;

    move-result-object v2

    .line 80
    .local v2, "lookupTable":Lcom/itextpdf/io/font/otf/OpenTableLookup;
    invoke-virtual {v2, v1}, Lcom/itextpdf/io/font/otf/OpenTableLookup;->transformOne(Lcom/itextpdf/io/font/otf/GlyphLine;)Z

    move-result v8

    if-nez v8, :cond_3

    if-eqz v18, :cond_2

    goto :goto_3

    :cond_2
    const/4 v8, 0x0

    goto :goto_4

    :cond_3
    :goto_3
    move/from16 v8, v17

    :goto_4
    move v2, v8

    .line 70
    .end local v15    # "posRecord":Lcom/itextpdf/io/font/otf/PosLookupRecord;
    .end local v18    # "changed":Z
    .local v2, "changed":Z
    add-int/lit8 v14, v14, 0x1

    goto :goto_1

    .line 83
    :cond_4
    move/from16 v18, v2

    .end local v2    # "changed":Z
    .restart local v18    # "changed":Z
    iget v2, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    iput v2, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    .line 84
    iput v3, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .line 85
    iget v2, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    sub-int v2, v6, v2

    .line 86
    .local v2, "lenDelta":I
    sub-int v8, v4, v2

    iput v8, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    .line 87
    return v18

    .line 90
    .end local v6    # "lineEndBeforeTransformations":I
    .end local v7    # "subTable":Lcom/itextpdf/io/font/otf/ContextualTable;, "Lcom/itextpdf/io/font/otf/ContextualTable<Lcom/itextpdf/io/font/otf/ContextualPositionRule;>;"
    .end local v9    # "contextRule":Lcom/itextpdf/io/font/otf/ContextualPositionRule;
    .end local v10    # "posLookupRecords":[Lcom/itextpdf/io/font/otf/PosLookupRecord;
    .end local v11    # "gidx":Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;
    .end local v18    # "changed":Z
    .local v2, "changed":Z
    :cond_5
    const/16 v17, 0x1

    iget v6, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    .line 91
    return v2
.end method
