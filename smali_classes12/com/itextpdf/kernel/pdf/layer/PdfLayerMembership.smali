.class public Lcom/itextpdf/kernel/pdf/layer/PdfLayerMembership;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfLayerMembership.java"

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


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 2
    .param p1, "membershipDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 68
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 69
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/layer/PdfLayerMembership;->ensureObjectIsAddedToDocument(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 70
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->OCMD:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 72
    return-void

    .line 71
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid membershipDictionary."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 3
    .param p1, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 57
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 58
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/layer/PdfLayerMembership;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 59
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayerMembership;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->OCMD:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 60
    return-void
.end method


# virtual methods
.method public addLayer(Lcom/itextpdf/kernel/pdf/layer/PdfLayer;)V
    .locals 3
    .param p1, "layer"    # Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    .line 101
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayerMembership;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->OCGs:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 102
    .local v0, "layers":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v0, :cond_0

    .line 103
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    move-object v0, v1

    .line 104
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayerMembership;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->OCGs:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 106
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 107
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 108
    return-void
.end method

.method protected getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;
    .locals 1

    .line 177
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayerMembership;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

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

    .line 163
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayerMembership;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    return-object v0
.end method

.method public getLayers()Ljava/util/Collection;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/itextpdf/kernel/pdf/layer/PdfLayer;",
            ">;"
        }
    .end annotation

    .line 80
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayerMembership;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->OCGs:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 81
    .local v0, "layers":Lcom/itextpdf/kernel/pdf/PdfObject;
    instance-of v1, v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    if-eqz v1, :cond_0

    .line 82
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/layer/PdfLayer;>;"
    new-instance v2, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    move-object v3, v0

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayerMembership;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    return-object v1

    .line 86
    .end local v1    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/layer/PdfLayer;>;"
    :cond_0
    instance-of v1, v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    if-eqz v1, :cond_2

    .line 87
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 88
    .local v1, "layerList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/layer/PdfLayer;>;"
    const/4 v2, 0x0

    .local v2, "ind":I
    :goto_0
    move-object v3, v0

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 89
    new-instance v3, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    move-object v4, v0

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayerMembership;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfArray;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfArray;

    move-object v5, v4

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v4, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsDictionary(I)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 91
    .end local v2    # "ind":I
    :cond_1
    return-object v1

    .line 93
    .end local v1    # "layerList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/layer/PdfLayer;>;"
    :cond_2
    const/4 v1, 0x0

    return-object v1
.end method

.method public bridge synthetic getPdfObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 1

    .line 48
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    return-object v0
.end method

.method public getVisibilityExpression()Lcom/itextpdf/kernel/pdf/layer/PdfVisibilityExpression;
    .locals 2

    .line 157
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayerMembership;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->VE:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 158
    .local v0, "ve":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-eqz v0, :cond_0

    new-instance v1, Lcom/itextpdf/kernel/pdf/layer/PdfVisibilityExpression;

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/pdf/layer/PdfVisibilityExpression;-><init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method

.method public getVisibilityPolicy()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 2

    .line 133
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayerMembership;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    .line 134
    .local v0, "visibilityPolicy":Lcom/itextpdf/kernel/pdf/PdfName;
    if-eqz v0, :cond_1

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AllOn:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AllOff:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AnyOn:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 135
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AnyOff:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 137
    :cond_0
    return-object v0

    .line 136
    :cond_1
    :goto_0
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AnyOn:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v1
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 168
    const/4 v0, 0x1

    return v0
.end method

.method public setVisibilityExpression(Lcom/itextpdf/kernel/pdf/layer/PdfVisibilityExpression;)V
    .locals 3
    .param p1, "visibilityExpression"    # Lcom/itextpdf/kernel/pdf/layer/PdfVisibilityExpression;

    .line 148
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayerMembership;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->VE:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/layer/PdfVisibilityExpression;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 149
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayerMembership;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 150
    return-void
.end method

.method public setVisibilityPolicy(Lcom/itextpdf/kernel/pdf/PdfName;)V
    .locals 2
    .param p1, "visibilityPolicy"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 121
    if-eqz p1, :cond_1

    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->AllOn:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->AnyOn:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->AnyOff:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 122
    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->AllOff:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 124
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayerMembership;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 125
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfLayerMembership;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 126
    return-void

    .line 123
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Argument: visibilityPolicy"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
