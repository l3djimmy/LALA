.class Landroidx/camera/camera2/internal/CaptureSession$3;
.super Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.source "CaptureSession.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/camera/camera2/internal/CaptureSession;->issueBurstCaptureRequest(Ljava/util/List;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/camera/camera2/internal/CaptureSession;


# direct methods
.method constructor <init>(Landroidx/camera/camera2/internal/CaptureSession;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/camera/camera2/internal/CaptureSession;

    .line 825
    iput-object p1, p0, Landroidx/camera/camera2/internal/CaptureSession$3;->this$0:Landroidx/camera/camera2/internal/CaptureSession;

    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onCaptureCompleted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/TotalCaptureResult;)V
    .locals 4
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
    .param p2, "request"    # Landroid/hardware/camera2/CaptureRequest;
    .param p3, "result"    # Landroid/hardware/camera2/TotalCaptureResult;

    .line 832
    iget-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession$3;->this$0:Landroidx/camera/camera2/internal/CaptureSession;

    iget-object v0, v0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionLock:Ljava/lang/Object;

    monitor-enter v0

    .line 833
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession$3;->this$0:Landroidx/camera/camera2/internal/CaptureSession;

    iget-object v1, v1, Landroidx/camera/camera2/internal/CaptureSession;->mSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    if-nez v1, :cond_0

    .line 834
    monitor-exit v0

    return-void

    .line 836
    :cond_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession$3;->this$0:Landroidx/camera/camera2/internal/CaptureSession;

    iget-object v1, v1, Landroidx/camera/camera2/internal/CaptureSession;->mSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    .line 837
    invoke-virtual {v1}, Landroidx/camera/core/impl/SessionConfig;->getRepeatingCaptureConfig()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v1

    .line 838
    .local v1, "repeatingConfig":Landroidx/camera/core/impl/CaptureConfig;
    const-string v2, "CaptureSession"

    const-string/jumbo v3, "Submit FLASH_MODE_OFF request"

    invoke-static {v2, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 839
    iget-object v2, p0, Landroidx/camera/camera2/internal/CaptureSession$3;->this$0:Landroidx/camera/camera2/internal/CaptureSession;

    iget-object v3, p0, Landroidx/camera/camera2/internal/CaptureSession$3;->this$0:Landroidx/camera/camera2/internal/CaptureSession;

    iget-object v3, v3, Landroidx/camera/camera2/internal/CaptureSession;->mTorchStateReset:Landroidx/camera/camera2/internal/compat/workaround/TorchStateReset;

    .line 840
    invoke-virtual {v3, v1}, Landroidx/camera/camera2/internal/compat/workaround/TorchStateReset;->createTorchResetRequest(Landroidx/camera/core/impl/CaptureConfig;)Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v3

    .line 839
    invoke-static {v3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroidx/camera/camera2/internal/CaptureSession;->issueCaptureRequests(Ljava/util/List;)V

    .line 842
    .end local v1    # "repeatingConfig":Landroidx/camera/core/impl/CaptureConfig;
    monitor-exit v0

    .line 843
    return-void

    .line 842
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
