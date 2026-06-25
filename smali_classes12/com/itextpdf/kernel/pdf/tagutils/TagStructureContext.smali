.class public Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;
.super Ljava/lang/Object;
.source "TagStructureContext.java"


# static fields
.field private static final ALLOWED_ROOT_TAG_ROLES:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected autoTaggingPointer:Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

.field private document:Lcom/itextpdf/kernel/pdf/PdfDocument;

.field private documentDefaultNamespace:Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

.field private forbidUnknownRoles:Z

.field private nameToNamespace:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;",
            ">;"
        }
    .end annotation
.end field

.field private namespaces:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            ">;"
        }
    .end annotation
.end field

.field private rootTagElement:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

.field private tagStructureTargetVersion:Lcom/itextpdf/kernel/pdf/PdfVersion;

.field private waitingTagsManager:Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 74
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 75
    .local v0, "tempSet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    const-string v1, "Document"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 76
    const-string v1, "Part"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 77
    const-string v1, "Art"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 78
    const-string v1, "Sect"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 79
    const-string v1, "Div"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 80
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v1

    sput-object v1, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->ALLOWED_ROOT_TAG_ROLES:Ljava/util/Set;

    .line 81
    .end local v0    # "tempSet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 1
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 105
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPdfVersion()Lcom/itextpdf/kernel/pdf/PdfVersion;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfVersion;)V

    .line 106
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfVersion;)V
    .locals 2
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "tagStructureTargetVersion"    # Lcom/itextpdf/kernel/pdf/PdfVersion;

    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 120
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 121
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->isTagged()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 124
    new-instance v0, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->waitingTagsManager:Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;

    .line 125
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->namespaces:Ljava/util/Set;

    .line 126
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->nameToNamespace:Ljava/util/Map;

    .line 128
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->tagStructureTargetVersion:Lcom/itextpdf/kernel/pdf/PdfVersion;

    .line 129
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->forbidUnknownRoles:Z

    .line 131
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->targetTagStructureVersionIs2()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 132
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->initRegisteredNamespaces()V

    .line 133
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->setNamespaceForNewTagsBasedOnExistingRoot()V

    .line 135
    :cond_0
    return-void

    .line 122
    :cond_1
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Must be a tagged document."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private actualizeNamespacesInStructTreeRoot()V
    .locals 5

    .line 677
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->namespaces:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    if-lez v0, :cond_2

    .line 678
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getStructTreeRoot()Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    move-result-object v0

    .line 679
    .local v0, "structTreeRoot":Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->getNamespacesObject()Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v1

    .line 680
    .local v1, "rootNamespaces":Lcom/itextpdf/kernel/pdf/PdfArray;
    new-instance v2, Ljava/util/LinkedHashSet;

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->namespaces:Ljava/util/Set;

    invoke-direct {v2, v3}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    .line 681
    .local v2, "newNamespaces":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfDictionary;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v4

    if-ge v3, v4, :cond_0

    .line 682
    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsDictionary(I)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 681
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 684
    .end local v3    # "i":I
    :cond_0
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 685
    .local v4, "newNs":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-virtual {v1, v4}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 686
    .end local v4    # "newNs":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    goto :goto_1

    .line 687
    :cond_1
    invoke-interface {v2}, Ljava/util/Set;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2

    .line 688
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 691
    .end local v0    # "structTreeRoot":Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;
    .end local v1    # "rootNamespaces":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v2    # "newNamespaces":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfDictionary;>;"
    :cond_2
    return-void
.end method

