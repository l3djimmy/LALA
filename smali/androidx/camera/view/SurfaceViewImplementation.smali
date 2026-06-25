.class final Landroidx/camera/view/SurfaceViewImplementation;
.super Landroidx/camera/view/PreviewViewImplementation;
.source "SurfaceViewImplementation.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;,
        Landroidx/camera/view/SurfaceViewImplementation$Api24Impl;
    }
.end annotation


# static fields
.field private static final SCREENSHOT_TIMEOUT_MILLIS:I = 0x64

.field private static final TAG:Ljava/lang/String; = "SurfaceViewImpl"


# instance fields
.field final mSurfaceRequestCallback:Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;

.field mSurfaceView:Landroid/view/SurfaceView;


# direct methods
.method constructor <init>(Landroid/widget/FrameLayout;Landroidx/camera/view/PreviewTransformation;)V
    .locals 1
    .param p1, "parent"    # Landroid/widget/FrameLayout;
    .param p2, "previewTransform"    # Landroidx/camera/view/PreviewTransformation;

    .line 71
    invoke-direct {p0, p1, p2}, Landroidx/camera/view/PreviewViewImplementation;-><init>(Landroid/widget/FrameLayout;Landroidx/camera/view/PreviewTransformation;)V

    .line 66
    new-instance v0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;

    invoke-direct {v0, p0}, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;-><init>(Landroidx/camera/view/SurfaceViewImplementation;)V

    iput-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation;->mSurfaceRequestCallback:Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;

    .line 72
    return-void
.end method

