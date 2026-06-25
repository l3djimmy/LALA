.class Landroidx/camera/core/internal/SupportedOutputSizesSorter;
.super Ljava/lang/Object;
.source "SupportedOutputSizesSorter.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "SupportedOutputSizesCollector"


# instance fields
.field private final mCameraInfoInternal:Landroidx/camera/core/impl/CameraInfoInternal;

.field private final mFullFovRatio:Landroid/util/Rational;

.field private final mIsSensorLandscapeResolution:Z

.field private final mLensFacing:I

.field private final mSensorOrientation:I

.field private final mSupportedOutputSizesSorterLegacy:Landroidx/camera/core/internal/SupportedOutputSizesSorterLegacy;


# direct methods
.method constructor <init>(Landroidx/camera/core/impl/CameraInfoInternal;Landroid/util/Size;)V
    .locals 3
    .param p1, "cameraInfoInternal"    # Landroidx/camera/core/impl/CameraInfoInternal;
    .param p2, "activeArraySize"    # Landroid/util/Size;

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    iput-object p1, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mCameraInfoInternal:Landroidx/camera/core/impl/CameraInfoInternal;

    .line 81
    iget-object v0, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mCameraInfoInternal:Landroidx/camera/core/impl/CameraInfoInternal;

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraInfoInternal;->getSensorRotationDegrees()I

    move-result v0

    iput v0, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mSensorOrientation:I

    .line 82
    iget-object v0, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mCameraInfoInternal:Landroidx/camera/core/impl/CameraInfoInternal;

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraInfoInternal;->getLensFacing()I

    move-result v0

    iput v0, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mLensFacing:I

    .line 83
    if-eqz p2, :cond_0

    invoke-direct {p0, p2}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->calculateFullFovRatioFromActiveArraySize(Landroid/util/Size;)Landroid/util/Rational;

    move-result-object v0

    goto :goto_0

    .line 84
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mCameraInfoInternal:Landroidx/camera/core/impl/CameraInfoInternal;

    invoke-direct {p0, v0}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->calculateFullFovRatioFromSupportedOutputSizes(Landroidx/camera/core/impl/CameraInfoInternal;)Landroid/util/Rational;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mFullFovRatio:Landroid/util/Rational;

    .line 87
    iget-object v0, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mFullFovRatio:Landroid/util/Rational;

    const/4 v1, 0x1

    if-eqz v0, :cond_2

    .line 88
    iget-object v0, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mFullFovRatio:Landroid/util/Rational;

    .line 87
    invoke-virtual {v0}, Landroid/util/Rational;->getNumerator()I

    move-result v0

    iget-object v2, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mFullFovRatio:Landroid/util/Rational;

    .line 88
    invoke-virtual {v2}, Landroid/util/Rational;->getDenominator()I

    move-result v2

    if-lt v0, v2, :cond_1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    goto :goto_2

    :cond_2
    :goto_1
    nop

    :goto_2
    iput-boolean v1, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mIsSensorLandscapeResolution:Z

    .line 89
    new-instance v0, Landroidx/camera/core/internal/SupportedOutputSizesSorterLegacy;

    iget-object v1, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mFullFovRatio:Landroid/util/Rational;

    invoke-direct {v0, p1, v1}, Landroidx/camera/core/internal/SupportedOutputSizesSorterLegacy;-><init>(Landroidx/camera/core/impl/CameraInfoInternal;Landroid/util/Rational;)V

    iput-object v0, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mSupportedOutputSizesSorterLegacy:Landroidx/camera/core/internal/SupportedOutputSizesSorterLegacy;

    .line 91
    return-void
.end method

.method private applyAspectRatioStrategy(Ljava/util/List;Landroidx/camera/core/resolutionselector/AspectRatioStrategy;)Ljava/util/LinkedHashMap;
    .locals 2
    .param p2, "aspectRatioStrategy"    # Landroidx/camera/core/resolutionselector/AspectRatioStrategy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;",
            "Landroidx/camera/core/resolutionselector/AspectRatioStrategy;",
            ")",
            "Ljava/util/LinkedHashMap<",
            "Landroid/util/Rational;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;>;"
        }
    .end annotation

    .line 326
    .local p1, "resolutionCandidateList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    nop

    .line 327
    invoke-static {p1}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->groupSizesByAspectRatio(Ljava/util/List;)Ljava/util/Map;

    move-result-object v0

    .line 330
    .local v0, "aspectRatioSizeListMap":Ljava/util/Map;, "Ljava/util/Map<Landroid/util/Rational;Ljava/util/List<Landroid/util/Size;>;>;"
    invoke-direct {p0, v0, p2}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->applyAspectRatioStrategyFallbackRule(Ljava/util/Map;Landroidx/camera/core/resolutionselector/AspectRatioStrategy;)Ljava/util/LinkedHashMap;

    move-result-object v1

    return-object v1
