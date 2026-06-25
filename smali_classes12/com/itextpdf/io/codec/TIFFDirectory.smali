.class public Lcom/itextpdf/io/codec/TIFFDirectory;
.super Ljava/lang/Object;
.source "TIFFDirectory.java"


# static fields
.field private static final sizeOfType:[I


# instance fields
.field IFDOffset:J

.field fieldIndex:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field fields:[Lcom/itextpdf/io/codec/TIFFField;

.field isBigEndian:Z

.field nextIFDOffset:J

.field numEntries:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 223
    const/16 v0, 0xd

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/itextpdf/io/codec/TIFFDirectory;->sizeOfType:[I

    return-void

    :array_0
    .array-data 4
        0x0
        0x1
        0x1
        0x2
        0x4
        0x8
        0x1
        0x1
        0x2
        0x4
        0x8
        0x4
        0x8
    .end array-data
.end method

.method constructor <init>()V
    .locals 2

    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->fieldIndex:Ljava/util/Map;

    .line 105
    const-wide/16 v0, 0x8

    iput-wide v0, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->IFDOffset:J

    .line 110
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->nextIFDOffset:J

    .line 116
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;I)V
    .locals 12
    .param p1, "stream"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .param p2, "directory"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 134
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->fieldIndex:Ljava/util/Map;

    .line 105
    const-wide/16 v0, 0x8

    iput-wide v0, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->IFDOffset:J

    .line 110
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->nextIFDOffset:J

    .line 136
    invoke-virtual {p1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->getPosition()J

    move-result-wide v2

    .line 140
    .local v2, "global_save_offset":J
    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 141
    invoke-virtual {p1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v4

    .line 142
    .local v4, "endian":I
    invoke-static {v4}, Lcom/itextpdf/io/codec/TIFFDirectory;->isValidEndianTag(I)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 145
    const/16 v5, 0x4d4d

    if-ne v4, v5, :cond_0

    const/4 v5, 0x1

    goto :goto_0

    :cond_0
    const/4 v5, 0x0

    :goto_0
    iput-boolean v5, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->isBigEndian:Z

    .line 147
    invoke-direct {p0, p1}, Lcom/itextpdf/io/codec/TIFFDirectory;->readUnsignedShort(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)I

    move-result v5

    .line 148
    .local v5, "magic":I
    const/16 v6, 0x2a

    if-ne v5, v6, :cond_3

    .line 153
    invoke-direct {p0, p1}, Lcom/itextpdf/io/codec/TIFFDirectory;->readUnsignedInt(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)J

    move-result-wide v6

    .line 155
    .local v6, "ifd_offset":J
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_1
    if-ge v8, p2, :cond_2

    .line 156
    cmp-long v9, v6, v0

    if-eqz v9, :cond_1

    .line 160
    invoke-virtual {p1, v6, v7}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 161
    invoke-direct {p0, p1}, Lcom/itextpdf/io/codec/TIFFDirectory;->readUnsignedShort(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)I

    move-result v9

    .line 162
    .local v9, "entries":I
    mul-int/lit8 v10, v9, 0xc

    int-to-long v10, v10

    invoke-virtual {p1, v10, v11}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->skip(J)J

    .line 164
    invoke-direct {p0, p1}, Lcom/itextpdf/io/codec/TIFFDirectory;->readUnsignedInt(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)J

    move-result-wide v6

    .line 155
    .end local v9    # "entries":I
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 157
    :cond_1
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    const-string v1, "Directory number is too large."

    invoke-direct {v0, v1}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 167
    .end local v8    # "i":I
    :cond_2
    invoke-virtual {p1, v6, v7}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 168
    invoke-direct {p0, p1}, Lcom/itextpdf/io/codec/TIFFDirectory;->initialize(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)V

    .line 169
    invoke-virtual {p1, v2, v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 170
    return-void

    .line 149
    .end local v6    # "ifd_offset":J
    :cond_3
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    const-string v1, "Bad magic number. Should be 42."

    invoke-direct {v0, v1}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 143
    .end local v5    # "magic":I
    :cond_4
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    const-string v1, "Bad endianness tag: 0x4949 or 0x4d4d."

    invoke-direct {v0, v1}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public constructor <init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;JI)V
    .locals 7
    .param p1, "stream"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .param p2, "ifd_offset"    # J
    .param p4, "directory"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 187
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->fieldIndex:Ljava/util/Map;

    .line 105
    const-wide/16 v0, 0x8

    iput-wide v0, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->IFDOffset:J

    .line 110
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->nextIFDOffset:J

    .line 189
    invoke-virtual {p1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->getPosition()J

    move-result-wide v2

    .line 190
    .local v2, "global_save_offset":J
    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 191
    invoke-virtual {p1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v0

    .line 192
    .local v0, "endian":I
    invoke-static {v0}, Lcom/itextpdf/io/codec/TIFFDirectory;->isValidEndianTag(I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 195
    const/16 v1, 0x4d4d

    if-ne v0, v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    iput-boolean v1, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->isBigEndian:Z

    .line 198
    invoke-virtual {p1, p2, p3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 201
    const/4 v1, 0x0

    .line 202
    .local v1, "dirNum":I
    :goto_1
    if-ge v1, p4, :cond_1

    .line 204
    invoke-direct {p0, p1}, Lcom/itextpdf/io/codec/TIFFDirectory;->readUnsignedShort(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)I

    move-result v4

    .line 207
    .local v4, "numEntries":I
    mul-int/lit8 v5, v4, 0xc

    int-to-long v5, v5

    add-long/2addr v5, p2

    invoke-virtual {p1, v5, v6}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 210
    invoke-direct {p0, p1}, Lcom/itextpdf/io/codec/TIFFDirectory;->readUnsignedInt(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)J

    move-result-wide p2

    .line 213
    invoke-virtual {p1, p2, p3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 216
    nop

    .end local v4    # "numEntries":I
    add-int/lit8 v1, v1, 0x1

    .line 217
    goto :goto_1

    .line 219
    :cond_1
    invoke-direct {p0, p1}, Lcom/itextpdf/io/codec/TIFFDirectory;->initialize(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)V

    .line 220
    invoke-virtual {p1, v2, v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 221
    return-void

    .line 193
    .end local v1    # "dirNum":I
    :cond_2
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v4, "Bad endianness tag: 0x4949 or 0x4d4d."

    invoke-direct {v1, v4}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static getNumDirectories(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)I
    .locals 13
    .param p0, "stream"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 697
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->getPosition()J

    move-result-wide v0

    .line 699
    .local v0, "pointer":J
    const-wide/16 v2, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 700
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v4

    .line 701
    .local v4, "endian":I
    invoke-static {v4}, Lcom/itextpdf/io/codec/TIFFDirectory;->isValidEndianTag(I)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 704
    const/16 v5, 0x4d4d

    if-ne v4, v5, :cond_0

    const/4 v5, 0x1

    goto :goto_0

    :cond_0
    const/4 v5, 0x0

    .line 705
    .local v5, "isBigEndian":Z
    :goto_0
    invoke-static {p0, v5}, Lcom/itextpdf/io/codec/TIFFDirectory;->readUnsignedShort(Lcom/itextpdf/io/source/RandomAccessFileOrArray;Z)I

    move-result v6

    .line 706
    .local v6, "magic":I
    const/16 v7, 0x2a

    if-ne v6, v7, :cond_2

    .line 710
    const-wide/16 v7, 0x4

    invoke-virtual {p0, v7, v8}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 711
    invoke-static {p0, v5}, Lcom/itextpdf/io/codec/TIFFDirectory;->readUnsignedInt(Lcom/itextpdf/io/source/RandomAccessFileOrArray;Z)J

    move-result-wide v7

    .line 713
    .local v7, "offset":J
    const/4 v9, 0x0

    .line 714
    .local v9, "numDirectories":I
    :goto_1
    cmp-long v10, v7, v2

    if-eqz v10, :cond_1

    .line 715
    add-int/lit8 v9, v9, 0x1

    .line 719
    :try_start_0
    invoke-virtual {p0, v7, v8}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 720
    invoke-static {p0, v5}, Lcom/itextpdf/io/codec/TIFFDirectory;->readUnsignedShort(Lcom/itextpdf/io/source/RandomAccessFileOrArray;Z)I

    move-result v10

    .line 721
    .local v10, "entries":I
    mul-int/lit8 v11, v10, 0xc

    int-to-long v11, v11

    invoke-virtual {p0, v11, v12}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->skip(J)J

    .line 722
    invoke-static {p0, v5}, Lcom/itextpdf/io/codec/TIFFDirectory;->readUnsignedInt(Lcom/itextpdf/io/source/RandomAccessFileOrArray;Z)J

    move-result-wide v11
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    move-wide v7, v11

    .line 726
    .end local v10    # "entries":I
    goto :goto_1

    .line 723
    :catch_0
    move-exception v2

    .line 724
    .local v2, "eof":Ljava/io/EOFException;
    add-int/lit8 v9, v9, -0x1

    .line 725
    nop

    .line 730
    .end local v2    # "eof":Ljava/io/EOFException;
    :cond_1
    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 731
    return v9

    .line 707
    .end local v7    # "offset":J
    .end local v9    # "numDirectories":I
    :cond_2
    new-instance v2, Lcom/itextpdf/io/exceptions/IOException;

    const-string v3, "Bad magic number. Should be 42."

    invoke-direct {v2, v3}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 702
    .end local v5    # "isBigEndian":Z
    .end local v6    # "magic":I
    :cond_3
    new-instance v2, Lcom/itextpdf/io/exceptions/IOException;

    const-string v3, "Bad endianness tag: 0x4949 or 0x4d4d."

    invoke-direct {v2, v3}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private initialize(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)V
    .locals 20
    .param p1, "stream"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 266
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    const-wide/16 v3, 0x0

    .line 267
    .local v3, "nextTagOffset":J
    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->length()J

    move-result-wide v5

    .line 270
    .local v5, "maxOffset":J
    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->getPosition()J

    move-result-wide v7

    iput-wide v7, v1, Lcom/itextpdf/io/codec/TIFFDirectory;->IFDOffset:J

    .line 272
    invoke-direct/range {p0 .. p1}, Lcom/itextpdf/io/codec/TIFFDirectory;->readUnsignedShort(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)I

    move-result v0

    iput v0, v1, Lcom/itextpdf/io/codec/TIFFDirectory;->numEntries:I

    .line 273
    iget v0, v1, Lcom/itextpdf/io/codec/TIFFDirectory;->numEntries:I

    new-array v0, v0, [Lcom/itextpdf/io/codec/TIFFField;

    iput-object v0, v1, Lcom/itextpdf/io/codec/TIFFDirectory;->fields:[Lcom/itextpdf/io/codec/TIFFField;

    .line 275
    const/4 v0, 0x0

    move-wide v7, v3

    move v3, v0

    .local v3, "i":I
    .local v7, "nextTagOffset":J
    :goto_0
    iget v0, v1, Lcom/itextpdf/io/codec/TIFFDirectory;->numEntries:I

    if-ge v3, v0, :cond_10

    cmp-long v0, v7, v5

    if-gez v0, :cond_10

    .line 276
    invoke-direct/range {p0 .. p1}, Lcom/itextpdf/io/codec/TIFFDirectory;->readUnsignedShort(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)I

    move-result v4

    .line 277
    .local v4, "tag":I
    invoke-direct/range {p0 .. p1}, Lcom/itextpdf/io/codec/TIFFDirectory;->readUnsignedShort(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)I

    move-result v9

    .line 278
    .local v9, "type":I
    invoke-direct/range {p0 .. p1}, Lcom/itextpdf/io/codec/TIFFDirectory;->readUnsignedInt(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)J

    move-result-wide v10

    long-to-int v10, v10

    .line 279
    .local v10, "count":I
    const/4 v11, 0x1

    .line 282
    .local v11, "processTag":Z
    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->getPosition()J

    move-result-wide v12

    const-wide/16 v14, 0x4

    add-long v7, v12, v14

    .line 287
    :try_start_0
    sget-object v0, Lcom/itextpdf/io/codec/TIFFDirectory;->sizeOfType:[I

    aget v0, v0, v9

    mul-int/2addr v0, v10

    const/4 v12, 0x4

    if-le v0, v12, :cond_1

    .line 288
    invoke-direct/range {p0 .. p1}, Lcom/itextpdf/io/codec/TIFFDirectory;->readUnsignedInt(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)J

    move-result-wide v12

    .line 291
    .local v12, "valueOffset":J
    cmp-long v0, v12, v5

    if-gez v0, :cond_0

    .line 292
    invoke-virtual {v2, v12, v13}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 295
    :cond_0
    const/4 v11, 0x0

    .line 301
    .end local v12    # "valueOffset":J
    :cond_1
    :goto_1
    goto :goto_2

    .line 298
    :catch_0
    move-exception v0

    .line 300
    .local v0, "ae":Ljava/lang/ArrayIndexOutOfBoundsException;
    const/4 v11, 0x0

    .line 303
    .end local v0    # "ae":Ljava/lang/ArrayIndexOutOfBoundsException;
    :goto_2
    if-eqz v11, :cond_f

    .line 304
    iget-object v0, v1, Lcom/itextpdf/io/codec/TIFFDirectory;->fieldIndex:Ljava/util/Map;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-interface {v0, v12, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 305
    const/4 v0, 0x0

    .line 307
    .local v0, "obj":Ljava/lang/Object;
    const/4 v12, 0x2

    packed-switch v9, :pswitch_data_0

    move-object/from16 v16, v0

    move/from16 v17, v3

    .end local v0    # "obj":Ljava/lang/Object;
    .end local v3    # "i":I
    .local v16, "obj":Ljava/lang/Object;
    .local v17, "i":I
    goto/16 :goto_e

    .line 405
    .end local v16    # "obj":Ljava/lang/Object;
    .end local v17    # "i":I
    .restart local v0    # "obj":Ljava/lang/Object;
    .restart local v3    # "i":I
    :pswitch_0
    new-array v12, v10, [D

    .line 406
    .local v12, "dvalues":[D
    const/4 v13, 0x0

    .local v13, "j":I
    :goto_3
    if-ge v13, v10, :cond_2

    .line 407
    invoke-direct/range {p0 .. p1}, Lcom/itextpdf/io/codec/TIFFDirectory;->readDouble(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)D

    move-result-wide v14

    aput-wide v14, v12, v13

    .line 406
    add-int/lit8 v13, v13, 0x1

    goto :goto_3

    .line 409
    :cond_2
    move-object v0, v12

    .line 410
    move/from16 v17, v3

    goto/16 :goto_e

    .line 397
    .end local v12    # "dvalues":[D
    .end local v13    # "j":I
    :pswitch_1
    new-array v12, v10, [F

    .line 398
    .local v12, "fvalues":[F
    const/4 v13, 0x0

    .restart local v13    # "j":I
    :goto_4
    if-ge v13, v10, :cond_3

    .line 399
    invoke-direct/range {p0 .. p1}, Lcom/itextpdf/io/codec/TIFFDirectory;->readFloat(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)F

    move-result v14

    aput v14, v12, v13

    .line 398
    add-int/lit8 v13, v13, 0x1

    goto :goto_4

    .line 401
    :cond_3
    move-object v0, v12

    .line 402
    move/from16 v17, v3

    goto/16 :goto_e

    .line 387
    .end local v12    # "fvalues":[F
    .end local v13    # "j":I
    :pswitch_2
    new-array v15, v10, [[I

    .line 388
    .local v15, "iivalues":[[I
    const/16 v16, 0x0

    move/from16 v14, v16

    const/16 v17, 0x1

    .local v14, "j":I
    :goto_5
    if-ge v14, v10, :cond_4

    .line 389
    const/16 v16, 0x0

    new-array v13, v12, [I

    aput-object v13, v15, v14

    .line 390
    aget-object v13, v15, v14

    invoke-direct/range {p0 .. p1}, Lcom/itextpdf/io/codec/TIFFDirectory;->readInt(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)I

    move-result v18

    aput v18, v13, v16

    .line 391
    aget-object v13, v15, v14

    invoke-direct/range {p0 .. p1}, Lcom/itextpdf/io/codec/TIFFDirectory;->readInt(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)I

    move-result v18

    aput v18, v13, v17

    .line 388
    add-int/lit8 v14, v14, 0x1

    goto :goto_5

    .line 393
    :cond_4
    move-object v0, v15

    .line 394
    move/from16 v17, v3

    goto/16 :goto_e

    .line 379
    .end local v14    # "j":I
    .end local v15    # "iivalues":[[I
    :pswitch_3
    new-array v12, v10, [I

    .line 380
    .local v12, "ivalues":[I
    const/4 v13, 0x0

    .restart local v13    # "j":I
    :goto_6
    if-ge v13, v10, :cond_5

    .line 381
    invoke-direct/range {p0 .. p1}, Lcom/itextpdf/io/codec/TIFFDirectory;->readInt(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)I

    move-result v14

    aput v14, v12, v13

    .line 380
    add-int/lit8 v13, v13, 0x1

    goto :goto_6

    .line 383
    :cond_5
    move-object v0, v12

    .line 384
    move/from16 v17, v3

    goto/16 :goto_e

    .line 371
    .end local v12    # "ivalues":[I
    .end local v13    # "j":I
    :pswitch_4
    new-array v12, v10, [S

    .line 372
    .local v12, "svalues":[S
    const/4 v13, 0x0

    .restart local v13    # "j":I
    :goto_7
    if-ge v13, v10, :cond_6

    .line 373
    invoke-direct/range {p0 .. p1}, Lcom/itextpdf/io/codec/TIFFDirectory;->readShort(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)S

    move-result v14

    aput-short v14, v12, v13

    .line 372
    add-int/lit8 v13, v13, 0x1

    goto :goto_7

    .line 375
    :cond_6
    move-object v0, v12

    .line 376
    move/from16 v17, v3

    goto/16 :goto_e

    .line 361
    .end local v12    # "svalues":[S
    .end local v13    # "j":I
    :pswitch_5
    const/16 v16, 0x0

    const/16 v17, 0x1

    new-array v13, v10, [[J

    .line 362
    .local v13, "llvalues":[[J
    const/4 v14, 0x0

    .restart local v14    # "j":I
    :goto_8
    if-ge v14, v10, :cond_7

    .line 363
    new-array v15, v12, [J

    aput-object v15, v13, v14

    .line 364
    aget-object v15, v13, v14

    invoke-direct/range {p0 .. p1}, Lcom/itextpdf/io/codec/TIFFDirectory;->readUnsignedInt(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)J

    move-result-wide v18

    aput-wide v18, v15, v16

    .line 365
    aget-object v15, v13, v14

    invoke-direct/range {p0 .. p1}, Lcom/itextpdf/io/codec/TIFFDirectory;->readUnsignedInt(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)J

    move-result-wide v18

    aput-wide v18, v15, v17

    .line 362
    add-int/lit8 v14, v14, 0x1

    goto :goto_8

    .line 367
    :cond_7
    move-object v0, v13

    .line 368
    move/from16 v17, v3

    goto/16 :goto_e

    .line 353
    .end local v13    # "llvalues":[[J
    .end local v14    # "j":I
    :pswitch_6
    new-array v12, v10, [J

    .line 354
    .local v12, "lvalues":[J
    const/4 v13, 0x0

    .local v13, "j":I
    :goto_9
    if-ge v13, v10, :cond_8

    .line 355
    invoke-direct/range {p0 .. p1}, Lcom/itextpdf/io/codec/TIFFDirectory;->readUnsignedInt(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)J

    move-result-wide v14

    aput-wide v14, v12, v13

    .line 354
    add-int/lit8 v13, v13, 0x1

    goto :goto_9

    .line 357
    :cond_8
    move-object v0, v12

    .line 358
    move/from16 v17, v3

    goto/16 :goto_e

    .line 345
    .end local v12    # "lvalues":[J
    .end local v13    # "j":I
    :pswitch_7
    new-array v12, v10, [C

    .line 346
    .local v12, "cvalues":[C
    const/4 v13, 0x0

    .restart local v13    # "j":I
    :goto_a
    if-ge v13, v10, :cond_9

    .line 347
    invoke-direct/range {p0 .. p1}, Lcom/itextpdf/io/codec/TIFFDirectory;->readUnsignedShort(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)I

    move-result v14

    int-to-char v14, v14

    aput-char v14, v12, v13

    .line 346
    add-int/lit8 v13, v13, 0x1

    goto :goto_a

    .line 349
    :cond_9
    move-object v0, v12

    .line 350
    move/from16 v17, v3

    goto :goto_e

    .line 312
    .end local v12    # "cvalues":[C
    .end local v13    # "j":I
    :pswitch_8
    const/16 v16, 0x0

    new-array v13, v10, [B

    .line 313
    .local v13, "bvalues":[B
    move/from16 v14, v16

    invoke-virtual {v2, v13, v14, v10}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readFully([BII)V

    .line 315
    if-ne v9, v12, :cond_e

    .line 318
    const/4 v12, 0x0

    .local v12, "index":I
    const/4 v14, 0x0

    .line 319
    .local v14, "prevIndex":I
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 321
    .local v15, "v":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_b
    if-ge v12, v10, :cond_c

    .line 323
    :goto_c
    if-ge v12, v10, :cond_b

    add-int/lit8 v16, v12, 0x1

    .end local v12    # "index":I
    .local v16, "index":I
    aget-byte v12, v13, v12

    if-eqz v12, :cond_a

    move/from16 v12, v16

    goto :goto_c

    :cond_a
    move/from16 v12, v16

    .line 326
    .end local v16    # "index":I
    .restart local v12    # "index":I
    :cond_b
    move-object/from16 v16, v0

    .end local v0    # "obj":Ljava/lang/Object;
    .local v16, "obj":Ljava/lang/Object;
    new-instance v0, Ljava/lang/String;

    move/from16 v17, v3

    .end local v3    # "i":I
    .restart local v17    # "i":I
    sub-int v3, v12, v14

    invoke-direct {v0, v13, v14, v3}, Ljava/lang/String;-><init>([BII)V

    invoke-interface {v15, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 328
    move v14, v12

    move-object/from16 v0, v16

    move/from16 v3, v17

    goto :goto_b

    .line 331
    .end local v16    # "obj":Ljava/lang/Object;
    .end local v17    # "i":I
    .restart local v0    # "obj":Ljava/lang/Object;
    .restart local v3    # "i":I
    :cond_c
    move-object/from16 v16, v0

    move/from16 v17, v3

    .end local v0    # "obj":Ljava/lang/Object;
    .end local v3    # "i":I
    .restart local v16    # "obj":Ljava/lang/Object;
    .restart local v17    # "i":I
    invoke-interface {v15}, Ljava/util/List;->size()I

    move-result v0

    .line 332
    .end local v10    # "count":I
    .local v0, "count":I
    new-array v3, v0, [Ljava/lang/String;

    .line 333
    .local v3, "strings":[Ljava/lang/String;
    const/4 v10, 0x0

    .local v10, "c":I
    :goto_d
    if-ge v10, v0, :cond_d

    .line 334
    invoke-interface {v15, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/lang/String;

    aput-object v18, v3, v10

    .line 333
    add-int/lit8 v10, v10, 0x1

    goto :goto_d

    .line 337
    .end local v10    # "c":I
    :cond_d
    nop

    .line 338
    .end local v12    # "index":I
    .end local v14    # "prevIndex":I
    .end local v15    # "v":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v16    # "obj":Ljava/lang/Object;
    .local v3, "obj":Ljava/lang/Object;
    move v10, v0

    move-object v0, v3

    goto :goto_e

    .line 339
    .end local v17    # "i":I
    .local v0, "obj":Ljava/lang/Object;
    .local v3, "i":I
    .local v10, "count":I
    :cond_e
    move-object/from16 v16, v0

    move/from16 v17, v3

    .end local v0    # "obj":Ljava/lang/Object;
    .end local v3    # "i":I
    .restart local v16    # "obj":Ljava/lang/Object;
    .restart local v17    # "i":I
    move-object v0, v13

    .line 342
    .end local v16    # "obj":Ljava/lang/Object;
    .restart local v0    # "obj":Ljava/lang/Object;
    nop

    .line 416
    .end local v13    # "bvalues":[B
    :goto_e
    iget-object v3, v1, Lcom/itextpdf/io/codec/TIFFDirectory;->fields:[Lcom/itextpdf/io/codec/TIFFField;

    new-instance v12, Lcom/itextpdf/io/codec/TIFFField;

    invoke-direct {v12, v4, v9, v10, v0}, Lcom/itextpdf/io/codec/TIFFField;-><init>(IIILjava/lang/Object;)V

    aput-object v12, v3, v17

    goto :goto_f

    .line 303
    .end local v0    # "obj":Ljava/lang/Object;
    .end local v17    # "i":I
    .restart local v3    # "i":I
    :cond_f
    move/from16 v17, v3

    .line 419
    .end local v3    # "i":I
    .restart local v17    # "i":I
    :goto_f
    invoke-virtual {v2, v7, v8}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 275
    .end local v4    # "tag":I
    .end local v9    # "type":I
    .end local v10    # "count":I
    .end local v11    # "processTag":Z
    add-int/lit8 v3, v17, 0x1

    .end local v17    # "i":I
    .restart local v3    # "i":I
    goto/16 :goto_0

    :cond_10
    move/from16 v17, v3

    .line 424
    .end local v3    # "i":I
    .restart local v17    # "i":I
    :try_start_1
    invoke-direct/range {p0 .. p1}, Lcom/itextpdf/io/codec/TIFFDirectory;->readUnsignedInt(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)J

    move-result-wide v3

    iput-wide v3, v1, Lcom/itextpdf/io/codec/TIFFDirectory;->nextIFDOffset:J
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 428
    goto :goto_10

    .line 425
    :catch_1
    move-exception v0

    .line 427
    .local v0, "e":Ljava/lang/Exception;
    const-wide/16 v3, 0x0

    iput-wide v3, v1, Lcom/itextpdf/io/codec/TIFFDirectory;->nextIFDOffset:J

    .line 429
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_10
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_8
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_8
        :pswitch_8
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static isValidEndianTag(I)Z
    .locals 1
    .param p0, "endian"    # I

    .line 119
    const/16 v0, 0x4949

    if-eq p0, v0, :cond_1

    const/16 v0, 0x4d4d

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private readDouble(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)D
    .locals 2
    .param p1, "stream"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 655
    iget-boolean v0, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->isBigEndian:Z

    if-eqz v0, :cond_0

    .line 656
    invoke-virtual {p1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readDouble()D

    move-result-wide v0

    return-wide v0

    .line 658
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readDoubleLE()D

    move-result-wide v0

    return-wide v0
.end method

.method private readFloat(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)F
    .locals 1
    .param p1, "stream"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 646
    iget-boolean v0, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->isBigEndian:Z

    if-eqz v0, :cond_0

    .line 647
    invoke-virtual {p1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readFloat()F

    move-result v0

    return v0

    .line 649
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readFloatLE()F

    move-result v0

    return v0
.end method

.method private readInt(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)I
    .locals 1
    .param p1, "stream"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 619
    iget-boolean v0, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->isBigEndian:Z

    if-eqz v0, :cond_0

    .line 620
    invoke-virtual {p1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v0

    return v0

    .line 622
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readIntLE()I

    move-result v0

    return v0
.end method

.method private readLong(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)J
    .locals 2
    .param p1, "stream"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 637
    iget-boolean v0, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->isBigEndian:Z

    if-eqz v0, :cond_0

    .line 638
    invoke-virtual {p1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readLong()J

    move-result-wide v0

    return-wide v0

    .line 640
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readLongLE()J

    move-result-wide v0

    return-wide v0
.end method

.method private readShort(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)S
    .locals 1
    .param p1, "stream"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 601
    iget-boolean v0, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->isBigEndian:Z

    if-eqz v0, :cond_0

    .line 602
    invoke-virtual {p1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v0

    return v0

    .line 604
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShortLE()S

    move-result v0

    return v0
.end method

.method private readUnsignedInt(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)J
    .locals 2
    .param p1, "stream"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 628
    iget-boolean v0, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->isBigEndian:Z

    if-eqz v0, :cond_0

    .line 629
    invoke-virtual {p1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedInt()J

    move-result-wide v0

    return-wide v0

    .line 631
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedIntLE()J

    move-result-wide v0

    return-wide v0
.end method

.method private static readUnsignedInt(Lcom/itextpdf/io/source/RandomAccessFileOrArray;Z)J
    .locals 2
    .param p0, "stream"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .param p1, "isBigEndian"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 675
    if-eqz p1, :cond_0

    .line 676
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedInt()J

    move-result-wide v0

    return-wide v0

    .line 678
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedIntLE()J

    move-result-wide v0

    return-wide v0
.end method

.method private readUnsignedShort(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)I
    .locals 1
    .param p1, "stream"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 610
    iget-boolean v0, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->isBigEndian:Z

    if-eqz v0, :cond_0

    .line 611
    invoke-virtual {p1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v0

    return v0

    .line 613
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShortLE()I

    move-result v0

    return v0
.end method

.method private static readUnsignedShort(Lcom/itextpdf/io/source/RandomAccessFileOrArray;Z)I
    .locals 1
    .param p0, "stream"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .param p1, "isBigEndian"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 665
    if-eqz p1, :cond_0

    .line 666
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v0

    return v0

    .line 668
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShortLE()I

    move-result v0

    return v0
.end method


# virtual methods
.method public getField(I)Lcom/itextpdf/io/codec/TIFFField;
    .locals 3
    .param p1, "tag"    # I

    .line 446
    iget-object v0, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->fieldIndex:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 447
    .local v0, "i":Ljava/lang/Integer;
    if-nez v0, :cond_0

    .line 448
    const/4 v1, 0x0

    return-object v1

    .line 450
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->fields:[Lcom/itextpdf/io/codec/TIFFField;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    aget-object v1, v1, v2

    return-object v1
.end method

.method public getFieldAsByte(I)B
    .locals 1
    .param p1, "tag"    # I

    .line 512
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/io/codec/TIFFDirectory;->getFieldAsByte(II)B

    move-result v0

    return v0
.end method

.method public getFieldAsByte(II)B
    .locals 3
    .param p1, "tag"    # I
    .param p2, "index"    # I

    .line 498
    iget-object v0, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->fieldIndex:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 499
    .local v0, "i":Ljava/lang/Integer;
    iget-object v1, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->fields:[Lcom/itextpdf/io/codec/TIFFField;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    aget-object v1, v1, v2

    invoke-virtual {v1}, Lcom/itextpdf/io/codec/TIFFField;->getAsBytes()[B

    move-result-object v1

    .line 500
    .local v1, "b":[B
    aget-byte v2, v1, p2

    return v2
.end method

.method public getFieldAsDouble(I)D
    .locals 2
    .param p1, "tag"    # I

    .line 594
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/io/codec/TIFFDirectory;->getFieldAsDouble(II)D

    move-result-wide v0

    return-wide v0
.end method

.method public getFieldAsDouble(II)D
    .locals 3
    .param p1, "tag"    # I
    .param p2, "index"    # I

    .line 581
    iget-object v0, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->fieldIndex:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 582
    .local v0, "i":Ljava/lang/Integer;
    iget-object v1, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->fields:[Lcom/itextpdf/io/codec/TIFFField;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    aget-object v1, v1, v2

    invoke-virtual {v1, p2}, Lcom/itextpdf/io/codec/TIFFField;->getAsDouble(I)D

    move-result-wide v1

    return-wide v1
.end method

.method public getFieldAsFloat(I)F
    .locals 1
    .param p1, "tag"    # I

    .line 567
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/io/codec/TIFFDirectory;->getFieldAsFloat(II)F

    move-result v0

    return v0
.end method

.method public getFieldAsFloat(II)F
    .locals 3
    .param p1, "tag"    # I
    .param p2, "index"    # I

    .line 554
    iget-object v0, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->fieldIndex:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 555
    .local v0, "i":Ljava/lang/Integer;
    iget-object v1, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->fields:[Lcom/itextpdf/io/codec/TIFFField;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    aget-object v1, v1, v2

    invoke-virtual {v1, p2}, Lcom/itextpdf/io/codec/TIFFField;->getAsFloat(I)F

    move-result v1

    return v1
.end method

.method public getFieldAsLong(I)J
    .locals 2
    .param p1, "tag"    # I

    .line 540
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/io/codec/TIFFDirectory;->getFieldAsLong(II)J

    move-result-wide v0

    return-wide v0
.end method

.method public getFieldAsLong(II)J
    .locals 3
    .param p1, "tag"    # I
    .param p2, "index"    # I

    .line 526
    iget-object v0, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->fieldIndex:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 527
    .local v0, "i":Ljava/lang/Integer;
    iget-object v1, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->fields:[Lcom/itextpdf/io/codec/TIFFField;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    aget-object v1, v1, v2

    invoke-virtual {v1, p2}, Lcom/itextpdf/io/codec/TIFFField;->getAsLong(I)J

    move-result-wide v1

    return-wide v1
.end method

.method public getFields()[Lcom/itextpdf/io/codec/TIFFField;
    .locals 1

    .line 485
    iget-object v0, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->fields:[Lcom/itextpdf/io/codec/TIFFField;

    return-object v0
.end method

.method public getIFDOffset()J
    .locals 2

    .line 751
    iget-wide v0, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->IFDOffset:J

    return-wide v0
.end method

.method public getNextIFDOffset()J
    .locals 2

    .line 762
    iget-wide v0, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->nextIFDOffset:J

    return-wide v0
.end method

.method public getNumEntries()I
    .locals 1

    .line 436
    iget v0, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->numEntries:I

    return v0
.end method

.method public getTags()[I
    .locals 6

    .line 469
    iget-object v0, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->fieldIndex:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    new-array v0, v0, [I

    .line 470
    .local v0, "tags":[I
    const/4 v1, 0x0

    .line 472
    .local v1, "i":I
    iget-object v2, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->fieldIndex:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    .line 473
    .local v3, "integer":Ljava/lang/Integer;
    add-int/lit8 v4, v1, 0x1

    .end local v1    # "i":I
    .local v4, "i":I
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v5

    aput v5, v0, v1

    .line 474
    .end local v3    # "integer":Ljava/lang/Integer;
    move v1, v4

    goto :goto_0

    .line 476
    .end local v4    # "i":I
    .restart local v1    # "i":I
    :cond_0
    return-object v0
.end method

.method public isBigEndian()Z
    .locals 1

    .line 742
    iget-boolean v0, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->isBigEndian:Z

    return v0
.end method

.method public isTagPresent(I)Z
    .locals 2
    .param p1, "tag"    # I

    .line 460
    iget-object v0, p0, Lcom/itextpdf/io/codec/TIFFDirectory;->fieldIndex:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
