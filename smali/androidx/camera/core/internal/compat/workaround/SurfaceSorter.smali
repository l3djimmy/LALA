.class public Landroidx/camera/core/internal/compat/workaround/SurfaceSorter;
.super Ljava/lang/Object;
.source "SurfaceSorter.java"


# static fields
.field private static final PRIORITY_MEDIA_CODEC_SURFACE:I = 0x2

.field private static final PRIORITY_OTHERS:I = 0x1

.field private static final PRIORITY_PREVIEW_SURFACE:I


# instance fields
.field private final mHasQuirk:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    const-class v0, Landroidx/camera/core/internal/compat/quirk/SurfaceOrderQuirk;

    invoke-static {v0}, Landroidx/camera/core/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Landroidx/camera/core/internal/compat/workaround/SurfaceSorter;->mHasQuirk:Z

    return-void
.end method

.method private getSurfacePriority(Landroidx/camera/core/impl/DeferrableSurface;)I
    .locals 2
    .param p1, "surface"    # Landroidx/camera/core/impl/DeferrableSurface;

    .line 64
    invoke-virtual {p1}, Landroidx/camera/core/impl/DeferrableSurface;->getContainerClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Landroid/media/MediaCodec;

    if-ne v0, v1, :cond_0

    .line 65
    const/4 v0, 0x2

    return v0

    .line 66
    :cond_0
    invoke-virtual {p1}, Landroidx/camera/core/impl/DeferrableSurface;->getContainerClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Landroidx/camera/core/Preview;

    if-ne v0, v1, :cond_1

    .line 67
    const/4 v0, 0x0

    return v0

    .line 69
    :cond_1
    const/4 v0, 0x1

    return v0
.end method


# virtual methods
.method synthetic lambda$sort$0$androidx-camera-core-internal-compat-workaround-SurfaceSorter(Landroidx/camera/core/impl/SessionConfig$OutputConfig;Landroidx/camera/core/impl/SessionConfig$OutputConfig;)I
    .locals 3
    .param p1, "outputConfig1"    # Landroidx/camera/core/impl/SessionConfig$OutputConfig;
    .param p2, "outputConfig2"    # Landroidx/camera/core/impl/SessionConfig$OutputConfig;

    .line 57
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v0

    invoke-direct {p0, v0}, Landroidx/camera/core/internal/compat/workaround/SurfaceSorter;->getSurfacePriority(Landroidx/camera/core/impl/DeferrableSurface;)I

    move-result v0

    .line 58
    .local v0, "p1":I
    invoke-virtual {p2}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v1

    invoke-direct {p0, v1}, Landroidx/camera/core/internal/compat/workaround/SurfaceSorter;->getSurfacePriority(Landroidx/camera/core/impl/DeferrableSurface;)I

    move-result v1

    .line 59
    .local v1, "p2":I
    sub-int v2, v0, v1

    return v2
.end method

.method public sort(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SessionConfig$OutputConfig;",
            ">;)V"
        }
    .end annotation

    .line 53
    .local p1, "outputConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SessionConfig$OutputConfig;>;"
    iget-boolean v0, p0, Landroidx/camera/core/internal/compat/workaround/SurfaceSorter;->mHasQuirk:Z

    if-nez v0, :cond_0

    .line 54
    return-void

    .line 56
    :cond_0
    new-instance v0, Landroidx/camera/core/internal/compat/workaround/SurfaceSorter$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Landroidx/camera/core/internal/compat/workaround/SurfaceSorter$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/core/internal/compat/workaround/SurfaceSorter;)V

    invoke-static {p1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 61
    return-void
.end method
