.class Landroidx/camera/camera2/internal/Camera2RequestProcessor$Camera2CallbackWrapper;
.super Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.source "Camera2RequestProcessor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/camera2/internal/Camera2RequestProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Camera2CallbackWrapper"
.end annotation


# instance fields
.field private final mCallback:Landroidx/camera/core/impl/RequestProcessor$Callback;

.field private final mInvokeSequenceCallback:Z

.field private final mRequest:Landroidx/camera/core/impl/RequestProcessor$Request;

.field final synthetic this$0:Landroidx/camera/camera2/internal/Camera2RequestProcessor;


# direct methods
.method constructor <init>(Landroidx/camera/camera2/internal/Camera2RequestProcessor;Landroidx/camera/core/impl/RequestProcessor$Request;Landroidx/camera/core/impl/RequestProcessor$Callback;Z)V
    .locals 0
    .param p2, "captureRequest"    # Landroidx/camera/core/impl/RequestProcessor$Request;
    .param p3, "callback"    # Landroidx/camera/core/impl/RequestProcessor$Callback;
    .param p4, "invokeSequenceCallback"    # Z

    .line 225
    iput-object p1, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor$Camera2CallbackWrapper;->this$0:Landroidx/camera/camera2/internal/Camera2RequestProcessor;

    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;-><init>()V

    .line 226
    iput-object p3, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor$Camera2CallbackWrapper;->mCallback:Landroidx/camera/core/impl/RequestProcessor$Callback;

    .line 227
    iput-object p2, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor$Camera2CallbackWrapper;->mRequest:Landroidx/camera/core/impl/RequestProcessor$Request;

    .line 228
    iput-boolean p4, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor$Camera2CallbackWrapper;->mInvokeSequenceCallback:Z

    .line 229
    return-void
.end method


# virtual methods
.method public onCaptureBufferLost(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/view/Surface;J)V
    .locals 3
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
    .param p2, "request"    # Landroid/hardware/camera2/CaptureRequest;
    .param p3, "target"    # Landroid/view/Surface;
    .param p4, "frameNumber"    # J

    .line 275
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor$Camera2CallbackWrapper;->mCallback:Landroidx/camera/core/impl/RequestProcessor$Callback;

    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor$Camera2CallbackWrapper;->mRequest:Landroidx/camera/core/impl/RequestProcessor$Request;

    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor$Camera2CallbackWrapper;->this$0:Landroidx/camera/camera2/internal/Camera2RequestProcessor;

    .line 276
    invoke-virtual {v2, p3}, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->findOutputConfigId(Landroid/view/Surface;)I

    move-result v2

    .line 275
    invoke-interface {v0, v1, p4, p5, v2}, Landroidx/camera/core/impl/RequestProcessor$Callback;->onCaptureBufferLost(Landroidx/camera/core/impl/RequestProcessor$Request;JI)V

    .line 277
    return-void
.end method

.method public onCaptureCompleted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/TotalCaptureResult;)V
    .locals 3
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
    .param p2, "request"    # Landroid/hardware/camera2/CaptureRequest;
    .param p3, "result"    # Landroid/hardware/camera2/TotalCaptureResult;

    .line 246
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor$Camera2CallbackWrapper;->mCallback:Landroidx/camera/core/impl/RequestProcessor$Callback;

    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor$Camera2CallbackWrapper;->mRequest:Landroidx/camera/core/impl/RequestProcessor$Request;

    new-instance v2, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;

    invoke-direct {v2, p3}, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;-><init>(Landroid/hardware/camera2/CaptureResult;)V

    invoke-interface {v0, v1, v2}, Landroidx/camera/core/impl/RequestProcessor$Callback;->onCaptureCompleted(Landroidx/camera/core/impl/RequestProcessor$Request;Landroidx/camera/core/impl/CameraCaptureResult;)V

    .line 247
    return-void
.end method

