.class public final Landroidx/camera/core/ImageCapture;
.super Landroidx/camera/core/UseCase;
.source "ImageCapture.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/ImageCapture$Defaults;,
        Landroidx/camera/core/ImageCapture$Builder;,
        Landroidx/camera/core/ImageCapture$OnImageCapturedCallback;,
        Landroidx/camera/core/ImageCapture$OnImageSavedCallback;,
        Landroidx/camera/core/ImageCapture$OutputFileOptions;,
        Landroidx/camera/core/ImageCapture$ImageCaptureRequest;,
        Landroidx/camera/core/ImageCapture$Metadata;,
        Landroidx/camera/core/ImageCapture$OutputFileResults;,
        Landroidx/camera/core/ImageCapture$FlashType;,
        Landroidx/camera/core/ImageCapture$FlashMode;,
        Landroidx/camera/core/ImageCapture$CaptureMode;,
        Landroidx/camera/core/ImageCapture$ImageCaptureError;
    }
.end annotation


# static fields
.field public static final CAPTURE_MODE_MAXIMIZE_QUALITY:I = 0x0

.field public static final CAPTURE_MODE_MINIMIZE_LATENCY:I = 0x1

.field public static final CAPTURE_MODE_ZERO_SHUTTER_LAG:I = 0x2

.field private static final DEFAULT_CAPTURE_MODE:I = 0x1

.field public static final DEFAULT_CONFIG:Landroidx/camera/core/ImageCapture$Defaults;

.field private static final DEFAULT_FLASH_MODE:I = 0x2

.field public static final ERROR_CAMERA_CLOSED:I = 0x3

.field public static final ERROR_CAPTURE_FAILED:I = 0x2

.field public static final ERROR_FILE_IO:I = 0x1

.field public static final ERROR_INVALID_CAMERA:I = 0x4

.field public static final ERROR_UNKNOWN:I = 0x0

.field static final EXIF_ROTATION_AVAILABILITY:Landroidx/camera/core/internal/compat/workaround/ExifRotationAvailability;

.field public static final FLASH_MODE_AUTO:I = 0x0

.field public static final FLASH_MODE_OFF:I = 0x2

.field public static final FLASH_MODE_ON:I = 0x1

.field private static final FLASH_MODE_UNKNOWN:I = -0x1

.field public static final FLASH_TYPE_ONE_SHOT_FLASH:I = 0x0

.field public static final FLASH_TYPE_USE_TORCH_AS_FLASH:I = 0x1

.field private static final JPEG_QUALITY_MAXIMIZE_QUALITY_MODE:B = 0x64t

.field private static final JPEG_QUALITY_MINIMIZE_LATENCY_MODE:B = 0x5ft

.field private static final MAX_IMAGES:I = 0x2

.field private static final TAG:Ljava/lang/String; = "ImageCapture"


# instance fields
.field private final mCaptureMode:I

.field private final mClosingListener:Landroidx/camera/core/impl/ImageReaderProxy$OnImageAvailableListener;

.field private mCropAspectRatio:Landroid/util/Rational;

.field private mFlashMode:I

.field private final mFlashType:I

.field private final mImageCaptureControl:Landroidx/camera/core/imagecapture/ImageCaptureControl;

.field private mImagePipeline:Landroidx/camera/core/imagecapture/ImagePipeline;

.field private final mLockedFlashMode:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

.field private mTakePictureManager:Landroidx/camera/core/imagecapture/TakePictureManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 255
    new-instance v0, Landroidx/camera/core/ImageCapture$Defaults;

    invoke-direct {v0}, Landroidx/camera/core/ImageCapture$Defaults;-><init>()V

    sput-object v0, Landroidx/camera/core/ImageCapture;->DEFAULT_CONFIG:Landroidx/camera/core/ImageCapture$Defaults;

    .line 268
    new-instance v0, Landroidx/camera/core/internal/compat/workaround/ExifRotationAvailability;

    invoke-direct {v0}, Landroidx/camera/core/internal/compat/workaround/ExifRotationAvailability;-><init>()V

    sput-object v0, Landroidx/camera/core/ImageCapture;->EXIF_ROTATION_AVAILABILITY:Landroidx/camera/core/internal/compat/workaround/ExifRotationAvailability;

    return-void
.end method

.method constructor <init>(Landroidx/camera/core/impl/ImageCaptureConfig;)V
    .locals 2
    .param p1, "userConfig"    # Landroidx/camera/core/impl/ImageCaptureConfig;

    .line 318
    invoke-direct {p0, p1}, Landroidx/camera/core/UseCase;-><init>(Landroidx/camera/core/impl/UseCaseConfig;)V

    .line 271
    new-instance v0, Landroidx/camera/core/ImageCapture$$ExternalSyntheticLambda3;

    invoke-direct {v0}, Landroidx/camera/core/ImageCapture$$ExternalSyntheticLambda3;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/ImageCapture;->mClosingListener:Landroidx/camera/core/impl/ImageReaderProxy$OnImageAvailableListener;

    .line 282
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/camera/core/ImageCapture;->mLockedFlashMode:Ljava/util/concurrent/atomic/AtomicReference;

    .line 294
    const/4 v0, -0x1

    iput v0, p0, Landroidx/camera/core/ImageCapture;->mFlashMode:I

    .line 297
    iput-object v1, p0, Landroidx/camera/core/ImageCapture;->mCropAspectRatio:Landroid/util/Rational;

    .line 953
    new-instance v0, Landroidx/camera/core/ImageCapture$1;

    invoke-direct {v0, p0}, Landroidx/camera/core/ImageCapture$1;-><init>(Landroidx/camera/core/ImageCapture;)V

    iput-object v0, p0, Landroidx/camera/core/ImageCapture;->mImageCaptureControl:Landroidx/camera/core/imagecapture/ImageCaptureControl;

    .line 320
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getCurrentConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/ImageCaptureConfig;

    .line 322
    .local v0, "useCaseConfig":Landroidx/camera/core/impl/ImageCaptureConfig;
    sget-object v1, Landroidx/camera/core/impl/ImageCaptureConfig;->OPTION_IMAGE_CAPTURE_MODE:Landroidx/camera/core/impl/Config$Option;

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/ImageCaptureConfig;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 323
    invoke-virtual {v0}, Landroidx/camera/core/impl/ImageCaptureConfig;->getCaptureMode()I

    move-result v1

    iput v1, p0, Landroidx/camera/core/ImageCapture;->mCaptureMode:I

    goto :goto_0

    .line 325
    :cond_0
    const/4 v1, 0x1

    iput v1, p0, Landroidx/camera/core/ImageCapture;->mCaptureMode:I

    .line 328
    :goto_0
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/ImageCaptureConfig;->getFlashType(I)I

    move-result v1

    iput v1, p0, Landroidx/camera/core/ImageCapture;->mFlashType:I

    .line 329
    return-void
.end method

.method private abortImageCaptureRequests()V
    .locals 1

    .line 786
    iget-object v0, p0, Landroidx/camera/core/ImageCapture;->mTakePictureManager:Landroidx/camera/core/imagecapture/TakePictureManager;

    if-eqz v0, :cond_0

    .line 787
    iget-object v0, p0, Landroidx/camera/core/ImageCapture;->mTakePictureManager:Landroidx/camera/core/imagecapture/TakePictureManager;

    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/TakePictureManager;->abortRequests()V

    .line 789
    :cond_0
    return-void
.end method

.method private clearPipeline()V
    .locals 1

    .line 1098
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroidx/camera/core/ImageCapture;->clearPipeline(Z)V

    .line 1099
    return-void
.end method

