.class public Lcom/itextpdf/io/font/CidFontProperties;
.super Ljava/lang/Object;
.source "CidFontProperties.java"


# static fields
.field private static final allFonts:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final registryNames:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 39
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/itextpdf/io/font/CidFontProperties;->allFonts:Ljava/util/Map;

    .line 40
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/itextpdf/io/font/CidFontProperties;->registryNames:Ljava/util/Map;

    .line 44
    :try_start_0
    invoke-static {}, Lcom/itextpdf/io/font/CidFontProperties;->loadRegistry()V

    .line 45
    sget-object v0, Lcom/itextpdf/io/font/CidFontProperties;->registryNames:Ljava/util/Map;

    const-string v1, "fonts"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 46
    .local v1, "font":Ljava/lang/String;
    sget-object v2, Lcom/itextpdf/io/font/CidFontProperties;->allFonts:Ljava/util/Map;

    invoke-static {v1}, Lcom/itextpdf/io/font/CidFontProperties;->readFontProperties(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v3

    invoke-interface {v2, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    nop

    .end local v1    # "font":Ljava/lang/String;
    goto :goto_0

    .line 48
    :catch_0
    move-exception v0

    :cond_0
    nop

    .line 49
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static createMetric(Ljava/lang/String;)Lcom/itextpdf/io/util/IntHashtable;
    .locals 4
    .param p0, "s"    # Ljava/lang/String;

    .line 126
    new-instance v0, Lcom/itextpdf/io/util/IntHashtable;

    invoke-direct {v0}, Lcom/itextpdf/io/util/IntHashtable;-><init>()V

    .line 127
    .local v0, "h":Lcom/itextpdf/io/util/IntHashtable;
    new-instance v1, Ljava/util/StringTokenizer;

    invoke-direct {v1, p0}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 128
    .local v1, "tk":Ljava/util/StringTokenizer;
    :goto_0
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 129
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 130
    .local v2, "n1":I
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v0, v2, v3}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 131
    .end local v2    # "n1":I
    goto :goto_0

    .line 132
    :cond_0
    return-object v0
.end method

.method public static getAllFonts()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .line 82
    sget-object v0, Lcom/itextpdf/io/font/CidFontProperties;->allFonts:Ljava/util/Map;

    return-object v0
.end method

.method public static getCompatibleFont(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "enc"    # Ljava/lang/String;

    .line 69
    sget-object v0, Lcom/itextpdf/io/font/CidFontProperties;->registryNames:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 70
    .local v1, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Set<Ljava/lang/String;>;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Set;

    invoke-interface {v2, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 71
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 72
    .local v2, "registry":Ljava/lang/String;
    sget-object v3, Lcom/itextpdf/io/font/CidFontProperties;->allFonts:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 73
    .local v4, "e1":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map;

    const-string v6, "Registry"

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 74
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0

    .line 75
    .end local v4    # "e1":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    :cond_0
    goto :goto_1

    .line 77
    .end local v1    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Set<Ljava/lang/String;>;>;"
    .end local v2    # "registry":Ljava/lang/String;
    :cond_1
    goto :goto_0

    .line 78
    :cond_2
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getRegistryNames()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 86
    sget-object v0, Lcom/itextpdf/io/font/CidFontProperties;->registryNames:Ljava/util/Map;

    return-object v0
.end method

.method public static isCidFont(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 5
    .param p0, "fontName"    # Ljava/lang/String;
    .param p1, "enc"    # Ljava/lang/String;

    .line 57
    sget-object v0, Lcom/itextpdf/io/font/CidFontProperties;->registryNames:Ljava/util/Map;

    const-string v1, "fonts"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 58
    return v2

    .line 59
    :cond_0
    sget-object v0, Lcom/itextpdf/io/font/CidFontProperties;->registryNames:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 60
    return v2

    .line 61
    :cond_1
    const-string v0, "Identity-H"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_4

    const-string v0, "Identity-V"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    .line 63
    :cond_2
    sget-object v0, Lcom/itextpdf/io/font/CidFontProperties;->allFonts:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    const-string v3, "Registry"

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 64
    .local v0, "registry":Ljava/lang/String;
    sget-object v3, Lcom/itextpdf/io/font/CidFontProperties;->registryNames:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Set;

    .line 65
    .local v3, "encodings":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-eqz v3, :cond_3

    invoke-interface {v3, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    move v2, v1

    :cond_3
    return v2

    .line 62
    .end local v0    # "registry":Ljava/lang/String;
    .end local v3    # "encodings":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_4
    :goto_0
    return v1
.end method

.method private static loadRegistry()V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 90
    const-string v0, "com/itextpdf/io/font/cmap/cjk_registry.properties"

    invoke-static {v0}, Lcom/itextpdf/io/util/ResourceUtil;->getResourceStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 91
    .local v0, "resource":Ljava/io/InputStream;
    new-instance v1, Ljava/util/Properties;

    invoke-direct {v1}, Ljava/util/Properties;-><init>()V

    .line 92
    .local v1, "p":Ljava/util/Properties;
    invoke-virtual {v1, v0}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 93
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 94
    invoke-virtual {v1}, Ljava/util/Properties;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 95
    .local v3, "key":Ljava/lang/Object;
    move-object v4, v3

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 96
    .local v4, "value":Ljava/lang/String;
    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 97
    .local v5, "sp":[Ljava/lang/String;
    new-instance v6, Ljava/util/LinkedHashSet;

    invoke-direct {v6}, Ljava/util/LinkedHashSet;-><init>()V

    .line 98
    .local v6, "hs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    array-length v7, v5

    const/4 v8, 0x0

    :goto_1
    if-ge v8, v7, :cond_1

    aget-object v9, v5, v8

    .line 99
    .local v9, "s":Ljava/lang/String;
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v10

    if-lez v10, :cond_0

    .line 100
    invoke-interface {v6, v9}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 98
    .end local v9    # "s":Ljava/lang/String;
    :cond_0
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 102
    :cond_1
    sget-object v7, Lcom/itextpdf/io/font/CidFontProperties;->registryNames:Ljava/util/Map;

    move-object v8, v3

    check-cast v8, Ljava/lang/String;

    invoke-interface {v7, v8, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    .end local v3    # "key":Ljava/lang/Object;
    .end local v4    # "value":Ljava/lang/String;
    .end local v5    # "sp":[Ljava/lang/String;
    .end local v6    # "hs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    goto :goto_0

    .line 104
    :cond_2
    return-void
.end method

.method private static readFontProperties(Ljava/lang/String;)Ljava/util/Map;
    .locals 11
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 107
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".properties"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 108
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "com/itextpdf/io/font/cmap/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/io/util/ResourceUtil;->getResourceStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 109
    .local v0, "resource":Ljava/io/InputStream;
    new-instance v1, Ljava/util/Properties;

    invoke-direct {v1}, Ljava/util/Properties;-><init>()V

    .line 110
    .local v1, "p":Ljava/util/Properties;
    invoke-virtual {v1, v0}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 111
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 112
    const-string v2, "W"

    invoke-virtual {v1, v2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/itextpdf/io/font/CidFontProperties;->createMetric(Ljava/lang/String;)Lcom/itextpdf/io/util/IntHashtable;

    move-result-object v3

    .line 113
    .local v3, "W":Lcom/itextpdf/io/util/IntHashtable;
    invoke-virtual {v1, v2}, Ljava/util/Properties;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    const-string v4, "W2"

    invoke-virtual {v1, v4}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/itextpdf/io/font/CidFontProperties;->createMetric(Ljava/lang/String;)Lcom/itextpdf/io/util/IntHashtable;

    move-result-object v5

    .line 115
    .local v5, "W2":Lcom/itextpdf/io/util/IntHashtable;
    invoke-virtual {v1, v4}, Ljava/util/Properties;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 117
    .local v6, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {v1}, Ljava/util/Properties;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    .line 118
    .local v8, "obj":Ljava/lang/Object;
    move-object v9, v8

    check-cast v9, Ljava/lang/String;

    move-object v10, v8

    check-cast v10, Ljava/lang/String;

    invoke-virtual {v1, v10}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v6, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    .end local v8    # "obj":Ljava/lang/Object;
    goto :goto_0

    .line 120
    :cond_0
    invoke-interface {v6, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    invoke-interface {v6, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    return-object v6
.end method
