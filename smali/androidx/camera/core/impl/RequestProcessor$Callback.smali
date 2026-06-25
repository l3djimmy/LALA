.class public interface abstract Landroidx/camera/core/impl/RequestProcessor$Callback;
.super Ljava/lang/Object;
.source "RequestProcessor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/impl/RequestProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Callback"
.end annotation


# virtual methods
.method public onCaptureBufferLost(Landroidx/camera/core/impl/RequestProcessor$Request;JI)V
    .locals 0
    .param p1, "request"    # Landroidx/camera/core/impl/RequestProcessor$Request;
    .param p2, "frameNumber"    # J
    .param p4, "outputConfigId"    # I

    .line 120
    return-void
.end method

.method public onCaptureCompleted(Landroidx/camera/core/impl/RequestProcessor$Request;Landroidx/camera/core/impl/CameraCaptureResult;)V
    .locals 0
    .param p1, "request"    # Landroidx/camera/core/impl/RequestProcessor$Request;
    .param p2, "captureResult"    # Landroidx/camera/core/impl/CameraCaptureResult;

    .line 111
    return-void
.end method

.method public onCaptureFailed(Landroidx/camera/core/impl/RequestProcessor$Request;Landroidx/camera/core/impl/CameraCaptureFailure;)V
    .locals 0
    .param p1, "request"    # Landroidx/camera/core/impl/RequestProcessor$Request;
    .param p2, "captureFailure"    # Landroidx/camera/core/impl/CameraCaptureFailure;

    .line 115
    return-void
.end method

.method public onCaptureProgressed(Landroidx/camera/core/impl/RequestProcessor$Request;Landroidx/camera/core/impl/CameraCaptureResult;)V
    .locals 0
    .param p1, "request"    # Landroidx/camera/core/impl/RequestProcessor$Request;
    .param p2, "captureResult"    # Landroidx/camera/core/impl/CameraCaptureResult;

    .line 107
    return-void
.end method

.method public onCaptureSequenceAborted(I)V
    .locals 0
    .param p1, "sequenceId"    # I

    .line 124
    return-void
.end method

.method public onCaptureSequenceCompleted(IJ)V
    .locals 0
    .param p1, "sequenceId"    # I
    .param p2, "frameNumber"    # J

    .line 122
    return-void
.end method

.method public onCaptureStarted(Landroidx/camera/core/impl/RequestProcessor$Request;JJ)V
    .locals 0
    .param p1, "request"    # Landroidx/camera/core/impl/RequestProcessor$Request;
    .param p2, "frameNumber"    # J
    .param p4, "timestamp"    # J

    .line 103
    return-void
.end method
