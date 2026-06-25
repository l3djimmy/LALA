.class final Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "PdfRendererCore.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rajat/pdfviewer/PdfRendererCore;->withPdfPage(ILkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
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
        "-TT;>;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPdfRendererCore.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PdfRendererCore.kt\ncom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2\n+ 2 Mutex.kt\nkotlinx/coroutines/sync/MutexKt\n*L\n1#1,393:1\n116#2,11:394\n*S KotlinDebug\n*F\n+ 1 PdfRendererCore.kt\ncom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2\n*L\n349#1:394,11\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u0004\u0018\u0001H\u0001\"\u0004\u0008\u0000\u0010\u0001*\u00020\u0002H\n"
    }
    d2 = {
        "<anonymous>",
        "T",
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
    c = "com.rajat.pdfviewer.PdfRendererCore$withPdfPage$2"
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
        "$this$withContext",
        "$this$withLock_u24default$iv"
    }
    s = {
        "L$0",
        "L$1"
    }
.end annotation


# instance fields
.field final synthetic $block:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "Landroid/graphics/pdf/PdfRenderer$Page;",
            "TT;>;"
        }
    .end annotation
.end field

.field final synthetic $pageNo:I

.field I$0:I

.field private synthetic L$0:Ljava/lang/Object;

.field L$1:Ljava/lang/Object;

.field L$2:Ljava/lang/Object;

.field L$3:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lcom/rajat/pdfviewer/PdfRendererCore;


