.class final Lcom/rajat/pdfviewer/PdfRendererCore$closePdfRender$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "PdfRendererCore.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rajat/pdfviewer/PdfRendererCore;->closePdfRender()V
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
    value = "SMAP\nPdfRendererCore.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PdfRendererCore.kt\ncom/rajat/pdfviewer/PdfRendererCore$closePdfRender$1\n+ 2 Mutex.kt\nkotlinx/coroutines/sync/MutexKt\n+ 3 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,393:1\n116#2,8:394\n125#2,2:403\n1#3:402\n*S KotlinDebug\n*F\n+ 1 PdfRendererCore.kt\ncom/rajat/pdfviewer/PdfRendererCore$closePdfRender$1\n*L\n378#1:394,8\n378#1:403,2\n*E\n"
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
    c = "com.rajat.pdfviewer.PdfRendererCore$closePdfRender$1"
    f = "PdfRendererCore.kt"
    i = {
        0x0,
        0x0
    }
    l = {
        0x18f
    }
    m = "invokeSuspend"
    n = {
        "$this$runBlocking",
        "$this$withLock_u24default$iv"
    }
    s = {
        "L$0",
        "L$1"
    }
.end annotation


# instance fields
.field private synthetic L$0:Ljava/lang/Object;

.field L$1:Ljava/lang/Object;

.field L$2:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lcom/rajat/pdfviewer/PdfRendererCore;


