.class final Lcom/rajat/pdfviewer/PdfRendererCore$preloadPageDimensions$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "PdfRendererCore.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rajat/pdfviewer/PdfRendererCore;->preloadPageDimensions()V
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
    c = "com.rajat.pdfviewer.PdfRendererCore$preloadPageDimensions$1"
    f = "PdfRendererCore.kt"
    i = {
        0x0
    }
    l = {
        0x119
    }
    m = "invokeSuspend"
    n = {
        "pageNo"
    }
    s = {
        "I$0"
    }
.end annotation


# instance fields
.field I$0:I

.field I$1:I

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
            "Lcom/rajat/pdfviewer/PdfRendererCore$preloadPageDimensions$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$preloadPageDimensions$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    const/4 v0, 0x2

    invoke-direct {p0, v0, p2}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method

.method static final invokeSuspend$lambda$0(Lcom/rajat/pdfviewer/PdfRendererCore;ILandroid/graphics/pdf/PdfRenderer$Page;)Lkotlin/Unit;
    .locals 5
    .param p0, "this$0"    # Lcom/rajat/pdfviewer/PdfRendererCore;
    .param p1, "$pageNo"    # I
    .param p2, "page"    # Landroid/graphics/pdf/PdfRenderer$Page;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 282
    invoke-static {p0}, Lcom/rajat/pdfviewer/PdfRendererCore;->access$getPageDimensionCache$p(Lcom/rajat/pdfviewer/PdfRendererCore;)Ljava/util/Map;

    move-result-object v1

    new-instance v2, Landroid/util/Size;

    invoke-virtual {p2}, Landroid/graphics/pdf/PdfRenderer$Page;->getWidth()I

    move-result v3

    invoke-virtual {p2}, Landroid/graphics/pdf/PdfRenderer$Page;->getHeight()I

    move-result v4

    invoke-direct {v2, v3, v4}, Landroid/util/Size;-><init>(II)V

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 283
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
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

    new-instance v0, Lcom/rajat/pdfviewer/PdfRendererCore$preloadPageDimensions$1;

    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$preloadPageDimensions$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    invoke-direct {v0, v1, p2}, Lcom/rajat/pdfviewer/PdfRendererCore$preloadPageDimensions$1;-><init>(Lcom/rajat/pdfviewer/PdfRendererCore;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfRendererCore$preloadPageDimensions$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfRendererCore$preloadPageDimensions$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/rajat/pdfviewer/PdfRendererCore$preloadPageDimensions$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/rajat/pdfviewer/PdfRendererCore$preloadPageDimensions$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 278
    iget v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$preloadPageDimensions$1;->label:I

    const/4 v2, 0x1

    packed-switch v1, :pswitch_data_0

    .end local p0    # "this":Lcom/rajat/pdfviewer/PdfRendererCore$preloadPageDimensions$1;
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .restart local p0    # "this":Lcom/rajat/pdfviewer/PdfRendererCore$preloadPageDimensions$1;
    .local p1, "$result":Ljava/lang/Object;
    :pswitch_0
    iget v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$preloadPageDimensions$1;->I$1:I

    iget v3, p0, Lcom/rajat/pdfviewer/PdfRendererCore$preloadPageDimensions$1;->I$0:I

    .local v3, "pageNo":I
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v4, p0

    goto :goto_1

    .end local v3    # "pageNo":I
    .end local p1    # "$result":Ljava/lang/Object;
    :pswitch_1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 279
    .restart local p1    # "$result":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "pageNo":I
    iget-object v3, p0, Lcom/rajat/pdfviewer/PdfRendererCore$preloadPageDimensions$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    invoke-virtual {v3}, Lcom/rajat/pdfviewer/PdfRendererCore;->getPageCount()I

    move-result v3

    move v4, v3

    move v3, v1

    move v1, v4

    move-object v4, p0

    .end local v1    # "pageNo":I
    .end local p0    # "this":Lcom/rajat/pdfviewer/PdfRendererCore$preloadPageDimensions$1;
    .restart local v3    # "pageNo":I
    .local v4, "this":Lcom/rajat/pdfviewer/PdfRendererCore$preloadPageDimensions$1;
    :goto_0
    if-ge v3, v1, :cond_2

    .line 280
    iget-object v5, v4, Lcom/rajat/pdfviewer/PdfRendererCore$preloadPageDimensions$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    invoke-static {v5}, Lcom/rajat/pdfviewer/PdfRendererCore;->access$getPageDimensionCache$p(Lcom/rajat/pdfviewer/PdfRendererCore;)Ljava/util/Map;

    move-result-object v5

    invoke-static {v3}, Lkotlin/coroutines/jvm/internal/Boxing;->boxInt(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 281
    iget-object v5, v4, Lcom/rajat/pdfviewer/PdfRendererCore$preloadPageDimensions$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    iget-object v6, v4, Lcom/rajat/pdfviewer/PdfRendererCore$preloadPageDimensions$1;->this$0:Lcom/rajat/pdfviewer/PdfRendererCore;

    new-instance v7, Lcom/rajat/pdfviewer/PdfRendererCore$preloadPageDimensions$1$$ExternalSyntheticLambda0;

    invoke-direct {v7, v6, v3}, Lcom/rajat/pdfviewer/PdfRendererCore$preloadPageDimensions$1$$ExternalSyntheticLambda0;-><init>(Lcom/rajat/pdfviewer/PdfRendererCore;I)V

    move-object v6, v4

    check-cast v6, Lkotlin/coroutines/Continuation;

    iput v3, v4, Lcom/rajat/pdfviewer/PdfRendererCore$preloadPageDimensions$1;->I$0:I

    iput v1, v4, Lcom/rajat/pdfviewer/PdfRendererCore$preloadPageDimensions$1;->I$1:I

    iput v2, v4, Lcom/rajat/pdfviewer/PdfRendererCore$preloadPageDimensions$1;->label:I

    invoke-static {v5, v3, v7, v6}, Lcom/rajat/pdfviewer/PdfRendererCore;->access$withPdfPage(Lcom/rajat/pdfviewer/PdfRendererCore;ILkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v5

    if-ne v5, v0, :cond_0

    .line 278
    return-object v0

    .line 279
    :cond_0
    :goto_1
    nop

    :cond_1
    add-int/2addr v3, v2

    goto :goto_0

    .line 286
    .end local v3    # "pageNo":I
    :cond_2
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
