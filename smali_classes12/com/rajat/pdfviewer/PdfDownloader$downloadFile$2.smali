.class final Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "PdfDownloader.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rajat/pdfviewer/PdfDownloader;->downloadFile(Ljava/lang/String;Ljava/io/File;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
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
        "Ljava/lang/Integer;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0000\n\u0002\u0010\u0008\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"
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
    c = "com.rajat.pdfviewer.PdfDownloader$downloadFile$2"
    f = "PdfDownloader.kt"
    i = {
        0x0,
        0x1
    }
    l = {
        0x9a,
        0xb1
    }
    m = "invokeSuspend"
    n = {
        "tempFile",
        "tempFile"
    }
    s = {
        "L$0",
        "L$0"
    }
.end annotation


# instance fields
.field final synthetic $downloadUrl:Ljava/lang/String;

.field final synthetic $pdfFile:Ljava/io/File;

.field L$0:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lcom/rajat/pdfviewer/PdfDownloader;


# direct methods
.method constructor <init>(Ljava/io/File;Lcom/rajat/pdfviewer/PdfDownloader;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Lcom/rajat/pdfviewer/PdfDownloader;",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;->$pdfFile:Ljava/io/File;

    iput-object p2, p0, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;->this$0:Lcom/rajat/pdfviewer/PdfDownloader;

    iput-object p3, p0, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;->$downloadUrl:Ljava/lang/String;

    const/4 v0, 0x2

    invoke-direct {p0, v0, p4}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method

.method static final invokeSuspend$lambda$3$lambda$2$lambda$1(Lcom/rajat/pdfviewer/PdfDownloader;Lokhttp3/ResponseBody;J)Lkotlin/Unit;
    .locals 2
    .param p0, "this$0"    # Lcom/rajat/pdfviewer/PdfDownloader;
    .param p1, "$body"    # Lokhttp3/ResponseBody;
    .param p2, "progress"    # J

    .line 164
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p2, p3, p1}, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2$$ExternalSyntheticLambda0;-><init>(Lcom/rajat/pdfviewer/PdfDownloader;JLokhttp3/ResponseBody;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 167
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final invokeSuspend$lambda$3$lambda$2$lambda$1$lambda$0(Lcom/rajat/pdfviewer/PdfDownloader;JLokhttp3/ResponseBody;)V
    .locals 3
    .param p0, "this$0"    # Lcom/rajat/pdfviewer/PdfDownloader;
    .param p1, "$progress"    # J
    .param p3, "$body"    # Lokhttp3/ResponseBody;

    .line 165
    invoke-static {p0}, Lcom/rajat/pdfviewer/PdfDownloader;->access$getListener$p(Lcom/rajat/pdfviewer/PdfDownloader;)Lcom/rajat/pdfviewer/PdfDownloader$StatusListener;

    move-result-object v0

    invoke-virtual {p3}, Lokhttp3/ResponseBody;->contentLength()J

    move-result-wide v1

    invoke-interface {v0, p1, p2, v1, v2}, Lcom/rajat/pdfviewer/PdfDownloader$StatusListener;->onDownloadProgress(JJ)V

    .line 166
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

    new-instance v0, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;

    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;->$pdfFile:Ljava/io/File;

    iget-object v2, p0, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;->this$0:Lcom/rajat/pdfviewer/PdfDownloader;

    iget-object v3, p0, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;->$downloadUrl:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3, p2}, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;-><init>(Ljava/io/File;Lcom/rajat/pdfviewer/PdfDownloader;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 14

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 150
    iget v1, p0, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;->label:I

    packed-switch v1, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .local p1, "$result":Ljava/lang/Object;
    :pswitch_0
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;->L$0:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Ljava/io/File;

    .local v1, "tempFile":Ljava/io/File;
    :try_start_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    move-object v3, v1

    move-object v1, p1

    goto/16 :goto_2

    .end local v1    # "tempFile":Ljava/io/File;
    :pswitch_1
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;->L$0:Ljava/lang/Object;

    check-cast v1, Ljava/io/File;

    .restart local v1    # "tempFile":Ljava/io/File;
    :try_start_1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    move-object v2, v1

    move-object v1, p1

    goto :goto_0

    .end local v1    # "tempFile":Ljava/io/File;
    .end local p1    # "$result":Ljava/lang/Object;
    :pswitch_2
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 151
    .restart local p1    # "$result":Ljava/lang/Object;
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;->$pdfFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    const-string v2, "download_"

    const-string v3, ".tmp"

    invoke-static {v2, v3, v1}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v1

    .line 153
    .restart local v1    # "tempFile":Ljava/io/File;
    nop

    .line 154
    :try_start_2
    iget-object v2, p0, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;->$pdfFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_2

    sget-object v2, Lcom/rajat/pdfviewer/util/FileUtils;->INSTANCE:Lcom/rajat/pdfviewer/util/FileUtils;

    iget-object v3, p0, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;->$pdfFile:Ljava/io/File;

    move-object v4, p0

    check-cast v4, Lkotlin/coroutines/Continuation;

    iput-object v1, p0, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;->L$0:Ljava/lang/Object;

    const/4 v5, 0x1

    iput v5, p0, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;->label:I

    invoke-virtual {v2, v3, v4}, Lcom/rajat/pdfviewer/util/FileUtils;->isValidPdf(Ljava/io/File;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    if-ne v2, v0, :cond_0

    .line 150
    return-object v0

    .line 154
    :cond_0
    move-object v13, v1

    move-object v1, p1

    move-object p1, v2

    move-object v2, v13

    .end local p1    # "$result":Ljava/lang/Object;
    .local v1, "$result":Ljava/lang/Object;
    .local v2, "tempFile":Ljava/io/File;
    :goto_0
    :try_start_3
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_1

    .line 155
    iget-object p1, p0, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;->$pdfFile:Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->delete()Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 158
    :cond_1
    move-object p1, v1

    move-object v3, v2

    goto :goto_1

    .line 183
    :catch_0
    move-exception v0

    move-object p1, v1

    move-object v1, v2

    goto/16 :goto_3

    .line 154
    .end local v2    # "tempFile":Ljava/io/File;
    .local v1, "tempFile":Ljava/io/File;
    .restart local p1    # "$result":Ljava/lang/Object;
    :cond_2
    move-object v3, v1

    .line 158
    .end local v1    # "tempFile":Ljava/io/File;
    .local v3, "tempFile":Ljava/io/File;
    :goto_1
    :try_start_4
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;->this$0:Lcom/rajat/pdfviewer/PdfDownloader;

    iget-object v2, p0, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;->$downloadUrl:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/rajat/pdfviewer/PdfDownloader;->access$makeNetworkRequest(Lcom/rajat/pdfviewer/PdfDownloader;Ljava/lang/String;)Lokhttp3/Response;

    move-result-object v1

    .line 159
    .local v1, "response":Lokhttp3/Response;
    iget-object v2, p0, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;->this$0:Lcom/rajat/pdfviewer/PdfDownloader;

    invoke-static {v2, v1}, Lcom/rajat/pdfviewer/PdfDownloader;->access$validateResponse(Lcom/rajat/pdfviewer/PdfDownloader;Lokhttp3/Response;)V

    .line 161
    invoke-virtual {v1}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v2

    .end local v1    # "response":Lokhttp3/Response;
    if-eqz v2, :cond_6

    move-object v7, v2

    check-cast v7, Ljava/io/Closeable;

    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;->this$0:Lcom/rajat/pdfviewer/PdfDownloader;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    :try_start_5
    move-object v2, v7

    check-cast v2, Lokhttp3/ResponseBody;

    move-object v8, v2

    .local v8, "body":Lokhttp3/ResponseBody;
    const/4 v9, 0x0

    .line 162
    .local v9, "$i$a$-use-PdfDownloader$downloadFile$2$1":I
    invoke-virtual {v8}, Lokhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Ljava/io/Closeable;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :try_start_6
    move-object v2, v10

    check-cast v2, Ljava/io/InputStream;

    .local v2, "inputStream":Ljava/io/InputStream;
    const/4 v11, 0x0

    .line 163
    .local v11, "$i$a$-use-PdfDownloader$downloadFile$2$1$1":I
    move-object v4, v1

    sget-object v1, Lcom/rajat/pdfviewer/util/FileUtils;->INSTANCE:Lcom/rajat/pdfviewer/util/FileUtils;

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object v6, v4

    invoke-virtual {v8}, Lokhttp3/ResponseBody;->contentLength()J

    move-result-wide v4

    move-object v12, v6

    new-instance v6, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2$$ExternalSyntheticLambda1;

    invoke-direct {v6, v12, v8}, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2$$ExternalSyntheticLambda1;-><init>(Lcom/rajat/pdfviewer/PdfDownloader;Lokhttp3/ResponseBody;)V

    invoke-virtual/range {v1 .. v6}, Lcom/rajat/pdfviewer/util/FileUtils;->writeFile(Ljava/io/InputStream;Ljava/io/File;JLkotlin/jvm/functions/Function1;)V

    .line 168
    .end local v8    # "body":Lokhttp3/ResponseBody;
    nop

    .end local v2    # "inputStream":Ljava/io/InputStream;
    .end local v11    # "$i$a$-use-PdfDownloader$downloadFile$2$1$1":I
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 162
    const/4 v1, 0x0

    :try_start_7
    invoke-static {v10, v1}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 169
    nop

    .end local v9    # "$i$a$-use-PdfDownloader$downloadFile$2$1":I
    sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 161
    :try_start_8
    invoke-static {v7, v1}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 171
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;->$pdfFile:Ljava/io/File;

    invoke-virtual {v3, v1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v1

    .line 172
    .local v1, "renamed":Z
    nop

    .end local v1    # "renamed":Z
    if-eqz v1, :cond_5

    .line 177
    sget-object v1, Lcom/rajat/pdfviewer/util/FileUtils;->INSTANCE:Lcom/rajat/pdfviewer/util/FileUtils;

    iget-object v2, p0, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;->$pdfFile:Ljava/io/File;

    move-object v4, p0

    check-cast v4, Lkotlin/coroutines/Continuation;

    iput-object v3, p0, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;->L$0:Ljava/lang/Object;

    const/4 v5, 0x2

    iput v5, p0, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;->label:I

    invoke-virtual {v1, v2, v4}, Lcom/rajat/pdfviewer/util/FileUtils;->isValidPdf(Ljava/io/File;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_2

    if-ne v1, v0, :cond_3

    .line 150
    return-object v0

    .line 177
    :cond_3
    move-object v13, v1

    move-object v1, p1

    move-object p1, v13

    .end local p1    # "$result":Ljava/lang/Object;
    .local v1, "$result":Ljava/lang/Object;
    :goto_2
    :try_start_9
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 182
    const-string p1, "PdfDownloader"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Downloaded PDF to: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;->$pdfFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-result p1
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_1

    .line 185
    invoke-static {p1}, Lkotlin/coroutines/jvm/internal/Boxing;->boxInt(I)Ljava/lang/Integer;

    move-result-object p1

    .line 186
    return-object p1

    .line 178
    :cond_4
    :try_start_a
    iget-object p1, p0, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;->$pdfFile:Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 179
    new-instance p1, Lcom/rajat/pdfviewer/InvalidPdfException;

    const-string v0, "Downloaded file is not a valid PDF"

    invoke-direct {p1, v0}, Lcom/rajat/pdfviewer/InvalidPdfException;-><init>(Ljava/lang/String;)V

    .end local v1    # "$result":Ljava/lang/Object;
    .end local v3    # "tempFile":Ljava/io/File;
    throw p1
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_1

    .line 183
    .restart local v1    # "$result":Ljava/lang/Object;
    .restart local v3    # "tempFile":Ljava/io/File;
    :catch_1
    move-exception v0

    move-object p1, v1

    move-object v1, v3

    goto :goto_3

    .line 173
    .end local v1    # "$result":Ljava/lang/Object;
    .restart local p1    # "$result":Ljava/lang/Object;
    :cond_5
    :try_start_b
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 174
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Failed to rename temp file to final PDF path"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v3    # "tempFile":Ljava/io/File;
    .end local p1    # "$result":Ljava/lang/Object;
    throw v0
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_2

    .line 162
    .restart local v3    # "tempFile":Ljava/io/File;
    .restart local v9    # "$i$a$-use-PdfDownloader$downloadFile$2$1":I
    .restart local p1    # "$result":Ljava/lang/Object;
    :catchall_0
    move-exception v0

    move-object v1, v0

    .end local v3    # "tempFile":Ljava/io/File;
    .end local v9    # "$i$a$-use-PdfDownloader$downloadFile$2$1":I
    .end local p1    # "$result":Ljava/lang/Object;
    :try_start_c
    throw v1
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    .restart local v3    # "tempFile":Ljava/io/File;
    .restart local v9    # "$i$a$-use-PdfDownloader$downloadFile$2$1":I
    .restart local p1    # "$result":Ljava/lang/Object;
    :catchall_1
    move-exception v0

    :try_start_d
    invoke-static {v10, v1}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .end local v3    # "tempFile":Ljava/io/File;
    .end local p1    # "$result":Ljava/lang/Object;
    throw v0
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    .line 161
    .end local v9    # "$i$a$-use-PdfDownloader$downloadFile$2$1":I
    .restart local v3    # "tempFile":Ljava/io/File;
    .restart local p1    # "$result":Ljava/lang/Object;
    :catchall_2
    move-exception v0

    move-object v1, v0

    .end local v3    # "tempFile":Ljava/io/File;
    .end local p1    # "$result":Ljava/lang/Object;
    :try_start_e
    throw v1
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_3

    .restart local v3    # "tempFile":Ljava/io/File;
    .restart local p1    # "$result":Ljava/lang/Object;
    :catchall_3
    move-exception v0

    :try_start_f
    invoke-static {v7, v1}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .end local v3    # "tempFile":Ljava/io/File;
    .end local p1    # "$result":Ljava/lang/Object;
    throw v0

    .line 169
    .restart local v3    # "tempFile":Ljava/io/File;
    .restart local p1    # "$result":Ljava/lang/Object;
    :cond_6
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Empty response body received for PDF"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v3    # "tempFile":Ljava/io/File;
    .end local p1    # "$result":Ljava/lang/Object;
    throw v0
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_2

    .line 183
    .restart local v3    # "tempFile":Ljava/io/File;
    .restart local p1    # "$result":Ljava/lang/Object;
    :catch_2
    move-exception v0

    move-object v1, v3

    goto :goto_3

    .end local v3    # "tempFile":Ljava/io/File;
    .local v1, "tempFile":Ljava/io/File;
    :catch_3
    move-exception v0

    .line 184
    .local v0, "e":Ljava/lang/Exception;
    :goto_3
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 185
    throw v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