# direct methods
.method constructor <init>(Lcom/rajat/pdfviewer/PdfRendererCore;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/rajat/pdfviewer/PdfRendererCore;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/rajat/pdfviewer/PdfRendererCore$closePdfRender$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$closePdfRender$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    const/4 v0, 0x2

    invoke-direct {p0, v0, p2}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 2
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

    new-instance v0, Lcom/rajat/pdfviewer/PdfRendererCore$closePdfRender$1;

    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$closePdfRender$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    invoke-direct {v0, v1, p2}, Lcom/rajat/pdfviewer/PdfRendererCore$closePdfRender$1;-><init>(Lcom/rajat/pdfviewer/PdfRendererCore;Lkotlin/coroutines/Continuation;)V

    iput-object p1, v0, Lcom/rajat/pdfviewer/PdfRendererCore$closePdfRender$1;->L$0:Ljava/lang/Object;

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfRendererCore$closePdfRender$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfRendererCore$closePdfRender$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/rajat/pdfviewer/PdfRendererCore$closePdfRender$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/rajat/pdfviewer/PdfRendererCore$closePdfRender$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 11

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 377
    iget v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$closePdfRender$1;->label:I

    packed-switch v1, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .local p1, "$result":Ljava/lang/Object;
    :pswitch_0
    const/4 v0, 0x0

    .local v0, "$i$f$withLock":I
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$closePdfRender$1;->L$2:Ljava/lang/Object;

    check-cast v1, Lcom/rajat/pdfviewer/PdfRendererCore;

    const/4 v2, 0x0

    .local v2, "owner$iv":Ljava/lang/Object;
    iget-object v3, p0, Lcom/rajat/pdfviewer/PdfRendererCore$closePdfRender$1;->L$1:Ljava/lang/Object;

    check-cast v3, Lkotlinx/coroutines/sync/Mutex;

    .local v3, "$this$withLock_u24default$iv":Lkotlinx/coroutines/sync/Mutex;
    iget-object v4, p0, Lcom/rajat/pdfviewer/PdfRendererCore$closePdfRender$1;->L$0:Ljava/lang/Object;

    check-cast v4, Lkotlinx/coroutines/CoroutineScope;

    .local v4, "$this$runBlocking":Lkotlinx/coroutines/CoroutineScope;
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto :goto_0

    .end local v0    # "$i$f$withLock":I
    .end local v2    # "owner$iv":Ljava/lang/Object;
    .end local v3    # "$this$withLock_u24default$iv":Lkotlinx/coroutines/sync/Mutex;
    .end local v4    # "$this$runBlocking":Lkotlinx/coroutines/CoroutineScope;
    .end local p1    # "$result":Ljava/lang/Object;
    :pswitch_1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .restart local p1    # "$result":Ljava/lang/Object;
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$closePdfRender$1;->L$0:Ljava/lang/Object;

    move-object v4, v1

    check-cast v4, Lkotlinx/coroutines/CoroutineScope;

    .line 378
    .restart local v4    # "$this$runBlocking":Lkotlinx/coroutines/CoroutineScope;
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$closePdfRender$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    invoke-static {v1}, Lcom/rajat/pdfviewer/PdfRendererCore;->access$getRenderLock$p(Lcom/rajat/pdfviewer/PdfRendererCore;)Lkotlinx/coroutines/sync/Mutex;

    move-result-object v3

    .restart local v3    # "$this$withLock_u24default$iv":Lkotlinx/coroutines/sync/Mutex;
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$closePdfRender$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    .line 394
    nop

    .line 395
    const/4 v2, 0x0

    .line 394
    .restart local v2    # "owner$iv":Ljava/lang/Object;
    const/4 v5, 0x0

    .line 399
    .local v5, "$i$f$withLock":I
    move-object v6, p0

    check-cast v6, Lkotlin/coroutines/Continuation;

    iput-object v4, p0, Lcom/rajat/pdfviewer/PdfRendererCore$closePdfRender$1;->L$0:Ljava/lang/Object;

    iput-object v3, p0, Lcom/rajat/pdfviewer/PdfRendererCore$closePdfRender$1;->L$1:Ljava/lang/Object;

    iput-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$closePdfRender$1;->L$2:Ljava/lang/Object;

    const/4 v7, 0x1

    iput v7, p0, Lcom/rajat/pdfviewer/PdfRendererCore$closePdfRender$1;->label:I

    invoke-interface {v3, v2, v6}, Lkotlinx/coroutines/sync/Mutex;->lock(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v6

    if-ne v6, v0, :cond_0

    .line 377
    return-object v0

    .line 399
    :cond_0
    move v0, v5

    .line 400
    .end local v5    # "$i$f$withLock":I
    .restart local v0    # "$i$f$withLock":I
    :goto_0
    nop

    .line 401
    const/4 v5, 0x0

    .line 379
    .local v5, "$i$a$-withLock$default-PdfRendererCore$closePdfRender$1$1":I
    :try_start_0
    invoke-static {v1}, Lcom/rajat/pdfviewer/PdfRendererCore;->access$isRendererOpen$p(Lcom/rajat/pdfviewer/PdfRendererCore;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 382
    const/4 v6, 0x0

    invoke-static {v1, v6}, Lcom/rajat/pdfviewer/PdfRendererCore;->access$setRendererOpen$p(Lcom/rajat/pdfviewer/PdfRendererCore;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 384
    :try_start_1
    sget-object v6, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 402
    const/4 v6, 0x0

    .line 384
    .local v6, "$i$a$-runCatching-PdfRendererCore$closePdfRender$1$1$1":I
    invoke-static {v1}, Lcom/rajat/pdfviewer/PdfRendererCore;->access$getPdfRenderer$p(Lcom/rajat/pdfviewer/PdfRendererCore;)Landroid/graphics/pdf/PdfRenderer;

    move-result-object v7

    invoke-virtual {v7}, Landroid/graphics/pdf/PdfRenderer;->close()V

    .end local v6    # "$i$a$-runCatching-PdfRendererCore$closePdfRender$1$1$1":I
    sget-object v6, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-static {v6}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v6

    :try_start_2
    sget-object v7, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {v6}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 385
    :goto_1
    invoke-static {v6}, Lkotlin/Result;->exceptionOrNull-impl(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    const-string v7, "PdfRendererCore"

    if-eqz v6, :cond_1

    .line 402
    .local v6, "it":Ljava/lang/Throwable;
    const/4 v8, 0x0

    .line 385
    .local v8, "$i$a$-onFailure-PdfRendererCore$closePdfRender$1$1$2":I
    :try_start_3
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Error closing PdfRenderer: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v6}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v9, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 387
    .end local v6    # "it":Ljava/lang/Throwable;
    .end local v8    # "$i$a$-onFailure-PdfRendererCore$closePdfRender$1$1$2":I
    :cond_1
    nop

    .end local v4    # "$this$runBlocking":Lkotlinx/coroutines/CoroutineScope;
    :try_start_4
    sget-object v4, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 402
    const/4 v4, 0x0

    .line 387
    .local v4, "$i$a$-runCatching-PdfRendererCore$closePdfRender$1$1$3":I
    invoke-static {v1}, Lcom/rajat/pdfviewer/PdfRendererCore;->access$getFileDescriptor$p(Lcom/rajat/pdfviewer/PdfRendererCore;)Landroid/os/ParcelFileDescriptor;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/ParcelFileDescriptor;->close()V

    .end local v4    # "$i$a$-runCatching-PdfRendererCore$closePdfRender$1$1$3":I
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-static {v1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v1

    :try_start_5
    sget-object v4, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {v1}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 388
    :goto_2
    invoke-static {v1}, Lkotlin/Result;->exceptionOrNull-impl(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 402
    .local v1, "it":Ljava/lang/Throwable;
    const/4 v4, 0x0

    .line 388
    .local v4, "$i$a$-onFailure-PdfRendererCore$closePdfRender$1$1$4":I
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Error closing file descriptor: "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v7, v6, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 389
    .end local v1    # "it":Ljava/lang/Throwable;
    .end local v4    # "$i$a$-onFailure-PdfRendererCore$closePdfRender$1$1$4":I
    :cond_2
    nop

    .end local v5    # "$i$a$-withLock$default-PdfRendererCore$closePdfRender$1$1":I
    :cond_3
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 401
    nop

    .line 403
    invoke-interface {v3, v2}, Lkotlinx/coroutines/sync/Mutex;->unlock(Ljava/lang/Object;)V

    .line 404
    .end local v2    # "owner$iv":Ljava/lang/Object;
    .end local v3    # "$this$withLock_u24default$iv":Lkotlinx/coroutines/sync/Mutex;
    nop

    .line 400
    .restart local v2    # "owner$iv":Ljava/lang/Object;
    .restart local v3    # "$this$withLock_u24default$iv":Lkotlinx/coroutines/sync/Mutex;
    nop

    .line 390
    .end local v0    # "$i$f$withLock":I
    .end local v2    # "owner$iv":Ljava/lang/Object;
    .end local v3    # "$this$withLock_u24default$iv":Lkotlinx/coroutines/sync/Mutex;
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    .line 403
    .restart local v0    # "$i$f$withLock":I
    .restart local v2    # "owner$iv":Ljava/lang/Object;
    .restart local v3    # "$this$withLock_u24default$iv":Lkotlinx/coroutines/sync/Mutex;
    :catchall_2
    move-exception v1

    invoke-interface {v3, v2}, Lkotlinx/coroutines/sync/Mutex;->unlock(Ljava/lang/Object;)V

    throw v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
