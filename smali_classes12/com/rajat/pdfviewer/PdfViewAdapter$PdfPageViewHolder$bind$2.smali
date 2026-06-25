.class final Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "PdfViewAdapter.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->bind(I)V
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
    c = "com.rajat.pdfviewer.PdfViewAdapter$PdfPageViewHolder$bind$2"
    f = "PdfViewAdapter.kt"
    i = {}
    l = {
        0x5a
    }
    m = "invokeSuspend"
    n = {}
    s = {}
.end annotation


# instance fields
.field final synthetic $displayWidth:I

.field final synthetic $position:I

.field label:I

.field final synthetic this$0:Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

.field final synthetic this$1:Lcom/rajat/pdfviewer/PdfViewAdapter;


# direct methods
.method constructor <init>(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;IILcom/rajat/pdfviewer/PdfViewAdapter;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;",
            "II",
            "Lcom/rajat/pdfviewer/PdfViewAdapter;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    iput p2, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2;->$position:I

    iput p3, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2;->$displayWidth:I

    iput-object p4, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2;->this$1:Lcom/rajat/pdfviewer/PdfViewAdapter;

    const/4 v0, 0x2

    invoke-direct {p0, v0, p5}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method

.method static final invokeSuspend$lambda$0(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;IILandroid/util/Size;)Lkotlin/Unit;
    .locals 3
    .param p0, "this$0"    # Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;
    .param p1, "$position"    # I
    .param p2, "$displayWidth"    # I
    .param p3, "size"    # Landroid/util/Size;

    .line 99
    invoke-static {p0}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->access$getCurrentBoundPage$p(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;)I

    move-result v0

    if-eq v0, p1, :cond_0

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    .line 101
    :cond_0
    invoke-virtual {p3}, Landroid/util/Size;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p3}, Landroid/util/Size;->getHeight()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    .line 102
    .local v0, "aspectRatio":F
    int-to-float v1, p2

    div-float/2addr v1, v0

    float-to-int v1, v1

    .line 103
    .local v1, "height":I
    invoke-static {p0}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->access$getItemBinding$p(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;)Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;

    move-result-object v2

    invoke-static {p0, v2, v1}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->access$updateLayoutParams(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;I)V

    .line 105
    invoke-static {p0, p1, p2, v1}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->access$renderAndApplyBitmap(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;III)V

    .line 106
    sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v2
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 6
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

    new-instance v0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2;

    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    iget v2, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2;->$position:I

    iget v3, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2;->$displayWidth:I

    iget-object v4, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2;->this$1:Lcom/rajat/pdfviewer/PdfViewAdapter;

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2;-><init>(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;IILcom/rajat/pdfviewer/PdfViewAdapter;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 89
    iget v1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2;->label:I

    packed-switch v1, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .local p1, "$result":Ljava/lang/Object;
    :pswitch_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v0, p1

    goto :goto_0

    .end local p1    # "$result":Ljava/lang/Object;
    :pswitch_1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 90
    .restart local p1    # "$result":Ljava/lang/Object;
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v1

    check-cast v1, Lkotlin/coroutines/CoroutineContext;

    new-instance v2, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2$cached$1;

    iget-object v3, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2;->this$1:Lcom/rajat/pdfviewer/PdfViewAdapter;

    iget v4, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2;->$position:I

    const/4 v5, 0x0

    invoke-direct {v2, v3, v4, v5}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2$cached$1;-><init>(Lcom/rajat/pdfviewer/PdfViewAdapter;ILkotlin/coroutines/Continuation;)V

    check-cast v2, Lkotlin/jvm/functions/Function2;

    move-object v3, p0

    check-cast v3, Lkotlin/coroutines/Continuation;

    const/4 v4, 0x1

    iput v4, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2;->label:I

    invoke-static {v1, v2, v3}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_0

    .line 89
    return-object v0

    .line 90
    :cond_0
    move-object v0, p1

    move-object p1, v1

    .line 89
    .end local p1    # "$result":Ljava/lang/Object;
    .local v0, "$result":Ljava/lang/Object;
    :goto_0
    check-cast p1, Landroid/graphics/Bitmap;

    .line 94
    .local p1, "cached":Landroid/graphics/Bitmap;
    if-eqz p1, :cond_1

    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    invoke-static {v1}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->access$getCurrentBoundPage$p(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;)I

    move-result v1

    iget v2, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2;->$position:I

    if-ne v1, v2, :cond_1

    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    iget v2, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2;->$displayWidth:I

    invoke-static {v1, p1, v2}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->access$applyCachedBitmap(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;Landroid/graphics/Bitmap;I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 95
    .end local p1    # "cached":Landroid/graphics/Bitmap;
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1

    .line 98
    :cond_1
    iget-object p1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2;->this$1:Lcom/rajat/pdfviewer/PdfViewAdapter;

    invoke-static {p1}, Lcom/rajat/pdfviewer/PdfViewAdapter;->access$getRenderer$p(Lcom/rajat/pdfviewer/PdfViewAdapter;)Lcom/rajat/pdfviewer/PdfRendererCore;

    move-result-object p1

    iget v1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2;->$position:I

    iget-object v2, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    iget v3, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2;->$position:I

    iget v4, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2;->$displayWidth:I

    new-instance v5, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2$$ExternalSyntheticLambda0;

    invoke-direct {v5, v2, v3, v4}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2$$ExternalSyntheticLambda0;-><init>(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;II)V

    invoke-virtual {p1, v1, v5}, Lcom/rajat/pdfviewer/PdfRendererCore;->getPageDimensionsAsync(ILkotlin/jvm/functions/Function1;)V

    .line 107
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
