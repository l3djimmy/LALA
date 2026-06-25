.class Landroidx/camera/video/Recorder$2;
.super Ljava/lang/Object;
.source "Recorder.java"

# interfaces
.implements Landroidx/camera/core/impl/utils/futures/FutureCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/camera/video/Recorder;->onVideoEncoderReady(Landroidx/camera/video/VideoEncoderSession;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/camera/core/impl/utils/futures/FutureCallback<",
        "Landroidx/camera/video/internal/encoder/Encoder;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/camera/video/Recorder;

.field final synthetic val$videoEncoderSession:Landroidx/camera/video/VideoEncoderSession;


# direct methods
.method constructor <init>(Landroidx/camera/video/Recorder;Landroidx/camera/video/VideoEncoderSession;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/camera/video/Recorder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1182
    iput-object p1, p0, Landroidx/camera/video/Recorder$2;->this$0:Landroidx/camera/video/Recorder;

    iput-object p2, p0, Landroidx/camera/video/Recorder$2;->val$videoEncoderSession:Landroidx/camera/video/VideoEncoderSession;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "t"    # Ljava/lang/Throwable;

    .line 1204
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Error in ReadyToReleaseFuture: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "Recorder"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1205
    return-void
.end method

.method public onSuccess(Landroidx/camera/video/internal/encoder/Encoder;)V
    .locals 4
    .param p1, "result"    # Landroidx/camera/video/internal/encoder/Encoder;

    .line 1185
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "VideoEncoder can be released: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "Recorder"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1186
    if-nez p1, :cond_0

    .line 1187
    return-void

    .line 1189
    :cond_0
    iget-object v0, p0, Landroidx/camera/video/Recorder$2;->this$0:Landroidx/camera/video/Recorder;

    iget-object v0, v0, Landroidx/camera/video/Recorder;->mSourceNonStreamingTimeout:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroidx/camera/video/Recorder$2;->this$0:Landroidx/camera/video/Recorder;

    iget-object v0, v0, Landroidx/camera/video/Recorder;->mSourceNonStreamingTimeout:Ljava/util/concurrent/ScheduledFuture;

    .line 1190
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroidx/camera/video/Recorder$2;->this$0:Landroidx/camera/video/Recorder;

    iget-object v0, v0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroidx/camera/video/Recorder$2;->this$0:Landroidx/camera/video/Recorder;

    iget-object v0, v0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    if-ne v0, p1, :cond_1

    .line 1192
    iget-object v0, p0, Landroidx/camera/video/Recorder$2;->this$0:Landroidx/camera/video/Recorder;

    iget-object v0, v0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-static {v0}, Landroidx/camera/video/Recorder;->notifyEncoderSourceStopped(Landroidx/camera/video/internal/encoder/Encoder;)V

    .line 1195
    :cond_1
    iget-object v0, p0, Landroidx/camera/video/Recorder$2;->this$0:Landroidx/camera/video/Recorder;

    iget-object v1, p0, Landroidx/camera/video/Recorder$2;->val$videoEncoderSession:Landroidx/camera/video/VideoEncoderSession;

    iput-object v1, v0, Landroidx/camera/video/Recorder;->mVideoEncoderSessionToRelease:Landroidx/camera/video/VideoEncoderSession;

    .line 1196
    iget-object v0, p0, Landroidx/camera/video/Recorder$2;->this$0:Landroidx/camera/video/Recorder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/camera/video/Recorder;->setLatestSurface(Landroid/view/Surface;)V

    .line 1198
    iget-object v0, p0, Landroidx/camera/video/Recorder$2;->this$0:Landroidx/camera/video/Recorder;

    iget-object v2, p0, Landroidx/camera/video/Recorder$2;->this$0:Landroidx/camera/video/Recorder;

    .line 1199
    invoke-virtual {v2}, Landroidx/camera/video/Recorder;->isPersistentRecordingInProgress()Z

    move-result v2

    .line 1198
    const/4 v3, 0x4

    invoke-virtual {v0, v3, v1, v2}, Landroidx/camera/video/Recorder;->requestReset(ILjava/lang/Throwable;Z)V

    .line 1200
    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0

    .line 1182
    check-cast p1, Landroidx/camera/video/internal/encoder/Encoder;

    invoke-virtual {p0, p1}, Landroidx/camera/video/Recorder$2;->onSuccess(Landroidx/camera/video/internal/encoder/Encoder;)V

    return-void
.end method
