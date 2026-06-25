.class Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject$PngChromaticitiesHelper;
.super Ljava/lang/Object;
.source "PdfImageXObject.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PngChromaticitiesHelper"
.end annotation


# instance fields
.field matrix:[F

.field wp:[F


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 584
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 586
    const/16 v0, 0x9

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject$PngChromaticitiesHelper;->matrix:[F

    .line 587
    const/4 v0, 0x3

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject$PngChromaticitiesHelper;->wp:[F

    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject$1;

    .line 584
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject$PngChromaticitiesHelper;-><init>()V

    return-void
.end method


# virtual methods
.method public constructMatrix(Lcom/itextpdf/io/image/PngImageData;)V
    .locals 22
    .param p1, "pngImageData"    # Lcom/itextpdf/io/image/PngImageData;

    .line 590
    move-object/from16 v0, p0

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/io/image/PngImageData;->getPngChromaticities()Lcom/itextpdf/io/image/PngChromaticities;

    move-result-object v1

    .line 591
    .local v1, "pngChromaticities":Lcom/itextpdf/io/image/PngChromaticities;
    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getYW()F

    move-result v2

    .line 592
    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getXG()F

    move-result v3

    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getXB()F

    move-result v4

    sub-float/2addr v3, v4

    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getYR()F

    move-result v4

    mul-float/2addr v3, v4

    .line 593
    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getXR()F

    move-result v4

    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getXB()F

    move-result v5

    sub-float/2addr v4, v5

    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getYG()F

    move-result v5

    mul-float/2addr v4, v5

    sub-float/2addr v3, v4

    .line 594
    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getXR()F

    move-result v4

    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getXG()F

    move-result v5

    sub-float/2addr v4, v5

    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getYB()F

    move-result v5

    mul-float/2addr v4, v5

    add-float/2addr v3, v4

    mul-float/2addr v2, v3

    .line 595
    .local v2, "z":F
    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getYR()F

    move-result v3

    .line 596
    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getXG()F

    move-result v4

    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getXB()F

    move-result v5

    sub-float/2addr v4, v5

    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getYW()F

    move-result v5

    mul-float/2addr v4, v5

    .line 597
    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getXW()F

    move-result v5

    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getXB()F

    move-result v6

    sub-float/2addr v5, v6

    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getYG()F

    move-result v6

    mul-float/2addr v5, v6

    sub-float/2addr v4, v5

    .line 598
    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getXW()F

    move-result v5

    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getXG()F

    move-result v6

    sub-float/2addr v5, v6

    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getYB()F

    move-result v6

    mul-float/2addr v5, v6

    add-float/2addr v4, v5

    mul-float/2addr v3, v4

    div-float/2addr v3, v2

    .line 599
    .local v3, "YA":F
    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getXR()F

    move-result v4

    mul-float/2addr v4, v3

    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getYR()F

    move-result v5

    div-float/2addr v4, v5

    .line 600
    .local v4, "XA":F
    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getXR()F

    move-result v5

    const/high16 v6, 0x3f800000    # 1.0f

    sub-float v5, v6, v5

    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getYR()F

    move-result v7

    div-float/2addr v5, v7

    sub-float/2addr v5, v6

    mul-float/2addr v5, v3

    .line 601
    .local v5, "ZA":F
    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getYG()F

    move-result v7

    neg-float v7, v7

    .line 602
    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getXR()F

    move-result v8

    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getXB()F

    move-result v9

    sub-float/2addr v8, v9

    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getYW()F

    move-result v9

    mul-float/2addr v8, v9

    .line 603
    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getXW()F

    move-result v9

    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getXB()F

    move-result v10

    sub-float/2addr v9, v10

    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getYR()F

    move-result v10

    mul-float/2addr v9, v10

    sub-float/2addr v8, v9

    .line 604
    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getXW()F

    move-result v9

    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getXR()F

    move-result v10

    sub-float/2addr v9, v10

    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getYB()F

    move-result v10

    mul-float/2addr v9, v10

    add-float/2addr v8, v9

    mul-float/2addr v7, v8

    div-float/2addr v7, v2

    .line 605
    .local v7, "YB":F
    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getXG()F

    move-result v8

    mul-float/2addr v8, v7

    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getYG()F

    move-result v9

    div-float/2addr v8, v9

    .line 606
    .local v8, "XB":F
    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getXG()F

    move-result v9

    sub-float v9, v6, v9

    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getYG()F

    move-result v10

    div-float/2addr v9, v10

    sub-float/2addr v9, v6

    mul-float/2addr v9, v7

    .line 607
    .local v9, "ZB":F
    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getYB()F

    move-result v10

    .line 608
    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getXR()F

    move-result v11

    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getXG()F

    move-result v12

    sub-float/2addr v11, v12

    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getYW()F

    move-result v12

    mul-float/2addr v11, v12

    .line 609
    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getXW()F

    move-result v12

    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getXG()F

    move-result v13

    sub-float/2addr v12, v13

    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getYW()F

    move-result v13

    mul-float/2addr v12, v13

    sub-float/2addr v11, v12

    .line 610
    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getXW()F

    move-result v12

    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getXR()F

    move-result v13

    sub-float/2addr v12, v13

    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getYG()F

    move-result v13

    mul-float/2addr v12, v13

    add-float/2addr v11, v12

    mul-float/2addr v10, v11

    div-float/2addr v10, v2

    .line 611
    .local v10, "YC":F
    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getXB()F

    move-result v11

    mul-float/2addr v11, v10

    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getYB()F

    move-result v12

    div-float/2addr v11, v12

    .line 612
    .local v11, "XC":F
    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getXB()F

    move-result v12

    sub-float v12, v6, v12

    invoke-virtual {v1}, Lcom/itextpdf/io/image/PngChromaticities;->getYB()F

    move-result v13

    div-float/2addr v12, v13

    sub-float/2addr v12, v6

    mul-float/2addr v12, v10

    .line 613
    .local v12, "ZC":F
    add-float v6, v4, v8

    add-float/2addr v6, v11

    .line 614
    .local v6, "XW":F
    const/high16 v13, 0x3f800000    # 1.0f

    .line 615
    .local v13, "YW":F
    add-float v14, v5, v9

    add-float/2addr v14, v12

    .line 616
    .local v14, "ZW":F
    const/4 v15, 0x3

    move-object/from16 v16, v1

    .end local v1    # "pngChromaticities":Lcom/itextpdf/io/image/PngChromaticities;
    .local v16, "pngChromaticities":Lcom/itextpdf/io/image/PngChromaticities;
    new-array v1, v15, [F

    .line 617
    .local v1, "wpa":[F
    const/16 v17, 0x0

    aput v6, v1, v17

    .line 618
    const/16 v18, 0x1

    aput v13, v1, v18

    .line 619
    const/16 v19, 0x2

    aput v14, v1, v19

    .line 620
    move/from16 v20, v2

    .end local v2    # "z":F
    .local v20, "z":F
    invoke-static {v1, v15}, Ljava/util/Arrays;->copyOf([FI)[F

    move-result-object v2

    iput-object v2, v0, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject$PngChromaticitiesHelper;->wp:[F

    .line 621
    const/16 v2, 0x9

    move/from16 v21, v15

    new-array v15, v2, [F

    .line 622
    .local v15, "matrix":[F
    aput v4, v15, v17

    .line 623
    aput v3, v15, v18

    .line 624
    aput v5, v15, v19

    .line 625
    aput v8, v15, v21

    .line 626
    const/16 v17, 0x4

    aput v7, v15, v17

    .line 627
    const/16 v17, 0x5

    aput v9, v15, v17

    .line 628
    const/16 v17, 0x6

    aput v11, v15, v17

    .line 629
    const/16 v17, 0x7

    aput v10, v15, v17

    .line 630
    const/16 v17, 0x8

    aput v12, v15, v17

    .line 631
    invoke-static {v15, v2}, Ljava/util/Arrays;->copyOf([FI)[F

    move-result-object v2

    iput-object v2, v0, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject$PngChromaticitiesHelper;->matrix:[F

    .line 632
    return-void
.end method
