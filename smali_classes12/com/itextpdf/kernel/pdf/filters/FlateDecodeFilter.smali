.class public Lcom/itextpdf/kernel/pdf/filters/FlateDecodeFilter;
.super Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareFilter;
.source "FlateDecodeFilter.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 43
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareFilter;-><init>()V

    return-void
.end method

.method public static decodePredictor([BLcom/itextpdf/kernel/pdf/PdfObject;)[B
    .locals 25
    .param p0, "in"    # [B
    .param p1, "decodeParams"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 62
    move-object/from16 v1, p0

    if-eqz p1, :cond_11

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v0

    const/4 v2, 0x3

    if-eq v0, v2, :cond_0

    goto/16 :goto_f

    .line 65
    :cond_0
    move-object/from16 v2, p1

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 66
    .local v2, "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Predictor:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    .line 67
    .local v3, "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v3, :cond_10

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v0

    const/16 v4, 0x8

    if-eq v0, v4, :cond_1

    move-object/from16 v22, v2

    goto/16 :goto_e

    .line 70
    :cond_1
    move-object v0, v3

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v5

    .line 71
    .local v5, "predictor":I
    const/16 v0, 0xa

    const/4 v6, 0x2

    if-ge v5, v0, :cond_2

    if-eq v5, v6, :cond_2

    .line 72
    return-object v1

    .line 74
    :cond_2
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Columns:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v7, 0x1

    invoke-static {v2, v0, v7}, Lcom/itextpdf/kernel/pdf/filters/FlateDecodeFilter;->getNumberOrDefault(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfName;I)I

    move-result v8

    .line 75
    .local v8, "width":I
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Colors:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v2, v0, v7}, Lcom/itextpdf/kernel/pdf/filters/FlateDecodeFilter;->getNumberOrDefault(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfName;I)I

    move-result v7

    .line 76
    .local v7, "colors":I
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->BitsPerComponent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v2, v0, v4}, Lcom/itextpdf/kernel/pdf/filters/FlateDecodeFilter;->getNumberOrDefault(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfName;I)I

    move-result v9

    .line 77
    .local v9, "bpc":I
    new-instance v0, Ljava/io/DataInputStream;

    new-instance v10, Ljava/io/ByteArrayInputStream;

    invoke-direct {v10, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v0, v10}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    move-object v10, v0

    .line 78
    .local v10, "dataStream":Ljava/io/DataInputStream;
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    array-length v11, v1

    invoke-direct {v0, v11}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    move-object v11, v0

    .line 79
    .local v11, "fout":Ljava/io/ByteArrayOutputStream;
    mul-int v0, v7, v9

    div-int/lit8 v12, v0, 0x8

    .line 80
    .local v12, "bytesPerPixel":I
    mul-int v0, v7, v8

    mul-int/2addr v0, v9

    add-int/lit8 v0, v0, 0x7

    div-int/lit8 v13, v0, 0x8

    .line 81
    .local v13, "bytesPerRow":I
    new-array v0, v13, [B

    .line 82
    .local v0, "curr":[B
    new-array v14, v13, [B

    .line 83
    .local v14, "prior":[B
    if-ne v5, v6, :cond_6

    .line 84
    if-ne v9, v4, :cond_5

    .line 85
    array-length v4, v1

    div-int/2addr v4, v13

    .line 86
    .local v4, "numRows":I
    const/4 v6, 0x0

    .local v6, "row":I
    :goto_0
    if-ge v6, v4, :cond_4

    .line 87
    mul-int v15, v6, v13

    .line 88
    .local v15, "rowStart":I
    move/from16 v16, v12

    move-object/from16 v17, v0

    move/from16 v0, v16

    .local v0, "col":I
    .local v17, "curr":[B
    :goto_1
    if-ge v0, v13, :cond_3

    .line 89
    add-int v16, v15, v0

    add-int v18, v15, v0

    aget-byte v18, v1, v18

    add-int v19, v15, v0

    sub-int v19, v19, v12

    aget-byte v19, v1, v19

    move/from16 v20, v0

    .end local v0    # "col":I
    .local v20, "col":I
    add-int v0, v18, v19

    int-to-byte v0, v0

    aput-byte v0, v1, v16

    .line 88
    add-int/lit8 v0, v20, 0x1

    .end local v20    # "col":I
    .restart local v0    # "col":I
    goto :goto_1

    :cond_3
    move/from16 v20, v0

    .line 86
    .end local v0    # "col":I
    .end local v15    # "rowStart":I
    add-int/lit8 v6, v6, 0x1

    move-object/from16 v0, v17

    goto :goto_0

    .end local v17    # "curr":[B
    .local v0, "curr":[B
    :cond_4
    move-object/from16 v17, v0

    .end local v0    # "curr":[B
    .restart local v17    # "curr":[B
    goto :goto_2

    .line 84
    .end local v4    # "numRows":I
    .end local v6    # "row":I
    .end local v17    # "curr":[B
    .restart local v0    # "curr":[B
    :cond_5
    move-object/from16 v17, v0

    .line 93
    .end local v0    # "curr":[B
    .restart local v17    # "curr":[B
    :goto_2
    return-object v1

    .line 83
    .end local v17    # "curr":[B
    .restart local v0    # "curr":[B
    :cond_6
    move-object/from16 v17, v0

    .end local v0    # "curr":[B
    .restart local v17    # "curr":[B
    move-object/from16 v4, v17

    .line 100
    .end local v17    # "curr":[B
    .local v4, "curr":[B
    :goto_3
    :try_start_0
    invoke-virtual {v10}, Ljava/io/DataInputStream;->read()I

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    move v15, v0

    .line 101
    .local v15, "filter":I
    if-gez v15, :cond_7

    .line 102
    :try_start_1
    invoke-virtual {v11}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    return-object v0

    .line 105
    .end local v15    # "filter":I
    :catch_0
    move-exception v0

    move-object/from16 v22, v2

    goto/16 :goto_d

    .line 104
    .restart local v15    # "filter":I
    :cond_7
    const/4 v0, 0x0

    :try_start_2
    invoke-virtual {v10, v4, v0, v13}, Ljava/io/DataInputStream;->readFully([BII)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 107
    nop

    .line 109
    packed-switch v15, :pswitch_data_0

    .line 159
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "PNG filter unknown."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 131
    :pswitch_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    if-ge v0, v12, :cond_8

    .line 132
    aget-byte v16, v4, v0

    aget-byte v17, v14, v0

    move/from16 v18, v6

    add-int v6, v16, v17

    int-to-byte v6, v6

    aput-byte v6, v4, v0

    .line 131
    add-int/lit8 v0, v0, 0x1

    move/from16 v6, v18

    goto :goto_4

    :cond_8
    move/from16 v18, v6

    .line 135
    .end local v0    # "i":I
    move v0, v12

    .restart local v0    # "i":I
    :goto_5
    if-ge v0, v13, :cond_b

    .line 136
    sub-int v6, v0, v12

    aget-byte v6, v4, v6

    and-int/lit16 v6, v6, 0xff

    .line 137
    .local v6, "a":I
    move/from16 v16, v0

    .end local v0    # "i":I
    .local v16, "i":I
    aget-byte v0, v14, v16

    and-int/lit16 v0, v0, 0xff

    .line 138
    .local v0, "b":I
    sub-int v17, v16, v12

    move/from16 v19, v0

    .end local v0    # "b":I
    .local v19, "b":I
    aget-byte v0, v14, v17

    and-int/lit16 v0, v0, 0xff

    .line 140
    .local v0, "c":I
    add-int v17, v6, v19

    sub-int v17, v17, v0

    .line 141
    .local v17, "p":I
    sub-int v20, v17, v6

    move/from16 v21, v0

    .end local v0    # "c":I
    .local v21, "c":I
    invoke-static/range {v20 .. v20}, Ljava/lang/Math;->abs(I)I

    move-result v0

    .line 142
    .local v0, "pa":I
    sub-int v20, v17, v19

    invoke-static/range {v20 .. v20}, Ljava/lang/Math;->abs(I)I

    move-result v1

    .line 143
    .local v1, "pb":I
    sub-int v20, v17, v21

    move-object/from16 v22, v2

    .end local v2    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .local v22, "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-static/range {v20 .. v20}, Ljava/lang/Math;->abs(I)I

    move-result v2

    .line 147
    .local v2, "pc":I
    if-gt v0, v1, :cond_9

    if-gt v0, v2, :cond_9

    .line 148
    move/from16 v20, v6

    move/from16 v23, v0

    move/from16 v0, v20

    .local v20, "ret":I
    goto :goto_6

    .line 149
    .end local v20    # "ret":I
    :cond_9
    if-gt v1, v2, :cond_a

    .line 150
    move/from16 v20, v19

    move/from16 v23, v0

    move/from16 v0, v20

    .restart local v20    # "ret":I
    goto :goto_6

    .line 152
    .end local v20    # "ret":I
    :cond_a
    move/from16 v20, v21

    move/from16 v23, v0

    move/from16 v0, v20

    .line 154
    .local v0, "ret":I
    .local v23, "pa":I
    :goto_6
    aget-byte v20, v4, v16

    move/from16 v24, v1

    .end local v1    # "pb":I
    .local v24, "pb":I
    int-to-byte v1, v0

    add-int v1, v20, v1

    int-to-byte v1, v1

    aput-byte v1, v4, v16

    .line 135
    .end local v0    # "ret":I
    .end local v2    # "pc":I
    .end local v6    # "a":I
    .end local v17    # "p":I
    .end local v19    # "b":I
    .end local v21    # "c":I
    .end local v23    # "pa":I
    .end local v24    # "pb":I
    add-int/lit8 v0, v16, 0x1

    move-object/from16 v1, p0

    move-object/from16 v2, v22

    .end local v16    # "i":I
    .local v0, "i":I
    goto :goto_5

    .end local v22    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .local v2, "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_b
    move/from16 v16, v0

    move-object/from16 v22, v2

    .line 156
    .end local v0    # "i":I
    .end local v2    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .restart local v22    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    goto :goto_b

    .line 123
    .end local v22    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .restart local v2    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :pswitch_1
    move-object/from16 v22, v2

    move/from16 v18, v6

    .end local v2    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .restart local v22    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_7
    if-ge v0, v12, :cond_c

    .line 124
    aget-byte v1, v4, v0

    aget-byte v2, v14, v0

    div-int/lit8 v2, v2, 0x2

    int-to-byte v2, v2

    add-int/2addr v1, v2

    int-to-byte v1, v1

    aput-byte v1, v4, v0

    .line 123
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 126
    .end local v0    # "i":I
    :cond_c
    move v0, v12

    .restart local v0    # "i":I
    :goto_8
    if-ge v0, v13, :cond_d

    .line 127
    aget-byte v1, v4, v0

    sub-int v2, v0, v12

    aget-byte v2, v4, v2

    and-int/lit16 v2, v2, 0xff

    aget-byte v6, v14, v0

    and-int/lit16 v6, v6, 0xff

    add-int/2addr v2, v6

    div-int/lit8 v2, v2, 0x2

    int-to-byte v2, v2

    add-int/2addr v1, v2

    int-to-byte v1, v1

    aput-byte v1, v4, v0

    .line 126
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 129
    .end local v0    # "i":I
    :cond_d
    goto :goto_b

    .line 118
    .end local v22    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .restart local v2    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :pswitch_2
    move-object/from16 v22, v2

    move/from16 v18, v6

    .end local v2    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .restart local v22    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_9
    if-ge v0, v13, :cond_e

    .line 119
    aget-byte v1, v4, v0

    aget-byte v2, v14, v0

    add-int/2addr v1, v2

    int-to-byte v1, v1

    aput-byte v1, v4, v0

    .line 118
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 121
    .end local v0    # "i":I
    :cond_e
    goto :goto_b

    .line 113
    .end local v22    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .restart local v2    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :pswitch_3
    move-object/from16 v22, v2

    move/from16 v18, v6

    .end local v2    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .restart local v22    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    move v0, v12

    .restart local v0    # "i":I
    :goto_a
    if-ge v0, v13, :cond_f

    .line 114
    aget-byte v1, v4, v0

    sub-int v2, v0, v12

    aget-byte v2, v4, v2

    add-int/2addr v1, v2

    int-to-byte v1, v1

    aput-byte v1, v4, v0

    .line 113
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 116
    .end local v0    # "i":I
    :cond_f
    goto :goto_b

    .line 111
    .end local v22    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .restart local v2    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :pswitch_4
    move-object/from16 v22, v2

    move/from16 v18, v6

    .line 162
    .end local v2    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .restart local v22    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :goto_b
    :try_start_3
    invoke-virtual {v11, v4}, Ljava/io/ByteArrayOutputStream;->write([B)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 166
    goto :goto_c

    .line 163
    :catch_1
    move-exception v0

    .line 169
    :goto_c
    move-object v0, v14

    .line 170
    .local v0, "tmp":[B
    move-object v14, v4

    .line 171
    move-object v4, v0

    .line 172
    .end local v0    # "tmp":[B
    .end local v15    # "filter":I
    move-object/from16 v1, p0

    move/from16 v6, v18

    move-object/from16 v2, v22

    goto/16 :goto_3

    .line 105
    .end local v22    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .restart local v2    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :catch_2
    move-exception v0

    move-object/from16 v22, v2

    .line 106
    .end local v2    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .local v0, "e":Ljava/lang/Exception;
    .restart local v22    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :goto_d
    invoke-virtual {v11}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    return-object v1

    .line 67
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v4    # "curr":[B
    .end local v5    # "predictor":I
    .end local v7    # "colors":I
    .end local v8    # "width":I
    .end local v9    # "bpc":I
    .end local v10    # "dataStream":Ljava/io/DataInputStream;
    .end local v11    # "fout":Ljava/io/ByteArrayOutputStream;
    .end local v12    # "bytesPerPixel":I
    .end local v13    # "bytesPerRow":I
    .end local v14    # "prior":[B
    .end local v22    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .restart local v2    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_10
    move-object/from16 v22, v2

    .line 68
    .end local v2    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .restart local v22    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :goto_e
    return-object p0

    .line 63
    .end local v3    # "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v22    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_11
    :goto_f
    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static flateDecode([BZ)[B
    .locals 1
    .param p0, "in"    # [B
    .param p1, "strict"    # Z

    .line 53
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    invoke-static {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/filters/FlateDecodeFilter;->flateDecodeInternal([BZLjava/io/ByteArrayOutputStream;)[B

    move-result-object v0

    return-object v0
.end method

.method protected static flateDecodeInternal([BZLjava/io/ByteArrayOutputStream;)[B
    .locals 5
    .param p0, "in"    # [B
    .param p1, "strict"    # Z
    .param p2, "out"    # Ljava/io/ByteArrayOutputStream;

    .line 199
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 200
    .local v0, "stream":Ljava/io/ByteArrayInputStream;
    new-instance v1, Ljava/util/zip/InflaterInputStream;

    invoke-direct {v1, v0}, Ljava/util/zip/InflaterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 201
    .local v1, "zip":Ljava/util/zip/InflaterInputStream;
    if-eqz p1, :cond_0

    const/16 v2, 0xffc

    goto :goto_0

    :cond_0
    const/4 v2, 0x1

    :goto_0
    new-array v2, v2, [B

    .line 204
    .local v2, "b":[B
    :goto_1
    :try_start_0
    invoke-virtual {v1, v2}, Ljava/util/zip/InflaterInputStream;->read([B)I

    move-result v3

    move v4, v3

    .local v4, "n":I
    if-ltz v3, :cond_1

    .line 205
    const/4 v3, 0x0

    invoke-virtual {p2, v2, v3, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_1

    .line 207
    :cond_1
    invoke-virtual {v1}, Ljava/util/zip/InflaterInputStream;->close()V

    .line 208
    invoke-virtual {p2}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 209
    invoke-virtual {p2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3
    :try_end_0
    .catch Lcom/itextpdf/kernel/exceptions/MemoryLimitsAwareException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    .line 212
    .end local v4    # "n":I
    :catch_0
    move-exception v3

    .line 213
    .local v3, "e":Ljava/lang/Exception;
    if-eqz p1, :cond_2

    .line 214
    const/4 v4, 0x0

    return-object v4

    .line 216
    :cond_2
    invoke-virtual {p2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    return-object v4

    .line 210
    .end local v3    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v3

    .line 211
    .local v3, "e":Lcom/itextpdf/kernel/exceptions/MemoryLimitsAwareException;
    throw v3
.end method

.method private static getNumberOrDefault(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfName;I)I
    .locals 4
    .param p0, "dict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "defaultInt"    # I

    .line 221
    move v0, p2

    .line 222
    .local v0, "result":I
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 224
    .local v1, "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v2

    const/16 v3, 0x8

    if-ne v2, v3, :cond_0

    .line 225
    move-object v2, v1

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v0

    .line 227
    :cond_0
    return v0
.end method


# virtual methods
.method public decode([BLcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDictionary;)[B
    .locals 3
    .param p1, "b"    # [B
    .param p2, "filterName"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p3, "decodeParams"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p4, "streamDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 180
    invoke-virtual {p0, p4}, Lcom/itextpdf/kernel/pdf/filters/FlateDecodeFilter;->enableMemoryLimitsAwareHandler(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Ljava/io/ByteArrayOutputStream;

    move-result-object v0

    .line 181
    .local v0, "outputStream":Ljava/io/ByteArrayOutputStream;
    const/4 v1, 0x1

    invoke-static {p1, v1, v0}, Lcom/itextpdf/kernel/pdf/filters/FlateDecodeFilter;->flateDecodeInternal([BZLjava/io/ByteArrayOutputStream;)[B

    move-result-object v1

    .line 182
    .local v1, "res":[B
    if-nez v1, :cond_0

    .line 183
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 184
    const/4 v2, 0x0

    invoke-static {p1, v2, v0}, Lcom/itextpdf/kernel/pdf/filters/FlateDecodeFilter;->flateDecodeInternal([BZLjava/io/ByteArrayOutputStream;)[B

    move-result-object v1

    .line 186
    :cond_0
    invoke-static {v1, p3}, Lcom/itextpdf/kernel/pdf/filters/FlateDecodeFilter;->decodePredictor([BLcom/itextpdf/kernel/pdf/PdfObject;)[B

    move-result-object p1

    .line 187
    return-object p1
.end method
