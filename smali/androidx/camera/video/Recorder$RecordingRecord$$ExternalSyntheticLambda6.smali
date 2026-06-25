.class public final synthetic Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/video/Recorder$RecordingRecord;"
    method = "lambda$updateVideoRecordEvent$6"
    proto = "(Landroidx/camera/video/VideoRecordEvent;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/camera/video/Recorder$RecordingRecord;

.field public final synthetic f$1:Landroidx/camera/video/VideoRecordEvent;


# direct methods
.method public synthetic constructor <init>(Landroidx/camera/video/Recorder$RecordingRecord;Landroidx/camera/video/VideoRecordEvent;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda6;->f$0:Landroidx/camera/video/Recorder$RecordingRecord;

    iput-object p2, p0, Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda6;->f$1:Landroidx/camera/video/VideoRecordEvent;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda6;->f$0:Landroidx/camera/video/Recorder$RecordingRecord;

    iget-object v1, p0, Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda6;->f$1:Landroidx/camera/video/VideoRecordEvent;

    invoke-virtual {v0, v1}, Landroidx/camera/video/Recorder$RecordingRecord;->lambda$updateVideoRecordEvent$6$androidx-camera-video-Recorder$RecordingRecord(Landroidx/camera/video/VideoRecordEvent;)V

    return-void
.end method
