.class Landroidx/camera/video/Recorder$6;
.super Ljava/lang/Object;
.source "Recorder.java"

# interfaces
.implements Landroidx/camera/video/internal/encoder/EncoderCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/camera/video/Recorder;->updateEncoderCallbacks(Landroidx/camera/video/Recorder$RecordingRecord;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/camera/video/Recorder;

.field final synthetic val$audioErrorConsumer:Landroidx/core/util/Consumer;

.field final synthetic val$completer:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

.field final synthetic val$recordingToStart:Landroidx/camera/video/Recorder$RecordingRecord;


# direct methods
.method constructor <init>(Landroidx/camera/video/Recorder;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;Landroidx/core/util/Consumer;Landroidx/camera/video/Recorder$RecordingRecord;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/camera/video/Recorder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1766
    iput-object p1, p0, Landroidx/camera/video/Recorder$6;->this$0:Landroidx/camera/video/Recorder;

    iput-object p2, p0, Landroidx/camera/video/Recorder$6;->val$completer:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    iput-object p3, p0, Landroidx/camera/video/Recorder$6;->val$audioErrorConsumer:Landroidx/core/util/Consumer;

    iput-object p4, p0, Landroidx/camera/video/Recorder$6;->val$recordingToStart:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEncodeError(Landroidx/camera/video/internal/encoder/EncodeException;)V
    .locals 1
    .param p1, "e"    # Landroidx/camera/video/internal/encoder/EncodeException;

    .line 1782
    iget-object v0, p0, Landroidx/camera/video/Recorder$6;->this$0:Landroidx/camera/video/Recorder;

    iget-object v0, v0, Landroidx/camera/video/Recorder;->mAudioErrorCause:Ljava/lang/Throwable;

    if-nez v0, :cond_0

    .line 1783
    iget-object v0, p0, Landroidx/camera/video/Recorder$6;->val$audioErrorConsumer:Landroidx/core/util/Consumer;

    invoke-interface {v0, p1}, Landroidx/core/util/Consumer;->accept(Ljava/lang/Object;)V

    .line 1785
    :cond_0
    return-void
.end method

.method public onEncodeStart()V
    .locals 0

    .line 1771
    return-void
.end method

.method public onEncodeStop()V
    .locals 2

    .line 1776
    iget-object v0, p0, Landroidx/camera/video/Recorder$6;->val$completer:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 1777
    return-void
.end method

.method public onEncodedData(Landroidx/camera/video/internal/encoder/EncodedData;)V
    .locals 3
    .param p1, "encodedData"    # Landroidx/camera/video/internal/encoder/EncodedData;

    .line 1790
    iget-object v0, p0, Landroidx/camera/video/Recorder$6;->this$0:Landroidx/camera/video/Recorder;

    iget-object v0, v0, Landroidx/camera/video/Recorder;->mAudioState:Landroidx/camera/video/Recorder$AudioState;

    sget-object v1, Landroidx/camera/video/Recorder$AudioState;->DISABLED:Landroidx/camera/video/Recorder$AudioState;

    if-eq v0, v1, :cond_5

    .line 1798
    iget-object v0, p0, Landroidx/camera/video/Recorder$6;->this$0:Landroidx/camera/video/Recorder;

    iget-object v0, v0, Landroidx/camera/video/Recorder;->mMediaMuxer:Landroid/media/MediaMuxer;

    if-nez v0, :cond_2

    .line 1799
    iget-object v0, p0, Landroidx/camera/video/Recorder$6;->this$0:Landroidx/camera/video/Recorder;

    iget-boolean v0, v0, Landroidx/camera/video/Recorder;->mInProgressRecordingStopping:Z

    const-string/jumbo v1, "Recorder"

    if-nez v0, :cond_1

    .line 1806
    iget-object v0, p0, Landroidx/camera/video/Recorder$6;->this$0:Landroidx/camera/video/Recorder;

    iget-object v0, v0, Landroidx/camera/video/Recorder;->mPendingAudioRingBuffer:Landroidx/camera/core/internal/utils/RingBuffer;

    new-instance v2, Landroidx/camera/video/internal/encoder/BufferCopiedEncodedData;

    invoke-direct {v2, p1}, Landroidx/camera/video/internal/encoder/BufferCopiedEncodedData;-><init>(Landroidx/camera/video/internal/encoder/EncodedData;)V

    invoke-interface {v0, v2}, Landroidx/camera/core/internal/utils/RingBuffer;->enqueue(Ljava/lang/Object;)V

    .line 1809
    iget-object v0, p0, Landroidx/camera/video/Recorder$6;->this$0:Landroidx/camera/video/Recorder;

    iget-object v0, v0, Landroidx/camera/video/Recorder;->mPendingFirstVideoData:Landroidx/camera/video/internal/encoder/EncodedData;

    if-eqz v0, :cond_0

    .line 1811
    const-string/jumbo v0, "Received audio data. Starting muxer..."

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1812
    iget-object v0, p0, Landroidx/camera/video/Recorder$6;->this$0:Landroidx/camera/video/Recorder;

    iget-object v1, p0, Landroidx/camera/video/Recorder$6;->val$recordingToStart:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-virtual {v0, v1}, Landroidx/camera/video/Recorder;->setupAndStartMediaMuxer(Landroidx/camera/video/Recorder$RecordingRecord;)V

    goto :goto_0

    .line 1814
    :cond_0
    const-string v0, "Cached audio data while we wait for video keyframe before starting muxer."

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1819
    :cond_1
    const-string v0, "Drop audio data since recording is stopping."

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1822
    :goto_0
    invoke-interface {p1}, Landroidx/camera/video/internal/encoder/EncodedData;->close()V

    goto :goto_1

    .line 1824
    :cond_2
    move-object v0, p1

    .line 1825
    .local v0, "audioDataToWrite":Landroidx/camera/video/internal/encoder/EncodedData;
    :try_start_0
    iget-object v1, p0, Landroidx/camera/video/Recorder$6;->this$0:Landroidx/camera/video/Recorder;

    iget-object v2, p0, Landroidx/camera/video/Recorder$6;->val$recordingToStart:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-virtual {v1, v0, v2}, Landroidx/camera/video/Recorder;->writeAudioData(Landroidx/camera/video/internal/encoder/EncodedData;Landroidx/camera/video/Recorder$RecordingRecord;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1826
    if-eqz v0, :cond_3

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/EncodedData;->close()V

    .line 1828
    .end local v0    # "audioDataToWrite":Landroidx/camera/video/internal/encoder/EncodedData;
    :cond_3
    :goto_1
    return-void

    .line 1824
    .restart local v0    # "audioDataToWrite":Landroidx/camera/video/internal/encoder/EncodedData;
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_4

    :try_start_1
    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/EncodedData;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_4
    :goto_2
    throw v1

    .line 1791
    .end local v0    # "audioDataToWrite":Landroidx/camera/video/internal/encoder/EncodedData;
    :cond_5
    invoke-interface {p1}, Landroidx/camera/video/internal/encoder/EncodedData;->close()V

    .line 1792
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Audio is not enabled but audio encoded data is being produced."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method public onOutputConfigUpdate(Landroidx/camera/video/internal/encoder/OutputConfig;)V
    .locals 1
    .param p1, "outputConfig"    # Landroidx/camera/video/internal/encoder/OutputConfig;

    .line 1833
    iget-object v0, p0, Landroidx/camera/video/Recorder$6;->this$0:Landroidx/camera/video/Recorder;

    iput-object p1, v0, Landroidx/camera/video/Recorder;->mAudioOutputConfig:Landroidx/camera/video/internal/encoder/OutputConfig;

    .line 1834
    return-void
.end method
