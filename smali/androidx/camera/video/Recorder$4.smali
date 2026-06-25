.class Landroidx/camera/video/Recorder$4;
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

.field final synthetic val$completer:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

.field final synthetic val$recordingToStart:Landroidx/camera/video/Recorder$RecordingRecord;


# direct methods
.method constructor <init>(Landroidx/camera/video/Recorder;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;Landroidx/camera/video/Recorder$RecordingRecord;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/camera/video/Recorder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1626
    iput-object p1, p0, Landroidx/camera/video/Recorder$4;->this$0:Landroidx/camera/video/Recorder;

    iput-object p2, p0, Landroidx/camera/video/Recorder$4;->val$completer:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    iput-object p3, p0, Landroidx/camera/video/Recorder$4;->val$recordingToStart:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEncodeError(Landroidx/camera/video/internal/encoder/EncodeException;)V
    .locals 1
    .param p1, "e"    # Landroidx/camera/video/internal/encoder/EncodeException;

    .line 1642
    iget-object v0, p0, Landroidx/camera/video/Recorder$4;->val$completer:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    invoke-virtual {v0, p1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 1643
    return-void
.end method

.method public onEncodeStart()V
    .locals 0

    .line 1631
    return-void
.end method

.method public onEncodeStop()V
    .locals 2

    .line 1636
    iget-object v0, p0, Landroidx/camera/video/Recorder$4;->val$completer:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 1637
    return-void
.end method

.method public onEncodedData(Landroidx/camera/video/internal/encoder/EncodedData;)V
    .locals 4
    .param p1, "encodedData"    # Landroidx/camera/video/internal/encoder/EncodedData;

    .line 1650
    iget-object v0, p0, Landroidx/camera/video/Recorder$4;->this$0:Landroidx/camera/video/Recorder;

    iget-object v0, v0, Landroidx/camera/video/Recorder;->mMediaMuxer:Landroid/media/MediaMuxer;

    if-nez v0, :cond_7

    .line 1651
    iget-object v0, p0, Landroidx/camera/video/Recorder$4;->this$0:Landroidx/camera/video/Recorder;

    iget-boolean v0, v0, Landroidx/camera/video/Recorder;->mInProgressRecordingStopping:Z

    const-string/jumbo v1, "Recorder"

    if-nez v0, :cond_6

    .line 1654
    const/4 v0, 0x0

    .line 1655
    .local v0, "cachedDataDropped":Z
    iget-object v2, p0, Landroidx/camera/video/Recorder$4;->this$0:Landroidx/camera/video/Recorder;

    iget-object v2, v2, Landroidx/camera/video/Recorder;->mPendingFirstVideoData:Landroidx/camera/video/internal/encoder/EncodedData;

    if-eqz v2, :cond_0

    .line 1656
    const/4 v0, 0x1

    .line 1657
    iget-object v2, p0, Landroidx/camera/video/Recorder$4;->this$0:Landroidx/camera/video/Recorder;

    iget-object v2, v2, Landroidx/camera/video/Recorder;->mPendingFirstVideoData:Landroidx/camera/video/internal/encoder/EncodedData;

    invoke-interface {v2}, Landroidx/camera/video/internal/encoder/EncodedData;->close()V

    .line 1658
    iget-object v2, p0, Landroidx/camera/video/Recorder$4;->this$0:Landroidx/camera/video/Recorder;

    const/4 v3, 0x0

    iput-object v3, v2, Landroidx/camera/video/Recorder;->mPendingFirstVideoData:Landroidx/camera/video/internal/encoder/EncodedData;

    .line 1661
    :cond_0
    invoke-interface {p1}, Landroidx/camera/video/internal/encoder/EncodedData;->isKeyFrame()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 1664
    iget-object v2, p0, Landroidx/camera/video/Recorder$4;->this$0:Landroidx/camera/video/Recorder;

    iput-object p1, v2, Landroidx/camera/video/Recorder;->mPendingFirstVideoData:Landroidx/camera/video/internal/encoder/EncodedData;

    .line 1667
    iget-object v2, p0, Landroidx/camera/video/Recorder$4;->this$0:Landroidx/camera/video/Recorder;

    invoke-virtual {v2}, Landroidx/camera/video/Recorder;->isAudioEnabled()Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Landroidx/camera/video/Recorder$4;->this$0:Landroidx/camera/video/Recorder;

    iget-object v2, v2, Landroidx/camera/video/Recorder;->mPendingAudioRingBuffer:Landroidx/camera/core/internal/utils/RingBuffer;

    .line 1668
    invoke-interface {v2}, Landroidx/camera/core/internal/utils/RingBuffer;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_0

    .line 1673
    :cond_1
    if-eqz v0, :cond_2

    .line 1674
    const-string/jumbo v2, "Replaced cached video keyframe with newer keyframe."

    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 1677
    :cond_2
    const-string v2, "Cached video keyframe while we wait for first audio sample before starting muxer."

    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 1669
    :cond_3
    :goto_0
    const-string/jumbo v2, "Received video keyframe. Starting muxer..."

    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1671
    iget-object v1, p0, Landroidx/camera/video/Recorder$4;->this$0:Landroidx/camera/video/Recorder;

    iget-object v2, p0, Landroidx/camera/video/Recorder$4;->val$recordingToStart:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-virtual {v1, v2}, Landroidx/camera/video/Recorder;->setupAndStartMediaMuxer(Landroidx/camera/video/Recorder$RecordingRecord;)V

    goto :goto_1

    .line 1687
    :cond_4
    if-eqz v0, :cond_5

    .line 1688
    const-string v2, "Dropped cached keyframe since we have new video data and have not yet received audio data."

    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1692
    :cond_5
    const-string v2, "Dropped video data since muxer has not yet started and data is not a keyframe."

    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1694
    iget-object v1, p0, Landroidx/camera/video/Recorder$4;->this$0:Landroidx/camera/video/Recorder;

    iget-object v1, v1, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-interface {v1}, Landroidx/camera/video/internal/encoder/Encoder;->requestKeyFrame()V

    .line 1695
    invoke-interface {p1}, Landroidx/camera/video/internal/encoder/EncodedData;->close()V

    .line 1697
    .end local v0    # "cachedDataDropped":Z
    :goto_1
    goto :goto_2

    .line 1699
    :cond_6
    const-string v0, "Drop video data since recording is stopping."

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1700
    invoke-interface {p1}, Landroidx/camera/video/internal/encoder/EncodedData;->close()V

    goto :goto_2

    .line 1704
    :cond_7
    move-object v0, p1

    .line 1705
    .local v0, "videoDataToWrite":Landroidx/camera/video/internal/encoder/EncodedData;
    :try_start_0
    iget-object v1, p0, Landroidx/camera/video/Recorder$4;->this$0:Landroidx/camera/video/Recorder;

    iget-object v2, p0, Landroidx/camera/video/Recorder$4;->val$recordingToStart:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-virtual {v1, v0, v2}, Landroidx/camera/video/Recorder;->writeVideoData(Landroidx/camera/video/internal/encoder/EncodedData;Landroidx/camera/video/Recorder$RecordingRecord;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1706
    if-eqz v0, :cond_8

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/EncodedData;->close()V

    .line 1708
    .end local v0    # "videoDataToWrite":Landroidx/camera/video/internal/encoder/EncodedData;
    :cond_8
    :goto_2
    return-void

    .line 1704
    .restart local v0    # "videoDataToWrite":Landroidx/camera/video/internal/encoder/EncodedData;
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_9

    :try_start_1
    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/EncodedData;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_3

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_9
    :goto_3
    throw v1
.end method

.method public onOutputConfigUpdate(Landroidx/camera/video/internal/encoder/OutputConfig;)V
    .locals 1
    .param p1, "outputConfig"    # Landroidx/camera/video/internal/encoder/OutputConfig;

    .line 1713
    iget-object v0, p0, Landroidx/camera/video/Recorder$4;->this$0:Landroidx/camera/video/Recorder;

    iput-object p1, v0, Landroidx/camera/video/Recorder;->mVideoOutputConfig:Landroidx/camera/video/internal/encoder/OutputConfig;

    .line 1714
    return-void
.end method
