.class public final Landroidx/camera/video/Recorder$Builder;
.super Ljava/lang/Object;
.source "Recorder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/video/Recorder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private mAudioEncoderFactory:Landroidx/camera/video/internal/encoder/EncoderFactory;

.field private mExecutor:Ljava/util/concurrent/Executor;

.field private final mMediaSpecBuilder:Landroidx/camera/video/MediaSpec$Builder;

.field private mVideoEncoderFactory:Landroidx/camera/video/internal/encoder/EncoderFactory;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 3205
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3195
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/video/Recorder$Builder;->mExecutor:Ljava/util/concurrent/Executor;

    .line 3196
    sget-object v0, Landroidx/camera/video/Recorder;->DEFAULT_ENCODER_FACTORY:Landroidx/camera/video/internal/encoder/EncoderFactory;

    iput-object v0, p0, Landroidx/camera/video/Recorder$Builder;->mVideoEncoderFactory:Landroidx/camera/video/internal/encoder/EncoderFactory;

    .line 3197
    sget-object v0, Landroidx/camera/video/Recorder;->DEFAULT_ENCODER_FACTORY:Landroidx/camera/video/internal/encoder/EncoderFactory;

    iput-object v0, p0, Landroidx/camera/video/Recorder$Builder;->mAudioEncoderFactory:Landroidx/camera/video/internal/encoder/EncoderFactory;

    .line 3206
    invoke-static {}, Landroidx/camera/video/MediaSpec;->builder()Landroidx/camera/video/MediaSpec$Builder;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/Recorder$Builder;->mMediaSpecBuilder:Landroidx/camera/video/MediaSpec$Builder;

    .line 3207
    return-void
.end method

.method static synthetic lambda$setAspectRatio$2(ILandroidx/camera/video/VideoSpec$Builder;)V
    .locals 0
    .param p0, "aspectRatio"    # I
    .param p1, "builder"    # Landroidx/camera/video/VideoSpec$Builder;

    .line 3312
    invoke-virtual {p1, p0}, Landroidx/camera/video/VideoSpec$Builder;->setAspectRatio(I)Landroidx/camera/video/VideoSpec$Builder;

    return-void
.end method

.method static synthetic lambda$setAudioSource$3(ILandroidx/camera/video/AudioSpec$Builder;)V
    .locals 0
    .param p0, "source"    # I
    .param p1, "builder"    # Landroidx/camera/video/AudioSpec$Builder;

    .line 3329
    invoke-virtual {p1, p0}, Landroidx/camera/video/AudioSpec$Builder;->setSource(I)Landroidx/camera/video/AudioSpec$Builder;

    return-void
.end method

.method static synthetic lambda$setQualitySelector$0(Landroidx/camera/video/QualitySelector;Landroidx/camera/video/VideoSpec$Builder;)V
    .locals 0
    .param p0, "qualitySelector"    # Landroidx/camera/video/QualitySelector;
    .param p1, "builder"    # Landroidx/camera/video/VideoSpec$Builder;

    .line 3249
    invoke-virtual {p1, p0}, Landroidx/camera/video/VideoSpec$Builder;->setQualitySelector(Landroidx/camera/video/QualitySelector;)Landroidx/camera/video/VideoSpec$Builder;

    return-void
.end method

.method static synthetic lambda$setTargetVideoEncodingBitRate$1(ILandroidx/camera/video/VideoSpec$Builder;)V
    .locals 3
    .param p0, "bitrate"    # I
    .param p1, "builder"    # Landroidx/camera/video/VideoSpec$Builder;

    .line 3283
    new-instance v0, Landroid/util/Range;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    invoke-virtual {p1, v0}, Landroidx/camera/video/VideoSpec$Builder;->setBitrate(Landroid/util/Range;)Landroidx/camera/video/VideoSpec$Builder;

    return-void
.end method


# virtual methods
.method public build()Landroidx/camera/video/Recorder;
    .locals 5

    .line 3356
    new-instance v0, Landroidx/camera/video/Recorder;

    iget-object v1, p0, Landroidx/camera/video/Recorder$Builder;->mExecutor:Ljava/util/concurrent/Executor;

    iget-object v2, p0, Landroidx/camera/video/Recorder$Builder;->mMediaSpecBuilder:Landroidx/camera/video/MediaSpec$Builder;

    invoke-virtual {v2}, Landroidx/camera/video/MediaSpec$Builder;->build()Landroidx/camera/video/MediaSpec;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/video/Recorder$Builder;->mVideoEncoderFactory:Landroidx/camera/video/internal/encoder/EncoderFactory;

    iget-object v4, p0, Landroidx/camera/video/Recorder$Builder;->mAudioEncoderFactory:Landroidx/camera/video/internal/encoder/EncoderFactory;

    invoke-direct {v0, v1, v2, v3, v4}, Landroidx/camera/video/Recorder;-><init>(Ljava/util/concurrent/Executor;Landroidx/camera/video/MediaSpec;Landroidx/camera/video/internal/encoder/EncoderFactory;Landroidx/camera/video/internal/encoder/EncoderFactory;)V

    return-object v0
.end method

