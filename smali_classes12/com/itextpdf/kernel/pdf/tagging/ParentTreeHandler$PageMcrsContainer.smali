.class Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;
.super Ljava/lang/Object;
.source "ParentTreeHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "PageMcrsContainer"
.end annotation


# instance fields
.field objRefs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;",
            ">;"
        }
    .end annotation
.end field

.field pageContentStreams:Ljava/util/NavigableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/NavigableMap<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;",
            ">;"
        }
    .end annotation
.end field

.field pageResourceXObjects:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            "Ljava/util/TreeMap<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .line 406
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 407
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->objRefs:Ljava/util/Map;

    .line 408
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->pageContentStreams:Ljava/util/NavigableMap;

    .line 409
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->pageResourceXObjects:Ljava/util/Map;

    .line 410
    return-void
.end method


# virtual methods
.method getAllMcrsAsCollection()Ljava/util/Collection;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;",
            ">;"
        }
    .end annotation

    .line 442
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 443
    .local v0, "collection":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;>;"
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->objRefs:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    .line 444
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->pageContentStreams:Ljava/util/NavigableMap;

    invoke-interface {v1}, Ljava/util/NavigableMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    .line 445
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->pageResourceXObjects:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 446
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Ljava/util/TreeMap<Ljava/lang/Integer;Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;>;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/TreeMap;

    invoke-virtual {v3}, Ljava/util/TreeMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    .line 447
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Ljava/util/TreeMap<Ljava/lang/Integer;Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;>;>;"
    goto :goto_0

    .line 448
    :cond_0
    return-object v0
.end method

.method getObjRefs()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;",
            ">;"
        }
    .end annotation

    .line 434
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->objRefs:Ljava/util/Map;

    return-object v0
.end method

.method getPageContentStreamsMcrs()Ljava/util/NavigableMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/NavigableMap<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;",
            ">;"
        }
    .end annotation

    .line 430
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->pageContentStreams:Ljava/util/NavigableMap;

    return-object v0
.end method

.method getPageResourceXObjects()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
            "Ljava/util/TreeMap<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;",
            ">;>;"
        }
    .end annotation

    .line 438
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->pageResourceXObjects:Ljava/util/Map;

    return-object v0
.end method

.method putObjectReferenceMcr(ILcom/itextpdf/kernel/pdf/tagging/PdfMcr;)V
    .locals 2
    .param p1, "structParentIndex"    # I
    .param p2, "mcr"    # Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    .line 413
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->objRefs:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 414
    return-void
.end method

.method putPageContentStreamMcr(ILcom/itextpdf/kernel/pdf/tagging/PdfMcr;)V
    .locals 2
    .param p1, "mcid"    # I
    .param p2, "mcr"    # Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    .line 417
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->pageContentStreams:Ljava/util/NavigableMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Ljava/util/NavigableMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 418
    return-void
.end method

.method putXObjectMcr(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;)V
    .locals 3
    .param p1, "xObjectIndRef"    # Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .param p2, "mcr"    # Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    .line 421
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->pageResourceXObjects:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/TreeMap;

    .line 422
    .local v0, "xObjectMcrs":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/Integer;Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;>;"
    if-nez v0, :cond_0

    .line 423
    new-instance v1, Ljava/util/TreeMap;

    invoke-direct {v1}, Ljava/util/TreeMap;-><init>()V

    move-object v0, v1

    .line 424
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->pageResourceXObjects:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 426
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler$PageMcrsContainer;->pageResourceXObjects:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/TreeMap;

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getMcid()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2, p2}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 427
    return-void
.end method
