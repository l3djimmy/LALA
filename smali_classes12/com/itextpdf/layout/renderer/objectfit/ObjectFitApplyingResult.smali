.class public Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;
.super Ljava/lang/Object;
.source "ObjectFitApplyingResult.java"


# instance fields
.field private imageCuttingRequired:Z

.field private renderedImageHeight:D

.field private renderedImageWidth:D


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    return-void
.end method

.method public constructor <init>(DDZ)V
    .locals 0
    .param p1, "renderedImageWidth"    # D
    .param p3, "renderedImageHeight"    # D
    .param p5, "imageCuttingRequired"    # Z

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-wide p1, p0, Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;->renderedImageWidth:D

    .line 53
    iput-wide p3, p0, Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;->renderedImageHeight:D

    .line 54
    iput-boolean p5, p0, Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;->imageCuttingRequired:Z

    .line 55
    return-void
.end method


# virtual methods
.method public getRenderedImageHeight()D
    .locals 2

    .line 82
    iget-wide v0, p0, Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;->renderedImageHeight:D

    return-wide v0
.end method

.method public getRenderedImageWidth()D
    .locals 2

    .line 64
    iget-wide v0, p0, Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;->renderedImageWidth:D

    return-wide v0
.end method

.method public isImageCuttingRequired()Z
    .locals 1

    .line 101
    iget-boolean v0, p0, Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;->imageCuttingRequired:Z

    return v0
.end method

.method public setImageCuttingRequired(Z)V
    .locals 0
    .param p1, "imageCuttingRequired"    # Z

    .line 111
    iput-boolean p1, p0, Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;->imageCuttingRequired:Z

    .line 112
    return-void
.end method

.method public setRenderedImageHeight(D)V
    .locals 0
    .param p1, "renderedImageHeight"    # D

    .line 91
    iput-wide p1, p0, Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;->renderedImageHeight:D

    .line 92
    return-void
.end method

.method public setRenderedImageWidth(D)V
    .locals 0
    .param p1, "renderedImageWidth"    # D

    .line 73
    iput-wide p1, p0, Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;->renderedImageWidth:D

    .line 74
    return-void
.end method
