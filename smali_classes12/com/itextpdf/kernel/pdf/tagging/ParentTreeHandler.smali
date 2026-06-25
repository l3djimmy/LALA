.class Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;
.super Ljava/lang/Object;
.source "ParentTreeHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;
    }
.end annotation


# static fields
.field private static final LOGGER:Lorg/slf4j/Logger;


# instance fields
.field private maxStructParentIndex:I

.field private pageToPageMcrs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            "Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;",
            ">;"
        }
    .end annotation
.end field

.field private pageToStructParentsInd:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private parentTree:Lcom/itextpdf/kernel/pdf/PdfNumTree;

.field private structTreeRoot:Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

.field private xObjectToStructParentsInd:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 59
    const-class v0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

.method constructor <init>(Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;)V
    .locals 3
    .param p1, "structTreeRoot"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->maxStructParentIndex:I

    .line 81
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->structTreeRoot:Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    .line 82
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfNumTree;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v1

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->ParentTree:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfNumTree;-><init>(Lcom/itextpdf/kernel/pdf/PdfCatalog;Lcom/itextpdf/kernel/pdf/PdfName;)V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->parentTree:Lcom/itextpdf/kernel/pdf/PdfNumTree;

    .line 83
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->xObjectToStructParentsInd:Ljava/util/Map;

    .line 84
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->registerAllMcrs()V

    .line 85
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->pageToStructParentsInd:Ljava/util/Map;

    .line 86
    return-void
.end method

.method private getOrCreatePageStructParentIndex(Lcom/itextpdf/kernel/pdf/PdfPage;)I
    .locals 4
    .param p1, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 376
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getStructParentIndex()I

    move-result v0

    .line 377
    .local v0, "structParentIndex":I
    if-gez v0, :cond_0

    .line 378
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNextStructParentIndex()I

    move-result v0

    .line 379
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->StructParents:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v3, v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 381
    :cond_0
    return v0
.end method

