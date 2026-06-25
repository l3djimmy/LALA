.class final Landroidx/camera/camera2/internal/SupportedSurfaceCombination;
.super Ljava/lang/Object;
.source "SupportedSurfaceCombination.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;,
        Landroidx/camera/camera2/internal/SupportedSurfaceCombination$Api23Impl;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "SupportedSurfaceCombination"


# instance fields
.field private final mCamcorderProfileHelper:Landroidx/camera/camera2/internal/CamcorderProfileHelper;

.field private final mCameraId:Ljava/lang/String;

.field private final mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

.field private final mConcurrentSurfaceCombinations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceCombination;",
            ">;"
        }
    .end annotation
.end field

.field private final mDisplayInfoManager:Landroidx/camera/camera2/internal/DisplayInfoManager;

.field private final mDynamicRangeResolver:Landroidx/camera/camera2/internal/DynamicRangeResolver;

.field private final mExtraSupportedSurfaceCombinationsContainer:Landroidx/camera/camera2/internal/compat/workaround/ExtraSupportedSurfaceCombinationsContainer;

.field private final mFeatureSettingsToSupportedCombinationsMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceCombination;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mHardwareLevel:I

.field private mIsBurstCaptureSupported:Z

.field private mIsConcurrentCameraModeSupported:Z

.field private mIsRawSupported:Z

.field private mIsStreamUseCaseSupported:Z

.field private mIsUltraHighResolutionSensorSupported:Z

.field private final mResolutionCorrector:Landroidx/camera/camera2/internal/compat/workaround/ResolutionCorrector;

.field private final mSurfaceCombinations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceCombination;",
            ">;"
        }
    .end annotation
.end field

.field private final mSurfaceCombinations10Bit:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceCombination;",
            ">;"
        }
    .end annotation
.end field

.field private final mSurfaceCombinationsStreamUseCase:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceCombination;",
            ">;"
        }
    .end annotation
.end field

.field mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

.field mSurfaceSizeDefinitionFormats:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final mTargetAspectRatio:Landroidx/camera/camera2/internal/compat/workaround/TargetAspectRatio;

