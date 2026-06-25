.class public final Landroidx/camera/video/VideoCapture;
.super Landroidx/camera/core/UseCase;
.source "VideoCapture.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/video/VideoCapture$Builder;,
        Landroidx/camera/video/VideoCapture$Defaults;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Landroidx/camera/video/VideoOutput;",
        ">",
        "Landroidx/camera/core/UseCase;"
    }
.end annotation


# static fields
.field private static final DEFAULT_CONFIG:Landroidx/camera/video/VideoCapture$Defaults;

.field private static final SURFACE_UPDATE_KEY:Ljava/lang/String; = "androidx.camera.video.VideoCapture.streamUpdate"

.field private static final TAG:Ljava/lang/String; = "VideoCapture"

.field private static final USE_TEMPLATE_PREVIEW_BY_QUIRK:Z

.field static sEnableSurfaceProcessingByQuirk:Z


# instance fields
.field private mCameraEdge:Landroidx/camera/core/processing/SurfaceEdge;

.field private mCropRect:Landroid/graphics/Rect;

.field mDeferrableSurface:Landroidx/camera/core/impl/DeferrableSurface;

.field private mHasCompensatingTransformation:Z

.field private mNode:Landroidx/camera/core/processing/SurfaceProcessorNode;

.field private mRotationDegrees:I

.field mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

.field mSourceState:Landroidx/camera/video/VideoOutput$SourceState;

.field mStreamInfo:Landroidx/camera/video/StreamInfo;

.field private final mStreamInfoObserver:Landroidx/camera/core/impl/Observable$Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/Observable$Observer<",
            "Landroidx/camera/video/StreamInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

.field mSurfaceUpdateFuture:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private mVideoEncoderInfo:Landroidx/camera/video/internal/encoder/VideoEncoderInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 172
    new-instance v0, Landroidx/camera/video/VideoCapture$Defaults;

    invoke-direct {v0}, Landroidx/camera/video/VideoCapture$Defaults;-><init>()V

    sput-object v0, Landroidx/camera/video/VideoCapture;->DEFAULT_CONFIG:Landroidx/camera/video/VideoCapture$Defaults;

    .line 178
    const-class v0, Landroidx/camera/video/internal/compat/quirk/PreviewStretchWhenVideoCaptureIsBoundQuirk;

    .line 179
    invoke-static {v0}, Landroidx/camera/video/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    .line 180
    .local v0, "hasPreviewStretchQuirk":Z
    :goto_0
    const-class v3, Landroidx/camera/video/internal/compat/quirk/PreviewDelayWhenVideoCaptureIsBoundQuirk;

    .line 181
    invoke-static {v3}, Landroidx/camera/video/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v3

    if-eqz v3, :cond_1

    move v3, v1

    goto :goto_1

    :cond_1
    move v3, v2

    .line 182
    .local v3, "hasPreviewDelayQuirk":Z
    :goto_1
    const-class v4, Landroidx/camera/video/internal/compat/quirk/ImageCaptureFailedWhenVideoCaptureIsBoundQuirk;

    .line 183
    invoke-static {v4}, Landroidx/camera/video/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v4

    if-eqz v4, :cond_2

    move v4, v1

    goto :goto_2

    :cond_2
    move v4, v2

    .line 185
    .local v4, "hasImageCaptureFailedQuirk":Z
    :goto_2
    invoke-static {}, Landroidx/camera/video/VideoCapture;->hasVideoQualityQuirkAndWorkaroundBySurfaceProcessing()Z

    move-result v5

    .line 186
    .local v5, "hasVideoQualityQuirkAndWorkaroundBySurfaceProcessing":Z
    const-class v6, Landroidx/camera/video/internal/compat/quirk/ExtraSupportedResolutionQuirk;

    .line 187
    invoke-static {v6}, Landroidx/camera/video/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v6

    if-eqz v6, :cond_3

    move v6, v1

    goto :goto_3

    :cond_3
    move v6, v2

    .line 188
    .local v6, "hasExtraSupportedResolutionQuirk":Z
    :goto_3
    if-nez v0, :cond_5

    if-nez v3, :cond_5

    if-eqz v4, :cond_4

    goto :goto_4

    :cond_4
    move v7, v2

    goto :goto_5

    :cond_5
    :goto_4
    move v7, v1

    :goto_5
    sput-boolean v7, Landroidx/camera/video/VideoCapture;->USE_TEMPLATE_PREVIEW_BY_QUIRK:Z

    .line 190
    if-nez v3, :cond_7

    if-nez v4, :cond_7

    if-nez v5, :cond_7

    if-eqz v6, :cond_6

    goto :goto_6

    :cond_6
    move v1, v2

    :cond_7
    :goto_6
    sput-boolean v1, Landroidx/camera/video/VideoCapture;->sEnableSurfaceProcessingByQuirk:Z

    .line 194
    .end local v0    # "hasPreviewStretchQuirk":Z
    .end local v3    # "hasPreviewDelayQuirk":Z
    .end local v4    # "hasImageCaptureFailedQuirk":Z
    .end local v5    # "hasVideoQualityQuirkAndWorkaroundBySurfaceProcessing":Z
    .end local v6    # "hasExtraSupportedResolutionQuirk":Z
    return-void
.end method

.method constructor <init>(Landroidx/camera/video/impl/VideoCaptureConfig;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/video/impl/VideoCaptureConfig<",
            "TT;>;)V"
        }
    .end annotation

    .line 236
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    .local p1, "config":Landroidx/camera/video/impl/VideoCaptureConfig;, "Landroidx/camera/video/impl/VideoCaptureConfig<TT;>;"
    invoke-direct {p0, p1}, Landroidx/camera/core/UseCase;-><init>(Landroidx/camera/core/impl/UseCaseConfig;)V

    .line 200
    sget-object v0, Landroidx/camera/video/StreamInfo;->STREAM_INFO_ANY_INACTIVE:Landroidx/camera/video/StreamInfo;

    iput-object v0, p0, Landroidx/camera/video/VideoCapture;->mStreamInfo:Landroidx/camera/video/StreamInfo;

    .line 202
    new-instance v0, Landroidx/camera/core/impl/SessionConfig$Builder;

    invoke-direct {v0}, Landroidx/camera/core/impl/SessionConfig$Builder;-><init>()V

    iput-object v0, p0, Landroidx/camera/video/VideoCapture;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 205
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/video/VideoCapture;->mSurfaceUpdateFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 208
    sget-object v0, Landroidx/camera/video/VideoOutput$SourceState;->INACTIVE:Landroidx/camera/video/VideoOutput$SourceState;

    iput-object v0, p0, Landroidx/camera/video/VideoCapture;->mSourceState:Landroidx/camera/video/VideoOutput$SourceState;

    .line 217
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/video/VideoCapture;->mHasCompensatingTransformation:Z

    .line 828
    new-instance v0, Landroidx/camera/video/VideoCapture$1;

    invoke-direct {v0, p0}, Landroidx/camera/video/VideoCapture$1;-><init>(Landroidx/camera/video/VideoCapture;)V

    iput-object v0, p0, Landroidx/camera/video/VideoCapture;->mStreamInfoObserver:Landroidx/camera/core/impl/Observable$Observer;

    .line 237
    return-void
.end method

.method static synthetic access$000(Landroidx/camera/video/VideoCapture;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Landroidx/camera/video/VideoCapture;

    .line 168
    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->getCameraId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Landroidx/camera/video/VideoCapture;Landroidx/camera/core/impl/SessionConfig;)V
    .locals 0
    .param p0, "x0"    # Landroidx/camera/video/VideoCapture;
    .param p1, "x1"    # Landroidx/camera/core/impl/SessionConfig;

    .line 168
    invoke-virtual {p0, p1}, Landroidx/camera/video/VideoCapture;->updateSessionConfig(Landroidx/camera/core/impl/SessionConfig;)V

    return-void
.end method

.method static synthetic access$200(Landroidx/camera/video/VideoCapture;)V
    .locals 0
    .param p0, "x0"    # Landroidx/camera/video/VideoCapture;

    .line 168
    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->notifyReset()V

    return-void
.end method

.method static synthetic access$300(Landroidx/camera/video/VideoCapture;Landroidx/camera/core/impl/SessionConfig;)V
    .locals 0
    .param p0, "x0"    # Landroidx/camera/video/VideoCapture;
    .param p1, "x1"    # Landroidx/camera/core/impl/SessionConfig;

    .line 168
    invoke-virtual {p0, p1}, Landroidx/camera/video/VideoCapture;->updateSessionConfig(Landroidx/camera/core/impl/SessionConfig;)V

    return-void
.end method

.method static synthetic access$400(Landroidx/camera/video/VideoCapture;)V
    .locals 0
    .param p0, "x0"    # Landroidx/camera/video/VideoCapture;

    .line 168
    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->notifyUpdated()V

    return-void
.end method