.method private static getStm(Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 3
    .param p0, "mcr"    # Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    .line 389
    instance-of v0, p0, Lcom/itextpdf/kernel/pdf/tagging/PdfMcrDictionary;

    if-eqz v0, :cond_0

    .line 390
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Stm:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0

    .line 392
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method private registerAllMcrs()V
    .locals 9

    .line 269
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->pageToPageMcrs:Ljava/util/Map;

    .line 271
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfNumTree;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->structTreeRoot:Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v1

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->ParentTree:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfNumTree;-><init>(Lcom/itextpdf/kernel/pdf/PdfCatalog;Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 272
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumTree;->getNumbers()Ljava/util/Map;

    move-result-object v0

    .line 273
    .local v0, "parentTreeEntries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    .line 274
    .local v1, "mcrParents":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfDictionary;>;"
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 275
    .local v3, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iget v5, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->maxStructParentIndex:I

    if-le v4, v5, :cond_0

    .line 276
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->maxStructParentIndex:I

    .line 279
    :cond_0
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 280
    .local v4, "entryValue":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfObject;->isDictionary()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 281
    move-object v5, v4

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-interface {v1, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 282
    :cond_1
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfObject;->isArray()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 283
    move-object v5, v4

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 284
    .local v5, "parentsArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v7

    if-ge v6, v7, :cond_3

    .line 285
    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsDictionary(I)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v7

    .line 286
    .local v7, "parent":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v7, :cond_2

    .line 287
    invoke-interface {v1, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 284
    .end local v7    # "parent":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 291
    .end local v3    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    .end local v4    # "entryValue":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v5    # "parentsArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v6    # "i":I
    :cond_3
    :goto_2
    goto :goto_0

    .line 292
    :cond_4
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->structTreeRoot:Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->ParentTreeNextKey:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfNumber;

    iget v5, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->maxStructParentIndex:I

    const/4 v6, 0x1

    add-int/2addr v5, v6

    invoke-direct {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 294
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 295
    .local v3, "mcrParent":Lcom/itextpdf/kernel/pdf/PdfObject;
    new-instance v4, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-object v5, v3

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v4, v5}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 296
    .local v4, "mcrParentStructElem":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getKids()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_4
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_6

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    .line 297
    .local v7, "kid":Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    instance-of v8, v7, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    if-eqz v8, :cond_5

    .line 298
    move-object v8, v7

    check-cast v8, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    invoke-direct {p0, v8, v6}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->registerMcr(Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;Z)V

    .line 300
    .end local v7    # "kid":Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    :cond_5
    goto :goto_4

    .line 301
    .end local v3    # "mcrParent":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v4    # "mcrParentStructElem":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    :cond_6
    goto :goto_3

    .line 302
    :cond_7
    return-void
.end method

.method private registerMcr(Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;Z)V
    .locals 10
    .param p1, "mcr"    # Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;
    .param p2, "registeringOnInit"    # Z

    .line 156
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getPageIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    .line 157
    .local v0, "mcrPageIndRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    if-eqz v0, :cond_b

    instance-of v1, p1, Lcom/itextpdf/kernel/pdf/tagging/PdfObjRef;

    if-nez v1, :cond_0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getMcid()I

    move-result v1

    if-gez v1, :cond_0

    goto/16 :goto_4

    .line 161
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->pageToPageMcrs:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;

    .line 162
    .local v1, "pageMcrs":Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;
    if-nez v1, :cond_1

    .line 163
    new-instance v2, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;-><init>()V

    move-object v1, v2

    .line 164
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->pageToPageMcrs:Ljava/util/Map;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    :cond_1
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->getStm(Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    move-object v3, v2

    .local v3, "stm":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v2, :cond_6

    .line 171
    instance-of v2, v3, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    if-eqz v2, :cond_2

    .line 172
    move-object v2, v3

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 173
    .local v2, "stmIndRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfStream;

    .local v4, "xObjectStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    goto :goto_0

    .line 175
    .end local v2    # "stmIndRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .end local v4    # "xObjectStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    :cond_2
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    if-nez v2, :cond_3

    .line 176
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->structTreeRoot:Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfObject;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 178
    :cond_3
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    .line 179
    .restart local v2    # "stmIndRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    move-object v4, v3

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 182
    .restart local v4    # "xObjectStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    :goto_0
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->StructParents:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsInt(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/Integer;

    move-result-object v5

    .line 183
    .local v5, "structParent":Ljava/lang/Integer;
    if-eqz v5, :cond_4

    .line 184
    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->xObjectToStructParentsInd:Ljava/util/Map;

    invoke-interface {v6, v2, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    if-eqz p2, :cond_5

    .line 186
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfStream;->release()V

    goto :goto_1

    .line 189
    :cond_4
    iget v6, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->maxStructParentIndex:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->maxStructParentIndex:I

    .line 190
    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->xObjectToStructParentsInd:Ljava/util/Map;

    iget v7, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->maxStructParentIndex:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v6, v2, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->StructParents:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v7, Lcom/itextpdf/kernel/pdf/PdfNumber;

    iget v8, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->maxStructParentIndex:I

    invoke-direct {v7, v8}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v4, v6, v7}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 192
    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->structTreeRoot:Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v7, Lcom/itextpdf/kernel/pdf/PdfName;->ParentTreeNextKey:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v8, Lcom/itextpdf/kernel/pdf/PdfNumber;

    iget v9, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->maxStructParentIndex:I

    add-int/lit8 v9, v9, 0x1

    invoke-direct {v8, v9}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v6, v7, v8}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 193
    sget-object v6, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->LOGGER:Lorg/slf4j/Logger;

    const-string v7, "XObject has no StructParents index in its stream, so index is recreated"

    invoke-interface {v6, v7}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 195
    :cond_5
    :goto_1
    invoke-virtual {v1, v2, p1}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->putXObjectMcr(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;)V

    .line 196
    .end local v2    # "stmIndRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .end local v4    # "xObjectStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    .end local v5    # "structParent":Ljava/lang/Integer;
    goto :goto_3

    :cond_6
    instance-of v2, p1, Lcom/itextpdf/kernel/pdf/tagging/PdfObjRef;

    if-eqz v2, :cond_9

    .line 197
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Obj:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    .line 198
    .local v2, "obj":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v2, :cond_8

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isFlushed()Z

    move-result v4

    if-nez v4, :cond_8

    .line 202
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->StructParent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v4

    .line 203
    .local v4, "n":Lcom/itextpdf/kernel/pdf/PdfNumber;
    if-eqz v4, :cond_7

    .line 204
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v5

    invoke-virtual {v1, v5, p1}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->putObjectReferenceMcr(ILcom/itextpdf/kernel/pdf/tagging/PdfMcr;)V

    goto :goto_2

    .line 206
    :cond_7
    iget v5, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->maxStructParentIndex:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->maxStructParentIndex:I

    .line 207
    iget v5, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->maxStructParentIndex:I

    invoke-virtual {v1, v5, p1}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->putObjectReferenceMcr(ILcom/itextpdf/kernel/pdf/tagging/PdfMcr;)V

    .line 208
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->StructParent:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v6, Lcom/itextpdf/kernel/pdf/PdfNumber;

    iget v7, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->maxStructParentIndex:I

    invoke-direct {v6, v7}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v2, v5, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 209
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->structTreeRoot:Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->ParentTreeNextKey:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v7, Lcom/itextpdf/kernel/pdf/PdfNumber;

    iget v8, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->maxStructParentIndex:I

    add-int/lit8 v8, v8, 0x1

    invoke-direct {v7, v8}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v5, v6, v7}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 210
    sget-object v5, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->LOGGER:Lorg/slf4j/Logger;

    const-string v6, "StructParent index not found in tagged object, so index is recreated."

    invoke-interface {v5, v6}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 212
    .end local v2    # "obj":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v4    # "n":Lcom/itextpdf/kernel/pdf/PdfNumber;
    :goto_2
    goto :goto_3

    .line 199
    .restart local v2    # "obj":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_8
    new-instance v4, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v5, "When adding object reference to the tag tree, it must be connected to not flushed object."

    invoke-direct {v4, v5}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 213
    .end local v2    # "obj":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_9
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getMcid()I

    move-result v2

    invoke-virtual {v1, v2, p1}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->putPageContentStreamMcr(ILcom/itextpdf/kernel/pdf/tagging/PdfMcr;)V

    .line 216
    :goto_3
    if-nez p2, :cond_a

    .line 217
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->structTreeRoot:Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 219
    :cond_a
    return-void

    .line 158
    .end local v1    # "pageMcrs":Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;
    .end local v3    # "stm":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_b
    :goto_4
    sget-object v1, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->LOGGER:Lorg/slf4j/Logger;

    const-string v2, "Corrupted tag structure: encountered invalid marked content reference - it doesn\'t refer to any page or any mcid. This content reference will be ignored."

    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 159
    return-void
.end method

.method private updateStructParentTreeEntries(Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;)Z
    .locals 7
    .param p1, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;
    .param p2, "mcrs"    # Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;

    .line 305
    const/4 v0, 0x0

    .line 307
    .local v0, "res":Z
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->getObjRefs()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 308
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    .line 309
    .local v3, "mcr":Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getParent()Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 310
    .local v4, "parentObj":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isIndirect()Z

    move-result v5

    if-nez v5, :cond_0

    .line 311
    goto :goto_0

    .line 313
    :cond_0
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 314
    .local v5, "structParent":I
    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->parentTree:Lcom/itextpdf/kernel/pdf/PdfNumTree;

    invoke-virtual {v6, v5, v4}, Lcom/itextpdf/kernel/pdf/PdfNumTree;->addEntry(ILcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 315
    const/4 v0, 0x1

    .line 316
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;>;"
    .end local v3    # "mcr":Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;
    .end local v4    # "parentObj":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v5    # "structParent":I
    goto :goto_0

    .line 319
    :cond_1
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->getPageResourceXObjects()Ljava/util/Map;

    move-result-object v1

    .line 320
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    .line 319
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 321
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Ljava/util/TreeMap<Ljava/lang/Integer;Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;>;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 322
    .local v3, "xObjectRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->xObjectToStructParentsInd:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 323
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->xObjectToStructParentsInd:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 324
    .local v4, "pageStructParentIndex":I
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map;

    invoke-direct {p0, v5, v4}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->updateStructParentTreeForContentStreamEntries(Ljava/util/Map;I)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 325
    const/4 v0, 0x1

    .line 328
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Ljava/util/TreeMap<Ljava/lang/Integer;Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;>;>;"
    .end local v3    # "xObjectRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .end local v4    # "pageStructParentIndex":I
    :cond_2
    goto :goto_1

    .line 329
    :cond_3
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->isFlushed()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 330
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    .line 331
    .local v1, "pageRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->pageToStructParentsInd:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 332
    return v0

    .line 334
    :cond_4
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->pageToStructParentsInd:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 335
    .local v1, "pageStructParentIndex":I
    goto :goto_2

    .line 336
    .end local v1    # "pageStructParentIndex":I
    :cond_5
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->getOrCreatePageStructParentIndex(Lcom/itextpdf/kernel/pdf/PdfPage;)I

    move-result v1

    .line 338
    .restart local v1    # "pageStructParentIndex":I
    :goto_2
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->getPageContentStreamsMcrs()Ljava/util/NavigableMap;

    move-result-object v2

    invoke-direct {p0, v2, v1}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->updateStructParentTreeForContentStreamEntries(Ljava/util/Map;I)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 339
    const/4 v0, 0x1

    .line 342
    :cond_6
    return v0
.end method

.method private updateStructParentTreeForContentStreamEntries(Ljava/util/Map;I)Z
    .locals 8
    .param p2, "pageStructParentIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;",
            ">;I)Z"
        }
    .end annotation

    .line 349
    .local p1, "mcrsOfContentStream":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;>;"
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 350
    .local v0, "parentsOfMcrs":Lcom/itextpdf/kernel/pdf/PdfArray;
    const/4 v1, 0x0

    .line 351
    .local v1, "currentMcid":I
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 352
    .local v3, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    .line 353
    .local v4, "mcr":Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getParent()Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 354
    .local v5, "parentObj":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isIndirect()Z

    move-result v6

    if-nez v6, :cond_0

    .line 355
    goto :goto_0

    .line 359
    :cond_0
    :goto_1
    add-int/lit8 v6, v1, 0x1

    .end local v1    # "currentMcid":I
    .local v6, "currentMcid":I
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getMcid()I

    move-result v7

    if-ge v1, v7, :cond_1

    .line 360
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfNull;->PDF_NULL:Lcom/itextpdf/kernel/pdf/PdfNull;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    move v1, v6

    goto :goto_1

    .line 362
    :cond_1
    invoke-virtual {v0, v5}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 363
    .end local v3    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;>;"
    .end local v4    # "mcr":Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;
    .end local v5    # "parentObj":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    move v1, v6

    goto :goto_0

    .line 365
    .end local v6    # "currentMcid":I
    .restart local v1    # "currentMcid":I
    :cond_2
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3

    .line 366
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->structTreeRoot:Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 367
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->parentTree:Lcom/itextpdf/kernel/pdf/PdfNumTree;

    invoke-virtual {v2, p2, v0}, Lcom/itextpdf/kernel/pdf/PdfNumTree;->addEntry(ILcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 368
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->structTreeRoot:Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v2

    sget-object v3, Lcom/itextpdf/kernel/pdf/IsoKey;->TAG_STRUCTURE_ELEMENT:Lcom/itextpdf/kernel/pdf/IsoKey;

    invoke-virtual {v2, v0, v3}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkIsoConformance(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/IsoKey;)V

    .line 369
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->flush()V

    .line 370
    const/4 v2, 0x1

    return v2

    .line 372
    :cond_3
    const/4 v2, 0x0

    return v2
.end method


# virtual methods
.method public buildParentTree()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 2

    .line 148
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->parentTree:Lcom/itextpdf/kernel/pdf/PdfNumTree;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumTree;->buildTree()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->structTreeRoot:Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    return-object v0
.end method

.method public createParentTreeEntryForPage(Lcom/itextpdf/kernel/pdf/PdfPage;)V
    .locals 3
    .param p1, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 123
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->getPageMarkedContentReferences(Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;

    move-result-object v0

    .line 124
    .local v0, "mcrs":Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;
    if-nez v0, :cond_0

    .line 125
    return-void

    .line 127
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->pageToPageMcrs:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->updateStructParentTreeEntries(Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 130
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->structTreeRoot:Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 132
    :cond_1
    return-void
.end method

.method public findMcrByMcid(Lcom/itextpdf/kernel/pdf/PdfDictionary;I)Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;
    .locals 3
    .param p1, "pageDict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "mcid"    # I

    .line 97
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->pageToPageMcrs:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;

    .line 98
    .local v0, "pageMcrs":Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->getPageContentStreamsMcrs()Ljava/util/NavigableMap;

    move-result-object v1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/NavigableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method

.method public findObjRefByStructParentIndex(Lcom/itextpdf/kernel/pdf/PdfDictionary;I)Lcom/itextpdf/kernel/pdf/tagging/PdfObjRef;
    .locals 3
    .param p1, "pageDict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "structParentIndex"    # I

    .line 102
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->pageToPageMcrs:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;

    .line 103
    .local v0, "pageMcrs":Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->getObjRefs()Ljava/util/Map;

    move-result-object v1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/tagging/PdfObjRef;

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method

.method public getNextMcidForPage(Lcom/itextpdf/kernel/pdf/PdfPage;)I
    .locals 2
    .param p1, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 107
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->getPageMarkedContentReferences(Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;

    move-result-object v0

    .line 108
    .local v0, "pageMcrs":Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->getPageContentStreamsMcrs()Ljava/util/NavigableMap;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/NavigableMap;->size()I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 111
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->getPageContentStreamsMcrs()Ljava/util/NavigableMap;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/NavigableMap;->lastEntry()Ljava/util/Map$Entry;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    return v1

    .line 109
    :cond_1
    :goto_0
    const/4 v1, 0x0

    return v1
.end method

.method public getPageMarkedContentReferences(Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;
    .locals 2
    .param p1, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 92
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->pageToPageMcrs:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;

    return-object v0
.end method

.method public registerMcr(Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;)V
    .locals 1
    .param p1, "mcr"    # Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    .line 152
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->registerMcr(Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;Z)V

    .line 153
    return-void
.end method

.method public savePageStructParentIndexIfNeeded(Lcom/itextpdf/kernel/pdf/PdfPage;)V
    .locals 4
    .param p1, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 135
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    .line 136
    .local v0, "indRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->isFlushed()Z

    move-result v1

    if-nez v1, :cond_4

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->pageToPageMcrs:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_2

    .line 139
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->pageToPageMcrs:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->getPageContentStreamsMcrs()Ljava/util/NavigableMap;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/NavigableMap;->size()I

    move-result v1

    if-gtz v1, :cond_2

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->pageToPageMcrs:Ljava/util/Map;

    .line 140
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->getPageResourceXObjects()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    if-lez v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v1, 0x1

    .line 142
    .local v1, "hasNonObjRefMcr":Z
    :goto_1
    if-eqz v1, :cond_3

    .line 143
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->pageToStructParentsInd:Ljava/util/Map;

    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->getOrCreatePageStructParentIndex(Lcom/itextpdf/kernel/pdf/PdfPage;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    :cond_3
    return-void

    .line 137
    .end local v1    # "hasNonObjRefMcr":Z
    :cond_4
    :goto_2
    return-void
.end method

.method public unregisterMcr(Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;)V
    .locals 8
    .param p1, "mcrToUnregister"    # Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    .line 222
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getPageObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 223
    .local v0, "pageDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-nez v0, :cond_0

    .line 226
    return-void

    .line 228
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isFlushed()Z

    move-result v1

    if-nez v1, :cond_9

    .line 232
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->pageToPageMcrs:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;

    .line 233
    .local v1, "pageMcrs":Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;
    if-eqz v1, :cond_8

    .line 235
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->getStm(Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    move-object v3, v2

    .local v3, "stm":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v2, :cond_3

    .line 236
    instance-of v2, v3, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    if-eqz v2, :cond_1

    move-object v2, v3

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    goto :goto_0

    .line 237
    :cond_1
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    :goto_0
    nop

    .line 238
    .local v2, "xObjectReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->getPageResourceXObjects()Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/TreeMap;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getMcid()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/TreeMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 239
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->getPageResourceXObjects()Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/TreeMap;

    invoke-virtual {v4}, Ljava/util/TreeMap;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 240
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->getPageResourceXObjects()Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->xObjectToStructParentsInd:Ljava/util/Map;

    invoke-interface {v4, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 243
    :cond_2
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->structTreeRoot:Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 244
    .end local v2    # "xObjectReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    goto/16 :goto_3

    :cond_3
    instance-of v2, p1, Lcom/itextpdf/kernel/pdf/tagging/PdfObjRef;

    if-eqz v2, :cond_7

    .line 245
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Obj:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    .line 246
    .local v2, "obj":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v2, :cond_4

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isFlushed()Z

    move-result v4

    if-nez v4, :cond_4

    .line 247
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->StructParent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v4

    .line 248
    .local v4, "n":Lcom/itextpdf/kernel/pdf/PdfNumber;
    if-eqz v4, :cond_4

    .line 249
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->getObjRefs()Ljava/util/Map;

    move-result-object v5

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 250
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->structTreeRoot:Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 251
    return-void

    .line 254
    .end local v4    # "n":Lcom/itextpdf/kernel/pdf/PdfNumber;
    :cond_4
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->getObjRefs()Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 255
    .local v5, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;>;"
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v6

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v7

    if-ne v6, v7, :cond_5

    .line 256
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->getObjRefs()Ljava/util/Map;

    move-result-object v4

    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v4, v6}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->structTreeRoot:Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 258
    goto :goto_2

    .line 260
    .end local v5    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;>;"
    :cond_5
    goto :goto_1

    .line 261
    .end local v2    # "obj":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_6
    :goto_2
    goto :goto_3

    .line 262
    :cond_7
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->getPageContentStreamsMcrs()Ljava/util/NavigableMap;

    move-result-object v2

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getMcid()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/NavigableMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 263
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->structTreeRoot:Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 266
    .end local v3    # "stm":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_8
    :goto_3
    return-void

    .line 229
    .end local v1    # "pageMcrs":Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;
    :cond_9
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Cannot remove marked content reference, because its page has been already flushed."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
