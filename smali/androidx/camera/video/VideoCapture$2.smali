.class Landroidx/camera/video/VideoCapture$2;
.super Landroidx/camera/core/impl/CameraCaptureCallback;
.source "VideoCapture.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/camera/video/VideoCapture;->setupSurfaceUpdateNotifier(Landroidx/camera/core/impl/SessionConfig$Builder;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mIsFirstCaptureResult:Z

.field final synthetic this$0:Landroidx/camera/video/VideoCapture;

.field final synthetic val$completer:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

.field final synthetic val$sessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

.field final synthetic val$surfaceUpdateComplete:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method constructor <init>(Landroidx/camera/video/VideoCapture;Ljava/util/concurrent/atomic/AtomicBoolean;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;Landroidx/camera/core/impl/SessionConfig$Builder;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/camera/video/VideoCapture;

    .line 1194
    .local p0, "this":Landroidx/camera/video/VideoCapture$2;, "Landroidx/camera/video/VideoCapture$2;"
    iput-object p1, p0, Landroidx/camera/video/VideoCapture$2;->this$0:Landroidx/camera/video/VideoCapture;

    iput-object p2, p0, Landroidx/camera/video/VideoCapture$2;->val$surfaceUpdateComplete:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object p3, p0, Landroidx/camera/video/VideoCapture$2;->val$completer:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    iput-object p4, p0, Landroidx/camera/video/VideoCapture$2;->val$sessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    invoke-direct {p0}, Landroidx/camera/core/impl/CameraCaptureCallback;-><init>()V

    .line 1195
    const/4 p2, 0x1

    iput-boolean p2, p0, Landroidx/camera/video/VideoCapture$2;->mIsFirstCaptureResult:Z

    return-void
.end method


# virtual methods
.method synthetic lambda$onCaptureCompleted$0$androidx-camera-video-VideoCapture$2(Landroidx/camera/core/impl/SessionConfig$Builder;)V
    .locals 0
    .param p1, "sessionConfigBuilder"    # Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 1220
    .local p0, "this":Landroidx/camera/video/VideoCapture$2;, "Landroidx/camera/video/VideoCapture$2;"
    nop

    .line 1221
    invoke-virtual {p1, p0}, Landroidx/camera/core/impl/SessionConfig$Builder;->removeCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)Z

    .line 1220
    return-void
.end method

.method public onCaptureCompleted(Landroidx/camera/core/impl/CameraCaptureResult;)V
    .locals 4
    .param p1, "cameraCaptureResult"    # Landroidx/camera/core/impl/CameraCaptureResult;

    .line 1199
    .local p0, "this":Landroidx/camera/video/VideoCapture$2;, "Landroidx/camera/video/VideoCapture$2;"
    invoke-super {p0, p1}, Landroidx/camera/core/impl/CameraCaptureCallback;->onCaptureCompleted(Landroidx/camera/core/impl/CameraCaptureResult;)V

    .line 1201
    iget-boolean v0, p0, Landroidx/camera/video/VideoCapture$2;->mIsFirstCaptureResult:Z

    if-eqz v0, :cond_0

    .line 1202
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/video/VideoCapture$2;->mIsFirstCaptureResult:Z

    .line 1203
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "cameraCaptureResult timestampNs = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1204
    invoke-interface {p1}, Landroidx/camera/core/impl/CameraCaptureResult;->getTimestamp()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", current system uptimeMs = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1206
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", current system realtimeMs = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1208
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1203
    const-string/jumbo v1, "VideoCapture"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1210
    :cond_0
    iget-object v0, p0, Landroidx/camera/video/VideoCapture$2;->val$surfaceUpdateComplete:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1211
    invoke-interface {p1}, Landroidx/camera/core/impl/CameraCaptureResult;->getTagBundle()Landroidx/camera/core/impl/TagBundle;

    move-result-object v0

    const-string/jumbo v1, "androidx.camera.video.VideoCapture.streamUpdate"

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/TagBundle;->getTag(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 1213
    .local v0, "tag":Ljava/lang/Object;
    if-eqz v0, :cond_1

    move-object v1, v0

    check-cast v1, Ljava/lang/Integer;

    .line 1214
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object v2, p0, Landroidx/camera/video/VideoCapture$2;->val$completer:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    if-ne v1, v2, :cond_1

    iget-object v1, p0, Landroidx/camera/video/VideoCapture$2;->val$completer:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 1215
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroidx/camera/video/VideoCapture$2;->val$surfaceUpdateComplete:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 1216
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v1

    if-nez v1, :cond_1

    .line 1219
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/VideoCapture$2;->val$sessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    new-instance v3, Landroidx/camera/video/VideoCapture$2$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0, v2}, Landroidx/camera/video/VideoCapture$2$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/video/VideoCapture$2;Landroidx/camera/core/impl/SessionConfig$Builder;)V

    invoke-interface {v1, v3}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 1224
    .end local v0    # "tag":Ljava/lang/Object;
    :cond_1
    return-void
.end method
