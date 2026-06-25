.class public abstract Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfDestination.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfObject;",
        ">;"
    }
.end annotation


# direct methods
.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 38
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 39
    return-void
.end method

.method public static makeDestination(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;
    .locals 5
    .param p0, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 45
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v0

    const/16 v1, 0xa

    if-ne v0, v1, :cond_0

    .line 46
    new-instance v0, Lcom/itextpdf/kernel/pdf/navigation/PdfStringDestination;

    move-object v1, p0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/navigation/PdfStringDestination;-><init>(Lcom/itextpdf/kernel/pdf/PdfString;)V

    return-object v0

    .line 47
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v0

    const/4 v1, 0x6

    if-ne v0, v1, :cond_1

    .line 48
    new-instance v0, Lcom/itextpdf/kernel/pdf/navigation/PdfNamedDestination;

    move-object v1, p0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/navigation/PdfNamedDestination;-><init>(Lcom/itextpdf/kernel/pdf/PdfName;)V

    return-object v0

    .line 49
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_5

    .line 50
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 51
    .local v0, "destArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v1

    if-eqz v1, :cond_4

    .line 54
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 56
    .local v1, "firstObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isNumber()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 57
    new-instance v2, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;

    invoke-direct {v2, v0}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;-><init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    return-object v2

    .line 60
    :cond_2
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isDictionary()Z

    move-result v2

    if-eqz v2, :cond_3

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Page:Lcom/itextpdf/kernel/pdf/PdfName;

    move-object v3, v1

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 61
    new-instance v2, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;

    invoke-direct {v2, v0}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;-><init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    return-object v2

    .line 64
    :cond_3
    new-instance v2, Lcom/itextpdf/kernel/pdf/navigation/PdfStructureDestination;

    invoke-direct {v2, v0}, Lcom/itextpdf/kernel/pdf/navigation/PdfStructureDestination;-><init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    return-object v2

    .line 52
    .end local v1    # "firstObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_4
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1

    .line 67
    .end local v0    # "destArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_5
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method


# virtual methods
.method public abstract getDestinationPage(Lcom/itextpdf/kernel/pdf/IPdfNameTreeAccess;)Lcom/itextpdf/kernel/pdf/PdfObject;
.end method
