.class public final Landroidx/camera/core/internal/utils/ZslRingBuffer;
.super Landroidx/camera/core/internal/utils/ArrayRingBuffer;
.source "ZslRingBuffer.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/camera/core/internal/utils/ArrayRingBuffer<",
        "Landroidx/camera/core/ImageProxy;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(ILandroidx/camera/core/internal/utils/RingBuffer$OnRemoveCallback;)V
    .locals 0
    .param p1, "ringBufferCapacity"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroidx/camera/core/internal/utils/RingBuffer$OnRemoveCallback<",
            "Landroidx/camera/core/ImageProxy;",
            ">;)V"
        }
    .end annotation

    .line 45
    .local p2, "onRemoveCallback":Landroidx/camera/core/internal/utils/RingBuffer$OnRemoveCallback;, "Landroidx/camera/core/internal/utils/RingBuffer$OnRemoveCallback<Landroidx/camera/core/ImageProxy;>;"
    invoke-direct {p0, p1, p2}, Landroidx/camera/core/internal/utils/ArrayRingBuffer;-><init>(ILandroidx/camera/core/internal/utils/RingBuffer$OnRemoveCallback;)V

    .line 46
    return-void
.end method

.method private isValidZslFrame(Landroidx/camera/core/ImageInfo;)Z
    .locals 4
    .param p1, "imageInfo"    # Landroidx/camera/core/ImageInfo;

    .line 58
    nop

    .line 59
    invoke-static {p1}, Landroidx/camera/core/impl/CameraCaptureResults;->retrieveCameraCaptureResult(Landroidx/camera/core/ImageInfo;)Landroidx/camera/core/impl/CameraCaptureResult;

    move-result-object v0

    .line 61
    .local v0, "cameraCaptureResult":Landroidx/camera/core/impl/CameraCaptureResult;
    invoke-interface {v0}, Landroidx/camera/core/impl/CameraCaptureResult;->getAfState()Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;

    move-result-object v1

    sget-object v2, Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;->LOCKED_FOCUSED:Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;

    const/4 v3, 0x0

    if-eq v1, v2, :cond_0

    .line 62
    invoke-interface {v0}, Landroidx/camera/core/impl/CameraCaptureResult;->getAfState()Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;

    move-result-object v1

    sget-object v2, Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;->PASSIVE_FOCUSED:Landroidx/camera/core/impl/CameraCaptureMetaData$AfState;

    if-eq v1, v2, :cond_0

    .line 63
    return v3

    .line 66
    :cond_0
    invoke-interface {v0}, Landroidx/camera/core/impl/CameraCaptureResult;->getAeState()Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;

    move-result-object v1

    sget-object v2, Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;->CONVERGED:Landroidx/camera/core/impl/CameraCaptureMetaData$AeState;

    if-eq v1, v2, :cond_1

    .line 67
    return v3

    .line 70
    :cond_1
    invoke-interface {v0}, Landroidx/camera/core/impl/CameraCaptureResult;->getAwbState()Landroidx/camera/core/impl/CameraCaptureMetaData$AwbState;

    move-result-object v1

    sget-object v2, Landroidx/camera/core/impl/CameraCaptureMetaData$AwbState;->CONVERGED:Landroidx/camera/core/impl/CameraCaptureMetaData$AwbState;

    if-eq v1, v2, :cond_2

    .line 71
    return v3

    .line 74
    :cond_2
    const/4 v1, 0x1

    return v1
.end method


# virtual methods
.method public enqueue(Landroidx/camera/core/ImageProxy;)V
    .locals 1
    .param p1, "imageProxy"    # Landroidx/camera/core/ImageProxy;

    .line 50
    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->getImageInfo()Landroidx/camera/core/ImageInfo;

    move-result-object v0

    invoke-direct {p0, v0}, Landroidx/camera/core/internal/utils/ZslRingBuffer;->isValidZslFrame(Landroidx/camera/core/ImageInfo;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 51
    invoke-super {p0, p1}, Landroidx/camera/core/internal/utils/ArrayRingBuffer;->enqueue(Ljava/lang/Object;)V

    goto :goto_0

    .line 53
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/internal/utils/ZslRingBuffer;->mOnRemoveCallback:Landroidx/camera/core/internal/utils/RingBuffer$OnRemoveCallback;

    invoke-interface {v0, p1}, Landroidx/camera/core/internal/utils/RingBuffer$OnRemoveCallback;->onRemove(Ljava/lang/Object;)V

    .line 55
    :goto_0
    return-void
.end method

.method public bridge synthetic enqueue(Ljava/lang/Object;)V
    .locals 0

    .line 40
    check-cast p1, Landroidx/camera/core/ImageProxy;

    invoke-virtual {p0, p1}, Landroidx/camera/core/internal/utils/ZslRingBuffer;->enqueue(Landroidx/camera/core/ImageProxy;)V

    return-void
.end method
