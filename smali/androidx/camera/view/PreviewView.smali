.class public final Landroidx/camera/view/PreviewView;
.super Landroid/widget/FrameLayout;
.source "PreviewView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/view/PreviewView$ImplementationMode;,
        Landroidx/camera/view/PreviewView$StreamState;,
        Landroidx/camera/view/PreviewView$DisplayRotationListener;,
        Landroidx/camera/view/PreviewView$ScaleType;,
        Landroidx/camera/view/PreviewView$PinchToZoomOnScaleGestureListener;,
        Landroidx/camera/view/PreviewView$OnFrameUpdateListener;
    }
.end annotation


# static fields
.field static final DEFAULT_BACKGROUND_COLOR:I = 0x106000c

.field private static final DEFAULT_IMPL_MODE:Landroidx/camera/view/PreviewView$ImplementationMode;

.field private static final TAG:Ljava/lang/String; = "PreviewView"


# instance fields
.field final mActiveStreamStateObserver:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Landroidx/camera/view/PreviewStreamStateObserver;",
            ">;"
        }
    .end annotation
.end field

.field mCameraController:Landroidx/camera/view/CameraController;

.field mCameraInfoInternal:Landroidx/camera/core/impl/CameraInfoInternal;

.field private final mDisplayRotationListener:Landroidx/camera/view/PreviewView$DisplayRotationListener;

.field mImplementation:Landroidx/camera/view/PreviewViewImplementation;

.field mImplementationMode:Landroidx/camera/view/PreviewView$ImplementationMode;

.field mOnFrameUpdateListener:Landroidx/camera/view/PreviewView$OnFrameUpdateListener;

.field mOnFrameUpdateListenerExecutor:Ljava/util/concurrent/Executor;

.field private final mOnLayoutChangeListener:Landroid/view/View$OnLayoutChangeListener;

.field final mPreviewStreamStateLiveData:Landroidx/lifecycle/MutableLiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/MutableLiveData<",
            "Landroidx/camera/view/PreviewView$StreamState;",
            ">;"
        }
    .end annotation
.end field

.field final mPreviewTransform:Landroidx/camera/view/PreviewTransformation;

.field mPreviewViewMeteringPointFactory:Landroidx/camera/view/PreviewViewMeteringPointFactory;

.field private final mScaleGestureDetector:Landroid/view/ScaleGestureDetector;

.field final mSurfaceProvider:Landroidx/camera/core/Preview$SurfaceProvider;

.field private mTouchUpEvent:Landroid/view/MotionEvent;

