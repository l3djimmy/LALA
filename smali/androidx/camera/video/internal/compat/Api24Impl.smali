.class public final Landroidx/camera/video/internal/compat/Api24Impl;
.super Ljava/lang/Object;
.source "Api24Impl.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    return-void
.end method

.method public static getClientAudioSessionId(Landroid/media/AudioRecordingConfiguration;)I
    .locals 1
    .param p0, "audioRecordingConfiguration"    # Landroid/media/AudioRecordingConfiguration;

    .line 51
    invoke-virtual {p0}, Landroid/media/AudioRecordingConfiguration;->getClientAudioSessionId()I

    move-result v0

    return v0
.end method

.method public static getTimestamp(Landroid/media/AudioRecord;Landroid/media/AudioTimestamp;I)I
    .locals 1
    .param p0, "audioRecord"    # Landroid/media/AudioRecord;
    .param p1, "audioTimestamp"    # Landroid/media/AudioTimestamp;
    .param p2, "timeBase"    # I

    .line 42
    invoke-virtual {p0, p1, p2}, Landroid/media/AudioRecord;->getTimestamp(Landroid/media/AudioTimestamp;I)I

    move-result v0

    return v0
.end method