# direct methods
.method constructor <init>(Lcom/rajat/pdfviewer/PdfRendererCore;ILkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/rajat/pdfviewer/PdfRendererCore;",
            "I",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroid/graphics/pdf/PdfRenderer$Page;",
            "+TT;>;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    iput p2, p0, Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;->$pageNo:I

    iput-object p3, p0, Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;->$block:Lkotlin/jvm/functions/Function1;

    const/4 v0, 0x2

    invoke-direct {p0, v0, p4}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
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

    new-instance v0, Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;

    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    iget v2, p0, Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;->$pageNo:I

    iget-object v3, p0, Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;->$block:Lkotlin/jvm/functions/Function1;

    invoke-direct {v0, v1, v2, v3, p2}, Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;-><init>(Lcom/rajat/pdfviewer/PdfRendererCore;ILkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)V

    iput-object p1, v0, Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;->L$0:Ljava/lang/Object;

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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
            "-TT;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 11

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 348
    iget v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;->label:I

    const/4 v2, 0x0

    packed-switch v1, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .local p1, "$result":Ljava/lang/Object;
    :pswitch_0
    const/4 v0, 0x0

    .local v0, "$i$f$withLock":I
    iget v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;->I$0:I

    iget-object v3, p0, Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;->L$3:Ljava/lang/Object;

    check-cast v3, Lkotlin/jvm/functions/Function1;

    iget-object v4, p0, Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;->L$2:Ljava/lang/Object;

    check-cast v4, Lcom/rajat/pdfviewer/PdfRendererCore;

    iget-object v5, p0, Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;->L$1:Ljava/lang/Object;

    check-cast v5, Lkotlinx/coroutines/sync/Mutex;

    iget-object v6, p0, Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;->L$0:Ljava/lang/Object;

    check-cast v6, Lkotlinx/coroutines/CoroutineScope;

    .local v6, "$this$withContext":Lkotlinx/coroutines/CoroutineScope;
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v7, v2

    goto :goto_0

    .end local v0    # "$i$f$withLock":I
    .end local v6    # "$this$withContext":Lkotlinx/coroutines/CoroutineScope;
    .end local p1    # "$result":Ljava/lang/Object;
    :pswitch_1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .restart local p1    # "$result":Ljava/lang/Object;
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;->L$0:Ljava/lang/Object;

    move-object v6, v1

    check-cast v6, Lkotlinx/coroutines/CoroutineScope;

    .line 349
    .restart local v6    # "$this$withContext":Lkotlinx/coroutines/CoroutineScope;
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    invoke-static {v1}, Lcom/rajat/pdfviewer/PdfRendererCore;->access$getRenderLock$p(Lcom/rajat/pdfviewer/PdfRendererCore;)Lkotlinx/coroutines/sync/Mutex;

    move-result-object v5

    .local v5, "$this$withLock_u24default$iv":Lkotlinx/coroutines/sync/Mutex;
    iget-object v4, p0, Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    iget v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;->$pageNo:I

    iget-object v3, p0, Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;->$block:Lkotlin/jvm/functions/Function1;

    .line 394
    nop

    .line 395
    const/4 v7, 0x0

    .line 394
    .local v7, "owner$iv":Ljava/lang/Object;
    const/4 v8, 0x0

    .line 399
    .local v8, "$i$f$withLock":I
    move-object v9, p0

    check-cast v9, Lkotlin/coroutines/Continuation;

    iput-object v6, p0, Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;->L$0:Ljava/lang/Object;

    iput-object v5, p0, Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;->L$1:Ljava/lang/Object;

    iput-object v4, p0, Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;->L$2:Ljava/lang/Object;

    iput-object v3, p0, Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;->L$3:Ljava/lang/Object;

    iput v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;->I$0:I

    const/4 v10, 0x1

    iput v10, p0, Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;->label:I

    invoke-interface {v5, v7, v9}, Lkotlinx/coroutines/sync/Mutex;->lock(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v9

    if-ne v9, v0, :cond_0

    .line 348
    return-object v0

    .line 399
    :cond_0
    move v0, v8

    .line 400
    .end local v5    # "$this$withLock_u24default$iv":Lkotlinx/coroutines/sync/Mutex;
    .end local v7    # "owner$iv":Ljava/lang/Object;
    .end local v8    # "$i$f$withLock":I
    .restart local v0    # "$i$f$withLock":I
    :goto_0
    nop

    .line 401
    const/4 v8, 0x0

    .line 350
    .local v8, "$i$a$-withLock$default-PdfRendererCore$withPdfPage$2$1":I
    :try_start_0
    invoke-interface {v6}, Lkotlinx/coroutines/CoroutineScope;->getCoroutineContext()Lkotlin/coroutines/CoroutineContext;

    move-result-object v9

    invoke-static {v9}, Lkotlinx/coroutines/JobKt;->ensureActive(Lkotlin/coroutines/CoroutineContext;)V

    .line 351
    .end local v6    # "$this$withContext":Lkotlinx/coroutines/CoroutineScope;
    invoke-static {v4}, Lcom/rajat/pdfviewer/PdfRendererCore;->access$isRendererOpen$p(Lcom/rajat/pdfviewer/PdfRendererCore;)Z

    move-result v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    if-nez v6, :cond_1

    .line 403
    .end local v0    # "$i$f$withLock":I
    .end local v8    # "$i$a$-withLock$default-PdfRendererCore$withPdfPage$2$1":I
    invoke-interface {v5, v7}, Lkotlinx/coroutines/sync/Mutex;->unlock(Ljava/lang/Object;)V

    return-object v2

    .line 352
    .restart local v0    # "$i$f$withLock":I
    .restart local v5    # "$this$withLock_u24default$iv":Lkotlinx/coroutines/sync/Mutex;
    .restart local v7    # "owner$iv":Ljava/lang/Object;
    .restart local v8    # "$i$a$-withLock$default-PdfRendererCore$withPdfPage$2$1":I
    :cond_1
    nop

    .line 353
    :try_start_1
    invoke-static {v4}, Lcom/rajat/pdfviewer/PdfRendererCore;->access$getPdfRenderer$p(Lcom/rajat/pdfviewer/PdfRendererCore;)Landroid/graphics/pdf/PdfRenderer;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/graphics/pdf/PdfRenderer;->openPage(I)Landroid/graphics/pdf/PdfRenderer$Page;

    move-result-object v1

    const-string/jumbo v4, "openPage(...)"

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Ljava/lang/AutoCloseable;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    :try_start_2
    invoke-interface {v3, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    invoke-static {v1, v2}, Lkotlin/jdk7/AutoCloseableKt;->closeFinally(Ljava/lang/AutoCloseable;Ljava/lang/Throwable;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    move-object v2, v3

    goto :goto_1

    :catchall_0
    move-exception v3

    .end local v0    # "$i$f$withLock":I
    .end local v5    # "$this$withLock_u24default$iv":Lkotlinx/coroutines/sync/Mutex;
    .end local v7    # "owner$iv":Ljava/lang/Object;
    .end local v8    # "$i$a$-withLock$default-PdfRendererCore$withPdfPage$2$1":I
    .end local p1    # "$result":Ljava/lang/Object;
    :try_start_4
    throw v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .restart local v0    # "$i$f$withLock":I
    .restart local v5    # "$this$withLock_u24default$iv":Lkotlinx/coroutines/sync/Mutex;
    .restart local v7    # "owner$iv":Ljava/lang/Object;
    .restart local v8    # "$i$a$-withLock$default-PdfRendererCore$withPdfPage$2$1":I
    .restart local p1    # "$result":Ljava/lang/Object;
    :catchall_1
    move-exception v4

    :try_start_5
    invoke-static {v1, v3}, Lkotlin/jdk7/AutoCloseableKt;->closeFinally(Ljava/lang/AutoCloseable;Ljava/lang/Throwable;)V

    .end local v0    # "$i$f$withLock":I
    .end local v5    # "$this$withLock_u24default$iv":Lkotlinx/coroutines/sync/Mutex;
    .end local v7    # "owner$iv":Ljava/lang/Object;
    .end local v8    # "$i$a$-withLock$default-PdfRendererCore$withPdfPage$2$1":I
    .end local p1    # "$result":Ljava/lang/Object;
    throw v4
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 403
    .restart local v0    # "$i$f$withLock":I
    .restart local v5    # "$this$withLock_u24default$iv":Lkotlinx/coroutines/sync/Mutex;
    .restart local v7    # "owner$iv":Ljava/lang/Object;
    .restart local p1    # "$result":Ljava/lang/Object;
    :catchall_2
    move-exception v1

    goto :goto_2

    .line 354
    .restart local v8    # "$i$a$-withLock$default-PdfRendererCore$withPdfPage$2$1":I
    :catch_0
    move-exception v1

    .line 355
    .local v1, "e":Ljava/lang/Exception;
    :try_start_6
    const-string v3, "PdfRendererCore"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "withPdfPage error: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object v6, v1

    check-cast v6, Ljava/lang/Throwable;

    invoke-static {v3, v4, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 356
    nop

    .line 357
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_1
    nop

    .line 401
    .end local v8    # "$i$a$-withLock$default-PdfRendererCore$withPdfPage$2$1":I
    nop

    .line 403
    invoke-interface {v5, v7}, Lkotlinx/coroutines/sync/Mutex;->unlock(Ljava/lang/Object;)V

    .line 404
    .end local v5    # "$this$withLock_u24default$iv":Lkotlinx/coroutines/sync/Mutex;
    .end local v7    # "owner$iv":Ljava/lang/Object;
    nop

    .line 400
    .restart local v5    # "$this$withLock_u24default$iv":Lkotlinx/coroutines/sync/Mutex;
    .restart local v7    # "owner$iv":Ljava/lang/Object;
    nop

    .line 358
    .end local v0    # "$i$f$withLock":I
    .end local v5    # "$this$withLock_u24default$iv":Lkotlinx/coroutines/sync/Mutex;
    .end local v7    # "owner$iv":Ljava/lang/Object;
    return-object v2

    .line 403
    .restart local v0    # "$i$f$withLock":I
    :catchall_3
    move-exception v1

    .restart local v5    # "$this$withLock_u24default$iv":Lkotlinx/coroutines/sync/Mutex;
    .restart local v7    # "owner$iv":Ljava/lang/Object;
    :goto_2
    invoke-interface {v5, v7}, Lkotlinx/coroutines/sync/Mutex;->unlock(Ljava/lang/Object;)V

    throw v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
