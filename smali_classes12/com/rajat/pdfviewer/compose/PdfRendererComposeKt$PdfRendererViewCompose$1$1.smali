.class final Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$1$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "PdfRendererCompose.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt;->PdfRendererViewCompose(Lcom/rajat/pdfviewer/util/PdfSource;Landroidx/compose/ui/Modifier;Lcom/rajat/pdfviewer/HeaderData;Lcom/rajat/pdfviewer/util/CacheStrategy;FLandroidx/lifecycle/LifecycleOwner;Ljava/lang/Integer;Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)V
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
    c = "com.rajat.pdfviewer.compose.PdfRendererComposeKt$PdfRendererViewCompose$1$1"
    f = "PdfRendererCompose.kt"
    i = {}
    l = {
        0x2d
    }
    m = "invokeSuspend"
    n = {}
    s = {}
.end annotation


# instance fields
.field final synthetic $context:Landroid/content/Context;

.field final synthetic $resolvedFile$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $source:Lcom/rajat/pdfviewer/util/PdfSource;

.field L$0:Ljava/lang/Object;

.field label:I


# direct methods
.method constructor <init>(Lcom/rajat/pdfviewer/util/PdfSource;Landroid/content/Context;Landroidx/compose/runtime/MutableState;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/rajat/pdfviewer/util/PdfSource;",
            "Landroid/content/Context;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/io/File;",
            ">;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$1$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$1$1;->$source:Lcom/rajat/pdfviewer/util/PdfSource;

    iput-object p2, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$1$1;->$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$1$1;->$resolvedFile$delegate:Landroidx/compose/runtime/MutableState;

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

    new-instance v0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$1$1;

    iget-object v1, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$1$1;->$source:Lcom/rajat/pdfviewer/util/PdfSource;

    iget-object v2, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$1$1;->$context:Landroid/content/Context;

    iget-object v3, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$1$1;->$resolvedFile$delegate:Landroidx/compose/runtime/MutableState;

    invoke-direct {v0, v1, v2, v3, p2}, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$1$1;-><init>(Lcom/rajat/pdfviewer/util/PdfSource;Landroid/content/Context;Landroidx/compose/runtime/MutableState;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$1$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$1$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$1$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 43
    iget v1, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$1$1;->label:I

    packed-switch v1, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .local p1, "$result":Ljava/lang/Object;
    :pswitch_0
    iget-object v0, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$1$1;->L$0:Ljava/lang/Object;

    check-cast v0, Landroidx/compose/runtime/MutableState;

    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v1, v0

    move-object v0, p1

    goto :goto_0

    .end local p1    # "$result":Ljava/lang/Object;
    :pswitch_1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 44
    .restart local p1    # "$result":Ljava/lang/Object;
    iget-object v1, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$1$1;->$source:Lcom/rajat/pdfviewer/util/PdfSource;

    instance-of v1, v1, Lcom/rajat/pdfviewer/util/PdfSource$PdfSourceFromAsset;

    if-eqz v1, :cond_1

    .line 45
    iget-object v1, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$1$1;->$resolvedFile$delegate:Landroidx/compose/runtime/MutableState;

    sget-object v2, Lcom/rajat/pdfviewer/util/FileUtils;->INSTANCE:Lcom/rajat/pdfviewer/util/FileUtils;

    iget-object v3, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$1$1;->$context:Landroid/content/Context;

    iget-object v4, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$1$1;->$source:Lcom/rajat/pdfviewer/util/PdfSource;

    check-cast v4, Lcom/rajat/pdfviewer/util/PdfSource$PdfSourceFromAsset;

    invoke-virtual {v4}, Lcom/rajat/pdfviewer/util/PdfSource$PdfSourceFromAsset;->getAssetFileName()Ljava/lang/String;

    move-result-object v4

    move-object v5, p0

    check-cast v5, Lkotlin/coroutines/Continuation;

    iput-object v1, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$1$1;->L$0:Ljava/lang/Object;

    const/4 v6, 0x1

    iput v6, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$1$1;->label:I

    invoke-virtual {v2, v3, v4, v5}, Lcom/rajat/pdfviewer/util/FileUtils;->fileFromAsset(Landroid/content/Context;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v0, :cond_0

    .line 43
    return-object v0

    .line 45
    :cond_0
    move-object v0, p1

    move-object p1, v2

    .end local p1    # "$result":Ljava/lang/Object;
    .local v0, "$result":Ljava/lang/Object;
    :goto_0
    check-cast p1, Ljava/io/File;

    invoke-static {v1, p1}, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt;->access$PdfRendererViewCompose$lambda$3(Landroidx/compose/runtime/MutableState;Ljava/io/File;)V

    move-object p1, v0

    .line 47
    .end local v0    # "$result":Ljava/lang/Object;
    .restart local p1    # "$result":Ljava/lang/Object;
    :cond_1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
