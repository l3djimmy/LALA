.class public final Lcom/rajat/pdfviewer/PdfRendererView;
.super Landroid/widget/FrameLayout;
.source "PdfRendererView.kt"

# interfaces
.implements Landroidx/lifecycle/DefaultLifecycleObserver;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rajat/pdfviewer/PdfRendererView$Companion;,
        Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;,
        Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPdfRendererView.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PdfRendererView.kt\ncom/rajat/pdfviewer/PdfRendererView\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 3 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,707:1\n1#2:708\n1#2:719\n1617#3,9:709\n1869#3:718\n1870#3:720\n1626#3:721\n*S KotlinDebug\n*F\n+ 1 PdfRendererView.kt\ncom/rajat/pdfviewer/PdfRendererView\n*L\n554#1:719\n554#1:709,9\n554#1:718\n554#1:720\n554#1:721\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u00e8\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0007\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\r\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0010\t\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0008\u000f\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0008\u0007\u0018\u0000 \u008f\u00012\u00020\u00012\u00020\u0002:\u0006\u008d\u0001\u008e\u0001\u008f\u0001B\'\u0008\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u0012\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0006\u0010A\u001a\u00020\u0010J\u0006\u0010B\u001a\u00020-J\u001a\u0010F\u001a\u00020\'*\u00020\u00002\u0006\u0010\u0003\u001a\u00020\u0004H\u0086@\u00a2\u0006\u0002\u0010GJ2\u0010H\u001a\u00020\'2\u0006\u0010I\u001a\u00020J2\u0008\u0008\u0002\u0010K\u001a\u00020L2\u0006\u0010M\u001a\u00020N2\u0006\u0010O\u001a\u00020)2\u0008\u0008\u0002\u0010\u0011\u001a\u00020\u0012J\u0018\u0010P\u001a\u00020\'2\u0006\u0010Q\u001a\u00020R2\u0008\u0008\u0002\u0010\u0011\u001a\u00020\u0012J2\u0010S\u001a\u00020\'2\u0006\u0010Q\u001a\u00020R2\u0006\u0010\u0011\u001a\u00020\u00122\u000e\u0010T\u001a\n\u0012\u0004\u0012\u00020\'\u0018\u00010&2\u0008\u0010U\u001a\u0004\u0018\u00010JH\u0002J\u000e\u0010V\u001a\u00020\'2\u0006\u0010W\u001a\u00020XJ \u0010Y\u001a\u00020\'2\u0006\u0010Z\u001a\u00020\u000c2\u000e\u0010T\u001a\n\u0012\u0004\u0012\u00020\'\u0018\u00010&H\u0002J\u0006\u0010[\u001a\u00020\'J\u0006\u0010\\\u001a\u00020\'J\"\u0010]\u001a\u00020\'2\u0006\u0010^\u001a\u00020\u00082\u0008\u0008\u0002\u0010_\u001a\u00020\u00102\u0008\u0008\u0002\u0010`\u001a\u00020aJ\u0008\u0010b\u001a\u00020\'H\u0002J\u0016\u0010c\u001a\u0010\u0012\u0004\u0012\u00020\u0008\u0012\u0004\u0012\u00020\u0008\u0018\u00010dH\u0002J\u0010\u0010e\u001a\u00020\'2\u0006\u0010f\u001a\u00020\u0008H\u0002J\u001a\u0010g\u001a\u00020\'2\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u00062\u0006\u0010h\u001a\u00020\u0008H\u0002J\u0010\u0010i\u001a\u00020\'2\u0006\u0010j\u001a\u00020kH\u0002J\u0008\u0010l\u001a\u00020\'H\u0002J\u0006\u0010m\u001a\u00020\'J\u0010\u0010n\u001a\u00020\'2\u0006\u0010o\u001a\u00020pH\u0016J\u0010\u0010q\u001a\u00020\'2\u0006\u0010O\u001a\u00020)H\u0002J\u0008\u0010r\u001a\u00020\'H\u0002J \u0010s\u001a\n\u0012\u0004\u0012\u00020\'\u0018\u00010&2\u0006\u0010Q\u001a\u00020R2\u0006\u0010\u0011\u001a\u00020\u0012H\u0002J\u0018\u0010t\u001a\u0004\u0018\u00010u2\u0006\u0010v\u001a\u00020\u0008H\u0082@\u00a2\u0006\u0002\u0010wJ\u0014\u0010x\u001a\u0008\u0012\u0004\u0012\u00020u0yH\u0086@\u00a2\u0006\u0002\u0010zJ\u000e\u0010{\u001a\u00020\'2\u0006\u0010|\u001a\u00020\u0010J\u000e\u0010}\u001a\u00020\'2\u0006\u0010,\u001a\u00020-J\u0006\u0010~\u001a\u00020-J\u0008\u0010\u007f\u001a\u00020\u0010H\u0007J\u0007\u0010\u0080\u0001\u001a\u00020\'J\u0007\u0010\u0081\u0001\u001a\u00020\'J\u0007\u0010\u0082\u0001\u001a\u00020\'J\t\u0010\u0083\u0001\u001a\u00020\'H\u0002J\u0012\u0010\u0084\u0001\u001a\u00020\u00102\u0007\u0010\u0085\u0001\u001a\u00020\u0008H\u0016J\t\u0010\u0086\u0001\u001a\u00020\'H\u0014J\t\u0010\u0087\u0001\u001a\u00020\'H\u0002J\n\u0010\u0088\u0001\u001a\u00030\u0089\u0001H\u0014J\u0015\u0010\u008a\u0001\u001a\u00020\'2\n\u0010\u008b\u0001\u001a\u0005\u0018\u00010\u0089\u0001H\u0014J\u0007\u0010\u008c\u0001\u001a\u00020\u0008R\u000e\u0010\u000b\u001a\u00020\u000cX\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u000eX\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0010X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0012X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u0013\u001a\u00020\u0014X\u0086.\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0015\u0010\u0016\"\u0004\u0008\u0017\u0010\u0018R\u000e\u0010\u0019\u001a\u00020\u001aX\u0082.\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u001b\u001a\u0004\u0018\u00010\u001cX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001d\u001a\u00020\u001eX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001f\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010 \u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010!\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\"\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010#\u001a\u0004\u0018\u00010\u0008X\u0082\u000e\u00a2\u0006\u0004\n\u0002\u0010$R\u0016\u0010%\u001a\n\u0012\u0004\u0012\u00020\'\u0018\u00010&X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010(\u001a\u0004\u0018\u00010)X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010*\u001a\u00020\u0010X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010+\u001a\u00020\u0010X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010,\u001a\u00020-X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010.\u001a\u00020\u0010X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010/\u001a\u00020\u0010X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0016\u00100\u001a\n\u0012\u0004\u0012\u00020\'\u0018\u00010&X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u00101\u001a\u000202X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u00103\u001a\u000204X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001c\u00105\u001a\u0004\u0018\u000106X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u00087\u00108\"\u0004\u00089\u0010:R\u001c\u0010;\u001a\u0004\u0018\u00010<X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008=\u0010>\"\u0004\u0008?\u0010@R\u0011\u0010C\u001a\u00020\u00088F\u00a2\u0006\u0006\u001a\u0004\u0008D\u0010E\u00a8\u0006\u0090\u0001"
    }
    d2 = {
        "Lcom/rajat/pdfviewer/PdfRendererView;",
        "Landroid/widget/FrameLayout;",
        "Landroidx/lifecycle/DefaultLifecycleObserver;",
        "context",
        "Landroid/content/Context;",
        "attrs",
        "Landroid/util/AttributeSet;",
        "defStyleAttr",
        "",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;I)V",
        "pdfRendererCore",
        "Lcom/rajat/pdfviewer/PdfRendererCore;",
        "pdfViewAdapter",
        "Lcom/rajat/pdfviewer/PdfViewAdapter;",
        "pdfRendererCoreInitialised",
        "",
        "cacheStrategy",
        "Lcom/rajat/pdfviewer/util/CacheStrategy;",
        "recyclerView",
        "Lcom/rajat/pdfviewer/PinchZoomRecyclerView;",
        "getRecyclerView",
        "()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;",
        "setRecyclerView",
        "(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)V",
        "pageNo",
        "Landroid/widget/TextView;",
        "divider",
        "Landroid/graphics/drawable/Drawable;",
        "pageMargin",
        "Landroid/graphics/Rect;",
        "positionToUseForState",
        "restoredScrollPosition",
        "restoredScrollOffset",
        "lastDy",
        "pendingJumpPage",
        "Ljava/lang/Integer;",
        "activeDocumentCleanupAction",
        "Lkotlin/Function0;",
        "",
        "observedLifecycle",
        "Landroidx/lifecycle/Lifecycle;",
        "showDivider",
        "isZoomEnabled",
        "maxZoomScale",
        "",
        "enableLoadingForPages",
        "disableScreenshots",
        "postInitializationAction",
        "viewJob",
        "Lkotlinx/coroutines/CompletableJob;",
        "viewScope",
        "Lkotlinx/coroutines/CoroutineScope;",
        "zoomListener",
        "Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;",
        "getZoomListener",
        "()Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;",
        "setZoomListener",
        "(Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;)V",
        "statusListener",
        "Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;",
        "getStatusListener",
        "()Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;",
        "setStatusListener",
        "(Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;)V",
        "isZoomedIn",
        "getZoomScale",
        "totalPageCount",
        "getTotalPageCount",
        "()I",
        "clearCache",
        "(Lcom/rajat/pdfviewer/PdfRendererView;Landroid/content/Context;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "initWithUrl",
        "url",
        "",
        "headers",
        "Lcom/rajat/pdfviewer/HeaderData;",
        "lifecycleCoroutineScope",
        "Landroidx/lifecycle/LifecycleCoroutineScope;",
        "lifecycle",
        "initWithFile",
        "file",
        "Ljava/io/File;",
        "initWithFileInternal",
        "documentCleanupAction",
        "cacheIdentifierOverride",
        "initWithUri",
        "uri",
        "Landroid/net/Uri;",
        "initializeRenderer",
        "renderer",
        "scrollToNextPage",
        "scrollToPreviousPage",
        "jumpToPage",
        "pageNumber",
        "smoothScroll",
        "delayMillis",
        "",
        "forceUpdatePageNumber",
        "captureCurrentScrollState",
        "Lkotlin/Pair;",
        "updatePageNumberDisplay",
        "position",
        "getAttrs",
        "defStyle",
        "setTypeArray",
        "typedArray",
        "Landroid/content/res/TypedArray;",
        "applyScreenshotSecurity",
        "closePdfRender",
        "onDestroy",
        "owner",
        "Landroidx/lifecycle/LifecycleOwner;",
        "registerLifecycleObserver",
        "releaseCurrentDocumentSession",
        "buildDocumentCleanupAction",
        "getBitmapByPage",
        "Landroid/graphics/Bitmap;",
        "page",
        "(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "getLoadedBitmaps",
        "",
        "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "setZoomEnabled",
        "zoomEnabled",
        "setMaxZoomScale",
        "getMaxZoomScale",
        "getZoomEnabled",
        "zoomIn",
        "zoomOut",
        "resetZoom",
        "preloadCacheIntoMemory",
        "canScrollVertically",
        "direction",
        "onDetachedFromWindow",
        "resetViewScope",
        "onSaveInstanceState",
        "Landroid/os/Parcelable;",
        "onRestoreInstanceState",
        "state",
        "getScrollDirection",
        "StatusCallBack",
        "ZoomListener",
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

