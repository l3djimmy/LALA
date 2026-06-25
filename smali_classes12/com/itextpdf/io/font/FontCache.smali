.class public Lcom/itextpdf/io/font/FontCache;
.super Ljava/lang/Object;
.source "FontCache.java"


# static fields
.field private static fontCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/itextpdf/io/font/FontCacheKey;",
            "Lcom/itextpdf/io/font/FontProgram;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 37
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lcom/itextpdf/io/font/FontCache;->fontCache:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clearSavedFonts()V
    .locals 1

    .line 126
    sget-object v0, Lcom/itextpdf/io/font/FontCache;->fontCache:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 127
    return-void
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

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 79
    invoke-static {}, Lcom/itextpdf/io/font/CjkResourceLoader;->getAllPredefinedCidFonts()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public static getByte2CidCmap(Ljava/lang/String;)Lcom/itextpdf/io/font/cmap/CMapByteCid;
    .locals 1
    .param p0, "cmap"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 106
    invoke-static {p0}, Lcom/itextpdf/io/font/CjkResourceLoader;->getByte2CidCmap(Ljava/lang/String;)Lcom/itextpdf/io/font/cmap/CMapByteCid;

    move-result-object v0

    return-object v0
.end method

.method public static getCid2UniCmap(Ljava/lang/String;)Lcom/itextpdf/io/font/cmap/CMapCidUni;
    .locals 1
    .param p0, "uniMap"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 96
    invoke-static {p0}, Lcom/itextpdf/io/font/CjkResourceLoader;->getCid2UniCmap(Ljava/lang/String;)Lcom/itextpdf/io/font/cmap/CMapCidUni;

    move-result-object v0

    return-object v0
.end method

.method public static getCidToCodepointCmap(Ljava/lang/String;)Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;
    .locals 1
    .param p0, "cmap"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 111
    invoke-static {p0}, Lcom/itextpdf/io/font/CjkResourceLoader;->getCidToCodepointCmap(Ljava/lang/String;)Lcom/itextpdf/io/font/cmap/CMapCidToCodepoint;

    move-result-object v0

    return-object v0
.end method

.method public static getCodepointToCidCmap(Ljava/lang/String;)Lcom/itextpdf/io/font/cmap/CMapCodepointToCid;
    .locals 1
    .param p0, "uniMap"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 116
    invoke-static {p0}, Lcom/itextpdf/io/font/CjkResourceLoader;->getCodepointToCidCmap(Ljava/lang/String;)Lcom/itextpdf/io/font/cmap/CMapCodepointToCid;

    move-result-object v0

    return-object v0
.end method

.method public static getCompatibleCidFont(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "cmap"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 61
    invoke-static {p0}, Lcom/itextpdf/io/font/CjkResourceLoader;->getCompatibleCidFont(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getCompatibleCmaps(Ljava/lang/String;)Ljava/util/Set;
    .locals 1
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

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 74
    invoke-static {p0}, Lcom/itextpdf/io/font/CjkResourceLoader;->getCompatibleCmaps(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method static getFont(Lcom/itextpdf/io/font/FontCacheKey;)Lcom/itextpdf/io/font/FontProgram;
    .locals 1
    .param p0, "key"    # Lcom/itextpdf/io/font/FontCacheKey;

    .line 134
    sget-object v0, Lcom/itextpdf/io/font/FontCache;->fontCache:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/font/FontProgram;

    return-object v0
.end method

.method public static getFont(Ljava/lang/String;)Lcom/itextpdf/io/font/FontProgram;
    .locals 2
    .param p0, "fontName"    # Ljava/lang/String;

    .line 130
    sget-object v0, Lcom/itextpdf/io/font/FontCache;->fontCache:Ljava/util/Map;

    invoke-static {p0}, Lcom/itextpdf/io/font/FontCacheKey;->create(Ljava/lang/String;)Lcom/itextpdf/io/font/FontCacheKey;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/font/FontProgram;

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

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 84
    invoke-static {}, Lcom/itextpdf/io/font/CjkResourceLoader;->getRegistryNames()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public static getUni2CidCmap(Ljava/lang/String;)Lcom/itextpdf/io/font/cmap/CMapUniCid;
    .locals 1
    .param p0, "uniMap"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 101
    invoke-static {p0}, Lcom/itextpdf/io/font/CjkResourceLoader;->getUni2CidCmap(Ljava/lang/String;)Lcom/itextpdf/io/font/cmap/CMapUniCid;

    move-result-object v0

    return-object v0
.end method

.method protected static isPredefinedCidFont(Ljava/lang/String;)Z
    .locals 1
    .param p0, "fontName"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 49
    invoke-static {p0}, Lcom/itextpdf/io/font/CjkResourceLoader;->isPredefinedCidFont(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static saveFont(Lcom/itextpdf/io/font/FontProgram;Lcom/itextpdf/io/font/FontCacheKey;)Lcom/itextpdf/io/font/FontProgram;
    .locals 2
    .param p0, "font"    # Lcom/itextpdf/io/font/FontProgram;
    .param p1, "key"    # Lcom/itextpdf/io/font/FontCacheKey;

    .line 142
    sget-object v0, Lcom/itextpdf/io/font/FontCache;->fontCache:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/font/FontProgram;

    .line 143
    .local v0, "fontFound":Lcom/itextpdf/io/font/FontProgram;
    if-eqz v0, :cond_0

    .line 144
    return-object v0

    .line 146
    :cond_0
    sget-object v1, Lcom/itextpdf/io/font/FontCache;->fontCache:Ljava/util/Map;

    invoke-interface {v1, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    return-object p0
.end method

.method public static saveFont(Lcom/itextpdf/io/font/FontProgram;Ljava/lang/String;)Lcom/itextpdf/io/font/FontProgram;
    .locals 1
    .param p0, "font"    # Lcom/itextpdf/io/font/FontProgram;
    .param p1, "fontName"    # Ljava/lang/String;

    .line 138
    invoke-static {p1}, Lcom/itextpdf/io/font/FontCacheKey;->create(Ljava/lang/String;)Lcom/itextpdf/io/font/FontCacheKey;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/itextpdf/io/font/FontCache;->saveFont(Lcom/itextpdf/io/font/FontProgram;Lcom/itextpdf/io/font/FontCacheKey;)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    return-object v0
.end method
