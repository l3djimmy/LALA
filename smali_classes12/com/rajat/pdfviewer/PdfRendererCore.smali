.class public final Lcom/rajat/pdfviewer/PdfRendererCore;
.super Ljava/lang/Object;
.source "PdfRendererCore.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rajat/pdfviewer/PdfRendererCore$Companion;,
        Lcom/rajat/pdfviewer/PdfRendererCore$RenderDecision;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPdfRendererCore.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PdfRendererCore.kt\ncom/rajat/pdfviewer/PdfRendererCore\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 3 CancellableContinuation.kt\nkotlinx/coroutines/CancellableContinuationKt\n+ 4 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,393:1\n1#2:394\n426#3,11:395\n774#4:406\n865#4,2:407\n774#4:409\n865#4,2:410\n1056#4:412\n1869#4,2:413\n*S KotlinDebug\n*F\n+ 1 PdfRendererCore.kt\ncom/rajat/pdfviewer/PdfRendererCore\n*L\n266#1:395,11\n305#1:406\n305#1:407,2\n306#1:409\n306#1:410,2\n307#1:412\n309#1:413,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u008c\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010%\n\u0002\u0018\u0002\n\u0002\u0008\u000c\n\u0002\u0018\u0002\n\u0002\u0008\u0019\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0008\u0007\u0018\u0000 W2\u00020\u0001:\u0002WXB!\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0006\u0010&\u001a\u00020\u0013J\u0018\u0010\'\u001a\u0004\u0018\u00010 2\u0006\u0010(\u001a\u00020\u0013H\u0086@\u00a2\u0006\u0002\u0010)J\u001e\u0010*\u001a\u00020!2\u0006\u0010(\u001a\u00020\u00132\u0006\u0010+\u001a\u00020 H\u0082@\u00a2\u0006\u0002\u0010,J\u0016\u0010-\u001a\u00020\u000b2\u0006\u0010(\u001a\u00020\u0013H\u0082@\u00a2\u0006\u0002\u0010)J\u0006\u0010.\u001a\u00020\u000bJi\u0010/\u001a\u00020!2\u0006\u0010(\u001a\u00020\u00132\u0006\u0010+\u001a\u00020 2Q\u0008\u0002\u00100\u001aK\u0012\u0013\u0012\u00110\u000b\u00a2\u0006\u000c\u00081\u0012\u0008\u00082\u0012\u0004\u0008\u0008(3\u0012\u0013\u0012\u00110\u0013\u00a2\u0006\u000c\u00081\u0012\u0008\u00082\u0012\u0004\u0008\u0008((\u0012\u0015\u0012\u0013\u0018\u00010 \u00a2\u0006\u000c\u00081\u0012\u0008\u00082\u0012\u0004\u0008\u0008(+\u0012\u0004\u0012\u00020!\u0018\u00010\u001fJk\u00104\u001a\u00020!2\u0006\u0010(\u001a\u00020\u00132\u0006\u0010+\u001a\u00020 2Q\u0008\u0002\u00100\u001aK\u0012\u0013\u0012\u00110\u000b\u00a2\u0006\u000c\u00081\u0012\u0008\u00082\u0012\u0004\u0008\u0008(3\u0012\u0013\u0012\u00110\u0013\u00a2\u0006\u000c\u00081\u0012\u0008\u00082\u0012\u0004\u0008\u0008((\u0012\u0015\u0012\u0013\u0018\u00010 \u00a2\u0006\u000c\u00081\u0012\u0008\u00082\u0012\u0004\u0008\u0008(+\u0012\u0004\u0012\u00020!\u0018\u00010\u001fH\u0002Js\u00105\u001a\u00020!2\u0006\u0010(\u001a\u00020\u00132\u0006\u0010+\u001a\u00020 2\u0006\u00106\u001a\u00020\u000b2Q\u0008\u0002\u00100\u001aK\u0012\u0013\u0012\u00110\u000b\u00a2\u0006\u000c\u00081\u0012\u0008\u00082\u0012\u0004\u0008\u0008(3\u0012\u0013\u0012\u00110\u0013\u00a2\u0006\u000c\u00081\u0012\u0008\u00082\u0012\u0004\u0008\u0008((\u0012\u0015\u0012\u0013\u0018\u00010 \u00a2\u0006\u000c\u00081\u0012\u0008\u00082\u0012\u0004\u0008\u0008(+\u0012\u0004\u0012\u00020!\u0018\u00010\u001fH\u0002Ja\u00107\u001a\u00020!2\u0006\u0010(\u001a\u00020\u00132O\u00100\u001aK\u0012\u0013\u0012\u00110\u000b\u00a2\u0006\u000c\u00081\u0012\u0008\u00082\u0012\u0004\u0008\u0008(3\u0012\u0013\u0012\u00110\u0013\u00a2\u0006\u000c\u00081\u0012\u0008\u00082\u0012\u0004\u0008\u0008((\u0012\u0015\u0012\u0013\u0018\u00010 \u00a2\u0006\u000c\u00081\u0012\u0008\u00082\u0012\u0004\u0008\u0008(+\u0012\u0004\u0012\u00020!\u0018\u00010\u001fH\u0002Ja\u00108\u001a\u00020!2\u0006\u0010(\u001a\u00020\u00132O\u00100\u001aK\u0012\u0013\u0012\u00110\u000b\u00a2\u0006\u000c\u00081\u0012\u0008\u00082\u0012\u0004\u0008\u0008(3\u0012\u0013\u0012\u00110\u0013\u00a2\u0006\u000c\u00081\u0012\u0008\u00082\u0012\u0004\u0008\u0008((\u0012\u0015\u0012\u0013\u0018\u00010 \u00a2\u0006\u000c\u00081\u0012\u0008\u00082\u0012\u0004\u0008\u0008(+\u0012\u0004\u0012\u00020!\u0018\u00010\u001fH\u0002J\u001a\u00109\u001a\u00020!2\u0006\u0010(\u001a\u00020\u00132\u0008\u0010:\u001a\u0004\u0018\u00010\u001cH\u0002J(\u0010;\u001a\u00020!2\u0006\u0010(\u001a\u00020\u00132\u0006\u00103\u001a\u00020\u000b2\u0008\u0010+\u001a\u0004\u0018\u00010 H\u0082@\u00a2\u0006\u0002\u0010<J(\u0010=\u001a\u0004\u0018\u00010 2\u0006\u0010(\u001a\u00020\u00132\u0006\u0010>\u001a\u00020\u00132\u0006\u0010?\u001a\u00020\u0013H\u0086@\u00a2\u0006\u0002\u0010@J\u0006\u0010A\u001a\u00020!J&\u0010B\u001a\u00020!2\u0006\u0010C\u001a\u00020\u00132\u0006\u0010>\u001a\u00020\u00132\u0006\u0010?\u001a\u00020\u00132\u0006\u0010D\u001a\u00020\u0013J.\u0010E\u001a\u00020!2\u0006\u0010C\u001a\u00020\u00132\u0006\u0010F\u001a\u00020\u00132\u0006\u0010G\u001a\u00020\u00132\u0006\u0010D\u001a\u00020\u0013H\u0082@\u00a2\u0006\u0002\u0010HJ\"\u0010I\u001a\u00020!2\u0006\u0010(\u001a\u00020\u00132\u0012\u0010J\u001a\u000e\u0012\u0004\u0012\u00020$\u0012\u0004\u0012\u00020!0KJ\u0006\u0010L\u001a\u00020\u0015J\u0014\u0010M\u001a\u0010\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u0015\u0018\u00010NJ6\u0010O\u001a\u0004\u0018\u0001HP\"\u0004\u0008\u0000\u0010P2\u0006\u0010(\u001a\u00020\u00132\u0016\u0010Q\u001a\u0012\u0012\u0008\u0012\u00060RR\u00020\u0007\u0012\u0004\u0012\u0002HP0KH\u0082@\u00a2\u0006\u0002\u0010SJ\u000e\u0010T\u001a\u00020!2\u0006\u0010(\u001a\u00020\u0013J\u0006\u0010U\u001a\u00020!J\u0006\u0010V\u001a\u00020!R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\rX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u000fX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0011X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0013X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0015X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0015X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0017\u001a\u0004\u0018\u00010\u0013X\u0082\u000e\u00a2\u0006\u0004\n\u0002\u0010\u0018R\u000e\u0010\u0019\u001a\u00020\u0001X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u001a\u001a\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u001c0\u001bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R:\u0010\u001d\u001a.\u0012\u0004\u0012\u00020\u0013\u0012$\u0012\"\u0012\u001e\u0012\u001c\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\u0013\u0012\u0006\u0012\u0004\u0018\u00010 \u0012\u0004\u0012\u00020!0\u001f0\u001e0\u001bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\"\u001a\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020$0#X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010%\u001a\u0004\u0018\u00010\u001cX\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006Y"
    }
    d2 = {
        "Lcom/rajat/pdfviewer/PdfRendererCore;",
        "",
        "fileDescriptor",
        "Landroid/os/ParcelFileDescriptor;",
        "cacheManager",
        "Lcom/rajat/pdfviewer/util/CacheManager;",
        "pdfRenderer",
        "Landroid/graphics/pdf/PdfRenderer;",
        "<init>",
        "(Landroid/os/ParcelFileDescriptor;Lcom/rajat/pdfviewer/util/CacheManager;Landroid/graphics/pdf/PdfRenderer;)V",
        "isRendererOpen",
        "",
        "scope",
        "Lkotlinx/coroutines/CoroutineScope;",
        "renderLock",
        "Lkotlinx/coroutines/sync/Mutex;",
        "pageCount",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "totalPagesRendered",
        "",
        "totalRenderTime",
        "",
        "slowestRenderTime",
        "slowestPage",
        "Ljava/lang/Integer;",
        "renderStateLock",
        "renderJobs",
        "Ljava/util/concurrent/ConcurrentHashMap;",
        "Lkotlinx/coroutines/Job;",
        "renderCallbacks",
        "Ljava/util/concurrent/CopyOnWriteArrayList;",
        "Lkotlin/Function3;",
        "Landroid/graphics/Bitmap;",
        "",
        "pageDimensionCache",
        "",
        "Landroid/util/Size;",
        "prefetchJob",
        "getPageCount",
        "getBitmapFromCache",
        "pageNo",
        "(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "addBitmapToMemoryCache",
        "bitmap",
        "(ILandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "pageExistInCache",
        "shouldPrefetch",
        "renderPage",
        "onBitmapReady",
        "Lkotlin/ParameterName;",
        "name",
        "success",
        "prefetchPageIfIdle",
        "renderPageInternal",
        "replaceActive",
        "enqueueRenderCallback",
        "enqueueRenderCallbackLocked",
        "clearRenderJob",
        "completedJob",
        "deliverRenderCallbacks",
        "(IZLandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "renderPageAsync",
        "width",
        "height",
        "(IIILkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "preloadPageDimensions",
        "schedulePrefetch",
        "currentPage",
        "direction",
        "prefetchPagesAround",
        "fallbackWidth",
        "fallbackHeight",
        "(IIIILkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "getPageDimensionsAsync",
        "callback",
        "Lkotlin/Function1;",
        "averageRenderTime",
        "slowestPageInfo",
        "Lkotlin/Pair;",
        "withPdfPage",
        "T",
        "block",
        "Landroid/graphics/pdf/PdfRenderer$Page;",
        "(ILkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "cancelRender",
        "cancelPrefetch",
        "closePdfRender",
        "Companion",
        "RenderDecision",
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

.field public static final Companion:Lcom/rajat/pdfviewer/PdfRendererCore$Companion;

.field private static final LOG_TAG:Ljava/lang/String; = "PdfRendererCore"

.field private static final METRICS_TAG:Ljava/lang/String; = "PdfRendererCore_Metrics"

.field private static enableDebugMetrics:Z = false

.field public static final prefetchDistance:I = 0x2


# instance fields
.field private final cacheManager:Lcom/rajat/pdfviewer/util/CacheManager;

.field private final fileDescriptor:Landroid/os/ParcelFileDescriptor;

.field private isRendererOpen:Z

.field private final pageCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final pageDimensionCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation
.end field

.field private final pdfRenderer:Landroid/graphics/pdf/PdfRenderer;

.field private prefetchJob:Lkotlinx/coroutines/Job;

.field private final renderCallbacks:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/Integer;",
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Lkotlin/jvm/functions/Function3<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            "Landroid/graphics/Bitmap;",
            "Lkotlin/Unit;",
            ">;>;>;"
        }
    .end annotation
