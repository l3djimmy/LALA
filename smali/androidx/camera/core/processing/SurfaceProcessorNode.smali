.class public Landroidx/camera/core/processing/SurfaceProcessorNode;
.super Ljava/lang/Object;
.source "SurfaceProcessorNode.java"

# interfaces
.implements Landroidx/camera/core/processing/Node;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/processing/SurfaceProcessorNode$In;,
        Landroidx/camera/core/processing/SurfaceProcessorNode$Out;,
        Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/camera/core/processing/Node<",
        "Landroidx/camera/core/processing/SurfaceProcessorNode$In;",
        "Landroidx/camera/core/processing/SurfaceProcessorNode$Out;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "SurfaceProcessorNode"


# instance fields
.field final mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

.field private mInput:Landroidx/camera/core/processing/SurfaceProcessorNode$In;

.field private mOutput:Landroidx/camera/core/processing/SurfaceProcessorNode$Out;

.field final mSurfaceProcessor:Landroidx/camera/core/processing/SurfaceProcessorInternal;


# direct methods
.method public constructor <init>(Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/processing/SurfaceProcessorInternal;)V
    .locals 0
    .param p1, "cameraInternal"    # Landroidx/camera/core/impl/CameraInternal;
    .param p2, "surfaceProcessor"    # Landroidx/camera/core/processing/SurfaceProcessorInternal;

    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 102
    iput-object p1, p0, Landroidx/camera/core/processing/SurfaceProcessorNode;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    .line 103
    iput-object p2, p0, Landroidx/camera/core/processing/SurfaceProcessorNode;->mSurfaceProcessor:Landroidx/camera/core/processing/SurfaceProcessorInternal;

    .line 104
    return-void
.end method

