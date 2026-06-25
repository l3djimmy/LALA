.class public Lcom/itextpdf/io/image/PngChromaticities;
.super Ljava/lang/Object;
.source "PngChromaticities.java"


# instance fields
.field private xB:F

.field private xG:F

.field private xR:F

.field private xW:F

.field private yB:F

.field private yG:F

.field private yR:F

.field private yW:F


# direct methods
.method public constructor <init>(FFFFFFFF)V
    .locals 0
    .param p1, "xW"    # F
    .param p2, "yW"    # F
    .param p3, "xR"    # F
    .param p4, "yR"    # F
    .param p5, "xG"    # F
    .param p6, "yG"    # F
    .param p7, "xB"    # F
    .param p8, "yB"    # F

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput p1, p0, Lcom/itextpdf/io/image/PngChromaticities;->xW:F

    .line 37
    iput p2, p0, Lcom/itextpdf/io/image/PngChromaticities;->yW:F

    .line 38
    iput p3, p0, Lcom/itextpdf/io/image/PngChromaticities;->xR:F

    .line 39
    iput p4, p0, Lcom/itextpdf/io/image/PngChromaticities;->yR:F

    .line 40
    iput p5, p0, Lcom/itextpdf/io/image/PngChromaticities;->xG:F

    .line 41
    iput p6, p0, Lcom/itextpdf/io/image/PngChromaticities;->yG:F

    .line 42
    iput p7, p0, Lcom/itextpdf/io/image/PngChromaticities;->xB:F

    .line 43
    iput p8, p0, Lcom/itextpdf/io/image/PngChromaticities;->yB:F

    .line 44
    return-void
.end method


# virtual methods
.method public getXB()F
    .locals 1

    .line 71
    iget v0, p0, Lcom/itextpdf/io/image/PngChromaticities;->xB:F

    return v0
.end method

.method public getXG()F
    .locals 1

    .line 63
    iget v0, p0, Lcom/itextpdf/io/image/PngChromaticities;->xG:F

    return v0
.end method

.method public getXR()F
    .locals 1

    .line 55
    iget v0, p0, Lcom/itextpdf/io/image/PngChromaticities;->xR:F

    return v0
.end method

.method public getXW()F
    .locals 1

    .line 47
    iget v0, p0, Lcom/itextpdf/io/image/PngChromaticities;->xW:F

    return v0
.end method

.method public getYB()F
    .locals 1

    .line 75
    iget v0, p0, Lcom/itextpdf/io/image/PngChromaticities;->yB:F

    return v0
.end method

.method public getYG()F
    .locals 1

    .line 67
    iget v0, p0, Lcom/itextpdf/io/image/PngChromaticities;->yG:F

    return v0
.end method

.method public getYR()F
    .locals 1

    .line 59
    iget v0, p0, Lcom/itextpdf/io/image/PngChromaticities;->yR:F

    return v0
.end method

.method public getYW()F
    .locals 1

    .line 51
    iget v0, p0, Lcom/itextpdf/io/image/PngChromaticities;->yW:F

    return v0
.end method
