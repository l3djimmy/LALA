.class Lcom/itextpdf/io/font/TrueTypeFontSubset;
.super Ljava/lang/Object;
.source "TrueTypeFontSubset.java"


# static fields
.field private static final ARG_1_AND_2_ARE_WORDS:I = 0x1

.field private static final HEAD_LOCA_FORMAT_OFFSET:I = 0x33

.field private static final MORE_COMPONENTS:I = 0x20

.field private static final TABLE_CHECKSUM:I = 0x0

.field private static final TABLE_LENGTH:I = 0x2

.field private static final TABLE_NAMES:[Ljava/lang/String;

.field private static final TABLE_NAMES_SUBSET:[Ljava/lang/String;

.field private static final TABLE_OFFSET:I = 0x1

.field private static final WE_HAVE_AN_X_AND_Y_SCALE:I = 0x40

.field private static final WE_HAVE_A_SCALE:I = 0x8

.field private static final WE_HAVE_A_TWO_BY_TWO:I = 0x80

.field private static final entrySelectors:[I


# instance fields
.field private directoryOffset:I

.field private fileName:Ljava/lang/String;

.field private fontPtr:I

.field private glyfTableRealSize:I

.field private glyphsInList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private glyphsUsed:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private locaShortTable:Z

.field private locaTable:[I

.field private locaTableRealSize:I

.field private newGlyfTable:[B

.field private newLocaTable:[I

.field private newLocaTableOut:[B

.field private outFont:[B

.field protected rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

.field private tableDirectory:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[I>;"
        }
    .end annotation
.end field

.field private tableGlyphOffset:I

.field private final tableNames:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 24

    .line 44
    const/16 v0, 0xb

    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "cvt "

    aput-object v3, v1, v2

    const/4 v4, 0x1

    const-string v5, "fpgm"

    aput-object v5, v1, v4

    const/4 v6, 0x2

    const-string v7, "glyf"

    aput-object v7, v1, v6

    const/4 v8, 0x3

    const-string v9, "head"

    aput-object v9, v1, v8

    const/4 v10, 0x4

    const-string v11, "hhea"

    aput-object v11, v1, v10

    const/4 v12, 0x5

    const-string v13, "hmtx"

    aput-object v13, v1, v12

    const/4 v14, 0x6

    const-string v15, "loca"

    aput-object v15, v1, v14

    const/16 v16, 0x7

    const-string v17, "maxp"

    aput-object v17, v1, v16

    const/16 v18, 0x8

    const-string/jumbo v19, "prep"

    aput-object v19, v1, v18

    const/16 v20, 0x9

    const-string v21, "cmap"

    aput-object v21, v1, v20

    const-string v22, "OS/2"

    const/16 v23, 0xa

    aput-object v22, v1, v23

    sput-object v1, Lcom/itextpdf/io/font/TrueTypeFontSubset;->TABLE_NAMES_SUBSET:[Ljava/lang/String;

    .line 48
    const/16 v1, 0xd

    new-array v1, v1, [Ljava/lang/String;

    aput-object v3, v1, v2

    aput-object v5, v1, v4

    aput-object v7, v1, v6

    aput-object v9, v1, v8

    aput-object v11, v1, v10

    aput-object v13, v1, v12

    aput-object v15, v1, v14

    aput-object v17, v1, v16

    aput-object v19, v1, v18

    aput-object v21, v1, v20

    const-string v2, "OS/2"

    aput-object v2, v1, v23

    const-string v2, "name"

    aput-object v2, v1, v0

    const/16 v0, 0xc

    const-string/jumbo v2, "post"

    aput-object v2, v1, v0

    sput-object v1, Lcom/itextpdf/io/font/TrueTypeFontSubset;->TABLE_NAMES:[Ljava/lang/String;

    .line 50
    const/16 v0, 0x15

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->entrySelectors:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x0
        0x1
        0x1
        0x2
        0x2
        0x2
        0x2
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x4
        0x4
        0x4
        0x4
        0x4
    .end array-data
.end method

.method constructor <init>(Ljava/lang/String;Lcom/itextpdf/io/source/RandomAccessFileOrArray;Ljava/util/Set;IZ)V
    .locals 1
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "rf"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .param p4, "directoryOffset"    # I
    .param p5, "subset"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/itextpdf/io/source/RandomAccessFileOrArray;",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;IZ)V"
        }
    .end annotation

    .line 100
    .local p3, "glyphsUsed":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    iput-object p1, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->fileName:Ljava/lang/String;

    .line 102
    iput-object p2, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    .line 103
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, p3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->glyphsUsed:Ljava/util/Set;

    .line 104
    iput p4, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->directoryOffset:I

    .line 106
    if-eqz p5, :cond_0

    .line 107
    sget-object v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->TABLE_NAMES_SUBSET:[Ljava/lang/String;

    iput-object v0, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->tableNames:[Ljava/lang/String;

    goto :goto_0

    .line 109
    :cond_0
    sget-object v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->TABLE_NAMES:[Ljava/lang/String;

    iput-object v0, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->tableNames:[Ljava/lang/String;

    .line 111
    :goto_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->glyphsInList:Ljava/util/List;

    .line 112
    return-void
.end method

.method private assembleFont()V
    .locals 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 139
    move-object/from16 v0, p0

    const/4 v1, 0x0

    .line 140
    .local v1, "fullFontSize":I
    const/4 v2, 0x2

    .line 141
    .local v2, "tablesUsed":I
    iget-object v3, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->tableNames:[Ljava/lang/String;

    array-length v4, v3

    const/4 v5, 0x0

    move v6, v5

    :goto_0
    const-string v7, "loca"

    const-string v8, "glyf"

    const/4 v9, 0x2

    if-ge v6, v4, :cond_3

    aget-object v10, v3, v6

    .line 142
    .local v10, "name":Ljava/lang/String;
    invoke-virtual {v10, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_2

    invoke-virtual {v10, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 143
    goto :goto_1

    .line 145
    :cond_0
    iget-object v7, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->tableDirectory:Ljava/util/Map;

    invoke-interface {v7, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [I

    .line 146
    .local v7, "tableLocation":[I
    if-nez v7, :cond_1

    .line 147
    goto :goto_1

    .line 149
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 150
    aget v8, v7, v9

    add-int/lit8 v8, v8, 0x3

    and-int/lit8 v8, v8, -0x4

    add-int/2addr v1, v8

    .line 141
    .end local v7    # "tableLocation":[I
    .end local v10    # "name":Ljava/lang/String;
    :cond_2
    :goto_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 152
    :cond_3
    iget-object v3, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->newLocaTableOut:[B

    array-length v3, v3

    add-int/2addr v1, v3

    .line 153
    iget-object v3, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->newGlyfTable:[B

    array-length v3, v3

    add-int/2addr v1, v3

    .line 154
    mul-int/lit8 v3, v2, 0x10

    add-int/lit8 v3, v3, 0xc

    .line 155
    .local v3, "reference":I
    add-int/2addr v1, v3

    .line 156
    new-array v4, v1, [B

    iput-object v4, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->outFont:[B

    .line 157
    iput v5, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->fontPtr:I

    .line 158
    const/high16 v4, 0x10000

    invoke-direct {v0, v4}, Lcom/itextpdf/io/font/TrueTypeFontSubset;->writeFontInt(I)V

    .line 159
    invoke-direct {v0, v2}, Lcom/itextpdf/io/font/TrueTypeFontSubset;->writeFontShort(I)V

    .line 160
    sget-object v4, Lcom/itextpdf/io/font/TrueTypeFontSubset;->entrySelectors:[I

    aget v4, v4, v2

    .line 161
    .local v4, "selector":I
    const/4 v6, 0x1

    shl-int v10, v6, v4

    mul-int/lit8 v10, v10, 0x10

    invoke-direct {v0, v10}, Lcom/itextpdf/io/font/TrueTypeFontSubset;->writeFontShort(I)V

    .line 162
    invoke-direct {v0, v4}, Lcom/itextpdf/io/font/TrueTypeFontSubset;->writeFontShort(I)V

    .line 163
    shl-int v10, v6, v4

    sub-int v10, v2, v10

    mul-int/lit8 v10, v10, 0x10

    invoke-direct {v0, v10}, Lcom/itextpdf/io/font/TrueTypeFontSubset;->writeFontShort(I)V

    .line 164
    iget-object v10, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->tableNames:[Ljava/lang/String;

    array-length v11, v10

    move v12, v5

    :goto_2
    if-ge v12, v11, :cond_6

    aget-object v14, v10, v12

    .line 166
    .local v14, "name":Ljava/lang/String;
    iget-object v15, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->tableDirectory:Ljava/util/Map;

    invoke-interface {v15, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, [I

    .line 167
    .local v15, "tableLocation":[I
    if-nez v15, :cond_4

    .line 168
    goto :goto_6

    .line 170
    :cond_4
    invoke-direct {v0, v14}, Lcom/itextpdf/io/font/TrueTypeFontSubset;->writeFontString(Ljava/lang/String;)V

    .line 171
    invoke-virtual {v14}, Ljava/lang/String;->hashCode()I

    move-result v16

    sparse-switch v16, :sswitch_data_0

    :cond_5
    goto :goto_3

    :sswitch_0
    invoke-virtual {v14, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_5

    move v13, v6

    goto :goto_4

    :sswitch_1
    invoke-virtual {v14, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_5

    move v13, v5

    goto :goto_4

    :goto_3
    const/4 v13, -0x1

    :goto_4
    packed-switch v13, :pswitch_data_0

    .line 181
    aget v13, v15, v5

    invoke-direct {v0, v13}, Lcom/itextpdf/io/font/TrueTypeFontSubset;->writeFontInt(I)V

    .line 182
    aget v13, v15, v9

    .local v13, "len":I
    goto :goto_5

    .line 177
    .end local v13    # "len":I
    :pswitch_0
    iget-object v13, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->newLocaTableOut:[B

    invoke-direct {v0, v13}, Lcom/itextpdf/io/font/TrueTypeFontSubset;->calculateChecksum([B)I

    move-result v13

    invoke-direct {v0, v13}, Lcom/itextpdf/io/font/TrueTypeFontSubset;->writeFontInt(I)V

    .line 178
    iget v13, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->locaTableRealSize:I

    .line 179
    .restart local v13    # "len":I
    goto :goto_5

    .line 173
    .end local v13    # "len":I
    :pswitch_1
    iget-object v13, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->newGlyfTable:[B

    invoke-direct {v0, v13}, Lcom/itextpdf/io/font/TrueTypeFontSubset;->calculateChecksum([B)I

    move-result v13

    invoke-direct {v0, v13}, Lcom/itextpdf/io/font/TrueTypeFontSubset;->writeFontInt(I)V

    .line 174
    iget v13, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->glyfTableRealSize:I

    .line 175
    .restart local v13    # "len":I
    nop

    .line 185
    :goto_5
    invoke-direct {v0, v3}, Lcom/itextpdf/io/font/TrueTypeFontSubset;->writeFontInt(I)V

    .line 186
    invoke-direct {v0, v13}, Lcom/itextpdf/io/font/TrueTypeFontSubset;->writeFontInt(I)V

    .line 187
    add-int/lit8 v16, v13, 0x3

    and-int/lit8 v16, v16, -0x4

    add-int v3, v3, v16

    .line 164
    .end local v13    # "len":I
    .end local v14    # "name":Ljava/lang/String;
    :goto_6
    add-int/lit8 v12, v12, 0x1

    goto :goto_2

    .line 189
    .end local v15    # "tableLocation":[I
    :cond_6
    iget-object v10, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->tableNames:[Ljava/lang/String;

    array-length v11, v10

    move v12, v5

    :goto_7
    if-ge v12, v11, :cond_9

    aget-object v14, v10, v12

    .line 190
    .restart local v14    # "name":Ljava/lang/String;
    iget-object v15, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->tableDirectory:Ljava/util/Map;

    invoke-interface {v15, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, [I

    .line 191
    .restart local v15    # "tableLocation":[I
    if-nez v15, :cond_7

    .line 192
    move/from16 v18, v1

    move/from16 v17, v6

    move/from16 v16, v9

    goto/16 :goto_a

    .line 194
    :cond_7
    invoke-virtual {v14}, Ljava/lang/String;->hashCode()I

    move-result v16

    sparse-switch v16, :sswitch_data_1

    :cond_8
    goto :goto_8

    :sswitch_2
    invoke-virtual {v14, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_8

    move/from16 v16, v6

    goto :goto_9

    :sswitch_3
    invoke-virtual {v14, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_8

    move/from16 v16, v5

    goto :goto_9

    :goto_8
    const/16 v16, -0x1

    :goto_9
    move/from16 v17, v6

    packed-switch v16, :pswitch_data_1

    .line 206
    move/from16 v18, v1

    move/from16 v16, v9

    .end local v1    # "fullFontSize":I
    .local v18, "fullFontSize":I
    iget-object v1, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    aget v6, v15, v17

    int-to-long v5, v6

    invoke-virtual {v1, v5, v6}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 207
    iget-object v1, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget-object v5, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->outFont:[B

    iget v6, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->fontPtr:I

    aget v13, v15, v16

    invoke-virtual {v1, v5, v6, v13}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readFully([BII)V

    .line 208
    iget v1, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->fontPtr:I

    aget v5, v15, v16

    add-int/lit8 v5, v5, 0x3

    and-int/lit8 v5, v5, -0x4

    add-int/2addr v1, v5

    iput v1, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->fontPtr:I

    goto :goto_a

    .line 201
    .end local v18    # "fullFontSize":I
    .restart local v1    # "fullFontSize":I
    :pswitch_2
    move/from16 v16, v9

    iget-object v9, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->newLocaTableOut:[B

    iget-object v13, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->outFont:[B

    iget v6, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->fontPtr:I

    move/from16 v18, v1

    .end local v1    # "fullFontSize":I
    .restart local v18    # "fullFontSize":I
    iget-object v1, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->newLocaTableOut:[B

    array-length v1, v1

    invoke-static {v9, v5, v13, v6, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 202
    iget v1, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->fontPtr:I

    iget-object v6, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->newLocaTableOut:[B

    array-length v6, v6

    add-int/2addr v1, v6

    iput v1, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->fontPtr:I

    .line 203
    const/4 v1, 0x0

    iput-object v1, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->newLocaTableOut:[B

    .line 204
    goto :goto_a

    .line 196
    .end local v18    # "fullFontSize":I
    .restart local v1    # "fullFontSize":I
    :pswitch_3
    move/from16 v18, v1

    move/from16 v16, v9

    .end local v1    # "fullFontSize":I
    .restart local v18    # "fullFontSize":I
    iget-object v1, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->newGlyfTable:[B

    iget-object v6, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->outFont:[B

    iget v9, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->fontPtr:I

    iget-object v13, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->newGlyfTable:[B

    array-length v13, v13

    invoke-static {v1, v5, v6, v9, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 197
    iget v1, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->fontPtr:I

    iget-object v6, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->newGlyfTable:[B

    array-length v6, v6

    add-int/2addr v1, v6

    iput v1, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->fontPtr:I

    .line 198
    const/4 v1, 0x0

    iput-object v1, v0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->newGlyfTable:[B

    .line 199
    nop

    .line 189
    .end local v14    # "name":Ljava/lang/String;
    :goto_a
    add-int/lit8 v12, v12, 0x1

    move/from16 v9, v16

    move/from16 v6, v17

    move/from16 v1, v18

    const/4 v5, 0x0

    goto/16 :goto_7

    .line 212
    .end local v15    # "tableLocation":[I
    .end local v18    # "fullFontSize":I
    .restart local v1    # "fullFontSize":I
    :cond_9
    return-void

    :sswitch_data_0
    .sparse-switch
        0x3076b2 -> :sswitch_1
        0x32c521 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :sswitch_data_1
    .sparse-switch
        0x3076b2 -> :sswitch_3
        0x32c521 -> :sswitch_2
    .end sparse-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method

.method private calculateChecksum([B)I
    .locals 8
    .param p1, "b"    # [B

    .line 403
    array-length v0, p1

    div-int/lit8 v0, v0, 0x4

    .line 404
    .local v0, "len":I
    const/4 v1, 0x0

    .line 405
    .local v1, "v0":I
    const/4 v2, 0x0

    .line 406
    .local v2, "v1":I
    const/4 v3, 0x0

    .line 407
    .local v3, "v2":I
    const/4 v4, 0x0

    .line 408
    .local v4, "v3":I
    const/4 v5, 0x0

    .line 409
    .local v5, "ptr":I
    const/4 v6, 0x0

    .local v6, "k":I
    :goto_0
    if-ge v6, v0, :cond_0

    .line 410
    add-int/lit8 v7, v5, 0x1

    .end local v5    # "ptr":I
    .local v7, "ptr":I
    aget-byte v5, p1, v5

    and-int/lit16 v5, v5, 0xff

    add-int/2addr v4, v5

    .line 411
    add-int/lit8 v5, v7, 0x1

    .end local v7    # "ptr":I
    .restart local v5    # "ptr":I
    aget-byte v7, p1, v7

    and-int/lit16 v7, v7, 0xff

    add-int/2addr v3, v7

    .line 412
    add-int/lit8 v7, v5, 0x1

    .end local v5    # "ptr":I
    .restart local v7    # "ptr":I
    aget-byte v5, p1, v5

    and-int/lit16 v5, v5, 0xff

    add-int/2addr v2, v5

    .line 413
    add-int/lit8 v5, v7, 0x1

    .end local v7    # "ptr":I
    .restart local v5    # "ptr":I
    aget-byte v7, p1, v7

    and-int/lit16 v7, v7, 0xff

    add-int/2addr v1, v7

    .line 409
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 415
    .end local v6    # "k":I
    :cond_0
    shl-int/lit8 v6, v2, 0x8

    add-int/2addr v6, v1

    shl-int/lit8 v7, v3, 0x10

    add-int/2addr v6, v7

    shl-int/lit8 v7, v4, 0x18

    add-int/2addr v6, v7

    return v6
.end method

.method private checkGlyphComposite(I)V
    .locals 6
    .param p1, "glyph"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 327
    iget-object v0, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->locaTable:[I

    aget v0, v0, p1

    .line 330
    .local v0, "start":I
    iget-object v1, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->locaTable:[I

    add-int/lit8 v2, p1, 0x1

    aget v1, v1, v2

    if-ne v0, v1, :cond_0

    .line 331
    return-void

    .line 333
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget v2, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->tableGlyphOffset:I

    add-int/2addr v2, v0

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 334
    iget-object v1, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v1

    .line 335
    .local v1, "numContours":I
    if-ltz v1, :cond_1

    .line 336
    return-void

    .line 338
    :cond_1
    iget-object v2, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->skipBytes(I)I

    .line 340
    :goto_0
    iget-object v2, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v2

    .line 341
    .local v2, "flags":I
    iget-object v3, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v3

    .line 342
    .local v3, "cGlyph":I
    iget-object v4, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->glyphsUsed:Ljava/util/Set;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 343
    iget-object v4, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->glyphsUsed:Ljava/util/Set;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 344
    iget-object v4, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->glyphsInList:Ljava/util/List;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 346
    :cond_2
    and-int/lit8 v4, v2, 0x20

    if-nez v4, :cond_3

    .line 347
    return-void

    .line 350
    :cond_3
    and-int/lit8 v4, v2, 0x1

    if-eqz v4, :cond_4

    .line 351
    const/4 v4, 0x4

    .local v4, "skip":I
    goto :goto_1

    .line 353
    .end local v4    # "skip":I
    :cond_4
    const/4 v4, 0x2

    .line 355
    .restart local v4    # "skip":I
    :goto_1
    and-int/lit8 v5, v2, 0x8

    if-eqz v5, :cond_5

    .line 356
    add-int/lit8 v4, v4, 0x2

    goto :goto_2

    .line 357
    :cond_5
    and-int/lit8 v5, v2, 0x40

    if-eqz v5, :cond_6

    .line 358
    add-int/lit8 v4, v4, 0x4

    .line 360
    :cond_6
    :goto_2
    and-int/lit16 v5, v2, 0x80

    if-eqz v5, :cond_7

    .line 361
    add-int/lit8 v4, v4, 0x8

    .line 363
    :cond_7
    iget-object v5, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v5, v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->skipBytes(I)I

    .line 364
    .end local v2    # "flags":I
    .end local v3    # "cGlyph":I
    .end local v4    # "skip":I
    goto :goto_0
.end method

.method private createNewGlyphTables()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 261
    iget-object v0, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->locaTable:[I

    array-length v0, v0

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->newLocaTable:[I

    .line 262
    iget-object v0, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->glyphsInList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [I

    .line 263
    .local v0, "activeGlyphs":[I
    const/4 v1, 0x0

    .local v1, "k":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 264
    iget-object v2, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->glyphsInList:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    aput v2, v0, v1

    .line 263
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 266
    .end local v1    # "k":I
    :cond_0
    invoke-static {v0}, Ljava/util/Arrays;->sort([I)V

    .line 267
    const/4 v1, 0x0

    .line 268
    .local v1, "glyfSize":I
    array-length v2, v0

    const/4 v3, 0x0

    :goto_1
    if-ge v3, v2, :cond_1

    aget v4, v0, v3

    .line 269
    .local v4, "glyph":I
    iget-object v5, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->locaTable:[I

    add-int/lit8 v6, v4, 0x1

    aget v5, v5, v6

    iget-object v6, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->locaTable:[I

    aget v6, v6, v4

    sub-int/2addr v5, v6

    add-int/2addr v1, v5

    .line 268
    .end local v4    # "glyph":I
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 271
    :cond_1
    iput v1, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->glyfTableRealSize:I

    .line 272
    add-int/lit8 v2, v1, 0x3

    and-int/lit8 v1, v2, -0x4

    .line 273
    new-array v2, v1, [B

    iput-object v2, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->newGlyfTable:[B

    .line 274
    const/4 v2, 0x0

    .line 275
    .local v2, "glyfPtr":I
    const/4 v3, 0x0

    .line 276
    .local v3, "listGlyf":I
    const/4 v4, 0x0

    .local v4, "k":I
    :goto_2
    iget-object v5, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->newLocaTable:[I

    array-length v5, v5

    if-ge v4, v5, :cond_3

    .line 277
    iget-object v5, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->newLocaTable:[I

    aput v2, v5, v4

    .line 278
    array-length v5, v0

    if-ge v3, v5, :cond_2

    aget v5, v0, v3

    if-ne v5, v4, :cond_2

    .line 279
    add-int/lit8 v3, v3, 0x1

    .line 280
    iget-object v5, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->newLocaTable:[I

    aput v2, v5, v4

    .line 281
    iget-object v5, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->locaTable:[I

    aget v5, v5, v4

    .line 282
    .local v5, "start":I
    iget-object v6, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->locaTable:[I

    add-int/lit8 v7, v4, 0x1

    aget v6, v6, v7

    sub-int/2addr v6, v5

    .line 283
    .local v6, "len":I
    if-lez v6, :cond_2

    .line 284
    iget-object v7, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget v8, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->tableGlyphOffset:I

    add-int/2addr v8, v5

    int-to-long v8, v8

    invoke-virtual {v7, v8, v9}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 285
    iget-object v7, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget-object v8, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->newGlyfTable:[B

    invoke-virtual {v7, v8, v2, v6}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readFully([BII)V

    .line 286
    add-int/2addr v2, v6

    .line 276
    .end local v5    # "start":I
    .end local v6    # "len":I
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 290
    .end local v4    # "k":I
    :cond_3
    return-void
.end method

.method private createTableDirectory()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 215
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->tableDirectory:Ljava/util/Map;

    .line 216
    iget-object v0, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget v1, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->directoryOffset:I

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 217
    iget-object v0, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v0

    .line 218
    .local v0, "id":I
    const/high16 v1, 0x10000

    if-ne v0, v1, :cond_1

    .line 221
    iget-object v1, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v1

    .line 222
    .local v1, "num_tables":I
    iget-object v2, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    const/4 v3, 0x6

    invoke-virtual {v2, v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->skipBytes(I)I

    .line 223
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 224
    const/4 v3, 0x4

    invoke-direct {p0, v3}, Lcom/itextpdf/io/font/TrueTypeFontSubset;->readStandardString(I)Ljava/lang/String;

    move-result-object v3

    .line 225
    .local v3, "tag":Ljava/lang/String;
    const/4 v4, 0x3

    new-array v4, v4, [I

    .line 226
    .local v4, "tableLocation":[I
    iget-object v5, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v5}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v5

    const/4 v6, 0x0

    aput v5, v4, v6

    .line 227
    iget-object v5, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v5}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v5

    const/4 v6, 0x1

    aput v5, v4, v6

    .line 228
    iget-object v5, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v5}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v5

    const/4 v6, 0x2

    aput v5, v4, v6

    .line 229
    iget-object v5, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->tableDirectory:Ljava/util/Map;

    invoke-interface {v5, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    .end local v3    # "tag":Ljava/lang/String;
    .end local v4    # "tableLocation":[I
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 231
    .end local v2    # "k":I
    :cond_0
    return-void

    .line 219
    .end local v1    # "num_tables":I
    :cond_1
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string/jumbo v2, "{0} is not a true type file"

    invoke-direct {v1, v2}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->fileName:Ljava/lang/String;

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v1

    throw v1
.end method

.method private flatGlyphs()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 310
    iget-object v0, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->tableDirectory:Ljava/util/Map;

    const-string v1, "glyf"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 311
    .local v0, "tableLocation":[I
    if-eqz v0, :cond_2

    .line 313
    const/4 v1, 0x0

    .line 314
    .local v1, "glyph0":I
    iget-object v2, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->glyphsUsed:Ljava/util/Set;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 315
    iget-object v2, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->glyphsUsed:Ljava/util/Set;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 316
    iget-object v2, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->glyphsInList:Ljava/util/List;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 318
    :cond_0
    const/4 v2, 0x1

    aget v2, v0, v2

    iput v2, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->tableGlyphOffset:I

    .line 321
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget-object v3, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->glyphsInList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 322
    iget-object v3, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->glyphsInList:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-direct {p0, v3}, Lcom/itextpdf/io/font/TrueTypeFontSubset;->checkGlyphComposite(I)V

    .line 321
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 324
    .end local v2    # "i":I
    :cond_1
    return-void

    .line 312
    .end local v1    # "glyph0":I
    :cond_2
    new-instance v2, Lcom/itextpdf/io/exceptions/IOException;

    const-string v3, "Table {0} does not exist in {1}"

    invoke-direct {v2, v3}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->fileName:Ljava/lang/String;

    filled-new-array {v1, v3}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v1

    throw v1
.end method

.method private locaToBytes()V
    .locals 5

    .line 293
    iget-boolean v0, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->locaShortTable:Z

    .line 296
    iget-object v1, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->newLocaTable:[I

    .line 293
    if-eqz v0, :cond_0

    .line 294
    array-length v0, v1

    mul-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->locaTableRealSize:I

    goto :goto_0

    .line 296
    :cond_0
    array-length v0, v1

    mul-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->locaTableRealSize:I

    .line 298
    :goto_0
    iget v0, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->locaTableRealSize:I

    add-int/lit8 v0, v0, 0x3

    and-int/lit8 v0, v0, -0x4

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->newLocaTableOut:[B

    .line 299
    iget-object v0, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->newLocaTableOut:[B

    iput-object v0, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->outFont:[B

    .line 300
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->fontPtr:I

    .line 301
    iget-object v1, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->newLocaTable:[I

    array-length v2, v1

    :goto_1
    if-ge v0, v2, :cond_2

    aget v3, v1, v0

    .line 302
    .local v3, "location":I
    iget-boolean v4, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->locaShortTable:Z

    if-eqz v4, :cond_1

    .line 303
    div-int/lit8 v4, v3, 0x2

    invoke-direct {p0, v4}, Lcom/itextpdf/io/font/TrueTypeFontSubset;->writeFontShort(I)V

    goto :goto_2

    .line 305
    :cond_1
    invoke-direct {p0, v3}, Lcom/itextpdf/io/font/TrueTypeFontSubset;->writeFontInt(I)V

    .line 301
    .end local v3    # "location":I
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 307
    :cond_2
    return-void
.end method

.method private readLoca()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 234
    iget-object v0, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->tableDirectory:Ljava/util/Map;

    const-string v1, "head"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 235
    .local v0, "tableLocation":[I
    const-string v2, "Table {0} does not exist in {1}"

    if-eqz v0, :cond_5

    .line 238
    iget-object v1, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    const/4 v3, 0x1

    aget v4, v0, v3

    add-int/lit8 v4, v4, 0x33

    int-to-long v4, v4

    invoke-virtual {v1, v4, v5}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 239
    iget-object v1, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v1

    if-nez v1, :cond_0

    move v1, v3

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    iput-boolean v1, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->locaShortTable:Z

    .line 240
    iget-object v1, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->tableDirectory:Ljava/util/Map;

    const-string v4, "loca"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, [I

    .line 241
    if-eqz v0, :cond_4

    .line 244
    iget-object v1, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    aget v2, v0, v3

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 245
    iget-boolean v1, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->locaShortTable:Z

    const/4 v2, 0x2

    if-eqz v1, :cond_2

    .line 246
    aget v1, v0, v2

    div-int/2addr v1, v2

    .line 247
    .local v1, "entries":I
    new-array v3, v1, [I

    iput-object v3, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->locaTable:[I

    .line 248
    const/4 v3, 0x0

    .local v3, "k":I
    :goto_1
    if-ge v3, v1, :cond_1

    .line 249
    iget-object v4, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->locaTable:[I

    iget-object v5, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v5}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v5

    mul-int/2addr v5, v2

    aput v5, v4, v3

    .line 248
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 251
    .end local v1    # "entries":I
    .end local v3    # "k":I
    :cond_1
    goto :goto_3

    .line 252
    :cond_2
    aget v1, v0, v2

    div-int/lit8 v1, v1, 0x4

    .line 253
    .restart local v1    # "entries":I
    new-array v2, v1, [I

    iput-object v2, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->locaTable:[I

    .line 254
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_2
    if-ge v2, v1, :cond_3

    .line 255
    iget-object v3, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->locaTable:[I

    iget-object v4, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v4

    aput v4, v3, v2

    .line 254
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 258
    .end local v1    # "entries":I
    .end local v2    # "k":I
    :cond_3
    :goto_3
    return-void

    .line 242
    :cond_4
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    invoke-direct {v1, v2}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->fileName:Ljava/lang/String;

    filled-new-array {v4, v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v1

    throw v1

    .line 236
    :cond_5
    new-instance v3, Lcom/itextpdf/io/exceptions/IOException;

    invoke-direct {v3, v2}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->fileName:Ljava/lang/String;

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v3, v1}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v1

    throw v1
.end method

.method private readStandardString(I)Ljava/lang/String;
    .locals 4
    .param p1, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 375
    new-array v0, p1, [B

    .line 376
    .local v0, "buf":[B
    iget-object v1, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1, v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readFully([B)V

    .line 378
    :try_start_0
    new-instance v1, Ljava/lang/String;

    const-string v2, "Cp1252"

    invoke-direct {v1, v0, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 379
    :catch_0
    move-exception v1

    .line 380
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Lcom/itextpdf/io/exceptions/IOException;

    const-string v3, "TrueType font"

    invoke-direct {v2, v3, v1}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method private writeFontInt(I)V
    .locals 3
    .param p1, "n"    # I

    .line 390
    iget-object v0, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->outFont:[B

    iget v1, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->fontPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->fontPtr:I

    shr-int/lit8 v2, p1, 0x18

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 391
    iget-object v0, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->outFont:[B

    iget v1, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->fontPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->fontPtr:I

    shr-int/lit8 v2, p1, 0x10

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 392
    iget-object v0, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->outFont:[B

    iget v1, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->fontPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->fontPtr:I

    shr-int/lit8 v2, p1, 0x8

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 393
    iget-object v0, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->outFont:[B

    iget v1, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->fontPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->fontPtr:I

    int-to-byte v2, p1

    aput-byte v2, v0, v1

    .line 394
    return-void
.end method

.method private writeFontShort(I)V
    .locals 3
    .param p1, "n"    # I

    .line 385
    iget-object v0, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->outFont:[B

    iget v1, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->fontPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->fontPtr:I

    shr-int/lit8 v2, p1, 0x8

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 386
    iget-object v0, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->outFont:[B

    iget v1, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->fontPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->fontPtr:I

    int-to-byte v2, p1

    aput-byte v2, v0, v1

    .line 387
    return-void
.end method

.method private writeFontString(Ljava/lang/String;)V
    .locals 5
    .param p1, "s"    # Ljava/lang/String;

    .line 397
    const-string v0, "Cp1252"

    invoke-static {p1, v0}, Lcom/itextpdf/io/font/PdfEncodings;->convertToBytes(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    .line 398
    .local v0, "b":[B
    iget-object v1, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->outFont:[B

    iget v2, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->fontPtr:I

    array-length v3, v0

    const/4 v4, 0x0

    invoke-static {v0, v4, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 399
    iget v1, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->fontPtr:I

    array-length v2, v0

    add-int/2addr v1, v2

    iput v1, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->fontPtr:I

    .line 400
    return-void
.end method


# virtual methods
.method process()[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 122
    :try_start_0
    invoke-direct {p0}, Lcom/itextpdf/io/font/TrueTypeFontSubset;->createTableDirectory()V

    .line 123
    invoke-direct {p0}, Lcom/itextpdf/io/font/TrueTypeFontSubset;->readLoca()V

    .line 124
    invoke-direct {p0}, Lcom/itextpdf/io/font/TrueTypeFontSubset;->flatGlyphs()V

    .line 125
    invoke-direct {p0}, Lcom/itextpdf/io/font/TrueTypeFontSubset;->createNewGlyphTables()V

    .line 126
    invoke-direct {p0}, Lcom/itextpdf/io/font/TrueTypeFontSubset;->locaToBytes()V

    .line 127
    invoke-direct {p0}, Lcom/itextpdf/io/font/TrueTypeFontSubset;->assembleFont()V

    .line 128
    iget-object v0, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->outFont:[B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 131
    :try_start_1
    iget-object v1, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 133
    goto :goto_0

    .line 132
    :catch_0
    move-exception v1

    .line 128
    :goto_0
    return-object v0

    .line 130
    :catchall_0
    move-exception v0

    .line 131
    :try_start_2
    iget-object v1, p0, Lcom/itextpdf/io/font/TrueTypeFontSubset;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 133
    goto :goto_1

    .line 132
    :catch_1
    move-exception v1

    .line 134
    :goto_1
    throw v0
.end method
