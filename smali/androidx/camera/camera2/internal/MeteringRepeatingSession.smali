.class Landroidx/camera/camera2/internal/MeteringRepeatingSession;
.super Ljava/lang/Object;
.source "MeteringRepeatingSession.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/camera2/internal/MeteringRepeatingSession$MeteringRepeatingConfig;,
        Landroidx/camera/camera2/internal/MeteringRepeatingSession$SurfaceResetCallback;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "MeteringRepeating"


# instance fields
.field private final mConfigWithDefaults:Landroidx/camera/camera2/internal/MeteringRepeatingSession$MeteringRepeatingConfig;

.field private mDeferrableSurface:Landroidx/camera/core/impl/DeferrableSurface;

.field private final mMeteringRepeatingSize:Landroid/util/Size;

.field private mSessionConfig:Landroidx/camera/core/impl/SessionConfig;

.field private final mSupportedRepeatingSurfaceSize:Landroidx/camera/camera2/internal/compat/workaround/SupportedRepeatingSurfaceSize;

.field private final mSurfaceResetCallback:Landroidx/camera/camera2/internal/MeteringRepeatingSession$SurfaceResetCallback;


# direct methods
.method constructor <init>(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;Landroidx/camera/camera2/internal/DisplayInfoManager;Landroidx/camera/camera2/internal/MeteringRepeatingSession$SurfaceResetCallback;)V
    .locals 2
    .param p1, "cameraCharacteristicsCompat"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    .param p2, "displayInfoManager"    # Landroidx/camera/camera2/internal/DisplayInfoManager;
    .param p3, "surfaceResetCallback"    # Landroidx/camera/camera2/internal/MeteringRepeatingSession$SurfaceResetCallback;

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    new-instance v0, Landroidx/camera/camera2/internal/compat/workaround/SupportedRepeatingSurfaceSize;

    invoke-direct {v0}, Landroidx/camera/camera2/internal/compat/workaround/SupportedRepeatingSurfaceSize;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/MeteringRepeatingSession;->mSupportedRepeatingSurfaceSize:Landroidx/camera/camera2/internal/compat/workaround/SupportedRepeatingSurfaceSize;

    .line 84
    new-instance v0, Landroidx/camera/camera2/internal/MeteringRepeatingSession$MeteringRepeatingConfig;

    invoke-direct {v0}, Landroidx/camera/camera2/internal/MeteringRepeatingSession$MeteringRepeatingConfig;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/MeteringRepeatingSession;->mConfigWithDefaults:Landroidx/camera/camera2/internal/MeteringRepeatingSession$MeteringRepeatingConfig;

    .line 85
    iput-object p3, p0, Landroidx/camera/camera2/internal/MeteringRepeatingSession;->mSurfaceResetCallback:Landroidx/camera/camera2/internal/MeteringRepeatingSession$SurfaceResetCallback;

    .line 87
    invoke-direct {p0, p1, p2}, Landroidx/camera/camera2/internal/MeteringRepeatingSession;->getProperPreviewSize(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;Landroidx/camera/camera2/internal/DisplayInfoManager;)Landroid/util/Size;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/internal/MeteringRepeatingSession;->mMeteringRepeatingSize:Landroid/util/Size;

    .line 89
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "MeteringSession SurfaceTexture size: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/camera2/internal/MeteringRepeatingSession;->mMeteringRepeatingSize:Landroid/util/Size;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "MeteringRepeating"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/MeteringRepeatingSession;->createSessionConfig()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/internal/MeteringRepeatingSession;->mSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    .line 92
    return-void
.end method

