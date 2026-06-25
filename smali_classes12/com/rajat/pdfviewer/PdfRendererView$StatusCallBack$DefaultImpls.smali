.class public final Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack$DefaultImpls;
.super Ljava/lang/Object;
.source "PdfRendererView.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "DefaultImpls"
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static onError(Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;Ljava/lang/Throwable;)V
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;
    .param p1, "error"    # Ljava/lang/Throwable;

    const-string v0, "error"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 690
    return-void
.end method

.method public static onPageChanged(Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;II)V
    .locals 0
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;
    .param p1, "currentPage"    # I
    .param p2, "totalPage"    # I

    .line 691
    return-void
.end method

.method public static onPdfLoadProgress(Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;IJLjava/lang/Long;)V
    .locals 0
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;
    .param p1, "progress"    # I
    .param p2, "downloadedBytes"    # J
    .param p4, "totalBytes"    # Ljava/lang/Long;

    .line 688
    return-void
.end method

.method public static onPdfLoadStart(Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;)V
    .locals 0
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;

    .line 687
    return-void
.end method

.method public static onPdfLoadSuccess(Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;Ljava/lang/String;)V
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;
    .param p1, "absolutePath"    # Ljava/lang/String;

    const-string v0, "absolutePath"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 689
    return-void
.end method

.method public static onPdfRenderStart(Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;)V
    .locals 0
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;

    .line 692
    return-void
.end method

.method public static onPdfRenderSuccess(Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;)V
    .locals 0
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;

    .line 693
    return-void
.end method
