.class final Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$2;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "CacheManager.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rajat/pdfviewer/util/CacheManager;->writeBitmapToCache-0E7RQCE(ILandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
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
        "Lkotlin/Result<",
        "+",
        "Ljava/lang/Boolean;",
        ">;>;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\u0018\u0002\u0010\u0000\u001a\u0008\u0012\u0004\u0012\u00020\u00020\u0001*\u00020\u0003H\n"
    }
    d2 = {
        "<anonymous>",
        "Lkotlin/Result;",
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
    c = "com.rajat.pdfviewer.util.CacheManager$writeBitmapToCache$2"
    f = "CacheManager.kt"
    i = {}
    l = {}
    m = "invokeSuspend"
    n = {}
    s = {}
.end annotation


# instance fields
.field final synthetic $bitmap:Landroid/graphics/Bitmap;

.field final synthetic $pageNo:I

.field private synthetic L$0:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lcom/rajat/pdfviewer/util/CacheManager;


# direct methods
.method constructor <init>(Lcom/rajat/pdfviewer/util/CacheManager;ILandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/rajat/pdfviewer/util/CacheManager;",
            "I",
            "Landroid/graphics/Bitmap;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$2;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$2;->this$0:Lcom/rajat/pdfviewer/util/CacheManager;

    iput p2, p0, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$2;->$pageNo:I

    iput-object p3, p0, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$2;->$bitmap:Landroid/graphics/Bitmap;

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

    new-instance v0, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$2;

    iget-object v1, p0, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$2;->this$0:Lcom/rajat/pdfviewer/util/CacheManager;

    iget v2, p0, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$2;->$pageNo:I

    iget-object v3, p0, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$2;->$bitmap:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1, v2, v3, p2}, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$2;-><init>(Lcom/rajat/pdfviewer/util/CacheManager;ILandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)V

    iput-object p1, v0, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$2;->L$0:Ljava/lang/Object;

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$2;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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
            "Lkotlin/Result<",
            "Ljava/lang/Boolean;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$2;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$2;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    .line 93
    iget v0, p0, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$2;->label:I

    packed-switch v0, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .local p1, "$result":Ljava/lang/Object;
    iget-object v0, p0, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$2;->L$0:Ljava/lang/Object;

    check-cast v0, Lkotlinx/coroutines/CoroutineScope;

    .line 95
    .local v0, "$this$withContext":Lkotlinx/coroutines/CoroutineScope;
    iget-object v1, p0, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$2;->this$0:Lcom/rajat/pdfviewer/util/CacheManager;

    iget v2, p0, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$2;->$pageNo:I

    iget-object v3, p0, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$2;->$bitmap:Landroid/graphics/Bitmap;

    .end local v0    # "$this$withContext":Lkotlinx/coroutines/CoroutineScope;
    :try_start_0
    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    const/4 v0, 0x0

    .line 97
    .local v0, "$i$a$-runCatching-CacheManager$writeBitmapToCache$2$1":I
    invoke-static {v1}, Lcom/rajat/pdfviewer/util/CacheManager;->access$getCacheDir$p(Lcom/rajat/pdfviewer/util/CacheManager;)Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    .line 98
    new-instance v4, Ljava/io/File;

    invoke-static {v1}, Lcom/rajat/pdfviewer/util/CacheManager;->access$getCacheDir$p(Lcom/rajat/pdfviewer/util/CacheManager;)Ljava/io/File;

    move-result-object v1

    sget-object v5, Lcom/rajat/pdfviewer/util/FileUtils;->INSTANCE:Lcom/rajat/pdfviewer/util/FileUtils;

    invoke-static {v2}, Lkotlin/coroutines/jvm/internal/Boxing;->boxInt(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v6, 0x2

    const/4 v7, 0x0

    invoke-static {v5, v2, v7, v6, v7}, Lcom/rajat/pdfviewer/util/FileUtils;->cachedFileNameWithFormat$default(Lcom/rajat/pdfviewer/util/FileUtils;Ljava/lang/Object;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v4, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 99
    .local v4, "savePath":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result v1

    invoke-static {v1}, Lkotlin/coroutines/jvm/internal/Boxing;->boxBoolean(Z)Ljava/lang/Boolean;

    .line 100
    :cond_0
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    check-cast v1, Ljava/io/Closeable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .end local v4    # "savePath":Ljava/io/File;
    :try_start_1
    move-object v2, v1

    check-cast v2, Ljava/io/FileOutputStream;

    .local v2, "fos":Ljava/io/FileOutputStream;
    const/4 v4, 0x0

    .line 101
    .local v4, "$i$a$-use-CacheManager$writeBitmapToCache$2$1$1":I
    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    move-object v6, v2

    check-cast v6, Ljava/io/OutputStream;

    const/16 v8, 0x64

    invoke-virtual {v3, v5, v8, v6}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    move-result v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 100
    .end local v2    # "fos":Ljava/io/FileOutputStream;
    .end local v4    # "$i$a$-use-CacheManager$writeBitmapToCache$2$1$1":I
    :try_start_2
    invoke-static {v1, v7}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 102
    nop

    .end local v0    # "$i$a$-runCatching-CacheManager$writeBitmapToCache$2$1":I
    invoke-static {v3}, Lkotlin/coroutines/jvm/internal/Boxing;->boxBoolean(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 95
    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_0

    .line 100
    .restart local v0    # "$i$a$-runCatching-CacheManager$writeBitmapToCache$2$1":I
    :catchall_0
    move-exception v2

    .end local v0    # "$i$a$-runCatching-CacheManager$writeBitmapToCache$2$1":I
    .end local p1    # "$result":Ljava/lang/Object;
    :try_start_3
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .restart local v0    # "$i$a$-runCatching-CacheManager$writeBitmapToCache$2$1":I
    .restart local p1    # "$result":Ljava/lang/Object;
    :catchall_1
    move-exception v3

    :try_start_4
    invoke-static {v1, v2}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .end local p1    # "$result":Ljava/lang/Object;
    throw v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 95
    .end local v0    # "$i$a$-runCatching-CacheManager$writeBitmapToCache$2$1":I
    .restart local p1    # "$result":Ljava/lang/Object;
    :catchall_2
    move-exception v0

    sget-object v1, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {v0}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 103
    :goto_0
    iget v1, p0, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$2;->$pageNo:I

    invoke-static {v0}, Lkotlin/Result;->exceptionOrNull-impl(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_1

    .local v2, "it":Ljava/lang/Throwable;
    const/4 v3, 0x0

    .line 104
    .local v3, "$i$a$-onFailure-CacheManager$writeBitmapToCache$2$2":I
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error writing bitmap to cache (Page "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v4, 0x29

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v4, "CacheManager"

    invoke-static {v4, v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 105
    nop

    .line 103
    .end local v2    # "it":Ljava/lang/Throwable;
    .end local v3    # "$i$a$-onFailure-CacheManager$writeBitmapToCache$2$2":I
    nop

    :cond_1
    invoke-static {v0}, Lkotlin/Result;->box-impl(Ljava/lang/Object;)Lkotlin/Result;

    move-result-object v0

    .line 105
    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
