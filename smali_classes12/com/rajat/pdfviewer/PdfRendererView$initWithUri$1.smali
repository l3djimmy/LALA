.class final Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "PdfRendererView.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rajat/pdfviewer/PdfRendererView;->initWithUri(Landroid/net/Uri;)V
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
    c = "com.rajat.pdfviewer.PdfRendererView$initWithUri$1"
    f = "PdfRendererView.kt"
    i = {
        0x0
    }
    l = {
        0xda,
        0xdc,
        0xe2
    }
    m = "invokeSuspend"
    n = {
        "fileDescriptor"
    }
    s = {
        "L$0"
    }
.end annotation


# instance fields
.field final synthetic $cacheIdentifier:Ljava/lang/String;

.field final synthetic $uri:Landroid/net/Uri;

.field L$0:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lcom/rajat/pdfviewer/PdfRendererView;


# direct methods
.method constructor <init>(Lcom/rajat/pdfviewer/PdfRendererView;Landroid/net/Uri;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/rajat/pdfviewer/PdfRendererView;",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererView;

    iput-object p2, p0, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1;->$uri:Landroid/net/Uri;

    iput-object p3, p0, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1;->$cacheIdentifier:Ljava/lang/String;

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

    new-instance v0, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1;

    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererView;

    iget-object v2, p0, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1;->$uri:Landroid/net/Uri;

    iget-object v3, p0, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1;->$cacheIdentifier:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3, p2}, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1;-><init>(Lcom/rajat/pdfviewer/PdfRendererView;Landroid/net/Uri;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 11

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    .line 212
    iget v0, p0, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1;->label:I

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .local p1, "$result":Ljava/lang/Object;
    :pswitch_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v0, p1

    goto/16 :goto_3

    :pswitch_1
    const/4 v3, 0x0

    .local v3, "fileDescriptor":Landroid/os/ParcelFileDescriptor;
    :try_start_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    move-object v4, v3

    move-object v3, p1

    goto/16 :goto_1

    .end local v3    # "fileDescriptor":Landroid/os/ParcelFileDescriptor;
    :pswitch_2
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1;->L$0:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Landroid/os/ParcelFileDescriptor;

    .restart local v3    # "fileDescriptor":Landroid/os/ParcelFileDescriptor;
    :try_start_1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    move-object v6, v3

    move-object v3, p1

    goto :goto_0

    .end local v3    # "fileDescriptor":Landroid/os/ParcelFileDescriptor;
    .end local p1    # "$result":Ljava/lang/Object;
    :pswitch_3
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 213
    .restart local p1    # "$result":Ljava/lang/Object;
    const/4 v3, 0x0

    .line 214
    .restart local v3    # "fileDescriptor":Landroid/os/ParcelFileDescriptor;
    nop

    .line 215
    :try_start_2
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererView;

    invoke-virtual {v0}, Lcom/rajat/pdfviewer/PdfRendererView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v4, p0, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1;->$uri:Landroid/net/Uri;

    const-string/jumbo v5, "r"

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    if-eqz v0, :cond_2

    move-object v6, v0

    .line 218
    .end local v3    # "fileDescriptor":Landroid/os/ParcelFileDescriptor;
    .local v6, "fileDescriptor":Landroid/os/ParcelFileDescriptor;
    :try_start_3
    sget-object v4, Lcom/rajat/pdfviewer/PdfRendererCore;->Companion:Lcom/rajat/pdfviewer/PdfRendererCore$Companion;

    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererView;

    invoke-virtual {v0}, Lcom/rajat/pdfviewer/PdfRendererView;->getContext()Landroid/content/Context;

    move-result-object v5

    const-string v0, "getContext(...)"

    invoke-static {v5, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v7, p0, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1;->$cacheIdentifier:Ljava/lang/String;

    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererView;

    invoke-static {v0}, Lcom/rajat/pdfviewer/PdfRendererView;->access$getCacheStrategy$p(Lcom/rajat/pdfviewer/PdfRendererView;)Lcom/rajat/pdfviewer/util/CacheStrategy;

    move-result-object v8

    move-object v9, p0

    check-cast v9, Lkotlin/coroutines/Continuation;

    iput-object v6, p0, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1;->L$0:Ljava/lang/Object;

    const/4 v0, 0x1

    iput v0, p0, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1;->label:I

    invoke-virtual/range {v4 .. v9}, Lcom/rajat/pdfviewer/PdfRendererCore$Companion;->create(Landroid/content/Context;Landroid/os/ParcelFileDescriptor;Ljava/lang/String;Lcom/rajat/pdfviewer/util/CacheStrategy;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    if-ne v0, v1, :cond_0

    .line 212
    return-object v1

    .line 218
    :cond_0
    move-object v3, p1

    move-object p1, v0

    .line 212
    .end local p1    # "$result":Ljava/lang/Object;
    .local v3, "$result":Ljava/lang/Object;
    :goto_0
    :try_start_4
    check-cast p1, Lcom/rajat/pdfviewer/PdfRendererCore;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 217
    nop

    .line 219
    .local p1, "renderer":Lcom/rajat/pdfviewer/PdfRendererCore;
    const/4 v4, 0x0

    .line 220
    .end local v6    # "fileDescriptor":Landroid/os/ParcelFileDescriptor;
    .local v4, "fileDescriptor":Landroid/os/ParcelFileDescriptor;
    :try_start_5
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getMain()Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object v0

    check-cast v0, Lkotlin/coroutines/CoroutineContext;

    new-instance v5, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1$1;

    iget-object v6, p0, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererView;

    iget-object v7, p0, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1;->$uri:Landroid/net/Uri;

    invoke-direct {v5, v6, p1, v7, v2}, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1$1;-><init>(Lcom/rajat/pdfviewer/PdfRendererView;Lcom/rajat/pdfviewer/PdfRendererCore;Landroid/net/Uri;Lkotlin/coroutines/Continuation;)V

    check-cast v5, Lkotlin/jvm/functions/Function2;

    move-object v6, p0

    check-cast v6, Lkotlin/coroutines/Continuation;

    iput-object v2, p0, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1;->L$0:Ljava/lang/Object;

    const/4 v7, 0x2

    iput v7, p0, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1;->label:I

    invoke-static {v0, v5, v6}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    .end local p1    # "renderer":Lcom/rajat/pdfviewer/PdfRendererCore;
    if-ne v0, v1, :cond_1

    .line 212
    return-object v1

    .line 220
    :cond_1
    move-object p1, v0

    :goto_1
    check-cast p1, Lkotlin/Unit;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_4

    .line 224
    :catch_0
    move-exception v0

    move-object p1, v3

    move-object v3, v4

    goto :goto_2

    .end local v4    # "fileDescriptor":Landroid/os/ParcelFileDescriptor;
    .restart local v6    # "fileDescriptor":Landroid/os/ParcelFileDescriptor;
    :catch_1
    move-exception v0

    move-object p1, v3

    move-object v3, v6

    goto :goto_2

    .end local v3    # "$result":Ljava/lang/Object;
    .local p1, "$result":Ljava/lang/Object;
    :catch_2
    move-exception v0

    move-object v3, v6

    goto :goto_2

    .line 216
    .end local v6    # "fileDescriptor":Landroid/os/ParcelFileDescriptor;
    .local v3, "fileDescriptor":Landroid/os/ParcelFileDescriptor;
    :cond_2
    :try_start_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v4, "Failed to open file descriptor \u2014 verify URI is valid and app has read permission"

    invoke-direct {v0, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .end local v3    # "fileDescriptor":Landroid/os/ParcelFileDescriptor;
    .end local p1    # "$result":Ljava/lang/Object;
    throw v0
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3

    .line 224
    .restart local v3    # "fileDescriptor":Landroid/os/ParcelFileDescriptor;
    .restart local p1    # "$result":Ljava/lang/Object;
    :catch_3
    move-exception v0

    .line 225
    .local v0, "e":Ljava/lang/Exception;
    :goto_2
    nop

    .end local v3    # "fileDescriptor":Landroid/os/ParcelFileDescriptor;
    if-eqz v3, :cond_3

    invoke-virtual {v3}, Landroid/os/ParcelFileDescriptor;->close()V

    .line 226
    :cond_3
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getMain()Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object v3

    check-cast v3, Lkotlin/coroutines/CoroutineContext;

    new-instance v4, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1$2;

    iget-object v5, p0, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererView;

    invoke-direct {v4, v5, v0, v2}, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1$2;-><init>(Lcom/rajat/pdfviewer/PdfRendererView;Ljava/lang/Exception;Lkotlin/coroutines/Continuation;)V

    check-cast v4, Lkotlin/jvm/functions/Function2;

    move-object v5, p0

    check-cast v5, Lkotlin/coroutines/Continuation;

    iput-object v2, p0, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1;->L$0:Ljava/lang/Object;

    const/4 v2, 0x3

    iput v2, p0, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1;->label:I

    invoke-static {v3, v4, v5}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "e":Ljava/lang/Exception;
    if-ne v0, v1, :cond_4

    .line 212
    return-object v1

    .line 226
    :cond_4
    move-object v10, v0

    move-object v0, p1

    move-object p1, v10

    .line 212
    .end local p1    # "$result":Ljava/lang/Object;
    .local v0, "$result":Ljava/lang/Object;
    :goto_3
    check-cast p1, Lkotlin/Unit;

    move-object v3, v0

    .line 230
    .end local v0    # "$result":Ljava/lang/Object;
    .local v3, "$result":Ljava/lang/Object;
    :goto_4
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
