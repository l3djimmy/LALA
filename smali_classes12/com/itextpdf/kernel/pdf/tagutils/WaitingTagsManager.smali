.class public Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;
.super Ljava/lang/Object;
.source "WaitingTagsManager.java"


# instance fields
.field private associatedObjToWaitingTag:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;",
            ">;"
        }
    .end annotation
.end field

.field private waitingTagToAssociatedObj:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->associatedObjToWaitingTag:Ljava/util/Map;

    .line 49
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->waitingTagToAssociatedObj:Ljava/util/Map;

    .line 50
    return-void
.end method

.method private flushStructElementAndItKids(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V
    .locals 3
    .param p1, "elem"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 168
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->waitingTagToAssociatedObj:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 169
    return-void

    .line 172
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getKids()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    .line 173
    .local v1, "kid":Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    instance-of v2, v1, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    if-eqz v2, :cond_1

    .line 174
    move-object v2, v1

    check-cast v2, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-direct {p0, v2}, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->flushStructElementAndItKids(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V

    .line 176
    .end local v1    # "kid":Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    :cond_1
    goto :goto_0

    .line 177
    :cond_2
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->flush()V

    .line 178
    return-void
.end method

.method private removeWaitingStateAndFlushIfParentFlushed(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V
    .locals 2
    .param p1, "structElem"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 181
    if-eqz p1, :cond_0

    .line 182
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->waitingTagToAssociatedObj:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getParent()Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    move-result-object v0

    .line 184
    .local v0, "parent":Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    instance-of v1, v0, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    if-eqz v1, :cond_0

    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->isFlushed()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 185
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->flushStructElementAndItKids(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V

    .line 188
    .end local v0    # "parent":Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    :cond_0
    return-void
.end method


# virtual methods
.method public assignWaitingState(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "pointerToTag"    # Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .param p2, "associatedObj"    # Ljava/lang/Object;

    .line 63
    if-eqz p2, :cond_0

    .line 64
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {p0, p2, v0}, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->saveAssociatedObjectForWaitingTag(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 63
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Passed associated object can not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method flushTag(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    .locals 2
    .param p1, "tagStruct"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 157
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->waitingTagToAssociatedObj:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 158
    .local v0, "associatedObj":Ljava/lang/Object;
    if-eqz v0, :cond_0

    .line 159
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->associatedObjToWaitingTag:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getParent()Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    move-result-object v1

    .line 163
    .local v1, "parent":Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->flushStructElementAndItKids(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V

    .line 164
    return-object v1
.end method

.method getObjForStructDict(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Ljava/lang/Object;
    .locals 1
    .param p1, "structDict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 145
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->waitingTagToAssociatedObj:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method getStructForObj(Ljava/lang/Object;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    .locals 1
    .param p1, "associatedObj"    # Ljava/lang/Object;

    .line 141
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->associatedObjToWaitingTag:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    return-object v0
.end method

.method public isObjectAssociatedWithWaitingTag(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "obj"    # Ljava/lang/Object;

    .line 73
    if-eqz p1, :cond_0

    .line 74
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->associatedObjToWaitingTag:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 73
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Passed associated object can not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public removeAllWaitingStates()V
    .locals 2

    .line 134
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->associatedObjToWaitingTag:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 135
    .local v1, "structElem":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->removeWaitingStateAndFlushIfParentFlushed(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V

    .line 136
    .end local v1    # "structElem":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    goto :goto_0

    .line 137
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->associatedObjToWaitingTag:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 138
    return-void
.end method

.method public removeWaitingState(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "associatedObject"    # Ljava/lang/Object;

    .line 119
    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 120
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->associatedObjToWaitingTag:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 121
    .local v1, "structElem":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->removeWaitingStateAndFlushIfParentFlushed(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V

    .line 122
    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0

    .line 124
    .end local v1    # "structElem":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    :cond_1
    return v0
.end method

.method saveAssociatedObjectForWaitingTag(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Ljava/lang/Object;
    .locals 2
    .param p1, "associatedObj"    # Ljava/lang/Object;
    .param p2, "structElem"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 149
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->associatedObjToWaitingTag:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->waitingTagToAssociatedObj:Ljava/util/Map;

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public tryMovePointerToWaitingTag(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;Ljava/lang/Object;)Z
    .locals 2
    .param p1, "tagPointer"    # Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .param p2, "associatedObject"    # Ljava/lang/Object;

    .line 87
    const/4 v0, 0x0

    if-nez p2, :cond_0

    return v0

    .line 89
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->associatedObjToWaitingTag:Ljava/util/Map;

    invoke-interface {v1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 90
    .local v1, "waitingStructElem":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    if-eqz v1, :cond_1

    .line 91
    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->setCurrentStructElem(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 92
    const/4 v0, 0x1

    return v0

    .line 94
    :cond_1
    return v0
.end method
