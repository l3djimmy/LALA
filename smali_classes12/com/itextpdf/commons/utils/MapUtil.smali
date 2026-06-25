.class public final Lcom/itextpdf/commons/utils/MapUtil;
.super Ljava/lang/Object;
.source "MapUtil.java"


# static fields
.field private static final HASH_MULTIPLIER:I = 0x1f


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static equals(Ljava/util/Map;Ljava/util/Map;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map<",
            "TK;TV;>;",
            "Ljava/util/Map<",
            "TK;TV;>;)Z"
        }
    .end annotation

    .line 51
    .local p0, "m1":Ljava/util/Map;, "Ljava/util/Map<TK;TV;>;"
    .local p1, "m2":Ljava/util/Map;, "Ljava/util/Map<TK;TV;>;"
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    .line 52
    return v0

    .line 54
    :cond_0
    const/4 v1, 0x0

    if-eqz p0, :cond_7

    if-nez p1, :cond_1

    goto :goto_2

    .line 58
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 59
    return v1

    .line 62
    :cond_2
    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v2

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v3

    if-eq v2, v3, :cond_3

    .line 63
    return v1

    .line 66
    :cond_3
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 67
    .local v3, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;TV;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    .line 68
    .local v4, "obj1":Ljava/lang/Object;, "TV;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {p1, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 69
    .local v5, "obj2":Ljava/lang/Object;, "TV;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    invoke-interface {p1, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-static {v4, v5}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_4

    goto :goto_1

    .line 72
    .end local v3    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;TV;>;"
    .end local v4    # "obj1":Ljava/lang/Object;, "TV;"
    .end local v5    # "obj2":Ljava/lang/Object;, "TV;"
    :cond_4
    goto :goto_0

    .line 70
    .restart local v3    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;TV;>;"
    .restart local v4    # "obj1":Ljava/lang/Object;, "TV;"
    .restart local v5    # "obj2":Ljava/lang/Object;, "TV;"
    :cond_5
    :goto_1
    return v1

    .line 74
    .end local v3    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;TV;>;"
    .end local v4    # "obj1":Ljava/lang/Object;, "TV;"
    .end local v5    # "obj2":Ljava/lang/Object;, "TV;"
    :cond_6
    return v0

    .line 55
    :cond_7
    :goto_2
    return v1
.end method

.method public static getHashCode(Ljava/util/Map;)I
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map<",
            "TK;TV;>;)I"
        }
    .end annotation

    .line 111
    .local p0, "m1":Ljava/util/Map;, "Ljava/util/Map<TK;TV;>;"
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 112
    return v0

    .line 115
    :cond_0
    const/4 v1, 0x0

    .line 116
    .local v1, "hash":I
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 117
    .local v3, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;TV;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    .line 118
    .local v4, "key":Ljava/lang/Object;, "TK;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    .line 119
    .local v5, "value":Ljava/lang/Object;, "TV;"
    mul-int/lit8 v6, v1, 0x1f

    if-nez v4, :cond_1

    move v7, v0

    goto :goto_1

    :cond_1
    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    move-result v7

    :goto_1
    add-int/2addr v6, v7

    .line 120
    .end local v1    # "hash":I
    .local v6, "hash":I
    mul-int/lit8 v1, v6, 0x1f

    if-nez v5, :cond_2

    move v7, v0

    goto :goto_2

    :cond_2
    invoke-virtual {v5}, Ljava/lang/Object;->hashCode()I

    move-result v7

    :goto_2
    add-int/2addr v1, v7

    .line 121
    .end local v3    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;TV;>;"
    .end local v4    # "key":Ljava/lang/Object;, "TK;"
    .end local v5    # "value":Ljava/lang/Object;, "TV;"
    .end local v6    # "hash":I
    .restart local v1    # "hash":I
    goto :goto_0

    .line 123
    :cond_3
    return v1
.end method

.method public static merge(Ljava/util/Map;Ljava/util/Map;Ljava/util/function/BiFunction;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map<",
            "TK;TV;>;",
            "Ljava/util/Map<",
            "TK;TV;>;",
            "Ljava/util/function/BiFunction<",
            "TV;TV;TV;>;)V"
        }
    .end annotation

    .line 88
    .local p0, "destination":Ljava/util/Map;, "Ljava/util/Map<TK;TV;>;"
    .local p1, "source":Ljava/util/Map;, "Ljava/util/Map<TK;TV;>;"
    .local p2, "valuesMerger":Ljava/util/function/BiFunction;, "Ljava/util/function/BiFunction<TV;TV;TV;>;"
    if-ne p0, p1, :cond_0

    .line 89
    return-void

    .line 91
    :cond_0
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

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

    .line 92
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;TV;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {p0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 93
    .local v2, "value":Ljava/lang/Object;, "TV;"
    if-nez v2, :cond_1

    .line 94
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {p0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 96
    :cond_1
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {p2, v2, v4}, Ljava/util/function/BiFunction;->apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {p0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;TV;>;"
    .end local v2    # "value":Ljava/lang/Object;, "TV;"
    :goto_1
    goto :goto_0

    .line 99
    :cond_2
    return-void
.end method

.method public static putIfNotNull(Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map<",
            "TK;TV;>;TK;TV;)V"
        }
    .end annotation

    .line 136
    .local p0, "map":Ljava/util/Map;, "Ljava/util/Map<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    if-eqz p2, :cond_0

    .line 137
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    :cond_0
    return-void
.end method
