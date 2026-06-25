.class public Lcom/itextpdf/kernel/pdf/PdfEncryptedPayloadDocument;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfEncryptedPayloadDocument.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfStream;",
        ">;"
    }
.end annotation


# instance fields
.field private fileSpec:Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

.field private name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfStream;Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;Ljava/lang/String;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfStream;
    .param p2, "fileSpec"    # Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .param p3, "name"    # Ljava/lang/String;

    .line 33
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 34
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/PdfEncryptedPayloadDocument;->fileSpec:Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    .line 35
    iput-object p3, p0, Lcom/itextpdf/kernel/pdf/PdfEncryptedPayloadDocument;->name:Ljava/lang/String;

    .line 36
    return-void
.end method


# virtual methods
.method public getDocumentBytes()[B
    .locals 1

    .line 39
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfEncryptedPayloadDocument;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getBytes()[B

    move-result-object v0

    return-object v0
.end method

.method public getEncryptedPayload()Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfEncryptedPayloadDocument;->fileSpec:Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;->extractFrom(Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;)Lcom/itextpdf/kernel/pdf/PdfEncryptedPayload;

    move-result-object v0

    return-object v0
.end method

.method public getFileSpec()Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfEncryptedPayloadDocument;->fileSpec:Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 47
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfEncryptedPayloadDocument;->name:Ljava/lang/String;

    return-object v0
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 56
    const/4 v0, 0x1

    return v0
.end method
