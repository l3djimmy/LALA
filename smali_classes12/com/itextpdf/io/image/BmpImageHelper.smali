.class final Lcom/itextpdf/io/image/BmpImageHelper;
.super Ljava/lang/Object;
.source "BmpImageHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;
    }
.end annotation


# static fields
.field private static final BI_BITFIELDS:I = 0x3

.field private static final BI_RGB:I = 0x0

.field private static final BI_RLE4:I = 0x2

.field private static final BI_RLE8:I = 0x1

.field private static final LCS_CALIBRATED_RGB:I = 0x0

.field private static final LCS_CMYK:I = 0x2

.field private static final LCS_SRGB:I = 0x1

.field private static final VERSION_2_1_BIT:I = 0x0

.field private static final VERSION_2_24_BIT:I = 0x3

.field private static final VERSION_2_4_BIT:I = 0x1

.field private static final VERSION_2_8_BIT:I = 0x2

.field private static final VERSION_3_1_BIT:I = 0x4

.field private static final VERSION_3_24_BIT:I = 0x7

.field private static final VERSION_3_4_BIT:I = 0x5

.field private static final VERSION_3_8_BIT:I = 0x6

.field private static final VERSION_3_NT_16_BIT:I = 0x8

.field private static final VERSION_3_NT_32_BIT:I = 0x9

.field private static final VERSION_4_16_BIT:I = 0xd

.field private static final VERSION_4_1_BIT:I = 0xa

.field private static final VERSION_4_24_BIT:I = 0xe

.field private static final VERSION_4_32_BIT:I = 0xf

.field private static final VERSION_4_4_BIT:I = 0xb

.field private static final VERSION_4_8_BIT:I = 0xc


