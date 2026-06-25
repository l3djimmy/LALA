.class public interface abstract Landroidx/camera/core/impl/SessionProcessor$CaptureCallback;
.super Ljava/lang/Object;
.source "SessionProcessor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/impl/SessionProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "CaptureCallback"
.end annotation


# virtual methods
.method public onCaptureCompleted(JILjava/util/Map;)V
    .locals 0
    .param p1, "timestamp"    # J
    .param p3, "captureSequenceId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JI",
            "Ljava/util/Map<",
            "Landroid/hardware/camera2/CaptureResult$Key;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 243
    .local p4, "result":Ljava/util/Map;, "Ljava/util/Map<Landroid/hardware/camera2/CaptureResult$Key;Ljava/lang/Object;>;"
    return-void
.end method

.method public onCaptureFailed(I)V
    .locals 0
    .param p1, "captureSequenceId"    # I

    .line 198
    return-void
.end method

.method public onCaptureProcessStarted(I)V
    .locals 0
    .param p1, "captureSequenceId"    # I

    .line 189
    return-void
.end method

.method public onCaptureSequenceAborted(I)V
    .locals 0
    .param p1, "captureSequenceId"    # I

    .line 218
    return-void
.end method

.method public onCaptureSequenceCompleted(I)V
    .locals 0
    .param p1, "captureSequenceId"    # I

    .line 211
    return-void
.end method

.method public onCaptureStarted(IJ)V
    .locals 0
    .param p1, "captureSequenceId"    # I
    .param p2, "timestamp"    # J

    .line 181
    return-void
.end method
