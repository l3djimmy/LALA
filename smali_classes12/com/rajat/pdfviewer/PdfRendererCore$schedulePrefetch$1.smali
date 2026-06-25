.class final Lcom/rajat/pdfviewer/PdfRendererCore$schedulePrefetch$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "PdfRendererCore.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rajat/pdfviewer/PdfRendererCore;->schedulePrefetch(IIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/SuspendLambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Lkotlinx/coroutines/CoroutineScope;",
        "Lkotlin/coroutines/Continuation<",
        "-",
        "Lkotlin/Unit;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"
    }
    d2 = {
        "<anonymous>",
        "",
        "Lkotlinx/coroutines/CoroutineScope;"
    }
    k = 0x3
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.rajat.pdfviewer.PdfRendererCore$schedulePrefetch$1"
    f = "PdfRendererCore.kt"
    i = {}
    l = {
        0x125,
        0x126
    }
    m = "invokeSuspend"
    n = {}
    s = {}
.end annotation


# instance fields
.field final synthetic $currentPage:I

.field final synthetic $direction:I

.field final synthetic $height:I

.field final synthetic $width:I

.field label:I

.field final synthetic this$0:Lcom/rajat/pdfviewer/PdfRendererCore;


# direct methods
.method constructor <init>(Lcom/rajat/pdfviewer/PdfRendererCore;IIIILkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/rajat/pdfviewer/PdfRendererCore;",
            "IIII",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/rajat/pdfviewer/PdfRendererCore$schedulePrefetch$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$schedulePrefetch$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    iput p2, p0, Lcom/rajat/pdfviewer/PdfRendererCore$schedulePrefetch$1;->$currentPage:I

    iput p3, p0, Lcom/rajat/pdfviewer/PdfRendererCore$schedulePrefetch$1;->$width:I

    iput p4, p0, Lcom/rajat/pdfviewer/PdfRendererCore$schedulePrefetch$1;->$height:I

    iput p5, p0, Lcom/rajat/pdfviewer/PdfRendererCore$schedulePrefetch$1;->$direction:I

    const/4 v0, 0x2

    invoke-direct {p0, v0, p6}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lkotlin/coroutines/Continuation<",
            "*>;)",
            "Lkotlin/coroutines/Continuation<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/rajat/pdfviewer/PdfRendererCore$schedulePrefetch$1;

    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$schedulePrefetch$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    iget v2, p0, Lcom/rajat/pdfviewer/PdfRendererCore$schedulePrefetch$1;->$currentPage:I

    iget v3, p0, Lcom/rajat/pdfviewer/PdfRendererCore$schedulePrefetch$1;->$width:I

    iget v4, p0, Lcom/rajat/pdfviewer/PdfRendererCore$schedulePrefetch$1;->$height:I

    iget v5, p0, Lcom/rajat/pdfviewer/PdfRendererCore$schedulePrefetch$1;->$direction:I

    move-object v6, p2

    invoke-direct/range {v0 .. v6}, Lcom/rajat/pdfviewer/PdfRendererCore$schedulePrefetch$1;-><init>(Lcom/rajat/pdfviewer/PdfRendererCore;IIIILkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfRendererCore$schedulePrefetch$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlinx/coroutines/CoroutineScope;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfRendererCore$schedulePrefetch$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/rajat/pdfviewer/PdfRendererCore$schedulePrefetch$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/rajat/pdfviewer/PdfRendererCore$schedulePrefetch$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 292
    iget v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$schedulePrefetch$1;->label:I

    packed-switch v1, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .local p1, "$result":Ljava/lang/Object;
    :pswitch_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto :goto_1

    :pswitch_1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto :goto_0

    .end local p1    # "$result":Ljava/lang/Object;
    :pswitch_2
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 293
    .restart local p1    # "$result":Ljava/lang/Object;
    move-object v1, p0

    check-cast v1, Lkotlin/coroutines/Continuation;

    const/4 v2, 0x1

    iput v2, p0, Lcom/rajat/pdfviewer/PdfRendererCore$schedulePrefetch$1;->label:I

    const-wide/16 v2, 0x64

    invoke-static {v2, v3, v1}, Lkotlinx/coroutines/DelayKt;->delay(JLkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_0

    .line 292
    return-object v0

    .line 294
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$schedulePrefetch$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    iget v2, p0, Lcom/rajat/pdfviewer/PdfRendererCore$schedulePrefetch$1;->$currentPage:I

    iget v3, p0, Lcom/rajat/pdfviewer/PdfRendererCore$schedulePrefetch$1;->$width:I

    iget v4, p0, Lcom/rajat/pdfviewer/PdfRendererCore$schedulePrefetch$1;->$height:I

    iget v5, p0, Lcom/rajat/pdfviewer/PdfRendererCore$schedulePrefetch$1;->$direction:I

    move-object v6, p0

    check-cast v6, Lkotlin/coroutines/Continuation;

    const/4 v7, 0x2

    iput v7, p0, Lcom/rajat/pdfviewer/PdfRendererCore$schedulePrefetch$1;->label:I

    invoke-static/range {v1 .. v6}, Lcom/rajat/pdfviewer/PdfRendererCore;->access$prefetchPagesAround(Lcom/rajat/pdfviewer/PdfRendererCore;IIIILkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_1

    .line 292
    return-object v0

    .line 295
    :cond_1
    :goto_1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