.method private getProperPreviewSize(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;Landroidx/camera/camera2/internal/DisplayInfoManager;)Landroid/util/Size;
    .locals 16
    .param p1, "cameraCharacteristicsCompat"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    .param p2, "displayInfoManager"    # Landroidx/camera/camera2/internal/DisplayInfoManager;

    .line 193
    nop

    .line 194
    invoke-virtual/range {p1 .. p1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->getStreamConfigurationMapCompat()Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;

    move-result-object v0

    .line 195
    .local v0, "mapCompat":Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;
    const/16 v1, 0x22

    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;->getOutputSizes(I)[Landroid/util/Size;

    move-result-object v1

    .line 196
    .local v1, "outputSizes":[Landroid/util/Size;
    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 197
    const-string v3, "MeteringRepeating"

    const-string v4, "Can not get output size list."

    invoke-static {v3, v4}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 198
    new-instance v3, Landroid/util/Size;

    invoke-direct {v3, v2, v2}, Landroid/util/Size;-><init>(II)V

    return-object v3

    .line 201
    :cond_0
    move-object/from16 v3, p0

    iget-object v4, v3, Landroidx/camera/camera2/internal/MeteringRepeatingSession;->mSupportedRepeatingSurfaceSize:Landroidx/camera/camera2/internal/compat/workaround/SupportedRepeatingSurfaceSize;

    invoke-virtual {v4, v1}, Landroidx/camera/camera2/internal/compat/workaround/SupportedRepeatingSurfaceSize;->getSupportedSizes([Landroid/util/Size;)[Landroid/util/Size;

    move-result-object v1

    .line 203
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    .line 204
    .local v4, "outSizesList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    new-instance v5, Landroidx/camera/camera2/internal/MeteringRepeatingSession$$ExternalSyntheticLambda1;

    invoke-direct {v5}, Landroidx/camera/camera2/internal/MeteringRepeatingSession$$ExternalSyntheticLambda1;-><init>()V

    invoke-static {v4, v5}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 212
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/camera2/internal/DisplayInfoManager;->getPreviewSize()Landroid/util/Size;

    move-result-object v5

    .line 213
    .local v5, "previewMaxSize":Landroid/util/Size;
    nop

    .line 214
    invoke-virtual {v5}, Landroid/util/Size;->getWidth()I

    move-result v6

    int-to-long v6, v6

    invoke-virtual {v5}, Landroid/util/Size;->getHeight()I

    move-result v8

    int-to-long v8, v8

    mul-long/2addr v6, v8

    const-wide/32 v8, 0x4b000

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v6

    .line 216
    .local v6, "maxSizeProduct":J
    const/4 v8, 0x0

    .line 217
    .local v8, "previousSize":Landroid/util/Size;
    array-length v9, v1

    move v10, v2

    :goto_0
    if-ge v10, v9, :cond_3

    aget-object v11, v1, v10

    .line 218
    .local v11, "outputSize":Landroid/util/Size;
    invoke-virtual {v11}, Landroid/util/Size;->getWidth()I

    move-result v12

    int-to-long v12, v12

    invoke-virtual {v11}, Landroid/util/Size;->getHeight()I

    move-result v14

    int-to-long v14, v14

    mul-long/2addr v12, v14

    .line 219
    .local v12, "product":J
    cmp-long v14, v12, v6

    if-nez v14, :cond_1

    .line 220
    return-object v11

    .line 221
    :cond_1
    cmp-long v14, v12, v6

    if-lez v14, :cond_2

    .line 222
    if-eqz v8, :cond_3

    .line 223
    return-object v8

    .line 228
    :cond_2
    move-object v8, v11

    .line 217
    .end local v11    # "outputSize":Landroid/util/Size;
    .end local v12    # "product":J
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 232
    :cond_3
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Size;

    return-object v2
.end method

.method static synthetic lambda$getProperPreviewSize$1(Landroid/util/Size;Landroid/util/Size;)I
    .locals 6
    .param p0, "o1"    # Landroid/util/Size;
    .param p1, "o2"    # Landroid/util/Size;

    .line 205
    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result v2

    int-to-long v2, v2

    mul-long/2addr v0, v2

    .line 206
    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v4

    int-to-long v4, v4

    mul-long/2addr v2, v4

    sub-long/2addr v0, v2

    .line 205
    invoke-static {v0, v1}, Ljava/lang/Long;->signum(J)I

    move-result v0

    .line 207
    .local v0, "result":I
    return v0
.end method


# virtual methods
.method clear()V
    .locals 2

    .line 155
    const-string v0, "MeteringRepeating"

    const-string v1, "MeteringRepeating clear!"

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    iget-object v0, p0, Landroidx/camera/camera2/internal/MeteringRepeatingSession;->mDeferrableSurface:Landroidx/camera/core/impl/DeferrableSurface;

    if-eqz v0, :cond_0

    .line 157
    iget-object v0, p0, Landroidx/camera/camera2/internal/MeteringRepeatingSession;->mDeferrableSurface:Landroidx/camera/core/impl/DeferrableSurface;

    invoke-virtual {v0}, Landroidx/camera/core/impl/DeferrableSurface;->close()V

    .line 159
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/camera2/internal/MeteringRepeatingSession;->mDeferrableSurface:Landroidx/camera/core/impl/DeferrableSurface;

    .line 160
    return-void
.end method

.method createSessionConfig()Landroidx/camera/core/impl/SessionConfig;
    .locals 6

    .line 97
    new-instance v0, Landroid/graphics/SurfaceTexture;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 99
    .local v0, "surfaceTexture":Landroid/graphics/SurfaceTexture;
    iget-object v1, p0, Landroidx/camera/camera2/internal/MeteringRepeatingSession;->mMeteringRepeatingSize:Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v1

    iget-object v2, p0, Landroidx/camera/camera2/internal/MeteringRepeatingSession;->mMeteringRepeatingSize:Landroid/util/Size;

    .line 100
    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v2

    .line 99
    invoke-virtual {v0, v1, v2}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 101
    new-instance v1, Landroid/view/Surface;

    invoke-direct {v1, v0}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 103
    .local v1, "surface":Landroid/view/Surface;
    iget-object v2, p0, Landroidx/camera/camera2/internal/MeteringRepeatingSession;->mConfigWithDefaults:Landroidx/camera/camera2/internal/MeteringRepeatingSession$MeteringRepeatingConfig;

    iget-object v3, p0, Landroidx/camera/camera2/internal/MeteringRepeatingSession;->mMeteringRepeatingSize:Landroid/util/Size;

    invoke-static {v2, v3}, Landroidx/camera/core/impl/SessionConfig$Builder;->createFrom(Landroidx/camera/core/impl/UseCaseConfig;Landroid/util/Size;)Landroidx/camera/core/impl/SessionConfig$Builder;

    move-result-object v2

    .line 105
    .local v2, "builder":Landroidx/camera/core/impl/SessionConfig$Builder;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroidx/camera/core/impl/SessionConfig$Builder;->setTemplateType(I)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 107
    new-instance v3, Landroidx/camera/core/impl/ImmediateSurface;

    invoke-direct {v3, v1}, Landroidx/camera/core/impl/ImmediateSurface;-><init>(Landroid/view/Surface;)V

    iput-object v3, p0, Landroidx/camera/camera2/internal/MeteringRepeatingSession;->mDeferrableSurface:Landroidx/camera/core/impl/DeferrableSurface;

    .line 109
    iget-object v3, p0, Landroidx/camera/camera2/internal/MeteringRepeatingSession;->mDeferrableSurface:Landroidx/camera/core/impl/DeferrableSurface;

    invoke-virtual {v3}, Landroidx/camera/core/impl/DeferrableSurface;->getTerminationFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v3

    new-instance v4, Landroidx/camera/camera2/internal/MeteringRepeatingSession$1;

    invoke-direct {v4, p0, v1, v0}, Landroidx/camera/camera2/internal/MeteringRepeatingSession$1;-><init>(Landroidx/camera/camera2/internal/MeteringRepeatingSession;Landroid/view/Surface;Landroid/graphics/SurfaceTexture;)V

    .line 121
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v5

    .line 109
    invoke-static {v3, v4, v5}, Landroidx/camera/core/impl/utils/futures/Futures;->addCallback(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/camera/core/impl/utils/futures/FutureCallback;Ljava/util/concurrent/Executor;)V

    .line 123
    iget-object v3, p0, Landroidx/camera/camera2/internal/MeteringRepeatingSession;->mDeferrableSurface:Landroidx/camera/core/impl/DeferrableSurface;

    invoke-virtual {v2, v3}, Landroidx/camera/core/impl/SessionConfig$Builder;->addSurface(Landroidx/camera/core/impl/DeferrableSurface;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 125
    new-instance v3, Landroidx/camera/camera2/internal/MeteringRepeatingSession$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0}, Landroidx/camera/camera2/internal/MeteringRepeatingSession$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/camera2/internal/MeteringRepeatingSession;)V

    invoke-virtual {v2, v3}, Landroidx/camera/core/impl/SessionConfig$Builder;->addErrorListener(Landroidx/camera/core/impl/SessionConfig$ErrorListener;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 132
    invoke-virtual {v2}, Landroidx/camera/core/impl/SessionConfig$Builder;->build()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v3

    return-object v3
.end method

.method getName()Ljava/lang/String;
    .locals 1

    .line 147
    const-string v0, "MeteringRepeating"

    return-object v0
.end method

.method getSessionConfig()Landroidx/camera/core/impl/SessionConfig;
    .locals 1

    .line 142
    iget-object v0, p0, Landroidx/camera/camera2/internal/MeteringRepeatingSession;->mSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    return-object v0
.end method

.method getUseCaseConfig()Landroidx/camera/core/impl/UseCaseConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;"
        }
    .end annotation

    .line 137
    iget-object v0, p0, Landroidx/camera/camera2/internal/MeteringRepeatingSession;->mConfigWithDefaults:Landroidx/camera/camera2/internal/MeteringRepeatingSession$MeteringRepeatingConfig;

    return-object v0
.end method

.method synthetic lambda$createSessionConfig$0$androidx-camera-camera2-internal-MeteringRepeatingSession(Landroidx/camera/core/impl/SessionConfig;Landroidx/camera/core/impl/SessionConfig$SessionError;)V
    .locals 1
    .param p1, "sessionConfig"    # Landroidx/camera/core/impl/SessionConfig;
    .param p2, "error"    # Landroidx/camera/core/impl/SessionConfig$SessionError;

    .line 126
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/MeteringRepeatingSession;->createSessionConfig()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/internal/MeteringRepeatingSession;->mSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    .line 127
    iget-object v0, p0, Landroidx/camera/camera2/internal/MeteringRepeatingSession;->mSurfaceResetCallback:Landroidx/camera/camera2/internal/MeteringRepeatingSession$SurfaceResetCallback;

    if-eqz v0, :cond_0

    .line 128
    iget-object v0, p0, Landroidx/camera/camera2/internal/MeteringRepeatingSession;->mSurfaceResetCallback:Landroidx/camera/camera2/internal/MeteringRepeatingSession$SurfaceResetCallback;

    invoke-interface {v0}, Landroidx/camera/camera2/internal/MeteringRepeatingSession$SurfaceResetCallback;->onSurfaceReset()V

    .line 130
    :cond_0
    return-void
.end method
