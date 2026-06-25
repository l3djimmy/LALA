.class public final Lcom/rajat/pdfviewer/PinchZoomRecyclerView;
.super Landroidx/recyclerview/widget/RecyclerView;
.source "PinchZoomRecyclerView.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rajat/pdfviewer/PinchZoomRecyclerView$Companion;,
        Lcom/rajat/pdfviewer/PinchZoomRecyclerView$GestureListener;,
        Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPinchZoomRecyclerView.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PinchZoomRecyclerView.kt\ncom/rajat/pdfviewer/PinchZoomRecyclerView\n+ 2 Canvas.kt\nandroidx/core/graphics/CanvasKt\n*L\n1#1,477:1\n44#2,8:478\n44#2,8:486\n*S KotlinDebug\n*F\n+ 1 PinchZoomRecyclerView.kt\ncom/rajat/pdfviewer/PinchZoomRecyclerView\n*L\n197#1:478,8\n204#1:486,8\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000j\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\u000f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u001c\u0008\u0007\u0018\u0000 X2\u00020\u0001:\u0003VWXB\'\u0008\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\u0008\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u000e\u0010)\u001a\u00020&2\u0006\u0010*\u001a\u00020\u0012J\u0006\u0010+\u001a\u00020\u0012J\u0006\u0010,\u001a\u00020\u0010J\u0006\u0010-\u001a\u00020\u0010J\u000e\u0010.\u001a\u00020&2\u0006\u0010/\u001a\u00020\u0010J>\u00100\u001a\u00020&26\u00101\u001a2\u0012\u0013\u0012\u00110\u0012\u00a2\u0006\u000c\u00082\u0012\u0008\u00083\u0012\u0004\u0008\u0008(+\u0012\u0013\u0012\u00110\u0010\u00a2\u0006\u000c\u00082\u0012\u0008\u00083\u0012\u0004\u0008\u0008(4\u0012\u0004\u0012\u00020&0%J)\u00105\u001a\u00020&2!\u00101\u001a\u001d\u0012\u0013\u0012\u00110\u0010\u00a2\u0006\u000c\u00082\u0012\u0008\u00083\u0012\u0004\u0008\u0008(4\u0012\u0004\u0012\u00020&0(J)\u00106\u001a\u00020&2!\u00101\u001a\u001d\u0012\u0013\u0012\u00110\u0010\u00a2\u0006\u000c\u00082\u0012\u0008\u00083\u0012\u0004\u0008\u0008(4\u0012\u0004\u0012\u00020&0(J\u0010\u00107\u001a\u00020\u00122\u0006\u00108\u001a\u000209H\u0016J\u0010\u0010:\u001a\u00020\u00122\u0006\u00108\u001a\u000209H\u0016J\u0010\u0010;\u001a\u00020&2\u0006\u0010<\u001a\u00020=H\u0016J\u0010\u0010>\u001a\u00020&2\u0006\u0010<\u001a\u00020=H\u0014J\u0010\u0010?\u001a\u00020\u00122\u0006\u0010@\u001a\u00020\u0007H\u0016J\u0008\u0010A\u001a\u00020\u0007H\u0016J\u0008\u0010B\u001a\u00020\u0007H\u0016J\u0018\u0010C\u001a\u00020\u00122\u0006\u0010D\u001a\u00020\u00072\u0006\u0010E\u001a\u00020\u0007H\u0016J\u0008\u0010F\u001a\u00020&H\u0002J\u0008\u0010G\u001a\u00020\u0010H\u0002J\u0008\u0010H\u001a\u00020\u0012H\u0002J\u0008\u0010I\u001a\u00020\u0010H\u0002J\u0010\u0010J\u001a\u00020&2\u0006\u0010K\u001a\u00020\u0010H\u0002J\u0008\u0010L\u001a\u00020\u0010H\u0002J\u0008\u0010M\u001a\u00020\u0012H\u0002J\u0006\u0010N\u001a\u00020&J\u0006\u0010O\u001a\u00020&J\u0006\u0010P\u001a\u00020&J(\u0010Q\u001a\u00020&2\u0006\u0010R\u001a\u00020\u00102\u0006\u0010S\u001a\u00020\u00102\u0006\u0010T\u001a\u00020\u00102\u0006\u0010U\u001a\u00020\u0015H\u0002R\u000e\u0010\n\u001a\u00020\u0007X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u000cX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u000eX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0010X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0012X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u0010X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0015X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0012X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0017\u001a\u00020\u0010X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0018\u001a\u00020\u0010X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0019\u001a\u00020\u0010X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001a\u001a\u00020\u0010X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001b\u001a\u00020\u0012X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001c\u001a\u00020\u0010X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001d\u001a\u00020\u0010X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001e\u001a\u00020\u0010X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001f\u001a\u00020\u0010X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010 \u001a\u00020\u0010X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010!\u001a\u00020\u0010X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\"\u001a\u00020\u0010X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010#\u001a\u00020\u0012X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\"\u0010$\u001a\u0016\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u00020\u0010\u0012\u0004\u0012\u00020&\u0018\u00010%X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001c\u0010\'\u001a\u0010\u0012\u0004\u0012\u00020\u0010\u0012\u0004\u0012\u00020&\u0018\u00010(X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006Y"
    }
    d2 = {
        "Lcom/rajat/pdfviewer/PinchZoomRecyclerView;",
        "Landroidx/recyclerview/widget/RecyclerView;",
        "context",
        "Landroid/content/Context;",
        "attrs",
        "Landroid/util/AttributeSet;",
        "defStyleAttr",
        "",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;I)V",
        "activePointerId",
        "scaleDetector",
        "Landroid/view/ScaleGestureDetector;",
        "gestureDetector",
        "Landroid/view/GestureDetector;",
        "scaleFactor",
        "",
        "isZoomEnabled",
        "",
        "maxZoom",
        "zoomDuration",
        "",
        "isZoomingInProgress",
        "lastTouchX",
        "lastTouchY",
        "posX",
        "posY",
        "ignoreScaleAfterPointerUp",
        "pinchStartScale",
        "pinchStartSpan",
        "pinchStartFocusX",
        "pinchStartFocusY",
        "pinchContentFocusX",
        "pinchContentFocusY",
        "multiPageScrollResidualY",
        "blockPanUntilNextDown",
        "zoomChangeListener",
        "Lkotlin/Function2;",
        "",
        "zoomEndListener",
        "Lkotlin/Function1;",
        "setZoomEnabled",
        "enabled",
        "isZoomedIn",
        "getZoomScale",
        "getMaxZoomScale",
        "setMaxZoomScale",
        "maxZoomScale",
        "setOnZoomChangeListener",
        "listener",
        "Lkotlin/ParameterName;",
        "name",
        "scale",
        "setOnZoomEndListener",
        "setOnZoomSettledListener",
        "onTouchEvent",
        "ev",
        "Landroid/view/MotionEvent;",
        "onInterceptTouchEvent",
        "onDraw",
        "canvas",
        "Landroid/graphics/Canvas;",
        "dispatchDraw",
        "canScrollVertically",
        "direction",
        "computeVerticalScrollOffset",
        "computeVerticalScrollRange",
        "fling",
        "velocityX",
        "velocityY",
        "clampPosition",
        "getSinglePageContentHeight",
        "isVerticallyScrollable",
        "getCurrentMultiPageVisualOffset",
        "applyMultiPageVisualOffsetDelta",
        "delta",
        "getBaseScrollOffset",
        "isSinglePage",
        "zoomIn",
        "zoomOut",
        "resetZoom",
        "zoomTo",
        "targetScale",
        "focusX",
        "focusY",
        "duration",
        "ScaleListener",
        "GestureListener",
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