.method private static addBySupportedSize(Ljava/util/Set;IILandroid/util/Size;Landroidx/camera/video/internal/encoder/VideoEncoderInfo;)V
    .locals 4
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "resolution"    # Landroid/util/Size;
    .param p4, "videoEncoderInfo"    # Landroidx/camera/video/internal/encoder/VideoEncoderInfo;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Landroid/util/Size;",
            ">;II",
            "Landroid/util/Size;",
            "Landroidx/camera/video/internal/encoder/VideoEncoderInfo;",
            ")V"
        }
    .end annotation

    .line 1036
    .local p0, "candidates":Ljava/util/Set;, "Ljava/util/Set<Landroid/util/Size;>;"
    const-string/jumbo v0, "VideoCapture"

    invoke-virtual {p3}, Landroid/util/Size;->getWidth()I

    move-result v1

    if-gt p1, v1, :cond_1

    invoke-virtual {p3}, Landroid/util/Size;->getHeight()I

    move-result v1

    if-le p2, v1, :cond_0

    goto :goto_2

    .line 1040
    :cond_0
    :try_start_0
    invoke-interface {p4, p1}, Landroidx/camera/video/internal/encoder/VideoEncoderInfo;->getSupportedHeightsFor(I)Landroid/util/Range;

    move-result-object v1

    .line 1041
    .local v1, "supportedHeights":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    new-instance v2, Landroid/util/Size;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/util/Range;->clamp(Ljava/lang/Comparable;)Ljava/lang/Comparable;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-direct {v2, p1, v3}, Landroid/util/Size;-><init>(II)V

    invoke-interface {p0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1044
    nop

    .end local v1    # "supportedHeights":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    goto :goto_0

    .line 1042
    :catch_0
    move-exception v1

    .line 1043
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No supportedHeights for width: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1046
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    :goto_0
    :try_start_1
    invoke-interface {p4, p2}, Landroidx/camera/video/internal/encoder/VideoEncoderInfo;->getSupportedWidthsFor(I)Landroid/util/Range;

    move-result-object v1

    .line 1047
    .local v1, "supportedWidths":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    new-instance v2, Landroid/util/Size;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/util/Range;->clamp(Ljava/lang/Comparable;)Ljava/lang/Comparable;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-direct {v2, v3, p2}, Landroid/util/Size;-><init>(II)V

    invoke-interface {p0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1050
    nop

    .end local v1    # "supportedWidths":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    goto :goto_1

    .line 1048
    :catch_1
    move-exception v1

    .line 1049
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No supportedWidths for height: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1051
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    :goto_1
    return-void

    .line 1037
    :cond_1
    :goto_2
    return-void
.end method

.method private static adjustCropRectToValidSize(Landroid/graphics/Rect;Landroid/util/Size;Landroidx/camera/video/internal/encoder/VideoEncoderInfo;)Landroid/graphics/Rect;
    .locals 17
    .param p0, "cropRect"    # Landroid/graphics/Rect;
    .param p1, "resolution"    # Landroid/util/Size;
    .param p2, "videoEncoderInfo"    # Landroidx/camera/video/internal/encoder/VideoEncoderInfo;

    .line 951
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    .line 953
    invoke-static {v0}, Landroidx/camera/core/impl/utils/TransformUtils;->rectToString(Landroid/graphics/Rect;)Ljava/lang/String;

    move-result-object v3

    .line 954
    invoke-interface {v2}, Landroidx/camera/video/internal/encoder/VideoEncoderInfo;->getWidthAlignment()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 955
    invoke-interface {v2}, Landroidx/camera/video/internal/encoder/VideoEncoderInfo;->getHeightAlignment()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 956
    invoke-interface {v2}, Landroidx/camera/video/internal/encoder/VideoEncoderInfo;->getSupportedWidths()Landroid/util/Range;

    move-result-object v6

    .line 957
    invoke-interface {v2}, Landroidx/camera/video/internal/encoder/VideoEncoderInfo;->getSupportedHeights()Landroid/util/Range;

    move-result-object v7

    filled-new-array {v3, v4, v5, v6, v7}, [Ljava/lang/Object;

    move-result-object v3

    .line 951
    const-string v4, "Adjust cropRect %s by width/height alignment %d/%d and supported widths %s / supported heights %s"

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "VideoCapture"

    invoke-static {v4, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 961
    invoke-interface {v2}, Landroidx/camera/video/internal/encoder/VideoEncoderInfo;->getWidthAlignment()I

    move-result v3

    .line 962
    .local v3, "widthAlignment":I
    invoke-interface {v2}, Landroidx/camera/video/internal/encoder/VideoEncoderInfo;->getHeightAlignment()I

    move-result v5

    .line 963
    .local v5, "heightAlignment":I
    invoke-interface {v2}, Landroidx/camera/video/internal/encoder/VideoEncoderInfo;->getSupportedWidths()Landroid/util/Range;

    move-result-object v6

    .line 964
    .local v6, "supportedWidths":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-interface {v2}, Landroidx/camera/video/internal/encoder/VideoEncoderInfo;->getSupportedHeights()Landroid/util/Range;

    move-result-object v7

    .line 965
    .local v7, "supportedHeights":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v8

    invoke-static {v8, v3, v6}, Landroidx/camera/video/VideoCapture;->alignDown(IILandroid/util/Range;)I

    move-result v8

    .line 966
    .local v8, "widthAlignedDown":I
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v9

    invoke-static {v9, v3, v6}, Landroidx/camera/video/VideoCapture;->alignUp(IILandroid/util/Range;)I

    move-result v9

    .line 967
    .local v9, "widthAlignedUp":I
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v10

    invoke-static {v10, v5, v7}, Landroidx/camera/video/VideoCapture;->alignDown(IILandroid/util/Range;)I

    move-result v10

    .line 968
    .local v10, "heightAlignedDown":I
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v11

    invoke-static {v11, v5, v7}, Landroidx/camera/video/VideoCapture;->alignUp(IILandroid/util/Range;)I

    move-result v11

    .line 971
    .local v11, "heightAlignedUp":I
    new-instance v12, Ljava/util/HashSet;

    invoke-direct {v12}, Ljava/util/HashSet;-><init>()V

    .line 972
    .local v12, "candidateSet":Ljava/util/Set;, "Ljava/util/Set<Landroid/util/Size;>;"
    invoke-static {v12, v8, v10, v1, v2}, Landroidx/camera/video/VideoCapture;->addBySupportedSize(Ljava/util/Set;IILandroid/util/Size;Landroidx/camera/video/internal/encoder/VideoEncoderInfo;)V

    .line 974
    invoke-static {v12, v8, v11, v1, v2}, Landroidx/camera/video/VideoCapture;->addBySupportedSize(Ljava/util/Set;IILandroid/util/Size;Landroidx/camera/video/internal/encoder/VideoEncoderInfo;)V

    .line 976
    invoke-static {v12, v9, v10, v1, v2}, Landroidx/camera/video/VideoCapture;->addBySupportedSize(Ljava/util/Set;IILandroid/util/Size;Landroidx/camera/video/internal/encoder/VideoEncoderInfo;)V

    .line 978
    invoke-static {v12, v9, v11, v1, v2}, Landroidx/camera/video/VideoCapture;->addBySupportedSize(Ljava/util/Set;IILandroid/util/Size;Landroidx/camera/video/internal/encoder/VideoEncoderInfo;)V

    .line 980
    invoke-interface {v12}, Ljava/util/Set;->isEmpty()Z

    move-result v13

    if-eqz v13, :cond_0

    .line 981
    const-string v13, "Can\'t find valid cropped size"

    invoke-static {v4, v13}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 982
    return-object v0

    .line 984
    :cond_0
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13, v12}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 985
    .local v13, "candidatesList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "candidatesList = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v4, v14}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 989
    new-instance v14, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda1;

    invoke-direct {v14, v0}, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda1;-><init>(Landroid/graphics/Rect;)V

    invoke-static {v13, v14}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 994
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "sorted candidatesList = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v4, v14}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 995
    const/4 v14, 0x0

    invoke-interface {v13, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/util/Size;

    .line 996
    .local v15, "newSize":Landroid/util/Size;
    invoke-virtual {v15}, Landroid/util/Size;->getWidth()I

    move-result v14

    .line 997
    .local v14, "newWidth":I
    invoke-virtual {v15}, Landroid/util/Size;->getHeight()I

    move-result v1

    .line 999
    .local v1, "newHeight":I
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v2

    if-ne v14, v2, :cond_1

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v2

    if-ne v1, v2, :cond_1

    .line 1000
    const-string v2, "No need to adjust cropRect because crop size is valid."

    invoke-static {v4, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1001
    return-object v0

    .line 1008
    :cond_1
    rem-int/lit8 v2, v14, 0x2

    if-nez v2, :cond_2

    rem-int/lit8 v2, v1, 0x2

    if-nez v2, :cond_2

    .line 1009
    invoke-virtual/range {p1 .. p1}, Landroid/util/Size;->getWidth()I

    move-result v2

    if-gt v14, v2, :cond_2

    invoke-virtual/range {p1 .. p1}, Landroid/util/Size;->getHeight()I

    move-result v2

    if-gt v1, v2, :cond_2

    const/4 v2, 0x1

    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    .line 1008
    :goto_0
    invoke-static {v2}, Landroidx/core/util/Preconditions;->checkState(Z)V

    .line 1010
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2, v0}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 1011
    .local v2, "newCropRect":Landroid/graphics/Rect;
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Rect;->width()I

    move-result v0

    if-eq v14, v0, :cond_3

    .line 1014
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Rect;->centerX()I

    move-result v0

    div-int/lit8 v16, v14, 0x2

    sub-int v0, v0, v16

    move/from16 v16, v3

    const/4 v3, 0x0

    .end local v3    # "widthAlignment":I
    .local v16, "widthAlignment":I
    invoke-static {v3, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, v2, Landroid/graphics/Rect;->left:I

    .line 1015
    iget v0, v2, Landroid/graphics/Rect;->left:I

    add-int/2addr v0, v14

    iput v0, v2, Landroid/graphics/Rect;->right:I

    .line 1016
    iget v0, v2, Landroid/graphics/Rect;->right:I

    invoke-virtual/range {p1 .. p1}, Landroid/util/Size;->getWidth()I

    move-result v3

    if-le v0, v3, :cond_4

    .line 1017
    invoke-virtual/range {p1 .. p1}, Landroid/util/Size;->getWidth()I

    move-result v0

    iput v0, v2, Landroid/graphics/Rect;->right:I

    .line 1018
    iget v0, v2, Landroid/graphics/Rect;->right:I

    sub-int/2addr v0, v14

    iput v0, v2, Landroid/graphics/Rect;->left:I

    goto :goto_1

    .line 1011
    .end local v16    # "widthAlignment":I
    .restart local v3    # "widthAlignment":I
    :cond_3
    move/from16 v16, v3

    .line 1021
    .end local v3    # "widthAlignment":I
    .restart local v16    # "widthAlignment":I
    :cond_4
    :goto_1
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Rect;->height()I

    move-result v0

    if-eq v1, v0, :cond_5

    .line 1022
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Rect;->centerY()I

    move-result v0

    div-int/lit8 v3, v1, 0x2

    sub-int/2addr v0, v3

    const/4 v3, 0x0

    invoke-static {v3, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, v2, Landroid/graphics/Rect;->top:I

    .line 1023
    iget v0, v2, Landroid/graphics/Rect;->top:I

    add-int/2addr v0, v1

    iput v0, v2, Landroid/graphics/Rect;->bottom:I

    .line 1024
    iget v0, v2, Landroid/graphics/Rect;->bottom:I

    invoke-virtual/range {p1 .. p1}, Landroid/util/Size;->getHeight()I

    move-result v3

    if-le v0, v3, :cond_5

    .line 1025
    invoke-virtual/range {p1 .. p1}, Landroid/util/Size;->getHeight()I

    move-result v0

    iput v0, v2, Landroid/graphics/Rect;->bottom:I

    .line 1026
    iget v0, v2, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v0, v1

    iput v0, v2, Landroid/graphics/Rect;->top:I

    .line 1029
    :cond_5
    invoke-static/range {p0 .. p0}, Landroidx/camera/core/impl/utils/TransformUtils;->rectToString(Landroid/graphics/Rect;)Ljava/lang/String;

    move-result-object v0

    .line 1030
    invoke-static {v2}, Landroidx/camera/core/impl/utils/TransformUtils;->rectToString(Landroid/graphics/Rect;)Ljava/lang/String;

    move-result-object v3

    filled-new-array {v0, v3}, [Ljava/lang/Object;

    move-result-object v0

    .line 1029
    const-string v3, "Adjust cropRect from %s to %s"

    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1031
    return-object v2
.end method

.method private adjustCropRectWithInProgressTransformation(Landroid/graphics/Rect;I)Landroid/graphics/Rect;
    .locals 2
    .param p1, "cropRect"    # Landroid/graphics/Rect;
    .param p2, "rotationDegrees"    # I

    .line 514
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    move-object v0, p1

    .line 515
    .local v0, "adjustedCropRect":Landroid/graphics/Rect;
    invoke-direct {p0}, Landroidx/camera/video/VideoCapture;->shouldCompensateTransformation()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 516
    iget-object v1, p0, Landroidx/camera/video/VideoCapture;->mStreamInfo:Landroidx/camera/video/StreamInfo;

    .line 518
    invoke-virtual {v1}, Landroidx/camera/video/StreamInfo;->getInProgressTransformationInfo()Landroidx/camera/core/SurfaceRequest$TransformationInfo;

    move-result-object v1

    .line 517
    invoke-static {v1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/SurfaceRequest$TransformationInfo;

    .line 518
    invoke-virtual {v1}, Landroidx/camera/core/SurfaceRequest$TransformationInfo;->getCropRect()Landroid/graphics/Rect;

    move-result-object v1

    .line 516
    invoke-static {v1, p2}, Landroidx/camera/core/impl/utils/TransformUtils;->getRotatedSize(Landroid/graphics/Rect;I)Landroid/util/Size;

    move-result-object v1

    invoke-static {v1}, Landroidx/camera/core/impl/utils/TransformUtils;->sizeToRect(Landroid/util/Size;)Landroid/graphics/Rect;

    move-result-object v0

    .line 521
    :cond_0
    return-object v0
.end method

.method private adjustResolutionWithInProgressTransformation(Landroid/util/Size;Landroid/graphics/Rect;Landroid/graphics/Rect;)Landroid/util/Size;
    .locals 6
    .param p1, "resolution"    # Landroid/util/Size;
    .param p2, "originalCropRect"    # Landroid/graphics/Rect;
    .param p3, "targetCropRect"    # Landroid/graphics/Rect;

    .line 536
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    move-object v0, p1

    .line 537
    .local v0, "nodeResolution":Landroid/util/Size;
    invoke-direct {p0}, Landroidx/camera/video/VideoCapture;->shouldCompensateTransformation()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p3, p2}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 538
    invoke-virtual {p3}, Landroid/graphics/Rect;->height()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    .line 539
    .local v1, "targetRatio":F
    new-instance v2, Landroid/util/Size;

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v3, v1

    float-to-double v3, v3

    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v3

    double-to-int v3, v3

    .line 540
    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, v1

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    double-to-int v4, v4

    invoke-direct {v2, v3, v4}, Landroid/util/Size;-><init>(II)V

    move-object v0, v2

    .line 542
    .end local v1    # "targetRatio":F
    :cond_0
    return-object v0
.end method

.method private adjustRotationWithInProgressTransformation(I)I
    .locals 2
    .param p1, "rotationDegrees"    # I

    .line 525
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    move v0, p1

    .line 526
    .local v0, "adjustedRotationDegrees":I
    invoke-direct {p0}, Landroidx/camera/video/VideoCapture;->shouldCompensateTransformation()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 527
    iget-object v1, p0, Landroidx/camera/video/VideoCapture;->mStreamInfo:Landroidx/camera/video/StreamInfo;

    .line 528
    invoke-virtual {v1}, Landroidx/camera/video/StreamInfo;->getInProgressTransformationInfo()Landroidx/camera/core/SurfaceRequest$TransformationInfo;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/camera/core/SurfaceRequest$TransformationInfo;->getRotationDegrees()I

    move-result v1

    sub-int v1, p1, v1

    .line 527
    invoke-static {v1}, Landroidx/camera/core/impl/utils/TransformUtils;->within360(I)I

    move-result v0

    .line 530
    :cond_0
    return v0
.end method

.method private static align(ZIILandroid/util/Range;)I
    .locals 3
    .param p0, "alignDown"    # Z
    .param p1, "length"    # I
    .param p2, "alignment"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZII",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)I"
        }
    .end annotation

    .line 1101
    .local p3, "supportedRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    rem-int v0, p1, p2

    .line 1103
    .local v0, "remainder":I
    if-nez v0, :cond_0

    .line 1104
    move v1, p1

    .local v1, "newLength":I
    goto :goto_0

    .line 1105
    .end local v1    # "newLength":I
    :cond_0
    if-eqz p0, :cond_1

    .line 1106
    sub-int v1, p1, v0

    .restart local v1    # "newLength":I
    goto :goto_0

    .line 1108
    .end local v1    # "newLength":I
    :cond_1
    sub-int v1, p2, v0

    add-int/2addr v1, p1

    .line 1111
    .restart local v1    # "newLength":I
    :goto_0
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p3, v2}, Landroid/util/Range;->clamp(Ljava/lang/Comparable;)Ljava/lang/Comparable;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    return v2
.end method

.method private static alignDown(IILandroid/util/Range;)I
    .locals 1
    .param p0, "length"    # I
    .param p1, "alignment"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)I"
        }
    .end annotation

    .line 1091
    .local p2, "supportedLength":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    const/4 v0, 0x1

    invoke-static {v0, p0, p1, p2}, Landroidx/camera/video/VideoCapture;->align(ZIILandroid/util/Range;)I

    move-result v0

    return v0
.end method

.method private static alignUp(IILandroid/util/Range;)I
    .locals 1
    .param p0, "length"    # I
    .param p1, "alignment"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)I"
        }
    .end annotation

    .line 1096
    .local p2, "supportedRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    const/4 v0, 0x0

    invoke-static {v0, p0, p1, p2}, Landroidx/camera/video/VideoCapture;->align(ZIILandroid/util/Range;)I

    move-result v0

    return v0
.end method

.method private calculateCropRect(Landroid/util/Size;Landroidx/camera/video/internal/encoder/VideoEncoderInfo;)Landroid/graphics/Rect;
    .locals 4
    .param p1, "surfaceResolution"    # Landroid/util/Size;
    .param p2, "videoEncoderInfo"    # Landroidx/camera/video/internal/encoder/VideoEncoderInfo;

    .line 566
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->getViewPortCropRect()Landroid/graphics/Rect;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 567
    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->getViewPortCropRect()Landroid/graphics/Rect;

    move-result-object v0

    .local v0, "cropRect":Landroid/graphics/Rect;
    goto :goto_0

    .line 569
    .end local v0    # "cropRect":Landroid/graphics/Rect;
    :cond_0
    new-instance v0, Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v2

    const/4 v3, 0x0

    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 571
    .restart local v0    # "cropRect":Landroid/graphics/Rect;
    :goto_0
    if-eqz p2, :cond_2

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    .line 572
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v2

    .line 571
    invoke-interface {p2, v1, v2}, Landroidx/camera/video/internal/encoder/VideoEncoderInfo;->isSizeSupported(II)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_1

    .line 575
    :cond_1
    invoke-static {v0, p1, p2}, Landroidx/camera/video/VideoCapture;->adjustCropRectToValidSize(Landroid/graphics/Rect;Landroid/util/Size;Landroidx/camera/video/internal/encoder/VideoEncoderInfo;)Landroid/graphics/Rect;

    move-result-object v1

    return-object v1

    .line 573
    :cond_2
    :goto_1
    return-object v0
