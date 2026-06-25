.class public Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;
.super Ljava/lang/Object;
.source "HyphenationTreeCache.java"


# instance fields
.field private hyphenTrees:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/itextpdf/layout/hyphenation/HyphenationTree;",
            ">;"
        }
    .end annotation
.end field

.field private missingHyphenationTrees:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;->hyphenTrees:Ljava/util/Map;

    return-void
.end method

.method public static constructLlccKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "lang"    # Ljava/lang/String;
    .param p1, "country"    # Ljava/lang/String;

    .line 66
    move-object v0, p0

    .line 68
    .local v0, "key":Ljava/lang/String;
    if-eqz p1, :cond_0

    const-string/jumbo v1, "none"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 69
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 71
    :cond_0
    return-object v0
.end method

.method public static constructUserKey(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    .locals 4
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
            "Ljava/lang/String;"
        }
    .end annotation

    .line 83
    .local p2, "hyphPatNames":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v0, 0x0

    .line 84
    .local v0, "userKey":Ljava/lang/String;
    if-eqz p2, :cond_0

    .line 85
    invoke-static {p0, p1}, Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;->constructLlccKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 86
    .local v1, "key":Ljava/lang/String;
    const/16 v2, 0x5f

    const/16 v3, 0x2d

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    .line 87
    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Ljava/lang/String;

    .line 89
    .end local v1    # "key":Ljava/lang/String;
    :cond_0
    return-object v0
.end method


# virtual methods
.method public cache(Ljava/lang/String;Lcom/itextpdf/layout/hyphenation/HyphenationTree;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "hTree"    # Lcom/itextpdf/layout/hyphenation/HyphenationTree;

    .line 98
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;->hyphenTrees:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    return-void
.end method

.method public getHyphenationTree(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/layout/hyphenation/HyphenationTree;
    .locals 4
    .param p1, "lang"    # Ljava/lang/String;
    .param p2, "country"    # Ljava/lang/String;

    .line 43
    invoke-static {p1, p2}, Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;->constructLlccKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 45
    .local v0, "key":Ljava/lang/String;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 46
    return-object v1

    .line 50
    :cond_0
    iget-object v2, p0, Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;->hyphenTrees:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    .line 52
    iget-object v3, p0, Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;->hyphenTrees:Ljava/util/Map;

    .line 50
    if-eqz v2, :cond_1

    .line 51
    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/hyphenation/HyphenationTree;

    return-object v1

    .line 52
    :cond_1
    invoke-interface {v3, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 53
    iget-object v1, p0, Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;->hyphenTrees:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/hyphenation/HyphenationTree;

    return-object v1

    .line 55
    :cond_2
    return-object v1
.end method

.method public isMissing(Ljava/lang/String;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .line 122
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;->missingHyphenationTrees:Ljava/util/Set;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;->missingHyphenationTrees:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public noteMissing(Ljava/lang/String;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .line 108
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;->missingHyphenationTrees:Ljava/util/Set;

    if-nez v0, :cond_0

    .line 109
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;->missingHyphenationTrees:Ljava/util/Set;

    .line 111
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/HyphenationTreeCache;->missingHyphenationTrees:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 112
    return-void
.end method
