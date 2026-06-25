.class final Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;
.super Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;
.source "AutoValue_EncoderProfilesProxy_AudioProfileProxy.java"


# instance fields
.field private final bitrate:I

.field private final channels:I

.field private final codec:I

.field private final mediaType:Ljava/lang/String;

.field private final profile:I

.field private final sampleRate:I


# direct methods
.method constructor <init>(ILjava/lang/String;IIII)V
    .locals 2
    .param p1, "codec"    # I
    .param p2, "mediaType"    # Ljava/lang/String;
    .param p3, "bitrate"    # I
    .param p4, "sampleRate"    # I
    .param p5, "channels"    # I
    .param p6, "profile"    # I

    .line 28
    invoke-direct {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;-><init>()V

    .line 29
    iput p1, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;->codec:I

    .line 30
    if-eqz p2, :cond_0

    .line 33
    iput-object p2, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;->mediaType:Ljava/lang/String;

    .line 34
    iput p3, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;->bitrate:I

    .line 35
    iput p4, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;->sampleRate:I

    .line 36
    iput p5, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;->channels:I

    .line 37
    iput p6, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;->profile:I

    .line 38
    return-void

    .line 31
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null mediaType"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 86
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 87
    return v0

    .line 89
    :cond_0
    instance-of v1, p1, Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 90
    move-object v1, p1

    check-cast v1, Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

    .line 91
    .local v1, "that":Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;
    iget v3, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;->codec:I

    invoke-virtual {v1}, Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;->getCodec()I

    move-result v4

    if-ne v3, v4, :cond_1

    iget-object v3, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;->mediaType:Ljava/lang/String;

    .line 92
    invoke-virtual {v1}, Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;->getMediaType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget v3, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;->bitrate:I

    .line 93
    invoke-virtual {v1}, Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;->getBitrate()I

    move-result v4

    if-ne v3, v4, :cond_1

    iget v3, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;->sampleRate:I

    .line 94
    invoke-virtual {v1}, Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;->getSampleRate()I

    move-result v4

    if-ne v3, v4, :cond_1

    iget v3, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;->channels:I

    .line 95
    invoke-virtual {v1}, Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;->getChannels()I

    move-result v4

    if-ne v3, v4, :cond_1

    iget v3, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;->profile:I

    .line 96
    invoke-virtual {v1}, Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;->getProfile()I

    move-result v4

    if-ne v3, v4, :cond_1

    goto :goto_0

    :cond_1
    move v0, v2

    .line 91
    :goto_0
    return v0

    .line 98
    .end local v1    # "that":Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;
    :cond_2
    return v2
.end method

.method public getBitrate()I
    .locals 1

    .line 54
    iget v0, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;->bitrate:I

    return v0
.end method

.method public getChannels()I
    .locals 1

    .line 64
    iget v0, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;->channels:I

    return v0
.end method

.method public getCodec()I
    .locals 1

    .line 43
    iget v0, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;->codec:I

    return v0
.end method

.method public getMediaType()Ljava/lang/String;
    .locals 1

    .line 49
    iget-object v0, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;->mediaType:Ljava/lang/String;

    return-object v0
.end method

.method public getProfile()I
    .locals 1

    .line 69
    iget v0, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;->profile:I

    return v0
.end method

.method public getSampleRate()I
    .locals 1

    .line 59
    iget v0, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;->sampleRate:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 103
    const/4 v0, 0x1

    .line 104
    .local v0, "h$":I
    const v1, 0xf4243

    mul-int/2addr v0, v1

    .line 105
    iget v2, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;->codec:I

    xor-int/2addr v0, v2

    .line 106
    mul-int/2addr v0, v1

    .line 107
    iget-object v2, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;->mediaType:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 108
    mul-int/2addr v0, v1

    .line 109
    iget v2, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;->bitrate:I

    xor-int/2addr v0, v2

    .line 110
    mul-int/2addr v0, v1

    .line 111
    iget v2, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;->sampleRate:I

    xor-int/2addr v0, v2

    .line 112
    mul-int/2addr v0, v1

    .line 113
    iget v2, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;->channels:I

    xor-int/2addr v0, v2

    .line 114
    mul-int/2addr v0, v1

    .line 115
    iget v1, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;->profile:I

    xor-int/2addr v0, v1

    .line 116
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 74
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "AudioProfileProxy{codec="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;->codec:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mediaType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;->mediaType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", bitrate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;->bitrate:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", sampleRate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;->sampleRate:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", channels="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;->channels:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", profile="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_AudioProfileProxy;->profile:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
