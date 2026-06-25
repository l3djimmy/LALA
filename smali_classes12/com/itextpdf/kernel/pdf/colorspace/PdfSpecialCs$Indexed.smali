.class public Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Indexed;
.super Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs;
.source "PdfSpecialCs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Indexed"
.end annotation


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 68
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs;-><init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 69
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfObject;ILcom/itextpdf/kernel/pdf/PdfString;)V
    .locals 1
    .param p1, "base"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p2, "hival"    # I
    .param p3, "lookup"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 72
    invoke-static {p1, p2, p3}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Indexed;->getIndexedCsArray(Lcom/itextpdf/kernel/pdf/PdfObject;ILcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Indexed;-><init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 73
    return-void
.end method

.method private static getIndexedCsArray(Lcom/itextpdf/kernel/pdf/PdfObject;ILcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2
    .param p0, "base"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p1, "hival"    # I
    .param p2, "lookup"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 85
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 86
    .local v0, "indexed":Lcom/itextpdf/kernel/pdf/PdfArray;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Indexed:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 87
    invoke-virtual {v0, p0}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 88
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 89
    const/4 v1, 0x1

    invoke-virtual {p2, v1}, Lcom/itextpdf/kernel/pdf/PdfString;->setHexWriting(Z)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 90
    return-object v0
.end method


# virtual methods
.method public getBaseCs()Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
    .locals 2

    .line 81
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Indexed;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Indexed;->makeColorSpace(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;

    move-result-object v0

    return-object v0
.end method

.method public getNumberOfComponents()I
    .locals 1

    .line 77
    const/4 v0, 0x1

    return v0
.end method
