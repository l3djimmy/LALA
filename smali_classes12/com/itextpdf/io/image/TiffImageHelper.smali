.class Lcom/itextpdf/io/image/TiffImageHelper;
.super Ljava/lang/Object;
.source "TiffImageHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static applyPredictor([BIIII)V
    .locals 5
    .param p0, "uncompData"    # [B
    .param p1, "predictor"    # I
    .param p2, "w"    # I
    .param p3, "h"    # I
    .param p4, "samplesPerPixel"    # I

    .line 666
    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    .line 667
    return-void

    .line 669
    :cond_0
    const/4 v0, 0x0

    .local v0, "j":I
    :goto_0
    if-ge v0, p3, :cond_2

    .line 670
    mul-int v1, v0, p2

    add-int/lit8 v1, v1, 0x1

    mul-int/2addr v1, p4

    .line 671
    .local v1, "count":I
    move v2, p4

    .local v2, "i":I
    :goto_1
    mul-int v3, p2, p4

    if-ge v2, v3, :cond_1

    .line 672
    aget-byte v3, p0, v1

    sub-int v4, v1, p4

    aget-byte v4, p0, v4

    add-int/2addr v3, v4

    int-to-byte v3, v3

    aput-byte v3, p0, v1

    .line 673
    add-int/lit8 v1, v1, 0x1

    .line 671
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 669
    .end local v2    # "i":I
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 676
    .end local v0    # "j":I
    .end local v1    # "count":I
    :cond_2
    return-void
.end method

