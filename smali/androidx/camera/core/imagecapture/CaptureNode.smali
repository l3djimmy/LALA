.class Landroidx/camera/core/imagecapture/CaptureNode;
.super Ljava/lang/Object;
.source "CaptureNode.java"

# interfaces
.implements Landroidx/camera/core/processing/Node;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/imagecapture/CaptureNode$In;,
        Landroidx/camera/core/imagecapture/CaptureNode$Out;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/camera/core/processing/Node<",
        "Landroidx/camera/core/imagecapture/CaptureNode$In;",
        "Landroidx/camera/core/imagecapture/CaptureNode$Out;",
        ">;"
    }
.end annotation


# static fields
.field static final MAX_IMAGES:I = 0x4

.field private static final TAG:Ljava/lang/String; = "CaptureNode"


# instance fields
.field mCurrentRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

.field private mInputEdge:Landroidx/camera/core/imagecapture/CaptureNode$In;

.field private mOutputEdge:Landroidx/camera/core/imagecapture/CaptureNode$Out;

.field private final mPendingStageIds:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field mSafeCloseImageReaderProxy:Landroidx/camera/core/SafeCloseImageReaderProxy;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mPendingStageIds:Ljava/util/Set;

    .line 84
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mCurrentRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    return-void
.end method

.method private static createImageReaderProxy(Landroidx/camera/core/ImageReaderProxyProvider;III)Landroidx/camera/core/impl/ImageReaderProxy;
    .locals 7
    .param p0, "imageReaderProxyProvider"    # Landroidx/camera/core/ImageReaderProxyProvider;
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "format"    # I

    .line 154
    if-eqz p0, :cond_0

    .line 155
    const/4 v4, 0x4

    const-wide/16 v5, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    .end local p0    # "imageReaderProxyProvider":Landroidx/camera/core/ImageReaderProxyProvider;
    .end local p1    # "width":I
    .end local p2    # "height":I
    .end local p3    # "format":I
    .local v0, "imageReaderProxyProvider":Landroidx/camera/core/ImageReaderProxyProvider;
    .local v1, "width":I
    .local v2, "height":I
    .local v3, "format":I
    invoke-interface/range {v0 .. v6}, Landroidx/camera/core/ImageReaderProxyProvider;->newInstance(IIIIJ)Landroidx/camera/core/impl/ImageReaderProxy;

    move-result-object p0

    return-object p0

    .line 157
    .end local v0    # "imageReaderProxyProvider":Landroidx/camera/core/ImageReaderProxyProvider;
    .end local v1    # "width":I
    .end local v2    # "height":I
    .end local v3    # "format":I
    .restart local p0    # "imageReaderProxyProvider":Landroidx/camera/core/ImageReaderProxyProvider;
    .restart local p1    # "width":I
    .restart local p2    # "height":I
    .restart local p3    # "format":I
    :cond_0
    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    .end local p0    # "imageReaderProxyProvider":Landroidx/camera/core/ImageReaderProxyProvider;
    .end local p1    # "width":I
    .end local p2    # "height":I
    .end local p3    # "format":I
    .restart local v0    # "imageReaderProxyProvider":Landroidx/camera/core/ImageReaderProxyProvider;
    .restart local v1    # "width":I
    .restart local v2    # "height":I
    .restart local v3    # "format":I
    const/4 p0, 0x4

    invoke-static {v1, v2, v3, p0}, Landroidx/camera/core/ImageReaderProxys;->createIsolatedReader(IIII)Landroidx/camera/core/impl/ImageReaderProxy;

    move-result-object p0

    return-object p0
.end method

