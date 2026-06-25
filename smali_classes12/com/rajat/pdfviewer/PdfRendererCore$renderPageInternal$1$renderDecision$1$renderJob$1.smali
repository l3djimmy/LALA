.class final Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "PdfRendererCore.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
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
    c = "com.rajat.pdfviewer.PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1"
    f = "PdfRendererCore.kt"
    i = {
        0x0,
        0x0,
        0x1,
        0x1
    }
    l = {
        0xb1,
        0xbb,
        0xc3,
        0xc3,
        0xc3
    }
    m = "invokeSuspend"
    n = {
        "$this$launch",
        "success",
        "$this$launch",
        "success"
    }
    s = {
        "L$0",
        "I$0",
        "L$0",
        "I$0"
    }
.end annotation


# instance fields
.field final synthetic $bitmap:Landroid/graphics/Bitmap;

.field final synthetic $pageNo:I

.field I$0:I

.field private synthetic L$0:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lcom/rajat/pdfviewer/PdfRendererCore;


# direct methods
.method constructor <init>(Lcom/rajat/pdfviewer/PdfRendererCore;ILandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/rajat/pdfviewer/PdfRendererCore;",
            "I",
            "Landroid/graphics/Bitmap;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    iput p2, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->$pageNo:I

    iput-object p3, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->$bitmap:Landroid/graphics/Bitmap;

    const/4 v0, 0x2

    invoke-direct {p0, v0, p4}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method

.method static final invokeSuspend$lambda$0(Landroid/graphics/Bitmap;Landroid/graphics/pdf/PdfRenderer$Page;)Lkotlin/Unit;
    .locals 2
    .param p0, "$bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "pdfPage"    # Landroid/graphics/pdf/PdfRenderer$Page;

    .line 178
    nop

    .line 179
    nop

    .line 180
    nop

    .line 181
    nop

    .line 182
    nop

    .line 178
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p1, p0, v0, v0, v1}, Landroid/graphics/pdf/PdfRenderer$Page;->render(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Matrix;I)V

    .line 184
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 4
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

    new-instance v0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;

    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    iget v2, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->$pageNo:I

    iget-object v3, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->$bitmap:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1, v2, v3, p2}, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;-><init>(Lcom/rajat/pdfviewer/PdfRendererCore;ILandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)V

    iput-object p1, v0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->L$0:Ljava/lang/Object;

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 13

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 170
    iget v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->label:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    packed-switch v1, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .local p1, "$result":Ljava/lang/Object;
    :pswitch_0
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->L$0:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Throwable;

    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto/16 :goto_9

    :pswitch_1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto/16 :goto_4

    :pswitch_2
    iget v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->I$0:I

    .local v1, "success":Z
    const/4 v5, 0x0

    .local v5, "renderedBitmap":Landroid/graphics/Bitmap;
    iget-object v6, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->L$0:Ljava/lang/Object;

    check-cast v6, Lkotlinx/coroutines/CoroutineScope;

    .local v6, "$this$launch":Lkotlinx/coroutines/CoroutineScope;
    :try_start_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    goto :goto_1

    .end local v1    # "success":Z
    .end local v5    # "renderedBitmap":Landroid/graphics/Bitmap;
    .end local v6    # "$this$launch":Lkotlinx/coroutines/CoroutineScope;
    :pswitch_3
    iget v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->I$0:I

    .restart local v1    # "success":Z
    const/4 v5, 0x0

    .restart local v5    # "renderedBitmap":Landroid/graphics/Bitmap;
    iget-object v6, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->L$0:Ljava/lang/Object;

    check-cast v6, Lkotlinx/coroutines/CoroutineScope;

    .restart local v6    # "$this$launch":Lkotlinx/coroutines/CoroutineScope;
    :try_start_1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-object v7, v6

    move-object v6, v5

    move v5, v1

    move-object v1, p1

    goto :goto_0

    .end local v1    # "success":Z
    .end local v5    # "renderedBitmap":Landroid/graphics/Bitmap;
    .end local v6    # "$this$launch":Lkotlinx/coroutines/CoroutineScope;
    .end local p1    # "$result":Ljava/lang/Object;
    :pswitch_4
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .restart local p1    # "$result":Ljava/lang/Object;
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->L$0:Ljava/lang/Object;

    move-object v6, v1

    check-cast v6, Lkotlinx/coroutines/CoroutineScope;

    .line 171
    .restart local v6    # "$this$launch":Lkotlinx/coroutines/CoroutineScope;
    const/4 v1, 0x0

    .line 172
    .restart local v1    # "success":Z
    const/4 v5, 0x0

    .line 174
    .restart local v5    # "renderedBitmap":Landroid/graphics/Bitmap;
    nop

    .line 177
    :try_start_2
    iget-object v7, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    iget v8, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->$pageNo:I

    iget-object v9, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->$bitmap:Landroid/graphics/Bitmap;

    new-instance v10, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1$$ExternalSyntheticLambda0;

    invoke-direct {v10, v9}, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1$$ExternalSyntheticLambda0;-><init>(Landroid/graphics/Bitmap;)V

    move-object v9, p0

    check-cast v9, Lkotlin/coroutines/Continuation;

    iput-object v6, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->L$0:Ljava/lang/Object;

    iput v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->I$0:I

    iput v3, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->label:I

    invoke-static {v7, v8, v10, v9}, Lcom/rajat/pdfviewer/PdfRendererCore;->access$withPdfPage(Lcom/rajat/pdfviewer/PdfRendererCore;ILkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v7
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-ne v7, v0, :cond_0

    .line 170
    return-object v0

    .line 177
    :cond_0
    move v12, v1

    move-object v1, p1

    move-object p1, v7

    move-object v7, v6

    move-object v6, v5

    move v5, v12

    .line 170
    .end local p1    # "$result":Ljava/lang/Object;
    .local v1, "$result":Ljava/lang/Object;
    .local v5, "success":Z
    .local v6, "renderedBitmap":Landroid/graphics/Bitmap;
    .local v7, "$this$launch":Lkotlinx/coroutines/CoroutineScope;
    :goto_0
    :try_start_3
    check-cast p1, Lkotlin/Unit;

    .line 186
    .local p1, "rendered":Lkotlin/Unit;
    if-eqz p1, :cond_2

    .line 187
    .end local p1    # "rendered":Lkotlin/Unit;
    iget-object p1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    iget v8, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->$pageNo:I

    iget-object v9, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->$bitmap:Landroid/graphics/Bitmap;

    move-object v10, p0

    check-cast v10, Lkotlin/coroutines/Continuation;

    iput-object v7, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->L$0:Ljava/lang/Object;

    iput v5, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->I$0:I

    const/4 v11, 0x2

    iput v11, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->label:I

    invoke-static {p1, v8, v9, v10}, Lcom/rajat/pdfviewer/PdfRendererCore;->access$addBitmapToMemoryCache(Lcom/rajat/pdfviewer/PdfRendererCore;ILandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-ne p1, v0, :cond_1

    .line 170
    return-object v0

    .line 187
    :cond_1
    move-object p1, v1

    move v1, v5

    move-object v5, v6

    move-object v6, v7

    .line 188
    .end local v7    # "$this$launch":Lkotlinx/coroutines/CoroutineScope;
    .local v1, "success":Z
    .local v5, "renderedBitmap":Landroid/graphics/Bitmap;
    .local v6, "$this$launch":Lkotlinx/coroutines/CoroutineScope;
    .local p1, "$result":Ljava/lang/Object;
    :goto_1
    const/4 v1, 0x1

    .line 189
    :try_start_4
    iget-object v7, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->$bitmap:Landroid/graphics/Bitmap;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    move-object v5, v7

    move-object v7, v6

    move-object v6, v5

    move v5, v1

    .end local v5    # "renderedBitmap":Landroid/graphics/Bitmap;
    .local v7, "renderedBitmap":Landroid/graphics/Bitmap;
    goto :goto_2

    .line 186
    .local v1, "$result":Ljava/lang/Object;
    .local v5, "success":Z
    .local v6, "renderedBitmap":Landroid/graphics/Bitmap;
    .local v7, "$this$launch":Lkotlinx/coroutines/CoroutineScope;
    .local p1, "rendered":Lkotlin/Unit;
    :cond_2
    move-object p1, v1

    .line 194
    .end local v1    # "$result":Ljava/lang/Object;
    .local p1, "$result":Ljava/lang/Object;
    :goto_2
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    iget v8, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->$pageNo:I

    invoke-interface {v7}, Lkotlinx/coroutines/CoroutineScope;->getCoroutineContext()Lkotlin/coroutines/CoroutineContext;

    move-result-object v9

    sget-object v10, Lkotlinx/coroutines/Job;->Key:Lkotlinx/coroutines/Job$Key;

    check-cast v10, Lkotlin/coroutines/CoroutineContext$Key;

    invoke-interface {v9, v10}, Lkotlin/coroutines/CoroutineContext;->get(Lkotlin/coroutines/CoroutineContext$Key;)Lkotlin/coroutines/CoroutineContext$Element;

    move-result-object v9

    .end local v7    # "$this$launch":Lkotlinx/coroutines/CoroutineScope;
    instance-of v7, v9, Lkotlinx/coroutines/Job;

    if-eqz v7, :cond_3

    check-cast v9, Lkotlinx/coroutines/Job;

    goto :goto_3

    :cond_3
    move-object v9, v4

    :goto_3
    invoke-static {v1, v8, v9}, Lcom/rajat/pdfviewer/PdfRendererCore;->access$clearRenderJob(Lcom/rajat/pdfviewer/PdfRendererCore;ILkotlinx/coroutines/Job;)V

    .line 195
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    iget v7, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->$pageNo:I

    if-eqz v5, :cond_4

    move v2, v3

    nop

    .end local v5    # "success":Z
    :cond_4
    move-object v3, p0

    check-cast v3, Lkotlin/coroutines/Continuation;

    iput-object v4, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->L$0:Ljava/lang/Object;

    const/4 v4, 0x3

    iput v4, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->label:I

    invoke-static {v1, v7, v2, v6, v3}, Lcom/rajat/pdfviewer/PdfRendererCore;->access$deliverRenderCallbacks(Lcom/rajat/pdfviewer/PdfRendererCore;IZLandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    .end local v6    # "renderedBitmap":Landroid/graphics/Bitmap;
    if-ne v1, v0, :cond_5

    .line 170
    return-object v0

    .line 196
    :cond_5
    :goto_4
    goto/16 :goto_7

    .line 194
    .end local p1    # "$result":Ljava/lang/Object;
    .restart local v1    # "$result":Ljava/lang/Object;
    .restart local v5    # "success":Z
    .restart local v6    # "renderedBitmap":Landroid/graphics/Bitmap;
    .restart local v7    # "$this$launch":Lkotlinx/coroutines/CoroutineScope;
    :catchall_0
    move-exception p1

    move-object v12, v7

    move-object v7, p1

    move-object p1, v1

    move v1, v5

    move-object v5, v6

    move-object v6, v12

    goto/16 :goto_8

    .line 191
    :catch_0
    move-exception p1

    move-object v12, v7

    move-object v7, p1

    move-object p1, v1

    move v1, v5

    move-object v5, v6

    move-object v6, v12

    goto :goto_5

    .line 194
    .end local v7    # "$this$launch":Lkotlinx/coroutines/CoroutineScope;
    .local v1, "success":Z
    .local v5, "renderedBitmap":Landroid/graphics/Bitmap;
    .local v6, "$this$launch":Lkotlinx/coroutines/CoroutineScope;
    .restart local p1    # "$result":Ljava/lang/Object;
    :catchall_1
    move-exception v7

    goto :goto_8

    .line 191
    :catch_1
    move-exception v7

    .line 192
    .local v7, "e":Ljava/lang/Exception;
    :goto_5
    :try_start_5
    const-string v8, "PdfRendererCore"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Error rendering page "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->$pageNo:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ": "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v7}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    move-object v10, v7

    check-cast v10, Ljava/lang/Throwable;

    invoke-static {v8, v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 194
    nop

    .end local v7    # "e":Ljava/lang/Exception;
    iget-object v7, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    iget v8, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->$pageNo:I

    invoke-interface {v6}, Lkotlinx/coroutines/CoroutineScope;->getCoroutineContext()Lkotlin/coroutines/CoroutineContext;

    move-result-object v9

    sget-object v10, Lkotlinx/coroutines/Job;->Key:Lkotlinx/coroutines/Job$Key;

    check-cast v10, Lkotlin/coroutines/CoroutineContext$Key;

    invoke-interface {v9, v10}, Lkotlin/coroutines/CoroutineContext;->get(Lkotlin/coroutines/CoroutineContext$Key;)Lkotlin/coroutines/CoroutineContext$Element;

    move-result-object v9

    .end local v6    # "$this$launch":Lkotlinx/coroutines/CoroutineScope;
    instance-of v6, v9, Lkotlinx/coroutines/Job;

    if-eqz v6, :cond_6

    check-cast v9, Lkotlinx/coroutines/Job;

    goto :goto_6

    :cond_6
    move-object v9, v4

    :goto_6
    invoke-static {v7, v8, v9}, Lcom/rajat/pdfviewer/PdfRendererCore;->access$clearRenderJob(Lcom/rajat/pdfviewer/PdfRendererCore;ILkotlinx/coroutines/Job;)V

    .line 195
    iget-object v6, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    iget v7, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->$pageNo:I

    if-eqz v1, :cond_7

    move v2, v3

    nop

    .end local v1    # "success":Z
    :cond_7
    move-object v1, p0

    check-cast v1, Lkotlin/coroutines/Continuation;

    iput-object v4, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->L$0:Ljava/lang/Object;

    const/4 v3, 0x4

    iput v3, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->label:I

    invoke-static {v6, v7, v2, v5, v1}, Lcom/rajat/pdfviewer/PdfRendererCore;->access$deliverRenderCallbacks(Lcom/rajat/pdfviewer/PdfRendererCore;IZLandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    .end local v5    # "renderedBitmap":Landroid/graphics/Bitmap;
    if-ne v1, v0, :cond_5

    .line 170
    return-object v0

    .line 197
    :goto_7
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    .line 194
    .restart local v1    # "success":Z
    .restart local v5    # "renderedBitmap":Landroid/graphics/Bitmap;
    .restart local v6    # "$this$launch":Lkotlinx/coroutines/CoroutineScope;
    :goto_8
    iget-object v8, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    iget v9, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->$pageNo:I

    invoke-interface {v6}, Lkotlinx/coroutines/CoroutineScope;->getCoroutineContext()Lkotlin/coroutines/CoroutineContext;

    move-result-object v10

    sget-object v11, Lkotlinx/coroutines/Job;->Key:Lkotlinx/coroutines/Job$Key;

    check-cast v11, Lkotlin/coroutines/CoroutineContext$Key;

    invoke-interface {v10, v11}, Lkotlin/coroutines/CoroutineContext;->get(Lkotlin/coroutines/CoroutineContext$Key;)Lkotlin/coroutines/CoroutineContext$Element;

    move-result-object v10

    .end local v6    # "$this$launch":Lkotlinx/coroutines/CoroutineScope;
    instance-of v6, v10, Lkotlinx/coroutines/Job;

    if-eqz v6, :cond_8

    move-object v4, v10

    check-cast v4, Lkotlinx/coroutines/Job;

    :cond_8
    invoke-static {v8, v9, v4}, Lcom/rajat/pdfviewer/PdfRendererCore;->access$clearRenderJob(Lcom/rajat/pdfviewer/PdfRendererCore;ILkotlinx/coroutines/Job;)V

    .line 195
    iget-object v4, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    iget v6, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->$pageNo:I

    if-eqz v1, :cond_9

    move v2, v3

    nop

    .end local v1    # "success":Z
    :cond_9
    move-object v1, p0

    check-cast v1, Lkotlin/coroutines/Continuation;

    iput-object v7, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->L$0:Ljava/lang/Object;

    const/4 v3, 0x5

    iput v3, p0, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1$renderDecision$1$renderJob$1;->label:I

    invoke-static {v4, v6, v2, v5, v1}, Lcom/rajat/pdfviewer/PdfRendererCore;->access$deliverRenderCallbacks(Lcom/rajat/pdfviewer/PdfRendererCore;IZLandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    .end local v5    # "renderedBitmap":Landroid/graphics/Bitmap;
    if-ne v1, v0, :cond_a

    .line 170
    return-object v0

    .line 195
    :cond_a
    move-object v0, v7

    .line 197
    :goto_9
    throw v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
