.class final Lcom/rajat/pdfviewer/PdfRendererCore$deliverRenderCallbacks$2;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "PdfRendererCore.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rajat/pdfviewer/PdfRendererCore;->deliverRenderCallbacks(IZLandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
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
    value = "SMAP\nPdfRendererCore.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PdfRendererCore.kt\ncom/rajat/pdfviewer/PdfRendererCore$deliverRenderCallbacks$2\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,393:1\n1869#2,2:394\n*S KotlinDebug\n*F\n+ 1 PdfRendererCore.kt\ncom/rajat/pdfviewer/PdfRendererCore$deliverRenderCallbacks$2\n*L\n253#1:394,2\n*E\n"
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
    c = "com.rajat.pdfviewer.PdfRendererCore$deliverRenderCallbacks$2"
    f = "PdfRendererCore.kt"
    i = {}
    l = {}
    m = "invokeSuspend"
    n = {}
    s = {}
.end annotation


# instance fields
.field final synthetic $bitmap:Landroid/graphics/Bitmap;

.field final synthetic $callbacks:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Lkotlin/jvm/functions/Function3<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            "Landroid/graphics/Bitmap;",
            "Lkotlin/Unit;",
            ">;>;"
        }
    .end annotation
.end field

.field final synthetic $pageNo:I

.field final synthetic $success:Z

.field label:I


# direct methods
.method constructor <init>(Ljava/util/concurrent/CopyOnWriteArrayList;ZILandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Lkotlin/jvm/functions/Function3<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            "Landroid/graphics/Bitmap;",
            "Lkotlin/Unit;",
            ">;>;ZI",
            "Landroid/graphics/Bitmap;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/rajat/pdfviewer/PdfRendererCore$deliverRenderCallbacks$2;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$deliverRenderCallbacks$2;->$callbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    iput-boolean p2, p0, Lcom/rajat/pdfviewer/PdfRendererCore$deliverRenderCallbacks$2;->$success:Z

    iput p3, p0, Lcom/rajat/pdfviewer/PdfRendererCore$deliverRenderCallbacks$2;->$pageNo:I

    iput-object p4, p0, Lcom/rajat/pdfviewer/PdfRendererCore$deliverRenderCallbacks$2;->$bitmap:Landroid/graphics/Bitmap;

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

    new-instance v0, Lcom/rajat/pdfviewer/PdfRendererCore$deliverRenderCallbacks$2;

    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$deliverRenderCallbacks$2;->$callbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    iget-boolean v2, p0, Lcom/rajat/pdfviewer/PdfRendererCore$deliverRenderCallbacks$2;->$success:Z

    iget v3, p0, Lcom/rajat/pdfviewer/PdfRendererCore$deliverRenderCallbacks$2;->$pageNo:I

    iget-object v4, p0, Lcom/rajat/pdfviewer/PdfRendererCore$deliverRenderCallbacks$2;->$bitmap:Landroid/graphics/Bitmap;

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/rajat/pdfviewer/PdfRendererCore$deliverRenderCallbacks$2;-><init>(Ljava/util/concurrent/CopyOnWriteArrayList;ZILandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfRendererCore$deliverRenderCallbacks$2;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfRendererCore$deliverRenderCallbacks$2;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/rajat/pdfviewer/PdfRendererCore$deliverRenderCallbacks$2;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/rajat/pdfviewer/PdfRendererCore$deliverRenderCallbacks$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    .line 252
    iget v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore$deliverRenderCallbacks$2;->label:I

    packed-switch v0, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 253
    .local p1, "$result":Ljava/lang/Object;
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore$deliverRenderCallbacks$2;->$callbacks:Ljava/util/concurrent/CopyOnWriteArrayList;

    check-cast v0, Ljava/lang/Iterable;

    .local v0, "$this$forEach$iv":Ljava/lang/Iterable;
    iget-boolean v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore$deliverRenderCallbacks$2;->$success:Z

    iget v2, p0, Lcom/rajat/pdfviewer/PdfRendererCore$deliverRenderCallbacks$2;->$pageNo:I

    iget-object v3, p0, Lcom/rajat/pdfviewer/PdfRendererCore$deliverRenderCallbacks$2;->$bitmap:Landroid/graphics/Bitmap;

    const/4 v4, 0x0

    .line 394
    .local v4, "$i$f$forEach":I
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .end local v0    # "$this$forEach$iv":Ljava/lang/Iterable;
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .local v0, "element$iv":Ljava/lang/Object;
    check-cast v0, Lkotlin/jvm/functions/Function3;

    .local v0, "callback":Lkotlin/jvm/functions/Function3;
    const/4 v6, 0x0

    .line 254
    .local v6, "$i$a$-forEach-PdfRendererCore$deliverRenderCallbacks$2$1":I
    if-eqz v1, :cond_0

    const/4 v7, 0x1

    goto :goto_1

    .end local v0    # "callback":Lkotlin/jvm/functions/Function3;
    :cond_0
    const/4 v7, 0x0

    :goto_1
    invoke-static {v7}, Lkotlin/coroutines/jvm/internal/Boxing;->boxBoolean(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-static {v2}, Lkotlin/coroutines/jvm/internal/Boxing;->boxInt(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v0, v7, v8, v3}, Lkotlin/jvm/functions/Function3;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 255
    nop

    .line 394
    .end local v6    # "$i$a$-forEach-PdfRendererCore$deliverRenderCallbacks$2$1":I
    goto :goto_0

    .line 395
    :cond_1
    nop

    .line 256
    .end local v4    # "$i$f$forEach":I
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
