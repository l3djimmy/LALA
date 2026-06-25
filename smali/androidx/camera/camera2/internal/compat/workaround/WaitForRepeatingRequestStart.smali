.class public Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;
.super Ljava/lang/Object;
.source "WaitForRepeatingRequestStart.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart$OpenCaptureSession;,
        Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart$SingleRepeatingRequest;
    }
.end annotation


# instance fields
.field private final mCaptureCallback:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

.field private final mHasCaptureSessionStuckQuirk:Z

.field private mHasSubmittedRepeating:Z

.field private final mLock:Ljava/lang/Object;

.field mStartStreamingCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private final mStartStreamingFuture:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroidx/camera/core/impl/Quirks;)V
    .locals 1
    .param p1, "cameraQuirks"    # Landroidx/camera/core/impl/Quirks;

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;->mLock:Ljava/lang/Object;

    .line 137
    new-instance v0, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart$1;

    invoke-direct {v0, p0}, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart$1;-><init>(Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;->mCaptureCallback:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 64
    const-class v0, Landroidx/camera/camera2/internal/compat/quirk/CaptureSessionStuckQuirk;

    invoke-virtual {p1, v0}, Landroidx/camera/core/impl/Quirks;->contains(Ljava/lang/Class;)Z

    move-result v0

    iput-boolean v0, p0, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;->mHasCaptureSessionStuckQuirk:Z

    .line 66
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;->shouldWaitRepeatingSubmit()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 67
    new-instance v0, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;)V

    invoke-static {v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;->mStartStreamingFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    goto :goto_0

    .line 72
    :cond_0
    const/4 v0, 0x0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFuture(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;->mStartStreamingFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 74
    :goto_0
    return-void
.end method

.method static synthetic lambda$openCaptureSession$1(Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart$OpenCaptureSession;Landroid/hardware/camera2/CameraDevice;Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;Ljava/util/List;Ljava/util/List;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .param p0, "openCaptureSession"    # Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart$OpenCaptureSession;
    .param p1, "cameraDevice"    # Landroid/hardware/camera2/CameraDevice;
    .param p2, "sessionConfigurationCompat"    # Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;
    .param p3, "deferrableSurfaces"    # Ljava/util/List;
    .param p4, "v"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 107
    invoke-interface {p0, p1, p2, p3}, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart$OpenCaptureSession;->run(Landroid/hardware/camera2/CameraDevice;Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;Ljava/util/List;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getStartStreamFuture()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 87
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;->mStartStreamingFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->nonCancellationPropagating(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$new$0$androidx-camera-camera2-internal-compat-workaround-WaitForRepeatingRequestStart(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 2
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 68
    iput-object p1, p0, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;->mStartStreamingCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 69
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "WaitForRepeatingRequestStart["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public onSessionEnd()V
    .locals 3

    .line 128
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 129
    :try_start_0
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;->shouldWaitRepeatingSubmit()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;->mHasSubmittedRepeating:Z

    if-nez v1, :cond_0

    .line 132
    iget-object v1, p0, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;->mStartStreamingFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Lcom/google/common/util/concurrent/ListenableFuture;->cancel(Z)Z

    .line 134
    :cond_0
    monitor-exit v0

    .line 135
    return-void

    .line 134
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public openCaptureSession(Landroid/hardware/camera2/CameraDevice;Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;Ljava/util/List;Ljava/util/List;Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart$OpenCaptureSession;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 4
    .param p1, "cameraDevice"    # Landroid/hardware/camera2/CameraDevice;
    .param p2, "sessionConfigurationCompat"    # Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;
    .param p5, "openCaptureSession"    # Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart$OpenCaptureSession;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/CameraDevice;",
            "Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            ">;",
            "Ljava/util/List<",
            "Landroidx/camera/camera2/internal/SynchronizedCaptureSession;",
            ">;",
            "Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart$OpenCaptureSession;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 101
    .local p3, "deferrableSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/DeferrableSurface;>;"
    .local p4, "closingSessions":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/camera2/internal/SynchronizedCaptureSession;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 102
    .local v0, "futureList":Ljava/util/List;, "Ljava/util/List<Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;>;"
    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 103
    .local v2, "session":Landroidx/camera/camera2/internal/SynchronizedCaptureSession;
    invoke-interface {v2}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession;->getOpeningBlocker()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    .end local v2    # "session":Landroidx/camera/camera2/internal/SynchronizedCaptureSession;
    goto :goto_0

    .line 106
    :cond_0
    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->successfulAsList(Ljava/util/Collection;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    invoke-static {v1}, Landroidx/camera/core/impl/utils/futures/FutureChain;->from(Lcom/google/common/util/concurrent/ListenableFuture;)Landroidx/camera/core/impl/utils/futures/FutureChain;

    move-result-object v1

    new-instance v2, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart$$ExternalSyntheticLambda1;

    invoke-direct {v2, p5, p1, p2, p3}, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart$OpenCaptureSession;Landroid/hardware/camera2/CameraDevice;Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;Ljava/util/List;)V

    .line 108
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v3

    .line 106
    invoke-virtual {v1, v2, v3}, Landroidx/camera/core/impl/utils/futures/FutureChain;->transformAsync(Landroidx/camera/core/impl/utils/futures/AsyncFunction;Ljava/util/concurrent/Executor;)Landroidx/camera/core/impl/utils/futures/FutureChain;

    move-result-object v1

    return-object v1
.end method

.method public setSingleRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart$SingleRepeatingRequest;)I
    .locals 4
    .param p1, "request"    # Landroid/hardware/camera2/CaptureRequest;
    .param p2, "listener"    # Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    .param p3, "singleRepeatingRequest"    # Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart$SingleRepeatingRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;
        }
    .end annotation

    .line 117
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 118
    :try_start_0
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;->shouldWaitRepeatingSubmit()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 119
    const/4 v1, 0x2

    new-array v1, v1, [Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    iget-object v2, p0, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;->mCaptureCallback:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/4 v2, 0x1

    aput-object p2, v1, v2

    invoke-static {v1}, Landroidx/camera/camera2/internal/Camera2CaptureCallbacks;->createComboCallback([Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    move-result-object v1

    move-object p2, v1

    .line 120
    iput-boolean v2, p0, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;->mHasSubmittedRepeating:Z

    .line 122
    :cond_0
    invoke-interface {p3, p1, p2}, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart$SingleRepeatingRequest;->run(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)I

    move-result v1

    monitor-exit v0

    return v1

    .line 123
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public shouldWaitRepeatingSubmit()Z
    .locals 1

    .line 81
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;->mHasCaptureSessionStuckQuirk:Z

    return v0
.end method