.field public static final Companion:Lcom/rajat/pdfviewer/PinchZoomRecyclerView$Companion;

.field private static final HARD_MAX_ZOOM:F = 5.0f

.field private static final INVALID_POINTER_ID:I = -0x1

.field private static final MAX_ZOOM:F = 3.0f

.field private static final ZOOM_DURATION:J = 0x12cL


# instance fields
.field private activePointerId:I

.field private blockPanUntilNextDown:Z

.field private final gestureDetector:Landroid/view/GestureDetector;

.field private ignoreScaleAfterPointerUp:Z

.field private isZoomEnabled:Z

.field private isZoomingInProgress:Z

.field private lastTouchX:F

.field private lastTouchY:F

.field private maxZoom:F

.field private multiPageScrollResidualY:F

.field private pinchContentFocusX:F

.field private pinchContentFocusY:F

.field private pinchStartFocusX:F

.field private pinchStartFocusY:F

.field private pinchStartScale:F

.field private pinchStartSpan:F

.field private posX:F

.field private posY:F

.field private final scaleDetector:Landroid/view/ScaleGestureDetector;

.field private scaleFactor:F

.field private zoomChangeListener:Lkotlin/jvm/functions/Function2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Ljava/lang/Boolean;",
            "-",
            "Ljava/lang/Float;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field

.field private zoomDuration:J

