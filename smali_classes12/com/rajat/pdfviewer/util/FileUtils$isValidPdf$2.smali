.class final Lcom/rajat/pdfviewer/util/FileUtils$isValidPdf$2;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "FileUtils.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rajat/pdfviewer/util/FileUtils;->isValidPdf(Ljava/io/File;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
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
        "Ljava/lang/Boolean;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0000\n\u0002\u0010\u000b\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"
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
    c = "com.rajat.pdfviewer.util.FileUtils$isValidPdf$2"
    f = "FileUtils.kt"
    i = {}
    l = {}
    m = "invokeSuspend"
    n = {}
    s = {}
.end annotation


# instance fields
.field final synthetic $file:Ljava/io/File;

.field label:I


# direct methods
.method constructor <init>(Ljava/io/File;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/rajat/pdfviewer/util/FileUtils$isValidPdf$2;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/rajat/pdfviewer/util/FileUtils$isValidPdf$2;->$file:Ljava/io/File;

    const/4 v0, 0x2

    invoke-direct {p0, v0, p2}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
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

    new-instance v0, Lcom/rajat/pdfviewer/util/FileUtils$isValidPdf$2;

    iget-object v1, p0, Lcom/rajat/pdfviewer/util/FileUtils$isValidPdf$2;->$file:Ljava/io/File;

    invoke-direct {v0, v1, p2}, Lcom/rajat/pdfviewer/util/FileUtils$isValidPdf$2;-><init>(Ljava/io/File;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/util/FileUtils$isValidPdf$2;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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
            "Ljava/lang/Boolean;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/util/FileUtils$isValidPdf$2;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/rajat/pdfviewer/util/FileUtils$isValidPdf$2;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/rajat/pdfviewer/util/FileUtils$isValidPdf$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 18

    move-object/from16 v1, p0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    .line 102
    iget v0, v1, Lcom/rajat/pdfviewer/util/FileUtils$isValidPdf$2;->label:I

    packed-switch v0, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object/from16 v2, p1

    .line 103
    .local v2, "$result":Ljava/lang/Object;
    iget-object v0, v1, Lcom/rajat/pdfviewer/util/FileUtils$isValidPdf$2;->$file:Ljava/io/File;

    const/4 v3, 0x0

    const-string v4, "PdfValidator"

    if-eqz v0, :cond_4

    iget-object v0, v1, Lcom/rajat/pdfviewer/util/FileUtils$isValidPdf$2;->$file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, v1, Lcom/rajat/pdfviewer/util/FileUtils$isValidPdf$2;->$file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v5

    const-wide/16 v7, 0x4

    cmp-long v0, v5, v7

    if-gez v0, :cond_0

    goto/16 :goto_1

    .line 108
    :cond_0
    nop

    .line 109
    :try_start_0
    new-instance v0, Ljava/io/FileInputStream;

    iget-object v5, v1, Lcom/rajat/pdfviewer/util/FileUtils$isValidPdf$2;->$file:Ljava/io/File;

    invoke-direct {v0, v5}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object v5, v0

    check-cast v5, Ljava/io/Closeable;

    iget-object v0, v1, Lcom/rajat/pdfviewer/util/FileUtils$isValidPdf$2;->$file:Ljava/io/File;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    move-object v6, v5

    check-cast v6, Ljava/io/FileInputStream;

    .local v6, "inputStream":Ljava/io/FileInputStream;
    const/4 v7, 0x0

    .line 110
    .local v7, "$i$a$-use-FileUtils$isValidPdf$2$1":I
    const/16 v8, 0x400

    new-array v8, v8, [B

    .line 111
    .local v8, "buffer":[B
    invoke-virtual {v6, v8}, Ljava/io/FileInputStream;->read([B)I

    move-result v9

    .line 112
    .local v9, "bytesRead":I
    const/4 v10, -0x1

    const/4 v11, 0x0

    if-ne v9, v10, :cond_1

    .line 113
    const-string v0, "Validation failed: Unable to read file content."

    invoke-static {v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    invoke-static {v3}, Lkotlin/coroutines/jvm/internal/Boxing;->boxBoolean(Z)Ljava/lang/Boolean;

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    .end local v6    # "inputStream":Ljava/io/FileInputStream;
    .end local v7    # "$i$a$-use-FileUtils$isValidPdf$2$1":I
    .end local v8    # "buffer":[B
    .end local v9    # "bytesRead":I
    :try_start_2
    invoke-static {v5, v11}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    return-object v0

    .restart local v7    # "$i$a$-use-FileUtils$isValidPdf$2$1":I
    .restart local v8    # "buffer":[B
    :cond_1
    :try_start_3
    new-instance v6, Ljava/lang/String;

    .line 117
    sget-object v9, Lkotlin/text/Charsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-direct {v6, v8, v9}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 118
    .local v6, "pdfContent":Ljava/lang/String;
    move-object v12, v6

    check-cast v12, Ljava/lang/CharSequence;

    const-string v13, "%PDF"

    const/16 v16, 0x6

    const/16 v17, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-static/range {v12 .. v17}, Lkotlin/text/StringsKt;->indexOf$default(Ljava/lang/CharSequence;Ljava/lang/String;IZILjava/lang/Object;)I

    move-result v9

    .line 119
    .local v9, "pdfIndex":I
    if-ne v9, v10, :cond_2

    .line 120
    const-string v0, "Validation failed: `%PDF` signature not found in first 1024 bytes."

    invoke-static {v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    invoke-static {v3}, Lkotlin/coroutines/jvm/internal/Boxing;->boxBoolean(Z)Ljava/lang/Boolean;

    move-result-object v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_4

    .end local v6    # "pdfContent":Ljava/lang/String;
    .end local v7    # "$i$a$-use-FileUtils$isValidPdf$2$1":I
    .end local v8    # "buffer":[B
    .end local v9    # "pdfIndex":I
    :try_start_4
    invoke-static {v5, v11}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    return-object v0

    .line 124
    .restart local v7    # "$i$a$-use-FileUtils$isValidPdf$2$1":I
    .restart local v9    # "pdfIndex":I
    :cond_2
    :try_start_5
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "PDF signature found at byte offset: "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    const/high16 v6, 0x10000000

    invoke-static {v0, v6}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Ljava/io/Closeable;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    :try_start_6
    move-object v0, v6

    check-cast v0, Landroid/os/ParcelFileDescriptor;

    .local v0, "pfd":Landroid/os/ParcelFileDescriptor;
    const/4 v8, 0x0

    .line 127
    .local v8, "$i$a$-use-FileUtils$isValidPdf$2$1$1":I
    new-instance v10, Landroid/graphics/pdf/PdfRenderer;

    invoke-direct {v10, v0}, Landroid/graphics/pdf/PdfRenderer;-><init>(Landroid/os/ParcelFileDescriptor;)V

    check-cast v10, Ljava/lang/AutoCloseable;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    :try_start_7
    move-object v12, v10

    check-cast v12, Landroid/graphics/pdf/PdfRenderer;

    .local v12, "renderer":Landroid/graphics/pdf/PdfRenderer;
    const/4 v13, 0x0

    .line 128
    .local v13, "$i$a$-use-FileUtils$isValidPdf$2$1$1$1":I
    invoke-virtual {v12}, Landroid/graphics/pdf/PdfRenderer;->getPageCount()I

    move-result v14

    if-gtz v14, :cond_3

    .line 129
    const-string v14, "Validation failed: PDF has no pages."

    invoke-static {v4, v14}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    invoke-static {v3}, Lkotlin/coroutines/jvm/internal/Boxing;->boxBoolean(Z)Ljava/lang/Boolean;

    move-result-object v14
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .end local v12    # "renderer":Landroid/graphics/pdf/PdfRenderer;
    .end local v13    # "$i$a$-use-FileUtils$isValidPdf$2$1$1$1":I
    :try_start_8
    invoke-static {v10, v11}, Lkotlin/jdk7/AutoCloseableKt;->closeFinally(Ljava/lang/AutoCloseable;Ljava/lang/Throwable;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .end local v0    # "pfd":Landroid/os/ParcelFileDescriptor;
    .end local v8    # "$i$a$-use-FileUtils$isValidPdf$2$1$1":I
    :try_start_9
    invoke-static {v6, v11}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    .end local v7    # "$i$a$-use-FileUtils$isValidPdf$2$1":I
    .end local v9    # "pdfIndex":I
    :try_start_a
    invoke-static {v5, v11}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_0

    return-object v14

    .line 132
    .restart local v7    # "$i$a$-use-FileUtils$isValidPdf$2$1":I
    .restart local v8    # "$i$a$-use-FileUtils$isValidPdf$2$1$1":I
    .restart local v12    # "renderer":Landroid/graphics/pdf/PdfRenderer;
    .restart local v13    # "$i$a$-use-FileUtils$isValidPdf$2$1$1$1":I
    :cond_3
    :try_start_b
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Validation successful: PDF is valid with "

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v12}, Landroid/graphics/pdf/PdfRenderer;->getPageCount()I

    move-result v9

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v9, " pages."

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 127
    .end local v12    # "renderer":Landroid/graphics/pdf/PdfRenderer;
    .end local v13    # "$i$a$-use-FileUtils$isValidPdf$2$1$1$1":I
    :try_start_c
    invoke-static {v10, v11}, Lkotlin/jdk7/AutoCloseableKt;->closeFinally(Ljava/lang/AutoCloseable;Ljava/lang/Throwable;)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 133
    nop

    .line 126
    .end local v8    # "$i$a$-use-FileUtils$isValidPdf$2$1$1":I
    :try_start_d
    invoke-static {v6, v11}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_4

    .line 135
    nop

    .line 109
    .end local v7    # "$i$a$-use-FileUtils$isValidPdf$2$1":I
    :try_start_e
    invoke-static {v5, v11}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_0

    const/4 v3, 0x1

    goto :goto_0

    .line 127
    .restart local v7    # "$i$a$-use-FileUtils$isValidPdf$2$1":I
    .restart local v8    # "$i$a$-use-FileUtils$isValidPdf$2$1$1":I
    :catchall_0
    move-exception v0

    move-object v9, v0

    .end local v2    # "$result":Ljava/lang/Object;
    .end local v7    # "$i$a$-use-FileUtils$isValidPdf$2$1":I
    .end local v8    # "$i$a$-use-FileUtils$isValidPdf$2$1$1":I
    :try_start_f
    throw v9
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_1

    .restart local v2    # "$result":Ljava/lang/Object;
    .restart local v7    # "$i$a$-use-FileUtils$isValidPdf$2$1":I
    .restart local v8    # "$i$a$-use-FileUtils$isValidPdf$2$1$1":I
    :catchall_1
    move-exception v0

    :try_start_10
    invoke-static {v10, v9}, Lkotlin/jdk7/AutoCloseableKt;->closeFinally(Ljava/lang/AutoCloseable;Ljava/lang/Throwable;)V

    .end local v2    # "$result":Ljava/lang/Object;
    .end local v7    # "$i$a$-use-FileUtils$isValidPdf$2$1":I
    throw v0
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_2

    .line 126
    .end local v8    # "$i$a$-use-FileUtils$isValidPdf$2$1$1":I
    .restart local v2    # "$result":Ljava/lang/Object;
    .restart local v7    # "$i$a$-use-FileUtils$isValidPdf$2$1":I
    :catchall_2
    move-exception v0

    move-object v8, v0

    .end local v2    # "$result":Ljava/lang/Object;
    .end local v7    # "$i$a$-use-FileUtils$isValidPdf$2$1":I
    :try_start_11
    throw v8
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_3

    .restart local v2    # "$result":Ljava/lang/Object;
    .restart local v7    # "$i$a$-use-FileUtils$isValidPdf$2$1":I
    :catchall_3
    move-exception v0

    :try_start_12
    invoke-static {v6, v8}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .end local v2    # "$result":Ljava/lang/Object;
    throw v0
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_4

    .line 109
    .end local v7    # "$i$a$-use-FileUtils$isValidPdf$2$1":I
    .restart local v2    # "$result":Ljava/lang/Object;
    :catchall_4
    move-exception v0

    move-object v6, v0

    .end local v2    # "$result":Ljava/lang/Object;
    :try_start_13
    throw v6
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_5

    .restart local v2    # "$result":Ljava/lang/Object;
    :catchall_5
    move-exception v0

    :try_start_14
    invoke-static {v5, v6}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .end local v2    # "$result":Ljava/lang/Object;
    throw v0
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_0

    .line 137
    .restart local v2    # "$result":Ljava/lang/Object;
    :catch_0
    move-exception v0

    .line 138
    .local v0, "e":Ljava/lang/Exception;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Validation failed: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object v6, v0

    check-cast v6, Ljava/lang/Throwable;

    invoke-static {v4, v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 139
    nop

    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    invoke-static {v3}, Lkotlin/coroutines/jvm/internal/Boxing;->boxBoolean(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 108
    return-object v0

    .line 104
    :cond_4
    :goto_1
    const-string v0, "Validation failed: File is null, does not exist, or is too small."

    invoke-static {v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    invoke-static {v3}, Lkotlin/coroutines/jvm/internal/Boxing;->boxBoolean(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
