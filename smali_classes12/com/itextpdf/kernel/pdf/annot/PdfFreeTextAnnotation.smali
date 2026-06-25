.class public Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;
.super Lcom/itextpdf/kernel/pdf/annot/PdfMarkupAnnotation;
.source "PdfFreeTextAnnotation.java"


# static fields
.field public static final CENTERED:I = 0x1

.field public static final LEFT_JUSTIFIED:I = 0x0

.field public static final RIGHT_JUSTIFIED:I = 0x2


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/pdf/PdfString;)V
    .locals 0
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "contents"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 50
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfMarkupAnnotation;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 51
    if-eqz p2, :cond_0

    .line 52
    invoke-virtual {p0, p2}, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;->setContents(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 54
    :cond_0
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 64
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfMarkupAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 65
    return-void
.end method


# virtual methods
.method public getBorderEffect()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 2

    .line 227
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BE:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    return-object v0
.end method

.method public getBorderStyle()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 2

    .line 150
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BS:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    return-object v0
.end method

.method public getCalloutLine()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2

    .line 102
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->CL:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultAppearance()Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 2

    .line 85
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->DA:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultStyleString()Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 2

    .line 73
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->DS:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    return-object v0
.end method

.method public getJustification()I
    .locals 2

    .line 127
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Q:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 128
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

.method public getLineEndingStyle()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 2

    .line 114
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->LE:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    return-object v0
.end method

.method public getRectangleDifferences()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2

    .line 203
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->RD:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    return-object v0
.end method

.method public getRotation()Lcom/itextpdf/kernel/pdf/PdfNumber;
    .locals 2

    .line 246
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Rotate:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    return-object v0
.end method

.method public getSubtype()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 1

    .line 69
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->FreeText:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0
.end method

.method public setBorderEffect(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;
    .locals 1
    .param p1, "borderEffect"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 237
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->BE:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;

    return-object v0
.end method

.method public setBorderStyle(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;
    .locals 1
    .param p1, "borderStyle"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 161
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->BS:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;

    return-object v0
.end method

.method public setBorderStyle(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;
    .locals 1
    .param p1, "style"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 179
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;->getBorderStyle()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/itextpdf/kernel/pdf/annot/BorderStyleUtil;->setStyle(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;->setBorderStyle(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setCalloutLine(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;
    .locals 1
    .param p1, "calloutLine"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 110
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->CL:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;

    return-object v0
.end method

.method public setCalloutLine([F)Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;
    .locals 1
    .param p1, "calloutLine"    # [F

    .line 106
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([F)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;->setCalloutLine(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setDashPattern(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;
    .locals 1
    .param p1, "dashPattern"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 191
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;->getBorderStyle()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/itextpdf/kernel/pdf/annot/BorderStyleUtil;->setDashPattern(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;->setBorderStyle(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setDefaultAppearance(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;
    .locals 1
    .param p1, "appearanceString"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 94
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->DA:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;

    return-object v0
.end method

.method public setDefaultAppearance(Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;)Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;
    .locals 1
    .param p1, "da"    # Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;

    .line 98
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->toPdfString()Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;->setDefaultAppearance(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setDefaultStyleString(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;
    .locals 1
    .param p1, "defaultStyleString"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 77
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->DS:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;

    return-object v0
.end method

.method public setJustification(I)Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;
    .locals 2
    .param p1, "justification"    # I

    .line 138
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Q:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;

    return-object v0
.end method

.method public setLineEndingStyle(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;
    .locals 1
    .param p1, "lineEndingStyle"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 118
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->LE:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;

    return-object v0
.end method

.method public setRectangleDifferences(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;
    .locals 1
    .param p1, "rect"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 218
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->RD:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;

    return-object v0
.end method

.method public setRotation(I)Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;
    .locals 2
    .param p1, "degAngle"    # I

    .line 256
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Rotate:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 257
    return-object p0
.end method