.method private matchAndPropagateImage(Landroidx/camera/core/ImageProxy;)V
    .locals 4
    .param p1, "imageProxy"    # Landroidx/camera/core/ImageProxy;

    .line 176
    nop

    .line 177
    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->getImageInfo()Landroidx/camera/core/ImageInfo;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/ImageInfo;->getTagBundle()Landroidx/camera/core/impl/TagBundle;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mCurrentRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    invoke-virtual {v1}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getTagBundleKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/TagBundle;->getTag(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 176
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 178
    .local v0, "stageId":I
    iget-object v1, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mPendingStageIds:Ljava/util/Set;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Received an unexpected stage id"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 180
    iget-object v1, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mPendingStageIds:Ljava/util/Set;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 183
    iget-object v1, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mOutputEdge:Landroidx/camera/core/imagecapture/CaptureNode$Out;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/imagecapture/CaptureNode$Out;

    invoke-virtual {v1}, Landroidx/camera/core/imagecapture/CaptureNode$Out;->getImageEdge()Landroidx/camera/core/processing/Edge;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroidx/camera/core/processing/Edge;->accept(Ljava/lang/Object;)V

    .line 185
    iget-object v1, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mPendingStageIds:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 187
    iget-object v1, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mCurrentRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    .line 188
    .local v1, "request":Landroidx/camera/core/imagecapture/ProcessingRequest;
    const/4 v2, 0x0

    iput-object v2, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mCurrentRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    .line 189
    invoke-virtual {v1}, Landroidx/camera/core/imagecapture/ProcessingRequest;->onImageCaptured()V

    .line 191
    .end local v1    # "request":Landroidx/camera/core/imagecapture/ProcessingRequest;
    :cond_0
    return-void
.end method

.method private releaseInputResources(Landroidx/camera/core/imagecapture/CaptureNode$In;Landroidx/camera/core/SafeCloseImageReaderProxy;)V
    .locals 3
    .param p1, "inputEdge"    # Landroidx/camera/core/imagecapture/CaptureNode$In;
    .param p2, "imageReader"    # Landroidx/camera/core/SafeCloseImageReaderProxy;

    .line 244
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/impl/DeferrableSurface;->close()V

    .line 247
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/impl/DeferrableSurface;->getTerminationFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 248
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Landroidx/camera/core/imagecapture/CaptureNode$$ExternalSyntheticLambda4;

    invoke-direct {v1, p2}, Landroidx/camera/core/imagecapture/CaptureNode$$ExternalSyntheticLambda4;-><init>(Landroidx/camera/core/SafeCloseImageReaderProxy;)V

    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v2

    .line 247
    invoke-interface {v0, v1, v2}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 249
    return-void
.end method


# virtual methods
.method public getCapacity()I
    .locals 2

    .line 265
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 266
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mSafeCloseImageReaderProxy:Landroidx/camera/core/SafeCloseImageReaderProxy;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string/jumbo v1, "The ImageReader is not initialized."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 268
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mSafeCloseImageReaderProxy:Landroidx/camera/core/SafeCloseImageReaderProxy;

    invoke-virtual {v0}, Landroidx/camera/core/SafeCloseImageReaderProxy;->getCapacity()I

    move-result v0

    return v0
.end method

.method getInputEdge()Landroidx/camera/core/imagecapture/CaptureNode$In;
    .locals 1

    .line 254
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mInputEdge:Landroidx/camera/core/imagecapture/CaptureNode$In;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/imagecapture/CaptureNode$In;

    return-object v0
.end method

.method public getSafeCloseImageReaderProxy()Landroidx/camera/core/SafeCloseImageReaderProxy;
    .locals 1

    .line 260
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mSafeCloseImageReaderProxy:Landroidx/camera/core/SafeCloseImageReaderProxy;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/SafeCloseImageReaderProxy;

    return-object v0
.end method

.method synthetic lambda$transform$0$androidx-camera-core-imagecapture-CaptureNode(Landroidx/camera/core/imagecapture/NoMetadataImageReader;Landroidx/camera/core/imagecapture/ProcessingRequest;)V
    .locals 0
    .param p1, "noMetadataImageReader"    # Landroidx/camera/core/imagecapture/NoMetadataImageReader;
    .param p2, "request"    # Landroidx/camera/core/imagecapture/ProcessingRequest;

    .line 121
    invoke-virtual {p0, p2}, Landroidx/camera/core/imagecapture/CaptureNode;->onRequestAvailable(Landroidx/camera/core/imagecapture/ProcessingRequest;)V

    .line 122
    invoke-virtual {p1, p2}, Landroidx/camera/core/imagecapture/NoMetadataImageReader;->acceptProcessingRequest(Landroidx/camera/core/imagecapture/ProcessingRequest;)V

    .line 123
    return-void
.end method

.method synthetic lambda$transform$1$androidx-camera-core-imagecapture-CaptureNode(Landroidx/camera/core/impl/ImageReaderProxy;)V
    .locals 5
    .param p1, "imageReader"    # Landroidx/camera/core/impl/ImageReaderProxy;

    .line 131
    const-string v0, "Failed to acquire latest image"

    const/4 v1, 0x2

    :try_start_0
    invoke-interface {p1}, Landroidx/camera/core/impl/ImageReaderProxy;->acquireLatestImage()Landroidx/camera/core/ImageProxy;

    move-result-object v2

    .line 132
    .local v2, "image":Landroidx/camera/core/ImageProxy;
    if-eqz v2, :cond_0

    .line 133
    invoke-virtual {p0, v2}, Landroidx/camera/core/imagecapture/CaptureNode;->onImageProxyAvailable(Landroidx/camera/core/ImageProxy;)V

    goto :goto_0

    .line 135
    :cond_0
    new-instance v3, Landroidx/camera/core/ImageCaptureException;

    const/4 v4, 0x0

    invoke-direct {v3, v1, v0, v4}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    invoke-virtual {p0, v3}, Landroidx/camera/core/imagecapture/CaptureNode;->sendCaptureError(Landroidx/camera/core/ImageCaptureException;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 141
    .end local v2    # "image":Landroidx/camera/core/ImageProxy;
    :goto_0
    goto :goto_1

    .line 138
    :catch_0
    move-exception v2

    .line 139
    .local v2, "e":Ljava/lang/IllegalStateException;
    new-instance v3, Landroidx/camera/core/ImageCaptureException;

    invoke-direct {v3, v1, v0, v2}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    invoke-virtual {p0, v3}, Landroidx/camera/core/imagecapture/CaptureNode;->sendCaptureError(Landroidx/camera/core/ImageCaptureException;)V

    .line 142
    .end local v2    # "e":Ljava/lang/IllegalStateException;
    :goto_1
    return-void
.end method

.method onImageProxyAvailable(Landroidx/camera/core/ImageProxy;)V
    .locals 2
    .param p1, "imageProxy"    # Landroidx/camera/core/ImageProxy;

    .line 164
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 165
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mCurrentRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    if-nez v0, :cond_0

    .line 166
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Discarding ImageProxy which was inadvertently acquired: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CaptureNode"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->close()V

    goto :goto_0

    .line 170
    :cond_0
    invoke-direct {p0, p1}, Landroidx/camera/core/imagecapture/CaptureNode;->matchAndPropagateImage(Landroidx/camera/core/ImageProxy;)V

    .line 172
    :goto_0
    return-void
.end method

.method onRequestAvailable(Landroidx/camera/core/imagecapture/ProcessingRequest;)V
    .locals 4
    .param p1, "request"    # Landroidx/camera/core/imagecapture/ProcessingRequest;

    .line 196
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 198
    invoke-virtual {p0}, Landroidx/camera/core/imagecapture/CaptureNode;->getCapacity()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-lez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    const-string/jumbo v3, "Too many acquire images. Close image to be able to process next."

    invoke-static {v0, v3}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 201
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mCurrentRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mPendingStageIds:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    move v1, v2

    :cond_2
    :goto_1
    const-string/jumbo v0, "The previous request is not complete"

    invoke-static {v1, v0}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 205
    iput-object p1, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mCurrentRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    .line 206
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mPendingStageIds:Ljava/util/Set;

    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getStageIds()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 209
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mOutputEdge:Landroidx/camera/core/imagecapture/CaptureNode$Out;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/imagecapture/CaptureNode$Out;

    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/CaptureNode$Out;->getRequestEdge()Landroidx/camera/core/processing/Edge;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroidx/camera/core/processing/Edge;->accept(Ljava/lang/Object;)V

    .line 210
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/ProcessingRequest;->getCaptureFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    new-instance v1, Landroidx/camera/core/imagecapture/CaptureNode$1;

    invoke-direct {v1, p0, p1}, Landroidx/camera/core/imagecapture/CaptureNode$1;-><init>(Landroidx/camera/core/imagecapture/CaptureNode;Landroidx/camera/core/imagecapture/ProcessingRequest;)V

    .line 223
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    .line 210
    invoke-static {v0, v1, v2}, Landroidx/camera/core/impl/utils/futures/Futures;->addCallback(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/camera/core/impl/utils/futures/FutureCallback;Ljava/util/concurrent/Executor;)V

    .line 224
    return-void
.end method

.method public release()V
    .locals 2

    .line 237
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 238
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mInputEdge:Landroidx/camera/core/imagecapture/CaptureNode$In;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/imagecapture/CaptureNode$In;

    iget-object v1, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mSafeCloseImageReaderProxy:Landroidx/camera/core/SafeCloseImageReaderProxy;

    .line 239
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/SafeCloseImageReaderProxy;

    .line 238
    invoke-direct {p0, v0, v1}, Landroidx/camera/core/imagecapture/CaptureNode;->releaseInputResources(Landroidx/camera/core/imagecapture/CaptureNode$In;Landroidx/camera/core/SafeCloseImageReaderProxy;)V

    .line 240
    return-void
.end method

.method sendCaptureError(Landroidx/camera/core/ImageCaptureException;)V
    .locals 1
    .param p1, "e"    # Landroidx/camera/core/ImageCaptureException;

    .line 228
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 229
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mCurrentRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    if-eqz v0, :cond_0

    .line 230
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mCurrentRequest:Landroidx/camera/core/imagecapture/ProcessingRequest;

    invoke-virtual {v0, p1}, Landroidx/camera/core/imagecapture/ProcessingRequest;->onCaptureFailure(Landroidx/camera/core/ImageCaptureException;)V

    .line 232
    :cond_0
    return-void
.end method

.method public setOnImageCloseListener(Landroidx/camera/core/ForwardingImageProxy$OnImageCloseListener;)V
    .locals 2
    .param p1, "listener"    # Landroidx/camera/core/ForwardingImageProxy$OnImageCloseListener;

    .line 273
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 274
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mSafeCloseImageReaderProxy:Landroidx/camera/core/SafeCloseImageReaderProxy;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string/jumbo v1, "The ImageReader is not initialized."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 276
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mSafeCloseImageReaderProxy:Landroidx/camera/core/SafeCloseImageReaderProxy;

    invoke-virtual {v0, p1}, Landroidx/camera/core/SafeCloseImageReaderProxy;->setOnImageCloseListener(Landroidx/camera/core/ForwardingImageProxy$OnImageCloseListener;)V

    .line 277
    return-void
.end method

.method public transform(Landroidx/camera/core/imagecapture/CaptureNode$In;)Landroidx/camera/core/imagecapture/CaptureNode$Out;
    .locals 7
    .param p1, "inputEdge"    # Landroidx/camera/core/imagecapture/CaptureNode$In;

    .line 96
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mInputEdge:Landroidx/camera/core/imagecapture/CaptureNode$In;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    iget-object v0, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mSafeCloseImageReaderProxy:Landroidx/camera/core/SafeCloseImageReaderProxy;

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v2, "CaptureNode does not support recreation yet."

    invoke-static {v0, v2}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 98
    iput-object p1, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mInputEdge:Landroidx/camera/core/imagecapture/CaptureNode$In;

    .line 99
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getSize()Landroid/util/Size;

    move-result-object v0

    .line 100
    .local v0, "size":Landroid/util/Size;
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getInputFormat()I

    move-result v2

    .line 105
    .local v2, "format":I
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->isVirtualCamera()Z

    move-result v3

    xor-int/2addr v1, v3

    .line 106
    .local v1, "hasMetadata":Z
    if-eqz v1, :cond_1

    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getImageReaderProxyProvider()Landroidx/camera/core/ImageReaderProxyProvider;

    move-result-object v3

    if-nez v3, :cond_1

    .line 108
    new-instance v3, Landroidx/camera/core/MetadataImageReader;

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v4

    .line 109
    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    move-result v5

    const/4 v6, 0x4

    invoke-direct {v3, v4, v5, v2, v6}, Landroidx/camera/core/MetadataImageReader;-><init>(IIII)V

    .line 110
    .local v3, "metadataImageReader":Landroidx/camera/core/MetadataImageReader;
    invoke-virtual {v3}, Landroidx/camera/core/MetadataImageReader;->getCameraCaptureCallback()Landroidx/camera/core/impl/CameraCaptureCallback;

    move-result-object v4

    invoke-virtual {p1, v4}, Landroidx/camera/core/imagecapture/CaptureNode$In;->setCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)V

    .line 111
    move-object v4, v3

    .line 112
    .local v4, "wrappedImageReader":Landroidx/camera/core/impl/ImageReaderProxy;
    new-instance v5, Landroidx/camera/core/imagecapture/CaptureNode$$ExternalSyntheticLambda0;

    invoke-direct {v5, p0}, Landroidx/camera/core/imagecapture/CaptureNode$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/core/imagecapture/CaptureNode;)V

    .line 113
    .end local v3    # "metadataImageReader":Landroidx/camera/core/MetadataImageReader;
    .local v5, "requestConsumer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroidx/camera/core/imagecapture/ProcessingRequest;>;"
    goto :goto_1

    .line 115
    .end local v4    # "wrappedImageReader":Landroidx/camera/core/impl/ImageReaderProxy;
    .end local v5    # "requestConsumer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroidx/camera/core/imagecapture/ProcessingRequest;>;"
    :cond_1
    new-instance v3, Landroidx/camera/core/imagecapture/NoMetadataImageReader;

    .line 116
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getImageReaderProxyProvider()Landroidx/camera/core/ImageReaderProxyProvider;

    move-result-object v4

    .line 117
    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v5

    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    move-result v6

    .line 116
    invoke-static {v4, v5, v6, v2}, Landroidx/camera/core/imagecapture/CaptureNode;->createImageReaderProxy(Landroidx/camera/core/ImageReaderProxyProvider;III)Landroidx/camera/core/impl/ImageReaderProxy;

    move-result-object v4

    invoke-direct {v3, v4}, Landroidx/camera/core/imagecapture/NoMetadataImageReader;-><init>(Landroidx/camera/core/impl/ImageReaderProxy;)V

    .line 118
    .local v3, "noMetadataImageReader":Landroidx/camera/core/imagecapture/NoMetadataImageReader;
    move-object v4, v3

    .line 120
    .restart local v4    # "wrappedImageReader":Landroidx/camera/core/impl/ImageReaderProxy;
    new-instance v5, Landroidx/camera/core/imagecapture/CaptureNode$$ExternalSyntheticLambda1;

    invoke-direct {v5, p0, v3}, Landroidx/camera/core/imagecapture/CaptureNode$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/core/imagecapture/CaptureNode;Landroidx/camera/core/imagecapture/NoMetadataImageReader;)V

    .line 125
    .end local v3    # "noMetadataImageReader":Landroidx/camera/core/imagecapture/NoMetadataImageReader;
    .restart local v5    # "requestConsumer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroidx/camera/core/imagecapture/ProcessingRequest;>;"
    :goto_1
    invoke-interface {v4}, Landroidx/camera/core/impl/ImageReaderProxy;->getSurface()Landroid/view/Surface;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/Surface;

    invoke-virtual {p1, v3}, Landroidx/camera/core/imagecapture/CaptureNode$In;->setSurface(Landroid/view/Surface;)V

    .line 126
    new-instance v3, Landroidx/camera/core/SafeCloseImageReaderProxy;

    invoke-direct {v3, v4}, Landroidx/camera/core/SafeCloseImageReaderProxy;-><init>(Landroidx/camera/core/impl/ImageReaderProxy;)V

    iput-object v3, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mSafeCloseImageReaderProxy:Landroidx/camera/core/SafeCloseImageReaderProxy;

    .line 129
    new-instance v3, Landroidx/camera/core/imagecapture/CaptureNode$$ExternalSyntheticLambda2;

    invoke-direct {v3, p0}, Landroidx/camera/core/imagecapture/CaptureNode$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/core/imagecapture/CaptureNode;)V

    .line 142
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v6

    .line 129
    invoke-interface {v4, v3, v6}, Landroidx/camera/core/impl/ImageReaderProxy;->setOnImageAvailableListener(Landroidx/camera/core/impl/ImageReaderProxy$OnImageAvailableListener;Ljava/util/concurrent/Executor;)V

    .line 143
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getRequestEdge()Landroidx/camera/core/processing/Edge;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroidx/camera/core/processing/Edge;->setListener(Landroidx/core/util/Consumer;)V

    .line 144
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getErrorEdge()Landroidx/camera/core/processing/Edge;

    move-result-object v3

    new-instance v6, Landroidx/camera/core/imagecapture/CaptureNode$$ExternalSyntheticLambda3;

    invoke-direct {v6, p0}, Landroidx/camera/core/imagecapture/CaptureNode$$ExternalSyntheticLambda3;-><init>(Landroidx/camera/core/imagecapture/CaptureNode;)V

    invoke-virtual {v3, v6}, Landroidx/camera/core/processing/Edge;->setListener(Landroidx/core/util/Consumer;)V

    .line 146
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getInputFormat()I

    move-result v3

    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/CaptureNode$In;->getOutputFormat()I

    move-result v6

    invoke-static {v3, v6}, Landroidx/camera/core/imagecapture/CaptureNode$Out;->of(II)Landroidx/camera/core/imagecapture/CaptureNode$Out;

    move-result-object v3

    iput-object v3, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mOutputEdge:Landroidx/camera/core/imagecapture/CaptureNode$Out;

    .line 147
    iget-object v3, p0, Landroidx/camera/core/imagecapture/CaptureNode;->mOutputEdge:Landroidx/camera/core/imagecapture/CaptureNode$Out;

    return-object v3
.end method

.method public bridge synthetic transform(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 71
    check-cast p1, Landroidx/camera/core/imagecapture/CaptureNode$In;

    invoke-virtual {p0, p1}, Landroidx/camera/core/imagecapture/CaptureNode;->transform(Landroidx/camera/core/imagecapture/CaptureNode$In;)Landroidx/camera/core/imagecapture/CaptureNode$Out;

    move-result-object p1

    return-object p1
.end method
