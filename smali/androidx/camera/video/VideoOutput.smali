.class public interface abstract Landroidx/camera/video/VideoOutput;
.super Ljava/lang/Object;
.source "VideoOutput.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/video/VideoOutput$SourceState;
    }
.end annotation


# virtual methods
.method public getMediaCapabilities(Landroidx/camera/core/CameraInfo;)Landroidx/camera/video/VideoCapabilities;
    .locals 1
    .param p1, "cameraInfo"    # Landroidx/camera/core/CameraInfo;

    .line 150
    sget-object v0, Landroidx/camera/video/VideoCapabilities;->EMPTY:Landroidx/camera/video/VideoCapabilities;

    return-object v0
.end method

.method public getMediaSpec()Landroidx/camera/core/impl/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/camera/core/impl/Observable<",
            "Landroidx/camera/video/MediaSpec;",
            ">;"
        }
    .end annotation

    .line 131
    const/4 v0, 0x0

    invoke-static {v0}, Landroidx/camera/core/impl/ConstantObservable;->withValue(Ljava/lang/Object;)Landroidx/camera/core/impl/Observable;

    move-result-object v0

    return-object v0
.end method

.method public getStreamInfo()Landroidx/camera/core/impl/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/camera/core/impl/Observable<",
            "Landroidx/camera/video/StreamInfo;",
            ">;"
        }
    .end annotation

    .line 110
    sget-object v0, Landroidx/camera/video/StreamInfo;->ALWAYS_ACTIVE_OBSERVABLE:Landroidx/camera/core/impl/Observable;

    return-object v0
.end method

.method public onSourceStateChanged(Landroidx/camera/video/VideoOutput$SourceState;)V
    .locals 0
    .param p1, "sourceState"    # Landroidx/camera/video/VideoOutput$SourceState;

    .line 140
    return-void
.end method

.method public abstract onSurfaceRequested(Landroidx/camera/core/SurfaceRequest;)V
.end method

.method public onSurfaceRequested(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;)V
    .locals 0
    .param p1, "request"    # Landroidx/camera/core/SurfaceRequest;
    .param p2, "timebase"    # Landroidx/camera/core/impl/Timebase;

    .line 100
    invoke-interface {p0, p1}, Landroidx/camera/video/VideoOutput;->onSurfaceRequested(Landroidx/camera/core/SurfaceRequest;)V

    .line 101
    return-void
.end method
