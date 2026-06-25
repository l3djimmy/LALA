.class public Landroidx/camera/core/imagecapture/TakePictureManager;
.super Ljava/lang/Object;
.source "TakePictureManager.java"

# interfaces
.implements Landroidx/camera/core/ForwardingImageProxy$OnImageCloseListener;
.implements Landroidx/camera/core/imagecapture/TakePictureRequest$RetryControl;


# static fields
.field private static final TAG:Ljava/lang/String; = "TakePictureManager"


# instance fields
.field private mCapturingRequest:Landroidx/camera/core/imagecapture/RequestWithCallback;

.field final mImageCaptureControl:Landroidx/camera/core/imagecapture/ImageCaptureControl;

.field mImagePipeline:Landroidx/camera/core/imagecapture/ImagePipeline;

.field private final mIncompleteRequests:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/imagecapture/RequestWithCallback;",
            ">;"
        }
    .end annotation
.end field

.field final mNewRequests:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Landroidx/camera/core/imagecapture/TakePictureRequest;",
            ">;"
        }
    .end annotation
.end field

.field mPaused:Z


# direct methods
.method public constructor <init>(Landroidx/camera/core/imagecapture/ImageCaptureControl;)V
    .locals 1
    .param p1, "imageCaptureControl"    # Landroidx/camera/core/imagecapture/ImageCaptureControl;

    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/imagecapture/TakePictureManager;->mNewRequests:Ljava/util/Deque;

    .line 85
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/core/imagecapture/TakePictureManager;->mPaused:Z

    .line 92
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 93
    iput-object p1, p0, Landroidx/camera/core/imagecapture/TakePictureManager;->mImageCaptureControl:Landroidx/camera/core/imagecapture/ImageCaptureControl;

    .line 94
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/imagecapture/TakePictureManager;->mIncompleteRequests:Ljava/util/List;

    .line 95
    return-void
.end method

.method private submitCameraRequest(Landroidx/camera/core/imagecapture/CameraRequest;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 3
    .param p1, "cameraRequest"    # Landroidx/camera/core/imagecapture/CameraRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/imagecapture/CameraRequest;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 246
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 247
    iget-object v0, p0, Landroidx/camera/core/imagecapture/TakePictureManager;->mImageCaptureControl:Landroidx/camera/core/imagecapture/ImageCaptureControl;

    invoke-interface {v0}, Landroidx/camera/core/imagecapture/ImageCaptureControl;->lockFlashMode()V

    .line 248
    iget-object v0, p0, Landroidx/camera/core/imagecapture/TakePictureManager;->mImageCaptureControl:Landroidx/camera/core/imagecapture/ImageCaptureControl;

    .line 249
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/CameraRequest;->getCaptureConfigs()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Landroidx/camera/core/imagecapture/ImageCaptureControl;->submitStillCaptureRequests(Ljava/util/List;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 250
    .local v0, "captureRequestFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;"
    new-instance v1, Landroidx/camera/core/imagecapture/TakePictureManager$1;

    invoke-direct {v1, p0, p1}, Landroidx/camera/core/imagecapture/TakePictureManager$1;-><init>(Landroidx/camera/core/imagecapture/TakePictureManager;Landroidx/camera/core/imagecapture/CameraRequest;)V

    .line 276
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v2

    .line 250
    invoke-static {v0, v1, v2}, Landroidx/camera/core/impl/utils/futures/Futures;->addCallback(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/camera/core/impl/utils/futures/FutureCallback;Ljava/util/concurrent/Executor;)V

    .line 277
    return-object v0
.end method

.method private trackCurrentRequests(Landroidx/camera/core/imagecapture/RequestWithCallback;)V
    .locals 3
    .param p1, "requestWithCallback"    # Landroidx/camera/core/imagecapture/RequestWithCallback;

    .line 222
    invoke-virtual {p0}, Landroidx/camera/core/imagecapture/TakePictureManager;->hasCapturingRequest()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkState(Z)V

    .line 223
    iput-object p1, p0, Landroidx/camera/core/imagecapture/TakePictureManager;->mCapturingRequest:Landroidx/camera/core/imagecapture/RequestWithCallback;

    .line 226
    iget-object v0, p0, Landroidx/camera/core/imagecapture/TakePictureManager;->mCapturingRequest:Landroidx/camera/core/imagecapture/RequestWithCallback;

    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/RequestWithCallback;->getCaptureFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    new-instance v1, Landroidx/camera/core/imagecapture/TakePictureManager$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Landroidx/camera/core/imagecapture/TakePictureManager$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/core/imagecapture/TakePictureManager;)V

    .line 229
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    .line 226
    invoke-interface {v0, v1, v2}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 232
    iget-object v0, p0, Landroidx/camera/core/imagecapture/TakePictureManager;->mIncompleteRequests:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 233
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/RequestWithCallback;->getCompleteFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    new-instance v1, Landroidx/camera/core/imagecapture/TakePictureManager$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1}, Landroidx/camera/core/imagecapture/TakePictureManager$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/core/imagecapture/TakePictureManager;Landroidx/camera/core/imagecapture/RequestWithCallback;)V

    .line 235
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    .line 233
    invoke-interface {v0, v1, v2}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 236
    return-void
