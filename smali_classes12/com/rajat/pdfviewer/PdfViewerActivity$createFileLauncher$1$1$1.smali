.class final Lcom/rajat/pdfviewer/PdfViewerActivity$createFileLauncher$1$1$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "PdfViewerActivity.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rajat/pdfviewer/PdfViewerActivity;-><init>()V
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
    c = "com.rajat.pdfviewer.PdfViewerActivity$createFileLauncher$1$1$1"
    f = "PdfViewerActivity.kt"
    i = {}
    l = {
        0x1f8,
        0x1fd
    }
    m = "invokeSuspend"
    n = {}
    s = {}
.end annotation


# instance fields
.field final synthetic $uri:Landroid/net/Uri;

.field label:I

.field final synthetic this$0:Lcom/rajat/pdfviewer/PdfViewerActivity;


# direct methods
.method constructor <init>(Lcom/rajat/pdfviewer/PdfViewerActivity;Landroid/net/Uri;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/rajat/pdfviewer/PdfViewerActivity;",
            "Landroid/net/Uri;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/rajat/pdfviewer/PdfViewerActivity$createFileLauncher$1$1$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$createFileLauncher$1$1$1;->this$0:Lcom/rajat/pdfviewer/PdfViewerActivity;

    iput-object p2, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$createFileLauncher$1$1$1;->$uri:Landroid/net/Uri;

    const/4 v0, 0x2

    invoke-direct {p0, v0, p3}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 3
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

    new-instance v0, Lcom/rajat/pdfviewer/PdfViewerActivity$createFileLauncher$1$1$1;

    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$createFileLauncher$1$1$1;->this$0:Lcom/rajat/pdfviewer/PdfViewerActivity;

    iget-object v2, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$createFileLauncher$1$1$1;->$uri:Landroid/net/Uri;

    invoke-direct {v0, v1, v2, p2}, Lcom/rajat/pdfviewer/PdfViewerActivity$createFileLauncher$1$1$1;-><init>(Lcom/rajat/pdfviewer/PdfViewerActivity;Landroid/net/Uri;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfViewerActivity$createFileLauncher$1$1$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfViewerActivity$createFileLauncher$1$1$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/rajat/pdfviewer/PdfViewerActivity$createFileLauncher$1$1$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/rajat/pdfviewer/PdfViewerActivity$createFileLauncher$1$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 11

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 496
    iget v1, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$createFileLauncher$1$1$1;->label:I

    const/4 v2, 0x2

    const/4 v3, 0x0

    packed-switch v1, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .local p1, "$result":Ljava/lang/Object;
    :pswitch_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto/16 :goto_3

    :pswitch_1
    :try_start_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 507
    :catch_0
    move-exception v1

    goto :goto_2

    .line 496
    .end local p1    # "$result":Ljava/lang/Object;
    :pswitch_2
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 497
    .restart local p1    # "$result":Ljava/lang/Object;
    nop

    .line 498
    :try_start_1
    new-instance v1, Ljava/io/File;

    iget-object v4, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$createFileLauncher$1$1$1;->this$0:Lcom/rajat/pdfviewer/PdfViewerActivity;

    invoke-virtual {v4}, Lcom/rajat/pdfviewer/PdfViewerActivity;->getDownloadedFilePath()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_0

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    :cond_0
    invoke-direct {v1, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 499
    .local v1, "file":Ljava/io/File;
    iget-object v4, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$createFileLauncher$1$1$1;->this$0:Lcom/rajat/pdfviewer/PdfViewerActivity;

    invoke-virtual {v4}, Lcom/rajat/pdfviewer/PdfViewerActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    iget-object v5, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$createFileLauncher$1$1$1;->$uri:Landroid/net/Uri;

    invoke-virtual {v4, v5}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v4

    if-eqz v4, :cond_1

    check-cast v4, Ljava/io/Closeable;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :try_start_2
    move-object v5, v4

    check-cast v5, Ljava/io/OutputStream;

    .local v5, "outputStream":Ljava/io/OutputStream;
    const/4 v6, 0x0

    .local v6, "$i$a$-use-PdfViewerActivity$createFileLauncher$1$1$1$1":I
    new-instance v7, Ljava/io/FileInputStream;

    .line 500
    invoke-direct {v7, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .end local v1    # "file":Ljava/io/File;
    check-cast v7, Ljava/io/Closeable;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    :try_start_3
    move-object v1, v7

    check-cast v1, Ljava/io/FileInputStream;

    .local v1, "inputStream":Ljava/io/FileInputStream;
    const/4 v8, 0x0

    .line 501
    .local v8, "$i$a$-use-PdfViewerActivity$createFileLauncher$1$1$1$1$1":I
    move-object v9, v1

    check-cast v9, Ljava/io/InputStream;

    const/4 v10, 0x0

    invoke-static {v9, v5, v10, v2, v3}, Lkotlin/io/ByteStreamsKt;->copyTo$default(Ljava/io/InputStream;Ljava/io/OutputStream;IILjava/lang/Object;)J

    move-result-wide v9
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 500
    .end local v1    # "inputStream":Ljava/io/FileInputStream;
    .end local v5    # "outputStream":Ljava/io/OutputStream;
    .end local v8    # "$i$a$-use-PdfViewerActivity$createFileLauncher$1$1$1$1$1":I
    :try_start_4
    invoke-static {v7, v3}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 502
    nop

    .end local v6    # "$i$a$-use-PdfViewerActivity$createFileLauncher$1$1$1$1":I
    invoke-static {v9, v10}, Lkotlin/coroutines/jvm/internal/Boxing;->boxLong(J)Ljava/lang/Long;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 499
    :try_start_5
    invoke-static {v4, v3}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_0

    .line 500
    .restart local v6    # "$i$a$-use-PdfViewerActivity$createFileLauncher$1$1$1$1":I
    :catchall_0
    move-exception v1

    .end local v6    # "$i$a$-use-PdfViewerActivity$createFileLauncher$1$1$1$1":I
    .end local p1    # "$result":Ljava/lang/Object;
    :try_start_6
    throw v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .restart local v6    # "$i$a$-use-PdfViewerActivity$createFileLauncher$1$1$1$1":I
    .restart local p1    # "$result":Ljava/lang/Object;
    :catchall_1
    move-exception v5

    :try_start_7
    invoke-static {v7, v1}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .end local p1    # "$result":Ljava/lang/Object;
    throw v5
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 499
    .end local v6    # "$i$a$-use-PdfViewerActivity$createFileLauncher$1$1$1$1":I
    .restart local p1    # "$result":Ljava/lang/Object;
    :catchall_2
    move-exception v1

    .end local p1    # "$result":Ljava/lang/Object;
    :try_start_8
    throw v1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .restart local p1    # "$result":Ljava/lang/Object;
    :catchall_3
    move-exception v5

    :try_start_9
    invoke-static {v4, v1}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .end local p1    # "$result":Ljava/lang/Object;
    throw v5

    .line 504
    .restart local p1    # "$result":Ljava/lang/Object;
    :cond_1
    :goto_0
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getMain()Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object v1

    check-cast v1, Lkotlin/coroutines/CoroutineContext;

    new-instance v4, Lcom/rajat/pdfviewer/PdfViewerActivity$createFileLauncher$1$1$1$2;

    iget-object v5, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$createFileLauncher$1$1$1;->this$0:Lcom/rajat/pdfviewer/PdfViewerActivity;

    invoke-direct {v4, v5, v3}, Lcom/rajat/pdfviewer/PdfViewerActivity$createFileLauncher$1$1$1$2;-><init>(Lcom/rajat/pdfviewer/PdfViewerActivity;Lkotlin/coroutines/Continuation;)V

    check-cast v4, Lkotlin/jvm/functions/Function2;

    move-object v5, p0

    check-cast v5, Lkotlin/coroutines/Continuation;

    const/4 v6, 0x1

    iput v6, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$createFileLauncher$1$1$1;->label:I

    invoke-static {v1, v4, v5}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0

    if-ne v1, v0, :cond_2

    .line 496
    return-object v0

    .line 504
    :cond_2
    :goto_1
    goto :goto_4

    .line 508
    .local v1, "e":Ljava/lang/Exception;
    :goto_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error saving PDF: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object v5, v1

    check-cast v5, Ljava/lang/Throwable;

    const-string v6, "PdfViewerActivity"

    invoke-static {v6, v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 509
    .end local v1    # "e":Ljava/lang/Exception;
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getMain()Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object v1

    check-cast v1, Lkotlin/coroutines/CoroutineContext;

    new-instance v4, Lcom/rajat/pdfviewer/PdfViewerActivity$createFileLauncher$1$1$1$3;

    iget-object v5, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$createFileLauncher$1$1$1;->this$0:Lcom/rajat/pdfviewer/PdfViewerActivity;

    invoke-direct {v4, v5, v3}, Lcom/rajat/pdfviewer/PdfViewerActivity$createFileLauncher$1$1$1$3;-><init>(Lcom/rajat/pdfviewer/PdfViewerActivity;Lkotlin/coroutines/Continuation;)V

    check-cast v4, Lkotlin/jvm/functions/Function2;

    move-object v3, p0

    check-cast v3, Lkotlin/coroutines/Continuation;

    iput v2, p0, Lcom/rajat/pdfviewer/PdfViewerActivity$createFileLauncher$1$1$1;->label:I

    invoke-static {v1, v4, v3}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_3

    .line 496
    return-object v0

    .line 513
    :cond_3
    :goto_3
    nop

    :goto_4
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