.end method

.method private clearPipeline()V
    .locals 2

    .line 713
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 715
    iget-object v0, p0, Landroidx/camera/video/VideoCapture;->mDeferrableSurface:Landroidx/camera/core/impl/DeferrableSurface;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 716
    iget-object v0, p0, Landroidx/camera/video/VideoCapture;->mDeferrableSurface:Landroidx/camera/core/impl/DeferrableSurface;

    invoke-virtual {v0}, Landroidx/camera/core/impl/DeferrableSurface;->close()V

    .line 717
    iput-object v1, p0, Landroidx/camera/video/VideoCapture;->mDeferrableSurface:Landroidx/camera/core/impl/DeferrableSurface;

    .line 719
    :cond_0
    iget-object v0, p0, Landroidx/camera/video/VideoCapture;->mNode:Landroidx/camera/core/processing/SurfaceProcessorNode;

    if-eqz v0, :cond_1

    .line 720
    iget-object v0, p0, Landroidx/camera/video/VideoCapture;->mNode:Landroidx/camera/core/processing/SurfaceProcessorNode;

    invoke-virtual {v0}, Landroidx/camera/core/processing/SurfaceProcessorNode;->release()V

    .line 721
    iput-object v1, p0, Landroidx/camera/video/VideoCapture;->mNode:Landroidx/camera/core/processing/SurfaceProcessorNode;

    .line 723
    :cond_1
    iget-object v0, p0, Landroidx/camera/video/VideoCapture;->mCameraEdge:Landroidx/camera/core/processing/SurfaceEdge;

    if-eqz v0, :cond_2

    .line 724
    iget-object v0, p0, Landroidx/camera/video/VideoCapture;->mCameraEdge:Landroidx/camera/core/processing/SurfaceEdge;

    invoke-virtual {v0}, Landroidx/camera/core/processing/SurfaceEdge;->close()V

    .line 725
    iput-object v1, p0, Landroidx/camera/video/VideoCapture;->mCameraEdge:Landroidx/camera/core/processing/SurfaceEdge;

    .line 727
    :cond_2
    iput-object v1, p0, Landroidx/camera/video/VideoCapture;->mVideoEncoderInfo:Landroidx/camera/video/internal/encoder/VideoEncoderInfo;

    .line 728
    iput-object v1, p0, Landroidx/camera/video/VideoCapture;->mCropRect:Landroid/graphics/Rect;

    .line 729
    iput-object v1, p0, Landroidx/camera/video/VideoCapture;->mSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    .line 730
    sget-object v0, Landroidx/camera/video/StreamInfo;->STREAM_INFO_ANY_INACTIVE:Landroidx/camera/video/StreamInfo;

    iput-object v0, p0, Landroidx/camera/video/VideoCapture;->mStreamInfo:Landroidx/camera/video/StreamInfo;

    .line 731
    const/4 v0, 0x0

    iput v0, p0, Landroidx/camera/video/VideoCapture;->mRotationDegrees:I

    .line 732
    iput-boolean v0, p0, Landroidx/camera/video/VideoCapture;->mHasCompensatingTransformation:Z

    .line 733
    return-void
.end method

