.class public Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;
.super Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern;
.source "PdfPattern.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Tiling"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling$TilingType;,
        Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling$PaintType;
    }
.end annotation


# instance fields
.field private resources:Lcom/itextpdf/kernel/pdf/PdfResources;


# direct methods
.method public constructor <init>(FF)V
    .locals 1
    .param p1, "width"    # F
    .param p2, "height"    # F

    .line 182
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;-><init>(FFZ)V

    .line 183
    return-void
.end method

.method public constructor <init>(FFFF)V
    .locals 6
    .param p1, "width"    # F
    .param p2, "height"    # F
    .param p3, "xStep"    # F
    .param p4, "yStep"    # F

    .line 230
    const/4 v5, 0x1

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    .end local p1    # "width":F
    .end local p2    # "height":F
    .end local p3    # "xStep":F
    .end local p4    # "yStep":F
    .local v1, "width":F
    .local v2, "height":F
    .local v3, "xStep":F
    .local v4, "yStep":F
    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;-><init>(FFFFZ)V

    .line 231
    return-void
.end method

.method public constructor <init>(FFFFZ)V
    .locals 1
    .param p1, "width"    # F
    .param p2, "height"    # F
    .param p3, "xStep"    # F
    .param p4, "yStep"    # F
    .param p5, "colored"    # Z

    .line 243
    new-instance v0, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-direct {v0, p1, p2}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FF)V

    invoke-direct {p0, v0, p3, p4, p5}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;FFZ)V

    .line 244
    return-void
.end method

.method public constructor <init>(FFZ)V
    .locals 1
    .param p1, "width"    # F
    .param p2, "height"    # F
    .param p3, "colored"    # Z

    .line 193
    new-instance v0, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-direct {v0, p1, p2}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FF)V

    invoke-direct {p0, v0, p3}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;Z)V

    .line 194
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 1
    .param p1, "bbox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 205
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;Z)V

    .line 206
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/geom/Rectangle;FF)V
    .locals 1
    .param p1, "bbox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "xStep"    # F
    .param p3, "yStep"    # F

    .line 257
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;FFZ)V

    .line 258
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/geom/Rectangle;FFZ)V
    .locals 5
    .param p1, "bbox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "xStep"    # F
    .param p3, "yStep"    # F
    .param p4, "colored"    # Z

    .line 269
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 121
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    .line 270
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Pattern:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 271
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->PatternType:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 272
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->PaintType:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    if-eqz p4, :cond_0

    move v4, v3

    goto :goto_0

    :cond_0
    const/4 v4, 0x2

    :goto_0
    invoke-direct {v2, v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 273
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->TilingType:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 274
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BBox:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 275
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->XStep:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    float-to-double v3, p2

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 276
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->YStep:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    float-to-double v3, p3

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 277
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfResources;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfResources;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    .line 278
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Resources:Lcom/itextpdf/kernel/pdf/PdfName;

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfResources;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 279
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/geom/Rectangle;Z)V
    .locals 2
    .param p1, "bbox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "colored"    # Z

    .line 215
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    invoke-direct {p0, p1, v0, v1, p2}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;FFZ)V

    .line 216
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfStream;)V
    .locals 1
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 169
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 121
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    .line 170
    return-void
.end method


# virtual methods
.method public flush()V
    .locals 1

    .line 403
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    .line 404
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern;->flush()V

    .line 405
    return-void
.end method

.method public getBBox()Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 2

    .line 330
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BBox:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->toRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    return-object v0
.end method

.method public getResources()Lcom/itextpdf/kernel/pdf/PdfResources;
    .locals 3

    .line 387
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    if-nez v0, :cond_1

    .line 388
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Resources:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 389
    .local v0, "resourcesDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-nez v0, :cond_0

    .line 390
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    move-object v0, v1

    .line 391
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Resources:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 393
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfResources;

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfResources;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    .line 395
    .end local v0    # "resourcesDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->resources:Lcom/itextpdf/kernel/pdf/PdfResources;

    return-object v0
.end method

.method public getTilingType()I
    .locals 2

    .line 307
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->TilingType:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v0

    return v0
.end method

.method public getXStep()F
    .locals 2

    .line 349
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->XStep:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v0

    return v0
.end method

.method public getYStep()F
    .locals 2

    .line 368
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->YStep:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v0

    return v0
.end method

.method public isColored()Z
    .locals 2

    .line 287
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->PaintType:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public setBBox(Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 3
    .param p1, "bbox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 339
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BBox:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 340
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 341
    return-void
.end method

.method public setColored(Z)V
    .locals 4
    .param p1, "colored"    # Z

    .line 297
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->PaintType:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    if-eqz p1, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x2

    :goto_0
    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 298
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 299
    return-void
.end method

.method public setTilingType(I)V
    .locals 3
    .param p1, "tilingType"    # I

    .line 317
    const/4 v0, 0x1

    if-eq p1, v0, :cond_1

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    const/4 v0, 0x3

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 319
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "tilingType"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 320
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->TilingType:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 321
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 322
    return-void
.end method

.method public setXStep(F)V
    .locals 5
    .param p1, "xStep"    # F

    .line 358
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->XStep:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    float-to-double v3, p1

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 359
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 360
    return-void
.end method

.method public setYStep(F)V
    .locals 5
    .param p1, "yStep"    # F

    .line 377
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->YStep:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    float-to-double v3, p1

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 378
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 379
    return-void
.end method
