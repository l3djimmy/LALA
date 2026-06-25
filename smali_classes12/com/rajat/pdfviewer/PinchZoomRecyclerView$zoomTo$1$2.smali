.class public final Lcom/rajat/pdfviewer/PinchZoomRecyclerView$zoomTo$1$2;
.super Landroid/animation/AnimatorListenerAdapter;
.source "PinchZoomRecyclerView.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->zoomTo(FFFJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0016\u00a8\u0006\u0006"
    }
    d2 = {
        "com/rajat/pdfviewer/PinchZoomRecyclerView$zoomTo$1$2",
        "Landroid/animation/AnimatorListenerAdapter;",
        "onAnimationEnd",
        "",
        "animation",
        "Landroid/animation/Animator;",
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
.method constructor <init>(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)V
    .locals 0
    .param p1, "$receiver"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    iput-object p1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$zoomTo$1$2;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    .line 460
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    const-string v0, "animation"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 462
    iget-object v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$zoomTo$1$2;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getZoomEndListener$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)Lkotlin/jvm/functions/Function1;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$zoomTo$1$2;->this$0:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-static {v1}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->access$getScaleFactor$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 463
    :cond_0
    return-void
.end method