.method private createNodeIfNeeded(Landroidx/camera/core/impl/CameraInternal;Landroid/graphics/Rect;Landroid/util/Size;Landroidx/camera/core/DynamicRange;)Landroidx/camera/core/processing/SurfaceProcessorNode;
    .locals 3
    .param p1, "camera"    # Landroidx/camera/core/impl/CameraInternal;
    .param p2, "cropRect"    # Landroid/graphics/Rect;
    .param p3, "resolution"    # Landroid/util/Size;
    .param p4, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 913
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->getEffect()Landroidx/camera/core/CameraEffect;

    move-result-object v0

    if-nez v0, :cond_1

    .line 914
    invoke-static {p1}, Landroidx/camera/video/VideoCapture;->shouldEnableSurfaceProcessingByQuirk(Landroidx/camera/core/impl/CameraInternal;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 915
    invoke-static {p2, p3}, Landroidx/camera/video/VideoCapture;->shouldCrop(Landroid/graphics/Rect;Landroid/util/Size;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 916
    invoke-direct {p0, p1}, Landroidx/camera/video/VideoCapture;->shouldMirror(Landroidx/camera/core/impl/CameraInternal;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 917
    invoke-direct {p0}, Landroidx/camera/video/VideoCapture;->shouldCompensateTransformation()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 923
    :cond_0
    const/4 v0, 0x0

    return-object v0

    .line 918
    :cond_1
    :goto_0
    const-string/jumbo v0, "VideoCapture"

    const-string/jumbo v1, "Surface processing is enabled."

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 919
    new-instance v0, Landroidx/camera/core/processing/SurfaceProcessorNode;

    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->getCamera()Landroidx/camera/core/impl/CameraInternal;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/CameraInternal;

    .line 920
    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->getEffect()Landroidx/camera/core/CameraEffect;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->getEffect()Landroidx/camera/core/CameraEffect;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/camera/core/CameraEffect;->createSurfaceProcessorInternal()Landroidx/camera/core/processing/SurfaceProcessorInternal;

    move-result-object v2

    goto :goto_1

    .line 921
    :cond_2
    invoke-static {p4}, Landroidx/camera/core/processing/DefaultSurfaceProcessor$Factory;->newInstance(Landroidx/camera/core/DynamicRange;)Landroidx/camera/core/processing/SurfaceProcessorInternal;

    move-result-object v2

    :goto_1
    invoke-direct {v0, v1, v2}, Landroidx/camera/core/processing/SurfaceProcessorNode;-><init>(Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/processing/SurfaceProcessorInternal;)V

    .line 919
    return-object v0
.end method

.method private createPipeline(Ljava/lang/String;Landroidx/camera/video/impl/VideoCaptureConfig;Landroidx/camera/core/impl/StreamSpec;)Landroidx/camera/core/impl/SessionConfig$Builder;
    .locals 27
    .param p1, "cameraId"    # Ljava/lang/String;
    .param p3, "streamSpec"    # Landroidx/camera/core/impl/StreamSpec;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroidx/camera/video/impl/VideoCaptureConfig<",
            "TT;>;",
            "Landroidx/camera/core/impl/StreamSpec;",
            ")",
            "Landroidx/camera/core/impl/SessionConfig$Builder;"
        }
    .end annotation

    .line 584
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    .local p2, "config":Landroidx/camera/video/impl/VideoCaptureConfig;, "Landroidx/camera/video/impl/VideoCaptureConfig<TT;>;"
    move-object/from16 v0, p0

    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 585
    invoke-virtual {v0}, Landroidx/camera/video/VideoCapture;->getCamera()Landroidx/camera/core/impl/CameraInternal;

    move-result-object v1

    invoke-static {v1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Landroidx/camera/core/impl/CameraInternal;

    .line 586
    .local v7, "camera":Landroidx/camera/core/impl/CameraInternal;
    invoke-virtual/range {p3 .. p3}, Landroidx/camera/core/impl/StreamSpec;->getResolution()Landroid/util/Size;

    move-result-object v5

    .line 591
    .local v5, "resolution":Landroid/util/Size;
    new-instance v1, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda3;

    invoke-direct {v1, v0}, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda3;-><init>(Landroidx/camera/video/VideoCapture;)V

    move-object v8, v1

    .line 597
    .local v8, "onSurfaceInvalidated":Ljava/lang/Runnable;
    invoke-virtual/range {p3 .. p3}, Landroidx/camera/core/impl/StreamSpec;->getExpectedFrameRateRange()Landroid/util/Range;

    move-result-object v1

    .line 598
    .local v1, "expectedFrameRate":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    sget-object v2, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    invoke-static {v1, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 599
    sget-object v1, Landroidx/camera/video/VideoCapture$Defaults;->DEFAULT_FPS_RANGE:Landroid/util/Range;

    move-object v6, v1

    goto :goto_0

    .line 598
    :cond_0
    move-object v6, v1

    .line 601
    .end local v1    # "expectedFrameRate":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .local v6, "expectedFrameRate":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    :goto_0
    invoke-direct {v0}, Landroidx/camera/video/VideoCapture;->getMediaSpec()Landroidx/camera/video/MediaSpec;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Landroidx/camera/video/MediaSpec;

    .line 602
    .local v4, "mediaSpec":Landroidx/camera/video/MediaSpec;
    invoke-interface {v7}, Landroidx/camera/core/impl/CameraInternal;->getCameraInfo()Landroidx/camera/core/CameraInfo;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/camera/video/VideoCapture;->getVideoCapabilities(Landroidx/camera/core/CameraInfo;)Landroidx/camera/video/VideoCapabilities;

    move-result-object v2

    .line 603
    .local v2, "videoCapabilities":Landroidx/camera/video/VideoCapabilities;
    invoke-virtual/range {p3 .. p3}, Landroidx/camera/core/impl/StreamSpec;->getDynamicRange()Landroidx/camera/core/DynamicRange;

    move-result-object v3

    .line 604
    .local v3, "dynamicRange":Landroidx/camera/core/DynamicRange;
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/video/impl/VideoCaptureConfig;->getVideoEncoderInfoFinder()Landroidx/arch/core/util/Function;

    move-result-object v1

    invoke-direct/range {v0 .. v6}, Landroidx/camera/video/VideoCapture;->getVideoEncoderInfo(Landroidx/arch/core/util/Function;Landroidx/camera/video/VideoCapabilities;Landroidx/camera/core/DynamicRange;Landroidx/camera/video/MediaSpec;Landroid/util/Size;Landroid/util/Range;)Landroidx/camera/video/internal/encoder/VideoEncoderInfo;

    move-result-object v9

    .line 606
    move-object v11, v2

    move-object v12, v3

    move-object v10, v4

    move-object v13, v6

    move-object v6, v5

    .line 607
    .end local v2    # "videoCapabilities":Landroidx/camera/video/VideoCapabilities;
    .end local v3    # "dynamicRange":Landroidx/camera/core/DynamicRange;
    .end local v4    # "mediaSpec":Landroidx/camera/video/MediaSpec;
    .end local v5    # "resolution":Landroid/util/Size;
    .local v6, "resolution":Landroid/util/Size;
    .local v9, "videoEncoderInfo":Landroidx/camera/video/internal/encoder/VideoEncoderInfo;
    .local v10, "mediaSpec":Landroidx/camera/video/MediaSpec;
    .local v11, "videoCapabilities":Landroidx/camera/video/VideoCapabilities;
    .local v12, "dynamicRange":Landroidx/camera/core/DynamicRange;
    .local v13, "expectedFrameRate":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-virtual {v0, v7}, Landroidx/camera/video/VideoCapture;->isMirroringRequired(Landroidx/camera/core/impl/CameraInternal;)Z

    move-result v1

    .line 606
    invoke-virtual {v0, v7, v1}, Landroidx/camera/video/VideoCapture;->getRelativeRotation(Landroidx/camera/core/impl/CameraInternal;Z)I

    move-result v1

    invoke-direct {v0, v1}, Landroidx/camera/video/VideoCapture;->adjustRotationWithInProgressTransformation(I)I

    move-result v1

    iput v1, v0, Landroidx/camera/video/VideoCapture;->mRotationDegrees:I

    .line 608
    invoke-direct {v0, v6, v9}, Landroidx/camera/video/VideoCapture;->calculateCropRect(Landroid/util/Size;Landroidx/camera/video/internal/encoder/VideoEncoderInfo;)Landroid/graphics/Rect;

    move-result-object v14

    .line 609
    .local v14, "originalCropRect":Landroid/graphics/Rect;
    iget v1, v0, Landroidx/camera/video/VideoCapture;->mRotationDegrees:I

    invoke-direct {v0, v14, v1}, Landroidx/camera/video/VideoCapture;->adjustCropRectWithInProgressTransformation(Landroid/graphics/Rect;I)Landroid/graphics/Rect;

    move-result-object v1

    iput-object v1, v0, Landroidx/camera/video/VideoCapture;->mCropRect:Landroid/graphics/Rect;

    .line 610
    iget-object v1, v0, Landroidx/camera/video/VideoCapture;->mCropRect:Landroid/graphics/Rect;

    invoke-direct {v0, v6, v14, v1}, Landroidx/camera/video/VideoCapture;->adjustResolutionWithInProgressTransformation(Landroid/util/Size;Landroid/graphics/Rect;Landroid/graphics/Rect;)Landroid/util/Size;

    move-result-object v15

    .line 612
    .local v15, "nodeResolution":Landroid/util/Size;
    invoke-direct {v0}, Landroidx/camera/video/VideoCapture;->shouldCompensateTransformation()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    .line 615
    iput-boolean v2, v0, Landroidx/camera/video/VideoCapture;->mHasCompensatingTransformation:Z

    .line 617
    :cond_1
    iget-object v1, v0, Landroidx/camera/video/VideoCapture;->mCropRect:Landroid/graphics/Rect;

    invoke-direct {v0, v7, v1, v6, v12}, Landroidx/camera/video/VideoCapture;->createNodeIfNeeded(Landroidx/camera/core/impl/CameraInternal;Landroid/graphics/Rect;Landroid/util/Size;Landroidx/camera/core/DynamicRange;)Landroidx/camera/core/processing/SurfaceProcessorNode;

    move-result-object v1

    iput-object v1, v0, Landroidx/camera/video/VideoCapture;->mNode:Landroidx/camera/core/processing/SurfaceProcessorNode;

    .line 620
    iget-object v1, v0, Landroidx/camera/video/VideoCapture;->mNode:Landroidx/camera/core/processing/SurfaceProcessorNode;

    if-nez v1, :cond_3

    invoke-interface {v7}, Landroidx/camera/core/impl/CameraInternal;->getHasTransform()Z

    move-result v1

    if-nez v1, :cond_2

    goto :goto_1

    .line 628
    :cond_2
    sget-object v1, Landroidx/camera/core/impl/Timebase;->UPTIME:Landroidx/camera/core/impl/Timebase;

    move-object v5, v1

    .local v1, "timebase":Landroidx/camera/core/impl/Timebase;
    goto :goto_2

    .line 621
    .end local v1    # "timebase":Landroidx/camera/core/impl/Timebase;
    :cond_3
    :goto_1
    invoke-interface {v7}, Landroidx/camera/core/impl/CameraInternal;->getCameraInfoInternal()Landroidx/camera/core/impl/CameraInfoInternal;

    move-result-object v1

    invoke-interface {v1}, Landroidx/camera/core/impl/CameraInfoInternal;->getTimebase()Landroidx/camera/core/impl/Timebase;

    move-result-object v1

    move-object v5, v1

    .line 630
    .local v5, "timebase":Landroidx/camera/core/impl/Timebase;
    :goto_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "camera timebase = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v7}, Landroidx/camera/core/impl/CameraInternal;->getCameraInfoInternal()Landroidx/camera/core/impl/CameraInfoInternal;

    move-result-object v3

    invoke-interface {v3}, Landroidx/camera/core/impl/CameraInfoInternal;->getTimebase()Landroidx/camera/core/impl/Timebase;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ", processing timebase = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v3, "VideoCapture"

    invoke-static {v3, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 633
    nop

    .line 634
    invoke-virtual/range {p3 .. p3}, Landroidx/camera/core/impl/StreamSpec;->toBuilder()Landroidx/camera/core/impl/StreamSpec$Builder;

    move-result-object v1

    .line 635
    invoke-virtual {v1, v15}, Landroidx/camera/core/impl/StreamSpec$Builder;->setResolution(Landroid/util/Size;)Landroidx/camera/core/impl/StreamSpec$Builder;

    move-result-object v1

    .line 636
    invoke-virtual {v1, v13}, Landroidx/camera/core/impl/StreamSpec$Builder;->setExpectedFrameRateRange(Landroid/util/Range;)Landroidx/camera/core/impl/StreamSpec$Builder;

    move-result-object v1

    .line 637
    invoke-virtual {v1}, Landroidx/camera/core/impl/StreamSpec$Builder;->build()Landroidx/camera/core/impl/StreamSpec;

    move-result-object v19

    .line 639
    .local v19, "updatedStreamSpec":Landroidx/camera/core/impl/StreamSpec;
    iget-object v1, v0, Landroidx/camera/video/VideoCapture;->mCameraEdge:Landroidx/camera/core/processing/SurfaceEdge;

    if-nez v1, :cond_4

    move v1, v2

    goto :goto_3

    :cond_4
    const/4 v1, 0x0

    :goto_3
    invoke-static {v1}, Landroidx/core/util/Preconditions;->checkState(Z)V

    .line 640
    new-instance v16, Landroidx/camera/core/processing/SurfaceEdge;

    .line 644
    invoke-virtual {v0}, Landroidx/camera/video/VideoCapture;->getSensorToBufferTransformMatrix()Landroid/graphics/Matrix;

    move-result-object v20

    .line 645
    invoke-interface {v7}, Landroidx/camera/core/impl/CameraInternal;->getHasTransform()Z

    move-result v21

    iget-object v1, v0, Landroidx/camera/video/VideoCapture;->mCropRect:Landroid/graphics/Rect;

    iget v3, v0, Landroidx/camera/video/VideoCapture;->mRotationDegrees:I

    .line 648
    invoke-virtual {v0}, Landroidx/camera/video/VideoCapture;->getAppTargetRotation()I

    move-result v24

    .line 649
    invoke-direct {v0, v7}, Landroidx/camera/video/VideoCapture;->shouldMirror(Landroidx/camera/core/impl/CameraInternal;)Z

    move-result v25

    const/16 v17, 0x2

    const/16 v18, 0x22

    move-object/from16 v22, v1

    move/from16 v23, v3

    invoke-direct/range {v16 .. v25}, Landroidx/camera/core/processing/SurfaceEdge;-><init>(IILandroidx/camera/core/impl/StreamSpec;Landroid/graphics/Matrix;ZLandroid/graphics/Rect;IIZ)V

    move-object/from16 v1, v16

    iput-object v1, v0, Landroidx/camera/video/VideoCapture;->mCameraEdge:Landroidx/camera/core/processing/SurfaceEdge;

    .line 650
    iget-object v1, v0, Landroidx/camera/video/VideoCapture;->mCameraEdge:Landroidx/camera/core/processing/SurfaceEdge;

    invoke-virtual {v1, v8}, Landroidx/camera/core/processing/SurfaceEdge;->addOnInvalidatedListener(Ljava/lang/Runnable;)V

    .line 651
    iget-object v1, v0, Landroidx/camera/video/VideoCapture;->mNode:Landroidx/camera/core/processing/SurfaceProcessorNode;

    .line 672
    iget-object v3, v0, Landroidx/camera/video/VideoCapture;->mCameraEdge:Landroidx/camera/core/processing/SurfaceEdge;

    .line 651
    if-eqz v1, :cond_5

    .line 652
    nop

    .line 653
    invoke-static {v3}, Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;->of(Landroidx/camera/core/processing/SurfaceEdge;)Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;

    move-result-object v1

    .line 654
    .local v1, "outConfig":Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;
    iget-object v3, v0, Landroidx/camera/video/VideoCapture;->mCameraEdge:Landroidx/camera/core/processing/SurfaceEdge;

    .line 656
    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    .line 654
    invoke-static {v3, v4}, Landroidx/camera/core/processing/SurfaceProcessorNode$In;->of(Landroidx/camera/core/processing/SurfaceEdge;Ljava/util/List;)Landroidx/camera/core/processing/SurfaceProcessorNode$In;

    move-result-object v3

    .line 657
    .local v3, "nodeInput":Landroidx/camera/core/processing/SurfaceProcessorNode$In;
    iget-object v4, v0, Landroidx/camera/video/VideoCapture;->mNode:Landroidx/camera/core/processing/SurfaceProcessorNode;

    invoke-virtual {v4, v3}, Landroidx/camera/core/processing/SurfaceProcessorNode;->transform(Landroidx/camera/core/processing/SurfaceProcessorNode$In;)Landroidx/camera/core/processing/SurfaceProcessorNode$Out;

    move-result-object v4

    .line 658
    .local v4, "nodeOutput":Landroidx/camera/core/processing/SurfaceProcessorNode$Out;
    invoke-virtual {v4, v1}, Landroidx/camera/core/processing/SurfaceProcessorNode$Out;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Landroidx/camera/core/processing/SurfaceEdge;

    invoke-static/range {v16 .. v16}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Landroidx/camera/core/processing/SurfaceEdge;

    .line 659
    .local v16, "appEdge":Landroidx/camera/core/processing/SurfaceEdge;
    new-instance v0, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda4;

    move-object/from16 v17, v4

    move-object/from16 v18, v6

    move-object/from16 v4, p2

    move v6, v2

    move-object/from16 v2, v16

    move-object/from16 v16, v3

    move-object v3, v7

    move-object v7, v1

    move-object/from16 v1, p0

    .end local v1    # "outConfig":Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;
    .end local v4    # "nodeOutput":Landroidx/camera/core/processing/SurfaceProcessorNode$Out;
    .end local v6    # "resolution":Landroid/util/Size;
    .local v2, "appEdge":Landroidx/camera/core/processing/SurfaceEdge;
    .local v3, "camera":Landroidx/camera/core/impl/CameraInternal;
    .local v7, "outConfig":Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;
    .local v16, "nodeInput":Landroidx/camera/core/processing/SurfaceProcessorNode$In;
    .local v17, "nodeOutput":Landroidx/camera/core/processing/SurfaceProcessorNode$Out;
    .local v18, "resolution":Landroid/util/Size;
    invoke-direct/range {v0 .. v5}, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda4;-><init>(Landroidx/camera/video/VideoCapture;Landroidx/camera/core/processing/SurfaceEdge;Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/video/impl/VideoCaptureConfig;Landroidx/camera/core/impl/Timebase;)V

    move-object/from16 v26, v3

    move-object v3, v0

    move-object v0, v1

    move-object/from16 v1, v26

    .end local v3    # "camera":Landroidx/camera/core/impl/CameraInternal;
    .local v1, "camera":Landroidx/camera/core/impl/CameraInternal;
    invoke-virtual {v2, v3}, Landroidx/camera/core/processing/SurfaceEdge;->addOnInvalidatedListener(Ljava/lang/Runnable;)V

    .line 661
    invoke-virtual {v2, v1}, Landroidx/camera/core/processing/SurfaceEdge;->createSurfaceRequest(Landroidx/camera/core/impl/CameraInternal;)Landroidx/camera/core/SurfaceRequest;

    move-result-object v3

    iput-object v3, v0, Landroidx/camera/video/VideoCapture;->mSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    .line 662
    iget-object v3, v0, Landroidx/camera/video/VideoCapture;->mCameraEdge:Landroidx/camera/core/processing/SurfaceEdge;

    invoke-virtual {v3}, Landroidx/camera/core/processing/SurfaceEdge;->getDeferrableSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v3

    iput-object v3, v0, Landroidx/camera/video/VideoCapture;->mDeferrableSurface:Landroidx/camera/core/impl/DeferrableSurface;

    .line 663
    iget-object v3, v0, Landroidx/camera/video/VideoCapture;->mDeferrableSurface:Landroidx/camera/core/impl/DeferrableSurface;

    .line 664
    .local v3, "latestDeferrableSurface":Landroidx/camera/core/impl/DeferrableSurface;
    iget-object v6, v0, Landroidx/camera/video/VideoCapture;->mDeferrableSurface:Landroidx/camera/core/impl/DeferrableSurface;

    invoke-virtual {v6}, Landroidx/camera/core/impl/DeferrableSurface;->getTerminationFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v6

    move-object/from16 v21, v2

    .end local v2    # "appEdge":Landroidx/camera/core/processing/SurfaceEdge;
    .local v21, "appEdge":Landroidx/camera/core/processing/SurfaceEdge;
    new-instance v2, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda5;

    invoke-direct {v2, v0, v3}, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda5;-><init>(Landroidx/camera/video/VideoCapture;Landroidx/camera/core/impl/DeferrableSurface;)V

    .line 670
    move-object/from16 v22, v3

    .end local v3    # "latestDeferrableSurface":Landroidx/camera/core/impl/DeferrableSurface;
    .local v22, "latestDeferrableSurface":Landroidx/camera/core/impl/DeferrableSurface;
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v3

    .line 664
    invoke-interface {v6, v2, v3}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 671
    .end local v7    # "outConfig":Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;
    .end local v16    # "nodeInput":Landroidx/camera/core/processing/SurfaceProcessorNode$In;
    .end local v17    # "nodeOutput":Landroidx/camera/core/processing/SurfaceProcessorNode$Out;
    .end local v21    # "appEdge":Landroidx/camera/core/processing/SurfaceEdge;
    .end local v22    # "latestDeferrableSurface":Landroidx/camera/core/impl/DeferrableSurface;
    goto :goto_4

    .line 672
    .end local v1    # "camera":Landroidx/camera/core/impl/CameraInternal;
    .end local v18    # "resolution":Landroid/util/Size;
    .restart local v6    # "resolution":Landroid/util/Size;
    .local v7, "camera":Landroidx/camera/core/impl/CameraInternal;
    :cond_5
    move-object/from16 v4, p2

    move-object/from16 v18, v6

    move-object v1, v7

    .end local v6    # "resolution":Landroid/util/Size;
    .end local v7    # "camera":Landroidx/camera/core/impl/CameraInternal;
    .restart local v1    # "camera":Landroidx/camera/core/impl/CameraInternal;
    .restart local v18    # "resolution":Landroid/util/Size;
    invoke-virtual {v3, v1}, Landroidx/camera/core/processing/SurfaceEdge;->createSurfaceRequest(Landroidx/camera/core/impl/CameraInternal;)Landroidx/camera/core/SurfaceRequest;

    move-result-object v2

    iput-object v2, v0, Landroidx/camera/video/VideoCapture;->mSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    .line 673
    iget-object v2, v0, Landroidx/camera/video/VideoCapture;->mSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    invoke-virtual {v2}, Landroidx/camera/core/SurfaceRequest;->getDeferrableSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v2

    iput-object v2, v0, Landroidx/camera/video/VideoCapture;->mDeferrableSurface:Landroidx/camera/core/impl/DeferrableSurface;

    .line 676
    :goto_4
    invoke-virtual {v4}, Landroidx/camera/video/impl/VideoCaptureConfig;->getVideoOutput()Landroidx/camera/video/VideoOutput;

    move-result-object v2

    iget-object v3, v0, Landroidx/camera/video/VideoCapture;->mSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    invoke-interface {v2, v3, v5}, Landroidx/camera/video/VideoOutput;->onSurfaceRequested(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;)V

    .line 677
    invoke-direct {v0}, Landroidx/camera/video/VideoCapture;->sendTransformationInfoIfReady()V

    .line 680
    iget-object v2, v0, Landroidx/camera/video/VideoCapture;->mDeferrableSurface:Landroidx/camera/core/impl/DeferrableSurface;

    const-class v3, Landroid/media/MediaCodec;

    invoke-virtual {v2, v3}, Landroidx/camera/core/impl/DeferrableSurface;->setContainerClass(Ljava/lang/Class;)V

    .line 682
    nop

    .line 683
    invoke-virtual/range {p3 .. p3}, Landroidx/camera/core/impl/StreamSpec;->getResolution()Landroid/util/Size;

    move-result-object v2

    .line 682
    invoke-static {v4, v2}, Landroidx/camera/core/impl/SessionConfig$Builder;->createFrom(Landroidx/camera/core/impl/UseCaseConfig;Landroid/util/Size;)Landroidx/camera/core/impl/SessionConfig$Builder;

    move-result-object v2

    .line 686
    .local v2, "sessionConfigBuilder":Landroidx/camera/core/impl/SessionConfig$Builder;
    invoke-virtual/range {p3 .. p3}, Landroidx/camera/core/impl/StreamSpec;->getExpectedFrameRateRange()Landroid/util/Range;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroidx/camera/core/impl/SessionConfig$Builder;->setExpectedFrameRateRange(Landroid/util/Range;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 687
    new-instance v3, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda6;

    move-object/from16 v6, p1

    move-object/from16 v7, p3

    invoke-direct {v3, v0, v6, v4, v7}, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda6;-><init>(Landroidx/camera/video/VideoCapture;Ljava/lang/String;Landroidx/camera/video/impl/VideoCaptureConfig;Landroidx/camera/core/impl/StreamSpec;)V

    invoke-virtual {v2, v3}, Landroidx/camera/core/impl/SessionConfig$Builder;->addErrorListener(Landroidx/camera/core/impl/SessionConfig$ErrorListener;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 689
    sget-boolean v3, Landroidx/camera/video/VideoCapture;->USE_TEMPLATE_PREVIEW_BY_QUIRK:Z

    if-eqz v3, :cond_6

    .line 690
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroidx/camera/core/impl/SessionConfig$Builder;->setTemplateType(I)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 692
    :cond_6
    invoke-virtual {v7}, Landroidx/camera/core/impl/StreamSpec;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v3

    if-eqz v3, :cond_7

    .line 693
    invoke-virtual {v7}, Landroidx/camera/core/impl/StreamSpec;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroidx/camera/core/impl/SessionConfig$Builder;->addImplementationOptions(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 696
    :cond_7
    return-object v2
.end method

.method private static fetchObservableValue(Landroidx/camera/core/impl/Observable;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroidx/camera/core/impl/Observable<",
            "TT;>;TT;)TT;"
        }
    .end annotation

    .line 1342
    .local p0, "observable":Landroidx/camera/core/impl/Observable;, "Landroidx/camera/core/impl/Observable<TT;>;"
    .local p1, "valueIfMissing":Ljava/lang/Object;, "TT;"
    invoke-interface {p0}, Landroidx/camera/core/impl/Observable;->fetchData()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 1343
    .local v0, "future":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<TT;>;"
    invoke-interface {v0}, Lcom/google/common/util/concurrent/ListenableFuture;->isDone()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1344
    return-object p1

    .line 1347
    :cond_0
    :try_start_0
    invoke-interface {v0}, Lcom/google/common/util/concurrent/ListenableFuture;->get()Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 1348
    :catch_0
    move-exception v1

    goto :goto_0

    :catch_1
    move-exception v1

    .line 1350
    .local v1, "e":Ljava/lang/Exception;
    :goto_0
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method private getMediaSpec()Landroidx/camera/video/MediaSpec;
    .locals 2

    .line 820
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->getOutput()Landroidx/camera/video/VideoOutput;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/video/VideoOutput;->getMediaSpec()Landroidx/camera/core/impl/Observable;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroidx/camera/video/VideoCapture;->fetchObservableValue(Landroidx/camera/core/impl/Observable;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/MediaSpec;

    return-object v0
.end method

.method private getVideoCapabilities(Landroidx/camera/core/CameraInfo;)Landroidx/camera/video/VideoCapabilities;
    .locals 1
    .param p1, "cameraInfo"    # Landroidx/camera/core/CameraInfo;

    .line 825
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->getOutput()Landroidx/camera/video/VideoOutput;

    move-result-object v0

    invoke-interface {v0, p1}, Landroidx/camera/video/VideoOutput;->getMediaCapabilities(Landroidx/camera/core/CameraInfo;)Landroidx/camera/video/VideoCapabilities;

    move-result-object v0

    return-object v0
.end method

.method private getVideoEncoderInfo(Landroidx/arch/core/util/Function;Landroidx/camera/video/VideoCapabilities;Landroidx/camera/core/DynamicRange;Landroidx/camera/video/MediaSpec;Landroid/util/Size;Landroid/util/Range;)Landroidx/camera/video/internal/encoder/VideoEncoderInfo;
    .locals 7
    .param p2, "videoCapabilities"    # Landroidx/camera/video/VideoCapabilities;
    .param p3, "dynamicRange"    # Landroidx/camera/core/DynamicRange;
    .param p4, "mediaSpec"    # Landroidx/camera/video/MediaSpec;
    .param p5, "resolution"    # Landroid/util/Size;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/arch/core/util/Function<",
            "Landroidx/camera/video/internal/encoder/VideoEncoderConfig;",
            "Landroidx/camera/video/internal/encoder/VideoEncoderInfo;",
            ">;",
            "Landroidx/camera/video/VideoCapabilities;",
            "Landroidx/camera/core/DynamicRange;",
            "Landroidx/camera/video/MediaSpec;",
            "Landroid/util/Size;",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)",
            "Landroidx/camera/video/internal/encoder/VideoEncoderInfo;"
        }
    .end annotation

    .line 1123
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    .local p1, "videoEncoderInfoFinder":Landroidx/arch/core/util/Function;, "Landroidx/arch/core/util/Function<Landroidx/camera/video/internal/encoder/VideoEncoderConfig;Landroidx/camera/video/internal/encoder/VideoEncoderInfo;>;"
    .local p6, "expectedFrameRate":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    iget-object v0, p0, Landroidx/camera/video/VideoCapture;->mVideoEncoderInfo:Landroidx/camera/video/internal/encoder/VideoEncoderInfo;

    if-eqz v0, :cond_0

    .line 1124
    iget-object v0, p0, Landroidx/camera/video/VideoCapture;->mVideoEncoderInfo:Landroidx/camera/video/internal/encoder/VideoEncoderInfo;

    return-object v0

    .line 1128
    :cond_0
    nop

    .line 1129
    invoke-interface {p2, p5, p3}, Landroidx/camera/video/VideoCapabilities;->findHighestSupportedEncoderProfilesFor(Landroid/util/Size;Landroidx/camera/core/DynamicRange;)Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    move-result-object v2

    .line 1130
    .local v2, "encoderProfiles":Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;
    move-object v1, p1

    move-object v5, p3

    move-object v3, p4

    move-object v4, p5

    move-object v6, p6

    .end local p1    # "videoEncoderInfoFinder":Landroidx/arch/core/util/Function;, "Landroidx/arch/core/util/Function<Landroidx/camera/video/internal/encoder/VideoEncoderConfig;Landroidx/camera/video/internal/encoder/VideoEncoderInfo;>;"
    .end local p3    # "dynamicRange":Landroidx/camera/core/DynamicRange;
    .end local p4    # "mediaSpec":Landroidx/camera/video/MediaSpec;
    .end local p5    # "resolution":Landroid/util/Size;
    .end local p6    # "expectedFrameRate":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .local v1, "videoEncoderInfoFinder":Landroidx/arch/core/util/Function;, "Landroidx/arch/core/util/Function<Landroidx/camera/video/internal/encoder/VideoEncoderConfig;Landroidx/camera/video/internal/encoder/VideoEncoderInfo;>;"
    .local v3, "mediaSpec":Landroidx/camera/video/MediaSpec;
    .local v4, "resolution":Landroid/util/Size;
    .local v5, "dynamicRange":Landroidx/camera/core/DynamicRange;
    .local v6, "expectedFrameRate":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-static/range {v1 .. v6}, Landroidx/camera/video/VideoCapture;->resolveVideoEncoderInfo(Landroidx/arch/core/util/Function;Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;Landroidx/camera/video/MediaSpec;Landroid/util/Size;Landroidx/camera/core/DynamicRange;Landroid/util/Range;)Landroidx/camera/video/internal/encoder/VideoEncoderInfo;

    move-result-object p1

    .line 1132
    .local p1, "videoEncoderInfo":Landroidx/camera/video/internal/encoder/VideoEncoderInfo;
    const/4 p3, 0x0

    if-nez p1, :cond_1

    .line 1136
    const-string/jumbo p4, "VideoCapture"

    const-string p5, "Can\'t find videoEncoderInfo"

    invoke-static {p4, p5}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1137
    return-object p3

    .line 1140
    :cond_1
    if-eqz v2, :cond_2

    new-instance p3, Landroid/util/Size;

    .line 1141
    invoke-virtual {v2}, Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;->getDefaultVideoProfile()Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    move-result-object p4

    invoke-virtual {p4}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getWidth()I

    move-result p4

    .line 1142
    invoke-virtual {v2}, Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;->getDefaultVideoProfile()Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    move-result-object p5

    invoke-virtual {p5}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getHeight()I

    move-result p5

    invoke-direct {p3, p4, p5}, Landroid/util/Size;-><init>(II)V

    goto :goto_0

    :cond_2
    nop

    .line 1143
    .local p3, "profileSize":Landroid/util/Size;
    :goto_0
    invoke-static {p1, p3}, Landroidx/camera/video/internal/workaround/VideoEncoderInfoWrapper;->from(Landroidx/camera/video/internal/encoder/VideoEncoderInfo;Landroid/util/Size;)Landroidx/camera/video/internal/encoder/VideoEncoderInfo;

    move-result-object p1

    .line 1150
    iput-object p1, p0, Landroidx/camera/video/VideoCapture;->mVideoEncoderInfo:Landroidx/camera/video/internal/encoder/VideoEncoderInfo;

    return-object p1
.end method

.method private static hasVideoQualityQuirkAndWorkaroundBySurfaceProcessing()Z
    .locals 4

    .line 1318
    const-class v0, Landroidx/camera/video/internal/compat/quirk/VideoQualityQuirk;

    invoke-static {v0}, Landroidx/camera/video/internal/compat/quirk/DeviceQuirks;->getAll(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    .line 1319
    .local v0, "quirks":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/video/internal/compat/quirk/VideoQualityQuirk;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/video/internal/compat/quirk/VideoQualityQuirk;

    .line 1320
    .local v2, "quirk":Landroidx/camera/video/internal/compat/quirk/VideoQualityQuirk;
    invoke-interface {v2}, Landroidx/camera/video/internal/compat/quirk/VideoQualityQuirk;->workaroundBySurfaceProcessing()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1321
    const/4 v1, 0x1

    return v1

    .line 1323
    .end local v2    # "quirk":Landroidx/camera/video/internal/compat/quirk/VideoQualityQuirk;
    :cond_0
    goto :goto_0

    .line 1324
    :cond_1
    const/4 v1, 0x0

    return v1
.end method

.method static synthetic lambda$adjustCropRectToValidSize$4(Landroid/graphics/Rect;Landroid/util/Size;Landroid/util/Size;)I
    .locals 4
    .param p0, "cropRect"    # Landroid/graphics/Rect;
    .param p1, "s1"    # Landroid/util/Size;
    .param p2, "s2"    # Landroid/util/Size;

    .line 990
    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    .line 991
    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v1

    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    move-result v2

    sub-int/2addr v1, v2

    .line 990
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    add-int/2addr v0, v1

    .line 992
    invoke-virtual {p2}, Landroid/util/Size;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    .line 993
    invoke-virtual {p2}, Landroid/util/Size;->getHeight()I

    move-result v2

    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    move-result v3

    sub-int/2addr v2, v3

    .line 992
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    add-int/2addr v1, v2

    sub-int/2addr v0, v1

    .line 990
    return v0
.end method

.method static synthetic lambda$createPipeline$0(Landroidx/camera/video/VideoCapture;)V
    .locals 0
    .param p0, "rec$"    # Landroidx/camera/video/VideoCapture;

    .line 591
    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->notifyReset()V

    return-void
.end method

.method static synthetic lambda$setupSurfaceUpdateNotifier$5(Ljava/util/concurrent/atomic/AtomicBoolean;Landroidx/camera/core/impl/SessionConfig$Builder;Landroidx/camera/core/impl/CameraCaptureCallback;)V
    .locals 2
    .param p0, "surfaceUpdateComplete"    # Ljava/util/concurrent/atomic/AtomicBoolean;
    .param p1, "sessionConfigBuilder"    # Landroidx/camera/core/impl/SessionConfig$Builder;
    .param p2, "cameraCaptureCallback"    # Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 1227
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->isMainThread()Z

    move-result v0

    const-string/jumbo v1, "Surface update cancellation should only occur on main thread."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 1229
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 1230
    invoke-virtual {p1, p2}, Landroidx/camera/core/impl/SessionConfig$Builder;->removeCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)Z

    .line 1231
    return-void
.end method

.method private onAppEdgeInvalidated(Landroidx/camera/core/processing/SurfaceEdge;Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/video/impl/VideoCaptureConfig;Landroidx/camera/core/impl/Timebase;)V
    .locals 2
    .param p1, "appEdge"    # Landroidx/camera/core/processing/SurfaceEdge;
    .param p2, "camera"    # Landroidx/camera/core/impl/CameraInternal;
    .param p4, "timebase"    # Landroidx/camera/core/impl/Timebase;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/processing/SurfaceEdge;",
            "Landroidx/camera/core/impl/CameraInternal;",
            "Landroidx/camera/video/impl/VideoCaptureConfig<",
            "TT;>;",
            "Landroidx/camera/core/impl/Timebase;",
            ")V"
        }
    .end annotation

    .line 701
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    .local p3, "config":Landroidx/camera/video/impl/VideoCaptureConfig;, "Landroidx/camera/video/impl/VideoCaptureConfig<TT;>;"
    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->getCamera()Landroidx/camera/core/impl/CameraInternal;

    move-result-object v0

    if-ne p2, v0, :cond_0

    .line 702
    invoke-virtual {p1, p2}, Landroidx/camera/core/processing/SurfaceEdge;->createSurfaceRequest(Landroidx/camera/core/impl/CameraInternal;)Landroidx/camera/core/SurfaceRequest;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/VideoCapture;->mSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    .line 703
    invoke-virtual {p3}, Landroidx/camera/video/impl/VideoCaptureConfig;->getVideoOutput()Landroidx/camera/video/VideoOutput;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/video/VideoCapture;->mSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    invoke-interface {v0, v1, p4}, Landroidx/camera/video/VideoOutput;->onSurfaceRequested(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;)V

    .line 704
    invoke-direct {p0}, Landroidx/camera/video/VideoCapture;->sendTransformationInfoIfReady()V

    .line 706
    :cond_0
    return-void
.end method

.method private static resolveVideoEncoderInfo(Landroidx/arch/core/util/Function;Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;Landroidx/camera/video/MediaSpec;Landroid/util/Size;Landroidx/camera/core/DynamicRange;Landroid/util/Range;)Landroidx/camera/video/internal/encoder/VideoEncoderInfo;
    .locals 6
    .param p1, "encoderProfiles"    # Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;
    .param p2, "mediaSpec"    # Landroidx/camera/video/MediaSpec;
    .param p3, "resolution"    # Landroid/util/Size;
    .param p4, "dynamicRange"    # Landroidx/camera/core/DynamicRange;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/arch/core/util/Function<",
            "Landroidx/camera/video/internal/encoder/VideoEncoderConfig;",
            "Landroidx/camera/video/internal/encoder/VideoEncoderInfo;",
            ">;",
            "Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;",
            "Landroidx/camera/video/MediaSpec;",
            "Landroid/util/Size;",
            "Landroidx/camera/core/DynamicRange;",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)",
            "Landroidx/camera/video/internal/encoder/VideoEncoderInfo;"
        }
    .end annotation

    .line 1162
    .local p0, "videoEncoderInfoFinder":Landroidx/arch/core/util/Function;, "Landroidx/arch/core/util/Function<Landroidx/camera/video/internal/encoder/VideoEncoderConfig;Landroidx/camera/video/internal/encoder/VideoEncoderInfo;>;"
    .local p5, "expectedFrameRate":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-static {p2, p4, p1}, Landroidx/camera/video/internal/config/VideoConfigUtil;->resolveVideoMimeInfo(Landroidx/camera/video/MediaSpec;Landroidx/camera/core/DynamicRange;Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;)Landroidx/camera/video/internal/config/VideoMimeInfo;

    move-result-object v0

    .line 1164
    .local v0, "videoMimeInfo":Landroidx/camera/video/internal/config/VideoMimeInfo;
    sget-object v1, Landroidx/camera/core/impl/Timebase;->UPTIME:Landroidx/camera/core/impl/Timebase;

    .line 1168
    invoke-virtual {p2}, Landroidx/camera/video/MediaSpec;->getVideoSpec()Landroidx/camera/video/VideoSpec;

    move-result-object v2

    .line 1164
    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    .end local p3    # "resolution":Landroid/util/Size;
    .end local p4    # "dynamicRange":Landroidx/camera/core/DynamicRange;
    .end local p5    # "expectedFrameRate":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .local v3, "resolution":Landroid/util/Size;
    .local v4, "dynamicRange":Landroidx/camera/core/DynamicRange;
    .local v5, "expectedFrameRate":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-static/range {v0 .. v5}, Landroidx/camera/video/internal/config/VideoConfigUtil;->resolveVideoEncoderConfig(Landroidx/camera/video/internal/config/VideoMimeInfo;Landroidx/camera/core/impl/Timebase;Landroidx/camera/video/VideoSpec;Landroid/util/Size;Landroidx/camera/core/DynamicRange;Landroid/util/Range;)Landroidx/camera/video/internal/encoder/VideoEncoderConfig;

    move-result-object p3

    .line 1173
    .local p3, "videoEncoderConfig":Landroidx/camera/video/internal/encoder/VideoEncoderConfig;
    invoke-interface {p0, p3}, Landroidx/arch/core/util/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Landroidx/camera/video/internal/encoder/VideoEncoderInfo;

    return-object p4
.end method

.method private sendTransformationInfoIfReady()V
    .locals 4

    .line 502
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->getCamera()Landroidx/camera/core/impl/CameraInternal;

    move-result-object v0

    .line 503
    .local v0, "cameraInternal":Landroidx/camera/core/impl/CameraInternal;
    iget-object v1, p0, Landroidx/camera/video/VideoCapture;->mCameraEdge:Landroidx/camera/core/processing/SurfaceEdge;

    .line 504
    .local v1, "cameraEdge":Landroidx/camera/core/processing/SurfaceEdge;
    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    .line 505
    nop

    .line 506
    invoke-virtual {p0, v0}, Landroidx/camera/video/VideoCapture;->isMirroringRequired(Landroidx/camera/core/impl/CameraInternal;)Z

    move-result v2

    invoke-virtual {p0, v0, v2}, Landroidx/camera/video/VideoCapture;->getRelativeRotation(Landroidx/camera/core/impl/CameraInternal;Z)I

    move-result v2

    .line 505
    invoke-direct {p0, v2}, Landroidx/camera/video/VideoCapture;->adjustRotationWithInProgressTransformation(I)I

    move-result v2

    iput v2, p0, Landroidx/camera/video/VideoCapture;->mRotationDegrees:I

    .line 507
    iget v2, p0, Landroidx/camera/video/VideoCapture;->mRotationDegrees:I

    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->getAppTargetRotation()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroidx/camera/core/processing/SurfaceEdge;->updateTransformation(II)V

    .line 509
    :cond_0
    return-void
.end method

.method private setupSurfaceUpdateNotifier(Landroidx/camera/core/impl/SessionConfig$Builder;Z)V
    .locals 3
    .param p1, "sessionConfigBuilder"    # Landroidx/camera/core/impl/SessionConfig$Builder;
    .param p2, "isStreamActive"    # Z

    .line 1179
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    iget-object v0, p0, Landroidx/camera/video/VideoCapture;->mSurfaceUpdateFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    if-eqz v0, :cond_0

    .line 1182
    iget-object v0, p0, Landroidx/camera/video/VideoCapture;->mSurfaceUpdateFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/google/common/util/concurrent/ListenableFuture;->cancel(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1183
    const-string/jumbo v0, "VideoCapture"

    const-string v1, "A newer surface update is requested. Previous surface update cancelled."

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1188
    :cond_0
    new-instance v0, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0, p1}, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/video/VideoCapture;Landroidx/camera/core/impl/SessionConfig$Builder;)V

    .line 1189
    invoke-static {v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/VideoCapture;->mSurfaceUpdateFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 1237
    .local v0, "surfaceUpdateFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;"
    new-instance v1, Landroidx/camera/video/VideoCapture$3;

    invoke-direct {v1, p0, v0, p2}, Landroidx/camera/video/VideoCapture$3;-><init>(Landroidx/camera/video/VideoCapture;Lcom/google/common/util/concurrent/ListenableFuture;Z)V

    .line 1257
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v2

    .line 1237
    invoke-static {v0, v1, v2}, Landroidx/camera/core/impl/utils/futures/Futures;->addCallback(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/camera/core/impl/utils/futures/FutureCallback;Ljava/util/concurrent/Executor;)V

    .line 1258
    return-void
.end method

.method private shouldCompensateTransformation()Z
    .locals 1

    .line 1075
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    iget-object v0, p0, Landroidx/camera/video/VideoCapture;->mStreamInfo:Landroidx/camera/video/StreamInfo;

    invoke-virtual {v0}, Landroidx/camera/video/StreamInfo;->getInProgressTransformationInfo()Landroidx/camera/core/SurfaceRequest$TransformationInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static shouldCrop(Landroid/graphics/Rect;Landroid/util/Size;)Z
    .locals 2
    .param p0, "cropRect"    # Landroid/graphics/Rect;
    .param p1, "resolution"    # Landroid/util/Size;

    .line 1079
    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    move-result v1

    if-ne v0, v1, :cond_1

    .line 1080
    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    move-result v1

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 1079
    :goto_1
    return v0
.end method

.method private static shouldEnableSurfaceProcessingByQuirk(Landroidx/camera/core/impl/CameraInternal;)Z
    .locals 1
    .param p0, "camera"    # Landroidx/camera/core/impl/CameraInternal;

    .line 1086
    invoke-interface {p0}, Landroidx/camera/core/impl/CameraInternal;->getHasTransform()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-boolean v0, Landroidx/camera/video/VideoCapture;->sEnableSurfaceProcessingByQuirk:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private shouldMirror(Landroidx/camera/core/impl/CameraInternal;)Z
    .locals 1
    .param p1, "camera"    # Landroidx/camera/core/impl/CameraInternal;

    .line 1071
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    invoke-interface {p1}, Landroidx/camera/core/impl/CameraInternal;->getHasTransform()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Landroidx/camera/video/VideoCapture;->isMirroringRequired(Landroidx/camera/core/impl/CameraInternal;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private updateCustomOrderedResolutionsByQuality(Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/camera/core/impl/UseCaseConfig$Builder;)V
    .locals 16
    .param p1, "cameraInfo"    # Landroidx/camera/core/impl/CameraInfoInternal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/CameraInfoInternal;",
            "Landroidx/camera/core/impl/UseCaseConfig$Builder<",
            "***>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 1269
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    .local p2, "builder":Landroidx/camera/core/impl/UseCaseConfig$Builder;, "Landroidx/camera/core/impl/UseCaseConfig$Builder<***>;"
    invoke-direct/range {p0 .. p0}, Landroidx/camera/video/VideoCapture;->getMediaSpec()Landroidx/camera/video/MediaSpec;

    move-result-object v0

    .line 1271
    .local v0, "mediaSpec":Landroidx/camera/video/MediaSpec;
    if-eqz v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    const-string/jumbo v2, "Unable to update target resolution by null MediaSpec."

    invoke-static {v1, v2}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 1274
    invoke-virtual/range {p0 .. p0}, Landroidx/camera/video/VideoCapture;->getDynamicRange()Landroidx/camera/core/DynamicRange;

    move-result-object v1

    .line 1275
    .local v1, "requestedDynamicRange":Landroidx/camera/core/DynamicRange;
    invoke-direct/range {p0 .. p1}, Landroidx/camera/video/VideoCapture;->getVideoCapabilities(Landroidx/camera/core/CameraInfo;)Landroidx/camera/video/VideoCapabilities;

    move-result-object v2

    .line 1278
    .local v2, "videoCapabilities":Landroidx/camera/video/VideoCapabilities;
    invoke-interface {v2, v1}, Landroidx/camera/video/VideoCapabilities;->getSupportedQualities(Landroidx/camera/core/DynamicRange;)Ljava/util/List;

    move-result-object v3

    .line 1280
    .local v3, "supportedQualities":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/video/Quality;>;"
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    const-string/jumbo v5, "VideoCapture"

    if-eqz v4, :cond_1

    .line 1286
    const-string v4, "Can\'t find any supported quality on the device."

    invoke-static {v5, v4}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1287
    return-void

    .line 1291
    :cond_1
    invoke-virtual {v0}, Landroidx/camera/video/MediaSpec;->getVideoSpec()Landroidx/camera/video/VideoSpec;

    move-result-object v4

    .line 1292
    .local v4, "videoSpec":Landroidx/camera/video/VideoSpec;
    invoke-virtual {v4}, Landroidx/camera/video/VideoSpec;->getQualitySelector()Landroidx/camera/video/QualitySelector;

    move-result-object v6

    .line 1293
    .local v6, "qualitySelector":Landroidx/camera/video/QualitySelector;
    invoke-virtual {v6, v3}, Landroidx/camera/video/QualitySelector;->getPrioritizedQualities(Ljava/util/List;)Ljava/util/List;

    move-result-object v7

    .line 1295
    .local v7, "selectedQualities":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/video/Quality;>;"
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Found selectedQualities "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " by "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v5, v8}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1296
    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_3

    .line 1302
    invoke-virtual {v4}, Landroidx/camera/video/VideoSpec;->getAspectRatio()I

    move-result v8

    .line 1303
    .local v8, "aspectRatio":I
    invoke-static {v2, v1}, Landroidx/camera/video/QualitySelector;->getQualityToResolutionMap(Landroidx/camera/video/VideoCapabilities;Landroidx/camera/core/DynamicRange;)Ljava/util/Map;

    move-result-object v9

    .line 1305
    .local v9, "sizeMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/video/Quality;Landroid/util/Size;>;"
    new-instance v10, Landroidx/camera/video/QualityRatioToResolutionsTable;

    .line 1306
    invoke-virtual/range {p0 .. p0}, Landroidx/camera/video/VideoCapture;->getImageFormat()I

    move-result v11

    move-object/from16 v12, p1

    invoke-interface {v12, v11}, Landroidx/camera/core/impl/CameraInfoInternal;->getSupportedResolutions(I)Ljava/util/List;

    move-result-object v11

    invoke-direct {v10, v11, v9}, Landroidx/camera/video/QualityRatioToResolutionsTable;-><init>(Ljava/util/List;Ljava/util/Map;)V

    .line 1307
    .local v10, "qualityRatioTable":Landroidx/camera/video/QualityRatioToResolutionsTable;
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 1308
    .local v11, "customOrderedResolutions":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_1
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_2

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroidx/camera/video/Quality;

    .line 1309
    .local v14, "selectedQuality":Landroidx/camera/video/Quality;
    nop

    .line 1310
    invoke-virtual {v10, v14, v8}, Landroidx/camera/video/QualityRatioToResolutionsTable;->getResolutions(Landroidx/camera/video/Quality;I)Ljava/util/List;

    move-result-object v15

    .line 1309
    invoke-interface {v11, v15}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1311
    .end local v14    # "selectedQuality":Landroidx/camera/video/Quality;
    goto :goto_1

    .line 1312
    :cond_2
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "Set custom ordered resolutions = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v5, v13}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1313
    invoke-interface/range {p2 .. p2}, Landroidx/camera/core/impl/UseCaseConfig$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v5

    sget-object v13, Landroidx/camera/core/impl/ImageOutputConfig;->OPTION_CUSTOM_ORDERED_RESOLUTIONS:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v5, v13, v11}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 1315
    return-void

    .line 1297
    .end local v8    # "aspectRatio":I
    .end local v9    # "sizeMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/video/Quality;Landroid/util/Size;>;"
    .end local v10    # "qualityRatioTable":Landroidx/camera/video/QualityRatioToResolutionsTable;
    .end local v11    # "customOrderedResolutions":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :cond_3
    move-object/from16 v12, p1

    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v8, "Unable to find supported quality by QualitySelector"

    invoke-direct {v5, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method public static withOutput(Landroidx/camera/video/VideoOutput;)Landroidx/camera/video/VideoCapture;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroidx/camera/video/VideoOutput;",
            ">(TT;)",
            "Landroidx/camera/video/VideoCapture<",
            "TT;>;"
        }
    .end annotation

    .line 226
    .local p0, "videoOutput":Landroidx/camera/video/VideoOutput;, "TT;"
    new-instance v0, Landroidx/camera/video/VideoCapture$Builder;

    invoke-static {p0}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/video/VideoOutput;

    invoke-direct {v0, v1}, Landroidx/camera/video/VideoCapture$Builder;-><init>(Landroidx/camera/video/VideoOutput;)V

    sget-object v1, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->VIDEO_CAPTURE:Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    invoke-virtual {v0, v1}, Landroidx/camera/video/VideoCapture$Builder;->setCaptureType(Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;)Landroidx/camera/video/VideoCapture$Builder;

    move-result-object v0

    .line 227
    invoke-virtual {v0}, Landroidx/camera/video/VideoCapture$Builder;->build()Landroidx/camera/video/VideoCapture;

    move-result-object v0

    .line 226
    return-object v0
.end method


# virtual methods
.method applyStreamInfoAndStreamSpecToSessionConfigBuilder(Landroidx/camera/core/impl/SessionConfig$Builder;Landroidx/camera/video/StreamInfo;Landroidx/camera/core/impl/StreamSpec;)V
    .locals 5
    .param p1, "sessionConfigBuilder"    # Landroidx/camera/core/impl/SessionConfig$Builder;
    .param p2, "streamInfo"    # Landroidx/camera/video/StreamInfo;
    .param p3, "streamSpec"    # Landroidx/camera/core/impl/StreamSpec;

    .line 888
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    invoke-virtual {p2}, Landroidx/camera/video/StreamInfo;->getId()I

    move-result v0

    const/4 v1, -0x1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v0, v1, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v3

    .line 889
    .local v0, "isStreamError":Z
    :goto_0
    invoke-virtual {p2}, Landroidx/camera/video/StreamInfo;->getStreamState()Landroidx/camera/video/StreamInfo$StreamState;

    move-result-object v1

    sget-object v4, Landroidx/camera/video/StreamInfo$StreamState;->ACTIVE:Landroidx/camera/video/StreamInfo$StreamState;

    if-ne v1, v4, :cond_1

    goto :goto_1

    :cond_1
    move v2, v3

    .line 890
    .local v2, "isStreamActive":Z
    :goto_1
    if-eqz v0, :cond_3

    if-nez v2, :cond_2

    goto :goto_2

    .line 891
    :cond_2
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v3, "Unexpected stream state, stream is error but active"

    invoke-direct {v1, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 895
    :cond_3
    :goto_2
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig$Builder;->clearSurfaces()Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 896
    invoke-virtual {p3}, Landroidx/camera/core/impl/StreamSpec;->getDynamicRange()Landroidx/camera/core/DynamicRange;

    move-result-object v1

    .line 897
    .local v1, "dynamicRange":Landroidx/camera/core/DynamicRange;
    if-nez v0, :cond_5

    .line 898
    nop

    .line 901
    iget-object v3, p0, Landroidx/camera/video/VideoCapture;->mDeferrableSurface:Landroidx/camera/core/impl/DeferrableSurface;

    .line 898
    if-eqz v2, :cond_4

    .line 899
    invoke-virtual {p1, v3, v1}, Landroidx/camera/core/impl/SessionConfig$Builder;->addSurface(Landroidx/camera/core/impl/DeferrableSurface;Landroidx/camera/core/DynamicRange;)Landroidx/camera/core/impl/SessionConfig$Builder;

    goto :goto_3

    .line 901
    :cond_4
    invoke-virtual {p1, v3, v1}, Landroidx/camera/core/impl/SessionConfig$Builder;->addNonRepeatingSurface(Landroidx/camera/core/impl/DeferrableSurface;Landroidx/camera/core/DynamicRange;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 905
    :cond_5
    :goto_3
    invoke-direct {p0, p1, v2}, Landroidx/camera/video/VideoCapture;->setupSurfaceUpdateNotifier(Landroidx/camera/core/impl/SessionConfig$Builder;Z)V

    .line 906
    return-void
.end method

.method getCameraEdge()Landroidx/camera/core/processing/SurfaceEdge;
    .locals 1

    .line 761
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    iget-object v0, p0, Landroidx/camera/video/VideoCapture;->mCameraEdge:Landroidx/camera/core/processing/SurfaceEdge;

    return-object v0
.end method

.method getCropRect()Landroid/graphics/Rect;
    .locals 1

    .line 548
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    iget-object v0, p0, Landroidx/camera/video/VideoCapture;->mCropRect:Landroid/graphics/Rect;

    return-object v0
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

    .line 465
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    sget-object v0, Landroidx/camera/video/VideoCapture;->DEFAULT_CONFIG:Landroidx/camera/video/VideoCapture$Defaults;

    .line 466
    invoke-virtual {v0}, Landroidx/camera/video/VideoCapture$Defaults;->getConfig()Landroidx/camera/video/impl/VideoCaptureConfig;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/video/impl/VideoCaptureConfig;->getCaptureType()Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    move-result-object v0

    .line 465
    const/4 v1, 0x1

    invoke-interface {p2, v0, v1}, Landroidx/camera/core/impl/UseCaseConfigFactory;->getConfig(Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;I)Landroidx/camera/core/impl/Config;

    move-result-object v0

    .line 469
    .local v0, "captureConfig":Landroidx/camera/core/impl/Config;
    if-eqz p1, :cond_0

    .line 470
    sget-object v1, Landroidx/camera/video/VideoCapture;->DEFAULT_CONFIG:Landroidx/camera/video/VideoCapture$Defaults;

    invoke-virtual {v1}, Landroidx/camera/video/VideoCapture$Defaults;->getConfig()Landroidx/camera/video/impl/VideoCaptureConfig;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/camera/core/impl/Config;->mergeConfigs(Landroidx/camera/core/impl/Config;Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/Config;

    move-result-object v0

    .line 473
    :cond_0
    if-nez v0, :cond_1

    const/4 v1, 0x0

    goto :goto_0

    .line 474
    :cond_1
    invoke-virtual {p0, v0}, Landroidx/camera/video/VideoCapture;->getUseCaseConfigBuilder(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/UseCaseConfig$Builder;

    move-result-object v1

    invoke-interface {v1}, Landroidx/camera/core/impl/UseCaseConfig$Builder;->getUseCaseConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v1

    .line 473
    :goto_0
    return-object v1
.end method

.method public getDynamicRange()Landroidx/camera/core/DynamicRange;
    .locals 1

    .line 378
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->getCurrentConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/impl/UseCaseConfig;->hasDynamicRange()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->getCurrentConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/impl/UseCaseConfig;->getDynamicRange()Landroidx/camera/core/DynamicRange;

    move-result-object v0

    goto :goto_0

    .line 379
    :cond_0
    sget-object v0, Landroidx/camera/video/VideoCapture$Defaults;->DEFAULT_DYNAMIC_RANGE:Landroidx/camera/core/DynamicRange;

    .line 378
    :goto_0
    return-object v0
.end method

.method public getMirrorMode()I
    .locals 1

    .line 339
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->getMirrorModeInternal()I

    move-result v0

    return v0
.end method

.method getNode()Landroidx/camera/core/processing/SurfaceProcessorNode;
    .locals 1

    .line 929
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    iget-object v0, p0, Landroidx/camera/video/VideoCapture;->mNode:Landroidx/camera/core/processing/SurfaceProcessorNode;

    return-object v0
.end method

.method public getOutput()Landroidx/camera/video/VideoOutput;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 248
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->getCurrentConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/impl/VideoCaptureConfig;

    invoke-virtual {v0}, Landroidx/camera/video/impl/VideoCaptureConfig;->getVideoOutput()Landroidx/camera/video/VideoOutput;

    move-result-object v0

    return-object v0
.end method

.method getRotationDegrees()I
    .locals 1

    .line 553
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    iget v0, p0, Landroidx/camera/video/VideoCapture;->mRotationDegrees:I

    return v0
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

    .line 1377
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 1378
    .local v0, "targets":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1379
    return-object v0
.end method

.method getSurfaceRequest()Landroidx/camera/core/SurfaceRequest;
    .locals 1

    .line 1367
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    iget-object v0, p0, Landroidx/camera/video/VideoCapture;->mSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/SurfaceRequest;

    return-object v0
.end method

.method public getTargetFrameRate()Landroid/util/Range;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 281
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->getTargetFrameRateInternal()Landroid/util/Range;

    move-result-object v0

    return-object v0
.end method

.method public getTargetRotation()I
    .locals 1

    .line 265
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->getTargetRotationInternal()I

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

    .line 498
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    invoke-static {p1}, Landroidx/camera/video/VideoCapture$Builder;->fromConfig(Landroidx/camera/core/impl/Config;)Landroidx/camera/video/VideoCapture$Builder;

    move-result-object v0

    return-object v0
.end method

.method isStreamIdChanged(II)Z
    .locals 2
    .param p1, "currentId"    # I
    .param p2, "newId"    # I

    .line 1055
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    sget-object v0, Landroidx/camera/video/StreamInfo;->NON_SURFACE_STREAM_ID:Ljava/util/Set;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Landroidx/camera/video/StreamInfo;->NON_SURFACE_STREAM_ID:Ljava/util/Set;

    .line 1056
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    if-eq p1, p2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1055
    :goto_0
    return v0
.end method

.method synthetic lambda$createPipeline$1$androidx-camera-video-VideoCapture(Landroidx/camera/core/processing/SurfaceEdge;Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/video/impl/VideoCaptureConfig;Landroidx/camera/core/impl/Timebase;)V
    .locals 0
    .param p1, "appEdge"    # Landroidx/camera/core/processing/SurfaceEdge;
    .param p2, "camera"    # Landroidx/camera/core/impl/CameraInternal;
    .param p3, "config"    # Landroidx/camera/video/impl/VideoCaptureConfig;
    .param p4, "timebase"    # Landroidx/camera/core/impl/Timebase;

    .line 660
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/camera/video/VideoCapture;->onAppEdgeInvalidated(Landroidx/camera/core/processing/SurfaceEdge;Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/video/impl/VideoCaptureConfig;Landroidx/camera/core/impl/Timebase;)V

    return-void
.end method

.method synthetic lambda$createPipeline$2$androidx-camera-video-VideoCapture(Landroidx/camera/core/impl/DeferrableSurface;)V
    .locals 1
    .param p1, "latestDeferrableSurface"    # Landroidx/camera/core/impl/DeferrableSurface;

    .line 667
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    iget-object v0, p0, Landroidx/camera/video/VideoCapture;->mDeferrableSurface:Landroidx/camera/core/impl/DeferrableSurface;

    if-ne p1, v0, :cond_0

    .line 668
    invoke-direct {p0}, Landroidx/camera/video/VideoCapture;->clearPipeline()V

    .line 670
    :cond_0
    return-void
.end method

.method synthetic lambda$createPipeline$3$androidx-camera-video-VideoCapture(Ljava/lang/String;Landroidx/camera/video/impl/VideoCaptureConfig;Landroidx/camera/core/impl/StreamSpec;Landroidx/camera/core/impl/SessionConfig;Landroidx/camera/core/impl/SessionConfig$SessionError;)V
    .locals 0
    .param p1, "cameraId"    # Ljava/lang/String;
    .param p2, "config"    # Landroidx/camera/video/impl/VideoCaptureConfig;
    .param p3, "streamSpec"    # Landroidx/camera/core/impl/StreamSpec;
    .param p4, "sessionConfig"    # Landroidx/camera/core/impl/SessionConfig;
    .param p5, "error"    # Landroidx/camera/core/impl/SessionConfig$SessionError;

    .line 688
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    invoke-virtual {p0, p1, p2, p3}, Landroidx/camera/video/VideoCapture;->resetPipeline(Ljava/lang/String;Landroidx/camera/video/impl/VideoCaptureConfig;Landroidx/camera/core/impl/StreamSpec;)V

    return-void
.end method

.method synthetic lambda$setupSurfaceUpdateNotifier$6$androidx-camera-video-VideoCapture(Landroidx/camera/core/impl/SessionConfig$Builder;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 5
    .param p1, "sessionConfigBuilder"    # Landroidx/camera/core/impl/SessionConfig$Builder;
    .param p2, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1191
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    invoke-virtual {p2}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string/jumbo v1, "androidx.camera.video.VideoCapture.streamUpdate"

    invoke-virtual {p1, v1, v0}, Landroidx/camera/core/impl/SessionConfig$Builder;->addTag(Ljava/lang/String;Ljava/lang/Object;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 1192
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x0

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 1193
    .local v0, "surfaceUpdateComplete":Ljava/util/concurrent/atomic/AtomicBoolean;
    new-instance v2, Landroidx/camera/video/VideoCapture$2;

    invoke-direct {v2, p0, v0, p2, p1}, Landroidx/camera/video/VideoCapture$2;-><init>(Landroidx/camera/video/VideoCapture;Ljava/util/concurrent/atomic/AtomicBoolean;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;Landroidx/camera/core/impl/SessionConfig$Builder;)V

    .line 1226
    .local v2, "cameraCaptureCallback":Landroidx/camera/core/impl/CameraCaptureCallback;
    new-instance v3, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda0;

    invoke-direct {v3, v0, p1, v2}, Landroidx/camera/video/VideoCapture$$ExternalSyntheticLambda0;-><init>(Ljava/util/concurrent/atomic/AtomicBoolean;Landroidx/camera/core/impl/SessionConfig$Builder;Landroidx/camera/core/impl/CameraCaptureCallback;)V

    .line 1231
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v4

    .line 1226
    invoke-virtual {p2, v3, v4}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->addCancellationListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 1232
    invoke-virtual {p1, v2}, Landroidx/camera/core/impl/SessionConfig$Builder;->addRepeatingCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 1234
    invoke-virtual {p2}, Ljava/lang/Object;->hashCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v1, v3}, [Ljava/lang/Object;

    move-result-object v1

    const-string v3, "%s[0x%x]"

    invoke-static {v3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method protected onMergeConfig(Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/camera/core/impl/UseCaseConfig$Builder;)Landroidx/camera/core/impl/UseCaseConfig;
    .locals 1
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

    .line 486
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    .local p2, "builder":Landroidx/camera/core/impl/UseCaseConfig$Builder;, "Landroidx/camera/core/impl/UseCaseConfig$Builder<***>;"
    invoke-direct {p0, p1, p2}, Landroidx/camera/video/VideoCapture;->updateCustomOrderedResolutionsByQuality(Landroidx/camera/core/impl/CameraInfoInternal;Landroidx/camera/core/impl/UseCaseConfig$Builder;)V

    .line 488
    invoke-interface {p2}, Landroidx/camera/core/impl/UseCaseConfig$Builder;->getUseCaseConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v0

    return-object v0
.end method

.method public onStateAttached()V
    .locals 4

    .line 389
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    invoke-super {p0}, Landroidx/camera/core/UseCase;->onStateAttached()V

    .line 390
    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->getAttachedStreamSpec()Landroidx/camera/core/impl/StreamSpec;

    move-result-object v0

    const-string/jumbo v1, "The suggested stream specification should be already updated and shouldn\'t be null."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 392
    iget-object v0, p0, Landroidx/camera/video/VideoCapture;->mSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string/jumbo v1, "The surface request should be null when VideoCapture is attached."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 394
    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->getAttachedStreamSpec()Landroidx/camera/core/impl/StreamSpec;

    move-result-object v0

    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/StreamSpec;

    .line 395
    .local v0, "attachedStreamSpec":Landroidx/camera/core/impl/StreamSpec;
    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->getOutput()Landroidx/camera/video/VideoOutput;

    move-result-object v1

    invoke-interface {v1}, Landroidx/camera/video/VideoOutput;->getStreamInfo()Landroidx/camera/core/impl/Observable;

    move-result-object v1

    sget-object v2, Landroidx/camera/video/StreamInfo;->STREAM_INFO_ANY_INACTIVE:Landroidx/camera/video/StreamInfo;

    invoke-static {v1, v2}, Landroidx/camera/video/VideoCapture;->fetchObservableValue(Landroidx/camera/core/impl/Observable;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/video/StreamInfo;

    iput-object v1, p0, Landroidx/camera/video/VideoCapture;->mStreamInfo:Landroidx/camera/video/StreamInfo;

    .line 397
    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->getCameraId()Ljava/lang/String;

    move-result-object v1

    .line 398
    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->getCurrentConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v2

    check-cast v2, Landroidx/camera/video/impl/VideoCaptureConfig;

    .line 397
    invoke-direct {p0, v1, v2, v0}, Landroidx/camera/video/VideoCapture;->createPipeline(Ljava/lang/String;Landroidx/camera/video/impl/VideoCaptureConfig;Landroidx/camera/core/impl/StreamSpec;)Landroidx/camera/core/impl/SessionConfig$Builder;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/video/VideoCapture;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 399
    iget-object v1, p0, Landroidx/camera/video/VideoCapture;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    iget-object v2, p0, Landroidx/camera/video/VideoCapture;->mStreamInfo:Landroidx/camera/video/StreamInfo;

    invoke-virtual {p0, v1, v2, v0}, Landroidx/camera/video/VideoCapture;->applyStreamInfoAndStreamSpecToSessionConfigBuilder(Landroidx/camera/core/impl/SessionConfig$Builder;Landroidx/camera/video/StreamInfo;Landroidx/camera/core/impl/StreamSpec;)V

    .line 401
    iget-object v1, p0, Landroidx/camera/video/VideoCapture;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    invoke-virtual {v1}, Landroidx/camera/core/impl/SessionConfig$Builder;->build()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroidx/camera/video/VideoCapture;->updateSessionConfig(Landroidx/camera/core/impl/SessionConfig;)V

    .line 403
    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->notifyActive()V

    .line 404
    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->getOutput()Landroidx/camera/video/VideoOutput;

    move-result-object v1

    invoke-interface {v1}, Landroidx/camera/video/VideoOutput;->getStreamInfo()Landroidx/camera/core/impl/Observable;

    move-result-object v1

    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/video/VideoCapture;->mStreamInfoObserver:Landroidx/camera/core/impl/Observable$Observer;

    invoke-interface {v1, v2, v3}, Landroidx/camera/core/impl/Observable;->addObserver(Ljava/util/concurrent/Executor;Landroidx/camera/core/impl/Observable$Observer;)V

    .line 406
    sget-object v1, Landroidx/camera/video/VideoOutput$SourceState;->ACTIVE_NON_STREAMING:Landroidx/camera/video/VideoOutput$SourceState;

    invoke-virtual {p0, v1}, Landroidx/camera/video/VideoCapture;->setSourceState(Landroidx/camera/video/VideoOutput$SourceState;)V

    .line 407
    return-void
.end method

.method public onStateDetached()V
    .locals 2

    .line 425
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->isMainThread()Z

    move-result v0

    const-string/jumbo v1, "VideoCapture can only be detached on the main thread."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 426
    sget-object v0, Landroidx/camera/video/VideoOutput$SourceState;->INACTIVE:Landroidx/camera/video/VideoOutput$SourceState;

    invoke-virtual {p0, v0}, Landroidx/camera/video/VideoCapture;->setSourceState(Landroidx/camera/video/VideoOutput$SourceState;)V

    .line 427
    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->getOutput()Landroidx/camera/video/VideoOutput;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/video/VideoOutput;->getStreamInfo()Landroidx/camera/core/impl/Observable;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/video/VideoCapture;->mStreamInfoObserver:Landroidx/camera/core/impl/Observable$Observer;

    invoke-interface {v0, v1}, Landroidx/camera/core/impl/Observable;->removeObserver(Landroidx/camera/core/impl/Observable$Observer;)V

    .line 428
    iget-object v0, p0, Landroidx/camera/video/VideoCapture;->mSurfaceUpdateFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    if-eqz v0, :cond_0

    .line 429
    iget-object v0, p0, Landroidx/camera/video/VideoCapture;->mSurfaceUpdateFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/google/common/util/concurrent/ListenableFuture;->cancel(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 430
    const-string/jumbo v0, "VideoCapture"

    const-string/jumbo v1, "VideoCapture is detached from the camera. Surface update cancelled."

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 436
    :cond_0
    invoke-direct {p0}, Landroidx/camera/video/VideoCapture;->clearPipeline()V

    .line 437
    return-void
.end method

.method protected onSuggestedStreamSpecImplementationOptionsUpdated(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/StreamSpec;
    .locals 1
    .param p1, "config"    # Landroidx/camera/core/impl/Config;

    .line 446
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    iget-object v0, p0, Landroidx/camera/video/VideoCapture;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    invoke-virtual {v0, p1}, Landroidx/camera/core/impl/SessionConfig$Builder;->addImplementationOptions(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 447
    iget-object v0, p0, Landroidx/camera/video/VideoCapture;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    invoke-virtual {v0}, Landroidx/camera/core/impl/SessionConfig$Builder;->build()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/camera/video/VideoCapture;->updateSessionConfig(Landroidx/camera/core/impl/SessionConfig;)V

    .line 448
    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->getAttachedStreamSpec()Landroidx/camera/core/impl/StreamSpec;

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
    .locals 5
    .param p1, "suggestedStreamSpec"    # Landroidx/camera/core/impl/StreamSpec;

    .line 347
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "onSuggestedStreamSpecUpdated: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "VideoCapture"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 348
    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->getCurrentConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/impl/VideoCaptureConfig;

    .line 349
    .local v0, "config":Landroidx/camera/video/impl/VideoCaptureConfig;, "Landroidx/camera/video/impl/VideoCaptureConfig<TT;>;"
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroidx/camera/video/impl/VideoCaptureConfig;->getCustomOrderedResolutions(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    .line 350
    .local v2, "customOrderedResolutions":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    if-eqz v2, :cond_0

    .line 351
    invoke-virtual {p1}, Landroidx/camera/core/impl/StreamSpec;->getResolution()Landroid/util/Size;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 352
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "suggested resolution "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Landroidx/camera/core/impl/StreamSpec;->getResolution()Landroid/util/Size;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " is not in custom ordered resolutions "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 355
    :cond_0
    return-object p1
.end method

.method resetPipeline(Ljava/lang/String;Landroidx/camera/video/impl/VideoCaptureConfig;Landroidx/camera/core/impl/StreamSpec;)V
    .locals 2
    .param p1, "cameraId"    # Ljava/lang/String;
    .param p3, "streamSpec"    # Landroidx/camera/core/impl/StreamSpec;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroidx/camera/video/impl/VideoCaptureConfig<",
            "TT;>;",
            "Landroidx/camera/core/impl/StreamSpec;",
            ")V"
        }
    .end annotation

    .line 740
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    .local p2, "config":Landroidx/camera/video/impl/VideoCaptureConfig;, "Landroidx/camera/video/impl/VideoCaptureConfig<TT;>;"
    invoke-direct {p0}, Landroidx/camera/video/VideoCapture;->clearPipeline()V

    .line 745
    invoke-virtual {p0, p1}, Landroidx/camera/video/VideoCapture;->isCurrentCamera(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 747
    invoke-direct {p0, p1, p2, p3}, Landroidx/camera/video/VideoCapture;->createPipeline(Ljava/lang/String;Landroidx/camera/video/impl/VideoCaptureConfig;Landroidx/camera/core/impl/StreamSpec;)Landroidx/camera/core/impl/SessionConfig$Builder;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/VideoCapture;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 748
    iget-object v0, p0, Landroidx/camera/video/VideoCapture;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    iget-object v1, p0, Landroidx/camera/video/VideoCapture;->mStreamInfo:Landroidx/camera/video/StreamInfo;

    invoke-virtual {p0, v0, v1, p3}, Landroidx/camera/video/VideoCapture;->applyStreamInfoAndStreamSpecToSessionConfigBuilder(Landroidx/camera/core/impl/SessionConfig$Builder;Landroidx/camera/video/StreamInfo;Landroidx/camera/core/impl/StreamSpec;)V

    .line 750
    iget-object v0, p0, Landroidx/camera/video/VideoCapture;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    invoke-virtual {v0}, Landroidx/camera/core/impl/SessionConfig$Builder;->build()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/camera/video/VideoCapture;->updateSessionConfig(Landroidx/camera/core/impl/SessionConfig;)V

    .line 751
    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->notifyReset()V

    .line 753
    :cond_0
    return-void
.end method

.method setSourceState(Landroidx/camera/video/VideoOutput$SourceState;)V
    .locals 2
    .param p1, "newState"    # Landroidx/camera/video/VideoOutput$SourceState;

    .line 1357
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    iget-object v0, p0, Landroidx/camera/video/VideoCapture;->mSourceState:Landroidx/camera/video/VideoOutput$SourceState;

    .line 1358
    .local v0, "oldState":Landroidx/camera/video/VideoOutput$SourceState;
    if-eq p1, v0, :cond_0

    .line 1359
    iput-object p1, p0, Landroidx/camera/video/VideoCapture;->mSourceState:Landroidx/camera/video/VideoOutput$SourceState;

    .line 1360
    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->getOutput()Landroidx/camera/video/VideoOutput;

    move-result-object v1

    invoke-interface {v1, p1}, Landroidx/camera/video/VideoOutput;->onSourceStateChanged(Landroidx/camera/video/VideoOutput$SourceState;)V

    .line 1362
    :cond_0
    return-void
.end method

.method public setTargetRotation(I)V
    .locals 1
    .param p1, "rotation"    # I

    .line 324
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    invoke-virtual {p0, p1}, Landroidx/camera/video/VideoCapture;->setTargetRotationInternal(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 325
    invoke-direct {p0}, Landroidx/camera/video/VideoCapture;->sendTransformationInfoIfReady()V

    .line 327
    :cond_0
    return-void
.end method

.method public setViewPortCropRect(Landroid/graphics/Rect;)V
    .locals 0
    .param p1, "viewPortCropRect"    # Landroid/graphics/Rect;

    .line 415
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    invoke-super {p0, p1}, Landroidx/camera/core/UseCase;->setViewPortCropRect(Landroid/graphics/Rect;)V

    .line 416
    invoke-direct {p0}, Landroidx/camera/video/VideoCapture;->sendTransformationInfoIfReady()V

    .line 417
    return-void
.end method

.method shouldResetCompensatingTransformation(Landroidx/camera/video/StreamInfo;Landroidx/camera/video/StreamInfo;)Z
    .locals 1
    .param p1, "currentStreamInfo"    # Landroidx/camera/video/StreamInfo;
    .param p2, "streamInfo"    # Landroidx/camera/video/StreamInfo;

    .line 1063
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    iget-boolean v0, p0, Landroidx/camera/video/VideoCapture;->mHasCompensatingTransformation:Z

    if-eqz v0, :cond_0

    .line 1064
    invoke-virtual {p1}, Landroidx/camera/video/StreamInfo;->getInProgressTransformationInfo()Landroidx/camera/core/SurfaceRequest$TransformationInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1065
    invoke-virtual {p2}, Landroidx/camera/video/StreamInfo;->getInProgressTransformationInfo()Landroidx/camera/core/SurfaceRequest$TransformationInfo;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1063
    :goto_0
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 454
    .local p0, "this":Landroidx/camera/video/VideoCapture;, "Landroidx/camera/video/VideoCapture<TT;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "VideoCapture:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/camera/video/VideoCapture;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