.method private clearPipeline(Z)V
    .locals 2
    .param p1, "keepTakePictureManager"    # Z

    .line 1106
    const-string v0, "ImageCapture"

    const-string/jumbo v1, "clearPipeline"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1107
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1108
    iget-object v0, p0, Landroidx/camera/core/ImageCapture;->mImagePipeline:Landroidx/camera/core/imagecapture/ImagePipeline;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 1109
    iget-object v0, p0, Landroidx/camera/core/ImageCapture;->mImagePipeline:Landroidx/camera/core/imagecapture/ImagePipeline;

    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/ImagePipeline;->close()V

    .line 1110
    iput-object v1, p0, Landroidx/camera/core/ImageCapture;->mImagePipeline:Landroidx/camera/core/imagecapture/ImagePipeline;

    .line 1114
    :cond_0
    if-nez p1, :cond_1

    iget-object v0, p0, Landroidx/camera/core/ImageCapture;->mTakePictureManager:Landroidx/camera/core/imagecapture/TakePictureManager;

    if-eqz v0, :cond_1

    .line 1115
    iget-object v0, p0, Landroidx/camera/core/ImageCapture;->mTakePictureManager:Landroidx/camera/core/imagecapture/TakePictureManager;

    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/TakePictureManager;->abortRequests()V

    .line 1116
    iput-object v1, p0, Landroidx/camera/core/ImageCapture;->mTakePictureManager:Landroidx/camera/core/imagecapture/TakePictureManager;

    .line 1118
    :cond_1
    return-void
.end method

