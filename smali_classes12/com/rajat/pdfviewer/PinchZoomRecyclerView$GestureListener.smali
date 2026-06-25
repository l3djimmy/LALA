.class final Lcom/rajat/pdfviewer/PinchZoomRecyclerView$GestureListener;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "PinchZoomRecyclerView.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rajat/pdfviewer/PinchZoomRecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "GestureListener"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0082\u0004\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/rajat/pdfviewer/PinchZoomRecyclerView$GestureListener;",
        "Landroid/view/GestureDetector$SimpleOnGestureListener;",
        "<init>",
        "(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)V",
        "onDoubleTap",
        "",
        "e",
        "Landroid/view/MotionEvent;",
        "pdfViewer_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;


# direct methods
.method public constructor <init>(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 394
    iput-object p1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$GestureListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onDoubleTap(Landroid/view/MotionEvent;)Z
    .locals 8
    .param p1, "e"    # Landroid/view/MotionEvent;

    const-string v0, "e"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 396
    iget-object v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$GestureListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$isZoomEnabled$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 399
    :cond_0
    nop

    .line 400
    iget-object v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$GestureListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getScaleFactor$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F

    move-result v0

    const/high16 v1, 0x3fc00000    # 1.5f

    cmpg-float v0, v0, v1

    if-gez v0, :cond_1

    goto :goto_0

    .line 401
    :cond_1
    iget-object v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$GestureListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getScaleFactor$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F

    move-result v0

    iget-object v1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$GestureListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v1}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getMaxZoom$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F

    move-result v1

    cmpg-float v0, v0, v1

    if-gez v0, :cond_2

    iget-object v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$GestureListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getMaxZoom$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F

    move-result v1

    goto :goto_0

    .line 402
    :cond_2
    const/high16 v1, 0x3f800000    # 1.0f

    .line 399
    :goto_0
    move v3, v1

    .line 404
    .local v3, "targetScale":F
    iget-object v2, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$GestureListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    iget-object v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$GestureListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getZoomDuration$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)J

    move-result-wide v6

    invoke-static/range {v2 .. v7}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$zoomTo(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;FFFJ)V

    .line 405
    const/4 v0, 0x1

    return v0
.end method
