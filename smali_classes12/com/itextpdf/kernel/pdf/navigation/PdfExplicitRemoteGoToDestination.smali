.class public Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;
.super Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;
.source "PdfExplicitRemoteGoToDestination.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 40
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;-><init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 41
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 44
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 45
    return-void
.end method

.method private add(F)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;
    .locals 4
    .param p1, "value"    # F

    .line 175
    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_0

    .line 176
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    float-to-double v2, p1

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 178
    :cond_0
    return-object p0
.end method

.method private add(I)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;
    .locals 2
    .param p1, "value"    # I

    .line 182
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 183
    return-object p0
.end method

.method private add(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;
    .locals 1
    .param p1, "type"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 187
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 188
    return-object p0
.end method

.method public static create(ILcom/itextpdf/kernel/pdf/PdfName;FFFFF)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;
    .locals 1
    .param p0, "pageNum"    # I
    .param p1, "type"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "left"    # F
    .param p3, "bottom"    # F
    .param p4, "right"    # F
    .param p5, "top"    # F
    .param p6, "zoom"    # F

    .line 166
    new-instance v0, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;-><init>()V

    add-int/lit8 p0, p0, -0x1

    invoke-direct {v0, p0}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;->add(I)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;

    move-result-object v0

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;->add(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;

    move-result-object v0

    invoke-direct {v0, p2}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;->add(F)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;

    move-result-object v0

    invoke-direct {v0, p3}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;->add(F)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;

    move-result-object v0

    invoke-direct {v0, p4}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;->add(F)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;

    move-result-object v0

    invoke-direct {v0, p5}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;->add(F)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;

    move-result-object v0

    invoke-direct {v0, p6}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;->add(F)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;

    move-result-object v0

    return-object v0
.end method

.method public static createFit(I)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;
    .locals 7
    .param p0, "pageNum"    # I

    .line 74
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Fit:Lcom/itextpdf/kernel/pdf/PdfName;

    const/high16 v5, 0x7fc00000    # Float.NaN

    const/high16 v6, 0x7fc00000    # Float.NaN

    const/high16 v2, 0x7fc00000    # Float.NaN

    const/high16 v3, 0x7fc00000    # Float.NaN

    const/high16 v4, 0x7fc00000    # Float.NaN

    move v0, p0

    .end local p0    # "pageNum":I
    .local v0, "pageNum":I
    invoke-static/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;->create(ILcom/itextpdf/kernel/pdf/PdfName;FFFFF)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;

    move-result-object p0

    return-object p0
.end method

.method public static createFitB(I)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;
    .locals 7
    .param p0, "pageNum"    # I

    .line 125
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->FitB:Lcom/itextpdf/kernel/pdf/PdfName;

    const/high16 v5, 0x7fc00000    # Float.NaN

    const/high16 v6, 0x7fc00000    # Float.NaN

    const/high16 v2, 0x7fc00000    # Float.NaN

    const/high16 v3, 0x7fc00000    # Float.NaN

    const/high16 v4, 0x7fc00000    # Float.NaN

    move v0, p0

    .end local p0    # "pageNum":I
    .local v0, "pageNum":I
    invoke-static/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;->create(ILcom/itextpdf/kernel/pdf/PdfName;FFFFF)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;

    move-result-object p0

    return-object p0
.end method

.method public static createFitBH(IF)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;
    .locals 7
    .param p0, "pageNum"    # I
    .param p1, "top"    # F

    .line 137
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->FitBH:Lcom/itextpdf/kernel/pdf/PdfName;

    const/high16 v4, 0x7fc00000    # Float.NaN

    const/high16 v6, 0x7fc00000    # Float.NaN

    const/high16 v2, 0x7fc00000    # Float.NaN

    const/high16 v3, 0x7fc00000    # Float.NaN

    move v0, p0

    move v5, p1

    .end local p0    # "pageNum":I
    .end local p1    # "top":F
    .local v0, "pageNum":I
    .local v5, "top":F
    invoke-static/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;->create(ILcom/itextpdf/kernel/pdf/PdfName;FFFFF)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;

    move-result-object p0

    return-object p0
.end method

.method public static createFitBV(IF)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;
    .locals 7
    .param p0, "pageNum"    # I
    .param p1, "left"    # F

    .line 149
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->FitBH:Lcom/itextpdf/kernel/pdf/PdfName;

    const/high16 v5, 0x7fc00000    # Float.NaN

    const/high16 v6, 0x7fc00000    # Float.NaN

    const/high16 v3, 0x7fc00000    # Float.NaN

    const/high16 v4, 0x7fc00000    # Float.NaN

    move v0, p0

    move v2, p1

    .end local p0    # "pageNum":I
    .end local p1    # "left":F
    .local v0, "pageNum":I
    .local v2, "left":F
    invoke-static/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;->create(ILcom/itextpdf/kernel/pdf/PdfName;FFFFF)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;

    move-result-object p0

    return-object p0
.end method

.method public static createFitH(IF)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;
    .locals 7
    .param p0, "pageNum"    # I
    .param p1, "top"    # F

    .line 86
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->FitH:Lcom/itextpdf/kernel/pdf/PdfName;

    const/high16 v4, 0x7fc00000    # Float.NaN

    const/high16 v6, 0x7fc00000    # Float.NaN

    const/high16 v2, 0x7fc00000    # Float.NaN

    const/high16 v3, 0x7fc00000    # Float.NaN

    move v0, p0

    move v5, p1

    .end local p0    # "pageNum":I
    .end local p1    # "top":F
    .local v0, "pageNum":I
    .local v5, "top":F
    invoke-static/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;->create(ILcom/itextpdf/kernel/pdf/PdfName;FFFFF)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;

    move-result-object p0

    return-object p0
.end method

.method public static createFitR(IFFFF)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;
    .locals 7
    .param p0, "pageNum"    # I
    .param p1, "left"    # F
    .param p2, "bottom"    # F
    .param p3, "right"    # F
    .param p4, "top"    # F

    .line 114
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->FitR:Lcom/itextpdf/kernel/pdf/PdfName;

    const/high16 v6, 0x7fc00000    # Float.NaN

    move v0, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    .end local p0    # "pageNum":I
    .end local p1    # "left":F
    .end local p2    # "bottom":F
    .end local p3    # "right":F
    .end local p4    # "top":F
    .local v0, "pageNum":I
    .local v2, "left":F
    .local v3, "bottom":F
    .local v4, "right":F
    .local v5, "top":F
    invoke-static/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;->create(ILcom/itextpdf/kernel/pdf/PdfName;FFFFF)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;

    move-result-object p0

    return-object p0
.end method

.method public static createFitV(IF)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;
    .locals 7
    .param p0, "pageNum"    # I
    .param p1, "left"    # F

    .line 98
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->FitV:Lcom/itextpdf/kernel/pdf/PdfName;

    const/high16 v5, 0x7fc00000    # Float.NaN

    const/high16 v6, 0x7fc00000    # Float.NaN

    const/high16 v3, 0x7fc00000    # Float.NaN

    const/high16 v4, 0x7fc00000    # Float.NaN

    move v0, p0

    move v2, p1

    .end local p0    # "pageNum":I
    .end local p1    # "left":F
    .local v0, "pageNum":I
    .local v2, "left":F
    invoke-static/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;->create(ILcom/itextpdf/kernel/pdf/PdfName;FFFFF)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;

    move-result-object p0

    return-object p0
.end method

.method public static createXYZ(IFFF)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;
    .locals 7
    .param p0, "pageNum"    # I
    .param p1, "left"    # F
    .param p2, "top"    # F
    .param p3, "zoom"    # F

    .line 63
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->XYZ:Lcom/itextpdf/kernel/pdf/PdfName;

    const/high16 v3, 0x7fc00000    # Float.NaN

    const/high16 v4, 0x7fc00000    # Float.NaN

    move v0, p0

    move v2, p1

    move v5, p2

    move v6, p3

    .end local p0    # "pageNum":I
    .end local p1    # "left":F
    .end local p2    # "top":F
    .end local p3    # "zoom":F
    .local v0, "pageNum":I
    .local v2, "left":F
    .local v5, "top":F
    .local v6, "zoom":F
    invoke-static/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;->create(ILcom/itextpdf/kernel/pdf/PdfName;FFFFF)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public getDestinationPage(Lcom/itextpdf/kernel/pdf/IPdfNameTreeAccess;)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 2
    .param p1, "names"    # Lcom/itextpdf/kernel/pdf/IPdfNameTreeAccess;

    .line 49
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 171
    const/4 v0, 0x0

    return v0
.end method
