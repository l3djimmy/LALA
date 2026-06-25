.class public abstract Landroidx/camera/core/impl/CameraCaptureCallback;
.super Ljava/lang/Object;
.source "CameraCaptureCallback.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCaptureCancelled()V
    .locals 0

    .line 55
    return-void
.end method

.method public onCaptureCompleted(Landroidx/camera/core/impl/CameraCaptureResult;)V
    .locals 0
    .param p1, "cameraCaptureResult"    # Landroidx/camera/core/impl/CameraCaptureResult;

    .line 37
    return-void
.end method

.method public onCaptureFailed(Landroidx/camera/core/impl/CameraCaptureFailure;)V
    .locals 0
    .param p1, "failure"    # Landroidx/camera/core/impl/CameraCaptureFailure;

    .line 46
    return-void
.end method
