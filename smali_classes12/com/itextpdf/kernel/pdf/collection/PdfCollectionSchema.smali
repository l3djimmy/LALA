.class public Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSchema;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfCollectionSchema.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 40
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSchema;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 41
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 33
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 34
    return-void
.end method


# virtual methods
.method public addField(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;)Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSchema;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "field"    # Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;

    .line 51
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSchema;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 52
    return-object p0
.end method

.method public getField(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .line 62
    new-instance v0, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSchema;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    return-object v0
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 67
    const/4 v0, 0x0

    return v0
.end method