.method public onCaptureFailed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureFailure;)V
    .locals 4
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
    .param p2, "request"    # Landroid/hardware/camera2/CaptureRequest;
    .param p3, "failure"    # Landroid/hardware/camera2/CaptureFailure;

    .line 252
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor$Camera2CallbackWrapper;->mCallback:Landroidx/camera/core/impl/RequestProcessor$Callback;

    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor$Camera2CallbackWrapper;->mRequest:Landroidx/camera/core/impl/RequestProcessor$Request;

    new-instance v2, Landroidx/camera/camera2/internal/Camera2CameraCaptureFailure;

    sget-object v3, Landroidx/camera/core/impl/CameraCaptureFailure$Reason;->ERROR:Landroidx/camera/core/impl/CameraCaptureFailure$Reason;

    invoke-direct {v2, v3, p3}, Landroidx/camera/camera2/internal/Camera2CameraCaptureFailure;-><init>(Landroidx/camera/core/impl/CameraCaptureFailure$Reason;Landroid/hardware/camera2/CaptureFailure;)V

    invoke-interface {v0, v1, v2}, Landroidx/camera/core/impl/RequestProcessor$Callback;->onCaptureFailed(Landroidx/camera/core/impl/RequestProcessor$Request;Landroidx/camera/core/impl/CameraCaptureFailure;)V

    .line 254
    return-void
.end method

.method public onCaptureProgressed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureResult;)V
    .locals 3
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
    .param p2, "request"    # Landroid/hardware/camera2/CaptureRequest;
    .param p3, "partialResult"    # Landroid/hardware/camera2/CaptureResult;

    .line 240
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor$Camera2CallbackWrapper;->mCallback:Landroidx/camera/core/impl/RequestProcessor$Callback;

    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor$Camera2CallbackWrapper;->mRequest:Landroidx/camera/core/impl/RequestProcessor$Request;

    new-instance v2, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;

    invoke-direct {v2, p3}, Landroidx/camera/camera2/internal/Camera2CameraCaptureResult;-><init>(Landroid/hardware/camera2/CaptureResult;)V

    invoke-interface {v0, v1, v2}, Landroidx/camera/core/impl/RequestProcessor$Callback;->onCaptureProgressed(Landroidx/camera/core/impl/RequestProcessor$Request;Landroidx/camera/core/impl/CameraCaptureResult;)V

    .line 241
    return-void
.end method

.method public onCaptureSequenceAborted(Landroid/hardware/camera2/CameraCaptureSession;I)V
    .locals 1
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
    .param p2, "sequenceId"    # I

    .line 267
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor$Camera2CallbackWrapper;->mInvokeSequenceCallback:Z

    if-eqz v0, :cond_0

    .line 268
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor$Camera2CallbackWrapper;->mCallback:Landroidx/camera/core/impl/RequestProcessor$Callback;

    invoke-interface {v0, p2}, Landroidx/camera/core/impl/RequestProcessor$Callback;->onCaptureSequenceAborted(I)V

    .line 270
    :cond_0
    return-void
.end method

.method public onCaptureSequenceCompleted(Landroid/hardware/camera2/CameraCaptureSession;IJ)V
    .locals 1
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
    .param p2, "sequenceId"    # I
    .param p3, "frameNumber"    # J

    .line 259
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor$Camera2CallbackWrapper;->mInvokeSequenceCallback:Z

    if-eqz v0, :cond_0

    .line 260
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor$Camera2CallbackWrapper;->mCallback:Landroidx/camera/core/impl/RequestProcessor$Callback;

    invoke-interface {v0, p2, p3, p4}, Landroidx/camera/core/impl/RequestProcessor$Callback;->onCaptureSequenceCompleted(IJ)V

    .line 262
    :cond_0
    return-void
.end method

.method public onCaptureStarted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;JJ)V
    .locals 6
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
    .param p2, "request"    # Landroid/hardware/camera2/CaptureRequest;
    .param p3, "timestamp"    # J
    .param p5, "frameNumber"    # J

    .line 234
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor$Camera2CallbackWrapper;->mCallback:Landroidx/camera/core/impl/RequestProcessor$Callback;

    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2RequestProcessor$Camera2CallbackWrapper;->mRequest:Landroidx/camera/core/impl/RequestProcessor$Request;

    move-wide v4, p3

    move-wide v2, p5

    .end local p3    # "timestamp":J
    .end local p5    # "frameNumber":J
    .local v2, "frameNumber":J
    .local v4, "timestamp":J
    invoke-interface/range {v0 .. v5}, Landroidx/camera/core/impl/RequestProcessor$Callback;->onCaptureStarted(Landroidx/camera/core/impl/RequestProcessor$Request;JJ)V

    .line 235
    return-void
.end method
