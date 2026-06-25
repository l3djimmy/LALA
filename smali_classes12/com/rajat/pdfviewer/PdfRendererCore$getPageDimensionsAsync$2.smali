.class final Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "PdfRendererCore.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rajat/pdfviewer/PdfRendererCore;->getPageDimensionsAsync(ILkotlin/jvm/functions/Function1;)V
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
    value = "SMAP\nPdfRendererCore.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PdfRendererCore.kt\ncom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,393:1\n1#2:394\n*E\n"
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
    c = "com.rajat.pdfviewer.PdfRendererCore$getPageDimensionsAsync$2"
    f = "PdfRendererCore.kt"
    i = {}
    l = {
        0x14d,
        0x151
    }
    m = "invokeSuspend"
    n = {}
    s = {}
.end annotation


# instance fields
.field final synthetic $callback:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "Landroid/util/Size;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $pageNo:I

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
            "Landroid/util/Size;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    iput p2, p0, Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2;->$pageNo:I

    iput-object p3, p0, Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2;->$callback:Lkotlin/jvm/functions/Function1;

    const/4 v0, 0x2

    invoke-direct {p0, v0, p4}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method

.method static final invokeSuspend$lambda$1(Lcom/rajat/pdfviewer/PdfRendererCore;ILandroid/graphics/pdf/PdfRenderer$Page;)Landroid/util/Size;
    .locals 5
    .param p0, "this$0"    # Lcom/rajat/pdfviewer/PdfRendererCore;
    .param p1, "$pageNo"    # I
    .param p2, "page"    # Landroid/graphics/pdf/PdfRenderer$Page;

    .line 334
    new-instance v0, Landroid/util/Size;

    invoke-virtual {p2}, Landroid/graphics/pdf/PdfRenderer$Page;->getWidth()I

    move-result v1

    invoke-virtual {p2}, Landroid/graphics/pdf/PdfRenderer$Page;->getHeight()I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    move-object v1, v0

    .line 394
    .local v1, "it":Landroid/util/Size;
    const/4 v2, 0x0

    .local v2, "$i$a$-also-PdfRendererCore$getPageDimensionsAsync$2$size$1$1":I
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 334
    invoke-static {p0}, Lcom/rajat/pdfviewer/PdfRendererCore;->access$getPageDimensionCache$p(Lcom/rajat/pdfviewer/PdfRendererCore;)Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .end local v1    # "it":Landroid/util/Size;
    .end local v2    # "$i$a$-also-PdfRendererCore$getPageDimensionsAsync$2$size$1$1":I
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

    new-instance v0, Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2;

    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    iget v2, p0, Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2;->$pageNo:I

    iget-object v3, p0, Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2;->$callback:Lkotlin/jvm/functions/Function1;

    invoke-direct {v0, v1, v2, v3, p2}, Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2;-><init>(Lcom/rajat/pdfviewer/PdfRendererCore;ILkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 332
    iget v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2;->label:I

    const/4 v2, 0x1

    packed-switch v1, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .local p1, "$result":Ljava/lang/Object;
    :pswitch_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto :goto_1

    :pswitch_1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v1, p1

    goto :goto_0

    .end local p1    # "$result":Ljava/lang/Object;
    :pswitch_2
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 333
    .restart local p1    # "$result":Ljava/lang/Object;
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    iget v3, p0, Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2;->$pageNo:I

    iget-object v4, p0, Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    iget v5, p0, Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2;->$pageNo:I

    new-instance v6, Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2$$ExternalSyntheticLambda0;

    invoke-direct {v6, v4, v5}, Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2$$ExternalSyntheticLambda0;-><init>(Lcom/rajat/pdfviewer/PdfRendererCore;I)V

    move-object v4, p0

    check-cast v4, Lkotlin/coroutines/Continuation;

    iput v2, p0, Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2;->label:I

    invoke-static {v1, v3, v6, v4}, Lcom/rajat/pdfviewer/PdfRendererCore;->access$withPdfPage(Lcom/rajat/pdfviewer/PdfRendererCore;ILkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_0

    .line 332
    return-object v0

    .line 333
    :cond_0
    move-object v7, v1

    move-object v1, p1

    move-object p1, v7

    .end local p1    # "$result":Ljava/lang/Object;
    .local v1, "$result":Ljava/lang/Object;
    :goto_0
    check-cast p1, Landroid/util/Size;

    if-nez p1, :cond_1

    .line 335
    new-instance p1, Landroid/util/Size;

    invoke-direct {p1, v2, v2}, Landroid/util/Size;-><init>(II)V

    .line 333
    :cond_1
    nop

    .line 337
    .local p1, "size":Landroid/util/Size;
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getMain()Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object v2

    check-cast v2, Lkotlin/coroutines/CoroutineContext;

    new-instance v3, Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2$1;

    iget-object v4, p0, Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2;->$callback:Lkotlin/jvm/functions/Function1;

    const/4 v5, 0x0

    invoke-direct {v3, v4, p1, v5}, Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2$1;-><init>(Lkotlin/jvm/functions/Function1;Landroid/util/Size;Lkotlin/coroutines/Continuation;)V

    check-cast v3, Lkotlin/jvm/functions/Function2;

    move-object v4, p0

    check-cast v4, Lkotlin/coroutines/Continuation;

    const/4 v5, 0x2

    iput v5, p0, Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2;->label:I

    invoke-static {v2, v3, v4}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "size":Landroid/util/Size;
    if-ne p1, v0, :cond_2

    .line 332
    return-object v0

    .line 337
    :cond_2
    move-object p1, v1

    .line 340
    .end local v1    # "$result":Ljava/lang/Object;
    .local p1, "$result":Ljava/lang/Object;
    :goto_1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
