.class public Landroidx/camera/core/processing/InternalImageProcessor;
.super Ljava/lang/Object;
.source "InternalImageProcessor.java"


# instance fields
.field private final mErrorListener:Landroidx/core/util/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/core/util/Consumer<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field private final mExecutor:Ljava/util/concurrent/Executor;

.field private final mImageProcessor:Landroidx/camera/core/ImageProcessor;


# direct methods
.method public constructor <init>(Landroidx/camera/core/CameraEffect;)V
    .locals 2
    .param p1, "cameraEffect"    # Landroidx/camera/core/CameraEffect;

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    invoke-virtual {p1}, Landroidx/camera/core/CameraEffect;->getTargets()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    .line 56
    invoke-virtual {p1}, Landroidx/camera/core/CameraEffect;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/processing/InternalImageProcessor;->mExecutor:Ljava/util/concurrent/Executor;

    .line 57
    invoke-virtual {p1}, Landroidx/camera/core/CameraEffect;->getImageProcessor()Landroidx/camera/core/ImageProcessor;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/ImageProcessor;

    iput-object v0, p0, Landroidx/camera/core/processing/InternalImageProcessor;->mImageProcessor:Landroidx/camera/core/ImageProcessor;

    .line 58
    invoke-virtual {p1}, Landroidx/camera/core/CameraEffect;->getErrorListener()Landroidx/core/util/Consumer;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/processing/InternalImageProcessor;->mErrorListener:Landroidx/core/util/Consumer;

    .line 59
    return-void
.end method


# virtual methods
.method synthetic lambda$safeProcess$0$androidx-camera-core-processing-InternalImageProcessor(Landroidx/camera/core/ImageProcessor$Request;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V
    .locals 2
    .param p1, "request"    # Landroidx/camera/core/ImageProcessor$Request;
    .param p2, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 73
    :try_start_0
    iget-object v0, p0, Landroidx/camera/core/processing/InternalImageProcessor;->mImageProcessor:Landroidx/camera/core/ImageProcessor;

    invoke-interface {v0, p1}, Landroidx/camera/core/ImageProcessor;->process(Landroidx/camera/core/ImageProcessor$Request;)Landroidx/camera/core/ImageProcessor$Response;

    move-result-object v0
    :try_end_0
    .catch Landroidx/camera/core/ProcessingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    .local v0, "response":Landroidx/camera/core/ImageProcessor$Response;
    nop

    .line 81
    invoke-virtual {p2, v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 82
    return-void

    .line 74
    .end local v0    # "response":Landroidx/camera/core/ImageProcessor$Response;
    :catch_0
    move-exception v0

    .line 76
    .local v0, "e":Landroidx/camera/core/ProcessingException;
    iget-object v1, p0, Landroidx/camera/core/processing/InternalImageProcessor;->mErrorListener:Landroidx/core/util/Consumer;

    invoke-interface {v1, v0}, Landroidx/core/util/Consumer;->accept(Ljava/lang/Object;)V

    .line 78
    invoke-virtual {p2, v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 79
    return-void
.end method

.method synthetic lambda$safeProcess$1$androidx-camera-core-processing-InternalImageProcessor(Landroidx/camera/core/ImageProcessor$Request;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 2
    .param p1, "request"    # Landroidx/camera/core/ImageProcessor$Request;
    .param p2, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 70
    iget-object v0, p0, Landroidx/camera/core/processing/InternalImageProcessor;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/core/processing/InternalImageProcessor$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1, p2}, Landroidx/camera/core/processing/InternalImageProcessor$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/core/processing/InternalImageProcessor;Landroidx/camera/core/ImageProcessor$Request;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 83
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "InternalImageProcessor#process "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public safeProcess(Landroidx/camera/core/ImageProcessor$Request;)Landroidx/camera/core/ImageProcessor$Response;
    .locals 5
    .param p1, "request"    # Landroidx/camera/core/ImageProcessor$Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 68
    :try_start_0
    new-instance v0, Landroidx/camera/core/processing/InternalImageProcessor$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, p1}, Landroidx/camera/core/processing/InternalImageProcessor$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/core/processing/InternalImageProcessor;Landroidx/camera/core/ImageProcessor$Request;)V

    invoke-static {v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 84
    invoke-interface {v0}, Lcom/google/common/util/concurrent/ListenableFuture;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/ImageProcessor$Response;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    return-object v0

    .line 85
    :catch_0
    move-exception v0

    .line 86
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    .line 87
    .local v1, "cause":Ljava/lang/Throwable;
    :goto_0
    new-instance v2, Landroidx/camera/core/ImageCaptureException;

    const/4 v3, 0x0

    const-string v4, "Failed to invoke ImageProcessor."

    invoke-direct {v2, v3, v4, v1}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method
