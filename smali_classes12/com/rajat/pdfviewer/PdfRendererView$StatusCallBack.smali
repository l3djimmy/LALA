.class public interface abstract Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;
.super Ljava/lang/Object;
.source "PdfRendererView.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rajat/pdfviewer/PdfRendererView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "StatusCallBack"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack$DefaultImpls;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0004\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u0003\n\u0002\u0008\u0006\u0008f\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H\u0016J\'\u0010\u0004\u001a\u00020\u00032\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00082\u0008\u0010\t\u001a\u0004\u0018\u00010\u0008H\u0016\u00a2\u0006\u0002\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u00032\u0006\u0010\u000c\u001a\u00020\rH\u0016J\u0010\u0010\u000e\u001a\u00020\u00032\u0006\u0010\u000f\u001a\u00020\u0010H\u0016J\u0018\u0010\u0011\u001a\u00020\u00032\u0006\u0010\u0012\u001a\u00020\u00062\u0006\u0010\u0013\u001a\u00020\u0006H\u0016J\u0008\u0010\u0014\u001a\u00020\u0003H\u0016J\u0008\u0010\u0015\u001a\u00020\u0003H\u0016\u00a8\u0006\u0016"
    }
    d2 = {
        "Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;",
        "",
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
        "onPdfRenderStart",
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


# virtual methods
.method public abstract onError(Ljava/lang/Throwable;)V
.end method

.method public abstract onPageChanged(II)V
.end method

.method public abstract onPdfLoadProgress(IJLjava/lang/Long;)V
.end method

.method public abstract onPdfLoadStart()V
.end method

.method public abstract onPdfLoadSuccess(Ljava/lang/String;)V
.end method

.method public abstract onPdfRenderStart()V
.end method

.method public abstract onPdfRenderSuccess()V
.end method