.method private composeExceptionBasedOnNamespacePresence(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "role"    # Ljava/lang/String;
    .param p2, "namespace"    # Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;
    .param p3, "withoutNsEx"    # Ljava/lang/String;
    .param p4, "withNsEx"    # Ljava/lang/String;

    .line 722
    if-nez p2, :cond_0

    .line 723
    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {p3, v0}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 725
    :cond_0
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->getNamespaceName()Ljava/lang/String;

    move-result-object v0

    .line 726
    .local v0, "nsName":Ljava/lang/String;
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    .line 727
    .local v1, "ref":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    if-eqz v1, :cond_1

    .line 728
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 729
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjNumber()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " obj)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 732
    :cond_1
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {p4, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private composeInvalidRoleException(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)Ljava/lang/String;
    .locals 2
    .param p1, "role"    # Ljava/lang/String;
    .param p2, "namespace"    # Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    .line 657
    const-string v0, "Role \"{0}\" is not mapped to any standard role."

    const-string v1, "Role \"{0}\" in namespace {1} is not mapped to any standard role."

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->composeExceptionBasedOnNamespacePresence(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private composeTooMuchTransitiveMappingsException(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)Ljava/lang/String;
    .locals 2
    .param p1, "role"    # Ljava/lang/String;
    .param p2, "namespace"    # Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    .line 663
    const-string v0, "Cannot resolve \"{0}\" role mapping to standard role, because of the too much transitive mappings."

    const-string v1, "Cannot resolve \"{0}\" role in {1} namespace mapping to standard role, because of the too much transitive mappings."

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->composeExceptionBasedOnNamespacePresence(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private initRegisteredNamespaces()V
    .locals 5

    .line 669
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getStructTreeRoot()Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    move-result-object v0

    .line 670
    .local v0, "structTreeRoot":Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->getNamespaces()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    .line 671
    .local v2, "namespace":Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->namespaces:Ljava/util/Set;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 672
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->nameToNamespace:Ljava/util/Map;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->getNamespaceName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 673
    .end local v2    # "namespace":Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;
    goto :goto_0

    .line 674
    :cond_0
    return-void
.end method

.method private isRoleAllowedToBeRoot(Ljava/lang/String;)Z
    .locals 1
    .param p1, "role"    # Ljava/lang/String;

    .line 624
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->targetTagStructureVersionIs2()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 625
    const-string v0, "Document"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 627
    :cond_0
    sget-object v0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->ALLOWED_ROOT_TAG_ROLES:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private removePageTagFromParent(Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;)V
    .locals 3
    .param p1, "pageTag"    # Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    .param p2, "parent"    # Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    .line 694
    instance-of v0, p2, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    if-eqz v0, :cond_3

    .line 695
    move-object v0, p2

    check-cast v0, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 696
    .local v0, "structParent":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->isFlushed()Z

    move-result v1

    if-nez v1, :cond_1

    .line 697
    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->removeKid(Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;)I

    .line 698
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 699
    .local v1, "parentStructDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->waitingTagsManager:Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->getObjForStructDict(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_0

    invoke-interface {p2}, Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;->getKids()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_0

    .line 700
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getParent()Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    move-result-object v2

    instance-of v2, v2, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    if-nez v2, :cond_0

    .line 701
    invoke-interface {p2}, Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;->getParent()Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    move-result-object v2

    invoke-direct {p0, v0, v2}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->removePageTagFromParent(Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;)V

    .line 702
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    .line 703
    .local v2, "indRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    if-eqz v2, :cond_0

    .line 706
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setFree()V

    .line 709
    .end local v1    # "parentStructDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v2    # "indRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    :cond_0
    goto :goto_0

    .line 710
    :cond_1
    instance-of v1, p1, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    if-nez v1, :cond_2

    goto :goto_0

    .line 711
    :cond_2
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Cannot remove tag, because its parent is flushed."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 719
    .end local v0    # "structParent":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    :cond_3
    :goto_0
    return-void
.end method

.method private setNamespaceForNewTagsBasedOnExistingRoot()V
    .locals 8

    .line 632
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getStructTreeRoot()Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->getKids()Ljava/util/List;

    move-result-object v0

    .line 633
    .local v0, "rootKids":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const-string v2, "http://iso.org/pdf2/ssn"

    if-lez v1, :cond_5

    .line 634
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 635
    .local v1, "firstKid":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getRole()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getNamespace()Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->resolveMappingToStandardOrDomainSpecificRole(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;

    move-result-object v3

    .line 636
    .local v3, "resolvedMapping":Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;
    if-eqz v3, :cond_0

    invoke-interface {v3}, Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;->currentRoleIsStandard()Z

    move-result v4

    if-nez v4, :cond_2

    .line 638
    :cond_0
    const-class v4, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-static {v4}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v4

    .line 640
    .local v4, "logger":Lorg/slf4j/Logger;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getNamespace()Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 641
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getNamespace()Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->getNamespaceName()Ljava/lang/String;

    move-result-object v5

    .local v5, "nsStr":Ljava/lang/String;
    goto :goto_0

    .line 643
    .end local v5    # "nsStr":Ljava/lang/String;
    :cond_1
    invoke-static {}, Lcom/itextpdf/kernel/pdf/tagging/StandardNamespaces;->getDefault()Ljava/lang/String;

    move-result-object v5

    .line 645
    .restart local v5    # "nsStr":Ljava/lang/String;
    :goto_0
    nop

    .line 646
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getRole()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v6

    filled-new-array {v6, v5}, [Ljava/lang/Object;

    move-result-object v6

    .line 645
    const-string v7, "Existing tag structure of the document has a root of \"{0}\" role in \"{1}\" namespace that is not mapped to the standard role."

    invoke-static {v7, v6}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v6}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 648
    .end local v4    # "logger":Lorg/slf4j/Logger;
    .end local v5    # "nsStr":Ljava/lang/String;
    :cond_2
    if-eqz v3, :cond_3

    invoke-interface {v3}, Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;->getNamespace()Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->getNamespaceName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "http://iso.org/pdf/ssn"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 649
    :cond_3
    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->fetchNamespace(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    move-result-object v2

    iput-object v2, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->documentDefaultNamespace:Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    .line 651
    .end local v1    # "firstKid":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    .end local v3    # "resolvedMapping":Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;
    :cond_4
    goto :goto_1

    .line 652
    :cond_5
    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->fetchNamespace(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->documentDefaultNamespace:Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    .line 654
    :goto_1
    return-void
.end method


# virtual methods
.method public checkIfRoleShallBeMappedToStandardRole(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)Z
    .locals 1
    .param p1, "role"    # Ljava/lang/String;
    .param p2, "namespace"    # Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    .line 292
    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->resolveMappingToStandardOrDomainSpecificRole(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public createPointerForStructElem(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .locals 2
    .param p1, "structElem"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 544
    new-instance v0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-direct {v0, p1, v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;-><init>(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    return-object v0
.end method

.method ensureNamespaceRegistered(Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)V
    .locals 3
    .param p1, "namespace"    # Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    .line 558
    if-eqz p1, :cond_1

    .line 559
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 560
    .local v0, "namespaceObj":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->namespaces:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 561
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->namespaces:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 563
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->nameToNamespace:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->getNamespaceName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 565
    .end local v0    # "namespaceObj":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_1
    return-void
.end method

.method public fetchNamespace(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;
    .locals 2
    .param p1, "namespaceName"    # Ljava/lang/String;

    .line 243
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->nameToNamespace:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    .line 244
    .local v0, "ns":Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;
    if-nez v0, :cond_0

    .line 245
    new-instance v1, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    invoke-direct {v1, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;-><init>(Ljava/lang/String;)V

    move-object v0, v1

    .line 246
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->nameToNamespace:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    :cond_0
    return-object v0
.end method

.method public flushPageTags(Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;
    .locals 5
    .param p1, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 438
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getStructTreeRoot()Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    move-result-object v0

    .line 439
    .local v0, "structTreeRoot":Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;
    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->getPageMarkedContentReferences(Lcom/itextpdf/kernel/pdf/PdfPage;)Ljava/util/Collection;

    move-result-object v1

    .line 440
    .local v1, "pageMcrs":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;>;"
    if-eqz v1, :cond_0

    .line 441
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    .line 442
    .local v3, "mcr":Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getParent()Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 443
    .local v4, "parent":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    invoke-virtual {p0, v4, p1}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->flushParentIfBelongsToPage(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;Lcom/itextpdf/kernel/pdf/PdfPage;)V

    .line 444
    .end local v3    # "mcr":Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;
    .end local v4    # "parent":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    goto :goto_0

    .line 447
    :cond_0
    return-object p0
.end method

.method flushParentIfBelongsToPage(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;Lcom/itextpdf/kernel/pdf/PdfPage;)V
    .locals 6
    .param p1, "parent"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    .param p2, "currentPage"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 592
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->isFlushed()Z

    move-result v0

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->waitingTagsManager:Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->getObjForStructDict(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_6

    .line 593
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getParent()Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    move-result-object v0

    instance-of v0, v0, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    if-eqz v0, :cond_0

    goto :goto_2

    .line 597
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getKids()Ljava/util/List;

    move-result-object v0

    .line 598
    .local v0, "kids":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;>;"
    const/4 v1, 0x1

    .line 599
    .local v1, "readyToBeFlushed":Z
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    .line 600
    .local v3, "kid":Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    instance-of v4, v3, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    if-eqz v4, :cond_2

    .line 601
    move-object v4, v3

    check-cast v4, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getPageObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v4

    .line 602
    .local v4, "kidPage":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isFlushed()Z

    move-result v5

    if-nez v5, :cond_3

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 603
    :cond_1
    const/4 v1, 0x0

    .line 604
    goto :goto_1

    .line 606
    .end local v4    # "kidPage":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_2
    instance-of v4, v3, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    if-eqz v4, :cond_3

    .line 609
    const/4 v1, 0x0

    .line 610
    goto :goto_1

    .line 606
    :cond_3
    nop

    .line 612
    .end local v3    # "kid":Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    goto :goto_0

    .line 614
    :cond_4
    :goto_1
    if-eqz v1, :cond_5

    .line 615
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getParent()Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    move-result-object v2

    .line 616
    .local v2, "parentsParent":Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->flush()V

    .line 617
    instance-of v3, v2, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    if-eqz v3, :cond_5

    .line 618
    move-object v3, v2

    check-cast v3, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-virtual {p0, v3, p2}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->flushParentIfBelongsToPage(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;Lcom/itextpdf/kernel/pdf/PdfPage;)V

    .line 621
    .end local v2    # "parentsParent":Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    :cond_5
    return-void

    .line 594
    .end local v0    # "kids":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;>;"
    .end local v1    # "readyToBeFlushed":Z
    :cond_6
    :goto_2
    return-void
.end method

.method public getAutoTaggingPointer()Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .locals 2

    .line 170
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->autoTaggingPointer:Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    if-nez v0, :cond_0

    .line 171
    new-instance v0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->autoTaggingPointer:Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 173
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->autoTaggingPointer:Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    return-object v0
.end method

.method getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;
    .locals 1

    .line 554
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    return-object v0
.end method

.method public getDocumentDefaultNamespace()Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;
    .locals 1

    .line 200
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->documentDefaultNamespace:Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    return-object v0
.end method

.method public getPointerStructElem(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    .locals 1
    .param p1, "pointer"    # Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 511
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    return-object v0
.end method

.method public getRoleMappingResolver(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;
    .locals 1
    .param p1, "role"    # Ljava/lang/String;

    .line 261
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getRoleMappingResolver(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;

    move-result-object v0

    return-object v0
.end method

.method public getRoleMappingResolver(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;
    .locals 2
    .param p1, "role"    # Ljava/lang/String;
    .param p2, "namespace"    # Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    .line 273
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->targetTagStructureVersionIs2()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 274
    new-instance v0, Lcom/itextpdf/kernel/pdf/tagutils/RoleMappingResolverPdf2;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v1

    invoke-direct {v0, p1, p2, v1}, Lcom/itextpdf/kernel/pdf/tagutils/RoleMappingResolverPdf2;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    return-object v0

    .line 276
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/pdf/tagutils/RoleMappingResolver;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/itextpdf/kernel/pdf/tagutils/RoleMappingResolver;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    return-object v0
.end method

.method getRootTag()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    .locals 1

    .line 548
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->rootTagElement:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    if-nez v0, :cond_0

    .line 549
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->normalizeDocumentRootTag()V

    .line 551
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->rootTagElement:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    return-object v0
.end method

.method public getTagPointerById([B)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .locals 3
    .param p1, "id"    # [B

    .line 521
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getStructTreeRoot()Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->getIdTree()Lcom/itextpdf/kernel/pdf/tagging/PdfStructIdTree;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructIdTree;->getStructElemById([B)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    .line 522
    .local v0, "elem":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->setCurrentStructElem(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    move-result-object v1

    :goto_0
    return-object v1
.end method

.method public getTagPointerByIdString(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .locals 1
    .param p1, "id"    # Ljava/lang/String;

    .line 533
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getTagPointerById([B)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    move-result-object v0

    return-object v0
.end method

.method public getTagStructureTargetVersion()Lcom/itextpdf/kernel/pdf/PdfVersion;
    .locals 1

    .line 157
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->tagStructureTargetVersion:Lcom/itextpdf/kernel/pdf/PdfVersion;

    return-object v0
.end method

.method public getWaitingTagsManager()Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;
    .locals 1

    .line 183
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->waitingTagsManager:Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;

    return-object v0
.end method

.method public normalizeDocumentRootTag()V
    .locals 7

    .line 470
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->forbidUnknownRoles:Z

    .line 471
    .local v0, "forbid":Z
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->forbidUnknownRoles:Z

    .line 473
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getStructTreeRoot()Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->getKids()Ljava/util/List;

    move-result-object v2

    .line 474
    .local v2, "rootKids":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;>;"
    const/4 v3, 0x0

    .line 475
    .local v3, "mapping":Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_0

    .line 476
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 477
    .local v4, "firstKid":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getRole()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getNamespace()Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->resolveMappingToStandardOrDomainSpecificRole(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;

    move-result-object v3

    .line 480
    .end local v4    # "firstKid":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    :cond_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_1

    if-eqz v3, :cond_1

    .line 481
    invoke-interface {v3}, Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;->currentRoleIsStandard()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 482
    invoke-interface {v3}, Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;->getRole()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->isRoleAllowedToBeRoot(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 483
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->rootTagElement:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    goto :goto_0

    .line 485
    :cond_1
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getStructTreeRoot()Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->K:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 486
    new-instance v1, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->rootTagElement:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-direct {v1, p0, v4, v5}, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;-><init>(Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/tagutils/RootTagNormalizer;->makeSingleStandardRootTag(Ljava/util/List;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->rootTagElement:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 488
    :goto_0
    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->forbidUnknownRoles:Z

    .line 489
    return-void
.end method

.method public prepareToDocumentClosing()V
    .locals 1

    .line 496
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->waitingTagsManager:Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->removeAllWaitingStates()V

    .line 497
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->actualizeNamespacesInStructTreeRoot()V

    .line 498
    return-void
.end method

.method public removeAnnotationTag(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .locals 1
    .param p1, "annotation"    # Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 338
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->removeAnnotationTag(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;Z)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    move-result-object v0

    return-object v0
.end method

.method public removeAnnotationTag(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;Z)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .locals 6
    .param p1, "annotation"    # Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .param p2, "setAutoTaggingPointer"    # Z

    .line 352
    const/4 v0, 0x0

    .line 353
    .local v0, "structElem":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 355
    .local v1, "annotDic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->StructParent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    .line 356
    .local v2, "structParentIndex":Lcom/itextpdf/kernel/pdf/PdfNumber;
    if-eqz v2, :cond_0

    .line 357
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getStructTreeRoot()Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    move-result-object v3

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v4

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v5

    invoke-virtual {v3, v4, v5}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->findObjRefByStructParentIndex(Lcom/itextpdf/kernel/pdf/PdfDictionary;I)Lcom/itextpdf/kernel/pdf/tagging/PdfObjRef;

    move-result-object v3

    .line 359
    .local v3, "objRef":Lcom/itextpdf/kernel/pdf/tagging/PdfObjRef;
    if-eqz v3, :cond_0

    .line 360
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/tagging/PdfObjRef;->getParent()Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 361
    .local v4, "parent":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    invoke-virtual {v4, v3}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->removeKid(Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;)I

    .line 362
    move-object v0, v4

    .line 365
    .end local v3    # "objRef":Lcom/itextpdf/kernel/pdf/tagging/PdfObjRef;
    .end local v4    # "parent":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    :cond_0
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->StructParent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 366
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 368
    if-eqz v0, :cond_2

    .line 369
    new-instance v3, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    invoke-virtual {v3, v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->setCurrentStructElem(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    move-result-object v3

    .line 370
    .local v3, "pointer":Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    if-eqz p2, :cond_1

    .line 371
    iput-object v3, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->autoTaggingPointer:Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 373
    :cond_1
    return-object v3

    .line 375
    .end local v3    # "pointer":Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    :cond_2
    const/4 v3, 0x0

    return-object v3
.end method

.method public removeContentItem(Lcom/itextpdf/kernel/pdf/PdfPage;I)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .locals 4
    .param p1, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;
    .param p2, "mcid"    # I

    .line 390
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getStructTreeRoot()Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    move-result-object v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0, v1, p2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->findMcrByMcid(Lcom/itextpdf/kernel/pdf/PdfDictionary;I)Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    move-result-object v0

    .line 391
    .local v0, "mcr":Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;
    if-nez v0, :cond_0

    .line 392
    const/4 v1, 0x0

    return-object v1

    .line 395
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getParent()Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 396
    .local v1, "parent":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->removeKid(Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;)I

    .line 397
    new-instance v2, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->setCurrentStructElem(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    move-result-object v2

    return-object v2
.end method

.method public removePageTags(Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;
    .locals 6
    .param p1, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 409
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getStructTreeRoot()Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    move-result-object v0

    .line 410
    .local v0, "structTreeRoot":Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;
    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->getPageMarkedContentReferences(Lcom/itextpdf/kernel/pdf/PdfPage;)Ljava/util/Collection;

    move-result-object v1

    .line 411
    .local v1, "pageMcrs":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;>;"
    if-eqz v1, :cond_0

    .line 413
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 414
    .local v2, "mcrsList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    .line 415
    .local v4, "mcr":Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getParent()Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    move-result-object v5

    invoke-direct {p0, v4, v5}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->removePageTagFromParent(Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;)V

    .line 416
    .end local v4    # "mcr":Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;
    goto :goto_0

    .line 418
    .end local v2    # "mcrsList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;>;"
    :cond_0
    return-object p0
.end method

.method public resolveMappingToStandardOrDomainSpecificRole(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;
    .locals 6
    .param p1, "role"    # Ljava/lang/String;
    .param p2, "namespace"    # Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    .line 310
    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getRoleMappingResolver(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;

    move-result-object v0

    .line 311
    .local v0, "mappingResolver":Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;
    invoke-interface {v0}, Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;->resolveNextMapping()Z

    .line 312
    const/4 v1, 0x0

    .line 314
    .local v1, "i":I
    const/16 v2, 0x64

    .line 315
    .local v2, "maxIters":I
    :cond_0
    invoke-interface {v0}, Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;->currentRoleShallBeMappedToStandard()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 316
    add-int/lit8 v1, v1, 0x1

    const/4 v3, 0x0

    if-le v1, v2, :cond_1

    .line 317
    const-class v4, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-static {v4}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v4

    .line 318
    .local v4, "logger":Lorg/slf4j/Logger;
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->composeTooMuchTransitiveMappingsException(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 319
    return-object v3

    .line 321
    .end local v4    # "logger":Lorg/slf4j/Logger;
    :cond_1
    invoke-interface {v0}, Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;->resolveNextMapping()Z

    move-result v4

    if-nez v4, :cond_0

    .line 322
    return-object v3

    .line 325
    :cond_2
    return-object v0
.end method

.method public setDocumentDefaultNamespace(Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;
    .locals 0
    .param p1, "namespace"    # Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    .line 222
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->documentDefaultNamespace:Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    .line 223
    return-object p0
.end method

.method public setForbidUnknownRoles(Z)Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;
    .locals 0
    .param p1, "forbidUnknownRoles"    # Z

    .line 147
    iput-boolean p1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->forbidUnknownRoles:Z

    .line 148
    return-object p0
.end method

.method targetTagStructureVersionIs2()Z
    .locals 2

    .line 588
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfVersion;->PDF_2_0:Lcom/itextpdf/kernel/pdf/PdfVersion;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->tagStructureTargetVersion:Lcom/itextpdf/kernel/pdf/PdfVersion;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfVersion;->compareTo(Lcom/itextpdf/kernel/pdf/PdfVersion;)I

    move-result v0

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method throwExceptionIfRoleIsInvalid(Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)V
    .locals 2
    .param p1, "properties"    # Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .param p2, "pointerCurrentNamespace"    # Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    .line 568
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->getNamespace()Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    move-result-object v0

    .line 569
    .local v0, "namespace":Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;
    if-nez v0, :cond_0

    .line 570
    move-object v0, p2

    .line 572
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->getRole()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->throwExceptionIfRoleIsInvalid(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)V

    .line 573
    return-void
.end method

.method throwExceptionIfRoleIsInvalid(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)V
    .locals 2
    .param p1, "role"    # Ljava/lang/String;
    .param p2, "namespace"    # Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    .line 576
    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->checkIfRoleShallBeMappedToStandardRole(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 577
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->composeInvalidRoleException(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)Ljava/lang/String;

    move-result-object v0

    .line 578
    .local v0, "exMessage":Ljava/lang/String;
    iget-boolean v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->forbidUnknownRoles:Z

    if-nez v1, :cond_0

    .line 581
    const-class v1, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 582
    .local v1, "logger":Lorg/slf4j/Logger;
    invoke-interface {v1, v0}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    goto :goto_0

    .line 579
    .end local v1    # "logger":Lorg/slf4j/Logger;
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 585
    .end local v0    # "exMessage":Ljava/lang/String;
    :cond_1
    :goto_0
    return-void
.end method
