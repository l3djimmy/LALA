.class public Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;
.super Ljava/lang/Object;
.source "VideoEncoderConfigVideoProfileResolver.java"

# interfaces
.implements Landroidx/core/util/Supplier;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/core/util/Supplier<",
        "Landroidx/camera/video/internal/encoder/VideoEncoderConfig;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "VidEncVdPrflRslvr"


# instance fields
.field private final mDynamicRange:Landroidx/camera/core/DynamicRange;

.field private final mExpectedFrameRateRange:Landroid/util/Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final mInputTimebase:Landroidx/camera/core/impl/Timebase;

.field private final mMimeType:Ljava/lang/String;

.field private final mSurfaceSize:Landroid/util/Size;

.field private final mVideoProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

.field private final mVideoSpec:Landroidx/camera/video/VideoSpec;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroidx/camera/core/impl/Timebase;Landroidx/camera/video/VideoSpec;Landroid/util/Size;Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;Landroidx/camera/core/DynamicRange;Landroid/util/Range;)V
    .locals 0
    .param p1, "mimeType"    # Ljava/lang/String;
    .param p2, "inputTimebase"    # Landroidx/camera/core/impl/Timebase;
    .param p3, "videoSpec"    # Landroidx/camera/video/VideoSpec;
    .param p4, "surfaceSize"    # Landroid/util/Size;
    .param p5, "videoProfile"    # Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    .param p6, "dynamicRange"    # Landroidx/camera/core/DynamicRange;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroidx/camera/core/impl/Timebase;",
            "Landroidx/camera/video/VideoSpec;",
            "Landroid/util/Size;",
            "Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;",
            "Landroidx/camera/core/DynamicRange;",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 78
    .local p7, "expectedFrameRateRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    iput-object p1, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;->mMimeType:Ljava/lang/String;

    .line 80
    iput-object p2, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;->mInputTimebase:Landroidx/camera/core/impl/Timebase;

    .line 81
    iput-object p3, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;->mVideoSpec:Landroidx/camera/video/VideoSpec;

    .line 82
    iput-object p4, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;->mSurfaceSize:Landroid/util/Size;

    .line 83
    iput-object p5, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;->mVideoProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    .line 84
    iput-object p6, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;->mDynamicRange:Landroidx/camera/core/DynamicRange;

    .line 85
    iput-object p7, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;->mExpectedFrameRateRange:Landroid/util/Range;

    .line 86
    return-void
.end method

