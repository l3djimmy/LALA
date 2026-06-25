.class Landroidx/camera/camera2/internal/CaptureSessionRepository;
.super Ljava/lang/Object;
.source "CaptureSessionRepository.java"


# instance fields
.field private final mCameraStateCallback:Landroid/hardware/camera2/CameraDevice$StateCallback;

.field final mCaptureSessions:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/camera/camera2/internal/SynchronizedCaptureSession;",
            ">;"
        }
    .end annotation
.end field

.field final mClosingCaptureSession:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/camera/camera2/internal/SynchronizedCaptureSession;",
            ">;"
        }
    .end annotation
.end field

.field final mCreatingCaptureSessions:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/camera/camera2/internal/SynchronizedCaptureSession;",
            ">;"
        }
    .end annotation
.end field

.field final mExecutor:Ljava/util/concurrent/Executor;

.field final mLock:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/util/concurrent/Executor;)V
    .locals 1
    .param p1, "executor"    # Ljava/util/concurrent/Executor;

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/CaptureSessionRepository;->mLock:Ljava/lang/Object;

    .line 49
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/CaptureSessionRepository;->mCaptureSessions:Ljava/util/Set;

    .line 51
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/CaptureSessionRepository;->mClosingCaptureSession:Ljava/util/Set;

    .line 53
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/CaptureSessionRepository;->mCreatingCaptureSessions:Ljava/util/Set;

    .line 60
    new-instance v0, Landroidx/camera/camera2/internal/CaptureSessionRepository$1;

    invoke-direct {v0, p0}, Landroidx/camera/camera2/internal/CaptureSessionRepository$1;-><init>(Landroidx/camera/camera2/internal/CaptureSessionRepository;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/CaptureSessionRepository;->mCameraStateCallback:Landroid/hardware/camera2/CameraDevice$StateCallback;

    .line 57
    iput-object p1, p0, Landroidx/camera/camera2/internal/CaptureSessionRepository;->mExecutor:Ljava/util/concurrent/Executor;

    .line 58
    return-void
.end method

.method private forceFinishCloseStaleSessions(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V
    .locals 3
    .param p1, "session"    # Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 138
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/CaptureSessionRepository;->getSessionsInOrder()Ljava/util/List;

    move-result-object v0

    .line 139
    .local v0, "sessions":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/camera2/internal/SynchronizedCaptureSession;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 143
    .local v2, "s":Landroidx/camera/camera2/internal/SynchronizedCaptureSession;
    if-ne v2, p1, :cond_0

    .line 144
    goto :goto_1

    .line 146
    :cond_0
    invoke-interface {v2}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession;->finishClose()V

    .line 147
    .end local v2    # "s":Landroidx/camera/camera2/internal/SynchronizedCaptureSession;
    goto :goto_0

    .line 148
    :cond_1
    :goto_1
    return-void
.end method

.method static forceOnClosed(Ljava/util/Set;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Landroidx/camera/camera2/internal/SynchronizedCaptureSession;",
            ">;)V"
        }
    .end annotation

    .line 127
    .local p0, "sessions":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/camera2/internal/SynchronizedCaptureSession;>;"
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 128
    .local v1, "session":Landroidx/camera/camera2/internal/SynchronizedCaptureSession;
    invoke-interface {v1}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession;->getStateCallback()Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;->onClosed(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V

    .line 129
    .end local v1    # "session":Landroidx/camera/camera2/internal/SynchronizedCaptureSession;
    goto :goto_0

    .line 130
    :cond_0
    return-void
.end method


# virtual methods
.method getCameraStateCallback()Landroid/hardware/camera2/CameraDevice$StateCallback;
    .locals 1

    .line 123
    iget-object v0, p0, Landroidx/camera/camera2/internal/CaptureSessionRepository;->mCameraStateCallback:Landroid/hardware/camera2/CameraDevice$StateCallback;

    return-object v0
.end method

.method getCaptureSessions()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/camera2/internal/SynchronizedCaptureSession;",
            ">;"
        }
    .end annotation

    .line 152
    iget-object v0, p0, Landroidx/camera/camera2/internal/CaptureSessionRepository;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 153
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Landroidx/camera/camera2/internal/CaptureSessionRepository;->mCaptureSessions:Ljava/util/Set;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit v0

    return-object v1

    .line 154
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method getClosingCaptureSession()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/camera2/internal/SynchronizedCaptureSession;",
            ">;"
        }
    .end annotation

    .line 159
    iget-object v0, p0, Landroidx/camera/camera2/internal/CaptureSessionRepository;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 160
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Landroidx/camera/camera2/internal/CaptureSessionRepository;->mClosingCaptureSession:Ljava/util/Set;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit v0

    return-object v1

    .line 161
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method getCreatingCaptureSessions()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/camera2/internal/SynchronizedCaptureSession;",
            ">;"
        }
    .end annotation

    .line 166
    iget-object v0, p0, Landroidx/camera/camera2/internal/CaptureSessionRepository;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 167
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Landroidx/camera/camera2/internal/CaptureSessionRepository;->mCreatingCaptureSessions:Ljava/util/Set;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit v0

    return-object v1

    .line 168
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method getSessionsInOrder()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/camera2/internal/SynchronizedCaptureSession;",
            ">;"
        }
    .end annotation

    .line 181
    iget-object v0, p0, Landroidx/camera/camera2/internal/CaptureSessionRepository;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 182
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 183
    .local v1, "sessions":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/camera2/internal/SynchronizedCaptureSession;>;"
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/CaptureSessionRepository;->getCaptureSessions()Ljava/util/List;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 184
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/CaptureSessionRepository;->getCreatingCaptureSessions()Ljava/util/List;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 185
    monitor-exit v0

    return-object v1

    .line 186
    .end local v1    # "sessions":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/camera2/internal/SynchronizedCaptureSession;>;"
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method onCaptureSessionClosed(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V
    .locals 2
    .param p1, "synchronizedCaptureSession"    # Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 213
    iget-object v0, p0, Landroidx/camera/camera2/internal/CaptureSessionRepository;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 214
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSessionRepository;->mCaptureSessions:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 215
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSessionRepository;->mClosingCaptureSession:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 216
    monitor-exit v0

    .line 217
    return-void

    .line 216
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method onCaptureSessionClosing(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V
    .locals 2
    .param p1, "synchronizedCaptureSession"    # Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 220
    iget-object v0, p0, Landroidx/camera/camera2/internal/CaptureSessionRepository;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 221
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSessionRepository;->mClosingCaptureSession:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 222
    monitor-exit v0

    .line 223
    return-void

    .line 222
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method onCaptureSessionConfigureFail(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V
    .locals 2
    .param p1, "synchronizedCaptureSession"    # Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 197
    invoke-direct {p0, p1}, Landroidx/camera/camera2/internal/CaptureSessionRepository;->forceFinishCloseStaleSessions(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V

    .line 198
    iget-object v0, p0, Landroidx/camera/camera2/internal/CaptureSessionRepository;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 199
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSessionRepository;->mCreatingCaptureSessions:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 200
    monitor-exit v0

    .line 201
    return-void

    .line 200
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method onCaptureSessionCreated(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V
    .locals 2
    .param p1, "synchronizedCaptureSession"    # Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 205
    iget-object v0, p0, Landroidx/camera/camera2/internal/CaptureSessionRepository;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 206
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSessionRepository;->mCaptureSessions:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 207
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSessionRepository;->mCreatingCaptureSessions:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 208
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 209
    invoke-direct {p0, p1}, Landroidx/camera/camera2/internal/CaptureSessionRepository;->forceFinishCloseStaleSessions(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V

    .line 210
    return-void

    .line 208
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method onCreateCaptureSession(Landroidx/camera/camera2/internal/SynchronizedCaptureSession;)V
    .locals 2
    .param p1, "synchronizedCaptureSession"    # Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 190
    iget-object v0, p0, Landroidx/camera/camera2/internal/CaptureSessionRepository;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 191
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSessionRepository;->mCreatingCaptureSessions:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 192
    monitor-exit v0

    .line 193
    return-void

    .line 192
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
