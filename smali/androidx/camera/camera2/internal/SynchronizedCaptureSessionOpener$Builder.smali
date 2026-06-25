.class Landroidx/camera/camera2/internal/SynchronizedCaptureSessionOpener$Builder;
.super Ljava/lang/Object;
.source "SynchronizedCaptureSessionOpener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/camera2/internal/SynchronizedCaptureSessionOpener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Builder"
.end annotation


# instance fields
.field private final mCameraQuirks:Landroidx/camera/core/impl/Quirks;

.field private final mCaptureSessionRepository:Landroidx/camera/camera2/internal/CaptureSessionRepository;

.field private final mCompatHandler:Landroid/os/Handler;

.field private final mDeviceQuirks:Landroidx/camera/core/impl/Quirks;

.field private final mExecutor:Ljava/util/concurrent/Executor;

.field private final mQuirkExist:Z

.field private final mScheduledExecutorService:Ljava/util/concurrent/ScheduledExecutorService;


# direct methods
.method constructor <init>(Ljava/util/concurrent/Executor;Ljava/util/concurrent/ScheduledExecutorService;Landroid/os/Handler;Landroidx/camera/camera2/internal/CaptureSessionRepository;Landroidx/camera/core/impl/Quirks;Landroidx/camera/core/impl/Quirks;)V
    .locals 3
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "scheduledExecutorService"    # Ljava/util/concurrent/ScheduledExecutorService;
    .param p3, "compatHandler"    # Landroid/os/Handler;
    .param p4, "captureSessionRepository"    # Landroidx/camera/camera2/internal/CaptureSessionRepository;
    .param p5, "cameraQuirks"    # Landroidx/camera/core/impl/Quirks;
    .param p6, "deviceQuirks"    # Landroidx/camera/core/impl/Quirks;

    .line 191
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 192
    iput-object p1, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionOpener$Builder;->mExecutor:Ljava/util/concurrent/Executor;

    .line 193
    iput-object p2, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionOpener$Builder;->mScheduledExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

    .line 194
    iput-object p3, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionOpener$Builder;->mCompatHandler:Landroid/os/Handler;

    .line 195
    iput-object p4, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionOpener$Builder;->mCaptureSessionRepository:Landroidx/camera/camera2/internal/CaptureSessionRepository;

    .line 196
    iput-object p5, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionOpener$Builder;->mCameraQuirks:Landroidx/camera/core/impl/Quirks;

    .line 197
    iput-object p6, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionOpener$Builder;->mDeviceQuirks:Landroidx/camera/core/impl/Quirks;

    .line 198
    new-instance v0, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseDeferrableSurface;

    iget-object v1, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionOpener$Builder;->mCameraQuirks:Landroidx/camera/core/impl/Quirks;

    iget-object v2, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionOpener$Builder;->mDeviceQuirks:Landroidx/camera/core/impl/Quirks;

    invoke-direct {v0, v1, v2}, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseDeferrableSurface;-><init>(Landroidx/camera/core/impl/Quirks;Landroidx/camera/core/impl/Quirks;)V

    .line 199
    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseDeferrableSurface;->shouldForceClose()Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;

    iget-object v1, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionOpener$Builder;->mCameraQuirks:Landroidx/camera/core/impl/Quirks;

    invoke-direct {v0, v1}, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;-><init>(Landroidx/camera/core/impl/Quirks;)V

    .line 200
    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;->shouldWaitRepeatingSubmit()Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseCaptureSession;

    iget-object v1, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionOpener$Builder;->mDeviceQuirks:Landroidx/camera/core/impl/Quirks;

    invoke-direct {v0, v1}, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseCaptureSession;-><init>(Landroidx/camera/core/impl/Quirks;)V

    .line 201
    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/workaround/ForceCloseCaptureSession;->shouldForceClose()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    iput-boolean v0, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionOpener$Builder;->mQuirkExist:Z

    .line 202
    return-void
.end method


# virtual methods
.method build()Landroidx/camera/camera2/internal/SynchronizedCaptureSessionOpener;
    .locals 9

    .line 206
    new-instance v0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionOpener;

    .line 207
    iget-boolean v1, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionOpener$Builder;->mQuirkExist:Z

    if-eqz v1, :cond_0

    new-instance v2, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;

    iget-object v3, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionOpener$Builder;->mCameraQuirks:Landroidx/camera/core/impl/Quirks;

    iget-object v4, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionOpener$Builder;->mDeviceQuirks:Landroidx/camera/core/impl/Quirks;

    iget-object v5, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionOpener$Builder;->mCaptureSessionRepository:Landroidx/camera/camera2/internal/CaptureSessionRepository;

    iget-object v6, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionOpener$Builder;->mExecutor:Ljava/util/concurrent/Executor;

    iget-object v7, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionOpener$Builder;->mScheduledExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

    iget-object v8, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionOpener$Builder;->mCompatHandler:Landroid/os/Handler;

    invoke-direct/range {v2 .. v8}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionImpl;-><init>(Landroidx/camera/core/impl/Quirks;Landroidx/camera/core/impl/Quirks;Landroidx/camera/camera2/internal/CaptureSessionRepository;Ljava/util/concurrent/Executor;Ljava/util/concurrent/ScheduledExecutorService;Landroid/os/Handler;)V

    goto :goto_0

    .line 210
    :cond_0
    new-instance v2, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionBaseImpl;

    iget-object v1, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionOpener$Builder;->mCaptureSessionRepository:Landroidx/camera/camera2/internal/CaptureSessionRepository;

    iget-object v3, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionOpener$Builder;->mExecutor:Ljava/util/concurrent/Executor;

    iget-object v4, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionOpener$Builder;->mScheduledExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

    iget-object v5, p0, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionOpener$Builder;->mCompatHandler:Landroid/os/Handler;

    invoke-direct {v2, v1, v3, v4, v5}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionBaseImpl;-><init>(Landroidx/camera/camera2/internal/CaptureSessionRepository;Ljava/util/concurrent/Executor;Ljava/util/concurrent/ScheduledExecutorService;Landroid/os/Handler;)V

    :goto_0
    invoke-direct {v0, v2}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionOpener;-><init>(Landroidx/camera/camera2/internal/SynchronizedCaptureSessionOpener$OpenerImpl;)V

    .line 206
    return-object v0
.end method