.end field

.field private final renderJobs:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/Integer;",
            "Lkotlinx/coroutines/Job;",
            ">;"
        }
    .end annotation
.end field

.field private final renderLock:Lkotlinx/coroutines/sync/Mutex;

.field private final renderStateLock:Ljava/lang/Object;

.field private final scope:Lkotlinx/coroutines/CoroutineScope;

.field private slowestPage:Ljava/lang/Integer;

.field private slowestRenderTime:J

.field private totalPagesRendered:I

.field private totalRenderTime:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/rajat/pdfviewer/PdfRendererCore$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/rajat/pdfviewer/PdfRendererCore$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/rajat/pdfviewer/PdfRendererCore;->Companion:Lcom/rajat/pdfviewer/PdfRendererCore$Companion;

    const/16 v0, 0x8

    sput v0, Lcom/rajat/pdfviewer/PdfRendererCore;->$stable:I

    .line 33
    const/4 v0, 0x1

    sput-boolean v0, Lcom/rajat/pdfviewer/PdfRendererCore;->enableDebugMetrics:Z

    return-void
.end method

.method private constructor <init>(Landroid/os/ParcelFileDescriptor;Lcom/rajat/pdfviewer/util/CacheManager;Landroid/graphics/pdf/PdfRenderer;)V
    .locals 4
    .param p1, "fileDescriptor"    # Landroid/os/ParcelFileDescriptor;
    .param p2, "cacheManager"    # Lcom/rajat/pdfviewer/util/CacheManager;
    .param p3, "pdfRenderer"    # Landroid/graphics/pdf/PdfRenderer;

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->fileDescriptor:Landroid/os/ParcelFileDescriptor;

    .line 29
    iput-object p2, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->cacheManager:Lcom/rajat/pdfviewer/util/CacheManager;

    .line 30
    iput-object p3, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->pdfRenderer:Landroid/graphics/pdf/PdfRenderer;

    .line 93
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->isRendererOpen:Z

    .line 94
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v2, v0, v2}, Lkotlinx/coroutines/SupervisorKt;->SupervisorJob$default(Lkotlinx/coroutines/Job;ILjava/lang/Object;)Lkotlinx/coroutines/CompletableJob;

    move-result-object v3

    check-cast v3, Lkotlin/coroutines/CoroutineContext;

    invoke-virtual {v1, v3}, Lkotlinx/coroutines/CoroutineDispatcher;->plus(Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object v1

    invoke-static {v1}, Lkotlinx/coroutines/CoroutineScopeKt;->CoroutineScope(Lkotlin/coroutines/CoroutineContext;)Lkotlinx/coroutines/CoroutineScope;

    move-result-object v1

    iput-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->scope:Lkotlinx/coroutines/CoroutineScope;

    .line 95
    const/4 v1, 0x0

    invoke-static {v1, v0, v2}, Lkotlinx/coroutines/sync/MutexKt;->Mutex$default(ZILjava/lang/Object;)Lkotlinx/coroutines/sync/Mutex;

    move-result-object v0

    iput-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->renderLock:Lkotlinx/coroutines/sync/Mutex;

    .line 96
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->pdfRenderer:Landroid/graphics/pdf/PdfRenderer;

    invoke-virtual {v1}, Landroid/graphics/pdf/PdfRenderer;->getPageCount()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->pageCount:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 105
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->renderStateLock:Ljava/lang/Object;

    .line 106
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->renderJobs:Ljava/util/concurrent/ConcurrentHashMap;

    .line 107
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->renderCallbacks:Ljava/util/concurrent/ConcurrentHashMap;

    .line 108
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast v0, Ljava/util/Map;

    iput-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->pageDimensionCache:Ljava/util/Map;

    .line 27
    return-void
.end method

.method public synthetic constructor <init>(Landroid/os/ParcelFileDescriptor;Lcom/rajat/pdfviewer/util/CacheManager;Landroid/graphics/pdf/PdfRenderer;Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/rajat/pdfviewer/PdfRendererCore;-><init>(Landroid/os/ParcelFileDescriptor;Lcom/rajat/pdfviewer/util/CacheManager;Landroid/graphics/pdf/PdfRenderer;)V

    return-void
.end method

.method public static final synthetic access$addBitmapToMemoryCache(Lcom/rajat/pdfviewer/PdfRendererCore;ILandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfRendererCore;
    .param p1, "pageNo"    # I
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;
    .param p3, "$completion"    # Lkotlin/coroutines/Continuation;

    .line 27
    invoke-direct {p0, p1, p2, p3}, Lcom/rajat/pdfviewer/PdfRendererCore;->addBitmapToMemoryCache(ILandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$clearRenderJob(Lcom/rajat/pdfviewer/PdfRendererCore;ILkotlinx/coroutines/Job;)V
    .locals 0
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfRendererCore;
    .param p1, "pageNo"    # I
    .param p2, "completedJob"    # Lkotlinx/coroutines/Job;

    .line 27
    invoke-direct {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfRendererCore;->clearRenderJob(ILkotlinx/coroutines/Job;)V

    return-void
.end method

.method public static final synthetic access$deliverRenderCallbacks(Lcom/rajat/pdfviewer/PdfRendererCore;IZLandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfRendererCore;
    .param p1, "pageNo"    # I
    .param p2, "success"    # Z
    .param p3, "bitmap"    # Landroid/graphics/Bitmap;
    .param p4, "$completion"    # Lkotlin/coroutines/Continuation;

    .line 27
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/rajat/pdfviewer/PdfRendererCore;->deliverRenderCallbacks(IZLandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$enqueueRenderCallbackLocked(Lcom/rajat/pdfviewer/PdfRendererCore;ILkotlin/jvm/functions/Function3;)V
    .locals 0
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfRendererCore;
    .param p1, "pageNo"    # I
    .param p2, "onBitmapReady"    # Lkotlin/jvm/functions/Function3;

    .line 27
    invoke-direct {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfRendererCore;->enqueueRenderCallbackLocked(ILkotlin/jvm/functions/Function3;)V

    return-void
.end method

.method public static final synthetic access$getCacheManager$p(Lcom/rajat/pdfviewer/PdfRendererCore;)Lcom/rajat/pdfviewer/util/CacheManager;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfRendererCore;

    .line 27
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->cacheManager:Lcom/rajat/pdfviewer/util/CacheManager;

    return-object v0
.end method

.method public static final synthetic access$getEnableDebugMetrics$cp()Z
    .locals 1

    .line 27
    sget-boolean v0, Lcom/rajat/pdfviewer/PdfRendererCore;->enableDebugMetrics:Z

    return v0
.end method

.method public static final synthetic access$getFileDescriptor$p(Lcom/rajat/pdfviewer/PdfRendererCore;)Landroid/os/ParcelFileDescriptor;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfRendererCore;

    .line 27
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->fileDescriptor:Landroid/os/ParcelFileDescriptor;

    return-object v0
.end method

.method public static final synthetic access$getPageDimensionCache$p(Lcom/rajat/pdfviewer/PdfRendererCore;)Ljava/util/Map;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfRendererCore;

    .line 27
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->pageDimensionCache:Ljava/util/Map;

    return-object v0
.end method

.method public static final synthetic access$getPdfRenderer$p(Lcom/rajat/pdfviewer/PdfRendererCore;)Landroid/graphics/pdf/PdfRenderer;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfRendererCore;

    .line 27
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->pdfRenderer:Landroid/graphics/pdf/PdfRenderer;

    return-object v0
.end method

.method public static final synthetic access$getRenderJobs$p(Lcom/rajat/pdfviewer/PdfRendererCore;)Ljava/util/concurrent/ConcurrentHashMap;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfRendererCore;

    .line 27
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->renderJobs:Ljava/util/concurrent/ConcurrentHashMap;

    return-object v0
.end method

.method public static final synthetic access$getRenderLock$p(Lcom/rajat/pdfviewer/PdfRendererCore;)Lkotlinx/coroutines/sync/Mutex;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfRendererCore;

    .line 27
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->renderLock:Lkotlinx/coroutines/sync/Mutex;

    return-object v0
.end method

.method public static final synthetic access$getRenderStateLock$p(Lcom/rajat/pdfviewer/PdfRendererCore;)Ljava/lang/Object;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfRendererCore;

    .line 27
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->renderStateLock:Ljava/lang/Object;

    return-object v0
.end method

.method public static final synthetic access$isRendererOpen$p(Lcom/rajat/pdfviewer/PdfRendererCore;)Z
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfRendererCore;

    .line 27
    iget-boolean v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->isRendererOpen:Z

    return v0
.end method

.method public static final synthetic access$pageExistInCache(Lcom/rajat/pdfviewer/PdfRendererCore;ILkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfRendererCore;
    .param p1, "pageNo"    # I
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;

    .line 27
    invoke-direct {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfRendererCore;->pageExistInCache(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$prefetchPagesAround(Lcom/rajat/pdfviewer/PdfRendererCore;IIIILkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfRendererCore;
    .param p1, "currentPage"    # I
    .param p2, "fallbackWidth"    # I
    .param p3, "fallbackHeight"    # I
    .param p4, "direction"    # I
    .param p5, "$completion"    # Lkotlin/coroutines/Continuation;

    .line 27
    invoke-direct/range {p0 .. p5}, Lcom/rajat/pdfviewer/PdfRendererCore;->prefetchPagesAround(IIIILkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$setEnableDebugMetrics$cp(Z)V
    .locals 0
    .param p0, "<set-?>"    # Z

    .line 27
    sput-boolean p0, Lcom/rajat/pdfviewer/PdfRendererCore;->enableDebugMetrics:Z

    return-void
.end method

.method public static final synthetic access$setRendererOpen$p(Lcom/rajat/pdfviewer/PdfRendererCore;Z)V
    .locals 0
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfRendererCore;
    .param p1, "<set-?>"    # Z

    .line 27
    iput-boolean p1, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->isRendererOpen:Z

    return-void
.end method

.method public static final synthetic access$withPdfPage(Lcom/rajat/pdfviewer/PdfRendererCore;ILkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfRendererCore;
    .param p1, "pageNo"    # I
    .param p2, "block"    # Lkotlin/jvm/functions/Function1;
    .param p3, "$completion"    # Lkotlin/coroutines/Continuation;

    .line 27
    invoke-direct {p0, p1, p2, p3}, Lcom/rajat/pdfviewer/PdfRendererCore;->withPdfPage(ILkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private final addBitmapToMemoryCache(ILandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 2
    .param p1, "pageNo"    # I
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;
    .param p3, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/graphics/Bitmap;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 115
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->cacheManager:Lcom/rajat/pdfviewer/util/CacheManager;

    invoke-virtual {v0, p1, p2, p3}, Lcom/rajat/pdfviewer/util/CacheManager;->addBitmapToCache(ILandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_0

    return-object v0

    :cond_0
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private final clearRenderJob(ILkotlinx/coroutines/Job;)V
    .locals 4
    .param p1, "pageNo"    # I
    .param p2, "completedJob"    # Lkotlinx/coroutines/Job;

    .line 241
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->renderStateLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    .line 242
    .local v1, "$i$a$-synchronized-PdfRendererCore$clearRenderJob$1":I
    :try_start_0
    iget-object v2, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->renderJobs:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, p2, :cond_0

    .line 243
    iget-object v2, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->renderJobs:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 245
    :cond_0
    nop

    .end local v1    # "$i$a$-synchronized-PdfRendererCore$clearRenderJob$1":I
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 241
    monitor-exit v0

    .line 246
    return-void

    .line 241
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private final deliverRenderCallbacks(IZLandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 7
    .param p1, "pageNo"    # I
    .param p2, "success"    # Z
    .param p3, "bitmap"    # Landroid/graphics/Bitmap;
    .param p4, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IZ",
            "Landroid/graphics/Bitmap;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 249
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->renderStateLock:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x0

    .line 250
    .local v0, "$i$a$-synchronized-PdfRendererCore$deliverRenderCallbacks$callbacks$1":I
    :try_start_0
    iget-object v2, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->renderCallbacks:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {p1}, Lkotlin/coroutines/jvm/internal/Boxing;->boxInt(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/concurrent/CopyOnWriteArrayList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 249
    .end local v0    # "$i$a$-synchronized-PdfRendererCore$deliverRenderCallbacks$callbacks$1":I
    monitor-exit v1

    if-nez v2, :cond_0

    .line 251
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    .line 252
    .local v2, "callbacks":Ljava/util/concurrent/CopyOnWriteArrayList;
    :cond_0
    sget-object v0, Lkotlinx/coroutines/NonCancellable;->INSTANCE:Lkotlinx/coroutines/NonCancellable;

    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getMain()Lkotlinx/coroutines/MainCoroutineDispatcher;

    move-result-object v1

    check-cast v1, Lkotlin/coroutines/CoroutineContext;

    invoke-virtual {v0, v1}, Lkotlinx/coroutines/NonCancellable;->plus(Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object v0

    new-instance v1, Lcom/rajat/pdfviewer/PdfRendererCore$deliverRenderCallbacks$2;

    const/4 v6, 0x0

    move v4, p1

    move v3, p2

    move-object v5, p3

    .end local p1    # "pageNo":I
    .end local p2    # "success":Z
    .end local p3    # "bitmap":Landroid/graphics/Bitmap;
    .local v3, "success":Z
    .local v4, "pageNo":I
    .local v5, "bitmap":Landroid/graphics/Bitmap;
    invoke-direct/range {v1 .. v6}, Lcom/rajat/pdfviewer/PdfRendererCore$deliverRenderCallbacks$2;-><init>(Ljava/util/concurrent/CopyOnWriteArrayList;ZILandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)V

    check-cast v1, Lkotlin/jvm/functions/Function2;

    invoke-static {v0, v1, p4}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object p2

    if-ne p1, p2, :cond_1

    return-object p1

    :cond_1
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 257
    return-object p1

    .line 249
    .end local v2    # "callbacks":Ljava/util/concurrent/CopyOnWriteArrayList;
    .end local v3    # "success":Z
    .end local v4    # "pageNo":I
    .end local v5    # "bitmap":Landroid/graphics/Bitmap;
    .restart local p1    # "pageNo":I
    .restart local p2    # "success":Z
    .restart local p3    # "bitmap":Landroid/graphics/Bitmap;
    :catchall_0
    move-exception v0

    move v4, p1

    move v3, p2

    move-object v5, p3

    move-object p1, v0

    .end local p1    # "pageNo":I
    .end local p2    # "success":Z
    .end local p3    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v3    # "success":Z
    .restart local v4    # "pageNo":I
    .restart local v5    # "bitmap":Landroid/graphics/Bitmap;
    monitor-exit v1

    throw p1
.end method

.method private final enqueueRenderCallback(ILkotlin/jvm/functions/Function3;)V
    .locals 2
    .param p1, "pageNo"    # I
    .param p2, "onBitmapReady"    # Lkotlin/jvm/functions/Function3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lkotlin/jvm/functions/Function3<",
            "-",
            "Ljava/lang/Boolean;",
            "-",
            "Ljava/lang/Integer;",
            "-",
            "Landroid/graphics/Bitmap;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 223
    if-nez p2, :cond_0

    return-void

    .line 224
    :cond_0
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->renderStateLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    .line 225
    .local v1, "$i$a$-synchronized-PdfRendererCore$enqueueRenderCallback$1":I
    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfRendererCore;->enqueueRenderCallbackLocked(ILkotlin/jvm/functions/Function3;)V

    .line 226
    nop

    .end local v1    # "$i$a$-synchronized-PdfRendererCore$enqueueRenderCallback$1":I
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 224
    monitor-exit v0

    .line 227
    return-void

    .line 224
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private final enqueueRenderCallbackLocked(ILkotlin/jvm/functions/Function3;)V
    .locals 5
    .param p1, "pageNo"    # I
    .param p2, "onBitmapReady"    # Lkotlin/jvm/functions/Function3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lkotlin/jvm/functions/Function3<",
            "-",
            "Ljava/lang/Boolean;",
            "-",
            "Ljava/lang/Integer;",
            "-",
            "Landroid/graphics/Bitmap;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 233
    if-nez p2, :cond_0

    return-void

    .line 234
    :cond_0
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->renderCallbacks:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    if-nez v0, :cond_1

    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    move-object v1, v0

    .local v1, "it":Ljava/util/concurrent/CopyOnWriteArrayList;
    const/4 v2, 0x0

    .local v2, "$i$a$-also-PdfRendererCore$enqueueRenderCallbackLocked$callbacks$1":I
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 235
    iget-object v4, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->renderCallbacks:Ljava/util/concurrent/ConcurrentHashMap;

    check-cast v4, Ljava/util/Map;

    invoke-interface {v4, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    nop

    .line 234
    .end local v1    # "it":Ljava/util/concurrent/CopyOnWriteArrayList;
    .end local v2    # "$i$a$-also-PdfRendererCore$enqueueRenderCallbackLocked$callbacks$1":I
    nop

    .line 237
    .local v0, "callbacks":Ljava/util/concurrent/CopyOnWriteArrayList;
    :cond_1
    invoke-virtual {v0, p2}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 238
    return-void
.end method

.method private final pageExistInCache(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 1
    .param p1, "pageNo"    # I
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Ljava/lang/Boolean;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 117
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->cacheManager:Lcom/rajat/pdfviewer/util/CacheManager;

    invoke-virtual {v0, p1, p2}, Lcom/rajat/pdfviewer/util/CacheManager;->pageExistsInCache(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private final prefetchPageIfIdle(ILandroid/graphics/Bitmap;Lkotlin/jvm/functions/Function3;)V
    .locals 1
    .param p1, "pageNo"    # I
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;
    .param p3, "onBitmapReady"    # Lkotlin/jvm/functions/Function3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/graphics/Bitmap;",
            "Lkotlin/jvm/functions/Function3<",
            "-",
            "Ljava/lang/Boolean;",
            "-",
            "Ljava/lang/Integer;",
            "-",
            "Landroid/graphics/Bitmap;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 134
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p3}, Lcom/rajat/pdfviewer/PdfRendererCore;->renderPageInternal(ILandroid/graphics/Bitmap;ZLkotlin/jvm/functions/Function3;)V

    .line 135
    return-void
.end method

.method static synthetic prefetchPageIfIdle$default(Lcom/rajat/pdfviewer/PdfRendererCore;ILandroid/graphics/Bitmap;Lkotlin/jvm/functions/Function3;ILjava/lang/Object;)V
    .locals 0

    .line 129
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_0

    .line 132
    const/4 p3, 0x0

    .line 129
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lcom/rajat/pdfviewer/PdfRendererCore;->prefetchPageIfIdle(ILandroid/graphics/Bitmap;Lkotlin/jvm/functions/Function3;)V

    return-void
.end method

.method private final prefetchPagesAround(IIIILkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 24
    .param p5, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIII",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    move-object/from16 v0, p5

    instance-of v1, v0, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;

    if-eqz v1, :cond_0

    move-object v1, v0

    check-cast v1, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;

    iget v2, v1, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;->label:I

    const/high16 v3, -0x80000000

    and-int/2addr v2, v3

    if-eqz v2, :cond_0

    iget v2, v1, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;->label:I

    sub-int/2addr v2, v3

    iput v2, v1, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;->label:I

    move-object/from16 v2, p0

    goto :goto_0

    :cond_0
    new-instance v1, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;

    move-object/from16 v2, p0

    invoke-direct {v1, v2, v0}, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;-><init>(Lcom/rajat/pdfviewer/PdfRendererCore;Lkotlin/coroutines/Continuation;)V

    .local v1, "$continuation":Lkotlin/coroutines/Continuation;
    :goto_0
    iget-object v3, v1, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;->result:Ljava/lang/Object;

    .local v3, "$result":Ljava/lang/Object;
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v4

    .line 298
    iget v5, v1, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;->label:I

    packed-switch v5, :pswitch_data_0

    .end local v1    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local v3    # "$result":Ljava/lang/Object;
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v3, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v1, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .restart local v1    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v3    # "$result":Ljava/lang/Object;
    :pswitch_0
    move-object/from16 v5, p0

    .local v5, "this":Lcom/rajat/pdfviewer/PdfRendererCore;
    const/4 v8, 0x0

    .local v8, "$i$f$forEach":I
    const/4 v9, 0x0

    .local v9, "$i$a$-forEach-PdfRendererCore$prefetchPagesAround$2":I
    iget v10, v1, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;->I$2:I

    .local v10, "pageNo":I
    iget v11, v1, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;->I$1:I

    .local v11, "fallbackHeight":I
    iget v12, v1, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;->I$0:I

    .local v12, "fallbackWidth":I
    iget-object v13, v1, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;->L$0:Ljava/lang/Object;

    check-cast v13, Ljava/util/Iterator;

    invoke-static {v3}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v6, v5

    move-object v5, v4

    move-object v4, v3

    goto/16 :goto_8

    .end local v5    # "this":Lcom/rajat/pdfviewer/PdfRendererCore;
    .end local v8    # "$i$f$forEach":I
    .end local v9    # "$i$a$-forEach-PdfRendererCore$prefetchPagesAround$2":I
    .end local v10    # "pageNo":I
    .end local v11    # "fallbackHeight":I
    .end local v12    # "fallbackWidth":I
    :pswitch_1
    move-object/from16 v5, p0

    .restart local v5    # "this":Lcom/rajat/pdfviewer/PdfRendererCore;
    const/4 v8, 0x0

    .local v8, "$i$f$filter":I
    const/4 v9, 0x0

    .local v9, "$i$f$filterTo":I
    const/4 v10, 0x0

    .local v10, "$i$a$-filter-PdfRendererCore$prefetchPagesAround$sortedPages$2":I
    iget v11, v1, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;->I$2:I

    .restart local v11    # "fallbackHeight":I
    iget v12, v1, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;->I$1:I

    .restart local v12    # "fallbackWidth":I
    iget v13, v1, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;->I$0:I

    .local v13, "currentPage":I
    iget-object v14, v1, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;->L$2:Ljava/lang/Object;

    .local v14, "element$iv$iv":Ljava/lang/Object;
    iget-object v15, v1, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;->L$1:Ljava/lang/Object;

    check-cast v15, Ljava/util/Iterator;

    iget-object v6, v1, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;->L$0:Ljava/lang/Object;

    check-cast v6, Ljava/util/Collection;

    .local v6, "destination$iv$iv":Ljava/util/Collection;
    invoke-static {v3}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v7, v6

    move-object v6, v5

    move-object v5, v4

    move-object v4, v3

    goto/16 :goto_5

    .end local v5    # "this":Lcom/rajat/pdfviewer/PdfRendererCore;
    .end local v6    # "destination$iv$iv":Ljava/util/Collection;
    .end local v8    # "$i$f$filter":I
    .end local v9    # "$i$f$filterTo":I
    .end local v10    # "$i$a$-filter-PdfRendererCore$prefetchPagesAround$sortedPages$2":I
    .end local v11    # "fallbackHeight":I
    .end local v12    # "fallbackWidth":I
    .end local v13    # "currentPage":I
    .end local v14    # "element$iv$iv":Ljava/lang/Object;
    :pswitch_2
    invoke-static {v3}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object/from16 v5, p0

    .restart local v5    # "this":Lcom/rajat/pdfviewer/PdfRendererCore;
    move/from16 v6, p2

    .local v6, "fallbackWidth":I
    move/from16 v8, p4

    .local v8, "direction":I
    move/from16 v9, p1

    .local v9, "currentPage":I
    move/from16 v10, p3

    .line 299
    .local v10, "fallbackHeight":I
    nop

    .end local v8    # "direction":I
    packed-switch v8, :pswitch_data_1

    .line 302
    :pswitch_3
    new-instance v8, Lkotlin/ranges/IntRange;

    add-int/lit8 v11, v9, -0x2

    add-int/lit8 v12, v9, 0x2

    invoke-direct {v8, v11, v12}, Lkotlin/ranges/IntRange;-><init>(II)V

    goto :goto_1

    .line 300
    :pswitch_4
    new-instance v8, Lkotlin/ranges/IntRange;

    add-int/lit8 v11, v9, 0x1

    add-int/lit8 v12, v9, 0x2

    invoke-direct {v8, v11, v12}, Lkotlin/ranges/IntRange;-><init>(II)V

    goto :goto_1

    .line 301
    :pswitch_5
    add-int/lit8 v8, v9, -0x2

    invoke-static {v8, v9}, Lkotlin/ranges/RangesKt;->until(II)Lkotlin/ranges/IntRange;

    move-result-object v8

    .line 299
    :goto_1
    nop

    .line 304
    .local v8, "range":Lkotlin/ranges/IntRange;
    check-cast v8, Ljava/lang/Iterable;

    .line 305
    .local v8, "$this$filter$iv":Ljava/lang/Iterable;
    const/4 v11, 0x0

    .line 406
    .local v11, "$i$f$filter":I
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    check-cast v12, Ljava/util/Collection;

    .local v8, "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    .local v12, "destination$iv$iv":Ljava/util/Collection;
    const/4 v13, 0x0

    .line 407
    .local v13, "$i$f$filterTo":I
    invoke-interface {v8}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .end local v8    # "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    :cond_1
    :goto_2
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    .local v8, "element$iv$iv":Ljava/lang/Object;
    move-object v15, v8

    check-cast v15, Ljava/lang/Number;

    invoke-virtual {v15}, Ljava/lang/Number;->intValue()I

    move-result v15

    .local v15, "it":I
    const/16 v16, 0x0

    .line 305
    .local v16, "$i$a$-filter-PdfRendererCore$prefetchPagesAround$sortedPages$1":I
    if-ltz v15, :cond_2

    invoke-virtual {v5}, Lcom/rajat/pdfviewer/PdfRendererCore;->getPageCount()I

    move-result v7

    if-ge v15, v7, :cond_2

    const/4 v7, 0x1

    goto :goto_3

    :cond_2
    const/4 v7, 0x0

    .line 407
    .end local v15    # "it":I
    .end local v16    # "$i$a$-filter-PdfRendererCore$prefetchPagesAround$sortedPages$1":I
    :goto_3
    if-eqz v7, :cond_1

    invoke-interface {v12, v8}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 408
    .end local v8    # "element$iv$iv":Ljava/lang/Object;
    :cond_3
    nop

    .end local v12    # "destination$iv$iv":Ljava/util/Collection;
    .end local v13    # "$i$f$filterTo":I
    move-object v7, v12

    check-cast v7, Ljava/util/List;

    .line 406
    nop

    .end local v11    # "$i$f$filter":I
    check-cast v7, Ljava/lang/Iterable;

    .line 306
    .local v7, "$this$filter$iv":Ljava/lang/Iterable;
    const/4 v8, 0x0

    .line 409
    .local v8, "$i$f$filter":I
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    check-cast v11, Ljava/util/Collection;

    .local v7, "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    .local v11, "destination$iv$iv":Ljava/util/Collection;
    const/4 v12, 0x0

    .line 410
    .local v12, "$i$f$filterTo":I
    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v13

    move-object v15, v13

    move v13, v9

    move v9, v12

    move v12, v6

    move-object v6, v11

    move v11, v10

    .end local v7    # "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    .end local v10    # "fallbackHeight":I
    .end local p5    # "$completion":Lkotlin/coroutines/Continuation;
    .local v0, "$completion":Lkotlin/coroutines/Continuation;
    .local v6, "destination$iv$iv":Ljava/util/Collection;
    .local v9, "$i$f$filterTo":I
    .local v11, "fallbackHeight":I
    .local v12, "fallbackWidth":I
    .local v13, "currentPage":I
    :goto_4
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_6

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    .restart local v14    # "element$iv$iv":Ljava/lang/Object;
    move-object v7, v14

    check-cast v7, Ljava/lang/Number;

    invoke-virtual {v7}, Ljava/lang/Number;->intValue()I

    move-result v7

    .local v7, "it":I
    const/4 v10, 0x0

    .line 306
    .local v10, "$i$a$-filter-PdfRendererCore$prefetchPagesAround$sortedPages$2":I
    iput-object v6, v1, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;->L$0:Ljava/lang/Object;

    iput-object v15, v1, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;->L$1:Ljava/lang/Object;

    iput-object v14, v1, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;->L$2:Ljava/lang/Object;

    iput v13, v1, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;->I$0:I

    iput v12, v1, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;->I$1:I

    iput v11, v1, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;->I$2:I

    move-object/from16 p1, v0

    const/4 v0, 0x1

    .end local v0    # "$completion":Lkotlin/coroutines/Continuation;
    .local p1, "$completion":Lkotlin/coroutines/Continuation;
    iput v0, v1, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;->label:I

    invoke-direct {v5, v7, v1}, Lcom/rajat/pdfviewer/PdfRendererCore;->pageExistInCache(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    .end local v7    # "it":I
    if-ne v0, v4, :cond_4

    .line 298
    .end local v5    # "this":Lcom/rajat/pdfviewer/PdfRendererCore;
    return-object v4

    .line 306
    .restart local v5    # "this":Lcom/rajat/pdfviewer/PdfRendererCore;
    :cond_4
    move-object v7, v6

    move-object v6, v5

    move-object v5, v4

    move-object v4, v3

    move-object v3, v0

    move-object/from16 v0, p1

    .end local v3    # "$result":Ljava/lang/Object;
    .end local v5    # "this":Lcom/rajat/pdfviewer/PdfRendererCore;
    .end local p1    # "$completion":Lkotlin/coroutines/Continuation;
    .restart local v0    # "$completion":Lkotlin/coroutines/Continuation;
    .local v4, "$result":Ljava/lang/Object;
    .local v6, "this":Lcom/rajat/pdfviewer/PdfRendererCore;
    .local v7, "destination$iv$iv":Ljava/util/Collection;
    :goto_5
    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    .line 410
    .end local v10    # "$i$a$-filter-PdfRendererCore$prefetchPagesAround$sortedPages$2":I
    if-nez v3, :cond_5

    invoke-interface {v7, v14}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .end local v14    # "element$iv$iv":Ljava/lang/Object;
    :cond_5
    move-object v3, v4

    move-object v4, v5

    move-object v5, v6

    move-object v6, v7

    goto :goto_4

    .line 411
    .end local v4    # "$result":Ljava/lang/Object;
    .end local v7    # "destination$iv$iv":Ljava/util/Collection;
    .restart local v3    # "$result":Ljava/lang/Object;
    .restart local v5    # "this":Lcom/rajat/pdfviewer/PdfRendererCore;
    .local v6, "destination$iv$iv":Ljava/util/Collection;
    :cond_6
    move-object/from16 p1, v0

    .end local v0    # "$completion":Lkotlin/coroutines/Continuation;
    .end local v6    # "destination$iv$iv":Ljava/util/Collection;
    .end local v9    # "$i$f$filterTo":I
    .restart local p1    # "$completion":Lkotlin/coroutines/Continuation;
    move-object v0, v6

    check-cast v0, Ljava/util/List;

    .line 409
    nop

    .end local v8    # "$i$f$filter":I
    check-cast v0, Ljava/lang/Iterable;

    .line 307
    .local v0, "$this$sortedBy$iv":Ljava/lang/Iterable;
    const/4 v6, 0x0

    .line 412
    .local v6, "$i$f$sortedBy":I
    new-instance v7, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$$inlined$sortedBy$1;

    invoke-direct {v7, v13}, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$$inlined$sortedBy$1;-><init>(I)V

    check-cast v7, Ljava/util/Comparator;

    .end local v13    # "currentPage":I
    invoke-static {v0, v7}, Lkotlin/collections/CollectionsKt;->sortedWith(Ljava/lang/Iterable;Ljava/util/Comparator;)Ljava/util/List;

    move-result-object v0

    .line 307
    .end local v0    # "$this$sortedBy$iv":Ljava/lang/Iterable;
    .end local v6    # "$i$f$sortedBy":I
    nop

    .line 304
    nop

    .line 309
    .local v0, "sortedPages":Ljava/util/List;
    check-cast v0, Ljava/lang/Iterable;

    .local v0, "$this$forEach$iv":Ljava/lang/Iterable;
    const/4 v6, 0x0

    .line 413
    .local v6, "$i$f$forEach":I
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    move-object/from16 v0, p1

    move v8, v6

    move-object v13, v7

    .end local v6    # "$i$f$forEach":I
    .end local p1    # "$completion":Lkotlin/coroutines/Continuation;
    .local v0, "$completion":Lkotlin/coroutines/Continuation;
    .local v8, "$i$f$forEach":I
    :goto_6
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_b

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    .local v6, "element$iv":Ljava/lang/Object;
    move-object v7, v6

    check-cast v7, Ljava/lang/Number;

    invoke-virtual {v7}, Ljava/lang/Number;->intValue()I

    move-result v10

    .end local v6    # "element$iv":Ljava/lang/Object;
    .local v10, "pageNo":I
    const/4 v9, 0x0

    .line 310
    .local v9, "$i$a$-forEach-PdfRendererCore$prefetchPagesAround$2":I
    iget-object v6, v5, Lcom/rajat/pdfviewer/PdfRendererCore;->renderJobs:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {v10}, Lkotlin/coroutines/jvm/internal/Boxing;->boxInt(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lkotlinx/coroutines/Job;

    if-eqz v6, :cond_7

    invoke-interface {v6}, Lkotlinx/coroutines/Job;->isActive()Z

    move-result v6

    const/4 v7, 0x1

    if-ne v6, v7, :cond_7

    const/4 v6, 0x1

    goto :goto_7

    :cond_7
    const/4 v6, 0x0

    :goto_7
    if-nez v6, :cond_a

    .line 311
    new-instance v6, Lcom/rajat/pdfviewer/PdfRendererCore$$ExternalSyntheticLambda0;

    invoke-direct {v6}, Lcom/rajat/pdfviewer/PdfRendererCore$$ExternalSyntheticLambda0;-><init>()V

    iput-object v13, v1, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;->L$0:Ljava/lang/Object;

    const/4 v7, 0x0

    iput-object v7, v1, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;->L$1:Ljava/lang/Object;

    iput-object v7, v1, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;->L$2:Ljava/lang/Object;

    iput v12, v1, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;->I$0:I

    iput v11, v1, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;->I$1:I

    iput v10, v1, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;->I$2:I

    const/4 v7, 0x2

    iput v7, v1, Lcom/rajat/pdfviewer/PdfRendererCore$prefetchPagesAround$1;->label:I

    invoke-direct {v5, v10, v6, v1}, Lcom/rajat/pdfviewer/PdfRendererCore;->withPdfPage(ILkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v6

    if-ne v6, v4, :cond_8

    .line 298
    .end local v5    # "this":Lcom/rajat/pdfviewer/PdfRendererCore;
    return-object v4

    .line 311
    .restart local v5    # "this":Lcom/rajat/pdfviewer/PdfRendererCore;
    :cond_8
    move-object/from16 v23, v4

    move-object v4, v3

    move-object v3, v6

    move-object v6, v5

    move-object/from16 v5, v23

    .end local v3    # "$result":Ljava/lang/Object;
    .end local v5    # "this":Lcom/rajat/pdfviewer/PdfRendererCore;
    .restart local v4    # "$result":Ljava/lang/Object;
    .local v6, "this":Lcom/rajat/pdfviewer/PdfRendererCore;
    :goto_8
    check-cast v3, Landroid/util/Size;

    if-nez v3, :cond_9

    .line 313
    new-instance v3, Landroid/util/Size;

    invoke-direct {v3, v12, v11}, Landroid/util/Size;-><init>(II)V

    .line 311
    :cond_9
    nop

    .line 315
    .local v3, "size":Landroid/util/Size;
    invoke-virtual {v3}, Landroid/util/Size;->getWidth()I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {v3}, Landroid/util/Size;->getHeight()I

    move-result v14

    int-to-float v14, v14

    div-float/2addr v7, v14

    .line 316
    .local v7, "aspectRatio":F
    int-to-float v14, v12

    div-float/2addr v14, v7

    float-to-int v14, v14

    .line 318
    .local v14, "height":I
    sget-object v17, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->INSTANCE:Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;

    const/4 v15, 0x1

    invoke-static {v15, v14}, Ljava/lang/Math;->max(II)I

    move-result v19

    const/16 v21, 0x4

    const/16 v22, 0x0

    const/16 v20, 0x0

    move/from16 v18, v12

    .end local v12    # "fallbackWidth":I
    .local v18, "fallbackWidth":I
    invoke-static/range {v17 .. v22}, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->getBitmap$default(Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;IILandroid/graphics/Bitmap$Config;ILjava/lang/Object;)Landroid/graphics/Bitmap;

    move-result-object v12

    .line 319
    .local v12, "bitmap":Landroid/graphics/Bitmap;
    new-instance v15, Lcom/rajat/pdfviewer/PdfRendererCore$$ExternalSyntheticLambda1;

    invoke-direct {v15, v12}, Lcom/rajat/pdfviewer/PdfRendererCore$$ExternalSyntheticLambda1;-><init>(Landroid/graphics/Bitmap;)V

    invoke-direct {v6, v10, v12, v15}, Lcom/rajat/pdfviewer/PdfRendererCore;->prefetchPageIfIdle(ILandroid/graphics/Bitmap;Lkotlin/jvm/functions/Function3;)V

    move-object v3, v4

    move-object v4, v5

    move-object v5, v6

    move/from16 v12, v18

    .line 323
    .end local v4    # "$result":Ljava/lang/Object;
    .end local v6    # "this":Lcom/rajat/pdfviewer/PdfRendererCore;
    .end local v7    # "aspectRatio":F
    .end local v10    # "pageNo":I
    .end local v14    # "height":I
    .end local v18    # "fallbackWidth":I
    .local v3, "$result":Ljava/lang/Object;
    .restart local v5    # "this":Lcom/rajat/pdfviewer/PdfRendererCore;
    .local v12, "fallbackWidth":I
    :cond_a
    nop

    .line 413
    .end local v9    # "$i$a$-forEach-PdfRendererCore$prefetchPagesAround$2":I
    goto/16 :goto_6

    .line 414
    :cond_b
    nop

    .line 324
    .end local v8    # "$i$f$forEach":I
    sget-object v4, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v4

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch -0x1
        :pswitch_5
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method static final prefetchPagesAround$lambda$11$lambda$10(Landroid/graphics/Bitmap;ZILandroid/graphics/Bitmap;)Lkotlin/Unit;
    .locals 0
    .param p0, "$bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "success"    # Z

    .line 320
    if-nez p1, :cond_0

    sget-object p2, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->INSTANCE:Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;

    invoke-virtual {p2, p0}, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->recycleBitmap(Landroid/graphics/Bitmap;)V

    .line 321
    :cond_0
    sget-object p2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p2
.end method

.method static final prefetchPagesAround$lambda$11$lambda$9(Landroid/graphics/pdf/PdfRenderer$Page;)Landroid/util/Size;
    .locals 3
    .param p0, "page"    # Landroid/graphics/pdf/PdfRenderer$Page;

    const-string/jumbo v0, "page"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 312
    new-instance v0, Landroid/util/Size;

    invoke-virtual {p0}, Landroid/graphics/pdf/PdfRenderer$Page;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/graphics/pdf/PdfRenderer$Page;->getHeight()I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    return-object v0
.end method

.method public static synthetic renderPage$default(Lcom/rajat/pdfviewer/PdfRendererCore;ILandroid/graphics/Bitmap;Lkotlin/jvm/functions/Function3;ILjava/lang/Object;)V
    .locals 0

    .line 121
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_0

    .line 124
    const/4 p3, 0x0

    .line 121
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/rajat/pdfviewer/PdfRendererCore;->renderPage(ILandroid/graphics/Bitmap;Lkotlin/jvm/functions/Function3;)V

    return-void
.end method

.method private final renderPageInternal(ILandroid/graphics/Bitmap;ZLkotlin/jvm/functions/Function3;)V
    .locals 9
    .param p1, "pageNo"    # I
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;
    .param p3, "replaceActive"    # Z
    .param p4, "onBitmapReady"    # Lkotlin/jvm/functions/Function3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/graphics/Bitmap;",
            "Z",
            "Lkotlin/jvm/functions/Function3<",
            "-",
            "Ljava/lang/Boolean;",
            "-",
            "Ljava/lang/Integer;",
            "-",
            "Landroid/graphics/Bitmap;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 143
    if-ltz p1, :cond_1

    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererCore;->getPageCount()I

    move-result v0

    if-lt p1, v0, :cond_0

    move-object v7, p2

    move p2, p3

    move-object p3, p4

    goto :goto_0

    .line 149
    :cond_0
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->scope:Lkotlinx/coroutines/CoroutineScope;

    new-instance v2, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;

    const/4 v8, 0x0

    move-object v3, p0

    move v4, p1

    move-object v7, p2

    move v6, p3

    move-object v5, p4

    .end local p1    # "pageNo":I
    .end local p2    # "bitmap":Landroid/graphics/Bitmap;
    .end local p3    # "replaceActive":Z
    .end local p4    # "onBitmapReady":Lkotlin/jvm/functions/Function3;
    .local v4, "pageNo":I
    .local v5, "onBitmapReady":Lkotlin/jvm/functions/Function3;
    .local v6, "replaceActive":Z
    .local v7, "bitmap":Landroid/graphics/Bitmap;
    invoke-direct/range {v2 .. v8}, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageInternal$1;-><init>(Lcom/rajat/pdfviewer/PdfRendererCore;ILkotlin/jvm/functions/Function3;ZLandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)V

    move-object p3, v5

    move p2, v6

    .end local v4    # "pageNo":I
    .end local v5    # "onBitmapReady":Lkotlin/jvm/functions/Function3;
    .end local v6    # "replaceActive":Z
    .restart local p1    # "pageNo":I
    .local p2, "replaceActive":Z
    .local p3, "onBitmapReady":Lkotlin/jvm/functions/Function3;
    move-object v4, v2

    check-cast v4, Lkotlin/jvm/functions/Function2;

    const/4 v5, 0x3

    const/4 v6, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static/range {v1 .. v6}, Lkotlinx/coroutines/BuildersKt;->launch$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    .line 217
    return-void

    .line 143
    .end local v7    # "bitmap":Landroid/graphics/Bitmap;
    .local p2, "bitmap":Landroid/graphics/Bitmap;
    .local p3, "replaceActive":Z
    .restart local p4    # "onBitmapReady":Lkotlin/jvm/functions/Function3;
    :cond_1
    move-object v7, p2

    move p2, p3

    move-object p3, p4

    .line 144
    .end local p4    # "onBitmapReady":Lkotlin/jvm/functions/Function3;
    .restart local v7    # "bitmap":Landroid/graphics/Bitmap;
    .local p2, "replaceActive":Z
    .local p3, "onBitmapReady":Lkotlin/jvm/functions/Function3;
    :goto_0
    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v0, "\u26a0\ufe0f Skipped invalid render for page "

    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p4

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    const-string v0, "PdfRendererCore_Metrics"

    invoke-static {v0, p4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    if-eqz p3, :cond_2

    const/4 p4, 0x0

    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p4

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {p3, p4, v0, v1}, Lkotlin/jvm/functions/Function3;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    :cond_2
    return-void
.end method

.method static synthetic renderPageInternal$default(Lcom/rajat/pdfviewer/PdfRendererCore;ILandroid/graphics/Bitmap;ZLkotlin/jvm/functions/Function3;ILjava/lang/Object;)V
    .locals 0

    .line 137
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_0

    .line 141
    const/4 p4, 0x0

    .line 137
    :cond_0
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/rajat/pdfviewer/PdfRendererCore;->renderPageInternal(ILandroid/graphics/Bitmap;ZLkotlin/jvm/functions/Function3;)V

    return-void
.end method

.method private final withPdfPage(ILkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 3
    .param p1, "pageNo"    # I
    .param p2, "block"    # Lkotlin/jvm/functions/Function1;
    .param p3, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroid/graphics/pdf/PdfRenderer$Page;",
            "+TT;>;",
            "Lkotlin/coroutines/Continuation<",
            "-TT;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 348
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v0

    check-cast v0, Lkotlin/coroutines/CoroutineContext;

    new-instance v1, Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, p2, v2}, Lcom/rajat/pdfviewer/PdfRendererCore$withPdfPage$2;-><init>(Lcom/rajat/pdfviewer/PdfRendererCore;ILkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)V

    check-cast v1, Lkotlin/jvm/functions/Function2;

    invoke-static {v0, v1, p3}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    .line 359
    return-object v0
.end method


# virtual methods
.method public final averageRenderTime()J
    .locals 4

    .line 343
    iget v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->totalPagesRendered:I

    if-nez v0, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->totalRenderTime:J

    iget v2, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->totalPagesRendered:I

    int-to-long v2, v2

    div-long/2addr v0, v2

    :goto_0
    return-wide v0
.end method

.method public final cancelPrefetch()V
    .locals 3

    .line 367
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->prefetchJob:Lkotlinx/coroutines/Job;

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, v2, v1, v2}, Lkotlinx/coroutines/Job$DefaultImpls;->cancel$default(Lkotlinx/coroutines/Job;Ljava/util/concurrent/CancellationException;ILjava/lang/Object;)V

    .line 368
    :cond_0
    return-void
.end method

.method public final cancelRender(I)V
    .locals 3
    .param p1, "pageNo"    # I

    .line 362
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->renderJobs:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlinx/coroutines/Job;

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, v2, v1, v2}, Lkotlinx/coroutines/Job$DefaultImpls;->cancel$default(Lkotlinx/coroutines/Job;Ljava/util/concurrent/CancellationException;ILjava/lang/Object;)V

    .line 363
    :cond_0
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->renderCallbacks:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 364
    return-void
.end method

.method public final closePdfRender()V
    .locals 3

    .line 371
    iget-boolean v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->isRendererOpen:Z

    if-nez v0, :cond_0

    return-void

    .line 373
    :cond_0
    const-string v0, "PdfRendererCore"

    const-string v1, "Closing PdfRenderer and releasing resources."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 375
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->scope:Lkotlinx/coroutines/CoroutineScope;

    invoke-interface {v0}, Lkotlinx/coroutines/CoroutineScope;->getCoroutineContext()Lkotlin/coroutines/CoroutineContext;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {v0, v1, v2, v1}, Lkotlinx/coroutines/JobKt;->cancelChildren$default(Lkotlin/coroutines/CoroutineContext;Ljava/util/concurrent/CancellationException;ILjava/lang/Object;)V

    .line 377
    new-instance v0, Lcom/rajat/pdfviewer/PdfRendererCore$closePdfRender$1;

    invoke-direct {v0, p0, v1}, Lcom/rajat/pdfviewer/PdfRendererCore$closePdfRender$1;-><init>(Lcom/rajat/pdfviewer/PdfRendererCore;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/jvm/functions/Function2;

    invoke-static {v1, v0, v2, v1}, Lkotlinx/coroutines/BuildersKt;->runBlocking$default(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Ljava/lang/Object;

    .line 391
    return-void
.end method

.method public final getBitmapFromCache(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 1
    .param p1, "pageNo"    # I
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Landroid/graphics/Bitmap;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 113
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->cacheManager:Lcom/rajat/pdfviewer/util/CacheManager;

    invoke-virtual {v0, p1, p2}, Lcom/rajat/pdfviewer/util/CacheManager;->getBitmapFromCache(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final getPageCount()I
    .locals 3

    .line 111
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->pageCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    .line 394
    .local v1, "it":I
    const/4 v2, 0x0

    .line 111
    .local v2, "$i$a$-takeIf-PdfRendererCore$getPageCount$1":I
    iget-boolean v1, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->isRendererOpen:Z

    .end local v1    # "it":I
    .end local v2    # "$i$a$-takeIf-PdfRendererCore$getPageCount$1":I
    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    :goto_1
    return v0
.end method

.method public final getPageDimensionsAsync(ILkotlin/jvm/functions/Function1;)V
    .locals 8
    .param p1, "pageNo"    # I
    .param p2, "callback"    # Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroid/util/Size;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 327
    const-string v0, "callback"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->pageDimensionCache:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Size;

    if-eqz v0, :cond_0

    .local v0, "it":Landroid/util/Size;
    const/4 v1, 0x0

    .line 328
    .local v1, "$i$a$-let-PdfRendererCore$getPageDimensionsAsync$1":I
    invoke-interface {p2, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 329
    return-void

    .line 332
    .end local v0    # "it":Landroid/util/Size;
    .end local v1    # "$i$a$-let-PdfRendererCore$getPageDimensionsAsync$1":I
    :cond_0
    iget-object v2, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->scope:Lkotlinx/coroutines/CoroutineScope;

    new-instance v0, Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, p2, v1}, Lcom/rajat/pdfviewer/PdfRendererCore$getPageDimensionsAsync$2;-><init>(Lcom/rajat/pdfviewer/PdfRendererCore;ILkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)V

    move-object v5, v0

    check-cast v5, Lkotlin/jvm/functions/Function2;

    const/4 v6, 0x3

    const/4 v7, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static/range {v2 .. v7}, Lkotlinx/coroutines/BuildersKt;->launch$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    .line 341
    return-void
.end method

.method public final preloadPageDimensions()V
    .locals 6

    .line 278
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->scope:Lkotlinx/coroutines/CoroutineScope;

    new-instance v1, Lcom/rajat/pdfviewer/PdfRendererCore$preloadPageDimensions$1;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/rajat/pdfviewer/PdfRendererCore$preloadPageDimensions$1;-><init>(Lcom/rajat/pdfviewer/PdfRendererCore;Lkotlin/coroutines/Continuation;)V

    move-object v3, v1

    check-cast v3, Lkotlin/jvm/functions/Function2;

    const/4 v4, 0x3

    const/4 v5, 0x0

    const/4 v1, 0x0

    invoke-static/range {v0 .. v5}, Lkotlinx/coroutines/BuildersKt;->launch$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    .line 287
    return-void
.end method

.method public final renderPage(ILandroid/graphics/Bitmap;Lkotlin/jvm/functions/Function3;)V
    .locals 1
    .param p1, "pageNo"    # I
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;
    .param p3, "onBitmapReady"    # Lkotlin/jvm/functions/Function3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/graphics/Bitmap;",
            "Lkotlin/jvm/functions/Function3<",
            "-",
            "Ljava/lang/Boolean;",
            "-",
            "Ljava/lang/Integer;",
            "-",
            "Landroid/graphics/Bitmap;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    const-string v0, "bitmap"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 126
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0, p3}, Lcom/rajat/pdfviewer/PdfRendererCore;->renderPageInternal(ILandroid/graphics/Bitmap;ZLkotlin/jvm/functions/Function3;)V

    .line 127
    return-void
.end method

.method public final renderPageAsync(IIILkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 12
    .param p1, "pageNo"    # I
    .param p2, "width"    # I
    .param p3, "height"    # I
    .param p4, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(III",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Landroid/graphics/Bitmap;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 266
    const/4 v0, 0x0

    .line 395
    .local v0, "$i$f$suspendCancellableCoroutine":I
    move-object/from16 v1, p4

    .local v1, "uCont$iv":Lkotlin/coroutines/Continuation;
    const/4 v2, 0x0

    .line 396
    .local v2, "$i$a$-suspendCoroutineUninterceptedOrReturn-CancellableContinuationKt$suspendCancellableCoroutine$2$iv":I
    new-instance v3, Lkotlinx/coroutines/CancellableContinuationImpl;

    invoke-static {v1}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->intercepted(Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v4

    const/4 v5, 0x1

    invoke-direct {v3, v4, v5}, Lkotlinx/coroutines/CancellableContinuationImpl;-><init>(Lkotlin/coroutines/Continuation;I)V

    .line 402
    .local v3, "cancellable$iv":Lkotlinx/coroutines/CancellableContinuationImpl;
    invoke-virtual {v3}, Lkotlinx/coroutines/CancellableContinuationImpl;->initCancellability()V

    .line 403
    move-object v4, v3

    check-cast v4, Lkotlinx/coroutines/CancellableContinuation;

    .local v4, "continuation":Lkotlinx/coroutines/CancellableContinuation;
    const/4 v5, 0x0

    .line 267
    .local v5, "$i$a$-suspendCancellableCoroutine-PdfRendererCore$renderPageAsync$2":I
    sget-object v6, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->INSTANCE:Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;

    const/4 v10, 0x4

    const/4 v11, 0x0

    const/4 v9, 0x0

    move v7, p2

    move v8, p3

    invoke-static/range {v6 .. v11}, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->getBitmap$default(Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;IILandroid/graphics/Bitmap$Config;ILjava/lang/Object;)Landroid/graphics/Bitmap;

    move-result-object v6

    .line 268
    .local v6, "bitmap":Landroid/graphics/Bitmap;
    new-instance v7, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageAsync$2$1;

    invoke-direct {v7, v4, v6}, Lcom/rajat/pdfviewer/PdfRendererCore$renderPageAsync$2$1;-><init>(Lkotlinx/coroutines/CancellableContinuation;Landroid/graphics/Bitmap;)V

    check-cast v7, Lkotlin/jvm/functions/Function3;

    invoke-virtual {p0, p1, v6, v7}, Lcom/rajat/pdfviewer/PdfRendererCore;->renderPage(ILandroid/graphics/Bitmap;Lkotlin/jvm/functions/Function3;)V

    .line 275
    nop

    .line 403
    .end local v4    # "continuation":Lkotlinx/coroutines/CancellableContinuation;
    .end local v5    # "$i$a$-suspendCancellableCoroutine-PdfRendererCore$renderPageAsync$2":I
    .end local v6    # "bitmap":Landroid/graphics/Bitmap;
    nop

    .line 404
    invoke-virtual {v3}, Lkotlinx/coroutines/CancellableContinuationImpl;->getResult()Ljava/lang/Object;

    move-result-object v1

    .line 395
    .end local v1    # "uCont$iv":Lkotlin/coroutines/Continuation;
    .end local v2    # "$i$a$-suspendCoroutineUninterceptedOrReturn-CancellableContinuationKt$suspendCancellableCoroutine$2$iv":I
    .end local v3    # "cancellable$iv":Lkotlinx/coroutines/CancellableContinuationImpl;
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v2

    if-ne v1, v2, :cond_0

    invoke-static/range {p4 .. p4}, Lkotlin/coroutines/jvm/internal/DebugProbesKt;->probeCoroutineSuspended(Lkotlin/coroutines/Continuation;)V

    .line 405
    :cond_0
    nop

    .line 275
    .end local v0    # "$i$f$suspendCancellableCoroutine":I
    return-object v1
.end method

.method public final schedulePrefetch(IIII)V
    .locals 11
    .param p1, "currentPage"    # I
    .param p2, "width"    # I
    .param p3, "height"    # I
    .param p4, "direction"    # I

    .line 290
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->cacheManager:Lcom/rajat/pdfviewer/util/CacheManager;

    invoke-virtual {v0}, Lcom/rajat/pdfviewer/util/CacheManager;->shouldPrefetch()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 291
    :cond_0
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->prefetchJob:Lkotlinx/coroutines/Job;

    if-eqz v0, :cond_1

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, v2, v1, v2}, Lkotlinx/coroutines/Job$DefaultImpls;->cancel$default(Lkotlinx/coroutines/Job;Ljava/util/concurrent/CancellationException;ILjava/lang/Object;)V

    .line 292
    :cond_1
    iget-object v3, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->scope:Lkotlinx/coroutines/CoroutineScope;

    new-instance v4, Lcom/rajat/pdfviewer/PdfRendererCore$schedulePrefetch$1;

    const/4 v10, 0x0

    move-object v5, p0

    move v6, p1

    move v7, p2

    move v8, p3

    move v9, p4

    .end local p1    # "currentPage":I
    .end local p2    # "width":I
    .end local p3    # "height":I
    .end local p4    # "direction":I
    .local v6, "currentPage":I
    .local v7, "width":I
    .local v8, "height":I
    .local v9, "direction":I
    invoke-direct/range {v4 .. v10}, Lcom/rajat/pdfviewer/PdfRendererCore$schedulePrefetch$1;-><init>(Lcom/rajat/pdfviewer/PdfRendererCore;IIIILkotlin/coroutines/Continuation;)V

    .end local v6    # "currentPage":I
    .end local v7    # "width":I
    .end local v8    # "height":I
    .restart local p1    # "currentPage":I
    .restart local p2    # "width":I
    .restart local p3    # "height":I
    move-object v6, v4

    check-cast v6, Lkotlin/jvm/functions/Function2;

    const/4 v7, 0x3

    const/4 v8, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static/range {v3 .. v8}, Lkotlinx/coroutines/BuildersKt;->launch$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    move-result-object p4

    iput-object p4, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->prefetchJob:Lkotlinx/coroutines/Job;

    .line 296
    return-void
.end method

.method public final shouldPrefetch()Z
    .locals 1

    .line 119
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->cacheManager:Lcom/rajat/pdfviewer/util/CacheManager;

    invoke-virtual {v0}, Lcom/rajat/pdfviewer/util/CacheManager;->shouldPrefetch()Z

    move-result v0

    return v0
.end method

.method public final slowestPageInfo()Lkotlin/Pair;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 345
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->slowestPage:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    .line 394
    .local v0, "it":I
    const/4 v1, 0x0

    .line 345
    .local v1, "$i$a$-let-PdfRendererCore$slowestPageInfo$1":I
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget-wide v3, p0, Lcom/rajat/pdfviewer/PdfRendererCore;->slowestRenderTime:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-static {v2, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v0

    .end local v0    # "it":I
    .end local v1    # "$i$a$-let-PdfRendererCore$slowestPageInfo$1":I
    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method
