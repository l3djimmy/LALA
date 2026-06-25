.class public abstract Landroidx/camera/core/internal/ImmutableZoomState;
.super Ljava/lang/Object;
.source "ImmutableZoomState.java"

# interfaces
.implements Landroidx/camera/core/ZoomState;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(FFFF)Landroidx/camera/core/ZoomState;
    .locals 1
    .param p0, "zoomRatio"    # F
    .param p1, "maxZoomRatio"    # F
    .param p2, "minZoomRatio"    # F
    .param p3, "linearZoom"    # F

    .line 35
    new-instance v0, Landroidx/camera/core/internal/AutoValue_ImmutableZoomState;

    invoke-direct {v0, p0, p1, p2, p3}, Landroidx/camera/core/internal/AutoValue_ImmutableZoomState;-><init>(FFFF)V

    return-object v0
.end method

.method public static create(Landroidx/camera/core/ZoomState;)Landroidx/camera/core/ZoomState;
    .locals 5
    .param p0, "zoomState"    # Landroidx/camera/core/ZoomState;

    .line 41
    new-instance v0, Landroidx/camera/core/internal/AutoValue_ImmutableZoomState;

    invoke-interface {p0}, Landroidx/camera/core/ZoomState;->getZoomRatio()F

    move-result v1

    .line 42
    invoke-interface {p0}, Landroidx/camera/core/ZoomState;->getMaxZoomRatio()F

    move-result v2

    .line 43
    invoke-interface {p0}, Landroidx/camera/core/ZoomState;->getMinZoomRatio()F

    move-result v3

    invoke-interface {p0}, Landroidx/camera/core/ZoomState;->getLinearZoom()F

    move-result v4

    invoke-direct {v0, v1, v2, v3, v4}, Landroidx/camera/core/internal/AutoValue_ImmutableZoomState;-><init>(FFFF)V

    .line 41
    return-object v0
.end method


# virtual methods
.method public abstract getLinearZoom()F
.end method

.method public abstract getMaxZoomRatio()F
.end method

.method public abstract getMinZoomRatio()F
.end method

.method public abstract getZoomRatio()F
.end method
