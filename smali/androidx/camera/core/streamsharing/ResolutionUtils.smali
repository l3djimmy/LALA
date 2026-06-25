.class Landroidx/camera/core/streamsharing/ResolutionUtils;
.super Ljava/lang/Object;
.source "ResolutionUtils.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    return-void
.end method

.method static getMergedResolutions(Ljava/util/List;Landroid/util/Size;Ljava/util/Set;)Ljava/util/List;
    .locals 4
    .param p1, "sensorSize"    # Landroid/util/Size;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;",
            "Landroid/util/Size;",
            "Ljava/util/Set<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 54
    .local p0, "supportedResolutions":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .local p2, "useCaseConfigs":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/UseCaseConfig;

    .line 55
    .local v1, "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    sget-object v2, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_CUSTOM_ORDERED_RESOLUTIONS:Landroidx/camera/core/impl/Config$Option;

    .line 56
    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 57
    .local v2, "customOrderedResolutions":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    if-eqz v2, :cond_0

    .line 58
    return-object v2

    .line 60
    .end local v1    # "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    .end local v2    # "customOrderedResolutions":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :cond_0
    goto :goto_0

    .line 61
    :cond_1
    return-object p0
.end method
