.class public final Lcom/rajat/pdfviewer/PdfRendererCore$Companion;
.super Ljava/lang/Object;
.source "PdfRendererCore.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rajat/pdfviewer/PdfRendererCore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000B\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J.\u0010\u000c\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u0015H\u0086@\u00a2\u0006\u0002\u0010\u0016J\u000e\u0010\u0017\u001a\u00020\u00112\u0006\u0010\u0018\u001a\u00020\u0019J\u0010\u0010\u001a\u001a\u00020\u00132\u0006\u0010\u0018\u001a\u00020\u0019H\u0007J\u0010\u0010\u001b\u001a\u00020\u00132\u0006\u0010\u001c\u001a\u00020\u0013H\u0002R\u001a\u0010\u0004\u001a\u00020\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007\"\u0004\u0008\u0008\u0010\tR\u000e\u0010\n\u001a\u00020\u000bX\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001d\u001a\u00020\u0013X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001e\u001a\u00020\u0013X\u0082T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001f"
    }
    d2 = {
        "Lcom/rajat/pdfviewer/PdfRendererCore$Companion;",
        "",
        "<init>",
        "()V",
        "enableDebugMetrics",
        "",
        "getEnableDebugMetrics",
        "()Z",
        "setEnableDebugMetrics",
        "(Z)V",
        "prefetchDistance",
        "",
        "create",
        "Lcom/rajat/pdfviewer/PdfRendererCore;",
        "context",
        "Landroid/content/Context;",
        "fileDescriptor",
        "Landroid/os/ParcelFileDescriptor;",
        "cacheIdentifier",
        "",
        "cacheStrategy",
        "Lcom/rajat/pdfviewer/util/CacheStrategy;",
        "(Landroid/content/Context;Landroid/os/ParcelFileDescriptor;Ljava/lang/String;Lcom/rajat/pdfviewer/util/CacheStrategy;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "getFileDescriptor",
        "file",
        "Ljava/io/File;",
        "getCacheIdentifierFromFile",
        "sanitizeFilePath",
        "filePath",
        "LOG_TAG",
        "METRICS_TAG",
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


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Lcom/rajat/pdfviewer/PdfRendererCore$Companion;-><init>()V

    return-void
.end method

.method private final sanitizeFilePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "filePath"    # Ljava/lang/String;

    .line 79
    const-string v0, ""

    .line 80
    nop

    .line 81
    const/4 v1, 0x0

    :try_start_0
    new-array v2, v1, [Ljava/lang/String;

    invoke-static {p1, v2}, Ljava/nio/file/Paths;->get(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v2

    .line 82
    .local v2, "path":Ljava/nio/file/Path;
    new-array v1, v1, [Ljava/nio/file/LinkOption;

    invoke-static {v2, v1}, Ljava/nio/file/Files;->exists(Ljava/nio/file/Path;[Ljava/nio/file/LinkOption;)Z

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v1, :cond_0

    .line 83
    .end local v2    # "path":Ljava/nio/file/Path;
    move-object v0, p1

    nop

    :cond_0
    goto :goto_0

    .line 84
    :catch_0
    move-exception v1

    .line 85
    .local v1, "e":Ljava/lang/Exception;
    nop

    .line 79
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_0
    return-object v0
.end method


# virtual methods
.method public final create(Landroid/content/Context;Landroid/os/ParcelFileDescriptor;Ljava/lang/String;Lcom/rajat/pdfviewer/util/CacheStrategy;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "fileDescriptor"    # Landroid/os/ParcelFileDescriptor;
    .param p3, "cacheIdentifier"    # Ljava/lang/String;
    .param p4, "cacheStrategy"    # Lcom/rajat/pdfviewer/util/CacheStrategy;
    .param p5, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/os/ParcelFileDescriptor;",
            "Ljava/lang/String;",
            "Lcom/rajat/pdfviewer/util/CacheStrategy;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/rajat/pdfviewer/PdfRendererCore;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 50
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v0

    check-cast v0, Lkotlin/coroutines/CoroutineContext;

    new-instance v1, Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;

    const/4 v6, 0x0

    move-object v3, p1

    move-object v2, p2

    move-object v4, p3

    move-object v5, p4

    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "fileDescriptor":Landroid/os/ParcelFileDescriptor;
    .end local p3    # "cacheIdentifier":Ljava/lang/String;
    .end local p4    # "cacheStrategy":Lcom/rajat/pdfviewer/util/CacheStrategy;
    .local v2, "fileDescriptor":Landroid/os/ParcelFileDescriptor;
    .local v3, "context":Landroid/content/Context;
    .local v4, "cacheIdentifier":Ljava/lang/String;
    .local v5, "cacheStrategy":Lcom/rajat/pdfviewer/util/CacheStrategy;
    invoke-direct/range {v1 .. v6}, Lcom/rajat/pdfviewer/PdfRendererCore$Companion$create$2;-><init>(Landroid/os/ParcelFileDescriptor;Landroid/content/Context;Ljava/lang/String;Lcom/rajat/pdfviewer/util/CacheStrategy;Lkotlin/coroutines/Continuation;)V

    check-cast v1, Lkotlin/jvm/functions/Function2;

    invoke-static {v0, v1, p5}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    .line 62
    return-object p1
.end method

.method public final getCacheIdentifierFromFile(Ljava/io/File;)Ljava/lang/String;
    .locals 3
    .param p1, "file"    # Ljava/io/File;
    .annotation runtime Lkotlin/Deprecated;
        message = "Use CacheHelper.getCacheKey(file.absolutePath) directly."
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = "CacheHelper.getCacheKey(file.absolutePath)"
            imports = {
                "com.rajat.pdfviewer.util.CacheHelper"
            }
        .end subannotation
    .end annotation

    const-string v0, "file"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 76
    sget-object v0, Lcom/rajat/pdfviewer/util/CacheHelper;->INSTANCE:Lcom/rajat/pdfviewer/util/CacheHelper;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    const-string v2, "getAbsolutePath(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/rajat/pdfviewer/util/CacheHelper;->getCacheKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getEnableDebugMetrics()Z
    .locals 1

    .line 33
    invoke-static {}, Lcom/rajat/pdfviewer/PdfRendererCore;->access$getEnableDebugMetrics$cp()Z

    move-result v0

    return v0
.end method

.method public final getFileDescriptor(Ljava/io/File;)Landroid/os/ParcelFileDescriptor;
    .locals 3
    .param p1, "file"    # Ljava/io/File;

    const-string v0, "file"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 65
    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    const-string v2, "getPath(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0, v1}, Lcom/rajat/pdfviewer/PdfRendererCore$Companion;->sanitizeFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 66
    .local v0, "safeFile":Ljava/io/File;
    const/high16 v1, 0x10000000

    invoke-static {v0, v1}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    move-result-object v1

    const-string/jumbo v2, "open(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v1
.end method

.method public final setEnableDebugMetrics(Z)V
    .locals 0
    .param p1, "<set-?>"    # Z

    .line 33
    invoke-static {p1}, Lcom/rajat/pdfviewer/PdfRendererCore;->access$setEnableDebugMetrics$cp(Z)V

    return-void
.end method