.method static computeDispatchCropRect(Landroid/graphics/Rect;Landroid/util/Rational;ILandroid/util/Size;I)Landroid/graphics/Rect;
    .locals 4
    .param p0, "viewPortCropRect"    # Landroid/graphics/Rect;
    .param p1, "cropAspectRatio"    # Landroid/util/Rational;
    .param p2, "rotationDegrees"    # I
    .param p3, "dispatchResolution"    # Landroid/util/Size;
    .param p4, "dispatchRotationDegrees"    # I

    .line 754
    if-eqz p0, :cond_0

    .line 755
    invoke-static {p0, p2, p3, p4}, Landroidx/camera/core/internal/utils/ImageUtil;->computeCropRectFromDispatchInfo(Landroid/graphics/Rect;ILandroid/util/Size;I)Landroid/graphics/Rect;

    move-result-object v0

    return-object v0

    .line 757
    :cond_0
    if-eqz p1, :cond_2

    .line 759
    move-object v0, p1

    .line 760
    .local v0, "aspectRatio":Landroid/util/Rational;
    rem-int/lit16 v1, p4, 0xb4

    if-eqz v1, :cond_1

    .line 761
    new-instance v1, Landroid/util/Rational;

    .line 762
    invoke-virtual {p1}, Landroid/util/Rational;->getDenominator()I

    move-result v2

    .line 763
    invoke-virtual {p1}, Landroid/util/Rational;->getNumerator()I

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/util/Rational;-><init>(II)V

    move-object v0, v1

    .line 765
    :cond_1
    invoke-static {p3, v0}, Landroidx/camera/core/internal/utils/ImageUtil;->isAspectRatioValid(Landroid/util/Size;Landroid/util/Rational;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 766
    nop

    .line 767
    invoke-static {p3, v0}, Landroidx/camera/core/internal/utils/ImageUtil;->computeCropRectFromAspectRatio(Landroid/util/Size;Landroid/util/Rational;)Landroid/graphics/Rect;

    move-result-object v1

    .line 766
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Rect;

    return-object v1

    .line 771
    .end local v0    # "aspectRatio":Landroid/util/Rational;
    :cond_2
    new-instance v0, Landroid/graphics/Rect;

    invoke-virtual {p3}, Landroid/util/Size;->getWidth()I

    move-result v1

    invoke-virtual {p3}, Landroid/util/Size;->getHeight()I

    move-result v2

    const/4 v3, 0x0

    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object v0
.end method

.method private createPipeline(Ljava/lang/String;Landroidx/camera/core/impl/ImageCaptureConfig;Landroidx/camera/core/impl/StreamSpec;)Landroidx/camera/core/impl/SessionConfig$Builder;
    .locals 5
    .param p1, "cameraId"    # Ljava/lang/String;
    .param p2, "config"    # Landroidx/camera/core/impl/ImageCaptureConfig;
    .param p3, "streamSpec"    # Landroidx/camera/core/impl/StreamSpec;

    .line 983
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 984
    const-string/jumbo v0, "createPipeline(cameraId: %s, streamSpec: %s)"

    filled-new-array {p1, p3}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "ImageCapture"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 986
    invoke-virtual {p3}, Landroidx/camera/core/impl/StreamSpec;->getResolution()Landroid/util/Size;

    move-result-object v0

    .line 987
    .local v0, "resolution":Landroid/util/Size;
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getCamera()Landroidx/camera/core/impl/CameraInternal;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/CameraInternal;

    invoke-interface {v1}, Landroidx/camera/core/impl/CameraInternal;->getHasTransform()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 988
    invoke-direct {p0}, Landroidx/camera/core/ImageCapture;->isSessionProcessorEnabledInCurrentCamera()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    .line 989
    .local v1, "isVirtualCamera":Z
    :goto_1
    iget-object v2, p0, Landroidx/camera/core/ImageCapture;->mImagePipeline:Landroidx/camera/core/imagecapture/ImagePipeline;

    if-eqz v2, :cond_2

    .line 990
    invoke-static {v1}, Landroidx/core/util/Preconditions;->checkState(Z)V

    .line 993
    iget-object v2, p0, Landroidx/camera/core/ImageCapture;->mImagePipeline:Landroidx/camera/core/imagecapture/ImagePipeline;

    invoke-virtual {v2}, Landroidx/camera/core/imagecapture/ImagePipeline;->close()V

    .line 995
    :cond_2
    new-instance v2, Landroidx/camera/core/imagecapture/ImagePipeline;

    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getEffect()Landroidx/camera/core/CameraEffect;

    move-result-object v3

    invoke-direct {v2, p2, v0, v3, v1}, Landroidx/camera/core/imagecapture/ImagePipeline;-><init>(Landroidx/camera/core/impl/ImageCaptureConfig;Landroid/util/Size;Landroidx/camera/core/CameraEffect;Z)V

    iput-object v2, p0, Landroidx/camera/core/ImageCapture;->mImagePipeline:Landroidx/camera/core/imagecapture/ImagePipeline;

    .line 997
    iget-object v2, p0, Landroidx/camera/core/ImageCapture;->mTakePictureManager:Landroidx/camera/core/imagecapture/TakePictureManager;

    if-nez v2, :cond_3

    .line 999
    new-instance v2, Landroidx/camera/core/imagecapture/TakePictureManager;

    iget-object v3, p0, Landroidx/camera/core/ImageCapture;->mImageCaptureControl:Landroidx/camera/core/imagecapture/ImageCaptureControl;

    invoke-direct {v2, v3}, Landroidx/camera/core/imagecapture/TakePictureManager;-><init>(Landroidx/camera/core/imagecapture/ImageCaptureControl;)V

    iput-object v2, p0, Landroidx/camera/core/ImageCapture;->mTakePictureManager:Landroidx/camera/core/imagecapture/TakePictureManager;

    .line 1001
    :cond_3
    iget-object v2, p0, Landroidx/camera/core/ImageCapture;->mTakePictureManager:Landroidx/camera/core/imagecapture/TakePictureManager;

    iget-object v3, p0, Landroidx/camera/core/ImageCapture;->mImagePipeline:Landroidx/camera/core/imagecapture/ImagePipeline;

    invoke-virtual {v2, v3}, Landroidx/camera/core/imagecapture/TakePictureManager;->setImagePipeline(Landroidx/camera/core/imagecapture/ImagePipeline;)V

    .line 1003
    iget-object v2, p0, Landroidx/camera/core/ImageCapture;->mImagePipeline:Landroidx/camera/core/imagecapture/ImagePipeline;

    .line 1004
    invoke-virtual {p3}, Landroidx/camera/core/impl/StreamSpec;->getResolution()Landroid/util/Size;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroidx/camera/core/imagecapture/ImagePipeline;->createSessionConfigBuilder(Landroid/util/Size;)Landroidx/camera/core/impl/SessionConfig$Builder;

    move-result-object v2

    .line 1005
    .local v2, "sessionConfigBuilder":Landroidx/camera/core/impl/SessionConfig$Builder;
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getCaptureMode()I

    move-result v3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_4

    .line 1006
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getCameraControl()Landroidx/camera/core/impl/CameraControlInternal;

    move-result-object v3

    invoke-interface {v3, v2}, Landroidx/camera/core/impl/CameraControlInternal;->addZslConfig(Landroidx/camera/core/impl/SessionConfig$Builder;)V

    .line 1008
    :cond_4
    invoke-virtual {p3}, Landroidx/camera/core/impl/StreamSpec;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v3

    if-eqz v3, :cond_5

    .line 1009
    invoke-virtual {p3}, Landroidx/camera/core/impl/StreamSpec;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroidx/camera/core/impl/SessionConfig$Builder;->addImplementationOptions(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 1011
    :cond_5
    new-instance v3, Landroidx/camera/core/ImageCapture$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0, p1, p2, p3}, Landroidx/camera/core/ImageCapture$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/core/ImageCapture;Ljava/lang/String;Landroidx/camera/core/impl/ImageCaptureConfig;Landroidx/camera/core/impl/StreamSpec;)V

    invoke-virtual {v2, v3}, Landroidx/camera/core/impl/SessionConfig$Builder;->addErrorListener(Landroidx/camera/core/impl/SessionConfig$ErrorListener;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 1026
    return-object v2
.end method

.method static getError(Ljava/lang/Throwable;)I
    .locals 1
    .param p0, "throwable"    # Ljava/lang/Throwable;

    .line 860
    instance-of v0, p0, Landroidx/camera/core/CameraClosedException;

    if-eqz v0, :cond_0

    .line 861
    const/4 v0, 0x3

    return v0

    .line 862
    :cond_0
    instance-of v0, p0, Landroidx/camera/core/ImageCaptureException;

    if-eqz v0, :cond_1

    .line 863
    move-object v0, p0

    check-cast v0, Landroidx/camera/core/ImageCaptureException;

    invoke-virtual {v0}, Landroidx/camera/core/ImageCaptureException;->getImageCaptureError()I

    move-result v0

    return v0

    .line 865
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private getJpegQualityInternal()I
    .locals 4

    .line 834
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getCurrentConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/ImageCaptureConfig;

    .line 836
    .local v0, "imageCaptureConfig":Landroidx/camera/core/impl/ImageCaptureConfig;
    sget-object v1, Landroidx/camera/core/impl/ImageCaptureConfig;->OPTION_JPEG_COMPRESSION_QUALITY:Landroidx/camera/core/impl/Config$Option;

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/ImageCaptureConfig;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 837
    invoke-virtual {v0}, Landroidx/camera/core/impl/ImageCaptureConfig;->getJpegQuality()I

    move-result v1

    return v1

    .line 840
    :cond_0
    iget v1, p0, Landroidx/camera/core/ImageCapture;->mCaptureMode:I

    packed-switch v1, :pswitch_data_0

    .line 847
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "CaptureMode "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Landroidx/camera/core/ImageCapture;->mCaptureMode:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is invalid"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 845
    :pswitch_0
    const/16 v1, 0x5f

    return v1

    .line 842
    :pswitch_1
    const/16 v1, 0x64

    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private getTakePictureCropRect()Landroid/graphics/Rect;
    .locals 6

    .line 1076
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getViewPortCropRect()Landroid/graphics/Rect;

    move-result-object v0

    .line 1077
    .local v0, "rect":Landroid/graphics/Rect;
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getAttachedSurfaceResolution()Landroid/util/Size;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Size;

    .line 1078
    .local v1, "resolution":Landroid/util/Size;
    if-eqz v0, :cond_0

    .line 1079
    return-object v0

    .line 1080
    :cond_0
    iget-object v2, p0, Landroidx/camera/core/ImageCapture;->mCropAspectRatio:Landroid/util/Rational;

    invoke-static {v2}, Landroidx/camera/core/internal/utils/ImageUtil;->isAspectRatioValid(Landroid/util/Rational;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1081
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getCamera()Landroidx/camera/core/impl/CameraInternal;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/CameraInternal;

    invoke-virtual {p0, v2}, Landroidx/camera/core/ImageCapture;->getRelativeRotation(Landroidx/camera/core/impl/CameraInternal;)I

    move-result v2

    .line 1082
    .local v2, "rotationDegrees":I
    new-instance v3, Landroid/util/Rational;

    iget-object v4, p0, Landroidx/camera/core/ImageCapture;->mCropAspectRatio:Landroid/util/Rational;

    .line 1083
    invoke-virtual {v4}, Landroid/util/Rational;->getDenominator()I

    move-result v4

    iget-object v5, p0, Landroidx/camera/core/ImageCapture;->mCropAspectRatio:Landroid/util/Rational;

    .line 1084
    invoke-virtual {v5}, Landroid/util/Rational;->getNumerator()I

    move-result v5

    invoke-direct {v3, v4, v5}, Landroid/util/Rational;-><init>(II)V

    .line 1085
    .local v3, "rotatedAspectRatio":Landroid/util/Rational;
    invoke-static {v2}, Landroidx/camera/core/impl/utils/TransformUtils;->is90or270(I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1086
    move-object v4, v3

    goto :goto_0

    :cond_1
    iget-object v4, p0, Landroidx/camera/core/ImageCapture;->mCropAspectRatio:Landroid/util/Rational;

    .line 1087
    .local v4, "sensorCropRatio":Landroid/util/Rational;
    :goto_0
    invoke-static {v1, v4}, Landroidx/camera/core/internal/utils/ImageUtil;->computeCropRectFromAspectRatio(Landroid/util/Size;Landroid/util/Rational;)Landroid/graphics/Rect;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/graphics/Rect;

    return-object v5

    .line 1089
    .end local v2    # "rotationDegrees":I
    .end local v3    # "rotatedAspectRatio":Landroid/util/Rational;
    .end local v4    # "sensorCropRatio":Landroid/util/Rational;
    :cond_2
    new-instance v2, Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v3

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v4

    const/4 v5, 0x0

    invoke-direct {v2, v5, v5, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object v2
.end method

.method private static isImageFormatSupported(Ljava/util/List;I)Z
    .locals 5
    .param p1, "imageFormat"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "[",
            "Landroid/util/Size;",
            ">;>;I)Z"
        }
    .end annotation

    .line 431
    .local p0, "supportedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Pair<Ljava/lang/Integer;[Landroid/util/Size;>;>;"
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 432
    return v0

    .line 434
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Pair;

    .line 435
    .local v2, "supportedSize":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;[Landroid/util/Size;>;"
    iget-object v3, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Integer;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 436
    const/4 v0, 0x1

    return v0

    .line 438
    .end local v2    # "supportedSize":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;[Landroid/util/Size;>;"
    :cond_1
    goto :goto_0

    .line 439
    :cond_2
    return v0
.end method

.method private isSessionProcessorEnabledInCurrentCamera()Z
    .locals 3

    .line 332
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getCamera()Landroidx/camera/core/impl/CameraInternal;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 333
    return v1

    .line 336
    :cond_0
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getCamera()Landroidx/camera/core/impl/CameraInternal;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraInternal;->getExtendedConfig()Landroidx/camera/core/impl/CameraConfig;

    move-result-object v0

    .line 337
    .local v0, "cameraConfig":Landroidx/camera/core/impl/CameraConfig;
    const/4 v2, 0x0

    invoke-interface {v0, v2}, Landroidx/camera/core/impl/CameraConfig;->getSessionProcessor(Landroidx/camera/core/impl/SessionProcessor;)Landroidx/camera/core/impl/SessionProcessor;

    move-result-object v2

    if-eqz v2, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method static synthetic lambda$new$0(Landroidx/camera/core/impl/ImageReaderProxy;)V
    .locals 4
    .param p0, "imageReader"    # Landroidx/camera/core/impl/ImageReaderProxy;

    .line 272
    const-string v0, "ImageCapture"

    :try_start_0
    invoke-interface {p0}, Landroidx/camera/core/impl/ImageReaderProxy;->acquireLatestImage()Landroidx/camera/core/ImageProxy;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 273
    .local v1, "image":Landroidx/camera/core/ImageProxy;
    :try_start_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Discarding ImageProxy which was inadvertently acquired: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 274
    if-eqz v1, :cond_0

    :try_start_2
    invoke-interface {v1}, Landroidx/camera/core/ImageProxy;->close()V
    :try_end_2
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_0

    .line 276
    .end local v1    # "image":Landroidx/camera/core/ImageProxy;
    :cond_0
    goto :goto_1

    .line 272
    .restart local v1    # "image":Landroidx/camera/core/ImageProxy;
    :catchall_0
    move-exception v2

    if-eqz v1, :cond_1

    :try_start_3
    invoke-interface {v1}, Landroidx/camera/core/ImageProxy;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v3

    :try_start_4
    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local p0    # "imageReader":Landroidx/camera/core/impl/ImageReaderProxy;
    :cond_1
    :goto_0
    throw v2
    :try_end_4
    .catch Ljava/lang/IllegalStateException; {:try_start_4 .. :try_end_4} :catch_0

    .line 274
    .end local v1    # "image":Landroidx/camera/core/ImageProxy;
    .restart local p0    # "imageReader":Landroidx/camera/core/impl/ImageReaderProxy;
    :catch_0
    move-exception v1

    .line 275
    .local v1, "e":Ljava/lang/IllegalStateException;
    const-string v2, "Failed to acquire latest image."

    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 277
    .end local v1    # "e":Ljava/lang/IllegalStateException;
    :goto_1
    return-void
.end method

.method static synthetic lambda$submitStillCaptureRequest$4(Ljava/util/List;)Ljava/lang/Void;
    .locals 1
    .param p0, "input"    # Ljava/util/List;

    .line 1129
    const/4 v0, 0x0

    return-object v0
.end method

.method private sendInvalidCameraError(Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageCapture$OnImageCapturedCallback;Landroidx/camera/core/ImageCapture$OnImageSavedCallback;)V
    .locals 4
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "inMemoryCallback"    # Landroidx/camera/core/ImageCapture$OnImageCapturedCallback;
    .param p3, "onDiskCallback"    # Landroidx/camera/core/ImageCapture$OnImageSavedCallback;

    .line 1060
    new-instance v0, Landroidx/camera/core/ImageCaptureException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Not bound to a valid Camera ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x4

    invoke-direct {v0, v3, v1, v2}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 1062
    .local v0, "exception":Landroidx/camera/core/ImageCaptureException;
    if-eqz p2, :cond_0

    .line 1063
    invoke-virtual {p2, v0}, Landroidx/camera/core/ImageCapture$OnImageCapturedCallback;->onError(Landroidx/camera/core/ImageCaptureException;)V

    goto :goto_0

    .line 1064
    :cond_0
    if-eqz p3, :cond_1

    .line 1065
    invoke-interface {p3, v0}, Landroidx/camera/core/ImageCapture$OnImageSavedCallback;->onError(Landroidx/camera/core/ImageCaptureException;)V

    .line 1069
    :goto_0
    return-void

    .line 1067
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Must have either in-memory or on-disk callback."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private takePictureInternal(Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageCapture$OnImageCapturedCallback;Landroidx/camera/core/ImageCapture$OnImageSavedCallback;Landroidx/camera/core/ImageCapture$OutputFileOptions;)V
    .locals 12
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "inMemoryCallback"    # Landroidx/camera/core/ImageCapture$OnImageCapturedCallback;
    .param p3, "onDiskCallback"    # Landroidx/camera/core/ImageCapture$OnImageSavedCallback;
    .param p4, "outputFileOptions"    # Landroidx/camera/core/ImageCapture$OutputFileOptions;

    .line 1037
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1038
    const-string v0, "ImageCapture"

    const-string/jumbo v1, "takePictureInternal"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1039
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getCamera()Landroidx/camera/core/impl/CameraInternal;

    move-result-object v0

    .line 1040
    .local v0, "camera":Landroidx/camera/core/impl/CameraInternal;
    if-nez v0, :cond_0

    .line 1041
    invoke-direct/range {p0 .. p3}, Landroidx/camera/core/ImageCapture;->sendInvalidCameraError(Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageCapture$OnImageCapturedCallback;Landroidx/camera/core/ImageCapture$OnImageSavedCallback;)V

    .line 1042
    return-void

    .line 1044
    :cond_0
    iget-object v1, p0, Landroidx/camera/core/ImageCapture;->mTakePictureManager:Landroidx/camera/core/imagecapture/TakePictureManager;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/imagecapture/TakePictureManager;

    .line 1049
    invoke-direct {p0}, Landroidx/camera/core/ImageCapture;->getTakePictureCropRect()Landroid/graphics/Rect;

    move-result-object v6

    .line 1050
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getSensorToBufferTransformMatrix()Landroid/graphics/Matrix;

    move-result-object v7

    .line 1051
    invoke-virtual {p0, v0}, Landroidx/camera/core/ImageCapture;->getRelativeRotation(Landroidx/camera/core/impl/CameraInternal;)I

    move-result v8

    .line 1052
    invoke-direct {p0}, Landroidx/camera/core/ImageCapture;->getJpegQualityInternal()I

    move-result v9

    .line 1053
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getCaptureMode()I

    move-result v10

    iget-object v2, p0, Landroidx/camera/core/ImageCapture;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 1054
    invoke-virtual {v2}, Landroidx/camera/core/impl/SessionConfig$Builder;->getSingleCameraCaptureCallbacks()Ljava/util/List;

    move-result-object v11

    .line 1044
    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object/from16 v5, p4

    invoke-static/range {v2 .. v11}, Landroidx/camera/core/imagecapture/TakePictureRequest;->of(Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageCapture$OnImageCapturedCallback;Landroidx/camera/core/ImageCapture$OnImageSavedCallback;Landroidx/camera/core/ImageCapture$OutputFileOptions;Landroid/graphics/Rect;Landroid/graphics/Matrix;IIILjava/util/List;)Landroidx/camera/core/imagecapture/TakePictureRequest;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroidx/camera/core/imagecapture/TakePictureManager;->offerRequest(Landroidx/camera/core/imagecapture/TakePictureRequest;)V

    .line 1055
    return-void
.end method

.method private trySetFlashModeToCameraControl()V
    .locals 3

    .line 816
    iget-object v0, p0, Landroidx/camera/core/ImageCapture;->mLockedFlashMode:Ljava/util/concurrent/atomic/AtomicReference;

    monitor-enter v0

    .line 817
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/ImageCapture;->mLockedFlashMode:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 819
    monitor-exit v0

    return-void

    .line 821
    :cond_0
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getCameraControl()Landroidx/camera/core/impl/CameraControlInternal;

    move-result-object v1

    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getFlashMode()I

    move-result v2

    invoke-interface {v1, v2}, Landroidx/camera/core/impl/CameraControlInternal;->setFlashMode(I)V

    .line 822
    monitor-exit v0

    .line 823
    return-void

    .line 822
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method enforceSoftwareJpegConstraints(Landroidx/camera/core/impl/MutableConfig;)Z
    .locals 6
    .param p1, "mutableConfig"    # Landroidx/camera/core/impl/MutableConfig;

    .line 876
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    sget-object v1, Landroidx/camera/core/impl/ImageCaptureConfig;->OPTION_USE_SOFTWARE_JPEG_ENCODER:Landroidx/camera/core/impl/Config$Option;

    .line 877
    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {p1, v1, v3}, Landroidx/camera/core/impl/MutableConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 876
    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 878
    const/4 v0, 0x1

    .line 879
    .local v0, "supported":Z
    invoke-direct {p0}, Landroidx/camera/core/ImageCapture;->isSessionProcessorEnabledInCurrentCamera()Z

    move-result v1

    const-string v2, "ImageCapture"

    if-eqz v1, :cond_0

    .line 881
    const-string/jumbo v1, "Software JPEG cannot be used with Extensions."

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 882
    const/4 v0, 0x0

    .line 884
    :cond_0
    sget-object v1, Landroidx/camera/core/impl/ImageCaptureConfig;->OPTION_BUFFER_FORMAT:Landroidx/camera/core/impl/Config$Option;

    const/4 v4, 0x0

    invoke-interface {p1, v1, v4}, Landroidx/camera/core/impl/MutableConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 885
    .local v1, "bufferFormat":Ljava/lang/Integer;
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/16 v5, 0x100

    if-eq v4, v5, :cond_1

    .line 886
    const-string/jumbo v4, "Software JPEG cannot be used with non-JPEG output buffer format."

    invoke-static {v2, v4}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 887
    const/4 v0, 0x0

    .line 890
    :cond_1
    if-nez v0, :cond_2

    .line 891
    const-string/jumbo v4, "Unable to support software JPEG. Disabling."

    invoke-static {v2, v4}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 892
    sget-object v2, Landroidx/camera/core/impl/ImageCaptureConfig;->OPTION_USE_SOFTWARE_JPEG_ENCODER:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {p1, v2, v3}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 895
    :cond_2
    return v0

    .line 897
    .end local v0    # "supported":Z
    .end local v1    # "bufferFormat":Ljava/lang/Integer;
    :cond_3
    return v2
.end method

.method public getCaptureMode()I
    .locals 1

    .line 621
    iget v0, p0, Landroidx/camera/core/ImageCapture;->mCaptureMode:I

    return v0
.end method

.method public getDefaultConfig(ZLandroidx/camera/core/impl/UseCaseConfigFactory;)Landroidx/camera/core/impl/UseCaseConfig;
    .locals 2
    .param p1, "applyDefaultConfig"    # Z
    .param p2, "factory"    # Landroidx/camera/core/impl/UseCaseConfigFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Landroidx/camera/core/impl/UseCaseConfigFactory;",
            ")",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;"
        }
    .end annotation

    .line 348
    sget-object v0, Landroidx/camera/core/ImageCapture;->DEFAULT_CONFIG:Landroidx/camera/core/ImageCapture$Defaults;

    .line 349
    invoke-virtual {v0}, Landroidx/camera/core/ImageCapture$Defaults;->getConfig()Landroidx/camera/core/impl/ImageCaptureConfig;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/impl/ImageCaptureConfig;->getCaptureType()Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    move-result-object v0

    .line 350
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getCaptureMode()I

    move-result v1

    .line 348
    invoke-interface {p2, v0, v1}, Landroidx/camera/core/impl/UseCaseConfigFactory;->getConfig(Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;I)Landroidx/camera/core/impl/Config;

    move-result-object v0

    .line 352
    .local v0, "captureConfig":Landroidx/camera/core/impl/Config;
    if-eqz p1, :cond_0

    .line 353
    sget-object v1, Landroidx/camera/core/ImageCapture;->DEFAULT_CONFIG:Landroidx/camera/core/ImageCapture$Defaults;

    invoke-virtual {v1}, Landroidx/camera/core/ImageCapture$Defaults;->getConfig()Landroidx/camera/core/impl/ImageCaptureConfig;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/camera/core/impl/Config;->mergeConfigs(Landroidx/camera/core/impl/Config;Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/Config;

    move-result-object v0

    .line 356
    :cond_0
    if-nez v0, :cond_1

    const/4 v1, 0x0

    goto :goto_0

    .line 357
    :cond_1
    invoke-virtual {p0, v0}, Landroidx/camera/core/ImageCapture;->getUseCaseConfigBuilder(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/UseCaseConfig$Builder;

    move-result-object v1

    invoke-interface {v1}, Landroidx/camera/core/impl/UseCaseConfig$Builder;->getUseCaseConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v1

    .line 356
    :goto_0
    return-object v1
.end method

.method public getFlashMode()I
    .locals 3

    .line 459
    iget-object v0, p0, Landroidx/camera/core/ImageCapture;->mLockedFlashMode:Ljava/util/concurrent/atomic/AtomicReference;

    monitor-enter v0

    .line 460
    :try_start_0
    iget v1, p0, Landroidx/camera/core/ImageCapture;->mFlashMode:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    iget v1, p0, Landroidx/camera/core/ImageCapture;->mFlashMode:I

    goto :goto_0

    .line 461
    :cond_0
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getCurrentConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/ImageCaptureConfig;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroidx/camera/core/impl/ImageCaptureConfig;->getFlashMode(I)I

    move-result v1

    :goto_0
    monitor-exit v0

    .line 460
    return v1

    .line 462
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method getImagePipeline()Landroidx/camera/core/imagecapture/ImagePipeline;
    .locals 1

    .line 1140
    iget-object v0, p0, Landroidx/camera/core/ImageCapture;->mImagePipeline:Landroidx/camera/core/imagecapture/ImagePipeline;

    return-object v0
.end method

.method public getJpegQuality()I
    .locals 1

    .line 635
    invoke-direct {p0}, Landroidx/camera/core/ImageCapture;->getJpegQualityInternal()I

    move-result v0

    return v0
.end method

.method public getRealtimeCaptureLatencyEstimate()Landroidx/camera/core/ImageCaptureLatencyEstimate;
    .locals 9

    .line 1178
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getCamera()Landroidx/camera/core/impl/CameraInternal;

    move-result-object v0

    .line 1179
    .local v0, "camera":Landroidx/camera/core/impl/CameraInternal;
    if-nez v0, :cond_0

    .line 1180
    sget-object v1, Landroidx/camera/core/ImageCaptureLatencyEstimate;->UNDEFINED_IMAGE_CAPTURE_LATENCY:Landroidx/camera/core/ImageCaptureLatencyEstimate;

    return-object v1

    .line 1183
    :cond_0
    invoke-interface {v0}, Landroidx/camera/core/impl/CameraInternal;->getExtendedConfig()Landroidx/camera/core/impl/CameraConfig;

    move-result-object v1

    .line 1184
    .local v1, "config":Landroidx/camera/core/impl/CameraConfig;
    invoke-interface {v1}, Landroidx/camera/core/impl/CameraConfig;->getSessionProcessor()Landroidx/camera/core/impl/SessionProcessor;

    move-result-object v2

    .line 1185
    .local v2, "sessionProcessor":Landroidx/camera/core/impl/SessionProcessor;
    invoke-interface {v2}, Landroidx/camera/core/impl/SessionProcessor;->getRealtimeCaptureLatency()Landroid/util/Pair;

    move-result-object v3

    .line 1186
    .local v3, "latencyEstimate":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Long;Ljava/lang/Long;>;"
    if-nez v3, :cond_1

    .line 1187
    sget-object v4, Landroidx/camera/core/ImageCaptureLatencyEstimate;->UNDEFINED_IMAGE_CAPTURE_LATENCY:Landroidx/camera/core/ImageCaptureLatencyEstimate;

    return-object v4

    .line 1189
    :cond_1
    new-instance v4, Landroidx/camera/core/ImageCaptureLatencyEstimate;

    iget-object v5, v3, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    iget-object v7, v3, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v7, Ljava/lang/Long;

    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    invoke-direct {v4, v5, v6, v7, v8}, Landroidx/camera/core/ImageCaptureLatencyEstimate;-><init>(JJ)V

    return-object v4
.end method

.method public getResolutionInfo()Landroidx/camera/core/ResolutionInfo;
    .locals 1

    .line 658
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getResolutionInfoInternal()Landroidx/camera/core/ResolutionInfo;

    move-result-object v0

    return-object v0
.end method

.method protected getResolutionInfoInternal()Landroidx/camera/core/ResolutionInfo;
    .locals 8

    .line 668
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getCamera()Landroidx/camera/core/impl/CameraInternal;

    move-result-object v0

    .line 669
    .local v0, "camera":Landroidx/camera/core/impl/CameraInternal;
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getAttachedSurfaceResolution()Landroid/util/Size;

    move-result-object v1

    .line 671
    .local v1, "resolution":Landroid/util/Size;
    if-eqz v0, :cond_3

    if-nez v1, :cond_0

    goto :goto_1

    .line 675
    :cond_0
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getViewPortCropRect()Landroid/graphics/Rect;

    move-result-object v2

    .line 677
    .local v2, "cropRect":Landroid/graphics/Rect;
    iget-object v3, p0, Landroidx/camera/core/ImageCapture;->mCropAspectRatio:Landroid/util/Rational;

    .line 679
    .local v3, "cropAspectRatio":Landroid/util/Rational;
    if-nez v2, :cond_2

    .line 680
    if-eqz v3, :cond_1

    .line 681
    invoke-static {v1, v3}, Landroidx/camera/core/internal/utils/ImageUtil;->computeCropRectFromAspectRatio(Landroid/util/Size;Landroid/util/Rational;)Landroid/graphics/Rect;

    move-result-object v2

    goto :goto_0

    .line 683
    :cond_1
    new-instance v4, Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v5

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v6

    const/4 v7, 0x0

    invoke-direct {v4, v7, v7, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    move-object v2, v4

    .line 687
    :cond_2
    :goto_0
    invoke-virtual {p0, v0}, Landroidx/camera/core/ImageCapture;->getRelativeRotation(Landroidx/camera/core/impl/CameraInternal;)I

    move-result v4

    .line 689
    .local v4, "rotationDegrees":I
    new-instance v5, Landroidx/camera/core/ResolutionInfo;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/graphics/Rect;

    invoke-direct {v5, v1, v6, v4}, Landroidx/camera/core/ResolutionInfo;-><init>(Landroid/util/Size;Landroid/graphics/Rect;I)V

    return-object v5

    .line 672
    .end local v2    # "cropRect":Landroid/graphics/Rect;
    .end local v3    # "cropAspectRatio":Landroid/util/Rational;
    .end local v4    # "rotationDegrees":I
    :cond_3
    :goto_1
    const/4 v2, 0x0

    return-object v2
.end method

.method public getResolutionSelector()Landroidx/camera/core/resolutionselector/ResolutionSelector;
    .locals 2

    .line 700
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getCurrentConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/ImageOutputConfig;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroidx/camera/core/impl/ImageOutputConfig;->getResolutionSelector(Landroidx/camera/core/resolutionselector/ResolutionSelector;)Landroidx/camera/core/resolutionselector/ResolutionSelector;

    move-result-object v0

    return-object v0
.end method

.method public getSupportedEffectTargets()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1156
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 1157
    .local v0, "targets":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    const/4 v1, 0x4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1158
    return-object v0
.end method

.method getTakePictureManager()Landroidx/camera/core/imagecapture/TakePictureManager;
    .locals 1

    .line 1146
    iget-object v0, p0, Landroidx/camera/core/ImageCapture;->mTakePictureManager:Landroidx/camera/core/imagecapture/TakePictureManager;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/imagecapture/TakePictureManager;

    return-object v0
.end method

.method public getTargetRotation()I
    .locals 1

    .line 549
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getTargetRotationInternal()I

    move-result v0

    return v0
.end method

.method public getUseCaseConfigBuilder(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/UseCaseConfig$Builder;
    .locals 1
    .param p1, "config"    # Landroidx/camera/core/impl/Config;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/Config;",
            ")",
            "Landroidx/camera/core/impl/UseCaseConfig$Builder<",
            "***>;"
        }
    .end annotation

    .line 367
    invoke-static {p1}, Landroidx/camera/core/ImageCapture$Builder;->fromConfig(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/ImageCapture$Builder;

    move-result-object v0

    return-object v0
.end method

.method isProcessingPipelineEnabled()Z
    .locals 1

    .line 1134
    iget-object v0, p0, Landroidx/camera/core/ImageCapture;->mImagePipeline:Landroidx/camera/core/imagecapture/ImagePipeline;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/camera/core/ImageCapture;->mTakePictureManager:Landroidx/camera/core/imagecapture/TakePictureManager;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method synthetic lambda$createPipeline$3$androidx-camera-core-ImageCapture(Ljava/lang/String;Landroidx/camera/core/impl/ImageCaptureConfig;Landroidx/camera/core/impl/StreamSpec;Landroidx/camera/core/impl/SessionConfig;Landroidx/camera/core/impl/SessionConfig$SessionError;)V
    .locals 1
    .param p1, "cameraId"    # Ljava/lang/String;
    .param p2, "config"    # Landroidx/camera/core/impl/ImageCaptureConfig;
    .param p3, "streamSpec"    # Landroidx/camera/core/impl/StreamSpec;
    .param p4, "sessionConfig"    # Landroidx/camera/core/impl/SessionConfig;
    .param p5, "error"    # Landroidx/camera/core/impl/SessionConfig$SessionError;

    .line 1014
    invoke-virtual {p0, p1}, Landroidx/camera/core/ImageCapture;->isCurrentCamera(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1015
    iget-object v0, p0, Landroidx/camera/core/ImageCapture;->mTakePictureManager:Landroidx/camera/core/imagecapture/TakePictureManager;

    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/TakePictureManager;->pause()V

    .line 1016
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Landroidx/camera/core/ImageCapture;->clearPipeline(Z)V

    .line 1017
    invoke-direct {p0, p1, p2, p3}, Landroidx/camera/core/ImageCapture;->createPipeline(Ljava/lang/String;Landroidx/camera/core/impl/ImageCaptureConfig;Landroidx/camera/core/impl/StreamSpec;)Landroidx/camera/core/impl/SessionConfig$Builder;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/ImageCapture;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 1018
    iget-object v0, p0, Landroidx/camera/core/ImageCapture;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    invoke-virtual {v0}, Landroidx/camera/core/impl/SessionConfig$Builder;->build()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/camera/core/ImageCapture;->updateSessionConfig(Landroidx/camera/core/impl/SessionConfig;)V

    .line 1019
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->notifyReset()V

    .line 1020
    iget-object v0, p0, Landroidx/camera/core/ImageCapture;->mTakePictureManager:Landroidx/camera/core/imagecapture/TakePictureManager;

    invoke-virtual {v0}, Landroidx/camera/core/imagecapture/TakePictureManager;->resume()V

    goto :goto_0

    .line 1022
    :cond_0
    invoke-direct {p0}, Landroidx/camera/core/ImageCapture;->clearPipeline()V

    .line 1024
    :goto_0
    return-void
.end method

.method synthetic lambda$takePicture$1$androidx-camera-core-ImageCapture(Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageCapture$OnImageCapturedCallback;)V
    .locals 0
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "callback"    # Landroidx/camera/core/ImageCapture$OnImageCapturedCallback;

    .line 715
    invoke-virtual {p0, p1, p2}, Landroidx/camera/core/ImageCapture;->takePicture(Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageCapture$OnImageCapturedCallback;)V

    return-void
.end method

.method synthetic lambda$takePicture$2$androidx-camera-core-ImageCapture(Landroidx/camera/core/ImageCapture$OutputFileOptions;Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageCapture$OnImageSavedCallback;)V
    .locals 0
    .param p1, "outputFileOptions"    # Landroidx/camera/core/ImageCapture$OutputFileOptions;
    .param p2, "executor"    # Ljava/util/concurrent/Executor;
    .param p3, "imageSavedCallback"    # Landroidx/camera/core/ImageCapture$OnImageSavedCallback;

    .line 743
    invoke-virtual {p0, p1, p2, p3}, Landroidx/camera/core/ImageCapture;->takePicture(Landroidx/camera/core/ImageCapture$OutputFileOptions;Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageCapture$OnImageSavedCallback;)V

    return-void
.end method

.method lockFlashMode()V
    .locals 3

    .line 792
    iget-object v0, p0, Landroidx/camera/core/ImageCapture;->mLockedFlashMode:Ljava/util/concurrent/atomic/AtomicReference;

    monitor-enter v0

    .line 793
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/ImageCapture;->mLockedFlashMode:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 795
    monitor-exit v0

    return-void

    .line 797
    :cond_0
    iget-object v1, p0, Landroidx/camera/core/ImageCapture;->mLockedFlashMode:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getFlashMode()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 798
    monitor-exit v0

    .line 799
    return-void

    .line 798
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onBind()V
    .locals 2

    .line 916
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getCamera()Landroidx/camera/core/impl/CameraInternal;

    move-result-object v0

    .line 917
    .local v0, "camera":Landroidx/camera/core/impl/CameraInternal;
    const-string v1, "Attached camera cannot be null"

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 918
    return-void
.end method

.method public onCameraControlReady()V
    .locals 0

    .line 448
    invoke-direct {p0}, Landroidx/camera/core/ImageCapture;->trySetFlashModeToCameraControl()V

    .line 449
    return-void
.end method

.method protected onMergeConfig(Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/camera/core/impl/UseCaseConfig$Builder;)Landroidx/camera/core/impl/UseCaseConfig;
    .locals 7
    .param p1, "cameraInfo"    # Landroidx/camera/core/impl/CameraInfoInternal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/CameraInfoInternal;",
            "Landroidx/camera/core/impl/UseCaseConfig$Builder<",
            "***>;)",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;"
        }
    .end annotation

    .line 378
    .local p2, "builder":Landroidx/camera/core/impl/UseCaseConfig$Builder;, "Landroidx/camera/core/impl/UseCaseConfig$Builder<***>;"
    invoke-interface {p1}, Landroidx/camera/core/impl/CameraInfoInternal;->getCameraQuirks()Landroidx/camera/core/impl/Quirks;

    move-result-object v0

    const-class v1, Landroidx/camera/core/internal/compat/quirk/SoftwareJpegEncodingPreferredQuirk;

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/Quirks;->contains(Ljava/lang/Class;)Z

    move-result v0

    const/4 v1, 0x1

    .line 382
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    .line 378
    if-eqz v0, :cond_1

    .line 381
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {p2}, Landroidx/camera/core/impl/UseCaseConfig$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v3

    sget-object v4, Landroidx/camera/core/impl/ImageCaptureConfig;->OPTION_USE_SOFTWARE_JPEG_ENCODER:Landroidx/camera/core/impl/Config$Option;

    .line 382
    nop

    .line 381
    invoke-interface {v3, v4, v2}, Landroidx/camera/core/impl/MutableConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v3, "ImageCapture"

    if-eqz v0, :cond_0

    .line 383
    const-string v0, "Device quirk suggests software JPEG encoder, but it has been explicitly disabled."

    invoke-static {v3, v0}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 386
    :cond_0
    const-string/jumbo v0, "Requesting software JPEG due to device quirk."

    invoke-static {v3, v0}, Landroidx/camera/core/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 387
    invoke-interface {p2}, Landroidx/camera/core/impl/UseCaseConfig$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v3, Landroidx/camera/core/impl/ImageCaptureConfig;->OPTION_USE_SOFTWARE_JPEG_ENCODER:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v3, v2}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 392
    :cond_1
    :goto_0
    invoke-interface {p2}, Landroidx/camera/core/impl/UseCaseConfig$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/camera/core/ImageCapture;->enforceSoftwareJpegConstraints(Landroidx/camera/core/impl/MutableConfig;)Z

    move-result v0

    .line 396
    .local v0, "useSoftwareJpeg":Z
    invoke-interface {p2}, Landroidx/camera/core/impl/UseCaseConfig$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v2

    sget-object v3, Landroidx/camera/core/impl/ImageCaptureConfig;->OPTION_BUFFER_FORMAT:Landroidx/camera/core/impl/Config$Option;

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Landroidx/camera/core/impl/MutableConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 398
    .local v2, "bufferFormat":Ljava/lang/Integer;
    const/16 v3, 0x100

    const/16 v5, 0x23

    if-eqz v2, :cond_5

    .line 399
    invoke-direct {p0}, Landroidx/camera/core/ImageCapture;->isSessionProcessorEnabledInCurrentCamera()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 400
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v4, v3, :cond_2

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    goto :goto_2

    :cond_3
    :goto_1
    nop

    .line 399
    :goto_2
    const-string v3, "Cannot set non-JPEG buffer format with Extensions enabled."

    invoke-static {v1, v3}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 402
    invoke-interface {p2}, Landroidx/camera/core/impl/UseCaseConfig$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v1

    sget-object v3, Landroidx/camera/core/impl/ImageInputConfig;->OPTION_INPUT_FORMAT:Landroidx/camera/core/impl/Config$Option;

    .line 403
    if-eqz v0, :cond_4

    goto :goto_3

    :cond_4
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v5

    :goto_3
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 402
    invoke-interface {v1, v3, v4}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    goto :goto_4

    .line 405
    :cond_5
    if-eqz v0, :cond_6

    .line 406
    invoke-interface {p2}, Landroidx/camera/core/impl/UseCaseConfig$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v1

    sget-object v3, Landroidx/camera/core/impl/ImageInputConfig;->OPTION_INPUT_FORMAT:Landroidx/camera/core/impl/Config$Option;

    .line 407
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 406
    invoke-interface {v1, v3, v4}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    goto :goto_4

    .line 409
    :cond_6
    nop

    .line 410
    invoke-interface {p2}, Landroidx/camera/core/impl/UseCaseConfig$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v1

    sget-object v6, Landroidx/camera/core/impl/ImageCaptureConfig;->OPTION_SUPPORTED_RESOLUTIONS:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v1, v6, v4}, Landroidx/camera/core/impl/MutableConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 412
    .local v1, "supportedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Pair<Ljava/lang/Integer;[Landroid/util/Size;>;>;"
    if-nez v1, :cond_7

    .line 413
    invoke-interface {p2}, Landroidx/camera/core/impl/UseCaseConfig$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v4

    sget-object v5, Landroidx/camera/core/impl/ImageInputConfig;->OPTION_INPUT_FORMAT:Landroidx/camera/core/impl/Config$Option;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v4, v5, v3}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    goto :goto_4

    .line 416
    :cond_7
    invoke-static {v1, v3}, Landroidx/camera/core/ImageCapture;->isImageFormatSupported(Ljava/util/List;I)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 417
    invoke-interface {p2}, Landroidx/camera/core/impl/UseCaseConfig$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v4

    sget-object v5, Landroidx/camera/core/impl/ImageInputConfig;->OPTION_INPUT_FORMAT:Landroidx/camera/core/impl/Config$Option;

    .line 418
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 417
    invoke-interface {v4, v5, v3}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    goto :goto_4

    .line 419
    :cond_8
    invoke-static {v1, v5}, Landroidx/camera/core/ImageCapture;->isImageFormatSupported(Ljava/util/List;I)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 420
    invoke-interface {p2}, Landroidx/camera/core/impl/UseCaseConfig$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v3

    sget-object v4, Landroidx/camera/core/impl/ImageInputConfig;->OPTION_INPUT_FORMAT:Landroidx/camera/core/impl/Config$Option;

    .line 421
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 420
    invoke-interface {v3, v4, v5}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 426
    .end local v1    # "supportedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Pair<Ljava/lang/Integer;[Landroid/util/Size;>;>;"
    :cond_9
    :goto_4
    invoke-interface {p2}, Landroidx/camera/core/impl/UseCaseConfig$Builder;->getUseCaseConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v1

    return-object v1
.end method

.method public onStateDetached()V
    .locals 0

    .line 781
    invoke-direct {p0}, Landroidx/camera/core/ImageCapture;->abortImageCaptureRequests()V

    .line 782
    return-void
.end method

.method protected onSuggestedStreamSpecImplementationOptionsUpdated(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/StreamSpec;
    .locals 1
    .param p1, "config"    # Landroidx/camera/core/impl/Config;

    .line 945
    iget-object v0, p0, Landroidx/camera/core/ImageCapture;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    invoke-virtual {v0, p1}, Landroidx/camera/core/impl/SessionConfig$Builder;->addImplementationOptions(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 946
    iget-object v0, p0, Landroidx/camera/core/ImageCapture;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    invoke-virtual {v0}, Landroidx/camera/core/impl/SessionConfig$Builder;->build()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/camera/core/ImageCapture;->updateSessionConfig(Landroidx/camera/core/impl/SessionConfig;)V

    .line 947
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getAttachedStreamSpec()Landroidx/camera/core/impl/StreamSpec;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/impl/StreamSpec;->toBuilder()Landroidx/camera/core/impl/StreamSpec$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroidx/camera/core/impl/StreamSpec$Builder;->setImplementationOptions(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/StreamSpec$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/impl/StreamSpec$Builder;->build()Landroidx/camera/core/impl/StreamSpec;

    move-result-object v0

    return-object v0
.end method

.method protected onSuggestedStreamSpecUpdated(Landroidx/camera/core/impl/StreamSpec;)Landroidx/camera/core/impl/StreamSpec;
    .locals 2
    .param p1, "suggestedStreamSpec"    # Landroidx/camera/core/impl/StreamSpec;

    .line 927
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getCameraId()Ljava/lang/String;

    move-result-object v0

    .line 928
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getCurrentConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/ImageCaptureConfig;

    .line 927
    invoke-direct {p0, v0, v1, p1}, Landroidx/camera/core/ImageCapture;->createPipeline(Ljava/lang/String;Landroidx/camera/core/impl/ImageCaptureConfig;Landroidx/camera/core/impl/StreamSpec;)Landroidx/camera/core/impl/SessionConfig$Builder;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/ImageCapture;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 930
    iget-object v0, p0, Landroidx/camera/core/ImageCapture;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    invoke-virtual {v0}, Landroidx/camera/core/impl/SessionConfig$Builder;->build()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/camera/core/ImageCapture;->updateSessionConfig(Landroidx/camera/core/impl/SessionConfig;)V

    .line 934
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->notifyActive()V

    .line 935
    return-object p1
.end method

.method public onUnbind()V
    .locals 0

    .line 906
    invoke-direct {p0}, Landroidx/camera/core/ImageCapture;->abortImageCaptureRequests()V

    .line 907
    invoke-direct {p0}, Landroidx/camera/core/ImageCapture;->clearPipeline()V

    .line 908
    return-void
.end method

.method public setCropAspectRatio(Landroid/util/Rational;)V
    .locals 0
    .param p1, "aspectRatio"    # Landroid/util/Rational;

    .line 529
    iput-object p1, p0, Landroidx/camera/core/ImageCapture;->mCropAspectRatio:Landroid/util/Rational;

    .line 530
    return-void
.end method

.method public setFlashMode(I)V
    .locals 3
    .param p1, "flashMode"    # I

    .line 485
    if-eqz p1, :cond_1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1

    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 487
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid flash mode: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 490
    :cond_1
    :goto_0
    iget-object v0, p0, Landroidx/camera/core/ImageCapture;->mLockedFlashMode:Ljava/util/concurrent/atomic/AtomicReference;

    monitor-enter v0

    .line 491
    :try_start_0
    iput p1, p0, Landroidx/camera/core/ImageCapture;->mFlashMode:I

    .line 492
    invoke-direct {p0}, Landroidx/camera/core/ImageCapture;->trySetFlashModeToCameraControl()V

    .line 493
    monitor-exit v0

    .line 494
    return-void

    .line 493
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setTargetRotation(I)V
    .locals 5
    .param p1, "rotation"    # I

    .line 594
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getTargetRotation()I

    move-result v0

    .line 596
    .local v0, "oldRotation":I
    invoke-virtual {p0, p1}, Landroidx/camera/core/ImageCapture;->setTargetRotationInternal(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 600
    iget-object v1, p0, Landroidx/camera/core/ImageCapture;->mCropAspectRatio:Landroid/util/Rational;

    if-eqz v1, :cond_0

    .line 601
    invoke-static {v0}, Landroidx/camera/core/impl/utils/CameraOrientationUtil;->surfaceRotationToDegrees(I)I

    move-result v1

    .line 603
    .local v1, "oldRotationDegrees":I
    invoke-static {p1}, Landroidx/camera/core/impl/utils/CameraOrientationUtil;->surfaceRotationToDegrees(I)I

    move-result v2

    .line 604
    .local v2, "newRotationDegrees":I
    sub-int v3, v2, v1

    .line 605
    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    iget-object v4, p0, Landroidx/camera/core/ImageCapture;->mCropAspectRatio:Landroid/util/Rational;

    .line 604
    invoke-static {v3, v4}, Landroidx/camera/core/internal/utils/ImageUtil;->getRotatedAspectRatio(ILandroid/util/Rational;)Landroid/util/Rational;

    move-result-object v3

    iput-object v3, p0, Landroidx/camera/core/ImageCapture;->mCropAspectRatio:Landroid/util/Rational;

    .line 610
    .end local v1    # "oldRotationDegrees":I
    .end local v2    # "newRotationDegrees":I
    :cond_0
    return-void
.end method

.method submitStillCaptureRequest(Ljava/util/List;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/CaptureConfig;",
            ">;)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 1126
    .local p1, "captureConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/CaptureConfig;>;"
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1127
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getCameraControl()Landroidx/camera/core/impl/CameraControlInternal;

    move-result-object v0

    iget v1, p0, Landroidx/camera/core/ImageCapture;->mCaptureMode:I

    iget v2, p0, Landroidx/camera/core/ImageCapture;->mFlashType:I

    invoke-interface {v0, p1, v1, v2}, Landroidx/camera/core/impl/CameraControlInternal;->submitStillCaptureRequests(Ljava/util/List;II)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    new-instance v1, Landroidx/camera/core/ImageCapture$$ExternalSyntheticLambda4;

    invoke-direct {v1}, Landroidx/camera/core/ImageCapture$$ExternalSyntheticLambda4;-><init>()V

    .line 1129
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    .line 1127
    invoke-static {v0, v1, v2}, Landroidx/camera/core/impl/utils/futures/Futures;->transform(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/arch/core/util/Function;Ljava/util/concurrent/Executor;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public takePicture(Landroidx/camera/core/ImageCapture$OutputFileOptions;Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageCapture$OnImageSavedCallback;)V
    .locals 2
    .param p1, "outputFileOptions"    # Landroidx/camera/core/ImageCapture$OutputFileOptions;
    .param p2, "executor"    # Ljava/util/concurrent/Executor;
    .param p3, "imageSavedCallback"    # Landroidx/camera/core/ImageCapture$OnImageSavedCallback;

    .line 741
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 742
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    new-instance v1, Landroidx/camera/core/ImageCapture$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, p1, p2, p3}, Landroidx/camera/core/ImageCapture$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/core/ImageCapture;Landroidx/camera/core/ImageCapture$OutputFileOptions;Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageCapture$OnImageSavedCallback;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 744
    return-void

    .line 746
    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, p2, v0, p3, p1}, Landroidx/camera/core/ImageCapture;->takePictureInternal(Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageCapture$OnImageCapturedCallback;Landroidx/camera/core/ImageCapture$OnImageSavedCallback;Landroidx/camera/core/ImageCapture$OutputFileOptions;)V

    .line 748
    return-void
.end method

.method public takePicture(Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageCapture$OnImageCapturedCallback;)V
    .locals 2
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "callback"    # Landroidx/camera/core/ImageCapture$OnImageCapturedCallback;

    .line 714
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 715
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    new-instance v1, Landroidx/camera/core/ImageCapture$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1, p2}, Landroidx/camera/core/ImageCapture$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/core/ImageCapture;Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageCapture$OnImageCapturedCallback;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 716
    return-void

    .line 719
    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, v0}, Landroidx/camera/core/ImageCapture;->takePictureInternal(Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageCapture$OnImageCapturedCallback;Landroidx/camera/core/ImageCapture$OnImageSavedCallback;Landroidx/camera/core/ImageCapture$OutputFileOptions;)V

    .line 721
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 854
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ImageCapture:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method unlockFlashMode()V
    .locals 4

    .line 802
    iget-object v0, p0, Landroidx/camera/core/ImageCapture;->mLockedFlashMode:Ljava/util/concurrent/atomic/AtomicReference;

    monitor-enter v0

    .line 803
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/ImageCapture;->mLockedFlashMode:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 804
    .local v1, "lockedFlashMode":Ljava/lang/Integer;
    if-nez v1, :cond_0

    .line 806
    monitor-exit v0

    return-void

    .line 808
    :cond_0
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture;->getFlashMode()I

    move-result v3

    if-eq v2, v3, :cond_1

    .line 810
    invoke-direct {p0}, Landroidx/camera/core/ImageCapture;->trySetFlashModeToCameraControl()V

    .line 812
    .end local v1    # "lockedFlashMode":Ljava/lang/Integer;
    :cond_1
    monitor-exit v0

    .line 813
    return-void

    .line 812
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