.field public static final Companion:Lcom/rajat/pdfviewer/PdfRendererView$Companion;

.field private static final DEFAULT_MAX_ZOOM:F = 3.0f

.field private static final KEY_SCROLL_OFFSET:Ljava/lang/String; = "scrollOffset"

.field private static final KEY_SCROLL_POSITION:Ljava/lang/String; = "scrollPosition"

.field private static final MAX_ALLOWED_ZOOM:F = 5.0f


# instance fields
.field private activeDocumentCleanupAction:Lkotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field

.field private cacheStrategy:Lcom/rajat/pdfviewer/util/CacheStrategy;

.field private disableScreenshots:Z

.field private divider:Landroid/graphics/drawable/Drawable;

.field private enableLoadingForPages:Z

.field private isZoomEnabled:Z

.field private lastDy:I

.field private maxZoomScale:F

.field private observedLifecycle:Landroidx/lifecycle/Lifecycle;

.field private pageMargin:Landroid/graphics/Rect;

.field private pageNo:Landroid/widget/TextView;

.field private pdfRendererCore:Lcom/rajat/pdfviewer/PdfRendererCore;

.field private pdfRendererCoreInitialised:Z

.field private pdfViewAdapter:Lcom/rajat/pdfviewer/PdfViewAdapter;

.field private pendingJumpPage:Ljava/lang/Integer;

.field private positionToUseForState:I

.field private postInitializationAction:Lkotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field

.field public recyclerView:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

.field private restoredScrollOffset:I

.field private restoredScrollPosition:I

.field private showDivider:Z

.field private statusListener:Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;

.field private viewJob:Lkotlinx/coroutines/CompletableJob;

.field private viewScope:Lkotlinx/coroutines/CoroutineScope;

