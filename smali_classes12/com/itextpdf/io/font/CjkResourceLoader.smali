.class public final Lcom/itextpdf/io/font/CjkResourceLoader;
.super Ljava/lang/Object;
.source "CjkResourceLoader.java"


# static fields
.field private static final CJK_REGISTRY_FILENAME:Ljava/lang/String; = "cjk_registry.properties"

.field private static final FONTS_PROP:Ljava/lang/String; = "fonts"

.field private static final REGISTRY_PROP:Ljava/lang/String; = "Registry"

.field private static final W2_PROP:Ljava/lang/String; = "W2"

.field private static final W_PROP:Ljava/lang/String; = "W"

.field private static final allCidFonts:Ljava/util/Map;
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

.field private static cmapLocation:Lcom/itextpdf/io/font/cmap/CMapLocationResource;

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
    .locals 1

    .line 52
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lcom/itextpdf/io/font/CjkResourceLoader;->allCidFonts:Ljava/util/Map;

    .line 53
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/itextpdf/io/font/CjkResourceLoader;->registryNames:Ljava/util/Map;

    .line 67
    new-instance v0, Lcom/itextpdf/io/font/cmap/CMapLocationResource;

    invoke-direct {v0}, Lcom/itextpdf/io/font/cmap/CMapLocationResource;-><init>()V

    invoke-static {v0}, Lcom/itextpdf/io/font/CjkResourceLoader;->setCmapLocation(Lcom/itextpdf/io/font/cmap/CMapLocationResource;)V

    .line 68
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    return-void
.end method

.method private static createMetric(Ljava/lang/String;)Lcom/itextpdf/io/util/IntHashtable;
    .locals 4
    .param p0, "s"    # Ljava/lang/String;

    .line 262
    new-instance v0, Lcom/itextpdf/io/util/IntHashtable;

    invoke-direct {v0}, Lcom/itextpdf/io/util/IntHashtable;-><init>()V

    .line 263
    .local v0, "h":Lcom/itextpdf/io/util/IntHashtable;
    new-instance v1, Ljava/util/StringTokenizer;

    invoke-direct {v1, p0}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 265
    .local v1, "tk":Ljava/util/StringTokenizer;
    :goto_0
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 266
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 267
    .local v2, "n1":I
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v0, v2, v3}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 268
    .end local v2    # "n1":I
    goto :goto_0

    .line 270
    :cond_0
    return-object v0
.end method

.method public static getAllPredefinedCidFonts()Ljava/util/Map;
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

    .line 128
    sget-object v0, Lcom/itextpdf/io/font/CjkResourceLoader;->allCidFonts:Ljava/util/Map;

    return-object v0
.end method

.method public static getByte2CidCmap(Ljava/lang/String;)Lcom/itextpdf/io/font/cmap/CMapByteCid;
    .locals 2
    .param p0, "cmap"    # Ljava/lang/String;

    .line 171
    new-instance v0, Lcom/itextpdf/io/font/cmap/CMapByteCid;

    invoke-direct {v0}, Lcom/itextpdf/io/font/cmap/CMapByteCid;-><init>()V

    .line 172
    .local v0, "uniCid":Lcom/itextpdf/io/font/cmap/CMapByteCid;
    invoke-static {p0, v0}, Lcom/itextpdf/io/font/CjkResourceLoader;->parseCmap(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/AbstractCMap;)Lcom/itextpdf/io/font/cmap/AbstractCMap;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/io/font/cmap/CMapByteCid;

    return-object v1
.end method

.method public static getCid2UniCmap(Ljava/lang/String;)Lcom/itextpdf/io/font/cmap/CMapCidUni;
    .locals 2
    .param p0, "uniMap"    # Ljava/lang/String;

    .line 148
    new-instance v0, Lcom/itextpdf/io/font/cmap/CMapCidUni;

    invoke-direct {v0}, Lcom/itextpdf/io/font/cmap/CMapCidUni;-><init>()V

    .line 149
    .local v0, "cidUni":Lcom/itextpdf/io/font/cmap/CMapCidUni;
    invoke-static {p0, v0}, Lcom/itextpdf/io/font/CjkResourceLoader;->parseCmap(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/AbstractCMap;)Lcom/itextpdf/io/font/cmap/AbstractCMap;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/io/font/cmap/CMapCidUni;

    return-object v1
.end method

.method public static getCidToCodepointCmap(Ljava/lang/String;)Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;
    .locals 2
    .param p0, "cmap"    # Ljava/lang/String;

    .line 183
    new-instance v0, Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;

    invoke-direct {v0}, Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;-><init>()V

    .line 184
    .local v0, "cidByte":Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;
    invoke-static {p0, v0}, Lcom/itextpdf/io/font/CjkResourceLoader;->parseCmap(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/AbstractCMap;)Lcom/itextpdf/io/font/cmap/AbstractCMap;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;

    return-object v1
.end method

