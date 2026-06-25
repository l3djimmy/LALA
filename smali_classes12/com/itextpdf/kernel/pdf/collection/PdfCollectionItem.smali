.class public Lcom/itextpdf/kernel/pdf/collection/PdfCollectionItem;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfCollectionItem.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
        ">;"
    }
.end annotation


# instance fields
.field private schema:Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSchema;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSchema;)V
    .locals 1
    .param p1, "schema"    # Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSchema;

    .line 41
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 42
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionItem;->schema:Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSchema;

    .line 43
    return-void
.end method


# virtual methods
.method public addItem(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/collection/PdfCollectionItem;
    .locals 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 53
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionItem;->schema:Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSchema;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSchema;->getField(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;

    move-result-object v0

    .line 54
    .local v0, "field":Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionItem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;->getValue(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 55
    return-object p0
.end method

.method public addItem(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfDate;)V
    .locals 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "date"    # Lcom/itextpdf/kernel/pdf/PdfDate;

    .line 65
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionItem;->schema:Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSchema;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSchema;->getField(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;

    move-result-object v0

    .line 66
    .local v0, "field":Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;
    iget v1, v0, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;->subType:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 67
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionItem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfDate;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 69
    :cond_0
    return-void
.end method

.method public addItem(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfNumber;)V
    .locals 3
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "number"    # Lcom/itextpdf/kernel/pdf/PdfNumber;

    .line 78
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionItem;->schema:Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSchema;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSchema;->getField(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;

    move-result-object v0

    .line 79
    .local v0, "field":Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;
    iget v1, v0, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;->subType:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    .line 80
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionItem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2, p2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 82
    :cond_0
    return-void
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 107
    const/4 v0, 0x0

    return v0
.end method

.method public setPrefix(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/collection/PdfCollectionItem;
    .locals 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "prefix"    # Ljava/lang/String;

    .line 93
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    .line 94
    .local v0, "fieldName":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionItem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 95
    .local v1, "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v1, :cond_0

    .line 98
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 99
    .local v2, "subItem":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 100
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v4, p2}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 101
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionItem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v3, v0, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 102
    return-object p0

    .line 96
    .end local v2    # "subItem":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_0
    new-instance v2, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v3, "You must set a value before adding a prefix."

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v2
.end method