.method public setAspectRatio(I)Landroidx/camera/video/Recorder$Builder;
    .locals 2
    .param p1, "aspectRatio"    # I

    .line 3312
    iget-object v0, p0, Landroidx/camera/video/Recorder$Builder;->mMediaSpecBuilder:Landroidx/camera/video/MediaSpec$Builder;

    new-instance v1, Landroidx/camera/video/Recorder$Builder$$ExternalSyntheticLambda2;

    invoke-direct {v1, p1}, Landroidx/camera/video/Recorder$Builder$$ExternalSyntheticLambda2;-><init>(I)V

    invoke-virtual {v0, v1}, Landroidx/camera/video/MediaSpec$Builder;->configureVideo(Landroidx/core/util/Consumer;)Landroidx/camera/video/MediaSpec$Builder;

    .line 3313
    return-object p0
.end method

.method setAudioEncoderFactory(Landroidx/camera/video/internal/encoder/EncoderFactory;)Landroidx/camera/video/Recorder$Builder;
    .locals 0
    .param p1, "audioEncoderFactory"    # Landroidx/camera/video/internal/encoder/EncoderFactory;

    .line 3343
    iput-object p1, p0, Landroidx/camera/video/Recorder$Builder;->mAudioEncoderFactory:Landroidx/camera/video/internal/encoder/EncoderFactory;

    .line 3344
    return-object p0
.end method

.method setAudioSource(I)Landroidx/camera/video/Recorder$Builder;
    .locals 2
    .param p1, "source"    # I

    .line 3329
    iget-object v0, p0, Landroidx/camera/video/Recorder$Builder;->mMediaSpecBuilder:Landroidx/camera/video/MediaSpec$Builder;

    new-instance v1, Landroidx/camera/video/Recorder$Builder$$ExternalSyntheticLambda1;

    invoke-direct {v1, p1}, Landroidx/camera/video/Recorder$Builder$$ExternalSyntheticLambda1;-><init>(I)V

    invoke-virtual {v0, v1}, Landroidx/camera/video/MediaSpec$Builder;->configureAudio(Landroidx/core/util/Consumer;)Landroidx/camera/video/MediaSpec$Builder;

    .line 3330
    return-object p0
.end method

.method public setExecutor(Ljava/util/concurrent/Executor;)Landroidx/camera/video/Recorder$Builder;
    .locals 1
    .param p1, "executor"    # Ljava/util/concurrent/Executor;

    .line 3221
    const-string/jumbo v0, "The specified executor can\'t be null."

    invoke-static {p1, v0}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3222
    iput-object p1, p0, Landroidx/camera/video/Recorder$Builder;->mExecutor:Ljava/util/concurrent/Executor;

    .line 3223
    return-object p0
.end method

.method public setQualitySelector(Landroidx/camera/video/QualitySelector;)Landroidx/camera/video/Recorder$Builder;
    .locals 2
    .param p1, "qualitySelector"    # Landroidx/camera/video/QualitySelector;

    .line 3246
    const-string/jumbo v0, "The specified quality selector can\'t be null."

    invoke-static {p1, v0}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3248
    iget-object v0, p0, Landroidx/camera/video/Recorder$Builder;->mMediaSpecBuilder:Landroidx/camera/video/MediaSpec$Builder;

    new-instance v1, Landroidx/camera/video/Recorder$Builder$$ExternalSyntheticLambda3;

    invoke-direct {v1, p1}, Landroidx/camera/video/Recorder$Builder$$ExternalSyntheticLambda3;-><init>(Landroidx/camera/video/QualitySelector;)V

    invoke-virtual {v0, v1}, Landroidx/camera/video/MediaSpec$Builder;->configureVideo(Landroidx/core/util/Consumer;)Landroidx/camera/video/MediaSpec$Builder;

    .line 3250
    return-object p0
.end method

.method public setTargetVideoEncodingBitRate(I)Landroidx/camera/video/Recorder$Builder;
    .locals 3
    .param p1, "bitrate"    # I

    .line 3277
    if-lez p1, :cond_0

    .line 3282
    iget-object v0, p0, Landroidx/camera/video/Recorder$Builder;->mMediaSpecBuilder:Landroidx/camera/video/MediaSpec$Builder;

    new-instance v1, Landroidx/camera/video/Recorder$Builder$$ExternalSyntheticLambda0;

    invoke-direct {v1, p1}, Landroidx/camera/video/Recorder$Builder$$ExternalSyntheticLambda0;-><init>(I)V

    invoke-virtual {v0, v1}, Landroidx/camera/video/MediaSpec$Builder;->configureVideo(Landroidx/core/util/Consumer;)Landroidx/camera/video/MediaSpec$Builder;

    .line 3284
    return-object p0

    .line 3278
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "The requested target bitrate "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not supported. Target bitrate must be greater than 0."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method setVideoEncoderFactory(Landroidx/camera/video/internal/encoder/EncoderFactory;)Landroidx/camera/video/Recorder$Builder;
    .locals 0
    .param p1, "videoEncoderFactory"    # Landroidx/camera/video/internal/encoder/EncoderFactory;

    .line 3336
    iput-object p1, p0, Landroidx/camera/video/Recorder$Builder;->mVideoEncoderFactory:Landroidx/camera/video/internal/encoder/EncoderFactory;

    .line 3337
    return-object p0
.end method
