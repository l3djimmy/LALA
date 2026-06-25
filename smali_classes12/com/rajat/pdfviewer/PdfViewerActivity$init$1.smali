.class public final Lcom/rajat/pdfviewer/PdfViewerActivity$init$1;
.super Ljava/lang/Object;
.source "PdfViewerActivity.kt"

# interfaces
.implements Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rajat/pdfviewer/PdfViewerActivity;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00001\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0004\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u0003\n\u0002\u0008\u0004*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H\u0016J\u0008\u0010\u0004\u001a\u00020\u0003H\u0016J\u0008\u0010\u0005\u001a\u00020\u0003H\u0016J\'\u0010\u0006\u001a\u00020\u00032\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\n2\u0008\u0010\u000b\u001a\u0004\u0018\u00010\nH\u0016\u00a2\u0006\u0002\u0010\u000cJ\u0010\u0010\r\u001a\u00020\u00032\u0006\u0010\u000e\u001a\u00020\u000fH\u0016J\u0010\u0010\u0010\u001a\u00020\u00032\u0006\u0010\u0011\u001a\u00020\u0012H\u0016J\u0018\u0010\u0013\u001a\u00020\u00032\u0006\u0010\u0014\u001a\u00020\u00082\u0006\u0010\u0015\u001a\u00020\u0008H\u0016\u00a8\u0006\u0016"
    }
    d2 = {
        "com/rajat/pdfviewer/PdfViewerActivity$init$1",
        "Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;",
        "onPdfLoadStart",
        "",
        "onPdfRenderSuccess",
        "onPdfRenderStart",
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
.field final synthetic this$0:Lcom/rajat/pdfviewer/PdfViewerActivity;


# direct methods
.method constructor <init>(Lcom/rajat/pdfviewer/PdfViewerActivity;)V
    .locals 0
    .param p1, "$receiver"    # Lcom/rajat/pdfviewer/PdfViewerActivity;

    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$init$1;->this$0:Lcom/rajat/pdfviewer/PdfViewerActivity;

    .line 255
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static final onError$lambda$1(Lcom/rajat/pdfviewer/PdfViewerActivity;Ljava/lang/Throwable;)V
    .locals 3
    .param p0, "this$0"    # Lcom/rajat/pdfviewer/PdfViewerActivity;
    .param p1, "$error"    # Ljava/lang/Throwable;

    .line 290
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/rajat/pdfviewer/PdfViewerActivity;->access$showProgressBar(Lcom/rajat/pdfviewer/PdfViewerActivity;Z)V

    .line 291
    sget-object v0, Lcom/rajat/pdfviewer/util/ViewerStrings;->Companion:Lcom/rajat/pdfviewer/util/ViewerStrings$Companion;

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/rajat/pdfviewer/util/ViewerStrings$Companion;->from(Landroid/content/Context;)Lcom/rajat/pdfviewer/util/ViewerStrings;

    move-result-object v0

    .line 292
    .local v0, "strings":Lcom/rajat/pdfviewer/util/ViewerStrings;
    sget-object v1, Lcom/rajat/pdfviewer/util/ViewerStrings;->Companion:Lcom/rajat/pdfviewer/util/ViewerStrings$Companion;

    invoke-virtual {v1, v0, p1}, Lcom/rajat/pdfviewer/util/ViewerStrings$Companion;->getMessageForError(Lcom/rajat/pdfviewer/util/ViewerStrings;Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    .line 293
    .local v1, "errorMessage":Ljava/lang/String;
    invoke-static {p0, p1}, Lcom/rajat/pdfviewer/PdfViewerActivity;->access$isRetryable(Lcom/rajat/pdfviewer/PdfViewerActivity;Ljava/lang/Throwable;)Z

    move-result v2

    invoke-static {p0, v1, v2}, Lcom/rajat/pdfviewer/PdfViewerActivity;->access$showErrorDialog(Lcom/rajat/pdfviewer/PdfViewerActivity;Ljava/lang/String;Z)V

    .line 294
    return-void
.end method

.method static final onPdfLoadSuccess$lambda$0(Lcom/rajat/pdfviewer/PdfViewerActivity;Ljava/lang/String;)V
    .locals 2
    .param p0, "this$0"    # Lcom/rajat/pdfviewer/PdfViewerActivity;
    .param p1, "$absolutePath"    # Ljava/lang/String;

    .line 278
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/rajat/pdfviewer/PdfViewerActivity;->access$showProgressBar(Lcom/rajat/pdfviewer/PdfViewerActivity;Z)V

    .line 279
    invoke-virtual {p0, p1}, Lcom/rajat/pdfviewer/PdfViewerActivity;->setDownloadedFilePath(Ljava/lang/String;)V

    .line 280
    invoke-static {p0}, Lcom/rajat/pdfviewer/PdfViewerActivity;->access$getMenuItem$p(Lcom/rajat/pdfviewer/PdfViewerActivity;)Landroid/view/MenuItem;

    move-result-object v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 281
    invoke-static {p0, v1}, Lcom/rajat/pdfviewer/PdfViewerActivity;->access$setDownloadButtonEnabled$p(Lcom/rajat/pdfviewer/PdfViewerActivity;Z)V

    goto :goto_0

    .line 283
    :cond_0
    invoke-static {p0, v1}, Lcom/rajat/pdfviewer/PdfViewerActivity;->access$updateDownloadButtonState(Lcom/rajat/pdfviewer/PdfViewerActivity;Z)V

    .line 285
    :goto_0
    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "error"    # Ljava/lang/Throwable;

    const-string v0, "error"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 289
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$init$1;->this$0:Lcom/rajat/pdfviewer/PdfViewerActivity;

    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$init$1;->this$0:Lcom/rajat/pdfviewer/PdfViewerActivity;

    new-instance v2, Lcom/rajat/pdfviewer/PdfViewerActivity$init$1$$ExternalSyntheticLambda0;

    invoke-direct {v2, v1, p1}, Lcom/rajat/pdfviewer/PdfViewerActivity$init$1$$ExternalSyntheticLambda0;-><init>(Lcom/rajat/pdfviewer/PdfViewerActivity;Ljava/lang/Throwable;)V

    invoke-virtual {v0, v2}, Lcom/rajat/pdfviewer/PdfViewerActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 295
    return-void
.end method

.method public onPageChanged(II)V
    .locals 0
    .param p1, "currentPage"    # I
    .param p2, "totalPage"    # I

    .line 299
    return-void
.end method

.method public onPdfLoadProgress(IJLjava/lang/Long;)V
    .locals 2
    .param p1, "progress"    # I
    .param p2, "downloadedBytes"    # J
    .param p4, "totalBytes"    # Ljava/lang/Long;

    .line 273
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$init$1;->this$0:Lcom/rajat/pdfviewer/PdfViewerActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/rajat/pdfviewer/PdfViewerActivity;->access$showProgressBar(Lcom/rajat/pdfviewer/PdfViewerActivity;Z)V

    .line 274
    return-void
.end method

.method public onPdfLoadStart()V
    .locals 2

    .line 257
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$init$1;->this$0:Lcom/rajat/pdfviewer/PdfViewerActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/rajat/pdfviewer/PdfViewerActivity;->access$showProgressBar(Lcom/rajat/pdfviewer/PdfViewerActivity;Z)V

    .line 258
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$init$1;->this$0:Lcom/rajat/pdfviewer/PdfViewerActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/rajat/pdfviewer/PdfViewerActivity;->access$updateDownloadButtonState(Lcom/rajat/pdfviewer/PdfViewerActivity;Z)V

    .line 259
    return-void
.end method

.method public onPdfLoadSuccess(Ljava/lang/String;)V
    .locals 3
    .param p1, "absolutePath"    # Ljava/lang/String;

    const-string v0, "absolutePath"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 277
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$init$1;->this$0:Lcom/rajat/pdfviewer/PdfViewerActivity;

    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$init$1;->this$0:Lcom/rajat/pdfviewer/PdfViewerActivity;

    new-instance v2, Lcom/rajat/pdfviewer/PdfViewerActivity$init$1$$ExternalSyntheticLambda1;

    invoke-direct {v2, v1, p1}, Lcom/rajat/pdfviewer/PdfViewerActivity$init$1$$ExternalSyntheticLambda1;-><init>(Lcom/rajat/pdfviewer/PdfViewerActivity;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Lcom/rajat/pdfviewer/PdfViewerActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 286
    return-void
.end method

.method public onPdfRenderStart()V
    .locals 0

    .line 267
    return-void
.end method

.method public onPdfRenderSuccess()V
    .locals 0

    .line 263
    return-void
.end method
