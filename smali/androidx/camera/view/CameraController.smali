.class public abstract Landroidx/camera/view/CameraController;
.super Ljava/lang/Object;
.source "CameraController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/view/CameraController$OutputSize;,
        Landroidx/camera/view/CameraController$Api30Impl;,
        Landroidx/camera/view/CameraController$UseCases;
    }
.end annotation


# static fields
.field private static final AE_SIZE:F = 0.25f

.field private static final AF_SIZE:F = 0.16666667f

.field private static final CAMERA_NOT_ATTACHED:Ljava/lang/String; = "Use cases not attached to camera."

.field private static final CAMERA_NOT_INITIALIZED:Ljava/lang/String; = "Camera not initialized."

.field public static final COORDINATE_SYSTEM_VIEW_REFERENCED:I = 0x1

.field public static final IMAGE_ANALYSIS:I = 0x2

.field public static final IMAGE_CAPTURE:I = 0x1

.field private static final IMAGE_CAPTURE_DISABLED:Ljava/lang/String; = "ImageCapture disabled."

.field private static final PREVIEW_VIEW_NOT_ATTACHED:Ljava/lang/String; = "PreviewView not attached to CameraController."

.field private static final TAG:Ljava/lang/String; = "CameraController"

.field public static final TAP_TO_FOCUS_FAILED:I = 0x4

.field public static final TAP_TO_FOCUS_FOCUSED:I = 0x2

.field public static final TAP_TO_FOCUS_NOT_FOCUSED:I = 0x3

.field public static final TAP_TO_FOCUS_NOT_STARTED:I = 0x0

.field public static final TAP_TO_FOCUS_STARTED:I = 0x1

.field public static final VIDEO_CAPTURE:I = 0x4

.field private static final VIDEO_CAPTURE_DISABLED:Ljava/lang/String; = "VideoCapture disabled."

.field private static final VIDEO_RECORDING_UNFINISHED:Ljava/lang/String; = "Recording video. Only one recording can be active at a time."


# instance fields
.field mActiveRecording:Landroidx/camera/video/Recording;

.field private mAnalysisAnalyzer:Landroidx/camera/core/ImageAnalysis$Analyzer;

.field private mAnalysisBackgroundExecutor:Ljava/util/concurrent/Executor;

.field private mAnalysisExecutor:Ljava/util/concurrent/Executor;

.field private final mAppContext:Landroid/content/Context;

.field mCamera:Landroidx/camera/core/Camera;

.field mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

.field mCameraSelector:Landroidx/camera/core/CameraSelector;

.field final mDeviceRotationListener:Landroidx/camera/view/RotationProvider$Listener;

.field private final mEffects:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/camera/core/CameraEffect;",
            ">;"
        }
    .end annotation
.end field

.field private mEnabledUseCases:I

.field mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

.field mImageAnalysisTargetSize:Landroidx/camera/view/CameraController$OutputSize;

.field mImageCapture:Landroidx/camera/core/ImageCapture;

.field mImageCaptureIoExecutor:Ljava/util/concurrent/Executor;

.field mImageCaptureTargetSize:Landroidx/camera/view/CameraController$OutputSize;

.field private final mInitializationFuture:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private final mPendingEnableTorch:Landroidx/camera/view/PendingValue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/view/PendingValue<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final mPendingLinearZoom:Landroidx/camera/view/PendingValue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/view/PendingValue<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private final mPendingZoomRatio:Landroidx/camera/view/PendingValue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/view/PendingValue<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private mPinchToZoomEnabled:Z

.field mPreview:Landroidx/camera/core/Preview;

.field mPreviewTargetSize:Landroidx/camera/view/CameraController$OutputSize;

.field mRecordingMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroidx/core/util/Consumer<",
            "Landroidx/camera/video/VideoRecordEvent;",
            ">;",
            "Landroidx/camera/video/Recording;",
            ">;"
        }
    .end annotation
.end field

.field private final mRotationProvider:Landroidx/camera/view/RotationProvider;

.field mSurfaceProvider:Landroidx/camera/core/Preview$SurfaceProvider;

.field private mTapToFocusEnabled:Z

.field final mTapToFocusState:Landroidx/lifecycle/MutableLiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/MutableLiveData<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final mTorchState:Landroidx/camera/view/ForwardingLiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/view/ForwardingLiveData<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field mVideoCapture:Landroidx/camera/video/VideoCapture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/video/VideoCapture<",
            "Landroidx/camera/video/Recorder;",
            ">;"
        }
    .end annotation
.end field

.field mVideoCaptureQualitySelector:Landroidx/camera/video/QualitySelector;

.field mViewPort:Landroidx/camera/core/ViewPort;

.field private final mZoomState:Landroidx/camera/view/ForwardingLiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/view/ForwardingLiveData<",
            "Landroidx/camera/core/ZoomState;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .line 322
    invoke-static {p1}, Landroidx/camera/lifecycle/ProcessCameraProvider;->getInstance(Landroid/content/Context;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    new-instance v1, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda5;

    invoke-direct {v1}, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda5;-><init>()V

    .line 323
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    .line 322
    invoke-static {v0, v1, v2}, Landroidx/camera/core/impl/utils/futures/Futures;->transform(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/arch/core/util/Function;Ljava/util/concurrent/Executor;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Landroidx/camera/view/CameraController;-><init>(Landroid/content/Context;Lcom/google/common/util/concurrent/ListenableFuture;)V

    .line 324
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/google/common/util/concurrent/ListenableFuture;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Landroidx/camera/view/ProcessCameraProviderWrapper;",
            ">;)V"
        }
    .end annotation

    .line 327
    .local p2, "cameraProviderFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Landroidx/camera/view/ProcessCameraProviderWrapper;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 213
    sget-object v0, Landroidx/camera/core/CameraSelector;->DEFAULT_BACK_CAMERA:Landroidx/camera/core/CameraSelector;

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mCameraSelector:Landroidx/camera/core/CameraSelector;

    .line 216
    const/4 v0, 0x3

    iput v0, p0, Landroidx/camera/view/CameraController;->mEnabledUseCases:I

    .line 257
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mActiveRecording:Landroidx/camera/video/Recording;

    .line 260
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mRecordingMap:Ljava/util/Map;

    .line 263
    sget-object v0, Landroidx/camera/video/Recorder;->DEFAULT_QUALITY_SELECTOR:Landroidx/camera/video/QualitySelector;

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mVideoCaptureQualitySelector:Landroidx/camera/video/QualitySelector;

    .line 293
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/camera/view/CameraController;->mPinchToZoomEnabled:Z

    .line 294
    iput-boolean v0, p0, Landroidx/camera/view/CameraController;->mTapToFocusEnabled:Z

    .line 296
    new-instance v0, Landroidx/camera/view/ForwardingLiveData;

    invoke-direct {v0}, Landroidx/camera/view/ForwardingLiveData;-><init>()V

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mZoomState:Landroidx/camera/view/ForwardingLiveData;

    .line 297
    new-instance v0, Landroidx/camera/view/ForwardingLiveData;

    invoke-direct {v0}, Landroidx/camera/view/ForwardingLiveData;-><init>()V

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mTorchState:Landroidx/camera/view/ForwardingLiveData;

    .line 299
    new-instance v0, Landroidx/lifecycle/MutableLiveData;

    .line 301
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/lifecycle/MutableLiveData;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mTapToFocusState:Landroidx/lifecycle/MutableLiveData;

    .line 303
    new-instance v0, Landroidx/camera/view/PendingValue;

    invoke-direct {v0}, Landroidx/camera/view/PendingValue;-><init>()V

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mPendingEnableTorch:Landroidx/camera/view/PendingValue;

    .line 306
    new-instance v0, Landroidx/camera/view/PendingValue;

    invoke-direct {v0}, Landroidx/camera/view/PendingValue;-><init>()V

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mPendingLinearZoom:Landroidx/camera/view/PendingValue;

    .line 309
    new-instance v0, Landroidx/camera/view/PendingValue;

    invoke-direct {v0}, Landroidx/camera/view/PendingValue;-><init>()V

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mPendingZoomRatio:Landroidx/camera/view/PendingValue;

    .line 312
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mEffects:Ljava/util/Set;

    .line 328
    invoke-static {p1}, Landroidx/camera/view/CameraController;->getApplicationContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mAppContext:Landroid/content/Context;

    .line 329
    new-instance v0, Landroidx/camera/core/Preview$Builder;

    invoke-direct {v0}, Landroidx/camera/core/Preview$Builder;-><init>()V

    invoke-virtual {v0}, Landroidx/camera/core/Preview$Builder;->build()Landroidx/camera/core/Preview;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mPreview:Landroidx/camera/core/Preview;

    .line 330
    new-instance v0, Landroidx/camera/core/ImageCapture$Builder;

    invoke-direct {v0}, Landroidx/camera/core/ImageCapture$Builder;-><init>()V

    invoke-virtual {v0}, Landroidx/camera/core/ImageCapture$Builder;->build()Landroidx/camera/core/ImageCapture;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    .line 331
    new-instance v0, Landroidx/camera/core/ImageAnalysis$Builder;

    invoke-direct {v0}, Landroidx/camera/core/ImageAnalysis$Builder;-><init>()V

    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis$Builder;->build()Landroidx/camera/core/ImageAnalysis;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    .line 332
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->createNewVideoCapture()Landroidx/camera/video/VideoCapture;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mVideoCapture:Landroidx/camera/video/VideoCapture;

    .line 335
    new-instance v0, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0}, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda3;-><init>(Landroidx/camera/view/CameraController;)V

    .line 341
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v1

    .line 335
    invoke-static {p2, v0, v1}, Landroidx/camera/core/impl/utils/futures/Futures;->transform(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/arch/core/util/Function;Ljava/util/concurrent/Executor;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mInitializationFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 346
    new-instance v0, Landroidx/camera/view/RotationProvider;

    iget-object v1, p0, Landroidx/camera/view/CameraController;->mAppContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroidx/camera/view/RotationProvider;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mRotationProvider:Landroidx/camera/view/RotationProvider;

    .line 347
    new-instance v0, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0}, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda4;-><init>(Landroidx/camera/view/CameraController;)V

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mDeviceRotationListener:Landroidx/camera/view/RotationProvider$Listener;

    .line 352
    return-void
.end method

