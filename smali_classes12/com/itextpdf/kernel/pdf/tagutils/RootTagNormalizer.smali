.class Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;
.super Ljava/lang/Object;
.source "RootTagNormalizer.java"


# instance fields
.field private context:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

.field private document:Lcom/itextpdf/kernel/pdf/PdfDocument;

.field private rootTagElement:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;


# direct methods
.method constructor <init>(Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 0
    .param p1, "context"    # Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;
    .param p2, "rootTagElement"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    .param p3, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->context:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    .line 47
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->rootTagElement:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 48
    iput-object p3, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 49
    return-void
.end method

.method private addStructTreeRootKidsToTheRootTag(Ljava/util/List;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;",
            ">;)V"
        }
    .end annotation

    .line 101
    .local p1, "rootKids":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;>;"
    const/4 v0, 0x0

    .line 102
    .local v0, "originalRootKidsIndex":I
    const/4 v1, 0x1

    .line 103
    .local v1, "isBeforeOriginalRoot":Z
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    .line 105
    .local v3, "elem":Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    move-object v4, v3

    check-cast v4, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 106
    .local v4, "kid":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v5

    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->rootTagElement:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v6

    if-ne v5, v6, :cond_0

    .line 107
    const/4 v1, 0x0

    .line 108
    goto :goto_0

    .line 114
    :cond_0
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->Document:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getRole()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v5

    .line 115
    .local v5, "kidIsDocument":Z
    const/4 v6, 0x1

    if-eqz v5, :cond_3

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getNamespace()Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    move-result-object v7

    if-eqz v7, :cond_3

    iget-object v7, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->context:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->targetTagStructureVersionIs2()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 117
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getNamespace()Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->getNamespaceName()Ljava/lang/String;

    move-result-object v7

    .line 118
    .local v7, "kidNamespaceName":Ljava/lang/String;
    const-string v8, "http://iso.org/pdf/ssn"

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_2

    const-string v8, "http://iso.org/pdf2/ssn"

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    goto :goto_1

    :cond_1
    const/4 v8, 0x0

    goto :goto_2

    :cond_2
    :goto_1
    move v8, v6

    :goto_2
    move v5, v8

    .line 121
    .end local v7    # "kidNamespaceName":Ljava/lang/String;
    :cond_3
    nop

    .line 125
    iget-object v7, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->rootTagElement:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 121
    if-eqz v1, :cond_5

    .line 122
    invoke-virtual {v7, v0, v4}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->addKid(ILcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 123
    if-eqz v5, :cond_4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getKids()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    :cond_4
    add-int/2addr v0, v6

    goto :goto_3

    .line 125
    :cond_5
    invoke-virtual {v7, v4}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->addKid(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 127
    :goto_3
    if-eqz v5, :cond_6

    .line 128
    invoke-direct {p0, v4}, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->removeOldRoot(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V

    .line 130
    .end local v3    # "elem":Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    .end local v4    # "kid":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    .end local v5    # "kidIsDocument":Z
    :cond_6
    goto :goto_0

    .line 131
    :cond_7
    return-void
.end method

.method private createNewRootTag()V
    .locals 6

    .line 68
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->context:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getDocumentDefaultNamespace()Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    move-result-object v0

    .line 69
    .local v0, "docDefaultNs":Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->context:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    const-string v2, "Document"

    invoke-virtual {v1, v2, v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->resolveMappingToStandardOrDomainSpecificRole(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;

    move-result-object v1

    .line 70
    .local v1, "mapping":Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;
    if-eqz v1, :cond_0

    invoke-interface {v1}, Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;->currentRoleIsStandard()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;->getRole()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 71
    :cond_0
    invoke-direct {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->logCreatedRootTagHasMappingIssue(Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;)V

    .line 73
    :cond_1
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getStructTreeRoot()Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    move-result-object v2

    new-instance v3, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->Document:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {v3, v4, v5}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfName;)V

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->addKid(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v2

    iput-object v2, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->rootTagElement:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 74
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->context:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->targetTagStructureVersionIs2()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 75
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->rootTagElement:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-virtual {v2, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->setNamespace(Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)V

    .line 76
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->context:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v2, v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->ensureNamespaceRegistered(Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)V

    .line 78
    :cond_2
    return-void
.end method

.method private ensureExistingRootTagIsDocument()V
    .locals 8

    .line 82
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->context:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->rootTagElement:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getRole()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->rootTagElement:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getNamespace()Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getRoleMappingResolver(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;

    move-result-object v0

    .line 83
    .local v0, "mapping":Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;
    invoke-interface {v0}, Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;->currentRoleIsStandard()Z

    move-result v1

    const/4 v2, 0x1

    const-string v3, "Document"

    const/4 v4, 0x0

    if-eqz v1, :cond_0

    invoke-interface {v0}, Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;->getRole()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    move v1, v4

    .line 85
    .local v1, "isDocBeforeResolving":Z
    :goto_0
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->context:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->rootTagElement:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getRole()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->rootTagElement:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getNamespace()Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->resolveMappingToStandardOrDomainSpecificRole(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;

    move-result-object v0

    .line 86
    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;->currentRoleIsStandard()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v0}, Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;->getRole()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_1

    :cond_1
    move v2, v4

    .line 88
    .local v2, "isDocAfterResolving":Z
    :goto_1
    if-eqz v1, :cond_2

    if-nez v2, :cond_2

    .line 89
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->rootTagElement:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getNamespace()Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    move-result-object v3

    invoke-direct {p0, v3, v0}, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->logCreatedRootTagHasMappingIssue(Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;)V

    goto :goto_2

    .line 90
    :cond_2
    if-nez v2, :cond_3

    .line 91
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->rootTagElement:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->rootTagElement:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getRole()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v4

    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->rootTagElement:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getNamespace()Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    move-result-object v5

    invoke-direct {p0, v3, v4, v5}, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->wrapAllKidsInTag(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)V

    .line 92
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->rootTagElement:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Document:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->setRole(Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 93
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->context:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->targetTagStructureVersionIs2()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 94
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->rootTagElement:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->context:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getDocumentDefaultNamespace()Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->setNamespace(Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)V

    .line 95
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->context:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->context:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getDocumentDefaultNamespace()Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->ensureNamespaceRegistered(Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)V

    .line 98
    :cond_3
    :goto_2
    return-void
.end method

.method private logCreatedRootTagHasMappingIssue(Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;)V
    .locals 7
    .param p1, "rootTagOriginalNs"    # Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;
    .param p2, "mapping"    # Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;

    .line 154
    const-string v0, ""

    .line 155
    .local v0, "origRootTagNs":Ljava/lang/String;
    const-string v1, "\" namespace"

    const-string v2, " in \""

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->getNamespaceName()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 156
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->getNamespaceName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 159
    :cond_0
    const-string v3, " to "

    .line 160
    .local v3, "mappingRole":Ljava/lang/String;
    if-eqz p2, :cond_1

    .line 161
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {p2}, Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;->getRole()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 162
    invoke-interface {p2}, Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;->getNamespace()Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    move-result-object v4

    if-eqz v4, :cond_2

    invoke-interface {p2}, Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;->getNamespace()Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->getNamespaceName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "http://iso.org/pdf/ssn"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 163
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {p2}, Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;->getNamespace()Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->getNamespaceName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 166
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "not standard role"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 169
    :cond_2
    :goto_0
    const-class v1, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;

    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 170
    .local v1, "logger":Lorg/slf4j/Logger;
    const-string v2, "Created root tag has role mapping: \"/Document\" role{0} is mapped{1}. Resulting tag structure might have invalid root tag."

    filled-new-array {v0, v3}, [Ljava/lang/Object;

    move-result-object v4

    invoke-static {v2, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 171
    return-void
.end method

.method private removeOldRoot(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V
    .locals 2
    .param p1, "oldRoot"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 150
    new-instance v0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-direct {v0, p1, v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;-><init>(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->removeTag()Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 151
    return-void
.end method

.method private wrapAllKidsInTag(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)V
    .locals 5
    .param p1, "parent"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    .param p2, "wrapTagRole"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p3, "wrapTagNs"    # Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    .line 134
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getKids()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 135
    .local v0, "kidsNum":I
    new-instance v1, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-direct {v1, p1, v2}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;-><init>(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 136
    .local v1, "tagPointer":Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    const/4 v2, 0x0

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->addTag(ILjava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 138
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->context:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->targetTagStructureVersionIs2()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 139
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    move-result-object v2

    invoke-virtual {v2, p3}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->setNamespace(Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    .line 142
    :cond_0
    new-instance v2, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    invoke-direct {v2, v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;-><init>(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)V

    .line 143
    .local v2, "newParentOfKids":Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->moveToParent()Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 144
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v0, :cond_1

    .line 145
    const/4 v4, 0x1

    invoke-virtual {v1, v4, v2}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->relocateKid(ILcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 144
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 147
    .end local v3    # "i":I
    :cond_1
    return-void
.end method


# virtual methods
.method makeSingleStandardRootTag(Ljava/util/List;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;",
            ">;)",
            "Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;"
        }
    .end annotation

    .line 52
    .local p1, "rootKids":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;>;"
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getStructTreeRoot()Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 53
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->rootTagElement:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    if-nez v0, :cond_0

    .line 54
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->createNewRootTag()V

    goto :goto_0

    .line 56
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->rootTagElement:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 57
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getStructTreeRoot()Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->rootTagElement:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->addKid(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 58
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->ensureExistingRootTagIsDocument()V

    .line 61
    :goto_0
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->addStructTreeRootKidsToTheRootTag(Ljava/util/List;)V

    .line 63
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->rootTagElement:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    return-object v0
.end method
