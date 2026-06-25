.class public Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;
.super Ljava/lang/Object;
.source "VideoTimebaseConverter.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "VideoTimebaseConverter"


# instance fields
.field private mInputTimebase:Landroidx/camera/core/impl/Timebase;

.field private final mTimeProvider:Landroidx/camera/video/internal/encoder/TimeProvider;

.field private mUptimeToRealtimeOffsetUs:J


# direct methods
.method public constructor <init>(Landroidx/camera/video/internal/encoder/TimeProvider;Landroidx/camera/core/impl/Timebase;)V
    .locals 2
    .param p1, "timeProvider"    # Landroidx/camera/video/internal/encoder/TimeProvider;
    .param p2, "inputTimebase"    # Landroidx/camera/core/impl/Timebase;

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mUptimeToRealtimeOffsetUs:J

    .line 56
    iput-object p1, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mTimeProvider:Landroidx/camera/video/internal/encoder/TimeProvider;

    .line 57
    iput-object p2, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mInputTimebase:Landroidx/camera/core/impl/Timebase;

    .line 58
    return-void
.end method

.method private calculateUptimeToRealtimeOffsetUs()J
    .locals 17

    .line 99
    move-object/from16 v0, p0

    const-wide v1, 0x7fffffffffffffffL

    .line 100
    .local v1, "bestGap":J
    const-wide/16 v3, 0x0

    .line 101
    .local v3, "measured":J
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    const/4 v6, 0x3

    if-ge v5, v6, :cond_2

    .line 102
    iget-object v6, v0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mTimeProvider:Landroidx/camera/video/internal/encoder/TimeProvider;

    invoke-interface {v6}, Landroidx/camera/video/internal/encoder/TimeProvider;->uptimeUs()J

    move-result-wide v6

    .line 103
    .local v6, "uptime1":J
    iget-object v8, v0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mTimeProvider:Landroidx/camera/video/internal/encoder/TimeProvider;

    invoke-interface {v8}, Landroidx/camera/video/internal/encoder/TimeProvider;->realtimeUs()J

    move-result-wide v8

    .line 104
    .local v8, "realtime":J
    iget-object v10, v0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mTimeProvider:Landroidx/camera/video/internal/encoder/TimeProvider;

    invoke-interface {v10}, Landroidx/camera/video/internal/encoder/TimeProvider;->uptimeUs()J

    move-result-wide v10

    .line 105
    .local v10, "uptime2":J
    sub-long v12, v10, v6

    .line 106
    .local v12, "gap":J
    if-eqz v5, :cond_0

    cmp-long v14, v12, v1

    if-gez v14, :cond_1

    .line 107
    :cond_0
    move-wide v1, v12

    .line 108
    add-long v14, v6, v10

    const/16 v16, 0x1

    shr-long v14, v14, v16

    sub-long v3, v8, v14

    .line 101
    .end local v6    # "uptime1":J
    .end local v8    # "realtime":J
    .end local v10    # "uptime2":J
    .end local v12    # "gap":J
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 111
    .end local v5    # "i":I
    :cond_2
    const-wide/16 v5, 0x0

    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v5

    return-wide v5
.end method

.method private isCloseToRealtime(J)Z
    .locals 8
    .param p1, "timeUs"    # J

    .line 90
    iget-object v0, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mTimeProvider:Landroidx/camera/video/internal/encoder/TimeProvider;

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/TimeProvider;->uptimeUs()J

    move-result-wide v0

    .line 91
    .local v0, "uptimeUs":J
    iget-object v2, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mTimeProvider:Landroidx/camera/video/internal/encoder/TimeProvider;

    invoke-interface {v2}, Landroidx/camera/video/internal/encoder/TimeProvider;->realtimeUs()J

    move-result-wide v2

    .line 92
    .local v2, "realtimeUs":J
    sub-long v4, p1, v2

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(J)J

    move-result-wide v4

    sub-long v6, p1, v0

    invoke-static {v6, v7}, Ljava/lang/Math;->abs(J)J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-gez v4, :cond_0

    const/4 v4, 0x1

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    :goto_0
    return v4
.end method


# virtual methods
.method public convertToUptimeUs(J)J
    .locals 6
    .param p1, "timestampUs"    # J

    .line 67
    iget-object v0, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mInputTimebase:Landroidx/camera/core/impl/Timebase;

    const-string/jumbo v1, "VideoTimebaseConverter"

    if-nez v0, :cond_1

    .line 68
    invoke-direct {p0, p1, p2}, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->isCloseToRealtime(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 69
    sget-object v0, Landroidx/camera/core/impl/Timebase;->REALTIME:Landroidx/camera/core/impl/Timebase;

    iput-object v0, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mInputTimebase:Landroidx/camera/core/impl/Timebase;

    goto :goto_0

    .line 71
    :cond_0
    sget-object v0, Landroidx/camera/core/impl/Timebase;->UPTIME:Landroidx/camera/core/impl/Timebase;

    iput-object v0, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mInputTimebase:Landroidx/camera/core/impl/Timebase;

    .line 73
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Detect input timebase = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mInputTimebase:Landroidx/camera/core/impl/Timebase;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    :cond_1
    sget-object v0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter$1;->$SwitchMap$androidx$camera$core$impl$Timebase:[I

    iget-object v2, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mInputTimebase:Landroidx/camera/core/impl/Timebase;

    invoke-virtual {v2}, Landroidx/camera/core/impl/Timebase;->ordinal()I

    move-result v2

    aget v0, v0, v2

    packed-switch v0, :pswitch_data_0

    .line 85
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Unknown timebase: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mInputTimebase:Landroidx/camera/core/impl/Timebase;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 83
    :pswitch_0
    return-wide p1

    .line 77
    :pswitch_1
    iget-wide v2, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mUptimeToRealtimeOffsetUs:J

    const-wide/16 v4, -0x1

    cmp-long v0, v2, v4

    if-nez v0, :cond_2

    .line 78
    invoke-direct {p0}, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->calculateUptimeToRealtimeOffsetUs()J

    move-result-wide v2

    iput-wide v2, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mUptimeToRealtimeOffsetUs:J

    .line 79
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "mUptimeToRealtimeOffsetUs = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mUptimeToRealtimeOffsetUs:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    :cond_2
    iget-wide v0, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mUptimeToRealtimeOffsetUs:J

    sub-long v0, p1, v0

    return-wide v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
