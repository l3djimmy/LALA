.class public Lcom/itextpdf/kernel/pdf/PdfNameTree;
.super Lcom/itextpdf/kernel/pdf/GenericNameTree;
.source "PdfNameTree.java"


# instance fields
.field private final catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

.field private final treeType:Lcom/itextpdf/kernel/pdf/PdfName;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfCatalog;Lcom/itextpdf/kernel/pdf/PdfName;)V
    .locals 1
    .param p1, "catalog"    # Lcom/itextpdf/kernel/pdf/PdfCatalog;
    .param p2, "treeType"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 42
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/GenericNameTree;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 43
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/PdfNameTree;->treeType:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 44
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfNameTree;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    .line 45
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/PdfNameTree;->readFromCatalog()Ljava/util/LinkedHashMap;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfNameTree;->setItems(Ljava/util/LinkedHashMap;)V

    .line 46
    return-void
.end method

.method private static getDestArray(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2
    .param p0, "obj"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 114
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 115
    return-object v0

    .line 116
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isArray()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 117
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    return-object v0

    .line 118
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isDictionary()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 119
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    return-object v0

    .line 121
    :cond_2
    return-object v0
.end method

.method private insertDestsEntriesFromCatalog(Ljava/util/Map;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfString;",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;)V"
        }
    .end annotation

    .line 100
    .local p1, "items":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfNameTree;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Dests:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 101
    .local v0, "destinations":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v0, :cond_1

    .line 102
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->keySet()Ljava/util/Set;

    move-result-object v1

    .line 103
    .local v1, "keys":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfName;

    .line 104
    .local v3, "key":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    invoke-static {v4}, Lcom/itextpdf/kernel/pdf/PdfNameTree;->getDestArray(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v4

    .line 105
    .local v4, "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v4, :cond_0

    .line 106
    goto :goto_0

    .line 108
    :cond_0
    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    .end local v3    # "key":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local v4    # "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    goto :goto_0

    .line 111
    .end local v1    # "keys":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    :cond_1
    return-void
.end method

.method private static normalizeDestinations(Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfString;",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;)V"
        }
    .end annotation

    .line 86
    .local p0, "items":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    new-instance v0, Ljava/util/HashSet;

    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 87
    .local v0, "keys":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/PdfString;>;"
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfString;

    .line 88
    .local v2, "key":Lcom/itextpdf/kernel/pdf/PdfString;
    invoke-interface {p0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfObject;

    invoke-static {v3}, Lcom/itextpdf/kernel/pdf/PdfNameTree;->getDestArray(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v3

    .line 89
    .local v3, "arr":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v3, :cond_0

    .line 90
    invoke-interface {p0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 92
    :cond_0
    invoke-interface {p0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .end local v2    # "key":Lcom/itextpdf/kernel/pdf/PdfString;
    .end local v3    # "arr":Lcom/itextpdf/kernel/pdf/PdfArray;
    :goto_1
    goto :goto_0

    .line 95
    :cond_1
    return-void
.end method

.method private readFromCatalog()Ljava/util/LinkedHashMap;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedHashMap<",
            "Lcom/itextpdf/kernel/pdf/PdfString;",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;"
        }
    .end annotation

    .line 61
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfNameTree;->catalog:Lcom/itextpdf/kernel/pdf/PdfCatalog;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Names:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 63
    .local v0, "namesDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfNameTree;->treeType:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    .line 66
    .local v1, "treeRoot":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :goto_0
    if-nez v1, :cond_1

    .line 67
    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    .local v2, "items":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    goto :goto_1

    .line 70
    .end local v2    # "items":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    :cond_1
    invoke-static {v1}, Lcom/itextpdf/kernel/pdf/PdfNameTree;->readTree(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Ljava/util/LinkedHashMap;

    move-result-object v2

    .line 73
    .restart local v2    # "items":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    :goto_1
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfNameTree;->treeType:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Dests:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 74
    invoke-static {v2}, Lcom/itextpdf/kernel/pdf/PdfNameTree;->normalizeDestinations(Ljava/util/Map;)V

    .line 75
    invoke-direct {p0, v2}, Lcom/itextpdf/kernel/pdf/PdfNameTree;->insertDestsEntriesFromCatalog(Ljava/util/Map;)V

    .line 78
    :cond_2
    return-object v2
.end method


# virtual methods
.method public getNames()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfString;",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;"
        }
    .end annotation

    .line 57
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfNameTree;->getItems()Ljava/util/LinkedHashMap;

    move-result-object v0

    return-object v0
.end method