# direct methods
.method constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static decodeRLE(Z[BLcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)[B
    .locals 11
    .param p0, "is8"    # Z
    .param p1, "values"    # [B
    .param p2, "bmp"    # Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;

    .line 1042
    iget v0, p2, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    iget v1, p2, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    mul-int/2addr v0, v1

    new-array v0, v0, [B

    .line 1044
    .local v0, "val":[B
    const/4 v1, 0x0

    .line 1045
    .local v1, "ptr":I
    const/4 v2, 0x0

    .line 1046
    .local v2, "x":I
    const/4 v3, 0x0

    .line 1047
    .local v3, "q":I
    const/4 v4, 0x0

    .local v4, "y":I
    :goto_0
    :try_start_0
    iget v5, p2, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    if-ge v4, v5, :cond_e

    array-length v5, p1

    if-ge v1, v5, :cond_e

    .line 1048
    add-int/lit8 v5, v1, 0x1

    .end local v1    # "ptr":I
    .local v5, "ptr":I
    aget-byte v1, p1, v1

    and-int/lit16 v1, v1, 0xff

    .line 1049
    .local v1, "count":I
    const/4 v6, 0x1

    if-eqz v1, :cond_4

    .line 1051
    add-int/lit8 v7, v5, 0x1

    .end local v5    # "ptr":I
    .local v7, "ptr":I
    aget-byte v5, p1, v5

    and-int/lit16 v5, v5, 0xff

    .line 1052
    .local v5, "bt":I
    if-eqz p0, :cond_1

    .line 1053
    move v6, v1

    .local v6, "i":I
    :goto_1
    if-eqz v6, :cond_0

    .line 1054
    add-int/lit8 v8, v3, 0x1

    .end local v3    # "q":I
    .local v8, "q":I
    int-to-byte v9, v5

    aput-byte v9, v0, v3

    .line 1053
    add-int/lit8 v6, v6, -0x1

    move v3, v8

    goto :goto_1

    .end local v6    # "i":I
    .end local v8    # "q":I
    .restart local v3    # "q":I
    :cond_0
    goto :goto_4

    .line 1057
    :cond_1
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_2
    if-ge v8, v1, :cond_3

    .line 1058
    add-int/lit8 v9, v3, 0x1

    .end local v3    # "q":I
    .local v9, "q":I
    and-int/lit8 v10, v8, 0x1

    if-ne v10, v6, :cond_2

    and-int/lit8 v10, v5, 0xf

    goto :goto_3

    :cond_2
    ushr-int/lit8 v10, v5, 0x4

    and-int/lit8 v10, v10, 0xf

    :goto_3
    int-to-byte v10, v10

    aput-byte v10, v0, v3

    .line 1057
    add-int/lit8 v8, v8, 0x1

    move v3, v9

    goto :goto_2

    .line 1061
    .end local v8    # "i":I
    .end local v9    # "q":I
    .restart local v3    # "q":I
    :cond_3
    :goto_4
    add-int/2addr v2, v1

    .line 1062
    .end local v5    # "bt":I
    move v1, v7

    goto/16 :goto_a

    .line 1064
    .end local v7    # "ptr":I
    .local v5, "ptr":I
    :cond_4
    add-int/lit8 v7, v5, 0x1

    .end local v5    # "ptr":I
    .restart local v7    # "ptr":I
    aget-byte v5, p1, v5

    and-int/lit16 v1, v5, 0xff

    .line 1065
    if-ne v1, v6, :cond_5

    .line 1066
    goto/16 :goto_b

    .line 1067
    :cond_5
    packed-switch v1, :pswitch_data_0

    .line 1081
    :pswitch_0
    if-eqz p0, :cond_7

    .line 1082
    move v5, v1

    .local v5, "i":I
    goto :goto_5

    .line 1075
    .end local v5    # "i":I
    :pswitch_1
    add-int/lit8 v5, v7, 0x1

    .end local v7    # "ptr":I
    .local v5, "ptr":I
    aget-byte v6, p1, v7

    and-int/lit16 v6, v6, 0xff

    add-int/2addr v2, v6

    .line 1076
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "ptr":I
    .local v6, "ptr":I
    aget-byte v5, p1, v5

    and-int/lit16 v5, v5, 0xff

    add-int/2addr v4, v5

    .line 1077
    iget v5, p2, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    mul-int/2addr v5, v4

    add-int/2addr v5, v2

    .line 1078
    .end local v3    # "q":I
    .local v5, "q":I
    move v3, v5

    move v1, v6

    goto/16 :goto_a

    .line 1069
    .end local v5    # "q":I
    .end local v6    # "ptr":I
    .restart local v3    # "q":I
    .restart local v7    # "ptr":I
    :pswitch_2
    const/4 v2, 0x0

    .line 1070
    add-int/lit8 v4, v4, 0x1

    .line 1071
    iget v5, p2, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    mul-int/2addr v5, v4

    .line 1072
    .end local v3    # "q":I
    .restart local v5    # "q":I
    move v3, v5

    move v1, v7

    goto :goto_a

    .line 1082
    .restart local v3    # "q":I
    .local v5, "i":I
    :goto_5
    if-eqz v5, :cond_6

    .line 1083
    add-int/lit8 v8, v3, 0x1

    .end local v3    # "q":I
    .local v8, "q":I
    add-int/lit8 v9, v7, 0x1

    .end local v7    # "ptr":I
    .local v9, "ptr":I
    aget-byte v7, p1, v7

    and-int/lit16 v7, v7, 0xff

    int-to-byte v7, v7

    aput-byte v7, v0, v3

    .line 1082
    add-int/lit8 v5, v5, -0x1

    move v3, v8

    move v7, v9

    goto :goto_5

    .end local v5    # "i":I
    .end local v8    # "q":I
    .end local v9    # "ptr":I
    .restart local v3    # "q":I
    .restart local v7    # "ptr":I
    :cond_6
    goto :goto_8

    .line 1085
    :cond_7
    const/4 v5, 0x0

    .line 1086
    .local v5, "bt":I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_6
    if-ge v8, v1, :cond_a

    .line 1087
    and-int/lit8 v9, v8, 0x1

    if-nez v9, :cond_8

    .line 1088
    add-int/lit8 v9, v7, 0x1

    .end local v7    # "ptr":I
    .restart local v9    # "ptr":I
    aget-byte v7, p1, v7

    and-int/lit16 v5, v7, 0xff

    move v7, v9

    .line 1089
    .end local v9    # "ptr":I
    .restart local v7    # "ptr":I
    :cond_8
    add-int/lit8 v9, v3, 0x1

    .end local v3    # "q":I
    .local v9, "q":I
    and-int/lit8 v10, v8, 0x1

    if-ne v10, v6, :cond_9

    and-int/lit8 v10, v5, 0xf

    goto :goto_7

    :cond_9
    ushr-int/lit8 v10, v5, 0x4

    and-int/lit8 v10, v10, 0xf

    :goto_7
    int-to-byte v10, v10

    aput-byte v10, v0, v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1086
    add-int/lit8 v8, v8, 0x1

    move v3, v9

    goto :goto_6

    .line 1092
    .end local v5    # "bt":I
    .end local v8    # "i":I
    .end local v9    # "q":I
    .restart local v3    # "q":I
    :cond_a
    :goto_8
    add-int/2addr v2, v1

    .line 1094
    if-eqz p0, :cond_b

    .line 1095
    and-int/lit8 v5, v1, 0x1

    if-ne v5, v6, :cond_c

    .line 1096
    add-int/lit8 v7, v7, 0x1

    move v1, v7

    goto :goto_a

    .line 1098
    :cond_b
    and-int/lit8 v5, v1, 0x3

    if-eq v5, v6, :cond_d

    and-int/lit8 v5, v1, 0x3

    const/4 v6, 0x2

    if-ne v5, v6, :cond_c

    goto :goto_9

    .line 1104
    .end local v1    # "count":I
    :cond_c
    move v1, v7

    goto :goto_a

    .line 1099
    .restart local v1    # "count":I
    :cond_d
    :goto_9
    add-int/lit8 v7, v7, 0x1

    move v1, v7

    .line 1104
    .end local v7    # "ptr":I
    .local v1, "ptr":I
    :goto_a
    goto/16 :goto_0

    .line 1107
    .end local v1    # "ptr":I
    .end local v2    # "x":I
    .end local v3    # "q":I
    .end local v4    # "y":I
    :cond_e
    :goto_b
    goto :goto_c

    .line 1105
    :catch_0
    move-exception v1

    .line 1109
    :goto_c
    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private static findMask(I)I
    .locals 3
    .param p0, "mask"    # I

    .line 868
    const/4 v0, 0x0

    .line 869
    .local v0, "k":I
    :goto_0
    const/16 v1, 0x20

    if-ge v0, v1, :cond_1

    .line 870
    and-int/lit8 v1, p0, 0x1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 871
    goto :goto_1

    .line 872
    :cond_0
    ushr-int/lit8 p0, p0, 0x1

    .line 869
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 874
    :cond_1
    :goto_1
    return p0
.end method

.method private static findShift(I)I
    .locals 3
    .param p0, "mask"    # I

    .line 878
    const/4 v0, 0x0

    .line 879
    .local v0, "k":I
    :goto_0
    const/16 v1, 0x20

    if-ge v0, v1, :cond_1

    .line 880
    and-int/lit8 v1, p0, 0x1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 881
    goto :goto_1

    .line 882
    :cond_0
    ushr-int/lit8 p0, p0, 0x1

    .line 879
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 884
    :cond_1
    :goto_1
    return v0
.end method

.method private static getImage(Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)Z
    .locals 12
    .param p0, "bmp"    # Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 545
    iget v0, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->imageType:I

    const/4 v1, 0x0

    const-string v2, "Invalid BMP file compression."

    const/4 v3, 0x4

    const/4 v4, 0x3

    const/4 v5, 0x1

    packed-switch v0, :pswitch_data_0

    .line 643
    return v1

    .line 640
    :pswitch_0
    invoke-static {v5, p0}, Lcom/itextpdf/io/image/BmpImageHelper;->read1632Bit(ZLcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V

    .line 641
    return v5

    .line 635
    :pswitch_1
    iget v0, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    iget v1, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    mul-int/2addr v0, v1

    mul-int/2addr v0, v4

    new-array v11, v0, [B

    .line 636
    .local v11, "bdata":[B
    invoke-static {v11, p0}, Lcom/itextpdf/io/image/BmpImageHelper;->read24Bit([BLcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V

    .line 637
    iget-object v6, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->image:Lcom/itextpdf/io/image/BmpImageData;

    iget v7, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    iget v8, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    const/4 v9, 0x3

    const/16 v10, 0x8

    invoke-static/range {v6 .. v11}, Lcom/itextpdf/io/image/RawImageHelper;->updateRawImageParameters(Lcom/itextpdf/io/image/RawImageData;IIII[B)V

    .line 638
    return v5

    .line 632
    .end local v11    # "bdata":[B
    :pswitch_2
    invoke-static {v1, p0}, Lcom/itextpdf/io/image/BmpImageHelper;->read1632Bit(ZLcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V

    .line 633
    return v5

    .line 620
    :pswitch_3
    iget-wide v0, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->compression:J

    long-to-int v0, v0

    packed-switch v0, :pswitch_data_1

    .line 628
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    invoke-direct {v0, v2}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 625
    :pswitch_4
    invoke-static {p0}, Lcom/itextpdf/io/image/BmpImageHelper;->readRLE8(Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V

    .line 626
    goto :goto_0

    .line 622
    :pswitch_5
    invoke-static {v3, p0}, Lcom/itextpdf/io/image/BmpImageHelper;->read8Bit(ILcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V

    .line 623
    nop

    .line 630
    :goto_0
    return v5

    .line 608
    :pswitch_6
    iget-wide v0, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->compression:J

    long-to-int v0, v0

    packed-switch v0, :pswitch_data_2

    .line 616
    :pswitch_7
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    invoke-direct {v0, v2}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 613
    :pswitch_8
    invoke-static {p0}, Lcom/itextpdf/io/image/BmpImageHelper;->readRLE4(Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V

    .line 614
    goto :goto_1

    .line 610
    :pswitch_9
    invoke-static {v3, p0}, Lcom/itextpdf/io/image/BmpImageHelper;->read4Bit(ILcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V

    .line 611
    nop

    .line 618
    :goto_1
    return v5

    .line 605
    :pswitch_a
    invoke-static {v3, p0}, Lcom/itextpdf/io/image/BmpImageHelper;->read1Bit(ILcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V

    .line 606
    return v5

    .line 602
    :pswitch_b
    invoke-static {v5, p0}, Lcom/itextpdf/io/image/BmpImageHelper;->read1632Bit(ZLcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V

    .line 603
    return v5

    .line 599
    :pswitch_c
    invoke-static {v1, p0}, Lcom/itextpdf/io/image/BmpImageHelper;->read1632Bit(ZLcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V

    .line 600
    return v5

    .line 594
    :pswitch_d
    iget v0, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    iget v1, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    mul-int/2addr v0, v1

    mul-int/2addr v0, v4

    new-array v11, v0, [B

    .line 595
    .restart local v11    # "bdata":[B
    invoke-static {v11, p0}, Lcom/itextpdf/io/image/BmpImageHelper;->read24Bit([BLcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V

    .line 596
    iget-object v6, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->image:Lcom/itextpdf/io/image/BmpImageData;

    iget v7, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    iget v8, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    const/4 v9, 0x3

    const/16 v10, 0x8

    invoke-static/range {v6 .. v11}, Lcom/itextpdf/io/image/RawImageHelper;->updateRawImageParameters(Lcom/itextpdf/io/image/RawImageData;IIII[B)V

    .line 597
    return v5

    .line 581
    .end local v11    # "bdata":[B
    :pswitch_e
    iget-wide v0, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->compression:J

    long-to-int v0, v0

    packed-switch v0, :pswitch_data_3

    .line 589
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    invoke-direct {v0, v2}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 586
    :pswitch_f
    invoke-static {p0}, Lcom/itextpdf/io/image/BmpImageHelper;->readRLE8(Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V

    .line 587
    goto :goto_2

    .line 583
    :pswitch_10
    invoke-static {v3, p0}, Lcom/itextpdf/io/image/BmpImageHelper;->read8Bit(ILcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V

    .line 584
    nop

    .line 591
    :goto_2
    return v5

    .line 569
    :pswitch_11
    iget-wide v0, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->compression:J

    long-to-int v0, v0

    packed-switch v0, :pswitch_data_4

    .line 577
    :pswitch_12
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    invoke-direct {v0, v2}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 574
    :pswitch_13
    invoke-static {p0}, Lcom/itextpdf/io/image/BmpImageHelper;->readRLE4(Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V

    .line 575
    goto :goto_3

    .line 571
    :pswitch_14
    invoke-static {v3, p0}, Lcom/itextpdf/io/image/BmpImageHelper;->read4Bit(ILcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V

    .line 572
    nop

    .line 579
    :goto_3
    return v5

    .line 566
    :pswitch_15
    invoke-static {v3, p0}, Lcom/itextpdf/io/image/BmpImageHelper;->read1Bit(ILcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V

    .line 567
    return v5

    .line 560
    :pswitch_16
    iget v0, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    iget v1, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    mul-int/2addr v0, v1

    mul-int/2addr v0, v4

    new-array v11, v0, [B

    .line 561
    .restart local v11    # "bdata":[B
    invoke-static {v11, p0}, Lcom/itextpdf/io/image/BmpImageHelper;->read24Bit([BLcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V

    .line 562
    iget-object v6, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->image:Lcom/itextpdf/io/image/BmpImageData;

    iget v7, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    iget v8, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    const/4 v9, 0x3

    const/16 v10, 0x8

    invoke-static/range {v6 .. v11}, Lcom/itextpdf/io/image/RawImageHelper;->updateRawImageParameters(Lcom/itextpdf/io/image/RawImageData;IIII[B)V

    .line 563
    return v5

    .line 556
    .end local v11    # "bdata":[B
    :pswitch_17
    invoke-static {v4, p0}, Lcom/itextpdf/io/image/BmpImageHelper;->read8Bit(ILcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V

    .line 557
    return v5

    .line 552
    :pswitch_18
    invoke-static {v4, p0}, Lcom/itextpdf/io/image/BmpImageHelper;->read4Bit(ILcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V

    .line 553
    return v5

    .line 548
    :pswitch_19
    invoke-static {v4, p0}, Lcom/itextpdf/io/image/BmpImageHelper;->read1Bit(ILcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V

    .line 549
    return v5

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_11
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_6
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x0
        :pswitch_9
        :pswitch_7
        :pswitch_8
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x0
        :pswitch_10
        :pswitch_f
    .end packed-switch

    :pswitch_data_4
    .packed-switch 0x0
        :pswitch_14
        :pswitch_12
        :pswitch_13
    .end packed-switch
.end method

.method private static getPalette(ILcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)[B
    .locals 8
    .param p0, "group"    # I
    .param p1, "bmp"    # Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;

    .line 520
    iget-object v0, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->palette:[B

    if-nez v0, :cond_0

    .line 521
    const/4 v0, 0x0

    return-object v0

    .line 522
    :cond_0
    iget-object v0, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->palette:[B

    array-length v0, v0

    div-int/2addr v0, p0

    mul-int/lit8 v0, v0, 0x3

    new-array v0, v0, [B

    .line 523
    .local v0, "np":[B
    iget-object v1, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->palette:[B

    array-length v1, v1

    div-int/2addr v1, p0

    .line 524
    .local v1, "e":I
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_0
    if-ge v2, v1, :cond_1

    .line 525
    mul-int v3, v2, p0

    .line 526
    .local v3, "src":I
    mul-int/lit8 v4, v2, 0x3

    .line 527
    .local v4, "dest":I
    add-int/lit8 v5, v4, 0x2

    iget-object v6, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->palette:[B

    add-int/lit8 v7, v3, 0x1

    .end local v3    # "src":I
    .local v7, "src":I
    aget-byte v3, v6, v3

    aput-byte v3, v0, v5

    .line 528
    add-int/lit8 v3, v4, 0x1

    iget-object v5, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->palette:[B

    add-int/lit8 v6, v7, 0x1

    .end local v7    # "src":I
    .local v6, "src":I
    aget-byte v5, v5, v7

    aput-byte v5, v0, v3

    .line 529
    iget-object v3, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->palette:[B

    aget-byte v3, v3, v6

    aput-byte v3, v0, v4

    .line 524
    .end local v4    # "dest":I
    .end local v6    # "src":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 531
    .end local v2    # "k":I
    :cond_1
    return-object v0
.end method

.method private static indexedModel([BIILcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V
    .locals 6
    .param p0, "bdata"    # [B
    .param p1, "bpc"    # I
    .param p2, "paletteEntries"    # I
    .param p3, "bmp"    # Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;

    .line 647
    iget-object v0, p3, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->image:Lcom/itextpdf/io/image/BmpImageData;

    iget v1, p3, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    iget v2, p3, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    const/4 v3, 0x1

    move-object v5, p0

    move v4, p1

    .end local p0    # "bdata":[B
    .end local p1    # "bpc":I
    .local v4, "bpc":I
    .local v5, "bdata":[B
    invoke-static/range {v0 .. v5}, Lcom/itextpdf/io/image/RawImageHelper;->updateRawImageParameters(Lcom/itextpdf/io/image/RawImageData;IIII[B)V

    .line 648
    const/4 p0, 0x4

    new-array p0, p0, [Ljava/lang/Object;

    .line 649
    .local p0, "colorSpace":[Ljava/lang/Object;
    const/4 p1, 0x0

    const-string v0, "/Indexed"

    aput-object v0, p0, p1

    .line 650
    const-string p1, "/DeviceRGB"

    const/4 v0, 0x1

    aput-object p1, p0, v0

    .line 651
    invoke-static {p2, p3}, Lcom/itextpdf/io/image/BmpImageHelper;->getPalette(ILcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)[B

    move-result-object p1

    .line 652
    .local p1, "np":[B
    array-length v1, p1

    .line 653
    .local v1, "len":I
    div-int/lit8 v2, v1, 0x3

    sub-int/2addr v2, v0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v2, 0x2

    aput-object v0, p0, v2

    .line 654
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/itextpdf/io/font/PdfEncodings;->convertToString([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x3

    aput-object v0, p0, v2

    .line 655
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p3, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->additional:Ljava/util/Map;

    .line 656
    iget-object v0, p3, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->additional:Ljava/util/Map;

    const-string v2, "ColorSpace"

    invoke-interface {v0, v2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 657
    return-void
.end method

.method private static process(Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;Ljava/io/InputStream;)V
    .locals 38
    .param p0, "bmp"    # Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;
    .param p1, "stream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 125
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iput-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    .line 126
    iget-object v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->image:Lcom/itextpdf/io/image/BmpImageData;

    invoke-virtual {v2}, Lcom/itextpdf/io/image/BmpImageData;->isNoHeader()Z

    move-result v2

    if-nez v2, :cond_1

    .line 128
    iget-object v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v2}, Lcom/itextpdf/io/image/BmpImageHelper;->readUnsignedByte(Ljava/io/InputStream;)I

    move-result v2

    const/16 v3, 0x42

    if-ne v2, v3, :cond_0

    iget-object v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    .line 129
    invoke-static {v2}, Lcom/itextpdf/io/image/BmpImageHelper;->readUnsignedByte(Ljava/io/InputStream;)I

    move-result v2

    const/16 v3, 0x4d

    if-ne v2, v3, :cond_0

    .line 134
    iget-object v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v2}, Lcom/itextpdf/io/image/BmpImageHelper;->readDWord(Ljava/io/InputStream;)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitmapFileSize:J

    .line 137
    iget-object v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v2}, Lcom/itextpdf/io/image/BmpImageHelper;->readWord(Ljava/io/InputStream;)I

    .line 138
    iget-object v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v2}, Lcom/itextpdf/io/image/BmpImageHelper;->readWord(Ljava/io/InputStream;)I

    .line 141
    iget-object v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v2}, Lcom/itextpdf/io/image/BmpImageHelper;->readDWord(Ljava/io/InputStream;)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitmapOffset:J

    goto :goto_0

    .line 130
    :cond_0
    new-instance v2, Lcom/itextpdf/io/exceptions/IOException;

    const-string v3, "Invalid magic value for bmp file. Must be \'BM\'"

    invoke-direct {v2, v3}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 146
    :cond_1
    :goto_0
    iget-object v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v2}, Lcom/itextpdf/io/image/BmpImageHelper;->readDWord(Ljava/io/InputStream;)J

    move-result-wide v2

    .line 148
    .local v2, "size":J
    const-wide/16 v4, 0xc

    cmp-long v6, v2, v4

    if-nez v6, :cond_2

    .line 149
    iget-object v6, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v6}, Lcom/itextpdf/io/image/BmpImageHelper;->readWord(Ljava/io/InputStream;)I

    move-result v6

    iput v6, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    .line 150
    iget-object v6, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v6}, Lcom/itextpdf/io/image/BmpImageHelper;->readWord(Ljava/io/InputStream;)I

    move-result v6

    iput v6, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    goto :goto_1

    .line 152
    :cond_2
    iget-object v6, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v6}, Lcom/itextpdf/io/image/BmpImageHelper;->readLong(Ljava/io/InputStream;)I

    move-result v6

    iput v6, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    .line 153
    iget-object v6, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v6}, Lcom/itextpdf/io/image/BmpImageHelper;->readLong(Ljava/io/InputStream;)I

    move-result v6

    iput v6, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    .line 156
    :goto_1
    iget-object v6, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v6}, Lcom/itextpdf/io/image/BmpImageHelper;->readWord(Ljava/io/InputStream;)I

    move-result v6

    .line 157
    .local v6, "planes":I
    iget-object v7, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v7}, Lcom/itextpdf/io/image/BmpImageHelper;->readWord(Ljava/io/InputStream;)I

    move-result v7

    iput v7, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitsPerPixel:I

    .line 159
    iget-object v7, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    const-string v8, "color_planes"

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v7, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    iget-object v7, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    iget v8, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitsPerPixel:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const-string v9, "bits_per_pixel"

    invoke-interface {v7, v9, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    const/4 v7, 0x3

    iput v7, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->numBands:I

    .line 165
    iget-wide v8, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitmapOffset:J

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-nez v8, :cond_3

    .line 166
    iput-wide v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitmapOffset:J

    .line 167
    :cond_3
    cmp-long v4, v2, v4

    const/4 v5, 0x0

    const/16 v8, 0x18

    const/4 v14, 0x2

    move-wide/from16 v16, v10

    const-string v10, "bmp_version"

    const/16 v11, 0x8

    const-wide/16 v18, 0xe

    const/4 v12, 0x1

    const/4 v13, 0x4

    if-nez v4, :cond_9

    .line 169
    iget-object v4, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    const-string v9, "BMP v. 2.x"

    invoke-interface {v4, v10, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    iget v4, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitsPerPixel:I

    if-ne v4, v12, :cond_4

    .line 173
    iput v5, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->imageType:I

    goto :goto_2

    .line 174
    :cond_4
    iget v4, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitsPerPixel:I

    if-ne v4, v13, :cond_5

    .line 175
    iput v12, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->imageType:I

    goto :goto_2

    .line 176
    :cond_5
    iget v4, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitsPerPixel:I

    if-ne v4, v11, :cond_6

    .line 177
    iput v14, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->imageType:I

    goto :goto_2

    .line 178
    :cond_6
    iget v4, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitsPerPixel:I

    if-ne v4, v8, :cond_7

    .line 179
    iput v7, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->imageType:I

    .line 183
    :cond_7
    :goto_2
    iget-wide v8, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitmapOffset:J

    sub-long v8, v8, v18

    sub-long/2addr v8, v2

    const-wide/16 v16, 0x3

    div-long v8, v8, v16

    long-to-int v4, v8

    .line 184
    .local v4, "numberOfEntries":I
    mul-int/lit8 v8, v4, 0x3

    .line 185
    .local v8, "sizeOfPalette":I
    iget-wide v9, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitmapOffset:J

    cmp-long v9, v9, v2

    if-nez v9, :cond_8

    .line 186
    iget v9, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->imageType:I

    packed-switch v9, :pswitch_data_0

    goto :goto_3

    .line 197
    :pswitch_0
    const/4 v8, 0x0

    goto :goto_3

    .line 194
    :pswitch_1
    const/16 v8, 0x300

    .line 195
    goto :goto_3

    .line 191
    :pswitch_2
    const/16 v8, 0x30

    .line 192
    goto :goto_3

    .line 188
    :pswitch_3
    const/4 v8, 0x6

    .line 189
    nop

    .line 200
    :goto_3
    int-to-long v9, v8

    add-long/2addr v9, v2

    iput-wide v9, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitmapOffset:J

    .line 202
    :cond_8
    invoke-static {v8, v0}, Lcom/itextpdf/io/image/BmpImageHelper;->readPalette(ILcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V

    .line 203
    .end local v4    # "numberOfEntries":I
    .end local v8    # "sizeOfPalette":I
    move-wide/from16 v36, v2

    move v9, v6

    goto/16 :goto_12

    .line 204
    :cond_9
    iget-object v4, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    move v9, v6

    .end local v6    # "planes":I
    .local v9, "planes":I
    invoke-static {v4}, Lcom/itextpdf/io/image/BmpImageHelper;->readDWord(Ljava/io/InputStream;)J

    move-result-wide v5

    iput-wide v5, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->compression:J

    .line 205
    iget-object v4, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v4}, Lcom/itextpdf/io/image/BmpImageHelper;->readDWord(Ljava/io/InputStream;)J

    move-result-wide v4

    iput-wide v4, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->imageSize:J

    .line 206
    iget-object v4, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v4}, Lcom/itextpdf/io/image/BmpImageHelper;->readLong(Ljava/io/InputStream;)I

    move-result v4

    int-to-long v4, v4

    iput-wide v4, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->xPelsPerMeter:J

    .line 207
    iget-object v4, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v4}, Lcom/itextpdf/io/image/BmpImageHelper;->readLong(Ljava/io/InputStream;)I

    move-result v4

    int-to-long v4, v4

    iput-wide v4, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->yPelsPerMeter:J

    .line 208
    iget-object v4, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v4}, Lcom/itextpdf/io/image/BmpImageHelper;->readDWord(Ljava/io/InputStream;)J

    move-result-wide v4

    .line 209
    .local v4, "colorsUsed":J
    iget-object v6, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v6}, Lcom/itextpdf/io/image/BmpImageHelper;->readDWord(Ljava/io/InputStream;)J

    move-result-wide v20

    .line 211
    .local v20, "colorsImportant":J
    iget-wide v7, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->compression:J

    long-to-int v7, v7

    const-string v8, "compression"

    packed-switch v7, :pswitch_data_1

    goto :goto_4

    .line 225
    :pswitch_4
    iget-object v7, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    const-string v6, "BI_BITFIELDS"

    invoke-interface {v7, v8, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    .line 221
    :pswitch_5
    iget-object v6, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    const-string v7, "BI_RLE4"

    invoke-interface {v6, v8, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 222
    goto :goto_4

    .line 217
    :pswitch_6
    iget-object v6, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    const-string v7, "BI_RLE8"

    invoke-interface {v6, v8, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 218
    goto :goto_4

    .line 213
    :pswitch_7
    iget-object v6, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    const-string v7, "BI_RGB"

    invoke-interface {v6, v8, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 214
    nop

    .line 229
    :goto_4
    iget-object v6, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    iget-wide v7, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->xPelsPerMeter:J

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    const-string/jumbo v8, "x_pixels_per_meter"

    invoke-interface {v6, v8, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    iget-object v6, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    iget-wide v7, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->yPelsPerMeter:J

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    const-string/jumbo v8, "y_pixels_per_meter"

    invoke-interface {v6, v8, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    iget-object v6, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    const-string v7, "colors_used"

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 232
    iget-object v6, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    const-string v7, "colors_important"

    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 234
    const-wide/16 v6, 0x28

    cmp-long v6, v2, v6

    const-wide/16 v22, 0x34

    const-string v7, "alpha_mask"

    const-wide/16 v24, 0x38

    const-string v8, "blue_mask"

    const-string v14, "green_mask"

    const-string/jumbo v15, "red_mask"

    if-eqz v6, :cond_16

    cmp-long v6, v2, v22

    if-eqz v6, :cond_16

    cmp-long v6, v2, v24

    if-nez v6, :cond_a

    move-wide/from16 v36, v2

    goto/16 :goto_b

    .line 344
    :cond_a
    const-wide/16 v22, 0x6c

    cmp-long v6, v2, v22

    const-string v11, "Not implemented yet."

    if-nez v6, :cond_15

    .line 347
    iget-object v6, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    const-string v13, "BMP v. 4.x"

    invoke-interface {v6, v10, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 350
    iget-object v6, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v6}, Lcom/itextpdf/io/image/BmpImageHelper;->readDWord(Ljava/io/InputStream;)J

    move-result-wide v12

    long-to-int v6, v12

    iput v6, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->redMask:I

    .line 351
    iget-object v6, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v6}, Lcom/itextpdf/io/image/BmpImageHelper;->readDWord(Ljava/io/InputStream;)J

    move-result-wide v12

    long-to-int v6, v12

    iput v6, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->greenMask:I

    .line 352
    iget-object v6, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v6}, Lcom/itextpdf/io/image/BmpImageHelper;->readDWord(Ljava/io/InputStream;)J

    move-result-wide v12

    long-to-int v6, v12

    iput v6, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->blueMask:I

    .line 354
    iget-object v6, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v6}, Lcom/itextpdf/io/image/BmpImageHelper;->readDWord(Ljava/io/InputStream;)J

    move-result-wide v12

    long-to-int v6, v12

    iput v6, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->alphaMask:I

    .line 355
    iget-object v6, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v6}, Lcom/itextpdf/io/image/BmpImageHelper;->readDWord(Ljava/io/InputStream;)J

    move-result-wide v12

    .line 356
    .local v12, "csType":J
    iget-object v6, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v6}, Lcom/itextpdf/io/image/BmpImageHelper;->readLong(Ljava/io/InputStream;)I

    move-result v6

    .line 357
    .local v6, "redX":I
    iget-object v10, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v10}, Lcom/itextpdf/io/image/BmpImageHelper;->readLong(Ljava/io/InputStream;)I

    move-result v10

    .line 358
    .local v10, "redY":I
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v1}, Lcom/itextpdf/io/image/BmpImageHelper;->readLong(Ljava/io/InputStream;)I

    move-result v1

    .line 359
    .local v1, "redZ":I
    move/from16 v22, v1

    .end local v1    # "redZ":I
    .local v22, "redZ":I
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v1}, Lcom/itextpdf/io/image/BmpImageHelper;->readLong(Ljava/io/InputStream;)I

    move-result v1

    .line 360
    .local v1, "greenX":I
    move/from16 v23, v1

    .end local v1    # "greenX":I
    .local v23, "greenX":I
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v1}, Lcom/itextpdf/io/image/BmpImageHelper;->readLong(Ljava/io/InputStream;)I

    move-result v1

    .line 361
    .local v1, "greenY":I
    move/from16 v24, v1

    .end local v1    # "greenY":I
    .local v24, "greenY":I
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v1}, Lcom/itextpdf/io/image/BmpImageHelper;->readLong(Ljava/io/InputStream;)I

    move-result v1

    .line 362
    .local v1, "greenZ":I
    move/from16 v25, v1

    .end local v1    # "greenZ":I
    .local v25, "greenZ":I
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v1}, Lcom/itextpdf/io/image/BmpImageHelper;->readLong(Ljava/io/InputStream;)I

    move-result v1

    .line 363
    .local v1, "blueX":I
    move/from16 v27, v1

    .end local v1    # "blueX":I
    .local v27, "blueX":I
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v1}, Lcom/itextpdf/io/image/BmpImageHelper;->readLong(Ljava/io/InputStream;)I

    move-result v1

    .line 364
    .local v1, "blueY":I
    move/from16 v28, v1

    .end local v1    # "blueY":I
    .local v28, "blueY":I
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v1}, Lcom/itextpdf/io/image/BmpImageHelper;->readLong(Ljava/io/InputStream;)I

    move-result v1

    .line 365
    .local v1, "blueZ":I
    move/from16 v29, v1

    .end local v1    # "blueZ":I
    .local v29, "blueZ":I
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v1}, Lcom/itextpdf/io/image/BmpImageHelper;->readDWord(Ljava/io/InputStream;)J

    move-result-wide v30

    .line 366
    .local v30, "gammaRed":J
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v1}, Lcom/itextpdf/io/image/BmpImageHelper;->readDWord(Ljava/io/InputStream;)J

    move-result-wide v32

    .line 367
    .local v32, "gammaGreen":J
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v1}, Lcom/itextpdf/io/image/BmpImageHelper;->readDWord(Ljava/io/InputStream;)J

    move-result-wide v34

    .line 369
    .local v34, "gammaBlue":J
    iget v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitsPerPixel:I

    move-wide/from16 v36, v2

    const/4 v2, 0x1

    .end local v2    # "size":J
    .local v36, "size":J
    if-ne v1, v2, :cond_b

    .line 370
    const/16 v1, 0xa

    iput v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->imageType:I

    goto :goto_5

    .line 371
    :cond_b
    iget v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitsPerPixel:I

    const/4 v2, 0x4

    if-ne v1, v2, :cond_c

    .line 372
    const/16 v1, 0xb

    iput v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->imageType:I

    goto :goto_5

    .line 373
    :cond_c
    iget v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitsPerPixel:I

    const/16 v2, 0x8

    if-ne v1, v2, :cond_d

    .line 374
    const/16 v1, 0xc

    iput v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->imageType:I

    goto :goto_5

    .line 375
    :cond_d
    iget v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitsPerPixel:I

    const/16 v2, 0x10

    if-ne v1, v2, :cond_e

    .line 376
    const/16 v1, 0xd

    iput v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->imageType:I

    .line 377
    iget-wide v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->compression:J

    long-to-int v1, v1

    if-nez v1, :cond_10

    .line 378
    const/16 v1, 0x7c00

    iput v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->redMask:I

    .line 379
    const/16 v1, 0x3e0

    iput v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->greenMask:I

    .line 380
    const/16 v1, 0x1f

    iput v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->blueMask:I

    goto :goto_5

    .line 382
    :cond_e
    iget v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitsPerPixel:I

    const/16 v2, 0x18

    if-ne v1, v2, :cond_f

    .line 383
    const/16 v1, 0xe

    iput v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->imageType:I

    goto :goto_5

    .line 384
    :cond_f
    iget v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitsPerPixel:I

    const/16 v2, 0x20

    if-ne v1, v2, :cond_10

    .line 385
    const/16 v1, 0xf

    iput v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->imageType:I

    .line 386
    iget-wide v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->compression:J

    long-to-int v1, v1

    if-nez v1, :cond_10

    .line 387
    const/high16 v1, 0xff0000

    iput v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->redMask:I

    .line 388
    const v1, 0xff00

    iput v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->greenMask:I

    .line 389
    const/16 v1, 0xff

    iput v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->blueMask:I

    .line 393
    :cond_10
    :goto_5
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    iget v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->redMask:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v15, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 394
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    iget v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->greenMask:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v14, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 395
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    iget v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->blueMask:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 396
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    iget v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->alphaMask:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v7, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 399
    iget-wide v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitmapOffset:J

    sub-long v1, v1, v18

    sub-long v1, v1, v36

    const-wide/16 v7, 0x4

    div-long/2addr v1, v7

    long-to-int v1, v1

    .line 400
    .local v1, "numberOfEntries":I
    mul-int/lit8 v2, v1, 0x4

    .line 401
    .local v2, "sizeOfPalette":I
    iget-wide v7, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitmapOffset:J

    cmp-long v3, v7, v36

    if-nez v3, :cond_14

    .line 402
    iget v3, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->imageType:I

    packed-switch v3, :pswitch_data_2

    .line 413
    const/4 v2, 0x0

    goto :goto_9

    .line 410
    :pswitch_8
    cmp-long v3, v4, v16

    if-nez v3, :cond_11

    const-wide/16 v7, 0x100

    goto :goto_6

    :cond_11
    move-wide v7, v4

    :goto_6
    long-to-int v3, v7

    const/16 v26, 0x4

    mul-int/lit8 v3, v3, 0x4

    .line 411
    .end local v2    # "sizeOfPalette":I
    .local v3, "sizeOfPalette":I
    move v2, v3

    goto :goto_9

    .line 407
    .end local v3    # "sizeOfPalette":I
    .restart local v2    # "sizeOfPalette":I
    :pswitch_9
    cmp-long v3, v4, v16

    if-nez v3, :cond_12

    const-wide/16 v7, 0x10

    goto :goto_7

    :cond_12
    move-wide v7, v4

    :goto_7
    long-to-int v3, v7

    const/16 v26, 0x4

    mul-int/lit8 v3, v3, 0x4

    .line 408
    .end local v2    # "sizeOfPalette":I
    .restart local v3    # "sizeOfPalette":I
    move v2, v3

    goto :goto_9

    .line 404
    .end local v3    # "sizeOfPalette":I
    .restart local v2    # "sizeOfPalette":I
    :pswitch_a
    cmp-long v3, v4, v16

    if-nez v3, :cond_13

    const-wide/16 v7, 0x2

    goto :goto_8

    :cond_13
    move-wide v7, v4

    :goto_8
    long-to-int v3, v7

    const/16 v26, 0x4

    mul-int/lit8 v3, v3, 0x4

    .line 405
    .end local v2    # "sizeOfPalette":I
    .restart local v3    # "sizeOfPalette":I
    move v2, v3

    .line 416
    .end local v3    # "sizeOfPalette":I
    .restart local v2    # "sizeOfPalette":I
    :goto_9
    int-to-long v7, v2

    add-long v7, v36, v7

    iput-wide v7, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitmapOffset:J

    .line 418
    :cond_14
    invoke-static {v2, v0}, Lcom/itextpdf/io/image/BmpImageHelper;->readPalette(ILcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V

    .line 420
    long-to-int v3, v12

    const-string v7, "color_space"

    packed-switch v3, :pswitch_data_3

    goto/16 :goto_a

    .line 444
    :pswitch_b
    iget-object v3, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    const-string v8, "LCS_CMYK"

    invoke-interface {v3, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 446
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v11}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 440
    :pswitch_c
    iget-object v3, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    const-string v8, "LCS_sRGB"

    invoke-interface {v3, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 441
    goto/16 :goto_a

    .line 423
    :pswitch_d
    iget-object v3, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    const-string v8, "LCS_CALIBRATED_RGB"

    invoke-interface {v3, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 424
    iget-object v3, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    const-string/jumbo v7, "redX"

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v3, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 425
    iget-object v3, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    const-string/jumbo v7, "redY"

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v3, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 426
    iget-object v3, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    const-string/jumbo v7, "redZ"

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v3, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 427
    iget-object v3, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    const-string v7, "greenX"

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v3, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 428
    iget-object v3, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    const-string v7, "greenY"

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v3, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 429
    iget-object v3, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    const-string v7, "greenZ"

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v3, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 430
    iget-object v3, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    const-string v7, "blueX"

    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v3, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 431
    iget-object v3, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    const-string v7, "blueY"

    invoke-static/range {v28 .. v28}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v3, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 432
    iget-object v3, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    const-string v7, "blueZ"

    invoke-static/range {v29 .. v29}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v3, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 433
    iget-object v3, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    const-string v7, "gamma_red"

    invoke-static/range {v30 .. v31}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-interface {v3, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 434
    iget-object v3, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    const-string v7, "gamma_green"

    invoke-static/range {v32 .. v33}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-interface {v3, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 435
    iget-object v3, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    const-string v7, "gamma_blue"

    invoke-static/range {v34 .. v35}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-interface {v3, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 436
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v11}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 448
    .end local v1    # "numberOfEntries":I
    .end local v2    # "sizeOfPalette":I
    .end local v6    # "redX":I
    .end local v10    # "redY":I
    .end local v12    # "csType":J
    .end local v22    # "redZ":I
    .end local v23    # "greenX":I
    .end local v24    # "greenY":I
    .end local v25    # "greenZ":I
    .end local v27    # "blueX":I
    .end local v28    # "blueY":I
    .end local v29    # "blueZ":I
    .end local v30    # "gammaRed":J
    .end local v32    # "gammaGreen":J
    .end local v34    # "gammaBlue":J
    :goto_a
    goto/16 :goto_12

    .line 449
    .end local v36    # "size":J
    .local v2, "size":J
    :cond_15
    move-wide/from16 v36, v2

    .end local v2    # "size":J
    .restart local v36    # "size":J
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    const-string v2, "BMP v. 5.x"

    invoke-interface {v1, v10, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 450
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v11}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 234
    .end local v36    # "size":J
    .restart local v2    # "size":J
    :cond_16
    move-wide/from16 v36, v2

    .line 237
    .end local v2    # "size":J
    .restart local v36    # "size":J
    :goto_b
    iget-wide v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->compression:J

    long-to-int v1, v1

    packed-switch v1, :pswitch_data_4

    .line 342
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v2, "Invalid BMP file compression."

    invoke-direct {v1, v2}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 311
    :pswitch_e
    iget v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitsPerPixel:I

    const/16 v2, 0x10

    if-ne v1, v2, :cond_17

    .line 312
    const/16 v2, 0x8

    iput v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->imageType:I

    goto :goto_c

    .line 313
    :cond_17
    iget v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitsPerPixel:I

    const/16 v2, 0x20

    if-ne v1, v2, :cond_18

    .line 314
    const/16 v1, 0x9

    iput v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->imageType:I

    .line 318
    :cond_18
    :goto_c
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v1}, Lcom/itextpdf/io/image/BmpImageHelper;->readDWord(Ljava/io/InputStream;)J

    move-result-wide v1

    long-to-int v1, v1

    iput v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->redMask:I

    .line 319
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v1}, Lcom/itextpdf/io/image/BmpImageHelper;->readDWord(Ljava/io/InputStream;)J

    move-result-wide v1

    long-to-int v1, v1

    iput v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->greenMask:I

    .line 320
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v1}, Lcom/itextpdf/io/image/BmpImageHelper;->readDWord(Ljava/io/InputStream;)J

    move-result-wide v1

    long-to-int v1, v1

    iput v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->blueMask:I

    .line 323
    cmp-long v1, v36, v24

    if-nez v1, :cond_19

    .line 324
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v1}, Lcom/itextpdf/io/image/BmpImageHelper;->readDWord(Ljava/io/InputStream;)J

    move-result-wide v1

    long-to-int v1, v1

    iput v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->alphaMask:I

    .line 325
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    iget v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->alphaMask:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v7, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 328
    :cond_19
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    iget v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->redMask:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v15, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 329
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    iget v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->greenMask:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v14, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 330
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    iget v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->blueMask:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 332
    cmp-long v1, v4, v16

    if-eqz v1, :cond_1a

    .line 334
    long-to-int v1, v4

    const/16 v26, 0x4

    mul-int/lit8 v1, v1, 0x4

    .line 335
    .local v1, "sizeOfPalette":I
    invoke-static {v1, v0}, Lcom/itextpdf/io/image/BmpImageHelper;->readPalette(ILcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V

    .line 338
    .end local v1    # "sizeOfPalette":I
    :cond_1a
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    const-string v2, "BMP v. 3.x NT"

    invoke-interface {v1, v10, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 339
    goto/16 :goto_12

    .line 243
    :pswitch_f
    iget v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitsPerPixel:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1b

    .line 244
    const/4 v2, 0x4

    iput v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->imageType:I

    goto/16 :goto_d

    .line 245
    :cond_1b
    const/4 v2, 0x4

    iget v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitsPerPixel:I

    if-ne v1, v2, :cond_1c

    .line 246
    const/4 v1, 0x5

    iput v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->imageType:I

    goto/16 :goto_d

    .line 247
    :cond_1c
    iget v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitsPerPixel:I

    const/16 v2, 0x8

    if-ne v1, v2, :cond_1d

    .line 248
    const/4 v1, 0x6

    iput v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->imageType:I

    goto/16 :goto_d

    .line 249
    :cond_1d
    iget v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitsPerPixel:I

    const/16 v2, 0x18

    if-ne v1, v2, :cond_1e

    .line 250
    const/4 v1, 0x7

    iput v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->imageType:I

    goto :goto_d

    .line 251
    :cond_1e
    iget v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitsPerPixel:I

    const/16 v2, 0x10

    if-ne v1, v2, :cond_1f

    .line 252
    const/16 v2, 0x8

    iput v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->imageType:I

    .line 253
    const/16 v1, 0x7c00

    iput v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->redMask:I

    .line 254
    const/16 v1, 0x3e0

    iput v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->greenMask:I

    .line 255
    const/16 v1, 0x1f

    iput v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->blueMask:I

    .line 256
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    iget v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->redMask:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v15, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    iget v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->greenMask:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v14, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 258
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    iget v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->blueMask:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_d

    .line 259
    :cond_1f
    iget v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitsPerPixel:I

    const/16 v2, 0x20

    if-ne v1, v2, :cond_20

    .line 260
    const/16 v1, 0x9

    iput v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->imageType:I

    .line 261
    const/high16 v1, 0xff0000

    iput v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->redMask:I

    .line 262
    const v1, 0xff00

    iput v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->greenMask:I

    .line 263
    const/16 v1, 0xff

    iput v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->blueMask:I

    .line 264
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    iget v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->redMask:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v15, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 265
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    iget v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->greenMask:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v14, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    iget v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->blueMask:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 270
    :cond_20
    :goto_d
    cmp-long v1, v36, v22

    if-ltz v1, :cond_21

    .line 271
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v1}, Lcom/itextpdf/io/image/BmpImageHelper;->readDWord(Ljava/io/InputStream;)J

    move-result-wide v1

    long-to-int v1, v1

    iput v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->redMask:I

    .line 272
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v1}, Lcom/itextpdf/io/image/BmpImageHelper;->readDWord(Ljava/io/InputStream;)J

    move-result-wide v1

    long-to-int v1, v1

    iput v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->greenMask:I

    .line 273
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v1}, Lcom/itextpdf/io/image/BmpImageHelper;->readDWord(Ljava/io/InputStream;)J

    move-result-wide v1

    long-to-int v1, v1

    iput v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->blueMask:I

    .line 274
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    iget v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->redMask:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v15, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 275
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    iget v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->greenMask:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v14, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 276
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    iget v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->blueMask:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 279
    :cond_21
    cmp-long v1, v36, v24

    if-nez v1, :cond_22

    .line 280
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v1}, Lcom/itextpdf/io/image/BmpImageHelper;->readDWord(Ljava/io/InputStream;)J

    move-result-wide v1

    long-to-int v1, v1

    iput v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->alphaMask:I

    .line 281
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    iget v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->alphaMask:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v7, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 285
    :cond_22
    iget-wide v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitmapOffset:J

    sub-long v1, v1, v18

    sub-long v1, v1, v36

    const-wide/16 v6, 0x4

    div-long/2addr v1, v6

    long-to-int v1, v1

    .line 286
    .local v1, "numberOfEntries":I
    mul-int/lit8 v2, v1, 0x4

    .line 287
    .local v2, "sizeOfPalette":I
    iget-wide v6, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitmapOffset:J

    cmp-long v3, v6, v36

    if-nez v3, :cond_26

    .line 288
    iget v3, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->imageType:I

    packed-switch v3, :pswitch_data_5

    .line 299
    const/4 v2, 0x0

    goto :goto_11

    .line 296
    :pswitch_10
    cmp-long v3, v4, v16

    if-nez v3, :cond_23

    const-wide/16 v6, 0x100

    goto :goto_e

    :cond_23
    move-wide v6, v4

    :goto_e
    long-to-int v3, v6

    const/16 v26, 0x4

    mul-int/lit8 v3, v3, 0x4

    .line 297
    .end local v2    # "sizeOfPalette":I
    .restart local v3    # "sizeOfPalette":I
    move v2, v3

    goto :goto_11

    .line 293
    .end local v3    # "sizeOfPalette":I
    .restart local v2    # "sizeOfPalette":I
    :pswitch_11
    cmp-long v3, v4, v16

    if-nez v3, :cond_24

    const-wide/16 v6, 0x10

    goto :goto_f

    :cond_24
    move-wide v6, v4

    :goto_f
    long-to-int v3, v6

    const/16 v26, 0x4

    mul-int/lit8 v3, v3, 0x4

    .line 294
    .end local v2    # "sizeOfPalette":I
    .restart local v3    # "sizeOfPalette":I
    move v2, v3

    goto :goto_11

    .line 290
    .end local v3    # "sizeOfPalette":I
    .restart local v2    # "sizeOfPalette":I
    :pswitch_12
    cmp-long v3, v4, v16

    if-nez v3, :cond_25

    const-wide/16 v6, 0x2

    goto :goto_10

    :cond_25
    move-wide v6, v4

    :goto_10
    long-to-int v3, v6

    const/16 v26, 0x4

    mul-int/lit8 v3, v3, 0x4

    .line 291
    .end local v2    # "sizeOfPalette":I
    .restart local v3    # "sizeOfPalette":I
    move v2, v3

    .line 302
    .end local v3    # "sizeOfPalette":I
    .restart local v2    # "sizeOfPalette":I
    :goto_11
    int-to-long v6, v2

    add-long v6, v36, v6

    iput-wide v6, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitmapOffset:J

    .line 304
    :cond_26
    invoke-static {v2, v0}, Lcom/itextpdf/io/image/BmpImageHelper;->readPalette(ILcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V

    .line 306
    iget-object v3, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    const-string v6, "BMP v. 3.x"

    invoke-interface {v3, v10, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 307
    nop

    .line 454
    .end local v1    # "numberOfEntries":I
    .end local v2    # "sizeOfPalette":I
    .end local v4    # "colorsUsed":J
    .end local v20    # "colorsImportant":J
    :goto_12
    iget v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    if-lez v1, :cond_27

    .line 456
    const/4 v2, 0x1

    iput-boolean v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->isBottomUp:Z

    goto :goto_13

    .line 459
    :cond_27
    const/4 v2, 0x1

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->isBottomUp:Z

    .line 460
    iget v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    iput v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    .line 463
    :goto_13
    iget v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitsPerPixel:I

    if-eq v1, v2, :cond_2c

    iget v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitsPerPixel:I

    const/4 v2, 0x4

    if-eq v1, v2, :cond_2c

    iget v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitsPerPixel:I

    const/16 v2, 0x8

    if-ne v1, v2, :cond_28

    goto :goto_15

    .line 507
    :cond_28
    iget v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitsPerPixel:I

    const/16 v2, 0x10

    if-ne v1, v2, :cond_29

    .line 508
    const/4 v6, 0x3

    iput v6, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->numBands:I

    goto/16 :goto_19

    .line 509
    :cond_29
    iget v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitsPerPixel:I

    const/16 v2, 0x20

    if-ne v1, v2, :cond_2b

    .line 510
    iget v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->alphaMask:I

    if-nez v1, :cond_2a

    const/4 v7, 0x3

    goto :goto_14

    :cond_2a
    const/4 v7, 0x4

    :goto_14
    iput v7, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->numBands:I

    goto/16 :goto_19

    .line 515
    :cond_2b
    const/4 v6, 0x3

    iput v6, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->numBands:I

    goto/16 :goto_19

    .line 464
    :cond_2c
    :goto_15
    const/4 v2, 0x1

    iput v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->numBands:I

    .line 468
    iget v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->imageType:I

    if-eqz v1, :cond_2f

    iget v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->imageType:I

    if-eq v1, v2, :cond_2f

    iget v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->imageType:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_2d

    goto :goto_17

    .line 489
    :cond_2d
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->palette:[B

    array-length v1, v1

    const/16 v26, 0x4

    div-int/lit8 v1, v1, 0x4

    .line 491
    .local v1, "sizep":I
    const/16 v2, 0x100

    if-le v1, v2, :cond_2e

    .line 492
    const/16 v1, 0x100

    .line 496
    :cond_2e
    new-array v2, v1, [B

    .line 497
    .local v2, "r":[B
    new-array v3, v1, [B

    .line 498
    .local v3, "g":[B
    new-array v4, v1, [B

    .line 499
    .local v4, "b":[B
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_16
    if-ge v5, v1, :cond_31

    .line 500
    mul-int/lit8 v6, v5, 0x4

    .line 501
    .local v6, "off":I
    iget-object v7, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->palette:[B

    aget-byte v7, v7, v6

    aput-byte v7, v4, v5

    .line 502
    iget-object v7, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->palette:[B

    add-int/lit8 v8, v6, 0x1

    aget-byte v7, v7, v8

    aput-byte v7, v3, v5

    .line 503
    iget-object v7, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->palette:[B

    add-int/lit8 v8, v6, 0x2

    aget-byte v7, v7, v8

    aput-byte v7, v2, v5

    .line 499
    add-int/lit8 v5, v5, 0x1

    goto :goto_16

    .line 472
    .end local v1    # "sizep":I
    .end local v2    # "r":[B
    .end local v3    # "g":[B
    .end local v4    # "b":[B
    .end local v5    # "i":I
    .end local v6    # "off":I
    :cond_2f
    :goto_17
    iget-object v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->palette:[B

    array-length v1, v1

    const/4 v6, 0x3

    div-int/2addr v1, v6

    .line 474
    .restart local v1    # "sizep":I
    const/16 v2, 0x100

    if-le v1, v2, :cond_30

    .line 475
    const/16 v1, 0x100

    .line 479
    :cond_30
    new-array v2, v1, [B

    .line 480
    .restart local v2    # "r":[B
    new-array v3, v1, [B

    .line 481
    .restart local v3    # "g":[B
    new-array v4, v1, [B

    .line 482
    .restart local v4    # "b":[B
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_18
    if-ge v5, v1, :cond_31

    .line 483
    mul-int/lit8 v6, v5, 0x3

    .line 484
    .restart local v6    # "off":I
    iget-object v7, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->palette:[B

    aget-byte v7, v7, v6

    aput-byte v7, v4, v5

    .line 485
    iget-object v7, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->palette:[B

    add-int/lit8 v8, v6, 0x1

    aget-byte v7, v7, v8

    aput-byte v7, v3, v5

    .line 486
    iget-object v7, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->palette:[B

    add-int/lit8 v8, v6, 0x2

    aget-byte v7, v7, v8

    aput-byte v7, v2, v5

    .line 482
    add-int/lit8 v5, v5, 0x1

    goto :goto_18

    .line 507
    .end local v1    # "sizep":I
    .end local v2    # "r":[B
    .end local v3    # "g":[B
    .end local v4    # "b":[B
    .end local v5    # "i":I
    .end local v6    # "off":I
    :cond_31
    nop

    .line 517
    :goto_19
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0xa
        :pswitch_a
        :pswitch_9
        :pswitch_8
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x0
        :pswitch_d
        :pswitch_c
        :pswitch_b
    .end packed-switch

    :pswitch_data_4
    .packed-switch 0x0
        :pswitch_f
        :pswitch_f
        :pswitch_f
        :pswitch_e
    .end packed-switch

    :pswitch_data_5
    .packed-switch 0x4
        :pswitch_12
        :pswitch_11
        :pswitch_10
    .end packed-switch
.end method

.method public static processImage(Lcom/itextpdf/io/image/ImageData;)V
    .locals 10
    .param p0, "image"    # Lcom/itextpdf/io/image/ImageData;

    .line 101
    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->getOriginalType()Lcom/itextpdf/io/image/ImageType;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/io/image/ImageType;->BMP:Lcom/itextpdf/io/image/ImageType;

    if-ne v0, v1, :cond_2

    .line 106
    :try_start_0
    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->getData()[B

    move-result-object v0

    if-nez v0, :cond_0

    .line 107
    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->loadData()V

    .line 109
    :cond_0
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->getData()[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 110
    .local v0, "bmpStream":Ljava/io/InputStream;
    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->getData()[B

    move-result-object v1

    array-length v1, v1

    iput v1, p0, Lcom/itextpdf/io/image/ImageData;->imageSize:I

    .line 111
    new-instance v1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;

    move-object v2, p0

    check-cast v2, Lcom/itextpdf/io/image/BmpImageData;

    invoke-direct {v1, v2}, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;-><init>(Lcom/itextpdf/io/image/BmpImageData;)V

    .line 112
    .local v1, "bmp":Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;
    invoke-static {v1, v0}, Lcom/itextpdf/io/image/BmpImageHelper;->process(Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;Ljava/io/InputStream;)V

    .line 113
    invoke-static {v1}, Lcom/itextpdf/io/image/BmpImageHelper;->getImage(Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 114
    iget v2, v1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    int-to-float v2, v2

    invoke-virtual {p0, v2}, Lcom/itextpdf/io/image/ImageData;->setWidth(F)V

    .line 115
    iget v2, v1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    int-to-float v2, v2

    invoke-virtual {p0, v2}, Lcom/itextpdf/io/image/ImageData;->setHeight(F)V

    .line 116
    iget-wide v2, v1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->xPelsPerMeter:J

    long-to-double v2, v2

    const-wide v4, 0x3f9a027525460aa6L    # 0.0254

    mul-double/2addr v2, v4

    const-wide/high16 v6, 0x3fe0000000000000L    # 0.5

    add-double/2addr v2, v6

    double-to-int v2, v2

    iget-wide v8, v1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->yPelsPerMeter:J

    long-to-double v8, v8

    mul-double/2addr v8, v4

    add-double/2addr v8, v6

    double-to-int v3, v8

    invoke-virtual {p0, v2, v3}, Lcom/itextpdf/io/image/ImageData;->setDpi(II)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    :cond_1
    nop

    .line 121
    iget-object v2, v1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->image:Lcom/itextpdf/io/image/BmpImageData;

    iget-object v3, v1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->additional:Ljava/util/Map;

    invoke-static {v2, v3}, Lcom/itextpdf/io/image/RawImageHelper;->updateImageAttributes(Lcom/itextpdf/io/image/RawImageData;Ljava/util/Map;)V

    .line 122
    return-void

    .line 118
    .end local v0    # "bmpStream":Ljava/io/InputStream;
    .end local v1    # "bmp":Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;
    :catch_0
    move-exception v0

    .line 119
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v2, "Bmp image exception."

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 102
    .end local v0    # "e":Ljava/io/IOException;
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "BMP image expected"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static read1632Bit(ZLcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V
    .locals 20
    .param p0, "is32"    # Z
    .param p1, "bmp"    # Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 888
    move-object/from16 v0, p1

    iget v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->redMask:I

    invoke-static {v1}, Lcom/itextpdf/io/image/BmpImageHelper;->findMask(I)I

    move-result v1

    .line 889
    .local v1, "red_mask":I
    iget v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->redMask:I

    invoke-static {v2}, Lcom/itextpdf/io/image/BmpImageHelper;->findShift(I)I

    move-result v2

    .line 890
    .local v2, "red_shift":I
    add-int/lit8 v3, v1, 0x1

    .line 891
    .local v3, "red_factor":I
    iget v4, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->greenMask:I

    invoke-static {v4}, Lcom/itextpdf/io/image/BmpImageHelper;->findMask(I)I

    move-result v4

    .line 892
    .local v4, "green_mask":I
    iget v5, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->greenMask:I

    invoke-static {v5}, Lcom/itextpdf/io/image/BmpImageHelper;->findShift(I)I

    move-result v5

    .line 893
    .local v5, "green_shift":I
    add-int/lit8 v6, v4, 0x1

    .line 894
    .local v6, "green_factor":I
    iget v7, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->blueMask:I

    invoke-static {v7}, Lcom/itextpdf/io/image/BmpImageHelper;->findMask(I)I

    move-result v7

    .line 895
    .local v7, "blue_mask":I
    iget v8, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->blueMask:I

    invoke-static {v8}, Lcom/itextpdf/io/image/BmpImageHelper;->findShift(I)I

    move-result v8

    .line 896
    .local v8, "blue_shift":I
    add-int/lit8 v9, v7, 0x1

    .line 897
    .local v9, "blue_factor":I
    iget v10, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    iget v11, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    mul-int/2addr v10, v11

    mul-int/lit8 v10, v10, 0x3

    new-array v10, v10, [B

    .line 899
    .local v10, "bdata":[B
    const/4 v11, 0x0

    .line 901
    .local v11, "padding":I
    if-nez p0, :cond_0

    .line 903
    iget v12, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    mul-int/lit8 v12, v12, 0x10

    .line 904
    .local v12, "bitsPerScanline":I
    rem-int/lit8 v13, v12, 0x20

    if-eqz v13, :cond_0

    .line 905
    div-int/lit8 v13, v12, 0x20

    add-int/lit8 v13, v13, 0x1

    mul-int/lit8 v13, v13, 0x20

    sub-int/2addr v13, v12

    .line 906
    .end local v11    # "padding":I
    .local v13, "padding":I
    int-to-double v14, v13

    const-wide/high16 v16, 0x4020000000000000L    # 8.0

    div-double v14, v14, v16

    invoke-static {v14, v15}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v14

    double-to-int v11, v14

    .line 910
    .end local v12    # "bitsPerScanline":I
    .end local v13    # "padding":I
    .restart local v11    # "padding":I
    :cond_0
    iget-wide v12, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->imageSize:J

    long-to-int v12, v12

    .line 911
    .local v12, "imSize":I
    if-nez v12, :cond_1

    .line 912
    iget-wide v13, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitmapFileSize:J

    move/from16 v17, v1

    move/from16 v18, v2

    .end local v1    # "red_mask":I
    .end local v2    # "red_shift":I
    .local v17, "red_mask":I
    .local v18, "red_shift":I
    iget-wide v1, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitmapOffset:J

    sub-long/2addr v13, v1

    long-to-int v12, v13

    move v1, v12

    goto :goto_0

    .line 911
    .end local v17    # "red_mask":I
    .end local v18    # "red_shift":I
    .restart local v1    # "red_mask":I
    .restart local v2    # "red_shift":I
    :cond_1
    move/from16 v17, v1

    move/from16 v18, v2

    .end local v1    # "red_mask":I
    .end local v2    # "red_shift":I
    .restart local v17    # "red_mask":I
    .restart local v18    # "red_shift":I
    move v1, v12

    .line 915
    .end local v12    # "imSize":I
    .local v1, "imSize":I
    :goto_0
    const/4 v2, 0x0

    .line 917
    .local v2, "l":I
    iget-boolean v12, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->isBottomUp:Z

    if-eqz v12, :cond_6

    .line 918
    iget v12, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    add-int/lit8 v12, v12, -0x1

    .local v12, "i":I
    :goto_1
    if-ltz v12, :cond_5

    .line 919
    iget v13, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    mul-int/lit8 v13, v13, 0x3

    mul-int/2addr v13, v12

    .line 920
    .end local v2    # "l":I
    .local v13, "l":I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_2
    iget v14, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    if-ge v2, v14, :cond_3

    .line 921
    if-eqz p0, :cond_2

    .line 922
    iget-object v14, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v14}, Lcom/itextpdf/io/image/BmpImageHelper;->readDWord(Ljava/io/InputStream;)J

    move-result-wide v14

    long-to-int v14, v14

    .local v14, "v":I
    goto :goto_3

    .line 924
    .end local v14    # "v":I
    :cond_2
    iget-object v14, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v14}, Lcom/itextpdf/io/image/BmpImageHelper;->readWord(Ljava/io/InputStream;)I

    move-result v14

    .line 925
    .restart local v14    # "v":I
    :goto_3
    add-int/lit8 v15, v13, 0x1

    .end local v13    # "l":I
    .local v15, "l":I
    ushr-int v16, v14, v18

    move/from16 v19, v1

    .end local v1    # "imSize":I
    .local v19, "imSize":I
    and-int v1, v16, v17

    mul-int/lit16 v1, v1, 0x100

    div-int/2addr v1, v3

    int-to-byte v1, v1

    aput-byte v1, v10, v13

    .line 926
    add-int/lit8 v1, v15, 0x1

    .end local v15    # "l":I
    .local v1, "l":I
    ushr-int v13, v14, v5

    and-int/2addr v13, v4

    mul-int/lit16 v13, v13, 0x100

    div-int/2addr v13, v6

    int-to-byte v13, v13

    aput-byte v13, v10, v15

    .line 927
    add-int/lit8 v13, v1, 0x1

    .end local v1    # "l":I
    .restart local v13    # "l":I
    ushr-int v15, v14, v8

    and-int/2addr v15, v7

    mul-int/lit16 v15, v15, 0x100

    div-int/2addr v15, v9

    int-to-byte v15, v15

    aput-byte v15, v10, v1

    .line 920
    add-int/lit8 v2, v2, 0x1

    move/from16 v1, v19

    goto :goto_2

    .end local v14    # "v":I
    .end local v19    # "imSize":I
    .local v1, "imSize":I
    :cond_3
    move/from16 v19, v1

    .line 929
    .end local v1    # "imSize":I
    .end local v2    # "j":I
    .restart local v19    # "imSize":I
    const/4 v1, 0x0

    .local v1, "m":I
    :goto_4
    if-ge v1, v11, :cond_4

    .line 930
    iget-object v2, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    .line 929
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 918
    .end local v1    # "m":I
    :cond_4
    add-int/lit8 v12, v12, -0x1

    move v2, v13

    move/from16 v1, v19

    goto :goto_1

    .end local v13    # "l":I
    .end local v19    # "imSize":I
    .local v1, "imSize":I
    .local v2, "l":I
    :cond_5
    move/from16 v19, v1

    .end local v1    # "imSize":I
    .end local v12    # "i":I
    .restart local v19    # "imSize":I
    goto :goto_9

    .line 934
    .end local v19    # "imSize":I
    .restart local v1    # "imSize":I
    :cond_6
    move/from16 v19, v1

    .end local v1    # "imSize":I
    .restart local v19    # "imSize":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    iget v12, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    if-ge v1, v12, :cond_a

    .line 935
    const/4 v12, 0x0

    .local v12, "j":I
    :goto_6
    iget v13, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    if-ge v12, v13, :cond_8

    .line 936
    if-eqz p0, :cond_7

    .line 937
    iget-object v13, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v13}, Lcom/itextpdf/io/image/BmpImageHelper;->readDWord(Ljava/io/InputStream;)J

    move-result-wide v13

    long-to-int v13, v13

    .local v13, "v":I
    goto :goto_7

    .line 939
    .end local v13    # "v":I
    :cond_7
    iget-object v13, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-static {v13}, Lcom/itextpdf/io/image/BmpImageHelper;->readWord(Ljava/io/InputStream;)I

    move-result v13

    .line 940
    .restart local v13    # "v":I
    :goto_7
    add-int/lit8 v14, v2, 0x1

    .end local v2    # "l":I
    .local v14, "l":I
    ushr-int v15, v13, v18

    and-int v15, v15, v17

    mul-int/lit16 v15, v15, 0x100

    div-int/2addr v15, v3

    int-to-byte v15, v15

    aput-byte v15, v10, v2

    .line 941
    add-int/lit8 v2, v14, 0x1

    .end local v14    # "l":I
    .restart local v2    # "l":I
    ushr-int v15, v13, v5

    and-int/2addr v15, v4

    mul-int/lit16 v15, v15, 0x100

    div-int/2addr v15, v6

    int-to-byte v15, v15

    aput-byte v15, v10, v14

    .line 942
    add-int/lit8 v14, v2, 0x1

    .end local v2    # "l":I
    .restart local v14    # "l":I
    ushr-int v15, v13, v8

    and-int/2addr v15, v7

    mul-int/lit16 v15, v15, 0x100

    div-int/2addr v15, v9

    int-to-byte v15, v15

    aput-byte v15, v10, v2

    .line 935
    add-int/lit8 v12, v12, 0x1

    move v2, v14

    goto :goto_6

    .line 944
    .end local v12    # "j":I
    .end local v13    # "v":I
    .end local v14    # "l":I
    .restart local v2    # "l":I
    :cond_8
    const/4 v12, 0x0

    .local v12, "m":I
    :goto_8
    if-ge v12, v11, :cond_9

    .line 945
    iget-object v13, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    invoke-virtual {v13}, Ljava/io/InputStream;->read()I

    .line 944
    add-int/lit8 v12, v12, 0x1

    goto :goto_8

    .line 934
    .end local v12    # "m":I
    :cond_9
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 949
    .end local v1    # "i":I
    :cond_a
    :goto_9
    move v1, v11

    .end local v11    # "padding":I
    .local v1, "padding":I
    iget-object v11, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->image:Lcom/itextpdf/io/image/BmpImageData;

    iget v12, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    iget v13, v0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    const/4 v14, 0x3

    const/16 v15, 0x8

    move-object/from16 v16, v10

    .end local v10    # "bdata":[B
    .local v16, "bdata":[B
    invoke-static/range {v11 .. v16}, Lcom/itextpdf/io/image/RawImageHelper;->updateRawImageParameters(Lcom/itextpdf/io/image/RawImageData;IIII[B)V

    .line 950
    return-void
.end method

.method private static read1Bit(ILcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V
    .locals 10
    .param p0, "paletteEntries"    # I
    .param p1, "bmp"    # Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 678
    iget v0, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    add-int/lit8 v0, v0, 0x7

    div-int/lit8 v0, v0, 0x8

    iget v1, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    mul-int/2addr v0, v1

    new-array v0, v0, [B

    .line 679
    .local v0, "bdata":[B
    const/4 v1, 0x0

    .line 680
    .local v1, "padding":I
    iget v2, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    int-to-double v2, v2

    const-wide/high16 v4, 0x4020000000000000L    # 8.0

    div-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v2, v2

    .line 682
    .local v2, "bytesPerScanline":I
    rem-int/lit8 v3, v2, 0x4

    .line 683
    .local v3, "remainder":I
    if-eqz v3, :cond_0

    .line 684
    rsub-int/lit8 v1, v3, 0x4

    .line 687
    :cond_0
    add-int v4, v2, v1

    iget v5, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    mul-int/2addr v4, v5

    .line 690
    .local v4, "imSize":I
    new-array v5, v4, [B

    .line 691
    .local v5, "values":[B
    const/4 v6, 0x0

    .line 692
    .local v6, "bytesRead":I
    :goto_0
    if-ge v6, v4, :cond_1

    .line 693
    iget-object v7, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    sub-int v8, v4, v6

    invoke-virtual {v7, v5, v6, v8}, Ljava/io/InputStream;->read([BII)I

    move-result v7

    add-int/2addr v6, v7

    goto :goto_0

    .line 697
    :cond_1
    iget-boolean v7, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->isBottomUp:Z

    if-eqz v7, :cond_3

    .line 702
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_1
    iget v8, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    if-ge v7, v8, :cond_2

    .line 703
    add-int/lit8 v8, v7, 0x1

    add-int v9, v2, v1

    mul-int/2addr v8, v9

    sub-int v8, v4, v8

    mul-int v9, v7, v2

    invoke-static {v5, v8, v0, v9, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 702
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .end local v7    # "i":I
    :cond_2
    goto :goto_3

    .line 710
    :cond_3
    const/4 v7, 0x0

    .restart local v7    # "i":I
    :goto_2
    iget v8, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    if-ge v7, v8, :cond_4

    .line 711
    add-int v8, v2, v1

    mul-int/2addr v8, v7

    mul-int v9, v7, v2

    invoke-static {v5, v8, v0, v9, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 710
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 718
    .end local v7    # "i":I
    :cond_4
    :goto_3
    const/4 v7, 0x1

    invoke-static {v0, v7, p0, p1}, Lcom/itextpdf/io/image/BmpImageHelper;->indexedModel([BIILcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V

    .line 719
    return-void
.end method

.method private static read24Bit([BLcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V
    .locals 12
    .param p0, "bdata"    # [B
    .param p1, "bmp"    # Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 815
    const/4 v0, 0x0

    .line 818
    .local v0, "padding":I
    iget v1, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    mul-int/lit8 v1, v1, 0x18

    .line 819
    .local v1, "bitsPerScanline":I
    rem-int/lit8 v2, v1, 0x20

    if-eqz v2, :cond_0

    .line 820
    div-int/lit8 v2, v1, 0x20

    add-int/lit8 v2, v2, 0x1

    mul-int/lit8 v2, v2, 0x20

    sub-int/2addr v2, v1

    .line 821
    .end local v0    # "padding":I
    .local v2, "padding":I
    int-to-double v3, v2

    const-wide/high16 v5, 0x4020000000000000L    # 8.0

    div-double/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v3

    double-to-int v0, v3

    .line 825
    .end local v2    # "padding":I
    .restart local v0    # "padding":I
    :cond_0
    iget v2, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    mul-int/lit8 v2, v2, 0x3

    add-int/lit8 v2, v2, 0x3

    div-int/lit8 v2, v2, 0x4

    mul-int/lit8 v2, v2, 0x4

    iget v3, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    mul-int/2addr v2, v3

    .line 827
    .local v2, "imSize":I
    new-array v3, v2, [B

    .line 828
    .local v3, "values":[B
    const/4 v4, 0x0

    .line 829
    .local v4, "bytesRead":I
    :goto_0
    if-ge v4, v2, :cond_2

    .line 830
    iget-object v5, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    sub-int v6, v2, v4

    invoke-virtual {v5, v3, v4, v6}, Ljava/io/InputStream;->read([BII)I

    move-result v5

    .line 832
    .local v5, "r":I
    if-gez v5, :cond_1

    .line 833
    goto :goto_1

    .line 834
    :cond_1
    add-int/2addr v4, v5

    .line 835
    .end local v5    # "r":I
    goto :goto_0

    .line 837
    :cond_2
    :goto_1
    const/4 v5, 0x0

    .line 839
    .local v5, "l":I
    iget-boolean v6, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->isBottomUp:Z

    if-eqz v6, :cond_5

    .line 840
    iget v6, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    iget v7, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    mul-int/2addr v6, v7

    mul-int/lit8 v6, v6, 0x3

    add-int/lit8 v6, v6, -0x1

    .line 842
    .local v6, "max":I
    neg-int v7, v0

    .line 843
    .local v7, "count":I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_2
    iget v9, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    if-ge v8, v9, :cond_4

    .line 844
    add-int/lit8 v9, v8, 0x1

    iget v10, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    mul-int/2addr v9, v10

    mul-int/lit8 v9, v9, 0x3

    sub-int v9, v6, v9

    add-int/lit8 v9, v9, 0x1

    .line 845
    .end local v5    # "l":I
    .local v9, "l":I
    add-int/2addr v7, v0

    .line 846
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_3
    iget v10, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    if-ge v5, v10, :cond_3

    .line 847
    add-int/lit8 v10, v9, 0x2

    add-int/lit8 v11, v7, 0x1

    .end local v7    # "count":I
    .local v11, "count":I
    aget-byte v7, v3, v7

    aput-byte v7, p0, v10

    .line 848
    add-int/lit8 v7, v9, 0x1

    add-int/lit8 v10, v11, 0x1

    .end local v11    # "count":I
    .local v10, "count":I
    aget-byte v11, v3, v11

    aput-byte v11, p0, v7

    .line 849
    add-int/lit8 v7, v10, 0x1

    .end local v10    # "count":I
    .restart local v7    # "count":I
    aget-byte v10, v3, v10

    aput-byte v10, p0, v9

    .line 850
    add-int/lit8 v9, v9, 0x3

    .line 846
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 843
    .end local v5    # "j":I
    :cond_3
    add-int/lit8 v8, v8, 0x1

    move v5, v9

    goto :goto_2

    .line 853
    .end local v6    # "max":I
    .end local v8    # "i":I
    .end local v9    # "l":I
    .local v5, "l":I
    :cond_4
    goto :goto_6

    .line 854
    .end local v7    # "count":I
    :cond_5
    neg-int v6, v0

    .line 855
    .local v6, "count":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_4
    iget v8, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    if-ge v7, v8, :cond_7

    .line 856
    add-int/2addr v6, v0

    .line 857
    const/4 v8, 0x0

    .local v8, "j":I
    :goto_5
    iget v9, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    if-ge v8, v9, :cond_6

    .line 858
    add-int/lit8 v9, v5, 0x2

    add-int/lit8 v10, v6, 0x1

    .end local v6    # "count":I
    .restart local v10    # "count":I
    aget-byte v6, v3, v6

    aput-byte v6, p0, v9

    .line 859
    add-int/lit8 v6, v5, 0x1

    add-int/lit8 v9, v10, 0x1

    .end local v10    # "count":I
    .local v9, "count":I
    aget-byte v10, v3, v10

    aput-byte v10, p0, v6

    .line 860
    add-int/lit8 v6, v9, 0x1

    .end local v9    # "count":I
    .restart local v6    # "count":I
    aget-byte v9, v3, v9

    aput-byte v9, p0, v5

    .line 861
    add-int/lit8 v5, v5, 0x3

    .line 857
    add-int/lit8 v8, v8, 0x1

    goto :goto_5

    .line 855
    .end local v8    # "j":I
    :cond_6
    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    :cond_7
    move v7, v6

    .line 865
    .end local v6    # "count":I
    .local v7, "count":I
    :goto_6
    return-void
.end method

.method private static read4Bit(ILcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V
    .locals 10
    .param p0, "paletteEntries"    # I
    .param p1, "bmp"    # Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 723
    iget v0, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    add-int/lit8 v0, v0, 0x1

    div-int/lit8 v0, v0, 0x2

    iget v1, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    mul-int/2addr v0, v1

    new-array v0, v0, [B

    .line 726
    .local v0, "bdata":[B
    const/4 v1, 0x0

    .line 728
    .local v1, "padding":I
    iget v2, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    int-to-double v2, v2

    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    div-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v2, v2

    .line 729
    .local v2, "bytesPerScanline":I
    rem-int/lit8 v3, v2, 0x4

    .line 730
    .local v3, "remainder":I
    if-eqz v3, :cond_0

    .line 731
    rsub-int/lit8 v1, v3, 0x4

    .line 734
    :cond_0
    add-int v4, v2, v1

    iget v5, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    mul-int/2addr v4, v5

    .line 737
    .local v4, "imSize":I
    new-array v5, v4, [B

    .line 738
    .local v5, "values":[B
    const/4 v6, 0x0

    .line 739
    .local v6, "bytesRead":I
    :goto_0
    if-ge v6, v4, :cond_1

    .line 740
    iget-object v7, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    sub-int v8, v4, v6

    invoke-virtual {v7, v5, v6, v8}, Ljava/io/InputStream;->read([BII)I

    move-result v7

    add-int/2addr v6, v7

    goto :goto_0

    .line 744
    :cond_1
    iget-boolean v7, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->isBottomUp:Z

    if-eqz v7, :cond_3

    .line 748
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_1
    iget v8, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    if-ge v7, v8, :cond_2

    .line 749
    add-int/lit8 v8, v7, 0x1

    add-int v9, v2, v1

    mul-int/2addr v8, v9

    sub-int v8, v4, v8

    mul-int v9, v7, v2

    invoke-static {v5, v8, v0, v9, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 748
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .end local v7    # "i":I
    :cond_2
    goto :goto_3

    .line 756
    :cond_3
    const/4 v7, 0x0

    .restart local v7    # "i":I
    :goto_2
    iget v8, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    if-ge v7, v8, :cond_4

    .line 757
    add-int v8, v2, v1

    mul-int/2addr v8, v7

    mul-int v9, v7, v2

    invoke-static {v5, v8, v0, v9, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 756
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 764
    .end local v7    # "i":I
    :cond_4
    :goto_3
    const/4 v7, 0x4

    invoke-static {v0, v7, p0, p1}, Lcom/itextpdf/io/image/BmpImageHelper;->indexedModel([BIILcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V

    .line 765
    return-void
.end method

.method private static read8Bit(ILcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V
    .locals 11
    .param p0, "paletteEntries"    # I
    .param p1, "bmp"    # Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 769
    iget v0, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    iget v1, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    mul-int/2addr v0, v1

    new-array v0, v0, [B

    .line 771
    .local v0, "bdata":[B
    const/4 v1, 0x0

    .line 774
    .local v1, "padding":I
    iget v2, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    const/16 v3, 0x8

    mul-int/2addr v2, v3

    .line 775
    .local v2, "bitsPerScanline":I
    rem-int/lit8 v4, v2, 0x20

    if-eqz v4, :cond_0

    .line 776
    div-int/lit8 v4, v2, 0x20

    add-int/lit8 v4, v4, 0x1

    mul-int/lit8 v4, v4, 0x20

    sub-int/2addr v4, v2

    .line 777
    .end local v1    # "padding":I
    .local v4, "padding":I
    int-to-double v5, v4

    const-wide/high16 v7, 0x4020000000000000L    # 8.0

    div-double/2addr v5, v7

    invoke-static {v5, v6}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v5

    double-to-int v1, v5

    .line 780
    .end local v4    # "padding":I
    .restart local v1    # "padding":I
    :cond_0
    iget v4, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    add-int/2addr v4, v1

    iget v5, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    mul-int/2addr v4, v5

    .line 783
    .local v4, "imSize":I
    new-array v5, v4, [B

    .line 784
    .local v5, "values":[B
    const/4 v6, 0x0

    .line 785
    .local v6, "bytesRead":I
    :goto_0
    if-ge v6, v4, :cond_1

    .line 786
    iget-object v7, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    sub-int v8, v4, v6

    invoke-virtual {v7, v5, v6, v8}, Ljava/io/InputStream;->read([BII)I

    move-result v7

    add-int/2addr v6, v7

    goto :goto_0

    .line 789
    :cond_1
    iget-boolean v7, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->isBottomUp:Z

    if-eqz v7, :cond_3

    .line 793
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_1
    iget v8, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    if-ge v7, v8, :cond_2

    .line 794
    add-int/lit8 v8, v7, 0x1

    iget v9, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    add-int/2addr v9, v1

    mul-int/2addr v8, v9

    sub-int v8, v4, v8

    iget v9, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    mul-int/2addr v9, v7

    iget v10, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    invoke-static {v5, v8, v0, v9, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 793
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .end local v7    # "i":I
    :cond_2
    goto :goto_3

    .line 801
    :cond_3
    const/4 v7, 0x0

    .restart local v7    # "i":I
    :goto_2
    iget v8, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    if-ge v7, v8, :cond_4

    .line 802
    iget v8, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    add-int/2addr v8, v1

    mul-int/2addr v8, v7

    iget v9, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    mul-int/2addr v9, v7

    iget v10, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    invoke-static {v5, v8, v0, v9, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 801
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 809
    .end local v7    # "i":I
    :cond_4
    :goto_3
    invoke-static {v0, v3, p0, p1}, Lcom/itextpdf/io/image/BmpImageHelper;->indexedModel([BIILcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V

    .line 810
    return-void
.end method

.method private static readDWord(Ljava/io/InputStream;)J
    .locals 2
    .param p0, "stream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1159
    invoke-static {p0}, Lcom/itextpdf/io/image/BmpImageHelper;->readUnsignedInt(Ljava/io/InputStream;)J

    move-result-wide v0

    return-wide v0
.end method

.method private static readInt(Ljava/io/InputStream;)I
    .locals 6
    .param p0, "stream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1150
    invoke-static {p0}, Lcom/itextpdf/io/image/BmpImageHelper;->readUnsignedByte(Ljava/io/InputStream;)I

    move-result v0

    .line 1151
    .local v0, "b1":I
    invoke-static {p0}, Lcom/itextpdf/io/image/BmpImageHelper;->readUnsignedByte(Ljava/io/InputStream;)I

    move-result v1

    .line 1152
    .local v1, "b2":I
    invoke-static {p0}, Lcom/itextpdf/io/image/BmpImageHelper;->readUnsignedByte(Ljava/io/InputStream;)I

    move-result v2

    .line 1153
    .local v2, "b3":I
    invoke-static {p0}, Lcom/itextpdf/io/image/BmpImageHelper;->readUnsignedByte(Ljava/io/InputStream;)I

    move-result v3

    .line 1154
    .local v3, "b4":I
    shl-int/lit8 v4, v3, 0x18

    shl-int/lit8 v5, v2, 0x10

    or-int/2addr v4, v5

    shl-int/lit8 v5, v1, 0x8

    or-int/2addr v4, v5

    or-int/2addr v4, v0

    return v4
.end method

.method private static readLong(Ljava/io/InputStream;)I
    .locals 1
    .param p0, "stream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1164
    invoke-static {p0}, Lcom/itextpdf/io/image/BmpImageHelper;->readInt(Ljava/io/InputStream;)I

    move-result v0

    return v0
.end method

.method private static readPalette(ILcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V
    .locals 4
    .param p0, "sizeOfPalette"    # I
    .param p1, "bmp"    # Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 660
    if-nez p0, :cond_0

    .line 661
    return-void

    .line 664
    :cond_0
    new-array v0, p0, [B

    iput-object v0, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->palette:[B

    .line 665
    const/4 v0, 0x0

    .line 666
    .local v0, "bytesRead":I
    :goto_0
    if-ge v0, p0, :cond_2

    .line 667
    iget-object v1, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    iget-object v2, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->palette:[B

    sub-int v3, p0, v0

    invoke-virtual {v1, v2, v0, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .line 668
    .local v1, "r":I
    if-ltz v1, :cond_1

    .line 671
    add-int/2addr v0, v1

    .line 672
    .end local v1    # "r":I
    goto :goto_0

    .line 669
    .restart local v1    # "r":I
    :cond_1
    new-instance v2, Lcom/itextpdf/io/exceptions/IOException;

    const-string v3, "Incomplete palette."

    invoke-direct {v2, v3}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 673
    .end local v1    # "r":I
    :cond_2
    iget-object v1, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    const-string/jumbo v2, "palette"

    iget-object v3, p1, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->palette:[B

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 674
    return-void
.end method

.method private static readRLE4(Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V
    .locals 14
    .param p0, "bmp"    # Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 994
    iget-wide v0, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->imageSize:J

    long-to-int v0, v0

    .line 995
    .local v0, "imSize":I
    if-nez v0, :cond_0

    .line 996
    iget-wide v1, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitmapFileSize:J

    iget-wide v3, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitmapOffset:J

    sub-long/2addr v1, v3

    long-to-int v0, v1

    .line 1000
    :cond_0
    new-array v1, v0, [B

    .line 1001
    .local v1, "values":[B
    const/4 v2, 0x0

    .line 1002
    .local v2, "bytesRead":I
    :goto_0
    if-ge v2, v0, :cond_1

    .line 1003
    iget-object v3, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    sub-int v4, v0, v2

    invoke-virtual {v3, v1, v2, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v3

    add-int/2addr v2, v3

    goto :goto_0

    .line 1008
    :cond_1
    const/4 v3, 0x0

    invoke-static {v3, v1, p0}, Lcom/itextpdf/io/image/BmpImageHelper;->decodeRLE(Z[BLcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)[B

    move-result-object v3

    .line 1011
    .local v3, "val":[B
    iget-boolean v4, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->isBottomUp:Z

    if-eqz v4, :cond_3

    .line 1013
    move-object v4, v3

    .line 1014
    .local v4, "inverted":[B
    iget v5, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    iget v6, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    mul-int/2addr v5, v6

    new-array v3, v5, [B

    .line 1015
    const/4 v5, 0x0

    .line 1017
    .local v5, "l":I
    iget v6, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    add-int/lit8 v6, v6, -0x1

    .local v6, "i":I
    :goto_1
    if-ltz v6, :cond_3

    .line 1018
    iget v7, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    mul-int/2addr v7, v6

    .line 1019
    .local v7, "index":I
    iget v8, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    add-int/2addr v8, v5

    .line 1020
    .local v8, "lineEnd":I
    :goto_2
    if-eq v5, v8, :cond_2

    .line 1021
    add-int/lit8 v9, v5, 0x1

    .end local v5    # "l":I
    .local v9, "l":I
    add-int/lit8 v10, v7, 0x1

    .end local v7    # "index":I
    .local v10, "index":I
    aget-byte v7, v4, v7

    aput-byte v7, v3, v5

    move v5, v9

    move v7, v10

    goto :goto_2

    .line 1017
    .end local v9    # "l":I
    .end local v10    # "index":I
    .restart local v5    # "l":I
    .restart local v7    # "index":I
    :cond_2
    add-int/lit8 v6, v6, -0x1

    goto :goto_1

    .line 1025
    .end local v4    # "inverted":[B
    .end local v5    # "l":I
    .end local v6    # "i":I
    .end local v7    # "index":I
    .end local v8    # "lineEnd":I
    :cond_3
    iget v4, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    add-int/lit8 v4, v4, 0x1

    div-int/lit8 v4, v4, 0x2

    .line 1026
    .local v4, "stride":I
    iget v5, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    mul-int/2addr v5, v4

    new-array v5, v5, [B

    .line 1027
    .local v5, "bdata":[B
    const/4 v6, 0x0

    .line 1028
    .local v6, "ptr":I
    const/4 v7, 0x0

    .line 1029
    .local v7, "sh":I
    const/4 v8, 0x0

    .local v8, "h":I
    :goto_3
    iget v9, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    const/4 v10, 0x4

    if-ge v8, v9, :cond_6

    .line 1030
    const/4 v9, 0x0

    .local v9, "w":I
    :goto_4
    iget v11, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    if-ge v9, v11, :cond_5

    .line 1031
    and-int/lit8 v11, v9, 0x1

    if-nez v11, :cond_4

    .line 1032
    div-int/lit8 v11, v9, 0x2

    add-int/2addr v11, v7

    add-int/lit8 v12, v6, 0x1

    .end local v6    # "ptr":I
    .local v12, "ptr":I
    aget-byte v6, v3, v6

    shl-int/2addr v6, v10

    int-to-byte v6, v6

    aput-byte v6, v5, v11

    move v6, v12

    goto :goto_5

    .line 1034
    .end local v12    # "ptr":I
    .restart local v6    # "ptr":I
    :cond_4
    div-int/lit8 v11, v9, 0x2

    add-int/2addr v11, v7

    aget-byte v12, v5, v11

    add-int/lit8 v13, v6, 0x1

    .end local v6    # "ptr":I
    .local v13, "ptr":I
    aget-byte v6, v3, v6

    and-int/lit8 v6, v6, 0xf

    int-to-byte v6, v6

    or-int/2addr v6, v12

    int-to-byte v6, v6

    aput-byte v6, v5, v11

    move v6, v13

    .line 1030
    .end local v13    # "ptr":I
    .restart local v6    # "ptr":I
    :goto_5
    add-int/lit8 v9, v9, 0x1

    goto :goto_4

    .line 1036
    .end local v9    # "w":I
    :cond_5
    add-int/2addr v7, v4

    .line 1029
    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    .line 1038
    .end local v8    # "h":I
    :cond_6
    invoke-static {v5, v10, v10, p0}, Lcom/itextpdf/io/image/BmpImageHelper;->indexedModel([BIILcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V

    .line 1039
    return-void
.end method

.method private static readRLE8(Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V
    .locals 9
    .param p0, "bmp"    # Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 955
    iget-wide v0, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->imageSize:J

    long-to-int v0, v0

    .line 956
    .local v0, "imSize":I
    if-nez v0, :cond_0

    .line 957
    iget-wide v1, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitmapFileSize:J

    iget-wide v3, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->bitmapOffset:J

    sub-long/2addr v1, v3

    long-to-int v0, v1

    .line 961
    :cond_0
    new-array v1, v0, [B

    .line 962
    .local v1, "values":[B
    const/4 v2, 0x0

    .line 963
    .local v2, "bytesRead":I
    :goto_0
    if-ge v2, v0, :cond_1

    .line 964
    iget-object v3, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->inputStream:Ljava/io/InputStream;

    sub-int v4, v0, v2

    invoke-virtual {v3, v1, v2, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v3

    add-int/2addr v2, v3

    goto :goto_0

    .line 969
    :cond_1
    const/4 v3, 0x1

    invoke-static {v3, v1, p0}, Lcom/itextpdf/io/image/BmpImageHelper;->decodeRLE(Z[BLcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)[B

    move-result-object v3

    .line 972
    .local v3, "val":[B
    iget v4, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    iget v5, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    mul-int/2addr v4, v5

    .line 974
    .end local v0    # "imSize":I
    .local v4, "imSize":I
    iget-boolean v0, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->isBottomUp:Z

    if-eqz v0, :cond_3

    .line 979
    array-length v0, v3

    new-array v0, v0, [B

    .line 980
    .local v0, "temp":[B
    iget v5, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->width:I

    .line 981
    .local v5, "bytesPerScanline":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    iget v7, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->height:I

    if-ge v6, v7, :cond_2

    .line 982
    add-int/lit8 v7, v6, 0x1

    mul-int/2addr v7, v5

    sub-int v7, v4, v7

    mul-int v8, v6, v5

    invoke-static {v3, v7, v0, v8, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 981
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 987
    .end local v6    # "i":I
    :cond_2
    move-object v3, v0

    .line 989
    .end local v0    # "temp":[B
    .end local v5    # "bytesPerScanline":I
    :cond_3
    const/16 v0, 0x8

    const/4 v5, 0x4

    invoke-static {v3, v0, v5, p0}, Lcom/itextpdf/io/image/BmpImageHelper;->indexedModel([BIILcom/itextpdf/io/image/BmpImageHelper$BmpParameters;)V

    .line 990
    return-void
.end method

.method private static readShort(Ljava/io/InputStream;)I
    .locals 3
    .param p0, "stream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1128
    invoke-static {p0}, Lcom/itextpdf/io/image/BmpImageHelper;->readUnsignedByte(Ljava/io/InputStream;)I

    move-result v0

    .line 1129
    .local v0, "b1":I
    invoke-static {p0}, Lcom/itextpdf/io/image/BmpImageHelper;->readUnsignedByte(Ljava/io/InputStream;)I

    move-result v1

    .line 1130
    .local v1, "b2":I
    shl-int/lit8 v2, v1, 0x8

    or-int/2addr v2, v0

    return v2
.end method

.method private static readUnsignedByte(Ljava/io/InputStream;)I
    .locals 1
    .param p0, "stream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1116
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v0

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method private static readUnsignedInt(Ljava/io/InputStream;)J
    .locals 8
    .param p0, "stream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1140
    invoke-static {p0}, Lcom/itextpdf/io/image/BmpImageHelper;->readUnsignedByte(Ljava/io/InputStream;)I

    move-result v0

    .line 1141
    .local v0, "b1":I
    invoke-static {p0}, Lcom/itextpdf/io/image/BmpImageHelper;->readUnsignedByte(Ljava/io/InputStream;)I

    move-result v1

    .line 1142
    .local v1, "b2":I
    invoke-static {p0}, Lcom/itextpdf/io/image/BmpImageHelper;->readUnsignedByte(Ljava/io/InputStream;)I

    move-result v2

    .line 1143
    .local v2, "b3":I
    invoke-static {p0}, Lcom/itextpdf/io/image/BmpImageHelper;->readUnsignedByte(Ljava/io/InputStream;)I

    move-result v3

    .line 1144
    .local v3, "b4":I
    shl-int/lit8 v4, v3, 0x18

    shl-int/lit8 v5, v2, 0x10

    or-int/2addr v4, v5

    shl-int/lit8 v5, v1, 0x8

    or-int/2addr v4, v5

    or-int/2addr v4, v0

    int-to-long v4, v4

    .line 1145
    .local v4, "l":J
    const-wide/16 v6, -0x1

    and-long/2addr v6, v4

    return-wide v6
.end method

.method private static readUnsignedShort(Ljava/io/InputStream;)I
    .locals 4
    .param p0, "stream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1121
    invoke-static {p0}, Lcom/itextpdf/io/image/BmpImageHelper;->readUnsignedByte(Ljava/io/InputStream;)I

    move-result v0

    .line 1122
    .local v0, "b1":I
    invoke-static {p0}, Lcom/itextpdf/io/image/BmpImageHelper;->readUnsignedByte(Ljava/io/InputStream;)I

    move-result v1

    .line 1123
    .local v1, "b2":I
    shl-int/lit8 v2, v1, 0x8

    or-int/2addr v2, v0

    const v3, 0xffff

    and-int/2addr v2, v3

    return v2
.end method

.method private static readWord(Ljava/io/InputStream;)I
    .locals 1
    .param p0, "stream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1135
    invoke-static {p0}, Lcom/itextpdf/io/image/BmpImageHelper;->readUnsignedShort(Ljava/io/InputStream;)I

    move-result v0

    return v0
.end method
