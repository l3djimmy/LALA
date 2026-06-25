.class public Landroidx/camera/core/processing/SurfaceEdge;
.super Ljava/lang/Object;
.source "SurfaceEdge.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/processing/SurfaceEdge$SettableSurface;
    }
.end annotation


# instance fields
.field private mConsumerToNotify:Landroidx/camera/core/processing/SurfaceOutputImpl;

.field private final mCropRect:Landroid/graphics/Rect;

.field private final mFormat:I

.field private final mHasCameraTransform:Z

.field private mHasConsumer:Z

.field private mIsClosed:Z

.field private final mMirroring:Z

.field private final mOnInvalidatedListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private mProviderSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

.field private mRotationDegrees:I

.field private final mSensorToBufferTransform:Landroid/graphics/Matrix;

.field private mSettableSurface:Landroidx/camera/core/processing/SurfaceEdge$SettableSurface;

.field private final mStreamSpec:Landroidx/camera/core/impl/StreamSpec;

.field private mTargetRotation:I

.field private final mTargets:I


# direct methods
.method public static synthetic $r8$lambda$nOJwQ-q6W8ZOBGCnLZCxMopFoyo(Landroidx/camera/core/processing/SurfaceEdge;)V
    .locals 0

    invoke-direct {p0}, Landroidx/camera/core/processing/SurfaceEdge;->disconnectWithoutCheckingClosed()V

    return-void
.end method

.method public constructor <init>(IILandroidx/camera/core/impl/StreamSpec;Landroid/graphics/Matrix;ZLandroid/graphics/Rect;IIZ)V
    .locals 3
    .param p1, "targets"    # I
    .param p2, "format"    # I
    .param p3, "streamSpec"    # Landroidx/camera/core/impl/StreamSpec;
    .param p4, "sensorToBufferTransform"    # Landroid/graphics/Matrix;
    .param p5, "hasCameraTransform"    # Z
    .param p6, "cropRect"    # Landroid/graphics/Rect;
    .param p7, "rotationDegrees"    # I
    .param p8, "targetRotation"    # I
    .param p9, "mirroring"    # Z

    .line 154
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 123
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mHasConsumer:Z

    .line 134
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Landroidx/camera/core/processing/SurfaceEdge;->mOnInvalidatedListeners:Ljava/util/Set;

    .line 140
    iput-boolean v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mIsClosed:Z

    .line 155
    iput p1, p0, Landroidx/camera/core/processing/SurfaceEdge;->mTargets:I

    .line 156
    iput p2, p0, Landroidx/camera/core/processing/SurfaceEdge;->mFormat:I

    .line 157
    iput-object p3, p0, Landroidx/camera/core/processing/SurfaceEdge;->mStreamSpec:Landroidx/camera/core/impl/StreamSpec;

    .line 158
    iput-object p4, p0, Landroidx/camera/core/processing/SurfaceEdge;->mSensorToBufferTransform:Landroid/graphics/Matrix;

    .line 159
    iput-boolean p5, p0, Landroidx/camera/core/processing/SurfaceEdge;->mHasCameraTransform:Z

    .line 160
    iput-object p6, p0, Landroidx/camera/core/processing/SurfaceEdge;->mCropRect:Landroid/graphics/Rect;

    .line 161
    iput p7, p0, Landroidx/camera/core/processing/SurfaceEdge;->mRotationDegrees:I

    .line 162
    iput p8, p0, Landroidx/camera/core/processing/SurfaceEdge;->mTargetRotation:I

    .line 163
    iput-boolean p9, p0, Landroidx/camera/core/processing/SurfaceEdge;->mMirroring:Z

    .line 164
    new-instance v0, Landroidx/camera/core/processing/SurfaceEdge$SettableSurface;

    invoke-virtual {p3}, Landroidx/camera/core/impl/StreamSpec;->getResolution()Landroid/util/Size;

    move-result-object v1

    iget v2, p0, Landroidx/camera/core/processing/SurfaceEdge;->mFormat:I

    invoke-direct {v0, v1, v2}, Landroidx/camera/core/processing/SurfaceEdge$SettableSurface;-><init>(Landroid/util/Size;I)V

    iput-object v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mSettableSurface:Landroidx/camera/core/processing/SurfaceEdge$SettableSurface;

    .line 165
    return-void
