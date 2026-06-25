.class final Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;
.super Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
.source "AutoValue_EncoderProfilesProxy_VideoProfileProxy.java"


# instance fields
.field private final bitDepth:I

.field private final bitrate:I

.field private final chromaSubsampling:I

.field private final codec:I

.field private final frameRate:I

.field private final hdrFormat:I

.field private final height:I

.field private final mediaType:Ljava/lang/String;

.field private final profile:I

.field private final width:I


# direct methods
.method constructor <init>(ILjava/lang/String;IIIIIIII)V
    .locals 2
    .param p1, "codec"    # I
    .param p2, "mediaType"    # Ljava/lang/String;
    .param p3, "bitrate"    # I
    .param p4, "frameRate"    # I
    .param p5, "width"    # I
    .param p6, "height"    # I
    .param p7, "profile"    # I
    .param p8, "bitDepth"    # I
    .param p9, "chromaSubsampling"    # I
    .param p10, "hdrFormat"    # I

    .line 40
    invoke-direct {p0}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;-><init>()V

    .line 41
    iput p1, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->codec:I

    .line 42
    if-eqz p2, :cond_0

    .line 45
    iput-object p2, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->mediaType:Ljava/lang/String;

    .line 46
    iput p3, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->bitrate:I

    .line 47
    iput p4, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->frameRate:I

    .line 48
    iput p5, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->width:I

    .line 49
    iput p6, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->height:I

    .line 50
    iput p7, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->profile:I

    .line 51
    iput p8, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->bitDepth:I

    .line 52
    iput p9, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->chromaSubsampling:I

    .line 53
    iput p10, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->hdrFormat:I

    .line 54
    return-void

    .line 43
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

    .line 126
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 127
    return v0

    .line 129
    :cond_0
    instance-of v1, p1, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 130
    move-object v1, p1

    check-cast v1, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    .line 131
    .local v1, "that":Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    iget v3, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->codec:I

    invoke-virtual {v1}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getCodec()I

    move-result v4

    if-ne v3, v4, :cond_1

    iget-object v3, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->mediaType:Ljava/lang/String;

    .line 132
    invoke-virtual {v1}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getMediaType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget v3, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->bitrate:I

    .line 133
    invoke-virtual {v1}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getBitrate()I

    move-result v4

    if-ne v3, v4, :cond_1

    iget v3, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->frameRate:I

    .line 134
    invoke-virtual {v1}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getFrameRate()I

    move-result v4

    if-ne v3, v4, :cond_1

    iget v3, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->width:I

    .line 135
    invoke-virtual {v1}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getWidth()I

    move-result v4

    if-ne v3, v4, :cond_1

    iget v3, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->height:I

    .line 136
    invoke-virtual {v1}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getHeight()I

    move-result v4

    if-ne v3, v4, :cond_1

    iget v3, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->profile:I

    .line 137
    invoke-virtual {v1}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getProfile()I

    move-result v4

    if-ne v3, v4, :cond_1

    iget v3, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->bitDepth:I

    .line 138
    invoke-virtual {v1}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getBitDepth()I

    move-result v4

    if-ne v3, v4, :cond_1

    iget v3, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->chromaSubsampling:I

    .line 139
    invoke-virtual {v1}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getChromaSubsampling()I

    move-result v4

    if-ne v3, v4, :cond_1

    iget v3, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->hdrFormat:I

    .line 140
    invoke-virtual {v1}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getHdrFormat()I

    move-result v4

    if-ne v3, v4, :cond_1

    goto :goto_0

    :cond_1
    move v0, v2

    .line 131
    :goto_0
    return v0

    .line 142
    .end local v1    # "that":Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    :cond_2
    return v2
.end method

.method public getBitDepth()I
    .locals 1

    .line 95
    iget v0, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->bitDepth:I

    return v0
.end method

.method public getBitrate()I
    .locals 1

    .line 70
    iget v0, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->bitrate:I

    return v0
.end method

.method public getChromaSubsampling()I
    .locals 1

    .line 100
    iget v0, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->chromaSubsampling:I

    return v0
.end method

.method public getCodec()I
    .locals 1

    .line 59
    iget v0, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->codec:I

    return v0
.end method

.method public getFrameRate()I
    .locals 1

    .line 75
    iget v0, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->frameRate:I

    return v0
.end method

.method public getHdrFormat()I
    .locals 1

    .line 105
    iget v0, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->hdrFormat:I

    return v0
.end method

.method public getHeight()I
    .locals 1

    .line 85
    iget v0, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->height:I

    return v0
.end method

.method public getMediaType()Ljava/lang/String;
    .locals 1

    .line 65
    iget-object v0, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->mediaType:Ljava/lang/String;

    return-object v0
.end method

.method public getProfile()I
    .locals 1

    .line 90
    iget v0, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->profile:I

    return v0
.end method

.method public getWidth()I
    .locals 1

    .line 80
    iget v0, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->width:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 147
    const/4 v0, 0x1

    .line 148
    .local v0, "h$":I
    const v1, 0xf4243

    mul-int/2addr v0, v1

    .line 149
    iget v2, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->codec:I

    xor-int/2addr v0, v2

    .line 150
    mul-int/2addr v0, v1

    .line 151
    iget-object v2, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->mediaType:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 152
    mul-int/2addr v0, v1

    .line 153
    iget v2, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->bitrate:I

    xor-int/2addr v0, v2

    .line 154
    mul-int/2addr v0, v1

    .line 155
    iget v2, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->frameRate:I

    xor-int/2addr v0, v2

    .line 156
    mul-int/2addr v0, v1

    .line 157
    iget v2, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->width:I

    xor-int/2addr v0, v2

    .line 158
    mul-int/2addr v0, v1

    .line 159
    iget v2, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->height:I

    xor-int/2addr v0, v2

    .line 160
    mul-int/2addr v0, v1

    .line 161
    iget v2, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->profile:I

    xor-int/2addr v0, v2

    .line 162
    mul-int/2addr v0, v1

    .line 163
    iget v2, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->bitDepth:I

    xor-int/2addr v0, v2

    .line 164
    mul-int/2addr v0, v1

    .line 165
    iget v2, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->chromaSubsampling:I

    xor-int/2addr v0, v2

    .line 166
    mul-int/2addr v0, v1

    .line 167
    iget v1, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->hdrFormat:I

    xor-int/2addr v0, v1

    .line 168
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 110
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "VideoProfileProxy{codec="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->codec:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mediaType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->mediaType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", bitrate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->bitrate:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", frameRate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->frameRate:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", width="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->width:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", height="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->height:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", profile="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->profile:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", bitDepth="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->bitDepth:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", chromaSubsampling="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->chromaSubsampling:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", hdrFormat="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/core/impl/AutoValue_EncoderProfilesProxy_VideoProfileProxy;->hdrFormat:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
