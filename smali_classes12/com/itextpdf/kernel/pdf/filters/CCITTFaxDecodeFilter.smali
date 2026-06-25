.class public Lcom/itextpdf/kernel/pdf/filters/CCITTFaxDecodeFilter;
.super Ljava/lang/Object;
.source "CCITTFaxDecodeFilter.java"

# interfaces
.implements Lcom/itextpdf/kernel/pdf/filters/IFilterHandler;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public decode([BLcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDictionary;)[B
    .locals 18
    .param p1, "b"    # [B
    .param p2, "filterName"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p3, "decodeParams"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p4, "streamDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 43
    move-object/from16 v7, p3

    move-object/from16 v8, p4

    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Width:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v8, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v9

    .line 44
    .local v9, "wn":Lcom/itextpdf/kernel/pdf/PdfNumber;
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Height:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v8, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v10

    .line 45
    .local v10, "hn":Lcom/itextpdf/kernel/pdf/PdfNumber;
    if-eqz v9, :cond_d

    if-eqz v10, :cond_d

    .line 48
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v11

    .line 49
    .local v11, "width":I
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v4

    .line 51
    .local v4, "height":I
    instance-of v0, v7, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    if-eqz v0, :cond_0

    move-object v0, v7

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    move-object v12, v0

    .line 52
    .local v12, "param":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    const/4 v0, 0x0

    .line 53
    .local v0, "k":I
    const/4 v1, 0x0

    .line 54
    .local v1, "blackIs1":Z
    const/4 v2, 0x0

    .line 55
    .local v2, "byteAlign":Z
    if-eqz v12, :cond_4

    .line 56
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->K:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v12, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v3

    .line 57
    .local v3, "kn":Lcom/itextpdf/kernel/pdf/PdfNumber;
    if-eqz v3, :cond_1

    .line 58
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v0

    .line 60
    :cond_1
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->BlackIs1:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v12, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsBoolean(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v5

    .line 61
    .local v5, "bo":Lcom/itextpdf/kernel/pdf/PdfBoolean;
    if-eqz v5, :cond_2

    .line 62
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->getValue()Z

    move-result v1

    .line 64
    :cond_2
    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->EncodedByteAlign:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v12, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsBoolean(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v5

    .line 65
    if-eqz v5, :cond_3

    .line 66
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->getValue()Z

    move-result v2

    move v13, v0

    move v14, v1

    move v15, v2

    goto :goto_1

    .line 65
    :cond_3
    move v13, v0

    move v14, v1

    move v15, v2

    goto :goto_1

    .line 55
    .end local v3    # "kn":Lcom/itextpdf/kernel/pdf/PdfNumber;
    .end local v5    # "bo":Lcom/itextpdf/kernel/pdf/PdfBoolean;
    :cond_4
    move v13, v0

    move v14, v1

    move v15, v2

    .line 69
    .end local v0    # "k":I
    .end local v1    # "blackIs1":Z
    .end local v2    # "byteAlign":Z
    .local v13, "k":I
    .local v14, "blackIs1":Z
    .local v15, "byteAlign":Z
    :goto_1
    add-int/lit8 v0, v11, 0x7

    div-int/lit8 v0, v0, 0x8

    mul-int/2addr v0, v4

    new-array v1, v0, [B

    .line 70
    .local v1, "outBuf":[B
    new-instance v0, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;

    invoke-direct {v0}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;-><init>()V

    .line 71
    .local v0, "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecompressor;
    const/4 v2, 0x1

    if-eqz v13, :cond_7

    if-lez v13, :cond_5

    move-object v7, v0

    move-object/from16 v0, p1

    goto :goto_3

    .line 86
    :cond_5
    const-wide/16 v5, 0x0

    .line 87
    .local v5, "tiffT6Options":J
    if-eqz v15, :cond_6

    const-wide/16 v16, 0x4

    goto :goto_2

    :cond_6
    const-wide/16 v16, 0x0

    :goto_2
    or-long v5, v5, v16

    .line 88
    new-instance v3, Lcom/itextpdf/io/codec/TIFFFaxDecoder;

    invoke-direct {v3, v2, v11, v4}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;-><init>(III)V

    .line 89
    .local v3, "deca":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    move-object v2, v0

    move-object v0, v3

    .end local v3    # "deca":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    .local v0, "deca":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    .local v2, "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecompressor;
    const/4 v3, 0x0

    move-object v7, v2

    move-object/from16 v2, p1

    .end local v2    # "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecompressor;
    .local v7, "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecompressor;
    invoke-virtual/range {v0 .. v6}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->decodeT6([B[BIIJ)V

    move-object v3, v0

    move-object v0, v2

    .end local v0    # "deca":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    .restart local v3    # "deca":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    goto :goto_7

    .line 71
    .end local v3    # "deca":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    .end local v5    # "tiffT6Options":J
    .end local v7    # "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecompressor;
    .local v0, "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecompressor;
    :cond_7
    move-object v7, v0

    move-object/from16 v0, p1

    .line 72
    .end local v0    # "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecompressor;
    .restart local v7    # "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecompressor;
    :goto_3
    const/4 v3, 0x0

    if-lez v13, :cond_8

    move v5, v2

    goto :goto_4

    :cond_8
    move v5, v3

    .line 73
    .local v5, "tiffT4Options":I
    :goto_4
    if-eqz v15, :cond_9

    const/4 v6, 0x4

    goto :goto_5

    :cond_9
    move v6, v3

    :goto_5
    or-int/2addr v5, v6

    .line 74
    const/4 v6, 0x3

    invoke-virtual {v7, v2, v6, v5, v3}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->SetOptions(IIII)V

    .line 75
    invoke-virtual {v7, v1, v0, v11, v4}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->decodeRaw([B[BII)V

    .line 76
    iget v6, v7, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->fails:I

    if-lez v6, :cond_a

    .line 77
    add-int/lit8 v6, v11, 0x7

    div-int/lit8 v6, v6, 0x8

    mul-int/2addr v6, v4

    new-array v6, v6, [B

    .line 78
    .local v6, "outBuf2":[B
    iget v2, v7, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->fails:I

    .line 79
    .local v2, "oldFails":I
    move-object/from16 v17, v1

    .end local v1    # "outBuf":[B
    .local v17, "outBuf":[B
    const/4 v1, 0x2

    const/4 v8, 0x1

    invoke-virtual {v7, v8, v1, v5, v3}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->SetOptions(IIII)V

    .line 80
    invoke-virtual {v7, v6, v0, v11, v4}, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->decodeRaw([B[BII)V

    .line 81
    iget v1, v7, Lcom/itextpdf/io/codec/TIFFFaxDecompressor;->fails:I

    if-ge v1, v2, :cond_b

    .line 82
    move-object v1, v6

    .end local v17    # "outBuf":[B
    .restart local v1    # "outBuf":[B
    goto :goto_6

    .line 76
    .end local v2    # "oldFails":I
    .end local v6    # "outBuf2":[B
    :cond_a
    move-object/from16 v17, v1

    .line 85
    .end local v1    # "outBuf":[B
    .end local v5    # "tiffT4Options":I
    .restart local v17    # "outBuf":[B
    :cond_b
    move-object/from16 v1, v17

    .end local v17    # "outBuf":[B
    .restart local v1    # "outBuf":[B
    :goto_6
    nop

    .line 91
    :goto_7
    if-nez v14, :cond_c

    .line 92
    array-length v2, v1

    .line 93
    .local v2, "len":I
    const/4 v3, 0x0

    .local v3, "t":I
    :goto_8
    if-ge v3, v2, :cond_c

    .line 94
    aget-byte v5, v1, v3

    xor-int/lit16 v5, v5, 0xff

    int-to-byte v5, v5

    aput-byte v5, v1, v3

    .line 93
    add-int/lit8 v3, v3, 0x1

    goto :goto_8

    .line 97
    .end local v2    # "len":I
    .end local v3    # "t":I
    :cond_c
    move-object v0, v1

    .line 98
    .end local p1    # "b":[B
    .local v0, "b":[B
    return-object v0

    .line 45
    .end local v0    # "b":[B
    .end local v1    # "outBuf":[B
    .end local v4    # "height":I
    .end local v7    # "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecompressor;
    .end local v11    # "width":I
    .end local v12    # "param":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v13    # "k":I
    .end local v14    # "blackIs1":Z
    .end local v15    # "byteAlign":Z
    .restart local p1    # "b":[B
    :cond_d
    move-object/from16 v0, p1

    .line 46
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Filter CCITTFaxDecode is only supported for images"

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