.field mUseDisplayRotation:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 122
    sget-object v0, Landroidx/camera/view/PreviewView$ImplementationMode;->PERFORMANCE:Landroidx/camera/view/PreviewView$ImplementationMode;

    sput-object v0, Landroidx/camera/view/PreviewView;->DEFAULT_IMPL_MODE:Landroidx/camera/view/PreviewView$ImplementationMode;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 273
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroidx/camera/view/PreviewView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 274
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 278
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroidx/camera/view/PreviewView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 279
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .line 283
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Landroidx/camera/view/PreviewView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 284
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .line 289
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 125
    sget-object v0, Landroidx/camera/view/PreviewView;->DEFAULT_IMPL_MODE:Landroidx/camera/view/PreviewView$ImplementationMode;

    iput-object v0, p0, Landroidx/camera/view/PreviewView;->mImplementationMode:Landroidx/camera/view/PreviewView$ImplementationMode;

    .line 133
    new-instance v0, Landroidx/camera/view/PreviewTransformation;

    invoke-direct {v0}, Landroidx/camera/view/PreviewTransformation;-><init>()V

    iput-object v0, p0, Landroidx/camera/view/PreviewView;->mPreviewTransform:Landroidx/camera/view/PreviewTransformation;

    .line 135
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/camera/view/PreviewView;->mUseDisplayRotation:Z

    .line 138
    new-instance v0, Landroidx/lifecycle/MutableLiveData;

    sget-object v1, Landroidx/camera/view/PreviewView$StreamState;->IDLE:Landroidx/camera/view/PreviewView$StreamState;

    invoke-direct {v0, v1}, Landroidx/lifecycle/MutableLiveData;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/camera/view/PreviewView;->mPreviewStreamStateLiveData:Landroidx/lifecycle/MutableLiveData;

    .line 144
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Landroidx/camera/view/PreviewView;->mActiveStreamStateObserver:Ljava/util/concurrent/atomic/AtomicReference;

    .line 161
    new-instance v0, Landroidx/camera/view/PreviewViewMeteringPointFactory;

    iget-object v1, p0, Landroidx/camera/view/PreviewView;->mPreviewTransform:Landroidx/camera/view/PreviewTransformation;

    invoke-direct {v0, v1}, Landroidx/camera/view/PreviewViewMeteringPointFactory;-><init>(Landroidx/camera/view/PreviewTransformation;)V

    iput-object v0, p0, Landroidx/camera/view/PreviewView;->mPreviewViewMeteringPointFactory:Landroidx/camera/view/PreviewViewMeteringPointFactory;

    .line 177
    new-instance v0, Landroidx/camera/view/PreviewView$DisplayRotationListener;

    invoke-direct {v0, p0}, Landroidx/camera/view/PreviewView$DisplayRotationListener;-><init>(Landroidx/camera/view/PreviewView;)V

    iput-object v0, p0, Landroidx/camera/view/PreviewView;->mDisplayRotationListener:Landroidx/camera/view/PreviewView$DisplayRotationListener;

    .line 180
    new-instance v0, Landroidx/camera/view/PreviewView$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Landroidx/camera/view/PreviewView$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/view/PreviewView;)V

    iput-object v0, p0, Landroidx/camera/view/PreviewView;->mOnLayoutChangeListener:Landroid/view/View$OnLayoutChangeListener;

    .line 191
    new-instance v0, Landroidx/camera/view/PreviewView$1;

    invoke-direct {v0, p0}, Landroidx/camera/view/PreviewView$1;-><init>(Landroidx/camera/view/PreviewView;)V

    iput-object v0, p0, Landroidx/camera/view/PreviewView;->mSurfaceProvider:Landroidx/camera/core/Preview$SurfaceProvider;

    .line 290
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 291
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    sget-object v1, Landroidx/camera/view/R$styleable;->PreviewView:[I

    invoke-virtual {v0, p2, v1, p3, p4}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v6

    .line 293
    .local v6, "attributes":Landroid/content/res/TypedArray;
    sget-object v4, Landroidx/camera/view/R$styleable;->PreviewView:[I

    move-object v2, p0

    move-object v3, p1

    move-object v5, p2

    move v7, p3

    move v8, p4

    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "attrs":Landroid/util/AttributeSet;
    .end local p3    # "defStyleAttr":I
    .end local p4    # "defStyleRes":I
    .local v3, "context":Landroid/content/Context;
    .local v5, "attrs":Landroid/util/AttributeSet;
    .local v7, "defStyleAttr":I
    .local v8, "defStyleRes":I
    invoke-static/range {v2 .. v8}, Landroidx/core/view/ViewCompat;->saveAttributeDataForStyleable(Landroid/view/View;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;II)V

    .line 297
    :try_start_0
    sget p1, Landroidx/camera/view/R$styleable;->PreviewView_scaleType:I

    iget-object p2, p0, Landroidx/camera/view/PreviewView;->mPreviewTransform:Landroidx/camera/view/PreviewTransformation;

    .line 299
    invoke-virtual {p2}, Landroidx/camera/view/PreviewTransformation;->getScaleType()Landroidx/camera/view/PreviewView$ScaleType;

    move-result-object p2

    invoke-virtual {p2}, Landroidx/camera/view/PreviewView$ScaleType;->getId()I

    move-result p2

    .line 297
    invoke-virtual {v6, p1, p2}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result p1

    .line 300
    .local p1, "scaleTypeId":I
    invoke-static {p1}, Landroidx/camera/view/PreviewView$ScaleType;->fromId(I)Landroidx/camera/view/PreviewView$ScaleType;

    move-result-object p2

    invoke-virtual {p0, p2}, Landroidx/camera/view/PreviewView;->setScaleType(Landroidx/camera/view/PreviewView$ScaleType;)V

    .line 302
    sget p2, Landroidx/camera/view/R$styleable;->PreviewView_implementationMode:I

    sget-object p3, Landroidx/camera/view/PreviewView;->DEFAULT_IMPL_MODE:Landroidx/camera/view/PreviewView$ImplementationMode;

    .line 304
    invoke-virtual {p3}, Landroidx/camera/view/PreviewView$ImplementationMode;->getId()I

    move-result p3

    .line 303
    invoke-virtual {v6, p2, p3}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result p2

    .line 305
    .local p2, "implementationModeId":I
    invoke-static {p2}, Landroidx/camera/view/PreviewView$ImplementationMode;->fromId(I)Landroidx/camera/view/PreviewView$ImplementationMode;

    move-result-object p3

    invoke-virtual {p0, p3}, Landroidx/camera/view/PreviewView;->setImplementationMode(Landroidx/camera/view/PreviewView$ImplementationMode;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 307
    .end local p1    # "scaleTypeId":I
    .end local p2    # "implementationModeId":I
    invoke-virtual {v6}, Landroid/content/res/TypedArray;->recycle()V

    .line 308
    nop

    .line 310
    new-instance p1, Landroid/view/ScaleGestureDetector;

    new-instance p2, Landroidx/camera/view/PreviewView$PinchToZoomOnScaleGestureListener;

    invoke-direct {p2, p0}, Landroidx/camera/view/PreviewView$PinchToZoomOnScaleGestureListener;-><init>(Landroidx/camera/view/PreviewView;)V

    invoke-direct {p1, v3, p2}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    iput-object p1, p0, Landroidx/camera/view/PreviewView;->mScaleGestureDetector:Landroid/view/ScaleGestureDetector;

    .line 315
    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-nez p1, :cond_0

    .line 316
    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->getContext()Landroid/content/Context;

    move-result-object p1

    const p2, 0x106000c

    invoke-static {p1, p2}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p1

    invoke-virtual {p0, p1}, Landroidx/camera/view/PreviewView;->setBackgroundColor(I)V

    .line 318
    :cond_0
    return-void

    .line 307
    :catchall_0
    move-exception v0

    move-object p1, v0

    invoke-virtual {v6}, Landroid/content/res/TypedArray;->recycle()V

    .line 308
    throw p1
.end method

.method private attachToControllerIfReady(Z)V
    .locals 4
    .param p1, "shouldFailSilently"    # Z

    .line 1041
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1042
    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->getViewPort()Landroidx/camera/core/ViewPort;

    move-result-object v0

    .line 1043
    .local v0, "viewPort":Landroidx/camera/core/ViewPort;
    iget-object v1, p0, Landroidx/camera/view/PreviewView;->mCameraController:Landroidx/camera/view/CameraController;

    if-eqz v1, :cond_1

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->isAttachedToWindow()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1045
    :try_start_0
    iget-object v1, p0, Landroidx/camera/view/PreviewView;->mCameraController:Landroidx/camera/view/CameraController;

    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->getSurfaceProvider()Landroidx/camera/core/Preview$SurfaceProvider;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Landroidx/camera/view/CameraController;->attachPreviewSurface(Landroidx/camera/core/Preview$SurfaceProvider;Landroidx/camera/core/ViewPort;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1054
    goto :goto_0

    .line 1046
    :catch_0
    move-exception v1

    .line 1047
    .local v1, "ex":Ljava/lang/IllegalStateException;
    if-eqz p1, :cond_0

    .line 1050
    const-string/jumbo v2, "PreviewView"

    invoke-virtual {v1}, Ljava/lang/IllegalStateException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v1}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 1052
    :cond_0
    throw v1

    .line 1056
    .end local v1    # "ex":Ljava/lang/IllegalStateException;
    :cond_1
    :goto_0
    return-void
.end method

.method private getDisplayManager()Landroid/hardware/display/DisplayManager;
    .locals 3

    .line 1077
    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 1078
    .local v0, "context":Landroid/content/Context;
    if-nez v0, :cond_0

    .line 1079
    const/4 v1, 0x0

    return-object v1

    .line 1081
    :cond_0
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 1082
    const-string/jumbo v2, "display"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/display/DisplayManager;

    .line 1081
    return-object v1
.end method

.method private getViewPortScaleType()I
    .locals 3

    .line 632
    sget-object v0, Landroidx/camera/view/PreviewView$2;->$SwitchMap$androidx$camera$view$PreviewView$ScaleType:[I

    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->getScaleType()Landroidx/camera/view/PreviewView$ScaleType;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/camera/view/PreviewView$ScaleType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 646
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Unexpected scale type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->getScaleType()Landroidx/camera/view/PreviewView$ScaleType;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 644
    :pswitch_0
    const/4 v0, 0x3

    return v0

    .line 638
    :pswitch_1
    const/4 v0, 0x0

    return v0

    .line 636
    :pswitch_2
    const/4 v0, 0x1

    return v0

    .line 634
    :pswitch_3
    const/4 v0, 0x2

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method static shouldReuseImplementation(Landroidx/camera/view/PreviewViewImplementation;Landroidx/camera/core/SurfaceRequest;Landroidx/camera/view/PreviewView$ImplementationMode;)Z
    .locals 1
    .param p0, "implementation"    # Landroidx/camera/view/PreviewViewImplementation;
    .param p1, "surfaceRequest"    # Landroidx/camera/core/SurfaceRequest;
    .param p2, "mode"    # Landroidx/camera/view/PreviewView$ImplementationMode;

    .line 670
    instance-of v0, p0, Landroidx/camera/view/SurfaceViewImplementation;

    if-eqz v0, :cond_0

    invoke-static {p1, p2}, Landroidx/camera/view/PreviewView;->shouldUseTextureView(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/view/PreviewView$ImplementationMode;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method static shouldUseTextureView(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/view/PreviewView$ImplementationMode;)Z
    .locals 6
    .param p0, "surfaceRequest"    # Landroidx/camera/core/SurfaceRequest;
    .param p1, "implementationMode"    # Landroidx/camera/view/PreviewView$ImplementationMode;

    .line 680
    invoke-virtual {p0}, Landroidx/camera/core/SurfaceRequest;->getCamera()Landroidx/camera/core/impl/CameraInternal;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraInternal;->getCameraInfoInternal()Landroidx/camera/core/impl/CameraInfoInternal;

    move-result-object v0

    .line 681
    invoke-interface {v0}, Landroidx/camera/core/impl/CameraInfoInternal;->getImplementationType()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "androidx.camera.camera2.legacy"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 682
    .local v0, "isLegacyDevice":Z
    const-class v1, Landroidx/camera/view/internal/compat/quirk/SurfaceViewStretchedQuirk;

    invoke-static {v1}, Landroidx/camera/view/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_1

    const-class v1, Landroidx/camera/view/internal/compat/quirk/SurfaceViewNotCroppedByParentQuirk;

    .line 683
    invoke-static {v1}, Landroidx/camera/view/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    goto :goto_1

    :cond_1
    :goto_0
    move v1, v3

    .line 684
    .local v1, "hasSurfaceViewQuirk":Z
    :goto_1
    if-nez v0, :cond_3

    if-eqz v1, :cond_2

    goto :goto_2

    .line 689
    :cond_2
    sget-object v4, Landroidx/camera/view/PreviewView$2;->$SwitchMap$androidx$camera$view$PreviewView$ImplementationMode:[I

    invoke-virtual {p1}, Landroidx/camera/view/PreviewView$ImplementationMode;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_0

    .line 695
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid implementation mode: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 693
    :pswitch_0
    return v2

    .line 691
    :pswitch_1
    return v3

    .line 687
    :cond_3
    :goto_2
    return v3

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private startListeningToDisplayChange()V
    .locals 4

    .line 1059
    invoke-direct {p0}, Landroidx/camera/view/PreviewView;->getDisplayManager()Landroid/hardware/display/DisplayManager;

    move-result-object v0

    .line 1060
    .local v0, "displayManager":Landroid/hardware/display/DisplayManager;
    if-nez v0, :cond_0

    .line 1061
    return-void

    .line 1063
    :cond_0
    iget-object v1, p0, Landroidx/camera/view/PreviewView;->mDisplayRotationListener:Landroidx/camera/view/PreviewView$DisplayRotationListener;

    new-instance v2, Landroid/os/Handler;

    .line 1064
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 1063
    invoke-virtual {v0, v1, v2}, Landroid/hardware/display/DisplayManager;->registerDisplayListener(Landroid/hardware/display/DisplayManager$DisplayListener;Landroid/os/Handler;)V

    .line 1065
    return-void
.end method

.method private stopListeningToDisplayChange()V
    .locals 2

    .line 1068
    invoke-direct {p0}, Landroidx/camera/view/PreviewView;->getDisplayManager()Landroid/hardware/display/DisplayManager;

    move-result-object v0

    .line 1069
    .local v0, "displayManager":Landroid/hardware/display/DisplayManager;
    if-nez v0, :cond_0

    .line 1070
    return-void

    .line 1072
    :cond_0
    iget-object v1, p0, Landroidx/camera/view/PreviewView;->mDisplayRotationListener:Landroidx/camera/view/PreviewView$DisplayRotationListener;

    invoke-virtual {v0, v1}, Landroid/hardware/display/DisplayManager;->unregisterDisplayListener(Landroid/hardware/display/DisplayManager$DisplayListener;)V

    .line 1073
    return-void
.end method


# virtual methods
.method public getBitmap()Landroid/graphics/Bitmap;
    .locals 1

    .line 549
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 550
    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mImplementation:Landroidx/camera/view/PreviewViewImplementation;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mImplementation:Landroidx/camera/view/PreviewViewImplementation;

    invoke-virtual {v0}, Landroidx/camera/view/PreviewViewImplementation;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getController()Landroidx/camera/view/CameraController;
    .locals 1

    .line 961
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 962
    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mCameraController:Landroidx/camera/view/CameraController;

    return-object v0
.end method

.method public getImplementationMode()Landroidx/camera/view/PreviewView$ImplementationMode;
    .locals 1

    .line 414
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 415
    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mImplementationMode:Landroidx/camera/view/PreviewView$ImplementationMode;

    return-object v0
.end method

.method public getMeteringPointFactory()Landroidx/camera/core/MeteringPointFactory;
    .locals 1

    .line 499
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 500
    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mPreviewViewMeteringPointFactory:Landroidx/camera/view/PreviewViewMeteringPointFactory;

    return-object v0
.end method

.method public getOutputTransform()Landroidx/camera/view/transform/OutputTransform;
    .locals 6

    .line 984
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 985
    const/4 v0, 0x0

    .line 987
    .local v0, "matrix":Landroid/graphics/Matrix;
    :try_start_0
    iget-object v1, p0, Landroidx/camera/view/PreviewView;->mPreviewTransform:Landroidx/camera/view/PreviewTransformation;

    new-instance v2, Landroid/util/Size;

    .line 988
    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->getHeight()I

    move-result v4

    invoke-direct {v2, v3, v4}, Landroid/util/Size;-><init>(II)V

    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->getLayoutDirection()I

    move-result v3

    .line 987
    invoke-virtual {v1, v2, v3}, Landroidx/camera/view/PreviewTransformation;->getSurfaceToPreviewViewMatrix(Landroid/util/Size;I)Landroid/graphics/Matrix;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    .line 991
    goto :goto_0

    .line 989
    :catch_0
    move-exception v1

    .line 993
    :goto_0
    iget-object v1, p0, Landroidx/camera/view/PreviewView;->mPreviewTransform:Landroidx/camera/view/PreviewTransformation;

    invoke-virtual {v1}, Landroidx/camera/view/PreviewTransformation;->getSurfaceCropRect()Landroid/graphics/Rect;

    move-result-object v1

    .line 994
    .local v1, "surfaceCropRect":Landroid/graphics/Rect;
    const-string/jumbo v2, "PreviewView"

    if-eqz v0, :cond_3

    if-nez v1, :cond_0

    goto :goto_2

    .line 999
    :cond_0
    invoke-static {v1}, Landroidx/camera/core/impl/utils/TransformUtils;->getNormalizedToBuffer(Landroid/graphics/Rect;)Landroid/graphics/Matrix;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 1002
    iget-object v3, p0, Landroidx/camera/view/PreviewView;->mImplementation:Landroidx/camera/view/PreviewViewImplementation;

    instance-of v3, v3, Landroidx/camera/view/TextureViewImplementation;

    if-eqz v3, :cond_1

    .line 1003
    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    goto :goto_1

    .line 1005
    :cond_1
    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/Matrix;->isIdentity()Z

    move-result v3

    if-nez v3, :cond_2

    .line 1006
    const-string/jumbo v3, "PreviewView needs to be in COMPATIBLE mode for the transform to work correctly."

    invoke-static {v2, v3}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1011
    :cond_2
    :goto_1
    new-instance v2, Landroidx/camera/view/transform/OutputTransform;

    new-instance v3, Landroid/util/Size;

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v4

    .line 1012
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v5

    invoke-direct {v3, v4, v5}, Landroid/util/Size;-><init>(II)V

    invoke-direct {v2, v0, v3}, Landroidx/camera/view/transform/OutputTransform;-><init>(Landroid/graphics/Matrix;Landroid/util/Size;)V

    .line 1011
    return-object v2

    .line 995
    :cond_3
    :goto_2
    const-string/jumbo v3, "Transform info is not ready"

    invoke-static {v2, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 996
    const/4 v2, 0x0

    return-object v2
.end method

.method public getPreviewStreamState()Landroidx/lifecycle/LiveData;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Landroidx/camera/view/PreviewView$StreamState;",
            ">;"
        }
    .end annotation

    .line 524
    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mPreviewStreamStateLiveData:Landroidx/lifecycle/MutableLiveData;

    return-object v0
.end method

.method public getScaleType()Landroidx/camera/view/PreviewView$ScaleType;
    .locals 1

    .line 473
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 474
    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mPreviewTransform:Landroidx/camera/view/PreviewTransformation;

    invoke-virtual {v0}, Landroidx/camera/view/PreviewTransformation;->getScaleType()Landroidx/camera/view/PreviewView$ScaleType;

    move-result-object v0

    return-object v0
.end method

.method public getSensorToViewTransform()Landroid/graphics/Matrix;
    .locals 4

    .line 1034
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1035
    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mPreviewTransform:Landroidx/camera/view/PreviewTransformation;

    new-instance v1, Landroid/util/Size;

    .line 1036
    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->getHeight()I

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/util/Size;-><init>(II)V

    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->getLayoutDirection()I

    move-result v2

    .line 1035
    invoke-virtual {v0, v1, v2}, Landroidx/camera/view/PreviewTransformation;->getSensorToViewTransform(Landroid/util/Size;I)Landroid/graphics/Matrix;

    move-result-object v0

    return-object v0
.end method

.method public getSurfaceProvider()Landroidx/camera/core/Preview$SurfaceProvider;
    .locals 1

    .line 434
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 435
    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mSurfaceProvider:Landroidx/camera/core/Preview$SurfaceProvider;

    return-object v0
.end method

.method public getViewPort()Landroidx/camera/core/ViewPort;
    .locals 1

    .line 568
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 569
    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->getDisplay()Landroid/view/Display;

    move-result-object v0

    if-nez v0, :cond_0

    .line 571
    const/4 v0, 0x0

    return-object v0

    .line 573
    :cond_0
    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->getDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v0

    invoke-virtual {p0, v0}, Landroidx/camera/view/PreviewView;->getViewPort(I)Landroidx/camera/core/ViewPort;

    move-result-object v0

    return-object v0
.end method

.method public getViewPort(I)Landroidx/camera/core/ViewPort;
    .locals 4
    .param p1, "targetRotation"    # I

    .line 618
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 619
    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->getWidth()I

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->getHeight()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 622
    :cond_0
    new-instance v0, Landroidx/camera/core/ViewPort$Builder;

    new-instance v1, Landroid/util/Rational;

    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->getHeight()I

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/util/Rational;-><init>(II)V

    invoke-direct {v0, v1, p1}, Landroidx/camera/core/ViewPort$Builder;-><init>(Landroid/util/Rational;I)V

    .line 623
    invoke-direct {p0}, Landroidx/camera/view/PreviewView;->getViewPortScaleType()I

    move-result v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/ViewPort$Builder;->setScaleType(I)Landroidx/camera/core/ViewPort$Builder;

    move-result-object v0

    .line 624
    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->getLayoutDirection()I

    move-result v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/ViewPort$Builder;->setLayoutDirection(I)Landroidx/camera/core/ViewPort$Builder;

    move-result-object v0

    .line 625
    invoke-virtual {v0}, Landroidx/camera/core/ViewPort$Builder;->build()Landroidx/camera/core/ViewPort;

    move-result-object v0

    .line 622
    return-object v0

    .line 620
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method synthetic lambda$new$0$androidx-camera-view-PreviewView(Landroid/view/View;IIIIIIII)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I
    .param p6, "oldLeft"    # I
    .param p7, "oldTop"    # I
    .param p8, "oldRight"    # I
    .param p9, "oldBottom"    # I

    .line 182
    sub-int v0, p4, p2

    sub-int v1, p8, p6

    const/4 v2, 0x1

    if-ne v0, v1, :cond_1

    sub-int v0, p5, p3

    sub-int v1, p9, p7

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    move v0, v2

    .line 184
    .local v0, "isSizeChanged":Z
    :goto_1
    if-eqz v0, :cond_2

    .line 185
    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->redrawPreview()V

    .line 186
    invoke-direct {p0, v2}, Landroidx/camera/view/PreviewView;->attachToControllerIfReady(Z)V

    .line 188
    :cond_2
    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 1

    .line 322
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 323
    invoke-direct {p0}, Landroidx/camera/view/PreviewView;->startListeningToDisplayChange()V

    .line 324
    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mOnLayoutChangeListener:Landroid/view/View$OnLayoutChangeListener;

    invoke-virtual {p0, v0}, Landroidx/camera/view/PreviewView;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 325
    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mImplementation:Landroidx/camera/view/PreviewViewImplementation;

    if-eqz v0, :cond_0

    .line 326
    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mImplementation:Landroidx/camera/view/PreviewViewImplementation;

    invoke-virtual {v0}, Landroidx/camera/view/PreviewViewImplementation;->onAttachedToWindow()V

    .line 328
    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Landroidx/camera/view/PreviewView;->attachToControllerIfReady(Z)V

    .line 329
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .line 333
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 334
    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mOnLayoutChangeListener:Landroid/view/View$OnLayoutChangeListener;

    invoke-virtual {p0, v0}, Landroidx/camera/view/PreviewView;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 335
    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mImplementation:Landroidx/camera/view/PreviewViewImplementation;

    if-eqz v0, :cond_0

    .line 336
    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mImplementation:Landroidx/camera/view/PreviewViewImplementation;

    invoke-virtual {v0}, Landroidx/camera/view/PreviewViewImplementation;->onDetachedFromWindow()V

    .line 338
    :cond_0
    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mCameraController:Landroidx/camera/view/CameraController;

    if-eqz v0, :cond_1

    .line 339
    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mCameraController:Landroidx/camera/view/CameraController;

    invoke-virtual {v0}, Landroidx/camera/view/CameraController;->clearPreviewSurface()V

    .line 341
    :cond_1
    invoke-direct {p0}, Landroidx/camera/view/PreviewView;->stopListeningToDisplayChange()V

    .line 342
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 8
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 346
    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mCameraController:Landroidx/camera/view/CameraController;

    if-nez v0, :cond_0

    .line 348
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 350
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_1

    move v0, v2

    goto :goto_0

    :cond_1
    move v0, v1

    .line 351
    .local v0, "isSingleTouch":Z
    :goto_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    if-ne v3, v2, :cond_2

    move v3, v2

    goto :goto_1

    :cond_2
    move v3, v1

    .line 352
    .local v3, "isUpEvent":Z
    :goto_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v6

    sub-long/2addr v4, v6

    .line 353
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result v6

    int-to-long v6, v6

    cmp-long v4, v4, v6

    if-gez v4, :cond_3

    move v4, v2

    goto :goto_2

    :cond_3
    move v4, v1

    .line 354
    .local v4, "notALongPress":Z
    :goto_2
    if-eqz v0, :cond_4

    if-eqz v3, :cond_4

    if-eqz v4, :cond_4

    .line 357
    iput-object p1, p0, Landroidx/camera/view/PreviewView;->mTouchUpEvent:Landroid/view/MotionEvent;

    .line 358
    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->performClick()Z

    .line 361
    return v2

    .line 363
    :cond_4
    iget-object v5, p0, Landroidx/camera/view/PreviewView;->mScaleGestureDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v5, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v5

    if-nez v5, :cond_5

    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v5

    if-eqz v5, :cond_6

    :cond_5
    move v1, v2

    :cond_6
    return v1
.end method

.method public performClick()Z
    .locals 4

    .line 368
    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mCameraController:Landroidx/camera/view/CameraController;

    if-eqz v0, :cond_2

    .line 370
    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mTouchUpEvent:Landroid/view/MotionEvent;

    const/high16 v1, 0x40000000    # 2.0f

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mTouchUpEvent:Landroid/view/MotionEvent;

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->getWidth()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, v1

    .line 371
    .local v0, "x":F
    :goto_0
    iget-object v2, p0, Landroidx/camera/view/PreviewView;->mTouchUpEvent:Landroid/view/MotionEvent;

    if-eqz v2, :cond_1

    iget-object v1, p0, Landroidx/camera/view/PreviewView;->mTouchUpEvent:Landroid/view/MotionEvent;

    invoke-virtual {v1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->getHeight()I

    move-result v2

    int-to-float v2, v2

    div-float v1, v2, v1

    .line 372
    .local v1, "y":F
    :goto_1
    iget-object v2, p0, Landroidx/camera/view/PreviewView;->mCameraController:Landroidx/camera/view/CameraController;

    iget-object v3, p0, Landroidx/camera/view/PreviewView;->mPreviewViewMeteringPointFactory:Landroidx/camera/view/PreviewViewMeteringPointFactory;

    invoke-virtual {v2, v3, v0, v1}, Landroidx/camera/view/CameraController;->onTapToFocus(Landroidx/camera/core/MeteringPointFactory;FF)V

    .line 374
    .end local v0    # "x":F
    .end local v1    # "y":F
    :cond_2
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/view/PreviewView;->mTouchUpEvent:Landroid/view/MotionEvent;

    .line 375
    invoke-super {p0}, Landroid/widget/FrameLayout;->performClick()Z

    move-result v0

    return v0
.end method

.method redrawPreview()V
    .locals 4

    .line 655
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 656
    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mImplementation:Landroidx/camera/view/PreviewViewImplementation;

    if-eqz v0, :cond_0

    .line 657
    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->updateDisplayRotationIfNeeded()V

    .line 658
    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mImplementation:Landroidx/camera/view/PreviewViewImplementation;

    invoke-virtual {v0}, Landroidx/camera/view/PreviewViewImplementation;->redrawPreview()V

    .line 660
    :cond_0
    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mPreviewViewMeteringPointFactory:Landroidx/camera/view/PreviewViewMeteringPointFactory;

    new-instance v1, Landroid/util/Size;

    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->getHeight()I

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/util/Size;-><init>(II)V

    .line 661
    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->getLayoutDirection()I

    move-result v2

    .line 660
    invoke-virtual {v0, v1, v2}, Landroidx/camera/view/PreviewViewMeteringPointFactory;->recalculate(Landroid/util/Size;I)V

    .line 662
    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mCameraController:Landroidx/camera/view/CameraController;

    if-eqz v0, :cond_1

    .line 663
    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mCameraController:Landroidx/camera/view/CameraController;

    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->getSensorToViewTransform()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/view/CameraController;->updatePreviewViewTransform(Landroid/graphics/Matrix;)V

    .line 665
    :cond_1
    return-void
.end method

.method public setController(Landroidx/camera/view/CameraController;)V
    .locals 1
    .param p1, "cameraController"    # Landroidx/camera/view/CameraController;

    .line 945
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 946
    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mCameraController:Landroidx/camera/view/CameraController;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mCameraController:Landroidx/camera/view/CameraController;

    if-eq v0, p1, :cond_0

    .line 949
    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mCameraController:Landroidx/camera/view/CameraController;

    invoke-virtual {v0}, Landroidx/camera/view/CameraController;->clearPreviewSurface()V

    .line 951
    :cond_0
    iput-object p1, p0, Landroidx/camera/view/PreviewView;->mCameraController:Landroidx/camera/view/CameraController;

    .line 952
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroidx/camera/view/PreviewView;->attachToControllerIfReady(Z)V

    .line 953
    return-void
.end method

.method public setFrameUpdateListener(Ljava/util/concurrent/Executor;Landroidx/camera/view/PreviewView$OnFrameUpdateListener;)V
    .locals 2
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "listener"    # Landroidx/camera/view/PreviewView$OnFrameUpdateListener;

    .line 720
    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mImplementationMode:Landroidx/camera/view/PreviewView$ImplementationMode;

    sget-object v1, Landroidx/camera/view/PreviewView$ImplementationMode;->PERFORMANCE:Landroidx/camera/view/PreviewView$ImplementationMode;

    if-eq v0, v1, :cond_1

    .line 725
    iput-object p2, p0, Landroidx/camera/view/PreviewView;->mOnFrameUpdateListener:Landroidx/camera/view/PreviewView$OnFrameUpdateListener;

    .line 726
    iput-object p1, p0, Landroidx/camera/view/PreviewView;->mOnFrameUpdateListenerExecutor:Ljava/util/concurrent/Executor;

    .line 727
    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mImplementation:Landroidx/camera/view/PreviewViewImplementation;

    if-eqz v0, :cond_0

    .line 728
    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mImplementation:Landroidx/camera/view/PreviewViewImplementation;

    invoke-virtual {v0, p1, p2}, Landroidx/camera/view/PreviewViewImplementation;->setFrameUpdateListener(Ljava/util/concurrent/Executor;Landroidx/camera/view/PreviewView$OnFrameUpdateListener;)V

    .line 730
    :cond_0
    return-void

    .line 721
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "PERFORMANCE mode doesn\'t support frame update listener"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setImplementationMode(Landroidx/camera/view/PreviewView$ImplementationMode;)V
    .locals 2
    .param p1, "implementationMode"    # Landroidx/camera/view/PreviewView$ImplementationMode;

    .line 393
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 394
    iput-object p1, p0, Landroidx/camera/view/PreviewView;->mImplementationMode:Landroidx/camera/view/PreviewView$ImplementationMode;

    .line 396
    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mImplementationMode:Landroidx/camera/view/PreviewView$ImplementationMode;

    sget-object v1, Landroidx/camera/view/PreviewView$ImplementationMode;->PERFORMANCE:Landroidx/camera/view/PreviewView$ImplementationMode;

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mOnFrameUpdateListener:Landroidx/camera/view/PreviewView$OnFrameUpdateListener;

    if-nez v0, :cond_0

    goto :goto_0

    .line 398
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "PERFORMANCE mode doesn\'t support frame update listener"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 401
    :cond_1
    :goto_0
    return-void
.end method

.method public setScaleType(Landroidx/camera/view/PreviewView$ScaleType;)V
    .locals 1
    .param p1, "scaleType"    # Landroidx/camera/view/PreviewView$ScaleType;

    .line 456
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 457
    iget-object v0, p0, Landroidx/camera/view/PreviewView;->mPreviewTransform:Landroidx/camera/view/PreviewTransformation;

    invoke-virtual {v0, p1}, Landroidx/camera/view/PreviewTransformation;->setScaleType(Landroidx/camera/view/PreviewView$ScaleType;)V

    .line 458
    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->redrawPreview()V

    .line 460
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroidx/camera/view/PreviewView;->attachToControllerIfReady(Z)V

    .line 461
    return-void
.end method

.method updateDisplayRotationIfNeeded()V
    .locals 4

    .line 703
    iget-boolean v0, p0, Landroidx/camera/view/PreviewView;->mUseDisplayRotation:Z

    if-eqz v0, :cond_0

    .line 704
    invoke-virtual {p0}, Landroidx/camera/view/PreviewView;->getDisplay()Landroid/view/Display;

    move-result-object v0

    .line 705
    .local v0, "display":Landroid/view/Display;
    if-eqz v0, :cond_0

    iget-object v1, p0, Landroidx/camera/view/PreviewView;->mCameraInfoInternal:Landroidx/camera/core/impl/CameraInfoInternal;

    if-eqz v1, :cond_0

    .line 706
    iget-object v1, p0, Landroidx/camera/view/PreviewView;->mPreviewTransform:Landroidx/camera/view/PreviewTransformation;

    iget-object v2, p0, Landroidx/camera/view/PreviewView;->mCameraInfoInternal:Landroidx/camera/core/impl/CameraInfoInternal;

    .line 708
    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v3

    .line 707
    invoke-interface {v2, v3}, Landroidx/camera/core/impl/CameraInfoInternal;->getSensorRotationDegrees(I)I

    move-result v2

    .line 708
    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v3

    .line 706
    invoke-virtual {v1, v2, v3}, Landroidx/camera/view/PreviewTransformation;->overrideWithDisplayRotation(II)V

    .line 711
    .end local v0    # "display":Landroid/view/Display;
    :cond_0
    return-void
.end method