.method private createAndSendSurfaceOutput(Landroidx/camera/core/processing/SurfaceEdge;Ljava/util/Map$Entry;)V
    .locals 8
    .param p1, "input"    # Landroidx/camera/core/processing/SurfaceEdge;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/processing/SurfaceEdge;",
            "Ljava/util/Map$Entry<",
            "Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;",
            "Landroidx/camera/core/processing/SurfaceEdge;",
            ">;)V"
        }
    .end annotation

    .line 200
    .local p2, "output":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;Landroidx/camera/core/processing/SurfaceEdge;>;"
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Landroidx/camera/core/processing/SurfaceEdge;

    .line 201
    invoke-virtual {p1}, Landroidx/camera/core/processing/SurfaceEdge;->getStreamSpec()Landroidx/camera/core/impl/StreamSpec;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/impl/StreamSpec;->getResolution()Landroid/util/Size;

    move-result-object v2

    .line 202
    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;

    invoke-virtual {v0}, Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;->getFormat()I

    move-result v3

    .line 203
    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;

    invoke-virtual {v0}, Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;->getCropRect()Landroid/graphics/Rect;

    move-result-object v4

    .line 204
    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;

    invoke-virtual {v0}, Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;->getRotationDegrees()I

    move-result v5

    .line 205
    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;

    invoke-virtual {v0}, Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;->getMirroring()Z

    move-result v6

    .line 206
    invoke-virtual {p1}, Landroidx/camera/core/processing/SurfaceEdge;->hasCameraTransform()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceProcessorNode;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    move-object v7, v0

    .line 200
    invoke-virtual/range {v1 .. v7}, Landroidx/camera/core/processing/SurfaceEdge;->createSurfaceOutputFuture(Landroid/util/Size;ILandroid/graphics/Rect;IZLandroidx/camera/core/impl/CameraInternal;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 207
    .local v0, "future":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Landroidx/camera/core/SurfaceOutput;>;"
    new-instance v1, Landroidx/camera/core/processing/SurfaceProcessorNode$1;

    invoke-direct {v1, p0}, Landroidx/camera/core/processing/SurfaceProcessorNode$1;-><init>(Landroidx/camera/core/processing/SurfaceProcessorNode;)V

    .line 222
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v2

    .line 207
    invoke-static {v0, v1, v2}, Landroidx/camera/core/impl/utils/futures/Futures;->addCallback(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/camera/core/impl/utils/futures/FutureCallback;Ljava/util/concurrent/Executor;)V

    .line 223
    return-void
.end method

.method static synthetic lambda$setUpRotationUpdates$1(Ljava/util/Map;Landroidx/camera/core/SurfaceRequest$TransformationInfo;)V
    .locals 5
    .param p0, "outputs"    # Ljava/util/Map;
    .param p1, "info"    # Landroidx/camera/core/SurfaceRequest$TransformationInfo;

    .line 243
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 246
    .local v1, "output":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;Landroidx/camera/core/processing/SurfaceEdge;>;"
    nop

    .line 247
    invoke-virtual {p1}, Landroidx/camera/core/SurfaceRequest$TransformationInfo;->getRotationDegrees()I

    move-result v2

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;

    invoke-virtual {v3}, Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;->getRotationDegrees()I

    move-result v3

    sub-int/2addr v2, v3

    .line 248
    .local v2, "rotationDegrees":I
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;

    invoke-virtual {v3}, Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;->getMirroring()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 251
    neg-int v2, v2

    .line 253
    :cond_0
    invoke-static {v2}, Landroidx/camera/core/impl/utils/TransformUtils;->within360(I)I

    move-result v2

    .line 255
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/processing/SurfaceEdge;

    const/4 v4, -0x1

    invoke-virtual {v3, v2, v4}, Landroidx/camera/core/processing/SurfaceEdge;->updateTransformation(II)V

    .line 256
    .end local v1    # "output":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;Landroidx/camera/core/processing/SurfaceEdge;>;"
    .end local v2    # "rotationDegrees":I
    goto :goto_0

    .line 257
    :cond_1
    return-void
.end method

.method private sendSurfaceOutputs(Landroidx/camera/core/processing/SurfaceEdge;Ljava/util/Map;)V
    .locals 4
    .param p1, "input"    # Landroidx/camera/core/processing/SurfaceEdge;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/processing/SurfaceEdge;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;",
            "Landroidx/camera/core/processing/SurfaceEdge;",
            ">;)V"
        }
    .end annotation

    .line 187
    .local p2, "outputs":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;Landroidx/camera/core/processing/SurfaceEdge;>;"
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 188
    .local v1, "output":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;Landroidx/camera/core/processing/SurfaceEdge;>;"
    invoke-direct {p0, p1, v1}, Landroidx/camera/core/processing/SurfaceProcessorNode;->createAndSendSurfaceOutput(Landroidx/camera/core/processing/SurfaceEdge;Ljava/util/Map$Entry;)V

    .line 190
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/processing/SurfaceEdge;

    new-instance v3, Landroidx/camera/core/processing/SurfaceProcessorNode$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0, p1, v1}, Landroidx/camera/core/processing/SurfaceProcessorNode$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/core/processing/SurfaceProcessorNode;Landroidx/camera/core/processing/SurfaceEdge;Ljava/util/Map$Entry;)V

    invoke-virtual {v2, v3}, Landroidx/camera/core/processing/SurfaceEdge;->addOnInvalidatedListener(Ljava/lang/Runnable;)V

    .line 192
    .end local v1    # "output":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;Landroidx/camera/core/processing/SurfaceEdge;>;"
    goto :goto_0

    .line 193
    :cond_0
    return-void
.end method

.method private sendSurfaceRequest(Landroidx/camera/core/processing/SurfaceEdge;Ljava/util/Map;)V
    .locals 4
    .param p1, "input"    # Landroidx/camera/core/processing/SurfaceEdge;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/processing/SurfaceEdge;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;",
            "Landroidx/camera/core/processing/SurfaceEdge;",
            ">;)V"
        }
    .end annotation

    .line 173
    .local p2, "outputs":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;Landroidx/camera/core/processing/SurfaceEdge;>;"
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceProcessorNode;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    invoke-virtual {p1, v0}, Landroidx/camera/core/processing/SurfaceEdge;->createSurfaceRequest(Landroidx/camera/core/impl/CameraInternal;)Landroidx/camera/core/SurfaceRequest;

    move-result-object v0

    .line 174
    .local v0, "surfaceRequest":Landroidx/camera/core/SurfaceRequest;
    invoke-virtual {p0, v0, p2}, Landroidx/camera/core/processing/SurfaceProcessorNode;->setUpRotationUpdates(Landroidx/camera/core/SurfaceRequest;Ljava/util/Map;)V

    .line 176
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/processing/SurfaceProcessorNode;->mSurfaceProcessor:Landroidx/camera/core/processing/SurfaceProcessorInternal;

    invoke-interface {v1, v0}, Landroidx/camera/core/processing/SurfaceProcessorInternal;->onInputSurface(Landroidx/camera/core/SurfaceRequest;)V
    :try_end_0
    .catch Landroidx/camera/core/ProcessingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 179
    goto :goto_0

    .line 177
    :catch_0
    move-exception v1

    .line 178
    .local v1, "e":Landroidx/camera/core/ProcessingException;
    const-string/jumbo v2, "SurfaceProcessorNode"

    const-string v3, "Failed to send SurfaceRequest to SurfaceProcessor."

    invoke-static {v2, v3, v1}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 180
    .end local v1    # "e":Landroidx/camera/core/ProcessingException;
    :goto_0
    return-void
