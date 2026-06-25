.class Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline$1;
.super Ljava/lang/Object;
.source "Camera2CapturePipeline.java"

# interfaces
.implements Landroidx/camera/camera2/internal/Camera2CapturePipeline$PipelineTask;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;


# direct methods
.method constructor <init>(Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;

    .line 219
    iput-object p1, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline$1;->this$0:Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$preCapture$0(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 1
    .param p0, "results"    # Ljava/util/List;

    .line 230
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public isCaptureResultNeeded()Z
    .locals 3

    .line 235
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline$1;->this$0:Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;

    iget-object v0, v0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->mTasks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/camera2/internal/Camera2CapturePipeline$PipelineTask;

    .line 236
    .local v1, "task":Landroidx/camera/camera2/internal/Camera2CapturePipeline$PipelineTask;
    invoke-interface {v1}, Landroidx/camera/camera2/internal/Camera2CapturePipeline$PipelineTask;->isCaptureResultNeeded()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 237
    const/4 v0, 0x1

    return v0

    .line 239
    .end local v1    # "task":Landroidx/camera/camera2/internal/Camera2CapturePipeline$PipelineTask;
    :cond_0
    goto :goto_0

    .line 240
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public postCapture()V
    .locals 2

    .line 245
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline$1;->this$0:Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;

    iget-object v0, v0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->mTasks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/camera2/internal/Camera2CapturePipeline$PipelineTask;

    .line 246
    .local v1, "task":Landroidx/camera/camera2/internal/Camera2CapturePipeline$PipelineTask;
    invoke-interface {v1}, Landroidx/camera/camera2/internal/Camera2CapturePipeline$PipelineTask;->postCapture()V

    .line 247
    .end local v1    # "task":Landroidx/camera/camera2/internal/Camera2CapturePipeline$PipelineTask;
    goto :goto_0

    .line 248
    :cond_0
    return-void
.end method

.method public preCapture(Landroid/hardware/camera2/TotalCaptureResult;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 4
    .param p1, "captureResult"    # Landroid/hardware/camera2/TotalCaptureResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/TotalCaptureResult;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 225
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 226
    .local v0, "futures":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Boolean;>;>;"
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline$1;->this$0:Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;

    iget-object v1, v1, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->mTasks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/camera2/internal/Camera2CapturePipeline$PipelineTask;

    .line 227
    .local v2, "task":Landroidx/camera/camera2/internal/Camera2CapturePipeline$PipelineTask;
    invoke-interface {v2, p1}, Landroidx/camera/camera2/internal/Camera2CapturePipeline$PipelineTask;->preCapture(Landroid/hardware/camera2/TotalCaptureResult;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 228
    .end local v2    # "task":Landroidx/camera/camera2/internal/Camera2CapturePipeline$PipelineTask;
    goto :goto_0

    .line 229
    :cond_0
    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->allAsList(Ljava/util/Collection;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    new-instance v2, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline$1$$ExternalSyntheticLambda0;

    invoke-direct {v2}, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline$1$$ExternalSyntheticLambda0;-><init>()V

    .line 230
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v3

    .line 229
    invoke-static {v1, v2, v3}, Landroidx/camera/core/impl/utils/futures/Futures;->transform(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/arch/core/util/Function;Ljava/util/concurrent/Executor;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    return-object v1
.end method
