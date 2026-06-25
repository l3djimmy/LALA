.class public final Ldagger/internal/MapLazyFactory;
.super Ldagger/internal/AbstractMapFactory;
.source "MapLazyFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ldagger/internal/MapLazyFactory$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ldagger/internal/AbstractMapFactory<",
        "TK;TV;",
        "Ldagger/Lazy<",
        "TV;>;>;"
    }
.end annotation


# static fields
.field private static final EMPTY:Ldagger/internal/Provider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ldagger/internal/Provider<",
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 34
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    invoke-static {v0}, Ldagger/internal/InstanceFactory;->create(Ljava/lang/Object;)Ldagger/internal/Factory;

    move-result-object v0

    sput-object v0, Ldagger/internal/MapLazyFactory;->EMPTY:Ldagger/internal/Provider;

    .line 33
    return-void
.end method

.method private constructor <init>(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "map"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "TK;",
            "Ldagger/internal/Provider<",
            "TV;>;>;)V"
        }
    .end annotation

    .line 48
    .local p0, "this":Ldagger/internal/MapLazyFactory;, "Ldagger/internal/MapLazyFactory<TK;TV;>;"
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<TK;Ldagger/internal/Provider<TV;>;>;"
    invoke-direct {p0, p1}, Ldagger/internal/AbstractMapFactory;-><init>(Ljava/util/Map;)V

    .line 49
    return-void
.end method

.method synthetic constructor <init>(Ljava/util/Map;Ldagger/internal/MapLazyFactory$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/util/Map;
    .param p2, "x1"    # Ldagger/internal/MapLazyFactory$1;

    .line 32
    .local p0, "this":Ldagger/internal/MapLazyFactory;, "Ldagger/internal/MapLazyFactory<TK;TV;>;"
    invoke-direct {p0, p1}, Ldagger/internal/MapLazyFactory;-><init>(Ljava/util/Map;)V

    return-void
.end method

.method public static builder(I)Ldagger/internal/MapLazyFactory$Builder;
    .locals 2
    .param p0, "size"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "size"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(I)",
            "Ldagger/internal/MapLazyFactory$Builder<",
            "TK;TV;>;"
        }
    .end annotation

    .line 38
    new-instance v0, Ldagger/internal/MapLazyFactory$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Ldagger/internal/MapLazyFactory$Builder;-><init>(ILdagger/internal/MapLazyFactory$1;)V

    return-object v0
.end method

.method public static emptyMapProvider()Ldagger/internal/Provider;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">()",
            "Ldagger/internal/Provider<",
            "Ljava/util/Map<",
            "TK;",
            "Ldagger/Lazy<",
            "TV;>;>;>;"
        }
    .end annotation

    .line 44
    sget-object v0, Ldagger/internal/MapLazyFactory;->EMPTY:Ldagger/internal/Provider;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1

    .line 32
    .local p0, "this":Ldagger/internal/MapLazyFactory;, "Ldagger/internal/MapLazyFactory<TK;TV;>;"
    invoke-virtual {p0}, Ldagger/internal/MapLazyFactory;->get()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public get()Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "TK;",
            "Ldagger/Lazy<",
            "TV;>;>;"
        }
    .end annotation

    .line 57
    .local p0, "this":Ldagger/internal/MapLazyFactory;, "Ldagger/internal/MapLazyFactory<TK;TV;>;"
    invoke-virtual {p0}, Ldagger/internal/MapLazyFactory;->contributingMap()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    invoke-static {v0}, Ldagger/internal/DaggerCollections;->newLinkedHashMapWithExpectedSize(I)Ljava/util/LinkedHashMap;

    move-result-object v0

    .line 58
    .local v0, "result":Ljava/util/Map;, "Ljava/util/Map<TK;Ldagger/Lazy<TV;>;>;"
    invoke-virtual {p0}, Ldagger/internal/MapLazyFactory;->contributingMap()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 59
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;Ldagger/internal/Provider<TV;>;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ldagger/internal/Provider;

    invoke-static {v4}, Ldagger/internal/DoubleCheck;->lazy(Ldagger/internal/Provider;)Ldagger/Lazy;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;Ldagger/internal/Provider<TV;>;>;"
    goto :goto_0

    .line 61
    :cond_0
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    return-object v1
.end method
