.class Landroidx/camera/core/AndroidImageReaderProxy;
.super Ljava/lang/Object;
.source "AndroidImageReaderProxy.java"

# interfaces
.implements Landroidx/camera/core/impl/ImageReaderProxy;


# instance fields
.field private final mImageReader:Landroid/media/ImageReader;

.field private mIsImageAvailableListenerCleared:Z

.field private final mLock:Ljava/lang/Object;


# direct methods
.method constructor <init>(Landroid/media/ImageReader;)V
    .locals 1
    .param p1, "imageReader"    # Landroid/media/ImageReader;

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/AndroidImageReaderProxy;->mLock:Ljava/lang/Object;

    .line 44
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/camera/core/AndroidImageReaderProxy;->mIsImageAvailableListenerCleared:Z

    .line 54
    iput-object p1, p0, Landroidx/camera/core/AndroidImageReaderProxy;->mImageReader:Landroid/media/ImageReader;

    .line 55
    return-void
.end method

.method private isImageReaderContextNotInitializedException(Ljava/lang/RuntimeException;)Z
    .locals 2
    .param p1, "e"    # Ljava/lang/RuntimeException;

    .line 108
    const-string v0, "ImageReaderContext is not initialized"

    invoke-virtual {p1}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public acquireLatestImage()Landroidx/camera/core/ImageProxy;
    .locals 3

    .line 60
    iget-object v0, p0, Landroidx/camera/core/AndroidImageReaderProxy;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 63
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/AndroidImageReaderProxy;->mImageReader:Landroid/media/ImageReader;

    invoke-virtual {v1}, Landroid/media/ImageReader;->acquireLatestImage()Landroid/media/Image;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 73
    .local v1, "image":Landroid/media/Image;
    goto :goto_0

    .line 79
    .end local v1    # "image":Landroid/media/Image;
    :catchall_0
    move-exception v1

    goto :goto_1

    .line 64
    :catch_0
    move-exception v1

    .line 68
    .local v1, "e":Ljava/lang/RuntimeException;
    :try_start_1
    invoke-direct {p0, v1}, Landroidx/camera/core/AndroidImageReaderProxy;->isImageReaderContextNotInitializedException(Ljava/lang/RuntimeException;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 69
    const/4 v2, 0x0

    move-object v1, v2

    .line 75
    .local v1, "image":Landroid/media/Image;
    :goto_0
    if-nez v1, :cond_0

    .line 76
    monitor-exit v0

    const/4 v0, 0x0

    return-object v0

    .line 78
    :cond_0
    new-instance v2, Landroidx/camera/core/AndroidImageProxy;

    invoke-direct {v2, v1}, Landroidx/camera/core/AndroidImageProxy;-><init>(Landroid/media/Image;)V

    monitor-exit v0

    return-object v2

    .line 71
    .local v1, "e":Ljava/lang/RuntimeException;
    :cond_1
    throw v1

    .line 79
    .end local v1    # "e":Ljava/lang/RuntimeException;
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public acquireNextImage()Landroidx/camera/core/ImageProxy;
    .locals 3

    .line 85
    iget-object v0, p0, Landroidx/camera/core/AndroidImageReaderProxy;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 88
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/AndroidImageReaderProxy;->mImageReader:Landroid/media/ImageReader;

    invoke-virtual {v1}, Landroid/media/ImageReader;->acquireNextImage()Landroid/media/Image;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 98
    .local v1, "image":Landroid/media/Image;
    goto :goto_0

    .line 104
    .end local v1    # "image":Landroid/media/Image;
    :catchall_0
    move-exception v1

    goto :goto_1

    .line 89
    :catch_0
    move-exception v1

    .line 93
    .local v1, "e":Ljava/lang/RuntimeException;
    :try_start_1
    invoke-direct {p0, v1}, Landroidx/camera/core/AndroidImageReaderProxy;->isImageReaderContextNotInitializedException(Ljava/lang/RuntimeException;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 94
    const/4 v2, 0x0

    move-object v1, v2

    .line 100
    .local v1, "image":Landroid/media/Image;
    :goto_0
    if-nez v1, :cond_0

    .line 101
    monitor-exit v0

    const/4 v0, 0x0

    return-object v0

    .line 103
    :cond_0
    new-instance v2, Landroidx/camera/core/AndroidImageProxy;

    invoke-direct {v2, v1}, Landroidx/camera/core/AndroidImageProxy;-><init>(Landroid/media/Image;)V

    monitor-exit v0

    return-object v2

    .line 96
    .local v1, "e":Ljava/lang/RuntimeException;
    :cond_1
    throw v1

    .line 104
    .end local v1    # "e":Ljava/lang/RuntimeException;
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public clearOnImageAvailableListener()V
    .locals 3

    .line 180
    iget-object v0, p0, Landroidx/camera/core/AndroidImageReaderProxy;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 181
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Landroidx/camera/core/AndroidImageReaderProxy;->mIsImageAvailableListenerCleared:Z

    .line 182
    iget-object v1, p0, Landroidx/camera/core/AndroidImageReaderProxy;->mImageReader:Landroid/media/ImageReader;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v2}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 183
    monitor-exit v0

    .line 184
    return-void

    .line 183
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public close()V
    .locals 2

    .line 113
    iget-object v0, p0, Landroidx/camera/core/AndroidImageReaderProxy;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 114
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/AndroidImageReaderProxy;->mImageReader:Landroid/media/ImageReader;

    invoke-virtual {v1}, Landroid/media/ImageReader;->close()V

    .line 115
    monitor-exit v0

    .line 116
    return-void

    .line 115
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getHeight()I
    .locals 2

    .line 120
    iget-object v0, p0, Landroidx/camera/core/AndroidImageReaderProxy;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 121
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/AndroidImageReaderProxy;->mImageReader:Landroid/media/ImageReader;

    invoke-virtual {v1}, Landroid/media/ImageReader;->getHeight()I

    move-result v1

    monitor-exit v0

    return v1

    .line 122
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getImageFormat()I
    .locals 2

    .line 134
    iget-object v0, p0, Landroidx/camera/core/AndroidImageReaderProxy;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 135
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/AndroidImageReaderProxy;->mImageReader:Landroid/media/ImageReader;

    invoke-virtual {v1}, Landroid/media/ImageReader;->getImageFormat()I

    move-result v1

    monitor-exit v0

    return v1

    .line 136
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getMaxImages()I
    .locals 2

    .line 141
    iget-object v0, p0, Landroidx/camera/core/AndroidImageReaderProxy;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 142
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/AndroidImageReaderProxy;->mImageReader:Landroid/media/ImageReader;

    invoke-virtual {v1}, Landroid/media/ImageReader;->getMaxImages()I

    move-result v1

    monitor-exit v0

    return v1

    .line 143
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getSurface()Landroid/view/Surface;
    .locals 2

    .line 149
    iget-object v0, p0, Landroidx/camera/core/AndroidImageReaderProxy;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 150
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/AndroidImageReaderProxy;->mImageReader:Landroid/media/ImageReader;

    invoke-virtual {v1}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 151
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getWidth()I
    .locals 2

    .line 127
    iget-object v0, p0, Landroidx/camera/core/AndroidImageReaderProxy;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 128
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/AndroidImageReaderProxy;->mImageReader:Landroid/media/ImageReader;

    invoke-virtual {v1}, Landroid/media/ImageReader;->getWidth()I

    move-result v1

    monitor-exit v0

    return v1

    .line 129
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method synthetic lambda$setOnImageAvailableListener$0$androidx-camera-core-AndroidImageReaderProxy(Landroidx/camera/core/impl/ImageReaderProxy$OnImageAvailableListener;)V
    .locals 0
    .param p1, "listener"    # Landroidx/camera/core/impl/ImageReaderProxy$OnImageAvailableListener;

    .line 169
    invoke-interface {p1, p0}, Landroidx/camera/core/impl/ImageReaderProxy$OnImageAvailableListener;->onImageAvailable(Landroidx/camera/core/impl/ImageReaderProxy;)V

    return-void
.end method

.method synthetic lambda$setOnImageAvailableListener$1$androidx-camera-core-AndroidImageReaderProxy(Ljava/util/concurrent/Executor;Landroidx/camera/core/impl/ImageReaderProxy$OnImageAvailableListener;Landroid/media/ImageReader;)V
    .locals 2
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "listener"    # Landroidx/camera/core/impl/ImageReaderProxy$OnImageAvailableListener;
    .param p3, "imageReader"    # Landroid/media/ImageReader;

    .line 163
    iget-object v0, p0, Landroidx/camera/core/AndroidImageReaderProxy;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 167
    :try_start_0
    iget-boolean v1, p0, Landroidx/camera/core/AndroidImageReaderProxy;->mIsImageAvailableListenerCleared:Z

    if-nez v1, :cond_0

    .line 168
    new-instance v1, Landroidx/camera/core/AndroidImageReaderProxy$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p2}, Landroidx/camera/core/AndroidImageReaderProxy$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/core/AndroidImageReaderProxy;Landroidx/camera/core/impl/ImageReaderProxy$OnImageAvailableListener;)V

    invoke-interface {p1, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 171
    :cond_0
    monitor-exit v0

    .line 172
    return-void

    .line 171
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setOnImageAvailableListener(Landroidx/camera/core/impl/ImageReaderProxy$OnImageAvailableListener;Ljava/util/concurrent/Executor;)V
    .locals 4
    .param p1, "listener"    # Landroidx/camera/core/impl/ImageReaderProxy$OnImageAvailableListener;
    .param p2, "executor"    # Ljava/util/concurrent/Executor;

    .line 158
    iget-object v0, p0, Landroidx/camera/core/AndroidImageReaderProxy;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 159
    const/4 v1, 0x0

    :try_start_0
    iput-boolean v1, p0, Landroidx/camera/core/AndroidImageReaderProxy;->mIsImageAvailableListenerCleared:Z

    .line 162
    new-instance v1, Landroidx/camera/core/AndroidImageReaderProxy$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p2, p1}, Landroidx/camera/core/AndroidImageReaderProxy$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/core/AndroidImageReaderProxy;Ljava/util/concurrent/Executor;Landroidx/camera/core/impl/ImageReaderProxy$OnImageAvailableListener;)V

    .line 173
    .local v1, "transformedListener":Landroid/media/ImageReader$OnImageAvailableListener;
    iget-object v2, p0, Landroidx/camera/core/AndroidImageReaderProxy;->mImageReader:Landroid/media/ImageReader;

    .line 174
    invoke-static {}, Landroidx/camera/core/impl/utils/MainThreadAsyncHandler;->getInstance()Landroid/os/Handler;

    move-result-object v3

    .line 173
    invoke-virtual {v2, v1, v3}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 175
    .end local v1    # "transformedListener":Landroid/media/ImageReader$OnImageAvailableListener;
    monitor-exit v0

    .line 176
    return-void

    .line 175
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
