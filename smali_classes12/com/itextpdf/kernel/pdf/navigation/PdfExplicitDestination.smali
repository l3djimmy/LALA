.class public Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;
.super Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;
.source "PdfExplicitDestination.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 46
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;-><init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 47
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 50
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 51
    return-void
.end method

.method private add(F)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;
    .locals 4
    .param p1, "value"    # F

    .line 181
    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_0

    .line 182
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    float-to-double v2, p1

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 184
    :cond_0
    return-object p0
.end method

.method private add(I)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;
    .locals 2
    .param p1, "value"    # I

    .line 188
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 189
    return-object p0
.end method

.method private add(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;
    .locals 1
    .param p1, "type"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 199
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 200
    return-object p0
.end method

.method private add(Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;
    .locals 2
    .param p1, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 194
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 195
    return-object p0
.end method

.method public static create(Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfName;FFFFF)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;
    .locals 1
    .param p0, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;
    .param p1, "type"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "left"    # F
    .param p3, "bottom"    # F
    .param p4, "right"    # F
    .param p5, "top"    # F
    .param p6, "zoom"    # F

    .line 172
    new-instance v0, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;-><init>()V

    invoke-direct {v0, p0}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;->add(Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;

    move-result-object v0

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;->add(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;

    move-result-object v0

    invoke-direct {v0, p2}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;->add(F)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;

    move-result-object v0

    invoke-direct {v0, p3}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;->add(F)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;

    move-result-object v0

    invoke-direct {v0, p4}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;->add(F)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;

    move-result-object v0

    invoke-direct {v0, p5}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;->add(F)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;

    move-result-object v0

    invoke-direct {v0, p6}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;->add(F)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;

    move-result-object v0

    return-object v0
.end method

.method public static createFit(Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;
    .locals 7
    .param p0, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 80
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Fit:Lcom/itextpdf/kernel/pdf/PdfName;

    const/high16 v5, 0x7fc00000    # Float.NaN

    const/high16 v6, 0x7fc00000    # Float.NaN

    const/high16 v2, 0x7fc00000    # Float.NaN

    const/high16 v3, 0x7fc00000    # Float.NaN

    const/high16 v4, 0x7fc00000    # Float.NaN

    move-object v0, p0

    .end local p0    # "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    .local v0, "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    invoke-static/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;->create(Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfName;FFFFF)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;

    move-result-object p0

    return-object p0
.end method

.method public static createFitB(Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;
    .locals 7
    .param p0, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 131
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->FitB:Lcom/itextpdf/kernel/pdf/PdfName;

    const/high16 v5, 0x7fc00000    # Float.NaN

    const/high16 v6, 0x7fc00000    # Float.NaN

    const/high16 v2, 0x7fc00000    # Float.NaN

    const/high16 v3, 0x7fc00000    # Float.NaN

    const/high16 v4, 0x7fc00000    # Float.NaN

    move-object v0, p0

    .end local p0    # "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    .local v0, "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    invoke-static/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;->create(Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfName;FFFFF)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;

    move-result-object p0

    return-object p0
.end method

.method public static createFitBH(Lcom/itextpdf/kernel/pdf/PdfPage;F)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;
    .locals 7
    .param p0, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;
    .param p1, "top"    # F

    .line 143
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->FitBH:Lcom/itextpdf/kernel/pdf/PdfName;

    const/high16 v4, 0x7fc00000    # Float.NaN

    const/high16 v6, 0x7fc00000    # Float.NaN

    const/high16 v2, 0x7fc00000    # Float.NaN

    const/high16 v3, 0x7fc00000    # Float.NaN

    move-object v0, p0

    move v5, p1

    .end local p0    # "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    .end local p1    # "top":F
    .local v0, "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    .local v5, "top":F
    invoke-static/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;->create(Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfName;FFFFF)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;

    move-result-object p0

    return-object p0
.end method

.method public static createFitBV(Lcom/itextpdf/kernel/pdf/PdfPage;F)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;
    .locals 7
    .param p0, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;
    .param p1, "left"    # F

    .line 155
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->FitBV:Lcom/itextpdf/kernel/pdf/PdfName;

    const/high16 v5, 0x7fc00000    # Float.NaN

    const/high16 v6, 0x7fc00000    # Float.NaN

    const/high16 v3, 0x7fc00000    # Float.NaN

    const/high16 v4, 0x7fc00000    # Float.NaN

    move-object v0, p0

    move v2, p1

    .end local p0    # "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    .end local p1    # "left":F
    .local v0, "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    .local v2, "left":F
    invoke-static/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;->create(Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfName;FFFFF)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;

    move-result-object p0

    return-object p0
.end method

.method public static createFitH(Lcom/itextpdf/kernel/pdf/PdfPage;F)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;
    .locals 7
    .param p0, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;
    .param p1, "top"    # F

    .line 92
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->FitH:Lcom/itextpdf/kernel/pdf/PdfName;

    const/high16 v4, 0x7fc00000    # Float.NaN

    const/high16 v6, 0x7fc00000    # Float.NaN

    const/high16 v2, 0x7fc00000    # Float.NaN

    const/high16 v3, 0x7fc00000    # Float.NaN

    move-object v0, p0

    move v5, p1

    .end local p0    # "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    .end local p1    # "top":F
    .local v0, "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    .local v5, "top":F
    invoke-static/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;->create(Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfName;FFFFF)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;

    move-result-object p0

    return-object p0
.end method

.method public static createFitR(Lcom/itextpdf/kernel/pdf/PdfPage;FFFF)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;
    .locals 7
    .param p0, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;
    .param p1, "left"    # F
    .param p2, "bottom"    # F
    .param p3, "right"    # F
    .param p4, "top"    # F

    .line 120
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->FitR:Lcom/itextpdf/kernel/pdf/PdfName;

    const/high16 v6, 0x7fc00000    # Float.NaN

    move-object v0, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    .end local p0    # "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    .end local p1    # "left":F
    .end local p2    # "bottom":F
    .end local p3    # "right":F
    .end local p4    # "top":F
    .local v0, "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    .local v2, "left":F
    .local v3, "bottom":F
    .local v4, "right":F
    .local v5, "top":F
    invoke-static/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;->create(Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfName;FFFFF)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;

    move-result-object p0

    return-object p0
.end method

.method public static createFitV(Lcom/itextpdf/kernel/pdf/PdfPage;F)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;
    .locals 7
    .param p0, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;
    .param p1, "left"    # F

    .line 104
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->FitV:Lcom/itextpdf/kernel/pdf/PdfName;

    const/high16 v5, 0x7fc00000    # Float.NaN

    const/high16 v6, 0x7fc00000    # Float.NaN

    const/high16 v3, 0x7fc00000    # Float.NaN

    const/high16 v4, 0x7fc00000    # Float.NaN

    move-object v0, p0

    move v2, p1

    .end local p0    # "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    .end local p1    # "left":F
    .local v0, "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    .local v2, "left":F
    invoke-static/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;->create(Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfName;FFFFF)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;

    move-result-object p0

    return-object p0
.end method

.method public static createXYZ(Lcom/itextpdf/kernel/pdf/PdfPage;FFF)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;
    .locals 7
    .param p0, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;
    .param p1, "left"    # F
    .param p2, "top"    # F
    .param p3, "zoom"    # F

    .line 69
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->XYZ:Lcom/itextpdf/kernel/pdf/PdfName;

    const/high16 v3, 0x7fc00000    # Float.NaN

    const/high16 v4, 0x7fc00000    # Float.NaN

    move-object v0, p0

    move v2, p1

    move v5, p2

    move v6, p3

    .end local p0    # "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    .end local p1    # "left":F
    .end local p2    # "top":F
    .end local p3    # "zoom":F
    .local v0, "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    .local v2, "left":F
    .local v5, "top":F
    .local v6, "zoom":F
    invoke-static/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;->create(Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/PdfName;FFFFF)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public getDestinationPage(Lcom/itextpdf/kernel/pdf/IPdfNameTreeAccess;)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 2
    .param p1, "names"    # Lcom/itextpdf/kernel/pdf/IPdfNameTreeAccess;

    .line 55
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 177
    const/4 v0, 0x0

    return v0
.end method
