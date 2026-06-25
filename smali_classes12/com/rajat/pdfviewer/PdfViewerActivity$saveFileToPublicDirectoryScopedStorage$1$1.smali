.class final Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "PdfViewerActivity.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
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
        "Ljava/lang/Long;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0000\n\u0002\u0010\t\n\u0002\u0018\u0002\u0010\u0000\u001a\u0004\u0018\u00010\u0001*\u00020\u0002H\n"
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
    c = "com.rajat.pdfviewer.PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$1"
    f = "PdfViewerActivity.kt"
    i = {}
    l = {}
    m = "invokeSuspend"
    n = {}
    s = {}
.end annotation


# instance fields
.field final synthetic $filePath:Ljava/lang/String;

.field final synthetic $uri:Landroid/net/Uri;

.field label:I

.field final synthetic this$0:Lcom/rajat/pdfviewer/PdfViewerActivity;


# direct methods
.method constructor <init>(Lcom/rajat/pdfviewer/PdfViewerActivity;Landroid/net/Uri;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/rajat/pdfviewer/PdfViewerActivity;",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$1;->this$0:Lcom/rajat/pdfviewer/PdfViewerActivity;

    iput-object p2, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$1;->$uri:Landroid/net/Uri;

    iput-object p3, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$1;->$filePath:Ljava/lang/String;

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

    new-instance v0, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$1;

    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$1;->this$0:Lcom/rajat/pdfviewer/PdfViewerActivity;

    iget-object v2, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$1;->$uri:Landroid/net/Uri;

    iget-object v3, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$1;->$filePath:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3, p2}, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$1;-><init>(Lcom/rajat/pdfviewer/PdfViewerActivity;Landroid/net/Uri;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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
            "Ljava/lang/Long;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    .line 521
    iget v0, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$1;->label:I

    packed-switch v0, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 522
    .local p1, "$result":Ljava/lang/Object;
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$1;->this$0:Lcom/rajat/pdfviewer/PdfViewerActivity;

    invoke-virtual {v0}, Lcom/rajat/pdfviewer/PdfViewerActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$1;->$uri:Landroid/net/Uri;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    check-cast v0, Ljava/io/Closeable;

    iget-object v2, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$1;->$filePath:Ljava/lang/String;

    :try_start_0
    move-object v3, v0

    check-cast v3, Ljava/io/OutputStream;

    .local v3, "outputStream":Ljava/io/OutputStream;
    const/4 v4, 0x0

    .local v4, "$i$a$-use-PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$1$1":I
    new-instance v5, Ljava/io/FileInputStream;

    .line 523
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v5, v6}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    check-cast v5, Ljava/io/InputStream;

    const/4 v2, 0x0

    const/4 v6, 0x2

    invoke-static {v5, v3, v2, v6, v1}, Lkotlin/io/ByteStreamsKt;->copyTo$default(Ljava/io/InputStream;Ljava/io/OutputStream;IILjava/lang/Object;)J

    move-result-wide v5

    .end local v3    # "outputStream":Ljava/io/OutputStream;
    .end local v4    # "$i$a$-use-PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1$1$1":I
    invoke-static {v5, v6}, Lkotlin/coroutines/jvm/internal/Boxing;->boxLong(J)Ljava/lang/Long;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 522
    invoke-static {v0, v1}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    move-object v1, v2

    goto :goto_0

    :catchall_0
    move-exception v1

    .end local p1    # "$result":Ljava/lang/Object;
    :try_start_1
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .restart local p1    # "$result":Ljava/lang/Object;
    :catchall_1
    move-exception v2

    invoke-static {v0, v1}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v2

    .line 524
    :cond_0
    :goto_0
    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