.end method

.method private applyAspectRatioStrategyFallbackRule(Ljava/util/Map;Landroidx/camera/core/resolutionselector/AspectRatioStrategy;)Ljava/util/LinkedHashMap;
    .locals 6
    .param p2, "aspectRatioStrategy"    # Landroidx/camera/core/resolutionselector/AspectRatioStrategy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Landroid/util/Rational;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;>;",
            "Landroidx/camera/core/resolutionselector/AspectRatioStrategy;",
            ")",
            "Ljava/util/LinkedHashMap<",
            "Landroid/util/Rational;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;>;"
        }
    .end annotation

    .line 345
    .local p1, "sizeGroupsMap":Ljava/util/Map;, "Ljava/util/Map<Landroid/util/Rational;Ljava/util/List<Landroid/util/Size;>;>;"
    nop

    .line 346
    invoke-virtual {p2}, Landroidx/camera/core/resolutionselector/AspectRatioStrategy;->getPreferredAspectRatio()I

    move-result v0

    iget-boolean v1, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mIsSensorLandscapeResolution:Z

    .line 345
    invoke-static {v0, v1}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->getTargetAspectRatioRationalValue(IZ)Landroid/util/Rational;

    move-result-object v0

    .line 350
    .local v0, "aspectRatio":Landroid/util/Rational;
    invoke-virtual {p2}, Landroidx/camera/core/resolutionselector/AspectRatioStrategy;->getFallbackRule()I

    move-result v1

    if-nez v1, :cond_1

    .line 351
    nop

    .line 352
    invoke-virtual {p2}, Landroidx/camera/core/resolutionselector/AspectRatioStrategy;->getPreferredAspectRatio()I

    move-result v1

    iget-boolean v2, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mIsSensorLandscapeResolution:Z

    .line 351
    invoke-static {v1, v2}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->getTargetAspectRatioRationalValue(IZ)Landroid/util/Rational;

    move-result-object v1

    .line 353
    .local v1, "preferredAspectRatio":Landroid/util/Rational;
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/Rational;

    .line 354
    .local v3, "ratio":Landroid/util/Rational;
    invoke-virtual {v3, v1}, Landroid/util/Rational;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 355
    invoke-interface {p1, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 357
    .end local v3    # "ratio":Landroid/util/Rational;
    :cond_0
    goto :goto_0

    .line 361
    .end local v1    # "preferredAspectRatio":Landroid/util/Rational;
    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 362
    .local v1, "aspectRatios":Ljava/util/List;, "Ljava/util/List<Landroid/util/Rational;>;"
    new-instance v2, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;

    iget-object v3, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mFullFovRatio:Landroid/util/Rational;

    invoke-direct {v2, v0, v3}, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;-><init>(Landroid/util/Rational;Landroid/util/Rational;)V

    invoke-static {v1, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 367
    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    .line 368
    .local v2, "sortedAspectRatioSizeListMap":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Landroid/util/Rational;Ljava/util/List<Landroid/util/Size;>;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/util/Rational;

    .line 369
    .local v4, "ratio":Landroid/util/Rational;
    invoke-interface {p1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-virtual {v2, v4, v5}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 370
    .end local v4    # "ratio":Landroid/util/Rational;
    goto :goto_1

    .line 372
    :cond_2
    return-object v2
.end method

.method private applyHighResolutionSettings(Ljava/util/List;Landroidx/camera/core/resolutionselector/ResolutionSelector;I)Ljava/util/List;
    .locals 3
    .param p2, "resolutionSelector"    # Landroidx/camera/core/resolutionselector/ResolutionSelector;
    .param p3, "imageFormat"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;",
            "Landroidx/camera/core/resolutionselector/ResolutionSelector;",
            "I)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 300
    .local p1, "resolutionCandidateList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-virtual {p2}, Landroidx/camera/core/resolutionselector/ResolutionSelector;->getAllowedResolutionMode()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 302
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 303
    .local v0, "allSizesList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 304
    iget-object v2, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mCameraInfoInternal:Landroidx/camera/core/impl/CameraInfoInternal;

    invoke-interface {v2, p3}, Landroidx/camera/core/impl/CameraInfoInternal;->getSupportedHighResolutions(I)Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 305
    new-instance v2, Landroidx/camera/core/impl/utils/CompareSizesByArea;

    invoke-direct {v2, v1}, Landroidx/camera/core/impl/utils/CompareSizesByArea;-><init>(Z)V

    invoke-static {v0, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 306
    return-object v0

    .line 309
    .end local v0    # "allSizesList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :cond_0
    return-object p1
.end method

.method private static applyMaxResolutionRestriction(Ljava/util/LinkedHashMap;Landroid/util/Size;)V
    .locals 8
    .param p1, "maxResolution"    # Landroid/util/Size;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/LinkedHashMap<",
            "Landroid/util/Rational;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;>;",
            "Landroid/util/Size;",
            ")V"
        }
    .end annotation

    .line 458
    .local p0, "sortedAspectRatioSizeListMap":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Landroid/util/Rational;Ljava/util/List<Landroid/util/Size;>;>;"
    invoke-static {p1}, Landroidx/camera/core/internal/utils/SizeUtil;->getArea(Landroid/util/Size;)I

    move-result v0

    .line 459
    .local v0, "maxResolutionAreaSize":I
    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Rational;

    .line 460
    .local v2, "key":Landroid/util/Rational;
    invoke-virtual {p0, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 461
    .local v3, "supportedSizesList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 462
    .local v4, "filteredResultList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/util/Size;

    .line 463
    .local v6, "size":Landroid/util/Size;
    invoke-static {v6}, Landroidx/camera/core/internal/utils/SizeUtil;->getArea(Landroid/util/Size;)I

    move-result v7

    if-gt v7, v0, :cond_0

    .line 464
    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 466
    .end local v6    # "size":Landroid/util/Size;
    :cond_0
    goto :goto_1

    .line 467
    :cond_1
    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 468
    invoke-interface {v3, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 469
    .end local v2    # "key":Landroid/util/Rational;
    .end local v3    # "supportedSizesList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .end local v4    # "filteredResultList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    goto :goto_0

    .line 470
    :cond_2
    return-void
.end method

.method private applyResolutionFilter(Ljava/util/List;Landroidx/camera/core/resolutionselector/ResolutionFilter;I)Ljava/util/List;
    .locals 5
    .param p2, "resolutionFilter"    # Landroidx/camera/core/resolutionselector/ResolutionFilter;
    .param p3, "targetRotation"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;",
            "Landroidx/camera/core/resolutionselector/ResolutionFilter;",
            "I)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 487
    .local p1, "sizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    if-nez p2, :cond_0

    .line 488
    return-object p1

    .line 493
    :cond_0
    invoke-static {p3}, Landroidx/camera/core/impl/utils/CameraOrientationUtil;->surfaceRotationToDegrees(I)I

    move-result v0

    .line 495
    .local v0, "destRotationDegrees":I
    iget v1, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mSensorOrientation:I

    iget v2, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mLensFacing:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    .line 496
    :goto_0
    invoke-static {v0, v1, v3}, Landroidx/camera/core/impl/utils/CameraOrientationUtil;->getRelativeImageRotation(IIZ)I

    move-result v1

    .line 499
    .local v1, "rotationDegrees":I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {p2, v2, v1}, Landroidx/camera/core/resolutionselector/ResolutionFilter;->filter(Ljava/util/List;I)Ljava/util/List;

    move-result-object v2

    .line 501
    .local v2, "filteredResultList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {p1, v2}, Ljava/util/List;->containsAll(Ljava/util/Collection;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 502
    return-object v2

    .line 504
    :cond_2
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v4, "The returned sizes list of the resolution filter must be a subset of the provided sizes list."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private static applyResolutionStrategy(Ljava/util/LinkedHashMap;Landroidx/camera/core/resolutionselector/ResolutionStrategy;)V
    .locals 3
    .param p1, "resolutionStrategy"    # Landroidx/camera/core/resolutionselector/ResolutionStrategy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/LinkedHashMap<",
            "Landroid/util/Rational;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;>;",
            "Landroidx/camera/core/resolutionselector/ResolutionStrategy;",
            ")V"
        }
    .end annotation

    .line 389
    .local p0, "sortedAspectRatioSizeListMap":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Landroid/util/Rational;Ljava/util/List<Landroid/util/Size;>;>;"
    if-nez p1, :cond_0

    .line 390
    return-void

    .line 394
    :cond_0
    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Rational;

    .line 395
    .local v1, "key":Landroid/util/Rational;
    invoke-virtual {p0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-static {v2, p1}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->applyResolutionStrategyFallbackRule(Ljava/util/List;Landroidx/camera/core/resolutionselector/ResolutionStrategy;)V

    .line 397
    .end local v1    # "key":Landroid/util/Rational;
    goto :goto_0

    .line 398
    :cond_1
    return-void
.end method

.method private static applyResolutionStrategyFallbackRule(Ljava/util/List;Landroidx/camera/core/resolutionselector/ResolutionStrategy;)V
    .locals 5
    .param p1, "resolutionStrategy"    # Landroidx/camera/core/resolutionselector/ResolutionStrategy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;",
            "Landroidx/camera/core/resolutionselector/ResolutionStrategy;",
            ")V"
        }
    .end annotation

    .line 409
    .local p0, "supportedSizesList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 410
    return-void

    .line 412
    :cond_0
    invoke-virtual {p1}, Landroidx/camera/core/resolutionselector/ResolutionStrategy;->getFallbackRule()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 414
    .local v0, "fallbackRule":Ljava/lang/Integer;
    sget-object v1, Landroidx/camera/core/resolutionselector/ResolutionStrategy;->HIGHEST_AVAILABLE_STRATEGY:Landroidx/camera/core/resolutionselector/ResolutionStrategy;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 416
    return-void

    .line 419
    :cond_1
    invoke-virtual {p1}, Landroidx/camera/core/resolutionselector/ResolutionStrategy;->getBoundSize()Landroid/util/Size;

    move-result-object v1

    .line 421
    .local v1, "boundSize":Landroid/util/Size;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    packed-switch v2, :pswitch_data_0

    goto :goto_0

    .line 438
    :pswitch_0
    invoke-static {p0, v1, v3}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->sortSupportedSizesByFallbackRuleClosestLowerThenHigher(Ljava/util/List;Landroid/util/Size;Z)V

    .line 440
    goto :goto_0

    .line 434
    :pswitch_1
    invoke-static {p0, v1, v4}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->sortSupportedSizesByFallbackRuleClosestLowerThenHigher(Ljava/util/List;Landroid/util/Size;Z)V

    .line 436
    goto :goto_0

    .line 430
    :pswitch_2
    invoke-static {p0, v1, v3}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->sortSupportedSizesByFallbackRuleClosestHigherThenLower(Ljava/util/List;Landroid/util/Size;Z)V

    .line 432
    goto :goto_0

    .line 426
    :pswitch_3
    invoke-static {p0, v1, v4}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->sortSupportedSizesByFallbackRuleClosestHigherThenLower(Ljava/util/List;Landroid/util/Size;Z)V

    .line 428
    goto :goto_0

    .line 423
    :pswitch_4
    invoke-static {p0, v1}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->sortSupportedSizesByFallbackRuleNone(Ljava/util/List;Landroid/util/Size;)V

    .line 424
    nop

    .line 444
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private calculateFullFovRatioFromActiveArraySize(Landroid/util/Size;)Landroid/util/Rational;
    .locals 3
    .param p1, "activeArraySize"    # Landroid/util/Size;

    .line 98
    new-instance v0, Landroid/util/Rational;

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/util/Rational;-><init>(II)V

    return-object v0
.end method

.method private calculateFullFovRatioFromSupportedOutputSizes(Landroidx/camera/core/impl/CameraInfoInternal;)Landroid/util/Rational;
    .locals 5
    .param p1, "cameraInfoInternal"    # Landroidx/camera/core/impl/CameraInfoInternal;

    .line 111
    const/16 v0, 0x100

    invoke-interface {p1, v0}, Landroidx/camera/core/impl/CameraInfoInternal;->getSupportedResolutions(I)Ljava/util/List;

    move-result-object v0

    .line 112
    .local v0, "jpegOutputSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 113
    const/4 v1, 0x0

    return-object v1

    .line 115
    :cond_0
    new-instance v1, Landroidx/camera/core/impl/utils/CompareSizesByArea;

    invoke-direct {v1}, Landroidx/camera/core/impl/utils/CompareSizesByArea;-><init>()V

    invoke-static {v0, v1}, Ljava/util/Collections;->max(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Size;

    .line 116
    .local v1, "maxSize":Landroid/util/Size;
    new-instance v2, Landroid/util/Rational;

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v3

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v4

    invoke-direct {v2, v3, v4}, Landroid/util/Rational;-><init>(II)V

    return-object v2
.end method

.method private getCustomizedSupportedResolutionsFromConfig(ILandroidx/camera/core/impl/ImageOutputConfig;)Ljava/util/List;
    .locals 6
    .param p1, "imageFormat"    # I
    .param p2, "config"    # Landroidx/camera/core/impl/ImageOutputConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroidx/camera/core/impl/ImageOutputConfig;",
            ")",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 158
    const/4 v0, 0x0

    .line 161
    .local v0, "outputSizes":[Landroid/util/Size;
    nop

    .line 162
    const/4 v1, 0x0

    invoke-interface {p2, v1}, Landroidx/camera/core/impl/ImageOutputConfig;->getSupportedResolutions(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    .line 164
    .local v2, "formatResolutionsPairList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Pair<Ljava/lang/Integer;[Landroid/util/Size;>;>;"
    if-eqz v2, :cond_1

    .line 165
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/util/Pair;

    .line 166
    .local v4, "formatResolutionPair":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;[Landroid/util/Size;>;"
    iget-object v5, v4, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ne v5, p1, :cond_0

    .line 167
    iget-object v3, v4, Landroid/util/Pair;->second:Ljava/lang/Object;

    move-object v0, v3

    check-cast v0, [Landroid/util/Size;

    .line 168
    goto :goto_1

    .line 170
    .end local v4    # "formatResolutionPair":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;[Landroid/util/Size;>;"
    :cond_0
    goto :goto_0

    .line 173
    :cond_1
    :goto_1
    if-nez v0, :cond_2

    goto :goto_2

    :cond_2
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    :goto_2
    return-object v1
.end method

.method private getResolutionCandidateList(Landroidx/camera/core/impl/UseCaseConfig;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 257
    .local p1, "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    invoke-interface {p1}, Landroidx/camera/core/impl/UseCaseConfig;->getInputFormat()I

    move-result v0

    .line 258
    .local v0, "imageFormat":I
    move-object v1, p1

    check-cast v1, Landroidx/camera/core/impl/ImageOutputConfig;

    .line 260
    .local v1, "imageOutputConfig":Landroidx/camera/core/impl/ImageOutputConfig;
    invoke-direct {p0, v0, v1}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->getCustomizedSupportedResolutionsFromConfig(ILandroidx/camera/core/impl/ImageOutputConfig;)Ljava/util/List;

    move-result-object v2

    .line 265
    .local v2, "resolutionCandidateList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    if-nez v2, :cond_0

    .line 266
    iget-object v3, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mCameraInfoInternal:Landroidx/camera/core/impl/CameraInfoInternal;

    invoke-interface {v3, v0}, Landroidx/camera/core/impl/CameraInfoInternal;->getSupportedResolutions(I)Ljava/util/List;

    move-result-object v2

    .line 271
    :cond_0
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 273
    .end local v2    # "resolutionCandidateList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .local v3, "resolutionCandidateList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    new-instance v2, Landroidx/camera/core/impl/utils/CompareSizesByArea;

    const/4 v4, 0x1

    invoke-direct {v2, v4}, Landroidx/camera/core/impl/utils/CompareSizesByArea;-><init>(Z)V

    invoke-static {v3, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 275
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 276
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "The retrieved supported resolutions from camera info internal is empty. Format is "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "."

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v4, "SupportedOutputSizesCollector"

    invoke-static {v4, v2}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 280
    :cond_1
    return-object v3
.end method

.method static getResolutionListGroupingAspectRatioKeys(Ljava/util/List;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;)",
            "Ljava/util/List<",
            "Landroid/util/Rational;",
            ">;"
        }
    .end annotation

    .line 631
    .local p0, "resolutionCandidateList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 635
    .local v0, "aspectRatios":Ljava/util/List;, "Ljava/util/List<Landroid/util/Rational;>;"
    sget-object v1, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_4_3:Landroid/util/Rational;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 636
    sget-object v1, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_16_9:Landroid/util/Rational;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 639
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Size;

    .line 640
    .local v2, "size":Landroid/util/Size;
    new-instance v3, Landroid/util/Rational;

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v4

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v5

    invoke-direct {v3, v4, v5}, Landroid/util/Rational;-><init>(II)V

    .line 641
    .local v3, "newRatio":Landroid/util/Rational;
    invoke-interface {v0, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    .line 645
    .local v4, "aspectRatioFound":Z
    if-nez v4, :cond_2

    .line 646
    const/4 v5, 0x0

    .line 647
    .local v5, "hasMatchingAspectRatio":Z
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/util/Rational;

    .line 648
    .local v7, "aspectRatio":Landroid/util/Rational;
    invoke-static {v2, v7}, Landroidx/camera/core/impl/utils/AspectRatioUtil;->hasMatchingAspectRatio(Landroid/util/Size;Landroid/util/Rational;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 649
    const/4 v5, 0x1

    .line 650
    goto :goto_2

    .line 652
    .end local v7    # "aspectRatio":Landroid/util/Rational;
    :cond_0
    goto :goto_1

    .line 653
    :cond_1
    :goto_2
    if-nez v5, :cond_2

    .line 654
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 657
    .end local v2    # "size":Landroid/util/Size;
    .end local v3    # "newRatio":Landroid/util/Rational;
    .end local v4    # "aspectRatioFound":Z
    .end local v5    # "hasMatchingAspectRatio":Z
    :cond_2
    goto :goto_0

    .line 659
    :cond_3
    return-object v0
.end method

.method static getTargetAspectRatioRationalValue(IZ)Landroid/util/Rational;
    .locals 3
    .param p0, "aspectRatio"    # I
    .param p1, "isSensorLandscapeResolution"    # Z

    .line 602
    const/4 v0, 0x0

    .line 604
    .local v0, "outputRatio":Landroid/util/Rational;
    packed-switch p0, :pswitch_data_0

    .line 616
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Undefined target aspect ratio: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "SupportedOutputSizesCollector"

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 610
    :pswitch_0
    if-eqz p1, :cond_0

    sget-object v1, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_16_9:Landroid/util/Rational;

    goto :goto_0

    .line 611
    :cond_0
    sget-object v1, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_9_16:Landroid/util/Rational;

    :goto_0
    move-object v0, v1

    .line 612
    goto :goto_2

    .line 606
    :pswitch_1
    if-eqz p1, :cond_1

    sget-object v1, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_4_3:Landroid/util/Rational;

    goto :goto_1

    .line 607
    :cond_1
    sget-object v1, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_3_4:Landroid/util/Rational;

    :goto_1
    move-object v0, v1

    .line 608
    goto :goto_2

    .line 614
    :pswitch_2
    nop

    .line 619
    :goto_2
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method static groupSizesByAspectRatio(Ljava/util/List;)Ljava/util/Map;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;)",
            "Ljava/util/Map<",
            "Landroid/util/Rational;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;>;"
        }
    .end annotation

    .line 666
    .local p0, "sizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 668
    .local v0, "aspectRatioSizeListMap":Ljava/util/Map;, "Ljava/util/Map<Landroid/util/Rational;Ljava/util/List<Landroid/util/Size;>;>;"
    invoke-static {p0}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->getResolutionListGroupingAspectRatioKeys(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    .line 670
    .local v1, "aspectRatioKeys":Ljava/util/List;, "Ljava/util/List<Landroid/util/Rational;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/Rational;

    .line 671
    .local v3, "aspectRatio":Landroid/util/Rational;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 672
    .end local v3    # "aspectRatio":Landroid/util/Rational;
    goto :goto_0

    .line 674
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/Size;

    .line 675
    .local v3, "outputSize":Landroid/util/Size;
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/util/Rational;

    .line 678
    .local v5, "key":Landroid/util/Rational;
    invoke-static {v3, v5}, Landroidx/camera/core/impl/utils/AspectRatioUtil;->hasMatchingAspectRatio(Landroid/util/Size;Landroid/util/Rational;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 679
    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    invoke-interface {v6, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 681
    .end local v5    # "key":Landroid/util/Rational;
    :cond_1
    goto :goto_2

    .line 682
    .end local v3    # "outputSize":Landroid/util/Size;
    :cond_2
    goto :goto_1

    .line 684
    :cond_3
    return-object v0
.end method

.method private sortSupportedOutputSizesByResolutionSelector(Landroidx/camera/core/impl/UseCaseConfig;)Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 203
    .local p1, "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    move-object v0, p1

    check-cast v0, Landroidx/camera/core/impl/ImageOutputConfig;

    .line 204
    invoke-interface {v0}, Landroidx/camera/core/impl/ImageOutputConfig;->getResolutionSelector()Landroidx/camera/core/resolutionselector/ResolutionSelector;

    move-result-object v0

    .line 207
    .local v0, "resolutionSelector":Landroidx/camera/core/resolutionselector/ResolutionSelector;
    invoke-direct {p0, p1}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->getResolutionCandidateList(Landroidx/camera/core/impl/UseCaseConfig;)Ljava/util/List;

    move-result-object v1

    .line 210
    .local v1, "resolutionCandidateList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    const/4 v2, 0x0

    invoke-interface {p1, v2}, Landroidx/camera/core/impl/UseCaseConfig;->isHigResolutionDisabled(Z)Z

    move-result v3

    if-nez v3, :cond_0

    .line 211
    nop

    .line 212
    invoke-interface {p1}, Landroidx/camera/core/impl/UseCaseConfig;->getInputFormat()I

    move-result v3

    .line 211
    invoke-direct {p0, v1, v0, v3}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->applyHighResolutionSettings(Ljava/util/List;Landroidx/camera/core/resolutionselector/ResolutionSelector;I)Ljava/util/List;

    move-result-object v1

    .line 216
    :cond_0
    nop

    .line 218
    invoke-virtual {v0}, Landroidx/camera/core/resolutionselector/ResolutionSelector;->getAspectRatioStrategy()Landroidx/camera/core/resolutionselector/AspectRatioStrategy;

    move-result-object v3

    .line 217
    invoke-direct {p0, v1, v3}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->applyAspectRatioStrategy(Ljava/util/List;Landroidx/camera/core/resolutionselector/AspectRatioStrategy;)Ljava/util/LinkedHashMap;

    move-result-object v3

    .line 222
    .local v3, "aspectRatioSizeListMap":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Landroid/util/Rational;Ljava/util/List<Landroid/util/Size;>;>;"
    move-object v4, p1

    check-cast v4, Landroidx/camera/core/impl/ImageOutputConfig;

    const/4 v5, 0x0

    invoke-interface {v4, v5}, Landroidx/camera/core/impl/ImageOutputConfig;->getMaxResolution(Landroid/util/Size;)Landroid/util/Size;

    move-result-object v4

    .line 223
    .local v4, "maxResolution":Landroid/util/Size;
    if-eqz v4, :cond_1

    .line 224
    invoke-static {v3, v4}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->applyMaxResolutionRestriction(Ljava/util/LinkedHashMap;Landroid/util/Size;)V

    .line 228
    :cond_1
    invoke-virtual {v0}, Landroidx/camera/core/resolutionselector/ResolutionSelector;->getResolutionStrategy()Landroidx/camera/core/resolutionselector/ResolutionStrategy;

    move-result-object v5

    invoke-static {v3, v5}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->applyResolutionStrategy(Ljava/util/LinkedHashMap;Landroidx/camera/core/resolutionselector/ResolutionStrategy;)V

    .line 231
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 232
    .local v5, "resultList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 233
    .local v7, "sortedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_3

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/util/Size;

    .line 236
    .local v9, "size":Landroid/util/Size;
    invoke-interface {v5, v9}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_2

    .line 237
    invoke-interface {v5, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 239
    .end local v9    # "size":Landroid/util/Size;
    :cond_2
    goto :goto_1

    .line 240
    .end local v7    # "sortedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :cond_3
    goto :goto_0

    .line 243
    :cond_4
    invoke-virtual {v0}, Landroidx/camera/core/resolutionselector/ResolutionSelector;->getResolutionFilter()Landroidx/camera/core/resolutionselector/ResolutionFilter;

    move-result-object v6

    move-object v7, p1

    check-cast v7, Landroidx/camera/core/impl/ImageOutputConfig;

    .line 244
    invoke-interface {v7, v2}, Landroidx/camera/core/impl/ImageOutputConfig;->getTargetRotation(I)I

    move-result v2

    .line 243
    invoke-direct {p0, v5, v6, v2}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->applyResolutionFilter(Ljava/util/List;Landroidx/camera/core/resolutionselector/ResolutionFilter;I)Ljava/util/List;

    move-result-object v2

    return-object v2
.end method

.method static sortSupportedSizesByFallbackRuleClosestHigherThenLower(Ljava/util/List;Landroid/util/Size;Z)V
    .locals 5
    .param p1, "boundSize"    # Landroid/util/Size;
    .param p2, "keepLowerSizes"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;",
            "Landroid/util/Size;",
            "Z)V"
        }
    .end annotation

    .line 536
    .local p0, "supportedSizesList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 538
    .local v0, "lowerSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_1

    .line 539
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Size;

    .line 540
    .local v2, "outputSize":Landroid/util/Size;
    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v3

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v4

    if-lt v3, v4, :cond_0

    .line 541
    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v3

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v4

    if-ge v3, v4, :cond_1

    .line 545
    :cond_0
    const/4 v3, 0x0

    invoke-interface {v0, v3, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 538
    .end local v2    # "outputSize":Landroid/util/Size;
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 551
    .end local v1    # "i":I
    :cond_1
    invoke-interface {p0, v0}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 554
    invoke-static {p0}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 555
    if-eqz p2, :cond_2

    .line 557
    invoke-interface {p0, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 559
    :cond_2
    return-void
.end method

.method private static sortSupportedSizesByFallbackRuleClosestLowerThenHigher(Ljava/util/List;Landroid/util/Size;Z)V
    .locals 5
    .param p1, "boundSize"    # Landroid/util/Size;
    .param p2, "keepHigherSizes"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;",
            "Landroid/util/Size;",
            "Z)V"
        }
    .end annotation

    .line 573
    .local p0, "supportedSizesList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 575
    .local v0, "higherSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 576
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Size;

    .line 577
    .local v2, "outputSize":Landroid/util/Size;
    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v3

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v4

    if-gt v3, v4, :cond_0

    .line 578
    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v3

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v4

    if-le v3, v4, :cond_1

    .line 582
    :cond_0
    const/4 v3, 0x0

    invoke-interface {v0, v3, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 575
    .end local v2    # "outputSize":Landroid/util/Size;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 589
    .end local v1    # "i":I
    :cond_1
    invoke-interface {p0, v0}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 590
    if-eqz p2, :cond_2

    .line 592
    invoke-interface {p0, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 594
    :cond_2
    return-void
.end method

.method private static sortSupportedSizesByFallbackRuleNone(Ljava/util/List;Landroid/util/Size;)V
    .locals 1
    .param p1, "boundSize"    # Landroid/util/Size;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;",
            "Landroid/util/Size;",
            ")V"
        }
    .end annotation

    .line 517
    .local p0, "supportedSizesList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    .line 518
    .local v0, "containsBoundSize":Z
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 519
    if-eqz v0, :cond_0

    .line 520
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 522
    :cond_0
    return-void
.end method


# virtual methods
.method getSortedSupportedOutputSizes(Landroidx/camera/core/impl/UseCaseConfig;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 128
    .local p1, "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    move-object v0, p1

    check-cast v0, Landroidx/camera/core/impl/ImageOutputConfig;

    .line 129
    .local v0, "imageOutputConfig":Landroidx/camera/core/impl/ImageOutputConfig;
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroidx/camera/core/impl/ImageOutputConfig;->getCustomOrderedResolutions(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    .line 132
    .local v2, "customOrderedResolutions":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    if-eqz v2, :cond_0

    .line 133
    return-object v2

    .line 136
    :cond_0
    invoke-interface {v0, v1}, Landroidx/camera/core/impl/ImageOutputConfig;->getResolutionSelector(Landroidx/camera/core/resolutionselector/ResolutionSelector;)Landroidx/camera/core/resolutionselector/ResolutionSelector;

    move-result-object v1

    .line 138
    .local v1, "resolutionSelector":Landroidx/camera/core/resolutionselector/ResolutionSelector;
    if-nez v1, :cond_1

    .line 139
    iget-object v3, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->mSupportedOutputSizesSorterLegacy:Landroidx/camera/core/internal/SupportedOutputSizesSorterLegacy;

    .line 140
    invoke-direct {p0, p1}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->getResolutionCandidateList(Landroidx/camera/core/impl/UseCaseConfig;)Ljava/util/List;

    move-result-object v4

    .line 139
    invoke-virtual {v3, v4, p1}, Landroidx/camera/core/internal/SupportedOutputSizesSorterLegacy;->sortSupportedOutputSizes(Ljava/util/List;Landroidx/camera/core/impl/UseCaseConfig;)Ljava/util/List;

    move-result-object v3

    return-object v3

    .line 142
    :cond_1
    invoke-direct {p0, p1}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->sortSupportedOutputSizesByResolutionSelector(Landroidx/camera/core/impl/UseCaseConfig;)Ljava/util/List;

    move-result-object v3

    return-object v3
.end method
