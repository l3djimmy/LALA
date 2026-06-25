.class public final Landroidx/camera/video/internal/audio/AudioUtils;
.super Ljava/lang/Object;
.source "AudioUtils.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    return-void
.end method

.method public static channelCountToChannelConfig(I)I
    .locals 1
    .param p0, "channelCount"    # I

    .line 50
    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    const/16 v0, 0x10

    goto :goto_0

    :cond_0
    const/16 v0, 0xc

    :goto_0
    return v0
.end method

.method public static channelCountToChannelMask(I)I
    .locals 1
    .param p0, "channelCount"    # I

    .line 65
    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    const/16 v0, 0x10

    goto :goto_0

    :cond_0
    const/16 v0, 0xc

    :goto_0
    return v0
.end method

.method public static frameCountToDurationNs(JI)J
    .locals 4
    .param p0, "frameCount"    # J
    .param p2, "sampleRate"    # I

    .line 142
    int-to-long v0, p2

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string/jumbo v1, "sampleRate must be greater than 0."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 143
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v0

    mul-long/2addr v0, p0

    int-to-long v2, p2

    div-long/2addr v0, v2

    return-wide v0
.end method

.method public static frameCountToSize(JI)J
    .locals 4
    .param p0, "frameCount"    # J
    .param p2, "bytesPerFrame"    # I

    .line 127
    int-to-long v0, p2

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string/jumbo v1, "bytesPerFrame must be greater than 0."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 128
    int-to-long v0, p2

    mul-long/2addr v0, p0

    return-wide v0
.end method

.method public static getBytesPerFrame(II)I
    .locals 3
    .param p0, "audioEncoding"    # I
    .param p1, "channelCount"    # I

    .line 83
    if-lez p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid channel count: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 84
    sparse-switch p0, :sswitch_data_0

    .line 95
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid audio encoding: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 90
    :sswitch_0
    mul-int/lit8 v0, p1, 0x3

    return v0

    .line 93
    :sswitch_1
    mul-int/lit8 v0, p1, 0x4

    return v0

    .line 86
    :sswitch_2
    return p1

    .line 88
    :sswitch_3
    mul-int/lit8 v0, p1, 0x2

    return v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x2 -> :sswitch_3
        0x3 -> :sswitch_2
        0x4 -> :sswitch_1
        0x15 -> :sswitch_0
        0x16 -> :sswitch_1
    .end sparse-switch
.end method

.method public static sizeToFrameCount(JI)J
    .locals 4
    .param p0, "sizeInBytes"    # J
    .param p2, "bytesPerFrame"    # I

    .line 112
    int-to-long v0, p2

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string/jumbo v1, "bytesPerFrame must be greater than 0."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 113
    int-to-long v0, p2

    div-long v0, p0, v0

    return-wide v0
.end method
