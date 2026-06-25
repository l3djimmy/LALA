.class public Lcom/itextpdf/kernel/pdf/tagging/PdfUserPropertiesAttributes;
.super Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;
.source "PdfUserPropertiesAttributes.java"


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 37
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 38
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserPropertiesAttributes;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->O:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->UserProperties:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 39
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserPropertiesAttributes;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 40
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 0
    .param p1, "attributesDict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 33
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 34
    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;",
            ">;)V"
        }
    .end annotation

    .line 43
    .local p1, "userProperties":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;>;"
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserPropertiesAttributes;-><init>()V

    .line 44
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserPropertiesAttributes;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 45
    .local v0, "arr":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;

    .line 46
    .local v2, "userProperty":Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 47
    .end local v2    # "userProperty":Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;
    goto :goto_0

    .line 48
    :cond_0
    return-void
.end method


# virtual methods
.method public addUserProperty(Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;)Lcom/itextpdf/kernel/pdf/tagging/PdfUserPropertiesAttributes;
    .locals 2
    .param p1, "userProperty"    # Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;

    .line 51
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserPropertiesAttributes;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 52
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserPropertiesAttributes;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 53
    return-object p0
.end method

.method public getNumberOfUserProperties()I
    .locals 2

    .line 70
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserPropertiesAttributes;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v0

    return v0
.end method

.method public getUserProperty(I)Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;
    .locals 2
    .param p1, "i"    # I

    .line 57
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserPropertiesAttributes;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsDictionary(I)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 58
    .local v0, "propDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-nez v0, :cond_0

    .line 59
    const/4 v1, 0x0

    return-object v1

    .line 61
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    return-object v1
.end method

.method public removeUserProperty(I)Lcom/itextpdf/kernel/pdf/tagging/PdfUserPropertiesAttributes;
    .locals 2
    .param p1, "i"    # I

    .line 65
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserPropertiesAttributes;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->remove(I)V

    .line 66
    return-object p0
.end method
