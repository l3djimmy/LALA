.class public Lcom/itextpdf/kernel/pdf/PdfDictionary;
.super Lcom/itextpdf/kernel/pdf/PdfObject;
.source "PdfDictionary.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private map:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 43
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 51
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;-><init>()V

    .line 45
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionary;->map:Ljava/util/Map;

    .line 52
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 2
    .param p1, "dictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 82
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;-><init>()V

    .line 45
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionary;->map:Ljava/util/Map;

    .line 83
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionary;->map:Ljava/util/Map;

    iget-object v1, p1, Lcom/itextpdf/kernel/pdf/PdfDictionary;->map:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 84
    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;)V"
        }
    .end annotation

    .line 60
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;-><init>()V

    .line 45
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionary;->map:Ljava/util/Map;

    .line 61
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionary;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 62
    return-void
.end method

.method public constructor <init>(Ljava/util/Set;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/util/Map$Entry<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;>;)V"
        }
    .end annotation

    .line 70
    .local p1, "entrySet":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;>;>;"
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;-><init>()V

    .line 45
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionary;->map:Ljava/util/Map;

    .line 71
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 72
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDictionary;->map:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    goto :goto_0

    .line 74
    :cond_0
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 328
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionary;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 329
    return-void
.end method

