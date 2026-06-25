.class public interface abstract Landroidx/camera/core/processing/SurfaceProcessorInternal;
.super Ljava/lang/Object;
.source "SurfaceProcessorInternal.java"

# interfaces
.implements Landroidx/camera/core/SurfaceProcessor;


# virtual methods
.method public abstract release()V
.end method

.method public snapshot(II)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .param p1, "jpegQuality"    # I
    .param p2, "rotationDegrees"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 58
    const/4 v0, 0x0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFuture(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method
