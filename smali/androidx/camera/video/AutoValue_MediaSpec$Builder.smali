.class final Landroidx/camera/video/AutoValue_MediaSpec$Builder;
.super Landroidx/camera/video/MediaSpec$Builder;
.source "AutoValue_MediaSpec.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/video/AutoValue_MediaSpec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Builder"
.end annotation


# instance fields
.field private audioSpec:Landroidx/camera/video/AudioSpec;

.field private outputFormat:Ljava/lang/Integer;

.field private videoSpec:Landroidx/camera/video/VideoSpec;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 87
    invoke-direct {p0}, Landroidx/camera/video/MediaSpec$Builder;-><init>()V

    .line 88
    return-void
.end method

.method private constructor <init>(Landroidx/camera/video/MediaSpec;)V
    .locals 1
    .param p1, "source"    # Landroidx/camera/video/MediaSpec;

    .line 89
    invoke-direct {p0}, Landroidx/camera/video/MediaSpec$Builder;-><init>()V

    .line 90
    invoke-virtual {p1}, Landroidx/camera/video/MediaSpec;->getVideoSpec()Landroidx/camera/video/VideoSpec;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/AutoValue_MediaSpec$Builder;->videoSpec:Landroidx/camera/video/VideoSpec;

    .line 91
    invoke-virtual {p1}, Landroidx/camera/video/MediaSpec;->getAudioSpec()Landroidx/camera/video/AudioSpec;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/AutoValue_MediaSpec$Builder;->audioSpec:Landroidx/camera/video/AudioSpec;

    .line 92
    invoke-virtual {p1}, Landroidx/camera/video/MediaSpec;->getOutputFormat()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/AutoValue_MediaSpec$Builder;->outputFormat:Ljava/lang/Integer;

    .line 93
    return-void
.end method

.method synthetic constructor <init>(Landroidx/camera/video/MediaSpec;Landroidx/camera/video/AutoValue_MediaSpec$1;)V
    .locals 0
    .param p1, "x0"    # Landroidx/camera/video/MediaSpec;
    .param p2, "x1"    # Landroidx/camera/video/AutoValue_MediaSpec$1;

    .line 83
    invoke-direct {p0, p1}, Landroidx/camera/video/AutoValue_MediaSpec$Builder;-><init>(Landroidx/camera/video/MediaSpec;)V

    return-void
.end method


# virtual methods
.method public build()Landroidx/camera/video/MediaSpec;
    .locals 6

    .line 131
    const-string v0, ""

    .line 132
    .local v0, "missing":Ljava/lang/String;
    iget-object v1, p0, Landroidx/camera/video/AutoValue_MediaSpec$Builder;->videoSpec:Landroidx/camera/video/VideoSpec;

    if-nez v1, :cond_0

    .line 133
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " videoSpec"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 135
    :cond_0
    iget-object v1, p0, Landroidx/camera/video/AutoValue_MediaSpec$Builder;->audioSpec:Landroidx/camera/video/AudioSpec;

    if-nez v1, :cond_1

    .line 136
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " audioSpec"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 138
    :cond_1
    iget-object v1, p0, Landroidx/camera/video/AutoValue_MediaSpec$Builder;->outputFormat:Ljava/lang/Integer;

    if-nez v1, :cond_2

    .line 139
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " outputFormat"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 141
    :cond_2
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 144
    new-instance v1, Landroidx/camera/video/AutoValue_MediaSpec;

    iget-object v2, p0, Landroidx/camera/video/AutoValue_MediaSpec$Builder;->videoSpec:Landroidx/camera/video/VideoSpec;

    iget-object v3, p0, Landroidx/camera/video/AutoValue_MediaSpec$Builder;->audioSpec:Landroidx/camera/video/AudioSpec;

    iget-object v4, p0, Landroidx/camera/video/AutoValue_MediaSpec$Builder;->outputFormat:Ljava/lang/Integer;

    .line 147
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/4 v5, 0x0

    invoke-direct {v1, v2, v3, v4, v5}, Landroidx/camera/video/AutoValue_MediaSpec;-><init>(Landroidx/camera/video/VideoSpec;Landroidx/camera/video/AudioSpec;ILandroidx/camera/video/AutoValue_MediaSpec$1;)V

    .line 144
    return-object v1

    .line 142
    :cond_3
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

.method getAudioSpec()Landroidx/camera/video/AudioSpec;
    .locals 2

    .line 119
    iget-object v0, p0, Landroidx/camera/video/AutoValue_MediaSpec$Builder;->audioSpec:Landroidx/camera/video/AudioSpec;

    if-eqz v0, :cond_0

    .line 122
    iget-object v0, p0, Landroidx/camera/video/AutoValue_MediaSpec$Builder;->audioSpec:Landroidx/camera/video/AudioSpec;

    return-object v0

    .line 120
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Property \"audioSpec\" has not been set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method getVideoSpec()Landroidx/camera/video/VideoSpec;
    .locals 2

    .line 104
    iget-object v0, p0, Landroidx/camera/video/AutoValue_MediaSpec$Builder;->videoSpec:Landroidx/camera/video/VideoSpec;

    if-eqz v0, :cond_0

    .line 107
    iget-object v0, p0, Landroidx/camera/video/AutoValue_MediaSpec$Builder;->videoSpec:Landroidx/camera/video/VideoSpec;

    return-object v0

    .line 105
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Property \"videoSpec\" has not been set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setAudioSpec(Landroidx/camera/video/AudioSpec;)Landroidx/camera/video/MediaSpec$Builder;
    .locals 2
    .param p1, "audioSpec"    # Landroidx/camera/video/AudioSpec;

    .line 111
    if-eqz p1, :cond_0

    .line 114
    iput-object p1, p0, Landroidx/camera/video/AutoValue_MediaSpec$Builder;->audioSpec:Landroidx/camera/video/AudioSpec;

    .line 115
    return-object p0

    .line 112
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null audioSpec"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setOutputFormat(I)Landroidx/camera/video/MediaSpec$Builder;
    .locals 1
    .param p1, "outputFormat"    # I

    .line 126
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/AutoValue_MediaSpec$Builder;->outputFormat:Ljava/lang/Integer;

    .line 127
    return-object p0
.end method

.method public setVideoSpec(Landroidx/camera/video/VideoSpec;)Landroidx/camera/video/MediaSpec$Builder;
    .locals 2
    .param p1, "videoSpec"    # Landroidx/camera/video/VideoSpec;

    .line 96
    if-eqz p1, :cond_0

    .line 99
    iput-object p1, p0, Landroidx/camera/video/AutoValue_MediaSpec$Builder;->videoSpec:Landroidx/camera/video/VideoSpec;

    .line 100
    return-object p0

    .line 97
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null videoSpec"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
