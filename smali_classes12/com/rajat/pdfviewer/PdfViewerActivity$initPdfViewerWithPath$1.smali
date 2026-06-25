.class final Lcom/rajat/pdfviewer/PdfViewerActivity$initPdfViewerWithPath$1;
.super Lkotlin/coroutines/jvm/internal/ContinuationImpl;
.source "PdfViewerActivity.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rajat/pdfviewer/PdfViewerActivity;->initPdfViewerWithPath(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
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
    c = "com.rajat.pdfviewer.PdfViewerActivity"
    f = "PdfViewerActivity.kt"
    i = {}
    l = {
        0x193,
        0x195
    }
    m = "initPdfViewerWithPath"
    n = {}
    s = {}
.end annotation


# instance fields
.field label:I

.field synthetic result:Ljava/lang/Object;

.field final synthetic this$0:Lcom/rajat/pdfviewer/PdfViewerActivity;


# direct methods
.method constructor <init>(Lcom/rajat/pdfviewer/PdfViewerActivity;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/rajat/pdfviewer/PdfViewerActivity;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/rajat/pdfviewer/PdfViewerActivity$initPdfViewerWithPath$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$initPdfViewerWithPath$1;->this$0:Lcom/rajat/pdfviewer/PdfViewerActivity;

    invoke-direct {p0, p2}, Lkotlin/coroutines/jvm/internal/ContinuationImpl;-><init>(Lkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$initPdfViewerWithPath$1;->result:Ljava/lang/Object;

    iget v0, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$initPdfViewerWithPath$1;->label:I

    const/high16 v1, -0x80000000

    or-int/2addr v0, v1

    iput v0, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$initPdfViewerWithPath$1;->label:I

    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$initPdfViewerWithPath$1;->this$0:Lcom/rajat/pdfviewer/PdfViewerActivity;

    const/4 v1, 0x0

    move-object v2, p0

    check-cast v2, Lkotlin/coroutines/Continuation;

    invoke-static {v0, v1, v2}, Lcom/rajat/pdfviewer/PdfViewerActivity;->access$initPdfViewerWithPath(Lcom/rajat/pdfviewer/PdfViewerActivity;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