.end method

.method private transformSingleOutput(Landroidx/camera/core/processing/SurfaceEdge;Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;)Landroidx/camera/core/processing/SurfaceEdge;
    .locals 15
    .param p1, "input"    # Landroidx/camera/core/processing/SurfaceEdge;
    .param p2, "outConfig"    # Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;

    .line 130
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;->getCropRect()Landroid/graphics/Rect;

    move-result-object v0

    .line 131
    .local v0, "cropRect":Landroid/graphics/Rect;
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;->getRotationDegrees()I

    move-result v1

    .line 132
    .local v1, "rotationDegrees":I
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;->getMirroring()Z

    move-result v2

    .line 135
    .local v2, "mirroring":Z
    new-instance v3, Landroid/graphics/Matrix;

    .line 136
    invoke-virtual/range {p1 .. p1}, Landroidx/camera/core/processing/SurfaceEdge;->getSensorToBufferTransform()Landroid/graphics/Matrix;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    move-object v9, v3

    .line 137
    .local v9, "sensorToBufferTransform":Landroid/graphics/Matrix;
    new-instance v3, Landroid/graphics/RectF;

    invoke-direct {v3, v0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 139
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;->getSize()Landroid/util/Size;

    move-result-object v4

    invoke-static {v4}, Landroidx/camera/core/impl/utils/TransformUtils;->sizeToRectF(Landroid/util/Size;)Landroid/graphics/RectF;

    move-result-object v4

    .line 137
    invoke-static {v3, v4, v1, v2}, Landroidx/camera/core/impl/utils/TransformUtils;->getRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;IZ)Landroid/graphics/Matrix;

    move-result-object v3

    .line 140
    .local v3, "imageTransform":Landroid/graphics/Matrix;
    invoke-virtual {v9, v3}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 144
    invoke-static {v0, v1}, Landroidx/camera/core/impl/utils/TransformUtils;->getRotatedSize(Landroid/graphics/Rect;I)Landroid/util/Size;

    move-result-object v4

    .line 145
    .local v4, "rotatedCropSize":Landroid/util/Size;
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;->getSize()Landroid/util/Size;

    move-result-object v5

    invoke-static {v4, v5}, Landroidx/camera/core/impl/utils/TransformUtils;->isAspectRatioMatchingWithRoundingError(Landroid/util/Size;Landroid/util/Size;)Z

    move-result v5

    invoke-static {v5}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    .line 148
    invoke-virtual/range {p1 .. p1}, Landroidx/camera/core/processing/SurfaceEdge;->getStreamSpec()Landroidx/camera/core/impl/StreamSpec;

    move-result-object v5

    invoke-virtual {v5}, Landroidx/camera/core/impl/StreamSpec;->toBuilder()Landroidx/camera/core/impl/StreamSpec$Builder;

    move-result-object v5

    .line 149
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;->getSize()Landroid/util/Size;

    move-result-object v6

    .line 148
    invoke-virtual {v5, v6}, Landroidx/camera/core/impl/StreamSpec$Builder;->setResolution(Landroid/util/Size;)Landroidx/camera/core/impl/StreamSpec$Builder;

    move-result-object v5

    .line 149
    invoke-virtual {v5}, Landroidx/camera/core/impl/StreamSpec$Builder;->build()Landroidx/camera/core/impl/StreamSpec;

    move-result-object v8

    .line 151
    .local v8, "streamSpec":Landroidx/camera/core/impl/StreamSpec;
    new-instance v5, Landroidx/camera/core/processing/SurfaceEdge;

    .line 152
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;->getTargets()I

    move-result v6

    .line 153
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;->getFormat()I

    move-result v7

    .line 159
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;->getSize()Landroid/util/Size;

    move-result-object v10

    invoke-static {v10}, Landroidx/camera/core/impl/utils/TransformUtils;->sizeToRect(Landroid/util/Size;)Landroid/graphics/Rect;

    move-result-object v11

    .line 160
    invoke-virtual/range {p1 .. p1}, Landroidx/camera/core/processing/SurfaceEdge;->getRotationDegrees()I

    move-result v10

    sub-int v12, v10, v1

    .line 163
    invoke-virtual/range {p1 .. p1}, Landroidx/camera/core/processing/SurfaceEdge;->getMirroring()Z

    move-result v10

    if-eq v10, v2, :cond_0

    const/4 v10, 0x1

    goto :goto_0

    :cond_0
    const/4 v10, 0x0

    :goto_0
    move v14, v10

    const/4 v10, 0x0

    const/4 v13, -0x1

    invoke-direct/range {v5 .. v14}, Landroidx/camera/core/processing/SurfaceEdge;-><init>(IILandroidx/camera/core/impl/StreamSpec;Landroid/graphics/Matrix;ZLandroid/graphics/Rect;IIZ)V

    .line 165
    .local v5, "outputSurface":Landroidx/camera/core/processing/SurfaceEdge;
    return-object v5