.end method


# virtual methods
.method public abortRequests()V
    .locals 4

    .line 160
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 161
    new-instance v0, Landroidx/camera/core/ImageCaptureException;

    const-string v1, "Camera is closed."

    const/4 v2, 0x0

    const/4 v3, 0x3

    invoke-direct {v0, v3, v1, v2}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 165
    .local v0, "exception":Landroidx/camera/core/ImageCaptureException;
    iget-object v1, p0, Landroidx/camera/core/imagecapture/TakePictureManager;->mNewRequests:Ljava/util/Deque;

    invoke-interface {v1}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/imagecapture/TakePictureRequest;

    .line 166
    .local v2, "request":Landroidx/camera/core/imagecapture/TakePictureRequest;
    invoke-virtual {v2, v0}, Landroidx/camera/core/imagecapture/TakePictureRequest;->onError(Landroidx/camera/core/ImageCaptureException;)V

    .line 167
    .end local v2    # "request":Landroidx/camera/core/imagecapture/TakePictureRequest;
    goto :goto_0

    .line 168
    :cond_0
    iget-object v1, p0, Landroidx/camera/core/imagecapture/TakePictureManager;->mNewRequests:Ljava/util/Deque;

    invoke-interface {v1}, Ljava/util/Deque;->clear()V

    .line 172
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Landroidx/camera/core/imagecapture/TakePictureManager;->mIncompleteRequests:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 173
    .local v1, "requestsSnapshot":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/imagecapture/RequestWithCallback;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/imagecapture/RequestWithCallback;

    .line 175
    .local v3, "request":Landroidx/camera/core/imagecapture/RequestWithCallback;
    invoke-virtual {v3, v0}, Landroidx/camera/core/imagecapture/RequestWithCallback;->abortAndSendErrorToApp(Landroidx/camera/core/ImageCaptureException;)V

    .line 176
    .end local v3    # "request":Landroidx/camera/core/imagecapture/RequestWithCallback;
    goto :goto_1

    .line 177
    :cond_1
    return-void
.end method

.method public getImagePipeline()Landroidx/camera/core/imagecapture/ImagePipeline;
    .locals 1

    .line 293
    iget-object v0, p0, Landroidx/camera/core/imagecapture/TakePictureManager;->mImagePipeline:Landroidx/camera/core/imagecapture/ImagePipeline;

    return-object v0
.end method

.method getIncompleteRequests()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/core/imagecapture/RequestWithCallback;",
            ">;"
        }
    .end annotation

    .line 287
    iget-object v0, p0, Landroidx/camera/core/imagecapture/TakePictureManager;->mIncompleteRequests:Ljava/util/List;

    return-object v0
.end method

