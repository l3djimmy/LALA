.class public final Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1;
.super Ljava/lang/Object;
.source "PdfViewAdapter.kt"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->startPersistentFallbackRender(IIJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0015\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00060\u0001j\u0002`\u0002J\u0008\u0010\u0003\u001a\u00020\u0004H\u0016\u00a8\u0006\u0005"
    }
    d2 = {
        "com/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1",
        "Ljava/lang/Runnable;",
        "Lkotlinx/coroutines/Runnable;",
        "run",
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
.field final synthetic $attempt:Lkotlin/jvm/internal/Ref$IntRef;

.field final synthetic $delayMs:J

.field final synthetic $page:I

.field final synthetic $retries:I

.field final synthetic $task:Lkotlin/jvm/internal/Ref$ObjectRef;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/internal/Ref$ObjectRef<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

.field final synthetic this$1:Lcom/rajat/pdfviewer/PdfViewAdapter;


# direct methods
.method constructor <init>(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;ILcom/rajat/pdfviewer/PdfViewAdapter;Lkotlin/jvm/internal/Ref$IntRef;ILkotlin/jvm/internal/Ref$ObjectRef;J)V
    .locals 0
    .param p1, "$receiver"    # Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;
    .param p2, "$page"    # I
    .param p3, "$receiver"    # Lcom/rajat/pdfviewer/PdfViewAdapter;
    .param p4, "$attempt"    # Lkotlin/jvm/internal/Ref$IntRef;
    .param p5, "$retries"    # I
    .param p6, "$task"    # Lkotlin/jvm/internal/Ref$ObjectRef;
    .param p7, "$delayMs"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;",
            "I",
            "Lcom/rajat/pdfviewer/PdfViewAdapter;",
            "Lkotlin/jvm/internal/Ref$IntRef;",
            "I",
            "Lkotlin/jvm/internal/Ref$ObjectRef<",
            "Ljava/lang/Runnable;",
            ">;J)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    iput p2, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1;->$page:I

    iput-object p3, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1;->this$1:Lcom/rajat/pdfviewer/PdfViewAdapter;

    iput-object p4, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1;->$attempt:Lkotlin/jvm/internal/Ref$IntRef;

    iput p5, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1;->$retries:I

    iput-object p6, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1;->$task:Lkotlin/jvm/internal/Ref$ObjectRef;

    iput-wide p7, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1;->$delayMs:J

    .line 208
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .line 210
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    invoke-static {v0}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->access$getCurrentBoundPage$p(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;)I

    move-result v0

    iget v1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1;->$page:I

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    invoke-static {v0}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->access$hasLiveBitmap(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 212
    :cond_0
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    invoke-static {v0}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->access$getScope$p(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;)Lkotlinx/coroutines/CoroutineScope;

    move-result-object v1

    new-instance v2, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;

    iget-object v3, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    iget v4, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1;->$page:I

    iget-object v5, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1;->this$1:Lcom/rajat/pdfviewer/PdfViewAdapter;

    iget-object v6, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1;->$attempt:Lkotlin/jvm/internal/Ref$IntRef;

    iget v7, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1;->$retries:I

    iget-object v8, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1;->$task:Lkotlin/jvm/internal/Ref$ObjectRef;

    iget-wide v9, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1;->$delayMs:J

    const/4 v11, 0x0

    invoke-direct/range {v2 .. v11}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;-><init>(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;ILcom/rajat/pdfviewer/PdfViewAdapter;Lkotlin/jvm/internal/Ref$IntRef;ILkotlin/jvm/internal/Ref$ObjectRef;JLkotlin/coroutines/Continuation;)V

    move-object v4, v2

    check-cast v4, Lkotlin/jvm/functions/Function2;

    const/4 v5, 0x3

    const/4 v6, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static/range {v1 .. v6}, Lkotlinx/coroutines/BuildersKt;->launch$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    .line 235
    return-void

    .line 210
    :cond_1
    :goto_0
    return-void
.end method
