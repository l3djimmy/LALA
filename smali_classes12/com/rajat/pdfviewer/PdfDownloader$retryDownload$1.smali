.class final Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;
.super Lkotlin/coroutines/jvm/internal/ContinuationImpl;
.source "PdfDownloader.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rajat/pdfviewer/PdfDownloader;->retryDownload(Ljava/lang/String;Ljava/io/File;Ljava/io/File;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
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

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.rajat.pdfviewer.PdfDownloader"
    f = "PdfDownloader.kt"
    i = {
        0x0,
        0x0,
        0x0,
        0x1,
        0x1,
        0x1,
        0x1,
        0x2,
        0x2,
        0x2,
        0x2,
        0x4,
        0x4,
        0x4,
        0x4,
        0x5,
        0x5,
        0x5,
        0x5
    }
    l = {
        0x62,
        0x68,
        0x69,
        0x6d,
        0x77,
        0x79
    }
    m = "retryDownload"
    n = {
        "downloadUrl",
        "cacheDir",
        "pdfFile",
        "downloadUrl",
        "cacheDir",
        "pdfFile",
        "attempt",
        "downloadUrl",
        "cacheDir",
        "pdfFile",
        "attempt",
        "downloadUrl",
        "cacheDir",
        "pdfFile",
        "attempt",
        "downloadUrl",
        "cacheDir",
        "pdfFile",
        "attempt"
    }
    s = {
        "L$0",
        "L$1",
        "L$2",
        "L$0",
        "L$1",
        "L$2",
        "I$0",
        "L$0",
        "L$1",
        "L$2",
        "I$0",
        "L$0",
        "L$1",
        "L$2",
        "I$0",
        "L$0",
        "L$1",
        "L$2",
        "I$0"
    }
.end annotation


# instance fields
.field I$0:I

.field L$0:Ljava/lang/Object;

.field L$1:Ljava/lang/Object;

.field L$2:Ljava/lang/Object;

.field label:I

.field synthetic result:Ljava/lang/Object;

.field final synthetic this$0:Lcom/rajat/pdfviewer/PdfDownloader;


# direct methods
.method constructor <init>(Lcom/rajat/pdfviewer/PdfDownloader;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/rajat/pdfviewer/PdfDownloader;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->this$0:Lcom/rajat/pdfviewer/PdfDownloader;

    invoke-direct {p0, p2}, Lkotlin/coroutines/jvm/internal/ContinuationImpl;-><init>(Lkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->result:Ljava/lang/Object;

    iget v0, p0, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->label:I

    const/high16 v1, -0x80000000

    or-int/2addr v0, v1

    iput v0, p0, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->label:I

    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->this$0:Lcom/rajat/pdfviewer/PdfDownloader;

    const/4 v1, 0x0

    move-object v2, p0

    check-cast v2, Lkotlin/coroutines/Continuation;

    invoke-static {v0, v1, v1, v1, v2}, Lcom/rajat/pdfviewer/PdfDownloader;->access$retryDownload(Lcom/rajat/pdfviewer/PdfDownloader;Ljava/lang/String;Ljava/io/File;Ljava/io/File;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