.end method

.method private checkAndSetHasConsumer()V
    .locals 3

    .line 534
    iget-boolean v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mHasConsumer:Z

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    const-string v2, "Consumer can only be linked once."

    invoke-static {v0, v2}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 535
    iput-boolean v1, p0, Landroidx/camera/core/processing/SurfaceEdge;->mHasConsumer:Z

    .line 536
    return-void
.end method

.method private checkNotClosed()V
    .locals 2

    .line 554
    iget-boolean v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mIsClosed:Z

    xor-int/lit8 v0, v0, 0x1

    const-string v1, "Edge is already closed."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 555
    return-void
.end method

.method private disconnectWithoutCheckingClosed()V
    .locals 1

    .line 403
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 404
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mSettableSurface:Landroidx/camera/core/processing/SurfaceEdge$SettableSurface;

    invoke-virtual {v0}, Landroidx/camera/core/processing/SurfaceEdge$SettableSurface;->close()V

    .line 405
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mConsumerToNotify:Landroidx/camera/core/processing/SurfaceOutputImpl;

    if-eqz v0, :cond_0

    .line 406
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mConsumerToNotify:Landroidx/camera/core/processing/SurfaceOutputImpl;

    invoke-virtual {v0}, Landroidx/camera/core/processing/SurfaceOutputImpl;->requestClose()V

    .line 407
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mConsumerToNotify:Landroidx/camera/core/processing/SurfaceOutputImpl;

    .line 409
    :cond_0
    return-void
.end method

.method private notifyTransformationInfoUpdate()V
    .locals 7

    .line 522
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 523
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mProviderSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    if-eqz v0, :cond_0

    .line 524
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mProviderSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    iget-object v1, p0, Landroidx/camera/core/processing/SurfaceEdge;->mCropRect:Landroid/graphics/Rect;

    iget v2, p0, Landroidx/camera/core/processing/SurfaceEdge;->mRotationDegrees:I

    iget v3, p0, Landroidx/camera/core/processing/SurfaceEdge;->mTargetRotation:I

    .line 525
    invoke-virtual {p0}, Landroidx/camera/core/processing/SurfaceEdge;->hasCameraTransform()Z

    move-result v4

    iget-object v5, p0, Landroidx/camera/core/processing/SurfaceEdge;->mSensorToBufferTransform:Landroid/graphics/Matrix;

    iget-boolean v6, p0, Landroidx/camera/core/processing/SurfaceEdge;->mMirroring:Z

    .line 524
    invoke-static/range {v1 .. v6}, Landroidx/camera/core/SurfaceRequest$TransformationInfo;->of(Landroid/graphics/Rect;IIZLandroid/graphics/Matrix;Z)Landroidx/camera/core/SurfaceRequest$TransformationInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/SurfaceRequest;->updateTransformationInfo(Landroidx/camera/core/SurfaceRequest$TransformationInfo;)V

    .line 528
    :cond_0
    return-void
.end method


