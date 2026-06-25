.class public Lcom/itextpdf/kernel/utils/PdfScriptMerger;
.super Ljava/lang/Object;
.source "PdfScriptMerger.java"


# static fields
.field private static final LOGGER:Lorg/slf4j/Logger;

.field private static final allowedAAEntries:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 47
    const-class v0, Lcom/itextpdf/kernel/utils/PdfScriptMerger;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/utils/PdfScriptMerger;->LOGGER:Lorg/slf4j/Logger;

    .line 48
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x4

    new-array v1, v1, [Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v2, 0x0

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->WC:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->WS:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->DS:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v3, v1, v2

    const/4 v2, 0x3

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->WP:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v3, v1, v2

    .line 49
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/utils/PdfScriptMerger;->allowedAAEntries:Ljava/util/Set;

    .line 48
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static copyECMAScriptActionsDictionary(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 5
    .param p0, "destination"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "actions"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 149
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->JS:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 150
    .local v0, "originalScriptSource":Lcom/itextpdf/kernel/pdf/PdfObject;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 151
    .local v1, "scriptType":Lcom/itextpdf/kernel/pdf/PdfObject;
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 152
    .local v2, "actionsCopy":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v0, :cond_0

    .line 153
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->JS:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 155
    :cond_0
    if-eqz v1, :cond_1

    .line 156
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 158
    :cond_1
    return-object v2
.end method

.method public static mergeAdditionalActionsScripts(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 6
    .param p0, "source"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "destination"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 75
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AA:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 76
    .local v0, "sourceAA":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->AA:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    .line 77
    .local v1, "destinationAA":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v0, :cond_5

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_1

    .line 80
    :cond_0
    if-nez v1, :cond_1

    .line 81
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    move-object v1, v2

    .line 82
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->AA:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 84
    :cond_1
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->entrySet()Ljava/util/Set;

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

    .line 85
    .local v3, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 86
    sget-object v2, Lcom/itextpdf/kernel/utils/PdfScriptMerger;->LOGGER:Lorg/slf4j/Logger;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    const-string v5, "Cannot merge entry {0}, entry with such key already exists."

    invoke-static {v5, v4}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 87
    return-void

    .line 89
    :cond_2
    sget-object v4, Lcom/itextpdf/kernel/utils/PdfScriptMerger;->allowedAAEntries:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 90
    goto :goto_0

    .line 92
    :cond_3
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-static {p1, v5}, Lcom/itextpdf/kernel/utils/PdfScriptMerger;->copyECMAScriptActionsDictionary(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 93
    .end local v3    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    goto :goto_0

    .line 94
    :cond_4
    return-void

    .line 78
    :cond_5
    :goto_1
    return-void
.end method

.method public static mergeNamesScripts(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 8
    .param p0, "source"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "destination"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 126
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Names:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 127
    .local v0, "namesDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v0, :cond_6

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->JavaScript:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_2

    .line 130
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Names:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    .line 131
    .local v1, "destinationNamesDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v1, :cond_1

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->JavaScript:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    if-nez v2, :cond_2

    .line 132
    :cond_1
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v2

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->JavaScript:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->nameTreeContainsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 133
    :cond_2
    sget-object v2, Lcom/itextpdf/kernel/utils/PdfScriptMerger;->LOGGER:Lorg/slf4j/Logger;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->JavaScript:Lcom/itextpdf/kernel/pdf/PdfName;

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const-string v4, "Cannot merge entry {0}, entry with such key already exists."

    invoke-static {v4, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 134
    return-void

    .line 138
    :cond_3
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNameTree;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v3

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->JavaScript:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfNameTree;-><init>(Lcom/itextpdf/kernel/pdf/PdfCatalog;Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 139
    .local v2, "sourceTree":Lcom/itextpdf/kernel/pdf/PdfNameTree;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v3

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->JavaScript:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getNameTree(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNameTree;

    move-result-object v3

    .line 140
    .local v3, "destinationTree":Lcom/itextpdf/kernel/pdf/PdfNameTree;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfNameTree;->getNames()Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 141
    .local v5, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    nop

    .line 142
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/pdf/PdfObject;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfObject;->isIndirect()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/pdf/PdfObject;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    goto :goto_1

    .line 143
    :cond_4
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 141
    :goto_1
    invoke-static {p1, v6}, Lcom/itextpdf/kernel/utils/PdfScriptMerger;->copyECMAScriptActionsDictionary(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v6

    .line 144
    .local v6, "ECMAScriptActionsDirectCopy":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-virtual {v3, v7, v6}, Lcom/itextpdf/kernel/pdf/PdfNameTree;->addEntry(Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 145
    .end local v5    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    .end local v6    # "ECMAScriptActionsDirectCopy":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    goto :goto_0

    .line 146
    :cond_5
    return-void

    .line 128
    .end local v1    # "destinationNamesDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v2    # "sourceTree":Lcom/itextpdf/kernel/pdf/PdfNameTree;
    .end local v3    # "destinationTree":Lcom/itextpdf/kernel/pdf/PdfNameTree;
    :cond_6
    :goto_2
    return-void
.end method

.method public static mergeOpenActionsScripts(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 6
    .param p0, "source"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "destination"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 103
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->OpenAction:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 104
    .local v0, "sourceOpenAction":Lcom/itextpdf/kernel/pdf/PdfObject;
    instance-of v1, v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    if-eqz v1, :cond_0

    .line 105
    return-void

    .line 107
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->OpenAction:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    .line 108
    .local v1, "sourceOpenActionDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v1, :cond_3

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->JavaScript:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_0

    .line 111
    :cond_1
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->OpenAction:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    .line 112
    .local v2, "destinationOpenAction":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v2, :cond_2

    .line 113
    sget-object v3, Lcom/itextpdf/kernel/utils/PdfScriptMerger;->LOGGER:Lorg/slf4j/Logger;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->OpenAction:Lcom/itextpdf/kernel/pdf/PdfName;

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    const-string v5, "Cannot merge entry {0}, entry with such key already exists."

    invoke-static {v5, v4}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 114
    return-void

    .line 116
    :cond_2
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->OpenAction:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p1, v1}, Lcom/itextpdf/kernel/utils/PdfScriptMerger;->copyECMAScriptActionsDictionary(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 117
    return-void

    .line 109
    .end local v2    # "destinationOpenAction":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_3
    :goto_0
    return-void
.end method

.method public static mergeScripts(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 0
    .param p0, "source"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "destination"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 63
    invoke-static {p0, p1}, Lcom/itextpdf/kernel/utils/PdfScriptMerger;->mergeOpenActionsScripts(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 64
    invoke-static {p0, p1}, Lcom/itextpdf/kernel/utils/PdfScriptMerger;->mergeAdditionalActionsScripts(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 65
    invoke-static {p0, p1}, Lcom/itextpdf/kernel/utils/PdfScriptMerger;->mergeNamesScripts(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 66
    return-void
.end method