.method private resolveFrameRate()I
    .locals 6

    .line 120
    iget-object v0, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;->mVideoProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    invoke-virtual {v0}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getFrameRate()I

    move-result v0

    .line 122
    .local v0, "videoProfileFrameRate":I
    iget-object v1, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;->mExpectedFrameRateRange:Landroid/util/Range;

    sget-object v2, Landroidx/camera/core/SurfaceRequest;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    invoke-static {v1, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 123
    iget-object v1, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;->mExpectedFrameRateRange:Landroid/util/Range;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/util/Range;->clamp(Ljava/lang/Comparable;)Ljava/lang/Comparable;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .local v1, "resolvedFrameRate":I
    goto :goto_0

    .line 125
    .end local v1    # "resolvedFrameRate":I
    :cond_0
    move v1, v0

    .line 128
    .restart local v1    # "resolvedFrameRate":I
    :goto_0
    nop

    .line 130
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 131
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget-object v4, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;->mExpectedFrameRateRange:Landroid/util/Range;

    sget-object v5, Landroidx/camera/core/SurfaceRequest;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    invoke-static {v4, v5}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 133
    iget-object v4, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;->mExpectedFrameRateRange:Landroid/util/Range;

    goto :goto_1

    :cond_1
    const-string v4, "<UNSPECIFIED>"

    :goto_1
    filled-new-array {v2, v3, v4}, [Ljava/lang/Object;

    move-result-object v2

    .line 129
    const-string/jumbo v3, "Resolved frame rate %dfps [Video profile frame rate: %dfps, Expected operating range: %s]"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 128
    const-string/jumbo v3, "VidEncVdPrflRslvr"

    invoke-static {v3, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    return v1
.end method


# virtual methods
.method public get()Landroidx/camera/video/internal/encoder/VideoEncoderConfig;
    .locals 10

    .line 91
    invoke-direct {p0}, Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;->resolveFrameRate()I

    move-result v3

    .line 92
    .local v3, "resolvedFrameRate":I
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Resolved VIDEO frame rate: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "fps"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "VidEncVdPrflRslvr"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    iget-object v0, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;->mVideoSpec:Landroidx/camera/video/VideoSpec;

    invoke-virtual {v0}, Landroidx/camera/video/VideoSpec;->getBitrate()Landroid/util/Range;

    move-result-object v9

    .line 95
    .local v9, "videoSpecBitrateRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    const-string/jumbo v0, "Using resolved VIDEO bitrate from EncoderProfiles"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    iget-object v0, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;->mVideoProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    .line 97
    invoke-virtual {v0}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getBitrate()I

    move-result v0

    iget-object v1, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;->mDynamicRange:Landroidx/camera/core/DynamicRange;

    .line 98
    invoke-virtual {v1}, Landroidx/camera/core/DynamicRange;->getBitDepth()I

    move-result v1

    iget-object v2, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;->mVideoProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    invoke-virtual {v2}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getBitDepth()I

    move-result v2

    iget-object v4, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;->mVideoProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    .line 99
    invoke-virtual {v4}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getFrameRate()I

    move-result v4

    iget-object v5, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;->mSurfaceSize:Landroid/util/Size;

    .line 100
    invoke-virtual {v5}, Landroid/util/Size;->getWidth()I

    move-result v5

    iget-object v6, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;->mVideoProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    invoke-virtual {v6}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getWidth()I

    move-result v6

    iget-object v7, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;->mSurfaceSize:Landroid/util/Size;

    .line 101
    invoke-virtual {v7}, Landroid/util/Size;->getHeight()I

    move-result v7

    iget-object v8, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;->mVideoProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    invoke-virtual {v8}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getHeight()I

    move-result v8

    .line 96
    invoke-static/range {v0 .. v9}, Landroidx/camera/video/internal/config/VideoConfigUtil;->scaleAndClampBitrate(IIIIIIIIILandroid/util/Range;)I

    move-result v0

    .line 104
    .local v0, "resolvedBitrate":I
    iget-object v1, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;->mVideoProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    invoke-virtual {v1}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getProfile()I

    move-result v1

    .line 105
    .local v1, "resolvedProfile":I
    iget-object v2, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;->mMimeType:Ljava/lang/String;

    .line 106
    invoke-static {v2, v1}, Landroidx/camera/video/internal/config/VideoConfigUtil;->mimeAndProfileToEncoderDataSpace(Ljava/lang/String;I)Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    move-result-object v2

    .line 108
    .local v2, "dataSpace":Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;
    invoke-static {}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig;->builder()Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;

    move-result-object v4

    iget-object v5, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;->mMimeType:Ljava/lang/String;

    .line 109
    invoke-virtual {v4, v5}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;->setMimeType(Ljava/lang/String;)Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;

    move-result-object v4

    iget-object v5, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;->mInputTimebase:Landroidx/camera/core/impl/Timebase;

    .line 110
    invoke-virtual {v4, v5}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;->setInputTimebase(Landroidx/camera/core/impl/Timebase;)Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;

    move-result-object v4

    iget-object v5, p0, Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;->mSurfaceSize:Landroid/util/Size;

    .line 111
    invoke-virtual {v4, v5}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;->setResolution(Landroid/util/Size;)Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;

    move-result-object v4

    .line 112
    invoke-virtual {v4, v0}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;->setBitrate(I)Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;

    move-result-object v4

    .line 113
    invoke-virtual {v4, v3}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;->setFrameRate(I)Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;

    move-result-object v4

    .line 114
    invoke-virtual {v4, v1}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;->setProfile(I)Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;

    move-result-object v4

    .line 115
    invoke-virtual {v4, v2}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;->setDataSpace(Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;)Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;

    move-result-object v4

    .line 116
    invoke-virtual {v4}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;->build()Landroidx/camera/video/internal/encoder/VideoEncoderConfig;

    move-result-object v4

    .line 108
    return-object v4
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1

    .line 41
    invoke-virtual {p0}, Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;->get()Landroidx/camera/video/internal/encoder/VideoEncoderConfig;

    move-result-object v0

    return-object v0
.end method
