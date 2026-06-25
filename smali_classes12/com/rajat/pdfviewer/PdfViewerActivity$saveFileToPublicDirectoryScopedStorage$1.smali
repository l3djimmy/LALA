.class final Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "PdfViewerActivity.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rajat/pdfviewer/PdfViewerActivity;->saveFileToPublicDirectoryScopedStorage(Ljava/lang/String;Ljava/lang/String;)V
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
    c = "com.rajat.pdfviewer.PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1"
    f = "PdfViewerActivity.kt"
    i = {}
    l = {
        0x208,
        0x209,
        0x20e
    }
    m = "invokeSuspend"
    n = {}
    s = {}
.end annotation


# instance fields
.field final synthetic $fileName:Ljava/lang/String;

.field final synthetic $filePath:Ljava/lang/String;

.field label:I

.field final synthetic this$0:Lcom/rajat/pdfviewer/PdfViewerActivity;


# direct methods
.method constructor <init>(Lcom/rajat/pdfviewer/PdfViewerActivity;Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/rajat/pdfviewer/PdfViewerActivity;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1;->this$0:Lcom/rajat/pdfviewer/PdfViewerActivity;

    iput-object p2, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1;->$fileName:Ljava/lang/String;

    iput-object p3, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1;->$filePath:Ljava/lang/String;

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

    new-instance v0, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1;

    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1;->this$0:Lcom/rajat/pdfviewer/PdfViewerActivity;

    iget-object v2, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1;->$fileName:Ljava/lang/String;

    iget-object v3, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1;->$filePath:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3, p2}, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1;-><init>(Lcom/rajat/pdfviewer/PdfViewerActivity;Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 519
    iget v1, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1;->label:I

    const/4 v2, 0x0

    packed-switch v1, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .local p1, "$result":Ljava/lang/Object;
    :pswitch_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto :goto_2

    :pswitch_1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto :goto_1

    :pswitch_2
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v1, p1

    goto :goto_0

    .end local p1    # "$result":Ljava/lang/Object;
    :pswitch_3
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 520
    .restart local p1    # "$result":Ljava/lang/Object;
    sget-object v1, Lcom/rajat/pdfviewer/util/FileUtils;->INSTANCE:Lcom/rajat/pdfviewer/util/FileUtils;

    iget-object v3, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1;->this$0:Lcom/rajat/pdfviewer/PdfViewerActivity;

    invoke-virtual {v3}, Lcom/rajat/pdfviewer/PdfViewerActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "getContentResolver(...)"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v4, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1;->$fileName:Ljava/lang/String;

    move-object v5, p0

    check-cast v5, Lkotlin/coroutines/Continuation;

    const/4 v6, 0x1

    iput v6, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1;->label:I

    invoke-virtual {v1, v3, v4, v5}, Lcom/rajat/pdfviewer/util/FileUtils;->createPdfDocumentUri(Landroid/content/ContentResolver;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_0

    .line 519
    return-object v0

    .line 520
    :cond_0
    move-object v7, v1

    move-object v1, p1

    move-object p1, v7

    .line 519
    .end local p1    # "$result":Ljava/lang/Object;
    .local v1, "$result":Ljava/lang/Object;
    :goto_0
    check-cast p1, Landroid/net/Uri;

    .line 521
    .local p1, "uri":Landroid/net/Uri;
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v3

    check-cast v3, Lkotlin/coroutines/CoroutineContext;

    new-instance v4, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$1;

    iget-object v5, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1;->this$0:Lcom/rajat/pdfviewer/PdfViewerActivity;

    iget-object v6, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1;->$filePath:Ljava/lang/String;

    invoke-direct {v4, v5, p1, v6, v2}, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$1;-><init>(Lcom/rajat/pdfviewer/PdfViewerActivity;Landroid/net/Uri;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    check-cast v4, Lkotlin/jvm/functions/Function2;

    move-object v5, p0

    check-cast v5, Lkotlin/coroutines/Continuation;

    const/4 v6, 0x2

    iput v6, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1;->label:I

    invoke-static {v3, v4, v5}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "uri":Landroid/net/Uri;
    if-ne p1, v0, :cond_1

    .line 519
    return-object v0

    .line 521
    :cond_1
    move-object p1, v1

    .line 526
    .end local v1    # "$result":Ljava/lang/Object;
    .local p1, "$result":Ljava/lang/Object;
    :goto_1
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getMain()Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object v1

    check-cast v1, Lkotlin/coroutines/CoroutineContext;

    new-instance v3, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$2;

    iget-object v4, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1;->this$0:Lcom/rajat/pdfviewer/PdfViewerActivity;

    invoke-direct {v3, v4, v2}, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$2;-><init>(Lcom/rajat/pdfviewer/PdfViewerActivity;Lkotlin/coroutines/Continuation;)V

    check-cast v3, Lkotlin/jvm/functions/Function2;

    move-object v2, p0

    check-cast v2, Lkotlin/coroutines/Continuation;

    const/4 v4, 0x3

    iput v4, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1;->label:I

    invoke-static {v1, v3, v2}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_2

    .line 519
    return-object v0

    .line 529
    :cond_2
    :goto_2
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
