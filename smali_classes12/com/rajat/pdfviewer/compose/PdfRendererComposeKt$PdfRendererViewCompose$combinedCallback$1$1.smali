.class public final Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;
.super Ljava/lang/Object;
.source "PdfRendererCompose.kt"

# interfaces
.implements Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt;->PdfRendererViewCompose(Lcom/rajat/pdfviewer/util/PdfSource;Landroidx/compose/ui/Modifier;Lcom/rajat/pdfviewer/HeaderData;Lcom/rajat/pdfviewer/util/CacheStrategy;FLandroidx/lifecycle/LifecycleOwner;Ljava/lang/Integer;Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPdfRendererCompose.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PdfRendererCompose.kt\ncom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,129:1\n1#2:130\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00001\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0004\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u0003\n\u0002\u0008\u0005*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H\u0016J\'\u0010\u0004\u001a\u00020\u00032\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00082\u0008\u0010\t\u001a\u0004\u0018\u00010\u0008H\u0016\u00a2\u0006\u0002\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u00032\u0006\u0010\u000c\u001a\u00020\rH\u0016J\u0010\u0010\u000e\u001a\u00020\u00032\u0006\u0010\u000f\u001a\u00020\u0010H\u0016J\u0018\u0010\u0011\u001a\u00020\u00032\u0006\u0010\u0012\u001a\u00020\u00062\u0006\u0010\u0013\u001a\u00020\u0006H\u0016J\u0008\u0010\u0014\u001a\u00020\u0003H\u0016\u00a8\u0006\u0015"
    }
    d2 = {
        "com/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1",
        "Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;",
        "onPdfLoadStart",
        "",
        "onPdfLoadProgress",
        "progress",
        "",
        "downloadedBytes",
        "",
        "totalBytes",
        "(IJLjava/lang/Long;)V",
        "onPdfLoadSuccess",
        "absolutePath",
        "",
        "onError",
        "error",
        "",
        "onPageChanged",
        "currentPage",
        "totalPage",
        "onPdfRenderSuccess",
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
.field final synthetic $jumpToPage:Ljava/lang/Integer;

.field final synthetic $onReady:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "Lcom/rajat/pdfviewer/PdfRendererView;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $pdfViewRef:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Lcom/rajat/pdfviewer/PdfRendererView;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $statusCallBack:Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;


# direct methods
.method constructor <init>(Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;Landroidx/compose/runtime/MutableState;Ljava/lang/Integer;Lkotlin/jvm/functions/Function1;)V
    .locals 0
    .param p1, "$statusCallBack"    # Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;
    .param p2, "$pdfViewRef"    # Landroidx/compose/runtime/MutableState;
    .param p3, "$jumpToPage"    # Ljava/lang/Integer;
    .param p4, "$onReady"    # Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;",
            "Landroidx/compose/runtime/MutableState<",
            "Lcom/rajat/pdfviewer/PdfRendererView;",
            ">;",
            "Ljava/lang/Integer;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/rajat/pdfviewer/PdfRendererView;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;->$statusCallBack:Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;

    iput-object p2, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;->$pdfViewRef:Landroidx/compose/runtime/MutableState;

    iput-object p3, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;->$jumpToPage:Ljava/lang/Integer;

    iput-object p4, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;->$onReady:Lkotlin/jvm/functions/Function1;

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "error"    # Ljava/lang/Throwable;

    const-string v0, "error"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 72
    iget-object v0, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;->$statusCallBack:Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;->onError(Ljava/lang/Throwable;)V

    .line 73
    :cond_0
    return-void
.end method

.method public onPageChanged(II)V
    .locals 1
    .param p1, "currentPage"    # I
    .param p2, "totalPage"    # I

    .line 76
    iget-object v0, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;->$statusCallBack:Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1, p2}, Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;->onPageChanged(II)V

    .line 77
    :cond_0
    return-void
.end method

.method public onPdfLoadProgress(IJLjava/lang/Long;)V
    .locals 1
    .param p1, "progress"    # I
    .param p2, "downloadedBytes"    # J
    .param p4, "totalBytes"    # Ljava/lang/Long;

    .line 60
    iget-object v0, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;->$statusCallBack:Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;->onPdfLoadProgress(IJLjava/lang/Long;)V

    .line 61
    :cond_0
    return-void
.end method

.method public onPdfLoadStart()V
    .locals 1

    .line 56
    iget-object v0, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;->$statusCallBack:Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;->onPdfLoadStart()V

    .line 57
    :cond_0
    return-void
.end method

.method public onPdfLoadSuccess(Ljava/lang/String;)V
    .locals 10
    .param p1, "absolutePath"    # Ljava/lang/String;

    const-string v0, "absolutePath"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 64
    iget-object v0, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;->$statusCallBack:Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;->onPdfLoadSuccess(Ljava/lang/String;)V

    .line 65
    :cond_0
    iget-object v0, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;->$pdfViewRef:Landroidx/compose/runtime/MutableState;

    invoke-interface {v0}, Landroidx/compose/runtime/MutableState;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/rajat/pdfviewer/PdfRendererView;

    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;->$jumpToPage:Ljava/lang/Integer;

    iget-object v2, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;->$onReady:Lkotlin/jvm/functions/Function1;

    move-object v3, v0

    .local v3, "view":Lcom/rajat/pdfviewer/PdfRendererView;
    const/4 v0, 0x0

    .line 66
    .local v0, "$i$a$-let-PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1$onPdfLoadSuccess$1":I
    if-eqz v1, :cond_1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v4

    .line 130
    .local v4, "it":I
    const/4 v1, 0x0

    .line 66
    .local v1, "$i$a$-let-PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1$onPdfLoadSuccess$1$1":I
    const/4 v8, 0x6

    const/4 v9, 0x0

    const/4 v5, 0x0

    const-wide/16 v6, 0x0

    invoke-static/range {v3 .. v9}, Lcom/rajat/pdfviewer/PdfRendererView;->jumpToPage$default(Lcom/rajat/pdfviewer/PdfRendererView;IZJILjava/lang/Object;)V

    .line 67
    .end local v1    # "$i$a$-let-PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1$onPdfLoadSuccess$1$1":I
    .end local v4    # "it":I
    :cond_1
    if-eqz v2, :cond_2

    invoke-interface {v2, v3}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .end local v0    # "$i$a$-let-PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1$onPdfLoadSuccess$1":I
    .end local v3    # "view":Lcom/rajat/pdfviewer/PdfRendererView;
    :cond_2
    nop

    .line 69
    return-void
.end method

.method public onPdfRenderStart()V
    .locals 0

    .line 54
    invoke-static {p0}, Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack$DefaultImpls;->onPdfRenderStart(Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;)V

    return-void
.end method

.method public onPdfRenderSuccess()V
    .locals 1

    .line 80
    iget-object v0, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;->$statusCallBack:Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;->onPdfRenderSuccess()V

    .line 81
    :cond_0
    return-void
.end method
