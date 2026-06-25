.class public Landroidx/camera/camera2/internal/compat/workaround/ForceCloseDeferrableSurface;
.super Ljava/lang/Object;
.source "ForceCloseDeferrableSurface.java"


# instance fields
.field private final mHasConfigureSurfaceToSecondarySessionFailQuirk:Z

.field private final mHasPreviewOrientationIncorrectQuirk:Z

.field private final mHasTextureViewIsClosedQuirk:Z


# direct methods
.method public constructor <init>(Landroidx/camera/core/impl/Quirks;Landroidx/camera/core/impl/Quirks;)V
    .locals 1
    .param p1, "cameraQuirks"    # Landroidx/camera/core/impl/Quirks;
    .param p2, "deviceQuirks"    # Landroidx/camera/core/impl/Quirks;

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    const-class v0, Landroidx/camera/camera2/internal/compat/quirk/TextureViewIsClosedQuirk;

    invoke-virtual {p2, v0}, Landroidx/camera/core/impl/Quirks;->contains(Ljava/lang/Class;)Z

    move-result v0

    iput-boolean v0, p0, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseDeferrableSurface;->mHasTextureViewIsClosedQuirk:Z

    .line 52
    const-class v0, Landroidx/camera/camera2/internal/compat/quirk/PreviewOrientationIncorrectQuirk;

    invoke-virtual {p1, v0}, Landroidx/camera/core/impl/Quirks;->contains(Ljava/lang/Class;)Z

    move-result v0

    iput-boolean v0, p0, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseDeferrableSurface;->mHasPreviewOrientationIncorrectQuirk:Z

    .line 54
    const-class v0, Landroidx/camera/camera2/internal/compat/quirk/ConfigureSurfaceToSecondarySessionFailQuirk;

    .line 55
    invoke-virtual {p1, v0}, Landroidx/camera/core/impl/Quirks;->contains(Ljava/lang/Class;)Z

    move-result v0

    iput-boolean v0, p0, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseDeferrableSurface;->mHasConfigureSurfaceToSecondarySessionFailQuirk:Z

    .line 56
    return-void
.end method


# virtual methods
.method public onSessionEnd(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            ">;)V"
        }
    .end annotation

    .line 72
    .local p1, "deferrableSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/DeferrableSurface;>;"
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseDeferrableSurface;->shouldForceClose()Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p1, :cond_1

    .line 73
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/DeferrableSurface;

    .line 74
    .local v1, "deferrableSurface":Landroidx/camera/core/impl/DeferrableSurface;
    invoke-virtual {v1}, Landroidx/camera/core/impl/DeferrableSurface;->close()V

    .line 75
    .end local v1    # "deferrableSurface":Landroidx/camera/core/impl/DeferrableSurface;
    goto :goto_0

    .line 76
    :cond_0
    const-string v0, "ForceCloseDeferrableSurface"

    const-string/jumbo v1, "deferrableSurface closed"

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    :cond_1
    return-void
.end method

.method public shouldForceClose()Z
    .locals 1

    .line 63
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseDeferrableSurface;->mHasTextureViewIsClosedQuirk:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseDeferrableSurface;->mHasPreviewOrientationIncorrectQuirk:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseDeferrableSurface;->mHasConfigureSurfaceToSecondarySessionFailQuirk:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method
