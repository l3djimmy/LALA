.class public Lcom/itextpdf/kernel/pdf/filespec/PdfDictionaryFS;
.super Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
.source "PdfDictionaryFS.java"


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 31
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 32
    return-void
.end method