.method public static getCodepointToCidCmap(Ljava/lang/String;)Lcom/itextpdf/io/font/cmap/CMapCodepointToCid;
    .locals 1
    .param p0, "uniMap"    # Ljava/lang/String;

    .line 195
    new-instance v0, Lcom/itextpdf/io/font/cmap/CMapCodepointToCid;

    invoke-direct {v0}, Lcom/itextpdf/io/font/cmap/CMapCodepointToCid;-><init>()V

    invoke-static {p0, v0}, Lcom/itextpdf/io/font/CjkResourceLoader;->parseCmap(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/AbstractCMap;)Lcom/itextpdf/io/font/cmap/AbstractCMap;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/font/cmap/CMapCodepointToCid;

    return-object v0
.end method

.method public static getCompatibleCidFont(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "cmap"    # Ljava/lang/String;

    .line 93
    sget-object v0, Lcom/itextpdf/io/font/CjkResourceLoader;->registryNames:Ljava/util/Map;

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

    .line 94
    .local v1, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Set<Ljava/lang/String;>;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Set;

    invoke-interface {v2, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 95
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 96
    .local v2, "registry":Ljava/lang/String;
    sget-object v3, Lcom/itextpdf/io/font/CjkResourceLoader;->allCidFonts:Ljava/util/Map;

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

    .line 97
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

    .line 98
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0

    .line 100
    .end local v4    # "e1":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    :cond_0
    goto :goto_1

    .line 102
    .end local v1    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Set<Ljava/lang/String;>;>;"
    .end local v2    # "registry":Ljava/lang/String;
    :cond_1
    goto :goto_0

    .line 103
    :cond_2
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getCompatibleCmaps(Ljava/lang/String;)Ljava/util/Set;
    .locals 3
    .param p0, "fontName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 114
    invoke-static {}, Lcom/itextpdf/io/font/CjkResourceLoader;->getAllPredefinedCidFonts()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 115
    .local v0, "cidFonts":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    if-nez v0, :cond_0

    .line 116
    const/4 v1, 0x0

    return-object v1

    .line 118
    :cond_0
    const-string v1, "Registry"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 119
    .local v1, "registry":Ljava/lang/String;
    sget-object v2, Lcom/itextpdf/io/font/CjkResourceLoader;->registryNames:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Set;

    return-object v2
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

    .line 137
    sget-object v0, Lcom/itextpdf/io/font/CjkResourceLoader;->registryNames:Ljava/util/Map;

    return-object v0
.end method

.method public static getUni2CidCmap(Ljava/lang/String;)Lcom/itextpdf/io/font/cmap/CMapUniCid;
    .locals 1
    .param p0, "uniMap"    # Ljava/lang/String;

    .line 160
    new-instance v0, Lcom/itextpdf/io/font/cmap/CMapUniCid;

    invoke-direct {v0}, Lcom/itextpdf/io/font/cmap/CMapUniCid;-><init>()V

    invoke-static {p0, v0}, Lcom/itextpdf/io/font/CjkResourceLoader;->parseCmap(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/AbstractCMap;)Lcom/itextpdf/io/font/cmap/AbstractCMap;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/font/cmap/CMapUniCid;

    return-object v0
.end method

.method public static isPredefinedCidFont(Ljava/lang/String;)Z
    .locals 3
    .param p0, "fontName"    # Ljava/lang/String;

    .line 78
    sget-object v0, Lcom/itextpdf/io/font/CjkResourceLoader;->registryNames:Ljava/util/Map;

    const-string v1, "fonts"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 79
    return v2

    .line 80
    :cond_0
    sget-object v0, Lcom/itextpdf/io/font/CjkResourceLoader;->registryNames:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 81
    return v2

    .line 83
    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method private static loadRegistry()V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 207
    sget-object v0, Lcom/itextpdf/io/font/CjkResourceLoader;->registryNames:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 208
    sget-object v0, Lcom/itextpdf/io/font/CjkResourceLoader;->allCidFonts:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 210
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/itextpdf/io/font/CjkResourceLoader;->cmapLocation:Lcom/itextpdf/io/font/cmap/CMapLocationResource;

    invoke-virtual {v1}, Lcom/itextpdf/io/font/cmap/CMapLocationResource;->getLocationPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "cjk_registry.properties"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/io/util/ResourceUtil;->getResourceStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 212
    .local v0, "resource":Ljava/io/InputStream;
    :try_start_0
    new-instance v1, Ljava/util/Properties;

    invoke-direct {v1}, Ljava/util/Properties;-><init>()V

    .line 213
    .local v1, "p":Ljava/util/Properties;
    invoke-virtual {v1, v0}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 215
    invoke-virtual {v1}, Ljava/util/Properties;->entrySet()Ljava/util/Set;

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

    .line 216
    .local v3, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Object;Ljava/lang/Object;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 217
    .local v4, "value":Ljava/lang/String;
    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 218
    .local v5, "splitValue":[Ljava/lang/String;
    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    .line 220
    .local v6, "set":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    array-length v7, v5

    const/4 v8, 0x0

    :goto_1
    if-ge v8, v7, :cond_1

    aget-object v9, v5, v8

    .line 221
    .local v9, "s":Ljava/lang/String;
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v10

    if-eqz v10, :cond_0

    .line 222
    invoke-interface {v6, v9}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 220
    .end local v9    # "s":Ljava/lang/String;
    :cond_0
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 226
    :cond_1
    sget-object v7, Lcom/itextpdf/io/font/CjkResourceLoader;->registryNames:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-interface {v7, v8, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 227
    nop

    .end local v3    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Object;Ljava/lang/Object;>;"
    .end local v4    # "value":Ljava/lang/String;
    .end local v5    # "splitValue":[Ljava/lang/String;
    .end local v6    # "set":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    goto :goto_0

    .line 229
    .end local v1    # "p":Ljava/util/Properties;
    :cond_2
    if-eqz v0, :cond_3

    .line 230
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 234
    :cond_3
    sget-object v1, Lcom/itextpdf/io/font/CjkResourceLoader;->registryNames:Ljava/util/Map;

    const-string v2, "fonts"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 235
    .local v2, "font":Ljava/lang/String;
    sget-object v3, Lcom/itextpdf/io/font/CjkResourceLoader;->allCidFonts:Ljava/util/Map;

    invoke-static {v2}, Lcom/itextpdf/io/font/CjkResourceLoader;->readFontProperties(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v4

    invoke-interface {v3, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    .end local v2    # "font":Ljava/lang/String;
    goto :goto_2

    .line 237
    :cond_4
    return-void

    .line 229
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_5

    .line 230
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 232
    :cond_5
    throw v1
.end method

.method private static parseCmap(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/AbstractCMap;)Lcom/itextpdf/io/font/cmap/AbstractCMap;
    .locals 3
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/itextpdf/io/font/cmap/AbstractCMap;",
            ">(",
            "Ljava/lang/String;",
            "TT;)TT;"
        }
    .end annotation

    .line 275
    .local p1, "cmap":Lcom/itextpdf/io/font/cmap/AbstractCMap;, "TT;"
    :try_start_0
    sget-object v0, Lcom/itextpdf/io/font/CjkResourceLoader;->cmapLocation:Lcom/itextpdf/io/font/cmap/CMapLocationResource;

    invoke-static {p0, p1, v0}, Lcom/itextpdf/io/font/cmap/CMapParser;->parseCid(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/AbstractCMap;Lcom/itextpdf/io/font/cmap/ICMapLocation;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 278
    nop

    .line 279
    return-object p1

    .line 276
    :catch_0
    move-exception v0

    .line 277
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v2, "I/O exception."

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static readFontProperties(Ljava/lang/String;)Ljava/util/Map;
    .locals 9
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

    .line 240
    const-string v0, "W2"

    const-string v1, "W"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/itextpdf/io/font/CjkResourceLoader;->cmapLocation:Lcom/itextpdf/io/font/cmap/CMapLocationResource;

    invoke-virtual {v3}, Lcom/itextpdf/io/font/cmap/CMapLocationResource;->getLocationPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".properties"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/itextpdf/io/util/ResourceUtil;->getResourceStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 243
    .local v2, "resource":Ljava/io/InputStream;
    :try_start_0
    new-instance v3, Ljava/util/Properties;

    invoke-direct {v3}, Ljava/util/Properties;-><init>()V

    .line 244
    .local v3, "p":Ljava/util/Properties;
    invoke-virtual {v3, v2}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 246
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 247
    .local v4, "fontProperties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {v3}, Ljava/util/Properties;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 248
    .local v6, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Object;Ljava/lang/Object;>;"
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    invoke-interface {v4, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    nop

    .end local v6    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Object;Ljava/lang/Object;>;"
    goto :goto_0

    .line 250
    :cond_0
    invoke-interface {v4, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Lcom/itextpdf/io/font/CjkResourceLoader;->createMetric(Ljava/lang/String;)Lcom/itextpdf/io/util/IntHashtable;

    move-result-object v5

    invoke-interface {v4, v1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 251
    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lcom/itextpdf/io/font/CjkResourceLoader;->createMetric(Ljava/lang/String;)Lcom/itextpdf/io/util/IntHashtable;

    move-result-object v1

    invoke-interface {v4, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 253
    nop

    .line 255
    if-eqz v2, :cond_1

    .line 256
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 253
    :cond_1
    return-object v4

    .line 255
    .end local v3    # "p":Ljava/util/Properties;
    .end local v4    # "fontProperties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :catchall_0
    move-exception v0

    if-eqz v2, :cond_2

    .line 256
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 258
    :cond_2
    throw v0
.end method

.method static setCmapLocation(Lcom/itextpdf/io/font/cmap/CMapLocationResource;)V
    .locals 1
    .param p0, "cmapLocation"    # Lcom/itextpdf/io/font/cmap/CMapLocationResource;

    .line 199
    sput-object p0, Lcom/itextpdf/io/font/CjkResourceLoader;->cmapLocation:Lcom/itextpdf/io/font/cmap/CMapLocationResource;

    .line 201
    :try_start_0
    invoke-static {}, Lcom/itextpdf/io/font/CjkResourceLoader;->loadRegistry()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 203
    goto :goto_0

    .line 202
    :catch_0
    move-exception v0

    .line 204
    :goto_0
    return-void
.end method