# virtual methods
.method public addOnInvalidatedListener(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "onInvalidated"    # Ljava/lang/Runnable;

    .line 177
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 178
    invoke-direct {p0}, Landroidx/camera/core/processing/SurfaceEdge;->checkNotClosed()V

    .line 179
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mOnInvalidatedListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 180
    return-void
.end method

.method public final close()V
    .locals 1

    .line 377
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 378
    invoke-direct {p0}, Landroidx/camera/core/processing/SurfaceEdge;->disconnectWithoutCheckingClosed()V

    .line 379
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mIsClosed:Z

    .line 380
    return-void
.end method

.method public createSurfaceOutputFuture(Landroid/util/Size;ILandroid/graphics/Rect;IZLandroidx/camera/core/impl/CameraInternal;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 10
    .param p1, "inputSize"    # Landroid/util/Size;
    .param p2, "format"    # I
    .param p3, "cropRect"    # Landroid/graphics/Rect;
    .param p4, "rotationDegrees"    # I
    .param p5, "mirroring"    # Z
    .param p6, "cameraInternal"    # Landroidx/camera/core/impl/CameraInternal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Size;",
            "I",
            "Landroid/graphics/Rect;",
            "IZ",
            "Landroidx/camera/core/impl/CameraInternal;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Landroidx/camera/core/SurfaceOutput;",
            ">;"
        }
    .end annotation

    .line 314
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 315
    invoke-direct {p0}, Landroidx/camera/core/processing/SurfaceEdge;->checkNotClosed()V

    .line 316
    invoke-direct {p0}, Landroidx/camera/core/processing/SurfaceEdge;->checkAndSetHasConsumer()V

    .line 317
    iget-object v2, p0, Landroidx/camera/core/processing/SurfaceEdge;->mSettableSurface:Landroidx/camera/core/processing/SurfaceEdge$SettableSurface;

    .line 318
    .local v2, "settableSurface":Landroidx/camera/core/processing/SurfaceEdge$SettableSurface;
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mSettableSurface:Landroidx/camera/core/processing/SurfaceEdge$SettableSurface;

    invoke-virtual {v0}, Landroidx/camera/core/processing/SurfaceEdge$SettableSurface;->getSurface()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v9

    new-instance v0, Landroidx/camera/core/processing/SurfaceEdge$$ExternalSyntheticLambda5;

    move-object v1, p0

    move-object v4, p1

    move v3, p2

    move-object v5, p3

    move v6, p4

    move v7, p5

    move-object/from16 v8, p6

    invoke-direct/range {v0 .. v8}, Landroidx/camera/core/processing/SurfaceEdge$$ExternalSyntheticLambda5;-><init>(Landroidx/camera/core/processing/SurfaceEdge;Landroidx/camera/core/processing/SurfaceEdge$SettableSurface;ILandroid/util/Size;Landroid/graphics/Rect;IZLandroidx/camera/core/impl/CameraInternal;)V

    .line 334
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v1

    .line 318
    invoke-static {v9, v0, v1}, Landroidx/camera/core/impl/utils/futures/Futures;->transformAsync(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/camera/core/impl/utils/futures/AsyncFunction;Ljava/util/concurrent/Executor;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public createSurfaceRequest(Landroidx/camera/core/impl/CameraInternal;)Landroidx/camera/core/SurfaceRequest;
    .locals 6
    .param p1, "cameraInternal"    # Landroidx/camera/core/impl/CameraInternal;

    .line 251
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 252
    invoke-direct {p0}, Landroidx/camera/core/processing/SurfaceEdge;->checkNotClosed()V

    .line 254
    new-instance v0, Landroidx/camera/core/SurfaceRequest;

    iget-object v1, p0, Landroidx/camera/core/processing/SurfaceEdge;->mStreamSpec:Landroidx/camera/core/impl/StreamSpec;

    .line 255
    invoke-virtual {v1}, Landroidx/camera/core/impl/StreamSpec;->getResolution()Landroid/util/Size;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/core/processing/SurfaceEdge;->mStreamSpec:Landroidx/camera/core/impl/StreamSpec;

    .line 257
    invoke-virtual {v2}, Landroidx/camera/core/impl/StreamSpec;->getDynamicRange()Landroidx/camera/core/DynamicRange;

    move-result-object v3

    iget-object v2, p0, Landroidx/camera/core/processing/SurfaceEdge;->mStreamSpec:Landroidx/camera/core/impl/StreamSpec;

    .line 258
    invoke-virtual {v2}, Landroidx/camera/core/impl/StreamSpec;->getExpectedFrameRateRange()Landroid/util/Range;

    move-result-object v4

    new-instance v5, Landroidx/camera/core/processing/SurfaceEdge$$ExternalSyntheticLambda0;

    invoke-direct {v5, p0}, Landroidx/camera/core/processing/SurfaceEdge$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/core/processing/SurfaceEdge;)V

    move-object v2, p1

    .end local p1    # "cameraInternal":Landroidx/camera/core/impl/CameraInternal;
    .local v2, "cameraInternal":Landroidx/camera/core/impl/CameraInternal;
    invoke-direct/range {v0 .. v5}, Landroidx/camera/core/SurfaceRequest;-><init>(Landroid/util/Size;Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/DynamicRange;Landroid/util/Range;Ljava/lang/Runnable;)V

    move-object p1, v0

    .line 265
    .local p1, "surfaceRequest":Landroidx/camera/core/SurfaceRequest;
    :try_start_0
    invoke-virtual {p1}, Landroidx/camera/core/SurfaceRequest;->getDeferrableSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v0

    .line 266
    .local v0, "deferrableSurface":Landroidx/camera/core/impl/DeferrableSurface;
    iget-object v1, p0, Landroidx/camera/core/processing/SurfaceEdge;->mSettableSurface:Landroidx/camera/core/processing/SurfaceEdge$SettableSurface;

    new-instance v3, Landroidx/camera/core/processing/SurfaceEdge$$ExternalSyntheticLambda1;

    invoke-direct {v3, p0}, Landroidx/camera/core/processing/SurfaceEdge$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/core/processing/SurfaceEdge;)V

    invoke-virtual {v1, v0, v3}, Landroidx/camera/core/processing/SurfaceEdge$SettableSurface;->setProvider(Landroidx/camera/core/impl/DeferrableSurface;Ljava/lang/Runnable;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 270
    iget-object v1, p0, Landroidx/camera/core/processing/SurfaceEdge;->mSettableSurface:Landroidx/camera/core/processing/SurfaceEdge$SettableSurface;

    invoke-virtual {v1}, Landroidx/camera/core/processing/SurfaceEdge$SettableSurface;->getTerminationFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v3, Landroidx/camera/core/processing/SurfaceEdge$$ExternalSyntheticLambda2;

    invoke-direct {v3, v0}, Landroidx/camera/core/processing/SurfaceEdge$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/core/impl/DeferrableSurface;)V

    .line 271
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v4

    .line 270
    invoke-interface {v1, v3, v4}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V
    :try_end_0
    .catch Landroidx/camera/core/impl/DeferrableSurface$SurfaceClosedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 281
    .end local v0    # "deferrableSurface":Landroidx/camera/core/impl/DeferrableSurface;
    :cond_0
    nop

    .line 282
    iput-object p1, p0, Landroidx/camera/core/processing/SurfaceEdge;->mProviderSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    .line 283
    invoke-direct {p0}, Landroidx/camera/core/processing/SurfaceEdge;->notifyTransformationInfoUpdate()V

    .line 284
    return-object p1

    .line 276
    :catch_0
    move-exception v0

    .line 279
    .local v0, "e":Ljava/lang/RuntimeException;
    invoke-virtual {p1}, Landroidx/camera/core/SurfaceRequest;->willNotProvideSurface()Z

    .line 280
    throw v0

    .line 273
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :catch_1
    move-exception v0

    .line 275
    .local v0, "e":Landroidx/camera/core/impl/DeferrableSurface$SurfaceClosedException;
    new-instance v1, Ljava/lang/AssertionError;

    const-string/jumbo v3, "Surface is somehow already closed"

    invoke-direct {v1, v3, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public final disconnect()V
    .locals 0

    .line 397
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 398
    invoke-direct {p0}, Landroidx/camera/core/processing/SurfaceEdge;->checkNotClosed()V

    .line 399
    invoke-direct {p0}, Landroidx/camera/core/processing/SurfaceEdge;->disconnectWithoutCheckingClosed()V

    .line 400
    return-void
.end method

.method public getCropRect()Landroid/graphics/Rect;
    .locals 1

    .line 468
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mCropRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method public getDeferrableSurface()Landroidx/camera/core/impl/DeferrableSurface;
    .locals 1

    .line 192
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 193
    invoke-direct {p0}, Landroidx/camera/core/processing/SurfaceEdge;->checkNotClosed()V

    .line 194
    invoke-direct {p0}, Landroidx/camera/core/processing/SurfaceEdge;->checkAndSetHasConsumer()V

    .line 195
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mSettableSurface:Landroidx/camera/core/processing/SurfaceEdge$SettableSurface;

    return-object v0
.end method

.method public getDeferrableSurfaceForTesting()Landroidx/camera/core/impl/DeferrableSurface;
    .locals 1

    .line 560
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mSettableSurface:Landroidx/camera/core/processing/SurfaceEdge$SettableSurface;

    return-object v0
.end method

.method public getFormat()I
    .locals 1

    .line 424
    iget v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mFormat:I

    return v0
.end method

.method public getMirroring()Z
    .locals 1

    .line 542
    iget-boolean v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mMirroring:Z

    return v0
.end method

.method public getRotationDegrees()I
    .locals 1

    .line 475
    iget v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mRotationDegrees:I

    return v0
.end method

.method public getSensorToBufferTransform()Landroid/graphics/Matrix;
    .locals 1

    .line 444
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mSensorToBufferTransform:Landroid/graphics/Matrix;

    return-object v0
.end method

.method public getStreamSpec()Landroidx/camera/core/impl/StreamSpec;
    .locals 1

    .line 550
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mStreamSpec:Landroidx/camera/core/impl/StreamSpec;

    return-object v0
.end method

.method public getTargets()I
    .locals 1

    .line 416
    iget v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mTargets:I

    return v0
.end method

.method public hasCameraTransform()Z
    .locals 1

    .line 456
    iget-boolean v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mHasCameraTransform:Z

    return v0
.end method

.method public hasProvider()Z
    .locals 1

    .line 573
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mSettableSurface:Landroidx/camera/core/processing/SurfaceEdge$SettableSurface;

    invoke-virtual {v0}, Landroidx/camera/core/processing/SurfaceEdge$SettableSurface;->hasProvider()Z

    move-result v0

    return v0
.end method

.method public invalidate()V
    .locals 3

    .line 353
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 354
    invoke-direct {p0}, Landroidx/camera/core/processing/SurfaceEdge;->checkNotClosed()V

    .line 355
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mSettableSurface:Landroidx/camera/core/processing/SurfaceEdge$SettableSurface;

    invoke-virtual {v0}, Landroidx/camera/core/processing/SurfaceEdge$SettableSurface;->canSetProvider()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 357
    return-void

    .line 359
    :cond_0
    invoke-direct {p0}, Landroidx/camera/core/processing/SurfaceEdge;->disconnectWithoutCheckingClosed()V

    .line 360
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mHasConsumer:Z

    .line 361
    new-instance v0, Landroidx/camera/core/processing/SurfaceEdge$SettableSurface;

    iget-object v1, p0, Landroidx/camera/core/processing/SurfaceEdge;->mStreamSpec:Landroidx/camera/core/impl/StreamSpec;

    invoke-virtual {v1}, Landroidx/camera/core/impl/StreamSpec;->getResolution()Landroid/util/Size;

    move-result-object v1

    iget v2, p0, Landroidx/camera/core/processing/SurfaceEdge;->mFormat:I

    invoke-direct {v0, v1, v2}, Landroidx/camera/core/processing/SurfaceEdge$SettableSurface;-><init>(Landroid/util/Size;I)V

    iput-object v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mSettableSurface:Landroidx/camera/core/processing/SurfaceEdge$SettableSurface;

    .line 362
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mOnInvalidatedListeners:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    .line 363
    .local v1, "onInvalidated":Ljava/lang/Runnable;
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 364
    .end local v1    # "onInvalidated":Ljava/lang/Runnable;
    goto :goto_0

    .line 365
    :cond_1
    return-void
.end method

.method public isClosed()Z
    .locals 1

    .line 565
    iget-boolean v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mIsClosed:Z

    return v0
.end method

.method synthetic lambda$createSurfaceOutputFuture$2$androidx-camera-core-processing-SurfaceEdge(Landroidx/camera/core/processing/SurfaceEdge$SettableSurface;ILandroid/util/Size;Landroid/graphics/Rect;IZLandroidx/camera/core/impl/CameraInternal;Landroid/view/Surface;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 11
    .param p1, "settableSurface"    # Landroidx/camera/core/processing/SurfaceEdge$SettableSurface;
    .param p2, "format"    # I
    .param p3, "inputSize"    # Landroid/util/Size;
    .param p4, "cropRect"    # Landroid/graphics/Rect;
    .param p5, "rotationDegrees"    # I
    .param p6, "mirroring"    # Z
    .param p7, "cameraInternal"    # Landroidx/camera/core/impl/CameraInternal;
    .param p8, "surface"    # Landroid/view/Surface;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 320
    invoke-static/range {p8 .. p8}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 322
    :try_start_0
    invoke-virtual {p1}, Landroidx/camera/core/processing/SurfaceEdge$SettableSurface;->incrementUseCount()V
    :try_end_0
    .catch Landroidx/camera/core/impl/DeferrableSurface$SurfaceClosedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 325
    nop

    .line 326
    new-instance v0, Landroidx/camera/core/processing/SurfaceOutputImpl;

    .line 327
    invoke-virtual {p0}, Landroidx/camera/core/processing/SurfaceEdge;->getTargets()I

    move-result v2

    iget-object v1, p0, Landroidx/camera/core/processing/SurfaceEdge;->mStreamSpec:Landroidx/camera/core/impl/StreamSpec;

    invoke-virtual {v1}, Landroidx/camera/core/impl/StreamSpec;->getResolution()Landroid/util/Size;

    move-result-object v4

    iget-object v10, p0, Landroidx/camera/core/processing/SurfaceEdge;->mSensorToBufferTransform:Landroid/graphics/Matrix;

    move v3, p2

    move-object v5, p3

    move-object v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move-object/from16 v9, p7

    move-object/from16 v1, p8

    invoke-direct/range {v0 .. v10}, Landroidx/camera/core/processing/SurfaceOutputImpl;-><init>(Landroid/view/Surface;IILandroid/util/Size;Landroid/util/Size;Landroid/graphics/Rect;IZLandroidx/camera/core/impl/CameraInternal;Landroid/graphics/Matrix;)V

    .line 329
    .local v0, "surfaceOutputImpl":Landroidx/camera/core/processing/SurfaceOutputImpl;
    invoke-virtual {v0}, Landroidx/camera/core/processing/SurfaceOutputImpl;->getCloseFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    .line 330
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v2, Landroidx/camera/core/processing/SurfaceEdge$$ExternalSyntheticLambda6;

    invoke-direct {v2, p1}, Landroidx/camera/core/processing/SurfaceEdge$$ExternalSyntheticLambda6;-><init>(Landroidx/camera/core/processing/SurfaceEdge$SettableSurface;)V

    .line 331
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v3

    .line 329
    invoke-interface {v1, v2, v3}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 332
    iput-object v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mConsumerToNotify:Landroidx/camera/core/processing/SurfaceOutputImpl;

    .line 333
    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFuture(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    return-object v1

    .line 323
    .end local v0    # "surfaceOutputImpl":Landroidx/camera/core/processing/SurfaceOutputImpl;
    :catch_0
    move-exception v0

    .line 324
    .local v0, "e":Landroidx/camera/core/impl/DeferrableSurface$SurfaceClosedException;
    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    return-object v1
.end method

.method synthetic lambda$createSurfaceRequest$0$androidx-camera-core-processing-SurfaceEdge()V
    .locals 1

    .line 260
    iget-boolean v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mIsClosed:Z

    if-nez v0, :cond_0

    .line 261
    invoke-virtual {p0}, Landroidx/camera/core/processing/SurfaceEdge;->invalidate()V

    .line 263
    :cond_0
    return-void
.end method

.method synthetic lambda$createSurfaceRequest$1$androidx-camera-core-processing-SurfaceEdge()V
    .locals 2

    .line 259
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    new-instance v1, Landroidx/camera/core/processing/SurfaceEdge$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0}, Landroidx/camera/core/processing/SurfaceEdge$$ExternalSyntheticLambda4;-><init>(Landroidx/camera/core/processing/SurfaceEdge;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$updateTransformation$3$androidx-camera-core-processing-SurfaceEdge(II)V
    .locals 2
    .param p1, "rotationDegrees"    # I
    .param p2, "targetRotation"    # I

    .line 505
    const/4 v0, 0x0

    .line 506
    .local v0, "isDirty":Z
    iget v1, p0, Landroidx/camera/core/processing/SurfaceEdge;->mRotationDegrees:I

    if-eq v1, p1, :cond_0

    .line 507
    const/4 v0, 0x1

    .line 508
    iput p1, p0, Landroidx/camera/core/processing/SurfaceEdge;->mRotationDegrees:I

    .line 510
    :cond_0
    iget v1, p0, Landroidx/camera/core/processing/SurfaceEdge;->mTargetRotation:I

    if-eq v1, p2, :cond_1

    .line 511
    const/4 v0, 0x1

    .line 512
    iput p2, p0, Landroidx/camera/core/processing/SurfaceEdge;->mTargetRotation:I

    .line 514
    :cond_1
    if-eqz v0, :cond_2

    .line 515
    invoke-direct {p0}, Landroidx/camera/core/processing/SurfaceEdge;->notifyTransformationInfoUpdate()V

    .line 517
    :cond_2
    return-void
.end method

.method public setProvider(Landroidx/camera/core/impl/DeferrableSurface;)V
    .locals 2
    .param p1, "provider"    # Landroidx/camera/core/impl/DeferrableSurface;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/impl/DeferrableSurface$SurfaceClosedException;
        }
    .end annotation

    .line 232
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 233
    invoke-direct {p0}, Landroidx/camera/core/processing/SurfaceEdge;->checkNotClosed()V

    .line 234
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceEdge;->mSettableSurface:Landroidx/camera/core/processing/SurfaceEdge$SettableSurface;

    new-instance v1, Landroidx/camera/core/processing/SurfaceEdge$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Landroidx/camera/core/processing/SurfaceEdge$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/core/processing/SurfaceEdge;)V

    invoke-virtual {v0, p1, v1}, Landroidx/camera/core/processing/SurfaceEdge$SettableSurface;->setProvider(Landroidx/camera/core/impl/DeferrableSurface;Ljava/lang/Runnable;)Z

    .line 235
    return-void
.end method

.method public updateTransformation(I)V
    .locals 1
    .param p1, "rotationDegrees"    # I

    .line 482
    const/4 v0, -0x1

    invoke-virtual {p0, p1, v0}, Landroidx/camera/core/processing/SurfaceEdge;->updateTransformation(II)V

    .line 483
    return-void
.end method

.method public updateTransformation(II)V
    .locals 1
    .param p1, "rotationDegrees"    # I
    .param p2, "targetRotation"    # I

    .line 504
    new-instance v0, Landroidx/camera/core/processing/SurfaceEdge$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0, p1, p2}, Landroidx/camera/core/processing/SurfaceEdge$$ExternalSyntheticLambda3;-><init>(Landroidx/camera/core/processing/SurfaceEdge;II)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/Threads;->runOnMain(Ljava/lang/Runnable;)V

    .line 518
    return-void
.end method