.method static synthetic lambda$getPreviewBitmap$1(Ljava/util/concurrent/Semaphore;I)V
    .locals 3
    .param p0, "screenshotLock"    # Ljava/util/concurrent/Semaphore;
    .param p1, "copyResult"    # I

    .line 151
    const-string/jumbo v0, "SurfaceViewImpl"

    if-nez p1, :cond_0

    .line 152
    const-string/jumbo v1, "PreviewView.SurfaceViewImplementation.getBitmap() succeeded"

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 154
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "PreviewView.SurfaceViewImplementation.getBitmap() failed with error "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    :goto_0
    invoke-virtual {p0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 158
    return-void
.end method

.method private static shouldReusePreview(Landroid/view/SurfaceView;Landroid/util/Size;Landroidx/camera/core/SurfaceRequest;)Z
    .locals 2
    .param p0, "surfaceView"    # Landroid/view/SurfaceView;
    .param p1, "resolution"    # Landroid/util/Size;
    .param p2, "surfaceRequest"    # Landroidx/camera/core/SurfaceRequest;

    .line 379
    invoke-virtual {p2}, Landroidx/camera/core/SurfaceRequest;->getResolution()Landroid/util/Size;

    move-result-object v0

    invoke-static {p1, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    .line 380
    .local v0, "isSameResolution":Z
    if-eqz p0, :cond_0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method


# virtual methods
.method getPreview()Landroid/view/View;
    .locals 1

    .line 112
    iget-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation;->mSurfaceView:Landroid/view/SurfaceView;

    return-object v0
.end method

.method getPreviewBitmap()Landroid/graphics/Bitmap;
    .locals 9

    .line 135
    const-string/jumbo v0, "SurfaceViewImpl"

    iget-object v1, p0, Landroidx/camera/view/SurfaceViewImplementation;->mSurfaceView:Landroid/view/SurfaceView;

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroidx/camera/view/SurfaceViewImplementation;->mSurfaceView:Landroid/view/SurfaceView;

    invoke-virtual {v1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroidx/camera/view/SurfaceViewImplementation;->mSurfaceView:Landroid/view/SurfaceView;

    .line 136
    invoke-virtual {v1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Surface;->isValid()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_3

    .line 140
    :cond_0
    new-instance v1, Ljava/util/concurrent/Semaphore;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    .line 143
    .local v1, "screenshotLock":Ljava/util/concurrent/Semaphore;
    iget-object v2, p0, Landroidx/camera/view/SurfaceViewImplementation;->mSurfaceView:Landroid/view/SurfaceView;

    invoke-virtual {v2}, Landroid/view/SurfaceView;->getWidth()I

    move-result v2

    iget-object v3, p0, Landroidx/camera/view/SurfaceViewImplementation;->mSurfaceView:Landroid/view/SurfaceView;

    invoke-virtual {v3}, Landroid/view/SurfaceView;->getHeight()I

    move-result v3

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 146
    .local v2, "bitmap":Landroid/graphics/Bitmap;
    new-instance v3, Landroid/os/HandlerThread;

    const-string/jumbo v4, "pixelCopyRequest Thread"

    invoke-direct {v3, v4}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 147
    .local v3, "backgroundThread":Landroid/os/HandlerThread;
    invoke-virtual {v3}, Landroid/os/HandlerThread;->start()V

    .line 148
    new-instance v4, Landroid/os/Handler;

    invoke-virtual {v3}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 150
    .local v4, "backgroundHandler":Landroid/os/Handler;
    iget-object v5, p0, Landroidx/camera/view/SurfaceViewImplementation;->mSurfaceView:Landroid/view/SurfaceView;

    new-instance v6, Landroidx/camera/view/SurfaceViewImplementation$$ExternalSyntheticLambda2;

    invoke-direct {v6, v1}, Landroidx/camera/view/SurfaceViewImplementation$$ExternalSyntheticLambda2;-><init>(Ljava/util/concurrent/Semaphore;)V

    invoke-static {v5, v2, v6, v4}, Landroidx/camera/view/SurfaceViewImplementation$Api24Impl;->pixelCopyRequest(Landroid/view/SurfaceView;Landroid/graphics/Bitmap;Landroid/view/PixelCopy$OnPixelCopyFinishedListener;Landroid/os/Handler;)V

    .line 161
    :try_start_0
    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v6, 0x1

    const-wide/16 v7, 0x64

    invoke-virtual {v1, v6, v7, v8, v5}, Ljava/util/concurrent/Semaphore;->tryAcquire(IJLjava/util/concurrent/TimeUnit;)Z

    move-result v5

    .line 163
    .local v5, "success":Z
    if-nez v5, :cond_1

    .line 167
    const-string/jumbo v6, "Timed out while trying to acquire screenshot."

    invoke-static {v0, v6}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 172
    .end local v5    # "success":Z
    :cond_1
    :goto_0
    invoke-virtual {v3}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 173
    goto :goto_1

    .line 172
    :catchall_0
    move-exception v0

    goto :goto_2

    .line 169
    :catch_0
    move-exception v5

    .line 170
    .local v5, "e":Ljava/lang/InterruptedException;
    :try_start_1
    const-string v6, "Interrupted while trying to acquire screenshot."

    invoke-static {v0, v6, v5}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local v5    # "e":Ljava/lang/InterruptedException;
    goto :goto_0

    .line 174
    :goto_1
    return-object v2

    .line 172
    :goto_2
    invoke-virtual {v3}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 173
    throw v0

    .line 137
    .end local v1    # "screenshotLock":Ljava/util/concurrent/Semaphore;
    .end local v2    # "bitmap":Landroid/graphics/Bitmap;
    .end local v3    # "backgroundThread":Landroid/os/HandlerThread;
    .end local v4    # "backgroundHandler":Landroid/os/Handler;
    :cond_2
    :goto_3
    const/4 v0, 0x0

    return-object v0
.end method

.method initializePreview()V
    .locals 4

    .line 98
    iget-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation;->mParent:Landroid/widget/FrameLayout;

    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    iget-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation;->mResolution:Landroid/util/Size;

    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    new-instance v0, Landroid/view/SurfaceView;

    iget-object v1, p0, Landroidx/camera/view/SurfaceViewImplementation;->mParent:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation;->mSurfaceView:Landroid/view/SurfaceView;

    .line 102
    iget-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation;->mSurfaceView:Landroid/view/SurfaceView;

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    iget-object v2, p0, Landroidx/camera/view/SurfaceViewImplementation;->mResolution:Landroid/util/Size;

    .line 103
    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v2

    iget-object v3, p0, Landroidx/camera/view/SurfaceViewImplementation;->mResolution:Landroid/util/Size;

    invoke-virtual {v3}, Landroid/util/Size;->getHeight()I

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 102
    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 104
    iget-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation;->mParent:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 105
    iget-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation;->mParent:Landroid/widget/FrameLayout;

    iget-object v1, p0, Landroidx/camera/view/SurfaceViewImplementation;->mSurfaceView:Landroid/view/SurfaceView;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 106
    iget-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation;->mSurfaceView:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/view/SurfaceViewImplementation;->mSurfaceRequestCallback:Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 107
    return-void
.end method

.method synthetic lambda$onSurfaceRequested$0$androidx-camera-view-SurfaceViewImplementation(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/view/PreviewViewImplementation$OnSurfaceNotInUseListener;)V
    .locals 1
    .param p1, "surfaceRequest"    # Landroidx/camera/core/SurfaceRequest;
    .param p2, "onSurfaceNotInUseListener"    # Landroidx/camera/view/PreviewViewImplementation$OnSurfaceNotInUseListener;

    .line 92
    iget-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation;->mSurfaceRequestCallback:Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;

    invoke-virtual {v0, p1, p2}, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->setSurfaceRequest(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/view/PreviewViewImplementation$OnSurfaceNotInUseListener;)V

    return-void
.end method

.method onAttachedToWindow()V
    .locals 0

    .line 118
    return-void
.end method

.method onDetachedFromWindow()V
    .locals 0

    .line 123
    return-void
.end method

.method onSurfaceRequested(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/view/PreviewViewImplementation$OnSurfaceNotInUseListener;)V
    .locals 2
    .param p1, "surfaceRequest"    # Landroidx/camera/core/SurfaceRequest;
    .param p2, "onSurfaceNotInUseListener"    # Landroidx/camera/view/PreviewViewImplementation$OnSurfaceNotInUseListener;

    .line 77
    iget-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation;->mSurfaceView:Landroid/view/SurfaceView;

    iget-object v1, p0, Landroidx/camera/view/SurfaceViewImplementation;->mResolution:Landroid/util/Size;

    invoke-static {v0, v1, p1}, Landroidx/camera/view/SurfaceViewImplementation;->shouldReusePreview(Landroid/view/SurfaceView;Landroid/util/Size;Landroidx/camera/core/SurfaceRequest;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 78
    invoke-virtual {p1}, Landroidx/camera/core/SurfaceRequest;->getResolution()Landroid/util/Size;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation;->mResolution:Landroid/util/Size;

    .line 79
    invoke-virtual {p0}, Landroidx/camera/view/SurfaceViewImplementation;->initializePreview()V

    .line 81
    :cond_0
    if-eqz p2, :cond_1

    .line 82
    iget-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation;->mSurfaceView:Landroid/view/SurfaceView;

    .line 83
    invoke-virtual {v0}, Landroid/view/SurfaceView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroidx/core/content/ContextCompat;->getMainExecutor(Landroid/content/Context;)Ljava/util/concurrent/Executor;

    move-result-object v0

    .line 84
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Landroidx/camera/view/SurfaceViewImplementation$$ExternalSyntheticLambda0;

    invoke-direct {v1, p2}, Landroidx/camera/view/SurfaceViewImplementation$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/view/PreviewViewImplementation$OnSurfaceNotInUseListener;)V

    .line 82
    invoke-virtual {p1, v0, v1}, Landroidx/camera/core/SurfaceRequest;->addRequestCancellationListener(Ljava/util/concurrent/Executor;Ljava/lang/Runnable;)V

    .line 92
    :cond_1
    iget-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation;->mSurfaceView:Landroid/view/SurfaceView;

    new-instance v1, Landroidx/camera/view/SurfaceViewImplementation$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1, p2}, Landroidx/camera/view/SurfaceViewImplementation$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/view/SurfaceViewImplementation;Landroidx/camera/core/SurfaceRequest;Landroidx/camera/view/PreviewViewImplementation$OnSurfaceNotInUseListener;)V

    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->post(Ljava/lang/Runnable;)Z

    .line 94
    return-void
.end method

.method setFrameUpdateListener(Ljava/util/concurrent/Executor;Landroidx/camera/view/PreviewView$OnFrameUpdateListener;)V
    .locals 2
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "listener"    # Landroidx/camera/view/PreviewView$OnFrameUpdateListener;

    .line 358
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "SurfaceView doesn\'t support frame update listener"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method waitForNextFrame()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 352
    const/4 v0, 0x0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFuture(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method
