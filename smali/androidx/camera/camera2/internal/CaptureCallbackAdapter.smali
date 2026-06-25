.class final Landroidx/camera/camera2/internal/CaptureCallbackAdapter;
.super Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.source "CaptureCallbackAdapter.java"


# instance fields
.field private final mCameraCaptureCallback:Landroidx/camera/core/impl/CameraCaptureCallback;


# direct methods
.method constructor <init>(Landroidx/camera/core/impl/CameraCaptureCallback;)V
    .locals 2
    .param p1, "cameraCaptureCallback"    # Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 40
    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;-><init>()V

    .line 41
    if-eqz p1, :cond_0

    .line 44
    iput-object p1, p0, Landroidx/camera/camera2/internal/CaptureCallbackAdapter;->mCameraCaptureCallback:Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 45
    return-void

    .line 42
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "cameraCaptureCallback is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public onCaptureCompleted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/TotalCaptureResult;)V
    .locals 4
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
    .param p2, "request"    # Landroid/hardware/camera2/CaptureRequest;
    .param p3, "result"    # Landroid/hardware/camera2/TotalCaptureResult;

    .line 52
    invoke-super {p0, p1, p2, p3}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureCompleted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/TotalCaptureResult;)V

    .line 54
    invoke-virtual {p2}, Landroid/hardware/camera2/CaptureRequest;->getTag()Ljava/lang/Object;

    move-result-object v0

    .line 59
    .local v0, "captureRequestTag":Ljava/lang/Object;
    if-eqz v0, :cond_0

    .line 60
    instance-of v1, v0, Landroidx/camera/core/impl/TagBundle;

    const-string/jumbo v2, "The tagBundle object from the CaptureResult is not a TagBundle object."

    invoke-static {v1, v2}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 63
    move-object v1, v0

    check-cast v1, Landroidx/camera/core/impl/TagBundle;

    .local v1, "tagBundle":Landroidx/camera/core/impl/TagBundle;
    goto :goto_0

    .line 65
    .end local v1    # "tagBundle":Landroidx/camera/core/impl/TagBundle;
    :cond_0
    invoke-static {}, Landroidx/camera/core/impl/TagBundle;->emptyBundle()Landroidx/camera/core/impl/TagBundle;

    move-result-object v1

    .line 67
    .restart local v1    # "tagBundle":Landroidx/camera/core/impl/TagBundle;
    :goto_0
    iget-object v2, p0, Landroidx/camera/camera2/internal/CaptureCallbackAdapter;->mCameraCaptureCallback:Landroidx/camera/core/impl/CameraCaptureCallback;

    new-instance v3, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;

    invoke-direct {v3, v1, p3}, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;-><init>(Landroidx/camera/core/impl/TagBundle;Landroid/hardware/camera2/CaptureResult;)V

    invoke-virtual {v2, v3}, Landroidx/camera/core/impl/CameraCaptureCallback;->onCaptureCompleted(Landroidx/camera/core/impl/CameraCaptureResult;)V

    .line 69
    return-void
.end method

.method public onCaptureFailed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureFailure;)V
    .locals 2
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
    .param p2, "request"    # Landroid/hardware/camera2/CaptureRequest;
    .param p3, "failure"    # Landroid/hardware/camera2/CaptureFailure;

    .line 76
    invoke-super {p0, p1, p2, p3}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureFailed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureFailure;)V

    .line 78
    new-instance v0, Landroidx/camera/core/impl/CameraCaptureFailure;

    sget-object v1, Landroidx/camera/core/impl/CameraCaptureFailure$Reason;->ERROR:Landroidx/camera/core/impl/CameraCaptureFailure$Reason;

    invoke-direct {v0, v1}, Landroidx/camera/core/impl/CameraCaptureFailure;-><init>(Landroidx/camera/core/impl/CameraCaptureFailure$Reason;)V

    .line 81
    .local v0, "cameraFailure":Landroidx/camera/core/impl/CameraCaptureFailure;
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureCallbackAdapter;->mCameraCaptureCallback:Landroidx/camera/core/impl/CameraCaptureCallback;

    invoke-virtual {v1, v0}, Landroidx/camera/core/impl/CameraCaptureCallback;->onCaptureFailed(Landroidx/camera/core/impl/CameraCaptureFailure;)V

    .line 82
    return-void
.end method
