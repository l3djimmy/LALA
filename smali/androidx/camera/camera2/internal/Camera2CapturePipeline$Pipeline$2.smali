.class Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline$2;
.super Landroidx/camera/core/impl/CameraCaptureCallback;
.source "Camera2CapturePipeline.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;->submitConfigsInternal(Ljava/util/List;I)Lcom/google/common/util/concurrent/ListenableFuture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;

.field final synthetic val$completer:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;


# direct methods
.method constructor <init>(Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;

    .line 355
    iput-object p1, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline$2;->this$0:Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline;

    iput-object p2, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline$2;->val$completer:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    invoke-direct {p0}, Landroidx/camera/core/impl/CameraCaptureCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onCaptureCancelled()V
    .locals 5

    .line 371
    const-string v0, "Capture request is cancelled because camera is closed"

    .line 372
    .local v0, "msg":Ljava/lang/String;
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline$2;->val$completer:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    new-instance v2, Landroidx/camera/core/ImageCaptureException;

    const/4 v3, 0x3

    const/4 v4, 0x0

    invoke-direct {v2, v3, v0, v4}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    invoke-virtual {v1, v2}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 374
    return-void
.end method

.method public onCaptureCompleted(Landroidx/camera/core/impl/CameraCaptureResult;)V
    .locals 2
    .param p1, "result"    # Landroidx/camera/core/impl/CameraCaptureResult;

    .line 358
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline$2;->val$completer:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 359
    return-void
.end method

.method public onCaptureFailed(Landroidx/camera/core/impl/CameraCaptureFailure;)V
    .locals 5
    .param p1, "failure"    # Landroidx/camera/core/impl/CameraCaptureFailure;

    .line 363
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Capture request failed with reason "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 364
    invoke-virtual {p1}, Landroidx/camera/core/impl/CameraCaptureFailure;->getReason()Landroidx/camera/core/impl/CameraCaptureFailure$Reason;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 365
    .local v0, "msg":Ljava/lang/String;
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2CapturePipeline$Pipeline$2;->val$completer:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    new-instance v2, Landroidx/camera/core/ImageCaptureException;

    const/4 v3, 0x2

    const/4 v4, 0x0

    invoke-direct {v2, v3, v0, v4}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    invoke-virtual {v1, v2}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 367
    return-void
.end method
