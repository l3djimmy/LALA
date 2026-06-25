.class public final Ldagger/internal/MapLazyFactory$Builder;
.super Ldagger/internal/AbstractMapFactory$Builder;
.source "MapLazyFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ldagger/internal/MapLazyFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ldagger/internal/AbstractMapFactory$Builder<",
        "TK;TV;",
        "Ldagger/Lazy<",
        "TV;>;>;"
    }
.end annotation


# direct methods
.method private constructor <init>(I)V
    .locals 0
    .param p1, "size"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "size"
        }
    .end annotation

    .line 67
    .local p0, "this":Ldagger/internal/MapLazyFactory$Builder;, "Ldagger/internal/MapLazyFactory$Builder<TK;TV;>;"
    invoke-direct {p0, p1}, Ldagger/internal/AbstractMapFactory$Builder;-><init>(I)V

    .line 68
    return-void
.end method

.method synthetic constructor <init>(ILdagger/internal/MapLazyFactory$1;)V
    .locals 0
    .param p1, "x0"    # I
    .param p2, "x1"    # Ldagger/internal/MapLazyFactory$1;

    .line 65
    .local p0, "this":Ldagger/internal/MapLazyFactory$Builder;, "Ldagger/internal/MapLazyFactory$Builder<TK;TV;>;"
    invoke-direct {p0, p1}, Ldagger/internal/MapLazyFactory$Builder;-><init>(I)V

    return-void
.end method


# virtual methods
.method public build()Ldagger/internal/MapLazyFactory;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ldagger/internal/MapLazyFactory<",
            "TK;TV;>;"
        }
    .end annotation

    .line 102
    .local p0, "this":Ldagger/internal/MapLazyFactory$Builder;, "Ldagger/internal/MapLazyFactory$Builder<TK;TV;>;"
    new-instance v0, Ldagger/internal/MapLazyFactory;

    iget-object v1, p0, Ldagger/internal/MapLazyFactory$Builder;->map:Ljava/util/LinkedHashMap;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ldagger/internal/MapLazyFactory;-><init>(Ljava/util/Map;Ldagger/internal/MapLazyFactory$1;)V

    return-object v0
.end method

.method public bridge synthetic put(Ljava/lang/Object;Ldagger/internal/Provider;)Ldagger/internal/AbstractMapFactory$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "key",
            "providerOfValue"
        }
    .end annotation

    .line 65
    .local p0, "this":Ldagger/internal/MapLazyFactory$Builder;, "Ldagger/internal/MapLazyFactory$Builder<TK;TV;>;"
    invoke-virtual {p0, p1, p2}, Ldagger/internal/MapLazyFactory$Builder;->put(Ljava/lang/Object;Ldagger/internal/Provider;)Ldagger/internal/MapLazyFactory$Builder;

    move-result-object p1

    return-object p1
.end method

.method public put(Ljava/lang/Object;Ldagger/internal/Provider;)Ldagger/internal/MapLazyFactory$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "key",
            "providerOfValue"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ldagger/internal/Provider<",
            "TV;>;)",
            "Ldagger/internal/MapLazyFactory$Builder<",
            "TK;TV;>;"
        }
    .end annotation

    .line 72
    .local p0, "this":Ldagger/internal/MapLazyFactory$Builder;, "Ldagger/internal/MapLazyFactory$Builder<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "providerOfValue":Ldagger/internal/Provider;, "Ldagger/internal/Provider<TV;>;"
    invoke-super {p0, p1, p2}, Ldagger/internal/AbstractMapFactory$Builder;->put(Ljava/lang/Object;Ldagger/internal/Provider;)Ldagger/internal/AbstractMapFactory$Builder;

    .line 73
    return-object p0
.end method

.method public put(Ljava/lang/Object;Ljavax/inject/Provider;)Ldagger/internal/MapLazyFactory$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "key",
            "providerOfValue"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ljavax/inject/Provider<",
            "TV;>;)",
            "Ldagger/internal/MapLazyFactory$Builder<",
            "TK;TV;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 82
    .local p0, "this":Ldagger/internal/MapLazyFactory$Builder;, "Ldagger/internal/MapLazyFactory$Builder<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "providerOfValue":Ljavax/inject/Provider;, "Ljavax/inject/Provider<TV;>;"
    invoke-static {p2}, Ldagger/internal/Providers;->asDaggerProvider(Ljavax/inject/Provider;)Ldagger/internal/Provider;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Ldagger/internal/MapLazyFactory$Builder;->put(Ljava/lang/Object;Ldagger/internal/Provider;)Ldagger/internal/MapLazyFactory$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic putAll(Ldagger/internal/Provider;)Ldagger/internal/AbstractMapFactory$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "mapFactory"
        }
    .end annotation

    .line 65
    .local p0, "this":Ldagger/internal/MapLazyFactory$Builder;, "Ldagger/internal/MapLazyFactory$Builder<TK;TV;>;"
    invoke-virtual {p0, p1}, Ldagger/internal/MapLazyFactory$Builder;->putAll(Ldagger/internal/Provider;)Ldagger/internal/MapLazyFactory$Builder;

    move-result-object p1

    return-object p1
.end method

.method public putAll(Ldagger/internal/Provider;)Ldagger/internal/MapLazyFactory$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "mapFactory"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ldagger/internal/Provider<",
            "Ljava/util/Map<",
            "TK;",
            "Ldagger/Lazy<",
            "TV;>;>;>;)",
            "Ldagger/internal/MapLazyFactory$Builder<",
            "TK;TV;>;"
        }
    .end annotation

    .line 87
    .local p0, "this":Ldagger/internal/MapLazyFactory$Builder;, "Ldagger/internal/MapLazyFactory$Builder<TK;TV;>;"
    .local p1, "mapFactory":Ldagger/internal/Provider;, "Ldagger/internal/Provider<Ljava/util/Map<TK;Ldagger/Lazy<TV;>;>;>;"
    invoke-super {p0, p1}, Ldagger/internal/AbstractMapFactory$Builder;->putAll(Ldagger/internal/Provider;)Ldagger/internal/AbstractMapFactory$Builder;

    .line 88
    return-object p0
.end method

.method public putAll(Ljavax/inject/Provider;)Ldagger/internal/MapLazyFactory$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "mapFactory"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavax/inject/Provider<",
            "Ljava/util/Map<",
            "TK;",
            "Ldagger/Lazy<",
            "TV;>;>;>;)",
            "Ldagger/internal/MapLazyFactory$Builder<",
            "TK;TV;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 97
    .local p0, "this":Ldagger/internal/MapLazyFactory$Builder;, "Ldagger/internal/MapLazyFactory$Builder<TK;TV;>;"
    .local p1, "mapFactory":Ljavax/inject/Provider;, "Ljavax/inject/Provider<Ljava/util/Map<TK;Ldagger/Lazy<TV;>;>;>;"
    invoke-static {p1}, Ldagger/internal/Providers;->asDaggerProvider(Ljavax/inject/Provider;)Ldagger/internal/Provider;

    move-result-object v0

    invoke-virtual {p0, v0}, Ldagger/internal/MapLazyFactory$Builder;->putAll(Ldagger/internal/Provider;)Ldagger/internal/MapLazyFactory$Builder;

    move-result-object v0

    return-object v0
.end method