.method private checkAudioPermissionGranted()V
    .locals 3

    .line 1269
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mAppContext:Landroid/content/Context;

    const-string/jumbo v1, "android.permission.RECORD_AUDIO"

    invoke-static {v0, v1}, Landroidx/core/content/PermissionChecker;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    .line 1271
    .local v0, "permissionState":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 1275
    return-void

    .line 1272
    :cond_0
    new-instance v1, Ljava/lang/SecurityException;

    const-string v2, "Attempted to start recording with audio, but application does not have RECORD_AUDIO permission granted."

    invoke-direct {v1, v2}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private createNewVideoCapture()Landroidx/camera/video/VideoCapture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/camera/video/VideoCapture<",
            "Landroidx/camera/video/Recorder;",
            ">;"
        }
    .end annotation

    .line 1428
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mVideoCaptureQualitySelector:Landroidx/camera/video/QualitySelector;

    invoke-static {v0}, Landroidx/camera/view/CameraController;->generateVideoCaptureRecorder(Landroidx/camera/video/QualitySelector;)Landroidx/camera/video/Recorder;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/video/VideoCapture;->withOutput(Landroidx/camera/video/VideoOutput;)Landroidx/camera/video/VideoCapture;

    move-result-object v0

    return-object v0
.end method

.method private deactivateRecording(Landroidx/camera/video/Recording;)V
    .locals 1
    .param p1, "recording"    # Landroidx/camera/video/Recording;

    .line 1340
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mActiveRecording:Landroidx/camera/video/Recording;

    if-ne v0, p1, :cond_0

    .line 1341
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mActiveRecording:Landroidx/camera/video/Recording;

    .line 1343
    :cond_0
    return-void
.end method

.method private static generateVideoCaptureRecorder(Landroidx/camera/video/QualitySelector;)Landroidx/camera/video/Recorder;
    .locals 1
    .param p0, "qualitySelector"    # Landroidx/camera/video/QualitySelector;

    .line 355
    new-instance v0, Landroidx/camera/video/Recorder$Builder;

    invoke-direct {v0}, Landroidx/camera/video/Recorder$Builder;-><init>()V

    invoke-virtual {v0, p0}, Landroidx/camera/video/Recorder$Builder;->setQualitySelector(Landroidx/camera/video/QualitySelector;)Landroidx/camera/video/Recorder$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/video/Recorder$Builder;->build()Landroidx/camera/video/Recorder;

    move-result-object v0

    return-object v0
.end method

.method private static getApplicationContext(Landroid/content/Context;)Landroid/content/Context;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .line 365
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 366
    .local v0, "applicationContext":Landroid/content/Context;
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1e

    if-lt v1, v2, :cond_0

    .line 367
    invoke-static {p0}, Landroidx/camera/view/CameraController$Api30Impl;->getAttributionTag(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 369
    .local v1, "attributeTag":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 370
    invoke-static {v0, v1}, Landroidx/camera/view/CameraController$Api30Impl;->createAttributionContext(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Context;

    move-result-object v2

    return-object v2

    .line 374
    .end local v1    # "attributeTag":Ljava/lang/String;
    :cond_0
    return-object v0
.end method

.method private isCameraAttached()Z
    .locals 1

    .line 421
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCamera:Landroidx/camera/core/Camera;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isCameraInitialized()Z
    .locals 1

    .line 413
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isOutputSizeEqual(Landroidx/camera/view/CameraController$OutputSize;Landroidx/camera/view/CameraController$OutputSize;)Z
    .locals 2
    .param p1, "currentSize"    # Landroidx/camera/view/CameraController$OutputSize;
    .param p2, "newSize"    # Landroidx/camera/view/CameraController$OutputSize;

    .line 508
    const/4 v0, 0x1

    if-ne p1, p2, :cond_0

    .line 509
    return v0

    .line 511
    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isPreviewViewAttached()Z
    .locals 1

    .line 417
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mSurfaceProvider:Landroidx/camera/core/Preview$SurfaceProvider;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/camera/view/CameraController;->mViewPort:Landroidx/camera/core/ViewPort;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isUseCaseEnabled(I)Z
    .locals 1
    .param p1, "useCaseMask"    # I

    .line 482
    iget v0, p0, Landroidx/camera/view/CameraController;->mEnabledUseCases:I

    and-int/2addr v0, p1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private prepareRecording(Landroidx/camera/video/OutputOptions;)Landroidx/camera/video/PendingRecording;
    .locals 3
    .param p1, "options"    # Landroidx/camera/video/OutputOptions;

    .line 1290
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mVideoCapture:Landroidx/camera/video/VideoCapture;

    invoke-virtual {v0}, Landroidx/camera/video/VideoCapture;->getOutput()Landroidx/camera/video/VideoOutput;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/Recorder;

    .line 1291
    .local v0, "recorder":Landroidx/camera/video/Recorder;
    instance-of v1, p1, Landroidx/camera/video/FileOutputOptions;

    if-eqz v1, :cond_0

    .line 1292
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mAppContext:Landroid/content/Context;

    move-object v2, p1

    check-cast v2, Landroidx/camera/video/FileOutputOptions;

    invoke-virtual {v0, v1, v2}, Landroidx/camera/video/Recorder;->prepareRecording(Landroid/content/Context;Landroidx/camera/video/FileOutputOptions;)Landroidx/camera/video/PendingRecording;

    move-result-object v1

    return-object v1

    .line 1293
    :cond_0
    instance-of v1, p1, Landroidx/camera/video/FileDescriptorOutputOptions;

    if-eqz v1, :cond_1

    .line 1294
    nop

    .line 1299
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mAppContext:Landroid/content/Context;

    move-object v2, p1

    check-cast v2, Landroidx/camera/video/FileDescriptorOutputOptions;

    invoke-virtual {v0, v1, v2}, Landroidx/camera/video/Recorder;->prepareRecording(Landroid/content/Context;Landroidx/camera/video/FileDescriptorOutputOptions;)Landroidx/camera/video/PendingRecording;

    move-result-object v1

    return-object v1

    .line 1300
    :cond_1
    instance-of v1, p1, Landroidx/camera/video/MediaStoreOutputOptions;

    if-eqz v1, :cond_2

    .line 1301
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mAppContext:Landroid/content/Context;

    move-object v2, p1

    check-cast v2, Landroidx/camera/video/MediaStoreOutputOptions;

    invoke-virtual {v0, v1, v2}, Landroidx/camera/video/Recorder;->prepareRecording(Landroid/content/Context;Landroidx/camera/video/MediaStoreOutputOptions;)Landroidx/camera/video/PendingRecording;

    move-result-object v1

    return-object v1

    .line 1303
    :cond_2
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "Unsupported OutputOptions type."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private restartCameraIfAnalyzerResolutionChanged(Landroidx/camera/core/ImageAnalysis$Analyzer;Landroidx/camera/core/ImageAnalysis$Analyzer;)V
    .locals 4
    .param p1, "oldAnalyzer"    # Landroidx/camera/core/ImageAnalysis$Analyzer;
    .param p2, "newAnalyzer"    # Landroidx/camera/core/ImageAnalysis$Analyzer;

    .line 912
    const/4 v0, 0x0

    if-nez p1, :cond_0

    move-object v1, v0

    goto :goto_0

    .line 913
    :cond_0
    invoke-interface {p1}, Landroidx/camera/core/ImageAnalysis$Analyzer;->getDefaultTargetResolution()Landroid/util/Size;

    move-result-object v1

    :goto_0
    nop

    .line 914
    .local v1, "oldResolution":Landroid/util/Size;
    if-nez p2, :cond_1

    goto :goto_1

    .line 915
    :cond_1
    invoke-interface {p2}, Landroidx/camera/core/ImageAnalysis$Analyzer;->getDefaultTargetResolution()Landroid/util/Size;

    move-result-object v0

    :goto_1
    nop

    .line 916
    .local v0, "newResolution":Landroid/util/Size;
    invoke-static {v1, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 918
    iget-object v2, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {v2}, Landroidx/camera/core/ImageAnalysis;->getBackpressureStrategy()I

    move-result v2

    iget-object v3, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    .line 919
    invoke-virtual {v3}, Landroidx/camera/core/ImageAnalysis;->getImageQueueDepth()I

    move-result v3

    .line 918
    invoke-direct {p0, v2, v3}, Landroidx/camera/view/CameraController;->unbindImageAnalysisAndRecreate(II)V

    .line 920
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 922
    :cond_2
    return-void
.end method

.method private setActiveRecording(Landroidx/camera/video/Recording;Landroidx/core/util/Consumer;)V
    .locals 1
    .param p1, "recording"    # Landroidx/camera/video/Recording;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/video/Recording;",
            "Landroidx/core/util/Consumer<",
            "Landroidx/camera/video/VideoRecordEvent;",
            ">;)V"
        }
    .end annotation

    .line 1349
    .local p2, "listener":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroidx/camera/video/VideoRecordEvent;>;"
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mRecordingMap:Ljava/util/Map;

    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1350
    iput-object p1, p0, Landroidx/camera/view/CameraController;->mActiveRecording:Landroidx/camera/video/Recording;

    .line 1351
    return-void
.end method

.method private setTargetOutputSize(Landroidx/camera/core/impl/ImageOutputConfig$Builder;Landroidx/camera/view/CameraController$OutputSize;)V
    .locals 2
    .param p2, "outputSize"    # Landroidx/camera/view/CameraController$OutputSize;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/ImageOutputConfig$Builder<",
            "*>;",
            "Landroidx/camera/view/CameraController$OutputSize;",
            ")V"
        }
    .end annotation

    .line 490
    .local p1, "builder":Landroidx/camera/core/impl/ImageOutputConfig$Builder;, "Landroidx/camera/core/impl/ImageOutputConfig$Builder<*>;"
    if-nez p2, :cond_0

    .line 491
    return-void

    .line 493
    :cond_0
    invoke-virtual {p2}, Landroidx/camera/view/CameraController$OutputSize;->getResolution()Landroid/util/Size;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 494
    invoke-virtual {p2}, Landroidx/camera/view/CameraController$OutputSize;->getResolution()Landroid/util/Size;

    move-result-object v0

    invoke-interface {p1, v0}, Landroidx/camera/core/impl/ImageOutputConfig$Builder;->setTargetResolution(Landroid/util/Size;)Ljava/lang/Object;

    goto :goto_0

    .line 495
    :cond_1
    invoke-virtual {p2}, Landroidx/camera/view/CameraController$OutputSize;->getAspectRatio()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    .line 496
    invoke-virtual {p2}, Landroidx/camera/view/CameraController$OutputSize;->getAspectRatio()I

    move-result v0

    invoke-interface {p1, v0}, Landroidx/camera/core/impl/ImageOutputConfig$Builder;->setTargetAspectRatio(I)Ljava/lang/Object;

    goto :goto_0

    .line 498
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Invalid target surface size. "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CameraController"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 500
    :goto_0
    return-void
.end method

.method private speedUpZoomBy2X(F)F
    .locals 3
    .param p1, "scaleFactor"    # F

    .line 1576
    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v1, p1, v0

    const/high16 v2, 0x40000000    # 2.0f

    if-lez v1, :cond_0

    .line 1577
    sub-float v1, p1, v0

    mul-float/2addr v1, v2

    add-float/2addr v1, v0

    return v1

    .line 1579
    :cond_0
    sub-float v1, v0, p1

    mul-float/2addr v1, v2

    sub-float/2addr v0, v1

    return v0
.end method

.method private startListeningToRotationEvents()V
    .locals 3

    .line 553
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mRotationProvider:Landroidx/camera/view/RotationProvider;

    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/view/CameraController;->mDeviceRotationListener:Landroidx/camera/view/RotationProvider$Listener;

    invoke-virtual {v0, v1, v2}, Landroidx/camera/view/RotationProvider;->addListener(Ljava/util/concurrent/Executor;Landroidx/camera/view/RotationProvider$Listener;)Z

    .line 555
    return-void
.end method

.method private startRecordingInternal(Landroidx/camera/video/OutputOptions;Landroidx/camera/view/video/AudioConfig;Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)Landroidx/camera/video/Recording;
    .locals 4
    .param p1, "outputOptions"    # Landroidx/camera/video/OutputOptions;
    .param p2, "audioConfig"    # Landroidx/camera/view/video/AudioConfig;
    .param p3, "executor"    # Ljava/util/concurrent/Executor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/video/OutputOptions;",
            "Landroidx/camera/view/video/AudioConfig;",
            "Ljava/util/concurrent/Executor;",
            "Landroidx/core/util/Consumer<",
            "Landroidx/camera/video/VideoRecordEvent;",
            ">;)",
            "Landroidx/camera/video/Recording;"
        }
    .end annotation

    .line 1249
    .local p4, "listener":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroidx/camera/video/VideoRecordEvent;>;"
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1250
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->isCameraInitialized()Z

    move-result v0

    const-string v1, "Camera not initialized."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 1251
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->isVideoCaptureEnabled()Z

    move-result v0

    const-string/jumbo v1, "VideoCapture disabled."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 1252
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->isRecording()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    const-string/jumbo v1, "Recording video. Only one recording can be active at a time."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 1254
    nop

    .line 1255
    invoke-direct {p0, p4}, Landroidx/camera/view/CameraController;->wrapListenerToDeactivateRecordingOnFinalized(Landroidx/core/util/Consumer;)Landroidx/core/util/Consumer;

    move-result-object v0

    .line 1256
    .local v0, "wrappedListener":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroidx/camera/video/VideoRecordEvent;>;"
    invoke-direct {p0, p1}, Landroidx/camera/view/CameraController;->prepareRecording(Landroidx/camera/video/OutputOptions;)Landroidx/camera/video/PendingRecording;

    move-result-object v1

    .line 1257
    .local v1, "pendingRecording":Landroidx/camera/video/PendingRecording;
    invoke-virtual {p2}, Landroidx/camera/view/video/AudioConfig;->getAudioEnabled()Z

    move-result v2

    .line 1258
    .local v2, "isAudioEnabled":Z
    if-eqz v2, :cond_0

    .line 1259
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->checkAudioPermissionGranted()V

    .line 1260
    invoke-virtual {v1}, Landroidx/camera/video/PendingRecording;->withAudioEnabled()Landroidx/camera/video/PendingRecording;

    .line 1262
    :cond_0
    invoke-virtual {v1, p3, v0}, Landroidx/camera/video/PendingRecording;->start(Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)Landroidx/camera/video/Recording;

    move-result-object v3

    .line 1263
    .local v3, "recording":Landroidx/camera/video/Recording;
    invoke-direct {p0, v3, v0}, Landroidx/camera/view/CameraController;->setActiveRecording(Landroidx/camera/video/Recording;Landroidx/core/util/Consumer;)V

    .line 1265
    return-object v3