.field private zoomEndListener:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Float;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->Companion:Lcom/rajat/pdfviewer/PinchZoomRecyclerView$Companion;

    const/16 v0, 0x8

    sput v0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->$stable:I

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
    invoke-direct/range {v1 .. v6}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 22
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
    invoke-direct/range {v1 .. v6}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 22
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    invoke-direct {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 25
    const/4 v0, -0x1

    iput v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->activePointerId:I

    .line 26
    new-instance v0, Landroid/view/ScaleGestureDetector;

    new-instance v1, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;

    invoke-direct {v1, p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$ScaleListener;-><init>(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)V

    check-cast v1, Landroid/view/ScaleGestureDetector$OnScaleGestureListener;

    invoke-direct {v0, p1, v1}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    iput-object v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleDetector:Landroid/view/ScaleGestureDetector;

    .line 27
    new-instance v0, Landroid/view/GestureDetector;

    new-instance v1, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$GestureListener;

    invoke-direct {v1, p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$GestureListener;-><init>(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)V

    check-cast v1, Landroid/view/GestureDetector$OnGestureListener;

    invoke-direct {v0, p1, v1}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->gestureDetector:Landroid/view/GestureDetector;

    .line 30
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    .line 31
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->isZoomEnabled:Z

    .line 32
    const/high16 v1, 0x40400000    # 3.0f

    iput v1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->maxZoom:F

    .line 33
    const-wide/16 v1, 0x12c

    iput-wide v1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->zoomDuration:J

    .line 42
    iput v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->pinchStartScale:F

    .line 43
    iput v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->pinchStartSpan:F

    .line 55
    nop

    .line 56
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->setWillNotDraw(Z)V

    .line 57
    new-instance v0, Lcom/rajat/pdfviewer/ZoomableLinearLayoutManager;

    new-instance v1, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$$ExternalSyntheticLambda0;-><init>(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)V

    invoke-direct {v0, p1, v1}, Lcom/rajat/pdfviewer/ZoomableLinearLayoutManager;-><init>(Landroid/content/Context;Lkotlin/jvm/functions/Function0;)V

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    invoke-virtual {p0, v0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 58
    nop

    .line 18
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 18
    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_0

    .line 20
    const/4 p2, 0x0

    .line 18
    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    .line 21
    const/4 p3, 0x0

    .line 18
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 22
    return-void
.end method

.method static final _init_$lambda$0(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F
    .locals 1
    .param p0, "this$0"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    .line 57
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getZoomScale()F

    move-result v0

    return v0
.end method

.method public static final synthetic access$applyMultiPageVisualOffsetDelta(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;F)V
    .locals 0
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;
    .param p1, "delta"    # F

    .line 18
    invoke-direct {p0, p1}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->applyMultiPageVisualOffsetDelta(F)V

    return-void
.end method

.method public static final synthetic access$awakenScrollBars(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)Z
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    .line 18
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->awakenScrollBars()Z

    move-result v0

    return v0
.end method

.method public static final synthetic access$clampPosition(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)V
    .locals 0
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    .line 18
    invoke-direct {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->clampPosition()V

    return-void
.end method

.method public static final synthetic access$getCurrentMultiPageVisualOffset(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    .line 18
    invoke-direct {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getCurrentMultiPageVisualOffset()F

    move-result v0

    return v0
.end method

.method public static final synthetic access$getIgnoreScaleAfterPointerUp$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)Z
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    .line 18
    iget-boolean v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->ignoreScaleAfterPointerUp:Z

    return v0
.end method

.method public static final synthetic access$getMaxZoom$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    .line 18
    iget v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->maxZoom:F

    return v0
.end method

.method public static final synthetic access$getPinchContentFocusX$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    .line 18
    iget v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->pinchContentFocusX:F

    return v0
.end method

.method public static final synthetic access$getPinchContentFocusY$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    .line 18
    iget v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->pinchContentFocusY:F

    return v0
.end method

.method public static final synthetic access$getPinchStartFocusX$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    .line 18
    iget v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->pinchStartFocusX:F

    return v0
.end method

.method public static final synthetic access$getPinchStartFocusY$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    .line 18
    iget v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->pinchStartFocusY:F

    return v0
.end method

.method public static final synthetic access$getPinchStartScale$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    .line 18
    iget v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->pinchStartScale:F

    return v0
.end method

.method public static final synthetic access$getPinchStartSpan$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    .line 18
    iget v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->pinchStartSpan:F

    return v0
.end method

.method public static final synthetic access$getPosX$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    .line 18
    iget v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posX:F

    return v0
.end method

.method public static final synthetic access$getPosY$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    .line 18
    iget v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posY:F

    return v0
.end method

.method public static final synthetic access$getScaleFactor$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)F
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    .line 18
    iget v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    return v0
.end method

.method public static final synthetic access$getZoomChangeListener$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)Lkotlin/jvm/functions/Function2;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    .line 18
    iget-object v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->zoomChangeListener:Lkotlin/jvm/functions/Function2;

    return-object v0
.end method

.method public static final synthetic access$getZoomDuration$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)J
    .locals 2
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    .line 18
    iget-wide v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->zoomDuration:J

    return-wide v0
.end method

.method public static final synthetic access$getZoomEndListener$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)Lkotlin/jvm/functions/Function1;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    .line 18
    iget-object v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->zoomEndListener:Lkotlin/jvm/functions/Function1;

    return-object v0
.end method

.method public static final synthetic access$isSinglePage(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)Z
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    .line 18
    invoke-direct {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->isSinglePage()Z

    move-result v0

    return v0
.end method

.method public static final synthetic access$isZoomEnabled$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)Z
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    .line 18
    iget-boolean v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->isZoomEnabled:Z

    return v0
.end method

.method public static final synthetic access$setIgnoreScaleAfterPointerUp$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;Z)V
    .locals 0
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;
    .param p1, "<set-?>"    # Z

    .line 18
    iput-boolean p1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->ignoreScaleAfterPointerUp:Z

    return-void
.end method

.method public static final synthetic access$setMultiPageScrollResidualY$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;F)V
    .locals 0
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;
    .param p1, "<set-?>"    # F

    .line 18
    iput p1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->multiPageScrollResidualY:F

    return-void
.end method

.method public static final synthetic access$setPinchContentFocusX$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;F)V
    .locals 0
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;
    .param p1, "<set-?>"    # F

    .line 18
    iput p1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->pinchContentFocusX:F

    return-void
.end method

.method public static final synthetic access$setPinchContentFocusY$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;F)V
    .locals 0
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;
    .param p1, "<set-?>"    # F

    .line 18
    iput p1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->pinchContentFocusY:F

    return-void
.end method

.method public static final synthetic access$setPinchStartFocusX$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;F)V
    .locals 0
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;
    .param p1, "<set-?>"    # F

    .line 18
    iput p1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->pinchStartFocusX:F

    return-void
.end method

.method public static final synthetic access$setPinchStartFocusY$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;F)V
    .locals 0
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;
    .param p1, "<set-?>"    # F

    .line 18
    iput p1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->pinchStartFocusY:F

    return-void
.end method

.method public static final synthetic access$setPinchStartScale$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;F)V
    .locals 0
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;
    .param p1, "<set-?>"    # F

    .line 18
    iput p1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->pinchStartScale:F

    return-void
.end method

.method public static final synthetic access$setPinchStartSpan$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;F)V
    .locals 0
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;
    .param p1, "<set-?>"    # F

    .line 18
    iput p1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->pinchStartSpan:F

    return-void
.end method

.method public static final synthetic access$setPosX$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;F)V
    .locals 0
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;
    .param p1, "<set-?>"    # F

    .line 18
    iput p1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posX:F

    return-void
.end method

.method public static final synthetic access$setPosY$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;F)V
    .locals 0
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;
    .param p1, "<set-?>"    # F

    .line 18
    iput p1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posY:F

    return-void
.end method

.method public static final synthetic access$setScaleFactor$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;F)V
    .locals 0
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;
    .param p1, "<set-?>"    # F

    .line 18
    iput p1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    return-void
.end method

.method public static final synthetic access$setZoomingInProgress$p(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;Z)V
    .locals 0
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;
    .param p1, "<set-?>"    # Z

    .line 18
    iput-boolean p1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->isZoomingInProgress:Z

    return-void
.end method

.method public static final synthetic access$zoomTo(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;FFFJ)V
    .locals 0
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;
    .param p1, "targetScale"    # F
    .param p2, "focusX"    # F
    .param p3, "focusY"    # F
    .param p4, "duration"    # J

    .line 18
    invoke-direct/range {p0 .. p5}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->zoomTo(FFFJ)V

    return-void
.end method

