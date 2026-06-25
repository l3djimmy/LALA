.class final Landroidx/camera/video/AutoValue_MediaSpec;
.super Landroidx/camera/video/MediaSpec;
.source "AutoValue_MediaSpec.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/video/AutoValue_MediaSpec$Builder;
    }
.end annotation


# instance fields
.field private final audioSpec:Landroidx/camera/video/AudioSpec;

.field private final outputFormat:I

.field private final videoSpec:Landroidx/camera/video/VideoSpec;


# direct methods
.method private constructor <init>(Landroidx/camera/video/VideoSpec;Landroidx/camera/video/AudioSpec;I)V
    .locals 0
    .param p1, "videoSpec"    # Landroidx/camera/video/VideoSpec;
    .param p2, "audioSpec"    # Landroidx/camera/video/AudioSpec;
    .param p3, "outputFormat"    # I

    .line 19
    invoke-direct {p0}, Landroidx/camera/video/MediaSpec;-><init>()V

    .line 20
    iput-object p1, p0, Landroidx/camera/video/AutoValue_MediaSpec;->videoSpec:Landroidx/camera/video/VideoSpec;

    .line 21
    iput-object p2, p0, Landroidx/camera/video/AutoValue_MediaSpec;->audioSpec:Landroidx/camera/video/AudioSpec;

    .line 22
    iput p3, p0, Landroidx/camera/video/AutoValue_MediaSpec;->outputFormat:I

    .line 23
    return-void
.end method

.method synthetic constructor <init>(Landroidx/camera/video/VideoSpec;Landroidx/camera/video/AudioSpec;ILandroidx/camera/video/AutoValue_MediaSpec$1;)V
    .locals 0
    .param p1, "x0"    # Landroidx/camera/video/VideoSpec;
    .param p2, "x1"    # Landroidx/camera/video/AudioSpec;
    .param p3, "x2"    # I
    .param p4, "x3"    # Landroidx/camera/video/AutoValue_MediaSpec$1;

    .line 8
    invoke-direct {p0, p1, p2, p3}, Landroidx/camera/video/AutoValue_MediaSpec;-><init>(Landroidx/camera/video/VideoSpec;Landroidx/camera/video/AudioSpec;I)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 54
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 55
    return v0

    .line 57
    :cond_0
    instance-of v1, p1, Landroidx/camera/video/MediaSpec;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 58
    move-object v1, p1

    check-cast v1, Landroidx/camera/video/MediaSpec;

    .line 59
    .local v1, "that":Landroidx/camera/video/MediaSpec;
    iget-object v3, p0, Landroidx/camera/video/AutoValue_MediaSpec;->videoSpec:Landroidx/camera/video/VideoSpec;

    invoke-virtual {v1}, Landroidx/camera/video/MediaSpec;->getVideoSpec()Landroidx/camera/video/VideoSpec;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, p0, Landroidx/camera/video/AutoValue_MediaSpec;->audioSpec:Landroidx/camera/video/AudioSpec;

    .line 60
    invoke-virtual {v1}, Landroidx/camera/video/MediaSpec;->getAudioSpec()Landroidx/camera/video/AudioSpec;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget v3, p0, Landroidx/camera/video/AutoValue_MediaSpec;->outputFormat:I

    .line 61
    invoke-virtual {v1}, Landroidx/camera/video/MediaSpec;->getOutputFormat()I

    move-result v4

    if-ne v3, v4, :cond_1

    goto :goto_0

    :cond_1
    move v0, v2

    .line 59
    :goto_0
    return v0

    .line 63
    .end local v1    # "that":Landroidx/camera/video/MediaSpec;
    :cond_2
    return v2
.end method

.method public getAudioSpec()Landroidx/camera/video/AudioSpec;
    .locals 1

    .line 34
    iget-object v0, p0, Landroidx/camera/video/AutoValue_MediaSpec;->audioSpec:Landroidx/camera/video/AudioSpec;

    return-object v0
.end method

.method public getOutputFormat()I
    .locals 1

    .line 40
    iget v0, p0, Landroidx/camera/video/AutoValue_MediaSpec;->outputFormat:I

    return v0
.end method

.method public getVideoSpec()Landroidx/camera/video/VideoSpec;
    .locals 1

    .line 28
    iget-object v0, p0, Landroidx/camera/video/AutoValue_MediaSpec;->videoSpec:Landroidx/camera/video/VideoSpec;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 68
    const/4 v0, 0x1

    .line 69
    .local v0, "h$":I
    const v1, 0xf4243

    mul-int/2addr v0, v1

    .line 70
    iget-object v2, p0, Landroidx/camera/video/AutoValue_MediaSpec;->videoSpec:Landroidx/camera/video/VideoSpec;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 71
    mul-int/2addr v0, v1

    .line 72
    iget-object v2, p0, Landroidx/camera/video/AutoValue_MediaSpec;->audioSpec:Landroidx/camera/video/AudioSpec;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 73
    mul-int/2addr v0, v1

    .line 74
    iget v1, p0, Landroidx/camera/video/AutoValue_MediaSpec;->outputFormat:I

    xor-int/2addr v0, v1

    .line 75
    return v0
.end method

.method public toBuilder()Landroidx/camera/video/MediaSpec$Builder;
    .locals 2

    .line 80
    new-instance v0, Landroidx/camera/video/AutoValue_MediaSpec$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroidx/camera/video/AutoValue_MediaSpec$Builder;-><init>(Landroidx/camera/video/MediaSpec;Landroidx/camera/video/AutoValue_MediaSpec$1;)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 45
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "MediaSpec{videoSpec="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/video/AutoValue_MediaSpec;->videoSpec:Landroidx/camera/video/VideoSpec;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", audioSpec="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/video/AutoValue_MediaSpec;->audioSpec:Landroidx/camera/video/AudioSpec;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", outputFormat="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/video/AutoValue_MediaSpec;->outputFormat:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
