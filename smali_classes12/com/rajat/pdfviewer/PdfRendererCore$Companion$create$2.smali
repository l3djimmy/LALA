.class final Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "PdfRendererCore.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rajat/pdfviewer/PdfRendererCore$Companion;->create(Landroid/content/Context;Landroid/os/ParcelFileDescriptor;Ljava/lang/String;Lcom/rajat/pdfviewer/util/CacheStrategy;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
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
        "Lcom/rajat/pdfviewer/PdfRendererCore;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPdfRendererCore.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PdfRendererCore.kt\ncom/rajat/pdfviewer/PdfRendererCore$Companion$create$2\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,393:1\n1#2:394\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"
    }
    d2 = {
        "<anonymous>",
        "Lcom/rajat/pdfviewer/PdfRendererCore;",
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
    c = "com.rajat.pdfviewer.PdfRendererCore$Companion$create$2"
    f = "PdfRendererCore.kt"
    i = {
        0x0,
        0x0
    }
    l = {
        0x35
    }
    m = "invokeSuspend"
    n = {
        "$this$withContext",
        "pdfRenderer"
    }
    s = {
        "L$0",
        "L$1"
    }
.end annotation


# instance fields
.field final synthetic $cacheIdentifier:Ljava/lang/String;

.field final synthetic $cacheStrategy:Lcom/rajat/pdfviewer/util/CacheStrategy;

.field final synthetic $context:Landroid/content/Context;

.field final synthetic $fileDescriptor:Landroid/os/ParcelFileDescriptor;

.field private synthetic L$0:Ljava/lang/Object;

.field L$1:Ljava/lang/Object;

.field L$2:Ljava/lang/Object;

.field label:I


# direct methods
.method constructor <init>(Landroid/os/ParcelFileDescriptor;Landroid/content/Context;Ljava/lang/String;Lcom/rajat/pdfviewer/util/CacheStrategy;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/ParcelFileDescriptor;",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Lcom/rajat/pdfviewer/util/CacheStrategy;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;->$fileDescriptor:Landroid/os/ParcelFileDescriptor;

    iput-object p2, p0, Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;->$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;->$cacheIdentifier:Ljava/lang/String;

    iput-object p4, p0, Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;->$cacheStrategy:Lcom/rajat/pdfviewer/util/CacheStrategy;

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

    new-instance v0, Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;

    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;->$fileDescriptor:Landroid/os/ParcelFileDescriptor;

    iget-object v2, p0, Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;->$context:Landroid/content/Context;

    iget-object v3, p0, Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;->$cacheIdentifier:Ljava/lang/String;

    iget-object v4, p0, Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;->$cacheStrategy:Lcom/rajat/pdfviewer/util/CacheStrategy;

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;-><init>(Landroid/os/ParcelFileDescriptor;Landroid/content/Context;Ljava/lang/String;Lcom/rajat/pdfviewer/util/CacheStrategy;Lkotlin/coroutines/Continuation;)V

    iput-object p1, v0, Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;->L$0:Ljava/lang/Object;

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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
            "Lcom/rajat/pdfviewer/PdfRendererCore;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 50
    iget v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;->label:I

    packed-switch v1, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .local p1, "$result":Ljava/lang/Object;
    :pswitch_0
    const/4 v0, 0x0

    .local v0, "$i$a$-apply-PdfRendererCore$Companion$create$2$manager$1":I
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;->L$2:Ljava/lang/Object;

    check-cast v1, Lcom/rajat/pdfviewer/util/CacheManager;

    iget-object v2, p0, Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;->L$1:Ljava/lang/Object;

    check-cast v2, Landroid/graphics/pdf/PdfRenderer;

    .local v2, "pdfRenderer":Landroid/graphics/pdf/PdfRenderer;
    iget-object v3, p0, Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;->L$0:Ljava/lang/Object;

    check-cast v3, Lkotlinx/coroutines/CoroutineScope;

    .local v3, "$this$withContext":Lkotlinx/coroutines/CoroutineScope;
    :try_start_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .end local v0    # "$i$a$-apply-PdfRendererCore$Companion$create$2$manager$1":I
    .end local v2    # "pdfRenderer":Landroid/graphics/pdf/PdfRenderer;
    .end local v3    # "$this$withContext":Lkotlinx/coroutines/CoroutineScope;
    .end local p1    # "$result":Ljava/lang/Object;
    :pswitch_1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .restart local p1    # "$result":Ljava/lang/Object;
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;->L$0:Ljava/lang/Object;

    move-object v3, v1

    check-cast v3, Lkotlinx/coroutines/CoroutineScope;

    .line 51
    .restart local v3    # "$this$withContext":Lkotlinx/coroutines/CoroutineScope;
    new-instance v1, Landroid/graphics/pdf/PdfRenderer;

    iget-object v2, p0, Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;->$fileDescriptor:Landroid/os/ParcelFileDescriptor;

    invoke-direct {v1, v2}, Landroid/graphics/pdf/PdfRenderer;-><init>(Landroid/os/ParcelFileDescriptor;)V

    move-object v2, v1

    .line 52
    .restart local v2    # "pdfRenderer":Landroid/graphics/pdf/PdfRenderer;
    nop

    .line 53
    :try_start_1
    new-instance v1, Lcom/rajat/pdfviewer/util/CacheManager;

    iget-object v4, p0, Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;->$context:Landroid/content/Context;

    iget-object v5, p0, Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;->$cacheIdentifier:Ljava/lang/String;

    iget-object v6, p0, Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;->$cacheStrategy:Lcom/rajat/pdfviewer/util/CacheStrategy;

    invoke-direct {v1, v4, v5, v6}, Lcom/rajat/pdfviewer/util/CacheManager;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/rajat/pdfviewer/util/CacheStrategy;)V

    move-object v4, v1

    .line 394
    .local v4, "$this$invokeSuspend_u24lambda_u240":Lcom/rajat/pdfviewer/util/CacheManager;
    const/4 v5, 0x0

    .line 53
    .local v5, "$i$a$-apply-PdfRendererCore$Companion$create$2$manager$1":I
    iput-object v3, p0, Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;->L$0:Ljava/lang/Object;

    iput-object v2, p0, Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;->L$1:Ljava/lang/Object;

    iput-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;->L$2:Ljava/lang/Object;

    const/4 v6, 0x1

    iput v6, p0, Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;->label:I

    invoke-virtual {v4, p0}, Lcom/rajat/pdfviewer/util/CacheManager;->initialize(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v6

    .end local v4    # "$this$invokeSuspend_u24lambda_u240":Lcom/rajat/pdfviewer/util/CacheManager;
    if-ne v6, v0, :cond_0

    .line 50
    return-object v0

    .line 53
    :cond_0
    move v0, v5

    .end local v5    # "$i$a$-apply-PdfRendererCore$Companion$create$2$manager$1":I
    .restart local v0    # "$i$a$-apply-PdfRendererCore$Companion$create$2$manager$1":I
    :goto_0
    nop

    .line 54
    .end local v0    # "$i$a$-apply-PdfRendererCore$Companion$create$2$manager$1":I
    .local v1, "manager":Lcom/rajat/pdfviewer/util/CacheManager;
    new-instance v0, Lcom/rajat/pdfviewer/PdfRendererCore;

    iget-object v4, p0, Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;->$fileDescriptor:Landroid/os/ParcelFileDescriptor;

    const/4 v5, 0x0

    invoke-direct {v0, v4, v1, v2, v5}, Lcom/rajat/pdfviewer/PdfRendererCore;-><init>(Landroid/os/ParcelFileDescriptor;Lcom/rajat/pdfviewer/util/CacheManager;Landroid/graphics/pdf/PdfRenderer;Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 55
    .local v0, "core":Lcom/rajat/pdfviewer/PdfRendererCore;
    invoke-virtual {v0}, Lcom/rajat/pdfviewer/PdfRendererCore;->preloadPageDimensions()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 56
    return-object v0

    .line 57
    .end local v0    # "core":Lcom/rajat/pdfviewer/PdfRendererCore;
    .end local v1    # "manager":Lcom/rajat/pdfviewer/util/CacheManager;
    :catch_0
    move-exception v0

    .line 58
    .local v0, "e":Ljava/lang/Exception;
    nop

    .end local v3    # "$this$withContext":Lkotlinx/coroutines/CoroutineScope;
    :try_start_2
    sget-object v1, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 394
    const/4 v1, 0x0

    .line 58
    .local v1, "$i$a$-runCatching-PdfRendererCore$Companion$create$2$1":I
    invoke-virtual {v2}, Landroid/graphics/pdf/PdfRenderer;->close()V

    .end local v1    # "$i$a$-runCatching-PdfRendererCore$Companion$create$2$1":I
    .end local v2    # "pdfRenderer":Landroid/graphics/pdf/PdfRenderer;
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-static {v1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v1

    sget-object v2, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {v1}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 59
    :goto_1
    invoke-static {v1}, Lkotlin/Result;->exceptionOrNull-impl(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 394
    .local v1, "it":Ljava/lang/Throwable;
    const/4 v2, 0x0

    .line 59
    .local v2, "$i$a$-onFailure-PdfRendererCore$Companion$create$2$2":I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error closing PdfRenderer during cleanup: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "PdfRendererCore"

    invoke-static {v4, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 60
    .end local v1    # "it":Ljava/lang/Throwable;
    .end local v2    # "$i$a$-onFailure-PdfRendererCore$Companion$create$2$2":I
    :cond_1
    throw v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
