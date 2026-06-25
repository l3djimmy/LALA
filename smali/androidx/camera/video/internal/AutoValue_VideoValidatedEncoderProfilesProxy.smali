.class final Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;
.super Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;
.source "AutoValue_VideoValidatedEncoderProfilesProxy.java"


# instance fields
.field private final audioProfiles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;",
            ">;"
        }
    .end annotation
.end field

.field private final defaultAudioProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

.field private final defaultDurationSeconds:I

.field private final defaultVideoProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

.field private final recommendedFileFormat:I

.field private final videoProfiles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(IILjava/util/List;Ljava/util/List;Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;)V
    .locals 2
    .param p1, "defaultDurationSeconds"    # I
    .param p2, "recommendedFileFormat"    # I
    .param p5, "defaultAudioProfile"    # Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;
    .param p6, "defaultVideoProfile"    # Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;",
            ">;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;",
            ">;",
            "Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;",
            "Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;",
            ")V"
        }
    .end annotation

    .line 31
    .local p3, "audioProfiles":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;>;"
    .local p4, "videoProfiles":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;>;"
    invoke-direct {p0}, Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;-><init>()V

    .line 32
    iput p1, p0, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;->defaultDurationSeconds:I

    .line 33
    iput p2, p0, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;->recommendedFileFormat:I

    .line 34
    if-eqz p3, :cond_2

    .line 37
    iput-object p3, p0, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;->audioProfiles:Ljava/util/List;

    .line 38
    if-eqz p4, :cond_1

    .line 41
    iput-object p4, p0, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;->videoProfiles:Ljava/util/List;

    .line 42
    iput-object p5, p0, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;->defaultAudioProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

    .line 43
    if-eqz p6, :cond_0

    .line 46
    iput-object p6, p0, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;->defaultVideoProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    .line 47
    return-void

    .line 44
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null defaultVideoProfile"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 39
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null videoProfiles"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 35
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null audioProfiles"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 97
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 98
    return v0

    .line 100
    :cond_0
    instance-of v1, p1, Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    .line 101
    move-object v1, p1

    check-cast v1, Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    .line 102
    .local v1, "that":Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;
    iget v3, p0, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;->defaultDurationSeconds:I

    invoke-virtual {v1}, Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;->getDefaultDurationSeconds()I

    move-result v4

    if-ne v3, v4, :cond_2

    iget v3, p0, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;->recommendedFileFormat:I

    .line 103
    invoke-virtual {v1}, Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;->getRecommendedFileFormat()I

    move-result v4

    if-ne v3, v4, :cond_2

    iget-object v3, p0, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;->audioProfiles:Ljava/util/List;

    .line 104
    invoke-virtual {v1}, Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;->getAudioProfiles()Ljava/util/List;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;->videoProfiles:Ljava/util/List;

    .line 105
    invoke-virtual {v1}, Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;->getVideoProfiles()Ljava/util/List;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;->defaultAudioProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

    if-nez v3, :cond_1

    .line 106
    invoke-virtual {v1}, Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;->getDefaultAudioProfile()Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

    move-result-object v3

    if-nez v3, :cond_2

    goto :goto_0

    :cond_1
    iget-object v3, p0, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;->defaultAudioProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

    invoke-virtual {v1}, Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;->getDefaultAudioProfile()Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    :goto_0
    iget-object v3, p0, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;->defaultVideoProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    .line 107
    invoke-virtual {v1}, Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;->getDefaultVideoProfile()Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_1

    :cond_2
    move v0, v2

    .line 102
    :goto_1
    return v0

    .line 109
    .end local v1    # "that":Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;
    :cond_3
    return v2
.end method

.method public getAudioProfiles()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;",
            ">;"
        }
    .end annotation

    .line 62
    iget-object v0, p0, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;->audioProfiles:Ljava/util/List;

    return-object v0
.end method

.method public getDefaultAudioProfile()Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;
    .locals 1

    .line 74
    iget-object v0, p0, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;->defaultAudioProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

    return-object v0
.end method

.method public getDefaultDurationSeconds()I
    .locals 1

    .line 51
    iget v0, p0, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;->defaultDurationSeconds:I

    return v0
.end method

.method public getDefaultVideoProfile()Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    .locals 1

    .line 80
    iget-object v0, p0, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;->defaultVideoProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    return-object v0
.end method

.method public getRecommendedFileFormat()I
    .locals 1

    .line 56
    iget v0, p0, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;->recommendedFileFormat:I

    return v0
.end method

.method public getVideoProfiles()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;",
            ">;"
        }
    .end annotation

    .line 68
    iget-object v0, p0, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;->videoProfiles:Ljava/util/List;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 114
    const/4 v0, 0x1

    .line 115
    .local v0, "h$":I
    const v1, 0xf4243

    mul-int/2addr v0, v1

    .line 116
    iget v2, p0, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;->defaultDurationSeconds:I

    xor-int/2addr v0, v2

    .line 117
    mul-int/2addr v0, v1

    .line 118
    iget v2, p0, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;->recommendedFileFormat:I

    xor-int/2addr v0, v2

    .line 119
    mul-int/2addr v0, v1

    .line 120
    iget-object v2, p0, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;->audioProfiles:Ljava/util/List;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 121
    mul-int/2addr v0, v1

    .line 122
    iget-object v2, p0, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;->videoProfiles:Ljava/util/List;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 123
    mul-int/2addr v0, v1

    .line 124
    iget-object v2, p0, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;->defaultAudioProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

    if-nez v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    iget-object v2, p0, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;->defaultAudioProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_0
    xor-int/2addr v0, v2

    .line 125
    mul-int/2addr v0, v1

    .line 126
    iget-object v1, p0, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;->defaultVideoProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    .line 127
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 85
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "VideoValidatedEncoderProfilesProxy{defaultDurationSeconds="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;->defaultDurationSeconds:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", recommendedFileFormat="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;->recommendedFileFormat:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", audioProfiles="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;->audioProfiles:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", videoProfiles="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;->videoProfiles:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", defaultAudioProfile="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;->defaultAudioProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", defaultVideoProfile="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/video/internal/AutoValue_VideoValidatedEncoderProfilesProxy;->defaultVideoProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
