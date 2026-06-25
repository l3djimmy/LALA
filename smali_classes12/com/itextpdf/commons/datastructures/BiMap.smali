.class public final Lcom/itextpdf/commons/datastructures/BiMap;
.super Ljava/lang/Object;
.source "BiMap.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final inverseMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "TV;TK;>;"
        }
    .end annotation
.end field

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

    .line 42
    .local p0, "this":Lcom/itextpdf/commons/datastructures/BiMap;, "Lcom/itextpdf/commons/datastructures/BiMap<TK;TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/commons/datastructures/BiMap;->map:Ljava/util/Map;

    .line 37
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/commons/datastructures/BiMap;->inverseMap:Ljava/util/Map;

    .line 44
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 120
    .local p0, "this":Lcom/itextpdf/commons/datastructures/BiMap;, "Lcom/itextpdf/commons/datastructures/BiMap<TK;TV;>;"
    iget-object v0, p0, Lcom/itextpdf/commons/datastructures/BiMap;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 121
    iget-object v0, p0, Lcom/itextpdf/commons/datastructures/BiMap;->inverseMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 122
    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)Z"
        }
    .end annotation

    .line 142
    .local p0, "this":Lcom/itextpdf/commons/datastructures/BiMap;, "Lcom/itextpdf/commons/datastructures/BiMap<TK;TV;>;"
    .local p1, "k":Ljava/lang/Object;, "TK;"
    iget-object v0, p0, Lcom/itextpdf/commons/datastructures/BiMap;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)Z"
        }
    .end annotation

    .line 153
    .local p0, "this":Lcom/itextpdf/commons/datastructures/BiMap;, "Lcom/itextpdf/commons/datastructures/BiMap<TK;TV;>;"
    .local p1, "v":Ljava/lang/Object;, "TV;"
    iget-object v0, p0, Lcom/itextpdf/commons/datastructures/BiMap;->inverseMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public getByKey(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    .line 69
    .local p0, "this":Lcom/itextpdf/commons/datastructures/BiMap;, "Lcom/itextpdf/commons/datastructures/BiMap<TK;TV;>;"
    .local p1, "value":Ljava/lang/Object;, "TK;"
    iget-object v0, p0, Lcom/itextpdf/commons/datastructures/BiMap;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getByValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)TK;"
        }
    .end annotation

    .line 80
    .local p0, "this":Lcom/itextpdf/commons/datastructures/BiMap;, "Lcom/itextpdf/commons/datastructures/BiMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TV;"
    iget-object v0, p0, Lcom/itextpdf/commons/datastructures/BiMap;->inverseMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 130
    .local p0, "this":Lcom/itextpdf/commons/datastructures/BiMap;, "Lcom/itextpdf/commons/datastructures/BiMap<TK;TV;>;"
    iget-object v0, p0, Lcom/itextpdf/commons/datastructures/BiMap;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)V"
        }
    .end annotation

    .line 57
    .local p0, "this":Lcom/itextpdf/commons/datastructures/BiMap;, "Lcom/itextpdf/commons/datastructures/BiMap<TK;TV;>;"
    .local p1, "k":Ljava/lang/Object;, "TK;"
    .local p2, "v":Ljava/lang/Object;, "TV;"
    iget-object v0, p0, Lcom/itextpdf/commons/datastructures/BiMap;->map:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    iget-object v0, p0, Lcom/itextpdf/commons/datastructures/BiMap;->inverseMap:Ljava/util/Map;

    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    return-void
.end method

.method public removeByKey(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)V"
        }
    .end annotation

    .line 89
    .local p0, "this":Lcom/itextpdf/commons/datastructures/BiMap;, "Lcom/itextpdf/commons/datastructures/BiMap<TK;TV;>;"
    .local p1, "k":Ljava/lang/Object;, "TK;"
    iget-object v0, p0, Lcom/itextpdf/commons/datastructures/BiMap;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 90
    .local v0, "v":Ljava/lang/Object;, "TV;"
    if-eqz v0, :cond_0

    .line 91
    iget-object v1, p0, Lcom/itextpdf/commons/datastructures/BiMap;->inverseMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    :cond_0
    return-void
.end method

.method public removeByValue(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .line 101
    .local p0, "this":Lcom/itextpdf/commons/datastructures/BiMap;, "Lcom/itextpdf/commons/datastructures/BiMap<TK;TV;>;"
    .local p1, "v":Ljava/lang/Object;, "TV;"
    iget-object v0, p0, Lcom/itextpdf/commons/datastructures/BiMap;->inverseMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 102
    .local v0, "k":Ljava/lang/Object;, "TK;"
    if-eqz v0, :cond_0

    .line 103
    iget-object v1, p0, Lcom/itextpdf/commons/datastructures/BiMap;->map:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    :cond_0
    return-void
.end method

.method public size()I
    .locals 1

    .line 113
    .local p0, "this":Lcom/itextpdf/commons/datastructures/BiMap;, "Lcom/itextpdf/commons/datastructures/BiMap<TK;TV;>;"
    iget-object v0, p0, Lcom/itextpdf/commons/datastructures/BiMap;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method
