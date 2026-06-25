.class public final Lcom/rajat/pdfviewer/util/FileUtils;
.super Ljava/lang/Object;
.source "FileUtils.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nFileUtils.kt\nKotlin\n*S Kotlin\n*F\n+ 1 FileUtils.kt\ncom/rajat/pdfviewer/util/FileUtils\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 3 _Arrays.kt\nkotlin/collections/ArraysKt___ArraysKt\n*L\n1#1,145:1\n1#2:146\n13472#3,2:147\n*S KotlinDebug\n*F\n+ 1 FileUtils.kt\ncom/rajat/pdfviewer/util/FileUtils\n*L\n81#1:147,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000Z\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0005\u0008\u00c7\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001e\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u0005H\u0086@\u00a2\u0006\u0002\u0010\u000bJ\u0016\u0010\u000c\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u0007J\u001e\u0010\u0011\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\t2\u0006\u0010\u0012\u001a\u00020\u0013H\u0086@\u00a2\u0006\u0002\u0010\u0014J\u001e\u0010\u0015\u001a\u00020\u00132\u0006\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0018\u001a\u00020\u0005H\u0086@\u00a2\u0006\u0002\u0010\u0019J\u000e\u0010\u001a\u001a\u00020\u00052\u0006\u0010\u001b\u001a\u00020\u0005J\u001e\u0010\u001a\u001a\u00020\u00052\u0006\u0010\u001b\u001a\u00020\u00052\u0006\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u001e\u001a\u00020\u0005J\u001a\u0010\u001f\u001a\u00020\r2\u0006\u0010\u0008\u001a\u00020\t2\n\u0008\u0002\u0010 \u001a\u0004\u0018\u00010\u0005J2\u0010!\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\"\u001a\u00020\u00072\u0006\u0010#\u001a\u00020$2\u0012\u0010%\u001a\u000e\u0012\u0004\u0012\u00020$\u0012\u0004\u0012\u00020\r0&J\u0018\u0010\'\u001a\u00020(2\u0008\u0010\"\u001a\u0004\u0018\u00010\u0007H\u0086@\u00a2\u0006\u0002\u0010)J\u0018\u0010*\u001a\u00020\u00052\u0006\u0010+\u001a\u00020\u00012\u0008\u0008\u0002\u0010,\u001a\u00020\u0005R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000\u00a8\u0006-"
    }
    d2 = {
        "Lcom/rajat/pdfviewer/util/FileUtils;",
        "",
        "<init>",
        "()V",
        "TAG",
        "",
        "fileFromAsset",
        "Ljava/io/File;",
        "context",
        "Landroid/content/Context;",
        "assetName",
        "(Landroid/content/Context;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "copy",
        "",
        "inputStream",
        "Ljava/io/InputStream;",
        "output",
        "uriToFile",
        "uri",
        "Landroid/net/Uri;",
        "(Landroid/content/Context;Landroid/net/Uri;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "createPdfDocumentUri",
        "contentResolver",
        "Landroid/content/ContentResolver;",
        "fileName",
        "(Landroid/content/ContentResolver;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "getCachedFileName",
        "url",
        "cacheStrategy",
        "Lcom/rajat/pdfviewer/util/CacheStrategy;",
        "sessionToken",
        "clearPdfCache",
        "exceptFileName",
        "writeFile",
        "file",
        "totalLength",
        "",
        "onProgress",
        "Lkotlin/Function1;",
        "isValidPdf",
        "",
        "(Ljava/io/File;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "cachedFileNameWithFormat",
        "name",
        "format",
        "pdfViewer_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final $stable:I = 0x0

.field public static final INSTANCE:Lcom/rajat/pdfviewer/util/FileUtils;

.field private static final TAG:Ljava/lang/String; = "PdfValidator"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/rajat/pdfviewer/util/FileUtils;

    invoke-direct {v0}, Lcom/rajat/pdfviewer/util/FileUtils;-><init>()V

    sput-object v0, Lcom/rajat/pdfviewer/util/FileUtils;->INSTANCE:Lcom/rajat/pdfviewer/util/FileUtils;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic cachedFileNameWithFormat$default(Lcom/rajat/pdfviewer/util/FileUtils;Ljava/lang/Object;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/String;
    .locals 0

    .line 143
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const-string p2, ".jpg"

    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/util/FileUtils;->cachedFileNameWithFormat(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic clearPdfCache$default(Lcom/rajat/pdfviewer/util/FileUtils;Landroid/content/Context;Ljava/lang/String;ILjava/lang/Object;)V
    .locals 0

    .line 78
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/util/FileUtils;->clearPdfCache(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static final clearPdfCache$lambda$3(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;)Z
    .locals 3
    .param p0, "$exceptFileName"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;

    .line 80
    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const/4 p1, 0x2

    const/4 v0, 0x0

    const-string v1, ".pdf"

    const/4 v2, 0x0

    invoke-static {p2, v1, v2, p1, v0}, Lkotlin/text/StringsKt;->endsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-static {p2, p0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    const/4 v2, 0x1

    :cond_0
    return v2
.end method


# virtual methods
.method public final cachedFileNameWithFormat(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "name"    # Ljava/lang/Object;
    .param p2, "format"    # Ljava/lang/String;

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "format"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 143
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final clearPdfCache(Landroid/content/Context;Ljava/lang/String;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "exceptFileName"    # Ljava/lang/String;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 79
    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v0

    .line 81
    .local v0, "cacheDir":Ljava/io/File;
    nop

    .line 80
    new-instance v1, Lcom/rajat/pdfviewer/util/FileUtils$$ExternalSyntheticLambda0;

    invoke-direct {v1, p2}, Lcom/rajat/pdfviewer/util/FileUtils$$ExternalSyntheticLambda0;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v1

    .line 81
    if-eqz v1, :cond_1

    .line 80
    nop

    .line 81
    nop

    .local v1, "$this$forEach$iv":[Ljava/lang/Object;
    const/4 v2, 0x0

    .line 147
    .local v2, "$i$f$forEach":I
    array-length v3, v1

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_0

    aget-object v5, v1, v4

    .local v5, "element$iv":Ljava/lang/Object;
    move-object v6, v5

    .local v6, "it":Ljava/io/File;
    const/4 v7, 0x0

    .line 81
    .local v7, "$i$a$-forEach-FileUtils$clearPdfCache$2":I
    invoke-virtual {v6}, Ljava/io/File;->delete()Z

    .line 147
    .end local v6    # "it":Ljava/io/File;
    .end local v7    # "$i$a$-forEach-FileUtils$clearPdfCache$2":I
    nop

    .end local v5    # "element$iv":Ljava/lang/Object;
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 148
    :cond_0
    nop

    .line 82
    .end local v1    # "$this$forEach$iv":[Ljava/lang/Object;
    .end local v2    # "$i$f$forEach":I
    :cond_1
    return-void
.end method

.method public final copy(Ljava/io/InputStream;Ljava/io/File;)V
    .locals 11
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "output"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "inputStream"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "output"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 32
    move-object v0, p1

    check-cast v0, Ljava/io/Closeable;

    :try_start_0
    move-object v1, v0

    check-cast v1, Ljava/io/InputStream;

    .local v1, "input":Ljava/io/InputStream;
    const/4 v2, 0x0

    .line 33
    .local v2, "$i$a$-use-FileUtils$copy$1":I
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    check-cast v3, Ljava/io/Closeable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    :try_start_1
    move-object v4, v3

    check-cast v4, Ljava/io/FileOutputStream;

    .local v4, "outputStream":Ljava/io/FileOutputStream;
    const/4 v5, 0x0

    .line 34
    .local v5, "$i$a$-use-FileUtils$copy$1$1":I
    const/16 v6, 0x400

    new-array v6, v6, [B

    .line 35
    .local v6, "buffer":[B
    const/4 v7, 0x0

    .line 36
    .local v7, "read":I
    :goto_0
    invoke-virtual {v1, v6}, Ljava/io/InputStream;->read([B)I

    move-result v8

    move v9, v8

    .line 146
    .local v9, "it":I
    const/4 v10, 0x0

    .line 36
    .local v10, "$i$a$-also-FileUtils$copy$1$1$1":I
    move v7, v9

    .end local v9    # "it":I
    .end local v10    # "$i$a$-also-FileUtils$copy$1$1$1":I
    const/4 v9, -0x1

    if-eq v8, v9, :cond_0

    .line 37
    const/4 v8, 0x0

    invoke-virtual {v4, v6, v8, v7}, Ljava/io/FileOutputStream;->write([BII)V

    goto :goto_0

    .line 39
    :cond_0
    nop

    .end local v4    # "outputStream":Ljava/io/FileOutputStream;
    .end local v5    # "$i$a$-use-FileUtils$copy$1$1":I
    .end local v6    # "buffer":[B
    .end local v7    # "read":I
    sget-object v4, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    const/4 v4, 0x0

    :try_start_2
    invoke-static {v3, v4}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 40
    nop

    .end local v1    # "input":Ljava/io/InputStream;
    .end local v2    # "$i$a$-use-FileUtils$copy$1":I
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 32
    invoke-static {v0, v4}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 41
    return-void

    .line 33
    .restart local v1    # "input":Ljava/io/InputStream;
    .restart local v2    # "$i$a$-use-FileUtils$copy$1":I
    :catchall_0
    move-exception v4

    .end local v1    # "input":Ljava/io/InputStream;
    .end local v2    # "$i$a$-use-FileUtils$copy$1":I
    .end local p1    # "inputStream":Ljava/io/InputStream;
    .end local p2    # "output":Ljava/io/File;
    :try_start_3
    throw v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .restart local v1    # "input":Ljava/io/InputStream;
    .restart local v2    # "$i$a$-use-FileUtils$copy$1":I
    .restart local p1    # "inputStream":Ljava/io/InputStream;
    .restart local p2    # "output":Ljava/io/File;
    :catchall_1
    move-exception v5

    :try_start_4
    invoke-static {v3, v4}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .end local p1    # "inputStream":Ljava/io/InputStream;
    .end local p2    # "output":Ljava/io/File;
    throw v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 32
    .end local v1    # "input":Ljava/io/InputStream;
    .end local v2    # "$i$a$-use-FileUtils$copy$1":I
    .restart local p1    # "inputStream":Ljava/io/InputStream;
    .restart local p2    # "output":Ljava/io/File;
    :catchall_2
    move-exception v1

    .end local p1    # "inputStream":Ljava/io/InputStream;
    .end local p2    # "output":Ljava/io/File;
    :try_start_5
    throw v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .restart local p1    # "inputStream":Ljava/io/InputStream;
    .restart local p2    # "output":Ljava/io/File;
    :catchall_3
    move-exception v2

    invoke-static {v0, v1}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public final createPdfDocumentUri(Landroid/content/ContentResolver;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 3
    .param p1, "contentResolver"    # Landroid/content/ContentResolver;
    .param p2, "fileName"    # Ljava/lang/String;
    .param p3, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ContentResolver;",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Landroid/net/Uri;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 52
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v0

    check-cast v0, Lkotlin/coroutines/CoroutineContext;

    new-instance v1, Lcom/rajat/pdfviewer/util/FileUtils$createPdfDocumentUri$2;

    const/4 v2, 0x0

    invoke-direct {v1, p1, p2, v2}, Lcom/rajat/pdfviewer/util/FileUtils$createPdfDocumentUri$2;-><init>(Landroid/content/ContentResolver;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    check-cast v1, Lkotlin/jvm/functions/Function2;

    invoke-static {v0, v1, p3}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    .line 63
    return-object v0
.end method

.method public final fileFromAsset(Landroid/content/Context;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "assetName"    # Ljava/lang/String;
    .param p3, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Ljava/io/File;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 21
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v0

    check-cast v0, Lkotlin/coroutines/CoroutineContext;

    new-instance v1, Lcom/rajat/pdfviewer/util/FileUtils$fileFromAsset$2;

    const/4 v2, 0x0

    invoke-direct {v1, p1, p2, v2}, Lcom/rajat/pdfviewer/util/FileUtils$fileFromAsset$2;-><init>(Landroid/content/Context;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    check-cast v1, Lkotlin/jvm/functions/Function2;

    invoke-static {v0, v1, p3}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    .line 28
    return-object v0
.end method

.method public final getCachedFileName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    const-string/jumbo v0, "url"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 67
    sget-object v0, Lcom/rajat/pdfviewer/util/CacheHelper;->INSTANCE:Lcom/rajat/pdfviewer/util/CacheHelper;

    invoke-virtual {v0, p1}, Lcom/rajat/pdfviewer/util/CacheHelper;->getRemoteDocumentCacheKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getCachedFileName(Ljava/lang/String;Lcom/rajat/pdfviewer/util/CacheStrategy;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "cacheStrategy"    # Lcom/rajat/pdfviewer/util/CacheStrategy;
    .param p3, "sessionToken"    # Ljava/lang/String;

    const-string/jumbo v0, "url"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "cacheStrategy"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "sessionToken"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 75
    sget-object v0, Lcom/rajat/pdfviewer/util/CacheHelper;->INSTANCE:Lcom/rajat/pdfviewer/util/CacheHelper;

    invoke-virtual {v0, p1, p2, p3}, Lcom/rajat/pdfviewer/util/CacheHelper;->getRemoteDocumentCacheKey(Ljava/lang/String;Lcom/rajat/pdfviewer/util/CacheStrategy;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final isValidPdf(Ljava/io/File;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 3
    .param p1, "file"    # Ljava/io/File;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Ljava/lang/Boolean;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 102
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v0

    check-cast v0, Lkotlin/coroutines/CoroutineContext;

    new-instance v1, Lcom/rajat/pdfviewer/util/FileUtils$isValidPdf$2;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v2}, Lcom/rajat/pdfviewer/util/FileUtils$isValidPdf$2;-><init>(Ljava/io/File;Lkotlin/coroutines/Continuation;)V

    check-cast v1, Lkotlin/jvm/functions/Function2;

    invoke-static {v0, v1, p2}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    .line 141
    return-object v0
.end method

.method public final uriToFile(Landroid/content/Context;Landroid/net/Uri;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 6
    .param p3, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/net/Uri;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Ljava/io/File;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    instance-of v0, p3, Lcom/rajat/pdfviewer/util/FileUtils$uriToFile$1;

    if-eqz v0, :cond_0

    move-object v0, p3

    check-cast v0, Lcom/rajat/pdfviewer/util/FileUtils$uriToFile$1;

    iget v1, v0, Lcom/rajat/pdfviewer/util/FileUtils$uriToFile$1;->label:I

    const/high16 v2, -0x80000000

    and-int/2addr v1, v2

    if-eqz v1, :cond_0

    iget v1, v0, Lcom/rajat/pdfviewer/util/FileUtils$uriToFile$1;->label:I

    sub-int/2addr v1, v2

    iput v1, v0, Lcom/rajat/pdfviewer/util/FileUtils$uriToFile$1;->label:I

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/rajat/pdfviewer/util/FileUtils$uriToFile$1;

    invoke-direct {v0, p0, p3}, Lcom/rajat/pdfviewer/util/FileUtils$uriToFile$1;-><init>(Lcom/rajat/pdfviewer/util/FileUtils;Lkotlin/coroutines/Continuation;)V

    .local v0, "$continuation":Lkotlin/coroutines/Continuation;
    :goto_0
    iget-object v1, v0, Lcom/rajat/pdfviewer/util/FileUtils$uriToFile$1;->result:Ljava/lang/Object;

    .local v1, "$result":Ljava/lang/Object;
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v2

    .line 43
    iget v3, v0, Lcom/rajat/pdfviewer/util/FileUtils$uriToFile$1;->label:I

    packed-switch v3, :pswitch_data_0

    .end local v0    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local v1    # "$result":Ljava/lang/Object;
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .restart local v0    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v1    # "$result":Ljava/lang/Object;
    :pswitch_0
    invoke-static {v1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object p1, v1

    goto :goto_1

    :pswitch_1
    invoke-static {v1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .local p1, "context":Landroid/content/Context;
    .local p2, "uri":Landroid/net/Uri;
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v3

    check-cast v3, Lkotlin/coroutines/CoroutineContext;

    new-instance v4, Lcom/rajat/pdfviewer/util/FileUtils$uriToFile$2;

    const/4 v5, 0x0

    invoke-direct {v4, p1, p2, v5}, Lcom/rajat/pdfviewer/util/FileUtils$uriToFile$2;-><init>(Landroid/content/Context;Landroid/net/Uri;Lkotlin/coroutines/Continuation;)V

    check-cast v4, Lkotlin/jvm/functions/Function2;

    const/4 v5, 0x1

    iput v5, v0, Lcom/rajat/pdfviewer/util/FileUtils$uriToFile$1;->label:I

    invoke-static {v3, v4, v0}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "uri":Landroid/net/Uri;
    if-ne p1, v2, :cond_1

    return-object v2

    :cond_1
    :goto_1
    const-string/jumbo p2, "withContext(...)"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 49
    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final writeFile(Ljava/io/InputStream;Ljava/io/File;JLkotlin/jvm/functions/Function1;)V
    .locals 12
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "file"    # Ljava/io/File;
    .param p3, "totalLength"    # J
    .param p5, "onProgress"    # Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            "Ljava/io/File;",
            "J",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Long;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v1, p5

    const-string v0, "inputStream"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "file"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "onProgress"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 85
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    move-object v2, v0

    check-cast v2, Ljava/io/Closeable;

    :try_start_0
    move-object v0, v2

    check-cast v0, Ljava/io/FileOutputStream;

    move-object v3, v0

    .local v3, "outputStream":Ljava/io/FileOutputStream;
    const/4 v4, 0x0

    .line 86
    .local v4, "$i$a$-use-FileUtils$writeFile$1":I
    const/16 v0, 0x2000

    new-array v0, v0, [B

    move-object v5, v0

    .line 87
    .local v5, "data":[B
    const-wide/16 v6, 0x0

    .line 88
    .local v6, "totalBytesRead":J
    const/4 v0, 0x0

    .line 89
    .local v0, "bytesRead":I
    :goto_0
    invoke-virtual {p1, v5}, Ljava/io/InputStream;->read([B)I

    move-result v8

    move v9, v8

    .line 146
    .local v9, "it":I
    const/4 v10, 0x0

    .line 89
    .local v10, "$i$a$-also-FileUtils$writeFile$1$1":I
    nop

    .end local v0    # "bytesRead":I
    .end local v10    # "$i$a$-also-FileUtils$writeFile$1$1":I
    .local v9, "bytesRead":I
    const/4 v0, -0x1

    if-eq v8, v0, :cond_0

    .line 90
    const/4 v0, 0x0

    invoke-virtual {v3, v5, v0, v9}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 91
    int-to-long v10, v9

    add-long/2addr v6, v10

    .line 92
    nop

    .line 93
    :try_start_1
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {v1, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 94
    :catch_0
    move-exception v0

    .line 95
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2
    const-string v8, "PdfValidator"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Progress callback failed: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    move-object v11, v0

    check-cast v11, Ljava/lang/Throwable;

    invoke-static {v8, v10, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 89
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_1
    move v0, v9

    goto :goto_0

    .line 98
    :cond_0
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->flush()V

    .line 99
    nop

    .end local v3    # "outputStream":Ljava/io/FileOutputStream;
    .end local v4    # "$i$a$-use-FileUtils$writeFile$1":I
    .end local v5    # "data":[B
    .end local v6    # "totalBytesRead":J
    .end local v9    # "bytesRead":I
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 85
    const/4 v0, 0x0

    invoke-static {v2, v0}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 100
    return-void

    .line 85
    :catchall_0
    move-exception v0

    move-object v3, v0

    .end local p1    # "inputStream":Ljava/io/InputStream;
    .end local p2    # "file":Ljava/io/File;
    .end local p3    # "totalLength":J
    .end local p5    # "onProgress":Lkotlin/jvm/functions/Function1;
    :try_start_3
    throw v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .restart local p1    # "inputStream":Ljava/io/InputStream;
    .restart local p2    # "file":Ljava/io/File;
    .restart local p3    # "totalLength":J
    .restart local p5    # "onProgress":Lkotlin/jvm/functions/Function1;
    :catchall_1
    move-exception v0

    invoke-static {v2, v3}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0
.end method
