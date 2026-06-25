.class final Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "PdfViewAdapter.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1;->run()V
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

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPdfViewAdapter.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PdfViewAdapter.kt\ncom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,359:1\n1#2:360\n*E\n"
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
    c = "com.rajat.pdfviewer.PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1"
    f = "PdfViewAdapter.kt"
    i = {}
    l = {
        0xd5
    }
    m = "invokeSuspend"
    n = {}
    s = {}
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

.field label:I

.field final synthetic this$0:Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

.field final synthetic this$1:Lcom/rajat/pdfviewer/PdfViewAdapter;


# direct methods
.method constructor <init>(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;ILcom/rajat/pdfviewer/PdfViewAdapter;Lkotlin/jvm/internal/Ref$IntRef;ILkotlin/jvm/internal/Ref$ObjectRef;JLkotlin/coroutines/Continuation;)V
    .locals 1
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
            ">;J",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    iput p2, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->$page:I

    iput-object p3, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->this$1:Lcom/rajat/pdfviewer/PdfViewAdapter;

    iput-object p4, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->$attempt:Lkotlin/jvm/internal/Ref$IntRef;

    iput p5, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->$retries:I

    iput-object p6, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->$task:Lkotlin/jvm/internal/Ref$ObjectRef;

    iput-wide p7, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->$delayMs:J

    const/4 v0, 0x2

    invoke-direct {p0, v0, p9}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 10
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

    new-instance v0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;

    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    iget v2, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->$page:I

    iget-object v3, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->this$1:Lcom/rajat/pdfviewer/PdfViewAdapter;

    iget-object v4, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->$attempt:Lkotlin/jvm/internal/Ref$IntRef;

    iget v5, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->$retries:I

    iget-object v6, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->$task:Lkotlin/jvm/internal/Ref$ObjectRef;

    iget-wide v7, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->$delayMs:J

    move-object v9, p2

    invoke-direct/range {v0 .. v9}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;-><init>(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;ILcom/rajat/pdfviewer/PdfViewAdapter;Lkotlin/jvm/internal/Ref$IntRef;ILkotlin/jvm/internal/Ref$ObjectRef;JLkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 212
    iget v1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->label:I

    const/4 v2, 0x0

    const/4 v3, 0x1

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

    .line 213
    .restart local p1    # "$result":Ljava/lang/Object;
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v1

    check-cast v1, Lkotlin/coroutines/CoroutineContext;

    new-instance v4, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1$cached$1;

    iget-object v5, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->this$1:Lcom/rajat/pdfviewer/PdfViewAdapter;

    iget v6, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->$page:I

    invoke-direct {v4, v5, v6, v2}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1$cached$1;-><init>(Lcom/rajat/pdfviewer/PdfViewAdapter;ILkotlin/coroutines/Continuation;)V

    check-cast v4, Lkotlin/jvm/functions/Function2;

    move-object v5, p0

    check-cast v5, Lkotlin/coroutines/Continuation;

    iput v3, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->label:I

    invoke-static {v1, v4, v5}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_0

    .line 212
    return-object v0

    .line 213
    :cond_0
    move-object v0, p1

    move-object p1, v1

    .line 212
    .end local p1    # "$result":Ljava/lang/Object;
    .local v0, "$result":Ljava/lang/Object;
    :goto_0
    check-cast p1, Landroid/graphics/Bitmap;

    .line 217
    .local p1, "cached":Landroid/graphics/Bitmap;
    if-eqz p1, :cond_7

    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    invoke-static {v1}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->access$getCurrentBoundPage$p(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;)I

    move-result v1

    iget v4, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->$page:I

    if-ne v1, v4, :cond_7

    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    .line 218
    nop

    .line 219
    .end local p1    # "cached":Landroid/graphics/Bitmap;
    iget-object v4, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    invoke-static {v4}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->access$getItemBinding$p(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;)Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;

    move-result-object v4

    iget-object v4, v4, Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;->pageView:Landroid/widget/ImageView;

    invoke-virtual {v4}, Landroid/widget/ImageView;->getWidth()I

    move-result v4

    invoke-static {v4}, Lkotlin/coroutines/jvm/internal/Boxing;->boxInt(I)Ljava/lang/Integer;

    move-result-object v4

    move-object v5, v4

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    move-result v5

    .line 360
    .local v5, "it":I
    const/4 v6, 0x0

    .line 219
    .local v6, "$i$a$-takeIf-PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1$1":I
    const/4 v7, 0x0

    if-lez v5, :cond_1

    move v5, v3

    goto :goto_1

    :cond_1
    move v5, v7

    .end local v5    # "it":I
    .end local v6    # "$i$a$-takeIf-PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1$1":I
    :goto_1
    if-eqz v5, :cond_2

    goto :goto_2

    :cond_2
    move-object v4, v2

    :goto_2
    if-eqz v4, :cond_3

    :goto_3
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    goto :goto_5

    .line 220
    :cond_3
    iget-object v4, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    iget-object v4, v4, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    move-result v4

    invoke-static {v4}, Lkotlin/coroutines/jvm/internal/Boxing;->boxInt(I)Ljava/lang/Integer;

    move-result-object v4

    move-object v5, v4

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    move-result v5

    .line 360
    .restart local v5    # "it":I
    const/4 v6, 0x0

    .line 220
    .local v6, "$i$a$-takeIf-PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1$2":I
    if-lez v5, :cond_4

    move v7, v3

    nop

    .end local v5    # "it":I
    .end local v6    # "$i$a$-takeIf-PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1$2":I
    :cond_4
    if-eqz v7, :cond_5

    goto :goto_4

    :cond_5
    move-object v4, v2

    .line 219
    :goto_4
    if-eqz v4, :cond_6

    goto :goto_3

    .line 221
    :cond_6
    iget-object v4, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->this$1:Lcom/rajat/pdfviewer/PdfViewAdapter;

    invoke-static {v4}, Lcom/rajat/pdfviewer/PdfViewAdapter;->access$getContext$p(Lcom/rajat/pdfviewer/PdfViewAdapter;)Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v4, v4, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 217
    :goto_5
    invoke-static {v1, p1, v4}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->access$applyCachedBitmap(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;Landroid/graphics/Bitmap;I)Z

    move-result p1

    if-nez p1, :cond_a

    .line 225
    :cond_7
    iget-object p1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    invoke-static {p1}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->access$getHasTriggeredFallbackRender$p(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;)Z

    move-result p1

    if-nez p1, :cond_8

    iget-object p1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    invoke-static {p1}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->access$getCurrentBoundPage$p(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;)I

    move-result p1

    iget v1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->$page:I

    if-ne p1, v1, :cond_8

    iget-object p1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    invoke-static {p1}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->access$hasLiveBitmap(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;)Z

    move-result p1

    if-nez p1, :cond_8

    .line 226
    iget-object p1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    invoke-static {p1, v3}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->access$setHasTriggeredFallbackRender$p(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;Z)V

    .line 227
    iget-object p1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    iget v1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->$page:I

    invoke-static {p1, v1}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->access$triggerFallbackRender(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;I)V

    .line 229
    :cond_8
    iget-object p1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->$attempt:Lkotlin/jvm/internal/Ref$IntRef;

    iget p1, p1, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->$attempt:Lkotlin/jvm/internal/Ref$IntRef;

    add-int/2addr p1, v3

    iput p1, v1, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    .line 230
    iget-object p1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->$attempt:Lkotlin/jvm/internal/Ref$IntRef;

    iget p1, p1, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    iget v1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->$retries:I

    if-ge p1, v1, :cond_a

    .line 231
    iget-object p1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    invoke-static {p1}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->access$getFallbackHandler$p(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;)Landroid/os/Handler;

    move-result-object p1

    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->$task:Lkotlin/jvm/internal/Ref$ObjectRef;

    iget-object v1, v1, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    if-nez v1, :cond_9

    const-string/jumbo v1, "task"

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_6

    :cond_9
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->$task:Lkotlin/jvm/internal/Ref$ObjectRef;

    iget-object v1, v1, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    move-object v2, v1

    check-cast v2, Ljava/lang/Runnable;

    :goto_6
    iget-wide v3, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1;->$delayMs:J

    invoke-virtual {p1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 234
    :cond_a
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