.end method


# virtual methods
.method public getSurfaceProcessor()Landroidx/camera/core/processing/SurfaceProcessorInternal;
    .locals 1

    .line 281
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceProcessorNode;->mSurfaceProcessor:Landroidx/camera/core/processing/SurfaceProcessorInternal;

    return-object v0
.end method

.method synthetic lambda$release$2$androidx-camera-core-processing-SurfaceProcessorNode()V
    .locals 2

    .line 267
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceProcessorNode;->mOutput:Landroidx/camera/core/processing/SurfaceProcessorNode$Out;

    if-eqz v0, :cond_0

    .line 268
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceProcessorNode;->mOutput:Landroidx/camera/core/processing/SurfaceProcessorNode$Out;

    invoke-virtual {v0}, Landroidx/camera/core/processing/SurfaceProcessorNode$Out;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/processing/SurfaceEdge;

    .line 270
    .local v1, "surface":Landroidx/camera/core/processing/SurfaceEdge;
    invoke-virtual {v1}, Landroidx/camera/core/processing/SurfaceEdge;->close()V

    .line 271
    .end local v1    # "surface":Landroidx/camera/core/processing/SurfaceEdge;
    goto :goto_0

    .line 273
    :cond_0
    return-void
.end method

.method synthetic lambda$sendSurfaceOutputs$0$androidx-camera-core-processing-SurfaceProcessorNode(Landroidx/camera/core/processing/SurfaceEdge;Ljava/util/Map$Entry;)V
    .locals 0
    .param p1, "input"    # Landroidx/camera/core/processing/SurfaceEdge;
    .param p2, "output"    # Ljava/util/Map$Entry;

    .line 191
    invoke-direct {p0, p1, p2}, Landroidx/camera/core/processing/SurfaceProcessorNode;->createAndSendSurfaceOutput(Landroidx/camera/core/processing/SurfaceEdge;Ljava/util/Map$Entry;)V

    return-void
.end method

.method public release()V
    .locals 2

    .line 265
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceProcessorNode;->mSurfaceProcessor:Landroidx/camera/core/processing/SurfaceProcessorInternal;

    invoke-interface {v0}, Landroidx/camera/core/processing/SurfaceProcessorInternal;->release()V

    .line 266
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    new-instance v1, Landroidx/camera/core/processing/SurfaceProcessorNode$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Landroidx/camera/core/processing/SurfaceProcessorNode$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/core/processing/SurfaceProcessorNode;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 274
    return-void
.end method

