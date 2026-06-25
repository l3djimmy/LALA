.class Lcom/itextpdf/kernel/pdf/PdfPageFactory;
.super Ljava/lang/Object;
.source "PdfPageFactory.java"

# interfaces
.implements Lcom/itextpdf/kernel/pdf/IPdfPageFactory;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createPdfPage(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 1
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 31
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfPage;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfPage;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    return-object v0
.end method

.method public createPdfPage(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/geom/PageSize;)Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 1
    .param p1, "pdfDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "pageSize"    # Lcom/itextpdf/kernel/geom/PageSize;

    .line 36
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfPage;

    invoke-direct {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfPage;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/geom/PageSize;)V

    return-object v0
.end method
