.class public final Lcom/itextpdf/layout/hyphenation/Hyphenator;
.super Ljava/lang/Object;
.source "Hyphenator.java"


# static fields
.field private static final SOFT_HYPHEN:C = '\u00ad'

.field private static additionalHyphenationFileDirectories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static hTreeCache:Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;

.field private static log:Lorg/slf4j/Logger;

.field private static final staticLock:Ljava/lang/Object;


# instance fields
.field protected country:Ljava/lang/String;

.field hyphPathNames:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected lang:Ljava/lang/String;

.field leftMin:I

.field rightMin:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 42
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/itextpdf/layout/hyphenation/Hyphenator;->staticLock:Ljava/lang/Object;

    .line 47
    const-class v0, Lcom/itextpdf/layout/hyphenation/Hyphenator;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/hyphenation/Hyphenator;->log:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;II)V
    .locals 0
    .param p1, "lang"    # Ljava/lang/String;
    .param p2, "country"    # Ljava/lang/String;
    .param p3, "leftMin"    # I
    .param p4, "rightMin"    # I

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    iput-object p1, p0, Lcom/itextpdf/layout/hyphenation/Hyphenator;->lang:Ljava/lang/String;

    .line 69
    iput-object p2, p0, Lcom/itextpdf/layout/hyphenation/Hyphenator;->country:Ljava/lang/String;

    .line 70
    iput p3, p0, Lcom/itextpdf/layout/hyphenation/Hyphenator;->leftMin:I

    .line 71
    iput p4, p0, Lcom/itextpdf/layout/hyphenation/Hyphenator;->rightMin:I

    .line 72
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;IILjava/util/Map;)V
    .locals 0
    .param p1, "lang"    # Ljava/lang/String;
    .param p2, "country"    # Ljava/lang/String;
    .param p3, "leftMin"    # I
    .param p4, "rightMin"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "II",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 84
    .local p5, "hyphPathNames":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/itextpdf/layout/hyphenation/Hyphenator;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    .line 85
    iput-object p5, p0, Lcom/itextpdf/layout/hyphenation/Hyphenator;->hyphPathNames:Ljava/util/Map;

    .line 86
    return-void
.end method