.method hasCapturingRequest()Z
    .locals 1

    .line 282
    iget-object v0, p0, Landroidx/camera/core/imagecapture/TakePictureManager;->mCapturingRequest:Landroidx/camera/core/imagecapture/RequestWithCallback;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method issueNextRequest()V
    .locals 6

    .line 184
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 185
    const-string v0, "Issue the next TakePictureRequest."

    const-string/jumbo v1, "TakePictureManager"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 186
    invoke-virtual {p0}, Landroidx/camera/core/imagecapture/TakePictureManager;->hasCapturingRequest()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 187
    const-string/jumbo v0, "There is already a request in-flight."

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    return-void

    .line 190
    :cond_0
    iget-boolean v0, p0, Landroidx/camera/core/imagecapture/TakePictureManager;->mPaused:Z

    if-eqz v0, :cond_1

    .line 191
    const-string/jumbo v0, "The class is paused."

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    return-void

    .line 194
    :cond_1
    iget-object v0, p0, Landroidx/camera/core/imagecapture/TakePictureManager;->mImagePipeline:Landroidx/camera/core/imagecapture/ImagePipeline;

    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/ImagePipeline;->getCapacity()I

    move-result v0

    if-nez v0, :cond_2

    .line 195
    const-string/jumbo v0, "Too many acquire images. Close image to be able to process next."

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    return-void

    .line 198
    :cond_2
    iget-object v0, p0, Landroidx/camera/core/imagecapture/TakePictureManager;->mNewRequests:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/imagecapture/TakePictureRequest;

    .line 199
    .local v0, "request":Landroidx/camera/core/imagecapture/TakePictureRequest;
    if-nez v0, :cond_3

    .line 200
    const-string v2, "No new request."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 201
    return-void

    .line 204
    :cond_3
    new-instance v1, Landroidx/camera/core/imagecapture/RequestWithCallback;

    invoke-direct {v1, v0, p0}, Landroidx/camera/core/imagecapture/RequestWithCallback;-><init>(Landroidx/camera/core/imagecapture/TakePictureRequest;Landroidx/camera/core/imagecapture/TakePictureRequest$RetryControl;)V

    .line 205
    .local v1, "requestWithCallback":Landroidx/camera/core/imagecapture/RequestWithCallback;
    invoke-direct {p0, v1}, Landroidx/camera/core/imagecapture/TakePictureManager;->trackCurrentRequests(Landroidx/camera/core/imagecapture/RequestWithCallback;)V

    .line 208
    iget-object v2, p0, Landroidx/camera/core/imagecapture/TakePictureManager;->mImagePipeline:Landroidx/camera/core/imagecapture/ImagePipeline;

    .line 210
    invoke-virtual {v1}, Landroidx/camera/core/imagecapture/RequestWithCallback;->getCaptureFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v3

    .line 209
    invoke-virtual {v2, v0, v1, v3}, Landroidx/camera/core/imagecapture/ImagePipeline;->createRequests(Landroidx/camera/core/imagecapture/TakePictureRequest;Landroidx/camera/core/imagecapture/TakePictureCallback;Lcom/google/common/util/concurrent/ListenableFuture;)Landroidx/core/util/Pair;

    move-result-object v2

    .line 211
    .local v2, "requests":Landroidx/core/util/Pair;, "Landroidx/core/util/Pair<Landroidx/camera/core/imagecapture/CameraRequest;Landroidx/camera/core/imagecapture/ProcessingRequest;>;"
    iget-object v3, v2, Landroidx/core/util/Pair;->first:Ljava/lang/Object;

    check-cast v3, Landroidx/camera/core/imagecapture/CameraRequest;

    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/imagecapture/CameraRequest;

    .line 212
    .local v3, "cameraRequest":Landroidx/camera/core/imagecapture/CameraRequest;
    iget-object v4, v2, Landroidx/core/util/Pair;->second:Ljava/lang/Object;

    check-cast v4, Landroidx/camera/core/imagecapture/ProcessingRequest;

    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/imagecapture/ProcessingRequest;

    .line 213
    .local v4, "processingRequest":Landroidx/camera/core/imagecapture/ProcessingRequest;
    iget-object v5, p0, Landroidx/camera/core/imagecapture/TakePictureManager;->mImagePipeline:Landroidx/camera/core/imagecapture/ImagePipeline;

    invoke-virtual {v5, v4}, Landroidx/camera/core/imagecapture/ImagePipeline;->submitProcessingRequest(Landroidx/camera/core/imagecapture/ProcessingRequest;)V

    .line 214
    invoke-direct {p0, v3}, Landroidx/camera/core/imagecapture/TakePictureManager;->submitCameraRequest(Landroidx/camera/core/imagecapture/CameraRequest;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v5

    .line 215
    .local v5, "captureRequestFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;"
    invoke-virtual {v1, v5}, Landroidx/camera/core/imagecapture/RequestWithCallback;->setCaptureRequestFuture(Lcom/google/common/util/concurrent/ListenableFuture;)V

    .line 216
    return-void
.end method

.method synthetic lambda$trackCurrentRequests$0$androidx-camera-core-imagecapture-TakePictureManager()V
    .locals 1

    .line 227
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/core/imagecapture/TakePictureManager;->mCapturingRequest:Landroidx/camera/core/imagecapture/RequestWithCallback;

    .line 228
    invoke-virtual {p0}, Landroidx/camera/core/imagecapture/TakePictureManager;->issueNextRequest()V

    .line 229
    return-void
.end method

.method synthetic lambda$trackCurrentRequests$1$androidx-camera-core-imagecapture-TakePictureManager(Landroidx/camera/core/imagecapture/RequestWithCallback;)V
    .locals 1
    .param p1, "requestWithCallback"    # Landroidx/camera/core/imagecapture/RequestWithCallback;

    .line 234
    iget-object v0, p0, Landroidx/camera/core/imagecapture/TakePictureManager;->mIncompleteRequests:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 235
    return-void
.end method

.method public offerRequest(Landroidx/camera/core/imagecapture/TakePictureRequest;)V
    .locals 1
    .param p1, "takePictureRequest"    # Landroidx/camera/core/imagecapture/TakePictureRequest;

    .line 115
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 116
    iget-object v0, p0, Landroidx/camera/core/imagecapture/TakePictureManager;->mNewRequests:Ljava/util/Deque;

    invoke-interface {v0, p1}, Ljava/util/Deque;->offer(Ljava/lang/Object;)Z

    .line 117
    invoke-virtual {p0}, Landroidx/camera/core/imagecapture/TakePictureManager;->issueNextRequest()V

    .line 118
    return-void
.end method

.method public onImageClose(Landroidx/camera/core/ImageProxy;)V
    .locals 2
    .param p1, "image"    # Landroidx/camera/core/ImageProxy;

    .line 298
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    new-instance v1, Landroidx/camera/core/imagecapture/TakePictureManager$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Landroidx/camera/core/imagecapture/TakePictureManager$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/core/imagecapture/TakePictureManager;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 299
    return-void
.end method

.method public pause()V
    .locals 1

    .line 136
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 137
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/camera/core/imagecapture/TakePictureManager;->mPaused:Z

    .line 140
    iget-object v0, p0, Landroidx/camera/core/imagecapture/TakePictureManager;->mCapturingRequest:Landroidx/camera/core/imagecapture/RequestWithCallback;

    if-eqz v0, :cond_0

    .line 141
    iget-object v0, p0, Landroidx/camera/core/imagecapture/TakePictureManager;->mCapturingRequest:Landroidx/camera/core/imagecapture/RequestWithCallback;

    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/RequestWithCallback;->abortSilentlyAndRetry()V

    .line 143
    :cond_0
    return-void
.end method

.method public resume()V
    .locals 1

    .line 150
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 151
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/core/imagecapture/TakePictureManager;->mPaused:Z

    .line 152
    invoke-virtual {p0}, Landroidx/camera/core/imagecapture/TakePictureManager;->issueNextRequest()V

    .line 153
    return-void
.end method

.method public retryRequest(Landroidx/camera/core/imagecapture/TakePictureRequest;)V
    .locals 2
    .param p1, "request"    # Landroidx/camera/core/imagecapture/TakePictureRequest;

    .line 123
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 124
    const-string/jumbo v0, "TakePictureManager"

    const-string v1, "Add a new request for retrying."

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    iget-object v0, p0, Landroidx/camera/core/imagecapture/TakePictureManager;->mNewRequests:Ljava/util/Deque;

    invoke-interface {v0, p1}, Ljava/util/Deque;->addFirst(Ljava/lang/Object;)V

    .line 128
    invoke-virtual {p0}, Landroidx/camera/core/imagecapture/TakePictureManager;->issueNextRequest()V

    .line 129
    return-void
.end method

.method public setImagePipeline(Landroidx/camera/core/imagecapture/ImagePipeline;)V
    .locals 1
    .param p1, "imagePipeline"    # Landroidx/camera/core/imagecapture/ImagePipeline;

    .line 103
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 104
    iput-object p1, p0, Landroidx/camera/core/imagecapture/TakePictureManager;->mImagePipeline:Landroidx/camera/core/imagecapture/ImagePipeline;

    .line 105
    iget-object v0, p0, Landroidx/camera/core/imagecapture/TakePictureManager;->mImagePipeline:Landroidx/camera/core/imagecapture/ImagePipeline;

    invoke-virtual {v0, p0}, Landroidx/camera/core/imagecapture/ImagePipeline;->setOnImageCloseListener(Landroidx/camera/core/ForwardingImageProxy$OnImageCloseListener;)V

    .line 106
    return-void
.end method
