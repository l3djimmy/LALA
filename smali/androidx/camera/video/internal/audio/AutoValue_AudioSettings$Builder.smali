.class final Landroidx/camera/video/internal/audio/AutoValue_AudioSettings$Builder;
.super Landroidx/camera/video/internal/audio/AudioSettings$Builder;
.source "AutoValue_AudioSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/video/internal/audio/AutoValue_AudioSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Builder"
.end annotation


# instance fields
.field private audioFormat:Ljava/lang/Integer;

.field private audioSource:Ljava/lang/Integer;

.field private channelCount:Ljava/lang/Integer;

.field private sampleRate:Ljava/lang/Integer;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 100
    invoke-direct {p0}, Landroidx/camera/video/internal/audio/AudioSettings$Builder;-><init>()V

    .line 101
    return-void
.end method

.method private constructor <init>(Landroidx/camera/video/internal/audio/AudioSettings;)V
    .locals 1
    .param p1, "source"    # Landroidx/camera/video/internal/audio/AudioSettings;

    .line 102
    invoke-direct {p0}, Landroidx/camera/video/internal/audio/AudioSettings$Builder;-><init>()V

    .line 103
    invoke-virtual {p1}, Landroidx/camera/video/internal/audio/AudioSettings;->getAudioSource()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/internal/audio/AutoValue_AudioSettings$Builder;->audioSource:Ljava/lang/Integer;

    .line 104
    invoke-virtual {p1}, Landroidx/camera/video/internal/audio/AudioSettings;->getSampleRate()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/internal/audio/AutoValue_AudioSettings$Builder;->sampleRate:Ljava/lang/Integer;

    .line 105
    invoke-virtual {p1}, Landroidx/camera/video/internal/audio/AudioSettings;->getChannelCount()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/internal/audio/AutoValue_AudioSettings$Builder;->channelCount:Ljava/lang/Integer;

    .line 106
    invoke-virtual {p1}, Landroidx/camera/video/internal/audio/AudioSettings;->getAudioFormat()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/internal/audio/AutoValue_AudioSettings$Builder;->audioFormat:Ljava/lang/Integer;

    .line 107
    return-void
.end method

.method synthetic constructor <init>(Landroidx/camera/video/internal/audio/AudioSettings;Landroidx/camera/video/internal/audio/AutoValue_AudioSettings$1;)V
    .locals 0
    .param p1, "x0"    # Landroidx/camera/video/internal/audio/AudioSettings;
    .param p2, "x1"    # Landroidx/camera/video/internal/audio/AutoValue_AudioSettings$1;

    .line 95
    invoke-direct {p0, p1}, Landroidx/camera/video/internal/audio/AutoValue_AudioSettings$Builder;-><init>(Landroidx/camera/video/internal/audio/AudioSettings;)V

    return-void
.end method


# virtual methods
.method autoBuild()Landroidx/camera/video/internal/audio/AudioSettings;
    .locals 8

    .line 130
    const-string v0, ""

    .line 131
    .local v0, "missing":Ljava/lang/String;
    iget-object v1, p0, Landroidx/camera/video/internal/audio/AutoValue_AudioSettings$Builder;->audioSource:Ljava/lang/Integer;

    if-nez v1, :cond_0

    .line 132
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " audioSource"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 134
    :cond_0
    iget-object v1, p0, Landroidx/camera/video/internal/audio/AutoValue_AudioSettings$Builder;->sampleRate:Ljava/lang/Integer;

    if-nez v1, :cond_1

    .line 135
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " sampleRate"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 137
    :cond_1
    iget-object v1, p0, Landroidx/camera/video/internal/audio/AutoValue_AudioSettings$Builder;->channelCount:Ljava/lang/Integer;

    if-nez v1, :cond_2

    .line 138
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " channelCount"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 140
    :cond_2
    iget-object v1, p0, Landroidx/camera/video/internal/audio/AutoValue_AudioSettings$Builder;->audioFormat:Ljava/lang/Integer;

    if-nez v1, :cond_3

    .line 141
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " audioFormat"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 143
    :cond_3
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 146
    new-instance v2, Landroidx/camera/video/internal/audio/AutoValue_AudioSettings;

    iget-object v1, p0, Landroidx/camera/video/internal/audio/AutoValue_AudioSettings$Builder;->audioSource:Ljava/lang/Integer;

    .line 147
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget-object v1, p0, Landroidx/camera/video/internal/audio/AutoValue_AudioSettings$Builder;->sampleRate:Ljava/lang/Integer;

    .line 148
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iget-object v1, p0, Landroidx/camera/video/internal/audio/AutoValue_AudioSettings$Builder;->channelCount:Ljava/lang/Integer;

    .line 149
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v5

    iget-object v1, p0, Landroidx/camera/video/internal/audio/AutoValue_AudioSettings$Builder;->audioFormat:Ljava/lang/Integer;

    .line 150
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v6

    const/4 v7, 0x0

    invoke-direct/range {v2 .. v7}, Landroidx/camera/video/internal/audio/AutoValue_AudioSettings;-><init>(IIIILandroidx/camera/video/internal/audio/AutoValue_AudioSettings$1;)V

    .line 146
    return-object v2

    .line 144
    :cond_4
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

.method public setAudioFormat(I)Landroidx/camera/video/internal/audio/AudioSettings$Builder;
    .locals 1
    .param p1, "audioFormat"    # I

    .line 125
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/internal/audio/AutoValue_AudioSettings$Builder;->audioFormat:Ljava/lang/Integer;

    .line 126
    return-object p0
.end method

.method public setAudioSource(I)Landroidx/camera/video/internal/audio/AudioSettings$Builder;
    .locals 1
    .param p1, "audioSource"    # I

    .line 110
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/internal/audio/AutoValue_AudioSettings$Builder;->audioSource:Ljava/lang/Integer;

    .line 111
    return-object p0
.end method

.method public setChannelCount(I)Landroidx/camera/video/internal/audio/AudioSettings$Builder;
    .locals 1
    .param p1, "channelCount"    # I

    .line 120
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/internal/audio/AutoValue_AudioSettings$Builder;->channelCount:Ljava/lang/Integer;

    .line 121
    return-object p0
.end method

.method public setSampleRate(I)Landroidx/camera/video/internal/audio/AudioSettings$Builder;
    .locals 1
    .param p1, "sampleRate"    # I

    .line 115
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/internal/audio/AutoValue_AudioSettings$Builder;->sampleRate:Ljava/lang/Integer;

    .line 116
    return-object p0
.end method
