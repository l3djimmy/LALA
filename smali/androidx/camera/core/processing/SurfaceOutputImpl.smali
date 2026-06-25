.class final Landroidx/camera/core/processing/SurfaceOutputImpl;
.super Ljava/lang/Object;
.source "SurfaceOutputImpl.java"

# interfaces
.implements Landroidx/camera/core/SurfaceOutput;


# static fields
.field private static final TAG:Ljava/lang/String; = "SurfaceOutputImpl"


# instance fields
.field private final mAdditionalTransform:[F

.field private mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

.field private final mCloseFuture:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private mCloseFutureCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private mEventListener:Landroidx/core/util/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/core/util/Consumer<",
            "Landroidx/camera/core/SurfaceOutput$Event;",
            ">;"
        }
    .end annotation
.end field

.field private mExecutor:Ljava/util/concurrent/Executor;

.field private final mFormat:I

.field private mHasPendingCloseRequest:Z

.field private final mInputCropRect:Landroid/graphics/Rect;

.field private final mInputSize:Landroid/util/Size;

.field private final mInvertedTextureTransform:[F

.field private mIsClosed:Z

.field private final mLock:Ljava/lang/Object;

.field private final mMirroring:Z

.field private final mRotationDegrees:I

.field private mSensorToBufferTransform:Landroid/graphics/Matrix;

.field private final mSize:Landroid/util/Size;

.field private final mSurface:Landroid/view/Surface;

.field private final mTargets:I


# direct methods
.method constructor <init>(Landroid/view/Surface;IILandroid/util/Size;Landroid/util/Size;Landroid/graphics/Rect;IZLandroidx/camera/core/impl/CameraInternal;Landroid/graphics/Matrix;)V
    .locals 2
    .param p1, "surface"    # Landroid/view/Surface;
    .param p2, "targets"    # I
    .param p3, "format"    # I
    .param p4, "size"    # Landroid/util/Size;
    .param p5, "inputSize"    # Landroid/util/Size;
    .param p6, "inputCropRect"    # Landroid/graphics/Rect;
    .param p7, "rotationDegree"    # I
    .param p8, "mirroring"    # Z
    .param p9, "cameraInternal"    # Landroidx/camera/core/impl/CameraInternal;
    .param p10, "sensorToBufferTransform"    # Landroid/graphics/Matrix;

    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mLock:Ljava/lang/Object;

    .line 77
    const/16 v0, 0x10

    new-array v1, v0, [F

    iput-object v1, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mAdditionalTransform:[F

    .line 80
    new-array v0, v0, [F

    iput-object v0, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mInvertedTextureTransform:[F

    .line 88
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mHasPendingCloseRequest:Z

    .line 90
    iput-boolean v0, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mIsClosed:Z

    .line 112
    iput-object p1, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mSurface:Landroid/view/Surface;

    .line 113
    iput p2, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mTargets:I

    .line 114
    iput p3, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mFormat:I

    .line 115
    iput-object p4, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mSize:Landroid/util/Size;

    .line 116
    iput-object p5, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mInputSize:Landroid/util/Size;

    .line 117
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0, p6}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    iput-object v0, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mInputCropRect:Landroid/graphics/Rect;

    .line 118
    iput-boolean p8, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mMirroring:Z

    .line 119
    iput p7, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mRotationDegrees:I

    .line 120
    iput-object p9, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    .line 121
    iput-object p10, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mSensorToBufferTransform:Landroid/graphics/Matrix;

    .line 122
    invoke-direct {p0}, Landroidx/camera/core/processing/SurfaceOutputImpl;->calculateAdditionalTransform()V

    .line 123
    new-instance v0, Landroidx/camera/core/processing/SurfaceOutputImpl$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Landroidx/camera/core/processing/SurfaceOutputImpl$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/core/processing/SurfaceOutputImpl;)V

    invoke-static {v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mCloseFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 128
    return-void
.end method

.method private calculateAdditionalTransform()V
    .locals 17

    .line 298
    move-object/from16 v0, p0

    iget-object v1, v0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mAdditionalTransform:[F

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 307
    iget-object v1, v0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mAdditionalTransform:[F

    const/high16 v3, 0x3f000000    # 0.5f

    invoke-static {v1, v3}, Landroidx/camera/core/impl/utils/MatrixExt;->preVerticalFlip([FF)V

    .line 310
    iget-object v1, v0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mAdditionalTransform:[F

    iget v4, v0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mRotationDegrees:I

    int-to-float v4, v4

    invoke-static {v1, v4, v3, v3}, Landroidx/camera/core/impl/utils/MatrixExt;->preRotate([FFFF)V

    .line 313
    iget-boolean v1, v0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mMirroring:Z

    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    if-eqz v1, :cond_0

    .line 314
    iget-object v1, v0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mAdditionalTransform:[F

    invoke-static {v1, v2, v4, v3, v3}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    .line 315
    iget-object v1, v0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mAdditionalTransform:[F

    const/high16 v5, -0x40800000    # -1.0f

    invoke-static {v1, v2, v5, v4, v4}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 320
    :cond_0
    iget-object v1, v0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mInputSize:Landroid/util/Size;

    iget v5, v0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mRotationDegrees:I

    invoke-static {v1, v5}, Landroidx/camera/core/impl/utils/TransformUtils;->rotateSize(Landroid/util/Size;I)Landroid/util/Size;

    move-result-object v1

    .line 321
    .local v1, "rotatedSize":Landroid/util/Size;
    iget-object v5, v0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mInputSize:Landroid/util/Size;

    invoke-static {v5}, Landroidx/camera/core/impl/utils/TransformUtils;->sizeToRectF(Landroid/util/Size;)Landroid/graphics/RectF;

    move-result-object v5

    .line 322
    invoke-static {v1}, Landroidx/camera/core/impl/utils/TransformUtils;->sizeToRectF(Landroid/util/Size;)Landroid/graphics/RectF;

    move-result-object v6

    iget v7, v0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mRotationDegrees:I

    iget-boolean v8, v0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mMirroring:Z

    .line 321
    invoke-static {v5, v6, v7, v8}, Landroidx/camera/core/impl/utils/TransformUtils;->getRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;IZ)Landroid/graphics/Matrix;

    move-result-object v5

    .line 323
    .local v5, "imageTransform":Landroid/graphics/Matrix;
    new-instance v6, Landroid/graphics/RectF;

    iget-object v7, v0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mInputCropRect:Landroid/graphics/Rect;

    invoke-direct {v6, v7}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 324
    .local v6, "rotatedCroppedRect":Landroid/graphics/RectF;
    invoke-virtual {v5, v6}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 327
    iget v7, v6, Landroid/graphics/RectF;->left:F

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v8

    int-to-float v8, v8

    div-float/2addr v7, v8

    .line 328
    .local v7, "offsetX":F
    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v8

    int-to-float v8, v8

    invoke-virtual {v6}, Landroid/graphics/RectF;->height()F

    move-result v9

    sub-float/2addr v8, v9

    iget v9, v6, Landroid/graphics/RectF;->top:F

    sub-float/2addr v8, v9

    .line 329
    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v9

    int-to-float v9, v9

    div-float/2addr v8, v9

    .line 330
    .local v8, "offsetY":F
    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    move-result v9

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v10

    int-to-float v10, v10

    div-float/2addr v9, v10

    .line 331
    .local v9, "scaleX":F
    invoke-virtual {v6}, Landroid/graphics/RectF;->height()F

    move-result v10

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v11

    int-to-float v11, v11

    div-float/2addr v10, v11

    .line 333
    .local v10, "scaleY":F
    iget-object v11, v0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mAdditionalTransform:[F

    invoke-static {v11, v2, v7, v8, v3}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    .line 334
    iget-object v3, v0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mAdditionalTransform:[F

    invoke-static {v3, v2, v9, v10, v4}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 337
    invoke-direct {v0}, Landroidx/camera/core/processing/SurfaceOutputImpl;->calculateInvertedTextureTransform()V

    .line 340
    iget-object v11, v0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mAdditionalTransform:[F

    iget-object v13, v0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mInvertedTextureTransform:[F

    iget-object v15, v0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mAdditionalTransform:[F

    const/16 v16, 0x0

    const/4 v12, 0x0

    const/4 v14, 0x0

    invoke-static/range {v11 .. v16}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 342
    return-void
.end method

.method private calculateInvertedTextureTransform()V
    .locals 4

    .line 353
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mInvertedTextureTransform:[F

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 357
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mInvertedTextureTransform:[F

    const/high16 v2, 0x3f000000    # 0.5f

    invoke-static {v0, v2}, Landroidx/camera/core/impl/utils/MatrixExt;->preVerticalFlip([FF)V

    .line 360
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    if-eqz v0, :cond_0

    .line 361
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraInternal;->getHasTransform()Z

    move-result v0

    const-string v3, "Camera has no transform."

    invoke-static {v0, v3}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 364
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mInvertedTextureTransform:[F

    iget-object v3, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    .line 365
    invoke-interface {v3}, Landroidx/camera/core/impl/CameraInternal;->getCameraInfo()Landroidx/camera/core/CameraInfo;

    move-result-object v3

    invoke-interface {v3}, Landroidx/camera/core/CameraInfo;->getSensorRotationDegrees()I

    move-result v3

    int-to-float v3, v3

    .line 364
    invoke-static {v0, v3, v2, v2}, Landroidx/camera/core/impl/utils/MatrixExt;->preRotate([FFFF)V

    .line 370
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraInternal;->isFrontFacing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 371
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mInvertedTextureTransform:[F

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    invoke-static {v0, v1, v2, v3, v3}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    .line 372
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mInvertedTextureTransform:[F

    const/high16 v3, -0x40800000    # -1.0f

    invoke-static {v0, v1, v3, v2, v2}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 377
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mInvertedTextureTransform:[F

    iget-object v2, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mInvertedTextureTransform:[F

    invoke-static {v0, v1, v2, v1}, Landroid/opengl/Matrix;->invertM([FI[FI)Z

    .line 378
    return-void
.end method


# virtual methods
.method public close()V
    .locals 2

    .line 235
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 236
    :try_start_0
    iget-boolean v1, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mIsClosed:Z

    if-nez v1, :cond_0

    .line 237
    const/4 v1, 0x1

    iput-boolean v1, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mIsClosed:Z

    .line 239
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 240
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mCloseFutureCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 241
    return-void

    .line 239
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public getCamera()Landroidx/camera/core/impl/CameraInternal;
    .locals 1

    .line 224
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    return-object v0
.end method

.method public getCloseFuture()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 258
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mCloseFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    return-object v0
.end method

.method public getFormat()I
    .locals 1

    .line 190
    iget v0, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mFormat:I

    return v0
.end method

.method public getInputCropRect()Landroid/graphics/Rect;
    .locals 1

    .line 204
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mInputCropRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method public getInputSize()Landroid/util/Size;
    .locals 1

    .line 209
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mInputSize:Landroid/util/Size;

    return-object v0
.end method

.method public getMirroring()Z
    .locals 1

    .line 219
    iget-boolean v0, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mMirroring:Z

    return v0
.end method

.method public getRotationDegrees()I
    .locals 1

    .line 214
    iget v0, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mRotationDegrees:I

    return v0
.end method

.method public getSensorToBufferTransform()Landroid/graphics/Matrix;
    .locals 2

    .line 276
    new-instance v0, Landroid/graphics/Matrix;

    iget-object v1, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mSensorToBufferTransform:Landroid/graphics/Matrix;

    invoke-direct {v0, v1}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    return-object v0
.end method

.method public getSize()Landroid/util/Size;
    .locals 1

    .line 199
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mSize:Landroid/util/Size;

    return-object v0
.end method

.method public getSurface(Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)Landroid/view/Surface;
    .locals 2
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            "Landroidx/core/util/Consumer<",
            "Landroidx/camera/core/SurfaceOutput$Event;",
            ">;)",
            "Landroid/view/Surface;"
        }
    .end annotation

    .line 138
    .local p2, "listener":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroidx/camera/core/SurfaceOutput$Event;>;"
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 139
    :try_start_0
    iput-object p1, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mExecutor:Ljava/util/concurrent/Executor;

    .line 140
    iput-object p2, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mEventListener:Landroidx/core/util/Consumer;

    .line 141
    iget-boolean v1, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mHasPendingCloseRequest:Z

    .line 142
    .local v1, "hasPendingCloseRequest":Z
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 143
    if-eqz v1, :cond_0

    .line 144
    invoke-virtual {p0}, Landroidx/camera/core/processing/SurfaceOutputImpl;->requestClose()V

    .line 146
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mSurface:Landroid/view/Surface;

    return-object v0

    .line 142
    .end local v1    # "hasPendingCloseRequest":Z
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public getTargets()I
    .locals 1

    .line 184
    iget v0, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mTargets:I

    return v0
.end method

.method public isClosed()Z
    .locals 2

    .line 248
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 249
    :try_start_0
    iget-boolean v1, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mIsClosed:Z

    monitor-exit v0

    return v1

    .line 250
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method synthetic lambda$new$0$androidx-camera-core-processing-SurfaceOutputImpl(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 1
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 125
    iput-object p1, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mCloseFutureCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 126
    const-string/jumbo v0, "SurfaceOutputImpl close future complete"

    return-object v0
.end method

.method synthetic lambda$requestClose$1$androidx-camera-core-processing-SurfaceOutputImpl(Ljava/util/concurrent/atomic/AtomicReference;)V
    .locals 2
    .param p1, "eventListenerRef"    # Ljava/util/concurrent/atomic/AtomicReference;

    .line 168
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/core/util/Consumer;

    .line 169
    const/4 v1, 0x0

    invoke-static {v1, p0}, Landroidx/camera/core/SurfaceOutput$Event;->of(ILandroidx/camera/core/SurfaceOutput;)Landroidx/camera/core/SurfaceOutput$Event;

    move-result-object v1

    .line 168
    invoke-interface {v0, v1}, Landroidx/core/util/Consumer;->accept(Ljava/lang/Object;)V

    return-void
.end method

.method public requestClose()V
    .locals 5

    .line 153
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 154
    .local v0, "eventListenerRef":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Landroidx/core/util/Consumer<Landroidx/camera/core/SurfaceOutput$Event;>;>;"
    const/4 v1, 0x0

    .line 155
    .local v1, "executor":Ljava/util/concurrent/Executor;
    iget-object v2, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 156
    :try_start_0
    iget-object v3, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mExecutor:Ljava/util/concurrent/Executor;

    if-eqz v3, :cond_1

    iget-object v3, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mEventListener:Landroidx/core/util/Consumer;

    if-nez v3, :cond_0

    goto :goto_0

    .line 160
    :cond_0
    iget-boolean v3, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mIsClosed:Z

    if-nez v3, :cond_2

    .line 161
    iget-object v3, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mEventListener:Landroidx/core/util/Consumer;

    invoke-virtual {v0, v3}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 162
    iget-object v3, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mExecutor:Ljava/util/concurrent/Executor;

    move-object v1, v3

    .line 163
    const/4 v3, 0x0

    iput-boolean v3, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mHasPendingCloseRequest:Z

    goto :goto_1

    .line 159
    :cond_1
    :goto_0
    const/4 v3, 0x1

    iput-boolean v3, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mHasPendingCloseRequest:Z

    .line 165
    :cond_2
    :goto_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 166
    if-eqz v1, :cond_3

    .line 168
    :try_start_1
    new-instance v2, Landroidx/camera/core/processing/SurfaceOutputImpl$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0, v0}, Landroidx/camera/core/processing/SurfaceOutputImpl$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/core/processing/SurfaceOutputImpl;Ljava/util/concurrent/atomic/AtomicReference;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1 .. :try_end_1} :catch_0

    .line 175
    goto :goto_2

    .line 170
    :catch_0
    move-exception v2

    .line 174
    .local v2, "e":Ljava/util/concurrent/RejectedExecutionException;
    const-string/jumbo v3, "SurfaceOutputImpl"

    const-string/jumbo v4, "Processor executor closed. Close request not posted."

    invoke-static {v3, v4, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 177
    .end local v2    # "e":Ljava/util/concurrent/RejectedExecutionException;
    :cond_3
    :goto_2
    return-void

    .line 165
    :catchall_0
    move-exception v3

    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v3
.end method

.method public updateTransformMatrix([F[F)V
    .locals 6
    .param p1, "output"    # [F
    .param p2, "input"    # [F

    .line 267
    iget-object v4, p0, Landroidx/camera/core/processing/SurfaceOutputImpl;->mAdditionalTransform:[F

    const/4 v5, 0x0

    const/4 v1, 0x0

    const/4 v3, 0x0

    move-object v0, p1

    move-object v2, p2

    .end local p1    # "output":[F
    .end local p2    # "input":[F
    .local v0, "output":[F
    .local v2, "input":[F
    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 268
    return-void
.end method