.method public static clearHyphenationTreeCache()V
    .locals 2

    .line 120
    sget-object v0, Lcom/itextpdf/layout/hyphenation/Hyphenator;->staticLock:Ljava/lang/Object;

    monitor-enter v0

    .line 121
    :try_start_0
    new-instance v1, Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;

    invoke-direct {v1}, Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;-><init>()V

    sput-object v1, Lcom/itextpdf/layout/hyphenation/Hyphenator;->hTreeCache:Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;

    .line 122
    monitor-exit v0

    .line 123
    return-void

    .line 122
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static getHyphenationTree(Ljava/io/InputStream;Ljava/lang/String;)Lcom/itextpdf/layout/hyphenation/HyphenationTree;
    .locals 5
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "name"    # Ljava/lang/String;

    .line 259
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 260
    return-object v0

    .line 264
    :cond_0
    :try_start_0
    new-instance v1, Lcom/itextpdf/layout/hyphenation/HyphenationTree;

    invoke-direct {v1}, Lcom/itextpdf/layout/hyphenation/HyphenationTree;-><init>()V

    .line 265
    .local v1, "hTree":Lcom/itextpdf/layout/hyphenation/HyphenationTree;
    invoke-virtual {v1, p0, p1}, Lcom/itextpdf/layout/hyphenation/HyphenationTree;->loadPatterns(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/itextpdf/layout/hyphenation/HyphenationException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 273
    :try_start_1
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 274
    goto :goto_0

    :catch_0
    move-exception v0

    .line 275
    nop

    .line 276
    :goto_0
    return-object v1

    .line 272
    .end local v1    # "hTree":Lcom/itextpdf/layout/hyphenation/HyphenationTree;
    :catchall_0
    move-exception v0

    goto :goto_3

    .line 267
    :catch_1
    move-exception v1

    .line 268
    .local v1, "ex":Lcom/itextpdf/layout/hyphenation/HyphenationException;
    :try_start_2
    sget-object v2, Lcom/itextpdf/layout/hyphenation/Hyphenator;->log:Lorg/slf4j/Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Can\'t load user patterns from XML file "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lcom/itextpdf/layout/hyphenation/HyphenationException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 269
    nop

    .line 273
    :try_start_3
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 274
    :goto_1
    goto :goto_2

    :catch_2
    move-exception v2

    goto :goto_1

    .line 269
    :goto_2
    return-object v0

    .line 273
    .end local v1    # "ex":Lcom/itextpdf/layout/hyphenation/HyphenationException;
    :goto_3
    :try_start_4
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 274
    :goto_4
    goto :goto_5

    :catch_3
    move-exception v1

    goto :goto_4

    .line 275
    :goto_5
    throw v0
.end method

.method public static getHyphenationTree(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/layout/hyphenation/HyphenationTree;
    .locals 5
    .param p0, "searchDirectory"    # Ljava/lang/String;
    .param p1, "key"    # Ljava/lang/String;

    .line 239
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 241
    .local v0, "name":Ljava/lang/String;
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 242
    .local v1, "fis":Ljava/io/InputStream;
    invoke-static {v1, v0}, Lcom/itextpdf/layout/hyphenation/Hyphenator;->getHyphenationTree(Ljava/io/InputStream;Ljava/lang/String;)Lcom/itextpdf/layout/hyphenation/HyphenationTree;

    move-result-object v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    .line 243
    .end local v1    # "fis":Ljava/io/InputStream;
    :catch_0
    move-exception v1

    .line 244
    .local v1, "ioe":Ljava/io/IOException;
    sget-object v2, Lcom/itextpdf/layout/hyphenation/Hyphenator;->log:Lorg/slf4j/Logger;

    invoke-interface {v2}, Lorg/slf4j/Logger;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 245
    sget-object v2, Lcom/itextpdf/layout/hyphenation/Hyphenator;->log:Lorg/slf4j/Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "I/O problem while trying to load "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    .line 247
    :cond_0
    const/4 v2, 0x0

    return-object v2
.end method

.method public static getHyphenationTree(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Lcom/itextpdf/layout/hyphenation/HyphenationTree;
    .locals 9
    .param p0, "lang"    # Ljava/lang/String;
    .param p1, "country"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/itextpdf/layout/hyphenation/HyphenationTree;"
        }
    .end annotation

    .line 136
    .local p2, "hyphPathNames":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {p0, p1}, Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;->constructLlccKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 137
    .local v0, "llccKey":Ljava/lang/String;
    invoke-static {}, Lcom/itextpdf/layout/hyphenation/Hyphenator;->getHyphenationTreeCache()Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;

    move-result-object v1

    .line 140
    .local v1, "cache":Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;
    invoke-virtual {v1, v0}, Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;->isMissing(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    .line 141
    return-object v3

    .line 144
    :cond_0
    invoke-static {p0, p1, p2}, Lcom/itextpdf/layout/hyphenation/Hyphenator;->getHyphenationTree2(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Lcom/itextpdf/layout/hyphenation/HyphenationTree;

    move-result-object v2

    .line 147
    .local v2, "hTree":Lcom/itextpdf/layout/hyphenation/HyphenationTree;
    const-string/jumbo v4, "none"

    const-string v5, "Couldn\'t find hyphenation pattern for lang=\""

    if-nez v2, :cond_3

    if-eqz p1, :cond_3

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3

    .line 148
    invoke-static {p0, v3}, Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;->constructLlccKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 149
    .local v6, "llKey":Ljava/lang/String;
    invoke-virtual {v1, v6}, Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;->isMissing(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_3

    .line 150
    invoke-static {p0, v3, p2}, Lcom/itextpdf/layout/hyphenation/Hyphenator;->getHyphenationTree2(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Lcom/itextpdf/layout/hyphenation/HyphenationTree;

    move-result-object v2

    .line 151
    if-eqz v2, :cond_1

    sget-object v3, Lcom/itextpdf/layout/hyphenation/Hyphenator;->log:Lorg/slf4j/Logger;

    invoke-interface {v3}, Lorg/slf4j/Logger;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 152
    sget-object v3, Lcom/itextpdf/layout/hyphenation/Hyphenator;->log:Lorg/slf4j/Logger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\",country=\""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\". Using general language pattern for lang=\""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\" instead."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v3, v7}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    .line 157
    :cond_1
    if-nez v2, :cond_2

    .line 159
    invoke-virtual {v1, v6}, Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;->noteMissing(Ljava/lang/String;)V

    goto :goto_0

    .line 162
    :cond_2
    invoke-virtual {v1, v0, v2}, Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;->cache(Ljava/lang/String;Lcom/itextpdf/layout/hyphenation/HyphenationTree;)V

    .line 167
    .end local v6    # "llKey":Ljava/lang/String;
    :cond_3
    :goto_0
    if-nez v2, :cond_5

    .line 169
    invoke-virtual {v1, v0}, Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;->noteMissing(Ljava/lang/String;)V

    .line 170
    sget-object v3, Lcom/itextpdf/layout/hyphenation/Hyphenator;->log:Lorg/slf4j/Logger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    if-eqz p1, :cond_4

    .line 172
    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, ",country=\""

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_1

    :cond_4
    const-string v4, ""

    :goto_1
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 170
    invoke-interface {v3, v4}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 178
    :cond_5
    return-object v2
.end method

.method public static getHyphenationTree2(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Lcom/itextpdf/layout/hyphenation/HyphenationTree;
    .locals 6
    .param p0, "lang"    # Ljava/lang/String;
    .param p1, "country"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/itextpdf/layout/hyphenation/HyphenationTree;"
        }
    .end annotation

    .line 190
    .local p2, "hyphPathNames":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {p0, p1}, Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;->constructLlccKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 191
    .local v0, "llccKey":Ljava/lang/String;
    invoke-static {}, Lcom/itextpdf/layout/hyphenation/Hyphenator;->getHyphenationTreeCache()Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;

    move-result-object v1

    .line 195
    .local v1, "cache":Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;
    invoke-static {}, Lcom/itextpdf/layout/hyphenation/Hyphenator;->getHyphenationTreeCache()Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;

    move-result-object v2

    invoke-virtual {v2, p0, p1}, Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;->getHyphenationTree(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/layout/hyphenation/HyphenationTree;

    move-result-object v2

    .line 196
    .local v2, "hTree":Lcom/itextpdf/layout/hyphenation/HyphenationTree;
    if-eqz v2, :cond_0

    .line 197
    return-object v2

    .line 200
    :cond_0
    invoke-static {p0, p1, p2}, Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;->constructUserKey(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v3

    .line 201
    .local v3, "key":Ljava/lang/String;
    if-nez v3, :cond_1

    .line 202
    move-object v3, v0

    .line 205
    :cond_1
    sget-object v4, Lcom/itextpdf/layout/hyphenation/Hyphenator;->additionalHyphenationFileDirectories:Ljava/util/List;

    if-eqz v4, :cond_3

    .line 206
    sget-object v4, Lcom/itextpdf/layout/hyphenation/Hyphenator;->additionalHyphenationFileDirectories:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 207
    .local v5, "dir":Ljava/lang/String;
    invoke-static {v5, v3}, Lcom/itextpdf/layout/hyphenation/Hyphenator;->getHyphenationTree(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/layout/hyphenation/HyphenationTree;

    move-result-object v2

    .line 208
    if-eqz v2, :cond_2

    .line 209
    goto :goto_1

    .line 211
    .end local v5    # "dir":Ljava/lang/String;
    :cond_2
    goto :goto_0

    .line 214
    :cond_3
    :goto_1
    if-nez v2, :cond_4

    .line 216
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "com/itextpdf/hyph/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".xml"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/itextpdf/io/util/ResourceUtil;->getResourceStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    .line 217
    .local v4, "defaultHyphenationResourceStream":Ljava/io/InputStream;
    if-eqz v4, :cond_4

    .line 218
    invoke-static {v4, v3}, Lcom/itextpdf/layout/hyphenation/Hyphenator;->getHyphenationTree(Ljava/io/InputStream;Ljava/lang/String;)Lcom/itextpdf/layout/hyphenation/HyphenationTree;

    move-result-object v2

    .line 223
    .end local v4    # "defaultHyphenationResourceStream":Ljava/io/InputStream;
    :cond_4
    if-eqz v2, :cond_5

    .line 224
    invoke-virtual {v1, v0, v2}, Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;->cache(Ljava/lang/String;Lcom/itextpdf/layout/hyphenation/HyphenationTree;)V

    .line 227
    :cond_5
    return-object v2
.end method

.method public static getHyphenationTreeCache()Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;
    .locals 2

    .line 108
    sget-object v0, Lcom/itextpdf/layout/hyphenation/Hyphenator;->staticLock:Ljava/lang/Object;

    monitor-enter v0

    .line 109
    :try_start_0
    sget-object v1, Lcom/itextpdf/layout/hyphenation/Hyphenator;->hTreeCache:Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;

    if-nez v1, :cond_0

    .line 110
    new-instance v1, Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;

    invoke-direct {v1}, Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;-><init>()V

    sput-object v1, Lcom/itextpdf/layout/hyphenation/Hyphenator;->hTreeCache:Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;

    .line 112
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 113
    sget-object v0, Lcom/itextpdf/layout/hyphenation/Hyphenator;->hTreeCache:Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;

    return-object v0

    .line 112
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public static hyphenate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)Lcom/itextpdf/layout/hyphenation/Hyphenation;
    .locals 6
    .param p0, "lang"    # Ljava/lang/String;
    .param p1, "country"    # Ljava/lang/String;
    .param p2, "word"    # Ljava/lang/String;
    .param p3, "leftMin"    # I
    .param p4, "rightMin"    # I

    .line 314
    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    .end local p0    # "lang":Ljava/lang/String;
    .end local p1    # "country":Ljava/lang/String;
    .end local p2    # "word":Ljava/lang/String;
    .end local p3    # "leftMin":I
    .end local p4    # "rightMin":I
    .local v0, "lang":Ljava/lang/String;
    .local v1, "country":Ljava/lang/String;
    .local v3, "word":Ljava/lang/String;
    .local v4, "leftMin":I
    .local v5, "rightMin":I
    invoke-static/range {v0 .. v5}, Lcom/itextpdf/layout/hyphenation/Hyphenator;->hyphenate(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;II)Lcom/itextpdf/layout/hyphenation/Hyphenation;

    move-result-object p0

    return-object p0
.end method

.method public static hyphenate(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;II)Lcom/itextpdf/layout/hyphenation/Hyphenation;
    .locals 2
    .param p0, "lang"    # Ljava/lang/String;
    .param p1, "country"    # Ljava/lang/String;
    .param p3, "word"    # Ljava/lang/String;
    .param p4, "leftMin"    # I
    .param p5, "rightMin"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "II)",
            "Lcom/itextpdf/layout/hyphenation/Hyphenation;"
        }
    .end annotation

    .line 292
    .local p2, "hyphPathNames":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {p3}, Lcom/itextpdf/layout/hyphenation/Hyphenator;->wordContainsSoftHyphens(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 293
    invoke-static {p3, p4, p5}, Lcom/itextpdf/layout/hyphenation/Hyphenator;->hyphenateBasedOnSoftHyphens(Ljava/lang/String;II)Lcom/itextpdf/layout/hyphenation/Hyphenation;

    move-result-object v0

    return-object v0

    .line 295
    :cond_0
    const/4 v0, 0x0

    .line 296
    .local v0, "hTree":Lcom/itextpdf/layout/hyphenation/HyphenationTree;
    if-eqz p0, :cond_1

    .line 297
    invoke-static {p0, p1, p2}, Lcom/itextpdf/layout/hyphenation/Hyphenator;->getHyphenationTree(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Lcom/itextpdf/layout/hyphenation/HyphenationTree;

    move-result-object v0

    .line 299
    :cond_1
    if-eqz v0, :cond_2

    invoke-virtual {v0, p3, p4, p5}, Lcom/itextpdf/layout/hyphenation/HyphenationTree;->hyphenate(Ljava/lang/String;II)Lcom/itextpdf/layout/hyphenation/Hyphenation;

    move-result-object v1

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method

.method private static hyphenateBasedOnSoftHyphens(Ljava/lang/String;II)Lcom/itextpdf/layout/hyphenation/Hyphenation;
    .locals 9
    .param p0, "word"    # Ljava/lang/String;
    .param p1, "leftMin"    # I
    .param p2, "rightMin"    # I

    .line 332
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 333
    .local v0, "softHyphens":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v1, -0x1

    .line 335
    .local v1, "lastSoftHyphenIndex":I
    :goto_0
    add-int/lit8 v2, v1, 0x1

    const/16 v3, 0xad

    invoke-virtual {p0, v3, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    move v4, v2

    .local v4, "curSoftHyphenIndex":I
    if-lez v2, :cond_0

    .line 336
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 337
    move v1, v4

    goto :goto_0

    .line 339
    :cond_0
    const/4 v2, 0x0

    .local v2, "leftInd":I
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    .line 340
    .local v5, "rightInd":I
    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v6

    const-string v7, ""

    if-ge v2, v6, :cond_1

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    const/4 v8, 0x0

    invoke-virtual {p0, v8, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-static {v3}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v6, p1, :cond_1

    .line 341
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 343
    :cond_1
    :goto_2
    if-ltz v5, :cond_2

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    invoke-virtual {p0, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v3}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v6, p2, :cond_2

    .line 344
    add-int/lit8 v5, v5, -0x1

    goto :goto_2

    .line 346
    :cond_2
    if-gt v2, v5, :cond_4

    .line 347
    sub-int v3, v5, v2

    add-int/lit8 v3, v3, 0x1

    new-array v3, v3, [I

    .line 348
    .local v3, "hyphenationPoints":[I
    move v6, v2

    .local v6, "i":I
    :goto_3
    if-gt v6, v5, :cond_3

    .line 349
    sub-int v7, v6, v2

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    aput v8, v3, v7

    .line 348
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 351
    .end local v6    # "i":I
    :cond_3
    new-instance v6, Lcom/itextpdf/layout/hyphenation/Hyphenation;

    invoke-direct {v6, p0, v3}, Lcom/itextpdf/layout/hyphenation/Hyphenation;-><init>(Ljava/lang/String;[I)V

    return-object v6

    .line 353
    .end local v3    # "hyphenationPoints":[I
    :cond_4
    const/4 v3, 0x0

    return-object v3
.end method

.method public static registerAdditionalHyphenationFileDirectory(Ljava/lang/String;)V
    .locals 2
    .param p0, "directory"    # Ljava/lang/String;

    .line 94
    sget-object v0, Lcom/itextpdf/layout/hyphenation/Hyphenator;->staticLock:Ljava/lang/Object;

    monitor-enter v0

    .line 95
    :try_start_0
    sget-object v1, Lcom/itextpdf/layout/hyphenation/Hyphenator;->additionalHyphenationFileDirectories:Ljava/util/List;

    if-nez v1, :cond_0

    .line 96
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    sput-object v1, Lcom/itextpdf/layout/hyphenation/Hyphenator;->additionalHyphenationFileDirectories:Ljava/util/List;

    .line 98
    :cond_0
    sget-object v1, Lcom/itextpdf/layout/hyphenation/Hyphenator;->additionalHyphenationFileDirectories:Ljava/util/List;

    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    monitor-exit v0

    .line 100
    return-void

    .line 99
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private static wordContainsSoftHyphens(Ljava/lang/String;)Z
    .locals 1
    .param p0, "word"    # Ljava/lang/String;

    .line 328
    const/16 v0, 0xad

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public hyphenate(Ljava/lang/String;)Lcom/itextpdf/layout/hyphenation/Hyphenation;
    .locals 6
    .param p1, "word"    # Ljava/lang/String;

    .line 324
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/Hyphenator;->lang:Ljava/lang/String;

    iget-object v1, p0, Lcom/itextpdf/layout/hyphenation/Hyphenator;->country:Ljava/lang/String;

    iget-object v2, p0, Lcom/itextpdf/layout/hyphenation/Hyphenator;->hyphPathNames:Ljava/util/Map;

    iget v4, p0, Lcom/itextpdf/layout/hyphenation/Hyphenator;->leftMin:I

    iget v5, p0, Lcom/itextpdf/layout/hyphenation/Hyphenator;->rightMin:I

    move-object v3, p1

    .end local p1    # "word":Ljava/lang/String;
    .local v3, "word":Ljava/lang/String;
    invoke-static/range {v0 .. v5}, Lcom/itextpdf/layout/hyphenation/Hyphenator;->hyphenate(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;II)Lcom/itextpdf/layout/hyphenation/Hyphenation;

    move-result-object p1

    return-object p1
.end method
