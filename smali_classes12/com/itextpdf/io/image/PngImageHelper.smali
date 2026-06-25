.class Lcom/itextpdf/io/image/PngImageHelper;
.super Ljava/lang/Object;
.source "PngImageHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/io/image/PngImageHelper$PngParameters;
    }
.end annotation


# static fields
.field public static final IDAT:Ljava/lang/String; = "IDAT"

.field public static final IEND:Ljava/lang/String; = "IEND"

.field public static final IHDR:Ljava/lang/String; = "IHDR"

.field public static final PLTE:Ljava/lang/String; = "PLTE"

.field public static final PNGID:[I

.field private static final PNG_FILTER_AVERAGE:I = 0x3

.field private static final PNG_FILTER_NONE:I = 0x0

.field private static final PNG_FILTER_PAETH:I = 0x4

.field private static final PNG_FILTER_SUB:I = 0x1

.field private static final PNG_FILTER_UP:I = 0x2

.field private static final TRANSFERSIZE:I = 0x1000

.field public static final cHRM:Ljava/lang/String; = "cHRM"

.field public static final gAMA:Ljava/lang/String; = "gAMA"

.field public static final iCCP:Ljava/lang/String; = "iCCP"

.field private static final intents:[Ljava/lang/String;

.field public static final pHYs:Ljava/lang/String; = "pHYs"

.field public static final sRGB:Ljava/lang/String; = "sRGB"

.field public static final tRNS:Ljava/lang/String; = "tRNS"


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 80
    const/16 v0, 0x8

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/itextpdf/io/image/PngImageHelper;->PNGID:[I

    .line 138
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "/Perceptual"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "/RelativeColorimetric"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "/Saturation"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "/AbsoluteColormetric"

    aput-object v2, v0, v1

    sput-object v0, Lcom/itextpdf/io/image/PngImageHelper;->intents:[Ljava/lang/String;

    return-void

    nop

    :array_0
    .array-data 4
        0x89
        0x50
        0x4e
        0x47
        0xd
        0xa
        0x1a
        0xa
    .end array-data
.end method

.method constructor <init>()V
    .locals 0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static checkMarker(Ljava/lang/String;)Z
    .locals 5
    .param p0, "s"    # Ljava/lang/String;

    .line 414
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x4

    if-eq v0, v2, :cond_0

    .line 415
    return v1

    .line 416
    :cond_0
    const/4 v0, 0x0

    .local v0, "k":I
    :goto_0
    if-ge v0, v2, :cond_4

    .line 417
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 418
    .local v3, "c":C
    const/16 v4, 0x61

    if-lt v3, v4, :cond_1

    const/16 v4, 0x7a

    if-le v3, v4, :cond_2

    :cond_1
    const/16 v4, 0x41

    if-lt v3, v4, :cond_3

    const/16 v4, 0x5a

    if-le v3, v4, :cond_2

    goto :goto_1

    .line 416
    .end local v3    # "c":C
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 419
    .restart local v3    # "c":C
    :cond_3
    :goto_1
    return v1

    .line 421
    .end local v0    # "k":I
    .end local v3    # "c":C
    :cond_4
    const/4 v0, 0x1

    return v0
.end method

.method private static decodeAverageFilter([B[BII)V
    .locals 5
    .param p0, "curr"    # [B
    .param p1, "prev"    # [B
    .param p2, "count"    # I
    .param p3, "bpp"    # I

    .line 699
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p3, :cond_0

    .line 700
    aget-byte v1, p0, v0

    and-int/lit16 v1, v1, 0xff

    .line 701
    .local v1, "raw":I
    aget-byte v2, p1, v0

    and-int/lit16 v2, v2, 0xff

    .line 702
    .local v2, "priorRow":I
    div-int/lit8 v3, v2, 0x2

    add-int/2addr v3, v1

    int-to-byte v3, v3

    aput-byte v3, p0, v0

    .line 699
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 705
    .end local v0    # "i":I
    .end local v1    # "raw":I
    .end local v2    # "priorRow":I
    :cond_0
    move v0, p3

    .restart local v0    # "i":I
    :goto_1
    if-ge v0, p2, :cond_1

    .line 706
    aget-byte v1, p0, v0

    and-int/lit16 v1, v1, 0xff

    .line 707
    .restart local v1    # "raw":I
    sub-int v2, v0, p3

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    .line 708
    .local v2, "priorPixel":I
    aget-byte v3, p1, v0

    and-int/lit16 v3, v3, 0xff

    .line 709
    .local v3, "priorRow":I
    add-int v4, v2, v3

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v4, v1

    int-to-byte v4, v4

    aput-byte v4, p0, v0

    .line 705
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 711
    .end local v0    # "i":I
    .end local v1    # "raw":I
    .end local v2    # "priorPixel":I
    .end local v3    # "priorRow":I
    :cond_1
    return-void
.end method

.method private static decodeIdat(Lcom/itextpdf/io/image/PngImageHelper$PngParameters;)V
    .locals 12
    .param p0, "png"    # Lcom/itextpdf/io/image/PngImageHelper$PngParameters;

    .line 425
    iget v0, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->bitDepth:I

    .line 426
    .local v0, "nbitDepth":I
    const/16 v1, 0x10

    if-ne v0, v1, :cond_0

    .line 427
    const/16 v0, 0x8

    move v7, v0

    goto :goto_0

    .line 426
    :cond_0
    move v7, v0

    .line 428
    .end local v0    # "nbitDepth":I
    .local v7, "nbitDepth":I
    :goto_0
    const/4 v0, -0x1

    .line 429
    .local v0, "size":I
    iget v2, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->bitDepth:I

    const/4 v8, 0x2

    const/4 v9, 0x1

    if-ne v2, v1, :cond_1

    move v1, v8

    goto :goto_1

    :cond_1
    move v1, v9

    :goto_1
    iput v1, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->bytesPerPixel:I

    .line 430
    iget-object v1, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->image:Lcom/itextpdf/io/image/PngImageData;

    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngImageData;->getColorType()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    :pswitch_0
    move v10, v0

    goto :goto_2

    .line 448
    :pswitch_1
    iget v1, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->width:I

    mul-int/lit8 v1, v1, 0x3

    iget v2, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->height:I

    mul-int v0, v1, v2

    .line 449
    iget v1, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->bytesPerPixel:I

    mul-int/lit8 v1, v1, 0x4

    iput v1, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->bytesPerPixel:I

    move v10, v0

    goto :goto_2

    .line 444
    :pswitch_2
    iget v1, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->width:I

    iget v2, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->height:I

    mul-int v0, v1, v2

    .line 445
    iget v1, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->bytesPerPixel:I

    mul-int/2addr v1, v8

    iput v1, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->bytesPerPixel:I

    .line 446
    move v10, v0

    goto :goto_2

    .line 439
    :pswitch_3
    iget v1, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->interlaceMethod:I

    if-ne v1, v9, :cond_2

    .line 440
    iget v1, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->width:I

    mul-int/2addr v1, v7

    add-int/lit8 v1, v1, 0x7

    div-int/lit8 v1, v1, 0x8

    iget v2, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->height:I

    mul-int/2addr v1, v2

    move v0, v1

    .line 441
    :cond_2
    iput v9, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->bytesPerPixel:I

    .line 442
    move v10, v0

    goto :goto_2

    .line 435
    :pswitch_4
    iget v1, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->width:I

    mul-int/lit8 v1, v1, 0x3

    iget v2, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->height:I

    mul-int v0, v1, v2

    .line 436
    iget v1, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->bytesPerPixel:I

    mul-int/lit8 v1, v1, 0x3

    iput v1, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->bytesPerPixel:I

    .line 437
    move v10, v0

    goto :goto_2

    .line 432
    :pswitch_5
    iget v1, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->width:I

    mul-int/2addr v1, v7

    add-int/lit8 v1, v1, 0x7

    div-int/lit8 v1, v1, 0x8

    iget v2, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->height:I

    mul-int v0, v1, v2

    .line 433
    move v10, v0

    .line 452
    .end local v0    # "size":I
    .local v10, "size":I
    :goto_2
    if-ltz v10, :cond_3

    .line 453
    new-array v0, v10, [B

    iput-object v0, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->imageData:[B

    .line 454
    :cond_3
    iget-boolean v0, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->palShades:Z

    if-eqz v0, :cond_4

    .line 455
    iget v0, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->width:I

    iget v1, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->height:I

    mul-int/2addr v0, v1

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->smask:[B

    goto :goto_3

    .line 456
    :cond_4
    iget-boolean v0, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->genBWMask:Z

    if-eqz v0, :cond_5

    .line 457
    iget v0, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->width:I

    add-int/lit8 v0, v0, 0x7

    div-int/lit8 v0, v0, 0x8

    iget v1, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->height:I

    mul-int/2addr v0, v1

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->smask:[B

    .line 458
    :cond_5
    :goto_3
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->idat:Lcom/itextpdf/io/source/ByteArrayOutputStream;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    move-object v11, v0

    .line 459
    .local v11, "bai":Ljava/io/ByteArrayInputStream;
    invoke-static {v11}, Lcom/itextpdf/io/util/FilterUtil;->getInflaterInputStream(Ljava/io/InputStream;)Ljava/io/InputStream;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->dataStream:Ljava/io/InputStream;

    .line 461
    iget v0, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->interlaceMethod:I

    if-eq v0, v9, :cond_6

    .line 462
    iget v4, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->width:I

    iget v5, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->height:I

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x1

    move-object v6, p0

    invoke-static/range {v0 .. v6}, Lcom/itextpdf/io/image/PngImageHelper;->decodePass(IIIIIILcom/itextpdf/io/image/PngImageHelper$PngParameters;)V

    goto :goto_4

    .line 464
    :cond_6
    iget v0, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->width:I

    add-int/lit8 v0, v0, 0x7

    div-int/lit8 v4, v0, 0x8

    iget v0, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->height:I

    add-int/lit8 v0, v0, 0x7

    div-int/lit8 v5, v0, 0x8

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/16 v2, 0x8

    const/16 v3, 0x8

    move-object v6, p0

    invoke-static/range {v0 .. v6}, Lcom/itextpdf/io/image/PngImageHelper;->decodePass(IIIIIILcom/itextpdf/io/image/PngImageHelper$PngParameters;)V

    .line 465
    iget v0, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->width:I

    add-int/lit8 v0, v0, 0x3

    div-int/lit8 v4, v0, 0x8

    iget v0, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->height:I

    add-int/lit8 v0, v0, 0x7

    div-int/lit8 v5, v0, 0x8

    const/4 v0, 0x4

    invoke-static/range {v0 .. v6}, Lcom/itextpdf/io/image/PngImageHelper;->decodePass(IIIIIILcom/itextpdf/io/image/PngImageHelper$PngParameters;)V

    .line 466
    iget v0, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->width:I

    add-int/lit8 v0, v0, 0x3

    div-int/lit8 v4, v0, 0x4

    iget v0, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->height:I

    add-int/lit8 v0, v0, 0x3

    div-int/lit8 v5, v0, 0x8

    const/4 v0, 0x0

    const/4 v1, 0x4

    const/4 v2, 0x4

    invoke-static/range {v0 .. v6}, Lcom/itextpdf/io/image/PngImageHelper;->decodePass(IIIIIILcom/itextpdf/io/image/PngImageHelper$PngParameters;)V

    .line 467
    iget v0, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->width:I

    add-int/2addr v0, v9

    div-int/lit8 v4, v0, 0x4

    iget v0, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->height:I

    add-int/lit8 v0, v0, 0x3

    div-int/lit8 v5, v0, 0x4

    const/4 v0, 0x2

    const/4 v1, 0x0

    const/4 v3, 0x4

    invoke-static/range {v0 .. v6}, Lcom/itextpdf/io/image/PngImageHelper;->decodePass(IIIIIILcom/itextpdf/io/image/PngImageHelper$PngParameters;)V

    .line 468
    iget v0, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->width:I

    add-int/2addr v0, v9

    div-int/lit8 v4, v0, 0x2

    iget v0, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->height:I

    add-int/2addr v0, v9

    div-int/lit8 v5, v0, 0x4

    const/4 v0, 0x0

    const/4 v1, 0x2

    const/4 v2, 0x2

    invoke-static/range {v0 .. v6}, Lcom/itextpdf/io/image/PngImageHelper;->decodePass(IIIIIILcom/itextpdf/io/image/PngImageHelper$PngParameters;)V

    .line 469
    iget v0, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->width:I

    div-int/lit8 v4, v0, 0x2

    iget v0, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->height:I

    add-int/2addr v0, v9

    div-int/lit8 v5, v0, 0x2

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v3, 0x2

    invoke-static/range {v0 .. v6}, Lcom/itextpdf/io/image/PngImageHelper;->decodePass(IIIIIILcom/itextpdf/io/image/PngImageHelper$PngParameters;)V

    .line 470
    iget v4, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->width:I

    iget v0, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->height:I

    div-int/lit8 v5, v0, 0x2

    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x1

    invoke-static/range {v0 .. v6}, Lcom/itextpdf/io/image/PngImageHelper;->decodePass(IIIIIILcom/itextpdf/io/image/PngImageHelper$PngParameters;)V

    .line 473
    :goto_4
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private static decodePaethFilter([B[BII)V
    .locals 6
    .param p0, "curr"    # [B
    .param p1, "prev"    # [B
    .param p2, "count"    # I
    .param p3, "bpp"    # I

    .line 731
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p3, :cond_0

    .line 732
    aget-byte v1, p0, v0

    and-int/lit16 v1, v1, 0xff

    .line 733
    .local v1, "raw":I
    aget-byte v2, p1, v0

    and-int/lit16 v2, v2, 0xff

    .line 734
    .local v2, "priorRow":I
    add-int v3, v1, v2

    int-to-byte v3, v3

    aput-byte v3, p0, v0

    .line 731
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 737
    .end local v0    # "i":I
    .end local v1    # "raw":I
    .end local v2    # "priorRow":I
    :cond_0
    move v0, p3

    .restart local v0    # "i":I
    :goto_1
    if-ge v0, p2, :cond_1

    .line 738
    aget-byte v1, p0, v0

    and-int/lit16 v1, v1, 0xff

    .line 739
    .restart local v1    # "raw":I
    sub-int v2, v0, p3

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    .line 740
    .local v2, "priorPixel":I
    aget-byte v3, p1, v0

    and-int/lit16 v3, v3, 0xff

    .line 741
    .local v3, "priorRow":I
    sub-int v4, v0, p3

    aget-byte v4, p1, v4

    and-int/lit16 v4, v4, 0xff

    .line 742
    .local v4, "priorRowPixel":I
    invoke-static {v2, v3, v4}, Lcom/itextpdf/io/image/PngImageHelper;->paethPredictor(III)I

    move-result v5

    add-int/2addr v5, v1

    int-to-byte v5, v5

    aput-byte v5, p0, v0

    .line 737
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 746
    .end local v0    # "i":I
    .end local v1    # "raw":I
    .end local v2    # "priorPixel":I
    .end local v3    # "priorRow":I
    .end local v4    # "priorRowPixel":I
    :cond_1
    return-void
.end method

.method private static decodePass(IIIIIILcom/itextpdf/io/image/PngImageHelper$PngParameters;)V
    .locals 11
    .param p0, "xOffset"    # I
    .param p1, "yOffset"    # I
    .param p2, "xStep"    # I
    .param p3, "yStep"    # I
    .param p4, "passWidth"    # I
    .param p5, "passHeight"    # I
    .param p6, "png"    # Lcom/itextpdf/io/image/PngImageHelper$PngParameters;

    .line 477
    move/from16 v1, p5

    move-object/from16 v7, p6

    if-eqz p4, :cond_2

    if-nez v1, :cond_0

    goto/16 :goto_3

    .line 481
    :cond_0
    iget v0, v7, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->inputBands:I

    mul-int/2addr v0, p4

    iget v2, v7, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->bitDepth:I

    mul-int/2addr v0, v2

    add-int/lit8 v0, v0, 0x7

    div-int/lit8 v8, v0, 0x8

    .line 482
    .local v8, "bytesPerRow":I
    new-array v0, v8, [B

    .line 483
    .local v0, "curr":[B
    new-array v2, v8, [B

    .line 487
    .local v2, "prior":[B
    const/4 v3, 0x0

    .local v3, "srcY":I
    move v4, p1

    move-object v9, v2

    move v10, v3

    move v5, v4

    move-object v2, v0

    .line 488
    .end local v0    # "curr":[B
    .end local v3    # "srcY":I
    .local v2, "curr":[B
    .local v5, "dstY":I
    .local v9, "prior":[B
    .local v10, "srcY":I
    :goto_0
    if-ge v10, v1, :cond_1

    .line 491
    const/4 v3, 0x0

    .line 493
    .local v3, "filter":I
    :try_start_0
    iget-object v0, v7, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->dataStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    move v3, v0

    .line 494
    iget-object v0, v7, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->dataStream:Ljava/io/InputStream;

    const/4 v4, 0x0

    invoke-static {v0, v2, v4, v8}, Lcom/itextpdf/io/util/StreamUtil;->readFully(Ljava/io/InputStream;[BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 497
    move v0, v3

    goto :goto_1

    .line 495
    :catch_0
    move-exception v0

    move v0, v3

    .line 499
    .end local v3    # "filter":I
    .local v0, "filter":I
    :goto_1
    packed-switch v0, :pswitch_data_0

    .line 516
    new-instance v3, Lcom/itextpdf/io/exceptions/IOException;

    const-string v4, "Unknown PNG filter."

    invoke-direct {v3, v4}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 512
    :pswitch_0
    iget v3, v7, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->bytesPerPixel:I

    invoke-static {v2, v9, v8, v3}, Lcom/itextpdf/io/image/PngImageHelper;->decodePaethFilter([B[BII)V

    .line 513
    goto :goto_2

    .line 509
    :pswitch_1
    iget v3, v7, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->bytesPerPixel:I

    invoke-static {v2, v9, v8, v3}, Lcom/itextpdf/io/image/PngImageHelper;->decodeAverageFilter([B[BII)V

    .line 510
    goto :goto_2

    .line 506
    :pswitch_2
    invoke-static {v2, v9, v8}, Lcom/itextpdf/io/image/PngImageHelper;->decodeUpFilter([B[BI)V

    .line 507
    goto :goto_2

    .line 503
    :pswitch_3
    iget v3, v7, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->bytesPerPixel:I

    invoke-static {v2, v8, v3}, Lcom/itextpdf/io/image/PngImageHelper;->decodeSubFilter([BII)V

    .line 504
    goto :goto_2

    .line 501
    :pswitch_4
    nop

    .line 519
    :goto_2
    move v3, p0

    move v4, p2

    move v6, p4

    invoke-static/range {v2 .. v7}, Lcom/itextpdf/io/image/PngImageHelper;->processPixels([BIIIILcom/itextpdf/io/image/PngImageHelper$PngParameters;)V

    .line 522
    move-object v3, v9

    .line 523
    .local v3, "tmp":[B
    move-object v9, v2

    .line 524
    move-object v2, v3

    .line 489
    .end local v0    # "filter":I
    .end local v3    # "tmp":[B
    add-int/lit8 v10, v10, 0x1

    add-int/2addr v5, p3

    move-object/from16 v7, p6

    goto :goto_0

    .line 526
    :cond_1
    return-void

    .line 478
    .end local v2    # "curr":[B
    .end local v5    # "dstY":I
    .end local v8    # "bytesPerRow":I
    .end local v9    # "prior":[B
    .end local v10    # "srcY":I
    :cond_2
    :goto_3
    return-void

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

.method private static decodeSubFilter([BII)V
    .locals 3
    .param p0, "curr"    # [B
    .param p1, "count"    # I
    .param p2, "bpp"    # I

    .line 681
    move v0, p2

    .local v0, "i":I
    :goto_0
    if-ge v0, p1, :cond_0

    .line 682
    aget-byte v1, p0, v0

    and-int/lit16 v1, v1, 0xff

    .line 683
    .local v1, "val":I
    sub-int v2, v0, p2

    aget-byte v2, p0, v2

    and-int/lit16 v2, v2, 0xff

    add-int/2addr v1, v2

    .line 684
    int-to-byte v2, v1

    aput-byte v2, p0, v0

    .line 681
    .end local v1    # "val":I
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 686
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method private static decodeUpFilter([B[BI)V
    .locals 4
    .param p0, "curr"    # [B
    .param p1, "prev"    # [B
    .param p2, "count"    # I

    .line 689
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p2, :cond_0

    .line 690
    aget-byte v1, p0, v0

    and-int/lit16 v1, v1, 0xff

    .line 691
    .local v1, "raw":I
    aget-byte v2, p1, v0

    and-int/lit16 v2, v2, 0xff

    .line 692
    .local v2, "prior":I
    add-int v3, v1, v2

    int-to-byte v3, v3

    aput-byte v3, p0, v0

    .line 689
    .end local v1    # "raw":I
    .end local v2    # "prior":I
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 694
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method private static getExpectedNumberOfColorComponents(Lcom/itextpdf/io/image/PngImageHelper$PngParameters;)I
    .locals 1
    .param p0, "png"    # Lcom/itextpdf/io/image/PngImageHelper$PngParameters;

    .line 264
    iget-object v0, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->image:Lcom/itextpdf/io/image/PngImageData;

    invoke-virtual {v0}, Lcom/itextpdf/io/image/PngImageData;->isGrayscaleImage()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x3

    :goto_0
    return v0
.end method

.method public static getInt(Ljava/io/InputStream;)I
    .locals 2
    .param p0, "pngStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 755
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v0

    shl-int/lit8 v0, v0, 0x18

    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v1

    shl-int/lit8 v1, v1, 0x10

    add-int/2addr v0, v1

    .line 756
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v1

    shl-int/lit8 v1, v1, 0x8

    add-int/2addr v0, v1

    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v1

    add-int/2addr v0, v1

    .line 755
    return v0
.end method

.method private static getPixel([BIIII)I
    .locals 4
    .param p0, "image"    # [B
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "bitDepth"    # I
    .param p4, "bytesPerRow"    # I

    .line 625
    const/16 v0, 0x8

    if-ne p3, v0, :cond_0

    .line 626
    mul-int v0, p4, p2

    add-int/2addr v0, p1

    .line 627
    .local v0, "pos":I
    aget-byte v1, p0, v0

    and-int/lit16 v1, v1, 0xff

    return v1

    .line 629
    .end local v0    # "pos":I
    :cond_0
    mul-int v1, p4, p2

    div-int v2, v0, p3

    div-int v2, p1, v2

    add-int/2addr v1, v2

    .line 630
    .local v1, "pos":I
    aget-byte v2, p0, v1

    div-int v3, v0, p3

    rem-int v3, p1, v3

    mul-int/2addr v3, p3

    sub-int/2addr v0, v3

    sub-int/2addr v0, p3

    shr-int v0, v2, v0

    .line 631
    .local v0, "v":I
    const/4 v2, 0x1

    shl-int v3, v2, p3

    sub-int/2addr v3, v2

    and-int v2, v0, v3

    return v2
.end method

.method private static getPixel([BLcom/itextpdf/io/image/PngImageHelper$PngParameters;)[I
    .locals 9
    .param p0, "curr"    # [B
    .param p1, "png"    # Lcom/itextpdf/io/image/PngImageHelper$PngParameters;

    .line 652
    iget v0, p1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->bitDepth:I

    const/16 v1, 0x8

    const/4 v2, 0x1

    sparse-switch v0, :sswitch_data_0

    .line 666
    array-length v0, p0

    mul-int/2addr v0, v1

    iget v3, p1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->bitDepth:I

    div-int/2addr v0, v3

    new-array v0, v0, [I

    .line 667
    .local v0, "res":[I
    const/4 v3, 0x0

    .line 668
    .local v3, "idx":I
    iget v4, p1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->bitDepth:I

    div-int/2addr v1, v4

    .line 669
    .local v1, "passes":I
    iget v4, p1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->bitDepth:I

    shl-int v4, v2, v4

    sub-int/2addr v4, v2

    .line 670
    .local v4, "mask":I
    const/4 v2, 0x0

    .local v2, "k":I
    goto :goto_2

    .line 660
    .end local v0    # "res":[I
    .end local v1    # "passes":I
    .end local v2    # "k":I
    .end local v3    # "idx":I
    .end local v4    # "mask":I
    :sswitch_0
    array-length v0, p0

    div-int/lit8 v0, v0, 0x2

    new-array v0, v0, [I

    .line 661
    .restart local v0    # "res":[I
    const/4 v3, 0x0

    .local v3, "k":I
    :goto_0
    array-length v4, v0

    if-ge v3, v4, :cond_0

    .line 662
    mul-int/lit8 v4, v3, 0x2

    aget-byte v4, p0, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/2addr v4, v1

    mul-int/lit8 v5, v3, 0x2

    add-int/2addr v5, v2

    aget-byte v5, p0, v5

    and-int/lit16 v5, v5, 0xff

    add-int/2addr v4, v5

    aput v4, v0, v3

    .line 661
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 663
    .end local v3    # "k":I
    :cond_0
    return-object v0

    .line 654
    .end local v0    # "res":[I
    :sswitch_1
    array-length v0, p0

    new-array v0, v0, [I

    .line 655
    .restart local v0    # "res":[I
    const/4 v1, 0x0

    .local v1, "k":I
    :goto_1
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 656
    aget-byte v2, p0, v1

    and-int/lit16 v2, v2, 0xff

    aput v2, v0, v1

    .line 655
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 657
    .end local v1    # "k":I
    :cond_1
    return-object v0

    .line 670
    .local v1, "passes":I
    .restart local v2    # "k":I
    .local v3, "idx":I
    .restart local v4    # "mask":I
    :goto_2
    array-length v5, p0

    if-ge v2, v5, :cond_3

    .line 671
    add-int/lit8 v5, v1, -0x1

    .local v5, "j":I
    :goto_3
    if-ltz v5, :cond_2

    .line 672
    add-int/lit8 v6, v3, 0x1

    .end local v3    # "idx":I
    .local v6, "idx":I
    aget-byte v7, p0, v2

    iget v8, p1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->bitDepth:I

    mul-int/2addr v8, v5

    ushr-int/2addr v7, v8

    and-int/2addr v7, v4

    aput v7, v0, v3

    .line 671
    add-int/lit8 v5, v5, -0x1

    move v3, v6

    goto :goto_3

    .line 670
    .end local v5    # "j":I
    .end local v6    # "idx":I
    .restart local v3    # "idx":I
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 675
    .end local v2    # "k":I
    :cond_3
    return-object v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x8 -> :sswitch_1
        0x10 -> :sswitch_0
    .end sparse-switch
.end method

.method public static getString(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 3
    .param p0, "pngStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 776
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 777
    .local v0, "buf":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/4 v2, 0x4

    if-ge v1, v2, :cond_0

    .line 778
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v2

    int-to-char v2, v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 777
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 780
    .end local v1    # "i":I
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getWord(Ljava/io/InputStream;)I
    .locals 2
    .param p0, "pngStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 766
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v0

    shl-int/lit8 v0, v0, 0x8

    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method private static paethPredictor(III)I
    .locals 4
    .param p0, "a"    # I
    .param p1, "b"    # I
    .param p2, "c"    # I

    .line 714
    add-int v0, p0, p1

    sub-int/2addr v0, p2

    .line 715
    .local v0, "p":I
    sub-int v1, v0, p0

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    .line 716
    .local v1, "pa":I
    sub-int v2, v0, p1

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    .line 717
    .local v2, "pb":I
    sub-int v3, v0, p2

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    .line 719
    .local v3, "pc":I
    if-gt v1, v2, :cond_0

    if-gt v1, v3, :cond_0

    .line 720
    return p0

    .line 721
    :cond_0
    if-gt v2, v3, :cond_1

    .line 722
    return p1

    .line 724
    :cond_1
    return p2
.end method

.method public static processImage(Lcom/itextpdf/io/image/ImageData;)V
    .locals 4
    .param p0, "image"    # Lcom/itextpdf/io/image/ImageData;

    .line 143
    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->getOriginalType()Lcom/itextpdf/io/image/ImageType;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/io/image/ImageType;->PNG:Lcom/itextpdf/io/image/ImageType;

    if-ne v0, v1, :cond_2

    .line 146
    const/4 v0, 0x0

    .line 148
    .local v0, "pngStream":Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->getData()[B

    move-result-object v1

    if-nez v1, :cond_0

    .line 149
    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->loadData()V

    .line 151
    :cond_0
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->getData()[B

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    move-object v0, v1

    .line 152
    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->getData()[B

    move-result-object v1

    array-length v1, v1

    iput v1, p0, Lcom/itextpdf/io/image/ImageData;->imageSize:I

    .line 153
    new-instance v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;

    move-object v2, p0

    check-cast v2, Lcom/itextpdf/io/image/PngImageData;

    invoke-direct {v1, v2}, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;-><init>(Lcom/itextpdf/io/image/PngImageData;)V

    .line 154
    .local v1, "png":Lcom/itextpdf/io/image/PngImageHelper$PngParameters;
    invoke-static {v0, v1}, Lcom/itextpdf/io/image/PngImageHelper;->processPng(Ljava/io/InputStream;Lcom/itextpdf/io/image/PngImageHelper$PngParameters;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 158
    nop

    .line 160
    :try_start_1
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 162
    :goto_0
    goto :goto_1

    .line 161
    :catch_0
    move-exception v2

    goto :goto_0

    .line 165
    :goto_1
    iget-object v2, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->image:Lcom/itextpdf/io/image/PngImageData;

    iget-object v3, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->additional:Ljava/util/Map;

    invoke-static {v2, v3}, Lcom/itextpdf/io/image/RawImageHelper;->updateImageAttributes(Lcom/itextpdf/io/image/RawImageData;Ljava/util/Map;)V

    .line 166
    return-void

    .line 158
    .end local v1    # "png":Lcom/itextpdf/io/image/PngImageHelper$PngParameters;
    :catchall_0
    move-exception v1

    goto :goto_2

    .line 155
    :catch_1
    move-exception v1

    .line 156
    .local v1, "e":Ljava/io/IOException;
    :try_start_2
    new-instance v2, Lcom/itextpdf/io/exceptions/IOException;

    const-string v3, "PNG image exception."

    invoke-direct {v2, v3, v1}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .end local v0    # "pngStream":Ljava/io/InputStream;
    .end local p0    # "image":Lcom/itextpdf/io/image/ImageData;
    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 158
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v0    # "pngStream":Ljava/io/InputStream;
    .restart local p0    # "image":Lcom/itextpdf/io/image/ImageData;
    :goto_2
    if-eqz v0, :cond_1

    .line 160
    :try_start_3
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 162
    goto :goto_3

    .line 161
    :catch_2
    move-exception v2

    .line 164
    :cond_1
    :goto_3
    throw v1

    .line 144
    .end local v0    # "pngStream":Ljava/io/InputStream;
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "PNG image expected"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static processPixels([BIIIILcom/itextpdf/io/image/PngImageHelper$PngParameters;)V
    .locals 24
    .param p0, "curr"    # [B
    .param p1, "xOffset"    # I
    .param p2, "step"    # I
    .param p3, "y"    # I
    .param p4, "width"    # I
    .param p5, "png"    # Lcom/itextpdf/io/image/PngImageHelper$PngParameters;

    .line 530
    move/from16 v0, p4

    move-object/from16 v1, p5

    iget-object v2, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->image:Lcom/itextpdf/io/image/PngImageData;

    invoke-virtual {v2}, Lcom/itextpdf/io/image/PngImageData;->getColorType()I

    move-result v2

    .line 532
    .local v2, "colorType":I
    move-object/from16 v3, p0

    invoke-static {v3, v1}, Lcom/itextpdf/io/image/PngImageHelper;->getPixel([BLcom/itextpdf/io/image/PngImageHelper$PngParameters;)[I

    move-result-object v5

    .line 533
    .local v5, "outPixel":[I
    const/4 v4, 0x0

    .line 534
    .local v4, "sizes":I
    packed-switch v2, :pswitch_data_0

    :pswitch_0
    move v7, v4

    goto :goto_0

    .line 542
    :pswitch_1
    const/4 v4, 0x3

    move v7, v4

    goto :goto_0

    .line 538
    :pswitch_2
    const/4 v4, 0x1

    .line 539
    move v7, v4

    .line 545
    .end local v4    # "sizes":I
    .local v7, "sizes":I
    :goto_0
    iget-object v4, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->imageData:[B

    const/16 v12, 0x10

    const/16 v13, 0x8

    if-eqz v4, :cond_2

    .line 546
    move/from16 v4, p1

    .line 547
    .local v4, "dstX":I
    iget v6, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->width:I

    mul-int/2addr v6, v7

    iget v8, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->bitDepth:I

    if-ne v8, v12, :cond_0

    move v8, v13

    goto :goto_1

    :cond_0
    iget v8, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->bitDepth:I

    :goto_1
    mul-int/2addr v6, v8

    add-int/lit8 v6, v6, 0x7

    div-int/lit8 v11, v6, 0x8

    .line 548
    .local v11, "yStride":I
    const/4 v6, 0x0

    move v8, v4

    move v14, v6

    .end local v4    # "dstX":I
    .local v8, "dstX":I
    .local v14, "srcX":I
    :goto_2
    if-ge v14, v0, :cond_1

    .line 549
    iget-object v4, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->imageData:[B

    iget v6, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->inputBands:I

    mul-int/2addr v6, v14

    iget v10, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->bitDepth:I

    move/from16 v9, p3

    invoke-static/range {v4 .. v11}, Lcom/itextpdf/io/image/PngImageHelper;->setPixel([B[IIIIIII)V

    .line 550
    move/from16 v23, v7

    .end local v7    # "sizes":I
    .local v23, "sizes":I
    add-int v8, v8, p2

    .line 548
    add-int/lit8 v14, v14, 0x1

    goto :goto_2

    .end local v23    # "sizes":I
    .restart local v7    # "sizes":I
    :cond_1
    move/from16 v23, v7

    .end local v7    # "sizes":I
    .restart local v23    # "sizes":I
    goto :goto_3

    .line 545
    .end local v8    # "dstX":I
    .end local v11    # "yStride":I
    .end local v14    # "srcX":I
    .end local v23    # "sizes":I
    .restart local v7    # "sizes":I
    :cond_2
    move/from16 v23, v7

    .line 553
    .end local v7    # "sizes":I
    .restart local v23    # "sizes":I
    :goto_3
    iget-boolean v4, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->palShades:Z

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-eqz v4, :cond_8

    .line 554
    and-int/lit8 v4, v2, 0x4

    if-eqz v4, :cond_5

    .line 555
    iget v4, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->bitDepth:I

    if-ne v4, v12, :cond_3

    .line 556
    const/4 v4, 0x0

    .local v4, "k":I
    :goto_4
    if-ge v4, v0, :cond_3

    .line 557
    iget v6, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->inputBands:I

    mul-int/2addr v6, v4

    add-int v6, v6, v23

    aget v7, v5, v6

    ushr-int/2addr v7, v13

    aput v7, v5, v6

    .line 556
    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .line 559
    .end local v4    # "k":I
    :cond_3
    iget v11, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->width:I

    .line 560
    .restart local v11    # "yStride":I
    move/from16 v4, p1

    .line 561
    .local v4, "dstX":I
    const/4 v6, 0x0

    move v8, v4

    move v12, v6

    .end local v4    # "dstX":I
    .restart local v8    # "dstX":I
    .local v12, "srcX":I
    :goto_5
    if-ge v12, v0, :cond_4

    .line 562
    iget-object v4, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->smask:[B

    iget v6, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->inputBands:I

    mul-int/2addr v6, v12

    add-int v6, v6, v23

    const/4 v7, 0x1

    const/16 v10, 0x8

    move/from16 v9, p3

    invoke-static/range {v4 .. v11}, Lcom/itextpdf/io/image/PngImageHelper;->setPixel([B[IIIIIII)V

    .line 563
    add-int v8, v8, p2

    .line 561
    add-int/lit8 v12, v12, 0x1

    goto :goto_5

    .line 565
    .end local v11    # "yStride":I
    :cond_4
    goto/16 :goto_e

    .line 566
    .end local v8    # "dstX":I
    .end local v12    # "srcX":I
    :cond_5
    iget v4, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->width:I

    .line 567
    .local v4, "yStride":I
    new-array v7, v7, [I

    .line 568
    .local v7, "v":[I
    move/from16 v8, p1

    .line 569
    .restart local v8    # "dstX":I
    const/4 v9, 0x0

    move/from16 v19, v8

    .end local v8    # "dstX":I
    .local v9, "srcX":I
    .local v19, "dstX":I
    :goto_6
    if-ge v9, v0, :cond_7

    .line 570
    aget v8, v5, v9

    .line 571
    .local v8, "idx":I
    iget-object v10, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->trans:[B

    array-length v10, v10

    if-ge v8, v10, :cond_6

    .line 572
    iget-object v10, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->trans:[B

    aget-byte v10, v10, v8

    aput v10, v7, v6

    goto :goto_7

    .line 575
    :cond_6
    const/16 v10, 0xff

    aput v10, v7, v6

    .line 577
    :goto_7
    iget-object v15, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->smask:[B

    const/16 v18, 0x1

    const/16 v21, 0x8

    const/16 v17, 0x0

    move/from16 v20, p3

    move/from16 v22, v4

    move-object/from16 v16, v7

    .end local v4    # "yStride":I
    .end local v7    # "v":[I
    .local v16, "v":[I
    .local v22, "yStride":I
    invoke-static/range {v15 .. v22}, Lcom/itextpdf/io/image/PngImageHelper;->setPixel([B[IIIIIII)V

    .line 578
    add-int v19, v19, p2

    .line 569
    .end local v8    # "idx":I
    add-int/lit8 v9, v9, 0x1

    goto :goto_6

    .end local v16    # "v":[I
    .end local v22    # "yStride":I
    .restart local v4    # "yStride":I
    .restart local v7    # "v":[I
    :cond_7
    move/from16 v22, v4

    move-object/from16 v16, v7

    .line 580
    .end local v4    # "yStride":I
    .end local v7    # "v":[I
    goto/16 :goto_e

    .line 581
    .end local v9    # "srcX":I
    .end local v19    # "dstX":I
    :cond_8
    iget-boolean v4, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->genBWMask:Z

    if-eqz v4, :cond_f

    .line 582
    packed-switch v2, :pswitch_data_1

    :pswitch_3
    goto/16 :goto_e

    .line 584
    :pswitch_4
    iget v4, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->width:I

    add-int/lit8 v4, v4, 0x7

    div-int/lit8 v22, v4, 0x8

    .line 585
    .restart local v22    # "yStride":I
    new-array v4, v7, [I

    .line 586
    .local v4, "v":[I
    move/from16 v8, p1

    .line 587
    .local v8, "dstX":I
    const/4 v9, 0x0

    move/from16 v19, v8

    .end local v8    # "dstX":I
    .restart local v9    # "srcX":I
    .restart local v19    # "dstX":I
    :goto_8
    if-ge v9, v0, :cond_a

    .line 588
    aget v8, v5, v9

    .line 589
    .local v8, "idx":I
    iget-object v10, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->trans:[B

    array-length v10, v10

    if-ge v8, v10, :cond_9

    iget-object v10, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->trans:[B

    aget-byte v10, v10, v8

    if-nez v10, :cond_9

    move v10, v7

    goto :goto_9

    :cond_9
    move v10, v6

    :goto_9
    aput v10, v4, v6

    .line 590
    iget-object v15, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->smask:[B

    const/16 v18, 0x1

    const/16 v21, 0x1

    const/16 v17, 0x0

    move/from16 v20, p3

    move-object/from16 v16, v4

    .end local v4    # "v":[I
    .restart local v16    # "v":[I
    invoke-static/range {v15 .. v22}, Lcom/itextpdf/io/image/PngImageHelper;->setPixel([B[IIIIIII)V

    .line 591
    add-int v19, v19, p2

    .line 587
    .end local v8    # "idx":I
    add-int/lit8 v9, v9, 0x1

    goto :goto_8

    .end local v16    # "v":[I
    .restart local v4    # "v":[I
    :cond_a
    move-object/from16 v16, v4

    .end local v4    # "v":[I
    .restart local v16    # "v":[I
    goto/16 :goto_e

    .line 608
    .end local v9    # "srcX":I
    .end local v16    # "v":[I
    .end local v19    # "dstX":I
    .end local v22    # "yStride":I
    :pswitch_5
    iget v4, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->width:I

    add-int/lit8 v4, v4, 0x7

    div-int/lit8 v22, v4, 0x8

    .line 609
    .restart local v22    # "yStride":I
    new-array v4, v7, [I

    .line 610
    .restart local v4    # "v":[I
    move/from16 v8, p1

    .line 611
    .local v8, "dstX":I
    const/4 v9, 0x0

    move/from16 v19, v8

    .end local v8    # "dstX":I
    .restart local v9    # "srcX":I
    .restart local v19    # "dstX":I
    :goto_a
    if-ge v9, v0, :cond_c

    .line 612
    iget v8, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->inputBands:I

    mul-int/2addr v8, v9

    .line 613
    .local v8, "markRed":I
    aget v10, v5, v8

    iget v11, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->transRedGray:I

    if-ne v10, v11, :cond_b

    add-int/lit8 v10, v8, 0x1

    aget v10, v5, v10

    iget v11, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->transGreen:I

    if-ne v10, v11, :cond_b

    add-int/lit8 v10, v8, 0x2

    aget v10, v5, v10

    iget v11, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->transBlue:I

    if-ne v10, v11, :cond_b

    move v10, v7

    goto :goto_b

    :cond_b
    move v10, v6

    :goto_b
    aput v10, v4, v6

    .line 615
    iget-object v15, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->smask:[B

    const/16 v18, 0x1

    const/16 v21, 0x1

    const/16 v17, 0x0

    move/from16 v20, p3

    move-object/from16 v16, v4

    .end local v4    # "v":[I
    .restart local v16    # "v":[I
    invoke-static/range {v15 .. v22}, Lcom/itextpdf/io/image/PngImageHelper;->setPixel([B[IIIIIII)V

    .line 616
    add-int v19, v19, p2

    .line 611
    .end local v8    # "markRed":I
    add-int/lit8 v9, v9, 0x1

    goto :goto_a

    .end local v16    # "v":[I
    .restart local v4    # "v":[I
    :cond_c
    move-object/from16 v16, v4

    .end local v4    # "v":[I
    .restart local v16    # "v":[I
    goto :goto_e

    .line 596
    .end local v9    # "srcX":I
    .end local v16    # "v":[I
    .end local v19    # "dstX":I
    .end local v22    # "yStride":I
    :pswitch_6
    iget v4, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->width:I

    add-int/lit8 v4, v4, 0x7

    div-int/lit8 v22, v4, 0x8

    .line 597
    .restart local v22    # "yStride":I
    new-array v4, v7, [I

    .line 598
    .restart local v4    # "v":[I
    move/from16 v8, p1

    .line 599
    .local v8, "dstX":I
    const/4 v9, 0x0

    move/from16 v19, v8

    .end local v8    # "dstX":I
    .restart local v9    # "srcX":I
    .restart local v19    # "dstX":I
    :goto_c
    if-ge v9, v0, :cond_e

    .line 600
    aget v8, v5, v9

    .line 601
    .local v8, "g":I
    iget v10, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->transRedGray:I

    if-ne v8, v10, :cond_d

    move v10, v7

    goto :goto_d

    :cond_d
    move v10, v6

    :goto_d
    aput v10, v4, v6

    .line 602
    iget-object v15, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->smask:[B

    const/16 v18, 0x1

    const/16 v21, 0x1

    const/16 v17, 0x0

    move/from16 v20, p3

    move-object/from16 v16, v4

    .end local v4    # "v":[I
    .restart local v16    # "v":[I
    invoke-static/range {v15 .. v22}, Lcom/itextpdf/io/image/PngImageHelper;->setPixel([B[IIIIIII)V

    .line 603
    add-int v19, v19, p2

    .line 599
    .end local v8    # "g":I
    add-int/lit8 v9, v9, 0x1

    goto :goto_c

    .end local v16    # "v":[I
    .restart local v4    # "v":[I
    :cond_e
    move-object/from16 v16, v4

    .line 622
    .end local v4    # "v":[I
    .end local v9    # "srcX":I
    .end local v19    # "dstX":I
    .end local v22    # "yStride":I
    :cond_f
    :goto_e
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_6
        :pswitch_3
        :pswitch_5
        :pswitch_4
    .end packed-switch
.end method

.method private static processPng(Ljava/io/InputStream;Lcom/itextpdf/io/image/PngImageHelper$PngParameters;)V
    .locals 20
    .param p0, "pngStream"    # Ljava/io/InputStream;
    .param p1, "png"    # Lcom/itextpdf/io/image/PngImageHelper$PngParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 169
    move-object/from16 v1, p1

    invoke-static/range {p0 .. p1}, Lcom/itextpdf/io/image/PngImageHelper;->readPng(Ljava/io/InputStream;Lcom/itextpdf/io/image/PngImageHelper$PngParameters;)V

    .line 170
    iget-object v0, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->image:Lcom/itextpdf/io/image/PngImageData;

    invoke-virtual {v0}, Lcom/itextpdf/io/image/PngImageData;->getColorType()I

    move-result v2

    .line 171
    .local v2, "colorType":I
    iget-object v0, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->iccProfile:Lcom/itextpdf/io/colors/IccProfile;

    if-eqz v0, :cond_0

    iget-object v0, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->iccProfile:Lcom/itextpdf/io/colors/IccProfile;

    invoke-virtual {v0}, Lcom/itextpdf/io/colors/IccProfile;->getNumComponents()I

    move-result v0

    invoke-static {v1}, Lcom/itextpdf/io/image/PngImageHelper;->getExpectedNumberOfColorComponents(Lcom/itextpdf/io/image/PngImageHelper$PngParameters;)I

    move-result v3

    if-eq v0, v3, :cond_0

    .line 172
    const-class v0, Lcom/itextpdf/io/image/PngImageHelper;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 173
    const-string v3, "Png image has color profile with incompatible number of color components."

    invoke-interface {v0, v3}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 176
    :cond_0
    const/4 v0, 0x0

    .line 177
    .local v0, "pal0":I
    const/4 v3, 0x0

    .line 178
    .local v3, "palIdx":I
    const/4 v4, 0x0

    :try_start_0
    iput-boolean v4, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->palShades:Z

    .line 179
    iget-object v5, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->trans:[B

    const/4 v6, 0x1

    if-eqz v5, :cond_3

    .line 180
    const/4 v5, 0x0

    .local v5, "k":I
    :goto_0
    iget-object v7, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->trans:[B

    array-length v7, v7

    if-ge v5, v7, :cond_3

    .line 181
    iget-object v7, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->trans:[B

    aget-byte v7, v7, v5

    const/16 v8, 0xff

    and-int/2addr v7, v8

    .line 182
    .local v7, "n":I
    if-nez v7, :cond_1

    .line 183
    add-int/lit8 v0, v0, 0x1

    .line 184
    move v3, v5

    .line 186
    :cond_1
    if-eqz v7, :cond_2

    if-eq v7, v8, :cond_2

    .line 187
    iput-boolean v6, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->palShades:Z

    .line 188
    goto :goto_1

    .line 180
    .end local v7    # "n":I
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 192
    .end local v5    # "k":I
    :cond_3
    :goto_1
    and-int/lit8 v5, v2, 0x4

    if-eqz v5, :cond_4

    .line 193
    iput-boolean v6, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->palShades:Z

    .line 194
    :cond_4
    iget-boolean v5, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->palShades:Z

    if-nez v5, :cond_6

    if-gt v0, v6, :cond_5

    iget v5, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->transRedGray:I

    if-ltz v5, :cond_6

    :cond_5
    move v5, v6

    goto :goto_2

    :cond_6
    move v5, v4

    :goto_2
    iput-boolean v5, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->genBWMask:Z

    .line 195
    iget-boolean v5, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->palShades:Z

    if-nez v5, :cond_7

    iget-boolean v5, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->genBWMask:Z

    if-nez v5, :cond_7

    if-ne v0, v6, :cond_7

    .line 196
    iget-object v5, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->additional:Ljava/util/Map;

    const-string v7, "Mask"

    filled-new-array {v3, v3}, [I

    move-result-object v8

    invoke-interface {v5, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    :cond_7
    iget v5, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->interlaceMethod:I

    const/16 v7, 0x10

    if-eq v5, v6, :cond_8

    iget v5, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->bitDepth:I

    if-eq v5, v7, :cond_8

    and-int/lit8 v5, v2, 0x4

    if-nez v5, :cond_8

    iget-boolean v5, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->palShades:Z

    if-nez v5, :cond_8

    iget-boolean v5, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->genBWMask:Z

    if-eqz v5, :cond_9

    :cond_8
    move v4, v6

    .line 199
    .local v4, "needDecode":Z
    :cond_9
    const/4 v5, 0x3

    packed-switch v2, :pswitch_data_0

    :pswitch_0
    goto :goto_3

    .line 213
    :pswitch_1
    const/4 v8, 0x4

    iput v8, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->inputBands:I

    goto :goto_3

    .line 210
    :pswitch_2
    const/4 v8, 0x2

    iput v8, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->inputBands:I

    .line 211
    goto :goto_3

    .line 207
    :pswitch_3
    iput v6, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->inputBands:I

    .line 208
    goto :goto_3

    .line 204
    :pswitch_4
    iput v5, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->inputBands:I

    .line 205
    goto :goto_3

    .line 201
    :pswitch_5
    iput v6, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->inputBands:I

    .line 202
    nop

    .line 216
    :goto_3
    if-eqz v4, :cond_a

    .line 217
    invoke-static {v1}, Lcom/itextpdf/io/image/PngImageHelper;->decodeIdat(Lcom/itextpdf/io/image/PngImageHelper$PngParameters;)V

    .line 218
    :cond_a
    iget v8, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->inputBands:I

    .line 219
    .local v8, "components":I
    and-int/lit8 v9, v2, 0x4

    if-eqz v9, :cond_b

    .line 220
    add-int/lit8 v8, v8, -0x1

    move v12, v8

    goto :goto_4

    .line 219
    :cond_b
    move v12, v8

    .line 221
    .end local v8    # "components":I
    .local v12, "components":I
    :goto_4
    iget v8, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->bitDepth:I

    .line 222
    .local v8, "bpc":I
    if-ne v8, v7, :cond_c

    .line 223
    const/16 v8, 0x8

    move v13, v8

    goto :goto_5

    .line 222
    :cond_c
    move v13, v8

    .line 224
    .end local v8    # "bpc":I
    .local v13, "bpc":I
    :goto_5
    iget-object v7, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->imageData:[B

    if-eqz v7, :cond_e

    .line 225
    iget-object v5, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->image:Lcom/itextpdf/io/image/PngImageData;

    invoke-virtual {v5}, Lcom/itextpdf/io/image/PngImageData;->isIndexed()Z

    move-result v5

    if-eqz v5, :cond_d

    .line 226
    iget-object v9, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->image:Lcom/itextpdf/io/image/PngImageData;

    iget v10, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->width:I

    iget v11, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->height:I

    iget-object v14, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->imageData:[B

    invoke-static/range {v9 .. v14}, Lcom/itextpdf/io/image/RawImageHelper;->updateRawImageParameters(Lcom/itextpdf/io/image/RawImageData;IIII[B)V

    goto :goto_7

    .line 228
    :cond_d
    iget-object v9, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->image:Lcom/itextpdf/io/image/PngImageData;

    iget v10, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->width:I

    iget v11, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->height:I

    iget-object v14, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->imageData:[B

    const/4 v15, 0x0

    invoke-static/range {v9 .. v15}, Lcom/itextpdf/io/image/RawImageHelper;->updateRawImageParameters(Lcom/itextpdf/io/image/RawImageData;IIII[B[I)V

    goto :goto_7

    .line 231
    :cond_e
    iget-object v9, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->image:Lcom/itextpdf/io/image/PngImageData;

    iget v10, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->width:I

    iget v11, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->height:I

    iget-object v7, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->idat:Lcom/itextpdf/io/source/ByteArrayOutputStream;

    invoke-virtual {v7}, Lcom/itextpdf/io/source/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v14

    invoke-static/range {v9 .. v14}, Lcom/itextpdf/io/image/RawImageHelper;->updateRawImageParameters(Lcom/itextpdf/io/image/RawImageData;IIII[B)V

    .line 232
    iget-object v7, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->image:Lcom/itextpdf/io/image/PngImageData;

    invoke-virtual {v7, v6}, Lcom/itextpdf/io/image/PngImageData;->setDeflated(Z)V

    .line 233
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 234
    .local v7, "decodeparms":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v8, "BitsPerComponent"

    iget v9, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->bitDepth:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v7, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 235
    const-string v8, "Predictor"

    const/16 v9, 0xf

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v7, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    const-string v8, "Columns"

    iget v9, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->width:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v7, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 237
    const-string v8, "Colors"

    iget-object v9, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->image:Lcom/itextpdf/io/image/PngImageData;

    invoke-virtual {v9}, Lcom/itextpdf/io/image/PngImageData;->isIndexed()Z

    move-result v9

    if-nez v9, :cond_10

    iget-object v9, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->image:Lcom/itextpdf/io/image/PngImageData;

    invoke-virtual {v9}, Lcom/itextpdf/io/image/PngImageData;->isGrayscaleImage()Z

    move-result v9

    if-eqz v9, :cond_f

    goto :goto_6

    :cond_f
    move v6, v5

    :cond_10
    :goto_6
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v7, v8, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 238
    iget-object v5, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->image:Lcom/itextpdf/io/image/PngImageData;

    iput-object v7, v5, Lcom/itextpdf/io/image/PngImageData;->decodeParms:Ljava/util/Map;

    .line 240
    .end local v7    # "decodeparms":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :goto_7
    iget-object v5, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->intent:Ljava/lang/String;

    if-eqz v5, :cond_11

    .line 241
    iget-object v5, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->additional:Ljava/util/Map;

    const-string v6, "Intent"

    iget-object v7, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->intent:Ljava/lang/String;

    invoke-interface {v5, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 242
    :cond_11
    iget-object v5, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->iccProfile:Lcom/itextpdf/io/colors/IccProfile;

    if-eqz v5, :cond_12

    .line 243
    iget-object v5, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->image:Lcom/itextpdf/io/image/PngImageData;

    iget-object v6, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->iccProfile:Lcom/itextpdf/io/colors/IccProfile;

    invoke-virtual {v5, v6}, Lcom/itextpdf/io/image/PngImageData;->setProfile(Lcom/itextpdf/io/colors/IccProfile;)V

    .line 244
    :cond_12
    iget-boolean v5, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->palShades:Z

    const/4 v6, 0x0

    if-eqz v5, :cond_13

    .line 245
    invoke-static {v6}, Lcom/itextpdf/io/image/ImageDataFactory;->createRawImage([B)Lcom/itextpdf/io/image/ImageData;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/io/image/RawImageData;

    move-object v14, v5

    .line 246
    .local v14, "im2":Lcom/itextpdf/io/image/RawImageData;
    iget v15, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->width:I

    iget v5, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->height:I

    iget-object v7, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->smask:[B

    const/16 v17, 0x1

    const/16 v18, 0x8

    move/from16 v16, v5

    move-object/from16 v19, v7

    invoke-static/range {v14 .. v19}, Lcom/itextpdf/io/image/RawImageHelper;->updateRawImageParameters(Lcom/itextpdf/io/image/RawImageData;IIII[B)V

    .line 247
    invoke-virtual {v14}, Lcom/itextpdf/io/image/RawImageData;->makeMask()V

    .line 248
    iget-object v5, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->image:Lcom/itextpdf/io/image/PngImageData;

    invoke-virtual {v5, v14}, Lcom/itextpdf/io/image/PngImageData;->setImageMask(Lcom/itextpdf/io/image/ImageData;)V

    .line 250
    .end local v14    # "im2":Lcom/itextpdf/io/image/RawImageData;
    :cond_13
    iget-boolean v5, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->genBWMask:Z

    if-eqz v5, :cond_14

    .line 251
    invoke-static {v6}, Lcom/itextpdf/io/image/ImageDataFactory;->createRawImage([B)Lcom/itextpdf/io/image/ImageData;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/io/image/RawImageData;

    move-object v6, v5

    .line 252
    .local v6, "im2":Lcom/itextpdf/io/image/RawImageData;
    iget v7, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->width:I

    iget v8, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->height:I

    iget-object v11, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->smask:[B

    const/4 v9, 0x1

    const/4 v10, 0x1

    invoke-static/range {v6 .. v11}, Lcom/itextpdf/io/image/RawImageHelper;->updateRawImageParameters(Lcom/itextpdf/io/image/RawImageData;IIII[B)V

    .line 253
    invoke-virtual {v6}, Lcom/itextpdf/io/image/RawImageData;->makeMask()V

    .line 254
    iget-object v5, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->image:Lcom/itextpdf/io/image/PngImageData;

    invoke-virtual {v5, v6}, Lcom/itextpdf/io/image/PngImageData;->setImageMask(Lcom/itextpdf/io/image/ImageData;)V

    .line 256
    .end local v6    # "im2":Lcom/itextpdf/io/image/RawImageData;
    :cond_14
    iget-object v5, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->image:Lcom/itextpdf/io/image/PngImageData;

    iget v6, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->dpiX:I

    iget v7, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->dpiY:I

    invoke-virtual {v5, v6, v7}, Lcom/itextpdf/io/image/PngImageData;->setDpi(II)V

    .line 257
    iget-object v5, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->image:Lcom/itextpdf/io/image/PngImageData;

    iget v6, v1, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->XYRatio:F

    invoke-virtual {v5, v6}, Lcom/itextpdf/io/image/PngImageData;->setXYRatio(F)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 260
    .end local v0    # "pal0":I
    .end local v3    # "palIdx":I
    .end local v4    # "needDecode":Z
    .end local v12    # "components":I
    .end local v13    # "bpc":I
    nop

    .line 261
    return-void

    .line 258
    :catch_0
    move-exception v0

    .line 259
    .local v0, "e":Ljava/lang/Exception;
    new-instance v3, Lcom/itextpdf/io/exceptions/IOException;

    const-string v4, "PNG image exception."

    invoke-direct {v3, v4, v0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private static readPng(Ljava/io/InputStream;Lcom/itextpdf/io/image/PngImageHelper$PngParameters;)V
    .locals 18
    .param p0, "pngStream"    # Ljava/io/InputStream;
    .param p1, "png"    # Lcom/itextpdf/io/image/PngImageHelper$PngParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 268
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v3, Lcom/itextpdf/io/image/PngImageHelper;->PNGID:[I

    array-length v3, v3

    if-ge v0, v3, :cond_1

    .line 269
    sget-object v3, Lcom/itextpdf/io/image/PngImageHelper;->PNGID:[I

    aget v3, v3, v0

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v4

    if-ne v3, v4, :cond_0

    .line 268
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 270
    :cond_0
    new-instance v3, Ljava/io/IOException;

    const-string v4, "file.is.not.a.valid.png"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 273
    .end local v0    # "i":I
    :cond_1
    const/16 v3, 0x1000

    new-array v4, v3, [B

    .line 275
    .local v4, "buffer":[B
    :goto_1
    invoke-static {v1}, Lcom/itextpdf/io/image/PngImageHelper;->getInt(Ljava/io/InputStream;)I

    move-result v0

    .line 276
    .local v0, "len":I
    invoke-static {v1}, Lcom/itextpdf/io/image/PngImageHelper;->getString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v5

    .line 277
    .local v5, "marker":Ljava/lang/String;
    if-ltz v0, :cond_1b

    invoke-static {v5}, Lcom/itextpdf/io/image/PngImageHelper;->checkMarker(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1b

    .line 279
    const-string v6, "IDAT"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 281
    :goto_2
    if-eqz v0, :cond_3

    .line 282
    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v6

    const/4 v7, 0x0

    invoke-virtual {v1, v4, v7, v6}, Ljava/io/InputStream;->read([BII)I

    move-result v6

    .line 283
    .local v6, "size":I
    if-gez v6, :cond_2

    .line 284
    return-void

    .line 285
    :cond_2
    iget-object v8, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->idat:Lcom/itextpdf/io/source/ByteArrayOutputStream;

    invoke-virtual {v8, v4, v7, v6}, Lcom/itextpdf/io/source/ByteArrayOutputStream;->write([BII)V

    .line 286
    sub-int/2addr v0, v6

    goto :goto_2

    .line 288
    .end local v6    # "size":I
    :cond_3
    goto/16 :goto_b

    :cond_4
    const-string/jumbo v6, "tRNS"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_9

    .line 289
    iget-object v6, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->image:Lcom/itextpdf/io/image/PngImageData;

    invoke-virtual {v6}, Lcom/itextpdf/io/image/PngImageData;->getColorType()I

    move-result v6

    const-string v7, "Mask"

    const/16 v8, 0x10

    packed-switch v6, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_6

    .line 316
    :pswitch_1
    if-lez v0, :cond_8

    .line 317
    new-array v6, v0, [B

    iput-object v6, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->trans:[B

    .line 318
    const/4 v6, 0x0

    .local v6, "k":I
    :goto_3
    if-ge v6, v0, :cond_5

    .line 319
    iget-object v7, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->trans:[B

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v8

    int-to-byte v8, v8

    aput-byte v8, v7, v6

    .line 318
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 320
    .end local v6    # "k":I
    :cond_5
    const/4 v0, 0x0

    goto :goto_6

    .line 302
    :pswitch_2
    const/4 v6, 0x6

    if-lt v0, v6, :cond_8

    .line 303
    add-int/lit8 v0, v0, -0x6

    .line 304
    invoke-static {v1}, Lcom/itextpdf/io/image/PngImageHelper;->getWord(Ljava/io/InputStream;)I

    move-result v6

    .line 305
    .local v6, "red":I
    invoke-static {v1}, Lcom/itextpdf/io/image/PngImageHelper;->getWord(Ljava/io/InputStream;)I

    move-result v9

    .line 306
    .local v9, "green":I
    invoke-static {v1}, Lcom/itextpdf/io/image/PngImageHelper;->getWord(Ljava/io/InputStream;)I

    move-result v10

    .line 307
    .local v10, "blue":I
    iget v11, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->bitDepth:I

    if-ne v11, v8, :cond_6

    .line 308
    iput v6, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->transRedGray:I

    .line 309
    iput v9, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->transGreen:I

    .line 310
    iput v10, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->transBlue:I

    goto :goto_4

    .line 312
    :cond_6
    iget-object v8, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->additional:Ljava/util/Map;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    filled-new-array/range {v11 .. v16}, [Ljava/lang/Object;

    move-result-object v11

    const-string v12, "[{0} {1} {2} {3} {4} {5}]"

    invoke-static {v12, v11}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-interface {v8, v7, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 313
    .end local v6    # "red":I
    .end local v9    # "green":I
    .end local v10    # "blue":I
    :goto_4
    goto :goto_6

    .line 291
    :pswitch_3
    const/4 v6, 0x2

    if-lt v0, v6, :cond_8

    .line 292
    add-int/lit8 v0, v0, -0x2

    .line 293
    invoke-static {v1}, Lcom/itextpdf/io/image/PngImageHelper;->getWord(Ljava/io/InputStream;)I

    move-result v6

    .line 294
    .local v6, "gray":I
    iget v9, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->bitDepth:I

    if-ne v9, v8, :cond_7

    .line 295
    iput v6, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->transRedGray:I

    goto :goto_5

    .line 297
    :cond_7
    iget-object v8, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->additional:Ljava/util/Map;

    .line 298
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    filled-new-array {v9, v10}, [Ljava/lang/Object;

    move-result-object v9

    const-string v10, "[{0} {1}]"

    invoke-static {v10, v9}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 297
    invoke-interface {v8, v7, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 299
    .end local v6    # "gray":I
    :goto_5
    nop

    .line 324
    :cond_8
    :goto_6
    int-to-long v6, v0

    invoke-static {v1, v6, v7}, Lcom/itextpdf/io/util/StreamUtil;->skip(Ljava/io/InputStream;J)V

    goto/16 :goto_b

    .line 325
    :cond_9
    const-string v6, "IHDR"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_a

    .line 326
    invoke-static {v1}, Lcom/itextpdf/io/image/PngImageHelper;->getInt(Ljava/io/InputStream;)I

    move-result v6

    iput v6, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->width:I

    .line 327
    invoke-static {v1}, Lcom/itextpdf/io/image/PngImageHelper;->getInt(Ljava/io/InputStream;)I

    move-result v6

    iput v6, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->height:I

    .line 329
    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v6

    iput v6, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->bitDepth:I

    .line 330
    iget-object v6, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->image:Lcom/itextpdf/io/image/PngImageData;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v7

    invoke-virtual {v6, v7}, Lcom/itextpdf/io/image/PngImageData;->setColorType(I)V

    .line 331
    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v6

    iput v6, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->compressionMethod:I

    .line 332
    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v6

    iput v6, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->filterMethod:I

    .line 333
    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v6

    iput v6, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->interlaceMethod:I

    goto/16 :goto_b

    .line 334
    :cond_a
    const-string v6, "PLTE"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_d

    .line 335
    iget-object v6, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->image:Lcom/itextpdf/io/image/PngImageData;

    invoke-virtual {v6}, Lcom/itextpdf/io/image/PngImageData;->isIndexed()Z

    move-result v6

    if-eqz v6, :cond_c

    .line 336
    new-instance v6, Lcom/itextpdf/io/source/ByteBuffer;

    invoke-direct {v6}, Lcom/itextpdf/io/source/ByteBuffer;-><init>()V

    .line 337
    .local v6, "colorTableBuf":Lcom/itextpdf/io/source/ByteBuffer;
    :goto_7
    add-int/lit8 v7, v0, -0x1

    .end local v0    # "len":I
    .local v7, "len":I
    if-lez v0, :cond_b

    .line 338
    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v0

    invoke-virtual {v6, v0}, Lcom/itextpdf/io/source/ByteBuffer;->append(I)Lcom/itextpdf/io/source/ByteBuffer;

    move v0, v7

    goto :goto_7

    .line 340
    :cond_b
    iget-object v0, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->image:Lcom/itextpdf/io/image/PngImageData;

    invoke-virtual {v6}, Lcom/itextpdf/io/source/ByteBuffer;->toByteArray()[B

    move-result-object v8

    invoke-virtual {v0, v8}, Lcom/itextpdf/io/image/PngImageData;->setColorPalette([B)V

    .line 341
    .end local v6    # "colorTableBuf":Lcom/itextpdf/io/source/ByteBuffer;
    move v0, v7

    goto/16 :goto_b

    .line 342
    .end local v7    # "len":I
    .restart local v0    # "len":I
    :cond_c
    int-to-long v6, v0

    invoke-static {v1, v6, v7}, Lcom/itextpdf/io/util/StreamUtil;->skip(Ljava/io/InputStream;J)V

    goto/16 :goto_b

    .line 344
    :cond_d
    const-string/jumbo v6, "pHYs"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    const/4 v7, 0x1

    if-eqz v6, :cond_10

    .line 345
    invoke-static {v1}, Lcom/itextpdf/io/image/PngImageHelper;->getInt(Ljava/io/InputStream;)I

    move-result v6

    .line 346
    .local v6, "dx":I
    invoke-static {v1}, Lcom/itextpdf/io/image/PngImageHelper;->getInt(Ljava/io/InputStream;)I

    move-result v8

    .line 347
    .local v8, "dy":I
    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v9

    .line 348
    .local v9, "unit":I
    if-ne v9, v7, :cond_e

    .line 349
    int-to-float v7, v6

    const v10, 0x3cd013a9    # 0.0254f

    mul-float/2addr v7, v10

    const/high16 v11, 0x3f000000    # 0.5f

    add-float/2addr v7, v11

    float-to-int v7, v7

    iput v7, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->dpiX:I

    .line 350
    int-to-float v7, v8

    mul-float/2addr v7, v10

    add-float/2addr v7, v11

    float-to-int v7, v7

    iput v7, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->dpiY:I

    goto :goto_8

    .line 352
    :cond_e
    if-eqz v8, :cond_f

    .line 353
    int-to-float v7, v6

    int-to-float v10, v8

    div-float/2addr v7, v10

    iput v7, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->XYRatio:F

    .line 355
    .end local v6    # "dx":I
    .end local v8    # "dy":I
    .end local v9    # "unit":I
    :cond_f
    :goto_8
    goto/16 :goto_b

    :cond_10
    const-string v6, "cHRM"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    const v8, 0x47c35000    # 100000.0f

    if-eqz v6, :cond_12

    .line 356
    new-instance v9, Lcom/itextpdf/io/image/PngChromaticities;

    invoke-static {v1}, Lcom/itextpdf/io/image/PngImageHelper;->getInt(Ljava/io/InputStream;)I

    move-result v6

    int-to-float v6, v6

    div-float v10, v6, v8

    invoke-static {v1}, Lcom/itextpdf/io/image/PngImageHelper;->getInt(Ljava/io/InputStream;)I

    move-result v6

    int-to-float v6, v6

    div-float v11, v6, v8

    .line 357
    invoke-static {v1}, Lcom/itextpdf/io/image/PngImageHelper;->getInt(Ljava/io/InputStream;)I

    move-result v6

    int-to-float v6, v6

    div-float v12, v6, v8

    invoke-static {v1}, Lcom/itextpdf/io/image/PngImageHelper;->getInt(Ljava/io/InputStream;)I

    move-result v6

    int-to-float v6, v6

    div-float v13, v6, v8

    invoke-static {v1}, Lcom/itextpdf/io/image/PngImageHelper;->getInt(Ljava/io/InputStream;)I

    move-result v6

    int-to-float v6, v6

    div-float v14, v6, v8

    .line 358
    invoke-static {v1}, Lcom/itextpdf/io/image/PngImageHelper;->getInt(Ljava/io/InputStream;)I

    move-result v6

    int-to-float v6, v6

    div-float v15, v6, v8

    invoke-static {v1}, Lcom/itextpdf/io/image/PngImageHelper;->getInt(Ljava/io/InputStream;)I

    move-result v6

    int-to-float v6, v6

    div-float v16, v6, v8

    invoke-static {v1}, Lcom/itextpdf/io/image/PngImageHelper;->getInt(Ljava/io/InputStream;)I

    move-result v6

    int-to-float v6, v6

    div-float v17, v6, v8

    invoke-direct/range {v9 .. v17}, Lcom/itextpdf/io/image/PngChromaticities;-><init>(FFFFFFFF)V

    .line 359
    .local v9, "pngChromaticities":Lcom/itextpdf/io/image/PngChromaticities;
    invoke-virtual {v9}, Lcom/itextpdf/io/image/PngChromaticities;->getXW()F

    move-result v6

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    const v7, 0x38d1b717    # 1.0E-4f

    cmpg-float v6, v6, v7

    if-ltz v6, :cond_11

    invoke-virtual {v9}, Lcom/itextpdf/io/image/PngChromaticities;->getYW()F

    move-result v6

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    cmpg-float v6, v6, v7

    if-ltz v6, :cond_11

    .line 360
    invoke-virtual {v9}, Lcom/itextpdf/io/image/PngChromaticities;->getXR()F

    move-result v6

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    cmpg-float v6, v6, v7

    if-ltz v6, :cond_11

    invoke-virtual {v9}, Lcom/itextpdf/io/image/PngChromaticities;->getYR()F

    move-result v6

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    cmpg-float v6, v6, v7

    if-ltz v6, :cond_11

    .line 361
    invoke-virtual {v9}, Lcom/itextpdf/io/image/PngChromaticities;->getXG()F

    move-result v6

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    cmpg-float v6, v6, v7

    if-ltz v6, :cond_11

    invoke-virtual {v9}, Lcom/itextpdf/io/image/PngChromaticities;->getYG()F

    move-result v6

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    cmpg-float v6, v6, v7

    if-ltz v6, :cond_11

    .line 362
    invoke-virtual {v9}, Lcom/itextpdf/io/image/PngChromaticities;->getXB()F

    move-result v6

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    cmpg-float v6, v6, v7

    if-ltz v6, :cond_11

    invoke-virtual {v9}, Lcom/itextpdf/io/image/PngChromaticities;->getYB()F

    move-result v6

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    cmpg-float v6, v6, v7

    if-ltz v6, :cond_11

    .line 363
    iget-object v6, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->image:Lcom/itextpdf/io/image/PngImageData;

    invoke-virtual {v6, v9}, Lcom/itextpdf/io/image/PngImageData;->setPngChromaticities(Lcom/itextpdf/io/image/PngChromaticities;)V

    .line 365
    .end local v9    # "pngChromaticities":Lcom/itextpdf/io/image/PngChromaticities;
    :cond_11
    goto/16 :goto_b

    :cond_12
    const-string/jumbo v6, "sRGB"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_13

    .line 366
    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v6

    .line 367
    .local v6, "ri":I
    sget-object v7, Lcom/itextpdf/io/image/PngImageHelper;->intents:[Ljava/lang/String;

    aget-object v7, v7, v6

    iput-object v7, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->intent:Ljava/lang/String;

    .line 368
    iget-object v7, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->image:Lcom/itextpdf/io/image/PngImageData;

    const v8, 0x400ccccd    # 2.2f

    invoke-virtual {v7, v8}, Lcom/itextpdf/io/image/PngImageData;->setGamma(F)V

    .line 369
    new-instance v9, Lcom/itextpdf/io/image/PngChromaticities;

    const v16, 0x3e19999a    # 0.15f

    const v17, 0x3d75c28f    # 0.06f

    const v10, 0x3ea01a37    # 0.3127f

    const v11, 0x3ea872b0    # 0.329f

    const v12, 0x3f23d70a    # 0.64f

    const v13, 0x3ea8f5c3    # 0.33f

    const v14, 0x3e99999a    # 0.3f

    const v15, 0x3f19999a    # 0.6f

    invoke-direct/range {v9 .. v17}, Lcom/itextpdf/io/image/PngChromaticities;-><init>(FFFFFFFF)V

    .line 371
    .restart local v9    # "pngChromaticities":Lcom/itextpdf/io/image/PngChromaticities;
    iget-object v7, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->image:Lcom/itextpdf/io/image/PngImageData;

    invoke-virtual {v7, v9}, Lcom/itextpdf/io/image/PngImageData;->setPngChromaticities(Lcom/itextpdf/io/image/PngChromaticities;)V

    .line 372
    .end local v6    # "ri":I
    .end local v9    # "pngChromaticities":Lcom/itextpdf/io/image/PngChromaticities;
    goto/16 :goto_b

    :cond_13
    const-string v6, "gAMA"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_15

    .line 373
    invoke-static {v1}, Lcom/itextpdf/io/image/PngImageHelper;->getInt(Ljava/io/InputStream;)I

    move-result v6

    .line 374
    .local v6, "gm":I
    if-eqz v6, :cond_14

    .line 375
    iget-object v7, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->image:Lcom/itextpdf/io/image/PngImageData;

    int-to-float v9, v6

    div-float/2addr v8, v9

    invoke-virtual {v7, v8}, Lcom/itextpdf/io/image/PngImageData;->setGamma(F)V

    .line 376
    iget-object v7, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->image:Lcom/itextpdf/io/image/PngImageData;

    invoke-virtual {v7}, Lcom/itextpdf/io/image/PngImageData;->isHasCHRM()Z

    move-result v7

    if-nez v7, :cond_14

    .line 377
    new-instance v8, Lcom/itextpdf/io/image/PngChromaticities;

    const v15, 0x3e19999a    # 0.15f

    const v16, 0x3d75c28f    # 0.06f

    const v9, 0x3ea01a37    # 0.3127f

    const v10, 0x3ea872b0    # 0.329f

    const v11, 0x3f23d70a    # 0.64f

    const v12, 0x3ea8f5c3    # 0.33f

    const v13, 0x3e99999a    # 0.3f

    const v14, 0x3f19999a    # 0.6f

    invoke-direct/range {v8 .. v16}, Lcom/itextpdf/io/image/PngChromaticities;-><init>(FFFFFFFF)V

    .line 379
    .local v8, "pngChromaticities":Lcom/itextpdf/io/image/PngChromaticities;
    iget-object v7, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->image:Lcom/itextpdf/io/image/PngImageData;

    invoke-virtual {v7, v8}, Lcom/itextpdf/io/image/PngImageData;->setPngChromaticities(Lcom/itextpdf/io/image/PngChromaticities;)V

    .line 382
    .end local v6    # "gm":I
    .end local v8    # "pngChromaticities":Lcom/itextpdf/io/image/PngChromaticities;
    :cond_14
    goto :goto_b

    :cond_15
    const-string v6, "iCCP"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_19

    .line 384
    :cond_16
    add-int/lit8 v0, v0, -0x1

    .line 385
    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v6

    if-nez v6, :cond_16

    .line 386
    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    .line 387
    add-int/lit8 v0, v0, -0x1

    .line 388
    new-array v6, v0, [B

    .line 389
    .local v6, "icccom":[B
    const/4 v8, 0x0

    move v9, v8

    move v8, v0

    .line 390
    .end local v0    # "len":I
    .local v8, "len":I
    .local v9, "p":I
    :goto_9
    if-lez v8, :cond_18

    .line 391
    invoke-virtual {v1, v6, v9, v8}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 392
    .local v0, "r":I
    if-ltz v0, :cond_17

    .line 394
    add-int/2addr v9, v0

    .line 395
    sub-int/2addr v8, v0

    .line 396
    .end local v0    # "r":I
    goto :goto_9

    .line 393
    .restart local v0    # "r":I
    :cond_17
    new-instance v3, Ljava/io/IOException;

    const-string/jumbo v7, "premature.end.of.file"

    invoke-direct {v3, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 397
    .end local v0    # "r":I
    :cond_18
    invoke-static {v6, v7}, Lcom/itextpdf/io/util/FilterUtil;->flateDecode([BZ)[B

    move-result-object v7

    .line 398
    .local v7, "iccp":[B
    const/4 v6, 0x0

    .line 400
    :try_start_0
    invoke-static {v7}, Lcom/itextpdf/io/colors/IccProfile;->getInstance([B)Lcom/itextpdf/io/colors/IccProfile;

    move-result-object v0

    iput-object v0, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->iccProfile:Lcom/itextpdf/io/colors/IccProfile;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 403
    goto :goto_a

    .line 401
    :catch_0
    move-exception v0

    .line 402
    .local v0, "e":Ljava/lang/RuntimeException;
    const/4 v10, 0x0

    iput-object v10, v2, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->iccProfile:Lcom/itextpdf/io/colors/IccProfile;

    .line 404
    .end local v0    # "e":Ljava/lang/RuntimeException;
    .end local v6    # "icccom":[B
    .end local v7    # "iccp":[B
    .end local v9    # "p":I
    :goto_a
    move v0, v8

    goto :goto_b

    .end local v8    # "len":I
    .local v0, "len":I
    :cond_19
    const-string v6, "IEND"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1a

    .line 405
    nop

    .line 411
    .end local v0    # "len":I
    .end local v5    # "marker":Ljava/lang/String;
    return-void

    .line 407
    .restart local v0    # "len":I
    .restart local v5    # "marker":Ljava/lang/String;
    :cond_1a
    int-to-long v6, v0

    invoke-static {v1, v6, v7}, Lcom/itextpdf/io/util/StreamUtil;->skip(Ljava/io/InputStream;J)V

    .line 409
    :goto_b
    const-wide/16 v6, 0x4

    invoke-static {v1, v6, v7}, Lcom/itextpdf/io/util/StreamUtil;->skip(Ljava/io/InputStream;J)V

    .line 410
    .end local v0    # "len":I
    .end local v5    # "marker":Ljava/lang/String;
    goto/16 :goto_1

    .line 278
    .restart local v0    # "len":I
    .restart local v5    # "marker":Ljava/lang/String;
    :cond_1b
    new-instance v3, Ljava/io/IOException;

    const-string v6, "corrupted.png.file"

    invoke-direct {v3, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method static setPixel([B[IIIIIII)V
    .locals 5
    .param p0, "image"    # [B
    .param p1, "data"    # [I
    .param p2, "offset"    # I
    .param p3, "size"    # I
    .param p4, "x"    # I
    .param p5, "y"    # I
    .param p6, "bitDepth"    # I
    .param p7, "bytesPerRow"    # I

    .line 636
    const/16 v0, 0x8

    if-ne p6, v0, :cond_1

    .line 637
    mul-int v0, p7, p5

    mul-int v1, p3, p4

    add-int/2addr v0, v1

    .line 638
    .local v0, "pos":I
    const/4 v1, 0x0

    .local v1, "k":I
    :goto_0
    if-ge v1, p3, :cond_0

    .line 639
    add-int v2, v0, v1

    add-int v3, v1, p2

    aget v3, p1, v3

    int-to-byte v3, v3

    aput-byte v3, p0, v2

    .line 638
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 640
    .end local v0    # "pos":I
    .end local v1    # "k":I
    :cond_0
    goto :goto_2

    :cond_1
    const/16 v1, 0x10

    if-ne p6, v1, :cond_3

    .line 641
    mul-int v1, p7, p5

    mul-int v2, p3, p4

    add-int/2addr v1, v2

    .line 642
    .local v1, "pos":I
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_1
    if-ge v2, p3, :cond_2

    .line 643
    add-int v3, v1, v2

    add-int v4, v2, p2

    aget v4, p1, v4

    ushr-int/2addr v4, v0

    int-to-byte v4, v4

    aput-byte v4, p0, v3

    .line 642
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 644
    .end local v1    # "pos":I
    .end local v2    # "k":I
    :cond_2
    goto :goto_2

    .line 645
    :cond_3
    mul-int v1, p7, p5

    div-int v2, v0, p6

    div-int v2, p4, v2

    add-int/2addr v1, v2

    .line 646
    .restart local v1    # "pos":I
    aget v2, p1, p2

    div-int v3, v0, p6

    rem-int v3, p4, v3

    mul-int/2addr v3, p6

    sub-int/2addr v0, v3

    sub-int/2addr v0, p6

    shl-int v0, v2, v0

    .line 647
    .local v0, "v":I
    aget-byte v2, p0, v1

    int-to-byte v3, v0

    or-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, p0, v1

    .line 649
    .end local v0    # "v":I
    .end local v1    # "pos":I
    :goto_2
    return-void
.end method
