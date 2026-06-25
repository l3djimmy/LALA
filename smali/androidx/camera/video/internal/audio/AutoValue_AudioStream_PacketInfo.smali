.class final Landroidx/camera/video/internal/audio/AutoValue_AudioStream_PacketInfo;
.super Landroidx/camera/video/internal/audio/AudioStream$PacketInfo;
.source "AutoValue_AudioStream_PacketInfo.java"


# instance fields
.field private final sizeInBytes:I

.field private final timestampNs:J


# direct methods
.method constructor <init>(IJ)V
    .locals 0
    .param p1, "sizeInBytes"    # I
    .param p2, "timestampNs"    # J

    .line 14
    invoke-direct {p0}, Landroidx/camera/video/internal/audio/AudioStream$PacketInfo;-><init>()V

    .line 15
    iput p1, p0, Landroidx/camera/video/internal/audio/AutoValue_AudioStream_PacketInfo;->sizeInBytes:I

    .line 16
    iput-wide p2, p0, Landroidx/camera/video/internal/audio/AutoValue_AudioStream_PacketInfo;->timestampNs:J

    .line 17
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .param p1, "o"    # Ljava/lang/Object;

    .line 39
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 40
    return v0

    .line 42
    :cond_0
    instance-of v1, p1, Landroidx/camera/video/internal/audio/AudioStream$PacketInfo;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 43
    move-object v1, p1

    check-cast v1, Landroidx/camera/video/internal/audio/AudioStream$PacketInfo;

    .line 44
    .local v1, "that":Landroidx/camera/video/internal/audio/AudioStream$PacketInfo;
    iget v3, p0, Landroidx/camera/video/internal/audio/AutoValue_AudioStream_PacketInfo;->sizeInBytes:I

    invoke-virtual {v1}, Landroidx/camera/video/internal/audio/AudioStream$PacketInfo;->getSizeInBytes()I

    move-result v4

    if-ne v3, v4, :cond_1

    iget-wide v3, p0, Landroidx/camera/video/internal/audio/AutoValue_AudioStream_PacketInfo;->timestampNs:J

    .line 45
    invoke-virtual {v1}, Landroidx/camera/video/internal/audio/AudioStream$PacketInfo;->getTimestampNs()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-nez v3, :cond_1

    goto :goto_0

    :cond_1
    move v0, v2

    .line 44
    :goto_0
    return v0

    .line 47
    .end local v1    # "that":Landroidx/camera/video/internal/audio/AudioStream$PacketInfo;
    :cond_2
    return v2
.end method

.method public getSizeInBytes()I
    .locals 1

    .line 21
    iget v0, p0, Landroidx/camera/video/internal/audio/AutoValue_AudioStream_PacketInfo;->sizeInBytes:I

    return v0
.end method

.method public getTimestampNs()J
    .locals 2

    .line 26
    iget-wide v0, p0, Landroidx/camera/video/internal/audio/AutoValue_AudioStream_PacketInfo;->timestampNs:J

    return-wide v0
.end method

.method public hashCode()I
    .locals 5

    .line 52
    const/4 v0, 0x1

    .line 53
    .local v0, "h$":I
    const v1, 0xf4243

    mul-int/2addr v0, v1

    .line 54
    iget v2, p0, Landroidx/camera/video/internal/audio/AutoValue_AudioStream_PacketInfo;->sizeInBytes:I

    xor-int/2addr v0, v2

    .line 55
    mul-int/2addr v0, v1

    .line 56
    iget-wide v1, p0, Landroidx/camera/video/internal/audio/AutoValue_AudioStream_PacketInfo;->timestampNs:J

    const/16 v3, 0x20

    ushr-long/2addr v1, v3

    iget-wide v3, p0, Landroidx/camera/video/internal/audio/AutoValue_AudioStream_PacketInfo;->timestampNs:J

    xor-long/2addr v1, v3

    long-to-int v1, v1

    xor-int/2addr v0, v1

    .line 57
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "PacketInfo{sizeInBytes="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/video/internal/audio/AutoValue_AudioStream_PacketInfo;->sizeInBytes:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", timestampNs="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Landroidx/camera/video/internal/audio/AutoValue_AudioStream_PacketInfo;->timestampNs:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
