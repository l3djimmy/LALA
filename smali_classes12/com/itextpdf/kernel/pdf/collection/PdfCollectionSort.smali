.class public Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSort;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfCollectionSort.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 40
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 41
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 3
    .param p1, "key"    # Ljava/lang/String;

    .line 49
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSort;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 50
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSort;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 51
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;)V
    .locals 5
    .param p1, "keys"    # [Ljava/lang/String;

    .line 59
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSort;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 60
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSort;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    const/4 v4, 0x1

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>(Ljava/util/List;Z)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 61
    return-void
.end method


# virtual methods
.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 103
    const/4 v0, 0x0

    return v0
.end method

.method public setSortOrder(Z)Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSort;
    .locals 4
    .param p1, "ascending"    # Z

    .line 70
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSort;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 71
    .local v0, "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isName()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 72
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSort;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->A:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->valueOf(Z)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 77
    return-object p0

    .line 74
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "You have to define a boolean array for this collection sort dictionary."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public setSortOrder([Z)Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSort;
    .locals 4
    .param p1, "ascending"    # [Z

    .line 87
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSort;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 88
    .local v0, "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isArray()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 89
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v1

    array-length v2, p1

    if-ne v1, v2, :cond_0

    .line 93
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSort;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->A:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v3, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([Z)V

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 94
    return-object p0

    .line 90
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "The number of booleans in the array doesn\'t correspond with the number of fields."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 96
    :cond_1
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "You need a single boolean for this collection sort dictionary."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