.method setUpRotationUpdates(Landroidx/camera/core/SurfaceRequest;Ljava/util/Map;)V
    .locals 2
    .param p1, "inputSurfaceRequest"    # Landroidx/camera/core/SurfaceRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/SurfaceRequest;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;",
            "Landroidx/camera/core/processing/SurfaceEdge;",
            ">;)V"
        }
    .end annotation

    .line 242
    .local p2, "outputs":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;Landroidx/camera/core/processing/SurfaceEdge;>;"
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    new-instance v1, Landroidx/camera/core/processing/SurfaceProcessorNode$$ExternalSyntheticLambda2;

    invoke-direct {v1, p2}, Landroidx/camera/core/processing/SurfaceProcessorNode$$ExternalSyntheticLambda2;-><init>(Ljava/util/Map;)V

    invoke-virtual {p1, v0, v1}, Landroidx/camera/core/SurfaceRequest;->setTransformationInfoListener(Ljava/util/concurrent/Executor;Landroidx/camera/core/SurfaceRequest$TransformationInfoListener;)V

    .line 258
    return-void
.end method

.method public transform(Landroidx/camera/core/processing/SurfaceProcessorNode$In;)Landroidx/camera/core/processing/SurfaceProcessorNode$Out;
    .locals 5
    .param p1, "input"    # Landroidx/camera/core/processing/SurfaceProcessorNode$In;

    .line 113
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 114
    iput-object p1, p0, Landroidx/camera/core/processing/SurfaceProcessorNode;->mInput:Landroidx/camera/core/processing/SurfaceProcessorNode$In;

    .line 115
    new-instance v0, Landroidx/camera/core/processing/SurfaceProcessorNode$Out;

    invoke-direct {v0}, Landroidx/camera/core/processing/SurfaceProcessorNode$Out;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/processing/SurfaceProcessorNode;->mOutput:Landroidx/camera/core/processing/SurfaceProcessorNode$Out;

    .line 117
    invoke-virtual {p1}, Landroidx/camera/core/processing/SurfaceProcessorNode$In;->getSurfaceEdge()Landroidx/camera/core/processing/SurfaceEdge;

    move-result-object v0

    .line 118
    .local v0, "inputSurface":Landroidx/camera/core/processing/SurfaceEdge;
    invoke-virtual {p1}, Landroidx/camera/core/processing/SurfaceProcessorNode$In;->getOutConfigs()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;

    .line 119
    .local v2, "config":Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;
    iget-object v3, p0, Landroidx/camera/core/processing/SurfaceProcessorNode;->mOutput:Landroidx/camera/core/processing/SurfaceProcessorNode$Out;

    invoke-direct {p0, v0, v2}, Landroidx/camera/core/processing/SurfaceProcessorNode;->transformSingleOutput(Landroidx/camera/core/processing/SurfaceEdge;Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;)Landroidx/camera/core/processing/SurfaceEdge;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Landroidx/camera/core/processing/SurfaceProcessorNode$Out;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    .end local v2    # "config":Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;
    goto :goto_0

    .line 121
    :cond_0
    iget-object v1, p0, Landroidx/camera/core/processing/SurfaceProcessorNode;->mOutput:Landroidx/camera/core/processing/SurfaceProcessorNode$Out;

    invoke-direct {p0, v0, v1}, Landroidx/camera/core/processing/SurfaceProcessorNode;->sendSurfaceRequest(Landroidx/camera/core/processing/SurfaceEdge;Ljava/util/Map;)V

    .line 122
    iget-object v1, p0, Landroidx/camera/core/processing/SurfaceProcessorNode;->mOutput:Landroidx/camera/core/processing/SurfaceProcessorNode$Out;

    invoke-direct {p0, v0, v1}, Landroidx/camera/core/processing/SurfaceProcessorNode;->sendSurfaceOutputs(Landroidx/camera/core/processing/SurfaceEdge;Ljava/util/Map;)V

    .line 123
    iget-object v1, p0, Landroidx/camera/core/processing/SurfaceProcessorNode;->mOutput:Landroidx/camera/core/processing/SurfaceProcessorNode$Out;

    return-object v1
.end method

.method public bridge synthetic transform(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 76
    check-cast p1, Landroidx/camera/core/processing/SurfaceProcessorNode$In;

    invoke-virtual {p0, p1}, Landroidx/camera/core/processing/SurfaceProcessorNode;->transform(Landroidx/camera/core/processing/SurfaceProcessorNode$In;)Landroidx/camera/core/processing/SurfaceProcessorNode$Out;

    move-result-object p1

    return-object p1
.end method
