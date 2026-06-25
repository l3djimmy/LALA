.class final Landroidx/camera/video/internal/config/AutoValue_AudioMimeInfo$Builder;
.super Landroidx/camera/video/internal/config/AudioMimeInfo$Builder;
.source "AutoValue_AudioMimeInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/video/internal/config/AutoValue_AudioMimeInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Builder"
.end annotation


# instance fields
.field private compatibleAudioProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

.field private mimeType:Ljava/lang/String;

.field private profile:Ljava/lang/Integer;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 83
    invoke-direct {p0}, Landroidx/camera/video/internal/config/AudioMimeInfo$Builder;-><init>()V

    .line 84
    return-void
.end method


# virtual methods
.method public build()Landroidx/camera/video/internal/config/AudioMimeInfo;
    .locals 6

    .line 105
    const-string v0, ""

    .line 106
    .local v0, "missing":Ljava/lang/String;
    iget-object v1, p0, Landroidx/camera/video/internal/config/AutoValue_AudioMimeInfo$Builder;->mimeType:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 107
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " mimeType"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 109
    :cond_0
    iget-object v1, p0, Landroidx/camera/video/internal/config/AutoValue_AudioMimeInfo$Builder;->profile:Ljava/lang/Integer;

    if-nez v1, :cond_1

    .line 110
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " profile"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 112
    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 115
    new-instance v1, Landroidx/camera/video/internal/config/AutoValue_AudioMimeInfo;

    iget-object v2, p0, Landroidx/camera/video/internal/config/AutoValue_AudioMimeInfo$Builder;->mimeType:Ljava/lang/String;

    iget-object v3, p0, Landroidx/camera/video/internal/config/AutoValue_AudioMimeInfo$Builder;->profile:Ljava/lang/Integer;

    .line 117
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget-object v4, p0, Landroidx/camera/video/internal/config/AutoValue_AudioMimeInfo$Builder;->compatibleAudioProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

    const/4 v5, 0x0

    invoke-direct {v1, v2, v3, v4, v5}, Landroidx/camera/video/internal/config/AutoValue_AudioMimeInfo;-><init>(Ljava/lang/String;ILandroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;Landroidx/camera/video/internal/config/AutoValue_AudioMimeInfo$1;)V

    .line 115
    return-object v1

    .line 113
    :cond_2
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Missing required properties:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public bridge synthetic build()Landroidx/camera/video/internal/config/MimeInfo;
    .locals 1

    .line 79
    invoke-virtual {p0}, Landroidx/camera/video/internal/config/AutoValue_AudioMimeInfo$Builder;->build()Landroidx/camera/video/internal/config/AudioMimeInfo;

    move-result-object v0

    return-object v0
.end method

.method public setCompatibleAudioProfile(Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;)Landroidx/camera/video/internal/config/AudioMimeInfo$Builder;
    .locals 0
    .param p1, "compatibleAudioProfile"    # Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

    .line 100
    iput-object p1, p0, Landroidx/camera/video/internal/config/AutoValue_AudioMimeInfo$Builder;->compatibleAudioProfile:Landroidx/camera/core/impl/EncoderProfilesProxy$AudioProfileProxy;

    .line 101
    return-object p0
.end method

.method protected setMimeType(Ljava/lang/String;)Landroidx/camera/video/internal/config/AudioMimeInfo$Builder;
    .locals 2
    .param p1, "mimeType"    # Ljava/lang/String;

    .line 87
    if-eqz p1, :cond_0

    .line 90
    iput-object p1, p0, Landroidx/camera/video/internal/config/AutoValue_AudioMimeInfo$Builder;->mimeType:Ljava/lang/String;

    .line 91
    return-object p0

    .line 88
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null mimeType"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected bridge synthetic setMimeType(Ljava/lang/String;)Ljava/lang/Object;
    .locals 0

    .line 79
    invoke-virtual {p0, p1}, Landroidx/camera/video/internal/config/AutoValue_AudioMimeInfo$Builder;->setMimeType(Ljava/lang/String;)Landroidx/camera/video/internal/config/AudioMimeInfo$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setProfile(I)Landroidx/camera/video/internal/config/AudioMimeInfo$Builder;
    .locals 1
    .param p1, "profile"    # I

    .line 95
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/internal/config/AutoValue_AudioMimeInfo$Builder;->profile:Ljava/lang/Integer;

    .line 96
    return-object p0
.end method

.method public bridge synthetic setProfile(I)Ljava/lang/Object;
    .locals 0

    .line 79
    invoke-virtual {p0, p1}, Landroidx/camera/video/internal/config/AutoValue_AudioMimeInfo$Builder;->setProfile(I)Landroidx/camera/video/internal/config/AudioMimeInfo$Builder;

    move-result-object p1

    return-object p1
.end method