.method public clone(Ljava/util/List;)Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            ">;)",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;"
        }
    .end annotation

    .line 411
    .local p1, "excludeKeys":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    .line 412
    .local v0, "excluded":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfName;

    .line 413
    .local v2, "key":Lcom/itextpdf/kernel/pdf/PdfName;
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfDictionary;->map:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 414
    .local v3, "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v3, :cond_0

    .line 415
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfDictionary;->map:Ljava/util/Map;

    invoke-interface {v4, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v0, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 417
    .end local v2    # "key":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local v3    # "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_0
    goto :goto_0

    .line 418
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->clone()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 419
    .local v1, "dictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDictionary;->map:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 420
    return-object v1
.end method

.method public containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z
    .locals 1
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 111
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionary;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsValue(Lcom/itextpdf/kernel/pdf/PdfObject;)Z
    .locals 1
    .param p1, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 121
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionary;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected copyContent(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 1
    .param p1, "from"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p2, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 502
    invoke-static {}, Lcom/itextpdf/kernel/utils/NullCopyFilter;->getInstance()Lcom/itextpdf/kernel/utils/NullCopyFilter;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->copyContent(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/utils/ICopyFilter;)V

    .line 503
    return-void
.end method

.method protected copyContent(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/utils/ICopyFilter;)V
    .locals 7
    .param p1, "from"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p2, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p3, "copyFilter"    # Lcom/itextpdf/kernel/utils/ICopyFilter;

    .line 510
    invoke-super {p0, p1, p2, p3}, Lcom/itextpdf/kernel/pdf/PdfObject;->copyContent(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/utils/ICopyFilter;)V

    .line 511
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 512
    .local v0, "dictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;->map:Ljava/util/Map;

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

    .line 513
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfObject;

    invoke-interface {p3, p0, v3, v4}, Lcom/itextpdf/kernel/utils/ICopyFilter;->shouldProcess(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 514
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfDictionary;->map:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfObject;

    const/4 v6, 0x0

    invoke-virtual {v5, p2, v6, p3}, Lcom/itextpdf/kernel/pdf/PdfObject;->processCopying(Lcom/itextpdf/kernel/pdf/PdfDocument;ZLcom/itextpdf/kernel/utils/ICopyFilter;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 516
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    :cond_0
    goto :goto_0

    .line 517
    :cond_1
    return-void
.end method

.method public copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/util/List;Z)Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 1
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p3, "allowDuplicating"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            ">;Z)",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;"
        }
    .end annotation

    .line 433
    .local p2, "excludeKeys":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    invoke-static {}, Lcom/itextpdf/kernel/utils/NullCopyFilter;->getInstance()Lcom/itextpdf/kernel/utils/NullCopyFilter;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/util/List;ZLcom/itextpdf/kernel/utils/ICopyFilter;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    return-object v0
.end method

.method public copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/util/List;ZLcom/itextpdf/kernel/utils/ICopyFilter;)Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 5
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p3, "allowDuplicating"    # Z
    .param p4, "copyFilter"    # Lcom/itextpdf/kernel/utils/ICopyFilter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            ">;Z",
            "Lcom/itextpdf/kernel/utils/ICopyFilter;",
            ")",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;"
        }
    .end annotation

    .line 449
    .local p2, "excludeKeys":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    .line 450
    .local v0, "excluded":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfName;

    .line 451
    .local v2, "key":Lcom/itextpdf/kernel/pdf/PdfName;
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfDictionary;->map:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 452
    .local v3, "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v3, :cond_0

    .line 453
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfDictionary;->map:Ljava/util/Map;

    invoke-interface {v4, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v0, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 455
    .end local v2    # "key":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local v3    # "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_0
    goto :goto_0

    .line 456
    :cond_1
    invoke-virtual {p0, p1, p3, p4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;ZLcom/itextpdf/kernel/utils/ICopyFilter;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 457
    .local v1, "dictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfDictionary;->map:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 458
    return-object v1
.end method

.method public entrySet()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/util/Map$Entry<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;>;"
        }
    .end annotation

    .line 378
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDictionary;->map:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionaryEntrySet;-><init>(Ljava/util/Set;)V

    return-object v0
.end method

.method public get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 131
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method public get(Lcom/itextpdf/kernel/pdf/PdfName;Z)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 3
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "asDirect"    # Z

    .line 468
    nop

    .line 471
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionary;->map:Ljava/util/Map;

    .line 468
    if-nez p2, :cond_0

    .line 469
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfObject;

    return-object v0

    .line 471
    :cond_0
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 472
    .local v0, "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v1

    const/4 v2, 0x5

    if-ne v1, v2, :cond_1

    .line 473
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    return-object v1

    .line 475
    :cond_1
    return-object v0
.end method

.method public getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 3
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 141
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 142
    .local v1, "direct":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v2

    if-ne v2, v0, :cond_0

    .line 143
    move-object v0, v1

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    return-object v0

    .line 145
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getAsBool(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/Boolean;
    .locals 3
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 283
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsBoolean(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v0

    .line 284
    .local v0, "b":Lcom/itextpdf/kernel/pdf/PdfBoolean;
    const/4 v1, 0x0

    .line 285
    .local v1, "booleanValue":Ljava/lang/Boolean;
    if-eqz v0, :cond_0

    .line 286
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->getValue()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 289
    :cond_0
    return-object v1
.end method

.method public getAsBoolean(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfBoolean;
    .locals 3
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 226
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 227
    .local v0, "direct":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    .line 228
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfBoolean;

    return-object v1

    .line 230
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 3
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 156
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 157
    .local v0, "direct":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_0

    .line 158
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    return-object v1

    .line 160
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public getAsFloat(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/Float;
    .locals 3
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 253
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 254
    .local v0, "number":Lcom/itextpdf/kernel/pdf/PdfNumber;
    const/4 v1, 0x0

    .line 255
    .local v1, "floatNumber":Ljava/lang/Float;
    if-eqz v0, :cond_0

    .line 256
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    .line 258
    :cond_0
    return-object v1
.end method

.method public getAsInt(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/Integer;
    .locals 3
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 268
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 269
    .local v0, "number":Lcom/itextpdf/kernel/pdf/PdfNumber;
    const/4 v1, 0x0

    .line 270
    .local v1, "intNumber":Ljava/lang/Integer;
    if-eqz v0, :cond_0

    .line 271
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 273
    :cond_0
    return-object v1
.end method

.method public getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 3
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 198
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 199
    .local v0, "direct":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v1

    const/4 v2, 0x6

    if-ne v1, v2, :cond_0

    .line 200
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v1

    .line 202
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;
    .locals 3
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 184
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 185
    .local v0, "direct":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v1

    const/16 v2, 0x8

    if-ne v1, v2, :cond_0

    .line 186
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    return-object v1

    .line 188
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public getAsRectangle(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 2
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 242
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 243
    .local v0, "a":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->toRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    :goto_0
    return-object v1
.end method

.method public getAsStream(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfStream;
    .locals 3
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 170
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 171
    .local v0, "direct":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v1

    const/16 v2, 0x9

    if-ne v1, v2, :cond_0

    .line 172
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfStream;

    return-object v1

    .line 174
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 3
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 212
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 213
    .local v0, "direct":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v1

    const/16 v2, 0xa

    if-ne v1, v2, :cond_0

    .line 214
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfString;

    return-object v1

    .line 216
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public getType()B
    .locals 1

    .line 383
    const/4 v0, 0x3

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 101
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionary;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public keySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            ">;"
        }
    .end annotation

    .line 337
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionary;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public mergeDifferent(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 3
    .param p1, "other"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 485
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfName;

    .line 486
    .local v1, "key":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 487
    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 489
    .end local v1    # "key":Lcom/itextpdf/kernel/pdf/PdfName;
    :cond_0
    goto :goto_0

    .line 490
    :cond_1
    return-void
.end method

.method protected newInstance()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1

    .line 494
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    return-object v0
.end method

.method public put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 301
    if-eqz p2, :cond_0

    .line 302
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionary;->map:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfObject;

    return-object v0

    .line 301
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public putAll(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 2
    .param p1, "d"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 321
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionary;->map:Ljava/util/Map;

    iget-object v1, p1, Lcom/itextpdf/kernel/pdf/PdfDictionary;->map:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 322
    return-void
.end method

.method protected releaseContent()V
    .locals 1

    .line 523
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionary;->map:Ljava/util/Map;

    .line 524
    return-void
.end method

.method public remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 312
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionary;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfObject;

    return-object v0
.end method

.method public size()I
    .locals 1

    .line 92
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionary;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 7

    .line 388
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isFlushed()Z

    move-result v0

    if-nez v0, :cond_2

    .line 389
    const-string v0, "<<"

    .line 390
    .local v0, "string":Ljava/lang/String;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDictionary;->map:Ljava/util/Map;

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

    .line 391
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfObject;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v3

    .line 392
    .local v3, "indirectReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfName;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-nez v3, :cond_0

    .line 394
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/pdf/PdfObject;

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    :cond_0
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->toString()Ljava/lang/String;

    move-result-object v6

    :goto_1
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 395
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    .end local v3    # "indirectReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    goto :goto_0

    .line 396
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ">>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 397
    return-object v0

    .line 399
    .end local v0    # "string":Ljava/lang/String;
    :cond_2
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionary;->indirectReference:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public values()Ljava/util/Collection;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;"
        }
    .end annotation

    .line 365
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionaryValues;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfDictionary;->map:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionaryValues;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public values(Z)Ljava/util/Collection;
    .locals 1
    .param p1, "asDirects"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/Collection<",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;"
        }
    .end annotation

    .line 348
    if-eqz p1, :cond_0

    .line 349
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0

    .line 351
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionary;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method
