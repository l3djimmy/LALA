.class Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;
.super Landroidx/camera/camera2/internal/SynchronizedCaptureSessionBaseImpl;
.source "SynchronizedCaptureSessionImpl.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "SyncCaptureSessionImpl"


# instance fields
.field private final mCloseSurfaceQuirk:Landroidx/camera/camera2/internal/compat/workaround/ForceCloseDeferrableSurface;

.field private mDeferrableSurfaces:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            ">;"
        }
    .end annotation
.end field

.field private final mForceCloseSessionQuirk:Landroidx/camera/camera2/internal/compat/workaround/ForceCloseCaptureSession;

.field private final mObjectLock:Ljava/lang/Object;

.field mOpeningCaptureSession:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private final mWaitForOtherSessionCompleteQuirk:Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;


# direct methods
.method constructor <init>(Landroidx/camera/core/impl/Quirks;Landroidx/camera/core/impl/Quirks;Landroidx/camera/camera2/internal/CaptureSessionRepository;Ljava/util/concurrent/Executor;Ljava/util/concurrent/ScheduledExecutorService;Landroid/os/Handler;)V
    .locals 1
    .param p1, "cameraQuirks"    # Landroidx/camera/core/impl/Quirks;
    .param p2, "deviceQuirks"    # Landroidx/camera/core/impl/Quirks;
    .param p3, "repository"    # Landroidx/camera/camera2/internal/CaptureSessionRepository;
    .param p4, "executor"    # Ljava/util/concurrent/Executor;
    .param p5, "scheduledExecutorService"    # Ljava/util/concurrent/ScheduledExecutorService;
    .param p6, "compatHandler"    # Landroid/os/Handler;

    .line 88
    invoke-direct {p0, p3, p4, p5, p6}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionBaseImpl;-><init>(Landroidx/camera/camera2/internal/CaptureSessionRepository;Ljava/util/concurrent/Executor;Ljava/util/concurrent/ScheduledExecutorService;Landroid/os/Handler;)V

    .line 67
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mObjectLock:Ljava/lang/Object;

    .line 89
    new-instance v0, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseDeferrableSurface;

    invoke-direct {v0, p1, p2}, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseDeferrableSurface;-><init>(Landroidx/camera/core/impl/Quirks;Landroidx/camera/core/impl/Quirks;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mCloseSurfaceQuirk:Landroidx/camera/camera2/internal/compat/workaround/ForceCloseDeferrableSurface;

    .line 90
    new-instance v0, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;

    invoke-direct {v0, p1}, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;-><init>(Landroidx/camera/core/impl/Quirks;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mWaitForOtherSessionCompleteQuirk:Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;

    .line 91
    new-instance v0, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseCaptureSession;

    invoke-direct {v0, p2}, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseCaptureSession;-><init>(Landroidx/camera/core/impl/Quirks;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mForceCloseSessionQuirk:Landroidx/camera/camera2/internal/compat/workaround/ForceCloseCaptureSession;

    .line 92
    return-void
.end method


# virtual methods
.method public close()V
    .locals 3

    .line 154
    const-string/jumbo v0, "Session call close()"

    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->debugLog(Ljava/lang/String;)V

    .line 155
    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mWaitForOtherSessionCompleteQuirk:Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;->onSessionEnd()V

    .line 156
    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mWaitForOtherSessionCompleteQuirk:Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;->getStartStreamFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    new-instance v1, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;)V

    .line 160
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    .line 156
    invoke-interface {v0, v1, v2}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 161
    return-void
.end method

.method debugLog(Ljava/lang/String;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;

    .line 173
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "] "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "SyncCaptureSessionImpl"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 174
    return-void
.end method

.method public getOpeningBlocker()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 111
    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mWaitForOtherSessionCompleteQuirk:Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;->getStartStreamFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$close$3$androidx-camera-camera2-internal-SynchronizedCaptureSessionImpl()V
    .locals 1

    .line 158
    const-string/jumbo v0, "Session call super.close()"

    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->debugLog(Ljava/lang/String;)V

    .line 159
    invoke-super {p0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionBaseImpl;->close()V

    .line 160
    return-void
.end method

.method synthetic lambda$onConfigured$2$androidx-camera-camera2-internal-SynchronizedCaptureSessionImpl(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V
    .locals 0
    .param p1, "x$0"    # Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 149
    invoke-super {p0, p1}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionBaseImpl;->onConfigured(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V

    return-void
.end method

.method synthetic lambda$openCaptureSession$0$androidx-camera-camera2-internal-SynchronizedCaptureSessionImpl(Landroid/hardware/camera2/CameraDevice;Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;Ljava/util/List;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .param p1, "x$0"    # Landroid/hardware/camera2/CameraDevice;
    .param p2, "x$1"    # Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;
    .param p3, "x$2"    # Ljava/util/List;

    .line 103
    invoke-super {p0, p1, p2, p3}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionBaseImpl;->openCaptureSession(Landroid/hardware/camera2/CameraDevice;Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;Ljava/util/List;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$setSingleRepeatingRequest$1$androidx-camera-camera2-internal-SynchronizedCaptureSessionImpl(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)I
    .locals 1
    .param p1, "x$0"    # Landroid/hardware/camera2/CaptureRequest;
    .param p2, "x$1"    # Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;
        }
    .end annotation

    .line 140
    invoke-super {p0, p1, p2}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionBaseImpl;->setSingleRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)I

    move-result v0

    return v0
.end method

.method public onClosed(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V
    .locals 3
    .param p1, "session"    # Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 165
    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mObjectLock:Ljava/lang/Object;

    monitor-enter v0

    .line 166
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mCloseSurfaceQuirk:Landroidx/camera/camera2/internal/compat/workaround/ForceCloseDeferrableSurface;

    iget-object v2, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mDeferrableSurfaces:Ljava/util/List;

    invoke-virtual {v1, v2}, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseDeferrableSurface;->onSessionEnd(Ljava/util/List;)V

    .line 167
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 168
    const-string/jumbo v0, "onClosed()"

    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->debugLog(Ljava/lang/String;)V

    .line 169
    invoke-super {p0, p1}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionBaseImpl;->onClosed(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V

    .line 170
    return-void

    .line 167
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public onConfigured(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V
    .locals 4
    .param p1, "session"    # Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 145
    const-string/jumbo v0, "Session onConfigured()"

    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->debugLog(Ljava/lang/String;)V

    .line 146
    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mForceCloseSessionQuirk:Landroidx/camera/camera2/internal/compat/workaround/ForceCloseCaptureSession;

    iget-object v1, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mCaptureSessionRepository:Landroidx/camera/camera2/internal/CaptureSessionRepository;

    .line 147
    invoke-virtual {v1}, Landroidx/camera/camera2/internal/CaptureSessionRepository;->getCreatingCaptureSessions()Ljava/util/List;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mCaptureSessionRepository:Landroidx/camera/camera2/internal/CaptureSessionRepository;

    .line 148
    invoke-virtual {v2}, Landroidx/camera/camera2/internal/CaptureSessionRepository;->getCaptureSessions()Ljava/util/List;

    move-result-object v2

    new-instance v3, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl$$ExternalSyntheticLambda1;

    invoke-direct {v3, p0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;)V

    .line 146
    invoke-virtual {v0, p1, v1, v2, v3}, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseCaptureSession;->onSessionConfigured(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;Ljava/util/List;Ljava/util/List;Landroidx/camera/camera2/internal/compat/workaround/ForceCloseCaptureSession$OnConfigured;)V

    .line 150
    return-void
.end method

.method public openCaptureSession(Landroid/hardware/camera2/CameraDevice;Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;Ljava/util/List;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 8
    .param p1, "cameraDevice"    # Landroid/hardware/camera2/CameraDevice;
    .param p2, "sessionConfigurationCompat"    # Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/CameraDevice;",
            "Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            ">;)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 99
    .local p3, "deferrableSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/DeferrableSurface;>;"
    iget-object v1, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mObjectLock:Ljava/lang/Object;

    monitor-enter v1

    .line 100
    :try_start_0
    iget-object v2, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mWaitForOtherSessionCompleteQuirk:Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;

    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mCaptureSessionRepository:Landroidx/camera/camera2/internal/CaptureSessionRepository;

    .line 102
    invoke-virtual {v0}, Landroidx/camera/camera2/internal/CaptureSessionRepository;->getClosingCaptureSession()Ljava/util/List;

    move-result-object v6

    new-instance v7, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl$$ExternalSyntheticLambda3;

    invoke-direct {v7, p0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl$$ExternalSyntheticLambda3;-><init>(Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 100
    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    .end local p1    # "cameraDevice":Landroid/hardware/camera2/CameraDevice;
    .end local p2    # "sessionConfigurationCompat":Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;
    .end local p3    # "deferrableSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/DeferrableSurface;>;"
    .local v3, "cameraDevice":Landroid/hardware/camera2/CameraDevice;
    .local v4, "sessionConfigurationCompat":Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;
    .local v5, "deferrableSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/DeferrableSurface;>;"
    :try_start_1
    invoke-virtual/range {v2 .. v7}, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;->openCaptureSession(Landroid/hardware/camera2/CameraDevice;Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;Ljava/util/List;Ljava/util/List;Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart$OpenCaptureSession;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object p1

    iput-object p1, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mOpeningCaptureSession:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 104
    iget-object p1, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mOpeningCaptureSession:Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-static {p1}, Landroidx/camera/core/impl/utils/futures/Futures;->nonCancellationPropagating(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object p1

    monitor-exit v1

    return-object p1

    .line 105
    .end local v3    # "cameraDevice":Landroid/hardware/camera2/CameraDevice;
    .end local v4    # "sessionConfigurationCompat":Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;
    .end local v5    # "deferrableSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/DeferrableSurface;>;"
    .restart local p1    # "cameraDevice":Landroid/hardware/camera2/CameraDevice;
    .restart local p2    # "sessionConfigurationCompat":Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;
    .restart local p3    # "deferrableSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/DeferrableSurface;>;"
    :catchall_0
    move-exception v0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object p1, v0

    .end local p1    # "cameraDevice":Landroid/hardware/camera2/CameraDevice;
    .end local p2    # "sessionConfigurationCompat":Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;
    .end local p3    # "deferrableSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/DeferrableSurface;>;"
    .restart local v3    # "cameraDevice":Landroid/hardware/camera2/CameraDevice;
    .restart local v4    # "sessionConfigurationCompat":Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;
    .restart local v5    # "deferrableSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/DeferrableSurface;>;"
    :goto_0
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw p1

    :catchall_1
    move-exception v0

    move-object p1, v0

    goto :goto_0
.end method

.method public setSingleRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)I
    .locals 2
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest;
    .param p2, "listener"    # Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;
        }
    .end annotation

    .line 139
    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mWaitForOtherSessionCompleteQuirk:Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;

    new-instance v1, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;)V

    invoke-virtual {v0, p1, p2, v1}, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;->setSingleRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart$SingleRepeatingRequest;)I

    move-result v0

    return v0
.end method

.method public startWithDeferrableSurface(Ljava/util/List;J)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .param p2, "timeout"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            ">;J)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/util/List<",
            "Landroid/view/Surface;",
            ">;>;"
        }
    .end annotation

    .line 118
    .local p1, "deferrableSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/DeferrableSurface;>;"
    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mObjectLock:Ljava/lang/Object;

    monitor-enter v0

    .line 119
    :try_start_0
    iput-object p1, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mDeferrableSurfaces:Ljava/util/List;

    .line 120
    invoke-super {p0, p1, p2, p3}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionBaseImpl;->startWithDeferrableSurface(Ljava/util/List;J)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 121
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public stop()Z
    .locals 3

    .line 126
    iget-object v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mObjectLock:Ljava/lang/Object;

    monitor-enter v0

    .line 127
    :try_start_0
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->isCameraCaptureSessionOpen()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 128
    iget-object v1, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mCloseSurfaceQuirk:Landroidx/camera/camera2/internal/compat/workaround/ForceCloseDeferrableSurface;

    iget-object v2, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mDeferrableSurfaces:Ljava/util/List;

    invoke-virtual {v1, v2}, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseDeferrableSurface;->onSessionEnd(Ljava/util/List;)V

    goto :goto_0

    .line 129
    :cond_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mOpeningCaptureSession:Lcom/google/common/util/concurrent/ListenableFuture;

    if-eqz v1, :cond_1

    .line 130
    iget-object v1, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;->mOpeningCaptureSession:Lcom/google/common/util/concurrent/ListenableFuture;

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Lcom/google/common/util/concurrent/ListenableFuture;->cancel(Z)Z

    .line 132
    :cond_1
    :goto_0
    invoke-super {p0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionBaseImpl;->stop()Z

    move-result v1

    monitor-exit v0

    return v1

    .line 133
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
