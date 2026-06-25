.class public Landroidx/camera/video/internal/workaround/QualityValidatedEncoderProfilesProvider;
.super Ljava/lang/Object;
.source "QualityValidatedEncoderProfilesProvider.java"

# interfaces
.implements Landroidx/camera/core/impl/EncoderProfilesProvider;


# static fields
.field private static final CAMCORDER_TO_VIDEO_QUALITY_MAP:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroidx/camera/video/Quality;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mCameraInfo:Landroidx/camera/core/impl/CameraInfoInternal;

.field private final mProvider:Landroidx/camera/core/impl/EncoderProfilesProvider;

.field private final mQuirks:Landroidx/camera/core/impl/Quirks;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 55
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Landroidx/camera/video/internal/workaround/QualityValidatedEncoderProfilesProvider;->CAMCORDER_TO_VIDEO_QUALITY_MAP:Ljava/util/Map;

    .line 57
    sget-object v0, Landroidx/camera/video/internal/workaround/QualityValidatedEncoderProfilesProvider;->CAMCORDER_TO_VIDEO_QUALITY_MAP:Ljava/util/Map;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Landroidx/camera/video/Quality;->HIGHEST:Landroidx/camera/video/Quality;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    sget-object v0, Landroidx/camera/video/internal/workaround/QualityValidatedEncoderProfilesProvider;->CAMCORDER_TO_VIDEO_QUALITY_MAP:Ljava/util/Map;

    const/16 v1, 0x8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Landroidx/camera/video/Quality;->UHD:Landroidx/camera/video/Quality;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    sget-object v0, Landroidx/camera/video/internal/workaround/QualityValidatedEncoderProfilesProvider;->CAMCORDER_TO_VIDEO_QUALITY_MAP:Ljava/util/Map;

    const/4 v1, 0x6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Landroidx/camera/video/Quality;->FHD:Landroidx/camera/video/Quality;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    sget-object v0, Landroidx/camera/video/internal/workaround/QualityValidatedEncoderProfilesProvider;->CAMCORDER_TO_VIDEO_QUALITY_MAP:Ljava/util/Map;

    const/4 v1, 0x5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Landroidx/camera/video/Quality;->HD:Landroidx/camera/video/Quality;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    sget-object v0, Landroidx/camera/video/internal/workaround/QualityValidatedEncoderProfilesProvider;->CAMCORDER_TO_VIDEO_QUALITY_MAP:Ljava/util/Map;

    const/4 v1, 0x4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Landroidx/camera/video/Quality;->SD:Landroidx/camera/video/Quality;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    sget-object v0, Landroidx/camera/video/internal/workaround/QualityValidatedEncoderProfilesProvider;->CAMCORDER_TO_VIDEO_QUALITY_MAP:Ljava/util/Map;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Landroidx/camera/video/Quality;->LOWEST:Landroidx/camera/video/Quality;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    return-void
.end method

.method public constructor <init>(Landroidx/camera/core/impl/EncoderProfilesProvider;Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/camera/core/impl/Quirks;)V
    .locals 0
    .param p1, "provider"    # Landroidx/camera/core/impl/EncoderProfilesProvider;
    .param p2, "cameraInfo"    # Landroidx/camera/core/impl/CameraInfoInternal;
    .param p3, "quirks"    # Landroidx/camera/core/impl/Quirks;

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    iput-object p1, p0, Landroidx/camera/video/internal/workaround/QualityValidatedEncoderProfilesProvider;->mProvider:Landroidx/camera/core/impl/EncoderProfilesProvider;

    .line 75
    iput-object p2, p0, Landroidx/camera/video/internal/workaround/QualityValidatedEncoderProfilesProvider;->mCameraInfo:Landroidx/camera/core/impl/CameraInfoInternal;

    .line 76
    iput-object p3, p0, Landroidx/camera/video/internal/workaround/QualityValidatedEncoderProfilesProvider;->mQuirks:Landroidx/camera/core/impl/Quirks;

    .line 77
    return-void
.end method

.method private isDeviceValidQuality(I)Z
    .locals 4
    .param p1, "quality"    # I

    .line 95
    sget-object v0, Landroidx/camera/video/internal/workaround/QualityValidatedEncoderProfilesProvider;->CAMCORDER_TO_VIDEO_QUALITY_MAP:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/Quality;

    .line 98
    .local v0, "videoQuality":Landroidx/camera/video/Quality;
    if-eqz v0, :cond_1

    .line 99
    iget-object v1, p0, Landroidx/camera/video/internal/workaround/QualityValidatedEncoderProfilesProvider;->mQuirks:Landroidx/camera/core/impl/Quirks;

    const-class v2, Landroidx/camera/video/internal/compat/quirk/VideoQualityQuirk;

    invoke-virtual {v1, v2}, Landroidx/camera/core/impl/Quirks;->getAll(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/video/internal/compat/quirk/VideoQualityQuirk;

    .line 100
    .local v2, "quirk":Landroidx/camera/video/internal/compat/quirk/VideoQualityQuirk;
    if-eqz v2, :cond_0

    iget-object v3, p0, Landroidx/camera/video/internal/workaround/QualityValidatedEncoderProfilesProvider;->mCameraInfo:Landroidx/camera/core/impl/CameraInfoInternal;

    invoke-interface {v2, v3, v0}, Landroidx/camera/video/internal/compat/quirk/VideoQualityQuirk;->isProblematicVideoQuality(Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/camera/video/Quality;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 101
    invoke-interface {v2}, Landroidx/camera/video/internal/compat/quirk/VideoQualityQuirk;->workaroundBySurfaceProcessing()Z

    move-result v3

    if-nez v3, :cond_0

    .line 102
    const/4 v1, 0x0

    return v1

    .line 104
    .end local v2    # "quirk":Landroidx/camera/video/internal/compat/quirk/VideoQualityQuirk;
    :cond_0
    goto :goto_0

    .line 107
    :cond_1
    const/4 v1, 0x1

    return v1
.end method


# virtual methods
.method public getAll(I)Landroidx/camera/core/impl/EncoderProfilesProxy;
    .locals 1
    .param p1, "quality"    # I

    .line 87
    invoke-virtual {p0, p1}, Landroidx/camera/video/internal/workaround/QualityValidatedEncoderProfilesProvider;->hasProfile(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 88
    const/4 v0, 0x0

    return-object v0

    .line 91
    :cond_0
    iget-object v0, p0, Landroidx/camera/video/internal/workaround/QualityValidatedEncoderProfilesProvider;->mProvider:Landroidx/camera/core/impl/EncoderProfilesProvider;

    invoke-interface {v0, p1}, Landroidx/camera/core/impl/EncoderProfilesProvider;->getAll(I)Landroidx/camera/core/impl/EncoderProfilesProxy;

    move-result-object v0

    return-object v0
.end method

.method public hasProfile(I)Z
    .locals 1
    .param p1, "quality"    # I

    .line 81
    iget-object v0, p0, Landroidx/camera/video/internal/workaround/QualityValidatedEncoderProfilesProvider;->mProvider:Landroidx/camera/core/impl/EncoderProfilesProvider;

    invoke-interface {v0, p1}, Landroidx/camera/core/impl/EncoderProfilesProvider;->hasProfile(I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Landroidx/camera/video/internal/workaround/QualityValidatedEncoderProfilesProvider;->isDeviceValidQuality(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
