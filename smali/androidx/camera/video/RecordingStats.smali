.class public abstract Landroidx/camera/video/RecordingStats;
.super Ljava/lang/Object;
.source "RecordingStats.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    return-void
.end method

.method static of(JJLandroidx/camera/video/AudioStats;)Landroidx/camera/video/RecordingStats;
    .locals 10
    .param p0, "duration"    # J
    .param p2, "bytes"    # J
    .param p4, "audioStats"    # Landroidx/camera/video/AudioStats;

    .line 48
    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-ltz v2, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    move v2, v4

    :goto_0
    const-string/jumbo v5, "duration must be positive value."

    invoke-static {v2, v5}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 49
    cmp-long v0, p2, v0

    if-ltz v0, :cond_1

    goto :goto_1

    :cond_1
    move v3, v4

    :goto_1
    const-string/jumbo v0, "bytes must be positive value."

    invoke-static {v3, v0}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 50
    new-instance v4, Landroidx/camera/video/AutoValue_RecordingStats;

    move-wide v5, p0

    move-wide v7, p2

    move-object v9, p4

    .end local p0    # "duration":J
    .end local p2    # "bytes":J
    .end local p4    # "audioStats":Landroidx/camera/video/AudioStats;
    .local v5, "duration":J
    .local v7, "bytes":J
    .local v9, "audioStats":Landroidx/camera/video/AudioStats;
    invoke-direct/range {v4 .. v9}, Landroidx/camera/video/AutoValue_RecordingStats;-><init>(JJLandroidx/camera/video/AudioStats;)V

    return-object v4
.end method


# virtual methods
.method public abstract getAudioStats()Landroidx/camera/video/AudioStats;
.end method

.method public abstract getNumBytesRecorded()J
.end method

.method public abstract getRecordedDurationNanos()J
.end method
