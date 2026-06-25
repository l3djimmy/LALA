.class public final Landroidx/camera/camera2/internal/StreamUseCaseUtil;
.super Ljava/lang/Object;
.source "StreamUseCaseUtil.java"


# static fields
.field public static final STREAM_USE_CASE_STREAM_SPEC_OPTION:Landroidx/camera/core/impl/Config$Option;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/Config$Option<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private static final STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Ljava/util/Set<",
            "Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final STREAM_USE_CASE_TO_ELIGIBLE_STREAM_SHARING_CHILDREN_TYPES_MAP:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Ljava/util/Set<",
            "Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "Camera2CameraImpl"


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 65
    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    .line 66
    const-string/jumbo v1, "camera2.streamSpec.streamUseCase"

    invoke-static {v1, v0}, Landroidx/camera/core/impl/Config$Option;->create(Ljava/lang/String;Ljava/lang/Class;)Landroidx/camera/core/impl/Config$Option;

    move-result-object v0

    sput-object v0, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_STREAM_SPEC_OPTION:Landroidx/camera/core/impl/Config$Option;

    .line 69
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP:Ljava/util/Map;

    .line 72
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_TO_ELIGIBLE_STREAM_SHARING_CHILDREN_TYPES_MAP:Ljava/util/Map;

    .line 75
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-lt v0, v1, :cond_0

    .line 76
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 77
    .local v0, "captureTypes":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;>;"
    sget-object v1, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->PREVIEW:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 78
    sget-object v1, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP:Ljava/util/Map;

    .line 79
    const-wide/16 v2, 0x4

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    .line 78
    invoke-interface {v1, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 83
    .end local v0    # "captureTypes":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;>;"
    .local v1, "captureTypes":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;>;"
    sget-object v0, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->PREVIEW:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 84
    sget-object v0, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->IMAGE_ANALYSIS:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 85
    sget-object v0, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP:Ljava/util/Map;

    .line 86
    const-wide/16 v4, 0x1

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    .line 85
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 89
    .end local v1    # "captureTypes":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;>;"
    .restart local v0    # "captureTypes":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;>;"
    sget-object v1, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->IMAGE_CAPTURE:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 90
    sget-object v1, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP:Ljava/util/Map;

    .line 91
    const-wide/16 v4, 0x2

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    .line 90
    invoke-interface {v1, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 94
    .end local v0    # "captureTypes":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;>;"
    .restart local v1    # "captureTypes":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;>;"
    sget-object v0, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->VIDEO_CAPTURE:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 95
    sget-object v0, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP:Ljava/util/Map;

    .line 96
    const-wide/16 v4, 0x3

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    .line 95
    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 100
    .end local v1    # "captureTypes":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;>;"
    .restart local v0    # "captureTypes":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;>;"
    sget-object v1, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->PREVIEW:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 101
    sget-object v1, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->IMAGE_CAPTURE:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 102
    sget-object v1, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->VIDEO_CAPTURE:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 103
    sget-object v1, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_TO_ELIGIBLE_STREAM_SHARING_CHILDREN_TYPES_MAP:Ljava/util/Map;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 107
    .end local v0    # "captureTypes":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;>;"
    .restart local v1    # "captureTypes":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;>;"
    sget-object v0, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->PREVIEW:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 108
    sget-object v0, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->VIDEO_CAPTURE:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 109
    sget-object v0, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_TO_ELIGIBLE_STREAM_SHARING_CHILDREN_TYPES_MAP:Ljava/util/Map;

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    .end local v1    # "captureTypes":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;>;"
    :cond_0
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    return-void
.end method

.method public static areCaptureTypesEligible(Ljava/util/Map;Ljava/util/Map;Ljava/util/List;)Z
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceConfig;",
            ">;)Z"
        }
    .end annotation

    .line 389
    .local p0, "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local p1, "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .local p2, "surfaceConfigsWithStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-ge v0, v1, :cond_6

    .line 391
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/SurfaceConfig;

    invoke-virtual {v1}, Landroidx/camera/core/impl/SurfaceConfig;->getStreamUseCase()J

    move-result-wide v3

    .line 392
    .local v3, "streamUseCase":J
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    const/4 v5, 0x0

    if-eqz v1, :cond_2

    .line 393
    nop

    .line 394
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/AttachedSurfaceInfo;

    .line 395
    .local v1, "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    invoke-virtual {v1}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getCaptureTypes()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ne v6, v2, :cond_0

    .line 396
    invoke-virtual {v1}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getCaptureTypes()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    goto :goto_1

    .line 397
    :cond_0
    sget-object v2, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->STREAM_SHARING:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    .line 398
    :goto_1
    invoke-virtual {v1}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getCaptureTypes()Ljava/util/List;

    move-result-object v6

    .line 395
    invoke-static {v2, v3, v4, v6}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->isEligibleCaptureType(Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;JLjava/util/List;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 399
    return v5

    .line 401
    .end local v1    # "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    :cond_1
    goto :goto_3

    :cond_2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 402
    nop

    .line 403
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/UseCaseConfig;

    .line 404
    .local v1, "newUseCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    invoke-interface {v1}, Landroidx/camera/core/impl/UseCaseConfig;->getCaptureType()Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    move-result-object v2

    .line 406
    nop

    .line 405
    invoke-interface {v1}, Landroidx/camera/core/impl/UseCaseConfig;->getCaptureType()Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    move-result-object v6

    sget-object v7, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->STREAM_SHARING:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    if-ne v6, v7, :cond_3

    .line 407
    move-object v6, v1

    check-cast v6, Landroidx/camera/core/streamsharing/StreamSharingConfig;

    invoke-virtual {v6}, Landroidx/camera/core/streamsharing/StreamSharingConfig;->getCaptureTypes()Ljava/util/List;

    move-result-object v6

    goto :goto_2

    .line 408
    :cond_3
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v6

    .line 404
    :goto_2
    invoke-static {v2, v3, v4, v6}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->isEligibleCaptureType(Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;JLjava/util/List;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 409
    return v5

    .line 411
    .end local v1    # "newUseCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    :cond_4
    nop

    .line 389
    .end local v3    # "streamUseCase":J
    :goto_3
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    .line 412
    .restart local v3    # "streamUseCase":J
    :cond_5
    new-instance v1, Ljava/lang/AssertionError;

    const-string/jumbo v2, "SurfaceConfig does not map to any use case"

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 415
    .end local v0    # "i":I
    .end local v3    # "streamUseCase":J
    :cond_6
    return v2
.end method

.method private static areStreamUseCasesAvailable(Ljava/util/Set;Ljava/util/Set;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/Long;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/Long;",
            ">;)Z"
        }
    .end annotation

    .line 546
    .local p0, "availableStreamUseCasesSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    .local p1, "streamUseCases":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    .line 547
    .local v1, "streamUseCase":Ljava/lang/Long;
    invoke-interface {p0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 548
    const/4 v0, 0x0

    return v0

    .line 550
    .end local v1    # "streamUseCase":Ljava/lang/Long;
    :cond_0
    goto :goto_0

    .line 551
    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method public static areStreamUseCasesAvailableForSurfaceConfigs(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;Ljava/util/List;)Z
    .locals 7
    .param p0, "characteristicsCompat"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceConfig;",
            ">;)Z"
        }
    .end annotation

    .line 317
    .local p1, "surfaceConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    const/4 v2, 0x0

    if-ge v0, v1, :cond_0

    .line 318
    return v2

    .line 320
    :cond_0
    sget-object v0, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_AVAILABLE_STREAM_USE_CASES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [J

    .line 322
    .local v0, "availableStreamUseCases":[J
    if-eqz v0, :cond_5

    array-length v1, v0

    if-nez v1, :cond_1

    goto :goto_2

    .line 325
    :cond_1
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 326
    .local v1, "availableStreamUseCaseSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    array-length v3, v0

    move v4, v2

    :goto_0
    if-ge v4, v3, :cond_2

    aget-wide v5, v0, v4

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    .line 327
    .local v5, "availableStreamUseCase":Ljava/lang/Long;
    invoke-interface {v1, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 326
    .end local v5    # "availableStreamUseCase":Ljava/lang/Long;
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 329
    :cond_2
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/impl/SurfaceConfig;

    .line 330
    .local v4, "surfaceConfig":Landroidx/camera/core/impl/SurfaceConfig;
    invoke-virtual {v4}, Landroidx/camera/core/impl/SurfaceConfig;->getStreamUseCase()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 331
    return v2

    .line 333
    .end local v4    # "surfaceConfig":Landroidx/camera/core/impl/SurfaceConfig;
    :cond_3
    goto :goto_1

    .line 334
    :cond_4
    const/4 v2, 0x1

    return v2

    .line 323
    .end local v1    # "availableStreamUseCaseSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    :cond_5
    :goto_2
    return v2
.end method

.method public static containsZslUseCase(Ljava/util/List;Ljava/util/List;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            ">;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;)Z"
        }
    .end annotation

    .line 504
    .local p0, "attachedSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local p1, "newUseCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/AttachedSurfaceInfo;

    .line 505
    .local v1, "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    nop

    .line 506
    invoke-virtual {v1}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getCaptureTypes()Ljava/util/List;

    move-result-object v4

    .line 507
    .local v4, "captureTypes":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;>;"
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    .line 508
    .local v3, "captureType":Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;
    nop

    .line 509
    invoke-virtual {v1}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v5

    .line 508
    invoke-static {v5, v3}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->isZslUseCase(Landroidx/camera/core/impl/Config;Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 511
    return v2

    .line 513
    .end local v1    # "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    .end local v3    # "captureType":Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;
    .end local v4    # "captureTypes":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;>;"
    :cond_0
    goto :goto_0

    .line 514
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/UseCaseConfig;

    .line 515
    .local v1, "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    invoke-interface {v1}, Landroidx/camera/core/impl/UseCaseConfig;->getCaptureType()Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    move-result-object v4

    invoke-static {v1, v4}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->isZslUseCase(Landroidx/camera/core/impl/Config;Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 516
    return v2

    .line 518
    .end local v1    # "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    :cond_2
    goto :goto_1

    .line 519
    :cond_3
    return v3
.end method

.method public static getStreamSpecImplementationOptions(Landroidx/camera/core/impl/UseCaseConfig;)Landroidx/camera/camera2/impl/Camera2ImplConfig;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;)",
            "Landroidx/camera/camera2/impl/Camera2ImplConfig;"
        }
    .end annotation

    .line 179
    .local p0, "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    invoke-static {}, Landroidx/camera/core/impl/MutableOptionsBundle;->create()Landroidx/camera/core/impl/MutableOptionsBundle;

    move-result-object v0

    .line 180
    .local v0, "optionsBundle":Landroidx/camera/core/impl/MutableOptionsBundle;
    sget-object v1, Landroidx/camera/camera2/impl/Camera2ImplConfig;->STREAM_USE_CASE_OPTION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v1}, Landroidx/camera/core/impl/UseCaseConfig;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 181
    sget-object v1, Landroidx/camera/camera2/impl/Camera2ImplConfig;->STREAM_USE_CASE_OPTION:Landroidx/camera/core/impl/Config$Option;

    sget-object v2, Landroidx/camera/camera2/impl/Camera2ImplConfig;->STREAM_USE_CASE_OPTION:Landroidx/camera/core/impl/Config$Option;

    .line 183
    invoke-interface {p0, v2}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    .line 181
    invoke-virtual {v0, v1, v2}, Landroidx/camera/core/impl/MutableOptionsBundle;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 186
    :cond_0
    sget-object v1, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_ZSL_DISABLED:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v1}, Landroidx/camera/core/impl/UseCaseConfig;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 187
    sget-object v1, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_ZSL_DISABLED:Landroidx/camera/core/impl/Config$Option;

    sget-object v2, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_ZSL_DISABLED:Landroidx/camera/core/impl/Config$Option;

    .line 189
    invoke-interface {p0, v2}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    .line 187
    invoke-virtual {v0, v1, v2}, Landroidx/camera/core/impl/MutableOptionsBundle;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 192
    :cond_1
    sget-object v1, Landroidx/camera/core/impl/ImageCaptureConfig;->OPTION_IMAGE_CAPTURE_MODE:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v1}, Landroidx/camera/core/impl/UseCaseConfig;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 193
    sget-object v1, Landroidx/camera/core/impl/ImageCaptureConfig;->OPTION_IMAGE_CAPTURE_MODE:Landroidx/camera/core/impl/Config$Option;

    sget-object v2, Landroidx/camera/core/impl/ImageCaptureConfig;->OPTION_IMAGE_CAPTURE_MODE:Landroidx/camera/core/impl/Config$Option;

    .line 196
    invoke-interface {p0, v2}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 193
    invoke-virtual {v0, v1, v2}, Landroidx/camera/core/impl/MutableOptionsBundle;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 199
    :cond_2
    sget-object v1, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_INPUT_FORMAT:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v1}, Landroidx/camera/core/impl/UseCaseConfig;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 200
    sget-object v1, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_INPUT_FORMAT:Landroidx/camera/core/impl/Config$Option;

    sget-object v2, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_INPUT_FORMAT:Landroidx/camera/core/impl/Config$Option;

    .line 203
    invoke-interface {p0, v2}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 200
    invoke-virtual {v0, v1, v2}, Landroidx/camera/core/impl/MutableOptionsBundle;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 206
    :cond_3
    new-instance v1, Landroidx/camera/camera2/impl/Camera2ImplConfig;

    invoke-direct {v1, v0}, Landroidx/camera/camera2/impl/Camera2ImplConfig;-><init>(Landroidx/camera/core/impl/Config;)V

    return-object v1
.end method

.method private static getUpdatedImplementationOptionsWithUseCaseStreamSpecOption(Landroidx/camera/core/impl/Config;J)Landroidx/camera/core/impl/Config;
    .locals 3
    .param p0, "oldImplementationOptions"    # Landroidx/camera/core/impl/Config;
    .param p1, "streamUseCase"    # J

    .line 486
    sget-object v0, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_STREAM_SPEC_OPTION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v0}, Landroidx/camera/core/impl/Config;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_STREAM_SPEC_OPTION:Landroidx/camera/core/impl/Config$Option;

    .line 487
    invoke-interface {p0, v0}, Landroidx/camera/core/impl/Config;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    cmp-long v0, v0, p1

    if-nez v0, :cond_0

    .line 490
    const/4 v0, 0x0

    return-object v0

    .line 492
    :cond_0
    nop

    .line 493
    invoke-static {p0}, Landroidx/camera/core/impl/MutableOptionsBundle;->from(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/MutableOptionsBundle;

    move-result-object v0

    .line 494
    .local v0, "optionsBundle":Landroidx/camera/core/impl/MutableOptionsBundle;
    sget-object v1, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_STREAM_SPEC_OPTION:Landroidx/camera/core/impl/Config$Option;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroidx/camera/core/impl/MutableOptionsBundle;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 495
    new-instance v1, Landroidx/camera/camera2/impl/Camera2ImplConfig;

    invoke-direct {v1, v0}, Landroidx/camera/camera2/impl/Camera2ImplConfig;-><init>(Landroidx/camera/core/impl/Config;)V

    return-object v1
.end method

.method private static isEligibleCaptureType(Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;JLjava/util/List;)Z
    .locals 6
    .param p0, "captureType"    # Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;
    .param p1, "streamUseCase"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;",
            "J",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;",
            ">;)Z"
        }
    .end annotation

    .line 344
    .local p3, "streamSharingTypes":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;>;"
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    const/4 v2, 0x0

    if-ge v0, v1, :cond_0

    .line 345
    return v2

    .line 347
    :cond_0
    sget-object v0, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->STREAM_SHARING:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    const/4 v1, 0x1

    if-ne p0, v0, :cond_5

    .line 348
    sget-object v0, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_TO_ELIGIBLE_STREAM_SHARING_CHILDREN_TYPES_MAP:Ljava/util/Map;

    .line 349
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    .line 348
    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 350
    return v2

    .line 352
    :cond_1
    sget-object v0, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_TO_ELIGIBLE_STREAM_SHARING_CHILDREN_TYPES_MAP:Ljava/util/Map;

    .line 354
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    .line 353
    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 355
    .local v0, "captureTypes":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;>;"
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v3

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v4

    if-eq v3, v4, :cond_2

    .line 356
    return v2

    .line 358
    :cond_2
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    .line 359
    .local v4, "childType":Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;
    invoke-interface {v0, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 360
    return v2

    .line 362
    .end local v4    # "childType":Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;
    :cond_3
    goto :goto_0

    .line 363
    :cond_4
    return v1

    .line 365
    .end local v0    # "captureTypes":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;>;"
    :cond_5
    sget-object v0, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    sget-object v0, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP:Ljava/util/Map;

    .line 366
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    move v2, v1

    goto :goto_1

    :cond_6
    nop

    .line 365
    :goto_1
    return v2
.end method

.method public static isStreamUseCaseSupported(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Z
    .locals 3
    .param p0, "characteristicsCompat"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 215
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    const/4 v2, 0x0

    if-ge v0, v1, :cond_0

    .line 216
    return v2

    .line 218
    :cond_0
    sget-object v0, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_AVAILABLE_STREAM_USE_CASES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [J

    .line 220
    .local v0, "availableStreamUseCases":[J
    if-eqz v0, :cond_2

    array-length v1, v0

    if-nez v1, :cond_1

    goto :goto_0

    .line 223
    :cond_1
    const/4 v1, 0x1

    return v1

    .line 221
    :cond_2
    :goto_0
    return v2
.end method

.method private static isValidCamera2InteropOverride(Ljava/util/List;Ljava/util/List;Ljava/util/Set;)Z
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            ">;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;",
            "Ljava/util/Set<",
            "Ljava/lang/Long;",
            ">;)Z"
        }
    .end annotation

    .line 568
    .local p0, "attachedSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local p1, "newUseCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .local p2, "availableStreamUseCases":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 569
    .local v0, "streamUseCases":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    const/4 v1, 0x0

    .line 570
    .local v1, "hasNonDefaultStreamUseCase":Z
    const/4 v2, 0x0

    .line 571
    .local v2, "hasDefaultOrNullStreamUseCase":Z
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const-wide/16 v5, 0x0

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/AttachedSurfaceInfo;

    .line 572
    .local v3, "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    invoke-virtual {v3}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v4

    sget-object v7, Landroidx/camera/camera2/impl/Camera2ImplConfig;->STREAM_USE_CASE_OPTION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v4, v7}, Landroidx/camera/core/impl/Config;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 574
    const/4 v2, 0x1

    .line 575
    goto :goto_0

    .line 577
    :cond_0
    nop

    .line 578
    invoke-virtual {v3}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v4

    sget-object v7, Landroidx/camera/camera2/impl/Camera2ImplConfig;->STREAM_USE_CASE_OPTION:Landroidx/camera/core/impl/Config$Option;

    .line 579
    invoke-interface {v4, v7}, Landroidx/camera/core/impl/Config;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    .line 580
    .local v7, "streamUseCaseOverride":J
    cmp-long v4, v7, v5

    if-nez v4, :cond_1

    .line 582
    const/4 v2, 0x1

    .line 583
    goto :goto_0

    .line 585
    :cond_1
    const/4 v1, 0x1

    .line 586
    nop

    .line 588
    .end local v3    # "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    .end local v7    # "streamUseCaseOverride":J
    :cond_2
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/impl/UseCaseConfig;

    .line 589
    .local v4, "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    sget-object v7, Landroidx/camera/camera2/impl/Camera2ImplConfig;->STREAM_USE_CASE_OPTION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v4, v7}, Landroidx/camera/core/impl/UseCaseConfig;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v7

    if-nez v7, :cond_3

    .line 590
    const/4 v2, 0x1

    .line 591
    if-eqz v1, :cond_6

    .line 592
    invoke-static {}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->throwInvalidCamera2InteropOverrideException()V

    goto :goto_2

    .line 595
    :cond_3
    sget-object v7, Landroidx/camera/camera2/impl/Camera2ImplConfig;->STREAM_USE_CASE_OPTION:Landroidx/camera/core/impl/Config$Option;

    .line 596
    invoke-interface {v4, v7}, Landroidx/camera/core/impl/UseCaseConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Long;

    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    .line 597
    .restart local v7    # "streamUseCaseOverride":J
    cmp-long v9, v7, v5

    if-nez v9, :cond_4

    .line 599
    const/4 v2, 0x1

    .line 600
    if-eqz v1, :cond_6

    .line 601
    invoke-static {}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->throwInvalidCamera2InteropOverrideException()V

    goto :goto_2

    .line 604
    :cond_4
    const/4 v1, 0x1

    .line 605
    if-eqz v2, :cond_5

    .line 606
    invoke-static {}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->throwInvalidCamera2InteropOverrideException()V

    .line 608
    :cond_5
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-interface {v0, v9}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 612
    .end local v4    # "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    .end local v7    # "streamUseCaseOverride":J
    :cond_6
    :goto_2
    goto :goto_1

    .line 613
    :cond_7
    if-nez v2, :cond_8

    invoke-static {p2, v0}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->areStreamUseCasesAvailable(Ljava/util/Set;Ljava/util/Set;)Z

    move-result v3

    if-eqz v3, :cond_8

    const/4 v3, 0x1

    goto :goto_3

    :cond_8
    const/4 v3, 0x0

    :goto_3
    return v3
.end method

.method private static isZslUseCase(Landroidx/camera/core/impl/Config;Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;)Z
    .locals 4
    .param p0, "config"    # Landroidx/camera/core/impl/Config;
    .param p1, "captureType"    # Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    .line 527
    sget-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_ZSL_DISABLED:Landroidx/camera/core/impl/Config$Option;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {p0, v0, v2}, Landroidx/camera/core/impl/Config;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 528
    return v1

    .line 531
    :cond_0
    sget-object v0, Landroidx/camera/core/impl/ImageCaptureConfig;->OPTION_IMAGE_CAPTURE_MODE:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p0, v0}, Landroidx/camera/core/impl/Config;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 532
    return v1

    .line 535
    :cond_1
    sget-object v0, Landroidx/camera/core/impl/ImageCaptureConfig;->OPTION_IMAGE_CAPTURE_MODE:Landroidx/camera/core/impl/Config$Option;

    .line 536
    invoke-interface {p0, v0}, Landroidx/camera/core/impl/Config;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 537
    .local v0, "captureMode":I
    invoke-static {p1, v0}, Landroidx/camera/camera2/internal/TemplateTypeUtil;->getSessionConfigTemplateType(Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;I)I

    move-result v2

    const/4 v3, 0x5

    if-ne v2, v3, :cond_2

    const/4 v1, 0x1

    :cond_2
    return v1
.end method

.method public static populateStreamUseCaseStreamSpecOptionWithInteropOverride(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;Ljava/util/List;Ljava/util/Map;Ljava/util/Map;)Z
    .locals 9
    .param p0, "characteristicsCompat"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            ">;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Landroidx/camera/core/impl/StreamSpec;",
            ">;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            "Landroidx/camera/core/impl/StreamSpec;",
            ">;)Z"
        }
    .end annotation

    .line 255
    .local p1, "attachedSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local p2, "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/impl/StreamSpec;>;"
    .local p3, "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    const/4 v2, 0x0

    if-ge v0, v1, :cond_0

    .line 256
    return v2

    .line 258
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 260
    .local v0, "newUseCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/AttachedSurfaceInfo;

    .line 261
    .local v3, "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    invoke-virtual {v3}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v4

    invoke-static {v4}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 262
    .end local v3    # "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    goto :goto_0

    .line 264
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/UseCaseConfig;

    .line 265
    .local v3, "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    nop

    .line 266
    invoke-interface {p2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/impl/StreamSpec;

    .line 265
    invoke-static {v4}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/impl/StreamSpec;

    .line 266
    invoke-virtual {v4}, Landroidx/camera/core/impl/StreamSpec;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v4

    .line 265
    invoke-static {v4}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 267
    .end local v3    # "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    goto :goto_1

    .line 268
    :cond_2
    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_AVAILABLE_STREAM_USE_CASES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {p0, v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [J

    .line 270
    .local v1, "availableStreamUseCases":[J
    if-eqz v1, :cond_a

    array-length v3, v1

    if-nez v3, :cond_3

    goto/16 :goto_5

    .line 273
    :cond_3
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 274
    .local v3, "availableStreamUseCaseSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    array-length v4, v1

    move v5, v2

    :goto_2
    if-ge v5, v4, :cond_4

    aget-wide v6, v1, v5

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    .line 275
    .local v6, "availableStreamUseCase":Ljava/lang/Long;
    invoke-interface {v3, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 274
    .end local v6    # "availableStreamUseCase":Ljava/lang/Long;
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 277
    :cond_4
    invoke-static {p1, v0, v3}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->isValidCamera2InteropOverride(Ljava/util/List;Ljava/util/List;Ljava/util/Set;)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 279
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/impl/AttachedSurfaceInfo;

    .line 280
    .local v4, "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    invoke-virtual {v4}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v5

    .line 281
    .local v5, "oldImplementationOptions":Landroidx/camera/core/impl/Config;
    sget-object v6, Landroidx/camera/camera2/impl/Camera2ImplConfig;->STREAM_USE_CASE_OPTION:Landroidx/camera/core/impl/Config$Option;

    .line 284
    invoke-interface {v5, v6}, Landroidx/camera/core/impl/Config;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    .line 282
    invoke-static {v5, v6, v7}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->getUpdatedImplementationOptionsWithUseCaseStreamSpecOption(Landroidx/camera/core/impl/Config;J)Landroidx/camera/core/impl/Config;

    move-result-object v6

    .line 286
    .local v6, "newImplementationOptions":Landroidx/camera/core/impl/Config;
    if-eqz v6, :cond_5

    .line 287
    nop

    .line 288
    invoke-virtual {v4, v6}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->toStreamSpec(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/StreamSpec;

    move-result-object v7

    .line 287
    invoke-interface {p3, v4, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 290
    .end local v4    # "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    .end local v5    # "oldImplementationOptions":Landroidx/camera/core/impl/Config;
    .end local v6    # "newImplementationOptions":Landroidx/camera/core/impl/Config;
    :cond_5
    goto :goto_3

    .line 291
    :cond_6
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/impl/UseCaseConfig;

    .line 292
    .local v4, "newUseCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    invoke-interface {p2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/camera/core/impl/StreamSpec;

    .line 293
    .local v5, "oldStreamSpec":Landroidx/camera/core/impl/StreamSpec;
    invoke-virtual {v5}, Landroidx/camera/core/impl/StreamSpec;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v6

    .line 294
    .local v6, "oldImplementationOptions":Landroidx/camera/core/impl/Config;
    sget-object v7, Landroidx/camera/camera2/impl/Camera2ImplConfig;->STREAM_USE_CASE_OPTION:Landroidx/camera/core/impl/Config$Option;

    .line 296
    invoke-interface {v6, v7}, Landroidx/camera/core/impl/Config;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Long;

    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    .line 295
    invoke-static {v6, v7, v8}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->getUpdatedImplementationOptionsWithUseCaseStreamSpecOption(Landroidx/camera/core/impl/Config;J)Landroidx/camera/core/impl/Config;

    move-result-object v7

    .line 298
    .local v7, "newImplementationOptions":Landroidx/camera/core/impl/Config;
    if-eqz v7, :cond_7

    .line 299
    nop

    .line 300
    invoke-virtual {v5}, Landroidx/camera/core/impl/StreamSpec;->toBuilder()Landroidx/camera/core/impl/StreamSpec$Builder;

    move-result-object v8

    invoke-virtual {v8, v7}, Landroidx/camera/core/impl/StreamSpec$Builder;->setImplementationOptions(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/StreamSpec$Builder;

    move-result-object v8

    .line 301
    invoke-virtual {v8}, Landroidx/camera/core/impl/StreamSpec$Builder;->build()Landroidx/camera/core/impl/StreamSpec;

    move-result-object v8

    .line 302
    .local v8, "newStreamSpec":Landroidx/camera/core/impl/StreamSpec;
    invoke-interface {p2, v4, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
    .end local v4    # "newUseCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    .end local v5    # "oldStreamSpec":Landroidx/camera/core/impl/StreamSpec;
    .end local v6    # "oldImplementationOptions":Landroidx/camera/core/impl/Config;
    .end local v7    # "newImplementationOptions":Landroidx/camera/core/impl/Config;
    .end local v8    # "newStreamSpec":Landroidx/camera/core/impl/StreamSpec;
    :cond_7
    goto :goto_4

    .line 305
    :cond_8
    const/4 v2, 0x1

    return v2

    .line 307
    :cond_9
    return v2

    .line 271
    .end local v3    # "availableStreamUseCaseSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    :cond_a
    :goto_5
    return v2
.end method

.method public static populateStreamUseCaseStreamSpecOptionWithSupportedSurfaceConfigs(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Landroidx/camera/core/impl/StreamSpec;",
            ">;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            "Landroidx/camera/core/impl/StreamSpec;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceConfig;",
            ">;)V"
        }
    .end annotation

    .line 442
    .local p0, "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/impl/StreamSpec;>;"
    .local p1, "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    .local p2, "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local p3, "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .local p4, "surfaceConfigsWithStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_4

    .line 443
    invoke-interface {p4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/SurfaceConfig;

    invoke-virtual {v1}, Landroidx/camera/core/impl/SurfaceConfig;->getStreamUseCase()J

    move-result-wide v1

    .line 444
    .local v1, "streamUseCase":J
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {p2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 445
    nop

    .line 446
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {p2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/AttachedSurfaceInfo;

    .line 447
    .local v3, "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    invoke-virtual {v3}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v4

    .line 448
    .local v4, "oldImplementationOptions":Landroidx/camera/core/impl/Config;
    nop

    .line 449
    invoke-static {v4, v1, v2}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->getUpdatedImplementationOptionsWithUseCaseStreamSpecOption(Landroidx/camera/core/impl/Config;J)Landroidx/camera/core/impl/Config;

    move-result-object v5

    .line 451
    .local v5, "newImplementationOptions":Landroidx/camera/core/impl/Config;
    if-eqz v5, :cond_0

    .line 452
    nop

    .line 453
    invoke-virtual {v3, v5}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->toStreamSpec(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/StreamSpec;

    move-result-object v6

    .line 452
    invoke-interface {p1, v3, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 455
    .end local v3    # "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    .end local v4    # "oldImplementationOptions":Landroidx/camera/core/impl/Config;
    .end local v5    # "newImplementationOptions":Landroidx/camera/core/impl/Config;
    :cond_0
    goto :goto_1

    :cond_1
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {p3, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 456
    nop

    .line 457
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {p3, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/UseCaseConfig;

    .line 458
    .local v3, "newUseCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    invoke-interface {p0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/impl/StreamSpec;

    .line 459
    .local v4, "oldStreamSpec":Landroidx/camera/core/impl/StreamSpec;
    invoke-virtual {v4}, Landroidx/camera/core/impl/StreamSpec;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v5

    .line 460
    .local v5, "oldImplementationOptions":Landroidx/camera/core/impl/Config;
    nop

    .line 461
    invoke-static {v5, v1, v2}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->getUpdatedImplementationOptionsWithUseCaseStreamSpecOption(Landroidx/camera/core/impl/Config;J)Landroidx/camera/core/impl/Config;

    move-result-object v6

    .line 463
    .local v6, "newImplementationOptions":Landroidx/camera/core/impl/Config;
    if-eqz v6, :cond_2

    .line 464
    nop

    .line 465
    invoke-virtual {v4}, Landroidx/camera/core/impl/StreamSpec;->toBuilder()Landroidx/camera/core/impl/StreamSpec$Builder;

    move-result-object v7

    invoke-virtual {v7, v6}, Landroidx/camera/core/impl/StreamSpec$Builder;->setImplementationOptions(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/StreamSpec$Builder;

    move-result-object v7

    .line 466
    invoke-virtual {v7}, Landroidx/camera/core/impl/StreamSpec$Builder;->build()Landroidx/camera/core/impl/StreamSpec;

    move-result-object v7

    .line 467
    .local v7, "newStreamSpec":Landroidx/camera/core/impl/StreamSpec;
    invoke-interface {p0, v3, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 470
    .end local v3    # "newUseCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    .end local v4    # "oldStreamSpec":Landroidx/camera/core/impl/StreamSpec;
    .end local v5    # "oldImplementationOptions":Landroidx/camera/core/impl/Config;
    .end local v6    # "newImplementationOptions":Landroidx/camera/core/impl/Config;
    .end local v7    # "newStreamSpec":Landroidx/camera/core/impl/StreamSpec;
    :cond_2
    nop

    .line 442
    .end local v1    # "streamUseCase":J
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 471
    .restart local v1    # "streamUseCase":J
    :cond_3
    new-instance v3, Ljava/lang/AssertionError;

    const-string/jumbo v4, "SurfaceConfig does not map to any use case"

    invoke-direct {v3, v4}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3

    .line 475
    .end local v0    # "i":I
    .end local v1    # "streamUseCase":J
    :cond_4
    return-void
.end method

.method public static populateSurfaceToStreamUseCaseMapping(Ljava/util/Collection;Ljava/util/Collection;Ljava/util/Map;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/impl/SessionConfig;",
            ">;",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .line 130
    .local p0, "sessionConfigs":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/impl/SessionConfig;>;"
    .local p1, "useCaseConfigs":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .local p2, "streamUseCaseMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/DeferrableSurface;Ljava/lang/Long;>;"
    const/4 v0, 0x0

    .line 131
    .local v0, "position":I
    const/4 v1, 0x0

    .line 132
    .local v1, "hasStreamUseCase":Z
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 133
    .local v2, "useCaseConfigArrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/impl/SessionConfig;

    .line 134
    .local v4, "sessionConfig":Landroidx/camera/core/impl/SessionConfig;
    invoke-virtual {v4}, Landroidx/camera/core/impl/SessionConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v5

    sget-object v6, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_STREAM_SPEC_OPTION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v5, v6}, Landroidx/camera/core/impl/Config;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 136
    invoke-virtual {v4}, Landroidx/camera/core/impl/SessionConfig;->getSurfaces()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    const/4 v6, 0x1

    if-eq v5, v6, :cond_0

    .line 137
    nop

    .line 139
    invoke-virtual {v4}, Landroidx/camera/core/impl/SessionConfig;->getSurfaces()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    .line 137
    const-string/jumbo v5, "SessionConfig has stream use case but also contains %d surfaces, abort populateSurfaceToStreamUseCaseMapping()."

    invoke-static {v5, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const-string v5, "Camera2CameraImpl"

    invoke-static {v5, v3}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    return-void

    .line 142
    :cond_0
    invoke-virtual {v4}, Landroidx/camera/core/impl/SessionConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v5

    sget-object v6, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_STREAM_SPEC_OPTION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v5, v6}, Landroidx/camera/core/impl/Config;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 144
    const/4 v1, 0x1

    .line 145
    goto :goto_1

    .line 147
    .end local v4    # "sessionConfig":Landroidx/camera/core/impl/SessionConfig;
    :cond_1
    goto :goto_0

    .line 149
    :cond_2
    :goto_1
    if-eqz v1, :cond_5

    .line 150
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/impl/SessionConfig;

    .line 151
    .restart local v4    # "sessionConfig":Landroidx/camera/core/impl/SessionConfig;
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/camera/core/impl/UseCaseConfig;

    invoke-interface {v5}, Landroidx/camera/core/impl/UseCaseConfig;->getCaptureType()Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    move-result-object v5

    sget-object v6, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->METERING_REPEATING:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    const/4 v7, 0x0

    if-ne v5, v6, :cond_3

    .line 156
    invoke-virtual {v4}, Landroidx/camera/core/impl/SessionConfig;->getSurfaces()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/camera/core/impl/DeferrableSurface;

    .line 157
    const-wide/16 v6, 0x1

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    .line 156
    invoke-interface {p2, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 159
    :cond_3
    invoke-virtual {v4}, Landroidx/camera/core/impl/SessionConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v5

    sget-object v6, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_STREAM_SPEC_OPTION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v5, v6}, Landroidx/camera/core/impl/Config;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 161
    invoke-virtual {v4}, Landroidx/camera/core/impl/SessionConfig;->getSurfaces()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/camera/core/impl/DeferrableSurface;

    .line 162
    invoke-virtual {v4}, Landroidx/camera/core/impl/SessionConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v6

    sget-object v7, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->STREAM_USE_CASE_STREAM_SPEC_OPTION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v6, v7}, Landroidx/camera/core/impl/Config;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    .line 161
    invoke-interface {p2, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    :cond_4
    :goto_3
    nop

    .end local v4    # "sessionConfig":Landroidx/camera/core/impl/SessionConfig;
    add-int/lit8 v0, v0, 0x1

    .line 166
    goto :goto_2

    .line 168
    :cond_5
    return-void
.end method

.method public static shouldUseStreamUseCase(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;)Z
    .locals 2
    .param p0, "featureSettings"    # Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;

    .line 231
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->getCameraMode()I

    move-result v0

    if-nez v0, :cond_0

    .line 232
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->getRequiredMaxBitDepth()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 231
    :goto_0
    return v0
.end method

.method private static throwInvalidCamera2InteropOverrideException()V
    .locals 2

    .line 555
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Either all use cases must have non-default stream use case assigned or none should have it"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
