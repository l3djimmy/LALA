.class public Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$Axial;
.super Lcom/itextpdf/kernel/pdf/colorspace/PdfShading;
.source "PdfShading.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/colorspace/PdfShading;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Axial"
.end annotation


# direct methods
.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 0
    .param p1, "pdfDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 343
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 344
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;FF[FFF[F)V
    .locals 10
    .param p1, "cs"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
    .param p2, "x0"    # F
    .param p3, "y0"    # F
    .param p4, "color0"    # [F
    .param p5, "x1"    # F
    .param p6, "y1"    # F
    .param p7, "color1"    # [F

    .line 359
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    const/4 v1, 0x2

    invoke-direct {p0, v0, v1, p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;ILcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;)V

    .line 361
    move/from16 v2, p6

    invoke-virtual {p0, p2, p3, p5, v2}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$Axial;->setCoords(FFFF)V

    .line 362
    new-instance v3, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;

    new-array v4, v1, [F

    fill-array-data v4, :array_0

    const/4 v5, 0x0

    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    move-object v6, p4

    move-object/from16 v7, p7

    invoke-direct/range {v3 .. v9}, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;-><init>([F[F[F[FD)V

    .line 363
    .local v3, "func":Lcom/itextpdf/kernel/pdf/function/IPdfFunction;
    invoke-virtual {p0, v3}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$Axial;->setFunction(Lcom/itextpdf/kernel/pdf/function/IPdfFunction;)V

    .line 364
    return-void

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;FF[FFF[F[Z)V
    .locals 2
    .param p1, "cs"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
    .param p2, "x0"    # F
    .param p3, "y0"    # F
    .param p4, "color0"    # [F
    .param p5, "x1"    # F
    .param p6, "y1"    # F
    .param p7, "color1"    # [F
    .param p8, "extend"    # [Z

    .line 381
    invoke-direct/range {p0 .. p7}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$Axial;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;FF[FFF[F)V

    .line 383
    if-eqz p8, :cond_0

    array-length v0, p8

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 386
    const/4 v0, 0x0

    aget-boolean v0, p8, v0

    const/4 v1, 0x1

    aget-boolean v1, p8, v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$Axial;->setExtend(ZZ)V

    .line 387
    return-void

    .line 384
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "extend"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/function/IPdfFunction;)V
    .locals 2
    .param p1, "cs"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
    .param p2, "coords"    # Lcom/itextpdf/kernel/pdf/PdfArray;
    .param p3, "domain"    # Lcom/itextpdf/kernel/pdf/PdfArray;
    .param p4, "function"    # Lcom/itextpdf/kernel/pdf/function/IPdfFunction;

    .line 416
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    const/4 v1, 0x2

    invoke-direct {p0, v0, v1, p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;ILcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;)V

    .line 417
    invoke-virtual {p0, p2}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$Axial;->setCoords(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 418
    if-eqz p3, :cond_0

    .line 419
    invoke-virtual {p0, p3}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$Axial;->setDomain(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 421
    :cond_0
    invoke-virtual {p0, p4}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$Axial;->setFunction(Lcom/itextpdf/kernel/pdf/function/IPdfFunction;)V

    .line 422
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/function/IPdfFunction;)V
    .locals 1
    .param p1, "cs"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
    .param p2, "coords"    # Lcom/itextpdf/kernel/pdf/PdfArray;
    .param p3, "function"    # Lcom/itextpdf/kernel/pdf/function/IPdfFunction;

    .line 399
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p3}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$Axial;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/function/IPdfFunction;)V

    .line 400
    return-void
.end method


# virtual methods
.method public getCoords()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2

    .line 432
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$Axial;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Coords:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    return-object v0
.end method

.method public getDomain()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 3

    .line 466
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$Axial;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Domain:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 467
    .local v0, "domain":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v0, :cond_0

    .line 468
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_0

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([F)V

    move-object v0, v1

    .line 469
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$Axial;->setDomain(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 471
    :cond_0
    return-object v0

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public getExtend()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 3

    .line 503
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$Axial;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Extend:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 504
    .local v0, "extend":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v0, :cond_0

    .line 505
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    const/4 v2, 0x2

    new-array v2, v2, [Z

    fill-array-data v2, :array_0

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([Z)V

    move-object v0, v1

    .line 506
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$Axial;->setExtend(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 508
    :cond_0
    return-object v0

    :array_0
    .array-data 1
        0x0t
        0x0t
    .end array-data
.end method

.method public setCoords(FFFF)V
    .locals 3
    .param p1, "x0"    # F
    .param p2, "y0"    # F
    .param p3, "x1"    # F
    .param p4, "y1"    # F

    .line 444
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    const/4 v1, 0x4

    new-array v1, v1, [F

    const/4 v2, 0x0

    aput p1, v1, v2

    const/4 v2, 0x1

    aput p2, v1, v2

    const/4 v2, 0x2

    aput p3, v1, v2

    const/4 v2, 0x3

    aput p4, v1, v2

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([F)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$Axial;->setCoords(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 445
    return-void
.end method

.method public setCoords(Lcom/itextpdf/kernel/pdf/PdfArray;)V
    .locals 2
    .param p1, "coords"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 455
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$Axial;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Coords:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 456
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$Axial;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 457
    return-void
.end method

.method public setDomain(FF)V
    .locals 3
    .param p1, "t0"    # F
    .param p2, "t1"    # F

    .line 482
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    const/4 v1, 0x2

    new-array v1, v1, [F

    const/4 v2, 0x0

    aput p1, v1, v2

    const/4 v2, 0x1

    aput p2, v1, v2

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([F)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$Axial;->setDomain(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 483
    return-void
.end method

.method public setDomain(Lcom/itextpdf/kernel/pdf/PdfArray;)V
    .locals 2
    .param p1, "domain"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 492
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$Axial;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Domain:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 493
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$Axial;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 494
    return-void
.end method

.method public setExtend(Lcom/itextpdf/kernel/pdf/PdfArray;)V
    .locals 2
    .param p1, "extend"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 529
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$Axial;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Extend:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 530
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$Axial;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 531
    return-void
.end method

.method public setExtend(ZZ)V
    .locals 3
    .param p1, "extendStart"    # Z
    .param p2, "extendEnd"    # Z

    .line 518
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    const/4 v1, 0x2

    new-array v1, v1, [Z

    const/4 v2, 0x0

    aput-boolean p1, v1, v2

    const/4 v2, 0x1

    aput-boolean p2, v1, v2

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([Z)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$Axial;->setExtend(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 519
    return-void
.end method
