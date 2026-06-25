.class final Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;
.super Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;
.source "PinchZoomRecyclerView.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rajat/pdfviewer/PinchZoomRecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ScaleListener"
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPinchZoomRecyclerView.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PinchZoomRecyclerView.kt\ncom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,477:1\n1#2:478\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\u0008\u0082\u0004\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J\u0010\u0010\u0008\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J\u0010\u0010\t\u001a\u00020\n2\u0006\u0010\u0006\u001a\u00020\u0007H\u0016\u00a8\u0006\u000b"
    }
    d2 = {
        "Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;",
        "Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;",
        "<init>",
        "(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)V",
        "onScaleBegin",
        "",
        "detector",
        "Landroid/view/ScaleGestureDetector;",
        "onScale",
        "onScaleEnd",
        "",
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

    .line 247
    iput-object p1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-direct {p0}, Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .locals 7
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    const-string v0, "detector"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 267
    iget-object v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getIgnoreScaleAfterPointerUp$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 268
    :cond_0
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getCurrentSpan()F

    move-result v0

    iget-object v2, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v2}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getPinchStartSpan$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F

    move-result v2

    div-float/2addr v0, v2

    .line 269
    .local v0, "spanRatio":F
    const v2, 0x3f7ae148    # 0.98f

    cmpg-float v2, v2, v0

    const/4 v3, 0x0

    if-gtz v2, :cond_1

    const v2, 0x3f828f5c    # 1.02f

    cmpg-float v2, v0, v2

    if-gtz v2, :cond_1

    move v2, v1

    goto :goto_0

    :cond_1
    move v2, v3

    :goto_0
    if-eqz v2, :cond_2

    return v1

    .line 271
    :cond_2
    iget-object v2, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v2}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getPinchStartScale$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F

    move-result v2

    mul-float/2addr v2, v0

    iget-object v4, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v4}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getMaxZoom$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F

    move-result v4

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-static {v2, v5, v4}, Lkotlin/ranges/RangesKt;->coerceIn(FFF)F

    move-result v2

    .line 272
    .local v2, "newScale":F
    iget-object v4, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v4}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getScaleFactor$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F

    move-result v4

    cmpg-float v4, v2, v4

    if-nez v4, :cond_3

    move v3, v1

    :cond_3
    if-nez v3, :cond_5

    .line 273
    iget-object v3, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v3, v2}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$setScaleFactor$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;F)V

    .line 275
    iget-object v3, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    iget-object v4, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v4}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getPinchStartFocusX$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F

    move-result v4

    iget-object v5, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v5}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getPinchContentFocusX$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F

    move-result v5

    iget-object v6, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v6}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getScaleFactor$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F

    move-result v6

    mul-float/2addr v5, v6

    sub-float/2addr v4, v5

    invoke-static {v3, v4}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$setPosX$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;F)V

    .line 276
    iget-object v3, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v3}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$isSinglePage(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)Z

    move-result v3

    .line 279
    iget-object v4, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    .line 276
    if-eqz v3, :cond_4

    .line 277
    iget-object v3, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v3}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getPinchStartFocusY$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F

    move-result v3

    iget-object v5, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v5}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getPinchContentFocusY$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F

    move-result v5

    iget-object v6, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v6}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getScaleFactor$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F

    move-result v6

    mul-float/2addr v5, v6

    sub-float/2addr v3, v5

    invoke-static {v4, v3}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$setPosY$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;F)V

    goto :goto_1

    .line 279
    :cond_4
    invoke-static {v4}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getPinchContentFocusY$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F

    move-result v3

    iget-object v4, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v4}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getScaleFactor$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F

    move-result v4

    mul-float/2addr v3, v4

    iget-object v4, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v4}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getPinchStartFocusY$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F

    move-result v4

    sub-float/2addr v3, v4

    .line 280
    .local v3, "desiredVisualOffset":F
    iget-object v4, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v4}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getCurrentMultiPageVisualOffset(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F

    move-result v4

    sub-float v4, v3, v4

    .line 281
    .local v4, "visualDelta":F
    iget-object v5, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v5, v4}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$applyMultiPageVisualOffsetDelta(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;F)V

    .line 284
    .end local v3    # "desiredVisualOffset":F
    .end local v4    # "visualDelta":F
    :goto_1
    iget-object v3, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v3}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$clampPosition(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)V

    .line 285
    iget-object v3, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-virtual {v3}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->invalidate()V

    .line 286
    iget-object v3, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v3}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$awakenScrollBars(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)Z

    .line 288
    iget-object v3, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v3}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getZoomChangeListener$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)Lkotlin/jvm/functions/Function2;

    move-result-object v3

    if-eqz v3, :cond_5

    iget-object v4, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-virtual {v4}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->isZoomedIn()Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    iget-object v5, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v5}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getScaleFactor$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F

    move-result v5

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 291
    :cond_5
    return v1
