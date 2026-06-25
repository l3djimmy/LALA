.class public Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;
.super Lcom/itextpdf/kernel/pdf/annot/PdfMarkupAnnotation;
.source "PdfRedactAnnotation.java"


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 0
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 43
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfMarkupAnnotation;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 44
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 54
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfMarkupAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 55
    return-void
.end method


# virtual methods
.method public getDefaultAppearance()Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 2

    .line 67
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->DA:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    return-object v0
.end method

.method public getInteriorColor()Lcom/itextpdf/kernel/colors/Color;
    .locals 2

    .line 135
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->IC:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/annot/InteriorColorUtil;->parseInteriorColor(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/colors/Color;

    move-result-object v0

    return-object v0
.end method

.method public getJustification()I
    .locals 2

    .line 169
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Q:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 170
    .local v0, "q":Lcom/itextpdf/kernel/pdf/PdfNumber;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v1

    :goto_0
    return v1
.end method

.method public getOverlayText()Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 2

    .line 88
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->OverlayText:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    return-object v0
.end method

.method public getQuadPoints()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2

    .line 114
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->QuadPoints:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    return-object v0
.end method

.method public getRedactRolloverAppearance()Lcom/itextpdf/kernel/pdf/PdfStream;
    .locals 2

    .line 96
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->RO:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsStream(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v0

    return-object v0
.end method

.method public getRepeat()Lcom/itextpdf/kernel/pdf/PdfBoolean;
    .locals 2

    .line 104
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Repeat:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsBoolean(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v0

    return-object v0
.end method

.method public getSubtype()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 1

    .line 59
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Redact:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0
.end method

.method public setDefaultAppearance(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;
    .locals 1
    .param p1, "appearanceString"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 76
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->DA:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;

    return-object v0
.end method

.method public setDefaultAppearance(Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;)Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;
    .locals 1
    .param p1, "da"    # Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;

    .line 80
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->toPdfString()Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;->setDefaultAppearance(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setInteriorColor(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;
    .locals 1
    .param p1, "interiorColor"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 149
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->IC:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;

    return-object v0
.end method

.method public setInteriorColor([F)Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;
    .locals 1
    .param p1, "interiorColor"    # [F

    .line 160
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([F)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;->setInteriorColor(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setJustification(I)Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;
    .locals 2
    .param p1, "justification"    # I

    .line 180
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Q:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;

    return-object v0
.end method

.method public setOverlayText(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;
    .locals 1
    .param p1, "text"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 84
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->OverlayText:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;

    return-object v0
.end method

.method public setQuadPoints(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;
    .locals 1
    .param p1, "quadPoints"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 125
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->QuadPoints:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;

    return-object v0
.end method

.method public setRedactRolloverAppearance(Lcom/itextpdf/kernel/pdf/PdfStream;)Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;
    .locals 1
    .param p1, "stream"    # Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 92
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->RO:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;

    return-object v0
.end method

.method public setRepeat(Lcom/itextpdf/kernel/pdf/PdfBoolean;)Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;
    .locals 1
    .param p1, "repeat"    # Lcom/itextpdf/kernel/pdf/PdfBoolean;

    .line 100
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Repeat:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;

    return-object v0
.end method