.field private final mUltraHighSurfaceCombinations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceCombination;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroidx/camera/camera2/internal/compat/CameraManagerCompat;Landroidx/camera/camera2/internal/CamcorderProfileHelper;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cameraId"    # Ljava/lang/String;
    .param p3, "cameraManagerCompat"    # Landroidx/camera/camera2/internal/compat/CameraManagerCompat;
    .param p4, "camcorderProfileHelper"    # Landroidx/camera/camera2/internal/CamcorderProfileHelper;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/CameraUnavailableException;
        }
    .end annotation

    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 98
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceCombinations:Ljava/util/List;

    .line 99
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mUltraHighSurfaceCombinations:Ljava/util/List;

    .line 100
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mConcurrentSurfaceCombinations:Ljava/util/List;

    .line 101
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mFeatureSettingsToSupportedCombinationsMap:Ljava/util/Map;

    .line 103
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceCombinations10Bit:Ljava/util/List;

    .line 104
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceCombinationsStreamUseCase:Ljava/util/List;

    .line 111
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsRawSupported:Z

    .line 112
    iput-boolean v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsBurstCaptureSupported:Z

    .line 113
    iput-boolean v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsConcurrentCameraModeSupported:Z

    .line 114
    iput-boolean v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsStreamUseCaseSupported:Z

    .line 115
    iput-boolean v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsUltraHighResolutionSensorSupported:Z

    .line 118
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinitionFormats:Ljava/util/List;

    .line 122
    new-instance v1, Landroidx/camera/camera2/internal/compat/workaround/TargetAspectRatio;

    invoke-direct {v1}, Landroidx/camera/camera2/internal/compat/workaround/TargetAspectRatio;-><init>()V

    iput-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mTargetAspectRatio:Landroidx/camera/camera2/internal/compat/workaround/TargetAspectRatio;

    .line 123
    new-instance v1, Landroidx/camera/camera2/internal/compat/workaround/ResolutionCorrector;

    invoke-direct {v1}, Landroidx/camera/camera2/internal/compat/workaround/ResolutionCorrector;-><init>()V

    iput-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mResolutionCorrector:Landroidx/camera/camera2/internal/compat/workaround/ResolutionCorrector;

    .line 134
    invoke-static {p2}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCameraId:Ljava/lang/String;

    .line 135
    invoke-static {p4}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/camera2/internal/CamcorderProfileHelper;

    iput-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCamcorderProfileHelper:Landroidx/camera/camera2/internal/CamcorderProfileHelper;

    .line 136
    new-instance v1, Landroidx/camera/camera2/internal/compat/workaround/ExtraSupportedSurfaceCombinationsContainer;

    invoke-direct {v1}, Landroidx/camera/camera2/internal/compat/workaround/ExtraSupportedSurfaceCombinationsContainer;-><init>()V

    iput-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mExtraSupportedSurfaceCombinationsContainer:Landroidx/camera/camera2/internal/compat/workaround/ExtraSupportedSurfaceCombinationsContainer;

    .line 138
    invoke-static {p1}, Landroidx/camera/camera2/internal/DisplayInfoManager;->getInstance(Landroid/content/Context;)Landroidx/camera/camera2/internal/DisplayInfoManager;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mDisplayInfoManager:Landroidx/camera/camera2/internal/DisplayInfoManager;

    .line 141
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCameraId:Ljava/lang/String;

    invoke-virtual {p3, v1}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->getCameraCharacteristicsCompat(Ljava/lang/String;)Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 142
    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    sget-object v2, Landroid/hardware/camera2/CameraCharacteristics;->INFO_SUPPORTED_HARDWARE_LEVEL:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v1, v2}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 144
    .local v1, "keyValue":Ljava/lang/Integer;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    goto :goto_0

    .line 145
    :cond_0
    const/4 v2, 0x2

    :goto_0
    iput v2, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mHardwareLevel:I
    :try_end_0
    .catch Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat; {:try_start_0 .. :try_end_0} :catch_0

    .line 148
    .end local v1    # "keyValue":Ljava/lang/Integer;
    nop

    .line 150
    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    sget-object v2, Landroid/hardware/camera2/CameraCharacteristics;->REQUEST_AVAILABLE_CAPABILITIES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 151
    invoke-virtual {v1, v2}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    .line 153
    .local v1, "availableCapabilities":[I
    if-eqz v1, :cond_4

    .line 154
    array-length v2, v1

    :goto_1
    if-ge v0, v2, :cond_4

    aget v3, v1, v0

    .line 155
    .local v3, "capability":I
    const/4 v4, 0x3

    const/4 v5, 0x1

    if-ne v3, v4, :cond_1

    .line 156
    iput-boolean v5, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsRawSupported:Z

    goto :goto_2

    .line 157
    :cond_1
    const/4 v4, 0x6

    if-ne v3, v4, :cond_2

    .line 159
    iput-boolean v5, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsBurstCaptureSupported:Z

    goto :goto_2

    .line 160
    :cond_2
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x1f

    if-lt v4, v6, :cond_3

    const/16 v4, 0x10

    if-ne v3, v4, :cond_3

    .line 163
    iput-boolean v5, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsUltraHighResolutionSensorSupported:Z

    .line 154
    .end local v3    # "capability":I
    :cond_3
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 168
    :cond_4
    new-instance v0, Landroidx/camera/camera2/internal/DynamicRangeResolver;

    iget-object v2, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-direct {v0, v2}, Landroidx/camera/camera2/internal/DynamicRangeResolver;-><init>(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mDynamicRangeResolver:Landroidx/camera/camera2/internal/DynamicRangeResolver;

    .line 169
    invoke-direct {p0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->generateSupportedCombinationList()V

    .line 171
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsUltraHighResolutionSensorSupported:Z

    if-eqz v0, :cond_5

    .line 172
    invoke-direct {p0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->generateUltraHighSupportedCombinationList()V

    .line 175
    :cond_5
    nop

    .line 176
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string/jumbo v2, "android.hardware.camera.concurrent"

    invoke-virtual {v0, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsConcurrentCameraModeSupported:Z

    .line 177
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsConcurrentCameraModeSupported:Z

    if-eqz v0, :cond_6

    .line 178
    invoke-direct {p0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->generateConcurrentSupportedCombinationList()V

    .line 181
    :cond_6
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mDynamicRangeResolver:Landroidx/camera/camera2/internal/DynamicRangeResolver;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/DynamicRangeResolver;->is10BitDynamicRangeSupported()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 182
    invoke-direct {p0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->generate10BitSupportedCombinationList()V

    .line 185
    :cond_7
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-static {v0}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->isStreamUseCaseSupported(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Z

    move-result v0

    iput-boolean v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsStreamUseCaseSupported:Z

    .line 186
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsStreamUseCaseSupported:Z

    if-eqz v0, :cond_8

    .line 187
    invoke-direct {p0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->generateStreamUseCaseSupportedCombinationList()V

    .line 190
    :cond_8
    invoke-direct {p0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->generateSurfaceSizeDefinition()V

    .line 191
    invoke-direct {p0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->checkCustomization()V

    .line 192
    return-void

    .line 146
    .end local v1    # "availableCapabilities":[I
    :catch_0
    move-exception v0

    .line 147
    .local v0, "e":Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;
    invoke-static {v0}, Landroidx/camera/camera2/internal/CameraUnavailableExceptionHelper;->createFrom(Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;)Landroidx/camera/core/CameraUnavailableException;

    move-result-object v1

    throw v1
.end method

.method private checkCustomization()V
    .locals 0

    .line 1260
    return-void
.end method

.method private static compareIntersectingRanges(Landroid/util/Range;Landroid/util/Range;Landroid/util/Range;)Landroid/util/Range;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 362
    .local p0, "targetFps":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .local p1, "storedRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .local p2, "newRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-virtual {p1, p0}, Landroid/util/Range;->intersect(Landroid/util/Range;)Landroid/util/Range;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getRangeLength(Landroid/util/Range;)I

    move-result v0

    int-to-double v0, v0

    .line 363
    .local v0, "storedIntersectionsize":D
    invoke-virtual {p2, p0}, Landroid/util/Range;->intersect(Landroid/util/Range;)Landroid/util/Range;

    move-result-object v2

    invoke-static {v2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getRangeLength(Landroid/util/Range;)I

    move-result v2

    int-to-double v2, v2

    .line 365
    .local v2, "newIntersectionSize":D
    invoke-static {p2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getRangeLength(Landroid/util/Range;)I

    move-result v4

    int-to-double v4, v4

    div-double v4, v2, v4

    .line 366
    .local v4, "newRangeRatio":D
    invoke-static {p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getRangeLength(Landroid/util/Range;)I

    move-result v6

    int-to-double v6, v6

    div-double v6, v0, v6

    .line 368
    .local v6, "storedRangeRatio":D
    cmpl-double v8, v2, v0

    const-wide/high16 v9, 0x3fe0000000000000L    # 0.5

    if-lez v8, :cond_1

    .line 371
    cmpl-double v8, v4, v9

    if-gez v8, :cond_0

    cmpl-double v8, v4, v6

    if-ltz v8, :cond_4

    .line 372
    :cond_0
    return-object p2

    .line 374
    :cond_1
    cmpl-double v8, v2, v0

    if-nez v8, :cond_3

    .line 377
    cmpl-double v8, v4, v6

    if-lez v8, :cond_2

    .line 378
    return-object p2

    .line 379
    :cond_2
    cmpl-double v8, v4, v6

    if-nez v8, :cond_4

    .line 380
    invoke-virtual {p2}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-virtual {p1}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    if-le v8, v9, :cond_4

    .line 382
    return-object p2

    .line 385
    :cond_3
    cmpg-double v8, v6, v9

    if-gez v8, :cond_4

    cmpl-double v8, v4, v6

    if-lez v8, :cond_4

    .line 389
    return-object p2

    .line 391
    :cond_4
    return-object p1
.end method

.method private createFeatureSettings(ILjava/util/Map;)Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    .locals 4
    .param p1, "cameraMode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Landroidx/camera/core/DynamicRange;",
            ">;)",
            "Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;"
        }
    .end annotation

    .line 806
    .local p2, "resolvedDynamicRanges":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/DynamicRange;>;"
    invoke-static {p2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getRequiredMaxBitDepth(Ljava/util/Map;)I

    move-result v0

    .line 808
    .local v0, "requiredMaxBitDepth":I
    if-eqz p1, :cond_1

    const/16 v1, 0xa

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 810
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    iget-object v2, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCameraId:Ljava/lang/String;

    .line 813
    invoke-static {p1}, Landroidx/camera/core/impl/CameraMode;->toLabelString(I)Ljava/lang/String;

    move-result-object v3

    filled-new-array {v2, v3}, [Ljava/lang/Object;

    move-result-object v2

    .line 810
    const-string v3, "Camera device id is %s. 10 bit dynamic range is not currently supported in %s camera mode."

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 816
    :cond_1
    :goto_0
    invoke-static {p1, v0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->of(II)Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;

    move-result-object v1

    return-object v1
.end method

.method private filterSupportedSizes(Ljava/util/Map;Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Landroid/util/Range;)Ljava/util/Map;
    .locals 12
    .param p2, "featureSettings"    # Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;>;",
            "Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;>;"
        }
    .end annotation

    .line 923
    .local p1, "newUseCaseConfigsSupportedSizeMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Ljava/util/List<Landroid/util/Size;>;>;"
    .local p3, "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 925
    .local v0, "filteredUseCaseConfigToSupportedSizesMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Ljava/util/List<Landroid/util/Size;>;>;"
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/UseCaseConfig;

    .line 926
    .local v2, "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 927
    .local v3, "reducedSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 929
    .local v4, "configSizeUniqueMaxFpsMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;Ljava/util/Set<Ljava/lang/Integer;>;>;"
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/util/Size;

    .line 930
    .local v6, "size":Landroid/util/Size;
    invoke-interface {v2}, Landroidx/camera/core/impl/UseCaseConfig;->getInputFormat()I

    move-result v7

    .line 931
    .local v7, "imageFormat":I
    nop

    .line 932
    invoke-virtual {p2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->getCameraMode()I

    move-result v8

    .line 933
    invoke-virtual {p0, v7}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getUpdatedSurfaceSizeDefinitionByFormat(I)Landroidx/camera/core/impl/SurfaceSizeDefinition;

    move-result-object v9

    .line 931
    invoke-static {v8, v7, v6, v9}, Landroidx/camera/core/impl/SurfaceConfig;->transformSurfaceConfig(IILandroid/util/Size;Landroidx/camera/core/impl/SurfaceSizeDefinition;)Landroidx/camera/core/impl/SurfaceConfig;

    move-result-object v8

    .line 933
    invoke-virtual {v8}, Landroidx/camera/core/impl/SurfaceConfig;->getConfigSize()Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;

    move-result-object v8

    .line 934
    .local v8, "configSize":Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;
    const v9, 0x7fffffff

    .line 936
    .local v9, "maxFrameRate":I
    if-eqz p3, :cond_0

    .line 937
    iget-object v10, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-static {v10, v7, v6}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getMaxFrameRate(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;ILandroid/util/Size;)I

    move-result v9

    .line 939
    :cond_0
    invoke-interface {v4, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/Set;

    .line 941
    .local v10, "uniqueMaxFrameRates":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    if-nez v10, :cond_1

    .line 942
    new-instance v11, Ljava/util/HashSet;

    invoke-direct {v11}, Ljava/util/HashSet;-><init>()V

    move-object v10, v11

    .line 943
    invoke-interface {v4, v8, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 971
    :cond_1
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v10, v11}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_2

    .line 972
    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 973
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v10, v11}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 975
    .end local v6    # "size":Landroid/util/Size;
    .end local v7    # "imageFormat":I
    .end local v8    # "configSize":Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;
    .end local v9    # "maxFrameRate":I
    .end local v10    # "uniqueMaxFrameRates":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    :cond_2
    goto :goto_1

    .line 976
    :cond_3
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 977
    .end local v2    # "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    .end local v3    # "reducedSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .end local v4    # "configSizeUniqueMaxFpsMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;Ljava/util/Set<Ljava/lang/Integer;>;>;"
    goto :goto_0

    .line 978
    :cond_4
    return-object v0
.end method

.method private generate10BitSupportedCombinationList()V
    .locals 2

    .line 1247
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceCombinations10Bit:Ljava/util/List;

    .line 1248
    invoke-static {}, Landroidx/camera/camera2/internal/GuaranteedConfigurationsUtil;->get10BitSupportedCombinationList()Ljava/util/List;

    move-result-object v1

    .line 1247
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1249
    return-void
.end method

.method private generateConcurrentSupportedCombinationList()V
    .locals 2

    .line 1242
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mConcurrentSurfaceCombinations:Ljava/util/List;

    .line 1243
    invoke-static {}, Landroidx/camera/camera2/internal/GuaranteedConfigurationsUtil;->getConcurrentSupportedCombinationList()Ljava/util/List;

    move-result-object v1

    .line 1242
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1244
    return-void
.end method

.method private generateStreamUseCaseSupportedCombinationList()V
    .locals 2

    .line 1252
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-lt v0, v1, :cond_0

    .line 1253
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceCombinationsStreamUseCase:Ljava/util/List;

    .line 1254
    invoke-static {}, Landroidx/camera/camera2/internal/GuaranteedConfigurationsUtil;->getStreamUseCaseSupportedCombinationList()Ljava/util/List;

    move-result-object v1

    .line 1253
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1256
    :cond_0
    return-void
.end method

.method private generateSupportedCombinationList()V
    .locals 4

    .line 1228
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceCombinations:Ljava/util/List;

    iget v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mHardwareLevel:I

    iget-boolean v2, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsRawSupported:Z

    iget-boolean v3, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsBurstCaptureSupported:Z

    .line 1229
    invoke-static {v1, v2, v3}, Landroidx/camera/camera2/internal/GuaranteedConfigurationsUtil;->generateSupportedCombinationList(IZZ)Ljava/util/List;

    move-result-object v1

    .line 1228
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1232
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceCombinations:Ljava/util/List;

    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mExtraSupportedSurfaceCombinationsContainer:Landroidx/camera/camera2/internal/compat/workaround/ExtraSupportedSurfaceCombinationsContainer;

    iget-object v2, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCameraId:Ljava/lang/String;

    iget v3, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mHardwareLevel:I

    .line 1233
    invoke-virtual {v1, v2, v3}, Landroidx/camera/camera2/internal/compat/workaround/ExtraSupportedSurfaceCombinationsContainer;->get(Ljava/lang/String;I)Ljava/util/List;

    move-result-object v1

    .line 1232
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1234
    return-void
.end method

.method private generateSurfaceSizeDefinition()V
    .locals 8

    .line 1266
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mDisplayInfoManager:Landroidx/camera/camera2/internal/DisplayInfoManager;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/DisplayInfoManager;->getPreviewSize()Landroid/util/Size;

    move-result-object v3

    .line 1267
    .local v3, "previewSize":Landroid/util/Size;
    invoke-direct {p0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getRecordSize()Landroid/util/Size;

    move-result-object v5

    .line 1268
    .local v5, "recordSize":Landroid/util/Size;
    sget-object v1, Landroidx/camera/core/internal/utils/SizeUtil;->RESOLUTION_VGA:Landroid/util/Size;

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    invoke-static/range {v1 .. v7}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->create(Landroid/util/Size;Ljava/util/Map;Landroid/util/Size;Ljava/util/Map;Landroid/util/Size;Ljava/util/Map;Ljava/util/Map;)Landroidx/camera/core/impl/SurfaceSizeDefinition;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

    .line 1275
    return-void
.end method

.method private generateUltraHighSupportedCombinationList()V
    .locals 2

    .line 1237
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mUltraHighSurfaceCombinations:Ljava/util/List;

    .line 1238
    invoke-static {}, Landroidx/camera/camera2/internal/GuaranteedConfigurationsUtil;->getUltraHighResolutionSupportedCombinationList()Ljava/util/List;

    move-result-object v1

    .line 1237
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1239
    return-void
.end method

.method private getAllPossibleSizeArrangements(Ljava/util/List;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;>;)",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;>;"
        }
    .end annotation

    .line 1132
    .local p1, "supportedOutputSizesList":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Landroid/util/Size;>;>;"
    const/4 v0, 0x1

    .line 1134
    .local v0, "totalArrangementsCount":I
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 1135
    .local v2, "supportedOutputSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    mul-int/2addr v0, v3

    .line 1136
    .end local v2    # "supportedOutputSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    goto :goto_0

    .line 1141
    :cond_0
    if-eqz v0, :cond_5

    .line 1145
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1148
    .local v1, "allPossibleSizeArrangements":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Landroid/util/Size;>;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v0, :cond_1

    .line 1149
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 1150
    .local v3, "sizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1148
    .end local v3    # "sizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1161
    .end local v2    # "i":I
    :cond_1
    move v2, v0

    .line 1162
    .local v2, "currentRunCount":I
    const/4 v3, 0x0

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    div-int v3, v2, v3

    .line 1164
    .local v3, "nextRunCount":I
    const/4 v4, 0x0

    .local v4, "currentIndex":I
    :goto_2
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    if-ge v4, v5, :cond_4

    .line 1165
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 1166
    .local v5, "supportedOutputSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_3
    if-ge v6, v0, :cond_2

    .line 1167
    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 1169
    .local v7, "surfaceConfigList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    rem-int v8, v6, v2

    div-int/2addr v8, v3

    .line 1170
    invoke-interface {v5, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/util/Size;

    .line 1169
    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1166
    .end local v7    # "surfaceConfigList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 1173
    .end local v6    # "i":I
    :cond_2
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    if-ge v4, v6, :cond_3

    .line 1174
    move v2, v3

    .line 1175
    add-int/lit8 v6, v4, 0x1

    .line 1176
    invoke-interface {p1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    div-int v3, v2, v6

    .line 1164
    .end local v5    # "supportedOutputSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 1180
    .end local v4    # "currentIndex":I
    :cond_4
    return-object v1

    .line 1142
    .end local v1    # "allPossibleSizeArrangements":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Landroid/util/Size;>;>;"
    .end local v2    # "currentRunCount":I
    .end local v3    # "nextRunCount":I
    :cond_5
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Failed to find supported resolutions."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private getClosestSupportedDeviceFrameRate(Landroid/util/Range;I)Landroid/util/Range;
    .locals 9
    .param p2, "maxFps"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;I)",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 404
    .local p1, "targetFrameRate":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    if-eqz p1, :cond_a

    sget-object v0, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    invoke-virtual {p1, v0}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_4

    .line 409
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->CONTROL_AE_AVAILABLE_TARGET_FPS_RANGES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 410
    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/util/Range;

    .line 412
    .local v0, "availableFpsRanges":[Landroid/util/Range;, "[Landroid/util/Range<Ljava/lang/Integer;>;"
    if-nez v0, :cond_1

    .line 413
    sget-object v1, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    return-object v1

    .line 420
    :cond_1
    new-instance v1, Landroid/util/Range;

    .line 421
    invoke-virtual {p1}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2, p2}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 422
    invoke-virtual {p1}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v3, p2}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/util/Range;-><init>(Ljava/lang/Comparable;Ljava/lang/Comparable;)V

    .line 425
    .end local p1    # "targetFrameRate":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .local v1, "targetFrameRate":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    sget-object p1, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    .line 426
    .local p1, "bestRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    const/4 v2, 0x0

    .line 429
    .local v2, "currentIntersectSize":I
    array-length v3, v0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_9

    aget-object v5, v0, v4

    .line 431
    .local v5, "potentialRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-virtual {v5}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-lt p2, v6, :cond_8

    .line 432
    sget-object v6, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    invoke-virtual {p1, v6}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 433
    move-object p1, v5

    .line 436
    :cond_2
    invoke-virtual {v5, v1}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 437
    move-object p1, v5

    .line 438
    goto :goto_3

    .line 443
    :cond_3
    :try_start_0
    invoke-virtual {v5, v1}, Landroid/util/Range;->intersect(Landroid/util/Range;)Landroid/util/Range;

    move-result-object v6

    .line 444
    .local v6, "newIntersection":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-static {v6}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getRangeLength(Landroid/util/Range;)I

    move-result v7

    .line 446
    .local v7, "newIntersectSize":I
    if-nez v2, :cond_4

    .line 447
    move-object p1, v5

    .line 448
    move v2, v7

    goto :goto_1

    .line 449
    :cond_4
    if-lt v7, v2, :cond_5

    .line 452
    invoke-static {v1, p1, v5}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->compareIntersectingRanges(Landroid/util/Range;Landroid/util/Range;Landroid/util/Range;)Landroid/util/Range;

    move-result-object v8

    move-object p1, v8

    .line 454
    invoke-virtual {v1, p1}, Landroid/util/Range;->intersect(Landroid/util/Range;)Landroid/util/Range;

    move-result-object v8

    invoke-static {v8}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getRangeLength(Landroid/util/Range;)I

    move-result v8
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move v2, v8

    .line 474
    .end local v6    # "newIntersection":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .end local v7    # "newIntersectSize":I
    :cond_5
    :goto_1
    goto :goto_2

    .line 456
    :catch_0
    move-exception v6

    .line 458
    .local v6, "e":Ljava/lang/IllegalArgumentException;
    if-nez v2, :cond_8

    .line 459
    invoke-static {v5, v1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getRangeDistance(Landroid/util/Range;Landroid/util/Range;)I

    move-result v7

    .line 460
    invoke-static {p1, v1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getRangeDistance(Landroid/util/Range;Landroid/util/Range;)I

    move-result v8

    if-ge v7, v8, :cond_6

    .line 461
    move-object p1, v5

    goto :goto_2

    .line 462
    :cond_6
    invoke-static {v5, v1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getRangeDistance(Landroid/util/Range;Landroid/util/Range;)I

    move-result v7

    .line 463
    invoke-static {p1, v1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getRangeDistance(Landroid/util/Range;Landroid/util/Range;)I

    move-result v8

    if-ne v7, v8, :cond_8

    .line 464
    invoke-virtual {v5}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-virtual {p1}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    if-le v7, v8, :cond_7

    .line 466
    move-object p1, v5

    goto :goto_2

    .line 467
    :cond_7
    invoke-static {v5}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getRangeLength(Landroid/util/Range;)I

    move-result v7

    invoke-static {p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getRangeLength(Landroid/util/Range;)I

    move-result v8

    if-ge v7, v8, :cond_8

    .line 470
    move-object p1, v5

    .line 429
    .end local v5    # "potentialRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .end local v6    # "e":Ljava/lang/IllegalArgumentException;
    :cond_8
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 478
    :cond_9
    :goto_3
    return-object p1

    .line 405
    .end local v0    # "availableFpsRanges":[Landroid/util/Range;, "[Landroid/util/Range<Ljava/lang/Integer;>;"
    .end local v1    # "targetFrameRate":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .end local v2    # "currentIntersectSize":I
    .local p1, "targetFrameRate":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    :cond_a
    :goto_4
    sget-object v0, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    return-object v0
.end method

.method static getMaxFrameRate(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;ILandroid/util/Size;)I
    .locals 5
    .param p0, "characteristics"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    .param p1, "imageFormat"    # I
    .param p2, "size"    # Landroid/util/Size;

    .line 310
    const/4 v0, 0x0

    .line 312
    .local v0, "maxFramerate":I
    :try_start_0
    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_STREAM_CONFIGURATION_MAP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    .line 313
    invoke-virtual {p0, v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 314
    invoke-virtual {v1, p1, p2}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputMinFrameDuration(ILandroid/util/Size;)J

    move-result-wide v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    long-to-double v1, v1

    const-wide v3, 0x41cdcd6500000000L    # 1.0E9

    div-double/2addr v3, v1

    double-to-int v0, v3

    .line 320
    goto :goto_0

    .line 316
    :catch_0
    move-exception v1

    .line 321
    :goto_0
    return v0
.end method

.method private getMaxOutputSizeByFormat(Landroid/hardware/camera2/params/StreamConfigurationMap;IZ)Landroid/util/Size;
    .locals 6
    .param p1, "map"    # Landroid/hardware/camera2/params/StreamConfigurationMap;
    .param p2, "imageFormat"    # I
    .param p3, "highResolutionIncluded"    # Z

    .line 1194
    const/16 v0, 0x22

    if-ne p2, v0, :cond_0

    .line 1200
    const-class v0, Landroid/graphics/SurfaceTexture;

    invoke-virtual {p1, v0}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(Ljava/lang/Class;)[Landroid/util/Size;

    move-result-object v0

    .local v0, "outputSizes":[Landroid/util/Size;
    goto :goto_0

    .line 1202
    .end local v0    # "outputSizes":[Landroid/util/Size;
    :cond_0
    invoke-virtual {p1, p2}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(I)[Landroid/util/Size;

    move-result-object v0

    .line 1205
    .restart local v0    # "outputSizes":[Landroid/util/Size;
    :goto_0
    if-eqz v0, :cond_3

    array-length v1, v0

    if-nez v1, :cond_1

    goto :goto_1

    .line 1209
    :cond_1
    new-instance v1, Landroidx/camera/core/impl/utils/CompareSizesByArea;

    invoke-direct {v1}, Landroidx/camera/core/impl/utils/CompareSizesByArea;-><init>()V

    .line 1210
    .local v1, "compareSizesByArea":Landroidx/camera/core/impl/utils/CompareSizesByArea;
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-static {v2, v1}, Ljava/util/Collections;->max(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Size;

    .line 1213
    .local v2, "maxSize":Landroid/util/Size;
    sget-object v3, Landroidx/camera/core/internal/utils/SizeUtil;->RESOLUTION_ZERO:Landroid/util/Size;

    .line 1214
    .local v3, "maxHighResolutionSize":Landroid/util/Size;
    if-eqz p3, :cond_2

    .line 1215
    invoke-static {p1, p2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$Api23Impl;->getHighResolutionOutputSizes(Landroid/hardware/camera2/params/StreamConfigurationMap;I)[Landroid/util/Size;

    move-result-object v4

    .line 1218
    .local v4, "highResolutionOutputSizes":[Landroid/util/Size;
    if-eqz v4, :cond_2

    array-length v5, v4

    if-lez v5, :cond_2

    .line 1219
    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-static {v5, v1}, Ljava/util/Collections;->max(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    move-result-object v5

    move-object v3, v5

    check-cast v3, Landroid/util/Size;

    .line 1224
    .end local v4    # "highResolutionOutputSizes":[Landroid/util/Size;
    :cond_2
    const/4 v4, 0x2

    new-array v4, v4, [Landroid/util/Size;

    const/4 v5, 0x0

    aput-object v2, v4, v5

    const/4 v5, 0x1

    aput-object v3, v4, v5

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-static {v4, v1}, Ljava/util/Collections;->max(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/util/Size;

    return-object v4

    .line 1206
    .end local v1    # "compareSizesByArea":Landroidx/camera/core/impl/utils/CompareSizesByArea;
    .end local v2    # "maxSize":Landroid/util/Size;
    .end local v3    # "maxHighResolutionSize":Landroid/util/Size;
    :cond_3
    :goto_1
    const/4 v1, 0x0

    return-object v1
.end method

.method private getMaxSupportedFpsFromAttachedSurfaces(Ljava/util/List;)I
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            ">;)I"
        }
    .end annotation

    .line 899
    .local p1, "attachedSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    const v0, 0x7fffffff

    .line 901
    .local v0, "existingSurfaceFrameRateCeiling":I
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/AttachedSurfaceInfo;

    .line 903
    .local v2, "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    nop

    .line 905
    invoke-virtual {v2}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getImageFormat()I

    move-result v3

    invoke-virtual {v2}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getSize()Landroid/util/Size;

    move-result-object v4

    .line 903
    invoke-direct {p0, v0, v3, v4}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getUpdatedMaximumFps(IILandroid/util/Size;)I

    move-result v0

    .line 906
    .end local v2    # "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    goto :goto_0

    .line 908
    :cond_0
    return v0
.end method

.method private static getRangeDistance(Landroid/util/Range;Landroid/util/Range;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)I"
        }
    .end annotation

    .line 337
    .local p0, "firstRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .local p1, "secondRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    nop

    .line 338
    invoke-virtual {p1}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {p0, v0}, Landroid/util/Range;->contains(Ljava/lang/Comparable;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 339
    invoke-virtual {p1}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {p0, v0}, Landroid/util/Range;->contains(Ljava/lang/Comparable;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 337
    :goto_0
    const-string/jumbo v1, "Ranges must not intersect"

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 341
    invoke-virtual {p0}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-le v0, v1, :cond_1

    .line 342
    invoke-virtual {p0}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sub-int/2addr v0, v1

    return v0

    .line 344
    :cond_1
    invoke-virtual {p1}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method private static getRangeLength(Landroid/util/Range;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)I"
        }
    .end annotation

    .line 330
    .local p0, "range":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-virtual {p0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method private getRecordSize()Landroid/util/Size;
    .locals 5

    .line 1380
    :try_start_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCameraId:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1385
    .local v0, "cameraId":I
    nop

    .line 1387
    const/4 v1, 0x0

    .line 1389
    .local v1, "profile":Landroid/media/CamcorderProfile;
    iget-object v2, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCamcorderProfileHelper:Landroidx/camera/camera2/internal/CamcorderProfileHelper;

    const/4 v3, 0x1

    invoke-interface {v2, v0, v3}, Landroidx/camera/camera2/internal/CamcorderProfileHelper;->hasProfile(II)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1390
    iget-object v2, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCamcorderProfileHelper:Landroidx/camera/camera2/internal/CamcorderProfileHelper;

    invoke-interface {v2, v0, v3}, Landroidx/camera/camera2/internal/CamcorderProfileHelper;->get(II)Landroid/media/CamcorderProfile;

    move-result-object v1

    .line 1393
    :cond_0
    if-eqz v1, :cond_1

    .line 1394
    new-instance v2, Landroid/util/Size;

    iget v3, v1, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    iget v4, v1, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    invoke-direct {v2, v3, v4}, Landroid/util/Size;-><init>(II)V

    return-object v2

    .line 1397
    :cond_1
    invoke-direct {p0, v0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getRecordSizeByHasProfile(I)Landroid/util/Size;

    move-result-object v2

    return-object v2

    .line 1381
    .end local v0    # "cameraId":I
    .end local v1    # "profile":Landroid/media/CamcorderProfile;
    :catch_0
    move-exception v0

    .line 1384
    .local v0, "e":Ljava/lang/NumberFormatException;
    invoke-direct {p0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getRecordSizeFromStreamConfigurationMap()Landroid/util/Size;

    move-result-object v1

    return-object v1
.end method

.method private getRecordSizeByHasProfile(I)Landroid/util/Size;
    .locals 5
    .param p1, "cameraId"    # I

    .line 1439
    sget-object v0, Landroidx/camera/core/internal/utils/SizeUtil;->RESOLUTION_480P:Landroid/util/Size;

    .line 1440
    .local v0, "recordSize":Landroid/util/Size;
    const/4 v1, 0x0

    .line 1444
    .local v1, "profile":Landroid/media/CamcorderProfile;
    iget-object v2, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCamcorderProfileHelper:Landroidx/camera/camera2/internal/CamcorderProfileHelper;

    const/16 v3, 0xa

    invoke-interface {v2, p1, v3}, Landroidx/camera/camera2/internal/CamcorderProfileHelper;->hasProfile(II)Z

    move-result v2

    .line 1446
    iget-object v4, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCamcorderProfileHelper:Landroidx/camera/camera2/internal/CamcorderProfileHelper;

    .line 1444
    if-eqz v2, :cond_0

    .line 1445
    invoke-interface {v4, p1, v3}, Landroidx/camera/camera2/internal/CamcorderProfileHelper;->get(II)Landroid/media/CamcorderProfile;

    move-result-object v1

    goto :goto_0

    .line 1446
    :cond_0
    const/16 v2, 0x8

    invoke-interface {v4, p1, v2}, Landroidx/camera/camera2/internal/CamcorderProfileHelper;->hasProfile(II)Z

    move-result v3

    .line 1448
    iget-object v4, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCamcorderProfileHelper:Landroidx/camera/camera2/internal/CamcorderProfileHelper;

    .line 1446
    if-eqz v3, :cond_1

    .line 1447
    invoke-interface {v4, p1, v2}, Landroidx/camera/camera2/internal/CamcorderProfileHelper;->get(II)Landroid/media/CamcorderProfile;

    move-result-object v1

    goto :goto_0

    .line 1448
    :cond_1
    const/16 v2, 0xc

    invoke-interface {v4, p1, v2}, Landroidx/camera/camera2/internal/CamcorderProfileHelper;->hasProfile(II)Z

    move-result v3

    .line 1450
    iget-object v4, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCamcorderProfileHelper:Landroidx/camera/camera2/internal/CamcorderProfileHelper;

    .line 1448
    if-eqz v3, :cond_2

    .line 1449
    invoke-interface {v4, p1, v2}, Landroidx/camera/camera2/internal/CamcorderProfileHelper;->get(II)Landroid/media/CamcorderProfile;

    move-result-object v1

    goto :goto_0

    .line 1450
    :cond_2
    const/4 v2, 0x6

    invoke-interface {v4, p1, v2}, Landroidx/camera/camera2/internal/CamcorderProfileHelper;->hasProfile(II)Z

    move-result v3

    .line 1452
    iget-object v4, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCamcorderProfileHelper:Landroidx/camera/camera2/internal/CamcorderProfileHelper;

    .line 1450
    if-eqz v3, :cond_3

    .line 1451
    invoke-interface {v4, p1, v2}, Landroidx/camera/camera2/internal/CamcorderProfileHelper;->get(II)Landroid/media/CamcorderProfile;

    move-result-object v1

    goto :goto_0

    .line 1452
    :cond_3
    const/4 v2, 0x5

    invoke-interface {v4, p1, v2}, Landroidx/camera/camera2/internal/CamcorderProfileHelper;->hasProfile(II)Z

    move-result v3

    .line 1454
    iget-object v4, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCamcorderProfileHelper:Landroidx/camera/camera2/internal/CamcorderProfileHelper;

    .line 1452
    if-eqz v3, :cond_4

    .line 1453
    invoke-interface {v4, p1, v2}, Landroidx/camera/camera2/internal/CamcorderProfileHelper;->get(II)Landroid/media/CamcorderProfile;

    move-result-object v1

    goto :goto_0

    .line 1454
    :cond_4
    const/4 v2, 0x4

    invoke-interface {v4, p1, v2}, Landroidx/camera/camera2/internal/CamcorderProfileHelper;->hasProfile(II)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 1455
    iget-object v3, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCamcorderProfileHelper:Landroidx/camera/camera2/internal/CamcorderProfileHelper;

    invoke-interface {v3, p1, v2}, Landroidx/camera/camera2/internal/CamcorderProfileHelper;->get(II)Landroid/media/CamcorderProfile;

    move-result-object v1

    .line 1458
    :cond_5
    :goto_0
    if-eqz v1, :cond_6

    .line 1459
    new-instance v2, Landroid/util/Size;

    iget v3, v1, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    iget v4, v1, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    invoke-direct {v2, v3, v4}, Landroid/util/Size;-><init>(II)V

    move-object v0, v2

    .line 1462
    :cond_6
    return-object v0
.end method

.method private getRecordSizeFromStreamConfigurationMap()Landroid/util/Size;
    .locals 7

    .line 1410
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->getStreamConfigurationMapCompat()Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;

    move-result-object v0

    .line 1411
    .local v0, "mapCompat":Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;
    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;->toStreamConfigurationMap()Landroid/hardware/camera2/params/StreamConfigurationMap;

    move-result-object v1

    const-class v2, Landroid/media/MediaRecorder;

    invoke-virtual {v1, v2}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(Ljava/lang/Class;)[Landroid/util/Size;

    move-result-object v1

    .line 1414
    .local v1, "videoSizeArr":[Landroid/util/Size;
    if-nez v1, :cond_0

    .line 1415
    sget-object v2, Landroidx/camera/core/internal/utils/SizeUtil;->RESOLUTION_480P:Landroid/util/Size;

    return-object v2

    .line 1418
    :cond_0
    new-instance v2, Landroidx/camera/core/impl/utils/CompareSizesByArea;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Landroidx/camera/core/impl/utils/CompareSizesByArea;-><init>(Z)V

    invoke-static {v1, v2}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 1420
    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    aget-object v4, v1, v3

    .line 1422
    .local v4, "size":Landroid/util/Size;
    invoke-virtual {v4}, Landroid/util/Size;->getWidth()I

    move-result v5

    sget-object v6, Landroidx/camera/core/internal/utils/SizeUtil;->RESOLUTION_1080P:Landroid/util/Size;

    invoke-virtual {v6}, Landroid/util/Size;->getWidth()I

    move-result v6

    if-gt v5, v6, :cond_1

    .line 1423
    invoke-virtual {v4}, Landroid/util/Size;->getHeight()I

    move-result v5

    sget-object v6, Landroidx/camera/core/internal/utils/SizeUtil;->RESOLUTION_1080P:Landroid/util/Size;

    invoke-virtual {v6}, Landroid/util/Size;->getHeight()I

    move-result v6

    if-gt v5, v6, :cond_1

    .line 1424
    return-object v4

    .line 1420
    .end local v4    # "size":Landroid/util/Size;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1428
    :cond_2
    sget-object v2, Landroidx/camera/core/internal/utils/SizeUtil;->RESOLUTION_480P:Landroid/util/Size;

    return-object v2
.end method

.method private static getRequiredMaxBitDepth(Ljava/util/Map;)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Landroidx/camera/core/DynamicRange;",
            ">;)I"
        }
    .end annotation

    .line 1087
    .local p0, "resolvedDynamicRanges":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/DynamicRange;>;"
    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/DynamicRange;

    .line 1088
    .local v1, "dynamicRange":Landroidx/camera/core/DynamicRange;
    invoke-virtual {v1}, Landroidx/camera/core/DynamicRange;->getBitDepth()I

    move-result v2

    const/16 v3, 0xa

    if-ne v2, v3, :cond_0

    .line 1089
    return v3

    .line 1091
    .end local v1    # "dynamicRange":Landroidx/camera/core/DynamicRange;
    :cond_0
    goto :goto_0

    .line 1093
    :cond_1
    const/16 v0, 0x8

    return v0
.end method

.method private getSurfaceCombinationsByFeatureSettings(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;)Ljava/util/List;
    .locals 3
    .param p1, "featureSettings"    # Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;",
            ")",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceCombination;",
            ">;"
        }
    .end annotation

    .line 257
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mFeatureSettingsToSupportedCombinationsMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 258
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mFeatureSettingsToSupportedCombinationsMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0

    .line 261
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 263
    .local v0, "supportedSurfaceCombinations":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceCombination;>;"
    invoke-virtual {p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->getRequiredMaxBitDepth()I

    move-result v1

    const/16 v2, 0x8

    if-ne v1, v2, :cond_1

    .line 264
    invoke-virtual {p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->getCameraMode()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 273
    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceCombinations:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 274
    goto :goto_0

    .line 269
    :pswitch_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mUltraHighSurfaceCombinations:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 270
    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceCombinations:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 271
    goto :goto_0

    .line 266
    :pswitch_1
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mConcurrentSurfaceCombinations:Ljava/util/List;

    .line 267
    goto :goto_0

    .line 276
    :cond_1
    invoke-virtual {p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->getRequiredMaxBitDepth()I

    move-result v1

    const/16 v2, 0xa

    if-ne v1, v2, :cond_2

    .line 278
    invoke-virtual {p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->getCameraMode()I

    move-result v1

    if-nez v1, :cond_2

    .line 279
    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceCombinations10Bit:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 283
    :cond_2
    :goto_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mFeatureSettingsToSupportedCombinationsMap:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 286
    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private getSurfaceConfigListAndFpsCeiling(ILjava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;ILjava/util/Map;Ljava/util/Map;)Landroid/util/Pair;
    .locals 7
    .param p1, "cameraMode"    # I
    .param p6, "currentConfigFramerateCeiling"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            ">;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;I",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;)",
            "Landroid/util/Pair<",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceConfig;",
            ">;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 989
    .local p2, "attachedSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local p3, "possibleSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .local p4, "newUseCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .local p5, "useCasesPriorityOrder":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local p7, "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local p8, "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 990
    .local v0, "surfaceConfigList":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/AttachedSurfaceInfo;

    .line 991
    .local v2, "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    invoke-virtual {v2}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getSurfaceConfig()Landroidx/camera/core/impl/SurfaceConfig;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 992
    if-eqz p7, :cond_0

    .line 993
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {p7, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 996
    .end local v2    # "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    :cond_0
    goto :goto_0

    .line 999
    :cond_1
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 1000
    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Size;

    .line 1001
    .local v2, "size":Landroid/util/Size;
    nop

    .line 1002
    invoke-interface {p5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-interface {p4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/UseCaseConfig;

    .line 1003
    .local v3, "newUseCase":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    invoke-interface {v3}, Landroidx/camera/core/impl/UseCaseConfig;->getInputFormat()I

    move-result v4

    .line 1005
    .local v4, "imageFormat":I
    nop

    .line 1009
    invoke-virtual {p0, v4}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getUpdatedSurfaceSizeDefinitionByFormat(I)Landroidx/camera/core/impl/SurfaceSizeDefinition;

    move-result-object v5

    .line 1005
    invoke-static {p1, v4, v2, v5}, Landroidx/camera/core/impl/SurfaceConfig;->transformSurfaceConfig(IILandroid/util/Size;Landroidx/camera/core/impl/SurfaceSizeDefinition;)Landroidx/camera/core/impl/SurfaceConfig;

    move-result-object v5

    .line 1010
    .local v5, "surfaceConfig":Landroidx/camera/core/impl/SurfaceConfig;
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1011
    if-eqz p8, :cond_2

    .line 1012
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {p8, v6, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1016
    :cond_2
    nop

    .line 1018
    invoke-interface {v3}, Landroidx/camera/core/impl/UseCaseConfig;->getInputFormat()I

    move-result v6

    .line 1016
    invoke-direct {p0, p6, v6, v2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getUpdatedMaximumFps(IILandroid/util/Size;)I

    move-result p6

    .line 999
    .end local v2    # "size":Landroid/util/Size;
    .end local v3    # "newUseCase":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    .end local v4    # "imageFormat":I
    .end local v5    # "surfaceConfig":Landroidx/camera/core/impl/SurfaceConfig;
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1021
    .end local v1    # "i":I
    :cond_3
    new-instance v1, Landroid/util/Pair;

    invoke-static {p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v1
.end method

.method private getTargetFpsRange(Ljava/util/List;Ljava/util/List;Ljava/util/List;)Landroid/util/Range;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            ">;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 877
    .local p1, "attachedSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local p2, "newUseCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .local p3, "useCasesPriorityOrder":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v0, 0x0

    .line 879
    .local v0, "targetFramerateForConfig":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/AttachedSurfaceInfo;

    .line 881
    .local v2, "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    nop

    .line 882
    invoke-virtual {v2}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getTargetFrameRate()Landroid/util/Range;

    move-result-object v3

    .line 881
    invoke-direct {p0, v3, v0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getUpdatedTargetFramerate(Landroid/util/Range;Landroid/util/Range;)Landroid/util/Range;

    move-result-object v0

    .line 884
    .end local v2    # "attachedSurfaceInfo":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    goto :goto_0

    .line 887
    :cond_0
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 888
    .local v2, "index":Ljava/lang/Integer;
    nop

    .line 890
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/UseCaseConfig;

    const/4 v4, 0x0

    invoke-interface {v3, v4}, Landroidx/camera/core/impl/UseCaseConfig;->getTargetFrameRate(Landroid/util/Range;)Landroid/util/Range;

    move-result-object v3

    .line 889
    invoke-direct {p0, v3, v0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getUpdatedTargetFramerate(Landroid/util/Range;Landroid/util/Range;)Landroid/util/Range;

    move-result-object v0

    .line 892
    .end local v2    # "index":Ljava/lang/Integer;
    goto :goto_1

    .line 894
    :cond_1
    return-object v0
.end method

.method private getUpdatedMaximumFps(IILandroid/util/Size;)I
    .locals 1
    .param p1, "currentMaxFps"    # I
    .param p2, "imageFormat"    # I
    .param p3, "size"    # Landroid/util/Size;

    .line 516
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-static {v0, p2, p3}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getMaxFrameRate(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;ILandroid/util/Size;)I

    move-result v0

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    return v0
.end method

.method private getUpdatedTargetFramerate(Landroid/util/Range;Landroid/util/Range;)Landroid/util/Range;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 491
    .local p1, "newTargetFramerate":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .local p2, "storedTargetFramerate":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    move-object v0, p2

    .line 493
    .local v0, "updatedTarget":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    if-nez p2, :cond_0

    .line 495
    move-object v0, p1

    goto :goto_0

    .line 496
    :cond_0
    if-eqz p1, :cond_1

    .line 499
    nop

    .line 501
    :try_start_0
    invoke-virtual {p2, p1}, Landroid/util/Range;->intersect(Landroid/util/Range;)Landroid/util/Range;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    .line 505
    goto :goto_0

    .line 502
    :catch_0
    move-exception v1

    .line 504
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    move-object v0, p2

    .line 507
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    :cond_1
    :goto_0
    return-object v0
.end method

.method private getUseCasesPriorityOrder(Ljava/util/List;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;)",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1097
    .local p1, "newUseCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1105
    .local v0, "priorityOrder":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1107
    .local v1, "priorityValueList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/UseCaseConfig;

    .line 1108
    .local v3, "config":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    invoke-interface {v3, v4}, Landroidx/camera/core/impl/UseCaseConfig;->getSurfaceOccupancyPriority(I)I

    move-result v4

    .line 1109
    .local v4, "priority":I
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 1110
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1112
    .end local v3    # "config":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    .end local v4    # "priority":I
    :cond_0
    goto :goto_0

    .line 1114
    :cond_1
    invoke-static {v1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 1117
    invoke-static {v1}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 1119
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 1120
    .local v3, "priorityValue":I
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/camera/core/impl/UseCaseConfig;

    .line 1121
    .local v6, "config":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    invoke-interface {v6, v4}, Landroidx/camera/core/impl/UseCaseConfig;->getSurfaceOccupancyPriority(I)I

    move-result v7

    if-ne v3, v7, :cond_2

    .line 1122
    invoke-interface {p1, v6}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1124
    .end local v6    # "config":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    :cond_2
    goto :goto_2

    .line 1125
    .end local v3    # "priorityValue":I
    :cond_3
    goto :goto_1

    .line 1127
    :cond_4
    return-object v0
.end method

.method private isUseCasesCombinationSupported(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Ljava/util/List;Ljava/util/Map;)Z
    .locals 9
    .param p1, "featureSettings"    # Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            ">;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;>;)Z"
        }
    .end annotation

    .line 845
    .local p2, "attachedSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local p3, "newUseCaseConfigsSupportedSizeMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Ljava/util/List<Landroid/util/Size;>;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 848
    .local v0, "surfaceConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/AttachedSurfaceInfo;

    .line 849
    .local v2, "attachedSurface":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    invoke-virtual {v2}, Landroidx/camera/core/impl/AttachedSurfaceInfo;->getSurfaceConfig()Landroidx/camera/core/impl/SurfaceConfig;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 850
    .end local v2    # "attachedSurface":Landroidx/camera/core/impl/AttachedSurfaceInfo;
    goto :goto_0

    .line 854
    :cond_0
    new-instance v1, Landroidx/camera/core/impl/utils/CompareSizesByArea;

    invoke-direct {v1}, Landroidx/camera/core/impl/utils/CompareSizesByArea;-><init>()V

    .line 855
    .local v1, "compareSizesByArea":Landroidx/camera/core/impl/utils/CompareSizesByArea;
    invoke-interface {p3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/UseCaseConfig;

    .line 856
    .local v3, "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    invoke-interface {p3, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 857
    .local v4, "supportedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    if-eqz v4, :cond_1

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1

    const/4 v5, 0x1

    goto :goto_2

    :cond_1
    const/4 v5, 0x0

    :goto_2
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "No available output size is found for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 859
    invoke-static {v4, v1}, Ljava/util/Collections;->min(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/util/Size;

    .line 860
    .local v5, "minSize":Landroid/util/Size;
    invoke-interface {v3}, Landroidx/camera/core/impl/UseCaseConfig;->getInputFormat()I

    move-result v6

    .line 861
    .local v6, "imageFormat":I
    nop

    .line 863
    invoke-virtual {p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;->getCameraMode()I

    move-result v7

    .line 866
    invoke-virtual {p0, v6}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getUpdatedSurfaceSizeDefinitionByFormat(I)Landroidx/camera/core/impl/SurfaceSizeDefinition;

    move-result-object v8

    .line 862
    invoke-static {v7, v6, v5, v8}, Landroidx/camera/core/impl/SurfaceConfig;->transformSurfaceConfig(IILandroid/util/Size;Landroidx/camera/core/impl/SurfaceSizeDefinition;)Landroidx/camera/core/impl/SurfaceConfig;

    move-result-object v7

    .line 861
    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 867
    .end local v3    # "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    .end local v4    # "supportedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .end local v5    # "minSize":Landroid/util/Size;
    .end local v6    # "imageFormat":I
    goto :goto_1

    .line 869
    :cond_2
    invoke-virtual {p0, p1, v0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->checkSupported(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Ljava/util/List;)Z

    move-result v2

    return v2
.end method

.method private refreshPreviewSize()V
    .locals 8

    .line 1355
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mDisplayInfoManager:Landroidx/camera/camera2/internal/DisplayInfoManager;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/DisplayInfoManager;->refresh()V

    .line 1356
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

    if-nez v0, :cond_0

    .line 1357
    invoke-direct {p0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->generateSurfaceSizeDefinition()V

    goto :goto_0

    .line 1359
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mDisplayInfoManager:Landroidx/camera/camera2/internal/DisplayInfoManager;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/DisplayInfoManager;->getPreviewSize()Landroid/util/Size;

    move-result-object v3

    .line 1360
    .local v3, "previewSize":Landroid/util/Size;
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

    .line 1361
    invoke-virtual {v0}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getAnalysisSize()Landroid/util/Size;

    move-result-object v1

    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

    .line 1362
    invoke-virtual {v0}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getS720pSizeMap()Ljava/util/Map;

    move-result-object v2

    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

    .line 1364
    invoke-virtual {v0}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getS1440pSizeMap()Ljava/util/Map;

    move-result-object v4

    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

    .line 1365
    invoke-virtual {v0}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getRecordSize()Landroid/util/Size;

    move-result-object v5

    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

    .line 1366
    invoke-virtual {v0}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getMaximumSizeMap()Ljava/util/Map;

    move-result-object v6

    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

    .line 1367
    invoke-virtual {v0}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getUltraMaximumSizeMap()Ljava/util/Map;

    move-result-object v7

    .line 1360
    invoke-static/range {v1 .. v7}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->create(Landroid/util/Size;Ljava/util/Map;Landroid/util/Size;Ljava/util/Map;Landroid/util/Size;Ljava/util/Map;Ljava/util/Map;)Landroidx/camera/core/impl/SurfaceSizeDefinition;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

    .line 1369
    .end local v3    # "previewSize":Landroid/util/Size;
    :goto_0
    return-void
.end method

.method private updateMaximumSizeByFormat(Ljava/util/Map;I)V
    .locals 3
    .param p2, "format"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroid/util/Size;",
            ">;I)V"
        }
    .end annotation

    .line 1327
    .local p1, "sizeMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroid/util/Size;>;"
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 1328
    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->getStreamConfigurationMapCompat()Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;->toStreamConfigurationMap()Landroid/hardware/camera2/params/StreamConfigurationMap;

    move-result-object v0

    .line 1329
    .local v0, "originalMap":Landroid/hardware/camera2/params/StreamConfigurationMap;
    const/4 v1, 0x1

    invoke-direct {p0, v0, p2, v1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getMaxOutputSizeByFormat(Landroid/hardware/camera2/params/StreamConfigurationMap;IZ)Landroid/util/Size;

    move-result-object v1

    .line 1330
    .local v1, "maxOutputSize":Landroid/util/Size;
    if-eqz v1, :cond_0

    .line 1331
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {p1, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1333
    :cond_0
    return-void
.end method

.method private updateS720pOrS1440pSizeByFormat(Ljava/util/Map;Landroid/util/Size;I)V
    .locals 5
    .param p2, "targetSize"    # Landroid/util/Size;
    .param p3, "format"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroid/util/Size;",
            ">;",
            "Landroid/util/Size;",
            "I)V"
        }
    .end annotation

    .line 1311
    .local p1, "sizeMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroid/util/Size;>;"
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsConcurrentCameraModeSupported:Z

    if-nez v0, :cond_0

    .line 1312
    return-void

    .line 1315
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 1316
    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->getStreamConfigurationMapCompat()Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;->toStreamConfigurationMap()Landroid/hardware/camera2/params/StreamConfigurationMap;

    move-result-object v0

    .line 1317
    .local v0, "originalMap":Landroid/hardware/camera2/params/StreamConfigurationMap;
    const/4 v1, 0x0

    invoke-direct {p0, v0, p3, v1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getMaxOutputSizeByFormat(Landroid/hardware/camera2/params/StreamConfigurationMap;IZ)Landroid/util/Size;

    move-result-object v2

    .line 1318
    .local v2, "maxOutputSize":Landroid/util/Size;
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    if-nez v2, :cond_1

    move-object v1, p2

    goto :goto_0

    .line 1319
    :cond_1
    const/4 v4, 0x2

    new-array v4, v4, [Landroid/util/Size;

    aput-object p2, v4, v1

    const/4 v1, 0x1

    aput-object v2, v4, v1

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    new-instance v4, Landroidx/camera/core/impl/utils/CompareSizesByArea;

    invoke-direct {v4}, Landroidx/camera/core/impl/utils/CompareSizesByArea;-><init>()V

    invoke-static {v1, v4}, Ljava/util/Collections;->min(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Size;

    .line 1318
    :goto_0
    invoke-interface {p1, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1321
    return-void
.end method

.method private updateUltraMaximumSizeByFormat(Ljava/util/Map;I)V
    .locals 3
    .param p2, "format"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroid/util/Size;",
            ">;I)V"
        }
    .end annotation

    .line 1340
    .local p1, "sizeMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroid/util/Size;>;"
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_2

    iget-boolean v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsUltraHighResolutionSensorSupported:Z

    if-nez v0, :cond_0

    goto :goto_0

    .line 1344
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    sget-object v1, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_STREAM_CONFIGURATION_MAP_MAXIMUM_RESOLUTION:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 1347
    .local v0, "maximumResolutionMap":Landroid/hardware/camera2/params/StreamConfigurationMap;
    if-nez v0, :cond_1

    .line 1348
    return-void

    .line 1351
    :cond_1
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {p0, v0, p2, v2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getMaxOutputSizeByFormat(Landroid/hardware/camera2/params/StreamConfigurationMap;IZ)Landroid/util/Size;

    move-result-object v2

    invoke-interface {p1, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1352
    return-void

    .line 1341
    .end local v0    # "maximumResolutionMap":Landroid/hardware/camera2/params/StreamConfigurationMap;
    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method applyResolutionSelectionOrderRelatedWorkarounds(Ljava/util/List;I)Ljava/util/List;
    .locals 7
    .param p2, "imageFormat"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;I)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 1041
    .local p1, "sizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mTargetAspectRatio:Landroidx/camera/camera2/internal/compat/workaround/TargetAspectRatio;

    iget-object v1, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCameraId:Ljava/lang/String;

    iget-object v2, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-virtual {v0, v1, v2}, Landroidx/camera/camera2/internal/compat/workaround/TargetAspectRatio;->get(Ljava/lang/String;Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)I

    move-result v0

    .line 1042
    .local v0, "targetAspectRatio":I
    const/4 v1, 0x0

    .line 1044
    .local v1, "ratio":Landroid/util/Rational;
    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 1057
    :pswitch_0
    const/4 v1, 0x0

    goto :goto_0

    .line 1052
    :pswitch_1
    const/16 v2, 0x100

    invoke-virtual {p0, v2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getUpdatedSurfaceSizeDefinitionByFormat(I)Landroidx/camera/core/impl/SurfaceSizeDefinition;

    move-result-object v3

    .line 1053
    invoke-virtual {v3, v2}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getMaximumSize(I)Landroid/util/Size;

    move-result-object v2

    .line 1054
    .local v2, "maxJpegSize":Landroid/util/Size;
    new-instance v3, Landroid/util/Rational;

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v4

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v5

    invoke-direct {v3, v4, v5}, Landroid/util/Rational;-><init>(II)V

    move-object v1, v3

    .line 1055
    goto :goto_0

    .line 1049
    .end local v2    # "maxJpegSize":Landroid/util/Size;
    :pswitch_2
    sget-object v1, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_16_9:Landroid/util/Rational;

    .line 1050
    goto :goto_0

    .line 1046
    :pswitch_3
    sget-object v1, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_4_3:Landroid/util/Rational;

    .line 1047
    nop

    .line 1062
    :goto_0
    if-nez v1, :cond_0

    .line 1063
    move-object v2, p1

    .local v2, "resultList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    goto :goto_3

    .line 1065
    .end local v2    # "resultList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1066
    .local v2, "aspectRatioMatchedSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 1068
    .local v3, "resultList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/util/Size;

    .line 1069
    .local v5, "size":Landroid/util/Size;
    invoke-static {v5, v1}, Landroidx/camera/core/impl/utils/AspectRatioUtil;->hasMatchingAspectRatio(Landroid/util/Size;Landroid/util/Rational;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1070
    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 1072
    :cond_1
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1074
    .end local v5    # "size":Landroid/util/Size;
    :goto_2
    goto :goto_1

    .line 1075
    :cond_2
    const/4 v4, 0x0

    invoke-interface {v3, v4, v2}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    move-object v2, v3

    .line 1079
    .end local v3    # "resultList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .local v2, "resultList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :goto_3
    iget-object v3, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mResolutionCorrector:Landroidx/camera/camera2/internal/compat/workaround/ResolutionCorrector;

    .line 1080
    invoke-static {p2}, Landroidx/camera/core/impl/SurfaceConfig;->getConfigType(I)Landroidx/camera/core/impl/SurfaceConfig$ConfigType;

    move-result-object v4

    .line 1079
    invoke-virtual {v3, v4, v2}, Landroidx/camera/camera2/internal/compat/workaround/ResolutionCorrector;->insertOrPrioritize(Landroidx/camera/core/impl/SurfaceConfig$ConfigType;Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    return-object v3

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method checkSupported(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Ljava/util/List;)Z
    .locals 4
    .param p1, "featureSettings"    # Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceConfig;",
            ">;)Z"
        }
    .end annotation

    .line 218
    .local p2, "surfaceConfigList":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    const/4 v0, 0x0

    .line 220
    .local v0, "isSupported":Z
    invoke-direct {p0, p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getSurfaceCombinationsByFeatureSettings(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/SurfaceCombination;

    .line 222
    .local v2, "surfaceCombination":Landroidx/camera/core/impl/SurfaceCombination;
    invoke-virtual {v2, p2}, Landroidx/camera/core/impl/SurfaceCombination;->getOrderedSupportedSurfaceConfigList(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    goto :goto_1

    :cond_0
    const/4 v3, 0x0

    :goto_1
    move v0, v3

    .line 225
    if-eqz v0, :cond_1

    .line 226
    goto :goto_2

    .line 228
    .end local v2    # "surfaceCombination":Landroidx/camera/core/impl/SurfaceCombination;
    :cond_1
    goto :goto_0

    .line 230
    :cond_2
    :goto_2
    return v0
.end method

.method getCameraId()Ljava/lang/String;
    .locals 1

    .line 195
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCameraId:Ljava/lang/String;

    return-object v0
.end method

.method getOrderedSupportedStreamUseCaseSurfaceConfigList(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Ljava/util/List;)Ljava/util/List;
    .locals 4
    .param p1, "featureSettings"    # Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceConfig;",
            ">;)",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SurfaceConfig;",
            ">;"
        }
    .end annotation

    .line 237
    .local p2, "surfaceConfigList":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    invoke-static {p1}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->shouldUseStreamUseCase(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 238
    return-object v1

    .line 241
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceCombinationsStreamUseCase:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/SurfaceCombination;

    .line 242
    .local v2, "surfaceCombination":Landroidx/camera/core/impl/SurfaceCombination;
    nop

    .line 243
    invoke-virtual {v2, p2}, Landroidx/camera/core/impl/SurfaceCombination;->getOrderedSupportedSurfaceConfigList(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    .line 244
    .local v3, "orderedSurfaceConfigList":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    if-eqz v3, :cond_1

    .line 245
    return-object v3

    .line 247
    .end local v2    # "surfaceCombination":Landroidx/camera/core/impl/SurfaceCombination;
    .end local v3    # "orderedSurfaceConfigList":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    :cond_1
    goto :goto_0

    .line 248
    :cond_2
    return-object v1
.end method

.method getSuggestedStreamSpecifications(ILjava/util/List;Ljava/util/Map;)Landroid/util/Pair;
    .locals 35
    .param p1, "cameraMode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            ">;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;>;)",
            "Landroid/util/Pair<",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Landroidx/camera/core/impl/StreamSpec;",
            ">;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/AttachedSurfaceInfo;",
            "Landroidx/camera/core/impl/StreamSpec;",
            ">;>;"
        }
    .end annotation

    .line 543
    .local p2, "attachedSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local p3, "newUseCaseConfigsSupportedSizeMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Ljava/util/List<Landroid/util/Size;>;>;"
    move-object/from16 v0, p0

    move-object/from16 v2, p2

    move-object/from16 v9, p3

    invoke-direct {v0}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->refreshPreviewSize()V

    .line 545
    new-instance v4, Ljava/util/ArrayList;

    .line 546
    invoke-interface {v9}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v4, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 549
    .local v4, "newUseCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    invoke-direct {v0, v4}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getUseCasesPriorityOrder(Ljava/util/List;)Ljava/util/List;

    move-result-object v5

    .line 550
    .local v5, "useCasesPriorityOrder":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    iget-object v1, v0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mDynamicRangeResolver:Landroidx/camera/camera2/internal/DynamicRangeResolver;

    .line 551
    invoke-virtual {v1, v2, v4, v5}, Landroidx/camera/camera2/internal/DynamicRangeResolver;->resolveAndValidateDynamicRanges(Ljava/util/List;Ljava/util/List;Ljava/util/List;)Ljava/util/Map;

    move-result-object v10

    .line 554
    .local v10, "resolvedDynamicRanges":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/DynamicRange;>;"
    move/from16 v1, p1

    invoke-direct {v0, v1, v10}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->createFeatureSettings(ILjava/util/Map;)Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;

    move-result-object v11

    .line 556
    .local v11, "featureSettings":Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;
    invoke-direct {v0, v11, v2, v9}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->isUseCasesCombinationSupported(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Ljava/util/List;Ljava/util/Map;)Z

    move-result v12

    .line 559
    .local v12, "isSurfaceCombinationSupported":Z
    const-string v13, ".  May be attempting to bind too many use cases. Existing surfaces: "

    const-string v14, " New configs: "

    const-string v15, "No supported surface combination is found for camera device - Id : "

    if-eqz v12, :cond_1e

    .line 568
    invoke-direct {v0, v2, v4, v5}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getTargetFpsRange(Ljava/util/List;Ljava/util/List;Ljava/util/List;)Landroid/util/Range;

    move-result-object v3

    .line 572
    .local v3, "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    nop

    .line 573
    invoke-direct {v0, v9, v11, v3}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->filterSupportedSizes(Ljava/util/Map;Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Landroid/util/Range;)Ljava/util/Map;

    move-result-object v6

    .line 576
    .local v6, "useCaseConfigToFilteredSupportedSizesMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Ljava/util/List<Landroid/util/Size;>;>;"
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 579
    .local v7, "supportedOutputSizesList":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Landroid/util/Size;>;>;"
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/Integer;

    .line 580
    .local v16, "index":Ljava/lang/Integer;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/UseCaseConfig;

    .line 581
    .local v1, "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    invoke-interface {v6, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v18, v1

    .end local v1    # "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    .local v18, "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    move-object/from16 v1, v17

    check-cast v1, Ljava/util/List;

    .line 583
    .local v1, "supportedOutputSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    nop

    .line 584
    move-object/from16 v17, v3

    .end local v3    # "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .local v17, "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-interface/range {v18 .. v18}, Landroidx/camera/core/impl/UseCaseConfig;->getInputFormat()I

    move-result v3

    .line 583
    invoke-virtual {v0, v1, v3}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->applyResolutionSelectionOrderRelatedWorkarounds(Ljava/util/List;I)Ljava/util/List;

    move-result-object v1

    .line 585
    invoke-interface {v7, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 586
    .end local v1    # "supportedOutputSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .end local v16    # "index":Ljava/lang/Integer;
    .end local v18    # "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    move/from16 v1, p1

    move-object/from16 v3, v17

    goto :goto_0

    .line 589
    .end local v17    # "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .restart local v3    # "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    :cond_0
    move-object/from16 v17, v3

    .line 590
    .end local v3    # "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .restart local v17    # "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-direct {v0, v7}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getAllPossibleSizeArrangements(Ljava/util/List;)Ljava/util/List;

    move-result-object v16

    .line 593
    .local v16, "allPossibleSizeArrangements":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Landroid/util/Size;>;>;"
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 594
    .local v1, "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 601
    .local v3, "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/impl/StreamSpec;>;"
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 603
    .local v8, "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    new-instance v18, Ljava/util/HashMap;

    invoke-direct/range {v18 .. v18}, Ljava/util/HashMap;-><init>()V

    .line 606
    .local v18, "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    const/16 v19, 0x0

    .line 607
    .local v19, "savedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    const v20, 0x7fffffff

    .line 608
    .local v20, "savedConfigMaxFps":I
    const/16 v21, 0x0

    .line 609
    .local v21, "savedSizesForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    const v22, 0x7fffffff

    .line 611
    .local v22, "savedConfigMaxFpsForStreamUseCase":I
    invoke-static {v2, v4}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->containsZslUseCase(Ljava/util/List;Ljava/util/List;)Z

    move-result v23

    .line 613
    .local v23, "containsZsl":Z
    const/16 v24, 0x0

    .line 614
    .local v24, "orderedSurfaceConfigListForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    move-object/from16 v25, v6

    .end local v6    # "useCaseConfigToFilteredSupportedSizesMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Ljava/util/List<Landroid/util/Size;>;>;"
    .local v25, "useCaseConfigToFilteredSupportedSizesMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Ljava/util/List<Landroid/util/Size;>;>;"
    invoke-direct {v0, v2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getMaxSupportedFpsFromAttachedSurfaces(Ljava/util/List;)I

    move-result v6

    .line 616
    .local v6, "maxSupportedFps":I
    move-object/from16 v26, v1

    .end local v1    # "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    .local v26, "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    iget-boolean v1, v0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsStreamUseCaseSupported:Z

    if-eqz v1, :cond_6

    if-nez v23, :cond_6

    .line 618
    invoke-interface/range {v16 .. v16}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v27

    :goto_1
    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 619
    .local v1, "possibleSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    move-object/from16 v28, v3

    move-object/from16 v9, v17

    move-object v3, v1

    move-object/from16 v17, v7

    move-object v7, v8

    move-object/from16 v8, v18

    move/from16 v1, p1

    move/from16 v18, v12

    .end local v1    # "possibleSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .end local v12    # "isSurfaceCombinationSupported":Z
    .local v3, "possibleSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .local v7, "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local v8, "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .local v9, "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .local v17, "supportedOutputSizesList":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Landroid/util/Size;>;>;"
    .local v18, "isSurfaceCombinationSupported":Z
    .local v28, "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/impl/StreamSpec;>;"
    invoke-direct/range {v0 .. v8}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getSurfaceConfigListAndFpsCeiling(ILjava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;ILjava/util/Map;Ljava/util/Map;)Landroid/util/Pair;

    move-result-object v12

    move-object v1, v7

    move-object v7, v3

    move-object v3, v8

    .end local v8    # "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .local v1, "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local v3, "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .local v7, "possibleSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    iget-object v8, v12, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v8, Ljava/util/List;

    .line 625
    .local v8, "surfaceConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    nop

    .line 626
    invoke-virtual {v0, v11, v8}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getOrderedSupportedStreamUseCaseSurfaceConfigList(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Ljava/util/List;)Ljava/util/List;

    move-result-object v12

    .line 628
    .end local v24    # "orderedSurfaceConfigListForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    .local v12, "orderedSurfaceConfigListForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    if-eqz v12, :cond_1

    .line 629
    invoke-static {v1, v3, v12}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->areCaptureTypesEligible(Ljava/util/Map;Ljava/util/Map;Ljava/util/List;)Z

    move-result v24

    if-nez v24, :cond_1

    .line 633
    const/4 v12, 0x0

    .line 635
    :cond_1
    if-eqz v12, :cond_3

    .line 636
    move-object/from16 v29, v1

    .end local v1    # "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local v29, "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    iget-object v1, v0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    invoke-static {v1, v12}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->areStreamUseCasesAvailableForSurfaceConfigs(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;Ljava/util/List;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 638
    move-object/from16 v24, v12

    goto :goto_3

    .line 640
    :cond_2
    const/4 v1, 0x0

    move-object/from16 v24, v1

    .end local v12    # "orderedSurfaceConfigListForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    .local v1, "orderedSurfaceConfigListForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    goto :goto_2

    .line 635
    .end local v29    # "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local v1, "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .restart local v12    # "orderedSurfaceConfigListForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    :cond_3
    move-object/from16 v29, v1

    .end local v1    # "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .restart local v29    # "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    move-object/from16 v24, v12

    .line 643
    .end local v12    # "orderedSurfaceConfigListForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    .restart local v24    # "orderedSurfaceConfigListForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    :goto_2
    invoke-interface/range {v29 .. v29}, Ljava/util/Map;->clear()V

    .line 644
    invoke-interface {v3}, Ljava/util/Map;->clear()V

    .line 645
    .end local v7    # "possibleSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .end local v8    # "surfaceConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    move-object/from16 v7, v17

    move/from16 v12, v18

    move-object/from16 v8, v29

    move-object/from16 v18, v3

    move-object/from16 v17, v9

    move-object/from16 v3, v28

    move-object/from16 v9, p3

    goto :goto_1

    .line 618
    .end local v9    # "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .end local v28    # "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/impl/StreamSpec;>;"
    .end local v29    # "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local v3, "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/impl/StreamSpec;>;"
    .local v7, "supportedOutputSizesList":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Landroid/util/Size;>;>;"
    .local v8, "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local v12, "isSurfaceCombinationSupported":Z
    .local v17, "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .local v18, "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    :cond_4
    move-object/from16 v28, v3

    move-object/from16 v29, v8

    move-object/from16 v9, v17

    move-object/from16 v3, v18

    move-object/from16 v17, v7

    move/from16 v18, v12

    .line 649
    .end local v7    # "supportedOutputSizesList":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Landroid/util/Size;>;>;"
    .end local v8    # "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .end local v12    # "isSurfaceCombinationSupported":Z
    .local v3, "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .restart local v9    # "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .local v17, "supportedOutputSizesList":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Landroid/util/Size;>;>;"
    .local v18, "isSurfaceCombinationSupported":Z
    .restart local v28    # "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/impl/StreamSpec;>;"
    .restart local v29    # "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    :goto_3
    if-nez v24, :cond_7

    if-eqz v18, :cond_5

    goto :goto_4

    .line 651
    :cond_5
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCameraId:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v1, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 616
    .end local v9    # "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .end local v28    # "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/impl/StreamSpec;>;"
    .end local v29    # "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local v3, "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/impl/StreamSpec;>;"
    .restart local v7    # "supportedOutputSizesList":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Landroid/util/Size;>;>;"
    .restart local v8    # "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .restart local v12    # "isSurfaceCombinationSupported":Z
    .local v17, "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .local v18, "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    :cond_6
    move-object/from16 v28, v3

    move-object/from16 v29, v8

    move-object/from16 v9, v17

    move-object/from16 v3, v18

    move-object/from16 v17, v7

    move/from16 v18, v12

    .line 659
    .end local v7    # "supportedOutputSizesList":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Landroid/util/Size;>;>;"
    .end local v8    # "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .end local v12    # "isSurfaceCombinationSupported":Z
    .local v3, "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .restart local v9    # "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .local v17, "supportedOutputSizesList":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Landroid/util/Size;>;>;"
    .local v18, "isSurfaceCombinationSupported":Z
    .restart local v28    # "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/impl/StreamSpec;>;"
    .restart local v29    # "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    :cond_7
    :goto_4
    move-object/from16 v12, v24

    .end local v24    # "orderedSurfaceConfigListForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    .local v12, "orderedSurfaceConfigListForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    const/4 v1, 0x0

    .line 660
    .local v1, "supportedSizesFound":Z
    const/4 v7, 0x0

    .line 663
    .local v7, "supportedSizesForStreamUseCaseFound":Z
    invoke-interface/range {v16 .. v16}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    move-object/from16 v34, v19

    move/from16 v19, v1

    move/from16 v1, v20

    move/from16 v20, v7

    move/from16 v7, v22

    move-object/from16 v22, v21

    move-object/from16 v21, v34

    .local v1, "savedConfigMaxFps":I
    .local v7, "savedConfigMaxFpsForStreamUseCase":I
    .local v19, "supportedSizesFound":Z
    .local v20, "supportedSizesForStreamUseCaseFound":Z
    .local v21, "savedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .local v22, "savedSizesForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :goto_5
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_13

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    .line 665
    .local v8, "possibleSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    nop

    .line 666
    move/from16 v24, v7

    .end local v7    # "savedConfigMaxFpsForStreamUseCase":I
    .local v24, "savedConfigMaxFpsForStreamUseCase":I
    const/4 v7, 0x0

    move-object/from16 v27, v3

    move-object v3, v8

    .end local v8    # "possibleSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .local v3, "possibleSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .local v27, "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    const/4 v8, 0x0

    move/from16 v30, v24

    move-object/from16 v24, v14

    move/from16 v14, v30

    move-object/from16 v30, v13

    move-object/from16 v31, v27

    move v13, v1

    move-object/from16 v27, v15

    move-object/from16 v15, v29

    move/from16 v1, p1

    .end local v1    # "savedConfigMaxFps":I
    .end local v24    # "savedConfigMaxFpsForStreamUseCase":I
    .end local v27    # "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .end local v29    # "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local v13, "savedConfigMaxFps":I
    .local v14, "savedConfigMaxFpsForStreamUseCase":I
    .local v15, "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .local v31, "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    invoke-direct/range {v0 .. v8}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getSurfaceConfigListAndFpsCeiling(ILjava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;ILjava/util/Map;Ljava/util/Map;)Landroid/util/Pair;

    move-result-object v7

    .line 669
    .local v7, "resultPair":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;Ljava/lang/Integer;>;"
    iget-object v1, v7, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    .line 670
    .local v1, "surfaceConfigList":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    iget-object v8, v7, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    .line 671
    .local v8, "currentConfigFramerateCeiling":I
    const/16 v29, 0x1

    .line 672
    .local v29, "isConfigFrameRateAcceptable":Z
    if-eqz v9, :cond_9

    .line 673
    if-le v6, v8, :cond_8

    .line 674
    invoke-virtual {v9}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v32

    check-cast v32, Ljava/lang/Integer;

    move-object/from16 v33, v3

    .end local v3    # "possibleSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .local v33, "possibleSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-virtual/range {v32 .. v32}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ge v8, v3, :cond_a

    .line 679
    const/16 v29, 0x0

    goto :goto_6

    .line 673
    .end local v33    # "possibleSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .restart local v3    # "possibleSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :cond_8
    move-object/from16 v33, v3

    .end local v3    # "possibleSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .restart local v33    # "possibleSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    goto :goto_6

    .line 672
    .end local v33    # "possibleSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .restart local v3    # "possibleSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :cond_9
    move-object/from16 v33, v3

    .line 687
    .end local v3    # "possibleSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .restart local v33    # "possibleSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :cond_a
    :goto_6
    const v3, 0x7fffffff

    if-nez v19, :cond_d

    invoke-virtual {v0, v11, v1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->checkSupported(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Ljava/util/List;)Z

    move-result v32

    if-eqz v32, :cond_d

    .line 690
    if-ne v13, v3, :cond_b

    .line 691
    move v13, v8

    .line 692
    move-object/from16 v21, v33

    goto :goto_7

    .line 693
    :cond_b
    if-ge v13, v8, :cond_c

    .line 695
    move v13, v8

    .line 696
    move-object/from16 v21, v33

    .line 700
    :cond_c
    :goto_7
    if-eqz v29, :cond_d

    .line 701
    move v13, v8

    .line 702
    move-object/from16 v21, v33

    .line 703
    const/16 v19, 0x1

    .line 704
    if-eqz v20, :cond_d

    .line 705
    move v1, v13

    move v7, v14

    move-object/from16 v3, v21

    move-object/from16 v8, v22

    goto/16 :goto_a

    .line 713
    :cond_d
    if-eqz v12, :cond_12

    if-nez v20, :cond_12

    .line 715
    invoke-virtual {v0, v11, v1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getOrderedSupportedStreamUseCaseSurfaceConfigList(Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;Ljava/util/List;)Ljava/util/List;

    move-result-object v32

    if-eqz v32, :cond_12

    .line 717
    if-ne v14, v3, :cond_e

    .line 718
    move v3, v8

    .line 719
    .end local v14    # "savedConfigMaxFpsForStreamUseCase":I
    .local v3, "savedConfigMaxFpsForStreamUseCase":I
    move-object/from16 v22, v33

    goto :goto_8

    .line 720
    .end local v3    # "savedConfigMaxFpsForStreamUseCase":I
    .restart local v14    # "savedConfigMaxFpsForStreamUseCase":I
    :cond_e
    if-ge v14, v8, :cond_f

    .line 721
    move v3, v8

    .line 722
    .end local v14    # "savedConfigMaxFpsForStreamUseCase":I
    .restart local v3    # "savedConfigMaxFpsForStreamUseCase":I
    move-object/from16 v22, v33

    goto :goto_8

    .line 720
    .end local v3    # "savedConfigMaxFpsForStreamUseCase":I
    .restart local v14    # "savedConfigMaxFpsForStreamUseCase":I
    :cond_f
    move v3, v14

    .line 725
    .end local v14    # "savedConfigMaxFpsForStreamUseCase":I
    .restart local v3    # "savedConfigMaxFpsForStreamUseCase":I
    :goto_8
    if-eqz v29, :cond_11

    .line 726
    move v3, v8

    .line 727
    move-object/from16 v22, v33

    .line 728
    const/16 v20, 0x1

    .line 729
    if-eqz v19, :cond_10

    .line 730
    move v7, v3

    move v1, v13

    move-object/from16 v3, v21

    move-object/from16 v8, v22

    goto :goto_a

    .line 729
    :cond_10
    move v7, v3

    goto :goto_9

    .line 725
    :cond_11
    move v7, v3

    goto :goto_9

    .line 734
    .end local v1    # "surfaceConfigList":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;"
    .end local v3    # "savedConfigMaxFpsForStreamUseCase":I
    .end local v7    # "resultPair":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/util/List<Landroidx/camera/core/impl/SurfaceConfig;>;Ljava/lang/Integer;>;"
    .end local v8    # "currentConfigFramerateCeiling":I
    .end local v29    # "isConfigFrameRateAcceptable":Z
    .end local v33    # "possibleSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .restart local v14    # "savedConfigMaxFpsForStreamUseCase":I
    :cond_12
    move v7, v14

    .end local v14    # "savedConfigMaxFpsForStreamUseCase":I
    .local v7, "savedConfigMaxFpsForStreamUseCase":I
    :goto_9
    move v1, v13

    move-object/from16 v29, v15

    move-object/from16 v14, v24

    move-object/from16 v15, v27

    move-object/from16 v13, v30

    move-object/from16 v3, v31

    goto/16 :goto_5

    .line 663
    .end local v13    # "savedConfigMaxFps":I
    .end local v15    # "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .end local v31    # "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .local v1, "savedConfigMaxFps":I
    .local v3, "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .local v29, "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    :cond_13
    move v13, v1

    move-object/from16 v31, v3

    move-object/from16 v24, v14

    move-object/from16 v27, v15

    move-object/from16 v15, v29

    move v14, v7

    .end local v1    # "savedConfigMaxFps":I
    .end local v3    # "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .end local v7    # "savedConfigMaxFpsForStreamUseCase":I
    .end local v29    # "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .restart local v13    # "savedConfigMaxFps":I
    .restart local v14    # "savedConfigMaxFpsForStreamUseCase":I
    .restart local v15    # "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .restart local v31    # "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    move-object/from16 v3, v21

    move-object/from16 v8, v22

    .line 737
    .end local v13    # "savedConfigMaxFps":I
    .end local v14    # "savedConfigMaxFpsForStreamUseCase":I
    .end local v21    # "savedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .end local v22    # "savedSizesForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .restart local v1    # "savedConfigMaxFps":I
    .local v3, "savedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .restart local v7    # "savedConfigMaxFpsForStreamUseCase":I
    .local v8, "savedSizesForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :goto_a
    if-eqz v3, :cond_1d

    .line 738
    const/4 v13, 0x0

    .line 739
    .local v13, "targetFramerateForDevice":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    if-eqz v9, :cond_14

    .line 740
    nop

    .line 741
    invoke-direct {v0, v9, v1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getClosestSupportedDeviceFrameRate(Landroid/util/Range;I)Landroid/util/Range;

    move-result-object v13

    .line 744
    :cond_14
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_b
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_16

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v21

    move/from16 v22, v6

    .end local v6    # "maxSupportedFps":I
    .local v22, "maxSupportedFps":I
    move-object/from16 v6, v21

    check-cast v6, Landroidx/camera/core/impl/UseCaseConfig;

    .line 745
    .local v6, "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    nop

    .line 746
    invoke-interface {v4, v6}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v21

    move-object/from16 v29, v9

    .end local v9    # "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .local v29, "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v5, v9}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v9

    .line 745
    invoke-interface {v3, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/util/Size;

    .line 747
    .local v9, "resolutionForUseCase":Landroid/util/Size;
    move-object/from16 v21, v5

    .end local v5    # "useCasesPriorityOrder":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v21, "useCasesPriorityOrder":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-static {v9}, Landroidx/camera/core/impl/StreamSpec;->builder(Landroid/util/Size;)Landroidx/camera/core/impl/StreamSpec$Builder;

    move-result-object v5

    .line 749
    invoke-interface {v10, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Landroidx/camera/core/DynamicRange;

    .line 748
    invoke-static/range {v24 .. v24}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v24

    move-object/from16 v27, v9

    .end local v9    # "resolutionForUseCase":Landroid/util/Size;
    .local v27, "resolutionForUseCase":Landroid/util/Size;
    move-object/from16 v9, v24

    check-cast v9, Landroidx/camera/core/DynamicRange;

    invoke-virtual {v5, v9}, Landroidx/camera/core/impl/StreamSpec$Builder;->setDynamicRange(Landroidx/camera/core/DynamicRange;)Landroidx/camera/core/impl/StreamSpec$Builder;

    move-result-object v5

    .line 751
    invoke-static {v6}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->getStreamSpecImplementationOptions(Landroidx/camera/core/impl/UseCaseConfig;)Landroidx/camera/camera2/impl/Camera2ImplConfig;

    move-result-object v9

    .line 750
    invoke-virtual {v5, v9}, Landroidx/camera/core/impl/StreamSpec$Builder;->setImplementationOptions(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/StreamSpec$Builder;

    move-result-object v5

    .line 753
    .local v5, "streamSpecBuilder":Landroidx/camera/core/impl/StreamSpec$Builder;
    if-eqz v13, :cond_15

    .line 754
    invoke-virtual {v5, v13}, Landroidx/camera/core/impl/StreamSpec$Builder;->setExpectedFrameRateRange(Landroid/util/Range;)Landroidx/camera/core/impl/StreamSpec$Builder;

    .line 756
    :cond_15
    invoke-virtual {v5}, Landroidx/camera/core/impl/StreamSpec$Builder;->build()Landroidx/camera/core/impl/StreamSpec;

    move-result-object v9

    move-object/from16 v24, v5

    move-object/from16 v5, v28

    .end local v28    # "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/impl/StreamSpec;>;"
    .local v5, "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/impl/StreamSpec;>;"
    .local v24, "streamSpecBuilder":Landroidx/camera/core/impl/StreamSpec$Builder;
    invoke-interface {v5, v6, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 757
    .end local v6    # "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    .end local v24    # "streamSpecBuilder":Landroidx/camera/core/impl/StreamSpec$Builder;
    .end local v27    # "resolutionForUseCase":Landroid/util/Size;
    move-object/from16 v5, v21

    move/from16 v6, v22

    move-object/from16 v9, v29

    goto :goto_b

    .line 744
    .end local v21    # "useCasesPriorityOrder":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v22    # "maxSupportedFps":I
    .end local v29    # "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .local v5, "useCasesPriorityOrder":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v6, "maxSupportedFps":I
    .local v9, "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .restart local v28    # "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/impl/StreamSpec;>;"
    :cond_16
    move-object/from16 v21, v5

    move/from16 v22, v6

    move-object/from16 v29, v9

    move-object/from16 v5, v28

    .line 758
    .end local v6    # "maxSupportedFps":I
    .end local v9    # "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .end local v13    # "targetFramerateForDevice":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .end local v28    # "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/impl/StreamSpec;>;"
    .local v5, "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/impl/StreamSpec;>;"
    .restart local v21    # "useCasesPriorityOrder":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v22    # "maxSupportedFps":I
    .restart local v29    # "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    nop

    .line 768
    if-eqz v12, :cond_1c

    if-ne v1, v7, :cond_1c

    .line 770
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v6

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v9

    if-ne v6, v9, :cond_1b

    .line 771
    const/4 v6, 0x0

    .line 772
    .local v6, "hasDifferenceSavedSizes":Z
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_c
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v13

    if-ge v9, v13, :cond_18

    .line 773
    invoke-interface {v3, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/util/Size;

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/util/Size;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_17

    .line 774
    const/4 v6, 0x1

    .line 775
    goto :goto_d

    .line 772
    :cond_17
    add-int/lit8 v9, v9, 0x1

    goto :goto_c

    .line 778
    .end local v9    # "i":I
    :cond_18
    :goto_d
    if-nez v6, :cond_1a

    .line 779
    iget-object v9, v0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCharacteristics:Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 780
    move-object/from16 v13, v26

    .end local v26    # "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    .local v13, "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    invoke-static {v9, v2, v5, v13}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->populateStreamUseCaseStreamSpecOptionWithInteropOverride(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;Ljava/util/List;Ljava/util/Map;Ljava/util/Map;)Z

    move-result v9

    .line 783
    .local v9, "hasStreamUseCaseOverride":Z
    if-nez v9, :cond_19

    .line 784
    nop

    .line 785
    move-object/from16 v14, v31

    .end local v31    # "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .local v14, "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    invoke-static {v5, v13, v15, v14, v12}, Landroidx/camera/camera2/internal/StreamUseCaseUtil;->populateStreamUseCaseStreamSpecOptionWithSupportedSurfaceConfigs(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/List;)V

    goto :goto_e

    .line 783
    .end local v14    # "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .restart local v31    # "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    :cond_19
    move-object/from16 v14, v31

    .end local v31    # "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .restart local v14    # "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    goto :goto_e

    .line 778
    .end local v9    # "hasStreamUseCaseOverride":Z
    .end local v13    # "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    .end local v14    # "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .restart local v26    # "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    .restart local v31    # "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    :cond_1a
    move-object/from16 v13, v26

    move-object/from16 v14, v31

    .end local v26    # "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    .end local v31    # "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .restart local v13    # "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    .restart local v14    # "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    goto :goto_e

    .line 770
    .end local v6    # "hasDifferenceSavedSizes":Z
    .end local v13    # "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    .end local v14    # "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .restart local v26    # "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    .restart local v31    # "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    :cond_1b
    move-object/from16 v13, v26

    move-object/from16 v14, v31

    .end local v26    # "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    .end local v31    # "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .restart local v13    # "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    .restart local v14    # "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    goto :goto_e

    .line 768
    .end local v13    # "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    .end local v14    # "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .restart local v26    # "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    .restart local v31    # "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    :cond_1c
    move-object/from16 v13, v26

    move-object/from16 v14, v31

    .line 793
    .end local v26    # "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    .end local v31    # "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .restart local v13    # "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    .restart local v14    # "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    :goto_e
    new-instance v6, Landroid/util/Pair;

    invoke-direct {v6, v5, v13}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v6

    .line 759
    .end local v13    # "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    .end local v14    # "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .end local v21    # "useCasesPriorityOrder":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v22    # "maxSupportedFps":I
    .end local v29    # "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .local v5, "useCasesPriorityOrder":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v6, "maxSupportedFps":I
    .local v9, "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .restart local v26    # "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    .restart local v28    # "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/impl/StreamSpec;>;"
    .restart local v31    # "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    :cond_1d
    move/from16 v22, v6

    move-object/from16 v29, v9

    move-object/from16 v13, v26

    .end local v6    # "maxSupportedFps":I
    .end local v9    # "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .end local v26    # "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    .restart local v13    # "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    .restart local v22    # "maxSupportedFps":I
    .restart local v29    # "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v26, v1

    move-object/from16 v1, v27

    .end local v1    # "savedConfigMaxFps":I
    .local v26, "savedConfigMaxFps":I
    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v9, v0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCameraId:Ljava/lang/String;

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v9, " and Hardware level: "

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v9, v0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mHardwareLevel:I

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v9, ". May be the specified resolution is too large and not supported. Existing surfaces: "

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v9, v24

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v6, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 560
    .end local v3    # "savedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .end local v7    # "savedConfigMaxFpsForStreamUseCase":I
    .end local v8    # "savedSizesForStreamUseCase":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .end local v13    # "attachedSurfaceStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/AttachedSurfaceInfo;Landroidx/camera/core/impl/StreamSpec;>;"
    .end local v15    # "surfaceConfigIndexAttachedSurfaceInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/AttachedSurfaceInfo;>;"
    .end local v16    # "allPossibleSizeArrangements":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Landroid/util/Size;>;>;"
    .end local v17    # "supportedOutputSizesList":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Landroid/util/Size;>;>;"
    .end local v18    # "isSurfaceCombinationSupported":Z
    .end local v19    # "supportedSizesFound":Z
    .end local v20    # "supportedSizesForStreamUseCaseFound":Z
    .end local v22    # "maxSupportedFps":I
    .end local v23    # "containsZsl":Z
    .end local v25    # "useCaseConfigToFilteredSupportedSizesMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Ljava/util/List<Landroid/util/Size;>;>;"
    .end local v26    # "savedConfigMaxFps":I
    .end local v28    # "suggestedStreamSpecMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/UseCaseConfig<*>;Landroidx/camera/core/impl/StreamSpec;>;"
    .end local v29    # "targetFpsRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    .end local v31    # "surfaceConfigIndexUseCaseConfigMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    .local v12, "isSurfaceCombinationSupported":Z
    :cond_1e
    move-object/from16 v21, v5

    move-object v9, v14

    move-object v1, v15

    .end local v5    # "useCasesPriorityOrder":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v21    # "useCasesPriorityOrder":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v5, v0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mCameraId:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v3, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method getUpdatedSurfaceSizeDefinitionByFormat(I)Landroidx/camera/core/impl/SurfaceSizeDefinition;
    .locals 2
    .param p1, "format"    # I

    .line 1283
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinitionFormats:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1284
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

    invoke-virtual {v0}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getS720pSizeMap()Ljava/util/Map;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/internal/utils/SizeUtil;->RESOLUTION_720P:Landroid/util/Size;

    invoke-direct {p0, v0, v1, p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->updateS720pOrS1440pSizeByFormat(Ljava/util/Map;Landroid/util/Size;I)V

    .line 1286
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

    invoke-virtual {v0}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getS1440pSizeMap()Ljava/util/Map;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/internal/utils/SizeUtil;->RESOLUTION_1440P:Landroid/util/Size;

    invoke-direct {p0, v0, v1, p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->updateS720pOrS1440pSizeByFormat(Ljava/util/Map;Landroid/util/Size;I)V

    .line 1288
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

    invoke-virtual {v0}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getMaximumSizeMap()Ljava/util/Map;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->updateMaximumSizeByFormat(Ljava/util/Map;I)V

    .line 1289
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

    invoke-virtual {v0}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getUltraMaximumSizeMap()Ljava/util/Map;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->updateUltraMaximumSizeByFormat(Ljava/util/Map;I)V

    .line 1290
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinitionFormats:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1292
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mSurfaceSizeDefinition:Landroidx/camera/core/impl/SurfaceSizeDefinition;

    return-object v0
.end method

.method isBurstCaptureSupported()Z
    .locals 1

    .line 203
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsBurstCaptureSupported:Z

    return v0
.end method

.method isRawSupported()Z
    .locals 1

    .line 199
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->mIsRawSupported:Z

    return v0
.end method

.method transformSurfaceConfig(IILandroid/util/Size;)Landroidx/camera/core/impl/SurfaceConfig;
    .locals 1
    .param p1, "cameraMode"    # I
    .param p2, "imageFormat"    # I
    .param p3, "size"    # Landroid/util/Size;

    .line 301
    nop

    .line 305
    invoke-virtual {p0, p2}, Landroidx/camera/camera2/internal/SupportedSurfaceCombination;->getUpdatedSurfaceSizeDefinitionByFormat(I)Landroidx/camera/core/impl/SurfaceSizeDefinition;

    move-result-object v0

    .line 301
    invoke-static {p1, p2, p3, v0}, Landroidx/camera/core/impl/SurfaceConfig;->transformSurfaceConfig(IILandroid/util/Size;Landroidx/camera/core/impl/SurfaceSizeDefinition;)Landroidx/camera/core/impl/SurfaceConfig;

    move-result-object v0

    return-object v0
.end method
