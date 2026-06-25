.class public final Landroidx/camera/view/LifecycleCameraController;
.super Landroidx/camera/view/CameraController;
.source "LifecycleCameraController.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "CamLifecycleController"


# instance fields
.field private mLifecycleOwner:Landroidx/lifecycle/LifecycleOwner;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .line 72
    invoke-direct {p0, p1}, Landroidx/camera/view/CameraController;-><init>(Landroid/content/Context;)V

    .line 73
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/google/common/util/concurrent/ListenableFuture;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Landroidx/camera/view/ProcessCameraProviderWrapper;",
            ">;)V"
        }
    .end annotation

    .line 78
    .local p2, "cameraProviderFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Landroidx/camera/view/ProcessCameraProviderWrapper;>;"
    invoke-direct {p0, p1, p2}, Landroidx/camera/view/CameraController;-><init>(Landroid/content/Context;Lcom/google/common/util/concurrent/ListenableFuture;)V

    .line 79
    return-void
.end method


# virtual methods
.method public bindToLifecycle(Landroidx/lifecycle/LifecycleOwner;)V
    .locals 0
    .param p1, "lifecycleOwner"    # Landroidx/lifecycle/LifecycleOwner;

    .line 95
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 96
    iput-object p1, p0, Landroidx/camera/view/LifecycleCameraController;->mLifecycleOwner:Landroidx/lifecycle/LifecycleOwner;

    .line 97
    invoke-virtual {p0}, Landroidx/camera/view/LifecycleCameraController;->startCameraAndTrackStates()V

    .line 98
    return-void
.end method

.method shutDownForTests()V
    .locals 1

    .line 157
    iget-object v0, p0, Landroidx/camera/view/LifecycleCameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    if-eqz v0, :cond_0

    .line 158
    iget-object v0, p0, Landroidx/camera/view/LifecycleCameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    invoke-interface {v0}, Landroidx/camera/view/ProcessCameraProviderWrapper;->shutdown()Lcom/google/common/util/concurrent/ListenableFuture;

    .line 160
    :cond_0
    return-void
.end method

.method startCamera()Landroidx/camera/core/Camera;
    .locals 4

    .line 126
    iget-object v0, p0, Landroidx/camera/view/LifecycleCameraController;->mLifecycleOwner:Landroidx/lifecycle/LifecycleOwner;

    const-string v1, "CamLifecycleController"

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 127
    const-string v0, "Lifecycle is not set."

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    return-object v2

    .line 130
    :cond_0
    iget-object v0, p0, Landroidx/camera/view/LifecycleCameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    if-nez v0, :cond_1

    .line 131
    const-string v0, "CameraProvider is not ready."

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    return-object v2

    .line 135
    :cond_1
    invoke-virtual {p0}, Landroidx/camera/view/LifecycleCameraController;->createUseCaseGroup()Landroidx/camera/core/UseCaseGroup;

    move-result-object v0

    .line 136
    .local v0, "useCaseGroup":Landroidx/camera/core/UseCaseGroup;
    if-nez v0, :cond_2

    .line 138
    return-object v2

    .line 141
    :cond_2
    :try_start_0
    iget-object v1, p0, Landroidx/camera/view/LifecycleCameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    iget-object v2, p0, Landroidx/camera/view/LifecycleCameraController;->mLifecycleOwner:Landroidx/lifecycle/LifecycleOwner;

    iget-object v3, p0, Landroidx/camera/view/LifecycleCameraController;->mCameraSelector:Landroidx/camera/core/CameraSelector;

    invoke-interface {v1, v2, v3, v0}, Landroidx/camera/view/ProcessCameraProviderWrapper;->bindToLifecycle(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraSelector;Landroidx/camera/core/UseCaseGroup;)Landroidx/camera/core/Camera;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 142
    :catch_0
    move-exception v1

    .line 144
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    const-string/jumbo v2, "The selected camera does not support the enabled use cases. Please disable use case and/or select a different camera. e.g. #setVideoCaptureEnabled(false)"

    .line 148
    .local v2, "errorMessage":Ljava/lang/String;
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3, v2, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public unbind()V
    .locals 1

    .line 107
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 108
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/view/LifecycleCameraController;->mLifecycleOwner:Landroidx/lifecycle/LifecycleOwner;

    .line 109
    iput-object v0, p0, Landroidx/camera/view/LifecycleCameraController;->mCamera:Landroidx/camera/core/Camera;

    .line 110
    iget-object v0, p0, Landroidx/camera/view/LifecycleCameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    if-eqz v0, :cond_0

    .line 111
    iget-object v0, p0, Landroidx/camera/view/LifecycleCameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    invoke-interface {v0}, Landroidx/camera/view/ProcessCameraProviderWrapper;->unbindAll()V

    .line 113
    :cond_0
    return-void
.end method
