.class public abstract Landroidx/camera/video/internal/encoder/EncoderInfoImpl;
.super Ljava/lang/Object;
.source "EncoderInfoImpl.java"

# interfaces
.implements Landroidx/camera/video/internal/encoder/EncoderInfo;


# instance fields
.field protected final mCodecCapabilities:Landroid/media/MediaCodecInfo$CodecCapabilities;

.field private final mMediaCodecInfo:Landroid/media/MediaCodecInfo;


# direct methods
.method constructor <init>(Landroid/media/MediaCodecInfo;Ljava/lang/String;)V
    .locals 4
    .param p1, "codecInfo"    # Landroid/media/MediaCodecInfo;
    .param p2, "mime"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/video/internal/encoder/InvalidConfigException;
        }
    .end annotation

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Landroidx/camera/video/internal/encoder/EncoderInfoImpl;->mMediaCodecInfo:Landroid/media/MediaCodecInfo;

    .line 44
    :try_start_0
    invoke-virtual {p1, p2}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/MediaCodecInfo$CodecCapabilities;

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderInfoImpl;->mCodecCapabilities:Landroid/media/MediaCodecInfo$CodecCapabilities;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    nop

    .line 51
    return-void

    .line 45
    :catch_0
    move-exception v0

    .line 48
    .local v0, "e":Ljava/lang/RuntimeException;
    new-instance v1, Landroidx/camera/video/internal/encoder/InvalidConfigException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Unable to get CodecCapabilities for mime: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Landroidx/camera/video/internal/encoder/InvalidConfigException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method static findCodecAndGetCodecInfo(Landroidx/camera/video/internal/encoder/EncoderConfig;)Landroid/media/MediaCodecInfo;
    .locals 2
    .param p0, "encoderConfig"    # Landroidx/camera/video/internal/encoder/EncoderConfig;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/video/internal/encoder/InvalidConfigException;
        }
    .end annotation

    .line 62
    new-instance v0, Landroidx/camera/video/internal/workaround/EncoderFinder;

    invoke-direct {v0}, Landroidx/camera/video/internal/workaround/EncoderFinder;-><init>()V

    invoke-interface {p0}, Landroidx/camera/video/internal/encoder/EncoderConfig;->toMediaFormat()Landroid/media/MediaFormat;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/video/internal/workaround/EncoderFinder;->findEncoder(Landroid/media/MediaFormat;)Landroid/media/MediaCodec;

    move-result-object v0

    .line 63
    .local v0, "codec":Landroid/media/MediaCodec;
    invoke-virtual {v0}, Landroid/media/MediaCodec;->getCodecInfo()Landroid/media/MediaCodecInfo;

    move-result-object v1

    .line 64
    .local v1, "codecInfo":Landroid/media/MediaCodecInfo;
    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    .line 65
    return-object v1
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .line 56
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderInfoImpl;->mMediaCodecInfo:Landroid/media/MediaCodecInfo;

    invoke-virtual {v0}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
