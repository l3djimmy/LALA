.class public Lcom/itextpdf/kernel/pdf/collection/PdfCollection;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfCollection.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
        ">;"
    }
.end annotation


# static fields
.field public static final DETAILS:I = 0x0

.field public static final HIDDEN:I = 0x2

.field public static final TILE:I = 0x1


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 49
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollection;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 50
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 42
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 43
    return-void
.end method


# virtual methods
.method public getInitialDocument()Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 2

    .line 91
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollection;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    return-object v0
.end method

.method public getSchema()Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSchema;
    .locals 3

    .line 69
    new-instance v0, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSchema;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollection;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Schema:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSchema;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    return-object v0
.end method

.method public getSort()Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSort;
    .locals 3

    .line 160
    new-instance v0, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSort;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollection;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Sort:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSort;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    return-object v0
.end method

.method public isViewDetails()Z
    .locals 2

    .line 121
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollection;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->View:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    .line 122
    .local v0, "view":Lcom/itextpdf/kernel/pdf/PdfName;
    if-eqz v0, :cond_1

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    return v1
.end method

.method public isViewHidden()Z
    .locals 3

    .line 140
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->H:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollection;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->View:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isViewTile()Z
    .locals 3

    .line 131
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->T:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollection;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->View:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 165
    const/4 v0, 0x0

    return v0
.end method

.method public setInitialDocument(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/collection/PdfCollection;
    .locals 3
    .param p1, "documentName"    # Ljava/lang/String;

    .line 80
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollection;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 81
    return-object p0
.end method

.method public setSchema(Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSchema;)Lcom/itextpdf/kernel/pdf/collection/PdfCollection;
    .locals 3
    .param p1, "schema"    # Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSchema;

    .line 59
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollection;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Schema:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSchema;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 60
    return-object p0
.end method

.method public setSort(Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSort;)Lcom/itextpdf/kernel/pdf/collection/PdfCollection;
    .locals 3
    .param p1, "sort"    # Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSort;

    .line 150
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollection;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Sort:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionSort;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 151
    return-object p0
.end method

.method public setView(I)Lcom/itextpdf/kernel/pdf/collection/PdfCollection;
    .locals 3
    .param p1, "viewType"    # I

    .line 101
    packed-switch p1, :pswitch_data_0

    .line 103
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollection;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->View:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 104
    goto :goto_0

    .line 109
    :pswitch_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollection;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->View:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->H:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_0

    .line 106
    :pswitch_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollection;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->View:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->T:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 107
    nop

    .line 112
    :goto_0
    return-object p0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