.end method

.method public onScaleBegin(Landroid/view/ScaleGestureDetector;)Z
    .locals 8
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    const-string v0, "detector"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 249
    iget-object v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$setZoomingInProgress$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;Z)V

    .line 250
    iget-object v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$setIgnoreScaleAfterPointerUp$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;Z)V

    .line 251
    iget-object v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    iget-object v3, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v3}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getScaleFactor$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F

    move-result v3

    invoke-static {v0, v3}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$setPinchStartScale$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;F)V

    .line 252
    iget-object v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getCurrentSpan()F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->floatValue()F

    move-result v4

    .line 478
    nop

    .local v4, "it":F
    const/4 v5, 0x0

    .line 252
    .local v5, "$i$a$-takeIf-PinchZoomRecyclerView$ScaleListener$onScaleBegin$1":I
    const/4 v6, 0x0

    cmpl-float v7, v4, v6

    if-lez v7, :cond_0

    move v2, v1

    .end local v4    # "it":F
    .end local v5    # "$i$a$-takeIf-PinchZoomRecyclerView$ScaleListener$onScaleBegin$1":I
    :cond_0
    if-eqz v2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    :goto_0
    if-eqz v3, :cond_2

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v2

    goto :goto_1

    :cond_2
    const/high16 v2, 0x3f800000    # 1.0f

    :goto_1
    invoke-static {v0, v2}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$setPinchStartSpan$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;F)V

    .line 253
    iget-object v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusX()F

    move-result v2

    invoke-static {v0, v2}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$setPinchStartFocusX$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;F)V

    .line 254
    iget-object v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    move-result v2

    invoke-static {v0, v2}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$setPinchStartFocusY$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;F)V

    .line 255
    iget-object v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v0, v6}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$setMultiPageScrollResidualY$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;F)V

    .line 256
    iget-object v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    iget-object v2, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v2}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getPinchStartFocusX$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F

    move-result v2

    iget-object v3, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v3}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getPosX$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F

    move-result v3

    sub-float/2addr v2, v3

    iget-object v3, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v3}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getScaleFactor$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F

    move-result v3

    div-float/2addr v2, v3

    invoke-static {v0, v2}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$setPinchContentFocusX$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;F)V

    .line 257
    iget-object v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    iget-object v2, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v2}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$isSinglePage(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)Z

    move-result v2

    .line 260
    iget-object v3, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    .line 257
    if-eqz v2, :cond_3

    .line 258
    invoke-static {v3}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getPinchStartFocusY$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F

    move-result v2

    iget-object v3, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v3}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getPosY$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F

    move-result v3

    sub-float/2addr v2, v3

    iget-object v3, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v3}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getScaleFactor$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F

    move-result v3

    div-float/2addr v2, v3

    goto :goto_2

    .line 260
    :cond_3
    invoke-static {v3}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getCurrentMultiPageVisualOffset(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F

    move-result v2

    iget-object v3, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v3}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getPinchStartFocusY$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F

    move-result v3

    add-float/2addr v2, v3

    iget-object v3, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v3}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getScaleFactor$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F

    move-result v3

    div-float/2addr v2, v3

    .line 257
    :goto_2
    invoke-static {v0, v2}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$setPinchContentFocusY$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;F)V

    .line 262
    iget-object v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-virtual {v0, v1}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->suppressLayout(Z)V

    .line 263
    return v1
.end method

.method public onScaleEnd(Landroid/view/ScaleGestureDetector;)V
    .locals 2
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    const-string v0, "detector"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 295
    iget-object v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$setZoomingInProgress$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;Z)V

    .line 296
    iget-object v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v0, v1}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$setIgnoreScaleAfterPointerUp$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;Z)V

    .line 297
    iget-object v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-virtual {v0, v1}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->suppressLayout(Z)V

    .line 298
    iget-object v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getZoomEndListener$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)Lkotlin/jvm/functions/Function1;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v1}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getScaleFactor$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 299
    :cond_0
    return-void
.end method
