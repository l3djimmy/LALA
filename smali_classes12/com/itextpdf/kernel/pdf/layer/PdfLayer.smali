.class public Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfLayer.java"

# interfaces
.implements Lcom/itextpdf/kernel/pdf/layer/IPdfOCG;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
        ">;",
        "Lcom/itextpdf/kernel/pdf/layer/IPdfOCG;"
    }
.end annotation


# instance fields
.field protected children:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/layer/PdfLayer;",
            ">;"
        }
    .end annotation
.end field

.field protected locked:Z

.field protected on:Z

.field protected onPanel:Z

.field protected parent:Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

.field protected title:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 1
    .param p1, "layerDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 68
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 56
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->on:Z

    .line 57
    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->onPanel:Z

    .line 58
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->locked:Z

    .line 69
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->setForbidRelease()V

    .line 70
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->ensureObjectIsAddedToDocument(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 71
    return-void
.end method

.method private constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 3
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 85
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 56
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->on:Z

    .line 57
    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->onPanel:Z

    .line 58
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->locked:Z

    .line 86
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 87
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->OCG:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 88
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 79
    invoke-direct {p0, p2}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 80
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->setName(Ljava/lang/String;)V

    .line 81
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getOCProperties(Z)Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->registerLayer(Lcom/itextpdf/kernel/pdf/layer/PdfLayer;)V

    .line 82
    return-void
.end method

.method public static addOCGRadioGroup(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/util/List;)V
    .locals 2
    .param p0, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/layer/PdfLayer;",
            ">;)V"
        }
    .end annotation

    .line 113
    .local p1, "group":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/layer/PdfLayer;>;"
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getOCProperties(Z)Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->addOCGRadioGroup(Ljava/util/List;)V

    .line 114
    return-void
.end method

.method public static createTitle(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    .locals 3
    .param p0, "title"    # Ljava/lang/String;
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 98
    invoke-static {p0, p1}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->createTitleSilent(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    move-result-object v0

    .line 99
    .local v0, "layer":Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getOCProperties(Z)Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->registerLayer(Lcom/itextpdf/kernel/pdf/layer/PdfLayer;)V

    .line 100
    return-object v0
.end method

.method protected static createTitleSilent(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    .locals 2
    .param p0, "title"    # Ljava/lang/String;
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 443
    if-eqz p0, :cond_0

    .line 445
    new-instance v0, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 446
    .local v0, "layer":Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    iput-object p0, v0, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->title:Ljava/lang/String;

    .line 447
    return-object v0

    .line 444
    .end local v0    # "layer":Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid title argument"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private fetchOCProperties()Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;
    .locals 2

    .line 464
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getOCProperties(Z)Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public addChild(Lcom/itextpdf/kernel/pdf/layer/PdfLayer;)V
    .locals 2
    .param p1, "childLayer"    # Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    .line 121
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->parent:Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    if-nez v0, :cond_1

    .line 123
    iput-object p0, p1, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->parent:Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    .line 124
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->children:Ljava/util/List;

    if-nez v0, :cond_0

    .line 125
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->children:Ljava/util/List;

    .line 126
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->children:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 127
    return-void

    .line 122
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Illegal argument: childLayer"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getChildren()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/layer/PdfLayer;",
            ">;"
        }
    .end annotation

    .line 419
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->children:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->children:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    :goto_0
    return-object v0
.end method

.method protected getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;
    .locals 1

    .line 433
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    return-object v0
.end method

.method public getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .locals 1

    .line 400
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    return-object v0
.end method

.method public getIntents()Ljava/util/Collection;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            ">;"
        }
    .end annotation

    .line 214
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Intent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 215
    .local v0, "intent":Lcom/itextpdf/kernel/pdf/PdfObject;
    instance-of v1, v0, Lcom/itextpdf/kernel/pdf/PdfName;

    if-eqz v1, :cond_0

    .line 216
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    return-object v1

    .line 217
    :cond_0
    instance-of v1, v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    if-eqz v1, :cond_3

    .line 218
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 219
    .local v1, "intentArr":Lcom/itextpdf/kernel/pdf/PdfArray;
    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 220
    .local v2, "intentsCollection":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 221
    .local v4, "i":Lcom/itextpdf/kernel/pdf/PdfObject;
    instance-of v5, v4, Lcom/itextpdf/kernel/pdf/PdfName;

    if-eqz v5, :cond_1

    .line 222
    move-object v5, v4

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v2, v5}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 224
    .end local v4    # "i":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_1
    goto :goto_0

    .line 225
    :cond_2
    return-object v2

    .line 227
    .end local v1    # "intentArr":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v2    # "intentsCollection":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    :cond_3
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->View:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public getParent()Lcom/itextpdf/kernel/pdf/layer/PdfLayer;
    .locals 1

    .line 134
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->parent:Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    return-object v0
.end method

