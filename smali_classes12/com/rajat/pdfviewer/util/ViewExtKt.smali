.class public final Lcom/rajat/pdfviewer/util/ViewExtKt;
.super Ljava/lang/Object;
.source "ViewExt.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u001a\n\u0010\u0000\u001a\u00020\u0001*\u00020\u0002\u001a\n\u0010\u0003\u001a\u00020\u0001*\u00020\u0002\u00a8\u0006\u0004"
    }
    d2 = {
        "show",
        "",
        "Landroid/view/View;",
        "hide",
        "pdfViewer_release"
    }
    k = 0x2
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final hide(Landroid/view/View;)V
    .locals 1
    .param p0, "$this$hide"    # Landroid/view/View;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 11
    return-void
.end method

.method public static final show(Landroid/view/View;)V
    .locals 1
    .param p0, "$this$show"    # Landroid/view/View;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 7
    return-void
.end method