.method private static decodePackbits([B[B)V
    .locals 6
    .param p0, "data"    # [B
    .param p1, "dst"    # [B

    .line 632
    const/4 v0, 0x0

    .local v0, "srcCount":I
    const/4 v1, 0x0

    .line 635
    .local v1, "dstCount":I
    :goto_0
    :try_start_0
    array-length v2, p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4

    if-ge v1, v2, :cond_4

    .line 636
    add-int/lit8 v2, v0, 0x1

    .end local v0    # "srcCount":I
    .local v2, "srcCount":I
    :try_start_1
    aget-byte v0, p0, v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    .line 639
    .local v0, "b":B
    if-ltz v0, :cond_1

    const/16 v3, 0x7f

    if-gt v0, v3, :cond_1

    .line 641
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    add-int/lit8 v4, v0, 0x1

    if-ge v3, v4, :cond_0

    .line 642
    add-int/lit8 v4, v1, 0x1

    .end local v1    # "dstCount":I
    .local v4, "dstCount":I
    add-int/lit8 v5, v2, 0x1

    .end local v2    # "srcCount":I
    .local v5, "srcCount":I
    :try_start_2
    aget-byte v2, p0, v2

    aput-byte v2, p1, v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 641
    add-int/lit8 v3, v3, 0x1

    move v1, v4

    move v2, v5

    goto :goto_1

    .line 660
    .end local v0    # "b":B
    .end local v3    # "i":I
    :catch_0
    move-exception v0

    move v1, v4

    move v0, v5

    goto :goto_3

    .line 641
    .end local v4    # "dstCount":I
    .end local v5    # "srcCount":I
    .restart local v0    # "b":B
    .restart local v1    # "dstCount":I
    .restart local v2    # "srcCount":I
    .restart local v3    # "i":I
    :cond_0
    move v0, v2

    .end local v3    # "i":I
    goto :goto_0

    .line 646
    :cond_1
    and-int/lit16 v3, v0, 0x80

    if-eqz v3, :cond_3

    const/16 v3, -0x80

    if-eq v0, v3, :cond_3

    .line 648
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "srcCount":I
    .local v3, "srcCount":I
    :try_start_3
    aget-byte v2, p0, v2
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 652
    .local v2, "repeat":B
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_2
    not-int v5, v0

    and-int/lit16 v5, v5, 0xff

    add-int/lit8 v5, v5, 0x2

    if-ge v4, v5, :cond_2

    .line 653
    add-int/lit8 v5, v1, 0x1

    .end local v1    # "dstCount":I
    .local v5, "dstCount":I
    :try_start_4
    aput-byte v2, p1, v1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 652
    add-int/lit8 v4, v4, 0x1

    move v1, v5

    goto :goto_2

    .line 660
    .end local v0    # "b":B
    .end local v2    # "repeat":B
    .end local v4    # "i":I
    :catch_1
    move-exception v0

    move v0, v3

    move v1, v5

    goto :goto_3

    .line 652
    .end local v5    # "dstCount":I
    .restart local v0    # "b":B
    .restart local v1    # "dstCount":I
    .restart local v2    # "repeat":B
    .restart local v4    # "i":I
    :cond_2
    move v0, v3

    .end local v4    # "i":I
    goto :goto_0

    .line 660
    .end local v0    # "b":B
    .end local v2    # "repeat":B
    :catch_2
    move-exception v0

    move v0, v3

    goto :goto_3

    .line 657
    .end local v3    # "srcCount":I
    .restart local v0    # "b":B
    .local v2, "srcCount":I
    :cond_3
    add-int/lit8 v2, v2, 0x1

    move v0, v2

    goto :goto_0

    .line 660
    .end local v0    # "b":B
    :catch_3
    move-exception v0

    move v0, v2

    goto :goto_3

    .line 662
    .end local v2    # "srcCount":I
    .local v0, "srcCount":I
    :cond_4
    goto :goto_3

    .line 660
    :catch_4
    move-exception v2

    .line 663
    :goto_3
    return-void
.end method

.method private static getArrayLongShort(Lcom/itextpdf/io/codec/TIFFDirectory;I)[J
    .locals 6
    .param p0, "dir"    # Lcom/itextpdf/io/codec/TIFFDirectory;
    .param p1, "tag"    # I

    .line 613
    invoke-virtual {p0, p1}, Lcom/itextpdf/io/codec/TIFFDirectory;->getField(I)Lcom/itextpdf/io/codec/TIFFField;

    move-result-object v0

    .line 614
    .local v0, "field":Lcom/itextpdf/io/codec/TIFFField;
    if-nez v0, :cond_0

    .line 615
    const/4 v1, 0x0

    return-object v1

    .line 617
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/io/codec/TIFFField;->getType()I

    move-result v1

    const/4 v2, 0x4

    if-ne v1, v2, :cond_1

    .line 618
    invoke-virtual {v0}, Lcom/itextpdf/io/codec/TIFFField;->getAsLongs()[J

    move-result-object v1

    .local v1, "offset":[J
    goto :goto_1

    .line 622
    .end local v1    # "offset":[J
    :cond_1
    invoke-virtual {v0}, Lcom/itextpdf/io/codec/TIFFField;->getAsChars()[C

    move-result-object v1

    .line 623
    .local v1, "temp":[C
    array-length v2, v1

    new-array v2, v2, [J

    .line 624
    .local v2, "offset":[J
    const/4 v3, 0x0

    .local v3, "k":I
    :goto_0
    array-length v4, v1

    if-ge v3, v4, :cond_2

    .line 625
    aget-char v4, v1, v3

    int-to-long v4, v4

    aput-wide v4, v2, v3

    .line 624
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    move-object v1, v2

    .line 627
    .end local v2    # "offset":[J
    .end local v3    # "k":I
    .local v1, "offset":[J
    :goto_1
    return-object v1
.end method

.method private static getDpi(Lcom/itextpdf/io/codec/TIFFField;I)I
    .locals 9
    .param p0, "fd"    # Lcom/itextpdf/io/codec/TIFFField;
    .param p1, "resolutionUnit"    # I

    .line 576
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 577
    return v0

    .line 578
    :cond_0
    invoke-virtual {p0, v0}, Lcom/itextpdf/io/codec/TIFFField;->getAsRational(I)[J

    move-result-object v1

    .line 579
    .local v1, "res":[J
    aget-wide v2, v1, v0

    long-to-float v0, v2

    const/4 v2, 0x1

    aget-wide v2, v1, v2

    long-to-float v2, v2

    div-float/2addr v0, v2

    .line 580
    .local v0, "frac":F
    const/4 v2, 0x0

    .line 581
    .local v2, "dpi":I
    const-wide/high16 v3, 0x3fe0000000000000L    # 0.5

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 587
    :pswitch_0
    float-to-double v5, v0

    const-wide v7, 0x400451eb851eb852L    # 2.54

    mul-double/2addr v5, v7

    add-double/2addr v5, v3

    double-to-int v2, v5

    goto :goto_0

    .line 584
    :pswitch_1
    float-to-double v5, v0

    add-double/2addr v5, v3

    double-to-int v2, v5

    .line 585
    nop

    .line 590
    :goto_0
    return v2

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static processExtraSamples(Lcom/itextpdf/io/source/DeflaterOutputStream;Lcom/itextpdf/io/source/DeflaterOutputStream;[BIIII)V
    .locals 8
    .param p0, "zip"    # Lcom/itextpdf/io/source/DeflaterOutputStream;
    .param p1, "mzip"    # Lcom/itextpdf/io/source/DeflaterOutputStream;
    .param p2, "outBuf"    # [B
    .param p3, "samplePerPixel"    # I
    .param p4, "bitsPerSample"    # I
    .param p5, "width"    # I
    .param p6, "height"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 595
    const/16 v0, 0x8

    if-ne p4, v0, :cond_2

    .line 596
    mul-int v0, p5, p6

    new-array v0, v0, [B

    .line 597
    .local v0, "mask":[B
    const/4 v1, 0x0

    .line 598
    .local v1, "mptr":I
    const/4 v2, 0x0

    .line 599
    .local v2, "optr":I
    mul-int v3, p5, p6

    mul-int/2addr v3, p3

    .line 600
    .local v3, "total":I
    const/4 v4, 0x0

    .local v4, "k":I
    :goto_0
    if-ge v4, v3, :cond_1

    .line 601
    const/4 v5, 0x0

    .local v5, "s":I
    :goto_1
    add-int/lit8 v6, p3, -0x1

    if-ge v5, v6, :cond_0

    .line 602
    add-int/lit8 v6, v2, 0x1

    .end local v2    # "optr":I
    .local v6, "optr":I
    add-int v7, v4, v5

    aget-byte v7, p2, v7

    aput-byte v7, p2, v2

    .line 601
    add-int/lit8 v5, v5, 0x1

    move v2, v6

    goto :goto_1

    .line 604
    .end local v5    # "s":I
    .end local v6    # "optr":I
    .restart local v2    # "optr":I
    :cond_0
    add-int/lit8 v5, v1, 0x1

    .end local v1    # "mptr":I
    .local v5, "mptr":I
    add-int v6, v4, p3

    add-int/lit8 v6, v6, -0x1

    aget-byte v6, p2, v6

    aput-byte v6, v0, v1

    .line 600
    add-int/2addr v4, p3

    move v1, v5

    goto :goto_0

    .line 606
    .end local v4    # "k":I
    .end local v5    # "mptr":I
    .restart local v1    # "mptr":I
    :cond_1
    const/4 v4, 0x0

    invoke-virtual {p0, p2, v4, v2}, Lcom/itextpdf/io/source/DeflaterOutputStream;->write([BII)V

    .line 607
    invoke-virtual {p1, v0, v4, v1}, Lcom/itextpdf/io/source/DeflaterOutputStream;->write([BII)V

    .line 608
    .end local v0    # "mask":[B
    .end local v1    # "mptr":I
    .end local v2    # "optr":I
    .end local v3    # "total":I
    nop

    .line 610
    return-void

    .line 609
    :cond_2
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    const-string v1, "Extra samples are not supported."

    invoke-direct {v0, v1}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static processImage(Lcom/itextpdf/io/image/ImageData;)V
    .locals 5
    .param p0, "image"    # Lcom/itextpdf/io/image/ImageData;

    .line 62
    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->getOriginalType()Lcom/itextpdf/io/image/ImageType;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/io/image/ImageType;->TIFF:Lcom/itextpdf/io/image/ImageType;

    if-ne v0, v1, :cond_2

    .line 66
    :try_start_0
    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->getData()[B

    move-result-object v0

    if-nez v0, :cond_0

    .line 67
    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->loadData()V

    .line 69
    :cond_0
    new-instance v0, Lcom/itextpdf/io/source/RandomAccessSourceFactory;

    invoke-direct {v0}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;-><init>()V

    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->getData()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createSource([B)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v0

    .line 70
    .local v0, "ras":Lcom/itextpdf/io/source/IRandomAccessSource;
    new-instance v1, Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-direct {v1, v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    .line 71
    .local v1, "raf":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    new-instance v2, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;

    move-object v3, p0

    check-cast v3, Lcom/itextpdf/io/image/TiffImageData;

    invoke-direct {v2, v3}, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;-><init>(Lcom/itextpdf/io/image/TiffImageData;)V

    .line 72
    .local v2, "tiff":Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;
    invoke-static {v1, v2}, Lcom/itextpdf/io/image/TiffImageHelper;->processTiffImage(Lcom/itextpdf/io/source/RandomAccessFileOrArray;Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;)V

    .line 73
    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->close()V

    .line 75
    iget-boolean v3, v2, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->jpegProcessing:Z

    if-nez v3, :cond_1

    .line 76
    iget-object v3, v2, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->image:Lcom/itextpdf/io/image/TiffImageData;

    iget-object v4, v2, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->additional:Ljava/util/Map;

    invoke-static {v3, v4}, Lcom/itextpdf/io/image/RawImageHelper;->updateImageAttributes(Lcom/itextpdf/io/image/RawImageData;Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    .end local v0    # "ras":Lcom/itextpdf/io/source/IRandomAccessSource;
    .end local v1    # "raf":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .end local v2    # "tiff":Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;
    :cond_1
    nop

    .line 81
    return-void

    .line 78
    :catch_0
    move-exception v0

    .line 79
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v2, "TIFF image exception."

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 63
    .end local v0    # "e":Ljava/io/IOException;
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "TIFF image expected"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static processTiffImage(Lcom/itextpdf/io/source/RandomAccessFileOrArray;Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;)V
    .locals 58
    .param p0, "s"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .param p1, "tiff"    # Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;

    .line 84
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    iget-object v0, v2, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->image:Lcom/itextpdf/io/image/TiffImageData;

    invoke-virtual {v0}, Lcom/itextpdf/io/image/TiffImageData;->isRecoverFromImageError()Z

    move-result v3

    .line 85
    .local v3, "recoverFromImageError":Z
    iget-object v0, v2, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->image:Lcom/itextpdf/io/image/TiffImageData;

    invoke-virtual {v0}, Lcom/itextpdf/io/image/TiffImageData;->getPage()I

    move-result v4

    .line 86
    .local v4, "page":I
    iget-object v0, v2, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->image:Lcom/itextpdf/io/image/TiffImageData;

    invoke-virtual {v0}, Lcom/itextpdf/io/image/TiffImageData;->isDirect()Z

    move-result v5

    .line 87
    .local v5, "direct":Z
    const/4 v6, 0x1

    if-lt v4, v6, :cond_22

    .line 90
    :try_start_0
    new-instance v0, Lcom/itextpdf/io/codec/TIFFDirectory;

    add-int/lit8 v7, v4, -0x1

    invoke-direct {v0, v1, v7}, Lcom/itextpdf/io/codec/TIFFDirectory;-><init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;I)V

    move-object v7, v0

    .line 91
    .local v7, "dir":Lcom/itextpdf/io/codec/TIFFDirectory;
    const/16 v0, 0x142

    invoke-virtual {v7, v0}, Lcom/itextpdf/io/codec/TIFFDirectory;->isTagPresent(I)Z

    move-result v0

    if-nez v0, :cond_21

    .line 93
    const/4 v0, 0x1

    .line 94
    .local v0, "compression":I
    const/16 v8, 0x103

    invoke-virtual {v7, v8}, Lcom/itextpdf/io/codec/TIFFDirectory;->isTagPresent(I)Z

    move-result v9
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_8

    if-eqz v9, :cond_0

    .line 95
    :try_start_1
    invoke-virtual {v7, v8}, Lcom/itextpdf/io/codec/TIFFDirectory;->getFieldAsLong(I)J

    move-result-wide v8
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    long-to-int v0, v8

    move v8, v0

    goto :goto_0

    .line 268
    .end local v0    # "compression":I
    .end local v7    # "dir":Lcom/itextpdf/io/codec/TIFFDirectory;
    :catch_0
    move-exception v0

    move/from16 v37, v3

    move/from16 v27, v4

    move/from16 v28, v5

    goto/16 :goto_18

    .line 94
    .restart local v0    # "compression":I
    .restart local v7    # "dir":Lcom/itextpdf/io/codec/TIFFDirectory;
    :cond_0
    move v8, v0

    .line 97
    .end local v0    # "compression":I
    .local v8, "compression":I
    :goto_0
    sparse-switch v8, :sswitch_data_0

    .line 104
    move/from16 v37, v3

    move/from16 v27, v4

    move/from16 v28, v5

    move/from16 v29, v8

    .end local v3    # "recoverFromImageError":Z
    .end local v4    # "page":I
    .end local v5    # "direct":Z
    .end local v8    # "compression":I
    .local v27, "page":I
    .local v28, "direct":Z
    .local v29, "compression":I
    .local v37, "recoverFromImageError":Z
    :try_start_2
    invoke-static {v7, v1, v2}, Lcom/itextpdf/io/image/TiffImageHelper;->processTiffImageColor(Lcom/itextpdf/io/codec/TIFFDirectory;Lcom/itextpdf/io/source/RandomAccessFileOrArray;Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_7

    goto/16 :goto_17

    .line 102
    .end local v27    # "page":I
    .end local v28    # "direct":Z
    .end local v29    # "compression":I
    .end local v37    # "recoverFromImageError":Z
    .restart local v3    # "recoverFromImageError":Z
    .restart local v4    # "page":I
    .restart local v5    # "direct":Z
    .restart local v8    # "compression":I
    :sswitch_0
    nop

    .line 107
    const/4 v0, 0x0

    .line 108
    .local v0, "rotation":F
    const/16 v9, 0x112

    :try_start_3
    invoke-virtual {v7, v9}, Lcom/itextpdf/io/codec/TIFFDirectory;->isTagPresent(I)Z

    move-result v10
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_8

    const/16 v11, 0x8

    if-eqz v10, :cond_6

    .line 109
    :try_start_4
    invoke-virtual {v7, v9}, Lcom/itextpdf/io/codec/TIFFDirectory;->getFieldAsLong(I)J

    move-result-wide v9
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    long-to-int v9, v9

    .line 110
    .local v9, "rot":I
    const/4 v10, 0x3

    if-eq v9, v10, :cond_5

    const/4 v10, 0x4

    if-ne v9, v10, :cond_1

    goto :goto_2

    .line 112
    :cond_1
    const/4 v10, 0x5

    if-eq v9, v10, :cond_4

    if-ne v9, v11, :cond_2

    goto :goto_1

    .line 114
    :cond_2
    const/4 v10, 0x6

    if-eq v9, v10, :cond_3

    const/4 v10, 0x7

    if-ne v9, v10, :cond_6

    .line 115
    :cond_3
    const v0, -0x4036f025

    move v9, v0

    goto :goto_3

    .line 113
    :cond_4
    :goto_1
    const v0, 0x3fc90fdb

    move v9, v0

    goto :goto_3

    .line 111
    :cond_5
    :goto_2
    const v0, 0x40490fdb    # (float)Math.PI

    move v9, v0

    goto :goto_3

    .line 118
    .end local v9    # "rot":I
    :cond_6
    move v9, v0

    .end local v0    # "rotation":F
    .local v9, "rotation":F
    :goto_3
    const-wide/16 v12, 0x0

    .line 119
    .local v12, "tiffT4Options":J
    const-wide/16 v14, 0x0

    .line 120
    .local v14, "tiffT6Options":J
    const/4 v0, 0x1

    .line 121
    .local v0, "fillOrder":I
    const/16 v10, 0x101

    move/from16 v16, v11

    move-wide/from16 v17, v12

    .end local v12    # "tiffT4Options":J
    .local v17, "tiffT4Options":J
    :try_start_5
    invoke-virtual {v7, v10}, Lcom/itextpdf/io/codec/TIFFDirectory;->getFieldAsLong(I)J

    move-result-wide v11

    long-to-int v10, v11

    .line 122
    .local v10, "h":I
    const/16 v11, 0x100

    invoke-virtual {v7, v11}, Lcom/itextpdf/io/codec/TIFFDirectory;->getFieldAsLong(I)J

    move-result-wide v11

    long-to-int v11, v11

    .line 123
    .local v11, "w":I
    const/4 v12, 0x0

    .line 124
    .local v12, "XYRatio":F
    const/4 v13, 0x2

    .line 125
    .local v13, "resolutionUnit":I
    const/16 v6, 0x128

    invoke-virtual {v7, v6}, Lcom/itextpdf/io/codec/TIFFDirectory;->isTagPresent(I)Z

    move-result v19
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_8

    if-eqz v19, :cond_7

    .line 126
    move/from16 v27, v4

    move/from16 v28, v5

    .end local v4    # "page":I
    .end local v5    # "direct":Z
    .restart local v27    # "page":I
    .restart local v28    # "direct":Z
    :try_start_6
    invoke-virtual {v7, v6}, Lcom/itextpdf/io/codec/TIFFDirectory;->getFieldAsLong(I)J

    move-result-wide v4
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    long-to-int v13, v4

    goto :goto_4

    .line 268
    .end local v0    # "fillOrder":I
    .end local v7    # "dir":Lcom/itextpdf/io/codec/TIFFDirectory;
    .end local v8    # "compression":I
    .end local v9    # "rotation":F
    .end local v10    # "h":I
    .end local v11    # "w":I
    .end local v12    # "XYRatio":F
    .end local v13    # "resolutionUnit":I
    .end local v14    # "tiffT6Options":J
    .end local v17    # "tiffT4Options":J
    :catch_1
    move-exception v0

    move/from16 v37, v3

    goto/16 :goto_18

    .line 125
    .end local v27    # "page":I
    .end local v28    # "direct":Z
    .restart local v0    # "fillOrder":I
    .restart local v4    # "page":I
    .restart local v5    # "direct":Z
    .restart local v7    # "dir":Lcom/itextpdf/io/codec/TIFFDirectory;
    .restart local v8    # "compression":I
    .restart local v9    # "rotation":F
    .restart local v10    # "h":I
    .restart local v11    # "w":I
    .restart local v12    # "XYRatio":F
    .restart local v13    # "resolutionUnit":I
    .restart local v14    # "tiffT6Options":J
    .restart local v17    # "tiffT4Options":J
    :cond_7
    move/from16 v27, v4

    move/from16 v28, v5

    .line 127
    .end local v4    # "page":I
    .end local v5    # "direct":Z
    .restart local v27    # "page":I
    .restart local v28    # "direct":Z
    :goto_4
    const/16 v4, 0x11a

    :try_start_7
    invoke-virtual {v7, v4}, Lcom/itextpdf/io/codec/TIFFDirectory;->getField(I)Lcom/itextpdf/io/codec/TIFFField;

    move-result-object v4

    invoke-static {v4, v13}, Lcom/itextpdf/io/image/TiffImageHelper;->getDpi(Lcom/itextpdf/io/codec/TIFFField;I)I

    move-result v4

    .line 128
    .local v4, "dpiX":I
    const/16 v5, 0x11b

    invoke-virtual {v7, v5}, Lcom/itextpdf/io/codec/TIFFDirectory;->getField(I)Lcom/itextpdf/io/codec/TIFFField;

    move-result-object v5

    invoke-static {v5, v13}, Lcom/itextpdf/io/image/TiffImageHelper;->getDpi(Lcom/itextpdf/io/codec/TIFFField;I)I

    move-result v5

    .line 129
    .local v5, "dpiY":I
    const/4 v6, 0x1

    if-ne v13, v6, :cond_9

    .line 130
    if-eqz v5, :cond_8

    .line 131
    int-to-float v6, v4

    move/from16 v19, v0

    .end local v0    # "fillOrder":I
    .local v19, "fillOrder":I
    int-to-float v0, v5

    div-float v12, v6, v0

    goto :goto_5

    .line 130
    .end local v19    # "fillOrder":I
    .restart local v0    # "fillOrder":I
    :cond_8
    move/from16 v19, v0

    .line 132
    .end local v0    # "fillOrder":I
    .restart local v19    # "fillOrder":I
    :goto_5
    const/4 v4, 0x0

    .line 133
    const/4 v5, 0x0

    goto :goto_6

    .line 129
    .end local v19    # "fillOrder":I
    .restart local v0    # "fillOrder":I
    :cond_9
    move/from16 v19, v0

    .line 135
    .end local v0    # "fillOrder":I
    .restart local v19    # "fillOrder":I
    :goto_6
    move v0, v10

    .line 136
    .local v0, "rowsStrip":I
    const/16 v6, 0x116

    invoke-virtual {v7, v6}, Lcom/itextpdf/io/codec/TIFFDirectory;->isTagPresent(I)Z

    move-result v20
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_6

    if-eqz v20, :cond_a

    .line 137
    move-wide/from16 v20, v14

    move v15, v13

    .end local v13    # "resolutionUnit":I
    .end local v14    # "tiffT6Options":J
    .local v15, "resolutionUnit":I
    .local v20, "tiffT6Options":J
    :try_start_8
    invoke-virtual {v7, v6}, Lcom/itextpdf/io/codec/TIFFDirectory;->getFieldAsLong(I)J

    move-result-wide v13
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1

    long-to-int v0, v13

    goto :goto_7

    .line 136
    .end local v15    # "resolutionUnit":I
    .end local v20    # "tiffT6Options":J
    .restart local v13    # "resolutionUnit":I
    .restart local v14    # "tiffT6Options":J
    :cond_a
    move-wide/from16 v20, v14

    move v15, v13

    .line 138
    .end local v13    # "resolutionUnit":I
    .end local v14    # "tiffT6Options":J
    .restart local v15    # "resolutionUnit":I
    .restart local v20    # "tiffT6Options":J
    :goto_7
    if-lez v0, :cond_c

    if-le v0, v10, :cond_b

    goto :goto_8

    :cond_b
    move v6, v0

    goto :goto_9

    .line 139
    :cond_c
    :goto_8
    move v0, v10

    move v6, v0

    .line 140
    .end local v0    # "rowsStrip":I
    .local v6, "rowsStrip":I
    :goto_9
    const/16 v0, 0x111

    :try_start_9
    invoke-static {v7, v0}, Lcom/itextpdf/io/image/TiffImageHelper;->getArrayLongShort(Lcom/itextpdf/io/codec/TIFFDirectory;I)[J

    move-result-object v0

    move-object v13, v0

    .line 141
    .local v13, "offset":[J
    const/16 v0, 0x117

    invoke-static {v7, v0}, Lcom/itextpdf/io/image/TiffImageHelper;->getArrayLongShort(Lcom/itextpdf/io/codec/TIFFDirectory;I)[J

    move-result-object v0
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_6

    .line 144
    .local v0, "size":[J
    const-wide/16 v22, 0x0

    if-eqz v0, :cond_e

    const/16 v24, 0x0

    :try_start_a
    array-length v14, v0

    move/from16 v29, v8

    const/4 v8, 0x1

    .end local v8    # "compression":I
    .restart local v29    # "compression":I
    if-ne v14, v8, :cond_d

    aget-wide v25, v0, v24

    cmp-long v8, v25, v22

    if-eqz v8, :cond_f

    aget-wide v25, v0, v24

    aget-wide v30, v13, v24

    add-long v25, v25, v30

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->length()J

    move-result-wide v30

    cmp-long v8, v25, v30

    if-lez v8, :cond_d

    goto :goto_a

    :cond_d
    move v8, v15

    goto :goto_b

    .end local v29    # "compression":I
    .restart local v8    # "compression":I
    :cond_e
    move/from16 v29, v8

    const/16 v24, 0x0

    .end local v8    # "compression":I
    .restart local v29    # "compression":I
    :cond_f
    :goto_a
    if-ne v10, v6, :cond_10

    .line 145
    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->length()J

    move-result-wide v25

    move v8, v15

    .end local v15    # "resolutionUnit":I
    .local v8, "resolutionUnit":I
    aget-wide v14, v13, v24

    long-to-int v14, v14

    int-to-long v14, v14

    sub-long v25, v25, v14

    const/4 v14, 0x1

    new-array v15, v14, [J

    aput-wide v25, v15, v24
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_1

    move-object v0, v15

    move-object v14, v0

    goto :goto_c

    .line 144
    .end local v8    # "resolutionUnit":I
    .restart local v15    # "resolutionUnit":I
    :cond_10
    move v8, v15

    .line 147
    .end local v15    # "resolutionUnit":I
    .restart local v8    # "resolutionUnit":I
    :goto_b
    move-object v14, v0

    .end local v0    # "size":[J
    .local v14, "size":[J
    :goto_c
    const/4 v0, 0x0

    .line 148
    .local v0, "reverse":Z
    const/16 v15, 0x10a

    :try_start_b
    invoke-virtual {v7, v15}, Lcom/itextpdf/io/codec/TIFFDirectory;->getField(I)Lcom/itextpdf/io/codec/TIFFField;

    move-result-object v15
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_6

    .line 149
    .local v15, "fillOrderField":Lcom/itextpdf/io/codec/TIFFField;
    if-eqz v15, :cond_11

    .line 150
    move/from16 v30, v8

    move/from16 v8, v24

    .end local v8    # "resolutionUnit":I
    .local v30, "resolutionUnit":I
    :try_start_c
    invoke-virtual {v15, v8}, Lcom/itextpdf/io/codec/TIFFField;->getAsInt(I)I

    move-result v25
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_1

    move/from16 v8, v25

    .end local v19    # "fillOrder":I
    .local v25, "fillOrder":I
    goto :goto_d

    .line 149
    .end local v25    # "fillOrder":I
    .end local v30    # "resolutionUnit":I
    .restart local v8    # "resolutionUnit":I
    .restart local v19    # "fillOrder":I
    :cond_11
    move/from16 v30, v8

    .end local v8    # "resolutionUnit":I
    .restart local v30    # "resolutionUnit":I
    move/from16 v8, v19

    .line 151
    .end local v19    # "fillOrder":I
    .local v8, "fillOrder":I
    :goto_d
    move/from16 v19, v0

    .end local v0    # "reverse":Z
    .local v19, "reverse":Z
    const/4 v0, 0x2

    if-ne v8, v0, :cond_12

    const/4 v0, 0x1

    goto :goto_e

    :cond_12
    const/4 v0, 0x0

    :goto_e
    move/from16 v31, v0

    .line 152
    .end local v19    # "reverse":Z
    .local v31, "reverse":Z
    const/4 v0, 0x0

    .line 153
    .local v0, "parameters":I
    move/from16 v19, v0

    .end local v0    # "parameters":I
    .local v19, "parameters":I
    const/16 v0, 0x106

    :try_start_d
    invoke-virtual {v7, v0}, Lcom/itextpdf/io/codec/TIFFDirectory;->isTagPresent(I)Z

    move-result v25
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_6

    const-wide/16 v32, 0x1

    if-eqz v25, :cond_13

    .line 154
    :try_start_e
    invoke-virtual {v7, v0}, Lcom/itextpdf/io/codec/TIFFDirectory;->getFieldAsLong(I)J

    move-result-wide v25

    .line 155
    .local v25, "photo":J
    cmp-long v0, v25, v32

    if-nez v0, :cond_13

    .line 156
    or-int/lit8 v0, v19, 0x1

    .end local v19    # "parameters":I
    .restart local v0    # "parameters":I
    goto :goto_f

    .line 158
    .end local v0    # "parameters":I
    .end local v25    # "photo":J
    .restart local v19    # "parameters":I
    :cond_13
    move/from16 v0, v19

    .end local v19    # "parameters":I
    .restart local v0    # "parameters":I
    :goto_f
    const/16 v19, 0x0

    .line 159
    .local v19, "imagecomp":I
    const-wide/16 v25, 0x4

    sparse-switch v29, :sswitch_data_1

    move/from16 v34, v0

    move/from16 v35, v11

    move-object/from16 v36, v14

    .end local v0    # "parameters":I
    .end local v11    # "w":I
    .end local v14    # "size":[J
    .local v34, "parameters":I
    .local v35, "w":I
    .local v36, "size":[J
    move/from16 v23, v19

    move-wide/from16 v42, v20

    goto/16 :goto_10

    .line 178
    .end local v34    # "parameters":I
    .end local v35    # "w":I
    .end local v36    # "size":[J
    .restart local v0    # "parameters":I
    .restart local v11    # "w":I
    .restart local v14    # "size":[J
    :sswitch_1
    const/16 v19, 0x100

    .line 179
    move/from16 v34, v0

    .end local v0    # "parameters":I
    .restart local v34    # "parameters":I
    const/16 v0, 0x125

    invoke-virtual {v7, v0}, Lcom/itextpdf/io/codec/TIFFDirectory;->getField(I)Lcom/itextpdf/io/codec/TIFFField;

    move-result-object v0

    .line 180
    .local v0, "t6OptionsField":Lcom/itextpdf/io/codec/TIFFField;
    if-eqz v0, :cond_14

    .line 181
    move/from16 v35, v11

    const/4 v11, 0x0

    .end local v11    # "w":I
    .restart local v35    # "w":I
    invoke-virtual {v0, v11}, Lcom/itextpdf/io/codec/TIFFField;->getAsLong(I)J

    move-result-wide v22

    move-object/from16 v36, v14

    move-wide/from16 v42, v22

    move/from16 v23, v19

    .end local v20    # "tiffT6Options":J
    .local v22, "tiffT6Options":J
    goto/16 :goto_10

    .line 180
    .end local v22    # "tiffT6Options":J
    .end local v35    # "w":I
    .restart local v11    # "w":I
    .restart local v20    # "tiffT6Options":J
    :cond_14
    move/from16 v35, v11

    .end local v11    # "w":I
    .restart local v35    # "w":I
    move-object/from16 v36, v14

    move/from16 v23, v19

    move-wide/from16 v42, v20

    goto :goto_10

    .line 166
    .end local v34    # "parameters":I
    .end local v35    # "w":I
    .local v0, "parameters":I
    .restart local v11    # "w":I
    :sswitch_2
    move/from16 v34, v0

    move/from16 v35, v11

    .end local v0    # "parameters":I
    .end local v11    # "w":I
    .restart local v34    # "parameters":I
    .restart local v35    # "w":I
    const/16 v19, 0x101

    .line 167
    or-int/lit8 v0, v34, 0xc

    .line 168
    .end local v34    # "parameters":I
    .restart local v0    # "parameters":I
    const/16 v11, 0x124

    invoke-virtual {v7, v11}, Lcom/itextpdf/io/codec/TIFFDirectory;->getField(I)Lcom/itextpdf/io/codec/TIFFField;

    move-result-object v11

    .line 169
    .local v11, "t4OptionsField":Lcom/itextpdf/io/codec/TIFFField;
    if-eqz v11, :cond_17

    .line 170
    move-object/from16 v36, v14

    const/4 v14, 0x0

    .end local v14    # "size":[J
    .restart local v36    # "size":[J
    invoke-virtual {v11, v14}, Lcom/itextpdf/io/codec/TIFFField;->getAsLong(I)J

    move-result-wide v37

    .line 171
    .end local v17    # "tiffT4Options":J
    .local v37, "tiffT4Options":J
    and-long v17, v37, v32

    cmp-long v14, v17, v22

    if-eqz v14, :cond_15

    .line 172
    const/16 v14, 0x102

    move/from16 v19, v14

    .line 173
    :cond_15
    and-long v17, v37, v25

    cmp-long v14, v17, v22

    if-eqz v14, :cond_16

    .line 174
    or-int/lit8 v0, v0, 0x2

    move/from16 v34, v0

    move/from16 v23, v19

    move-wide/from16 v42, v20

    move-wide/from16 v17, v37

    goto :goto_10

    .line 173
    :cond_16
    move/from16 v34, v0

    move/from16 v23, v19

    move-wide/from16 v42, v20

    move-wide/from16 v17, v37

    goto :goto_10

    .line 169
    .end local v36    # "size":[J
    .end local v37    # "tiffT4Options":J
    .restart local v14    # "size":[J
    .restart local v17    # "tiffT4Options":J
    :cond_17
    move-object/from16 v36, v14

    .end local v14    # "size":[J
    .restart local v36    # "size":[J
    move/from16 v34, v0

    move/from16 v23, v19

    move-wide/from16 v42, v20

    goto :goto_10

    .line 162
    .end local v35    # "w":I
    .end local v36    # "size":[J
    .local v11, "w":I
    .restart local v14    # "size":[J
    :sswitch_3
    move/from16 v34, v0

    move/from16 v35, v11

    move-object/from16 v36, v14

    .end local v0    # "parameters":I
    .end local v11    # "w":I
    .end local v14    # "size":[J
    .restart local v34    # "parameters":I
    .restart local v35    # "w":I
    .restart local v36    # "size":[J
    const/16 v19, 0x101

    .line 163
    or-int/lit8 v0, v34, 0xa

    .line 164
    .end local v34    # "parameters":I
    .restart local v0    # "parameters":I
    move/from16 v34, v0

    move/from16 v23, v19

    move-wide/from16 v42, v20

    .line 186
    .end local v0    # "parameters":I
    .end local v19    # "imagecomp":I
    .end local v20    # "tiffT6Options":J
    .local v23, "imagecomp":I
    .restart local v34    # "parameters":I
    .local v42, "tiffT6Options":J
    :goto_10
    if-eqz v28, :cond_18

    if-ne v6, v10, :cond_18

    .line 187
    move v14, v12

    const/16 v24, 0x0

    const/16 v32, 0x0

    .end local v12    # "XYRatio":F
    .local v14, "XYRatio":F
    aget-wide v11, v36, v24

    long-to-int v0, v11

    new-array v0, v0, [B

    .line 188
    .local v0, "im":[B
    aget-wide v11, v13, v24

    invoke-virtual {v1, v11, v12}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 189
    invoke-virtual {v1, v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readFully([B)V

    .line 190
    iget-object v11, v2, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->image:Lcom/itextpdf/io/image/TiffImageData;

    const/16 v22, 0x0

    const/16 v26, 0x0

    move-object/from16 v25, v0

    move/from16 v21, v10

    move-object/from16 v19, v11

    move/from16 v24, v34

    move/from16 v20, v35

    .end local v0    # "im":[B
    .end local v10    # "h":I
    .end local v34    # "parameters":I
    .end local v35    # "w":I
    .local v20, "w":I
    .local v21, "h":I
    .local v24, "parameters":I
    .local v25, "im":[B
    invoke-static/range {v19 .. v26}, Lcom/itextpdf/io/image/RawImageHelper;->updateRawImageParameters(Lcom/itextpdf/io/image/RawImageData;IIZII[B[I)V

    move/from16 v10, v20

    .line 191
    .end local v20    # "w":I
    .end local v24    # "parameters":I
    .local v10, "w":I
    .restart local v34    # "parameters":I
    iget-object v0, v2, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->image:Lcom/itextpdf/io/image/TiffImageData;

    const/4 v11, 0x1

    invoke-virtual {v0, v11}, Lcom/itextpdf/io/image/TiffImageData;->setInverted(Z)V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_1

    .line 192
    .end local v25    # "im":[B
    move/from16 v37, v3

    move/from16 v38, v8

    move/from16 v20, v10

    move-object/from16 v35, v15

    move-wide/from16 v49, v17

    move/from16 v12, v23

    move-object/from16 v18, v13

    move/from16 v17, v14

    goto/16 :goto_15

    .line 186
    .end local v14    # "XYRatio":F
    .end local v21    # "h":I
    .local v10, "h":I
    .restart local v12    # "XYRatio":F
    .restart local v35    # "w":I
    :cond_18
    move/from16 v21, v10

    move v14, v12

    move/from16 v10, v35

    const/16 v32, 0x0

    .line 193
    .end local v12    # "XYRatio":F
    .end local v35    # "w":I
    .local v10, "w":I
    .restart local v14    # "XYRatio":F
    .restart local v21    # "h":I
    move/from16 v0, v21

    .line 194
    .local v0, "rowsLeft":I
    :try_start_f
    new-instance v11, Lcom/itextpdf/io/codec/CCITTG4Encoder;

    invoke-direct {v11, v10}, Lcom/itextpdf/io/codec/CCITTG4Encoder;-><init>(I)V

    .line 195
    .local v11, "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    const/4 v12, 0x0

    move-wide/from16 v49, v17

    move/from16 v17, v14

    move v14, v12

    move v12, v0

    .end local v0    # "rowsLeft":I
    .local v12, "rowsLeft":I
    .local v14, "k":I
    .local v17, "XYRatio":F
    .local v49, "tiffT4Options":J
    :goto_11
    array-length v0, v13

    if-ge v14, v0, :cond_1d

    .line 196
    move-object/from16 v18, v13

    move/from16 v33, v14

    .end local v13    # "offset":[J
    .end local v14    # "k":I
    .local v18, "offset":[J
    .local v33, "k":I
    aget-wide v13, v36, v33

    long-to-int v0, v13

    new-array v0, v0, [B

    move-object v13, v0

    .line 197
    .local v13, "im":[B
    move-object/from16 v35, v15

    .end local v15    # "fillOrderField":Lcom/itextpdf/io/codec/TIFFField;
    .local v35, "fillOrderField":Lcom/itextpdf/io/codec/TIFFField;
    aget-wide v14, v18, v33

    invoke-virtual {v1, v14, v15}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 198
    invoke-virtual {v1, v13}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readFully([B)V

    .line 199
    invoke-static {v6, v12}, Ljava/lang/Math;->min(II)I

    move-result v48

    move/from16 v14, v48

    .line 200
    .local v14, "height":I
    new-instance v0, Lcom/itextpdf/io/codec/TIFFFaxDecoder;

    invoke-direct {v0, v8, v10, v14}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;-><init>(III)V

    move-object v15, v0

    .line 201
    .local v15, "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    invoke-virtual {v15, v3}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->setRecoverFromImageError(Z)V

    .line 202
    add-int/lit8 v0, v10, 0x7

    div-int/lit8 v0, v0, 0x8

    mul-int/2addr v0, v14

    new-array v0, v0, [B
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_6

    move-object/from16 v45, v0

    .line 203
    .local v45, "outBuf":[B
    sparse-switch v29, :sswitch_data_2

    move/from16 v37, v3

    move/from16 v38, v8

    move/from16 v20, v10

    move/from16 v39, v12

    move-object v3, v15

    move/from16 v12, v23

    move-object/from16 v8, v45

    const/4 v10, 0x0

    move v15, v14

    move-object v14, v13

    .end local v10    # "w":I
    .end local v13    # "im":[B
    .end local v23    # "imagecomp":I
    .end local v45    # "outBuf":[B
    .local v3, "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    .local v8, "outBuf":[B
    .local v12, "imagecomp":I
    .local v14, "im":[B
    .local v15, "height":I
    .restart local v20    # "w":I
    .local v37, "recoverFromImageError":Z
    .local v38, "fillOrder":I
    .local v39, "rowsLeft":I
    goto/16 :goto_14

    .line 240
    .end local v20    # "w":I
    .end local v37    # "recoverFromImageError":Z
    .end local v38    # "fillOrder":I
    .end local v39    # "rowsLeft":I
    .local v3, "recoverFromImageError":Z
    .local v8, "fillOrder":I
    .restart local v10    # "w":I
    .local v12, "rowsLeft":I
    .restart local v13    # "im":[B
    .local v14, "height":I
    .local v15, "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    .restart local v23    # "imagecomp":I
    .restart local v45    # "outBuf":[B
    :sswitch_4
    const/16 v40, 0x0

    move-object/from16 v39, v13

    move/from16 v41, v14

    move-object/from16 v37, v15

    move-object/from16 v38, v45

    .end local v13    # "im":[B
    .end local v14    # "height":I
    .end local v15    # "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    .end local v45    # "outBuf":[B
    .local v37, "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    .local v38, "outBuf":[B
    .local v39, "im":[B
    .local v41, "height":I
    :try_start_10
    invoke-virtual/range {v37 .. v43}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->decodeT6([B[BIIJ)V
    :try_end_10
    .catch Lcom/itextpdf/io/exceptions/IOException; {:try_start_10 .. :try_end_10} :catch_2
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_1

    move-object/from16 v51, v37

    move-object/from16 v14, v38

    move-object/from16 v46, v39

    move/from16 v13, v41

    .line 245
    .end local v37    # "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    .end local v38    # "outBuf":[B
    .end local v39    # "im":[B
    .end local v41    # "height":I
    .local v13, "height":I
    .local v14, "outBuf":[B
    .local v46, "im":[B
    .local v51, "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    goto :goto_12

    .line 241
    .end local v13    # "height":I
    .end local v14    # "outBuf":[B
    .end local v46    # "im":[B
    .end local v51    # "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    .restart local v37    # "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    .restart local v38    # "outBuf":[B
    .restart local v39    # "im":[B
    .restart local v41    # "height":I
    :catch_2
    move-exception v0

    move-object/from16 v51, v37

    move-object/from16 v14, v38

    move-object/from16 v46, v39

    move/from16 v13, v41

    .line 242
    .end local v37    # "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    .end local v38    # "outBuf":[B
    .end local v39    # "im":[B
    .end local v41    # "height":I
    .local v0, "e":Lcom/itextpdf/io/exceptions/IOException;
    .restart local v13    # "height":I
    .restart local v14    # "outBuf":[B
    .restart local v46    # "im":[B
    .restart local v51    # "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    if-eqz v3, :cond_19

    .line 246
    .end local v0    # "e":Lcom/itextpdf/io/exceptions/IOException;
    :goto_12
    :try_start_11
    invoke-virtual {v11, v14, v13}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->fax4Encode([BI)V

    move/from16 v37, v3

    move/from16 v38, v8

    move/from16 v20, v10

    move/from16 v39, v12

    move v15, v13

    move-object v8, v14

    move/from16 v12, v23

    move-object/from16 v14, v46

    move-object/from16 v3, v51

    const/4 v10, 0x0

    goto/16 :goto_14

    .line 243
    .restart local v0    # "e":Lcom/itextpdf/io/exceptions/IOException;
    :cond_19
    nop

    .end local v3    # "recoverFromImageError":Z
    .end local v27    # "page":I
    .end local v28    # "direct":Z
    .end local p0    # "s":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .end local p1    # "tiff":Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;
    throw v0
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_1

    .line 211
    .end local v0    # "e":Lcom/itextpdf/io/exceptions/IOException;
    .end local v46    # "im":[B
    .end local v51    # "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    .restart local v3    # "recoverFromImageError":Z
    .local v13, "im":[B
    .local v14, "height":I
    .restart local v15    # "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    .restart local v27    # "page":I
    .restart local v28    # "direct":Z
    .restart local v45    # "outBuf":[B
    .restart local p0    # "s":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .restart local p1    # "tiff":Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;
    :sswitch_5
    move-object/from16 v46, v13

    move v13, v14

    move-object/from16 v51, v15

    move-object/from16 v14, v45

    .end local v15    # "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    .end local v45    # "outBuf":[B
    .local v13, "height":I
    .local v14, "outBuf":[B
    .restart local v46    # "im":[B
    .restart local v51    # "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    const/16 v47, 0x0

    move/from16 v48, v13

    move-object/from16 v44, v51

    .end local v13    # "height":I
    .end local v14    # "outBuf":[B
    .end local v51    # "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    .local v44, "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    .restart local v45    # "outBuf":[B
    .local v48, "height":I
    :try_start_12
    invoke-virtual/range {v44 .. v50}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->decode2D([B[BIIJ)V
    :try_end_12
    .catch Ljava/lang/RuntimeException; {:try_start_12 .. :try_end_12} :catch_3
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_1

    .line 235
    .end local v44    # "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    .end local v45    # "outBuf":[B
    .restart local v14    # "outBuf":[B
    .restart local v51    # "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    move/from16 v37, v3

    move/from16 v38, v8

    move-object v8, v14

    move-object/from16 v14, v46

    move/from16 v15, v48

    move-object/from16 v3, v51

    goto :goto_13

    .line 212
    .end local v14    # "outBuf":[B
    .end local v51    # "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    .restart local v44    # "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    .restart local v45    # "outBuf":[B
    :catch_3
    move-exception v0

    move-object/from16 v51, v44

    move-object/from16 v14, v45

    .end local v44    # "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    .end local v45    # "outBuf":[B
    .restart local v14    # "outBuf":[B
    .restart local v51    # "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    move-object v13, v0

    .line 214
    .local v13, "e":Ljava/lang/RuntimeException;
    xor-long v56, v49, v25

    .line 216
    .end local v49    # "tiffT4Options":J
    .local v56, "tiffT4Options":J
    const/16 v54, 0x0

    move-object/from16 v52, v14

    move-object/from16 v53, v46

    move/from16 v55, v48

    .end local v14    # "outBuf":[B
    .end local v46    # "im":[B
    .end local v48    # "height":I
    .local v52, "outBuf":[B
    .local v53, "im":[B
    .local v55, "height":I
    :try_start_13
    invoke-virtual/range {v51 .. v57}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->decode2D([B[BIIJ)V
    :try_end_13
    .catch Ljava/lang/RuntimeException; {:try_start_13 .. :try_end_13} :catch_4
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_6

    move/from16 v37, v3

    move/from16 v38, v8

    move-object/from16 v3, v51

    move-object/from16 v8, v52

    move-object/from16 v14, v53

    move/from16 v15, v55

    .line 234
    .end local v51    # "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    .end local v52    # "outBuf":[B
    .end local v53    # "im":[B
    .end local v55    # "height":I
    .local v3, "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    .local v8, "outBuf":[B
    .local v14, "im":[B
    .local v15, "height":I
    .local v37, "recoverFromImageError":Z
    .local v38, "fillOrder":I
    move-wide/from16 v49, v56

    .line 236
    .end local v13    # "e":Ljava/lang/RuntimeException;
    .end local v56    # "tiffT4Options":J
    .restart local v49    # "tiffT4Options":J
    :goto_13
    :try_start_14
    invoke-virtual {v11, v8, v15}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->fax4Encode([BI)V

    .line 237
    move/from16 v20, v10

    move/from16 v39, v12

    move/from16 v12, v23

    const/4 v10, 0x0

    goto/16 :goto_14

    .line 217
    .end local v14    # "im":[B
    .end local v15    # "height":I
    .end local v37    # "recoverFromImageError":Z
    .end local v38    # "fillOrder":I
    .end local v49    # "tiffT4Options":J
    .local v3, "recoverFromImageError":Z
    .local v8, "fillOrder":I
    .restart local v13    # "e":Ljava/lang/RuntimeException;
    .restart local v51    # "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    .restart local v52    # "outBuf":[B
    .restart local v53    # "im":[B
    .restart local v55    # "height":I
    .restart local v56    # "tiffT4Options":J
    :catch_4
    move-exception v0

    move/from16 v37, v3

    move/from16 v38, v8

    move-object/from16 v3, v51

    move-object/from16 v8, v52

    move-object/from16 v14, v53

    move/from16 v15, v55

    .line 218
    .end local v51    # "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    .end local v52    # "outBuf":[B
    .end local v53    # "im":[B
    .end local v55    # "height":I
    .local v0, "e2":Ljava/lang/RuntimeException;
    .local v3, "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    .local v8, "outBuf":[B
    .restart local v14    # "im":[B
    .restart local v15    # "height":I
    .restart local v37    # "recoverFromImageError":Z
    .restart local v38    # "fillOrder":I
    if-eqz v37, :cond_1c

    .line 220
    move/from16 v20, v10

    const/4 v10, 0x1

    .end local v10    # "w":I
    .restart local v20    # "w":I
    if-eq v6, v10, :cond_1b

    .line 224
    move/from16 v39, v12

    move-object v10, v13

    const/16 v24, 0x0

    .end local v12    # "rowsLeft":I
    .end local v13    # "e":Ljava/lang/RuntimeException;
    .local v10, "e":Ljava/lang/RuntimeException;
    .local v39, "rowsLeft":I
    aget-wide v12, v36, v24

    long-to-int v12, v12

    new-array v12, v12, [B

    .line 225
    .end local v14    # "im":[B
    .local v12, "im":[B
    aget-wide v13, v18, v24

    invoke-virtual {v1, v13, v14}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 226
    invoke-virtual {v1, v12}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readFully([B)V

    .line 227
    iget-object v13, v2, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->image:Lcom/itextpdf/io/image/TiffImageData;

    const/16 v22, 0x0

    const/16 v26, 0x0

    move-object/from16 v25, v12

    move-object/from16 v19, v13

    move/from16 v24, v34

    .end local v12    # "im":[B
    .end local v34    # "parameters":I
    .restart local v24    # "parameters":I
    .restart local v25    # "im":[B
    invoke-static/range {v19 .. v26}, Lcom/itextpdf/io/image/RawImageHelper;->updateRawImageParameters(Lcom/itextpdf/io/image/RawImageData;IIZII[B[I)V

    move/from16 v12, v23

    .line 228
    .end local v23    # "imagecomp":I
    .end local v24    # "parameters":I
    .local v12, "imagecomp":I
    .restart local v34    # "parameters":I
    iget-object v13, v2, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->image:Lcom/itextpdf/io/image/TiffImageData;

    const/4 v14, 0x1

    invoke-virtual {v13, v14}, Lcom/itextpdf/io/image/TiffImageData;->setInverted(Z)V

    .line 229
    iget-object v13, v2, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->image:Lcom/itextpdf/io/image/TiffImageData;

    invoke-virtual {v13, v4, v5}, Lcom/itextpdf/io/image/TiffImageData;->setDpi(II)V

    .line 230
    iget-object v13, v2, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->image:Lcom/itextpdf/io/image/TiffImageData;

    move/from16 v14, v17

    .end local v17    # "XYRatio":F
    .local v14, "XYRatio":F
    invoke-virtual {v13, v14}, Lcom/itextpdf/io/image/TiffImageData;->setXYRatio(F)V

    .line 231
    cmpl-float v13, v9, v32

    if-eqz v13, :cond_1a

    .line 232
    iget-object v13, v2, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->image:Lcom/itextpdf/io/image/TiffImageData;

    invoke-virtual {v13, v9}, Lcom/itextpdf/io/image/TiffImageData;->setRotation(F)V

    .line 233
    :cond_1a
    return-void

    .line 221
    .end local v10    # "e":Ljava/lang/RuntimeException;
    .end local v25    # "im":[B
    .end local v39    # "rowsLeft":I
    .local v12, "rowsLeft":I
    .restart local v13    # "e":Ljava/lang/RuntimeException;
    .local v14, "im":[B
    .restart local v17    # "XYRatio":F
    .restart local v23    # "imagecomp":I
    :cond_1b
    move/from16 v39, v12

    move-object v10, v13

    move/from16 v12, v23

    .end local v13    # "e":Ljava/lang/RuntimeException;
    .end local v23    # "imagecomp":I
    .end local v27    # "page":I
    .end local v28    # "direct":Z
    .end local v37    # "recoverFromImageError":Z
    .end local p0    # "s":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .end local p1    # "tiff":Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;
    .restart local v10    # "e":Ljava/lang/RuntimeException;
    .local v12, "imagecomp":I
    .restart local v39    # "rowsLeft":I
    throw v10

    .line 219
    .end local v20    # "w":I
    .end local v39    # "rowsLeft":I
    .local v10, "w":I
    .local v12, "rowsLeft":I
    .restart local v13    # "e":Ljava/lang/RuntimeException;
    .restart local v23    # "imagecomp":I
    .restart local v27    # "page":I
    .restart local v28    # "direct":Z
    .restart local v37    # "recoverFromImageError":Z
    .restart local p0    # "s":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .restart local p1    # "tiff":Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;
    :cond_1c
    move/from16 v20, v10

    move/from16 v39, v12

    move-object v10, v13

    move/from16 v12, v23

    .end local v13    # "e":Ljava/lang/RuntimeException;
    .end local v23    # "imagecomp":I
    .end local v27    # "page":I
    .end local v28    # "direct":Z
    .end local v37    # "recoverFromImageError":Z
    .end local p0    # "s":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .end local p1    # "tiff":Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;
    .local v10, "e":Ljava/lang/RuntimeException;
    .local v12, "imagecomp":I
    .restart local v20    # "w":I
    .restart local v39    # "rowsLeft":I
    throw v10

    .line 206
    .end local v0    # "e2":Ljava/lang/RuntimeException;
    .end local v20    # "w":I
    .end local v38    # "fillOrder":I
    .end local v39    # "rowsLeft":I
    .end local v56    # "tiffT4Options":J
    .local v3, "recoverFromImageError":Z
    .local v8, "fillOrder":I
    .local v10, "w":I
    .local v12, "rowsLeft":I
    .local v13, "im":[B
    .local v14, "height":I
    .local v15, "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    .restart local v23    # "imagecomp":I
    .restart local v27    # "page":I
    .restart local v28    # "direct":Z
    .restart local v45    # "outBuf":[B
    .restart local v49    # "tiffT4Options":J
    .restart local p0    # "s":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .restart local p1    # "tiff":Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;
    :sswitch_6
    move/from16 v37, v3

    move/from16 v38, v8

    move/from16 v20, v10

    move/from16 v39, v12

    move-object v3, v15

    move/from16 v12, v23

    move-object/from16 v8, v45

    move v15, v14

    move-object v14, v13

    .end local v10    # "w":I
    .end local v13    # "im":[B
    .end local v23    # "imagecomp":I
    .end local v45    # "outBuf":[B
    .local v3, "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    .local v8, "outBuf":[B
    .local v12, "imagecomp":I
    .local v14, "im":[B
    .local v15, "height":I
    .restart local v20    # "w":I
    .restart local v37    # "recoverFromImageError":Z
    .restart local v38    # "fillOrder":I
    .restart local v39    # "rowsLeft":I
    const/4 v10, 0x0

    invoke-virtual {v3, v8, v14, v10, v15}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->decode1D([B[BII)V

    .line 207
    invoke-virtual {v11, v8, v15}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->fax4Encode([BI)V

    .line 208
    nop

    .line 249
    :goto_14
    sub-int v0, v39, v6

    .line 195
    .end local v3    # "decoder":Lcom/itextpdf/io/codec/TIFFFaxDecoder;
    .end local v8    # "outBuf":[B
    .end local v14    # "im":[B
    .end local v15    # "height":I
    .end local v39    # "rowsLeft":I
    .local v0, "rowsLeft":I
    add-int/lit8 v14, v33, 0x1

    move/from16 v23, v12

    move-object/from16 v13, v18

    move/from16 v10, v20

    move-object/from16 v15, v35

    move/from16 v3, v37

    move/from16 v8, v38

    move v12, v0

    .end local v33    # "k":I
    .local v14, "k":I
    goto/16 :goto_11

    .end local v0    # "rowsLeft":I
    .end local v18    # "offset":[J
    .end local v20    # "w":I
    .end local v35    # "fillOrderField":Lcom/itextpdf/io/codec/TIFFField;
    .end local v37    # "recoverFromImageError":Z
    .end local v38    # "fillOrder":I
    .local v3, "recoverFromImageError":Z
    .local v8, "fillOrder":I
    .restart local v10    # "w":I
    .local v12, "rowsLeft":I
    .local v13, "offset":[J
    .local v15, "fillOrderField":Lcom/itextpdf/io/codec/TIFFField;
    .restart local v23    # "imagecomp":I
    :cond_1d
    move/from16 v37, v3

    move/from16 v38, v8

    move/from16 v20, v10

    move/from16 v39, v12

    move-object/from16 v18, v13

    move/from16 v33, v14

    move-object/from16 v35, v15

    move/from16 v12, v23

    .line 251
    .end local v3    # "recoverFromImageError":Z
    .end local v8    # "fillOrder":I
    .end local v10    # "w":I
    .end local v13    # "offset":[J
    .end local v14    # "k":I
    .end local v15    # "fillOrderField":Lcom/itextpdf/io/codec/TIFFField;
    .end local v23    # "imagecomp":I
    .local v12, "imagecomp":I
    .restart local v18    # "offset":[J
    .restart local v20    # "w":I
    .restart local v35    # "fillOrderField":Lcom/itextpdf/io/codec/TIFFField;
    .restart local v37    # "recoverFromImageError":Z
    .restart local v38    # "fillOrder":I
    .restart local v39    # "rowsLeft":I
    invoke-virtual {v11}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->close()[B

    move-result-object v25

    .line 252
    .local v25, "g4pic":[B
    iget-object v0, v2, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->image:Lcom/itextpdf/io/image/TiffImageData;

    and-int/lit8 v24, v34, 0x1

    const/16 v26, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x100

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v26}, Lcom/itextpdf/io/image/RawImageHelper;->updateRawImageParameters(Lcom/itextpdf/io/image/RawImageData;IIZII[B[I)V

    .line 255
    .end local v11    # "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    .end local v25    # "g4pic":[B
    .end local v39    # "rowsLeft":I
    :goto_15
    iget-object v0, v2, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->image:Lcom/itextpdf/io/image/TiffImageData;

    invoke-virtual {v0, v4, v5}, Lcom/itextpdf/io/image/TiffImageData;->setDpi(II)V

    .line 256
    const v0, 0x8773

    invoke-virtual {v7, v0}, Lcom/itextpdf/io/codec/TIFFDirectory;->isTagPresent(I)Z

    move-result v3
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_7

    if-eqz v3, :cond_1f

    .line 258
    :try_start_15
    invoke-virtual {v7, v0}, Lcom/itextpdf/io/codec/TIFFDirectory;->getField(I)Lcom/itextpdf/io/codec/TIFFField;

    move-result-object v0

    .line 259
    .local v0, "fd":Lcom/itextpdf/io/codec/TIFFField;
    invoke-virtual {v0}, Lcom/itextpdf/io/codec/TIFFField;->getAsBytes()[B

    move-result-object v3

    invoke-static {v3}, Lcom/itextpdf/io/colors/IccProfile;->getInstance([B)Lcom/itextpdf/io/colors/IccProfile;

    move-result-object v3

    .line 260
    .local v3, "icc_prof":Lcom/itextpdf/io/colors/IccProfile;
    invoke-virtual {v3}, Lcom/itextpdf/io/colors/IccProfile;->getNumComponents()I

    move-result v8

    const/4 v14, 0x1

    if-ne v8, v14, :cond_1e

    .line 261
    iget-object v8, v2, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->image:Lcom/itextpdf/io/image/TiffImageData;

    invoke-virtual {v8, v3}, Lcom/itextpdf/io/image/TiffImageData;->setProfile(Lcom/itextpdf/io/colors/IccProfile;)V
    :try_end_15
    .catch Ljava/lang/RuntimeException; {:try_start_15 .. :try_end_15} :catch_5
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_7

    .line 264
    .end local v0    # "fd":Lcom/itextpdf/io/codec/TIFFField;
    .end local v3    # "icc_prof":Lcom/itextpdf/io/colors/IccProfile;
    :cond_1e
    goto :goto_16

    .line 262
    :catch_5
    move-exception v0

    .line 266
    :cond_1f
    :goto_16
    cmpl-float v0, v9, v32

    if-eqz v0, :cond_20

    .line 267
    :try_start_16
    iget-object v0, v2, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->image:Lcom/itextpdf/io/image/TiffImageData;

    invoke-virtual {v0, v9}, Lcom/itextpdf/io/image/TiffImageData;->setRotation(F)V

    .line 270
    .end local v4    # "dpiX":I
    .end local v5    # "dpiY":I
    .end local v6    # "rowsStrip":I
    .end local v7    # "dir":Lcom/itextpdf/io/codec/TIFFDirectory;
    .end local v9    # "rotation":F
    .end local v12    # "imagecomp":I
    .end local v17    # "XYRatio":F
    .end local v18    # "offset":[J
    .end local v20    # "w":I
    .end local v21    # "h":I
    .end local v29    # "compression":I
    .end local v30    # "resolutionUnit":I
    .end local v31    # "reverse":Z
    .end local v34    # "parameters":I
    .end local v35    # "fillOrderField":Lcom/itextpdf/io/codec/TIFFField;
    .end local v36    # "size":[J
    .end local v38    # "fillOrder":I
    .end local v42    # "tiffT6Options":J
    .end local v49    # "tiffT4Options":J
    :cond_20
    nop

    .line 271
    return-void

    .line 268
    .end local v37    # "recoverFromImageError":Z
    .local v3, "recoverFromImageError":Z
    :catch_6
    move-exception v0

    move/from16 v37, v3

    .end local v3    # "recoverFromImageError":Z
    .restart local v37    # "recoverFromImageError":Z
    goto :goto_18

    .line 105
    .restart local v7    # "dir":Lcom/itextpdf/io/codec/TIFFDirectory;
    .restart local v29    # "compression":I
    :goto_17
    return-void

    .line 92
    .end local v27    # "page":I
    .end local v28    # "direct":Z
    .end local v29    # "compression":I
    .end local v37    # "recoverFromImageError":Z
    .restart local v3    # "recoverFromImageError":Z
    .local v4, "page":I
    .local v5, "direct":Z
    :cond_21
    move/from16 v37, v3

    move/from16 v27, v4

    move/from16 v28, v5

    .end local v3    # "recoverFromImageError":Z
    .end local v4    # "page":I
    .end local v5    # "direct":Z
    .restart local v27    # "page":I
    .restart local v28    # "direct":Z
    .restart local v37    # "recoverFromImageError":Z
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    const-string v3, "Tiles are not supported."

    invoke-direct {v0, v3}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    .end local v27    # "page":I
    .end local v28    # "direct":Z
    .end local v37    # "recoverFromImageError":Z
    .end local p0    # "s":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .end local p1    # "tiff":Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;
    throw v0
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_16} :catch_7

    .line 268
    .end local v7    # "dir":Lcom/itextpdf/io/codec/TIFFDirectory;
    .restart local v27    # "page":I
    .restart local v28    # "direct":Z
    .restart local v37    # "recoverFromImageError":Z
    .restart local p0    # "s":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .restart local p1    # "tiff":Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;
    :catch_7
    move-exception v0

    goto :goto_18

    .end local v27    # "page":I
    .end local v28    # "direct":Z
    .end local v37    # "recoverFromImageError":Z
    .restart local v3    # "recoverFromImageError":Z
    .restart local v4    # "page":I
    .restart local v5    # "direct":Z
    :catch_8
    move-exception v0

    move/from16 v37, v3

    move/from16 v27, v4

    move/from16 v28, v5

    .line 269
    .end local v3    # "recoverFromImageError":Z
    .end local v4    # "page":I
    .end local v5    # "direct":Z
    .local v0, "e":Ljava/lang/Exception;
    .restart local v27    # "page":I
    .restart local v28    # "direct":Z
    .restart local v37    # "recoverFromImageError":Z
    :goto_18
    new-instance v3, Lcom/itextpdf/io/exceptions/IOException;

    const-string v4, "Cannot read TIFF image."

    invoke-direct {v3, v4}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 88
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v27    # "page":I
    .end local v28    # "direct":Z
    .end local v37    # "recoverFromImageError":Z
    .restart local v3    # "recoverFromImageError":Z
    .restart local v4    # "page":I
    .restart local v5    # "direct":Z
    :cond_22
    move/from16 v37, v3

    .end local v3    # "recoverFromImageError":Z
    .restart local v37    # "recoverFromImageError":Z
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    const-string v3, "Page number must be >= 1."

    invoke-direct {v0, v3}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x2 -> :sswitch_0
        0x3 -> :sswitch_0
        0x4 -> :sswitch_0
        0x8003 -> :sswitch_0
    .end sparse-switch

    :sswitch_data_1
    .sparse-switch
        0x2 -> :sswitch_3
        0x3 -> :sswitch_2
        0x4 -> :sswitch_1
        0x8003 -> :sswitch_3
    .end sparse-switch

    :sswitch_data_2
    .sparse-switch
        0x2 -> :sswitch_6
        0x3 -> :sswitch_5
        0x4 -> :sswitch_4
        0x8003 -> :sswitch_6
    .end sparse-switch
.end method

.method private static processTiffImageColor(Lcom/itextpdf/io/codec/TIFFDirectory;Lcom/itextpdf/io/source/RandomAccessFileOrArray;Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;)V
    .locals 49
    .param p0, "dir"    # Lcom/itextpdf/io/codec/TIFFDirectory;
    .param p1, "s"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .param p2, "tiff"    # Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;

    .line 275
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    const/4 v0, 0x1

    .line 276
    .local v0, "compression":I
    const/16 v4, 0x103

    :try_start_0
    invoke-virtual {v1, v4}, Lcom/itextpdf/io/codec/TIFFDirectory;->isTagPresent(I)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 277
    invoke-virtual {v1, v4}, Lcom/itextpdf/io/codec/TIFFDirectory;->getFieldAsLong(I)J

    move-result-wide v4

    long-to-int v0, v4

    move v4, v0

    goto :goto_0

    .line 276
    :cond_0
    move v4, v0

    .line 279
    .end local v0    # "compression":I
    .local v4, "compression":I
    :goto_0
    const/4 v0, 0x1

    .line 280
    .local v0, "predictor":I
    const/4 v5, 0x0

    .line 281
    .local v5, "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    sparse-switch v4, :sswitch_data_0

    .line 291
    move/from16 v22, v0

    move-object/from16 v23, v5

    .end local v0    # "predictor":I
    .end local v5    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .local v22, "predictor":I
    .local v23, "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    goto/16 :goto_29

    .line 289
    .end local v22    # "predictor":I
    .end local v23    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .restart local v0    # "predictor":I
    .restart local v5    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    :sswitch_0
    nop

    .line 293
    const/16 v6, 0x106

    invoke-virtual {v1, v6}, Lcom/itextpdf/io/codec/TIFFDirectory;->getFieldAsLong(I)J

    move-result-wide v6

    long-to-int v6, v6

    .line 294
    .local v6, "photometric":I
    const/4 v7, 0x6

    const/4 v8, 0x7

    packed-switch v6, :pswitch_data_0

    .line 302
    :pswitch_0
    if-eq v4, v7, :cond_2

    if-ne v4, v8, :cond_1

    goto :goto_1

    .line 300
    :pswitch_1
    goto :goto_1

    .line 303
    :cond_1
    new-instance v7, Lcom/itextpdf/io/exceptions/IOException;

    const-string v8, "Photometric {0} is not supported."

    invoke-direct {v7, v8}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v7

    .end local p0    # "dir":Lcom/itextpdf/io/codec/TIFFDirectory;
    .end local p1    # "s":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .end local p2    # "tiff":Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;
    throw v7

    .line 305
    .restart local p0    # "dir":Lcom/itextpdf/io/codec/TIFFDirectory;
    .restart local p1    # "s":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .restart local p2    # "tiff":Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;
    :cond_2
    :goto_1
    const/4 v9, 0x0

    .line 306
    .local v9, "rotation":F
    const/16 v10, 0x112

    invoke-virtual {v1, v10}, Lcom/itextpdf/io/codec/TIFFDirectory;->isTagPresent(I)Z

    move-result v11

    const/4 v12, 0x4

    const/4 v13, 0x5

    const/16 v14, 0x8

    const/4 v15, 0x3

    if-eqz v11, :cond_8

    .line 307
    invoke-virtual {v1, v10}, Lcom/itextpdf/io/codec/TIFFDirectory;->getFieldAsLong(I)J

    move-result-wide v10

    long-to-int v10, v10

    .line 308
    .local v10, "rot":I
    if-eq v10, v15, :cond_7

    if-ne v10, v12, :cond_3

    goto :goto_3

    .line 310
    :cond_3
    if-eq v10, v13, :cond_6

    if-ne v10, v14, :cond_4

    goto :goto_2

    .line 312
    :cond_4
    if-eq v10, v7, :cond_5

    if-ne v10, v8, :cond_8

    .line 313
    :cond_5
    const v9, -0x4036f025

    goto :goto_4

    .line 311
    :cond_6
    :goto_2
    const v9, 0x3fc90fdb

    goto :goto_4

    .line 309
    :cond_7
    :goto_3
    const v9, 0x40490fdb    # (float)Math.PI

    .line 315
    .end local v10    # "rot":I
    :cond_8
    :goto_4
    const/16 v10, 0x11c

    invoke-virtual {v1, v10}, Lcom/itextpdf/io/codec/TIFFDirectory;->isTagPresent(I)Z

    move-result v11

    if-eqz v11, :cond_a

    .line 316
    invoke-virtual {v1, v10}, Lcom/itextpdf/io/codec/TIFFDirectory;->getFieldAsLong(I)J

    move-result-wide v10

    const-wide/16 v16, 0x2

    cmp-long v10, v10, v16

    if-eqz v10, :cond_9

    goto :goto_5

    .line 317
    :cond_9
    new-instance v7, Lcom/itextpdf/io/exceptions/IOException;

    const-string v8, "Planar images are not supported."

    invoke-direct {v7, v8}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    .end local p0    # "dir":Lcom/itextpdf/io/codec/TIFFDirectory;
    .end local p1    # "s":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .end local p2    # "tiff":Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;
    throw v7

    .line 318
    .restart local p0    # "dir":Lcom/itextpdf/io/codec/TIFFDirectory;
    .restart local p1    # "s":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .restart local p2    # "tiff":Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;
    :cond_a
    :goto_5
    const/4 v10, 0x0

    .line 319
    .local v10, "extraSamples":I
    const/16 v11, 0x152

    invoke-virtual {v1, v11}, Lcom/itextpdf/io/codec/TIFFDirectory;->isTagPresent(I)Z

    move-result v11

    if-eqz v11, :cond_b

    .line 320
    const/4 v10, 0x1

    .line 321
    :cond_b
    const/4 v11, 0x1

    .line 324
    .local v11, "samplePerPixel":I
    const/16 v12, 0x115

    invoke-virtual {v1, v12}, Lcom/itextpdf/io/codec/TIFFDirectory;->isTagPresent(I)Z

    move-result v17

    if-eqz v17, :cond_c

    .line 325
    move/from16 v18, v9

    .end local v9    # "rotation":F
    .local v18, "rotation":F
    invoke-virtual {v1, v12}, Lcom/itextpdf/io/codec/TIFFDirectory;->getFieldAsLong(I)J

    move-result-wide v8

    long-to-int v11, v8

    goto :goto_6

    .line 324
    .end local v18    # "rotation":F
    .restart local v9    # "rotation":F
    :cond_c
    move/from16 v18, v9

    .line 326
    .end local v9    # "rotation":F
    .restart local v18    # "rotation":F
    :goto_6
    const/4 v8, 0x1

    .line 327
    .local v8, "bitsPerSample":I
    const/16 v9, 0x102

    invoke-virtual {v1, v9}, Lcom/itextpdf/io/codec/TIFFDirectory;->isTagPresent(I)Z

    move-result v12

    if-eqz v12, :cond_d

    .line 328
    move/from16 v19, v8

    .end local v8    # "bitsPerSample":I
    .local v19, "bitsPerSample":I
    invoke-virtual {v1, v9}, Lcom/itextpdf/io/codec/TIFFDirectory;->getFieldAsLong(I)J

    move-result-wide v7

    long-to-int v8, v7

    .end local v19    # "bitsPerSample":I
    .restart local v8    # "bitsPerSample":I
    goto :goto_7

    .line 327
    :cond_d
    move/from16 v19, v8

    .line 329
    :goto_7
    sparse-switch v8, :sswitch_data_1

    .line 336
    move/from16 v22, v0

    move-object/from16 v23, v5

    move v15, v8

    move/from16 v37, v10

    move/from16 v24, v11

    move/from16 v1, v18

    .end local v0    # "predictor":I
    .end local v5    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .end local v8    # "bitsPerSample":I
    .end local v10    # "extraSamples":I
    .end local v11    # "samplePerPixel":I
    .end local v18    # "rotation":F
    .local v1, "rotation":F
    .local v15, "bitsPerSample":I
    .restart local v22    # "predictor":I
    .restart local v23    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .local v24, "samplePerPixel":I
    .local v37, "extraSamples":I
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    goto/16 :goto_28

    .line 334
    .end local v1    # "rotation":F
    .end local v15    # "bitsPerSample":I
    .end local v22    # "predictor":I
    .end local v23    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .end local v24    # "samplePerPixel":I
    .end local v37    # "extraSamples":I
    .restart local v0    # "predictor":I
    .restart local v5    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .restart local v8    # "bitsPerSample":I
    .restart local v10    # "extraSamples":I
    .restart local v11    # "samplePerPixel":I
    .restart local v18    # "rotation":F
    :sswitch_1
    nop

    .line 338
    const/16 v7, 0x101

    invoke-virtual {v1, v7}, Lcom/itextpdf/io/codec/TIFFDirectory;->getFieldAsLong(I)J

    move-result-wide v14

    long-to-int v7, v14

    .line 339
    .local v7, "h":I
    const/16 v14, 0x100

    invoke-virtual {v1, v14}, Lcom/itextpdf/io/codec/TIFFDirectory;->getFieldAsLong(I)J

    move-result-wide v14

    long-to-int v14, v14

    .line 342
    .local v14, "w":I
    const/4 v15, 0x2

    .line 343
    .local v15, "resolutionUnit":I
    const/16 v9, 0x128

    invoke-virtual {v1, v9}, Lcom/itextpdf/io/codec/TIFFDirectory;->isTagPresent(I)Z

    move-result v20

    if-eqz v20, :cond_e

    .line 344
    invoke-virtual {v1, v9}, Lcom/itextpdf/io/codec/TIFFDirectory;->getFieldAsLong(I)J

    move-result-wide v12

    long-to-int v15, v12

    move v13, v15

    goto :goto_8

    .line 343
    :cond_e
    move v13, v15

    .line 345
    .end local v15    # "resolutionUnit":I
    .local v13, "resolutionUnit":I
    :goto_8
    const/16 v9, 0x11a

    invoke-virtual {v1, v9}, Lcom/itextpdf/io/codec/TIFFDirectory;->getField(I)Lcom/itextpdf/io/codec/TIFFField;

    move-result-object v9

    invoke-static {v9, v13}, Lcom/itextpdf/io/image/TiffImageHelper;->getDpi(Lcom/itextpdf/io/codec/TIFFField;I)I

    move-result v9

    move v15, v9

    .line 346
    .local v15, "dpiX":I
    const/16 v9, 0x11b

    invoke-virtual {v1, v9}, Lcom/itextpdf/io/codec/TIFFDirectory;->getField(I)Lcom/itextpdf/io/codec/TIFFField;

    move-result-object v9

    invoke-static {v9, v13}, Lcom/itextpdf/io/image/TiffImageHelper;->getDpi(Lcom/itextpdf/io/codec/TIFFField;I)I

    move-result v9

    move v12, v9

    .line 347
    .local v12, "dpiY":I
    const/4 v9, 0x1

    .line 348
    .local v9, "fillOrder":I
    move/from16 v22, v0

    .end local v0    # "predictor":I
    .restart local v22    # "predictor":I
    const/16 v0, 0x10a

    invoke-virtual {v1, v0}, Lcom/itextpdf/io/codec/TIFFDirectory;->getField(I)Lcom/itextpdf/io/codec/TIFFField;

    move-result-object v0

    move-object/from16 v35, v0

    .line 349
    .local v35, "fillOrderField":Lcom/itextpdf/io/codec/TIFFField;
    move-object v0, v5

    .end local v5    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .local v0, "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    const/4 v5, 0x0

    if-eqz v35, :cond_f

    .line 350
    move/from16 v23, v9

    move-object/from16 v9, v35

    .end local v35    # "fillOrderField":Lcom/itextpdf/io/codec/TIFFField;
    .local v9, "fillOrderField":Lcom/itextpdf/io/codec/TIFFField;
    .local v23, "fillOrder":I
    invoke-virtual {v9, v5}, Lcom/itextpdf/io/codec/TIFFField;->getAsInt(I)I

    move-result v24

    move/from16 v35, v5

    move/from16 v5, v24

    .end local v23    # "fillOrder":I
    .local v24, "fillOrder":I
    goto :goto_9

    .line 349
    .end local v24    # "fillOrder":I
    .local v9, "fillOrder":I
    .restart local v35    # "fillOrderField":Lcom/itextpdf/io/codec/TIFFField;
    :cond_f
    move/from16 v23, v9

    move-object/from16 v9, v35

    .end local v35    # "fillOrderField":Lcom/itextpdf/io/codec/TIFFField;
    .local v9, "fillOrderField":Lcom/itextpdf/io/codec/TIFFField;
    .restart local v23    # "fillOrder":I
    move/from16 v35, v5

    move/from16 v5, v23

    .line 351
    .end local v23    # "fillOrder":I
    .local v5, "fillOrder":I
    :goto_9
    move-object/from16 v36, v9

    .end local v9    # "fillOrderField":Lcom/itextpdf/io/codec/TIFFField;
    .local v36, "fillOrderField":Lcom/itextpdf/io/codec/TIFFField;
    const/4 v9, 0x2

    move/from16 v37, v10

    .end local v10    # "extraSamples":I
    .restart local v37    # "extraSamples":I
    if-ne v5, v9, :cond_10

    const/16 v23, 0x1

    goto :goto_a

    :cond_10
    move/from16 v23, v35

    :goto_a
    move/from16 v38, v23

    .line 352
    .local v38, "reverse":Z
    move/from16 v23, v7

    .line 355
    .local v23, "rowsStrip":I
    const/16 v9, 0x116

    invoke-virtual {v1, v9}, Lcom/itextpdf/io/codec/TIFFDirectory;->isTagPresent(I)Z

    move-result v24

    if-eqz v24, :cond_11

    .line 356
    move/from16 v24, v11

    .end local v11    # "samplePerPixel":I
    .local v24, "samplePerPixel":I
    invoke-virtual {v1, v9}, Lcom/itextpdf/io/codec/TIFFDirectory;->getFieldAsLong(I)J

    move-result-wide v10

    long-to-int v9, v10

    .end local v23    # "rowsStrip":I
    .local v9, "rowsStrip":I
    goto :goto_b

    .line 355
    .end local v9    # "rowsStrip":I
    .end local v24    # "samplePerPixel":I
    .restart local v11    # "samplePerPixel":I
    .restart local v23    # "rowsStrip":I
    :cond_11
    move/from16 v24, v11

    .end local v11    # "samplePerPixel":I
    .restart local v24    # "samplePerPixel":I
    move/from16 v9, v23

    .line 357
    .end local v23    # "rowsStrip":I
    .restart local v9    # "rowsStrip":I
    :goto_b
    if-lez v9, :cond_12

    if-le v9, v7, :cond_13

    .line 358
    :cond_12
    move v9, v7

    .line 359
    :cond_13
    const/16 v10, 0x111

    invoke-static {v1, v10}, Lcom/itextpdf/io/image/TiffImageHelper;->getArrayLongShort(Lcom/itextpdf/io/codec/TIFFDirectory;I)[J

    move-result-object v10

    .line 360
    .local v10, "offset":[J
    const/16 v11, 0x117

    invoke-static {v1, v11}, Lcom/itextpdf/io/image/TiffImageHelper;->getArrayLongShort(Lcom/itextpdf/io/codec/TIFFDirectory;I)[J

    move-result-object v11

    .line 363
    .local v11, "size":[J
    if-eqz v11, :cond_15

    move-object/from16 v23, v0

    .end local v0    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .local v23, "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    array-length v0, v11

    move/from16 v41, v5

    const/4 v5, 0x1

    .end local v5    # "fillOrder":I
    .local v41, "fillOrder":I
    if-ne v0, v5, :cond_14

    aget-wide v27, v11, v35

    const-wide/16 v29, 0x0

    cmp-long v0, v27, v29

    if-eqz v0, :cond_16

    aget-wide v27, v11, v35

    aget-wide v29, v10, v35

    add-long v27, v27, v29

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->length()J

    move-result-wide v29

    cmp-long v0, v27, v29

    if-lez v0, :cond_14

    goto :goto_c

    :cond_14
    move-object v0, v11

    move v5, v12

    goto :goto_d

    .end local v23    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .end local v41    # "fillOrder":I
    .restart local v0    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .restart local v5    # "fillOrder":I
    :cond_15
    move-object/from16 v23, v0

    move/from16 v41, v5

    .end local v0    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .end local v5    # "fillOrder":I
    .restart local v23    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .restart local v41    # "fillOrder":I
    :cond_16
    :goto_c
    if-ne v7, v9, :cond_17

    .line 364
    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->length()J

    move-result-wide v27

    move-object v0, v11

    move v5, v12

    .end local v11    # "size":[J
    .end local v12    # "dpiY":I
    .local v0, "size":[J
    .local v5, "dpiY":I
    aget-wide v11, v10, v35

    long-to-int v11, v11

    int-to-long v11, v11

    sub-long v27, v27, v11

    const/4 v11, 0x1

    new-array v12, v11, [J

    aput-wide v27, v12, v35

    move-object v11, v12

    .end local v0    # "size":[J
    .restart local v11    # "size":[J
    goto :goto_e

    .line 363
    .end local v5    # "dpiY":I
    .restart local v12    # "dpiY":I
    :cond_17
    move-object v0, v11

    move v5, v12

    .line 366
    .end local v11    # "size":[J
    .end local v12    # "dpiY":I
    .restart local v0    # "size":[J
    .restart local v5    # "dpiY":I
    :goto_d
    move-object v11, v0

    .end local v0    # "size":[J
    .restart local v11    # "size":[J
    :goto_e
    const/4 v0, 0x5

    if-eq v4, v0, :cond_19

    const v0, 0x80b2

    if-eq v4, v0, :cond_19

    const/16 v12, 0x8

    if-ne v4, v12, :cond_18

    goto :goto_f

    :cond_18
    move/from16 v25, v5

    goto :goto_12

    .line 367
    :cond_19
    :goto_f
    const/16 v0, 0x13d

    invoke-virtual {v1, v0}, Lcom/itextpdf/io/codec/TIFFDirectory;->getField(I)Lcom/itextpdf/io/codec/TIFFField;

    move-result-object v0

    .line 368
    .local v0, "predictorField":Lcom/itextpdf/io/codec/TIFFField;
    if-eqz v0, :cond_1e

    .line 369
    move/from16 v12, v35

    invoke-virtual {v0, v12}, Lcom/itextpdf/io/codec/TIFFField;->getAsInt(I)I

    move-result v25

    move/from16 v12, v25

    .line 370
    .end local v22    # "predictor":I
    .local v12, "predictor":I
    move/from16 v25, v5

    const/4 v5, 0x1

    .end local v5    # "dpiY":I
    .local v25, "dpiY":I
    if-eq v12, v5, :cond_1b

    const/4 v5, 0x2

    if-ne v12, v5, :cond_1a

    move-object/from16 v27, v0

    goto :goto_10

    .line 371
    :cond_1a
    new-instance v5, Lcom/itextpdf/io/exceptions/IOException;

    move-object/from16 v27, v0

    .end local v0    # "predictorField":Lcom/itextpdf/io/codec/TIFFField;
    .local v27, "predictorField":Lcom/itextpdf/io/codec/TIFFField;
    const-string v0, "Illegal value for predictor in TIFF file."

    invoke-direct {v5, v0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    .end local p0    # "dir":Lcom/itextpdf/io/codec/TIFFDirectory;
    .end local p1    # "s":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .end local p2    # "tiff":Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;
    throw v5

    .line 370
    .end local v27    # "predictorField":Lcom/itextpdf/io/codec/TIFFField;
    .restart local v0    # "predictorField":Lcom/itextpdf/io/codec/TIFFField;
    .restart local p0    # "dir":Lcom/itextpdf/io/codec/TIFFDirectory;
    .restart local p1    # "s":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .restart local p2    # "tiff":Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;
    :cond_1b
    move-object/from16 v27, v0

    .line 373
    .end local v0    # "predictorField":Lcom/itextpdf/io/codec/TIFFField;
    .restart local v27    # "predictorField":Lcom/itextpdf/io/codec/TIFFField;
    :goto_10
    const/4 v5, 0x2

    if-ne v12, v5, :cond_1d

    const/16 v5, 0x8

    if-ne v8, v5, :cond_1c

    goto :goto_11

    .line 374
    :cond_1c
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    const-string/jumbo v5, "{0} bit samples are not supported for horizontal differencing predictor."

    invoke-direct {v0, v5}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v0

    .end local p0    # "dir":Lcom/itextpdf/io/codec/TIFFDirectory;
    .end local p1    # "s":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .end local p2    # "tiff":Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;
    throw v0

    .line 378
    .end local v27    # "predictorField":Lcom/itextpdf/io/codec/TIFFField;
    .restart local p0    # "dir":Lcom/itextpdf/io/codec/TIFFDirectory;
    .restart local p1    # "s":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .restart local p2    # "tiff":Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;
    :cond_1d
    :goto_11
    move v5, v12

    goto :goto_13

    .line 368
    .end local v12    # "predictor":I
    .end local v25    # "dpiY":I
    .restart local v0    # "predictorField":Lcom/itextpdf/io/codec/TIFFField;
    .restart local v5    # "dpiY":I
    .restart local v22    # "predictor":I
    :cond_1e
    move-object/from16 v27, v0

    move/from16 v25, v5

    .line 378
    .end local v0    # "predictorField":Lcom/itextpdf/io/codec/TIFFField;
    .end local v5    # "dpiY":I
    .restart local v25    # "dpiY":I
    :goto_12
    move/from16 v5, v22

    .end local v22    # "predictor":I
    .local v5, "predictor":I
    :goto_13
    const/4 v0, 0x5

    if-ne v4, v0, :cond_1f

    .line 379
    new-instance v0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;

    move/from16 v12, v24

    .end local v24    # "samplePerPixel":I
    .local v12, "samplePerPixel":I
    invoke-direct {v0, v14, v5, v12}, Lcom/itextpdf/io/codec/TIFFLZWDecoder;-><init>(III)V

    move/from16 v29, v7

    move-object v7, v0

    .end local v23    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .local v0, "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    goto :goto_14

    .line 378
    .end local v0    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .end local v12    # "samplePerPixel":I
    .restart local v23    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .restart local v24    # "samplePerPixel":I
    :cond_1f
    move/from16 v12, v24

    .end local v24    # "samplePerPixel":I
    .restart local v12    # "samplePerPixel":I
    move/from16 v29, v7

    move-object/from16 v7, v23

    .line 381
    .end local v23    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .local v7, "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .local v29, "h":I
    :goto_14
    move/from16 v0, v29

    .line 382
    .local v0, "rowsLeft":I
    const/16 v20, 0x0

    .line 383
    .local v20, "stream":Lcom/itextpdf/io/source/ByteArrayOutputStream;
    const/16 v22, 0x0

    .line 384
    .local v22, "mstream":Lcom/itextpdf/io/source/ByteArrayOutputStream;
    const/16 v23, 0x0

    .line 385
    .local v23, "zip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    const/16 v24, 0x0

    .line 386
    .local v24, "mzip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    if-lez v37, :cond_20

    .line 387
    new-instance v27, Lcom/itextpdf/io/source/ByteArrayOutputStream;

    invoke-direct/range {v27 .. v27}, Lcom/itextpdf/io/source/ByteArrayOutputStream;-><init>()V

    move-object/from16 v22, v27

    .line 388
    move/from16 v27, v0

    .end local v0    # "rowsLeft":I
    .local v27, "rowsLeft":I
    new-instance v0, Lcom/itextpdf/io/source/DeflaterOutputStream;

    move/from16 v42, v13

    move-object/from16 v13, v22

    .end local v22    # "mstream":Lcom/itextpdf/io/source/ByteArrayOutputStream;
    .local v13, "mstream":Lcom/itextpdf/io/source/ByteArrayOutputStream;
    .local v42, "resolutionUnit":I
    invoke-direct {v0, v13}, Lcom/itextpdf/io/source/DeflaterOutputStream;-><init>(Ljava/io/OutputStream;)V

    move-object/from16 v24, v0

    move-object/from16 v43, v13

    goto :goto_15

    .line 386
    .end local v27    # "rowsLeft":I
    .end local v42    # "resolutionUnit":I
    .restart local v0    # "rowsLeft":I
    .local v13, "resolutionUnit":I
    .restart local v22    # "mstream":Lcom/itextpdf/io/source/ByteArrayOutputStream;
    :cond_20
    move/from16 v27, v0

    move/from16 v42, v13

    .end local v0    # "rowsLeft":I
    .end local v13    # "resolutionUnit":I
    .restart local v27    # "rowsLeft":I
    .restart local v42    # "resolutionUnit":I
    move-object/from16 v43, v22

    .line 391
    .end local v22    # "mstream":Lcom/itextpdf/io/source/ByteArrayOutputStream;
    .local v43, "mstream":Lcom/itextpdf/io/source/ByteArrayOutputStream;
    :goto_15
    const/4 v0, 0x0

    .line 392
    .local v0, "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    const/4 v13, 0x1

    if-ne v8, v13, :cond_21

    if-ne v12, v13, :cond_21

    const/4 v13, 0x3

    if-eq v6, v13, :cond_21

    .line 393
    new-instance v13, Lcom/itextpdf/io/codec/CCITTG4Encoder;

    invoke-direct {v13, v14}, Lcom/itextpdf/io/codec/CCITTG4Encoder;-><init>(I)V

    move-object v0, v13

    move-object/from16 v45, v20

    move/from16 v44, v25

    goto :goto_16

    .line 395
    :cond_21
    new-instance v13, Lcom/itextpdf/io/source/ByteArrayOutputStream;

    invoke-direct {v13}, Lcom/itextpdf/io/source/ByteArrayOutputStream;-><init>()V

    .line 396
    .end local v20    # "stream":Lcom/itextpdf/io/source/ByteArrayOutputStream;
    .local v13, "stream":Lcom/itextpdf/io/source/ByteArrayOutputStream;
    move-object/from16 v20, v0

    const/4 v0, 0x6

    .end local v0    # "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    .local v20, "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    move/from16 v44, v25

    .end local v25    # "dpiY":I
    .local v44, "dpiY":I
    if-eq v4, v0, :cond_22

    const/4 v0, 0x7

    if-eq v4, v0, :cond_22

    .line 397
    new-instance v0, Lcom/itextpdf/io/source/DeflaterOutputStream;

    invoke-direct {v0, v13}, Lcom/itextpdf/io/source/DeflaterOutputStream;-><init>(Ljava/io/OutputStream;)V

    move-object/from16 v23, v0

    move-object/from16 v45, v13

    move-object/from16 v13, v20

    goto :goto_16

    .line 399
    :cond_22
    move-object/from16 v45, v13

    move-object/from16 v13, v20

    .end local v20    # "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    .local v13, "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    .local v45, "stream":Lcom/itextpdf/io/source/ByteArrayOutputStream;
    :goto_16
    const/4 v0, 0x6

    if-ne v4, v0, :cond_25

    .line 404
    const/16 v0, 0x201

    invoke-virtual {v1, v0}, Lcom/itextpdf/io/codec/TIFFDirectory;->isTagPresent(I)Z

    move-result v20

    if-eqz v20, :cond_24

    .line 407
    move-object/from16 v46, v7

    move/from16 v20, v8

    .end local v7    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .end local v8    # "bitsPerSample":I
    .local v20, "bitsPerSample":I
    .local v46, "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    invoke-virtual {v1, v0}, Lcom/itextpdf/io/codec/TIFFDirectory;->getFieldAsLong(I)J

    move-result-wide v7

    long-to-int v0, v7

    .line 408
    .local v0, "jpegOffset":I
    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->length()J

    move-result-wide v7

    long-to-int v7, v7

    sub-int/2addr v7, v0

    .line 410
    .local v7, "jpegLength":I
    const/16 v8, 0x202

    invoke-virtual {v1, v8}, Lcom/itextpdf/io/codec/TIFFDirectory;->isTagPresent(I)Z

    move-result v21

    if-eqz v21, :cond_23

    .line 411
    move/from16 v21, v7

    .end local v7    # "jpegLength":I
    .local v21, "jpegLength":I
    invoke-virtual {v1, v8}, Lcom/itextpdf/io/codec/TIFFDirectory;->getFieldAsLong(I)J

    move-result-wide v7

    long-to-int v7, v7

    move/from16 v22, v7

    const/16 v35, 0x0

    aget-wide v7, v11, v35

    long-to-int v7, v7

    add-int v7, v22, v7

    .end local v21    # "jpegLength":I
    .restart local v7    # "jpegLength":I
    goto :goto_17

    .line 410
    :cond_23
    move/from16 v21, v7

    .line 415
    :goto_17
    move/from16 v22, v12

    move-object v8, v13

    .end local v12    # "samplePerPixel":I
    .end local v13    # "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    .local v8, "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    .local v22, "samplePerPixel":I
    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->length()J

    move-result-wide v12

    long-to-int v12, v12

    sub-int/2addr v12, v0

    invoke-static {v7, v12}, Ljava/lang/Math;->min(II)I

    move-result v12

    new-array v12, v12, [B

    .line 417
    .local v12, "jpeg":[B
    move v13, v7

    move-object/from16 v21, v8

    .end local v7    # "jpegLength":I
    .end local v8    # "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    .local v13, "jpegLength":I
    .local v21, "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->getPosition()J

    move-result-wide v7

    long-to-int v7, v7

    .line 418
    .local v7, "posFilePointer":I
    add-int/2addr v7, v0

    .line 419
    move v8, v13

    move/from16 v28, v14

    .end local v13    # "jpegLength":I
    .end local v14    # "w":I
    .local v8, "jpegLength":I
    .local v28, "w":I
    int-to-long v13, v7

    invoke-virtual {v2, v13, v14}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 420
    invoke-virtual {v2, v12}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readFully([B)V

    .line 421
    iget-object v13, v3, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->image:Lcom/itextpdf/io/image/TiffImageData;

    iput-object v12, v13, Lcom/itextpdf/io/image/TiffImageData;->data:[B

    .line 422
    iget-object v13, v3, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->image:Lcom/itextpdf/io/image/TiffImageData;

    sget-object v14, Lcom/itextpdf/io/image/ImageType;->JPEG:Lcom/itextpdf/io/image/ImageType;

    invoke-virtual {v13, v14}, Lcom/itextpdf/io/image/TiffImageData;->setOriginalType(Lcom/itextpdf/io/image/ImageType;)V

    .line 423
    iget-object v13, v3, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->image:Lcom/itextpdf/io/image/TiffImageData;

    invoke-static {v13}, Lcom/itextpdf/io/image/JpegImageHelper;->processImage(Lcom/itextpdf/io/image/ImageData;)V

    .line 424
    const/4 v13, 0x1

    iput-boolean v13, v3, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->jpegProcessing:Z

    .line 425
    .end local v0    # "jpegOffset":I
    .end local v7    # "posFilePointer":I
    .end local v8    # "jpegLength":I
    .end local v12    # "jpeg":[B
    goto/16 :goto_19

    .line 405
    .end local v20    # "bitsPerSample":I
    .end local v21    # "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    .end local v22    # "samplePerPixel":I
    .end local v28    # "w":I
    .end local v46    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .local v7, "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .local v8, "bitsPerSample":I
    .local v12, "samplePerPixel":I
    .local v13, "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    .restart local v14    # "w":I
    :cond_24
    move-object/from16 v46, v7

    move/from16 v20, v8

    move/from16 v22, v12

    move-object/from16 v21, v13

    move/from16 v28, v14

    .end local v7    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .end local v8    # "bitsPerSample":I
    .end local v12    # "samplePerPixel":I
    .end local v13    # "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    .end local v14    # "w":I
    .restart local v20    # "bitsPerSample":I
    .restart local v21    # "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    .restart local v22    # "samplePerPixel":I
    .restart local v28    # "w":I
    .restart local v46    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    const-string v7, "Missing tag(s) for OJPEG compression"

    invoke-direct {v0, v7}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    .end local p0    # "dir":Lcom/itextpdf/io/codec/TIFFDirectory;
    .end local p1    # "s":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .end local p2    # "tiff":Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;
    throw v0

    .line 425
    .end local v20    # "bitsPerSample":I
    .end local v21    # "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    .end local v22    # "samplePerPixel":I
    .end local v28    # "w":I
    .end local v46    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .restart local v7    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .restart local v8    # "bitsPerSample":I
    .restart local v12    # "samplePerPixel":I
    .restart local v13    # "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    .restart local v14    # "w":I
    .restart local p0    # "dir":Lcom/itextpdf/io/codec/TIFFDirectory;
    .restart local p1    # "s":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .restart local p2    # "tiff":Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;
    :cond_25
    move-object/from16 v46, v7

    move/from16 v20, v8

    move/from16 v22, v12

    move-object/from16 v21, v13

    move/from16 v28, v14

    .end local v7    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .end local v8    # "bitsPerSample":I
    .end local v12    # "samplePerPixel":I
    .end local v13    # "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    .end local v14    # "w":I
    .restart local v20    # "bitsPerSample":I
    .restart local v21    # "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    .restart local v22    # "samplePerPixel":I
    .restart local v28    # "w":I
    .restart local v46    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    const/4 v0, 0x7

    if-ne v4, v0, :cond_2b

    .line 426
    array-length v0, v11

    const/4 v13, 0x1

    if-gt v0, v13, :cond_2a

    .line 428
    const/16 v35, 0x0

    aget-wide v7, v11, v35

    long-to-int v0, v7

    new-array v0, v0, [B

    .line 429
    .local v0, "jpeg":[B
    aget-wide v7, v10, v35

    invoke-virtual {v2, v7, v8}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 430
    invoke-virtual {v2, v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readFully([B)V

    .line 433
    const/16 v7, 0x15b

    invoke-virtual {v1, v7}, Lcom/itextpdf/io/codec/TIFFDirectory;->getField(I)Lcom/itextpdf/io/codec/TIFFField;

    move-result-object v7

    .line 434
    .local v7, "jpegtables":Lcom/itextpdf/io/codec/TIFFField;
    if-eqz v7, :cond_28

    .line 435
    invoke-virtual {v7}, Lcom/itextpdf/io/codec/TIFFField;->getAsBytes()[B

    move-result-object v8

    .line 436
    .local v8, "temp":[B
    const/4 v12, 0x0

    .line 437
    .local v12, "tableoffset":I
    array-length v13, v8

    .line 439
    .local v13, "tablelength":I
    const/16 v35, 0x0

    aget-byte v14, v8, v35

    move-object/from16 v25, v7

    .end local v7    # "jpegtables":Lcom/itextpdf/io/codec/TIFFField;
    .local v25, "jpegtables":Lcom/itextpdf/io/codec/TIFFField;
    const/4 v7, -0x1

    if-ne v14, v7, :cond_26

    const/16 v40, 0x1

    aget-byte v14, v8, v40

    const/16 v7, -0x28

    if-ne v14, v7, :cond_26

    .line 440
    const/4 v12, 0x2

    .line 441
    add-int/lit8 v13, v13, -0x2

    .line 444
    :cond_26
    array-length v7, v8

    const/16 v39, 0x2

    add-int/lit8 v7, v7, -0x2

    aget-byte v7, v8, v7

    const/4 v14, -0x1

    if-ne v7, v14, :cond_27

    array-length v7, v8

    const/16 v40, 0x1

    add-int/lit8 v7, v7, -0x1

    aget-byte v7, v8, v7

    const/16 v14, -0x27

    if-ne v7, v14, :cond_27

    .line 445
    add-int/lit8 v13, v13, -0x2

    .line 446
    :cond_27
    new-array v7, v13, [B

    .line 447
    .local v7, "tables":[B
    const/4 v14, 0x0

    invoke-static {v8, v12, v7, v14, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 448
    array-length v14, v0

    move-object/from16 v30, v8

    .end local v8    # "temp":[B
    .local v30, "temp":[B
    array-length v8, v7

    add-int/2addr v14, v8

    new-array v8, v14, [B

    .line 449
    .local v8, "jpegwithtables":[B
    move/from16 v31, v12

    const/4 v12, 0x0

    const/4 v14, 0x2

    .end local v12    # "tableoffset":I
    .local v31, "tableoffset":I
    invoke-static {v0, v12, v8, v12, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 450
    array-length v12, v7

    move/from16 v32, v13

    const/4 v13, 0x0

    .end local v13    # "tablelength":I
    .local v32, "tablelength":I
    invoke-static {v7, v13, v8, v14, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 451
    array-length v12, v7

    add-int/2addr v12, v14

    array-length v13, v0

    sub-int/2addr v13, v14

    invoke-static {v0, v14, v8, v12, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 452
    move-object v0, v8

    goto :goto_18

    .line 434
    .end local v8    # "jpegwithtables":[B
    .end local v25    # "jpegtables":Lcom/itextpdf/io/codec/TIFFField;
    .end local v30    # "temp":[B
    .end local v31    # "tableoffset":I
    .end local v32    # "tablelength":I
    .local v7, "jpegtables":Lcom/itextpdf/io/codec/TIFFField;
    :cond_28
    move-object/from16 v25, v7

    .line 454
    .end local v7    # "jpegtables":Lcom/itextpdf/io/codec/TIFFField;
    .restart local v25    # "jpegtables":Lcom/itextpdf/io/codec/TIFFField;
    :goto_18
    iget-object v7, v3, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->image:Lcom/itextpdf/io/image/TiffImageData;

    iput-object v0, v7, Lcom/itextpdf/io/image/TiffImageData;->data:[B

    .line 455
    iget-object v7, v3, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->image:Lcom/itextpdf/io/image/TiffImageData;

    sget-object v8, Lcom/itextpdf/io/image/ImageType;->JPEG:Lcom/itextpdf/io/image/ImageType;

    invoke-virtual {v7, v8}, Lcom/itextpdf/io/image/TiffImageData;->setOriginalType(Lcom/itextpdf/io/image/ImageType;)V

    .line 456
    iget-object v7, v3, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->image:Lcom/itextpdf/io/image/TiffImageData;

    invoke-static {v7}, Lcom/itextpdf/io/image/JpegImageHelper;->processImage(Lcom/itextpdf/io/image/ImageData;)V

    .line 457
    const/4 v13, 0x1

    iput-boolean v13, v3, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->jpegProcessing:Z

    .line 458
    const/4 v14, 0x2

    if-ne v6, v14, :cond_29

    .line 459
    iget-object v7, v3, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->image:Lcom/itextpdf/io/image/TiffImageData;

    const/4 v12, 0x0

    invoke-virtual {v7, v12}, Lcom/itextpdf/io/image/TiffImageData;->setColorTransform(I)V

    .line 461
    .end local v0    # "jpeg":[B
    .end local v25    # "jpegtables":Lcom/itextpdf/io/codec/TIFFField;
    :cond_29
    nop

    .line 507
    :goto_19
    move-object/from16 v7, v21

    move/from16 v2, v22

    move-object/from16 v12, v23

    move-object/from16 v25, v24

    move/from16 v48, v27

    move-object/from16 v14, v46

    move/from16 v46, v5

    move/from16 v5, v20

    goto/16 :goto_1e

    .line 427
    :cond_2a
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    const-string v7, "Compression jpeg is only supported with a single strip. This image has {0} strips."

    invoke-direct {v0, v7}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    array-length v7, v11

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v0

    .end local p0    # "dir":Lcom/itextpdf/io/codec/TIFFDirectory;
    .end local p1    # "s":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .end local p2    # "tiff":Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;
    throw v0

    .line 462
    .restart local p0    # "dir":Lcom/itextpdf/io/codec/TIFFDirectory;
    .restart local p1    # "s":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .restart local p2    # "tiff":Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;
    :cond_2b
    const/4 v0, 0x0

    move/from16 v7, v27

    .end local v27    # "rowsLeft":I
    .local v0, "k":I
    .local v7, "rowsLeft":I
    :goto_1a
    array-length v8, v10

    if-ge v0, v8, :cond_30

    .line 463
    aget-wide v12, v11, v0

    long-to-int v8, v12

    new-array v8, v8, [B

    .line 464
    .local v8, "im":[B
    aget-wide v12, v10, v0

    invoke-virtual {v2, v12, v13}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 465
    invoke-virtual {v2, v8}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readFully([B)V

    .line 466
    invoke-static {v9, v7}, Ljava/lang/Math;->min(II)I

    move-result v25

    move/from16 v12, v25

    .line 467
    .local v12, "height":I
    const/4 v13, 0x0

    .line 468
    .local v13, "outBuf":[B
    const/4 v14, 0x1

    if-eq v4, v14, :cond_2c

    .line 469
    mul-int v14, v28, v20

    mul-int v14, v14, v22

    const/16 v17, 0x7

    add-int/lit8 v14, v14, 0x7

    const/16 v19, 0x8

    div-int/lit8 v14, v14, 0x8

    mul-int/2addr v14, v12

    new-array v14, v14, [B

    move-object v13, v14

    .line 470
    :cond_2c
    if-eqz v38, :cond_2d

    .line 471
    invoke-static {v8}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->reverseBits([B)V

    .line 472
    :cond_2d
    sparse-switch v4, :sswitch_data_2

    move/from16 v2, v22

    move-object/from16 v14, v46

    .end local v22    # "samplePerPixel":I
    .end local v46    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .local v2, "samplePerPixel":I
    .local v14, "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    goto :goto_1b

    .line 482
    .end local v2    # "samplePerPixel":I
    .end local v14    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .restart local v22    # "samplePerPixel":I
    .restart local v46    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    :sswitch_2
    invoke-static {v8, v13}, Lcom/itextpdf/io/image/TiffImageHelper;->decodePackbits([B[B)V

    .line 483
    move/from16 v2, v22

    move-object/from16 v14, v46

    goto :goto_1b

    .line 475
    :sswitch_3
    invoke-static {v8, v13}, Lcom/itextpdf/io/util/FilterUtil;->inflateData([B[B)V

    .line 476
    move/from16 v2, v22

    move/from16 v14, v28

    .end local v22    # "samplePerPixel":I
    .end local v28    # "w":I
    .restart local v2    # "samplePerPixel":I
    .local v14, "w":I
    invoke-static {v13, v5, v14, v12, v2}, Lcom/itextpdf/io/image/TiffImageHelper;->applyPredictor([BIIII)V

    .line 477
    move/from16 v28, v14

    move-object/from16 v14, v46

    goto :goto_1b

    .line 485
    .end local v2    # "samplePerPixel":I
    .end local v14    # "w":I
    .restart local v22    # "samplePerPixel":I
    .restart local v28    # "w":I
    :sswitch_4
    move/from16 v2, v22

    move/from16 v14, v28

    .end local v22    # "samplePerPixel":I
    .end local v28    # "w":I
    .restart local v2    # "samplePerPixel":I
    .restart local v14    # "w":I
    move-object/from16 v14, v46

    .end local v46    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .local v14, "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .restart local v28    # "w":I
    invoke-virtual {v14, v8, v13, v12}, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->decode([B[BI)[B

    goto :goto_1b

    .line 479
    .end local v2    # "samplePerPixel":I
    .end local v14    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .restart local v22    # "samplePerPixel":I
    .restart local v46    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    :sswitch_5
    move/from16 v2, v22

    move-object/from16 v14, v46

    .end local v22    # "samplePerPixel":I
    .end local v46    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .restart local v2    # "samplePerPixel":I
    .restart local v14    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    move-object v13, v8

    .line 480
    nop

    .line 488
    :goto_1b
    move/from16 v46, v5

    move/from16 v48, v7

    move/from16 v5, v20

    const/4 v7, 0x1

    .end local v7    # "rowsLeft":I
    .end local v20    # "bitsPerSample":I
    .local v5, "bitsPerSample":I
    .local v46, "predictor":I
    .local v48, "rowsLeft":I
    if-ne v5, v7, :cond_2e

    if-ne v2, v7, :cond_2e

    const/4 v7, 0x3

    if-eq v6, v7, :cond_2e

    .line 489
    move-object/from16 v7, v21

    .end local v21    # "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    .local v7, "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    invoke-virtual {v7, v13, v12}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->fax4Encode([BI)V

    move/from16 v19, v0

    move-object v0, v13

    move-object/from16 v25, v24

    move v13, v12

    move-object/from16 v12, v23

    goto :goto_1c

    .line 488
    .end local v7    # "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    .restart local v21    # "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    :cond_2e
    move-object/from16 v7, v21

    .line 491
    .end local v21    # "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    .restart local v7    # "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    if-lez v37, :cond_2f

    .line 492
    move/from16 v22, v2

    move/from16 v25, v12

    move-object/from16 v21, v13

    move-object/from16 v19, v23

    move-object/from16 v20, v24

    move/from16 v24, v28

    move/from16 v23, v5

    .end local v2    # "samplePerPixel":I
    .end local v5    # "bitsPerSample":I
    .end local v12    # "height":I
    .end local v13    # "outBuf":[B
    .end local v28    # "w":I
    .local v19, "zip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    .local v20, "mzip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    .local v21, "outBuf":[B
    .restart local v22    # "samplePerPixel":I
    .local v23, "bitsPerSample":I
    .local v24, "w":I
    .local v25, "height":I
    invoke-static/range {v19 .. v25}, Lcom/itextpdf/io/image/TiffImageHelper;->processExtraSamples(Lcom/itextpdf/io/source/DeflaterOutputStream;Lcom/itextpdf/io/source/DeflaterOutputStream;[BIIII)V

    move-object/from16 v12, v19

    move/from16 v13, v25

    move/from16 v19, v0

    move-object/from16 v25, v20

    move-object/from16 v0, v21

    .end local v20    # "mzip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    .end local v21    # "outBuf":[B
    .end local v22    # "samplePerPixel":I
    .end local v23    # "bitsPerSample":I
    .end local v24    # "w":I
    .local v0, "outBuf":[B
    .restart local v2    # "samplePerPixel":I
    .restart local v5    # "bitsPerSample":I
    .local v12, "zip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    .local v13, "height":I
    .local v19, "k":I
    .local v25, "mzip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    .restart local v28    # "w":I
    goto :goto_1c

    .line 494
    .end local v19    # "k":I
    .end local v25    # "mzip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    .local v0, "k":I
    .local v12, "height":I
    .local v13, "outBuf":[B
    .local v23, "zip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    .local v24, "mzip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    :cond_2f
    move/from16 v19, v0

    move-object v0, v13

    move-object/from16 v25, v24

    move v13, v12

    move-object/from16 v12, v23

    .end local v23    # "zip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    .end local v24    # "mzip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    .local v0, "outBuf":[B
    .local v12, "zip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    .local v13, "height":I
    .restart local v19    # "k":I
    .restart local v25    # "mzip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    invoke-virtual {v12, v0}, Lcom/itextpdf/io/source/DeflaterOutputStream;->write([B)V

    .line 496
    :goto_1c
    sub-int v0, v48, v9

    .line 462
    .end local v8    # "im":[B
    .end local v13    # "height":I
    .end local v48    # "rowsLeft":I
    .local v0, "rowsLeft":I
    add-int/lit8 v8, v19, 0x1

    move/from16 v22, v2

    move/from16 v20, v5

    move-object/from16 v21, v7

    move-object/from16 v23, v12

    move-object/from16 v24, v25

    move/from16 v5, v46

    move-object/from16 v2, p1

    move v7, v0

    move v0, v8

    move-object/from16 v46, v14

    .end local v19    # "k":I
    .local v8, "k":I
    goto/16 :goto_1a

    .end local v2    # "samplePerPixel":I
    .end local v8    # "k":I
    .end local v12    # "zip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    .end local v14    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .end local v25    # "mzip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    .local v0, "k":I
    .local v5, "predictor":I
    .local v7, "rowsLeft":I
    .local v20, "bitsPerSample":I
    .local v21, "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    .restart local v22    # "samplePerPixel":I
    .restart local v23    # "zip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    .restart local v24    # "mzip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    .local v46, "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    :cond_30
    move/from16 v19, v0

    move/from16 v48, v7

    move-object/from16 v7, v21

    move/from16 v2, v22

    move-object/from16 v12, v23

    move-object/from16 v25, v24

    move-object/from16 v14, v46

    move/from16 v46, v5

    move/from16 v5, v20

    .line 498
    .end local v0    # "k":I
    .end local v20    # "bitsPerSample":I
    .end local v21    # "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    .end local v22    # "samplePerPixel":I
    .end local v23    # "zip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    .end local v24    # "mzip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    .restart local v2    # "samplePerPixel":I
    .local v5, "bitsPerSample":I
    .local v7, "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    .restart local v12    # "zip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    .restart local v14    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .restart local v25    # "mzip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    .local v46, "predictor":I
    .restart local v48    # "rowsLeft":I
    const/4 v13, 0x1

    if-ne v5, v13, :cond_32

    if-ne v2, v13, :cond_32

    const/4 v8, 0x3

    if-eq v6, v8, :cond_32

    .line 499
    iget-object v0, v3, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->image:Lcom/itextpdf/io/image/TiffImageData;

    if-ne v6, v13, :cond_31

    const/16 v32, 0x1

    goto :goto_1d

    :cond_31
    const/16 v32, 0x0

    .line 500
    :goto_1d
    invoke-virtual {v7}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->close()[B

    move-result-object v33

    .line 499
    const/16 v30, 0x0

    const/16 v31, 0x100

    const/16 v34, 0x0

    move-object/from16 v27, v0

    invoke-static/range {v27 .. v34}, Lcom/itextpdf/io/image/RawImageHelper;->updateRawImageParameters(Lcom/itextpdf/io/image/RawImageData;IIZII[B[I)V

    goto :goto_1e

    .line 502
    :cond_32
    invoke-virtual {v12}, Lcom/itextpdf/io/source/DeflaterOutputStream;->close()V

    .line 503
    iget-object v0, v3, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->image:Lcom/itextpdf/io/image/TiffImageData;

    sub-int v22, v2, v37

    invoke-virtual/range {v45 .. v45}, Lcom/itextpdf/io/source/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v24

    move-object/from16 v19, v0

    move/from16 v23, v5

    move/from16 v20, v28

    move/from16 v21, v29

    .end local v5    # "bitsPerSample":I
    .end local v28    # "w":I
    .end local v29    # "h":I
    .local v20, "w":I
    .local v21, "h":I
    .local v23, "bitsPerSample":I
    invoke-static/range {v19 .. v24}, Lcom/itextpdf/io/image/RawImageHelper;->updateRawImageParameters(Lcom/itextpdf/io/image/RawImageData;IIII[B)V

    .line 504
    .end local v20    # "w":I
    .end local v21    # "h":I
    .end local v23    # "bitsPerSample":I
    .restart local v5    # "bitsPerSample":I
    .restart local v28    # "w":I
    .restart local v29    # "h":I
    iget-object v0, v3, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->image:Lcom/itextpdf/io/image/TiffImageData;

    const/4 v13, 0x1

    invoke-virtual {v0, v13}, Lcom/itextpdf/io/image/TiffImageData;->setDeflated(Z)V

    .line 507
    :goto_1e
    iget-object v0, v3, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->image:Lcom/itextpdf/io/image/TiffImageData;

    move/from16 v8, v44

    .end local v44    # "dpiY":I
    .local v8, "dpiY":I
    invoke-virtual {v0, v15, v8}, Lcom/itextpdf/io/image/TiffImageData;->setDpi(II)V

    .line 508
    const/4 v0, 0x6

    if-eq v4, v0, :cond_3a

    const/4 v0, 0x7

    if-eq v4, v0, :cond_3a

    .line 509
    const v0, 0x8773

    invoke-virtual {v1, v0}, Lcom/itextpdf/io/codec/TIFFDirectory;->isTagPresent(I)Z

    move-result v13
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    if-eqz v13, :cond_34

    .line 511
    :try_start_1
    invoke-virtual {v1, v0}, Lcom/itextpdf/io/codec/TIFFDirectory;->getField(I)Lcom/itextpdf/io/codec/TIFFField;

    move-result-object v0

    .line 512
    .local v0, "fd":Lcom/itextpdf/io/codec/TIFFField;
    invoke-virtual {v0}, Lcom/itextpdf/io/codec/TIFFField;->getAsBytes()[B

    move-result-object v13

    invoke-static {v13}, Lcom/itextpdf/io/colors/IccProfile;->getInstance([B)Lcom/itextpdf/io/colors/IccProfile;

    move-result-object v13
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 513
    .local v13, "icc_prof":Lcom/itextpdf/io/colors/IccProfile;
    move-object/from16 v17, v0

    .end local v0    # "fd":Lcom/itextpdf/io/codec/TIFFField;
    .local v17, "fd":Lcom/itextpdf/io/codec/TIFFField;
    sub-int v0, v2, v37

    move/from16 v24, v2

    .end local v2    # "samplePerPixel":I
    .local v24, "samplePerPixel":I
    :try_start_2
    invoke-virtual {v13}, Lcom/itextpdf/io/colors/IccProfile;->getNumComponents()I

    move-result v2

    if-ne v0, v2, :cond_33

    .line 514
    iget-object v0, v3, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->image:Lcom/itextpdf/io/image/TiffImageData;

    invoke-virtual {v0, v13}, Lcom/itextpdf/io/image/TiffImageData;->setProfile(Lcom/itextpdf/io/colors/IccProfile;)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 518
    .end local v13    # "icc_prof":Lcom/itextpdf/io/colors/IccProfile;
    .end local v17    # "fd":Lcom/itextpdf/io/codec/TIFFField;
    :cond_33
    goto :goto_1f

    .line 516
    :catch_0
    move-exception v0

    goto :goto_1f

    .end local v24    # "samplePerPixel":I
    .restart local v2    # "samplePerPixel":I
    :catch_1
    move-exception v0

    move/from16 v24, v2

    .end local v2    # "samplePerPixel":I
    .restart local v24    # "samplePerPixel":I
    goto :goto_1f

    .line 509
    .end local v24    # "samplePerPixel":I
    .restart local v2    # "samplePerPixel":I
    :cond_34
    move/from16 v24, v2

    .line 520
    .end local v2    # "samplePerPixel":I
    .restart local v24    # "samplePerPixel":I
    :goto_1f
    const/16 v0, 0x140

    :try_start_3
    invoke-virtual {v1, v0}, Lcom/itextpdf/io/codec/TIFFDirectory;->isTagPresent(I)Z

    move-result v2

    if-eqz v2, :cond_3b

    .line 521
    invoke-virtual {v1, v0}, Lcom/itextpdf/io/codec/TIFFDirectory;->getField(I)Lcom/itextpdf/io/codec/TIFFField;

    move-result-object v0

    .line 522
    .restart local v0    # "fd":Lcom/itextpdf/io/codec/TIFFField;
    invoke-virtual {v0}, Lcom/itextpdf/io/codec/TIFFField;->getAsChars()[C

    move-result-object v2

    .line 523
    .local v2, "rgb":[C
    array-length v13, v2

    new-array v13, v13, [B

    .line 524
    .local v13, "palette":[B
    move-object/from16 v17, v0

    .end local v0    # "fd":Lcom/itextpdf/io/codec/TIFFField;
    .restart local v17    # "fd":Lcom/itextpdf/io/codec/TIFFField;
    array-length v0, v2

    const/16 v26, 0x3

    div-int/lit8 v0, v0, 0x3

    .line 525
    .local v0, "gColor":I
    mul-int/lit8 v19, v0, 0x2

    .line 526
    .local v19, "bColor":I
    const/16 v20, 0x0

    move/from16 v1, v20

    .local v1, "k":I
    :goto_20
    if-ge v1, v0, :cond_35

    .line 528
    mul-int/lit8 v20, v1, 0x3

    aget-char v21, v2, v1

    move/from16 v22, v1

    const/16 v47, 0x8

    .end local v1    # "k":I
    .local v22, "k":I
    shr-int/lit8 v1, v21, 0x8

    int-to-byte v1, v1

    aput-byte v1, v13, v20

    .line 529
    mul-int/lit8 v1, v22, 0x3

    const/16 v40, 0x1

    add-int/lit8 v1, v1, 0x1

    add-int v20, v22, v0

    aget-char v20, v2, v20

    move/from16 v21, v1

    const/16 v47, 0x8

    shr-int/lit8 v1, v20, 0x8

    int-to-byte v1, v1

    aput-byte v1, v13, v21

    .line 530
    mul-int/lit8 v1, v22, 0x3

    const/16 v39, 0x2

    add-int/lit8 v1, v1, 0x2

    add-int v20, v22, v19

    aget-char v20, v2, v20

    move/from16 v21, v1

    const/16 v47, 0x8

    shr-int/lit8 v1, v20, 0x8

    int-to-byte v1, v1

    aput-byte v1, v13, v21

    .line 526
    add-int/lit8 v1, v22, 0x1

    .end local v22    # "k":I
    .restart local v1    # "k":I
    goto :goto_20

    :cond_35
    move/from16 v22, v1

    .line 535
    .end local v1    # "k":I
    const/4 v1, 0x1

    .line 536
    .local v1, "colormapBroken":Z
    const/16 v20, 0x0

    move/from16 v21, v1

    move/from16 v1, v20

    .local v1, "k":I
    .local v21, "colormapBroken":Z
    :goto_21
    move-object/from16 v20, v2

    .end local v2    # "rgb":[C
    .local v20, "rgb":[C
    array-length v2, v13

    if-ge v1, v2, :cond_37

    .line 537
    aget-byte v2, v13, v1

    if-eqz v2, :cond_36

    .line 538
    const/4 v2, 0x0

    .line 539
    .end local v21    # "colormapBroken":Z
    .local v2, "colormapBroken":Z
    move v1, v2

    goto :goto_22

    .line 536
    .end local v2    # "colormapBroken":Z
    .restart local v21    # "colormapBroken":Z
    :cond_36
    add-int/lit8 v1, v1, 0x1

    move-object/from16 v2, v20

    goto :goto_21

    :cond_37
    move/from16 v1, v21

    .line 542
    .end local v21    # "colormapBroken":Z
    .local v1, "colormapBroken":Z
    :goto_22
    if-eqz v1, :cond_39

    .line 543
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_23
    if-ge v2, v0, :cond_38

    .line 544
    mul-int/lit8 v21, v2, 0x3

    move/from16 v22, v0

    .end local v0    # "gColor":I
    .local v22, "gColor":I
    aget-char v0, v20, v2

    int-to-byte v0, v0

    aput-byte v0, v13, v21

    .line 545
    mul-int/lit8 v0, v2, 0x3

    const/16 v40, 0x1

    add-int/lit8 v0, v0, 0x1

    add-int v21, v2, v22

    move/from16 v23, v0

    aget-char v0, v20, v21

    int-to-byte v0, v0

    aput-byte v0, v13, v23

    .line 546
    mul-int/lit8 v0, v2, 0x3

    const/16 v39, 0x2

    add-int/lit8 v0, v0, 0x2

    add-int v21, v2, v19

    move/from16 v23, v0

    aget-char v0, v20, v21

    int-to-byte v0, v0

    aput-byte v0, v13, v23

    .line 543
    add-int/lit8 v2, v2, 0x1

    move/from16 v0, v22

    goto :goto_23

    .end local v22    # "gColor":I
    .restart local v0    # "gColor":I
    :cond_38
    move/from16 v22, v0

    .end local v0    # "gColor":I
    .restart local v22    # "gColor":I
    goto :goto_24

    .line 542
    .end local v2    # "k":I
    .end local v22    # "gColor":I
    .restart local v0    # "gColor":I
    :cond_39
    move/from16 v22, v0

    .line 549
    .end local v0    # "gColor":I
    .restart local v22    # "gColor":I
    :goto_24
    const/4 v2, 0x4

    new-array v0, v2, [Ljava/lang/Object;

    .line 550
    .local v0, "indexed":[Ljava/lang/Object;
    const-string v2, "/Indexed"

    const/16 v35, 0x0

    aput-object v2, v0, v35

    .line 551
    const-string v2, "/DeviceRGB"

    const/16 v40, 0x1

    aput-object v2, v0, v40

    .line 552
    add-int/lit8 v2, v22, -0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v39, 0x2

    aput-object v2, v0, v39

    .line 553
    const/4 v2, 0x0

    invoke-static {v13, v2}, Lcom/itextpdf/io/font/PdfEncodings;->convertToString([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/16 v26, 0x3

    aput-object v2, v0, v26

    .line 554
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, v3, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->additional:Ljava/util/Map;

    .line 555
    iget-object v2, v3, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->additional:Ljava/util/Map;

    move/from16 v16, v1

    .end local v1    # "colormapBroken":Z
    .local v16, "colormapBroken":Z
    const-string v1, "ColorSpace"

    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_25

    .line 508
    .end local v0    # "indexed":[Ljava/lang/Object;
    .end local v13    # "palette":[B
    .end local v16    # "colormapBroken":Z
    .end local v17    # "fd":Lcom/itextpdf/io/codec/TIFFField;
    .end local v19    # "bColor":I
    .end local v20    # "rgb":[C
    .end local v22    # "gColor":I
    .end local v24    # "samplePerPixel":I
    .local v2, "samplePerPixel":I
    :cond_3a
    move/from16 v24, v2

    .line 558
    .end local v2    # "samplePerPixel":I
    .restart local v24    # "samplePerPixel":I
    :cond_3b
    :goto_25
    if-nez v6, :cond_3c

    .line 559
    iget-object v0, v3, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->image:Lcom/itextpdf/io/image/TiffImageData;

    const/4 v13, 0x1

    invoke-virtual {v0, v13}, Lcom/itextpdf/io/image/TiffImageData;->setInverted(Z)V

    .line 560
    :cond_3c
    const/4 v0, 0x0

    cmpl-float v0, v18, v0

    if-eqz v0, :cond_3d

    .line 561
    iget-object v0, v3, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->image:Lcom/itextpdf/io/image/TiffImageData;

    move/from16 v1, v18

    .end local v18    # "rotation":F
    .local v1, "rotation":F
    invoke-virtual {v0, v1}, Lcom/itextpdf/io/image/TiffImageData;->setRotation(F)V

    goto :goto_26

    .line 560
    .end local v1    # "rotation":F
    .restart local v18    # "rotation":F
    :cond_3d
    move/from16 v1, v18

    .line 562
    .end local v18    # "rotation":F
    .restart local v1    # "rotation":F
    :goto_26
    if-lez v37, :cond_3e

    .line 563
    invoke-virtual/range {v25 .. v25}, Lcom/itextpdf/io/source/DeflaterOutputStream;->close()V

    .line 564
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/itextpdf/io/image/ImageDataFactory;->createRawImage([B)Lcom/itextpdf/io/image/ImageData;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/image/RawImageData;

    .line 565
    .local v0, "mimg":Lcom/itextpdf/io/image/RawImageData;
    invoke-virtual/range {v43 .. v43}, Lcom/itextpdf/io/source/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v16

    move-object/from16 v23, v14

    .end local v14    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .local v23, "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    const/4 v14, 0x1

    move-object/from16 v21, v7

    move-object/from16 v19, v12

    move v2, v15

    move/from16 v12, v28

    move/from16 v13, v29

    move v15, v5

    move-object v5, v11

    move-object v11, v0

    .end local v0    # "mimg":Lcom/itextpdf/io/image/RawImageData;
    .end local v7    # "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    .end local v28    # "w":I
    .end local v29    # "h":I
    .local v2, "dpiX":I
    .local v5, "size":[J
    .local v11, "mimg":Lcom/itextpdf/io/image/RawImageData;
    .local v12, "w":I
    .local v13, "h":I
    .local v15, "bitsPerSample":I
    .local v19, "zip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    .local v21, "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    invoke-static/range {v11 .. v16}, Lcom/itextpdf/io/image/RawImageHelper;->updateRawImageParameters(Lcom/itextpdf/io/image/RawImageData;IIII[B)V

    .line 566
    .end local v12    # "w":I
    .end local v13    # "h":I
    .restart local v28    # "w":I
    .restart local v29    # "h":I
    invoke-virtual {v11}, Lcom/itextpdf/io/image/RawImageData;->makeMask()V

    .line 567
    const/4 v13, 0x1

    invoke-virtual {v11, v13}, Lcom/itextpdf/io/image/RawImageData;->setDeflated(Z)V

    .line 568
    iget-object v0, v3, Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;->image:Lcom/itextpdf/io/image/TiffImageData;

    invoke-virtual {v0, v11}, Lcom/itextpdf/io/image/TiffImageData;->setImageMask(Lcom/itextpdf/io/image/ImageData;)V

    goto :goto_27

    .line 562
    .end local v2    # "dpiX":I
    .end local v19    # "zip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    .end local v21    # "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    .end local v23    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .local v5, "bitsPerSample":I
    .restart local v7    # "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    .local v11, "size":[J
    .local v12, "zip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    .restart local v14    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .local v15, "dpiX":I
    :cond_3e
    move-object/from16 v21, v7

    move-object/from16 v19, v12

    move-object/from16 v23, v14

    move v2, v15

    move v15, v5

    move-object v5, v11

    .line 572
    .end local v1    # "rotation":F
    .end local v4    # "compression":I
    .end local v5    # "bitsPerSample":I
    .end local v6    # "photometric":I
    .end local v7    # "g4":Lcom/itextpdf/io/codec/CCITTG4Encoder;
    .end local v8    # "dpiY":I
    .end local v9    # "rowsStrip":I
    .end local v10    # "offset":[J
    .end local v11    # "size":[J
    .end local v12    # "zip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    .end local v14    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .end local v15    # "dpiX":I
    .end local v24    # "samplePerPixel":I
    .end local v25    # "mzip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    .end local v28    # "w":I
    .end local v29    # "h":I
    .end local v36    # "fillOrderField":Lcom/itextpdf/io/codec/TIFFField;
    .end local v37    # "extraSamples":I
    .end local v38    # "reverse":Z
    .end local v41    # "fillOrder":I
    .end local v42    # "resolutionUnit":I
    .end local v43    # "mstream":Lcom/itextpdf/io/source/ByteArrayOutputStream;
    .end local v45    # "stream":Lcom/itextpdf/io/source/ByteArrayOutputStream;
    .end local v46    # "predictor":I
    .end local v48    # "rowsLeft":I
    :goto_27
    nop

    .line 573
    return-void

    .line 336
    .restart local v1    # "rotation":F
    .restart local v4    # "compression":I
    .restart local v6    # "photometric":I
    .local v15, "bitsPerSample":I
    .local v22, "predictor":I
    .restart local v23    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .restart local v24    # "samplePerPixel":I
    .restart local v37    # "extraSamples":I
    :goto_28
    const-string v2, "Bits per sample {0} is not supported."

    invoke-direct {v0, v2}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v0

    .end local p0    # "dir":Lcom/itextpdf/io/codec/TIFFDirectory;
    .end local p1    # "s":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .end local p2    # "tiff":Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;
    throw v0

    .line 291
    .end local v1    # "rotation":F
    .end local v6    # "photometric":I
    .end local v15    # "bitsPerSample":I
    .end local v24    # "samplePerPixel":I
    .end local v37    # "extraSamples":I
    .restart local p0    # "dir":Lcom/itextpdf/io/codec/TIFFDirectory;
    .restart local p1    # "s":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .restart local p2    # "tiff":Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;
    :goto_29
    const-string v1, "Compression {0} is not supported."

    invoke-direct {v0, v1}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v0

    .end local p0    # "dir":Lcom/itextpdf/io/codec/TIFFDirectory;
    .end local p1    # "s":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .end local p2    # "tiff":Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;
    throw v0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 570
    .end local v4    # "compression":I
    .end local v22    # "predictor":I
    .end local v23    # "lzwDecoder":Lcom/itextpdf/io/codec/TIFFLZWDecoder;
    .restart local p0    # "dir":Lcom/itextpdf/io/codec/TIFFDirectory;
    .restart local p1    # "s":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .restart local p2    # "tiff":Lcom/itextpdf/io/image/TiffImageHelper$TiffParameters;
    :catch_2
    move-exception v0

    .line 571
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v2, "Cannot get TIFF image color."

    invoke-direct {v1, v2}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x5 -> :sswitch_0
        0x6 -> :sswitch_0
        0x7 -> :sswitch_0
        0x8 -> :sswitch_0
        0x8005 -> :sswitch_0
        0x80b2 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch

    :sswitch_data_1
    .sparse-switch
        0x1 -> :sswitch_1
        0x2 -> :sswitch_1
        0x4 -> :sswitch_1
        0x8 -> :sswitch_1
    .end sparse-switch

    :sswitch_data_2
    .sparse-switch
        0x1 -> :sswitch_5
        0x5 -> :sswitch_4
        0x8 -> :sswitch_3
        0x8005 -> :sswitch_2
        0x80b2 -> :sswitch_3
    .end sparse-switch
.end method