.method public bridge synthetic getPdfObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 1

    .line 50
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .line 409
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->title:Ljava/lang/String;

    return-object v0
.end method

.method protected getUsage()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 3

    .line 455
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Usage:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 456
    .local v0, "usage":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-nez v0, :cond_0

    .line 457
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    move-object v0, v1

    .line 458
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Usage:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 460
    :cond_0
    return-object v0
.end method

.method public isLocked()Z
    .locals 1

    .line 170
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->locked:Z

    return v0
.end method

.method public isOn()Z
    .locals 1

    .line 151
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->on:Z

    return v0
.end method

.method public isOnPanel()Z
    .locals 1

    .line 192
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->onPanel:Z

    return v0
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 424
    const/4 v0, 0x1

    return v0
.end method

.method public setCreatorInfo(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "creator"    # Ljava/lang/String;
    .param p2, "subtype"    # Ljava/lang/String;

    .line 261
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getUsage()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 262
    .local v0, "usage":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 263
    .local v1, "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Creator:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v4, "UnicodeBig"

    invoke-direct {v3, p1, v4}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 264
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {v3, p2}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 265
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->CreatorInfo:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v2, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 266
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 267
    return-void
.end method

.method public setExport(Z)V
    .locals 4
    .param p1, "export"    # Z

    .line 295
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getUsage()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 296
    .local v0, "usage":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 297
    .local v1, "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->ExportState:Lcom/itextpdf/kernel/pdf/PdfName;

    if-eqz p1, :cond_0

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->ON:Lcom/itextpdf/kernel/pdf/PdfName;

    goto :goto_0

    :cond_0
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->OFF:Lcom/itextpdf/kernel/pdf/PdfName;

    :goto_0
    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 298
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Export:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v2, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 299
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 300
    return-void
.end method

.method public setIntents(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            ">;)V"
        }
    .end annotation

    .line 235
    .local p1, "intents":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    if-eqz p1, :cond_3

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 237
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 238
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Intent:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v2, 0x0

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfObject;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_2

    .line 242
    :cond_1
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 243
    .local v0, "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfName;

    .line 244
    .local v2, "intent":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 245
    .end local v2    # "intent":Lcom/itextpdf/kernel/pdf/PdfName;
    goto :goto_0

    .line 246
    :cond_2
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Intent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_2

    .line 236
    .end local v0    # "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_3
    :goto_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Intent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 248
    :goto_2
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 249
    return-void
.end method

.method public setLanguage(Ljava/lang/String;Z)V
    .locals 5
    .param p1, "lang"    # Ljava/lang/String;
    .param p2, "preferred"    # Z

    .line 278
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getUsage()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 279
    .local v0, "usage":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 280
    .local v1, "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Lang:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v4, "UnicodeBig"

    invoke-direct {v3, p1, v4}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 281
    if-eqz p2, :cond_0

    .line 282
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Preferred:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->ON:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 283
    :cond_0
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Language:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v2, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 284
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 285
    return-void
.end method

.method public setLocked(Z)V
    .locals 1
    .param p1, "locked"    # Z

    .line 182
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->isLocked()Z

    move-result v0

    if-eq v0, p1, :cond_0

    .line 183
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->fetchOCProperties()Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 184
    :cond_0
    iput-boolean p1, p0, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->locked:Z

    .line 185
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .line 142
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Name:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v3, "UnicodeBig"

    invoke-direct {v2, p1, v3}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 143
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 144
    return-void
.end method

.method public setOn(Z)V
    .locals 1
    .param p1, "on"    # Z

    .line 159
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->on:Z

    if-eq v0, p1, :cond_0

    .line 160
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->fetchOCProperties()Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 161
    :cond_0
    iput-boolean p1, p0, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->on:Z

    .line 162
    return-void
.end method

.method public setOnPanel(Z)V
    .locals 1
    .param p1, "onPanel"    # Z

    .line 202
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->on:Z

    if-eq v0, p1, :cond_0

    .line 203
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->fetchOCProperties()Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/layer/PdfOCProperties;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 204
    :cond_0
    iput-boolean p1, p0, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->onPanel:Z

    .line 205
    return-void
.end method

.method public setPageElement(Ljava/lang/String;)V
    .locals 4
    .param p1, "pe"    # Ljava/lang/String;

    .line 388
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getUsage()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 389
    .local v0, "usage":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 390
    .local v1, "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {v3, p1}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 391
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->PageElement:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v2, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 392
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 393
    return-void
.end method

.method public setPrint(Ljava/lang/String;Z)V
    .locals 4
    .param p1, "subtype"    # Ljava/lang/String;
    .param p2, "printState"    # Z

    .line 333
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getUsage()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 334
    .local v0, "usage":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 335
    .local v1, "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {v3, p1}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 336
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->PrintState:Lcom/itextpdf/kernel/pdf/PdfName;

    if-eqz p2, :cond_0

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->ON:Lcom/itextpdf/kernel/pdf/PdfName;

    goto :goto_0

    :cond_0
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->OFF:Lcom/itextpdf/kernel/pdf/PdfName;

    :goto_0
    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 337
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Print:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v2, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 338
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 339
    return-void
.end method

.method public varargs setUser(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 8
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "names"    # [Ljava/lang/String;

    .line 362
    if-eqz p1, :cond_4

    const-string v0, "Ind"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Ttl"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Org"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 364
    :cond_0
    if-eqz p2, :cond_3

    array-length v0, p2

    if-eqz v0, :cond_3

    .line 366
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getUsage()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 367
    .local v0, "usage":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 368
    .local v1, "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {v3, p1}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 369
    array-length v2, p2

    const-string v3, "UnicodeBig"

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-ne v2, v5, :cond_1

    .line 370
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Name:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfString;

    aget-object v4, p2, v4

    invoke-direct {v5, v4, v3}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_1

    .line 372
    :cond_1
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 373
    .local v2, "namesArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    array-length v5, p2

    :goto_0
    if-ge v4, v5, :cond_2

    aget-object v6, p2, v4

    .line 374
    .local v6, "name":Ljava/lang/String;
    new-instance v7, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v7, v6, v3}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v7}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 373
    .end local v6    # "name":Ljava/lang/String;
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 376
    :cond_2
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Name:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v3, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 378
    .end local v2    # "namesArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    :goto_1
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->User:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v2, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 379
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 380
    return-void

    .line 365
    .end local v0    # "usage":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v1    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Illegal names argument"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 363
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Illegal type argument"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setView(Z)V
    .locals 4
    .param p1, "view"    # Z

    .line 347
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getUsage()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 348
    .local v0, "usage":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 349
    .local v1, "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->ViewState:Lcom/itextpdf/kernel/pdf/PdfName;

    if-eqz p1, :cond_0

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->ON:Lcom/itextpdf/kernel/pdf/PdfName;

    goto :goto_0

    :cond_0
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->OFF:Lcom/itextpdf/kernel/pdf/PdfName;

    :goto_0
    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 350
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->View:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v2, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 351
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 352
    return-void
.end method

.method public setZoom(FF)V
    .locals 7
    .param p1, "min"    # F
    .param p2, "max"    # F

    .line 312
    const/4 v0, 0x0

    cmpg-float v1, p1, v0

    if-gtz v1, :cond_0

    cmpg-float v1, p2, v0

    if-gez v1, :cond_0

    .line 313
    return-void

    .line 314
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getUsage()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    .line 315
    .local v1, "usage":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 316
    .local v2, "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    cmpl-float v3, p1, v0

    if-lez v3, :cond_1

    .line 317
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->min:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfNumber;

    float-to-double v5, p1

    invoke-direct {v4, v5, v6}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 318
    :cond_1
    cmpl-float v0, p2, v0

    if-ltz v0, :cond_2

    .line 319
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->max:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfNumber;

    float-to-double v4, p2

    invoke-direct {v3, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v2, v0, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 320
    :cond_2
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Zoom:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v0, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 321
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 322
    return-void
.end method
