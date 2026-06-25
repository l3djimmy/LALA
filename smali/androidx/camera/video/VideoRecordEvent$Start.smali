.class public final Landroidx/camera/video/VideoRecordEvent$Start;
.super Landroidx/camera/video/VideoRecordEvent;
.source "VideoRecordEvent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/video/VideoRecordEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Start"
.end annotation


# direct methods
.method constructor <init>(Landroidx/camera/video/OutputOptions;Landroidx/camera/video/RecordingStats;)V
    .locals 0
    .param p1, "outputOptions"    # Landroidx/camera/video/OutputOptions;
    .param p2, "recordingStats"    # Landroidx/camera/video/RecordingStats;

    .line 142
    invoke-direct {p0, p1, p2}, Landroidx/camera/video/VideoRecordEvent;-><init>(Landroidx/camera/video/OutputOptions;Landroidx/camera/video/RecordingStats;)V

    .line 143
    return-void
.end method
