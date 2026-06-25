.class public Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;
.super Lcom/itextpdf/kernel/pdf/annot/PdfMarkupAnnotation;
.source "PdfLineAnnotation.java"


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/geom/Rectangle;[F)V
    .locals 2
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "line"    # [F

    .line 53
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfMarkupAnnotation;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 54
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->L:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1, p2}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([F)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 55
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 65
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfMarkupAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 66
    return-void
.end method


# virtual methods
.method public getBorderStyle()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 2

    .line 95
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BS:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    return-object v0
.end method

.method public getCaptionOffset()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2

    .line 349
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->CO:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    return-object v0
.end method

.method public getCaptionPosition()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 2

    .line 308
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->CP:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    return-object v0
.end method

.method public getContentsAsCaption()Z
    .locals 2

    .line 286
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Cap:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsBoolean(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v0

    .line 287
    .local v0, "b":Lcom/itextpdf/kernel/pdf/PdfBoolean;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->getValue()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public getInteriorColor()Lcom/itextpdf/kernel/colors/Color;
    .locals 2

    .line 184
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->IC:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/annot/InteriorColorUtil;->parseInteriorColor(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/colors/Color;

    move-result-object v0

    return-object v0
.end method

.method public getLeaderLineExtension()F
    .locals 2

    .line 243
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->LLE:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 244
    .local v0, "n":Lcom/itextpdf/kernel/pdf/PdfNumber;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v1

    :goto_0
    return v1
.end method

.method public getLeaderLineLength()F
    .locals 2

    .line 220
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->LL:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 221
    .local v0, "n":Lcom/itextpdf/kernel/pdf/PdfNumber;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v1

    :goto_0
    return v1
.end method

.method public getLeaderLineOffset()F
    .locals 2

    .line 264
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->LLO:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 265
    .local v0, "n":Lcom/itextpdf/kernel/pdf/PdfNumber;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v1

    :goto_0
    return v1
.end method

.method public getLine()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2

    .line 83
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->L:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    return-object v0
.end method

.method public getLineEndingStyles()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2

    .line 148
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->LE:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    return-object v0
.end method

.method public getMeasure()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 2

    .line 326
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Measure:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    return-object v0
.end method

.method public getSubtype()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 1

    .line 73
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Line:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0
.end method

.method public setBorderStyle(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;
    .locals 1
    .param p1, "borderStyle"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 106
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->BS:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;

    return-object v0
.end method

.method public setBorderStyle(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;
    .locals 1
    .param p1, "style"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 124
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;->getBorderStyle()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/itextpdf/kernel/pdf/annot/BorderStyleUtil;->setStyle(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;->setBorderStyle(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setCaptionOffset(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;
    .locals 1
    .param p1, "captionOffset"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 362
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->CO:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;

    return-object v0
.end method

.method public setCaptionOffset([F)Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;
    .locals 1
    .param p1, "captionOffset"    # [F

    .line 375
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([F)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;->setCaptionOffset(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setCaptionPosition(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;
    .locals 1
    .param p1, "captionPosition"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 318
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->CP:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;

    return-object v0
.end method

.method public setContentsAsCaption(Z)Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;
    .locals 2
    .param p1, "contentsAsCaption"    # Z

    .line 298
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Cap:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->valueOf(Z)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;

    return-object v0
.end method

.method public setDashPattern(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;
    .locals 1
    .param p1, "dashPattern"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 136
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;->getBorderStyle()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/itextpdf/kernel/pdf/annot/BorderStyleUtil;->setDashPattern(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;->setBorderStyle(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setInteriorColor(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;
    .locals 1
    .param p1, "interiorColor"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 198
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->IC:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;

    return-object v0
.end method

.method public setInteriorColor([F)Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;
    .locals 1
    .param p1, "interiorColor"    # [F

    .line 209
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([F)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;->setInteriorColor(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setLeaderLineExtension(F)Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;
    .locals 4
    .param p1, "leaderLineExtension"    # F

    .line 254
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->LLE:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    float-to-double v2, p1

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;

    return-object v0
.end method

.method public setLeaderLineLength(F)Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;
    .locals 4
    .param p1, "leaderLineLength"    # F

    .line 233
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->LL:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    float-to-double v2, p1

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;

    return-object v0
.end method

.method public setLeaderLineOffset(F)Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;
    .locals 4
    .param p1, "leaderLineOffset"    # F

    .line 275
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->LLO:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    float-to-double v2, p1

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;

    return-object v0
.end method

.method public setLineEndingStyles(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;
    .locals 1
    .param p1, "lineEndingStyles"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 174
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->LE:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;

    return-object v0
.end method

.method public setMeasure(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;
    .locals 1
    .param p1, "measure"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 336
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Measure:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;

    return-object v0
.end method
