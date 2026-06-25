.class final Lcom/rajat/pdfviewer/util/CacheManager$initialize$2;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "CacheManager.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rajat/pdfviewer/util/CacheManager;->initialize(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
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
    c = "com.rajat.pdfviewer.util.CacheManager$initialize$2"
    f = "CacheManager.kt"
    i = {}
    l = {
        0x26
    }
    m = "invokeSuspend"
    n = {}
    s = {}
.end annotation


# instance fields
.field label:I

.field final synthetic this$0:Lcom/rajat/pdfviewer/util/CacheManager;


# direct methods
.method constructor <init>(Lcom/rajat/pdfviewer/util/CacheManager;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/rajat/pdfviewer/util/CacheManager;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/rajat/pdfviewer/util/CacheManager$initialize$2;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/rajat/pdfviewer/util/CacheManager$initialize$2;->this$0:Lcom/rajat/pdfviewer/util/CacheManager;

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

    new-instance v0, Lcom/rajat/pdfviewer/util/CacheManager$initialize$2;

    iget-object v1, p0, Lcom/rajat/pdfviewer/util/CacheManager$initialize$2;->this$0:Lcom/rajat/pdfviewer/util/CacheManager;

    invoke-direct {v0, v1, p2}, Lcom/rajat/pdfviewer/util/CacheManager$initialize$2;-><init>(Lcom/rajat/pdfviewer/util/CacheManager;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/util/CacheManager$initialize$2;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/util/CacheManager$initialize$2;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/rajat/pdfviewer/util/CacheManager$initialize$2;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/rajat/pdfviewer/util/CacheManager$initialize$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 25
    iget v1, p0, Lcom/rajat/pdfviewer/util/CacheManager$initialize$2;->label:I

    packed-switch v1, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .local p1, "$result":Ljava/lang/Object;
    :pswitch_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto :goto_0

    .end local p1    # "$result":Ljava/lang/Object;
    :pswitch_1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 26
    .restart local p1    # "$result":Ljava/lang/Object;
    iget-object v1, p0, Lcom/rajat/pdfviewer/util/CacheManager$initialize$2;->this$0:Lcom/rajat/pdfviewer/util/CacheManager;

    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lcom/rajat/pdfviewer/util/CacheManager$initialize$2;->this$0:Lcom/rajat/pdfviewer/util/CacheManager;

    invoke-static {v3}, Lcom/rajat/pdfviewer/util/CacheManager;->access$getContext$p(Lcom/rajat/pdfviewer/util/CacheManager;)Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "___pdf___cache___/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/rajat/pdfviewer/util/CacheManager$initialize$2;->this$0:Lcom/rajat/pdfviewer/util/CacheManager;

    invoke-static {v5}, Lcom/rajat/pdfviewer/util/CacheManager;->access$getCurrentOpenedFileName$p(Lcom/rajat/pdfviewer/util/CacheManager;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v1, v2}, Lcom/rajat/pdfviewer/util/CacheManager;->access$setCacheDir$p(Lcom/rajat/pdfviewer/util/CacheManager;Ljava/io/File;)V

    .line 27
    iget-object v1, p0, Lcom/rajat/pdfviewer/util/CacheManager$initialize$2;->this$0:Lcom/rajat/pdfviewer/util/CacheManager;

    invoke-static {v1}, Lcom/rajat/pdfviewer/util/CacheManager;->access$getCachePolicy$p(Lcom/rajat/pdfviewer/util/CacheManager;)Lcom/rajat/pdfviewer/util/CachePolicy;

    move-result-object v1

    invoke-virtual {v1}, Lcom/rajat/pdfviewer/util/CachePolicy;->getUseDiskBitmapCache()Z

    move-result v1

    if-nez v1, :cond_0

    .line 30
    iget-object v1, p0, Lcom/rajat/pdfviewer/util/CacheManager$initialize$2;->this$0:Lcom/rajat/pdfviewer/util/CacheManager;

    invoke-static {v1}, Lcom/rajat/pdfviewer/util/CacheManager;->access$purgeDiskBitmapFiles(Lcom/rajat/pdfviewer/util/CacheManager;)V

    .line 32
    :cond_0
    iget-object v1, p0, Lcom/rajat/pdfviewer/util/CacheManager$initialize$2;->this$0:Lcom/rajat/pdfviewer/util/CacheManager;

    invoke-static {v1}, Lcom/rajat/pdfviewer/util/CacheManager;->access$getCachePolicy$p(Lcom/rajat/pdfviewer/util/CacheManager;)Lcom/rajat/pdfviewer/util/CachePolicy;

    move-result-object v1

    invoke-virtual {v1}, Lcom/rajat/pdfviewer/util/CachePolicy;->getMaxRetainedDocuments()I

    move-result v1

    if-gtz v1, :cond_1

    .line 33
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    .line 36
    :cond_1
    iget-object v1, p0, Lcom/rajat/pdfviewer/util/CacheManager$initialize$2;->this$0:Lcom/rajat/pdfviewer/util/CacheManager;

    invoke-static {v1}, Lcom/rajat/pdfviewer/util/CacheManager;->access$getCacheDir$p(Lcom/rajat/pdfviewer/util/CacheManager;)Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 38
    sget-object v2, Lcom/rajat/pdfviewer/util/CacheHelper;->INSTANCE:Lcom/rajat/pdfviewer/util/CacheHelper;

    .line 39
    nop

    .line 40
    iget-object v1, p0, Lcom/rajat/pdfviewer/util/CacheManager$initialize$2;->this$0:Lcom/rajat/pdfviewer/util/CacheManager;

    invoke-static {v1}, Lcom/rajat/pdfviewer/util/CacheManager;->access$getCacheDir$p(Lcom/rajat/pdfviewer/util/CacheManager;)Ljava/io/File;

    move-result-object v4

    .line 41
    iget-object v1, p0, Lcom/rajat/pdfviewer/util/CacheManager$initialize$2;->this$0:Lcom/rajat/pdfviewer/util/CacheManager;

    invoke-static {v1}, Lcom/rajat/pdfviewer/util/CacheManager;->access$getCacheStrategy$p(Lcom/rajat/pdfviewer/util/CacheManager;)Lcom/rajat/pdfviewer/util/CacheStrategy;

    move-result-object v5

    .line 42
    move-object v7, p0

    check-cast v7, Lkotlin/coroutines/Continuation;

    .line 38
    const/4 v1, 0x1

    iput v1, p0, Lcom/rajat/pdfviewer/util/CacheManager$initialize$2;->label:I

    const-string v3, "CacheManager"

    const/4 v6, 0x5

    invoke-virtual/range {v2 .. v7}, Lcom/rajat/pdfviewer/util/CacheHelper;->handleCacheStrategy(Ljava/lang/String;Ljava/io/File;Lcom/rajat/pdfviewer/util/CacheStrategy;ILkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_2

    .line 25
    return-object v0

    .line 44
    :cond_2
    :goto_0
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
