.class public Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
.super Ljava/lang/Object;
.source "TagTreePointer.java"


# static fields
.field private static final MCR_MARKER:Ljava/lang/String; = "MCR"


# instance fields
.field private contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

.field private currentNamespace:Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

.field private currentPage:Lcom/itextpdf/kernel/pdf/PdfPage;

.field private currentStructElem:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

.field private nextNewKidIndex:I

.field private tagStructureContext:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 1
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->nextNewKidIndex:I

    .line 89
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getTagStructureContext()Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->tagStructureContext:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    .line 90
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->tagStructureContext:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getRootTag()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->setCurrentStructElem(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 91
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->tagStructureContext:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getDocumentDefaultNamespace()Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->setNamespaceForNewTags(Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 92
    return-void
.end method

.method constructor <init>(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 1
    .param p1, "structElem"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    .param p2, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->nextNewKidIndex:I

    .line 108
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getTagStructureContext()Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->tagStructureContext:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    .line 109
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->setCurrentStructElem(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 110
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)V
    .locals 1
    .param p1, "tagPointer"    # Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->nextNewKidIndex:I

    .line 100
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->tagStructureContext:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->tagStructureContext:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    .line 101
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->setCurrentStructElem(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 102
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->currentPage:Lcom/itextpdf/kernel/pdf/PdfPage;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->currentPage:Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 103
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 104
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->currentNamespace:Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->currentNamespace:Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    .line 105
    return-void
.end method

.method private addNewKid(Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;)Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;
    .locals 2
    .param p1, "kid"    # Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    .line 775
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentElemEnsureIndirect()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getNextNewKidPosition()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->addKid(ILcom/itextpdf/kernel/pdf/tagging/PdfMcr;)Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    move-result-object v0

    return-object v0
.end method

.method private addNewKid(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    .locals 2
    .param p1, "kid"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 771
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentElemEnsureIndirect()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getNextNewKidPosition()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->addKid(ILcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    return-object v0
.end method

.method private addNewKid(Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    .locals 3
    .param p1, "properties"    # Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    .line 755
    new-instance v0, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->getRole()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->convertRoleToPdfName(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 756
    .local v0, "kid":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    invoke-static {p1, v0}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityPropertiesToStructElem;->apply(Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V

    .line 757
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->processKidNamespace(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V

    .line 758
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->addNewKid(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v1

    return-object v1
.end method

.method private addNewKid(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    .locals 3
    .param p1, "role"    # Ljava/lang/String;

    .line 749
    new-instance v0, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v1

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->convertRoleToPdfName(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 750
    .local v0, "kid":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->processKidNamespace(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V

    .line 751
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->addNewKid(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v1

    return-object v1
.end method

.method private ensureElementPageEqualsKidPage(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Z
    .locals 3
    .param p1, "elem"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    .param p2, "kidPage"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 820
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Pg:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 821
    .local v0, "pageObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-nez v0, :cond_0

    .line 822
    move-object v0, p2

    .line 824
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Pg:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 827
    :cond_0
    invoke-virtual {p2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method private getCurrentElemEnsureIndirect()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    .locals 2

    .line 779
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    .line 780
    .local v0, "currentStructElem":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    if-nez v1, :cond_0

    .line 781
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 783
    :cond_0
    return-object v0
.end method

.method private getNextNewKidPosition()I
    .locals 2

    .line 743
    iget v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->nextNewKidIndex:I

    .line 744
    .local v0, "nextPos":I
    const/4 v1, -0x1

    iput v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->nextNewKidIndex:I

    .line 745
    return v0
.end method

.method private markedContentNotInPageStream()Z
    .locals 1

    .line 831
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private prepareMcrForMovingToNewParent(Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;
    .locals 5
    .param p1, "mcrKid"    # Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;
    .param p2, "newParent"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 787
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 788
    .local v0, "mcrObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getPageObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    .line 790
    .local v1, "mcrPage":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    const/4 v2, 0x0

    .line 791
    .local v2, "mcrDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isNumber()Z

    move-result v3

    if-nez v3, :cond_0

    .line 792
    move-object v2, v0

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 794
    :cond_0
    if-eqz v2, :cond_1

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Pg:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 795
    :cond_1
    invoke-direct {p0, p2, v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->ensureElementPageEqualsKidPage(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 796
    if-nez v2, :cond_2

    .line 797
    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 798
    .end local v2    # "mcrDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .local v3, "mcrDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->MCR:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v2, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 799
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->MCID:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-object v2, v3

    .line 802
    .end local v3    # "mcrDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .restart local v2    # "mcrDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_2
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Pg:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 806
    :cond_3
    if-eqz v2, :cond_5

    .line 807
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->MCR:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 808
    new-instance v3, Lcom/itextpdf/kernel/pdf/tagging/PdfMcrDictionary;

    invoke-direct {v3, v2, p2}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcrDictionary;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V

    move-object p1, v3

    goto :goto_0

    .line 809
    :cond_4
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->OBJR:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 810
    new-instance v3, Lcom/itextpdf/kernel/pdf/tagging/PdfObjRef;

    invoke-direct {v3, v2, p2}, Lcom/itextpdf/kernel/pdf/tagging/PdfObjRef;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V

    move-object p1, v3

    goto :goto_0

    .line 813
    :cond_5
    new-instance v3, Lcom/itextpdf/kernel/pdf/tagging/PdfMcrNumber;

    move-object v4, v0

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v3, v4, p2}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcrNumber;-><init>(Lcom/itextpdf/kernel/pdf/PdfNumber;Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V

    move-object p1, v3

    .line 816
    :cond_6
    :goto_0
    return-object p1
.end method

.method private processKidNamespace(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V
    .locals 2
    .param p1, "kid"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 762
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getNamespace()Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    move-result-object v0

    .line 763
    .local v0, "kidNamespace":Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->currentNamespace:Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    if-eqz v1, :cond_0

    if-nez v0, :cond_0

    .line 764
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->currentNamespace:Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->setNamespace(Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)V

    .line 765
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->currentNamespace:Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    .line 767
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->tagStructureContext:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->ensureNamespaceRegistered(Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)V

    .line 768
    return-void
.end method

.method private throwExceptionIfCurrentPageIsNotInited()V
    .locals 2

    .line 835
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->currentPage:Lcom/itextpdf/kernel/pdf/PdfPage;

    if-eqz v0, :cond_0

    .line 838
    return-void

    .line 836
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Page is not set for the pdf tag structure."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public addAnnotationTag(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .locals 5
    .param p1, "annotation"    # Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 279
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->throwExceptionIfCurrentPageIsNotInited()V

    .line 286
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->StructParent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 287
    .local v0, "structParentIndex":Lcom/itextpdf/kernel/pdf/PdfNumber;
    new-instance v1, Lcom/itextpdf/kernel/pdf/tagging/PdfObjRef;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v2

    if-eqz v0, :cond_0

    .line 288
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v3

    goto :goto_0

    .line 289
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNextStructParentIndex()I

    move-result v3

    :goto_0
    invoke-direct {v1, p1, v2, v3}, Lcom/itextpdf/kernel/pdf/tagging/PdfObjRef;-><init>(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;I)V

    .line 290
    .local v1, "kid":Lcom/itextpdf/kernel/pdf/tagging/PdfObjRef;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v2

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->currentPage:Lcom/itextpdf/kernel/pdf/PdfPage;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {p0, v2, v3}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->ensureElementPageEqualsKidPage(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 292
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfObjRef;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Pg:Lcom/itextpdf/kernel/pdf/PdfName;

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->currentPage:Lcom/itextpdf/kernel/pdf/PdfPage;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 294
    :cond_1
    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->addNewKid(Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;)Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    .line 295
    return-object p0
.end method

.method public addTag(ILcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .locals 2
    .param p1, "index"    # I
    .param p2, "properties"    # Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    .line 262
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->tagStructureContext:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->currentNamespace:Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    invoke-virtual {v0, p2, v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->throwExceptionIfRoleIsInvalid(Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)V

    .line 263
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->setNextNewKidIndex(I)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 264
    invoke-direct {p0, p2}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->addNewKid(Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->setCurrentStructElem(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 265
    return-object p0
.end method

.method public addTag(ILjava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .locals 2
    .param p1, "index"    # I
    .param p2, "role"    # Ljava/lang/String;

    .line 230
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->tagStructureContext:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->currentNamespace:Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    invoke-virtual {v0, p2, v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->throwExceptionIfRoleIsInvalid(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)V

    .line 231
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->setNextNewKidIndex(I)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 232
    invoke-direct {p0, p2}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->addNewKid(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->setCurrentStructElem(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 233
    return-object p0
.end method

.method public addTag(Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .locals 1
    .param p1, "properties"    # Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    .line 246
    const/4 v0, -0x1

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->addTag(ILcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 247
    return-object p0
.end method

.method public addTag(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .locals 1
    .param p1, "role"    # Ljava/lang/String;

    .line 215
    const/4 v0, -0x1

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->addTag(ILjava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 216
    return-object p0
.end method

.method public applyProperties(Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;)V
    .locals 1
    .param p1, "properties"    # Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    .line 739
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityPropertiesToStructElem;->apply(Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V

    .line 740
    return-void
.end method

.method createNextMcidForStructElem(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;I)I
    .locals 4
    .param p1, "elem"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    .param p2, "index"    # I

    .line 692
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->throwExceptionIfCurrentPageIsNotInited()V

    .line 695
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->markedContentNotInPageStream()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->currentPage:Lcom/itextpdf/kernel/pdf/PdfPage;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->ensureElementPageEqualsKidPage(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 696
    new-instance v0, Lcom/itextpdf/kernel/pdf/tagging/PdfMcrNumber;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->currentPage:Lcom/itextpdf/kernel/pdf/PdfPage;

    invoke-direct {v0, v1, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcrNumber;-><init>(Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V

    .local v0, "mcr":Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;
    goto :goto_0

    .line 698
    .end local v0    # "mcr":Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/pdf/tagging/PdfMcrDictionary;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->currentPage:Lcom/itextpdf/kernel/pdf/PdfPage;

    invoke-direct {v0, v1, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcrDictionary;-><init>(Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V

    .line 699
    .restart local v0    # "mcr":Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->markedContentNotInPageStream()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 700
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Stm:Lcom/itextpdf/kernel/pdf/PdfName;

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 703
    :cond_1
    :goto_0
    invoke-virtual {p1, p2, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->addKid(ILcom/itextpdf/kernel/pdf/tagging/PdfMcr;)Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    .line 704
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getMcid()I

    move-result v1

    return v1
.end method

.method public flushParentsIfAllKidsFlushed()Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .locals 3

    .line 611
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getContext()Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    move-result-object v0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->flushParentIfBelongsToPage(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;Lcom/itextpdf/kernel/pdf/PdfPage;)V

    .line 612
    return-object p0
.end method

.method public flushTag()Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .locals 2

    .line 580
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->tagStructureContext:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getRootTag()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    if-eq v0, v1, :cond_1

    .line 584
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->tagStructureContext:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getWaitingTagsManager()Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;

    move-result-object v0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->flushTag(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    move-result-object v0

    .line 585
    .local v0, "parent":Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    if-eqz v0, :cond_0

    .line 588
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->setCurrentStructElem(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    goto :goto_0

    .line 590
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->tagStructureContext:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getRootTag()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->setCurrentStructElem(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 592
    :goto_0
    return-object p0

    .line 581
    .end local v0    # "parent":Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    :cond_1
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Cannot flush document root tag before document is closed."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getContext()Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;
    .locals 1

    .line 170
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->tagStructureContext:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    return-object v0
.end method

.method public getCurrentContentStream()Lcom/itextpdf/kernel/pdf/PdfStream;
    .locals 1

    .line 163
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    return-object v0
.end method

.method public getCurrentPage()Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 1

    .line 139
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->currentPage:Lcom/itextpdf/kernel/pdf/PdfPage;

    return-object v0
.end method

.method getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    .locals 3

    .line 717
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->currentStructElem:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->isFlushed()Z

    move-result v0

    if-nez v0, :cond_2

    .line 722
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->currentStructElem:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    .line 723
    .local v0, "indRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->isFree()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 726
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "TagTreePointer is in invalid state: it points at removed element use TagTreePointer#moveToRoot."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 730
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->currentStructElem:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    return-object v1

    .line 718
    .end local v0    # "indRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    :cond_2
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "TagTreePointer is in invalid state: it points at flushed element. Use TagTreePointer#moveToRoot."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;
    .locals 1

    .line 177
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->tagStructureContext:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    return-object v0
.end method

.method public getIndexInParentKidsList()I
    .locals 4

    .line 650
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->tagStructureContext:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getRootTag()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    const/4 v2, -0x1

    if-ne v0, v1, :cond_0

    .line 651
    return v2

    .line 654
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getParent()Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 655
    .local v0, "parent":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->isFlushed()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 656
    return v2

    .line 658
    :cond_1
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getK()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 659
    .local v1, "k":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    if-ne v1, v3, :cond_2

    .line 660
    const/4 v2, 0x0

    return v2

    .line 662
    :cond_2
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isArray()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 663
    move-object v2, v1

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 664
    .local v2, "kidsArr":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->indexOf(Lcom/itextpdf/kernel/pdf/PdfObject;)I

    move-result v3

    return v3

    .line 666
    .end local v2    # "kidsArr":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_3
    return v2
.end method

.method public getKidsRoles()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 555
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 556
    .local v0, "roles":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getKids()Ljava/util/List;

    move-result-object v1

    .line 557
    .local v1, "kids":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    .line 558
    .local v3, "kid":Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    if-nez v3, :cond_0

    .line 559
    const/4 v4, 0x0

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 560
    :cond_0
    instance-of v4, v3, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    if-eqz v4, :cond_1

    .line 561
    invoke-interface {v3}, Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;->getRole()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 563
    :cond_1
    const-string v4, "MCR"

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 565
    .end local v3    # "kid":Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    :goto_1
    goto :goto_0

    .line 566
    :cond_2
    return-object v0
.end method

.method public getNamespaceForNewTags()Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;
    .locals 1

    .line 204
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->currentNamespace:Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    return-object v0
.end method

.method public getProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 1

    .line 621
    new-instance v0, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;

    invoke-direct {v0, p0}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;-><init>(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)V

    return-object v0
.end method

.method public getRole()Ljava/lang/String;
    .locals 1

    .line 630
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getRole()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTagReference()Lcom/itextpdf/kernel/pdf/tagutils/TagReference;
    .locals 1

    .line 436
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getTagReference(I)Lcom/itextpdf/kernel/pdf/tagutils/TagReference;

    move-result-object v0

    return-object v0
.end method

.method public getTagReference(I)Lcom/itextpdf/kernel/pdf/tagutils/TagReference;
    .locals 2
    .param p1, "index"    # I

    .line 447
    new-instance v0, Lcom/itextpdf/kernel/pdf/tagutils/TagReference;

    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentElemEnsureIndirect()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v1

    invoke-direct {v0, v1, p0, p1}, Lcom/itextpdf/kernel/pdf/tagutils/TagReference;-><init>(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;I)V

    return-object v0
.end method

.method public isPointingToSameTag(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Z
    .locals 2
    .param p1, "otherPointer"    # Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 688
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public moveToKid(I)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .locals 3
    .param p1, "kidIndex"    # I

    .line 489
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getKids()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    .line 490
    .local v0, "kid":Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    instance-of v1, v0, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    if-eqz v1, :cond_0

    .line 491
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->setCurrentStructElem(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 497
    return-object p0

    .line 492
    :cond_0
    instance-of v1, v0, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    if-eqz v1, :cond_1

    .line 493
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Cannot move to marked content reference."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 495
    :cond_1
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Cannot move to flushed kid."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public moveToKid(ILjava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .locals 5
    .param p1, "n"    # I
    .param p2, "role"    # Ljava/lang/String;

    .line 526
    const-string v0, "MCR"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 529
    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getKids()Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 530
    .local v0, "descendants":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;>;"
    const/4 v1, 0x0

    .line 531
    .local v1, "k":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_4

    .line 532
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_3

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    instance-of v3, v3, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    if-eqz v3, :cond_0

    .line 533
    goto :goto_1

    .line 535
    :cond_0
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    invoke-interface {v3}, Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;->getRole()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v3

    .line 536
    .local v3, "descendantRole":Ljava/lang/String;
    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    add-int/lit8 v4, v1, 0x1

    .end local v1    # "k":I
    .local v4, "k":I
    if-ne v1, p1, :cond_1

    .line 537
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->setCurrentStructElem(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 538
    return-object p0

    .line 536
    :cond_1
    move v1, v4

    .line 540
    .end local v4    # "k":I
    .restart local v1    # "k":I
    :cond_2
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    invoke-interface {v4}, Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;->getKids()Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 531
    .end local v3    # "descendantRole":Ljava/lang/String;
    :cond_3
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 544
    .end local v2    # "i":I
    :cond_4
    new-instance v2, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v3, "No kid with such role."

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 527
    .end local v0    # "descendants":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;>;"
    .end local v1    # "k":I
    :cond_5
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Cannot move to marked content reference."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public moveToKid(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .locals 1
    .param p1, "role"    # Ljava/lang/String;

    .line 510
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->moveToKid(ILjava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 511
    return-object p0
.end method

.method public moveToParent()Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .locals 3

    .line 466
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->tagStructureContext:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getRootTag()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    if-eq v0, v1, :cond_1

    .line 470
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getParent()Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 471
    .local v0, "parent":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->isFlushed()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 472
    const-class v1, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 473
    .local v1, "logger":Lorg/slf4j/Logger;
    const-string v2, "An attempt is made to move the tag tree pointer to the tag parent which has been already flushed. Tag tree pointer is moved to the root tag instead."

    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 475
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->moveToRoot()Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 476
    .end local v1    # "logger":Lorg/slf4j/Logger;
    goto :goto_0

    .line 477
    :cond_0
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->setCurrentStructElem(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 479
    :goto_0
    return-object p0

    .line 467
    .end local v0    # "parent":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    :cond_1
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Cannot move to parent current element is root."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public moveToPointer(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .locals 1
    .param p1, "tagTreePointer"    # Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 677
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->currentStructElem:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->currentStructElem:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 678
    return-object p0
.end method

.method public moveToRoot()Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .locals 1

    .line 456
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->tagStructureContext:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getRootTag()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->setCurrentStructElem(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 457
    return-object p0
.end method

.method public relocate(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .locals 3
    .param p1, "pointerToNewParent"    # Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 415
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->tagStructureContext:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getRootTag()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    if-eq v0, v1, :cond_2

    .line 418
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->isFlushed()Z

    move-result v0

    if-nez v0, :cond_1

    .line 421
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getIndexInParentKidsList()I

    move-result v0

    .line 422
    .local v0, "i":I
    if-ltz v0, :cond_0

    .line 425
    new-instance v1, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    invoke-direct {v1, p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;-><init>(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)V

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->moveToParent()Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    move-result-object v1

    invoke-virtual {v1, v0, p1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->relocateKid(ILcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 426
    return-object p0

    .line 423
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Cannot relocate tag which parent is already flushed."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 419
    .end local v0    # "i":I
    :cond_1
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Cannot relocate tag which is already flushed."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 416
    :cond_2
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Cannot relocate root tag."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public relocateKid(ILcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .locals 3
    .param p1, "kidIndex"    # I
    .param p2, "pointerToNewParent"    # Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 377
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v1

    if-ne v0, v1, :cond_6

    .line 381
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->isFlushed()Z

    move-result v0

    if-nez v0, :cond_5

    .line 385
    invoke-virtual {p0, p2}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->isPointingToSameTag(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    .line 386
    iget v0, p2, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->nextNewKidIndex:I

    if-ne p1, v0, :cond_0

    .line 387
    return-object p0

    .line 388
    :cond_0
    iget v0, p2, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->nextNewKidIndex:I

    if-ge p1, v0, :cond_1

    .line 389
    iget v0, p2, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->nextNewKidIndex:I

    sub-int/2addr v0, v1

    invoke-virtual {p2, v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->setNextNewKidIndex(I)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 392
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getKids()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 395
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {v0, p1, v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->removeKid(IZ)Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    move-result-object v0

    .line 396
    .local v0, "removedKid":Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    instance-of v1, v0, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    if-eqz v1, :cond_2

    .line 397
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-direct {p2, v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->addNewKid(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    goto :goto_0

    .line 398
    :cond_2
    instance-of v1, v0, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    if-eqz v1, :cond_3

    .line 399
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->prepareMcrForMovingToNewParent(Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    move-result-object v1

    .line 400
    .local v1, "mcrKid":Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;
    invoke-direct {p2, v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->addNewKid(Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;)Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    .line 403
    .end local v1    # "mcrKid":Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;
    :cond_3
    :goto_0
    return-object p0

    .line 393
    .end local v0    # "removedKid":Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    :cond_4
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Cannot relocate tag which is already flushed."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 382
    :cond_5
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Cannot relocate tag which parent is already flushed."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 378
    :cond_6
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Tag cannot be moved to the another document\'s tag structure."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public removeTag()Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .locals 11

    .line 329
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    .line 330
    .local v0, "currentStructElem":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getParent()Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    move-result-object v1

    .line 331
    .local v1, "parentElem":Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    instance-of v2, v1, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    if-nez v2, :cond_4

    .line 335
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getKids()Ljava/util/List;

    move-result-object v2

    .line 336
    .local v2, "kids":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;>;"
    move-object v3, v1

    check-cast v3, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 338
    .local v3, "parent":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->isFlushed()Z

    move-result v4

    if-nez v4, :cond_3

    .line 343
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->tagStructureContext:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getWaitingTagsManager()Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;

    move-result-object v4

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->getObjForStructDict(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Ljava/lang/Object;

    move-result-object v4

    .line 344
    .local v4, "objForStructDict":Ljava/lang/Object;
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->tagStructureContext:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getWaitingTagsManager()Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;

    move-result-object v5

    invoke-virtual {v5, v4}, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->removeWaitingState(Ljava/lang/Object;)Z

    .line 346
    invoke-virtual {v3, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->removeKid(Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;)I

    move-result v5

    .line 348
    .local v5, "removedKidIndex":I
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v6

    .line 349
    .local v6, "indRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    if-eqz v6, :cond_0

    .line 352
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setFree()V

    .line 355
    :cond_0
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    .line 356
    .local v8, "kid":Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    instance-of v9, v8, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    if-eqz v9, :cond_1

    .line 357
    add-int/lit8 v9, v5, 0x1

    .end local v5    # "removedKidIndex":I
    .local v9, "removedKidIndex":I
    move-object v10, v8

    check-cast v10, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-virtual {v3, v5, v10}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->addKid(ILcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move v5, v9

    goto :goto_1

    .line 359
    .end local v9    # "removedKidIndex":I
    .restart local v5    # "removedKidIndex":I
    :cond_1
    move-object v9, v8

    check-cast v9, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    invoke-direct {p0, v9, v3}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->prepareMcrForMovingToNewParent(Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    move-result-object v9

    .line 360
    .local v9, "mcr":Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;
    add-int/lit8 v10, v5, 0x1

    .end local v5    # "removedKidIndex":I
    .local v10, "removedKidIndex":I
    invoke-virtual {v3, v5, v9}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->addKid(ILcom/itextpdf/kernel/pdf/tagging/PdfMcr;)Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    move v5, v10

    .line 362
    .end local v8    # "kid":Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    .end local v9    # "mcr":Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;
    .end local v10    # "removedKidIndex":I
    .restart local v5    # "removedKidIndex":I
    :goto_1
    goto :goto_0

    .line 363
    :cond_2
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->clear()V

    .line 364
    invoke-virtual {p0, v3}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->setCurrentStructElem(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 365
    return-object p0

    .line 339
    .end local v4    # "objForStructDict":Ljava/lang/Object;
    .end local v5    # "removedKidIndex":I
    .end local v6    # "indRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    :cond_3
    new-instance v4, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v5, "Cannot remove tag, because its parent is flushed."

    invoke-direct {v4, v5}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 332
    .end local v2    # "kids":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;>;"
    .end local v3    # "parent":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    :cond_4
    new-instance v2, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v3, "Cannot remove document root tag."

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public setContentStreamForTagging(Lcom/itextpdf/kernel/pdf/PdfStream;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .locals 0
    .param p1, "contentStream"    # Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 155
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->contentStream:Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 156
    return-object p0
.end method

.method setCurrentStructElem(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .locals 2
    .param p1, "structElem"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 708
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getParent()Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 712
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->currentStructElem:Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 713
    return-object p0

    .line 709
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "StructureElement shall contain parent object."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setNamespaceForNewTags(Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .locals 0
    .param p1, "namespace"    # Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    .line 194
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->currentNamespace:Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    .line 195
    return-object p0
.end method

.method public setNextNewKidIndex(I)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .locals 1
    .param p1, "nextNewKidIndex"    # I

    .line 313
    const/4 v0, -0x1

    if-le p1, v0, :cond_0

    .line 314
    iput p1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->nextNewKidIndex:I

    .line 316
    :cond_0
    return-object p0
.end method

.method public setPageForTagging(Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .locals 2
    .param p1, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 127
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->isFlushed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 130
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->currentPage:Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 132
    return-object p0

    .line 128
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "The page has been already flushed."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setRole(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .locals 2
    .param p1, "role"    # Ljava/lang/String;

    .line 640
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->convertRoleToPdfName(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->setRole(Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 641
    return-object p0
.end method
