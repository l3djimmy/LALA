.class public Landroidx/camera/core/processing/DefaultSurfaceProcessor;
.super Ljava/lang/Object;
.source "DefaultSurfaceProcessor.java"

# interfaces
.implements Landroidx/camera/core/processing/SurfaceProcessorInternal;
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;,
        Landroidx/camera/core/processing/DefaultSurfaceProcessor$Factory;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "DefaultSurfaceProcessor"


# instance fields
.field private final mGlExecutor:Ljava/util/concurrent/Executor;

.field final mGlHandler:Landroid/os/Handler;

.field private final mGlRenderer:Landroidx/camera/core/processing/OpenGlRenderer;

.field final mGlThread:Landroid/os/HandlerThread;

.field private mInputSurfaceCount:I

.field private final mIsReleaseRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mIsReleased:Z

.field final mOutputSurfaces:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroidx/camera/core/SurfaceOutput;",
            "Landroid/view/Surface;",
            ">;"
        }
    .end annotation
.end field

.field private final mPendingSnapshots:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;",
            ">;"
        }
    .end annotation
.end field

.field private final mSurfaceOutputMatrix:[F

.field private final mTextureMatrix:[F


# direct methods
.method constructor <init>(Landroidx/camera/core/DynamicRange;)V
    .locals 1
    .param p1, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 102
    sget-object v0, Landroidx/camera/core/processing/ShaderProvider;->DEFAULT:Landroidx/camera/core/processing/ShaderProvider;

    invoke-direct {p0, p1, v0}, Landroidx/camera/core/processing/DefaultSurfaceProcessor;-><init>(Landroidx/camera/core/DynamicRange;Landroidx/camera/core/processing/ShaderProvider;)V

    .line 103
    return-void
.end method

.method constructor <init>(Landroidx/camera/core/DynamicRange;Landroidx/camera/core/processing/ShaderProvider;)V
    .locals 3
    .param p1, "dynamicRange"    # Landroidx/camera/core/DynamicRange;
    .param p2, "shaderProvider"    # Landroidx/camera/core/processing/ShaderProvider;

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mIsReleaseRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 87
    const/16 v0, 0x10

    new-array v2, v0, [F

    iput-object v2, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mTextureMatrix:[F

    .line 88
    new-array v0, v0, [F

    iput-object v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mSurfaceOutputMatrix:[F

    .line 90
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mOutputSurfaces:Ljava/util/Map;

    .line 94
    iput v1, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mInputSurfaceCount:I

    .line 96
    iput-boolean v1, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mIsReleased:Z

    .line 98
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mPendingSnapshots:Ljava/util/List;

    .line 113
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "GL Thread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mGlThread:Landroid/os/HandlerThread;

    .line 114
    iget-object v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mGlThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 115
    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mGlThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mGlHandler:Landroid/os/Handler;

    .line 116
    iget-object v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mGlHandler:Landroid/os/Handler;

    invoke-static {v0}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->newHandlerExecutor(Landroid/os/Handler;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mGlExecutor:Ljava/util/concurrent/Executor;

    .line 117
    new-instance v0, Landroidx/camera/core/processing/OpenGlRenderer;

    invoke-direct {v0}, Landroidx/camera/core/processing/OpenGlRenderer;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mGlRenderer:Landroidx/camera/core/processing/OpenGlRenderer;

    .line 119
    :try_start_0
    invoke-direct {p0, p1, p2}, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->initGlRenderer(Landroidx/camera/core/DynamicRange;Landroidx/camera/core/processing/ShaderProvider;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 123
    nop

    .line 124
    return-void

    .line 120
    :catch_0
    move-exception v0

    .line 121
    .local v0, "e":Ljava/lang/RuntimeException;
    invoke-virtual {p0}, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->release()V

    .line 122
    throw v0
.end method

.method private checkReadyToRelease()V
    .locals 5

    .line 338
    iget-boolean v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mIsReleased:Z

    if-eqz v0, :cond_2

    iget v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mInputSurfaceCount:I

    if-nez v0, :cond_2

    .line 340
    iget-object v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mOutputSurfaces:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/SurfaceOutput;

    .line 341
    .local v1, "surfaceOutput":Landroidx/camera/core/SurfaceOutput;
    invoke-interface {v1}, Landroidx/camera/core/SurfaceOutput;->close()V

    .line 342
    .end local v1    # "surfaceOutput":Landroidx/camera/core/SurfaceOutput;
    goto :goto_0

    .line 343
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mPendingSnapshots:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;

    .line 344
    .local v1, "pendingSnapshot":Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;
    invoke-virtual {v1}, Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;->getCompleter()Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    move-result-object v2

    new-instance v3, Ljava/lang/Exception;

    const-string v4, "Failed to snapshot: DefaultSurfaceProcessor is released."

    invoke-direct {v3, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 346
    .end local v1    # "pendingSnapshot":Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;
    goto :goto_1

    .line 347
    :cond_1
    iget-object v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mOutputSurfaces:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 348
    iget-object v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mGlRenderer:Landroidx/camera/core/processing/OpenGlRenderer;

    invoke-virtual {v0}, Landroidx/camera/core/processing/OpenGlRenderer;->release()V

    .line 349
    iget-object v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mGlThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 351
    :cond_2
    return-void
.end method

.method private executeSafely(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .line 381
    new-instance v0, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda3;

    invoke-direct {v0}, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda3;-><init>()V

    invoke-direct {p0, p1, v0}, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->executeSafely(Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 384
    return-void
.end method

.method private executeSafely(Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 3
    .param p1, "runnable"    # Ljava/lang/Runnable;
    .param p2, "onFailure"    # Ljava/lang/Runnable;

    .line 388
    :try_start_0
    iget-object v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mGlExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0, p2, p1}, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda6;-><init>(Landroidx/camera/core/processing/DefaultSurfaceProcessor;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 398
    goto :goto_0

    .line 395
    :catch_0
    move-exception v0

    .line 396
    .local v0, "e":Ljava/util/concurrent/RejectedExecutionException;
    const-string v1, "DefaultSurfaceProcessor"

    const-string/jumbo v2, "Unable to executor runnable"

    invoke-static {v1, v2, v0}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 397
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 399
    .end local v0    # "e":Ljava/util/concurrent/RejectedExecutionException;
    :goto_0
    return-void
.end method

.method private failAllPendingSnapshots(Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .line 307
    iget-object v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mPendingSnapshots:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;

    .line 308
    .local v1, "pendingSnapshot":Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;
    invoke-virtual {v1}, Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;->getCompleter()Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 309
    .end local v1    # "pendingSnapshot":Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;
    goto :goto_0

    .line 310
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mPendingSnapshots:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 311
    return-void
.end method

.method private getBitmap(Landroid/util/Size;[FI)Landroid/graphics/Bitmap;
    .locals 7
    .param p1, "size"    # Landroid/util/Size;
    .param p2, "textureTransform"    # [F
    .param p3, "rotationDegrees"    # I

    .line 317
    const/16 v0, 0x10

    new-array v1, v0, [F

    .line 318
    .local v1, "snapshotTransform":[F
    const/4 v0, 0x0

    invoke-static {v1, v0}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 321
    const/high16 v0, 0x3f000000    # 0.5f

    invoke-static {v1, v0}, Landroidx/camera/core/impl/utils/MatrixExt;->preVerticalFlip([FF)V

    .line 324
    int-to-float v2, p3

    invoke-static {v1, v2, v0, v0}, Landroidx/camera/core/impl/utils/MatrixExt;->preRotate([FFFF)V

    .line 327
    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v2, 0x0

    move-object v3, v1

    move-object v5, p2

    .end local p2    # "textureTransform":[F
    .local v5, "textureTransform":[F
    invoke-static/range {v1 .. v6}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 330
    invoke-static {p1, p3}, Landroidx/camera/core/impl/utils/TransformUtils;->rotateSize(Landroid/util/Size;I)Landroid/util/Size;

    move-result-object p1

    .line 333
    iget-object p2, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mGlRenderer:Landroidx/camera/core/processing/OpenGlRenderer;

    invoke-virtual {p2, p1, v1}, Landroidx/camera/core/processing/OpenGlRenderer;->snapshot(Landroid/util/Size;[F)Landroid/graphics/Bitmap;

    move-result-object p2

    return-object p2
.end method

.method private initGlRenderer(Landroidx/camera/core/DynamicRange;Landroidx/camera/core/processing/ShaderProvider;)V
    .locals 5
    .param p1, "dynamicRange"    # Landroidx/camera/core/DynamicRange;
    .param p2, "shaderProvider"    # Landroidx/camera/core/processing/ShaderProvider;

    .line 355
    new-instance v0, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda10;

    invoke-direct {v0, p0, p1, p2}, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda10;-><init>(Landroidx/camera/core/processing/DefaultSurfaceProcessor;Landroidx/camera/core/DynamicRange;Landroidx/camera/core/processing/ShaderProvider;)V

    invoke-static {v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 367
    .local v0, "initFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;"
    :try_start_0
    invoke-interface {v0}, Lcom/google/common/util/concurrent/ListenableFuture;->get()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 377
    nop

    .line 378
    return-void

    .line 368
    :catch_0
    move-exception v1

    goto :goto_0

    :catch_1
    move-exception v1

    .line 371
    .local v1, "e":Ljava/lang/Exception;
    :goto_0
    instance-of v2, v1, Ljava/util/concurrent/ExecutionException;

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    goto :goto_1

    :cond_0
    move-object v2, v1

    .line 372
    .local v2, "cause":Ljava/lang/Throwable;
    :goto_1
    instance-of v3, v2, Ljava/lang/RuntimeException;

    if-eqz v3, :cond_1

    .line 373
    move-object v3, v2

    check-cast v3, Ljava/lang/RuntimeException;

    throw v3

    .line 375
    :cond_1
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Failed to create DefaultSurfaceProcessor"

    invoke-direct {v3, v4, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method static synthetic lambda$executeSafely$10()V
    .locals 0

    .line 383
    return-void
.end method

.method static synthetic lambda$snapshot$6(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V
    .locals 2
    .param p0, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 199
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "Failed to snapshot: OpenGLRenderer not ready."

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    return-void
.end method

.method private takeSnapshotAndDrawJpeg(Lkotlin/Triple;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/Triple<",
            "Landroid/view/Surface;",
            "Landroid/util/Size;",
            "[F>;)V"
        }
    .end annotation

    .line 258
    .local p1, "jpegOutput":Lkotlin/Triple;, "Lkotlin/Triple<Landroid/view/Surface;Landroid/util/Size;[F>;"
    iget-object v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mPendingSnapshots:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 260
    return-void

    .line 264
    :cond_0
    if-nez p1, :cond_1

    .line 265
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "Failed to snapshot: no JPEG Surface."

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->failAllPendingSnapshots(Ljava/lang/Throwable;)V

    .line 266
    return-void

    .line 270
    :cond_1
    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 271
    .local v0, "outputStream":Ljava/io/ByteArrayOutputStream;
    const/4 v1, 0x0

    .line 272
    .local v1, "jpegBytes":[B
    const/4 v2, -0x1

    .line 273
    .local v2, "jpegQuality":I
    const/4 v3, -0x1

    .line 274
    .local v3, "rotationDegrees":I
    const/4 v4, 0x0

    .line 275
    .local v4, "bitmap":Landroid/graphics/Bitmap;
    :try_start_1
    iget-object v5, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mPendingSnapshots:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 276
    .local v5, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;>;"
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_6

    .line 277
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;

    .line 279
    .local v6, "pendingSnapshot":Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;
    invoke-virtual {v6}, Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;->getRotationDegrees()I

    move-result v7

    if-ne v3, v7, :cond_2

    if-nez v4, :cond_4

    .line 280
    :cond_2
    invoke-virtual {v6}, Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;->getRotationDegrees()I

    move-result v7

    .line 282
    .end local v3    # "rotationDegrees":I
    .local v7, "rotationDegrees":I
    if-eqz v4, :cond_3

    .line 283
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->recycle()V

    .line 285
    :cond_3
    invoke-virtual {p1}, Lkotlin/Triple;->getSecond()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/Size;

    invoke-virtual {p1}, Lkotlin/Triple;->getThird()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [F

    invoke-direct {p0, v3, v8, v7}, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->getBitmap(Landroid/util/Size;[FI)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 288
    .end local v4    # "bitmap":Landroid/graphics/Bitmap;
    .local v3, "bitmap":Landroid/graphics/Bitmap;
    const/4 v2, -0x1

    move-object v4, v3

    move v3, v7

    .line 291
    .end local v7    # "rotationDegrees":I
    .local v3, "rotationDegrees":I
    .restart local v4    # "bitmap":Landroid/graphics/Bitmap;
    :cond_4
    invoke-virtual {v6}, Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;->getJpegQuality()I

    move-result v7

    if-eq v2, v7, :cond_5

    .line 292
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 293
    invoke-virtual {v6}, Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;->getJpegQuality()I

    move-result v7

    .line 294
    .end local v2    # "jpegQuality":I
    .local v7, "jpegQuality":I
    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    invoke-virtual {v4, v2, v7, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 295
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    move-object v1, v2

    move v2, v7

    .line 297
    .end local v7    # "jpegQuality":I
    .restart local v2    # "jpegQuality":I
    :cond_5
    invoke-virtual {p1}, Lkotlin/Triple;->getFirst()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/Surface;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [B

    invoke-static {v7, v8}, Landroidx/camera/core/ImageProcessingUtil;->writeJpegBytesToSurface(Landroid/view/Surface;[B)Z

    .line 298
    invoke-virtual {v6}, Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;->getCompleter()Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 299
    invoke-interface {v5}, Ljava/util/Iterator;->remove()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 300
    .end local v6    # "pendingSnapshot":Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;
    goto :goto_0

    .line 301
    .end local v1    # "jpegBytes":[B
    .end local v2    # "jpegQuality":I
    .end local v3    # "rotationDegrees":I
    .end local v4    # "bitmap":Landroid/graphics/Bitmap;
    .end local v5    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;>;"
    :cond_6
    :try_start_2
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 303
    .end local v0    # "outputStream":Ljava/io/ByteArrayOutputStream;
    goto :goto_2

    .line 270
    .restart local v0    # "outputStream":Ljava/io/ByteArrayOutputStream;
    :catchall_0
    move-exception v1

    :try_start_3
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v2

    :try_start_4
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local p1    # "jpegOutput":Lkotlin/Triple;, "Lkotlin/Triple<Landroid/view/Surface;Landroid/util/Size;[F>;"
    :goto_1
    throw v1
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 301
    .end local v0    # "outputStream":Ljava/io/ByteArrayOutputStream;
    .restart local p1    # "jpegOutput":Lkotlin/Triple;, "Lkotlin/Triple<Landroid/view/Surface;Landroid/util/Size;[F>;"
    :catch_0
    move-exception v0

    .line 302
    .local v0, "e":Ljava/io/IOException;
    invoke-direct {p0, v0}, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->failAllPendingSnapshots(Ljava/lang/Throwable;)V

    .line 304
    .end local v0    # "e":Ljava/io/IOException;
    :goto_2
    return-void
.end method


# virtual methods
.method synthetic lambda$executeSafely$11$androidx-camera-core-processing-DefaultSurfaceProcessor(Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "onFailure"    # Ljava/lang/Runnable;
    .param p2, "runnable"    # Ljava/lang/Runnable;

    .line 389
    iget-boolean v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mIsReleased:Z

    if-eqz v0, :cond_0

    .line 390
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    .line 392
    :cond_0
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 394
    :goto_0
    return-void
.end method

.method synthetic lambda$initGlRenderer$8$androidx-camera-core-processing-DefaultSurfaceProcessor(Landroidx/camera/core/DynamicRange;Landroidx/camera/core/processing/ShaderProvider;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V
    .locals 1
    .param p1, "dynamicRange"    # Landroidx/camera/core/DynamicRange;
    .param p2, "shaderProvider"    # Landroidx/camera/core/processing/ShaderProvider;
    .param p3, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 358
    :try_start_0
    iget-object v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mGlRenderer:Landroidx/camera/core/processing/OpenGlRenderer;

    invoke-virtual {v0, p1, p2}, Landroidx/camera/core/processing/OpenGlRenderer;->init(Landroidx/camera/core/DynamicRange;Landroidx/camera/core/processing/ShaderProvider;)V

    .line 359
    const/4 v0, 0x0

    invoke-virtual {p3, v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 362
    goto :goto_0

    .line 360
    :catch_0
    move-exception v0

    .line 361
    .local v0, "e":Ljava/lang/RuntimeException;
    invoke-virtual {p3, v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 363
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :goto_0
    return-void
.end method

.method synthetic lambda$initGlRenderer$9$androidx-camera-core-processing-DefaultSurfaceProcessor(Landroidx/camera/core/DynamicRange;Landroidx/camera/core/processing/ShaderProvider;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 1
    .param p1, "dynamicRange"    # Landroidx/camera/core/DynamicRange;
    .param p2, "shaderProvider"    # Landroidx/camera/core/processing/ShaderProvider;
    .param p3, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 356
    new-instance v0, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda7;

    invoke-direct {v0, p0, p1, p2, p3}, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda7;-><init>(Landroidx/camera/core/processing/DefaultSurfaceProcessor;Landroidx/camera/core/DynamicRange;Landroidx/camera/core/processing/ShaderProvider;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    invoke-direct {p0, v0}, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->executeSafely(Ljava/lang/Runnable;)V

    .line 364
    const-string v0, "Init GlRenderer"

    return-object v0
.end method

.method synthetic lambda$onInputSurface$0$androidx-camera-core-processing-DefaultSurfaceProcessor(Landroid/graphics/SurfaceTexture;Landroid/view/Surface;Landroidx/camera/core/SurfaceRequest$Result;)V
    .locals 1
    .param p1, "surfaceTexture"    # Landroid/graphics/SurfaceTexture;
    .param p2, "surface"    # Landroid/view/Surface;
    .param p3, "result"    # Landroidx/camera/core/SurfaceRequest$Result;

    .line 142
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 143
    invoke-virtual {p1}, Landroid/graphics/SurfaceTexture;->release()V

    .line 144
    invoke-virtual {p2}, Landroid/view/Surface;->release()V

    .line 145
    iget v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mInputSurfaceCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mInputSurfaceCount:I

    .line 146
    invoke-direct {p0}, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->checkReadyToRelease()V

    .line 147
    return-void
.end method

.method synthetic lambda$onInputSurface$1$androidx-camera-core-processing-DefaultSurfaceProcessor(Landroidx/camera/core/SurfaceRequest;)V
    .locals 4
    .param p1, "surfaceRequest"    # Landroidx/camera/core/SurfaceRequest;

    .line 136
    iget v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mInputSurfaceCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mInputSurfaceCount:I

    .line 137
    new-instance v0, Landroid/graphics/SurfaceTexture;

    iget-object v1, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mGlRenderer:Landroidx/camera/core/processing/OpenGlRenderer;

    invoke-virtual {v1}, Landroidx/camera/core/processing/OpenGlRenderer;->getTextureName()I

    move-result v1

    invoke-direct {v0, v1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 138
    .local v0, "surfaceTexture":Landroid/graphics/SurfaceTexture;
    invoke-virtual {p1}, Landroidx/camera/core/SurfaceRequest;->getResolution()Landroid/util/Size;

    move-result-object v1

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v1

    .line 139
    invoke-virtual {p1}, Landroidx/camera/core/SurfaceRequest;->getResolution()Landroid/util/Size;

    move-result-object v2

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v2

    .line 138
    invoke-virtual {v0, v1, v2}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 140
    new-instance v1, Landroid/view/Surface;

    invoke-direct {v1, v0}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 141
    .local v1, "surface":Landroid/view/Surface;
    iget-object v2, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mGlExecutor:Ljava/util/concurrent/Executor;

    new-instance v3, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda8;

    invoke-direct {v3, p0, v0, v1}, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda8;-><init>(Landroidx/camera/core/processing/DefaultSurfaceProcessor;Landroid/graphics/SurfaceTexture;Landroid/view/Surface;)V

    invoke-virtual {p1, v1, v2, v3}, Landroidx/camera/core/SurfaceRequest;->provideSurface(Landroid/view/Surface;Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)V

    .line 148
    iget-object v2, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mGlHandler:Landroid/os/Handler;

    invoke-virtual {v0, p0, v2}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;Landroid/os/Handler;)V

    .line 149
    return-void
.end method

.method synthetic lambda$onOutputSurface$2$androidx-camera-core-processing-DefaultSurfaceProcessor(Landroidx/camera/core/SurfaceOutput;Landroidx/camera/core/SurfaceOutput$Event;)V
    .locals 2
    .param p1, "surfaceOutput"    # Landroidx/camera/core/SurfaceOutput;
    .param p2, "event"    # Landroidx/camera/core/SurfaceOutput$Event;

    .line 163
    invoke-interface {p1}, Landroidx/camera/core/SurfaceOutput;->close()V

    .line 164
    iget-object v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mOutputSurfaces:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/Surface;

    .line 165
    .local v0, "removedSurface":Landroid/view/Surface;
    if-eqz v0, :cond_0

    .line 166
    iget-object v1, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mGlRenderer:Landroidx/camera/core/processing/OpenGlRenderer;

    invoke-virtual {v1, v0}, Landroidx/camera/core/processing/OpenGlRenderer;->unregisterOutputSurface(Landroid/view/Surface;)V

    .line 168
    :cond_0
    return-void
.end method

.method synthetic lambda$onOutputSurface$3$androidx-camera-core-processing-DefaultSurfaceProcessor(Landroidx/camera/core/SurfaceOutput;)V
    .locals 2
    .param p1, "surfaceOutput"    # Landroidx/camera/core/SurfaceOutput;

    .line 162
    iget-object v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mGlExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/core/processing/DefaultSurfaceProcessor;Landroidx/camera/core/SurfaceOutput;)V

    invoke-interface {p1, v0, v1}, Landroidx/camera/core/SurfaceOutput;->getSurface(Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)Landroid/view/Surface;

    move-result-object v0

    .line 169
    .local v0, "surface":Landroid/view/Surface;
    iget-object v1, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mGlRenderer:Landroidx/camera/core/processing/OpenGlRenderer;

    invoke-virtual {v1, v0}, Landroidx/camera/core/processing/OpenGlRenderer;->registerOutputSurface(Landroid/view/Surface;)V

    .line 170
    iget-object v1, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mOutputSurfaces:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    return-void
.end method

.method synthetic lambda$release$4$androidx-camera-core-processing-DefaultSurfaceProcessor()V
    .locals 1

    .line 183
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mIsReleased:Z

    .line 184
    invoke-direct {p0}, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->checkReadyToRelease()V

    .line 185
    return-void
.end method

.method synthetic lambda$snapshot$5$androidx-camera-core-processing-DefaultSurfaceProcessor(Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;)V
    .locals 1
    .param p1, "pendingSnapshot"    # Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;

    .line 198
    iget-object v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mPendingSnapshots:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method synthetic lambda$snapshot$7$androidx-camera-core-processing-DefaultSurfaceProcessor(IILandroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 3
    .param p1, "jpegQuality"    # I
    .param p2, "rotationDegrees"    # I
    .param p3, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 195
    invoke-static {p1, p2, p3}, Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;->of(IILandroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Landroidx/camera/core/processing/AutoValue_DefaultSurfaceProcessor_PendingSnapshot;

    move-result-object v0

    .line 197
    .local v0, "pendingSnapshot":Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;
    new-instance v1, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda11;

    invoke-direct {v1, p0, v0}, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda11;-><init>(Landroidx/camera/core/processing/DefaultSurfaceProcessor;Landroidx/camera/core/processing/DefaultSurfaceProcessor$PendingSnapshot;)V

    new-instance v2, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda12;

    invoke-direct {v2, p3}, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda12;-><init>(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    invoke-direct {p0, v1, v2}, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->executeSafely(Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 201
    const-string v1, "DefaultSurfaceProcessor#snapshot"

    return-object v1
.end method

.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 10
    .param p1, "surfaceTexture"    # Landroid/graphics/SurfaceTexture;

    .line 210
    iget-object v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mIsReleaseRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 212
    return-void

    .line 214
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    .line 215
    iget-object v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mTextureMatrix:[F

    invoke-virtual {p1, v0}, Landroid/graphics/SurfaceTexture;->getTransformMatrix([F)V

    .line 217
    const/4 v0, 0x0

    .line 219
    .local v0, "jpegOutput":Lkotlin/Triple;, "Lkotlin/Triple<Landroid/view/Surface;Landroid/util/Size;[F>;"
    iget-object v1, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mOutputSurfaces:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 220
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/SurfaceOutput;Landroid/view/Surface;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/Surface;

    .line 221
    .local v3, "surface":Landroid/view/Surface;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/SurfaceOutput;

    .line 222
    .local v4, "surfaceOutput":Landroidx/camera/core/SurfaceOutput;
    iget-object v5, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mSurfaceOutputMatrix:[F

    iget-object v6, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mTextureMatrix:[F

    invoke-interface {v4, v5, v6}, Landroidx/camera/core/SurfaceOutput;->updateTransformMatrix([F[F)V

    .line 223
    invoke-interface {v4}, Landroidx/camera/core/SurfaceOutput;->getFormat()I

    move-result v5

    const/16 v6, 0x22

    if-ne v5, v6, :cond_1

    .line 226
    :try_start_0
    iget-object v5, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mGlRenderer:Landroidx/camera/core/processing/OpenGlRenderer;

    invoke-virtual {p1}, Landroid/graphics/SurfaceTexture;->getTimestamp()J

    move-result-wide v6

    iget-object v8, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mSurfaceOutputMatrix:[F

    invoke-virtual {v5, v6, v7, v8, v3}, Landroidx/camera/core/processing/OpenGlRenderer;->render(J[FLandroid/view/Surface;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 228
    :catch_0
    move-exception v5

    .line 231
    .local v5, "e":Ljava/lang/RuntimeException;
    const-string v6, "DefaultSurfaceProcessor"

    const-string v7, "Failed to render with OpenGL."

    invoke-static {v6, v7, v5}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 232
    .end local v5    # "e":Ljava/lang/RuntimeException;
    :goto_1
    goto :goto_4

    .line 234
    :cond_1
    invoke-interface {v4}, Landroidx/camera/core/SurfaceOutput;->getFormat()I

    move-result v5

    const/16 v6, 0x100

    const/4 v7, 0x1

    const/4 v8, 0x0

    if-ne v5, v6, :cond_2

    move v5, v7

    goto :goto_2

    :cond_2
    move v5, v8

    :goto_2
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Unsupported format: "

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 235
    invoke-interface {v4}, Landroidx/camera/core/SurfaceOutput;->getFormat()I

    move-result v9

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 234
    invoke-static {v5, v6}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 236
    if-nez v0, :cond_3

    goto :goto_3

    :cond_3
    move v7, v8

    :goto_3
    const-string v5, "Only one JPEG output is supported."

    invoke-static {v7, v5}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 237
    new-instance v5, Lkotlin/Triple;

    invoke-interface {v4}, Landroidx/camera/core/SurfaceOutput;->getSize()Landroid/util/Size;

    move-result-object v6

    iget-object v7, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mSurfaceOutputMatrix:[F

    .line 238
    invoke-virtual {v7}, [F->clone()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [F

    invoke-direct {v5, v3, v6, v7}, Lkotlin/Triple;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    move-object v0, v5

    .line 240
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/SurfaceOutput;Landroid/view/Surface;>;"
    .end local v3    # "surface":Landroid/view/Surface;
    .end local v4    # "surfaceOutput":Landroidx/camera/core/SurfaceOutput;
    :goto_4
    goto :goto_0

    .line 244
    :cond_4
    :try_start_1
    invoke-direct {p0, v0}, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->takeSnapshotAndDrawJpeg(Lkotlin/Triple;)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    .line 248
    goto :goto_5

    .line 245
    :catch_1
    move-exception v1

    .line 247
    .local v1, "e":Ljava/lang/RuntimeException;
    invoke-direct {p0, v1}, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->failAllPendingSnapshots(Ljava/lang/Throwable;)V

    .line 249
    .end local v1    # "e":Ljava/lang/RuntimeException;
    :goto_5
    return-void
.end method

.method public onInputSurface(Landroidx/camera/core/SurfaceRequest;)V
    .locals 2
    .param p1, "surfaceRequest"    # Landroidx/camera/core/SurfaceRequest;

    .line 131
    iget-object v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mIsReleaseRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 132
    invoke-virtual {p1}, Landroidx/camera/core/SurfaceRequest;->willNotProvideSurface()Z

    .line 133
    return-void

    .line 135
    :cond_0
    new-instance v0, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0, p1}, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda4;-><init>(Landroidx/camera/core/processing/DefaultSurfaceProcessor;Landroidx/camera/core/SurfaceRequest;)V

    .line 149
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda5;

    invoke-direct {v1, p1}, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda5;-><init>(Landroidx/camera/core/SurfaceRequest;)V

    .line 135
    invoke-direct {p0, v0, v1}, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->executeSafely(Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 150
    return-void
.end method

.method public onOutputSurface(Landroidx/camera/core/SurfaceOutput;)V
    .locals 2
    .param p1, "surfaceOutput"    # Landroidx/camera/core/SurfaceOutput;

    .line 157
    iget-object v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mIsReleaseRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 158
    invoke-interface {p1}, Landroidx/camera/core/SurfaceOutput;->close()V

    .line 159
    return-void

    .line 161
    :cond_0
    new-instance v0, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, p1}, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/core/processing/DefaultSurfaceProcessor;Landroidx/camera/core/SurfaceOutput;)V

    .line 171
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda2;

    invoke-direct {v1, p1}, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/core/SurfaceOutput;)V

    .line 161
    invoke-direct {p0, v0, v1}, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->executeSafely(Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 172
    return-void
.end method

.method public release()V
    .locals 2

    .line 179
    iget-object v0, p0, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->mIsReleaseRequested:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 180
    return-void

    .line 182
    :cond_0
    new-instance v0, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda9;

    invoke-direct {v0, p0}, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda9;-><init>(Landroidx/camera/core/processing/DefaultSurfaceProcessor;)V

    invoke-direct {p0, v0}, Landroidx/camera/core/processing/DefaultSurfaceProcessor;->executeSafely(Ljava/lang/Runnable;)V

    .line 186
    return-void
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

    .line 193
    new-instance v0, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda13;

    invoke-direct {v0, p0, p1, p2}, Landroidx/camera/core/processing/DefaultSurfaceProcessor$$ExternalSyntheticLambda13;-><init>(Landroidx/camera/core/processing/DefaultSurfaceProcessor;II)V

    invoke-static {v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->nonCancellationPropagating(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method