.method private final applyMultiPageVisualOffsetDelta(F)V
    .locals 7
    .param p1, "delta"    # F

    .line 347
    invoke-direct {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->isSinglePage()Z

    move-result v0

    if-nez v0, :cond_6

    const/4 v0, 0x0

    cmpg-float v1, p1, v0

    const/4 v2, 0x0

    if-nez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    if-eqz v1, :cond_1

    goto :goto_3

    .line 349
    :cond_1
    move v1, p1

    .line 353
    .local v1, "remainingDelta":F
    iget v3, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posY:F

    cmpg-float v3, v3, v0

    if-gez v3, :cond_2

    cmpg-float v3, v1, v0

    if-gez v3, :cond_2

    .line 354
    iget v3, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posY:F

    neg-float v3, v3

    neg-float v4, v1

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    .line 355
    .local v3, "overflowToConsume":F
    iget v4, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posY:F

    add-float/2addr v4, v3

    iput v4, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posY:F

    .line 356
    add-float/2addr v1, v3

    .line 359
    .end local v3    # "overflowToConsume":F
    :cond_2
    iget v3, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->multiPageScrollResidualY:F

    add-float/2addr v3, v1

    .line 360
    .local v3, "desiredScrollDelta":F
    float-to-int v4, v3

    .line 361
    .local v4, "requestedScroll":I
    if-eqz v4, :cond_3

    .line 362
    invoke-direct {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getBaseScrollOffset()F

    move-result v5

    .line 363
    .local v5, "beforeOffset":F
    invoke-virtual {p0, v2, v4}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scrollBy(II)V

    .line 364
    invoke-direct {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getBaseScrollOffset()F

    move-result v2

    sub-float/2addr v2, v5

    iget v6, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    mul-float/2addr v2, v6

    .line 365
    .local v2, "consumedScroll":F
    sub-float v6, v3, v2

    iput v6, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->multiPageScrollResidualY:F

    .end local v2    # "consumedScroll":F
    .end local v5    # "beforeOffset":F
    goto :goto_1

    .line 367
    :cond_3
    iput v3, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->multiPageScrollResidualY:F

    .line 370
    :goto_1
    const/4 v1, 0x0

    .line 374
    iget v2, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->multiPageScrollResidualY:F

    cmpl-float v2, v2, v0

    if-lez v2, :cond_4

    .line 375
    iget v2, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posY:F

    iget v5, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->multiPageScrollResidualY:F

    sub-float/2addr v2, v5

    iput v2, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posY:F

    .line 376
    iput v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->multiPageScrollResidualY:F

    goto :goto_2

    .line 377
    :cond_4
    iget v2, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->multiPageScrollResidualY:F

    cmpg-float v2, v2, v0

    if-gez v2, :cond_5

    const/4 v2, -0x1

    invoke-super {p0, v2}, Landroidx/recyclerview/widget/RecyclerView;->canScrollVertically(I)Z

    move-result v2

    if-nez v2, :cond_5

    .line 378
    iput v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->multiPageScrollResidualY:F

    .line 380
    :cond_5
    :goto_2
    return-void

    .line 347
    .end local v1    # "remainingDelta":F
    .end local v3    # "desiredScrollDelta":F
    .end local v4    # "requestedScroll":I
    :cond_6
    :goto_3
    return-void
.end method

.method private final clampPosition()V
    .locals 5

    .line 319
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getWidth()I

    move-result v0

    int-to-float v0, v0

    iget v1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    mul-float/2addr v0, v1

    .line 320
    .local v0, "contentWidth":F
    iget v1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posX:F

    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getWidth()I

    move-result v2

    int-to-float v2, v2

    sub-float v2, v0, v2

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lkotlin/ranges/RangesKt;->coerceAtLeast(FF)F

    move-result v2

    neg-float v2, v2

    invoke-static {v1, v2, v3}, Lkotlin/ranges/RangesKt;->coerceIn(FFF)F

    move-result v1

    iput v1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posX:F

    .line 322
    invoke-direct {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->isSinglePage()Z

    move-result v1

    if-nez v1, :cond_0

    .line 323
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getHeight()I

    move-result v1

    int-to-float v1, v1

    iget v2, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    const/high16 v4, 0x3f800000    # 1.0f

    sub-float/2addr v2, v4

    mul-float/2addr v1, v2

    invoke-static {v1, v3}, Lkotlin/ranges/RangesKt;->coerceAtLeast(FF)F

    move-result v1

    .line 324
    .local v1, "maxBottomOverflow":F
    iget v2, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posY:F

    neg-float v4, v1

    invoke-static {v2, v4, v3}, Lkotlin/ranges/RangesKt;->coerceIn(FFF)F

    move-result v2

    iput v2, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posY:F

    .line 325
    return-void

    .line 327
    .end local v1    # "maxBottomOverflow":F
    :cond_0
    invoke-direct {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getSinglePageContentHeight()F

    move-result v1

    .line 328
    .local v1, "contentHeight":F
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getHeight()I

    move-result v2

    int-to-float v2, v2

    sub-float v2, v1, v2

    invoke-static {v2, v3}, Lkotlin/ranges/RangesKt;->coerceAtLeast(FF)F

    move-result v2

    .line 329
    .local v2, "maxPosY":F
    iget v3, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posY:F

    neg-float v4, v2

    invoke-static {v3, v4, v2}, Lkotlin/ranges/RangesKt;->coerceIn(FFF)F

    move-result v3

    iput v3, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posY:F

    .line 330
    return-void
.end method

.method private final getBaseScrollOffset()F
    .locals 1

    .line 383
    invoke-super {p0}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I

    move-result v0

    int-to-float v0, v0

    return v0
.end method

.method private final getCurrentMultiPageVisualOffset()F
    .locals 2

    .line 343
    invoke-direct {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getBaseScrollOffset()F

    move-result v0

    iget v1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posY:F

    sub-float/2addr v0, v1

    return v0
.end method

.method private final getSinglePageContentHeight()F
    .locals 3

    .line 333
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getHeight()I

    move-result v0

    .line 334
    .local v0, "childHeight":I
    :goto_0
    int-to-float v1, v0

    iget v2, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    mul-float/2addr v1, v2

    return v1
.end method

.method private final isSinglePage()Z
    .locals 3

    .line 387
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v0

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    const/4 v2, 0x1

    if-gt v0, v2, :cond_1

    move v1, v2

    :cond_1
    return v1
.end method

.method private final isVerticallyScrollable()Z
    .locals 3

    .line 338
    invoke-direct {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->isSinglePage()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 339
    :cond_0
    const/4 v0, 0x1

    invoke-super {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->canScrollVertically(I)Z

    move-result v2

    if-nez v2, :cond_1

    const/4 v2, -0x1

    invoke-super {p0, v2}, Landroidx/recyclerview/widget/RecyclerView;->canScrollVertically(I)Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_1
    move v1, v0

    :cond_2
    return v1
.end method

.method private final zoomTo(FFFJ)V
    .locals 10
    .param p1, "targetScale"    # F
    .param p2, "focusX"    # F
    .param p3, "focusY"    # F
    .param p4, "duration"    # J

    .line 439
    iget v1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    .line 440
    .local v1, "startScale":F
    iget v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posX:F

    sub-float v0, p2, v0

    iget v2, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    div-float v5, v0, v2

    .line 441
    .local v5, "focusXInContent":F
    iget v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posY:F

    sub-float v0, p3, v0

    iget v2, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    div-float v7, v0, v2

    .line 443
    .local v7, "focusYInContent":F
    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v8

    .local v8, "$this$zoomTo_u24lambda_u244":Landroid/animation/ValueAnimator;
    const/4 v9, 0x0

    .line 444
    .local v9, "$i$a$-apply-PinchZoomRecyclerView$zoomTo$1":I
    invoke-virtual {v8, p4, p5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 445
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    check-cast v0, Landroid/animation/TimeInterpolator;

    invoke-virtual {v8, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 446
    new-instance v0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$$ExternalSyntheticLambda1;

    move-object v3, p0

    move v2, p1

    move v4, p2

    move v6, p3

    .end local p1    # "targetScale":F
    .end local p2    # "focusX":F
    .end local p3    # "focusY":F
    .local v2, "targetScale":F
    .local v4, "focusX":F
    .local v6, "focusY":F
    invoke-direct/range {v0 .. v7}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$$ExternalSyntheticLambda1;-><init>(FFLcom/rajat/pdfviewer/PinchZoomRecyclerView;FFFF)V

    invoke-virtual {v8, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 460
    new-instance p1, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$zoomTo$1$2;

    invoke-direct {p1, p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$zoomTo$1$2;-><init>(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)V

    check-cast p1, Landroid/animation/Animator$AnimatorListener;

    invoke-virtual {v8, p1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 465
    invoke-virtual {v8}, Landroid/animation/ValueAnimator;->start()V

    .line 467
    nop

    .line 443
    .end local v8    # "$this$zoomTo_u24lambda_u244":Landroid/animation/ValueAnimator;
    .end local v9    # "$i$a$-apply-PinchZoomRecyclerView$zoomTo$1":I
    nop

    .line 468
    return-void

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method static final zoomTo$lambda$4$lambda$3(FFLcom/rajat/pdfviewer/PinchZoomRecyclerView;FFFFLandroid/animation/ValueAnimator;)V
    .locals 5
    .param p0, "$startScale"    # F
    .param p1, "$targetScale"    # F
    .param p2, "this$0"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;
    .param p3, "$focusX"    # F
    .param p4, "$focusXInContent"    # F
    .param p5, "$focusY"    # F
    .param p6, "$focusYInContent"    # F
    .param p7, "animator"    # Landroid/animation/ValueAnimator;

    const-string v0, "animator"

    invoke-static {p7, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 447
    invoke-virtual {p7}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    const-string/jumbo v1, "null cannot be cast to non-null type kotlin.Float"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 448
    .local v0, "fraction":F
    sub-float v1, p1, p0

    mul-float/2addr v1, v0

    add-float/2addr v1, p0

    .line 449
    .local v1, "scale":F
    iput v1, p2, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    .line 451
    iget v2, p2, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    mul-float/2addr v2, p4

    sub-float v2, p3, v2

    iput v2, p2, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posX:F

    .line 452
    iget v2, p2, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    mul-float/2addr v2, p6

    sub-float v2, p5, v2

    iput v2, p2, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posY:F

    .line 454
    invoke-direct {p2}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->clampPosition()V

    .line 455
    invoke-virtual {p2}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->invalidate()V

    .line 456
    invoke-virtual {p2}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->awakenScrollBars()Z

    .line 458
    iget-object v2, p2, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->zoomChangeListener:Lkotlin/jvm/functions/Function2;

    if-eqz v2, :cond_0

    invoke-virtual {p2}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->isZoomedIn()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    iget v4, p2, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 459
    :cond_0
    return-void
.end method


# virtual methods
.method public canScrollVertically(I)Z
    .locals 6
    .param p1, "direction"    # I

    .line 216
    iget v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-lez v0, :cond_9

    .line 217
    invoke-direct {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->isSinglePage()Z

    move-result v0

    if-nez v0, :cond_8

    .line 218
    iget v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posY:F

    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getHeight()I

    move-result v4

    int-to-float v4, v4

    iget v5, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    sub-float/2addr v5, v1

    mul-float/2addr v4, v5

    const/4 v1, 0x0

    invoke-static {v4, v1}, Lkotlin/ranges/RangesKt;->coerceAtLeast(FF)F

    move-result v4

    neg-float v4, v4

    cmpl-float v0, v0, v4

    if-lez v0, :cond_0

    move v0, v3

    goto :goto_0

    :cond_0
    move v0, v2

    .line 219
    .local v0, "hasBottomOverflowRoom":Z
    :goto_0
    nop

    .line 220
    if-lez p1, :cond_2

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->canScrollVertically(I)Z

    move-result v1

    if-nez v1, :cond_1

    if-eqz v0, :cond_7

    :cond_1
    move v2, v3

    goto :goto_2

    .line 221
    :cond_2
    if-gez p1, :cond_4

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->canScrollVertically(I)Z

    move-result v4

    if-nez v4, :cond_3

    iget v4, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posY:F

    cmpg-float v1, v4, v1

    if-gez v1, :cond_7

    :cond_3
    move v2, v3

    goto :goto_2

    .line 222
    :cond_4
    invoke-super {p0, v3}, Landroidx/recyclerview/widget/RecyclerView;->canScrollVertically(I)Z

    move-result v4

    if-nez v4, :cond_6

    const/4 v4, -0x1

    invoke-super {p0, v4}, Landroidx/recyclerview/widget/RecyclerView;->canScrollVertically(I)Z

    move-result v4

    if-nez v4, :cond_6

    iget v4, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posY:F

    cmpg-float v1, v4, v1

    if-nez v1, :cond_5

    move v1, v3

    goto :goto_1

    :cond_5
    move v1, v2

    :goto_1
    if-nez v1, :cond_7

    :cond_6
    move v2, v3

    .line 219
    :cond_7
    :goto_2
    return v2

    .line 225
    .end local v0    # "hasBottomOverflowRoom":Z
    :cond_8
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->canScrollVertically(I)Z

    move-result v0

    return v0

    .line 227
    :cond_9
    invoke-direct {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->isSinglePage()Z

    move-result v0

    if-nez v0, :cond_a

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->canScrollVertically(I)Z

    move-result v0

    if-eqz v0, :cond_a

    move v2, v3

    :cond_a
    return v2
.end method

.method public computeVerticalScrollOffset()I
    .locals 2

    .line 234
    invoke-direct {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getBaseScrollOffset()F

    move-result v0

    iget v1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posY:F

    sub-float/2addr v0, v1

    invoke-static {v0}, Lkotlin/math/MathKt;->roundToInt(F)I

    move-result v0

    return v0
.end method

.method public computeVerticalScrollRange()I
    .locals 2

    .line 241
    invoke-super {p0}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollRange()I

    move-result v0

    int-to-float v0, v0

    iget v1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    mul-float/2addr v0, v1

    invoke-static {v0}, Lkotlin/math/MathKt;->roundToInt(F)I

    move-result v0

    return v0
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 9
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    const-string v0, "canvas"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 204
    iget v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posX:F

    .local v0, "x$iv":F
    iget v1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posY:F

    .local v1, "y$iv":F
    move-object v2, p1

    .local v2, "$this$withTranslation$iv":Landroid/graphics/Canvas;
    const/4 v3, 0x0

    .line 486
    .local v3, "$i$f$withTranslation":I
    invoke-virtual {v2}, Landroid/graphics/Canvas;->save()I

    move-result v4

    .line 487
    .local v4, "checkpoint$iv":I
    invoke-virtual {v2, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 488
    nop

    .line 489
    move-object v5, v2

    .local v5, "$this$dispatchDraw_u24lambda_u242":Landroid/graphics/Canvas;
    const/4 v6, 0x0

    .line 205
    .local v6, "$i$a$-withTranslation-PinchZoomRecyclerView$dispatchDraw$1":I
    :try_start_0
    iget v7, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    iget v8, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    invoke-virtual {v5, v7, v8}, Landroid/graphics/Canvas;->scale(FF)V

    .line 206
    invoke-super {p0, v5}, Landroidx/recyclerview/widget/RecyclerView;->dispatchDraw(Landroid/graphics/Canvas;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 207
    nop

    .line 489
    .end local v5    # "$this$dispatchDraw_u24lambda_u242":Landroid/graphics/Canvas;
    .end local v6    # "$i$a$-withTranslation-PinchZoomRecyclerView$dispatchDraw$1":I
    nop

    .line 491
    invoke-virtual {v2, v4}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 492
    nop

    .line 493
    nop

    .line 208
    .end local v0    # "x$iv":F
    .end local v1    # "y$iv":F
    .end local v2    # "$this$withTranslation$iv":Landroid/graphics/Canvas;
    .end local v3    # "$i$f$withTranslation":I
    .end local v4    # "checkpoint$iv":I
    return-void

    .line 491
    .restart local v0    # "x$iv":F
    .restart local v1    # "y$iv":F
    .restart local v2    # "$this$withTranslation$iv":Landroid/graphics/Canvas;
    .restart local v3    # "$i$f$withTranslation":I
    .restart local v4    # "checkpoint$iv":I
    :catchall_0
    move-exception v5

    invoke-virtual {v2, v4}, Landroid/graphics/Canvas;->restoreToCount(I)V

    throw v5
.end method

.method public fling(II)Z
    .locals 2
    .param p1, "velocityX"    # I
    .param p2, "velocityY"    # I

    .line 305
    iget v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    .line 307
    const/4 v0, 0x0

    invoke-super {p0, v0, p2}, Landroidx/recyclerview/widget/RecyclerView;->fling(II)Z

    move-result v0

    goto :goto_0

    .line 309
    :cond_0
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->fling(II)Z

    move-result v0

    .line 305
    :goto_0
    return v0
.end method

.method public final getMaxZoomScale()F
    .locals 1

    .line 68
    iget v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->maxZoom:F

    return v0
.end method

.method public final getZoomScale()F
    .locals 1

    .line 66
    iget v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    return v0
.end method

.method public final isZoomedIn()Z
    .locals 2

    .line 64
    iget v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 9
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    const-string v0, "canvas"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 197
    iget v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posX:F

    .local v0, "x$iv":F
    iget v1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posY:F

    .local v1, "y$iv":F
    move-object v2, p1

    .local v2, "$this$withTranslation$iv":Landroid/graphics/Canvas;
    const/4 v3, 0x0

    .line 478
    .local v3, "$i$f$withTranslation":I
    invoke-virtual {v2}, Landroid/graphics/Canvas;->save()I

    move-result v4

    .line 479
    .local v4, "checkpoint$iv":I
    invoke-virtual {v2, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 480
    nop

    .line 481
    move-object v5, v2

    .local v5, "$this$onDraw_u24lambda_u241":Landroid/graphics/Canvas;
    const/4 v6, 0x0

    .line 198
    .local v6, "$i$a$-withTranslation-PinchZoomRecyclerView$onDraw$1":I
    :try_start_0
    iget v7, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    iget v8, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    invoke-virtual {v5, v7, v8}, Landroid/graphics/Canvas;->scale(FF)V

    .line 199
    invoke-super {p0, v5}, Landroidx/recyclerview/widget/RecyclerView;->onDraw(Landroid/graphics/Canvas;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 200
    nop

    .line 481
    .end local v5    # "$this$onDraw_u24lambda_u241":Landroid/graphics/Canvas;
    .end local v6    # "$i$a$-withTranslation-PinchZoomRecyclerView$onDraw$1":I
    nop

    .line 483
    invoke-virtual {v2, v4}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 484
    nop

    .line 485
    nop

    .line 201
    .end local v0    # "x$iv":F
    .end local v1    # "y$iv":F
    .end local v2    # "$this$withTranslation$iv":Landroid/graphics/Canvas;
    .end local v3    # "$i$f$withTranslation":I
    .end local v4    # "checkpoint$iv":I
    return-void

    .line 483
    .restart local v0    # "x$iv":F
    .restart local v1    # "y$iv":F
    .restart local v2    # "$this$withTranslation$iv":Landroid/graphics/Canvas;
    .restart local v3    # "$i$f$withTranslation":I
    .restart local v4    # "checkpoint$iv":I
    :catchall_0
    move-exception v5

    invoke-virtual {v2, v4}, Landroid/graphics/Canvas;->restoreToCount(I)V

    throw v5
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "ev"    # Landroid/view/MotionEvent;

    const-string v0, "ev"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 190
    iget-boolean v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->isZoomingInProgress:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    :goto_0
    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 10
    .param p1, "ev"    # Landroid/view/MotionEvent;

    const-string v0, "ev"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 96
    iget-boolean v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->isZoomEnabled:Z

    if-nez v0, :cond_0

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 98
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x6

    const/4 v2, 0x1

    if-ne v0, v1, :cond_1

    .line 99
    iput-boolean v2, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->ignoreScaleAfterPointerUp:Z

    .line 102
    :cond_1
    iget-object v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->gestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 103
    iget-object v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 105
    iget-boolean v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->isZoomingInProgress:Z

    if-eqz v0, :cond_2

    .line 106
    return v2

    .line 109
    :cond_2
    iget v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpg-float v0, v0, v1

    const/4 v3, 0x0

    if-gtz v0, :cond_3

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_0

    :cond_3
    move v0, v3

    .line 111
    .local v0, "superHandled":Z
    :goto_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v4

    const/4 v5, -0x1

    const/4 v6, 0x0

    packed-switch v4, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_4

    .line 155
    :pswitch_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v4

    .line 156
    .local v4, "pointerIndex":I
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v5

    .line 157
    .local v5, "pointerId":I
    iget v6, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->activePointerId:I

    if-ne v5, v6, :cond_5

    .line 158
    if-nez v4, :cond_4

    move v6, v2

    goto :goto_1

    :cond_4
    move v6, v3

    .line 159
    .local v6, "newPointerIndex":I
    :goto_1
    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->getX(I)F

    move-result v7

    iput v7, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->lastTouchX:F

    .line 160
    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->getY(I)F

    move-result v7

    iput v7, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->lastTouchY:F

    .line 161
    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v7

    iput v7, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->activePointerId:I

    .line 163
    .end local v6    # "newPointerIndex":I
    :cond_5
    iput-boolean v2, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->blockPanUntilNextDown:Z

    .end local v4    # "pointerIndex":I
    .end local v5    # "pointerId":I
    goto/16 :goto_4

    .line 167
    :pswitch_2
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    if-eqz v4, :cond_6

    invoke-interface {v4, v3}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 168
    :cond_6
    iput v5, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->activePointerId:I

    .line 169
    iput-boolean v3, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->ignoreScaleAfterPointerUp:Z

    .line 170
    iput v6, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->multiPageScrollResidualY:F

    .line 171
    iput-boolean v3, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->blockPanUntilNextDown:Z

    goto/16 :goto_4

    .line 124
    :pswitch_3
    invoke-direct {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->isVerticallyScrollable()Z

    move-result v4

    if-nez v4, :cond_7

    iget v4, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    cmpl-float v4, v4, v1

    if-lez v4, :cond_8

    .line 125
    :cond_7
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    if-eqz v4, :cond_8

    invoke-interface {v4, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 127
    :cond_8
    iget-object v4, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v4}, Landroid/view/ScaleGestureDetector;->isInProgress()Z

    move-result v4

    if-nez v4, :cond_10

    iget v4, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    cmpl-float v4, v4, v1

    if-lez v4, :cond_10

    .line 128
    iget v4, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->activePointerId:I

    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v4

    .line 129
    .restart local v4    # "pointerIndex":I
    if-eq v4, v5, :cond_10

    .line 130
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getX(I)F

    move-result v5

    .line 131
    .local v5, "x":F
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getY(I)F

    move-result v6

    .line 132
    .local v6, "y":F
    iget-boolean v7, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->blockPanUntilNextDown:Z

    if-eqz v7, :cond_b

    .line 133
    iput v5, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->lastTouchX:F

    .line 134
    iput v6, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->lastTouchY:F

    .line 135
    if-nez v0, :cond_a

    iget v7, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    cmpl-float v1, v7, v1

    if-lez v1, :cond_9

    goto :goto_2

    :cond_9
    move v2, v3

    :cond_a
    :goto_2
    return v2

    .line 137
    :cond_b
    iget v7, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->lastTouchX:F

    sub-float v7, v5, v7

    .line 138
    .local v7, "dx":F
    iget v8, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->lastTouchY:F

    sub-float v8, v6, v8

    .line 139
    .local v8, "dy":F
    iget v9, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posX:F

    add-float/2addr v9, v7

    iput v9, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posX:F

    .line 140
    invoke-direct {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->isSinglePage()Z

    move-result v9

    if-eqz v9, :cond_c

    .line 141
    iget v9, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posY:F

    add-float/2addr v9, v8

    iput v9, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->posY:F

    goto :goto_3

    .line 143
    :cond_c
    neg-float v9, v8

    invoke-direct {p0, v9}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->applyMultiPageVisualOffsetDelta(F)V

    .line 145
    :goto_3
    invoke-direct {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->clampPosition()V

    .line 146
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->invalidate()V

    .line 148
    iput v5, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->lastTouchX:F

    .line 149
    iput v6, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->lastTouchY:F

    .end local v4    # "pointerIndex":I
    .end local v5    # "x":F
    .end local v6    # "y":F
    .end local v7    # "dx":F
    .end local v8    # "dy":F
    goto :goto_4

    .line 175
    :pswitch_4
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    if-eqz v4, :cond_d

    invoke-interface {v4, v3}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 176
    :cond_d
    iput v5, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->activePointerId:I

    .line 177
    iput-boolean v3, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->ignoreScaleAfterPointerUp:Z

    .line 178
    iput v6, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->multiPageScrollResidualY:F

    .line 179
    iput-boolean v3, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->blockPanUntilNextDown:Z

    goto :goto_4

    .line 113
    :pswitch_5
    invoke-direct {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->isVerticallyScrollable()Z

    move-result v4

    if-nez v4, :cond_e

    iget v4, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    cmpl-float v4, v4, v1

    if-lez v4, :cond_f

    .line 114
    :cond_e
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    if-eqz v4, :cond_f

    invoke-interface {v4, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 116
    :cond_f
    iput v6, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->multiPageScrollResidualY:F

    .line 117
    iput-boolean v3, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->blockPanUntilNextDown:Z

    .line 118
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    iput v4, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->lastTouchX:F

    .line 119
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    iput v4, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->lastTouchY:F

    .line 120
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v4

    iput v4, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->activePointerId:I

    .line 183
    :cond_10
    :goto_4
    if-nez v0, :cond_12

    iget v4, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    cmpl-float v1, v4, v1

    if-lez v1, :cond_11

    goto :goto_5

    :cond_11
    move v2, v3

    :cond_12
    :goto_5
    return v2

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public final resetZoom()V
    .locals 8

    .line 431
    iget-boolean v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->isZoomEnabled:Z

    if-nez v0, :cond_0

    return-void

    .line 432
    :cond_0
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float v4, v0, v1

    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getHeight()I

    move-result v0

    int-to-float v0, v0

    div-float v5, v0, v1

    iget-wide v6, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->zoomDuration:J

    const/high16 v3, 0x3f800000    # 1.0f

    move-object v2, p0

    invoke-direct/range {v2 .. v7}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->zoomTo(FFFJ)V

    .line 433
    return-void
.end method

.method public final setMaxZoomScale(F)V
    .locals 3
    .param p1, "maxZoomScale"    # F

    .line 71
    const/high16 v0, 0x3f800000    # 1.0f

    const/high16 v1, 0x40a00000    # 5.0f

    invoke-static {p1, v0, v1}, Lkotlin/ranges/RangesKt;->coerceIn(FFF)F

    move-result v0

    iput v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->maxZoom:F

    .line 72
    iget v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    iget v1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->maxZoom:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    .line 73
    iget v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->maxZoom:F

    iput v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    .line 74
    invoke-direct {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->clampPosition()V

    .line 75
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->invalidate()V

    .line 76
    iget-object v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->zoomChangeListener:Lkotlin/jvm/functions/Function2;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->isZoomedIn()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iget v2, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    :cond_0
    return-void
.end method

.method public final setOnZoomChangeListener(Lkotlin/jvm/functions/Function2;)V
    .locals 1
    .param p1, "listener"    # Lkotlin/jvm/functions/Function2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Ljava/lang/Boolean;",
            "-",
            "Ljava/lang/Float;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    const-string v0, "listener"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 81
    iput-object p1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->zoomChangeListener:Lkotlin/jvm/functions/Function2;

    .line 82
    return-void
.end method

.method public final setOnZoomEndListener(Lkotlin/jvm/functions/Function1;)V
    .locals 1
    .param p1, "listener"    # Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Float;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    const-string v0, "listener"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 85
    iput-object p1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->zoomEndListener:Lkotlin/jvm/functions/Function1;

    .line 86
    return-void
.end method

.method public final setOnZoomSettledListener(Lkotlin/jvm/functions/Function1;)V
    .locals 1
    .param p1, "listener"    # Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Float;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    const-string v0, "listener"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 89
    iput-object p1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->zoomEndListener:Lkotlin/jvm/functions/Function1;

    .line 90
    return-void
.end method

.method public final setZoomEnabled(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .line 61
    iput-boolean p1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->isZoomEnabled:Z

    .line 62
    return-void
.end method

.method public final zoomIn()V
    .locals 8

    .line 413
    iget-boolean v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->isZoomEnabled:Z

    if-nez v0, :cond_0

    return-void

    .line 414
    :cond_0
    iget v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    const/high16 v1, 0x3f000000    # 0.5f

    add-float/2addr v0, v1

    iget v1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->maxZoom:F

    invoke-static {v0, v1}, Lkotlin/ranges/RangesKt;->coerceAtMost(FF)F

    move-result v3

    .line 415
    .local v3, "targetScale":F
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float v4, v0, v1

    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getHeight()I

    move-result v0

    int-to-float v0, v0

    div-float v5, v0, v1

    iget-wide v6, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->zoomDuration:J

    move-object v2, p0

    invoke-direct/range {v2 .. v7}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->zoomTo(FFFJ)V

    .line 416
    return-void
.end method

.method public final zoomOut()V
    .locals 8

    .line 422
    iget-boolean v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->isZoomEnabled:Z

    if-nez v0, :cond_0

    return-void

    .line 423
    :cond_0
    iget v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->scaleFactor:F

    const/high16 v1, 0x3f000000    # 0.5f

    sub-float/2addr v0, v1

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v0, v1}, Lkotlin/ranges/RangesKt;->coerceAtLeast(FF)F

    move-result v3

    .line 424
    .local v3, "targetScale":F
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float v4, v0, v1

    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->getHeight()I

    move-result v0

    int-to-float v0, v0

    div-float v5, v0, v1

    iget-wide v6, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->zoomDuration:J

    move-object v2, p0

    invoke-direct/range {v2 .. v7}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->zoomTo(FFFJ)V

    .line 425
    return-void
.end method
