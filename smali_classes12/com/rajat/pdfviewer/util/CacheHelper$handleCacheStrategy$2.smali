.class final Lcom/rajat/pdfviewer/util/CacheHelper$handleCacheStrategy$2;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "CacheHelper.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rajat/pdfviewer/util/CacheHelper;->handleCacheStrategy(Ljava/lang/String;Ljava/io/File;Lcom/rajat/pdfviewer/util/CacheStrategy;ILkotlin/coroutines/Continuation;)Ljava/lang/Object;
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
    c = "com.rajat.pdfviewer.util.CacheHelper$handleCacheStrategy$2"
    f = "CacheHelper.kt"
    i = {}
    l = {}
    m = "invokeSuspend"
    n = {}
    s = {}
.end annotation


# instance fields
.field final synthetic $cacheDir:Ljava/io/File;

.field final synthetic $cacheStrategy:Lcom/rajat/pdfviewer/util/CacheStrategy;

.field final synthetic $maxCachedPdfs:I

.field final synthetic $origin:Ljava/lang/String;

.field label:I


# direct methods
.method constructor <init>(Lcom/rajat/pdfviewer/util/CacheStrategy;ILjava/lang/String;Ljava/io/File;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/rajat/pdfviewer/util/CacheStrategy;",
            "I",
            "Ljava/lang/String;",
            "Ljava/io/File;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/rajat/pdfviewer/util/CacheHelper$handleCacheStrategy$2;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/rajat/pdfviewer/util/CacheHelper$handleCacheStrategy$2;->$cacheStrategy:Lcom/rajat/pdfviewer/util/CacheStrategy;

    iput p2, p0, Lcom/rajat/pdfviewer/util/CacheHelper$handleCacheStrategy$2;->$maxCachedPdfs:I

    iput-object p3, p0, Lcom/rajat/pdfviewer/util/CacheHelper$handleCacheStrategy$2;->$origin:Ljava/lang/String;

    iput-object p4, p0, Lcom/rajat/pdfviewer/util/CacheHelper$handleCacheStrategy$2;->$cacheDir:Ljava/io/File;

    const/4 v0, 0x2

    invoke-direct {p0, v0, p5}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
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

    new-instance v0, Lcom/rajat/pdfviewer/util/CacheHelper$handleCacheStrategy$2;

    iget-object v1, p0, Lcom/rajat/pdfviewer/util/CacheHelper$handleCacheStrategy$2;->$cacheStrategy:Lcom/rajat/pdfviewer/util/CacheStrategy;

    iget v2, p0, Lcom/rajat/pdfviewer/util/CacheHelper$handleCacheStrategy$2;->$maxCachedPdfs:I

    iget-object v3, p0, Lcom/rajat/pdfviewer/util/CacheHelper$handleCacheStrategy$2;->$origin:Ljava/lang/String;

    iget-object v4, p0, Lcom/rajat/pdfviewer/util/CacheHelper$handleCacheStrategy$2;->$cacheDir:Ljava/io/File;

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/rajat/pdfviewer/util/CacheHelper$handleCacheStrategy$2;-><init>(Lcom/rajat/pdfviewer/util/CacheStrategy;ILjava/lang/String;Ljava/io/File;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/util/CacheHelper$handleCacheStrategy$2;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/util/CacheHelper$handleCacheStrategy$2;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/rajat/pdfviewer/util/CacheHelper$handleCacheStrategy$2;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/rajat/pdfviewer/util/CacheHelper$handleCacheStrategy$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    .line 17
    iget v0, p0, Lcom/rajat/pdfviewer/util/CacheHelper$handleCacheStrategy$2;->label:I

    packed-switch v0, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 18
    .local p1, "$result":Ljava/lang/Object;
    sget-object v0, Lcom/rajat/pdfviewer/util/CachePolicy;->Companion:Lcom/rajat/pdfviewer/util/CachePolicy$Companion;

    iget-object v1, p0, Lcom/rajat/pdfviewer/util/CacheHelper$handleCacheStrategy$2;->$cacheStrategy:Lcom/rajat/pdfviewer/util/CacheStrategy;

    iget v2, p0, Lcom/rajat/pdfviewer/util/CacheHelper$handleCacheStrategy$2;->$maxCachedPdfs:I

    invoke-virtual {v0, v1, v2}, Lcom/rajat/pdfviewer/util/CachePolicy$Companion;->from(Lcom/rajat/pdfviewer/util/CacheStrategy;I)Lcom/rajat/pdfviewer/util/CachePolicy;

    move-result-object v0

    .line 19
    .local v0, "cachePolicy":Lcom/rajat/pdfviewer/util/CachePolicy;
    sget-object v1, Lcom/rajat/pdfviewer/util/CacheHelper;->INSTANCE:Lcom/rajat/pdfviewer/util/CacheHelper;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v3, 0x5b

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/rajat/pdfviewer/util/CacheHelper$handleCacheStrategy$2;->$origin:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] Cache Strategy: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/rajat/pdfviewer/util/CacheHelper$handleCacheStrategy$2;->$cacheStrategy:Lcom/rajat/pdfviewer/util/CacheStrategy;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " | Directory: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/rajat/pdfviewer/util/CacheHelper$handleCacheStrategy$2;->$cacheDir:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/rajat/pdfviewer/util/CacheHelper;->access$logDebug(Lcom/rajat/pdfviewer/util/CacheHelper;Ljava/lang/String;)V

    .line 20
    sget-object v1, Lcom/rajat/pdfviewer/util/CacheHelper;->INSTANCE:Lcom/rajat/pdfviewer/util/CacheHelper;

    iget-object v2, p0, Lcom/rajat/pdfviewer/util/CacheHelper$handleCacheStrategy$2;->$origin:Ljava/lang/String;

    iget-object v3, p0, Lcom/rajat/pdfviewer/util/CacheHelper$handleCacheStrategy$2;->$cacheDir:Ljava/io/File;

    invoke-virtual {v1, v2, v3, v0}, Lcom/rajat/pdfviewer/util/CacheHelper;->applyDocumentRetention$pdfViewer_release(Ljava/lang/String;Ljava/io/File;Lcom/rajat/pdfviewer/util/CachePolicy;)V

    .line 21
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
