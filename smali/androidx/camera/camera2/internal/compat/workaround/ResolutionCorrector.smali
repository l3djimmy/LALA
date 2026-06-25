.class public Landroidx/camera/camera2/internal/compat/workaround/ResolutionCorrector;
.super Ljava/lang/Object;
.source "ResolutionCorrector.java"


# instance fields
.field private final mExtraCroppingQuirk:Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 46
    const-class v0, Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk;

    invoke-static {v0}, Landroidx/camera/camera2/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v0

    check-cast v0, Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk;

    invoke-direct {p0, v0}, Landroidx/camera/camera2/internal/compat/workaround/ResolutionCorrector;-><init>(Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk;)V

    .line 47
    return-void
.end method

.method constructor <init>(Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk;)V
    .locals 0
    .param p1, "extraCroppingQuirk"    # Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk;

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-object p1, p0, Landroidx/camera/camera2/internal/compat/workaround/ResolutionCorrector;->mExtraCroppingQuirk:Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk;

    .line 55
    return-void
.end method


# virtual methods
.method public insertOrPrioritize(Landroidx/camera/core/impl/SurfaceConfig$ConfigType;Ljava/util/List;)Ljava/util/List;
    .locals 5
    .param p1, "configType"    # Landroidx/camera/core/impl/SurfaceConfig$ConfigType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/SurfaceConfig$ConfigType;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 72
    .local p2, "supportedResolutions":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/workaround/ResolutionCorrector;->mExtraCroppingQuirk:Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk;

    if-nez v0, :cond_0

    .line 73
    return-object p2

    .line 75
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/workaround/ResolutionCorrector;->mExtraCroppingQuirk:Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk;

    invoke-virtual {v0, p1}, Landroidx/camera/camera2/internal/compat/quirk/ExtraCroppingQuirk;->getVerifiedResolution(Landroidx/camera/core/impl/SurfaceConfig$ConfigType;)Landroid/util/Size;

    move-result-object v0

    .line 76
    .local v0, "selectResolution":Landroid/util/Size;
    if-nez v0, :cond_1

    .line 77
    return-object p2

    .line 79
    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 80
    .local v1, "newResolutions":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 81
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/Size;

    .line 82
    .local v3, "size":Landroid/util/Size;
    invoke-virtual {v3, v0}, Landroid/util/Size;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 83
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    .end local v3    # "size":Landroid/util/Size;
    :cond_2
    goto :goto_0

    .line 86
    :cond_3
    return-object v1
.end method
