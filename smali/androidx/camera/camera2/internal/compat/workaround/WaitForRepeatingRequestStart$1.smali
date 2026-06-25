.class Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart$1;
.super Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.source "WaitForRepeatingRequestStart.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;


# direct methods
.method constructor <init>(Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;

    .line 138
    iput-object p1, p0, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart$1;->this$0:Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;

    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onCaptureSequenceAborted(Landroid/hardware/camera2/CameraCaptureSession;I)V
    .locals 2
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
    .param p2, "sequenceId"    # I

    .line 151
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart$1;->this$0:Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;

    iget-object v0, v0, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;->mStartStreamingCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    if-eqz v0, :cond_0

    .line 152
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart$1;->this$0:Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;

    iget-object v0, v0, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;->mStartStreamingCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    invoke-virtual {v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setCancelled()Z

    .line 153
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart$1;->this$0:Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;

    const/4 v1, 0x0

    iput-object v1, v0, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;->mStartStreamingCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 155
    :cond_0
    return-void
.end method

.method public onCaptureStarted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;JJ)V
    .locals 2
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
    .param p2, "request"    # Landroid/hardware/camera2/CaptureRequest;
    .param p3, "timestamp"    # J
    .param p5, "frameNumber"    # J

    .line 142
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart$1;->this$0:Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;

    iget-object v0, v0, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;->mStartStreamingCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    if-eqz v0, :cond_0

    .line 143
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart$1;->this$0:Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;

    iget-object v0, v0, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;->mStartStreamingCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 144
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart$1;->this$0:Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;

    iput-object v1, v0, Landroidx/camera/camera2/internal/compat/workaround/WaitForRepeatingRequestStart;->mStartStreamingCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 146
    :cond_0
    return-void
.end method
