.class public final Lcom/rajat/pdfviewer/PdfDownloader;
.super Ljava/lang/Object;
.source "PdfDownloader.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rajat/pdfviewer/PdfDownloader$Companion;,
        Lcom/rajat/pdfviewer/PdfDownloader$StatusListener;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPdfDownloader.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PdfDownloader.kt\ncom/rajat/pdfviewer/PdfDownloader\n+ 2 _Maps.kt\nkotlin/collections/MapsKt___MapsKt\n*L\n1#1,216:1\n216#2,2:217\n*S KotlinDebug\n*F\n+ 1 PdfDownloader.kt\ncom/rajat/pdfviewer/PdfDownloader\n*L\n191#1:217,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000d\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u0007\u0018\u0000 ,2\u00020\u0001:\u0002+,BA\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\u0007\u0012\u0006\u0010\t\u001a\u00020\n\u0012\u0006\u0010\u000b\u001a\u00020\u000c\u0012\u0008\u0008\u0002\u0010\r\u001a\u00020\u000e\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u0006\u0010\u0013\u001a\u00020\u0014J\u0016\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0016\u001a\u00020\u0007H\u0082@\u00a2\u0006\u0002\u0010\u0017J\u0010\u0010\u0018\u001a\u00020\u00142\u0006\u0010\u0019\u001a\u00020\u001aH\u0002J&\u0010\u001b\u001a\u00020\u00142\u0006\u0010\u0016\u001a\u00020\u00072\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001c\u001a\u00020\u001aH\u0082@\u00a2\u0006\u0002\u0010\u001dJ\u001e\u0010\u001e\u001a\u00020\u00142\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001c\u001a\u00020\u001aH\u0082@\u00a2\u0006\u0002\u0010\u001fJ\u0010\u0010 \u001a\u00020!2\u0006\u0010\"\u001a\u00020#H\u0002J\u001e\u0010$\u001a\u00020%2\u0006\u0010\u0016\u001a\u00020\u00072\u0006\u0010\u001c\u001a\u00020\u001aH\u0082@\u00a2\u0006\u0002\u0010&J\u0010\u0010\'\u001a\u00020(2\u0006\u0010\u0016\u001a\u00020\u0007H\u0002J\u0010\u0010)\u001a\u00020\u00142\u0006\u0010*\u001a\u00020(H\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u000cX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u000eX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0012X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006-"
    }
    d2 = {
        "Lcom/rajat/pdfviewer/PdfDownloader;",
        "",
        "coroutineScope",
        "Lkotlinx/coroutines/CoroutineScope;",
        "headers",
        "Lcom/rajat/pdfviewer/HeaderData;",
        "url",
        "",
        "cachedFileName",
        "cacheStrategy",
        "Lcom/rajat/pdfviewer/util/CacheStrategy;",
        "listener",
        "Lcom/rajat/pdfviewer/PdfDownloader$StatusListener;",
        "httpClient",
        "Lokhttp3/OkHttpClient;",
        "<init>",
        "(Lkotlinx/coroutines/CoroutineScope;Lcom/rajat/pdfviewer/HeaderData;Ljava/lang/String;Ljava/lang/String;Lcom/rajat/pdfviewer/util/CacheStrategy;Lcom/rajat/pdfviewer/PdfDownloader$StatusListener;Lokhttp3/OkHttpClient;)V",
        "cachePolicy",
        "Lcom/rajat/pdfviewer/util/CachePolicy;",
        "start",
        "",
        "checkAndDownload",
        "downloadUrl",
        "(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "prepareDownloadDirectory",
        "cacheDir",
        "Ljava/io/File;",
        "retryDownload",
        "pdfFile",
        "(Ljava/lang/String;Ljava/io/File;Ljava/io/File;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "completeSuccessfulDownload",
        "(Ljava/io/File;Ljava/io/File;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "isInvalidFileError",
        "",
        "error",
        "Ljava/io/IOException;",
        "downloadFile",
        "",
        "(Ljava/lang/String;Ljava/io/File;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "makeNetworkRequest",
        "Lokhttp3/Response;",
        "validateResponse",
        "response",
        "StatusListener",
        "Companion",
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
.field public static final $stable:I

.field public static final Companion:Lcom/rajat/pdfviewer/PdfDownloader$Companion;

.field private static final MAX_RETRIES:I = 0x2

.field private static final RETRY_DELAY:J = 0x7d0L

.field private static final TAG:Ljava/lang/String; = "PdfDownloader"


# instance fields
.field private final cachePolicy:Lcom/rajat/pdfviewer/util/CachePolicy;

.field private final cacheStrategy:Lcom/rajat/pdfviewer/util/CacheStrategy;

.field private final cachedFileName:Ljava/lang/String;

.field private final coroutineScope:Lkotlinx/coroutines/CoroutineScope;

.field private final headers:Lcom/rajat/pdfviewer/HeaderData;

.field private final httpClient:Lokhttp3/OkHttpClient;

.field private final listener:Lcom/rajat/pdfviewer/PdfDownloader$StatusListener;

.field private final url:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/rajat/pdfviewer/PdfDownloader$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/rajat/pdfviewer/PdfDownloader$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/rajat/pdfviewer/PdfDownloader;->Companion:Lcom/rajat/pdfviewer/PdfDownloader$Companion;

    const/16 v0, 0x8

    sput v0, Lcom/rajat/pdfviewer/PdfDownloader;->$stable:I

    return-void
.end method

.method public constructor <init>(Lkotlinx/coroutines/CoroutineScope;Lcom/rajat/pdfviewer/HeaderData;Ljava/lang/String;Ljava/lang/String;Lcom/rajat/pdfviewer/util/CacheStrategy;Lcom/rajat/pdfviewer/PdfDownloader$StatusListener;Lokhttp3/OkHttpClient;)V
    .locals 5
    .param p1, "coroutineScope"    # Lkotlinx/coroutines/CoroutineScope;
    .param p2, "headers"    # Lcom/rajat/pdfviewer/HeaderData;
    .param p3, "url"    # Ljava/lang/String;
    .param p4, "cachedFileName"    # Ljava/lang/String;
    .param p5, "cacheStrategy"    # Lcom/rajat/pdfviewer/util/CacheStrategy;
    .param p6, "listener"    # Lcom/rajat/pdfviewer/PdfDownloader$StatusListener;
    .param p7, "httpClient"    # Lokhttp3/OkHttpClient;

    const-string v0, "coroutineScope"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "headers"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "url"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "cachedFileName"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "cacheStrategy"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "listener"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "httpClient"

    invoke-static {p7, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfDownloader;->coroutineScope:Lkotlinx/coroutines/CoroutineScope;

    .line 27
    iput-object p2, p0, Lcom/rajat/pdfviewer/PdfDownloader;->headers:Lcom/rajat/pdfviewer/HeaderData;

    .line 28
    iput-object p3, p0, Lcom/rajat/pdfviewer/PdfDownloader;->url:Ljava/lang/String;

    .line 29
    iput-object p4, p0, Lcom/rajat/pdfviewer/PdfDownloader;->cachedFileName:Ljava/lang/String;

    .line 30
    iput-object p5, p0, Lcom/rajat/pdfviewer/PdfDownloader;->cacheStrategy:Lcom/rajat/pdfviewer/util/CacheStrategy;

    .line 31
    iput-object p6, p0, Lcom/rajat/pdfviewer/PdfDownloader;->listener:Lcom/rajat/pdfviewer/PdfDownloader$StatusListener;

    .line 32
    iput-object p7, p0, Lcom/rajat/pdfviewer/PdfDownloader;->httpClient:Lokhttp3/OkHttpClient;

    .line 34
    sget-object v0, Lcom/rajat/pdfviewer/util/CachePolicy;->Companion:Lcom/rajat/pdfviewer/util/CachePolicy$Companion;

    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfDownloader;->cacheStrategy:Lcom/rajat/pdfviewer/util/CacheStrategy;

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {v0, v1, v4, v2, v3}, Lcom/rajat/pdfviewer/util/CachePolicy$Companion;->from$default(Lcom/rajat/pdfviewer/util/CachePolicy$Companion;Lcom/rajat/pdfviewer/util/CacheStrategy;IILjava/lang/Object;)Lcom/rajat/pdfviewer/util/CachePolicy;

    move-result-object v0

    iput-object v0, p0, Lcom/rajat/pdfviewer/PdfDownloader;->cachePolicy:Lcom/rajat/pdfviewer/util/CachePolicy;

    .line 25
    return-void
.end method

.method public synthetic constructor <init>(Lkotlinx/coroutines/CoroutineScope;Lcom/rajat/pdfviewer/HeaderData;Ljava/lang/String;Ljava/lang/String;Lcom/rajat/pdfviewer/util/CacheStrategy;Lcom/rajat/pdfviewer/PdfDownloader$StatusListener;Lokhttp3/OkHttpClient;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 9

    .line 25
    and-int/lit8 v0, p8, 0x40

    if-eqz v0, :cond_0

    .line 32
    sget-object v0, Lcom/rajat/pdfviewer/PdfDownloader;->Companion:Lcom/rajat/pdfviewer/PdfDownloader$Companion;

    invoke-static {v0}, Lcom/rajat/pdfviewer/PdfDownloader$Companion;->access$defaultHttpClient(Lcom/rajat/pdfviewer/PdfDownloader$Companion;)Lokhttp3/OkHttpClient;

    move-result-object v0

    move-object v8, v0

    goto :goto_0

    .line 25
    :cond_0
    move-object/from16 v8, p7

    :goto_0
    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    move-object v7, p6

    invoke-direct/range {v1 .. v8}, Lcom/rajat/pdfviewer/PdfDownloader;-><init>(Lkotlinx/coroutines/CoroutineScope;Lcom/rajat/pdfviewer/HeaderData;Ljava/lang/String;Ljava/lang/String;Lcom/rajat/pdfviewer/util/CacheStrategy;Lcom/rajat/pdfviewer/PdfDownloader$StatusListener;Lokhttp3/OkHttpClient;)V

    .line 33
    return-void
.end method

.method public static final synthetic access$checkAndDownload(Lcom/rajat/pdfviewer/PdfDownloader;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfDownloader;
    .param p1, "downloadUrl"    # Ljava/lang/String;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;

    .line 25
    invoke-direct {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfDownloader;->checkAndDownload(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$completeSuccessfulDownload(Lcom/rajat/pdfviewer/PdfDownloader;Ljava/io/File;Ljava/io/File;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfDownloader;
    .param p1, "cacheDir"    # Ljava/io/File;
    .param p2, "pdfFile"    # Ljava/io/File;
    .param p3, "$completion"    # Lkotlin/coroutines/Continuation;

    .line 25
    invoke-direct {p0, p1, p2, p3}, Lcom/rajat/pdfviewer/PdfDownloader;->completeSuccessfulDownload(Ljava/io/File;Ljava/io/File;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$downloadFile(Lcom/rajat/pdfviewer/PdfDownloader;Ljava/lang/String;Ljava/io/File;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfDownloader;
    .param p1, "downloadUrl"    # Ljava/lang/String;
    .param p2, "pdfFile"    # Ljava/io/File;
    .param p3, "$completion"    # Lkotlin/coroutines/Continuation;

    .line 25
    invoke-direct {p0, p1, p2, p3}, Lcom/rajat/pdfviewer/PdfDownloader;->downloadFile(Ljava/lang/String;Ljava/io/File;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$getListener$p(Lcom/rajat/pdfviewer/PdfDownloader;)Lcom/rajat/pdfviewer/PdfDownloader$StatusListener;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfDownloader;

    .line 25
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfDownloader;->listener:Lcom/rajat/pdfviewer/PdfDownloader$StatusListener;

    return-object v0
.end method

.method public static final synthetic access$getUrl$p(Lcom/rajat/pdfviewer/PdfDownloader;)Ljava/lang/String;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfDownloader;

    .line 25
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfDownloader;->url:Ljava/lang/String;

    return-object v0
.end method

.method public static final synthetic access$makeNetworkRequest(Lcom/rajat/pdfviewer/PdfDownloader;Ljava/lang/String;)Lokhttp3/Response;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfDownloader;
    .param p1, "downloadUrl"    # Ljava/lang/String;

    .line 25
    invoke-direct {p0, p1}, Lcom/rajat/pdfviewer/PdfDownloader;->makeNetworkRequest(Ljava/lang/String;)Lokhttp3/Response;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$retryDownload(Lcom/rajat/pdfviewer/PdfDownloader;Ljava/lang/String;Ljava/io/File;Ljava/io/File;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfDownloader;
    .param p1, "downloadUrl"    # Ljava/lang/String;
    .param p2, "cacheDir"    # Ljava/io/File;
    .param p3, "pdfFile"    # Ljava/io/File;
    .param p4, "$completion"    # Lkotlin/coroutines/Continuation;

    .line 25
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/rajat/pdfviewer/PdfDownloader;->retryDownload(Ljava/lang/String;Ljava/io/File;Ljava/io/File;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$validateResponse(Lcom/rajat/pdfviewer/PdfDownloader;Lokhttp3/Response;)V
    .locals 0
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfDownloader;
    .param p1, "response"    # Lokhttp3/Response;

    .line 25
    invoke-direct {p0, p1}, Lcom/rajat/pdfviewer/PdfDownloader;->validateResponse(Lokhttp3/Response;)V

    return-void
.end method

.method private final checkAndDownload(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 10
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    instance-of v0, p2, Lcom/rajat/pdfviewer/PdfDownloader$checkAndDownload$1;

    if-eqz v0, :cond_0

    move-object v0, p2

    check-cast v0, Lcom/rajat/pdfviewer/PdfDownloader$checkAndDownload$1;

    iget v1, v0, Lcom/rajat/pdfviewer/PdfDownloader$checkAndDownload$1;->label:I

    const/high16 v2, -0x80000000

    and-int/2addr v1, v2

    if-eqz v1, :cond_0

    iget v1, v0, Lcom/rajat/pdfviewer/PdfDownloader$checkAndDownload$1;->label:I

    sub-int/2addr v1, v2

    iput v1, v0, Lcom/rajat/pdfviewer/PdfDownloader$checkAndDownload$1;->label:I

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/rajat/pdfviewer/PdfDownloader$checkAndDownload$1;

    invoke-direct {v0, p0, p2}, Lcom/rajat/pdfviewer/PdfDownloader$checkAndDownload$1;-><init>(Lcom/rajat/pdfviewer/PdfDownloader;Lkotlin/coroutines/Continuation;)V

    .local v0, "$continuation":Lkotlin/coroutines/Continuation;
    :goto_0
    iget-object v1, v0, Lcom/rajat/pdfviewer/PdfDownloader$checkAndDownload$1;->result:Ljava/lang/Object;

    .local v1, "$result":Ljava/lang/Object;
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v2

    .line 71
    iget v3, v0, Lcom/rajat/pdfviewer/PdfDownloader$checkAndDownload$1;->label:I

    const/4 v4, 0x0

    packed-switch v3, :pswitch_data_0

    .end local v0    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local v1    # "$result":Ljava/lang/Object;
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .restart local v0    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v1    # "$result":Ljava/lang/Object;
    :pswitch_0
    invoke-static {v1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto/16 :goto_2

    :pswitch_1
    move-object p1, p0

    .local p1, "this":Lcom/rajat/pdfviewer/PdfDownloader;
    iget-object v3, v0, Lcom/rajat/pdfviewer/PdfDownloader$checkAndDownload$1;->L$2:Ljava/lang/Object;

    check-cast v3, Ljava/io/File;

    .local v3, "pdfFile":Ljava/io/File;
    iget-object v5, v0, Lcom/rajat/pdfviewer/PdfDownloader$checkAndDownload$1;->L$1:Ljava/lang/Object;

    check-cast v5, Ljava/io/File;

    .local v5, "cacheDir":Ljava/io/File;
    iget-object v6, v0, Lcom/rajat/pdfviewer/PdfDownloader$checkAndDownload$1;->L$0:Ljava/lang/Object;

    check-cast v6, Ljava/lang/String;

    .local v6, "downloadUrl":Ljava/lang/String;
    invoke-static {v1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v7, v1

    goto :goto_1

    .end local v3    # "pdfFile":Ljava/io/File;
    .end local v5    # "cacheDir":Ljava/io/File;
    .end local v6    # "downloadUrl":Ljava/lang/String;
    .end local p1    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    :pswitch_2
    invoke-static {v1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v3, p0

    .local v3, "this":Lcom/rajat/pdfviewer/PdfDownloader;
    move-object v6, p1

    .line 72
    .restart local v6    # "downloadUrl":Ljava/lang/String;
    new-instance p1, Ljava/io/File;

    .line 73
    iget-object v5, v3, Lcom/rajat/pdfviewer/PdfDownloader;->listener:Lcom/rajat/pdfviewer/PdfDownloader$StatusListener;

    invoke-interface {v5}, Lcom/rajat/pdfviewer/PdfDownloader$StatusListener;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v5

    .line 74
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "___pdf___cache___/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v3, Lcom/rajat/pdfviewer/PdfDownloader;->cachedFileName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 72
    invoke-direct {p1, v5, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v5, p1

    .line 76
    .restart local v5    # "cacheDir":Ljava/io/File;
    invoke-direct {v3, v5}, Lcom/rajat/pdfviewer/PdfDownloader;->prepareDownloadDirectory(Ljava/io/File;)V

    .line 78
    new-instance p1, Ljava/io/File;

    iget-object v7, v3, Lcom/rajat/pdfviewer/PdfDownloader;->cachedFileName:Ljava/lang/String;

    invoke-direct {p1, v5, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 80
    .local p1, "pdfFile":Ljava/io/File;
    iget-object v7, v3, Lcom/rajat/pdfviewer/PdfDownloader;->cachePolicy:Lcom/rajat/pdfviewer/util/CachePolicy;

    invoke-virtual {v7}, Lcom/rajat/pdfviewer/util/CachePolicy;->getReuseRemoteFile()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_4

    sget-object v7, Lcom/rajat/pdfviewer/util/FileUtils;->INSTANCE:Lcom/rajat/pdfviewer/util/FileUtils;

    iput-object v6, v0, Lcom/rajat/pdfviewer/PdfDownloader$checkAndDownload$1;->L$0:Ljava/lang/Object;

    iput-object v5, v0, Lcom/rajat/pdfviewer/PdfDownloader$checkAndDownload$1;->L$1:Ljava/lang/Object;

    iput-object p1, v0, Lcom/rajat/pdfviewer/PdfDownloader$checkAndDownload$1;->L$2:Ljava/lang/Object;

    const/4 v8, 0x1

    iput v8, v0, Lcom/rajat/pdfviewer/PdfDownloader$checkAndDownload$1;->label:I

    invoke-virtual {v7, p1, v0}, Lcom/rajat/pdfviewer/util/FileUtils;->isValidPdf(Ljava/io/File;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v7

    if-ne v7, v2, :cond_1

    .line 71
    .end local v3    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    return-object v2

    .line 80
    .restart local v3    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    :cond_1
    move-object v9, v3

    move-object v3, p1

    move-object p1, v9

    .local v3, "pdfFile":Ljava/io/File;
    .local p1, "this":Lcom/rajat/pdfviewer/PdfDownloader;
    :goto_1
    check-cast v7, Ljava/lang/Boolean;

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 81
    .end local v6    # "downloadUrl":Ljava/lang/String;
    iput-object v4, v0, Lcom/rajat/pdfviewer/PdfDownloader$checkAndDownload$1;->L$0:Ljava/lang/Object;

    iput-object v4, v0, Lcom/rajat/pdfviewer/PdfDownloader$checkAndDownload$1;->L$1:Ljava/lang/Object;

    iput-object v4, v0, Lcom/rajat/pdfviewer/PdfDownloader$checkAndDownload$1;->L$2:Ljava/lang/Object;

    const/4 v4, 0x2

    iput v4, v0, Lcom/rajat/pdfviewer/PdfDownloader$checkAndDownload$1;->label:I

    invoke-direct {p1, v5, v3, v0}, Lcom/rajat/pdfviewer/PdfDownloader;->completeSuccessfulDownload(Ljava/io/File;Ljava/io/File;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    .end local v3    # "pdfFile":Ljava/io/File;
    .end local v5    # "cacheDir":Ljava/io/File;
    .end local p1    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    if-ne p1, v2, :cond_2

    .line 71
    return-object v2

    .line 85
    :cond_2
    :goto_2
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1

    .line 80
    .restart local v3    # "pdfFile":Ljava/io/File;
    .restart local v5    # "cacheDir":Ljava/io/File;
    .restart local v6    # "downloadUrl":Ljava/lang/String;
    .restart local p1    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    :cond_3
    move-object v9, v3

    move-object v3, p1

    move-object p1, v9

    .line 83
    .local v3, "this":Lcom/rajat/pdfviewer/PdfDownloader;
    .local p1, "pdfFile":Ljava/io/File;
    :cond_4
    iput-object v4, v0, Lcom/rajat/pdfviewer/PdfDownloader$checkAndDownload$1;->L$0:Ljava/lang/Object;

    iput-object v4, v0, Lcom/rajat/pdfviewer/PdfDownloader$checkAndDownload$1;->L$1:Ljava/lang/Object;

    iput-object v4, v0, Lcom/rajat/pdfviewer/PdfDownloader$checkAndDownload$1;->L$2:Ljava/lang/Object;

    const/4 v4, 0x3

    iput v4, v0, Lcom/rajat/pdfviewer/PdfDownloader$checkAndDownload$1;->label:I

    invoke-direct {v3, v6, v5, p1, v0}, Lcom/rajat/pdfviewer/PdfDownloader;->retryDownload(Ljava/lang/String;Ljava/io/File;Ljava/io/File;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    .end local v3    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    .end local v5    # "cacheDir":Ljava/io/File;
    .end local v6    # "downloadUrl":Ljava/lang/String;
    .end local p1    # "pdfFile":Ljava/io/File;
    if-ne p1, v2, :cond_2

    .line 71
    return-object v2

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private final completeSuccessfulDownload(Ljava/io/File;Ljava/io/File;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 3
    .param p1, "cacheDir"    # Ljava/io/File;
    .param p2, "pdfFile"    # Ljava/io/File;
    .param p3, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Ljava/io/File;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 135
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfDownloader;->cachePolicy:Lcom/rajat/pdfviewer/util/CachePolicy;

    invoke-virtual {v0}, Lcom/rajat/pdfviewer/util/CachePolicy;->getPersistRemoteFile()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 136
    sget-object v0, Lcom/rajat/pdfviewer/util/CacheHelper;->INSTANCE:Lcom/rajat/pdfviewer/util/CacheHelper;

    const-string v1, "PdfDownloader"

    iget-object v2, p0, Lcom/rajat/pdfviewer/PdfDownloader;->cachePolicy:Lcom/rajat/pdfviewer/util/CachePolicy;

    invoke-virtual {v0, v1, p1, v2}, Lcom/rajat/pdfviewer/util/CacheHelper;->applyDocumentRetention$pdfViewer_release(Ljava/lang/String;Ljava/io/File;Lcom/rajat/pdfviewer/util/CachePolicy;)V

    .line 138
    :cond_0
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getMain()Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object v0

    check-cast v0, Lkotlin/coroutines/CoroutineContext;

    new-instance v1, Lcom/rajat/pdfviewer/PdfDownloader$completeSuccessfulDownload$2;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p2, v2}, Lcom/rajat/pdfviewer/PdfDownloader$completeSuccessfulDownload$2;-><init>(Lcom/rajat/pdfviewer/PdfDownloader;Ljava/io/File;Lkotlin/coroutines/Continuation;)V

    check-cast v1, Lkotlin/jvm/functions/Function2;

    invoke-static {v0, v1, p3}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_1

    return-object v0

    :cond_1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 141
    return-object v0
.end method

.method private final downloadFile(Ljava/lang/String;Ljava/io/File;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 3
    .param p1, "downloadUrl"    # Ljava/lang/String;
    .param p2, "pdfFile"    # Ljava/io/File;
    .param p3, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/io/File;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 150
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v0

    check-cast v0, Lkotlin/coroutines/CoroutineContext;

    new-instance v1, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;

    const/4 v2, 0x0

    invoke-direct {v1, p2, p0, p1, v2}, Lcom/rajat/pdfviewer/PdfDownloader$downloadFile$2;-><init>(Ljava/io/File;Lcom/rajat/pdfviewer/PdfDownloader;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    check-cast v1, Lkotlin/jvm/functions/Function2;

    invoke-static {v0, v1, p3}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    .line 187
    return-object v0
.end method

.method private final isInvalidFileError(Ljava/io/IOException;)Z
    .locals 5
    .param p1, "error"    # Ljava/io/IOException;

    .line 144
    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 145
    .local v0, "message":Ljava/lang/String;
    :cond_0
    move-object v2, v0

    check-cast v2, Ljava/lang/CharSequence;

    const-string v3, "Invalid content type"

    check-cast v3, Ljava/lang/CharSequence;

    const/4 v4, 0x1

    invoke-static {v2, v3, v4}, Lkotlin/text/StringsKt;->contains(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v2

    if-nez v2, :cond_1

    .line 146
    move-object v2, v0

    check-cast v2, Ljava/lang/CharSequence;

    const-string v3, "Downloaded file is not a valid PDF"

    check-cast v3, Ljava/lang/CharSequence;

    invoke-static {v2, v3, v4}, Lkotlin/text/StringsKt;->contains(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_1
    move v1, v4

    .line 145
    :cond_2
    return v1
.end method

.method private final makeNetworkRequest(Ljava/lang/String;)Lokhttp3/Response;
    .locals 8
    .param p1, "downloadUrl"    # Ljava/lang/String;

    .line 190
    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v0, p1}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    .line 191
    .local v0, "requestBuilder":Lokhttp3/Request$Builder;
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfDownloader;->headers:Lcom/rajat/pdfviewer/HeaderData;

    invoke-virtual {v1}, Lcom/rajat/pdfviewer/HeaderData;->getHeaders()Ljava/util/Map;

    move-result-object v1

    .local v1, "$this$forEach$iv":Ljava/util/Map;
    const/4 v2, 0x0

    .line 217
    .local v2, "$i$f$forEach":I
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .local v4, "element$iv":Ljava/util/Map$Entry;
    const/4 v5, 0x0

    .local v5, "$i$a$-forEach-PdfDownloader$makeNetworkRequest$1":I
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .local v6, "key":Ljava/lang/String;
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 191
    .local v7, "value":Ljava/lang/String;
    invoke-virtual {v0, v6, v7}, Lokhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    .line 217
    .end local v5    # "$i$a$-forEach-PdfDownloader$makeNetworkRequest$1":I
    .end local v6    # "key":Ljava/lang/String;
    .end local v7    # "value":Ljava/lang/String;
    nop

    .end local v4    # "element$iv":Ljava/util/Map$Entry;
    goto :goto_0

    .line 218
    :cond_0
    nop

    .line 193
    .end local v1    # "$this$forEach$iv":Ljava/util/Map;
    .end local v2    # "$i$f$forEach":I
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfDownloader;->httpClient:Lokhttp3/OkHttpClient;

    invoke-virtual {v0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v2

    invoke-virtual {v1, v2}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v1

    invoke-interface {v1}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v1

    return-object v1
.end method

.method private final prepareDownloadDirectory(Ljava/io/File;)V
    .locals 1
    .param p1, "cacheDir"    # Ljava/io/File;

    .line 88
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfDownloader;->cachePolicy:Lcom/rajat/pdfviewer/util/CachePolicy;

    invoke-virtual {v0}, Lcom/rajat/pdfviewer/util/CachePolicy;->getPersistRemoteFile()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 91
    invoke-static {p1}, Lkotlin/io/FilesKt;->deleteRecursively(Ljava/io/File;)Z

    .line 93
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    .line 94
    return-void
.end method

.method private final retryDownload(Ljava/lang/String;Ljava/io/File;Ljava/io/File;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 17
    .param p4, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/io/File;",
            "Ljava/io/File;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    move-object/from16 v1, p4

    instance-of v0, v1, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;

    if-eqz v0, :cond_0

    move-object v0, v1

    check-cast v0, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;

    iget v2, v0, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->label:I

    const/high16 v3, -0x80000000

    and-int/2addr v2, v3

    if-eqz v2, :cond_0

    iget v2, v0, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->label:I

    sub-int/2addr v2, v3

    iput v2, v0, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->label:I

    move-object/from16 v2, p0

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;

    move-object/from16 v2, p0

    invoke-direct {v0, v2, v1}, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;-><init>(Lcom/rajat/pdfviewer/PdfDownloader;Lkotlin/coroutines/Continuation;)V

    :goto_0
    move-object v3, v0

    .local v3, "$continuation":Lkotlin/coroutines/Continuation;
    iget-object v4, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->result:Ljava/lang/Object;

    .local v4, "$result":Ljava/lang/Object;
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v5

    .line 96
    iget v0, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->label:I

    const-string v6, "PdfDownloader"

    const/4 v7, 0x2

    const/4 v8, 0x0

    packed-switch v0, :pswitch_data_0

    .end local v3    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local v4    # "$result":Ljava/lang/Object;
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v3, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .restart local v3    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v4    # "$result":Ljava/lang/Object;
    :pswitch_0
    move-object/from16 v0, p0

    .local v0, "this":Lcom/rajat/pdfviewer/PdfDownloader;
    iget v9, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->I$0:I

    .local v9, "attempt":I
    iget-object v10, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$2:Ljava/lang/Object;

    check-cast v10, Ljava/io/File;

    .local v10, "pdfFile":Ljava/io/File;
    iget-object v11, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$1:Ljava/lang/Object;

    check-cast v11, Ljava/io/File;

    .local v11, "cacheDir":Ljava/io/File;
    iget-object v12, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$0:Ljava/lang/Object;

    check-cast v12, Ljava/lang/String;

    .local v12, "downloadUrl":Ljava/lang/String;
    invoke-static {v4}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v13, v12

    move v12, v9

    move-object v9, v5

    move-object v5, v4

    move-object v4, v3

    move-object v3, v0

    goto/16 :goto_8

    .end local v0    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    .end local v9    # "attempt":I
    .end local v10    # "pdfFile":Ljava/io/File;
    .end local v11    # "cacheDir":Ljava/io/File;
    .end local v12    # "downloadUrl":Ljava/lang/String;
    :pswitch_1
    move-object/from16 v0, p0

    .restart local v0    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    iget v9, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->I$0:I

    .restart local v9    # "attempt":I
    iget-object v10, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$2:Ljava/lang/Object;

    check-cast v10, Ljava/io/File;

    .restart local v10    # "pdfFile":Ljava/io/File;
    iget-object v11, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$1:Ljava/lang/Object;

    check-cast v11, Ljava/io/File;

    .restart local v11    # "cacheDir":Ljava/io/File;
    iget-object v12, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$0:Ljava/lang/Object;

    check-cast v12, Ljava/lang/String;

    .restart local v12    # "downloadUrl":Ljava/lang/String;
    invoke-static {v4}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v13, v12

    move v12, v9

    move-object v9, v5

    move-object v5, v4

    move-object v4, v3

    move-object v3, v0

    goto/16 :goto_7

    .end local v0    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    .end local v9    # "attempt":I
    .end local v10    # "pdfFile":Ljava/io/File;
    .end local v11    # "cacheDir":Ljava/io/File;
    .end local v12    # "downloadUrl":Ljava/lang/String;
    :pswitch_2
    invoke-static {v4}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto/16 :goto_6

    :pswitch_3
    move-object/from16 v9, p0

    .local v9, "this":Lcom/rajat/pdfviewer/PdfDownloader;
    iget v10, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->I$0:I

    .local v10, "attempt":I
    iget-object v0, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$2:Ljava/lang/Object;

    move-object v11, v0

    check-cast v11, Ljava/io/File;

    .local v11, "pdfFile":Ljava/io/File;
    iget-object v0, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$1:Ljava/lang/Object;

    move-object v12, v0

    check-cast v12, Ljava/io/File;

    .local v12, "cacheDir":Ljava/io/File;
    iget-object v0, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$0:Ljava/lang/Object;

    move-object v13, v0

    check-cast v13, Ljava/lang/String;

    .local v13, "downloadUrl":Ljava/lang/String;
    :try_start_0
    invoke-static {v4}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_4

    .end local v9    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    .end local v10    # "attempt":I
    .end local v11    # "pdfFile":Ljava/io/File;
    .end local v12    # "cacheDir":Ljava/io/File;
    .end local v13    # "downloadUrl":Ljava/lang/String;
    :pswitch_4
    move-object/from16 v9, p0

    .restart local v9    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    iget v10, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->I$0:I

    .restart local v10    # "attempt":I
    iget-object v0, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$2:Ljava/lang/Object;

    move-object v11, v0

    check-cast v11, Ljava/io/File;

    .restart local v11    # "pdfFile":Ljava/io/File;
    iget-object v0, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$1:Ljava/lang/Object;

    move-object v12, v0

    check-cast v12, Ljava/io/File;

    .restart local v12    # "cacheDir":Ljava/io/File;
    iget-object v0, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$0:Ljava/lang/Object;

    move-object v13, v0

    check-cast v13, Ljava/lang/String;

    .restart local v13    # "downloadUrl":Ljava/lang/String;
    :try_start_1
    invoke-static {v4}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_3

    .line 107
    :catch_0
    move-exception v0

    goto/16 :goto_5

    .line 96
    .end local v9    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    .end local v10    # "attempt":I
    .end local v11    # "pdfFile":Ljava/io/File;
    .end local v12    # "cacheDir":Ljava/io/File;
    .end local v13    # "downloadUrl":Ljava/lang/String;
    :pswitch_5
    move-object/from16 v0, p0

    .restart local v0    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    iget-object v9, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$2:Ljava/lang/Object;

    check-cast v9, Ljava/io/File;

    .local v9, "pdfFile":Ljava/io/File;
    iget-object v10, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$1:Ljava/lang/Object;

    check-cast v10, Ljava/io/File;

    .local v10, "cacheDir":Ljava/io/File;
    iget-object v11, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$0:Ljava/lang/Object;

    check-cast v11, Ljava/lang/String;

    .local v11, "downloadUrl":Ljava/lang/String;
    invoke-static {v4}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto :goto_1

    .end local v0    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    .end local v9    # "pdfFile":Ljava/io/File;
    .end local v10    # "cacheDir":Ljava/io/File;
    .end local v11    # "downloadUrl":Ljava/lang/String;
    :pswitch_6
    invoke-static {v4}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object/from16 v0, p0

    .restart local v0    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    move-object/from16 v10, p2

    .restart local v10    # "cacheDir":Ljava/io/File;
    move-object/from16 v11, p1

    .restart local v11    # "downloadUrl":Ljava/lang/String;
    move-object/from16 v9, p3

    .line 97
    .restart local v9    # "pdfFile":Ljava/io/File;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Retrying download for: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v6, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getMain()Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object v12

    check-cast v12, Lkotlin/coroutines/CoroutineContext;

    new-instance v13, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$2;

    invoke-direct {v13, v0, v8}, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$2;-><init>(Lcom/rajat/pdfviewer/PdfDownloader;Lkotlin/coroutines/Continuation;)V

    check-cast v13, Lkotlin/jvm/functions/Function2;

    iput-object v11, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$0:Ljava/lang/Object;

    iput-object v10, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$1:Ljava/lang/Object;

    iput-object v9, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$2:Ljava/lang/Object;

    const/4 v14, 0x1

    iput v14, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->label:I

    invoke-static {v12, v13, v3}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v12

    if-ne v12, v5, :cond_1

    .line 96
    .end local v0    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    return-object v5

    .line 101
    .restart local v0    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    :cond_1
    :goto_1
    const/4 v12, 0x0

    move-object v13, v11

    move-object v11, v10

    move-object v10, v9

    move-object v9, v5

    move-object v5, v4

    move-object v4, v3

    move-object v3, v0

    .line 102
    .end local v0    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    .end local v9    # "pdfFile":Ljava/io/File;
    .end local p4    # "$completion":Lkotlin/coroutines/Continuation;
    .local v1, "$completion":Lkotlin/coroutines/Continuation;
    .local v3, "this":Lcom/rajat/pdfviewer/PdfDownloader;
    .local v4, "$continuation":Lkotlin/coroutines/Continuation;
    .local v5, "$result":Ljava/lang/Object;
    .local v10, "pdfFile":Ljava/io/File;
    .local v11, "cacheDir":Ljava/io/File;
    .local v12, "attempt":I
    .restart local v13    # "downloadUrl":Ljava/lang/String;
    :goto_2
    if-ge v12, v7, :cond_9

    .line 103
    nop

    .line 104
    :try_start_2
    iput-object v13, v4, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$0:Ljava/lang/Object;

    iput-object v11, v4, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$1:Ljava/lang/Object;

    iput-object v10, v4, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$2:Ljava/lang/Object;

    iput v12, v4, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->I$0:I

    iput v7, v4, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->label:I

    invoke-direct {v3, v13, v10, v4}, Lcom/rajat/pdfviewer/PdfDownloader;->downloadFile(Ljava/lang/String;Ljava/io/File;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    if-ne v0, v9, :cond_2

    .line 96
    .end local v3    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    return-object v9

    .line 104
    .restart local v3    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    :cond_2
    move-object/from16 v16, v9

    move-object v9, v3

    move-object v3, v4

    move-object v4, v5

    move-object/from16 v5, v16

    move-object/from16 v16, v11

    move-object v11, v10

    move v10, v12

    move-object/from16 v12, v16

    .line 105
    .end local v5    # "$result":Ljava/lang/Object;
    .local v3, "$continuation":Lkotlin/coroutines/Continuation;
    .local v4, "$result":Ljava/lang/Object;
    .local v9, "this":Lcom/rajat/pdfviewer/PdfDownloader;
    .local v10, "attempt":I
    .local v11, "pdfFile":Ljava/io/File;
    .local v12, "cacheDir":Ljava/io/File;
    :goto_3
    :try_start_3
    iput-object v13, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$0:Ljava/lang/Object;

    iput-object v12, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$1:Ljava/lang/Object;

    iput-object v11, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$2:Ljava/lang/Object;

    iput v10, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->I$0:I

    const/4 v0, 0x3

    iput v0, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->label:I

    invoke-direct {v9, v12, v11, v3}, Lcom/rajat/pdfviewer/PdfDownloader;->completeSuccessfulDownload(Ljava/io/File;Ljava/io/File;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v5, :cond_3

    .line 96
    .end local v9    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    return-object v5

    .line 106
    .restart local v9    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    :cond_3
    :goto_4
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    return-object v0

    .line 107
    :catch_1
    move-exception v0

    goto :goto_5

    .end local v9    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    .local v3, "this":Lcom/rajat/pdfviewer/PdfDownloader;
    .local v4, "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v5    # "$result":Ljava/lang/Object;
    .local v10, "pdfFile":Ljava/io/File;
    .local v11, "cacheDir":Ljava/io/File;
    .local v12, "attempt":I
    :catch_2
    move-exception v0

    move-object/from16 v16, v9

    move-object v9, v3

    move-object v3, v4

    move-object v4, v5

    move-object/from16 v5, v16

    move-object/from16 v16, v11

    move-object v11, v10

    move v10, v12

    move-object/from16 v12, v16

    .line 108
    .end local v5    # "$result":Ljava/lang/Object;
    .local v0, "e":Ljava/io/IOException;
    .local v3, "$continuation":Lkotlin/coroutines/Continuation;
    .local v4, "$result":Ljava/lang/Object;
    .restart local v9    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    .local v10, "attempt":I
    .local v11, "pdfFile":Ljava/io/File;
    .local v12, "cacheDir":Ljava/io/File;
    :goto_5
    invoke-direct {v9, v0}, Lcom/rajat/pdfviewer/PdfDownloader;->isInvalidFileError(Ljava/io/IOException;)Z

    move-result v14

    if-eqz v14, :cond_5

    .line 109
    .end local v10    # "attempt":I
    .end local v11    # "pdfFile":Ljava/io/File;
    .end local v12    # "cacheDir":Ljava/io/File;
    .end local v13    # "downloadUrl":Ljava/lang/String;
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getMain()Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object v6

    check-cast v6, Lkotlin/coroutines/CoroutineContext;

    new-instance v7, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$3;

    invoke-direct {v7, v9, v0, v8}, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$3;-><init>(Lcom/rajat/pdfviewer/PdfDownloader;Ljava/io/IOException;Lkotlin/coroutines/Continuation;)V

    check-cast v7, Lkotlin/jvm/functions/Function2;

    iput-object v8, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$0:Ljava/lang/Object;

    iput-object v8, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$1:Ljava/lang/Object;

    iput-object v8, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$2:Ljava/lang/Object;

    const/4 v8, 0x4

    iput v8, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->label:I

    invoke-static {v6, v7, v3}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "e":Ljava/io/IOException;
    .end local v9    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    if-ne v0, v5, :cond_4

    .line 96
    return-object v5

    .line 112
    :cond_4
    :goto_6
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    .line 115
    .restart local v0    # "e":Ljava/io/IOException;
    .restart local v9    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    .restart local v10    # "attempt":I
    .restart local v11    # "pdfFile":Ljava/io/File;
    .restart local v12    # "cacheDir":Ljava/io/File;
    .restart local v13    # "downloadUrl":Ljava/lang/String;
    :cond_5
    add-int/lit8 v10, v10, 0x1

    .line 116
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Attempt "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " failed: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    move-object v15, v0

    check-cast v15, Ljava/lang/Throwable;

    invoke-static {v6, v14, v15}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 118
    if-ge v10, v7, :cond_7

    .line 119
    .end local v0    # "e":Ljava/io/IOException;
    iput-object v13, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$0:Ljava/lang/Object;

    iput-object v12, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$1:Ljava/lang/Object;

    iput-object v11, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$2:Ljava/lang/Object;

    iput v10, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->I$0:I

    const/4 v0, 0x5

    iput v0, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->label:I

    const-wide/16 v14, 0x7d0

    invoke-static {v14, v15, v3}, Lkotlinx/coroutines/DelayKt;->delay(JLkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v5, :cond_6

    .line 96
    .end local v9    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    return-object v5

    .line 119
    .restart local v9    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    :cond_6
    move-object/from16 v16, v4

    move-object v4, v3

    move-object v3, v9

    move-object v9, v5

    move-object/from16 v5, v16

    move-object/from16 v16, v12

    move v12, v10

    move-object v10, v11

    move-object/from16 v11, v16

    .end local v9    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    .local v3, "this":Lcom/rajat/pdfviewer/PdfDownloader;
    .local v4, "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v5    # "$result":Ljava/lang/Object;
    .local v10, "pdfFile":Ljava/io/File;
    .local v11, "cacheDir":Ljava/io/File;
    .local v12, "attempt":I
    :goto_7
    goto/16 :goto_2

    .line 121
    .end local v5    # "$result":Ljava/lang/Object;
    .restart local v0    # "e":Ljava/io/IOException;
    .local v3, "$continuation":Lkotlin/coroutines/Continuation;
    .local v4, "$result":Ljava/lang/Object;
    .restart local v9    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    .local v10, "attempt":I
    .local v11, "pdfFile":Ljava/io/File;
    .local v12, "cacheDir":Ljava/io/File;
    :cond_7
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getMain()Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object v14

    check-cast v14, Lkotlin/coroutines/CoroutineContext;

    new-instance v15, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$4;

    invoke-direct {v15, v9, v0, v8}, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$4;-><init>(Lcom/rajat/pdfviewer/PdfDownloader;Ljava/io/IOException;Lkotlin/coroutines/Continuation;)V

    check-cast v15, Lkotlin/jvm/functions/Function2;

    iput-object v13, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$0:Ljava/lang/Object;

    iput-object v12, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$1:Ljava/lang/Object;

    iput-object v11, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->L$2:Ljava/lang/Object;

    iput v10, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->I$0:I

    const/4 v7, 0x6

    iput v7, v3, Lcom/rajat/pdfviewer/PdfDownloader$retryDownload$1;->label:I

    invoke-static {v14, v15, v3}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "e":Ljava/io/IOException;
    if-ne v0, v5, :cond_8

    .line 96
    .end local v9    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    return-object v5

    .line 121
    .restart local v9    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    :cond_8
    move-object/from16 v16, v4

    move-object v4, v3

    move-object v3, v9

    move-object v9, v5

    move-object/from16 v5, v16

    move-object/from16 v16, v12

    move v12, v10

    move-object v10, v11

    move-object/from16 v11, v16

    .end local v9    # "this":Lcom/rajat/pdfviewer/PdfDownloader;
    .local v3, "this":Lcom/rajat/pdfviewer/PdfDownloader;
    .local v4, "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v5    # "$result":Ljava/lang/Object;
    .local v10, "pdfFile":Ljava/io/File;
    .local v11, "cacheDir":Ljava/io/File;
    .local v12, "attempt":I
    :goto_8
    const/4 v7, 0x2

    goto/16 :goto_2

    .line 132
    :cond_9
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private final validateResponse(Lokhttp3/Response;)V
    .locals 4
    .param p1, "response"    # Lokhttp3/Response;

    .line 197
    invoke-virtual {p1}, Lokhttp3/Response;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 201
    const-string v0, "Content-Type"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Lokhttp3/Response;->header(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 202
    .local v0, "contentType":Ljava/lang/String;
    move-object v1, v0

    check-cast v1, Ljava/lang/CharSequence;

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    move v1, v2

    :goto_1
    if-nez v1, :cond_3

    move-object v1, v0

    check-cast v1, Ljava/lang/CharSequence;

    .line 203
    const-string v3, "application/pdf"

    check-cast v3, Ljava/lang/CharSequence;

    .line 204
    nop

    .line 202
    invoke-static {v1, v3, v2}, Lkotlin/text/StringsKt;->contains(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_2

    .line 207
    :cond_2
    new-instance v1, Lcom/rajat/pdfviewer/InvalidPdfException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid content type received: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ". Expected a PDF file."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/rajat/pdfviewer/InvalidPdfException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 209
    :cond_3
    :goto_2
    return-void

    .line 198
    .end local v0    # "contentType":Ljava/lang/String;
    :cond_4
    new-instance v0, Lcom/rajat/pdfviewer/DownloadFailedException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to download PDF, HTTP Status: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lokhttp3/Response;->code()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2, v3}, Lcom/rajat/pdfviewer/DownloadFailedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    throw v0
.end method


# virtual methods
.method public final start()V
    .locals 6

    .line 45
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfDownloader;->coroutineScope:Lkotlinx/coroutines/CoroutineScope;

    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v1

    check-cast v1, Lkotlin/coroutines/CoroutineContext;

    new-instance v2, Lcom/rajat/pdfviewer/PdfDownloader$start$1;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/rajat/pdfviewer/PdfDownloader$start$1;-><init>(Lcom/rajat/pdfviewer/PdfDownloader;Lkotlin/coroutines/Continuation;)V

    move-object v3, v2

    check-cast v3, Lkotlin/jvm/functions/Function2;

    const/4 v4, 0x2

    const/4 v5, 0x0

    const/4 v2, 0x0

    invoke-static/range {v0 .. v5}, Lkotlinx/coroutines/BuildersKt;->launch$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    .line 57
    return-void
.end method
