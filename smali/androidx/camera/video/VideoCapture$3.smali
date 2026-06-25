.class Landroidx/camera/video/VideoCapture$3;
.super Ljava/lang/Object;
.source "VideoCapture.java"

# interfaces
.implements Landroidx/camera/core/impl/utils/futures/FutureCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/camera/video/VideoCapture;->setupSurfaceUpdateNotifier(Landroidx/camera/core/impl/SessionConfig$Builder;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/camera/core/impl/utils/futures/FutureCallback<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/camera/video/VideoCapture;

.field final synthetic val$isStreamActive:Z

.field final synthetic val$surfaceUpdateFuture:Lcom/google/common/util/concurrent/ListenableFuture;


# direct methods
.method constructor <init>(Landroidx/camera/video/VideoCapture;Lcom/google/common/util/concurrent/ListenableFuture;Z)V
    .locals 0
    .param p1, "this$0"    # Landroidx/camera/video/VideoCapture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1237
    .local p0, "this":Landroidx/camera/video/VideoCapture$3;, "Landroidx/camera/video/VideoCapture$3;"
    iput-object p1, p0, Landroidx/camera/video/VideoCapture$3;->this$0:Landroidx/camera/video/VideoCapture;

    iput-object p2, p0, Landroidx/camera/video/VideoCapture$3;->val$surfaceUpdateFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    iput-boolean p3, p0, Landroidx/camera/video/VideoCapture$3;->val$isStreamActive:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "t"    # Ljava/lang/Throwable;

    .line 1253
    .local p0, "this":Landroidx/camera/video/VideoCapture$3;, "Landroidx/camera/video/VideoCapture$3;"
    instance-of v0, p1, Ljava/util/concurrent/CancellationException;

    if-nez v0, :cond_0

    .line 1254
    const-string/jumbo v0, "VideoCapture"

    const-string/jumbo v1, "Surface update completed with unexpected exception"

    invoke-static {v0, v1, p1}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1256
    :cond_0
    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0

    .line 1237
    .local p0, "this":Landroidx/camera/video/VideoCapture$3;, "Landroidx/camera/video/VideoCapture$3;"
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Landroidx/camera/video/VideoCapture$3;->onSuccess(Ljava/lang/Void;)V

    return-void
.end method

.method public onSuccess(Ljava/lang/Void;)V
    .locals 2
    .param p1, "result"    # Ljava/lang/Void;

    .line 1244
    .local p0, "this":Landroidx/camera/video/VideoCapture$3;, "Landroidx/camera/video/VideoCapture$3;"
    iget-object v0, p0, Landroidx/camera/video/VideoCapture$3;->val$surfaceUpdateFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    iget-object v1, p0, Landroidx/camera/video/VideoCapture$3;->this$0:Landroidx/camera/video/VideoCapture;

    iget-object v1, v1, Landroidx/camera/video/VideoCapture;->mSurfaceUpdateFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Landroidx/camera/video/VideoCapture$3;->this$0:Landroidx/camera/video/VideoCapture;

    iget-object v0, v0, Landroidx/camera/video/VideoCapture;->mSourceState:Landroidx/camera/video/VideoOutput$SourceState;

    sget-object v1, Landroidx/camera/video/VideoOutput$SourceState;->INACTIVE:Landroidx/camera/video/VideoOutput$SourceState;

    if-eq v0, v1, :cond_1

    .line 1246
    iget-object v0, p0, Landroidx/camera/video/VideoCapture$3;->this$0:Landroidx/camera/video/VideoCapture;

    iget-boolean v1, p0, Landroidx/camera/video/VideoCapture$3;->val$isStreamActive:Z

    if-eqz v1, :cond_0

    sget-object v1, Landroidx/camera/video/VideoOutput$SourceState;->ACTIVE_STREAMING:Landroidx/camera/video/VideoOutput$SourceState;

    goto :goto_0

    .line 1247
    :cond_0
    sget-object v1, Landroidx/camera/video/VideoOutput$SourceState;->ACTIVE_NON_STREAMING:Landroidx/camera/video/VideoOutput$SourceState;

    .line 1246
    :goto_0
    invoke-virtual {v0, v1}, Landroidx/camera/video/VideoCapture;->setSourceState(Landroidx/camera/video/VideoOutput$SourceState;)V

    .line 1249
    :cond_1
    return-void
.end method
