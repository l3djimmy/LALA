.class final Landroidx/camera/camera2/internal/Camera2CaptureCallbacks$ComboSessionCaptureCallback;
.super Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.source "Camera2CaptureCallbacks.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/camera2/internal/Camera2CaptureCallbacks;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ComboSessionCaptureCallback"
.end annotation


# instance fields
.field private final mCallbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;",
            ">;)V"
        }
    .end annotation

    .line 113
    .local p1, "callbacks":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;>;"
    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;-><init>()V

    .line 111
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2CaptureCallbacks$ComboSessionCaptureCallback;->mCallbacks:Ljava/util/List;

    .line 114
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 116
    .local v1, "callback":Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    instance-of v2, v1, Landroidx/camera/camera2/internal/Camera2CaptureCallbacks$NoOpSessionCaptureCallback;

    if-nez v2, :cond_0

    .line 117
    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2CaptureCallbacks$ComboSessionCaptureCallback;->mCallbacks:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 119
    .end local v1    # "callback":Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    :cond_0
    goto :goto_0

    .line 120
    :cond_1
    return-void
.end method


# virtual methods
.method public onCaptureBufferLost(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/view/Surface;J)V
    .locals 8
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
    .param p2, "request"    # Landroid/hardware/camera2/CaptureRequest;
    .param p3, "surface"    # Landroid/view/Surface;
    .param p4, "frame"    # J

    .line 127
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CaptureCallbacks$ComboSessionCaptureCallback;->mCallbacks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 128
    .local v2, "callback":Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-wide v6, p4

    .end local p1    # "session":Landroid/hardware/camera2/CameraCaptureSession;
    .end local p2    # "request":Landroid/hardware/camera2/CaptureRequest;
    .end local p3    # "surface":Landroid/view/Surface;
    .end local p4    # "frame":J
    .local v3, "session":Landroid/hardware/camera2/CameraCaptureSession;
    .local v4, "request":Landroid/hardware/camera2/CaptureRequest;
    .local v5, "surface":Landroid/view/Surface;
    .local v6, "frame":J
    invoke-static/range {v2 .. v7}, Landroidx/camera/camera2/internal/compat/ApiCompat$Api24Impl;->onCaptureBufferLost(Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/view/Surface;J)V

    .line 129
    .end local v2    # "callback":Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    goto :goto_0

    .line 130
    .end local v3    # "session":Landroid/hardware/camera2/CameraCaptureSession;
    .end local v4    # "request":Landroid/hardware/camera2/CaptureRequest;
    .end local v5    # "surface":Landroid/view/Surface;
    .end local v6    # "frame":J
    .restart local p1    # "session":Landroid/hardware/camera2/CameraCaptureSession;
    .restart local p2    # "request":Landroid/hardware/camera2/CaptureRequest;
    .restart local p3    # "surface":Landroid/view/Surface;
    .restart local p4    # "frame":J
    :cond_0
    return-void
.end method

.method public onCaptureCompleted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/TotalCaptureResult;)V
    .locals 2
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
    .param p2, "request"    # Landroid/hardware/camera2/CaptureRequest;
    .param p3, "result"    # Landroid/hardware/camera2/TotalCaptureResult;

    .line 136
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CaptureCallbacks$ComboSessionCaptureCallback;->mCallbacks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 137
    .local v1, "callback":Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    invoke-virtual {v1, p1, p2, p3}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureCompleted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/TotalCaptureResult;)V

    .line 138
    .end local v1    # "callback":Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    goto :goto_0

    .line 139
    :cond_0
    return-void
.end method

.method public onCaptureFailed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureFailure;)V
    .locals 2
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
    .param p2, "request"    # Landroid/hardware/camera2/CaptureRequest;
    .param p3, "failure"    # Landroid/hardware/camera2/CaptureFailure;

    .line 145
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CaptureCallbacks$ComboSessionCaptureCallback;->mCallbacks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 146
    .local v1, "callback":Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    invoke-virtual {v1, p1, p2, p3}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureFailed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureFailure;)V

    .line 147
    .end local v1    # "callback":Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    goto :goto_0

    .line 148
    :cond_0
    return-void
.end method

.method public onCaptureProgressed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureResult;)V
    .locals 2
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
    .param p2, "request"    # Landroid/hardware/camera2/CaptureRequest;
    .param p3, "partialResult"    # Landroid/hardware/camera2/CaptureResult;

    .line 154
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CaptureCallbacks$ComboSessionCaptureCallback;->mCallbacks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 155
    .local v1, "callback":Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    invoke-virtual {v1, p1, p2, p3}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureProgressed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureResult;)V

    .line 156
    .end local v1    # "callback":Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    goto :goto_0

    .line 157
    :cond_0
    return-void
.end method

.method public onCaptureSequenceAborted(Landroid/hardware/camera2/CameraCaptureSession;I)V
    .locals 2
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
    .param p2, "sequenceId"    # I

    .line 162
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CaptureCallbacks$ComboSessionCaptureCallback;->mCallbacks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 163
    .local v1, "callback":Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    invoke-virtual {v1, p1, p2}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureSequenceAborted(Landroid/hardware/camera2/CameraCaptureSession;I)V

    .line 164
    .end local v1    # "callback":Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    goto :goto_0

    .line 165
    :cond_0
    return-void
.end method

.method public onCaptureSequenceCompleted(Landroid/hardware/camera2/CameraCaptureSession;IJ)V
    .locals 2
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
    .param p2, "sequenceId"    # I
    .param p3, "frame"    # J

    .line 170
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CaptureCallbacks$ComboSessionCaptureCallback;->mCallbacks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 171
    .local v1, "callback":Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    invoke-virtual {v1, p1, p2, p3, p4}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureSequenceCompleted(Landroid/hardware/camera2/CameraCaptureSession;IJ)V

    .line 172
    .end local v1    # "callback":Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    goto :goto_0

    .line 173
    :cond_0
    return-void
.end method

.method public onCaptureStarted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;JJ)V
    .locals 9
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
    .param p2, "request"    # Landroid/hardware/camera2/CaptureRequest;
    .param p3, "timestamp"    # J
    .param p5, "frame"    # J

    .line 179
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2CaptureCallbacks$ComboSessionCaptureCallback;->mCallbacks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 180
    .local v2, "callback":Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    move-object v3, p1

    move-object v4, p2

    move-wide v5, p3

    move-wide v7, p5

    .end local p1    # "session":Landroid/hardware/camera2/CameraCaptureSession;
    .end local p2    # "request":Landroid/hardware/camera2/CaptureRequest;
    .end local p3    # "timestamp":J
    .end local p5    # "frame":J
    .local v3, "session":Landroid/hardware/camera2/CameraCaptureSession;
    .local v4, "request":Landroid/hardware/camera2/CaptureRequest;
    .local v5, "timestamp":J
    .local v7, "frame":J
    invoke-virtual/range {v2 .. v8}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureStarted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;JJ)V

    .line 181
    .end local v2    # "callback":Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    goto :goto_0

    .line 182
    .end local v3    # "session":Landroid/hardware/camera2/CameraCaptureSession;
    .end local v4    # "request":Landroid/hardware/camera2/CaptureRequest;
    .end local v5    # "timestamp":J
    .end local v7    # "frame":J
    .restart local p1    # "session":Landroid/hardware/camera2/CameraCaptureSession;
    .restart local p2    # "request":Landroid/hardware/camera2/CaptureRequest;
    .restart local p3    # "timestamp":J
    .restart local p5    # "frame":J
    :cond_0
    return-void
.end method
