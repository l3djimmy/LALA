.class public Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap;
.super Ljava/lang/Object;
.source "ConcurrentWeakMap.java"

# interfaces
.implements Ljava/util/Map;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Map<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field private final map:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "TK;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 37
    .local p0, "this":Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap;, "Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap<TK;TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap;->map:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 109
    .local p0, "this":Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap;, "Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap<TK;TV;>;"
    iget-object v0, p0, Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 110
    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;

    .line 61
    .local p0, "this":Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap;, "Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap<TK;TV;>;"
    iget-object v0, p0, Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .line 69
    .local p0, "this":Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap;, "Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap<TK;TV;>;"
    iget-object v0, p0, Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public entrySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 133
    .local p0, "this":Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap;, "Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap<TK;TV;>;"
    iget-object v0, p0, Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .line 77
    .local p0, "this":Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap;, "Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap<TK;TV;>;"
    iget-object v0, p0, Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 53
    .local p0, "this":Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap;, "Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap<TK;TV;>;"
    iget-object v0, p0, Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public keySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "TK;>;"
        }
    .end annotation

    .line 117
    .local p0, "this":Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap;, "Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap<TK;TV;>;"
    iget-object v0, p0, Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .line 85
    .local p0, "this":Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap;, "Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    iget-object v0, p0, Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap;->map:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "+TK;+TV;>;)V"
        }
    .end annotation

    .line 101
    .local p0, "this":Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap;, "Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap<TK;TV;>;"
    .local p1, "m":Ljava/util/Map;, "Ljava/util/Map<+TK;+TV;>;"
    iget-object v0, p0, Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 102
    return-void
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .line 93
    .local p0, "this":Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap;, "Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap<TK;TV;>;"
    iget-object v0, p0, Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public size()I
    .locals 1

    .line 45
    .local p0, "this":Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap;, "Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap<TK;TV;>;"
    iget-object v0, p0, Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public values()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "TV;>;"
        }
    .end annotation

    .line 125
    .local p0, "this":Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap;, "Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap<TK;TV;>;"
    iget-object v0, p0, Lcom/itextpdf/commons/datastructures/ConcurrentWeakMap;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method