.end method

.method private stopListeningToRotationEvents()V
    .locals 2

    .line 558
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mRotationProvider:Landroidx/camera/view/RotationProvider;

    iget-object v1, p0, Landroidx/camera/view/CameraController;->mDeviceRotationListener:Landroidx/camera/view/RotationProvider$Listener;

    invoke-virtual {v0, v1}, Landroidx/camera/view/RotationProvider;->removeListener(Landroidx/camera/view/RotationProvider$Listener;)V

    .line 559
    return-void
.end method

.method private stopRecording()V
    .locals 1

    .line 1363
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1365
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mActiveRecording:Landroidx/camera/video/Recording;

    if-eqz v0, :cond_0

    .line 1366
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mActiveRecording:Landroidx/camera/video/Recording;

    invoke-virtual {v0}, Landroidx/camera/video/Recording;->stop()V

    .line 1367
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mActiveRecording:Landroidx/camera/video/Recording;

    invoke-direct {p0, v0}, Landroidx/camera/view/CameraController;->deactivateRecording(Landroidx/camera/video/Recording;)V

    .line 1369
    :cond_0
    return-void
.end method

.method private unbindImageAnalysisAndRecreate(II)V
    .locals 4
    .param p1, "strategy"    # I
    .param p2, "imageQueueDepth"    # I

    .line 1081
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1082
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->isCameraInitialized()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1083
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    const/4 v1, 0x1

    new-array v1, v1, [Landroidx/camera/core/UseCase;

    const/4 v2, 0x0

    iget-object v3, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    aput-object v3, v1, v2

    invoke-interface {v0, v1}, Landroidx/camera/view/ProcessCameraProviderWrapper;->unbind([Landroidx/camera/core/UseCase;)V

    .line 1085
    :cond_0
    new-instance v0, Landroidx/camera/core/ImageAnalysis$Builder;

    invoke-direct {v0}, Landroidx/camera/core/ImageAnalysis$Builder;-><init>()V

    .line 1086
    invoke-virtual {v0, p1}, Landroidx/camera/core/ImageAnalysis$Builder;->setBackpressureStrategy(I)Landroidx/camera/core/ImageAnalysis$Builder;

    move-result-object v0

    .line 1087
    invoke-virtual {v0, p2}, Landroidx/camera/core/ImageAnalysis$Builder;->setImageQueueDepth(I)Landroidx/camera/core/ImageAnalysis$Builder;

    move-result-object v0

    .line 1088
    .local v0, "builder":Landroidx/camera/core/ImageAnalysis$Builder;
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mImageAnalysisTargetSize:Landroidx/camera/view/CameraController$OutputSize;

    invoke-direct {p0, v0, v1}, Landroidx/camera/view/CameraController;->setTargetOutputSize(Landroidx/camera/core/impl/ImageOutputConfig$Builder;Landroidx/camera/view/CameraController$OutputSize;)V

    .line 1089
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mAnalysisBackgroundExecutor:Ljava/util/concurrent/Executor;

    if-eqz v1, :cond_1

    .line 1090
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mAnalysisBackgroundExecutor:Ljava/util/concurrent/Executor;

    invoke-virtual {v0, v1}, Landroidx/camera/core/ImageAnalysis$Builder;->setBackgroundExecutor(Ljava/util/concurrent/Executor;)Landroidx/camera/core/ImageAnalysis$Builder;

    .line 1092
    :cond_1
    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis$Builder;->build()Landroidx/camera/core/ImageAnalysis;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    .line 1093
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mAnalysisExecutor:Ljava/util/concurrent/Executor;

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroidx/camera/view/CameraController;->mAnalysisAnalyzer:Landroidx/camera/core/ImageAnalysis$Analyzer;

    if-eqz v1, :cond_2

    .line 1094
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    iget-object v2, p0, Landroidx/camera/view/CameraController;->mAnalysisExecutor:Ljava/util/concurrent/Executor;

    iget-object v3, p0, Landroidx/camera/view/CameraController;->mAnalysisAnalyzer:Landroidx/camera/core/ImageAnalysis$Analyzer;

    invoke-virtual {v1, v2, v3}, Landroidx/camera/core/ImageAnalysis;->setAnalyzer(Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageAnalysis$Analyzer;)V

    .line 1096
    :cond_2
    return-void
.end method

.method private unbindImageCaptureAndRecreate(I)V
    .locals 4
    .param p1, "imageCaptureMode"    # I

    .line 829
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->isCameraInitialized()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 830
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    const/4 v1, 0x1

    new-array v1, v1, [Landroidx/camera/core/UseCase;

    const/4 v2, 0x0

    iget-object v3, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    aput-object v3, v1, v2

    invoke-interface {v0, v1}, Landroidx/camera/view/ProcessCameraProviderWrapper;->unbind([Landroidx/camera/core/UseCase;)V

    .line 832
    :cond_0
    new-instance v0, Landroidx/camera/core/ImageCapture$Builder;

    invoke-direct {v0}, Landroidx/camera/core/ImageCapture$Builder;-><init>()V

    invoke-virtual {v0, p1}, Landroidx/camera/core/ImageCapture$Builder;->setCaptureMode(I)Landroidx/camera/core/ImageCapture$Builder;

    move-result-object v0

    .line 833
    .local v0, "builder":Landroidx/camera/core/ImageCapture$Builder;
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mImageCaptureTargetSize:Landroidx/camera/view/CameraController$OutputSize;

    invoke-direct {p0, v0, v1}, Landroidx/camera/view/CameraController;->setTargetOutputSize(Landroidx/camera/core/impl/ImageOutputConfig$Builder;Landroidx/camera/view/CameraController$OutputSize;)V

    .line 834
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mImageCaptureIoExecutor:Ljava/util/concurrent/Executor;

    if-eqz v1, :cond_1

    .line 835
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mImageCaptureIoExecutor:Ljava/util/concurrent/Executor;

    invoke-virtual {v0, v1}, Landroidx/camera/core/ImageCapture$Builder;->setIoExecutor(Ljava/util/concurrent/Executor;)Landroidx/camera/core/ImageCapture$Builder;

    .line 837
    :cond_1
    invoke-virtual {v0}, Landroidx/camera/core/ImageCapture$Builder;->build()Landroidx/camera/core/ImageCapture;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    .line 838
    return-void
.end method

.method private unbindPreviewAndRecreate()V
    .locals 4

    .line 602
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->isCameraInitialized()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 603
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    const/4 v1, 0x1

    new-array v1, v1, [Landroidx/camera/core/UseCase;

    const/4 v2, 0x0

    iget-object v3, p0, Landroidx/camera/view/CameraController;->mPreview:Landroidx/camera/core/Preview;

    aput-object v3, v1, v2

    invoke-interface {v0, v1}, Landroidx/camera/view/ProcessCameraProviderWrapper;->unbind([Landroidx/camera/core/UseCase;)V

    .line 605
    :cond_0
    new-instance v0, Landroidx/camera/core/Preview$Builder;

    invoke-direct {v0}, Landroidx/camera/core/Preview$Builder;-><init>()V

    .line 606
    .local v0, "builder":Landroidx/camera/core/Preview$Builder;
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mPreviewTargetSize:Landroidx/camera/view/CameraController$OutputSize;

    invoke-direct {p0, v0, v1}, Landroidx/camera/view/CameraController;->setTargetOutputSize(Landroidx/camera/core/impl/ImageOutputConfig$Builder;Landroidx/camera/view/CameraController$OutputSize;)V

    .line 607
    invoke-virtual {v0}, Landroidx/camera/core/Preview$Builder;->build()Landroidx/camera/core/Preview;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/view/CameraController;->mPreview:Landroidx/camera/core/Preview;

    .line 608
    return-void
.end method

.method private unbindVideoAndRecreate()V
    .locals 4

    .line 1421
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->isCameraInitialized()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1422
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    const/4 v1, 0x1

    new-array v1, v1, [Landroidx/camera/core/UseCase;

    const/4 v2, 0x0

    iget-object v3, p0, Landroidx/camera/view/CameraController;->mVideoCapture:Landroidx/camera/video/VideoCapture;

    aput-object v3, v1, v2

    invoke-interface {v0, v1}, Landroidx/camera/view/ProcessCameraProviderWrapper;->unbind([Landroidx/camera/core/UseCase;)V

    .line 1424
    :cond_0
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->createNewVideoCapture()Landroidx/camera/video/VideoCapture;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mVideoCapture:Landroidx/camera/video/VideoCapture;

    .line 1425
    return-void
.end method

.method private wrapListenerToDeactivateRecordingOnFinalized(Landroidx/core/util/Consumer;)Landroidx/core/util/Consumer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/core/util/Consumer<",
            "Landroidx/camera/video/VideoRecordEvent;",
            ">;)",
            "Landroidx/core/util/Consumer<",
            "Landroidx/camera/video/VideoRecordEvent;",
            ">;"
        }
    .end annotation

    .line 1309
    .local p1, "listener":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroidx/camera/video/VideoRecordEvent;>;"
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mAppContext:Landroid/content/Context;

    invoke-static {v0}, Landroidx/core/content/ContextCompat;->getMainExecutor(Landroid/content/Context;)Ljava/util/concurrent/Executor;

    move-result-object v0

    .line 1311
    .local v0, "mainExecutor":Ljava/util/concurrent/Executor;
    new-instance v1, Landroidx/camera/view/CameraController$1;

    invoke-direct {v1, p0, v0, p1}, Landroidx/camera/view/CameraController$1;-><init>(Landroidx/camera/view/CameraController;Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)V

    return-object v1
.end method


# virtual methods
.method attachPreviewSurface(Landroidx/camera/core/Preview$SurfaceProvider;Landroidx/camera/core/ViewPort;)V
    .locals 1
    .param p1, "surfaceProvider"    # Landroidx/camera/core/Preview$SurfaceProvider;
    .param p2, "viewPort"    # Landroidx/camera/core/ViewPort;

    .line 525
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 526
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mSurfaceProvider:Landroidx/camera/core/Preview$SurfaceProvider;

    if-eq v0, p1, :cond_0

    .line 527
    iput-object p1, p0, Landroidx/camera/view/CameraController;->mSurfaceProvider:Landroidx/camera/core/Preview$SurfaceProvider;

    .line 528
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mPreview:Landroidx/camera/core/Preview;

    invoke-virtual {v0, p1}, Landroidx/camera/core/Preview;->setSurfaceProvider(Landroidx/camera/core/Preview$SurfaceProvider;)V

    .line 530
    :cond_0
    iput-object p2, p0, Landroidx/camera/view/CameraController;->mViewPort:Landroidx/camera/core/ViewPort;

    .line 531
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->startListeningToRotationEvents()V

    .line 532
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 533
    return-void
.end method

.method public clearEffects()V
    .locals 1

    .line 1905
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1906
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    if-eqz v0, :cond_0

    .line 1908
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    invoke-interface {v0}, Landroidx/camera/view/ProcessCameraProviderWrapper;->unbindAll()V

    .line 1910
    :cond_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mEffects:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 1911
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 1912
    return-void
.end method

.method public clearImageAnalysisAnalyzer()V
    .locals 3

    .line 901
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 902
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mAnalysisAnalyzer:Landroidx/camera/core/ImageAnalysis$Analyzer;

    .line 903
    .local v0, "oldAnalyzer":Landroidx/camera/core/ImageAnalysis$Analyzer;
    const/4 v1, 0x0

    iput-object v1, p0, Landroidx/camera/view/CameraController;->mAnalysisExecutor:Ljava/util/concurrent/Executor;

    .line 904
    iput-object v1, p0, Landroidx/camera/view/CameraController;->mAnalysisAnalyzer:Landroidx/camera/core/ImageAnalysis$Analyzer;

    .line 905
    iget-object v2, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {v2}, Landroidx/camera/core/ImageAnalysis;->clearAnalyzer()V

    .line 906
    invoke-direct {p0, v0, v1}, Landroidx/camera/view/CameraController;->restartCameraIfAnalyzerResolutionChanged(Landroidx/camera/core/ImageAnalysis$Analyzer;Landroidx/camera/core/ImageAnalysis$Analyzer;)V

    .line 907
    return-void
.end method

.method clearPreviewSurface()V
    .locals 4

    .line 540
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 541
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    if-eqz v0, :cond_0

    .line 543
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    const/4 v1, 0x4

    new-array v1, v1, [Landroidx/camera/core/UseCase;

    const/4 v2, 0x0

    iget-object v3, p0, Landroidx/camera/view/CameraController;->mPreview:Landroidx/camera/core/Preview;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-object v3, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    aput-object v3, v1, v2

    const/4 v2, 0x3

    iget-object v3, p0, Landroidx/camera/view/CameraController;->mVideoCapture:Landroidx/camera/video/VideoCapture;

    aput-object v3, v1, v2

    invoke-interface {v0, v1}, Landroidx/camera/view/ProcessCameraProviderWrapper;->unbind([Landroidx/camera/core/UseCase;)V

    .line 545
    :cond_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mPreview:Landroidx/camera/core/Preview;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/camera/core/Preview;->setSurfaceProvider(Landroidx/camera/core/Preview$SurfaceProvider;)V

    .line 546
    iput-object v1, p0, Landroidx/camera/view/CameraController;->mCamera:Landroidx/camera/core/Camera;

    .line 547
    iput-object v1, p0, Landroidx/camera/view/CameraController;->mSurfaceProvider:Landroidx/camera/core/Preview$SurfaceProvider;

    .line 548
    iput-object v1, p0, Landroidx/camera/view/CameraController;->mViewPort:Landroidx/camera/core/ViewPort;

    .line 549
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->stopListeningToRotationEvents()V

    .line 550
    return-void
.end method

.method protected createUseCaseGroup()Landroidx/camera/core/UseCaseGroup;
    .locals 6

    .line 1961
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->isCameraInitialized()Z

    move-result v0

    const/4 v1, 0x0

    const-string v2, "CameraController"

    if-nez v0, :cond_0

    .line 1962
    const-string v0, "Camera not initialized."

    invoke-static {v2, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1963
    return-object v1

    .line 1965
    :cond_0
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->isPreviewViewAttached()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1967
    const-string/jumbo v0, "PreviewView not attached to CameraController."

    invoke-static {v2, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1968
    return-object v1

    .line 1971
    :cond_1
    new-instance v0, Landroidx/camera/core/UseCaseGroup$Builder;

    invoke-direct {v0}, Landroidx/camera/core/UseCaseGroup$Builder;-><init>()V

    iget-object v1, p0, Landroidx/camera/view/CameraController;->mPreview:Landroidx/camera/core/Preview;

    invoke-virtual {v0, v1}, Landroidx/camera/core/UseCaseGroup$Builder;->addUseCase(Landroidx/camera/core/UseCase;)Landroidx/camera/core/UseCaseGroup$Builder;

    move-result-object v0

    .line 1973
    .local v0, "builder":Landroidx/camera/core/UseCaseGroup$Builder;
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->isImageCaptureEnabled()Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_2

    .line 1974
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    invoke-virtual {v0, v1}, Landroidx/camera/core/UseCaseGroup$Builder;->addUseCase(Landroidx/camera/core/UseCase;)Landroidx/camera/core/UseCaseGroup$Builder;

    goto :goto_0

    .line 1976
    :cond_2
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    new-array v4, v3, [Landroidx/camera/core/UseCase;

    iget-object v5, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    aput-object v5, v4, v2

    invoke-interface {v1, v4}, Landroidx/camera/view/ProcessCameraProviderWrapper;->unbind([Landroidx/camera/core/UseCase;)V

    .line 1979
    :goto_0
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->isImageAnalysisEnabled()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1980
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {v0, v1}, Landroidx/camera/core/UseCaseGroup$Builder;->addUseCase(Landroidx/camera/core/UseCase;)Landroidx/camera/core/UseCaseGroup$Builder;

    goto :goto_1

    .line 1982
    :cond_3
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    new-array v4, v3, [Landroidx/camera/core/UseCase;

    iget-object v5, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    aput-object v5, v4, v2

    invoke-interface {v1, v4}, Landroidx/camera/view/ProcessCameraProviderWrapper;->unbind([Landroidx/camera/core/UseCase;)V

    .line 1985
    :goto_1
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->isVideoCaptureEnabled()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1986
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mVideoCapture:Landroidx/camera/video/VideoCapture;

    invoke-virtual {v0, v1}, Landroidx/camera/core/UseCaseGroup$Builder;->addUseCase(Landroidx/camera/core/UseCase;)Landroidx/camera/core/UseCaseGroup$Builder;

    goto :goto_2

    .line 1988
    :cond_4
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    new-array v3, v3, [Landroidx/camera/core/UseCase;

    iget-object v4, p0, Landroidx/camera/view/CameraController;->mVideoCapture:Landroidx/camera/video/VideoCapture;

    aput-object v4, v3, v2

    invoke-interface {v1, v3}, Landroidx/camera/view/ProcessCameraProviderWrapper;->unbind([Landroidx/camera/core/UseCase;)V

    .line 1991
    :goto_2
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mViewPort:Landroidx/camera/core/ViewPort;

    invoke-virtual {v0, v1}, Landroidx/camera/core/UseCaseGroup$Builder;->setViewPort(Landroidx/camera/core/ViewPort;)Landroidx/camera/core/UseCaseGroup$Builder;

    .line 1992
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mEffects:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/CameraEffect;

    .line 1993
    .local v2, "effect":Landroidx/camera/core/CameraEffect;
    invoke-virtual {v0, v2}, Landroidx/camera/core/UseCaseGroup$Builder;->addEffect(Landroidx/camera/core/CameraEffect;)Landroidx/camera/core/UseCaseGroup$Builder;

    .line 1994
    .end local v2    # "effect":Landroidx/camera/core/CameraEffect;
    goto :goto_3

    .line 1995
    :cond_5
    invoke-virtual {v0}, Landroidx/camera/core/UseCaseGroup$Builder;->build()Landroidx/camera/core/UseCaseGroup;

    move-result-object v1

    return-object v1
.end method

.method deactivateRecordingByListener(Landroidx/core/util/Consumer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/core/util/Consumer<",
            "Landroidx/camera/video/VideoRecordEvent;",
            ">;)V"
        }
    .end annotation

    .line 1329
    .local p1, "listener":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroidx/camera/video/VideoRecordEvent;>;"
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mRecordingMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/Recording;

    .line 1330
    .local v0, "recording":Landroidx/camera/video/Recording;
    if-eqz v0, :cond_0

    .line 1331
    invoke-direct {p0, v0}, Landroidx/camera/view/CameraController;->deactivateRecording(Landroidx/camera/video/Recording;)V

    .line 1333
    :cond_0
    return-void
.end method

.method public enableTorch(Z)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .param p1, "torchEnabled"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 1855
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1856
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->isCameraAttached()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1857
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mPendingEnableTorch:Landroidx/camera/view/PendingValue;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/view/PendingValue;->setValue(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0

    .line 1859
    :cond_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCamera:Landroidx/camera/core/Camera;

    invoke-interface {v0}, Landroidx/camera/core/Camera;->getCameraControl()Landroidx/camera/core/CameraControl;

    move-result-object v0

    invoke-interface {v0, p1}, Landroidx/camera/core/CameraControl;->enableTorch(Z)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public getCameraControl()Landroidx/camera/core/CameraControl;
    .locals 1

    .line 1766
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1767
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCamera:Landroidx/camera/core/Camera;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCamera:Landroidx/camera/core/Camera;

    invoke-interface {v0}, Landroidx/camera/core/Camera;->getCameraControl()Landroidx/camera/core/CameraControl;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getCameraInfo()Landroidx/camera/core/CameraInfo;
    .locals 1

    .line 1747
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1748
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCamera:Landroidx/camera/core/Camera;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCamera:Landroidx/camera/core/Camera;

    invoke-interface {v0}, Landroidx/camera/core/Camera;->getCameraInfo()Landroidx/camera/core/CameraInfo;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getCameraSelector()Landroidx/camera/core/CameraSelector;
    .locals 1

    .line 1518
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1519
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraSelector:Landroidx/camera/core/CameraSelector;

    return-object v0
.end method

.method public getImageAnalysisBackgroundExecutor()Ljava/util/concurrent/Executor;
    .locals 1

    .line 1072
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1073
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mAnalysisBackgroundExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public getImageAnalysisBackpressureStrategy()I
    .locals 1

    .line 935
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 936
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getBackpressureStrategy()I

    move-result v0

    return v0
.end method

.method public getImageAnalysisImageQueueDepth()I
    .locals 1

    .line 995
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 996
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getImageQueueDepth()I

    move-result v0

    return v0
.end method

.method public getImageAnalysisTargetSize()Landroidx/camera/view/CameraController$OutputSize;
    .locals 1

    .line 1036
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1037
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageAnalysisTargetSize:Landroidx/camera/view/CameraController$OutputSize;

    return-object v0
.end method

.method public getImageCaptureFlashMode()I
    .locals 1

    .line 638
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 639
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    invoke-virtual {v0}, Landroidx/camera/core/ImageCapture;->getFlashMode()I

    move-result v0

    return v0
.end method

.method public getImageCaptureIoExecutor()Ljava/util/concurrent/Executor;
    .locals 1

    .line 821
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 822
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageCaptureIoExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public getImageCaptureMode()I
    .locals 1

    .line 751
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 752
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    invoke-virtual {v0}, Landroidx/camera/core/ImageCapture;->getCaptureMode()I

    move-result v0

    return v0
.end method

.method public getImageCaptureTargetSize()Landroidx/camera/view/CameraController$OutputSize;
    .locals 1

    .line 787
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 788
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageCaptureTargetSize:Landroidx/camera/view/CameraController$OutputSize;

    return-object v0
.end method

.method public getInitializationFuture()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 400
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mInitializationFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    return-object v0
.end method

.method public getPreviewTargetSize()Landroidx/camera/view/CameraController$OutputSize;
    .locals 1

    .line 594
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 595
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mPreviewTargetSize:Landroidx/camera/view/CameraController$OutputSize;

    return-object v0
.end method

.method public getTapToFocusState()Landroidx/lifecycle/LiveData;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1711
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1712
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mTapToFocusState:Landroidx/lifecycle/MutableLiveData;

    return-object v0
.end method

.method public getTorchState()Landroidx/lifecycle/LiveData;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1836
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1837
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mTorchState:Landroidx/camera/view/ForwardingLiveData;

    return-object v0
.end method

.method public getVideoCaptureQualitySelector()Landroidx/camera/video/QualitySelector;
    .locals 1

    .line 1413
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1414
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mVideoCaptureQualitySelector:Landroidx/camera/video/QualitySelector;

    return-object v0
.end method

.method public getZoomState()Landroidx/lifecycle/LiveData;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Landroidx/camera/core/ZoomState;",
            ">;"
        }
    .end annotation

    .line 1728
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1729
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mZoomState:Landroidx/camera/view/ForwardingLiveData;

    return-object v0
.end method

.method public hasCamera(Landroidx/camera/core/CameraSelector;)Z
    .locals 3
    .param p1, "cameraSelector"    # Landroidx/camera/core/CameraSelector;

    .line 1492
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1493
    invoke-static {p1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1495
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    if-eqz v0, :cond_0

    .line 1501
    :try_start_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    invoke-interface {v0, p1}, Landroidx/camera/view/ProcessCameraProviderWrapper;->hasCamera(Landroidx/camera/core/CameraSelector;)Z

    move-result v0
    :try_end_0
    .catch Landroidx/camera/core/CameraInfoUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 1502
    :catch_0
    move-exception v0

    .line 1503
    .local v0, "e":Landroidx/camera/core/CameraInfoUnavailableException;
    const-string v1, "CameraController"

    const-string v2, "Failed to check camera availability"

    invoke-static {v1, v2, v0}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1504
    const/4 v1, 0x0

    return v1

    .line 1496
    .end local v0    # "e":Landroidx/camera/core/CameraInfoUnavailableException;
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Camera not initialized. Please wait for the initialization future to finish. See #getInitializationFuture()."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public isImageAnalysisEnabled()Z
    .locals 1

    .line 851
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 852
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Landroidx/camera/view/CameraController;->isUseCaseEnabled(I)Z

    move-result v0

    return v0
.end method

.method public isImageCaptureEnabled()Z
    .locals 1

    .line 624
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 625
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Landroidx/camera/view/CameraController;->isUseCaseEnabled(I)Z

    move-result v0

    return v0
.end method

.method public isPinchToZoomEnabled()Z
    .locals 1

    .line 1531
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1532
    iget-boolean v0, p0, Landroidx/camera/view/CameraController;->mPinchToZoomEnabled:Z

    return v0
.end method

.method public isRecording()Z
    .locals 1

    .line 1376
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1377
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mActiveRecording:Landroidx/camera/video/Recording;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/camera/view/CameraController;->mActiveRecording:Landroidx/camera/video/Recording;

    invoke-virtual {v0}, Landroidx/camera/video/Recording;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isTapToFocusEnabled()Z
    .locals 1

    .line 1638
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1639
    iget-boolean v0, p0, Landroidx/camera/view/CameraController;->mTapToFocusEnabled:Z

    return v0
.end method

.method public isVideoCaptureEnabled()Z
    .locals 1

    .line 1123
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1124
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Landroidx/camera/view/CameraController;->isUseCaseEnabled(I)Z

    move-result v0

    return v0
.end method

.method synthetic lambda$new$0$androidx-camera-view-CameraController(Landroidx/camera/view/ProcessCameraProviderWrapper;)Ljava/lang/Void;
    .locals 1
    .param p1, "provider"    # Landroidx/camera/view/ProcessCameraProviderWrapper;

    .line 338
    iput-object p1, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    .line 339
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 340
    const/4 v0, 0x0

    return-object v0
.end method

.method synthetic lambda$new$1$androidx-camera-view-CameraController(I)V
    .locals 1
    .param p1, "rotation"    # I

    .line 348
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {v0, p1}, Landroidx/camera/core/ImageAnalysis;->setTargetRotation(I)V

    .line 349
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    invoke-virtual {v0, p1}, Landroidx/camera/core/ImageCapture;->setTargetRotation(I)V

    .line 350
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mVideoCapture:Landroidx/camera/video/VideoCapture;

    invoke-virtual {v0, p1}, Landroidx/camera/video/VideoCapture;->setTargetRotation(I)V

    .line 351
    return-void
.end method

.method synthetic lambda$setCameraSelector$3$androidx-camera-view-CameraController(Landroidx/camera/core/CameraSelector;)V
    .locals 0
    .param p1, "oldCameraSelector"    # Landroidx/camera/core/CameraSelector;

    .line 1463
    iput-object p1, p0, Landroidx/camera/view/CameraController;->mCameraSelector:Landroidx/camera/core/CameraSelector;

    return-void
.end method

.method synthetic lambda$setEnabledUseCases$2$androidx-camera-view-CameraController(I)V
    .locals 0
    .param p1, "oldEnabledUseCases"    # I

    .line 471
    iput p1, p0, Landroidx/camera/view/CameraController;->mEnabledUseCases:I

    return-void
.end method

.method onPinchToZoom(F)V
    .locals 4
    .param p1, "pinchToZoomScale"    # F

    .line 1554
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->isCameraAttached()Z

    move-result v0

    const-string v1, "CameraController"

    if-nez v0, :cond_0

    .line 1555
    const-string/jumbo v0, "Use cases not attached to camera."

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1556
    return-void

    .line 1558
    :cond_0
    iget-boolean v0, p0, Landroidx/camera/view/CameraController;->mPinchToZoomEnabled:Z

    if-nez v0, :cond_1

    .line 1559
    const-string/jumbo v0, "Pinch to zoom disabled."

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1560
    return-void

    .line 1562
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Pinch to zoom with scale: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1564
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->getZoomState()Landroidx/lifecycle/LiveData;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/lifecycle/LiveData;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/ZoomState;

    .line 1565
    .local v0, "zoomState":Landroidx/camera/core/ZoomState;
    if-nez v0, :cond_2

    .line 1566
    return-void

    .line 1568
    :cond_2
    invoke-interface {v0}, Landroidx/camera/core/ZoomState;->getZoomRatio()F

    move-result v1

    invoke-direct {p0, p1}, Landroidx/camera/view/CameraController;->speedUpZoomBy2X(F)F

    move-result v2

    mul-float/2addr v1, v2

    .line 1570
    .local v1, "clampedRatio":F
    invoke-interface {v0}, Landroidx/camera/core/ZoomState;->getMinZoomRatio()F

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    .line 1571
    invoke-interface {v0}, Landroidx/camera/core/ZoomState;->getMaxZoomRatio()F

    move-result v3

    .line 1570
    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 1572
    invoke-virtual {p0, v1}, Landroidx/camera/view/CameraController;->setZoomRatio(F)Lcom/google/common/util/concurrent/ListenableFuture;

    .line 1573
    return-void
.end method

.method onTapToFocus(Landroidx/camera/core/MeteringPointFactory;FF)V
    .locals 6
    .param p1, "meteringPointFactory"    # Landroidx/camera/core/MeteringPointFactory;
    .param p2, "x"    # F
    .param p3, "y"    # F

    .line 1588
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->isCameraAttached()Z

    move-result v0

    const-string v1, "CameraController"

    if-nez v0, :cond_0

    .line 1589
    const-string/jumbo v0, "Use cases not attached to camera."

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1590
    return-void

    .line 1592
    :cond_0
    iget-boolean v0, p0, Landroidx/camera/view/CameraController;->mTapToFocusEnabled:Z

    if-nez v0, :cond_1

    .line 1593
    const-string/jumbo v0, "Tap to focus disabled. "

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1594
    return-void

    .line 1596
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Tap to focus started: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1597
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mTapToFocusState:Landroidx/lifecycle/MutableLiveData;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroidx/lifecycle/MutableLiveData;->postValue(Ljava/lang/Object;)V

    .line 1598
    const v0, 0x3e2aaaab

    invoke-virtual {p1, p2, p3, v0}, Landroidx/camera/core/MeteringPointFactory;->createPoint(FFF)Landroidx/camera/core/MeteringPoint;

    move-result-object v0

    .line 1599
    .local v0, "afPoint":Landroidx/camera/core/MeteringPoint;
    const/high16 v2, 0x3e800000    # 0.25f

    invoke-virtual {p1, p2, p3, v2}, Landroidx/camera/core/MeteringPointFactory;->createPoint(FFF)Landroidx/camera/core/MeteringPoint;

    move-result-object v2

    .line 1600
    .local v2, "aePoint":Landroidx/camera/core/MeteringPoint;
    new-instance v3, Landroidx/camera/core/FocusMeteringAction$Builder;

    invoke-direct {v3, v0, v1}, Landroidx/camera/core/FocusMeteringAction$Builder;-><init>(Landroidx/camera/core/MeteringPoint;I)V

    .line 1602
    const/4 v1, 0x2

    invoke-virtual {v3, v2, v1}, Landroidx/camera/core/FocusMeteringAction$Builder;->addPoint(Landroidx/camera/core/MeteringPoint;I)Landroidx/camera/core/FocusMeteringAction$Builder;

    move-result-object v1

    .line 1603
    invoke-virtual {v1}, Landroidx/camera/core/FocusMeteringAction$Builder;->build()Landroidx/camera/core/FocusMeteringAction;

    move-result-object v1

    .line 1604
    .local v1, "focusMeteringAction":Landroidx/camera/core/FocusMeteringAction;
    iget-object v3, p0, Landroidx/camera/view/CameraController;->mCamera:Landroidx/camera/core/Camera;

    invoke-interface {v3}, Landroidx/camera/core/Camera;->getCameraControl()Landroidx/camera/core/CameraControl;

    move-result-object v3

    invoke-interface {v3, v1}, Landroidx/camera/core/CameraControl;->startFocusAndMetering(Landroidx/camera/core/FocusMeteringAction;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v3

    new-instance v4, Landroidx/camera/view/CameraController$2;

    invoke-direct {v4, p0}, Landroidx/camera/view/CameraController$2;-><init>(Landroidx/camera/view/CameraController;)V

    .line 1626
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v5

    .line 1604
    invoke-static {v3, v4, v5}, Landroidx/camera/core/impl/utils/futures/Futures;->addCallback(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/camera/core/impl/utils/futures/FutureCallback;Ljava/util/concurrent/Executor;)V

    .line 1627
    return-void
.end method

.method public setCameraSelector(Landroidx/camera/core/CameraSelector;)V
    .locals 5
    .param p1, "cameraSelector"    # Landroidx/camera/core/CameraSelector;

    .line 1451
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1452
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraSelector:Landroidx/camera/core/CameraSelector;

    if-ne v0, p1, :cond_0

    .line 1453
    return-void

    .line 1456
    :cond_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraSelector:Landroidx/camera/core/CameraSelector;

    .line 1457
    .local v0, "oldCameraSelector":Landroidx/camera/core/CameraSelector;
    iput-object p1, p0, Landroidx/camera/view/CameraController;->mCameraSelector:Landroidx/camera/core/CameraSelector;

    .line 1459
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    if-nez v1, :cond_1

    .line 1460
    return-void

    .line 1462
    :cond_1
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    const/4 v2, 0x4

    new-array v2, v2, [Landroidx/camera/core/UseCase;

    const/4 v3, 0x0

    iget-object v4, p0, Landroidx/camera/view/CameraController;->mPreview:Landroidx/camera/core/Preview;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-object v4, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    aput-object v4, v2, v3

    const/4 v3, 0x2

    iget-object v4, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    aput-object v4, v2, v3

    const/4 v3, 0x3

    iget-object v4, p0, Landroidx/camera/view/CameraController;->mVideoCapture:Landroidx/camera/video/VideoCapture;

    aput-object v4, v2, v3

    invoke-interface {v1, v2}, Landroidx/camera/view/ProcessCameraProviderWrapper;->unbind([Landroidx/camera/core/UseCase;)V

    .line 1463
    new-instance v1, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda7;

    invoke-direct {v1, p0, v0}, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda7;-><init>(Landroidx/camera/view/CameraController;Landroidx/camera/core/CameraSelector;)V

    invoke-virtual {p0, v1}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates(Ljava/lang/Runnable;)V

    .line 1464
    return-void
.end method

.method public setEffects(Ljava/util/Set;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Landroidx/camera/core/CameraEffect;",
            ">;)V"
        }
    .end annotation

    .line 1884
    .local p1, "effects":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/CameraEffect;>;"
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1885
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mEffects:Ljava/util/Set;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1887
    return-void

    .line 1889
    :cond_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    if-eqz v0, :cond_1

    .line 1891
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    invoke-interface {v0}, Landroidx/camera/view/ProcessCameraProviderWrapper;->unbindAll()V

    .line 1893
    :cond_1
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mEffects:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 1894
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mEffects:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 1895
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 1896
    return-void
.end method

.method public setEnabledUseCases(I)V
    .locals 2
    .param p1, "enabledUseCases"    # I

    .line 462
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 463
    iget v0, p0, Landroidx/camera/view/CameraController;->mEnabledUseCases:I

    if-ne p1, v0, :cond_0

    .line 464
    return-void

    .line 466
    :cond_0
    iget v0, p0, Landroidx/camera/view/CameraController;->mEnabledUseCases:I

    .line 467
    .local v0, "oldEnabledUseCases":I
    iput p1, p0, Landroidx/camera/view/CameraController;->mEnabledUseCases:I

    .line 468
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->isVideoCaptureEnabled()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->isRecording()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 469
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->stopRecording()V

    .line 471
    :cond_1
    new-instance v1, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0, v0}, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda6;-><init>(Landroidx/camera/view/CameraController;I)V

    invoke-virtual {p0, v1}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates(Ljava/lang/Runnable;)V

    .line 472
    return-void
.end method

.method public setImageAnalysisAnalyzer(Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageAnalysis$Analyzer;)V
    .locals 2
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "analyzer"    # Landroidx/camera/core/ImageAnalysis$Analyzer;

    .line 877
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 878
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mAnalysisAnalyzer:Landroidx/camera/core/ImageAnalysis$Analyzer;

    if-ne v0, p2, :cond_0

    iget-object v0, p0, Landroidx/camera/view/CameraController;->mAnalysisExecutor:Ljava/util/concurrent/Executor;

    if-ne v0, p1, :cond_0

    .line 879
    return-void

    .line 881
    :cond_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mAnalysisAnalyzer:Landroidx/camera/core/ImageAnalysis$Analyzer;

    .line 882
    .local v0, "oldAnalyzer":Landroidx/camera/core/ImageAnalysis$Analyzer;
    iput-object p1, p0, Landroidx/camera/view/CameraController;->mAnalysisExecutor:Ljava/util/concurrent/Executor;

    .line 883
    iput-object p2, p0, Landroidx/camera/view/CameraController;->mAnalysisAnalyzer:Landroidx/camera/core/ImageAnalysis$Analyzer;

    .line 884
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {v1, p1, p2}, Landroidx/camera/core/ImageAnalysis;->setAnalyzer(Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageAnalysis$Analyzer;)V

    .line 885
    invoke-direct {p0, v0, p2}, Landroidx/camera/view/CameraController;->restartCameraIfAnalyzerResolutionChanged(Landroidx/camera/core/ImageAnalysis$Analyzer;Landroidx/camera/core/ImageAnalysis$Analyzer;)V

    .line 886
    return-void
.end method

.method public setImageAnalysisBackgroundExecutor(Ljava/util/concurrent/Executor;)V
    .locals 2
    .param p1, "executor"    # Ljava/util/concurrent/Executor;

    .line 1054
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1055
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mAnalysisBackgroundExecutor:Ljava/util/concurrent/Executor;

    if-ne v0, p1, :cond_0

    .line 1056
    return-void

    .line 1058
    :cond_0
    iput-object p1, p0, Landroidx/camera/view/CameraController;->mAnalysisBackgroundExecutor:Ljava/util/concurrent/Executor;

    .line 1059
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getBackpressureStrategy()I

    move-result v0

    iget-object v1, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    .line 1060
    invoke-virtual {v1}, Landroidx/camera/core/ImageAnalysis;->getImageQueueDepth()I

    move-result v1

    .line 1059
    invoke-direct {p0, v0, v1}, Landroidx/camera/view/CameraController;->unbindImageAnalysisAndRecreate(II)V

    .line 1061
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 1062
    return-void
.end method

.method public setImageAnalysisBackpressureStrategy(I)V
    .locals 1
    .param p1, "strategy"    # I

    .line 956
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 957
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getBackpressureStrategy()I

    move-result v0

    if-ne v0, p1, :cond_0

    .line 958
    return-void

    .line 961
    :cond_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getImageQueueDepth()I

    move-result v0

    invoke-direct {p0, p1, v0}, Landroidx/camera/view/CameraController;->unbindImageAnalysisAndRecreate(II)V

    .line 962
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 963
    return-void
.end method

.method public setImageAnalysisImageQueueDepth(I)V
    .locals 1
    .param p1, "depth"    # I

    .line 980
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 981
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getImageQueueDepth()I

    move-result v0

    if-ne v0, p1, :cond_0

    .line 982
    return-void

    .line 984
    :cond_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getBackpressureStrategy()I

    move-result v0

    invoke-direct {p0, v0, p1}, Landroidx/camera/view/CameraController;->unbindImageAnalysisAndRecreate(II)V

    .line 985
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 986
    return-void
.end method

.method public setImageAnalysisTargetSize(Landroidx/camera/view/CameraController$OutputSize;)V
    .locals 2
    .param p1, "targetSize"    # Landroidx/camera/view/CameraController$OutputSize;

    .line 1018
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1019
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageAnalysisTargetSize:Landroidx/camera/view/CameraController$OutputSize;

    invoke-direct {p0, v0, p1}, Landroidx/camera/view/CameraController;->isOutputSizeEqual(Landroidx/camera/view/CameraController$OutputSize;Landroidx/camera/view/CameraController$OutputSize;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1020
    return-void

    .line 1022
    :cond_0
    iput-object p1, p0, Landroidx/camera/view/CameraController;->mImageAnalysisTargetSize:Landroidx/camera/view/CameraController$OutputSize;

    .line 1023
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    .line 1024
    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getBackpressureStrategy()I

    move-result v0

    iget-object v1, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    .line 1025
    invoke-virtual {v1}, Landroidx/camera/core/ImageAnalysis;->getImageQueueDepth()I

    move-result v1

    .line 1023
    invoke-direct {p0, v0, v1}, Landroidx/camera/view/CameraController;->unbindImageAnalysisAndRecreate(II)V

    .line 1026
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 1027
    return-void
.end method

.method public setImageCaptureFlashMode(I)V
    .locals 1
    .param p1, "flashMode"    # I

    .line 651
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 652
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    invoke-virtual {v0, p1}, Landroidx/camera/core/ImageCapture;->setFlashMode(I)V

    .line 653
    return-void
.end method

.method public setImageCaptureIoExecutor(Ljava/util/concurrent/Executor;)V
    .locals 1
    .param p1, "executor"    # Ljava/util/concurrent/Executor;

    .line 806
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 807
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageCaptureIoExecutor:Ljava/util/concurrent/Executor;

    if-ne v0, p1, :cond_0

    .line 808
    return-void

    .line 810
    :cond_0
    iput-object p1, p0, Landroidx/camera/view/CameraController;->mImageCaptureIoExecutor:Ljava/util/concurrent/Executor;

    .line 811
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    invoke-virtual {v0}, Landroidx/camera/core/ImageCapture;->getCaptureMode()I

    move-result v0

    invoke-direct {p0, v0}, Landroidx/camera/view/CameraController;->unbindImageCaptureAndRecreate(I)V

    .line 812
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 813
    return-void
.end method

.method public setImageCaptureMode(I)V
    .locals 1
    .param p1, "captureMode"    # I

    .line 736
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 737
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    invoke-virtual {v0}, Landroidx/camera/core/ImageCapture;->getCaptureMode()I

    move-result v0

    if-ne v0, p1, :cond_0

    .line 738
    return-void

    .line 740
    :cond_0
    invoke-direct {p0, p1}, Landroidx/camera/view/CameraController;->unbindImageCaptureAndRecreate(I)V

    .line 741
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 742
    return-void
.end method

.method public setImageCaptureTargetSize(Landroidx/camera/view/CameraController$OutputSize;)V
    .locals 1
    .param p1, "targetSize"    # Landroidx/camera/view/CameraController$OutputSize;

    .line 771
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 772
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageCaptureTargetSize:Landroidx/camera/view/CameraController$OutputSize;

    invoke-direct {p0, v0, p1}, Landroidx/camera/view/CameraController;->isOutputSizeEqual(Landroidx/camera/view/CameraController$OutputSize;Landroidx/camera/view/CameraController$OutputSize;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 773
    return-void

    .line 775
    :cond_0
    iput-object p1, p0, Landroidx/camera/view/CameraController;->mImageCaptureTargetSize:Landroidx/camera/view/CameraController$OutputSize;

    .line 776
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->getImageCaptureMode()I

    move-result v0

    invoke-direct {p0, v0}, Landroidx/camera/view/CameraController;->unbindImageCaptureAndRecreate(I)V

    .line 777
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 778
    return-void
.end method

.method public setLinearZoom(F)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .param p1, "linearZoom"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 1817
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1818
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->isCameraAttached()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1819
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mPendingLinearZoom:Landroidx/camera/view/PendingValue;

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/view/PendingValue;->setValue(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0

    .line 1821
    :cond_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCamera:Landroidx/camera/core/Camera;

    invoke-interface {v0}, Landroidx/camera/core/Camera;->getCameraControl()Landroidx/camera/core/CameraControl;

    move-result-object v0

    invoke-interface {v0, p1}, Landroidx/camera/core/CameraControl;->setLinearZoom(F)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public setPinchToZoomEnabled(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .line 1545
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1546
    iput-boolean p1, p0, Landroidx/camera/view/CameraController;->mPinchToZoomEnabled:Z

    .line 1547
    return-void
.end method

.method public setPreviewTargetSize(Landroidx/camera/view/CameraController$OutputSize;)V
    .locals 1
    .param p1, "targetSize"    # Landroidx/camera/view/CameraController$OutputSize;

    .line 578
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 579
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mPreviewTargetSize:Landroidx/camera/view/CameraController$OutputSize;

    invoke-direct {p0, v0, p1}, Landroidx/camera/view/CameraController;->isOutputSizeEqual(Landroidx/camera/view/CameraController$OutputSize;Landroidx/camera/view/CameraController$OutputSize;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 580
    return-void

    .line 582
    :cond_0
    iput-object p1, p0, Landroidx/camera/view/CameraController;->mPreviewTargetSize:Landroidx/camera/view/CameraController$OutputSize;

    .line 583
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->unbindPreviewAndRecreate()V

    .line 584
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 585
    return-void
.end method

.method public setTapToFocusEnabled(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .line 1651
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1652
    iput-boolean p1, p0, Landroidx/camera/view/CameraController;->mTapToFocusEnabled:Z

    .line 1653
    return-void
.end method

.method public setVideoCaptureQualitySelector(Landroidx/camera/video/QualitySelector;)V
    .locals 0
    .param p1, "qualitySelector"    # Landroidx/camera/video/QualitySelector;

    .line 1397
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1398
    iput-object p1, p0, Landroidx/camera/view/CameraController;->mVideoCaptureQualitySelector:Landroidx/camera/video/QualitySelector;

    .line 1399
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->unbindVideoAndRecreate()V

    .line 1400
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 1401
    return-void
.end method

.method public setZoomRatio(F)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .param p1, "zoomRatio"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 1790
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1791
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->isCameraAttached()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1792
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mPendingZoomRatio:Landroidx/camera/view/PendingValue;

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/view/PendingValue;->setValue(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0

    .line 1794
    :cond_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCamera:Landroidx/camera/core/Camera;

    invoke-interface {v0}, Landroidx/camera/core/Camera;->getCameraControl()Landroidx/camera/core/CameraControl;

    move-result-object v0

    invoke-interface {v0, p1}, Landroidx/camera/core/CameraControl;->setZoomRatio(F)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method abstract startCamera()Landroidx/camera/core/Camera;
.end method

.method startCameraAndTrackStates()V
    .locals 1

    .line 1922
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates(Ljava/lang/Runnable;)V

    .line 1923
    return-void
.end method

.method startCameraAndTrackStates(Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "restoreStateRunnable"    # Ljava/lang/Runnable;

    .line 1933
    :try_start_0
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCamera()Landroidx/camera/core/Camera;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mCamera:Landroidx/camera/core/Camera;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1940
    nop

    .line 1941
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->isCameraAttached()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1942
    const-string v0, "CameraController"

    const-string/jumbo v1, "Use cases not attached to camera."

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1943
    return-void

    .line 1945
    :cond_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mZoomState:Landroidx/camera/view/ForwardingLiveData;

    iget-object v1, p0, Landroidx/camera/view/CameraController;->mCamera:Landroidx/camera/core/Camera;

    invoke-interface {v1}, Landroidx/camera/core/Camera;->getCameraInfo()Landroidx/camera/core/CameraInfo;

    move-result-object v1

    invoke-interface {v1}, Landroidx/camera/core/CameraInfo;->getZoomState()Landroidx/lifecycle/LiveData;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/view/ForwardingLiveData;->setSource(Landroidx/lifecycle/LiveData;)V

    .line 1946
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mTorchState:Landroidx/camera/view/ForwardingLiveData;

    iget-object v1, p0, Landroidx/camera/view/CameraController;->mCamera:Landroidx/camera/core/Camera;

    invoke-interface {v1}, Landroidx/camera/core/Camera;->getCameraInfo()Landroidx/camera/core/CameraInfo;

    move-result-object v1

    invoke-interface {v1}, Landroidx/camera/core/CameraInfo;->getTorchState()Landroidx/lifecycle/LiveData;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/view/ForwardingLiveData;->setSource(Landroidx/lifecycle/LiveData;)V

    .line 1947
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mPendingEnableTorch:Landroidx/camera/view/PendingValue;

    new-instance v1, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/view/CameraController;)V

    invoke-virtual {v0, v1}, Landroidx/camera/view/PendingValue;->propagateIfHasValue(Landroidx/arch/core/util/Function;)V

    .line 1948
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mPendingLinearZoom:Landroidx/camera/view/PendingValue;

    new-instance v1, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/view/CameraController;)V

    invoke-virtual {v0, v1}, Landroidx/camera/view/PendingValue;->propagateIfHasValue(Landroidx/arch/core/util/Function;)V

    .line 1949
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mPendingZoomRatio:Landroidx/camera/view/PendingValue;

    new-instance v1, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/view/CameraController;)V

    invoke-virtual {v0, v1}, Landroidx/camera/view/PendingValue;->propagateIfHasValue(Landroidx/arch/core/util/Function;)V

    .line 1950
    return-void

    .line 1934
    :catch_0
    move-exception v0

    .line 1936
    .local v0, "exception":Ljava/lang/RuntimeException;
    if-eqz p1, :cond_1

    .line 1937
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 1939
    :cond_1
    throw v0
.end method

.method public startRecording(Landroidx/camera/video/FileDescriptorOutputOptions;Landroidx/camera/view/video/AudioConfig;Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)Landroidx/camera/video/Recording;
    .locals 1
    .param p1, "outputOptions"    # Landroidx/camera/video/FileDescriptorOutputOptions;
    .param p2, "audioConfig"    # Landroidx/camera/view/video/AudioConfig;
    .param p3, "executor"    # Ljava/util/concurrent/Executor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/video/FileDescriptorOutputOptions;",
            "Landroidx/camera/view/video/AudioConfig;",
            "Ljava/util/concurrent/Executor;",
            "Landroidx/core/util/Consumer<",
            "Landroidx/camera/video/VideoRecordEvent;",
            ">;)",
            "Landroidx/camera/video/Recording;"
        }
    .end annotation

    .line 1202
    .local p4, "listener":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroidx/camera/video/VideoRecordEvent;>;"
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/camera/view/CameraController;->startRecordingInternal(Landroidx/camera/video/OutputOptions;Landroidx/camera/view/video/AudioConfig;Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)Landroidx/camera/video/Recording;

    move-result-object v0

    return-object v0
.end method

.method public startRecording(Landroidx/camera/video/FileOutputOptions;Landroidx/camera/view/video/AudioConfig;Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)Landroidx/camera/video/Recording;
    .locals 1
    .param p1, "outputOptions"    # Landroidx/camera/video/FileOutputOptions;
    .param p2, "audioConfig"    # Landroidx/camera/view/video/AudioConfig;
    .param p3, "executor"    # Ljava/util/concurrent/Executor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/video/FileOutputOptions;",
            "Landroidx/camera/view/video/AudioConfig;",
            "Ljava/util/concurrent/Executor;",
            "Landroidx/core/util/Consumer<",
            "Landroidx/camera/video/VideoRecordEvent;",
            ">;)",
            "Landroidx/camera/video/Recording;"
        }
    .end annotation

    .line 1161
    .local p4, "listener":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroidx/camera/video/VideoRecordEvent;>;"
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/camera/view/CameraController;->startRecordingInternal(Landroidx/camera/video/OutputOptions;Landroidx/camera/view/video/AudioConfig;Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)Landroidx/camera/video/Recording;

    move-result-object v0

    return-object v0
.end method

.method public startRecording(Landroidx/camera/video/MediaStoreOutputOptions;Landroidx/camera/view/video/AudioConfig;Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)Landroidx/camera/video/Recording;
    .locals 1
    .param p1, "outputOptions"    # Landroidx/camera/video/MediaStoreOutputOptions;
    .param p2, "audioConfig"    # Landroidx/camera/view/video/AudioConfig;
    .param p3, "executor"    # Ljava/util/concurrent/Executor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/video/MediaStoreOutputOptions;",
            "Landroidx/camera/view/video/AudioConfig;",
            "Ljava/util/concurrent/Executor;",
            "Landroidx/core/util/Consumer<",
            "Landroidx/camera/video/VideoRecordEvent;",
            ">;)",
            "Landroidx/camera/video/Recording;"
        }
    .end annotation

    .line 1239
    .local p4, "listener":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroidx/camera/video/VideoRecordEvent;>;"
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/camera/view/CameraController;->startRecordingInternal(Landroidx/camera/video/OutputOptions;Landroidx/camera/view/video/AudioConfig;Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)Landroidx/camera/video/Recording;

    move-result-object v0

    return-object v0
.end method

.method public takePicture(Landroidx/camera/core/ImageCapture$OutputFileOptions;Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageCapture$OnImageSavedCallback;)V
    .locals 2
    .param p1, "outputFileOptions"    # Landroidx/camera/core/ImageCapture$OutputFileOptions;
    .param p2, "executor"    # Ljava/util/concurrent/Executor;
    .param p3, "imageSavedCallback"    # Landroidx/camera/core/ImageCapture$OnImageSavedCallback;

    .line 676
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 677
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->isCameraInitialized()Z

    move-result v0

    const-string v1, "Camera not initialized."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 678
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->isImageCaptureEnabled()Z

    move-result v0

    const-string v1, "ImageCapture disabled."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 680
    invoke-virtual {p0, p1}, Landroidx/camera/view/CameraController;->updateMirroringFlagInOutputFileOptions(Landroidx/camera/core/ImageCapture$OutputFileOptions;)V

    .line 681
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    invoke-virtual {v0, p1, p2, p3}, Landroidx/camera/core/ImageCapture;->takePicture(Landroidx/camera/core/ImageCapture$OutputFileOptions;Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageCapture$OnImageSavedCallback;)V

    .line 682
    return-void
.end method

.method public takePicture(Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageCapture$OnImageCapturedCallback;)V
    .locals 2
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "callback"    # Landroidx/camera/core/ImageCapture$OnImageCapturedCallback;

    .line 714
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 715
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->isCameraInitialized()Z

    move-result v0

    const-string v1, "Camera not initialized."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 716
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->isImageCaptureEnabled()Z

    move-result v0

    const-string v1, "ImageCapture disabled."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 718
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    invoke-virtual {v0, p1, p2}, Landroidx/camera/core/ImageCapture;->takePicture(Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageCapture$OnImageCapturedCallback;)V

    .line 719
    return-void
.end method

.method updateMirroringFlagInOutputFileOptions(Landroidx/camera/core/ImageCapture$OutputFileOptions;)V
    .locals 2
    .param p1, "outputFileOptions"    # Landroidx/camera/core/ImageCapture$OutputFileOptions;

    .line 694
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraSelector:Landroidx/camera/core/CameraSelector;

    invoke-virtual {v0}, Landroidx/camera/core/CameraSelector;->getLensFacing()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 695
    invoke-virtual {p1}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getMetadata()Landroidx/camera/core/ImageCapture$Metadata;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/ImageCapture$Metadata;->isReversedHorizontalSet()Z

    move-result v0

    if-nez v0, :cond_1

    .line 696
    invoke-virtual {p1}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getMetadata()Landroidx/camera/core/ImageCapture$Metadata;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/view/CameraController;->mCameraSelector:Landroidx/camera/core/CameraSelector;

    .line 697
    invoke-virtual {v1}, Landroidx/camera/core/CameraSelector;->getLensFacing()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 696
    :goto_0
    invoke-virtual {v0, v1}, Landroidx/camera/core/ImageCapture$Metadata;->setReversedHorizontal(Z)V

    .line 699
    :cond_1
    return-void
.end method

.method updatePreviewViewTransform(Landroid/graphics/Matrix;)V
    .locals 2
    .param p1, "matrix"    # Landroid/graphics/Matrix;

    .line 1101
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1102
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mAnalysisAnalyzer:Landroidx/camera/core/ImageAnalysis$Analyzer;

    if-nez v0, :cond_0

    .line 1103
    return-void

    .line 1105
    :cond_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mAnalysisAnalyzer:Landroidx/camera/core/ImageAnalysis$Analyzer;

    invoke-interface {v0}, Landroidx/camera/core/ImageAnalysis$Analyzer;->getTargetCoordinateSystem()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 1107
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mAnalysisAnalyzer:Landroidx/camera/core/ImageAnalysis$Analyzer;

    invoke-interface {v0, p1}, Landroidx/camera/core/ImageAnalysis$Analyzer;->updateTransform(Landroid/graphics/Matrix;)V

    .line 1109
    :cond_1
    return-void
.end method
