.class public interface abstract Lcom/rajat/pdfviewer/PdfDownloader$StatusListener;
.super Ljava/lang/Object;
.source "PdfDownloader.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rajat/pdfviewer/PdfDownloader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "StatusListener"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0003\n\u0000\u0008f\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H&J\u0008\u0010\u0004\u001a\u00020\u0005H&J\u0018\u0010\u0006\u001a\u00020\u00052\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\u0008H&J\u0010\u0010\n\u001a\u00020\u00052\u0006\u0010\u000b\u001a\u00020\u000cH&J\u0010\u0010\r\u001a\u00020\u00052\u0006\u0010\u000e\u001a\u00020\u000fH&\u00a8\u0006\u0010"
    }
    d2 = {
        "Lcom/rajat/pdfviewer/PdfDownloader$StatusListener;",
        "",
        "getContext",
        "Landroid/content/Context;",
        "onDownloadStart",
        "",
        "onDownloadProgress",
        "currentBytes",
        "",
        "totalBytes",
        "onDownloadSuccess",
        "downloadedFile",
        "Ljava/io/File;",
        "onDownloadError",
        "error",
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


# virtual methods
.method public abstract getContext()Landroid/content/Context;
.end method

.method public abstract onDownloadError(Ljava/lang/Throwable;)V
.end method

.method public abstract onDownloadProgress(JJ)V
.end method

.method public abstract onDownloadStart()V
.end method

.method public abstract onDownloadSuccess(Ljava/io/File;)V
.end method