.field private zoomListener:Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/rajat/pdfviewer/PdfRendererView$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/rajat/pdfviewer/PdfRendererView$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/rajat/pdfviewer/PdfRendererView;->Companion:Lcom/rajat/pdfviewer/PdfRendererView$Companion;

    const/16 v0, 0x8

    sput v0, Lcom/rajat/pdfviewer/PdfRendererView;->$stable:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v5, 0x6

    const/4 v6, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    .end local p1    # "context":Landroid/content/Context;
    .local v2, "context":Landroid/content/Context;
    invoke-direct/range {v1 .. v6}, Lcom/rajat/pdfviewer/PdfRendererView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 48
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v5, 0x4

    const/4 v6, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "attrs":Landroid/util/AttributeSet;
    .local v2, "context":Landroid/content/Context;
    .local v3, "attrs":Landroid/util/AttributeSet;
    invoke-direct/range {v1 .. v6}, Lcom/rajat/pdfviewer/PdfRendererView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 48
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 48
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 54
    sget-object v0, Lcom/rajat/pdfviewer/util/CacheStrategy;->MAXIMIZE_PERFORMANCE:Lcom/rajat/pdfviewer/util/CacheStrategy;

    iput-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->cacheStrategy:Lcom/rajat/pdfviewer/util/CacheStrategy;

    .line 61
    new-instance v0, Landroid/graphics/Rect;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1, v1, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->pageMargin:Landroid/graphics/Rect;

    .line 65
    const/4 v0, -0x1

    iput v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->positionToUseForState:I

    .line 66
    iput v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->restoredScrollPosition:I

    .line 75
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->showDivider:Z

    .line 76
    iput-boolean v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->isZoomEnabled:Z

    .line 77
    const/high16 v1, 0x40400000    # 3.0f

    iput v1, p0, Lcom/rajat/pdfviewer/PdfRendererView;->maxZoomScale:F

    .line 84
    const/4 v1, 0x0

    invoke-static {v1, v0, v1}, Lkotlinx/coroutines/SupervisorKt;->SupervisorJob$default(Lkotlinx/coroutines/Job;ILjava/lang/Object;)Lkotlinx/coroutines/CompletableJob;

    move-result-object v0

    iput-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->viewJob:Lkotlinx/coroutines/CompletableJob;

    .line 85
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->viewJob:Lkotlinx/coroutines/CompletableJob;

    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v1

    check-cast v1, Lkotlin/coroutines/CoroutineContext;

    invoke-interface {v0, v1}, Lkotlinx/coroutines/CompletableJob;->plus(Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object v0

    invoke-static {v0}, Lkotlinx/coroutines/CoroutineScopeKt;->CoroutineScope(Lkotlin/coroutines/CoroutineContext;)Lkotlinx/coroutines/CoroutineScope;

    move-result-object v0

    iput-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->viewScope:Lkotlinx/coroutines/CoroutineScope;

    .line 109
    nop

    .line 110
    invoke-direct {p0, p2, p3}, Lcom/rajat/pdfviewer/PdfRendererView;->getAttrs(Landroid/util/AttributeSet;I)V

    .line 111
    nop

    .line 46
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 46
    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_0

    .line 47
    const/4 p2, 0x0

    .line 46
    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    .line 47
    const/4 p3, 0x0

    .line 46
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lcom/rajat/pdfviewer/PdfRendererView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 48
    return-void
.end method

.method public static final synthetic access$getBitmapByPage(Lcom/rajat/pdfviewer/PdfRendererView;ILkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfRendererView;
    .param p1, "page"    # I
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;

    .line 46
    invoke-direct {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfRendererView;->getBitmapByPage(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$getCacheStrategy$p(Lcom/rajat/pdfviewer/PdfRendererView;)Lcom/rajat/pdfviewer/util/CacheStrategy;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfRendererView;

    .line 46
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->cacheStrategy:Lcom/rajat/pdfviewer/util/CacheStrategy;

    return-object v0
.end method

.method public static final synthetic access$getPdfRendererCore$p(Lcom/rajat/pdfviewer/PdfRendererView;)Lcom/rajat/pdfviewer/PdfRendererCore;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfRendererView;

    .line 46
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->pdfRendererCore:Lcom/rajat/pdfviewer/PdfRendererCore;

    return-object v0
.end method

.method public static final synthetic access$initializeRenderer(Lcom/rajat/pdfviewer/PdfRendererView;Lcom/rajat/pdfviewer/PdfRendererCore;Lkotlin/jvm/functions/Function0;)V
    .locals 0
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfRendererView;
    .param p1, "renderer"    # Lcom/rajat/pdfviewer/PdfRendererCore;
    .param p2, "documentCleanupAction"    # Lkotlin/jvm/functions/Function0;

    .line 46
    invoke-direct {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfRendererView;->initializeRenderer(Lcom/rajat/pdfviewer/PdfRendererCore;Lkotlin/jvm/functions/Function0;)V

    return-void
.end method

.method private final applyScreenshotSecurity()V
    .locals 2

    .line 491
    iget-boolean v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->disableScreenshots:Z

    if-eqz v0, :cond_1

    .line 493
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getContext()Landroid/content/Context;

    move-result-object v0

    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/app/Activity;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_1

    const/16 v1, 0x2000

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 495
    :cond_1
    return-void
.end method

.method private final buildDocumentCleanupAction(Ljava/io/File;Lcom/rajat/pdfviewer/util/CacheStrategy;)Lkotlin/jvm/functions/Function0;
    .locals 4
    .param p1, "file"    # Ljava/io/File;
    .param p2, "cacheStrategy"    # Lcom/rajat/pdfviewer/util/CacheStrategy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Lcom/rajat/pdfviewer/util/CacheStrategy;",
            ")",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .line 535
    sget-object v0, Lcom/rajat/pdfviewer/util/CachePolicy;->Companion:Lcom/rajat/pdfviewer/util/CachePolicy$Companion;

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-static {v0, p2, v1, v2, v3}, Lcom/rajat/pdfviewer/util/CachePolicy$Companion;->from$default(Lcom/rajat/pdfviewer/util/CachePolicy$Companion;Lcom/rajat/pdfviewer/util/CacheStrategy;IILjava/lang/Object;)Lcom/rajat/pdfviewer/util/CachePolicy;

    move-result-object v0

    .line 536
    .local v0, "cachePolicy":Lcom/rajat/pdfviewer/util/CachePolicy;
    invoke-virtual {v0}, Lcom/rajat/pdfviewer/util/CachePolicy;->getPersistRemoteFile()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 537
    return-object v3

    .line 539
    :cond_0
    new-instance v1, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda11;

    invoke-direct {v1, p1}, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda11;-><init>(Ljava/io/File;)V

    return-object v1
.end method

.method static final buildDocumentCleanupAction$lambda$22(Ljava/io/File;)Lkotlin/Unit;
    .locals 1
    .param p0, "$file"    # Ljava/io/File;

    .line 540
    sget-object v0, Lcom/rajat/pdfviewer/util/CacheHelper;->INSTANCE:Lcom/rajat/pdfviewer/util/CacheHelper;

    invoke-virtual {v0, p0}, Lcom/rajat/pdfviewer/util/CacheHelper;->cleanupTransientDocument$pdfViewer_release(Ljava/io/File;)V

    .line 541
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private final captureCurrentScrollState()Lkotlin/Pair;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 428
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->recyclerView:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 429
    :cond_0
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    instance-of v2, v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    if-eqz v2, :cond_1

    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    goto :goto_0

    :cond_1
    move-object v0, v1

    :goto_0
    if-nez v0, :cond_2

    return-object v1

    .line 430
    .local v0, "layoutManager":Landroidx/recyclerview/widget/LinearLayoutManager;
    :cond_2
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v2

    .line 431
    .local v2, "firstVisiblePosition":I
    const/4 v3, -0x1

    if-ne v2, v3, :cond_3

    return-object v1

    .line 432
    :cond_3
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v3

    if-nez v3, :cond_4

    return-object v1

    .line 433
    .local v3, "firstVisibleView":Landroid/view/View;
    :cond_4
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;->getDecoratedTop(Landroid/view/View;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v1, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    return-object v1
.end method

.method private final forceUpdatePageNumber()V
    .locals 12

    .line 414
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    const-string/jumbo v1, "null cannot be cast to non-null type androidx.recyclerview.widget.LinearLayoutManager"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 415
    .local v0, "layoutManager":Landroidx/recyclerview/widget/LinearLayoutManager;
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v1

    .line 416
    .local v1, "firstVisiblePosition":I
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstCompletelyVisibleItemPosition()I

    move-result v2

    .line 417
    .local v2, "firstCompletelyVisiblePosition":I
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    move-result v3

    .line 418
    .local v3, "lastVisiblePosition":I
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I

    move-result v4

    .line 419
    .local v4, "lastCompletelyVisiblePosition":I
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object v6, v5

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    move-result v6

    .line 708
    .local v6, "it":I
    const/4 v7, 0x0

    .line 419
    .local v7, "$i$a$-takeIf-PdfRendererView$forceUpdatePageNumber$positionToUse$1":I
    const/4 v8, 0x1

    const/4 v9, 0x0

    const/4 v10, -0x1

    if-eq v6, v10, :cond_0

    move v6, v8

    goto :goto_0

    :cond_0
    move v6, v9

    .end local v6    # "it":I
    .end local v7    # "$i$a$-takeIf-PdfRendererView$forceUpdatePageNumber$positionToUse$1":I
    :goto_0
    const/4 v7, 0x0

    if-eqz v6, :cond_1

    goto :goto_1

    :cond_1
    move-object v5, v7

    :goto_1
    if-eqz v5, :cond_2

    :goto_2
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    goto :goto_6

    .line 420
    :cond_2
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object v6, v5

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    move-result v6

    .line 708
    .restart local v6    # "it":I
    const/4 v11, 0x0

    .line 420
    .local v11, "$i$a$-takeIf-PdfRendererView$forceUpdatePageNumber$positionToUse$2":I
    if-eq v6, v10, :cond_3

    move v6, v8

    goto :goto_3

    :cond_3
    move v6, v9

    .end local v6    # "it":I
    .end local v11    # "$i$a$-takeIf-PdfRendererView$forceUpdatePageNumber$positionToUse$2":I
    :goto_3
    if-eqz v6, :cond_4

    goto :goto_4

    :cond_4
    move-object v5, v7

    .line 419
    :goto_4
    if-eqz v5, :cond_5

    goto :goto_2

    .line 421
    :cond_5
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object v6, v5

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    move-result v6

    .line 708
    .restart local v6    # "it":I
    const/4 v11, 0x0

    .line 421
    .local v11, "$i$a$-takeIf-PdfRendererView$forceUpdatePageNumber$positionToUse$3":I
    if-eq v6, v10, :cond_6

    goto :goto_5

    :cond_6
    move v8, v9

    .end local v6    # "it":I
    .end local v11    # "$i$a$-takeIf-PdfRendererView$forceUpdatePageNumber$positionToUse$3":I
    :goto_5
    if-eqz v8, :cond_7

    move-object v7, v5

    .line 419
    :cond_7
    if-eqz v7, :cond_8

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v5

    goto :goto_6

    .line 422
    :cond_8
    move v5, v1

    .line 419
    :goto_6
    nop

    .line 423
    .local v5, "positionToUse":I
    iput v5, p0, Lcom/rajat/pdfviewer/PdfRendererView;->positionToUseForState:I

    .line 424
    invoke-direct {p0, v5}, Lcom/rajat/pdfviewer/PdfRendererView;->updatePageNumberDisplay(I)V

    .line 425
    return-void
.end method

.method private final getAttrs(Landroid/util/AttributeSet;I)V
    .locals 3
    .param p1, "attrs"    # Landroid/util/AttributeSet;
    .param p2, "defStyle"    # I

    .line 449
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView:[I

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, p2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    const-string/jumbo v1, "obtainStyledAttributes(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 448
    nop

    .line 450
    .local v0, "typedArray":Landroid/content/res/TypedArray;
    invoke-direct {p0, v0}, Lcom/rajat/pdfviewer/PdfRendererView;->setTypeArray(Landroid/content/res/TypedArray;)V

    .line 451
    return-void
.end method

.method private final getBitmapByPage(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 1
    .param p1, "page"    # I
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

    .line 545
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->pdfRendererCore:Lcom/rajat/pdfviewer/PdfRendererCore;

    if-nez v0, :cond_0

    const-string/jumbo v0, "pdfRendererCore"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v0, 0x0

    :cond_0
    invoke-virtual {v0, p1, p2}, Lcom/rajat/pdfviewer/PdfRendererCore;->getBitmapFromCache(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static synthetic initWithFile$default(Lcom/rajat/pdfviewer/PdfRendererView;Ljava/io/File;Lcom/rajat/pdfviewer/util/CacheStrategy;ILjava/lang/Object;)V
    .locals 0

    .line 166
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    sget-object p2, Lcom/rajat/pdfviewer/util/CacheStrategy;->MAXIMIZE_PERFORMANCE:Lcom/rajat/pdfviewer/util/CacheStrategy;

    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfRendererView;->initWithFile(Ljava/io/File;Lcom/rajat/pdfviewer/util/CacheStrategy;)V

    return-void
.end method

.method private final initWithFileInternal(Ljava/io/File;Lcom/rajat/pdfviewer/util/CacheStrategy;Lkotlin/jvm/functions/Function0;Ljava/lang/String;)V
    .locals 11
    .param p1, "file"    # Ljava/io/File;
    .param p2, "cacheStrategy"    # Lcom/rajat/pdfviewer/util/CacheStrategy;
    .param p3, "documentCleanupAction"    # Lkotlin/jvm/functions/Function0;
    .param p4, "cacheIdentifierOverride"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Lcom/rajat/pdfviewer/util/CacheStrategy;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 176
    iput-object p2, p0, Lcom/rajat/pdfviewer/PdfRendererView;->cacheStrategy:Lcom/rajat/pdfviewer/util/CacheStrategy;

    .line 177
    if-nez p4, :cond_0

    sget-object v0, Lcom/rajat/pdfviewer/util/CacheHelper;->INSTANCE:Lcom/rajat/pdfviewer/util/CacheHelper;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    const-string v2, "getAbsolutePath(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/rajat/pdfviewer/util/CacheHelper;->getCacheKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object v0, p4

    :goto_0
    move-object v4, v0

    .line 180
    .local v4, "cacheIdentifier":Ljava/lang/String;
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->statusListener:Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;->onPdfRenderStart()V

    .line 181
    :cond_1
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->viewScope:Lkotlinx/coroutines/CoroutineScope;

    new-instance v1, Lcom/rajat/pdfviewer/PdfRendererView$initWithFileInternal$1;

    const/4 v7, 0x0

    move-object v3, p0

    move-object v2, p1

    move-object v5, p2

    move-object v6, p3

    .end local p1    # "file":Ljava/io/File;
    .end local p2    # "cacheStrategy":Lcom/rajat/pdfviewer/util/CacheStrategy;
    .end local p3    # "documentCleanupAction":Lkotlin/jvm/functions/Function0;
    .local v2, "file":Ljava/io/File;
    .local v5, "cacheStrategy":Lcom/rajat/pdfviewer/util/CacheStrategy;
    .local v6, "documentCleanupAction":Lkotlin/jvm/functions/Function0;
    invoke-direct/range {v1 .. v7}, Lcom/rajat/pdfviewer/PdfRendererView$initWithFileInternal$1;-><init>(Ljava/io/File;Lcom/rajat/pdfviewer/PdfRendererView;Ljava/lang/String;Lcom/rajat/pdfviewer/util/CacheStrategy;Lkotlin/jvm/functions/Function0;Lkotlin/coroutines/Continuation;)V

    move-object p1, v5

    move-object p2, v6

    .end local v5    # "cacheStrategy":Lcom/rajat/pdfviewer/util/CacheStrategy;
    .end local v6    # "documentCleanupAction":Lkotlin/jvm/functions/Function0;
    .local p1, "cacheStrategy":Lcom/rajat/pdfviewer/util/CacheStrategy;
    .local p2, "documentCleanupAction":Lkotlin/jvm/functions/Function0;
    move-object v8, v1

    check-cast v8, Lkotlin/jvm/functions/Function2;

    const/4 v9, 0x3

    const/4 v10, 0x0

    const/4 v6, 0x0

    move-object v5, v0

    invoke-static/range {v5 .. v10}, Lkotlinx/coroutines/BuildersKt;->launch$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    .line 200
    return-void
.end method

.method public static synthetic initWithUrl$default(Lcom/rajat/pdfviewer/PdfRendererView;Ljava/lang/String;Lcom/rajat/pdfviewer/HeaderData;Landroidx/lifecycle/LifecycleCoroutineScope;Landroidx/lifecycle/Lifecycle;Lcom/rajat/pdfviewer/util/CacheStrategy;ILjava/lang/Object;)V
    .locals 7

    .line 122
    and-int/lit8 p7, p6, 0x2

    if-eqz p7, :cond_0

    .line 124
    new-instance p2, Lcom/rajat/pdfviewer/HeaderData;

    const/4 p7, 0x1

    const/4 v0, 0x0

    invoke-direct {p2, v0, p7, v0}, Lcom/rajat/pdfviewer/HeaderData;-><init>(Ljava/util/Map;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    move-object v3, p2

    goto :goto_0

    .line 122
    :cond_0
    move-object v3, p2

    :goto_0
    and-int/lit8 p2, p6, 0x10

    if-eqz p2, :cond_1

    .line 127
    sget-object p5, Lcom/rajat/pdfviewer/util/CacheStrategy;->MAXIMIZE_PERFORMANCE:Lcom/rajat/pdfviewer/util/CacheStrategy;

    move-object v6, p5

    goto :goto_1

    .line 122
    :cond_1
    move-object v6, p5

    :goto_1
    move-object v1, p0

    move-object v2, p1

    move-object v4, p3

    move-object v5, p4

    invoke-virtual/range {v1 .. v6}, Lcom/rajat/pdfviewer/PdfRendererView;->initWithUrl(Ljava/lang/String;Lcom/rajat/pdfviewer/HeaderData;Landroidx/lifecycle/LifecycleCoroutineScope;Landroidx/lifecycle/Lifecycle;Lcom/rajat/pdfviewer/util/CacheStrategy;)V

    return-void
.end method

.method static final initWithUrl$lambda$0(Lcom/rajat/pdfviewer/PdfRendererView;)Lkotlin/Unit;
    .locals 1
    .param p0, "this$0"    # Lcom/rajat/pdfviewer/PdfRendererView;

    .line 143
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->statusListener:Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;->onPdfLoadStart()V

    :cond_0
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final initWithUrl$lambda$1(Lcom/rajat/pdfviewer/PdfRendererView;IJJ)Lkotlin/Unit;
    .locals 2
    .param p0, "this$0"    # Lcom/rajat/pdfviewer/PdfRendererView;
    .param p1, "progress"    # I
    .param p2, "current"    # J
    .param p4, "total"    # J

    .line 145
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->statusListener:Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;

    if-eqz v0, :cond_0

    invoke-static {p4, p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, p1, p2, p3, v1}, Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;->onPdfLoadProgress(IJLjava/lang/Long;)V

    .line 146
    :cond_0
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final initWithUrl$lambda$2(Lcom/rajat/pdfviewer/PdfRendererView;Lcom/rajat/pdfviewer/util/CacheStrategy;Ljava/lang/String;Ljava/io/File;)Lkotlin/Unit;
    .locals 2
    .param p0, "this$0"    # Lcom/rajat/pdfviewer/PdfRendererView;
    .param p1, "$cacheStrategy"    # Lcom/rajat/pdfviewer/util/CacheStrategy;
    .param p2, "$remoteDocumentCacheKey"    # Ljava/lang/String;
    .param p3, "it"    # Ljava/io/File;

    const-string v0, "it"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 148
    invoke-direct {p0, p3, p1}, Lcom/rajat/pdfviewer/PdfRendererView;->buildDocumentCleanupAction(Ljava/io/File;Lcom/rajat/pdfviewer/util/CacheStrategy;)Lkotlin/jvm/functions/Function0;

    move-result-object v0

    .line 149
    .local v0, "documentCleanupAction":Lkotlin/jvm/functions/Function0;
    nop

    .line 150
    nop

    .line 151
    nop

    .line 152
    nop

    .line 153
    nop

    .line 149
    invoke-direct {p0, p3, p1, v0, p2}, Lcom/rajat/pdfviewer/PdfRendererView;->initWithFileInternal(Ljava/io/File;Lcom/rajat/pdfviewer/util/CacheStrategy;Lkotlin/jvm/functions/Function0;Ljava/lang/String;)V

    .line 155
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v1
.end method

.method static final initWithUrl$lambda$3(Lcom/rajat/pdfviewer/PdfRendererView;Ljava/lang/Throwable;)Lkotlin/Unit;
    .locals 1
    .param p0, "this$0"    # Lcom/rajat/pdfviewer/PdfRendererView;
    .param p1, "it"    # Ljava/lang/Throwable;

    const-string v0, "it"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 156
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->statusListener:Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;->onError(Ljava/lang/Throwable;)V

    :cond_0
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private final initializeRenderer(Lcom/rajat/pdfviewer/PdfRendererCore;Lkotlin/jvm/functions/Function0;)V
    .locals 10
    .param p1, "renderer"    # Lcom/rajat/pdfviewer/PdfRendererCore;
    .param p2, "documentCleanupAction"    # Lkotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/rajat/pdfviewer/PdfRendererCore;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 238
    iget-boolean v1, p0, Lcom/rajat/pdfviewer/PdfRendererView;->pdfRendererCoreInitialised:Z

    const/4 v7, 0x0

    if-eqz v1, :cond_0

    .line 239
    invoke-direct {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->releaseCurrentDocumentSession()V

    .line 240
    invoke-direct {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->resetViewScope()V

    .line 241
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->removeAllViews()V

    .line 242
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererView;->recyclerView:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    if-eqz v1, :cond_0

    .line 243
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v1

    invoke-virtual {v1, v7}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 247
    :cond_0
    sget-object v1, Lcom/rajat/pdfviewer/PdfRendererCore;->Companion:Lcom/rajat/pdfviewer/PdfRendererCore$Companion;

    const/4 v6, 0x1

    invoke-virtual {v1, v6}, Lcom/rajat/pdfviewer/PdfRendererCore$Companion;->setEnableDebugMetrics(Z)V

    .line 248
    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfRendererView;->pdfRendererCore:Lcom/rajat/pdfviewer/PdfRendererCore;

    .line 249
    iput-boolean v6, p0, Lcom/rajat/pdfviewer/PdfRendererView;->pdfRendererCoreInitialised:Z

    .line 250
    iput-object p2, p0, Lcom/rajat/pdfviewer/PdfRendererView;->activeDocumentCleanupAction:Lkotlin/jvm/functions/Function0;

    .line 253
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/rajat/pdfviewer/R$layout;->pdf_rendererview:I

    move-object v3, p0

    check-cast v3, Landroid/view/ViewGroup;

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v8

    .line 254
    .local v8, "v":Landroid/view/View;
    invoke-virtual {p0, v8}, Lcom/rajat/pdfviewer/PdfRendererView;->addView(Landroid/view/View;)V

    .line 257
    sget v1, Lcom/rajat/pdfviewer/R$id;->recyclerView:I

    invoke-virtual {p0, v1}, Lcom/rajat/pdfviewer/PdfRendererView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    invoke-virtual {p0, v1}, Lcom/rajat/pdfviewer/PdfRendererView;->setRecyclerView(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)V

    .line 258
    sget v1, Lcom/rajat/pdfviewer/R$id;->pageNumber:I

    invoke-virtual {p0, v1}, Lcom/rajat/pdfviewer/PdfRendererView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererView;->pageNo:Landroid/widget/TextView;

    .line 261
    new-instance v1, Lcom/rajat/pdfviewer/PdfViewAdapter;

    .line 262
    move-object v2, v1

    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v3, "getContext(...)"

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 263
    iget-object v3, p0, Lcom/rajat/pdfviewer/PdfRendererView;->pdfRendererCore:Lcom/rajat/pdfviewer/PdfRendererCore;

    if-nez v3, :cond_1

    const-string/jumbo v3, "pdfRendererCore"

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v3, v7

    .line 264
    :cond_1
    nop

    .line 265
    iget-object v4, p0, Lcom/rajat/pdfviewer/PdfRendererView;->pageMargin:Landroid/graphics/Rect;

    .line 266
    iget-boolean v5, p0, Lcom/rajat/pdfviewer/PdfRendererView;->enableLoadingForPages:Z

    .line 261
    move-object v0, v2

    move-object v2, v3

    move-object v3, p0

    invoke-direct/range {v0 .. v5}, Lcom/rajat/pdfviewer/PdfViewAdapter;-><init>(Landroid/content/Context;Lcom/rajat/pdfviewer/PdfRendererCore;Lcom/rajat/pdfviewer/PdfRendererView;Landroid/graphics/Rect;Z)V

    move-object v2, v0

    iput-object v2, p0, Lcom/rajat/pdfviewer/PdfRendererView;->pdfViewAdapter:Lcom/rajat/pdfviewer/PdfViewAdapter;

    .line 269
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v1

    .local v1, "$this$initializeRenderer_u24lambda_u247":Lcom/rajat/pdfviewer/PinchZoomRecyclerView;
    const/4 v2, 0x0

    .line 270
    .local v2, "$i$a$-apply-PdfRendererView$initializeRenderer$1":I
    iget-object v3, p0, Lcom/rajat/pdfviewer/PdfRendererView;->pdfViewAdapter:Lcom/rajat/pdfviewer/PdfViewAdapter;

    if-nez v3, :cond_2

    const-string/jumbo v3, "pdfViewAdapter"

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v3, v7

    :cond_2
    check-cast v3, Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {v1, v3}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 271
    new-instance v3, Landroidx/recyclerview/widget/DefaultItemAnimator;

    invoke-direct {v3}, Landroidx/recyclerview/widget/DefaultItemAnimator;-><init>()V

    check-cast v3, Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;

    invoke-virtual {v1, v3}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;)V

    .line 272
    iget-boolean v3, p0, Lcom/rajat/pdfviewer/PdfRendererView;->showDivider:Z

    if-eqz v3, :cond_4

    .line 273
    new-instance v3, Landroidx/recyclerview/widget/DividerItemDecoration;

    invoke-virtual {v1}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4, v6}, Landroidx/recyclerview/widget/DividerItemDecoration;-><init>(Landroid/content/Context;I)V

    move-object v4, v3

    .local v4, "$this$initializeRenderer_u24lambda_u247_u24lambda_u245":Landroidx/recyclerview/widget/DividerItemDecoration;
    const/4 v5, 0x0

    .line 274
    .local v5, "$i$a$-apply-PdfRendererView$initializeRenderer$1$1":I
    iget-object v6, p0, Lcom/rajat/pdfviewer/PdfRendererView;->divider:Landroid/graphics/drawable/Drawable;

    if-eqz v6, :cond_3

    .line 708
    .local v6, "it":Landroid/graphics/drawable/Drawable;
    const/4 v9, 0x0

    .line 274
    .local v9, "$i$a$-let-PdfRendererView$initializeRenderer$1$1$1":I
    invoke-virtual {v4, v6}, Landroidx/recyclerview/widget/DividerItemDecoration;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 275
    .end local v6    # "it":Landroid/graphics/drawable/Drawable;
    .end local v9    # "$i$a$-let-PdfRendererView$initializeRenderer$1$1$1":I
    :cond_3
    nop

    .line 273
    .end local v4    # "$this$initializeRenderer_u24lambda_u247_u24lambda_u245":Landroidx/recyclerview/widget/DividerItemDecoration;
    .end local v5    # "$i$a$-apply-PdfRendererView$initializeRenderer$1$1":I
    nop

    .line 275
    nop

    .line 708
    .local v3, "it":Landroidx/recyclerview/widget/DividerItemDecoration;
    const/4 v4, 0x0

    .line 275
    .local v4, "$i$a$-let-PdfRendererView$initializeRenderer$1$2":I
    move-object v5, v3

    check-cast v5, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;

    invoke-virtual {v1, v5}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    .line 277
    .end local v3    # "it":Landroidx/recyclerview/widget/DividerItemDecoration;
    .end local v4    # "$i$a$-let-PdfRendererView$initializeRenderer$1$2":I
    :cond_4
    iget-boolean v3, p0, Lcom/rajat/pdfviewer/PdfRendererView;->isZoomEnabled:Z

    invoke-virtual {v1, v3}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->setZoomEnabled(Z)V

    .line 278
    iget v3, p0, Lcom/rajat/pdfviewer/PdfRendererView;->maxZoomScale:F

    invoke-virtual {v1, v3}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->setMaxZoomScale(F)V

    .line 279
    nop

    .line 269
    .end local v1    # "$this$initializeRenderer_u24lambda_u247":Lcom/rajat/pdfviewer/PinchZoomRecyclerView;
    .end local v2    # "$i$a$-apply-PdfRendererView$initializeRenderer$1":I
    nop

    .line 281
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v1

    .line 282
    new-instance v2, Lcom/rajat/pdfviewer/PdfPageScrollListener;

    .line 283
    iget-object v3, p0, Lcom/rajat/pdfviewer/PdfRendererView;->pageNo:Landroid/widget/TextView;

    if-nez v3, :cond_5

    const-string/jumbo v3, "pageNo"

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v3, v7

    .line 281
    :cond_5
    new-instance v4, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda1;

    invoke-direct {v4, p0}, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda1;-><init>(Lcom/rajat/pdfviewer/PdfRendererView;)V

    new-instance v5, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda2;

    invoke-direct {v5, p0}, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda2;-><init>(Lcom/rajat/pdfviewer/PdfRendererView;)V

    new-instance v6, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda3;

    invoke-direct {v6, p0}, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda3;-><init>(Lcom/rajat/pdfviewer/PdfRendererView;)V

    .line 282
    invoke-direct {v2, v3, v4, v5, v6}, Lcom/rajat/pdfviewer/PdfPageScrollListener;-><init>(Landroid/widget/TextView;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    check-cast v2, Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;

    .line 281
    invoke-virtual {v1, v2}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;)V

    .line 292
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v1

    new-instance v2, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda4;

    invoke-direct {v2, p0}, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda4;-><init>(Lcom/rajat/pdfviewer/PdfRendererView;)V

    .line 301
    nop

    .line 292
    const-wide/16 v3, 0x1f4

    invoke-virtual {v1, v2, v3, v4}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 303
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v1

    new-instance v2, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda5;

    invoke-direct {v2, p0}, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda5;-><init>(Lcom/rajat/pdfviewer/PdfRendererView;)V

    invoke-virtual {v1, v2}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->setOnZoomChangeListener(Lkotlin/jvm/functions/Function2;)V

    .line 307
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v1

    new-instance v2, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda6;

    invoke-direct {v2, p0}, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda6;-><init>(Lcom/rajat/pdfviewer/PdfRendererView;)V

    invoke-virtual {v1, v2}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->post(Ljava/lang/Runnable;)Z

    .line 313
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererView;->pendingJumpPage:Ljava/lang/Integer;

    if-eqz v1, :cond_6

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    .local v1, "page":I
    const/4 v9, 0x0

    .line 314
    .local v9, "$i$a$-let-PdfRendererView$initializeRenderer$8":I
    const/4 v5, 0x6

    const/4 v6, 0x0

    const/4 v2, 0x0

    const-wide/16 v3, 0x0

    move-object v0, p0

    invoke-static/range {v0 .. v6}, Lcom/rajat/pdfviewer/PdfRendererView;->jumpToPage$default(Lcom/rajat/pdfviewer/PdfRendererView;IZJILjava/lang/Object;)V

    .line 315
    iput-object v7, p0, Lcom/rajat/pdfviewer/PdfRendererView;->pendingJumpPage:Ljava/lang/Integer;

    .line 316
    nop

    .line 313
    .end local v1    # "page":I
    .end local v9    # "$i$a$-let-PdfRendererView$initializeRenderer$8":I
    nop

    .line 319
    :cond_6
    invoke-direct {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->preloadCacheIntoMemory()V

    .line 320
    return-void
.end method

.method static final initializeRenderer$lambda$10(Lcom/rajat/pdfviewer/PdfRendererView;I)Lkotlin/Unit;
    .locals 4
    .param p0, "this$0"    # Lcom/rajat/pdfviewer/PdfRendererView;
    .param p1, "page"    # I

    .line 287
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->pdfRendererCore:Lcom/rajat/pdfviewer/PdfRendererCore;

    if-nez v0, :cond_0

    const-string/jumbo v0, "pdfRendererCore"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v0, 0x0

    :cond_0
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getHeight()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v0, p1, v1, v2, v3}, Lcom/rajat/pdfviewer/PdfRendererCore;->schedulePrefetch(IIII)V

    .line 288
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final initializeRenderer$lambda$11(Lcom/rajat/pdfviewer/PdfRendererView;)V
    .locals 4
    .param p0, "this$0"    # Lcom/rajat/pdfviewer/PdfRendererView;

    .line 293
    iget v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->restoredScrollPosition:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    .line 294
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    instance-of v2, v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    if-eqz v2, :cond_0

    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    .line 295
    iget v2, p0, Lcom/rajat/pdfviewer/PdfRendererView;->restoredScrollPosition:I

    .line 296
    iget v3, p0, Lcom/rajat/pdfviewer/PdfRendererView;->restoredScrollOffset:I

    .line 294
    invoke-virtual {v0, v2, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    .line 298
    :cond_1
    iput v1, p0, Lcom/rajat/pdfviewer/PdfRendererView;->restoredScrollPosition:I

    .line 299
    const/4 v0, 0x0

    iput v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->restoredScrollOffset:I

    .line 301
    :cond_2
    return-void
.end method

.method static final initializeRenderer$lambda$12(Lcom/rajat/pdfviewer/PdfRendererView;ZF)Lkotlin/Unit;
    .locals 1
    .param p0, "this$0"    # Lcom/rajat/pdfviewer/PdfRendererView;
    .param p1, "isZoomedIn"    # Z
    .param p2, "scale"    # F

    .line 304
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->zoomListener:Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1, p2}, Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;->onZoomChanged(ZF)V

    .line 305
    :cond_0
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final initializeRenderer$lambda$13(Lcom/rajat/pdfviewer/PdfRendererView;)V
    .locals 1
    .param p0, "this$0"    # Lcom/rajat/pdfviewer/PdfRendererView;

    .line 308
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->postInitializationAction:Lkotlin/jvm/functions/Function0;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 309
    :cond_0
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->statusListener:Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;->onPdfRenderSuccess()V

    .line 310
    :cond_1
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->postInitializationAction:Lkotlin/jvm/functions/Function0;

    .line 311
    return-void
.end method

.method static final initializeRenderer$lambda$8(Lcom/rajat/pdfviewer/PdfRendererView;)I
    .locals 1
    .param p0, "this$0"    # Lcom/rajat/pdfviewer/PdfRendererView;

    .line 284
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getTotalPageCount()I

    move-result v0

    return v0
.end method

.method static final initializeRenderer$lambda$9(Lcom/rajat/pdfviewer/PdfRendererView;I)Lkotlin/Unit;
    .locals 1
    .param p0, "this$0"    # Lcom/rajat/pdfviewer/PdfRendererView;
    .param p1, "it"    # I

    .line 285
    invoke-direct {p0, p1}, Lcom/rajat/pdfviewer/PdfRendererView;->updatePageNumberDisplay(I)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public static synthetic jumpToPage$default(Lcom/rajat/pdfviewer/PdfRendererView;IZJILjava/lang/Object;)V
    .locals 0

    .line 389
    and-int/lit8 p6, p5, 0x2

    if-eqz p6, :cond_0

    const/4 p2, 0x1

    :cond_0
    and-int/lit8 p5, p5, 0x4

    if-eqz p5, :cond_1

    const-wide/16 p3, 0x96

    :cond_1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/rajat/pdfviewer/PdfRendererView;->jumpToPage(IZJ)V

    return-void
.end method

.method static final jumpToPage$lambda$16(Lcom/rajat/pdfviewer/PdfRendererView;ZI)V
    .locals 4
    .param p0, "this$0"    # Lcom/rajat/pdfviewer/PdfRendererView;
    .param p1, "$smoothScroll"    # Z
    .param p2, "$pageNumber"    # I

    .line 397
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    instance-of v1, v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    if-eqz v1, :cond_0

    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    return-void

    .line 398
    .local v0, "layoutManager":Landroidx/recyclerview/widget/LinearLayoutManager;
    :cond_1
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v1

    if-nez v1, :cond_2

    return-void

    .line 399
    .local v1, "adapter":Landroidx/recyclerview/widget/RecyclerView$Adapter;
    :cond_2
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v2

    if-nez v2, :cond_3

    return-void

    .line 401
    :cond_3
    if-eqz p1, :cond_4

    .line 402
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v2

    check-cast v2, Landroidx/recyclerview/widget/RecyclerView;

    new-instance v3, Landroidx/recyclerview/widget/RecyclerView$State;

    invoke-direct {v3}, Landroidx/recyclerview/widget/RecyclerView$State;-><init>()V

    invoke-virtual {v0, v2, v3, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->smoothScrollToPosition(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;I)V

    goto :goto_1

    .line 404
    :cond_4
    const/4 v2, 0x0

    invoke-virtual {v0, p2, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    .line 407
    :goto_1
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v2

    new-instance v3, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0}, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda0;-><init>(Lcom/rajat/pdfviewer/PdfRendererView;)V

    invoke-virtual {v2, v3}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->post(Ljava/lang/Runnable;)Z

    .line 410
    return-void
.end method

.method static final jumpToPage$lambda$16$lambda$15(Lcom/rajat/pdfviewer/PdfRendererView;)V
    .locals 0
    .param p0, "this$0"    # Lcom/rajat/pdfviewer/PdfRendererView;

    .line 408
    invoke-direct {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->forceUpdatePageNumber()V

    .line 409
    return-void
.end method

.method private final preloadCacheIntoMemory()V
    .locals 6

    .line 613
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->viewScope:Lkotlinx/coroutines/CoroutineScope;

    new-instance v1, Lcom/rajat/pdfviewer/PdfRendererView$preloadCacheIntoMemory$1;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/rajat/pdfviewer/PdfRendererView$preloadCacheIntoMemory$1;-><init>(Lcom/rajat/pdfviewer/PdfRendererView;Lkotlin/coroutines/Continuation;)V

    move-object v3, v1

    check-cast v3, Lkotlin/jvm/functions/Function2;

    const/4 v4, 0x3

    const/4 v5, 0x0

    const/4 v1, 0x0

    invoke-static/range {v0 .. v5}, Lkotlinx/coroutines/BuildersKt;->launch$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    .line 620
    return-void
.end method

.method private final registerLifecycleObserver(Landroidx/lifecycle/Lifecycle;)V
    .locals 2
    .param p1, "lifecycle"    # Landroidx/lifecycle/Lifecycle;

    .line 514
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->observedLifecycle:Landroidx/lifecycle/Lifecycle;

    if-ne v0, p1, :cond_0

    return-void

    .line 515
    :cond_0
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->observedLifecycle:Landroidx/lifecycle/Lifecycle;

    if-eqz v0, :cond_1

    move-object v1, p0

    check-cast v1, Landroidx/lifecycle/LifecycleObserver;

    invoke-virtual {v0, v1}, Landroidx/lifecycle/Lifecycle;->removeObserver(Landroidx/lifecycle/LifecycleObserver;)V

    .line 516
    :cond_1
    move-object v0, p0

    check-cast v0, Landroidx/lifecycle/LifecycleObserver;

    invoke-virtual {p1, v0}, Landroidx/lifecycle/Lifecycle;->addObserver(Landroidx/lifecycle/LifecycleObserver;)V

    .line 517
    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfRendererView;->observedLifecycle:Landroidx/lifecycle/Lifecycle;

    .line 518
    return-void
.end method

.method private final releaseCurrentDocumentSession()V
    .locals 4

    .line 521
    iget-boolean v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->pdfRendererCoreInitialised:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 522
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->pdfRendererCore:Lcom/rajat/pdfviewer/PdfRendererCore;

    if-nez v0, :cond_0

    const-string/jumbo v0, "pdfRendererCore"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_0
    invoke-virtual {v0}, Lcom/rajat/pdfviewer/PdfRendererCore;->closePdfRender()V

    .line 523
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->pdfRendererCoreInitialised:Z

    .line 525
    :cond_1
    :try_start_0
    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    move-object v0, p0

    check-cast v0, Lcom/rajat/pdfviewer/PdfRendererView;

    .local v0, "$this$releaseCurrentDocumentSession_u24lambda_u2421":Lcom/rajat/pdfviewer/PdfRendererView;
    const/4 v2, 0x0

    .line 526
    .local v2, "$i$a$-runCatching-PdfRendererView$releaseCurrentDocumentSession$1":I
    iget-object v3, v0, Lcom/rajat/pdfviewer/PdfRendererView;->activeDocumentCleanupAction:Lkotlin/jvm/functions/Function0;

    if-eqz v3, :cond_2

    invoke-interface {v3}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    sget-object v3, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    goto :goto_0

    :cond_2
    move-object v3, v1

    .line 525
    .end local v0    # "$this$releaseCurrentDocumentSession_u24lambda_u2421":Lcom/rajat/pdfviewer/PdfRendererView;
    .end local v2    # "$i$a$-runCatching-PdfRendererView$releaseCurrentDocumentSession$1":I
    :goto_0
    invoke-static {v3}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    sget-object v2, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {v0}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 528
    :goto_1
    iput-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererView;->activeDocumentCleanupAction:Lkotlin/jvm/functions/Function0;

    .line 529
    return-void
.end method

.method private final resetViewScope()V
    .locals 3

    .line 637
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->viewJob:Lkotlinx/coroutines/CompletableJob;

    check-cast v0, Lkotlinx/coroutines/Job;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {v0, v1, v2, v1}, Lkotlinx/coroutines/Job$DefaultImpls;->cancel$default(Lkotlinx/coroutines/Job;Ljava/util/concurrent/CancellationException;ILjava/lang/Object;)V

    .line 638
    invoke-static {v1, v2, v1}, Lkotlinx/coroutines/SupervisorKt;->SupervisorJob$default(Lkotlinx/coroutines/Job;ILjava/lang/Object;)Lkotlinx/coroutines/CompletableJob;

    move-result-object v0

    iput-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->viewJob:Lkotlinx/coroutines/CompletableJob;

    .line 639
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->viewJob:Lkotlinx/coroutines/CompletableJob;

    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v1

    check-cast v1, Lkotlin/coroutines/CoroutineContext;

    invoke-interface {v0, v1}, Lkotlinx/coroutines/CompletableJob;->plus(Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object v0

    invoke-static {v0}, Lkotlinx/coroutines/CoroutineScopeKt;->CoroutineScope(Lkotlin/coroutines/CoroutineContext;)Lkotlinx/coroutines/CoroutineScope;

    move-result-object v0

    iput-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->viewScope:Lkotlinx/coroutines/CoroutineScope;

    .line 640
    return-void
.end method

.method private final setTypeArray(Landroid/content/res/TypedArray;)V
    .locals 6
    .param p1, "typedArray"    # Landroid/content/res/TypedArray;

    .line 454
    sget v0, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_pdfView_showDivider:I

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    iput-boolean v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->showDivider:Z

    .line 455
    sget v0, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_pdfView_divider:I

    invoke-virtual {p1, v0}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->divider:Landroid/graphics/drawable/Drawable;

    .line 456
    nop

    .line 457
    sget v0, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_pdfView_enableLoadingForPages:I

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    .line 456
    iput-boolean v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->enableLoadingForPages:Z

    .line 458
    nop

    .line 459
    sget v0, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_pdfView_disableScreenshots:I

    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    .line 458
    iput-boolean v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->disableScreenshots:Z

    .line 460
    sget v0, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_pdfView_enableZoom:I

    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    iput-boolean v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->isZoomEnabled:Z

    .line 461
    sget v0, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_pdfView_maxZoom:I

    const/high16 v1, 0x40400000    # 3.0f

    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    .line 462
    const/high16 v1, 0x3f800000    # 1.0f

    const/high16 v3, 0x40a00000    # 5.0f

    invoke-static {v0, v1, v3}, Lkotlin/ranges/RangesKt;->coerceIn(FFF)F

    move-result v0

    .line 461
    iput v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->maxZoomScale:F

    .line 466
    sget v0, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_pdfView_page_margin:I

    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    .line 465
    nop

    .line 467
    .local v0, "marginDim":I
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererView;->pageMargin:Landroid/graphics/Rect;

    .line 468
    nop

    .line 469
    sget v2, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_pdfView_page_marginLeft:I

    .line 470
    nop

    .line 468
    invoke-virtual {p1, v2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    .line 472
    nop

    .line 473
    sget v3, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_pdfView_page_marginTop:I

    .line 474
    nop

    .line 472
    invoke-virtual {p1, v3, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    .line 476
    nop

    .line 477
    sget v4, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_pdfView_page_marginRight:I

    .line 478
    nop

    .line 476
    invoke-virtual {p1, v4, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    .line 480
    nop

    .line 481
    sget v5, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_pdfView_page_marginBottom:I

    .line 482
    nop

    .line 480
    invoke-virtual {p1, v5, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v5

    .line 467
    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/graphics/Rect;->set(IIII)V

    .line 486
    invoke-direct {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->applyScreenshotSecurity()V

    .line 487
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 488
    return-void
.end method

.method private final updatePageNumberDisplay(I)V
    .locals 7
    .param p1, "position"    # I

    .line 437
    const/4 v0, -0x1

    if-eq p1, v0, :cond_4

    .line 438
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->pageNo:Landroid/widget/TextView;

    const/4 v1, 0x0

    const-string/jumbo v2, "pageNo"

    if-nez v0, :cond_0

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_0
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/rajat/pdfviewer/R$string;->pdfView_page_no:I

    add-int/lit8 v5, p1, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getTotalPageCount()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    filled-new-array {v5, v6}, [Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    check-cast v3, Ljava/lang/CharSequence;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 439
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->pageNo:Landroid/widget/TextView;

    if-nez v0, :cond_1

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_1
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 440
    if-nez p1, :cond_3

    .line 441
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->pageNo:Landroid/widget/TextView;

    if-nez v0, :cond_2

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    move-object v1, v0

    :goto_0
    new-instance v0, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda12;

    invoke-direct {v0, p0}, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda12;-><init>(Lcom/rajat/pdfviewer/PdfRendererView;)V

    const-wide/16 v2, 0xbb8

    invoke-virtual {v1, v0, v2, v3}, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 443
    :cond_3
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->statusListener:Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;

    if-eqz v0, :cond_4

    add-int/lit8 v1, p1, 0x1

    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getTotalPageCount()I

    move-result v2

    invoke-interface {v0, v1, v2}, Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;->onPageChanged(II)V

    .line 445
    :cond_4
    return-void
.end method

.method static final updatePageNumberDisplay$lambda$20(Lcom/rajat/pdfviewer/PdfRendererView;)V
    .locals 2
    .param p0, "this$0"    # Lcom/rajat/pdfviewer/PdfRendererView;

    .line 441
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->pageNo:Landroid/widget/TextView;

    if-nez v0, :cond_0

    const-string/jumbo v0, "pageNo"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v0, 0x0

    :cond_0
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    return-void
.end method


# virtual methods
.method public canScrollVertically(I)Z
    .locals 1
    .param p1, "direction"    # I

    .line 623
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->recyclerView:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    if-eqz v0, :cond_0

    .line 624
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->canScrollVertically(I)Z

    move-result v0

    goto :goto_0

    .line 626
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->canScrollVertically(I)Z

    move-result v0

    .line 623
    :goto_0
    return v0
.end method

.method public final clearCache(Lcom/rajat/pdfviewer/PdfRendererView;Landroid/content/Context;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 2
    .param p1, "$this$clearCache"    # Lcom/rajat/pdfviewer/PdfRendererView;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/rajat/pdfviewer/PdfRendererView;",
            "Landroid/content/Context;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 105
    sget-object v0, Lcom/rajat/pdfviewer/util/CacheManager;->Companion:Lcom/rajat/pdfviewer/util/CacheManager$Companion;

    invoke-virtual {v0, p2, p3}, Lcom/rajat/pdfviewer/util/CacheManager$Companion;->clearCacheDir(Landroid/content/Context;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_0

    return-object v0

    :cond_0
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 106
    return-object v0
.end method

.method public final closePdfRender()V
    .locals 0

    .line 501
    invoke-direct {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->releaseCurrentDocumentSession()V

    .line 502
    invoke-direct {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->resetViewScope()V

    .line 503
    return-void
.end method

.method public final getLoadedBitmaps(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Ljava/util/List<",
            "Landroid/graphics/Bitmap;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    instance-of v0, p1, Lcom/rajat/pdfviewer/PdfRendererView$getLoadedBitmaps$1;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/rajat/pdfviewer/PdfRendererView$getLoadedBitmaps$1;

    iget v1, v0, Lcom/rajat/pdfviewer/PdfRendererView$getLoadedBitmaps$1;->label:I

    const/high16 v2, -0x80000000

    and-int/2addr v1, v2

    if-eqz v1, :cond_0

    iget p1, v0, Lcom/rajat/pdfviewer/PdfRendererView$getLoadedBitmaps$1;->label:I

    sub-int/2addr p1, v2

    iput p1, v0, Lcom/rajat/pdfviewer/PdfRendererView$getLoadedBitmaps$1;->label:I

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/rajat/pdfviewer/PdfRendererView$getLoadedBitmaps$1;

    invoke-direct {v0, p0, p1}, Lcom/rajat/pdfviewer/PdfRendererView$getLoadedBitmaps$1;-><init>(Lcom/rajat/pdfviewer/PdfRendererView;Lkotlin/coroutines/Continuation;)V

    :goto_0
    iget-object p1, v0, Lcom/rajat/pdfviewer/PdfRendererView$getLoadedBitmaps$1;->result:Ljava/lang/Object;

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    .line 553
    iget v2, v0, Lcom/rajat/pdfviewer/PdfRendererView$getLoadedBitmaps$1;->label:I

    packed-switch v2, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_0
    iget-object v2, v0, Lcom/rajat/pdfviewer/PdfRendererView$getLoadedBitmaps$1;->L$1:Ljava/lang/Object;

    check-cast v2, Ljava/util/Iterator;

    iget-object v3, v0, Lcom/rajat/pdfviewer/PdfRendererView$getLoadedBitmaps$1;->L$0:Ljava/lang/Object;

    check-cast v3, Ljava/util/Collection;

    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v4, v3

    move-object v3, v2

    move-object v2, v1

    move-object v1, v0

    move-object v0, p0

    goto :goto_2

    :pswitch_1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 554
    const/4 p1, 0x0

    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getTotalPageCount()I

    move-result v2

    invoke-static {p1, v2}, Lkotlin/ranges/RangesKt;->until(II)Lkotlin/ranges/IntRange;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    .line 709
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    check-cast v2, Ljava/util/Collection;

    .line 717
    nop

    .line 718
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    move-object v3, v2

    move-object v2, p1

    move-object p1, p0

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    move-object v4, v2

    check-cast v4, Lkotlin/collections/IntIterator;

    invoke-virtual {v4}, Lkotlin/collections/IntIterator;->nextInt()I

    move-result v4

    .line 717
    nop

    .line 555
    iput-object v3, v0, Lcom/rajat/pdfviewer/PdfRendererView$getLoadedBitmaps$1;->L$0:Ljava/lang/Object;

    iput-object v2, v0, Lcom/rajat/pdfviewer/PdfRendererView$getLoadedBitmaps$1;->L$1:Ljava/lang/Object;

    const/4 v5, 0x1

    iput v5, v0, Lcom/rajat/pdfviewer/PdfRendererView$getLoadedBitmaps$1;->label:I

    invoke-direct {p1, v4, v0}, Lcom/rajat/pdfviewer/PdfRendererView;->getBitmapByPage(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v4

    if-ne v4, v1, :cond_1

    .line 553
    return-object v1

    .line 555
    :cond_1
    move-object v6, v0

    move-object v0, p1

    move-object p1, v4

    move-object v4, v3

    move-object v3, v2

    move-object v2, v1

    move-object v1, v6

    :goto_2
    check-cast p1, Landroid/graphics/Bitmap;

    .line 717
    if-eqz p1, :cond_2

    .line 719
    nop

    .line 717
    invoke-interface {v4, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 718
    :cond_2
    move-object p1, v0

    move-object v0, v1

    move-object v1, v2

    move-object v2, v3

    move-object v3, v4

    goto :goto_1

    .line 720
    :cond_3
    nop

    .line 721
    check-cast v3, Ljava/util/List;

    .line 709
    nop

    .line 554
    return-object v3

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final getMaxZoomScale()F
    .locals 1

    .line 578
    iget v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->maxZoomScale:F

    return v0
.end method

.method public final getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->recyclerView:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    const-string/jumbo v0, "recyclerView"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method public final getScrollDirection()I
    .locals 1

    .line 679
    nop

    .line 680
    iget v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->lastDy:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    .line 681
    :cond_0
    iget v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->lastDy:I

    if-gez v0, :cond_1

    const/4 v0, -0x1

    goto :goto_0

    .line 682
    :cond_1
    const/4 v0, 0x0

    .line 683
    :goto_0
    return v0
.end method

.method public final getStatusListener()Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->statusListener:Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;

    return-object v0
.end method

.method public final getTotalPageCount()I
    .locals 1

    .line 97
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->pdfRendererCore:Lcom/rajat/pdfviewer/PdfRendererCore;

    if-nez v0, :cond_0

    const-string/jumbo v0, "pdfRendererCore"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v0, 0x0

    :cond_0
    invoke-virtual {v0}, Lcom/rajat/pdfviewer/PdfRendererCore;->getPageCount()I

    move-result v0

    return v0
.end method

.method public final getZoomEnabled()Z
    .locals 1

    .line 582
    iget-boolean v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->isZoomEnabled:Z

    return v0
.end method

.method public final getZoomListener()Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;
    .locals 1

    .line 88
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->zoomListener:Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;

    return-object v0
.end method

.method public final getZoomScale()F
    .locals 1

    .line 93
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->recyclerView:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getZoomScale()F

    move-result v0

    goto :goto_0

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    :goto_0
    return v0
.end method

.method public final initWithFile(Ljava/io/File;Lcom/rajat/pdfviewer/util/CacheStrategy;)V
    .locals 1
    .param p1, "file"    # Ljava/io/File;
    .param p2, "cacheStrategy"    # Lcom/rajat/pdfviewer/util/CacheStrategy;

    const-string v0, "file"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "cacheStrategy"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 167
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, v0}, Lcom/rajat/pdfviewer/PdfRendererView;->initWithFileInternal(Ljava/io/File;Lcom/rajat/pdfviewer/util/CacheStrategy;Lkotlin/jvm/functions/Function0;Ljava/lang/String;)V

    .line 168
    return-void
.end method

.method public final initWithUri(Landroid/net/Uri;)V
    .locals 8
    .param p1, "uri"    # Landroid/net/Uri;

    const-string/jumbo v0, "uri"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 208
    sget-object v0, Lcom/rajat/pdfviewer/util/CacheHelper;->INSTANCE:Lcom/rajat/pdfviewer/util/CacheHelper;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "toString(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/rajat/pdfviewer/util/CacheHelper;->getCacheKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 210
    .local v0, "cacheIdentifier":Ljava/lang/String;
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererView;->statusListener:Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;

    if-eqz v1, :cond_0

    invoke-interface {v1}, Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;->onPdfRenderStart()V

    .line 212
    :cond_0
    iget-object v2, p0, Lcom/rajat/pdfviewer/PdfRendererView;->viewScope:Lkotlinx/coroutines/CoroutineScope;

    new-instance v1, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1;

    const/4 v3, 0x0

    invoke-direct {v1, p0, p1, v0, v3}, Lcom/rajat/pdfviewer/PdfRendererView$initWithUri$1;-><init>(Lcom/rajat/pdfviewer/PdfRendererView;Landroid/net/Uri;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    move-object v5, v1

    check-cast v5, Lkotlin/jvm/functions/Function2;

    const/4 v6, 0x3

    const/4 v7, 0x0

    const/4 v4, 0x0

    invoke-static/range {v2 .. v7}, Lkotlinx/coroutines/BuildersKt;->launch$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    .line 231
    return-void
.end method

.method public final initWithUrl(Ljava/lang/String;Lcom/rajat/pdfviewer/HeaderData;Landroidx/lifecycle/LifecycleCoroutineScope;Landroidx/lifecycle/Lifecycle;Lcom/rajat/pdfviewer/util/CacheStrategy;)V
    .locals 19
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "headers"    # Lcom/rajat/pdfviewer/HeaderData;
    .param p3, "lifecycleCoroutineScope"    # Landroidx/lifecycle/LifecycleCoroutineScope;
    .param p4, "lifecycle"    # Landroidx/lifecycle/Lifecycle;
    .param p5, "cacheStrategy"    # Lcom/rajat/pdfviewer/util/CacheStrategy;

    move-object/from16 v0, p0

    move-object/from16 v4, p1

    move-object/from16 v11, p3

    move-object/from16 v12, p4

    move-object/from16 v6, p5

    const-string/jumbo v1, "url"

    invoke-static {v4, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "headers"

    move-object/from16 v3, p2

    invoke-static {v3, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "lifecycleCoroutineScope"

    invoke-static {v11, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "lifecycle"

    invoke-static {v12, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "cacheStrategy"

    invoke-static {v6, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 129
    invoke-direct {v0, v12}, Lcom/rajat/pdfviewer/PdfRendererView;->registerLifecycleObserver(Landroidx/lifecycle/Lifecycle;)V

    .line 130
    iput-object v6, v0, Lcom/rajat/pdfviewer/PdfRendererView;->cacheStrategy:Lcom/rajat/pdfviewer/util/CacheStrategy;

    .line 134
    sget-object v1, Lcom/rajat/pdfviewer/util/FileUtils;->INSTANCE:Lcom/rajat/pdfviewer/util/FileUtils;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v5, "toString(...)"

    invoke-static {v2, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1, v4, v6, v2}, Lcom/rajat/pdfviewer/util/FileUtils;->getCachedFileName(Ljava/lang/String;Lcom/rajat/pdfviewer/util/CacheStrategy;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 133
    nop

    .line 135
    .local v5, "remoteDocumentCacheKey":Ljava/lang/String;
    new-instance v1, Lcom/rajat/pdfviewer/PdfDownloader;

    .line 136
    move-object v2, v11

    check-cast v2, Lkotlinx/coroutines/CoroutineScope;

    .line 137
    nop

    .line 138
    nop

    .line 139
    nop

    .line 140
    nop

    .line 141
    new-instance v13, Lcom/rajat/pdfviewer/PdfDownloadCallback;

    .line 142
    invoke-virtual {v0}, Lcom/rajat/pdfviewer/PdfRendererView;->getContext()Landroid/content/Context;

    move-result-object v14

    const-string v7, "getContext(...)"

    invoke-static {v14, v7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 157
    new-instance v15, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda7;

    invoke-direct {v15, v0}, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda7;-><init>(Lcom/rajat/pdfviewer/PdfRendererView;)V

    new-instance v7, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda8;

    invoke-direct {v7, v0}, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda8;-><init>(Lcom/rajat/pdfviewer/PdfRendererView;)V

    new-instance v8, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda9;

    invoke-direct {v8, v0, v6, v5}, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda9;-><init>(Lcom/rajat/pdfviewer/PdfRendererView;Lcom/rajat/pdfviewer/util/CacheStrategy;Ljava/lang/String;)V

    new-instance v9, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda10;

    invoke-direct {v9, v0}, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda10;-><init>(Lcom/rajat/pdfviewer/PdfRendererView;)V

    .line 141
    move-object/from16 v16, v7

    move-object/from16 v17, v8

    move-object/from16 v18, v9

    invoke-direct/range {v13 .. v18}, Lcom/rajat/pdfviewer/PdfDownloadCallback;-><init>(Landroid/content/Context;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function3;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    move-object v7, v13

    check-cast v7, Lcom/rajat/pdfviewer/PdfDownloader$StatusListener;

    .line 135
    const/16 v9, 0x40

    const/4 v10, 0x0

    const/4 v8, 0x0

    invoke-direct/range {v1 .. v10}, Lcom/rajat/pdfviewer/PdfDownloader;-><init>(Lkotlinx/coroutines/CoroutineScope;Lcom/rajat/pdfviewer/HeaderData;Ljava/lang/String;Ljava/lang/String;Lcom/rajat/pdfviewer/util/CacheStrategy;Lcom/rajat/pdfviewer/PdfDownloader$StatusListener;Lokhttp3/OkHttpClient;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 157
    invoke-virtual {v1}, Lcom/rajat/pdfviewer/PdfDownloader;->start()V

    .line 158
    return-void
.end method

.method public final isZoomedIn()Z
    .locals 1

    .line 92
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->recyclerView:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->isZoomedIn()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final jumpToPage(IZJ)V
    .locals 2
    .param p1, "pageNumber"    # I
    .param p2, "smoothScroll"    # Z
    .param p3, "delayMillis"    # J

    .line 390
    const/4 v0, 0x0

    if-ltz p1, :cond_0

    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getTotalPageCount()I

    move-result v1

    if-ge p1, v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    if-nez v0, :cond_1

    return-void

    .line 391
    :cond_1
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->recyclerView:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    if-nez v0, :cond_2

    .line 392
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->pendingJumpPage:Ljava/lang/Integer;

    .line 393
    return-void

    .line 396
    :cond_2
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v0

    new-instance v1, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda13;

    invoke-direct {v1, p0, p2, p1}, Lcom/rajat/pdfviewer/PdfRendererView$$ExternalSyntheticLambda13;-><init>(Lcom/rajat/pdfviewer/PdfRendererView;ZI)V

    .line 410
    nop

    .line 396
    invoke-virtual {v0, v1, p3, p4}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 411
    return-void
.end method

.method public onDestroy(Landroidx/lifecycle/LifecycleOwner;)V
    .locals 2
    .param p1, "owner"    # Landroidx/lifecycle/LifecycleOwner;

    const-string/jumbo v0, "owner"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 506
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->closePdfRender()V

    .line 507
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->observedLifecycle:Landroidx/lifecycle/Lifecycle;

    invoke-interface {p1}, Landroidx/lifecycle/LifecycleOwner;->getLifecycle()Landroidx/lifecycle/Lifecycle;

    move-result-object v1

    if-ne v0, v1, :cond_0

    .line 508
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->observedLifecycle:Landroidx/lifecycle/Lifecycle;

    .line 510
    :cond_0
    invoke-interface {p1}, Landroidx/lifecycle/LifecycleOwner;->getLifecycle()Landroidx/lifecycle/Lifecycle;

    move-result-object v0

    move-object v1, p0

    check-cast v1, Landroidx/lifecycle/LifecycleObserver;

    invoke-virtual {v0, v1}, Landroidx/lifecycle/Lifecycle;->removeObserver(Landroidx/lifecycle/LifecycleObserver;)V

    .line 511
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 0

    .line 631
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 634
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 5
    .param p1, "state"    # Landroid/os/Parcelable;

    .line 659
    move-object v0, p1

    .line 660
    .local v0, "savedState":Landroid/os/Parcelable;
    instance-of v1, v0, Landroid/os/Bundle;

    if-eqz v1, :cond_1

    .line 661
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x21

    const-string/jumbo v3, "superState"

    if-lt v1, v2, :cond_0

    .line 662
    move-object v1, v0

    check-cast v1, Landroid/os/Bundle;

    const-class v2, Landroid/os/Parcelable;

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Parcelable;

    goto :goto_0

    .line 664
    :cond_0
    move-object v1, v0

    check-cast v1, Landroid/os/Bundle;

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    .line 661
    :goto_0
    nop

    .line 666
    .local v1, "superState":Landroid/os/Parcelable;
    invoke-super {p0, v1}, Landroid/widget/FrameLayout;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 667
    move-object v2, v0

    check-cast v2, Landroid/os/Bundle;

    const-string/jumbo v3, "scrollPosition"

    iget v4, p0, Lcom/rajat/pdfviewer/PdfRendererView;->positionToUseForState:I

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/rajat/pdfviewer/PdfRendererView;->restoredScrollPosition:I

    .line 668
    move-object v2, v0

    check-cast v2, Landroid/os/Bundle;

    const-string/jumbo v3, "scrollOffset"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/rajat/pdfviewer/PdfRendererView;->restoredScrollOffset:I

    .end local v1    # "superState":Landroid/os/Parcelable;
    goto :goto_1

    .line 670
    :cond_1
    invoke-super {p0, v0}, Landroid/widget/FrameLayout;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 672
    :goto_1
    return-void
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .locals 7

    .line 643
    invoke-super {p0}, Landroid/widget/FrameLayout;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    .line 644
    .local v0, "superState":Landroid/os/Parcelable;
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 645
    .local v1, "savedState":Landroid/os/Bundle;
    const-string/jumbo v2, "superState"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 646
    invoke-direct {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->captureCurrentScrollState()Lkotlin/Pair;

    move-result-object v2

    .line 647
    .local v2, "scrollState":Lkotlin/Pair;
    const-string/jumbo v3, "scrollOffset"

    const-string/jumbo v4, "scrollPosition"

    if-eqz v2, :cond_0

    .line 648
    invoke-virtual {v2}, Lkotlin/Pair;->component1()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    move-result v5

    .local v5, "position":I
    invoke-virtual {v2}, Lkotlin/Pair;->component2()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    move-result v6

    .line 649
    .local v6, "offset":I
    invoke-virtual {v1, v4, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 650
    invoke-virtual {v1, v3, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .end local v5    # "position":I
    .end local v6    # "offset":I
    goto :goto_0

    .line 651
    :cond_0
    iget v5, p0, Lcom/rajat/pdfviewer/PdfRendererView;->positionToUseForState:I

    const/4 v6, -0x1

    if-eq v5, v6, :cond_1

    .line 652
    iget v5, p0, Lcom/rajat/pdfviewer/PdfRendererView;->positionToUseForState:I

    invoke-virtual {v1, v4, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 653
    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 655
    :cond_1
    :goto_0
    move-object v3, v1

    check-cast v3, Landroid/os/Parcelable;

    return-object v3
.end method

.method public final resetZoom()V
    .locals 1

    .line 607
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->recyclerView:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    if-eqz v0, :cond_0

    .line 608
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->resetZoom()V

    .line 610
    :cond_0
    return-void
.end method

.method public final scrollToNextPage()V
    .locals 13

    .line 332
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererView;->recyclerView:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    if-nez v1, :cond_0

    return-void

    .line 333
    :cond_0
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v1

    instance-of v2, v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    if-eqz v2, :cond_1

    check-cast v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    if-nez v1, :cond_2

    return-void

    :cond_2
    move-object v7, v1

    .line 334
    .local v7, "layoutManager":Landroidx/recyclerview/widget/LinearLayoutManager;
    invoke-virtual {v7}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v8

    .line 335
    .local v8, "firstVisiblePosition":I
    const/4 v1, -0x1

    if-ne v8, v1, :cond_3

    return-void

    .line 336
    :cond_3
    invoke-virtual {v7, v8}, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v1

    if-nez v1, :cond_4

    return-void

    :cond_4
    move-object v9, v1

    .line 340
    .local v9, "firstView":Landroid/view/View;
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getZoomScale()F

    move-result v10

    .line 341
    .local v10, "scale":F
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getHeight()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v10

    float-to-int v11, v1

    .line 342
    .local v11, "unscaledViewportHeight":I
    invoke-virtual {v7, v9}, Landroidx/recyclerview/widget/LinearLayoutManager;->getDecoratedBottom(Landroid/view/View;)I

    move-result v1

    sub-int v12, v1, v11

    .line 343
    .local v12, "remaining":I
    if-lez v12, :cond_5

    .line 345
    invoke-static {v11, v12}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 346
    .local v1, "delta":I
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v1}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->smoothScrollBy(II)V

    .end local v1    # "delta":I
    goto :goto_1

    .line 348
    :cond_5
    add-int/lit8 v1, v8, 0x1

    const/4 v5, 0x6

    const/4 v6, 0x0

    const/4 v2, 0x0

    const-wide/16 v3, 0x0

    move-object v0, p0

    invoke-static/range {v0 .. v6}, Lcom/rajat/pdfviewer/PdfRendererView;->jumpToPage$default(Lcom/rajat/pdfviewer/PdfRendererView;IZJILjava/lang/Object;)V

    .line 350
    :goto_1
    return-void
.end method

.method public final scrollToPreviousPage()V
    .locals 13

    .line 362
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfRendererView;->recyclerView:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    if-nez v1, :cond_0

    return-void

    .line 363
    :cond_0
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v1

    instance-of v2, v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    if-eqz v2, :cond_1

    check-cast v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    if-nez v1, :cond_2

    return-void

    :cond_2
    move-object v7, v1

    .line 364
    .local v7, "layoutManager":Landroidx/recyclerview/widget/LinearLayoutManager;
    invoke-virtual {v7}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v8

    .line 365
    .local v8, "firstVisiblePosition":I
    const/4 v1, -0x1

    if-ne v8, v1, :cond_3

    return-void

    .line 366
    :cond_3
    invoke-virtual {v7, v8}, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v1

    if-nez v1, :cond_4

    return-void

    :cond_4
    move-object v9, v1

    .line 370
    .local v9, "firstView":Landroid/view/View;
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getZoomScale()F

    move-result v10

    .line 371
    .local v10, "scale":F
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getHeight()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v10

    float-to-int v11, v1

    .line 372
    .local v11, "unscaledViewportHeight":I
    invoke-virtual {v7, v9}, Landroidx/recyclerview/widget/LinearLayoutManager;->getDecoratedTop(Landroid/view/View;)I

    move-result v1

    neg-int v12, v1

    .line 373
    .local v12, "hiddenAbove":I
    if-lez v12, :cond_5

    .line 375
    invoke-static {v11, v12}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 376
    .local v1, "delta":I
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v2

    const/4 v3, 0x0

    neg-int v4, v1

    invoke-virtual {v2, v3, v4}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->smoothScrollBy(II)V

    .end local v1    # "delta":I
    goto :goto_1

    .line 378
    :cond_5
    add-int/lit8 v1, v8, -0x1

    const/4 v5, 0x6

    const/4 v6, 0x0

    const/4 v2, 0x0

    const-wide/16 v3, 0x0

    move-object v0, p0

    invoke-static/range {v0 .. v6}, Lcom/rajat/pdfviewer/PdfRendererView;->jumpToPage$default(Lcom/rajat/pdfviewer/PdfRendererView;IZJILjava/lang/Object;)V

    .line 380
    :goto_1
    return-void
.end method

.method public final setMaxZoomScale(F)V
    .locals 2
    .param p1, "maxZoomScale"    # F

    .line 572
    const/high16 v0, 0x3f800000    # 1.0f

    const/high16 v1, 0x40a00000    # 5.0f

    invoke-static {p1, v0, v1}, Lkotlin/ranges/RangesKt;->coerceIn(FFF)F

    move-result v0

    iput v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->maxZoomScale:F

    .line 573
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->recyclerView:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    if-eqz v0, :cond_0

    .line 574
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v0

    iget v1, p0, Lcom/rajat/pdfviewer/PdfRendererView;->maxZoomScale:F

    invoke-virtual {v0, v1}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->setMaxZoomScale(F)V

    .line 576
    :cond_0
    return-void
.end method

.method public final setRecyclerView(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)V
    .locals 1
    .param p1, "<set-?>"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 58
    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfRendererView;->recyclerView:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    return-void
.end method

.method public final setStatusListener(Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;)V
    .locals 0
    .param p1, "<set-?>"    # Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;

    .line 89
    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfRendererView;->statusListener:Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;

    return-void
.end method

.method public final setZoomEnabled(Z)V
    .locals 1
    .param p1, "zoomEnabled"    # Z

    .line 565
    iput-boolean p1, p0, Lcom/rajat/pdfviewer/PdfRendererView;->isZoomEnabled:Z

    .line 566
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->recyclerView:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    if-eqz v0, :cond_0

    .line 567
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->setZoomEnabled(Z)V

    .line 569
    :cond_0
    return-void
.end method

.method public final setZoomListener(Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;)V
    .locals 0
    .param p1, "<set-?>"    # Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;

    .line 88
    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfRendererView;->zoomListener:Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;

    return-void
.end method

.method public final zoomIn()V
    .locals 1

    .line 589
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->recyclerView:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    if-eqz v0, :cond_0

    .line 590
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->zoomIn()V

    .line 592
    :cond_0
    return-void
.end method

.method public final zoomOut()V
    .locals 1

    .line 598
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfRendererView;->recyclerView:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    if-eqz v0, :cond_0

    .line 599
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->zoomOut()V

    .line 601
    :cond_0
    return-void
.end method
