.class Lcom/itextpdf/io/font/WoffConverter;
.super Ljava/lang/Object;
.source "WoffConverter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/io/font/WoffConverter$TableDirectory;
    }
.end annotation


# static fields
.field private static final woffSignature:J = 0x774f4646L


# direct methods
.method constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static bytesToUInt([BI)J
    .locals 7
    .param p0, "b"    # [B
    .param p1, "start"    # I

    .line 206
    aget-byte v0, p0, p1

    int-to-long v0, v0

    const-wide/16 v2, 0xff

    and-long/2addr v0, v2

    const/16 v4, 0x18

    shl-long/2addr v0, v4

    add-int/lit8 v4, p1, 0x1

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x10

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 v4, p1, 0x2

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x8

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 v4, p1, 0x3

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    return-wide v0
.end method

.method private static bytesToUShort([BI)I
    .locals 2
    .param p0, "b"    # [B
    .param p1, "start"    # I

    .line 213
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x8

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method public static convert([B)[B
    .locals 23
    .param p0, "woffBytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 39
    move-object/from16 v0, p0

    const/4 v1, 0x0

    .line 40
    .local v1, "srcPos":I
    const/4 v2, 0x0

    .line 43
    .local v2, "destPos":I
    invoke-static {v0, v1}, Lcom/itextpdf/io/font/WoffConverter;->bytesToUInt([BI)J

    move-result-wide v3

    const-wide/32 v5, 0x774f4646

    cmp-long v3, v3, v5

    if-nez v3, :cond_10

    .line 46
    const/4 v3, 0x4

    add-int/2addr v1, v3

    .line 48
    new-array v4, v3, [B

    .line 49
    .local v4, "flavor":[B
    const/4 v5, 0x0

    invoke-static {v0, v1, v4, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 50
    add-int/2addr v1, v3

    .line 53
    invoke-static {v0, v1}, Lcom/itextpdf/io/font/WoffConverter;->bytesToUInt([BI)J

    move-result-wide v6

    array-length v8, v0

    int-to-long v8, v8

    cmp-long v6, v6, v8

    if-nez v6, :cond_f

    .line 56
    add-int/2addr v1, v3

    .line 58
    const/4 v6, 0x2

    new-array v7, v6, [B

    .line 59
    .local v7, "numTables":[B
    invoke-static {v0, v1, v7, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 60
    add-int/2addr v1, v6

    .line 63
    invoke-static {v0, v1}, Lcom/itextpdf/io/font/WoffConverter;->bytesToUShort([BI)I

    move-result v8

    if-nez v8, :cond_e

    .line 66
    add-int/2addr v1, v6

    .line 68
    invoke-static {v0, v1}, Lcom/itextpdf/io/font/WoffConverter;->bytesToUInt([BI)J

    move-result-wide v8

    .line 69
    .local v8, "totalSfntSize":J
    add-int/2addr v1, v3

    .line 72
    add-int/2addr v1, v6

    .line 74
    add-int/2addr v1, v6

    .line 76
    add-int/2addr v1, v3

    .line 78
    add-int/2addr v1, v3

    .line 80
    add-int/2addr v1, v3

    .line 82
    add-int/2addr v1, v3

    .line 84
    add-int/2addr v1, v3

    .line 88
    long-to-int v10, v8

    new-array v10, v10, [B

    .line 89
    .local v10, "otfBytes":[B
    invoke-static {v4, v5, v10, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 90
    add-int/2addr v2, v3

    .line 91
    invoke-static {v7, v5, v10, v2, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 92
    add-int/2addr v2, v6

    .line 94
    const/4 v11, -0x1

    .line 95
    .local v11, "entrySelector":I
    const/4 v12, -0x1

    .line 96
    .local v12, "searchRange":I
    invoke-static {v7, v5}, Lcom/itextpdf/io/font/WoffConverter;->bytesToUShort([BI)I

    move-result v13

    .line 97
    .local v13, "numTablesVal":I
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_0
    const/16 v15, 0x11

    if-ge v14, v15, :cond_1

    .line 98
    move v15, v6

    move-object/from16 v16, v7

    .end local v7    # "numTables":[B
    .local v16, "numTables":[B
    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    move-object/from16 v18, v4

    .end local v4    # "flavor":[B
    .local v18, "flavor":[B
    int-to-double v3, v14

    invoke-static {v6, v7, v3, v4}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v3

    double-to-int v3, v3

    .line 99
    .local v3, "powOfTwo":I
    if-le v3, v13, :cond_0

    .line 100
    move v11, v14

    .line 101
    mul-int/lit8 v12, v3, 0x10

    .line 102
    goto :goto_1

    .line 97
    .end local v3    # "powOfTwo":I
    :cond_0
    add-int/lit8 v14, v14, 0x1

    move v6, v15

    move-object/from16 v7, v16

    move-object/from16 v4, v18

    const/4 v3, 0x4

    goto :goto_0

    .end local v16    # "numTables":[B
    .end local v18    # "flavor":[B
    .restart local v4    # "flavor":[B
    .restart local v7    # "numTables":[B
    :cond_1
    move-object/from16 v18, v4

    move v15, v6

    move-object/from16 v16, v7

    .line 105
    .end local v4    # "flavor":[B
    .end local v7    # "numTables":[B
    .end local v14    # "i":I
    .restart local v16    # "numTables":[B
    .restart local v18    # "flavor":[B
    :goto_1
    if-ltz v11, :cond_d

    .line 108
    shr-int/lit8 v3, v12, 0x8

    int-to-byte v3, v3

    aput-byte v3, v10, v2

    .line 109
    add-int/lit8 v3, v2, 0x1

    int-to-byte v4, v12

    aput-byte v4, v10, v3

    .line 110
    add-int/2addr v2, v15

    .line 111
    shr-int/lit8 v3, v11, 0x8

    int-to-byte v3, v3

    aput-byte v3, v10, v2

    .line 112
    add-int/lit8 v3, v2, 0x1

    int-to-byte v4, v11

    aput-byte v4, v10, v3

    .line 113
    add-int/2addr v2, v15

    .line 114
    mul-int/lit8 v3, v13, 0x10

    sub-int/2addr v3, v12

    .line 115
    .local v3, "rangeShift":I
    shr-int/lit8 v4, v3, 0x8

    int-to-byte v4, v4

    aput-byte v4, v10, v2

    .line 116
    add-int/lit8 v4, v2, 0x1

    int-to-byte v6, v3

    aput-byte v6, v10, v4

    .line 117
    add-int/2addr v2, v15

    .line 119
    move v4, v2

    .line 120
    .local v4, "outTableOffset":I
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6, v13}, Ljava/util/ArrayList;-><init>(I)V

    .line 121
    .local v6, "tdList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/WoffConverter$TableDirectory;>;"
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_2
    if-ge v7, v13, :cond_3

    .line 122
    new-instance v14, Lcom/itextpdf/io/font/WoffConverter$TableDirectory;

    const/4 v15, 0x0

    invoke-direct {v14, v15}, Lcom/itextpdf/io/font/WoffConverter$TableDirectory;-><init>(Lcom/itextpdf/io/font/WoffConverter$1;)V

    .line 123
    .local v14, "td":Lcom/itextpdf/io/font/WoffConverter$TableDirectory;
    iget-object v15, v14, Lcom/itextpdf/io/font/WoffConverter$TableDirectory;->tag:[B

    move/from16 v19, v2

    const/4 v2, 0x4

    .end local v2    # "destPos":I
    .local v19, "destPos":I
    invoke-static {v0, v1, v15, v5, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 124
    add-int/lit8 v1, v1, 0x4

    .line 125
    move/from16 v17, v2

    move v15, v3

    .end local v3    # "rangeShift":I
    .local v15, "rangeShift":I
    invoke-static {v0, v1}, Lcom/itextpdf/io/font/WoffConverter;->bytesToUInt([BI)J

    move-result-wide v2

    iput-wide v2, v14, Lcom/itextpdf/io/font/WoffConverter$TableDirectory;->offset:J

    .line 126
    add-int/lit8 v1, v1, 0x4

    .line 128
    iget-wide v2, v14, Lcom/itextpdf/io/font/WoffConverter$TableDirectory;->offset:J

    const-wide/16 v20, 0x4

    rem-long v2, v2, v20

    const-wide/16 v20, 0x0

    cmp-long v2, v2, v20

    if-nez v2, :cond_2

    .line 132
    invoke-static {v0, v1}, Lcom/itextpdf/io/font/WoffConverter;->bytesToUInt([BI)J

    move-result-wide v2

    iput-wide v2, v14, Lcom/itextpdf/io/font/WoffConverter$TableDirectory;->compLength:J

    .line 133
    add-int/lit8 v1, v1, 0x4

    .line 134
    iget-object v2, v14, Lcom/itextpdf/io/font/WoffConverter$TableDirectory;->origLength:[B

    const/4 v3, 0x4

    invoke-static {v0, v1, v2, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 135
    iget-object v2, v14, Lcom/itextpdf/io/font/WoffConverter$TableDirectory;->origLength:[B

    move/from16 v17, v3

    move/from16 v20, v4

    .end local v4    # "outTableOffset":I
    .local v20, "outTableOffset":I
    invoke-static {v2, v5}, Lcom/itextpdf/io/font/WoffConverter;->bytesToUInt([BI)J

    move-result-wide v3

    iput-wide v3, v14, Lcom/itextpdf/io/font/WoffConverter$TableDirectory;->origLengthVal:J

    .line 136
    add-int/lit8 v1, v1, 0x4

    .line 137
    iget-object v2, v14, Lcom/itextpdf/io/font/WoffConverter$TableDirectory;->origChecksum:[B

    move/from16 v3, v17

    invoke-static {v0, v1, v2, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 138
    add-int/2addr v1, v3

    .line 140
    invoke-interface {v6, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 141
    nop

    .end local v14    # "td":Lcom/itextpdf/io/font/WoffConverter$TableDirectory;
    add-int/lit8 v4, v20, 0x10

    .line 121
    .end local v20    # "outTableOffset":I
    .restart local v4    # "outTableOffset":I
    add-int/lit8 v7, v7, 0x1

    move v3, v15

    move/from16 v2, v19

    goto :goto_2

    .line 129
    .restart local v14    # "td":Lcom/itextpdf/io/font/WoffConverter$TableDirectory;
    :cond_2
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-direct {v2}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v2

    .line 121
    .end local v14    # "td":Lcom/itextpdf/io/font/WoffConverter$TableDirectory;
    .end local v15    # "rangeShift":I
    .end local v19    # "destPos":I
    .restart local v2    # "destPos":I
    .restart local v3    # "rangeShift":I
    :cond_3
    move/from16 v19, v2

    move v15, v3

    move/from16 v20, v4

    .line 144
    .end local v2    # "destPos":I
    .end local v3    # "rangeShift":I
    .end local v4    # "outTableOffset":I
    .end local v7    # "i":I
    .restart local v15    # "rangeShift":I
    .restart local v19    # "destPos":I
    .restart local v20    # "outTableOffset":I
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move/from16 v3, v19

    .end local v19    # "destPos":I
    .end local v20    # "outTableOffset":I
    .local v3, "destPos":I
    .restart local v4    # "outTableOffset":I
    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/io/font/WoffConverter$TableDirectory;

    .line 145
    .local v7, "td":Lcom/itextpdf/io/font/WoffConverter$TableDirectory;
    iget-object v14, v7, Lcom/itextpdf/io/font/WoffConverter$TableDirectory;->tag:[B

    move/from16 v19, v1

    const/4 v1, 0x4

    .end local v1    # "srcPos":I
    .local v19, "srcPos":I
    invoke-static {v14, v5, v10, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 146
    add-int/lit8 v3, v3, 0x4

    .line 148
    iget-object v14, v7, Lcom/itextpdf/io/font/WoffConverter$TableDirectory;->origChecksum:[B

    invoke-static {v14, v5, v10, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 149
    add-int/2addr v3, v1

    .line 151
    shr-int/lit8 v1, v4, 0x18

    int-to-byte v1, v1

    aput-byte v1, v10, v3

    .line 152
    add-int/lit8 v1, v3, 0x1

    shr-int/lit8 v14, v4, 0x10

    int-to-byte v14, v14

    aput-byte v14, v10, v1

    .line 153
    add-int/lit8 v1, v3, 0x2

    shr-int/lit8 v14, v4, 0x8

    int-to-byte v14, v14

    aput-byte v14, v10, v1

    .line 154
    add-int/lit8 v1, v3, 0x3

    int-to-byte v14, v4

    aput-byte v14, v10, v1

    .line 155
    const/4 v1, 0x4

    add-int/2addr v3, v1

    .line 157
    iget-object v14, v7, Lcom/itextpdf/io/font/WoffConverter$TableDirectory;->origLength:[B

    invoke-static {v14, v5, v10, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 158
    add-int/2addr v3, v1

    .line 160
    iput v4, v7, Lcom/itextpdf/io/font/WoffConverter$TableDirectory;->outOffset:I

    .line 162
    move-object v14, v6

    .end local v6    # "tdList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/WoffConverter$TableDirectory;>;"
    .local v14, "tdList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/WoffConverter$TableDirectory;>;"
    iget-wide v5, v7, Lcom/itextpdf/io/font/WoffConverter$TableDirectory;->origLengthVal:J

    long-to-int v1, v5

    add-int/2addr v4, v1

    .line 163
    rem-int/lit8 v1, v4, 0x4

    if-eqz v1, :cond_4

    .line 164
    rem-int/lit8 v1, v4, 0x4

    const/16 v17, 0x4

    rsub-int/lit8 v1, v1, 0x4

    add-int/2addr v4, v1

    goto :goto_4

    .line 163
    :cond_4
    const/16 v17, 0x4

    .line 166
    .end local v7    # "td":Lcom/itextpdf/io/font/WoffConverter$TableDirectory;
    :goto_4
    move-object v6, v14

    move/from16 v1, v19

    const/4 v5, 0x0

    goto :goto_3

    .line 168
    .end local v14    # "tdList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/WoffConverter$TableDirectory;>;"
    .end local v19    # "srcPos":I
    .restart local v1    # "srcPos":I
    .restart local v6    # "tdList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/WoffConverter$TableDirectory;>;"
    :cond_5
    move/from16 v19, v1

    move-object v14, v6

    .end local v1    # "srcPos":I
    .end local v6    # "tdList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/WoffConverter$TableDirectory;>;"
    .restart local v14    # "tdList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/WoffConverter$TableDirectory;>;"
    .restart local v19    # "srcPos":I
    int-to-long v1, v4

    cmp-long v1, v1, v8

    if-nez v1, :cond_c

    .line 172
    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_5
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/io/font/WoffConverter$TableDirectory;

    .line 173
    .local v2, "td":Lcom/itextpdf/io/font/WoffConverter$TableDirectory;
    iget-wide v5, v2, Lcom/itextpdf/io/font/WoffConverter$TableDirectory;->compLength:J

    long-to-int v5, v5

    new-array v5, v5, [B

    .line 175
    .local v5, "compressedData":[B
    iget-wide v6, v2, Lcom/itextpdf/io/font/WoffConverter$TableDirectory;->offset:J

    long-to-int v6, v6

    move v7, v3

    move/from16 v17, v4

    .end local v3    # "destPos":I
    .end local v4    # "outTableOffset":I
    .local v7, "destPos":I
    .local v17, "outTableOffset":I
    iget-wide v3, v2, Lcom/itextpdf/io/font/WoffConverter$TableDirectory;->compLength:J

    long-to-int v3, v3

    const/4 v4, 0x0

    invoke-static {v0, v6, v5, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 176
    iget-wide v3, v2, Lcom/itextpdf/io/font/WoffConverter$TableDirectory;->origLengthVal:J

    long-to-int v3, v3

    .line 177
    .local v3, "expectedUncompressedLen":I
    move-object v4, v1

    iget-wide v0, v2, Lcom/itextpdf/io/font/WoffConverter$TableDirectory;->compLength:J

    move-wide/from16 v21, v0

    iget-wide v0, v2, Lcom/itextpdf/io/font/WoffConverter$TableDirectory;->origLengthVal:J

    cmp-long v0, v21, v0

    if-gtz v0, :cond_a

    .line 180
    iget-wide v0, v2, Lcom/itextpdf/io/font/WoffConverter$TableDirectory;->compLength:J

    move-wide/from16 v21, v0

    iget-wide v0, v2, Lcom/itextpdf/io/font/WoffConverter$TableDirectory;->origLengthVal:J

    cmp-long v0, v21, v0

    if-eqz v0, :cond_9

    .line 181
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, v5}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 182
    .local v0, "stream":Ljava/io/ByteArrayInputStream;
    new-instance v1, Ljava/util/zip/InflaterInputStream;

    invoke-direct {v1, v0}, Ljava/util/zip/InflaterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 183
    .local v1, "zip":Ljava/util/zip/InflaterInputStream;
    new-array v6, v3, [B

    .line 184
    .local v6, "uncompressedData":[B
    const/16 v21, 0x0

    move-object/from16 v22, v0

    move/from16 v0, v21

    .line 185
    .local v0, "bytesRead":I
    .local v22, "stream":Ljava/io/ByteArrayInputStream;
    :goto_6
    sub-int v21, v3, v0

    if-lez v21, :cond_7

    .line 186
    move-object/from16 v21, v4

    sub-int v4, v3, v0

    invoke-virtual {v1, v6, v0, v4}, Ljava/util/zip/InflaterInputStream;->read([BII)I

    move-result v4

    .line 187
    .local v4, "readRes":I
    if-ltz v4, :cond_6

    .line 190
    add-int/2addr v0, v4

    .line 191
    .end local v4    # "readRes":I
    move-object/from16 v4, v21

    goto :goto_6

    .line 188
    .restart local v4    # "readRes":I
    :cond_6
    new-instance v20, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v20 .. v20}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v20

    .line 192
    .end local v4    # "readRes":I
    :cond_7
    move-object/from16 v21, v4

    invoke-virtual {v1}, Ljava/util/zip/InflaterInputStream;->read()I

    move-result v4

    if-gez v4, :cond_8

    .line 195
    .end local v0    # "bytesRead":I
    .end local v1    # "zip":Ljava/util/zip/InflaterInputStream;
    .end local v22    # "stream":Ljava/io/ByteArrayInputStream;
    goto :goto_7

    .line 193
    .restart local v0    # "bytesRead":I
    .restart local v1    # "zip":Ljava/util/zip/InflaterInputStream;
    .restart local v22    # "stream":Ljava/io/ByteArrayInputStream;
    :cond_8
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-direct {v4}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v4

    .line 196
    .end local v0    # "bytesRead":I
    .end local v1    # "zip":Ljava/util/zip/InflaterInputStream;
    .end local v6    # "uncompressedData":[B
    .end local v22    # "stream":Ljava/io/ByteArrayInputStream;
    :cond_9
    move-object/from16 v21, v4

    move-object v6, v5

    .line 199
    .restart local v6    # "uncompressedData":[B
    :goto_7
    iget v0, v2, Lcom/itextpdf/io/font/WoffConverter$TableDirectory;->outOffset:I

    const/4 v4, 0x0

    invoke-static {v6, v4, v10, v0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 200
    .end local v2    # "td":Lcom/itextpdf/io/font/WoffConverter$TableDirectory;
    .end local v3    # "expectedUncompressedLen":I
    .end local v5    # "compressedData":[B
    .end local v6    # "uncompressedData":[B
    move-object/from16 v0, p0

    move v3, v7

    move/from16 v4, v17

    move-object/from16 v1, v21

    goto :goto_5

    .line 178
    .restart local v2    # "td":Lcom/itextpdf/io/font/WoffConverter$TableDirectory;
    .restart local v3    # "expectedUncompressedLen":I
    .restart local v5    # "compressedData":[B
    :cond_a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 202
    .end local v2    # "td":Lcom/itextpdf/io/font/WoffConverter$TableDirectory;
    .end local v5    # "compressedData":[B
    .end local v7    # "destPos":I
    .end local v17    # "outTableOffset":I
    .local v3, "destPos":I
    .local v4, "outTableOffset":I
    :cond_b
    return-object v10

    .line 169
    :cond_c
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 106
    .end local v3    # "destPos":I
    .end local v4    # "outTableOffset":I
    .end local v14    # "tdList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/WoffConverter$TableDirectory;>;"
    .end local v15    # "rangeShift":I
    .end local v19    # "srcPos":I
    .local v1, "srcPos":I
    .local v2, "destPos":I
    :cond_d
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 64
    .end local v8    # "totalSfntSize":J
    .end local v10    # "otfBytes":[B
    .end local v11    # "entrySelector":I
    .end local v12    # "searchRange":I
    .end local v13    # "numTablesVal":I
    .end local v16    # "numTables":[B
    .end local v18    # "flavor":[B
    .local v4, "flavor":[B
    .local v7, "numTables":[B
    :cond_e
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 54
    .end local v7    # "numTables":[B
    :cond_f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 44
    .end local v4    # "flavor":[B
    :cond_10
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method public static isWoffFont([B)Z
    .locals 5
    .param p0, "woffBytes"    # [B

    .line 35
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/itextpdf/io/font/WoffConverter;->bytesToUInt([BI)J

    move-result-wide v1

    const-wide/32 v3, 0x774f4646

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method
