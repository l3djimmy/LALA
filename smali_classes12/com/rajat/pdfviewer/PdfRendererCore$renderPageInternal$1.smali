.class final Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "PdfRendererCore.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rajat/pdfviewer/PdfRendererCore;->renderPageInternal(ILandroid/graphics/Bitmap;ZLkotlin/jvm/functions/Function3;)V
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
    c = "com.rajat.pdfviewer.PdfRendererCore$renderPageInternal$1"
    f = "PdfRendererCore.kt"
    i = {
        0x0
    }
    l = {
        0x96,
        0x98,
        0xce
    }
    m = "invokeSuspend"
    n = {
        "$this$launch"
    }
    s = {
        "L$0"
    }
.end annotation


# instance fields
.field final synthetic $bitmap:Landroid/graphics/Bitmap;

.field final synthetic $onBitmapReady:Lkotlin/jvm/functions/Function3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function3<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            "Landroid/graphics/Bitmap;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $pageNo:I

.field final synthetic $replaceActive:Z

.field private synthetic L$0:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lcom/rajat/pdfviewer/PdfRendererCore;


# direct methods
.method constructor <init>(Lcom/rajat/pdfviewer/PdfRendererCore;ILkotlin/jvm/functions/Function3;ZLandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/rajat/pdfviewer/PdfRendererCore;",
            "I",
            "Lkotlin/jvm/functions/Function3<",
            "-",
            "Ljava/lang/Boolean;",
            "-",
            "Ljava/lang/Integer;",
            "-",
            "Landroid/graphics/Bitmap;",
            "Lkotlin/Unit;",
            ">;Z",
            "Landroid/graphics/Bitmap;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    iput p2, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->$pageNo:I

    iput-object p3, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->$onBitmapReady:Lkotlin/jvm/functions/Function3;

    iput-boolean p4, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->$replaceActive:Z

    iput-object p5, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->$bitmap:Landroid/graphics/Bitmap;

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

    new-instance v0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;

    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    iget v2, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->$pageNo:I

    iget-object v3, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->$onBitmapReady:Lkotlin/jvm/functions/Function3;

    iget-boolean v4, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->$replaceActive:Z

    iget-object v5, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->$bitmap:Landroid/graphics/Bitmap;

    move-object v6, p2

    invoke-direct/range {v0 .. v6}, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;-><init>(Lcom/rajat/pdfviewer/PdfRendererCore;ILkotlin/jvm/functions/Function3;ZLandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)V

    iput-object p1, v0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->L$0:Ljava/lang/Object;

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 14

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 149
    iget v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->label:I

    const/4 v2, 0x1

    packed-switch v1, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .local p1, "$result":Ljava/lang/Object;
    :pswitch_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto/16 :goto_4

    :pswitch_1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto :goto_1

    :pswitch_2
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->L$0:Ljava/lang/Object;

    check-cast v1, Lkotlinx/coroutines/CoroutineScope;

    .local v1, "$this$launch":Lkotlinx/coroutines/CoroutineScope;
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v3, v1

    move-object v1, p1

    goto :goto_0

    .end local v1    # "$this$launch":Lkotlinx/coroutines/CoroutineScope;
    .end local p1    # "$result":Ljava/lang/Object;
    :pswitch_3
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .restart local p1    # "$result":Ljava/lang/Object;
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->L$0:Ljava/lang/Object;

    check-cast v1, Lkotlinx/coroutines/CoroutineScope;

    .line 150
    .restart local v1    # "$this$launch":Lkotlinx/coroutines/CoroutineScope;
    iget-object v3, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    invoke-static {v3}, Lcom/rajat/pdfviewer/PdfRendererCore;->access$getCacheManager$p(Lcom/rajat/pdfviewer/PdfRendererCore;)Lcom/rajat/pdfviewer/util/CacheManager;

    move-result-object v3

    iget v4, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->$pageNo:I

    move-object v5, p0

    check-cast v5, Lkotlin/coroutines/Continuation;

    iput-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->L$0:Ljava/lang/Object;

    iput v2, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->label:I

    invoke-virtual {v3, v4, v5}, Lcom/rajat/pdfviewer/util/CacheManager;->getBitmapFromCache(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v3

    if-ne v3, v0, :cond_0

    .line 149
    return-object v0

    .line 150
    :cond_0
    move-object v13, v1

    move-object v1, p1

    move-object p1, v3

    move-object v3, v13

    .line 149
    .end local p1    # "$result":Ljava/lang/Object;
    .local v1, "$result":Ljava/lang/Object;
    .local v3, "$this$launch":Lkotlinx/coroutines/CoroutineScope;
    :goto_0
    check-cast p1, Landroid/graphics/Bitmap;

    .line 151
    .local p1, "cachedBitmap":Landroid/graphics/Bitmap;
    const/4 v9, 0x0

    if-eqz p1, :cond_2

    .line 152
    .end local v3    # "$this$launch":Lkotlinx/coroutines/CoroutineScope;
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getMain()Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object v2

    check-cast v2, Lkotlin/coroutines/CoroutineContext;

    new-instance v3, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$1;

    iget-object v4, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->$onBitmapReady:Lkotlin/jvm/functions/Function3;

    iget v5, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->$pageNo:I

    invoke-direct {v3, v4, v5, p1, v9}, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$1;-><init>(Lkotlin/jvm/functions/Function3;ILandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)V

    check-cast v3, Lkotlin/jvm/functions/Function2;

    move-object v4, p0

    check-cast v4, Lkotlin/coroutines/Continuation;

    iput-object v9, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->L$0:Ljava/lang/Object;

    const/4 v5, 0x2

    iput v5, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->label:I

    invoke-static {v2, v3, v4}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "cachedBitmap":Landroid/graphics/Bitmap;
    if-ne p1, v0, :cond_1

    .line 149
    return-object v0

    .line 152
    :cond_1
    move-object p1, v1

    .line 156
    .end local v1    # "$result":Ljava/lang/Object;
    .local p1, "$result":Ljava/lang/Object;
    :goto_1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    .line 159
    .end local p1    # "$result":Ljava/lang/Object;
    .restart local v1    # "$result":Ljava/lang/Object;
    .restart local v3    # "$this$launch":Lkotlinx/coroutines/CoroutineScope;
    :cond_2
    iget-object p1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    invoke-static {p1}, Lcom/rajat/pdfviewer/PdfRendererCore;->access$getRenderStateLock$p(Lcom/rajat/pdfviewer/PdfRendererCore;)Ljava/lang/Object;

    move-result-object p1

    iget-object v10, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    iget v11, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->$pageNo:I

    iget-boolean v4, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->$replaceActive:Z

    iget-object v5, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->$onBitmapReady:Lkotlin/jvm/functions/Function3;

    iget-object v6, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->$bitmap:Landroid/graphics/Bitmap;

    monitor-enter p1

    const/4 v12, 0x0

    .line 160
    .local v12, "$i$a$-synchronized-PdfRendererCore$renderPageInternal$1$renderDecision$1":I
    :try_start_0
    invoke-static {v10}, Lcom/rajat/pdfviewer/PdfRendererCore;->access$getRenderJobs$p(Lcom/rajat/pdfviewer/PdfRendererCore;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v7

    invoke-static {v11}, Lkotlin/coroutines/jvm/internal/Boxing;->boxInt(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lkotlinx/coroutines/Job;

    const/4 v8, 0x0

    if-eqz v7, :cond_3

    invoke-interface {v7}, Lkotlinx/coroutines/Job;->isActive()Z

    move-result v7

    if-ne v7, v2, :cond_3

    goto :goto_2

    :cond_3
    move v2, v8

    .line 161
    .local v2, "activeRenderExists":Z
    :goto_2
    nop

    .line 162
    if-nez v4, :cond_4

    if-eqz v2, :cond_4

    sget-object v4, Lcom/rajat/pdfviewer/PdfRendererCore$RenderDecision$Skip;->INSTANCE:Lcom/rajat/pdfviewer/PdfRendererCore$RenderDecision$Skip;

    check-cast v4, Lcom/rajat/pdfviewer/PdfRendererCore$RenderDecision;

    goto :goto_3

    .line 163
    :cond_4
    if-eqz v4, :cond_5

    if-eqz v2, :cond_5

    .line 164
    .end local v2    # "activeRenderExists":Z
    .end local v3    # "$this$launch":Lkotlinx/coroutines/CoroutineScope;
    invoke-static {v10, v11, v5}, Lcom/rajat/pdfviewer/PdfRendererCore;->access$enqueueRenderCallbackLocked(Lcom/rajat/pdfviewer/PdfRendererCore;ILkotlin/jvm/functions/Function3;)V

    .line 165
    sget-object v2, Lcom/rajat/pdfviewer/PdfRendererCore$RenderDecision$JoinExisting;->INSTANCE:Lcom/rajat/pdfviewer/PdfRendererCore$RenderDecision$JoinExisting;

    move-object v4, v2

    check-cast v4, Lcom/rajat/pdfviewer/PdfRendererCore$RenderDecision;

    goto :goto_3

    .line 169
    .restart local v3    # "$this$launch":Lkotlinx/coroutines/CoroutineScope;
    :cond_5
    invoke-static {v10, v11, v5}, Lcom/rajat/pdfviewer/PdfRendererCore;->access$enqueueRenderCallbackLocked(Lcom/rajat/pdfviewer/PdfRendererCore;ILkotlin/jvm/functions/Function3;)V

    .line 170
    sget-object v5, Lkotlinx/coroutines/CoroutineStart;->LAZY:Lkotlinx/coroutines/CoroutineStart;

    new-instance v2, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;

    invoke-direct {v2, v10, v11, v6, v9}, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;-><init>(Lcom/rajat/pdfviewer/PdfRendererCore;ILandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)V

    move-object v6, v2

    check-cast v6, Lkotlin/jvm/functions/Function2;

    const/4 v7, 0x1

    const/4 v8, 0x0

    const/4 v4, 0x0

    invoke-static/range {v3 .. v8}, Lkotlinx/coroutines/BuildersKt;->launch$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    move-result-object v2

    .end local v3    # "$this$launch":Lkotlinx/coroutines/CoroutineScope;
    .local v2, "renderJob":Lkotlinx/coroutines/Job;
    invoke-static {v11}, Lkotlin/coroutines/jvm/internal/Boxing;->boxInt(I)Ljava/lang/Integer;

    move-result-object v3

    .line 198
    invoke-static {v10}, Lcom/rajat/pdfviewer/PdfRendererCore;->access$getRenderJobs$p(Lcom/rajat/pdfviewer/PdfRendererCore;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    invoke-interface {v4, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    new-instance v3, Lcom/rajat/pdfviewer/PdfRendererCore$RenderDecision$Start;

    invoke-direct {v3, v2}, Lcom/rajat/pdfviewer/PdfRendererCore$RenderDecision$Start;-><init>(Lkotlinx/coroutines/Job;)V

    .end local v2    # "renderJob":Lkotlinx/coroutines/Job;
    move-object v4, v3

    check-cast v4, Lcom/rajat/pdfviewer/PdfRendererCore$RenderDecision;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 201
    :goto_3
    nop

    .line 159
    .end local v12    # "$i$a$-synchronized-PdfRendererCore$renderPageInternal$1$renderDecision$1":I
    monitor-exit p1

    .line 204
    .local v4, "renderDecision":Lcom/rajat/pdfviewer/PdfRendererCore$RenderDecision;
    nop

    .line 205
    sget-object p1, Lcom/rajat/pdfviewer/PdfRendererCore$RenderDecision$Skip;->INSTANCE:Lcom/rajat/pdfviewer/PdfRendererCore$RenderDecision$Skip;

    invoke-static {v4, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    .line 206
    .end local v4    # "renderDecision":Lcom/rajat/pdfviewer/PdfRendererCore$RenderDecision;
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getMain()Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object p1

    check-cast p1, Lkotlin/coroutines/CoroutineContext;

    new-instance v2, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$2;

    iget-object v3, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->$onBitmapReady:Lkotlin/jvm/functions/Function3;

    iget v4, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->$pageNo:I

    invoke-direct {v2, v3, v4, v9}, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$2;-><init>(Lkotlin/jvm/functions/Function3;ILkotlin/coroutines/Continuation;)V

    check-cast v2, Lkotlin/jvm/functions/Function2;

    move-object v3, p0

    check-cast v3, Lkotlin/coroutines/Continuation;

    iput-object v9, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->L$0:Ljava/lang/Object;

    const/4 v4, 0x3

    iput v4, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->label:I

    invoke-static {p1, v2, v3}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_6

    .line 149
    return-object v0

    .line 206
    :cond_6
    move-object p1, v1

    .end local v1    # "$result":Ljava/lang/Object;
    .restart local p1    # "$result":Ljava/lang/Object;
    :goto_4
    move-object v1, p1

    goto :goto_5

    .line 211
    .end local p1    # "$result":Ljava/lang/Object;
    .restart local v1    # "$result":Ljava/lang/Object;
    .restart local v4    # "renderDecision":Lcom/rajat/pdfviewer/PdfRendererCore$RenderDecision;
    :cond_7
    sget-object p1, Lcom/rajat/pdfviewer/PdfRendererCore$RenderDecision$JoinExisting;->INSTANCE:Lcom/rajat/pdfviewer/PdfRendererCore$RenderDecision$JoinExisting;

    invoke-static {v4, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_8

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    goto :goto_5

    .line 212
    :cond_8
    instance-of p1, v4, Lcom/rajat/pdfviewer/PdfRendererCore$RenderDecision$Start;

    if-eqz p1, :cond_9

    move-object p1, v4

    check-cast p1, Lcom/rajat/pdfviewer/PdfRendererCore$RenderDecision$Start;

    invoke-virtual {p1}, Lcom/rajat/pdfviewer/PdfRendererCore$RenderDecision$Start;->getJob()Lkotlinx/coroutines/Job;

    move-result-object p1

    invoke-interface {p1}, Lkotlinx/coroutines/Job;->start()Z

    move-result p1

    invoke-static {p1}, Lkotlin/coroutines/jvm/internal/Boxing;->boxBoolean(Z)Ljava/lang/Boolean;

    .line 215
    .end local v4    # "renderDecision":Lcom/rajat/pdfviewer/PdfRendererCore$RenderDecision;
    :goto_5
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1

    .line 204
    :cond_9
    new-instance p1, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p1}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p1

    .line 159
    :catchall_0
    move-exception v0

    monitor-exit p1

    throw v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
