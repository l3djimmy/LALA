.class Landroidx/camera/core/imagecapture/RequestWithCallback;
.super Ljava/lang/Object;
.source "RequestWithCallback.java"

# interfaces
.implements Landroidx/camera/core/imagecapture/TakePictureCallback;


# instance fields
.field private mCaptureCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private final mCaptureFuture:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private mCaptureRequestFuture:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private mCompleteCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private final mCompleteFuture:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private mIsAborted:Z

.field private final mRetryControl:Landroidx/camera/core/imagecapture/TakePictureRequest$RetryControl;

.field private final mTakePictureRequest:Landroidx/camera/core/imagecapture/TakePictureRequest;


# direct methods
.method constructor <init>(Landroidx/camera/core/imagecapture/TakePictureRequest;Landroidx/camera/core/imagecapture/TakePictureRequest$RetryControl;)V
    .locals 1
    .param p1, "takePictureRequest"    # Landroidx/camera/core/imagecapture/TakePictureRequest;
    .param p2, "retryControl"    # Landroidx/camera/core/imagecapture/TakePictureRequest$RetryControl;

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mIsAborted:Z

    .line 61
    iput-object p1, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mTakePictureRequest:Landroidx/camera/core/imagecapture/TakePictureRequest;

    .line 62
    iput-object p2, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mRetryControl:Landroidx/camera/core/imagecapture/TakePictureRequest$RetryControl;

    .line 63
    new-instance v0, Landroidx/camera/core/imagecapture/RequestWithCallback$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Landroidx/camera/core/imagecapture/RequestWithCallback$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/core/imagecapture/RequestWithCallback;)V

    invoke-static {v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mCaptureFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 68
    new-instance v0, Landroidx/camera/core/imagecapture/RequestWithCallback$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Landroidx/camera/core/imagecapture/RequestWithCallback$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/core/imagecapture/RequestWithCallback;)V

    invoke-static {v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mCompleteFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 73
    return-void
.end method

.method private abort(Landroidx/camera/core/ImageCaptureException;)V
    .locals 2
    .param p1, "imageCaptureException"    # Landroidx/camera/core/ImageCaptureException;

    .line 192
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 193
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mIsAborted:Z

    .line 195
    iget-object v1, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mCaptureRequestFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-interface {v1, v0}, Lcom/google/common/util/concurrent/ListenableFuture;->cancel(Z)Z

    .line 196
    iget-object v0, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mCaptureCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    invoke-virtual {v0, p1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 197
    iget-object v0, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mCompleteCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 198
    return-void
.end method

.method private checkOnImageCaptured()V
    .locals 2

    .line 225
    iget-object v0, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mCaptureFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-interface {v0}, Lcom/google/common/util/concurrent/ListenableFuture;->isDone()Z

    move-result v0

    const-string/jumbo v1, "onImageCaptured() must be called before onFinalResult()"

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 227
    return-void
.end method

.method private markComplete()V
    .locals 2

    .line 230
    iget-object v0, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mCompleteFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-interface {v0}, Lcom/google/common/util/concurrent/ListenableFuture;->isDone()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    const-string/jumbo v1, "The callback can only complete once."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 231
    iget-object v0, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mCompleteCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 232
    return-void
.end method

.method private onFailure(Landroidx/camera/core/ImageCaptureException;)V
    .locals 1
    .param p1, "imageCaptureException"    # Landroidx/camera/core/ImageCaptureException;

    .line 236
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 237
    iget-object v0, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mTakePictureRequest:Landroidx/camera/core/imagecapture/TakePictureRequest;

    invoke-virtual {v0, p1}, Landroidx/camera/core/imagecapture/TakePictureRequest;->onError(Landroidx/camera/core/ImageCaptureException;)V

    .line 238
    return-void
.end method


# virtual methods
.method abortAndSendErrorToApp(Landroidx/camera/core/ImageCaptureException;)V
    .locals 1
    .param p1, "imageCaptureException"    # Landroidx/camera/core/ImageCaptureException;

    .line 169
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 170
    iget-object v0, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mCompleteFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-interface {v0}, Lcom/google/common/util/concurrent/ListenableFuture;->isDone()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 172
    return-void

    .line 174
    :cond_0
    invoke-direct {p0, p1}, Landroidx/camera/core/imagecapture/RequestWithCallback;->abort(Landroidx/camera/core/ImageCaptureException;)V

    .line 175
    invoke-direct {p0, p1}, Landroidx/camera/core/imagecapture/RequestWithCallback;->onFailure(Landroidx/camera/core/ImageCaptureException;)V

    .line 176
    return-void
.end method

.method abortSilentlyAndRetry()V
    .locals 4

    .line 180
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 181
    iget-object v0, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mCompleteFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-interface {v0}, Lcom/google/common/util/concurrent/ListenableFuture;->isDone()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 183
    return-void

    .line 185
    :cond_0
    new-instance v0, Landroidx/camera/core/ImageCaptureException;

    const-string/jumbo v1, "The request is aborted silently and retried."

    const/4 v2, 0x0

    const/4 v3, 0x3

    invoke-direct {v0, v3, v1, v2}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, v0}, Landroidx/camera/core/imagecapture/RequestWithCallback;->abort(Landroidx/camera/core/ImageCaptureException;)V

    .line 187
    iget-object v0, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mRetryControl:Landroidx/camera/core/imagecapture/TakePictureRequest$RetryControl;

    iget-object v1, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mTakePictureRequest:Landroidx/camera/core/imagecapture/TakePictureRequest;

    invoke-interface {v0, v1}, Landroidx/camera/core/imagecapture/TakePictureRequest$RetryControl;->retryRequest(Landroidx/camera/core/imagecapture/TakePictureRequest;)V

    .line 188
    return-void
.end method

.method getCaptureFuture()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 208
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 209
    iget-object v0, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mCaptureFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    return-object v0
.end method

.method getCompleteFuture()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 220
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 221
    iget-object v0, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mCompleteFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    return-object v0
.end method

.method public isAborted()Z
    .locals 1

    .line 141
    iget-boolean v0, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mIsAborted:Z

    return v0
.end method

.method synthetic lambda$new$0$androidx-camera-core-imagecapture-RequestWithCallback(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 1
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 65
    iput-object p1, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mCaptureCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 66
    const-string v0, "CaptureCompleteFuture"

    return-object v0
.end method

.method synthetic lambda$new$1$androidx-camera-core-imagecapture-RequestWithCallback(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 1
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 70
    iput-object p1, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mCompleteCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 71
    const-string/jumbo v0, "RequestCompleteFuture"

    return-object v0
.end method

.method public onCaptureFailure(Landroidx/camera/core/ImageCaptureException;)V
    .locals 3
    .param p1, "imageCaptureException"    # Landroidx/camera/core/ImageCaptureException;

    .line 147
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 148
    iget-boolean v0, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mIsAborted:Z

    if-eqz v0, :cond_0

    .line 150
    return-void

    .line 153
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mTakePictureRequest:Landroidx/camera/core/imagecapture/TakePictureRequest;

    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/TakePictureRequest;->decrementRetryCounter()Z

    move-result v0

    .line 154
    .local v0, "isRetryAllowed":Z
    if-nez v0, :cond_1

    .line 155
    invoke-direct {p0, p1}, Landroidx/camera/core/imagecapture/RequestWithCallback;->onFailure(Landroidx/camera/core/ImageCaptureException;)V

    .line 157
    :cond_1
    invoke-direct {p0}, Landroidx/camera/core/imagecapture/RequestWithCallback;->markComplete()V

    .line 158
    iget-object v1, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mCaptureCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    invoke-virtual {v1, p1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 160
    if-eqz v0, :cond_2

    .line 163
    iget-object v1, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mRetryControl:Landroidx/camera/core/imagecapture/TakePictureRequest$RetryControl;

    iget-object v2, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mTakePictureRequest:Landroidx/camera/core/imagecapture/TakePictureRequest;

    invoke-interface {v1, v2}, Landroidx/camera/core/imagecapture/TakePictureRequest$RetryControl;->retryRequest(Landroidx/camera/core/imagecapture/TakePictureRequest;)V

    .line 165
    :cond_2
    return-void
.end method

.method public onFinalResult(Landroidx/camera/core/ImageCapture$OutputFileResults;)V
    .locals 1
    .param p1, "outputFileResults"    # Landroidx/camera/core/ImageCapture$OutputFileResults;

    .line 102
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 103
    iget-boolean v0, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mIsAborted:Z

    if-eqz v0, :cond_0

    .line 106
    return-void

    .line 108
    :cond_0
    invoke-direct {p0}, Landroidx/camera/core/imagecapture/RequestWithCallback;->checkOnImageCaptured()V

    .line 109
    invoke-direct {p0}, Landroidx/camera/core/imagecapture/RequestWithCallback;->markComplete()V

    .line 110
    iget-object v0, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mTakePictureRequest:Landroidx/camera/core/imagecapture/TakePictureRequest;

    invoke-virtual {v0, p1}, Landroidx/camera/core/imagecapture/TakePictureRequest;->onResult(Landroidx/camera/core/ImageCapture$OutputFileResults;)V

    .line 111
    return-void
.end method

.method public onFinalResult(Landroidx/camera/core/ImageProxy;)V
    .locals 1
    .param p1, "imageProxy"    # Landroidx/camera/core/ImageProxy;

    .line 116
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 117
    iget-boolean v0, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mIsAborted:Z

    if-eqz v0, :cond_0

    .line 119
    return-void

    .line 121
    :cond_0
    invoke-direct {p0}, Landroidx/camera/core/imagecapture/RequestWithCallback;->checkOnImageCaptured()V

    .line 122
    invoke-direct {p0}, Landroidx/camera/core/imagecapture/RequestWithCallback;->markComplete()V

    .line 123
    iget-object v0, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mTakePictureRequest:Landroidx/camera/core/imagecapture/TakePictureRequest;

    invoke-virtual {v0, p1}, Landroidx/camera/core/imagecapture/TakePictureRequest;->onResult(Landroidx/camera/core/ImageProxy;)V

    .line 124
    return-void
.end method

.method public onImageCaptured()V
    .locals 2

    .line 90
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 91
    iget-boolean v0, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mIsAborted:Z

    if-eqz v0, :cond_0

    .line 93
    return-void

    .line 95
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mCaptureCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 97
    return-void
.end method

.method public onProcessFailure(Landroidx/camera/core/ImageCaptureException;)V
    .locals 1
    .param p1, "imageCaptureException"    # Landroidx/camera/core/ImageCaptureException;

    .line 129
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 130
    iget-boolean v0, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mIsAborted:Z

    if-eqz v0, :cond_0

    .line 132
    return-void

    .line 134
    :cond_0
    invoke-direct {p0}, Landroidx/camera/core/imagecapture/RequestWithCallback;->checkOnImageCaptured()V

    .line 135
    invoke-direct {p0}, Landroidx/camera/core/imagecapture/RequestWithCallback;->markComplete()V

    .line 136
    invoke-direct {p0, p1}, Landroidx/camera/core/imagecapture/RequestWithCallback;->onFailure(Landroidx/camera/core/ImageCaptureException;)V

    .line 137
    return-void
.end method

.method public setCaptureRequestFuture(Lcom/google/common/util/concurrent/ListenableFuture;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 82
    .local p1, "captureRequestFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;"
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 83
    iget-object v0, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mCaptureRequestFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "CaptureRequestFuture can only be set once."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 84
    iput-object p1, p0, Landroidx/camera/core/imagecapture/RequestWithCallback;->mCaptureRequestFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 85
    return-void
.end method
