.class Landroidx/camera/core/internal/SupportedOutputSizesSorterLegacy;
.super Ljava/lang/Object;
.source "SupportedOutputSizesSorterLegacy.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "SupportedOutputSizesCollector"


# instance fields
.field private final mFullFovRatio:Landroid/util/Rational;

.field private final mIsSensorLandscapeResolution:Z

.field private final mLensFacing:I

.field private final mSensorOrientation:I


# direct methods
.method constructor <init>(Landroidx/camera/core/impl/CameraInfoInternal;Landroid/util/Rational;)V
    .locals 3
    .param p1, "cameraInfoInternal"    # Landroidx/camera/core/impl/CameraInfoInternal;
    .param p2, "fullFovRatio"    # Landroid/util/Rational;

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    invoke-interface {p1}, Landroidx/camera/core/impl/CameraInfoInternal;->getSensorRotationDegrees()I

    move-result v0

    iput v0, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorterLegacy;->mSensorOrientation:I

    .line 63
    invoke-interface {p1}, Landroidx/camera/core/impl/CameraInfoInternal;->getLensFacing()I

    move-result v0

    iput v0, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorterLegacy;->mLensFacing:I

    .line 64
    iput-object p2, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorterLegacy;->mFullFovRatio:Landroid/util/Rational;

    .line 66
    iget-object v0, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorterLegacy;->mFullFovRatio:Landroid/util/Rational;

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    .line 67
    iget-object v0, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorterLegacy;->mFullFovRatio:Landroid/util/Rational;

    .line 66
    invoke-virtual {v0}, Landroid/util/Rational;->getNumerator()I

    move-result v0

    iget-object v2, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorterLegacy;->mFullFovRatio:Landroid/util/Rational;

    .line 67
    invoke-virtual {v2}, Landroid/util/Rational;->getDenominator()I

    move-result v2

    if-lt v0, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    nop

    :goto_1
    iput-boolean v1, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorterLegacy;->mIsSensorLandscapeResolution:Z

    .line 68
    return-void
.end method

.method private static flipSizeByRotation(Landroid/util/Size;III)Landroid/util/Size;
    .locals 4
    .param p0, "size"    # Landroid/util/Size;
    .param p1, "targetRotation"    # I
    .param p2, "lensFacing"    # I
    .param p3, "sensorOrientation"    # I

    .line 252
    move-object v0, p0

    .line 254
    .local v0, "outputSize":Landroid/util/Size;
    if-eqz p0, :cond_0

    invoke-static {p1, p2, p3}, Landroidx/camera/core/internal/SupportedOutputSizesSorterLegacy;->isRotationNeeded(III)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 255
    new-instance v1, Landroid/util/Size;

    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result v2

    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/util/Size;-><init>(II)V

    move-object v0, v1

    .line 257
    :cond_0
    return-object v0
.end method

.method private static getAspectRatioGroupKeyOfTargetSize(Landroid/util/Size;Ljava/util/List;)Landroid/util/Rational;
    .locals 4
    .param p0, "targetSize"    # Landroid/util/Size;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Size;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;)",
            "Landroid/util/Rational;"
        }
    .end annotation

    .line 232
    .local p1, "resolutionCandidateList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    if-nez p0, :cond_0

    .line 233
    const/4 v0, 0x0

    return-object v0

    .line 236
    :cond_0
    invoke-static {p1}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->getResolutionListGroupingAspectRatioKeys(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 239
    .local v0, "aspectRatios":Ljava/util/List;, "Ljava/util/List<Landroid/util/Rational;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Rational;

    .line 240
    .local v2, "aspectRatio":Landroid/util/Rational;
    invoke-static {p0, v2}, Landroidx/camera/core/impl/utils/AspectRatioUtil;->hasMatchingAspectRatio(Landroid/util/Size;Landroid/util/Rational;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 241
    return-object v2

    .line 243
    .end local v2    # "aspectRatio":Landroid/util/Rational;
    :cond_1
    goto :goto_0

    .line 245
    :cond_2
    new-instance v1, Landroid/util/Rational;

    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/util/Rational;-><init>(II)V

    return-object v1
.end method

.method private getTargetAspectRatioByLegacyApi(Landroidx/camera/core/impl/ImageOutputConfig;Ljava/util/List;)Landroid/util/Rational;
    .locals 3
    .param p1, "imageOutputConfig"    # Landroidx/camera/core/impl/ImageOutputConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/ImageOutputConfig;",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;)",
            "Landroid/util/Rational;"
        }
    .end annotation

    .line 191
    .local p2, "resolutionCandidateList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    const/4 v0, 0x0

    .line 193
    .local v0, "outputRatio":Landroid/util/Rational;
    invoke-interface {p1}, Landroidx/camera/core/impl/ImageOutputConfig;->hasTargetAspectRatio()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 194
    invoke-interface {p1}, Landroidx/camera/core/impl/ImageOutputConfig;->getTargetAspectRatio()I

    move-result v1

    .line 195
    .local v1, "aspectRatio":I
    iget-boolean v2, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorterLegacy;->mIsSensorLandscapeResolution:Z

    invoke-static {v1, v2}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->getTargetAspectRatioRationalValue(IZ)Landroid/util/Rational;

    move-result-object v0

    .line 197
    .end local v1    # "aspectRatio":I
    goto :goto_0

    .line 201
    :cond_0
    invoke-direct {p0, p1}, Landroidx/camera/core/internal/SupportedOutputSizesSorterLegacy;->getTargetSize(Landroidx/camera/core/impl/ImageOutputConfig;)Landroid/util/Size;

    move-result-object v1

    .line 202
    .local v1, "targetSize":Landroid/util/Size;
    if-eqz v1, :cond_1

    .line 203
    invoke-static {v1, p2}, Landroidx/camera/core/internal/SupportedOutputSizesSorterLegacy;->getAspectRatioGroupKeyOfTargetSize(Landroid/util/Size;Ljava/util/List;)Landroid/util/Rational;

    move-result-object v0

    .line 208
    .end local v1    # "targetSize":Landroid/util/Size;
    :cond_1
    :goto_0
    return-object v0
.end method

.method private getTargetSize(Landroidx/camera/core/impl/ImageOutputConfig;)Landroid/util/Size;
    .locals 4
    .param p1, "imageOutputConfig"    # Landroidx/camera/core/impl/ImageOutputConfig;

    .line 213
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroidx/camera/core/impl/ImageOutputConfig;->getTargetRotation(I)I

    move-result v0

    .line 215
    .local v0, "targetRotation":I
    const/4 v1, 0x0

    invoke-interface {p1, v1}, Landroidx/camera/core/impl/ImageOutputConfig;->getTargetResolution(Landroid/util/Size;)Landroid/util/Size;

    move-result-object v1

    .line 216
    .local v1, "targetSize":Landroid/util/Size;
    iget v2, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorterLegacy;->mLensFacing:I

    iget v3, p0, Landroidx/camera/core/internal/SupportedOutputSizesSorterLegacy;->mSensorOrientation:I

    invoke-static {v1, v0, v2, v3}, Landroidx/camera/core/internal/SupportedOutputSizesSorterLegacy;->flipSizeByRotation(Landroid/util/Size;III)Landroid/util/Size;

    move-result-object v1

    .line 218
    return-object v1
.end method

.method private static isRotationNeeded(III)Z
    .locals 6
    .param p0, "targetRotation"    # I
    .param p1, "lensFacing"    # I
    .param p2, "sensorOrientation"    # I

    .line 262
    nop

    .line 263
    invoke-static {p0}, Landroidx/camera/core/impl/utils/CameraOrientationUtil;->surfaceRotationToDegrees(I)I

    move-result v0

    .line 268
    .local v0, "relativeRotationDegrees":I
    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v2, p1, :cond_0

    move v3, v2

    goto :goto_0

    :cond_0
    move v3, v1

    .line 270
    .local v3, "isOppositeFacingScreen":Z
    :goto_0
    invoke-static {v0, p2, v3}, Landroidx/camera/core/impl/utils/CameraOrientationUtil;->getRelativeImageRotation(IIZ)I

    move-result v4

    .line 274
    .local v4, "sensorRotationDegrees":I
    const/16 v5, 0x5a

    if-eq v4, v5, :cond_1

    const/16 v5, 0x10e

    if-ne v4, v5, :cond_2

    :cond_1
    move v1, v2

    :cond_2
    return v1
.end method


# virtual methods
.method sortSupportedOutputSizes(Ljava/util/List;Landroidx/camera/core/impl/UseCaseConfig;)Ljava/util/List;
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;)",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 80
    .local p1, "resolutionCandidateList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .local p2, "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 81
    return-object v1

    .line 84
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 88
    .local v2, "descendingSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    new-instance v3, Landroidx/camera/core/impl/utils/CompareSizesByArea;

    const/4 v4, 0x1

    invoke-direct {v3, v4}, Landroidx/camera/core/impl/utils/CompareSizesByArea;-><init>(Z)V

    invoke-static {v2, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 90
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 91
    .local v3, "filteredSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    move-object/from16 v5, p2

    check-cast v5, Landroidx/camera/core/impl/ImageOutputConfig;

    .line 92
    .local v5, "imageOutputConfig":Landroidx/camera/core/impl/ImageOutputConfig;
    const/4 v6, 0x0

    invoke-interface {v5, v6}, Landroidx/camera/core/impl/ImageOutputConfig;->getMaxResolution(Landroid/util/Size;)Landroid/util/Size;

    move-result-object v7

    .line 93
    .local v7, "maxSize":Landroid/util/Size;
    const/4 v8, 0x0

    invoke-interface {v2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/util/Size;

    .line 97
    .local v8, "maxSupportedOutputSize":Landroid/util/Size;
    if-eqz v7, :cond_1

    invoke-static {v8}, Landroidx/camera/core/internal/utils/SizeUtil;->getArea(Landroid/util/Size;)I

    move-result v9

    invoke-static {v7}, Landroidx/camera/core/internal/utils/SizeUtil;->getArea(Landroid/util/Size;)I

    move-result v10

    if-ge v9, v10, :cond_2

    .line 98
    :cond_1
    move-object v7, v8

    .line 101
    :cond_2
    invoke-direct {v0, v5}, Landroidx/camera/core/internal/SupportedOutputSizesSorterLegacy;->getTargetSize(Landroidx/camera/core/impl/ImageOutputConfig;)Landroid/util/Size;

    move-result-object v9

    .line 102
    .local v9, "targetSize":Landroid/util/Size;
    sget-object v10, Landroidx/camera/core/internal/utils/SizeUtil;->RESOLUTION_VGA:Landroid/util/Size;

    .line 103
    .local v10, "minSize":Landroid/util/Size;
    sget-object v11, Landroidx/camera/core/internal/utils/SizeUtil;->RESOLUTION_VGA:Landroid/util/Size;

    invoke-static {v11}, Landroidx/camera/core/internal/utils/SizeUtil;->getArea(Landroid/util/Size;)I

    move-result v11

    .line 104
    .local v11, "defaultSizeArea":I
    invoke-static {v7}, Landroidx/camera/core/internal/utils/SizeUtil;->getArea(Landroid/util/Size;)I

    move-result v12

    .line 108
    .local v12, "maxSizeArea":I
    if-ge v12, v11, :cond_3

    .line 109
    sget-object v10, Landroidx/camera/core/internal/utils/SizeUtil;->RESOLUTION_ZERO:Landroid/util/Size;

    goto :goto_0

    .line 110
    :cond_3
    if-eqz v9, :cond_4

    invoke-static {v9}, Landroidx/camera/core/internal/utils/SizeUtil;->getArea(Landroid/util/Size;)I

    move-result v13

    if-ge v13, v11, :cond_4

    .line 111
    move-object v10, v9

    .line 116
    :cond_4
    :goto_0
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_1
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_6

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/util/Size;

    .line 117
    .local v14, "outputSize":Landroid/util/Size;
    invoke-static {v14}, Landroidx/camera/core/internal/utils/SizeUtil;->getArea(Landroid/util/Size;)I

    move-result v15

    invoke-static {v7}, Landroidx/camera/core/internal/utils/SizeUtil;->getArea(Landroid/util/Size;)I

    move-result v4

    if-gt v15, v4, :cond_5

    invoke-static {v14}, Landroidx/camera/core/internal/utils/SizeUtil;->getArea(Landroid/util/Size;)I

    move-result v4

    invoke-static {v10}, Landroidx/camera/core/internal/utils/SizeUtil;->getArea(Landroid/util/Size;)I

    move-result v15

    if-lt v4, v15, :cond_5

    .line 118
    invoke-interface {v3, v14}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5

    .line 119
    invoke-interface {v3, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 121
    .end local v14    # "outputSize":Landroid/util/Size;
    :cond_5
    const/4 v4, 0x1

    goto :goto_1

    .line 123
    :cond_6
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_f

    .line 131
    invoke-direct {v0, v5, v3}, Landroidx/camera/core/internal/SupportedOutputSizesSorterLegacy;->getTargetAspectRatioByLegacyApi(Landroidx/camera/core/impl/ImageOutputConfig;Ljava/util/List;)Landroid/util/Rational;

    move-result-object v4

    .line 134
    .local v4, "aspectRatio":Landroid/util/Rational;
    if-nez v9, :cond_7

    invoke-interface {v5, v6}, Landroidx/camera/core/impl/ImageOutputConfig;->getDefaultResolution(Landroid/util/Size;)Landroid/util/Size;

    move-result-object v6

    goto :goto_2

    :cond_7
    move-object v6, v9

    .line 136
    .end local v9    # "targetSize":Landroid/util/Size;
    .local v6, "targetSize":Landroid/util/Size;
    :goto_2
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 137
    .local v9, "resultSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    new-instance v13, Ljava/util/HashMap;

    invoke-direct {v13}, Ljava/util/HashMap;-><init>()V

    .line 139
    .local v13, "aspectRatioSizeListMap":Ljava/util/Map;, "Ljava/util/Map<Landroid/util/Rational;Ljava/util/List<Landroid/util/Size;>;>;"
    if-nez v4, :cond_9

    .line 142
    invoke-interface {v9, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 145
    if-eqz v6, :cond_8

    .line 146
    const/4 v14, 0x1

    invoke-static {v9, v6, v14}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->sortSupportedSizesByFallbackRuleClosestHigherThenLower(Ljava/util/List;Landroid/util/Size;Z)V

    .line 183
    :cond_8
    move-object/from16 v17, v3

    goto/16 :goto_7

    .line 155
    :cond_9
    invoke-static {v3}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->groupSizesByAspectRatio(Ljava/util/List;)Ljava/util/Map;

    move-result-object v13

    .line 158
    if-eqz v6, :cond_b

    .line 159
    invoke-interface {v13}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_3
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_a

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/util/Rational;

    .line 160
    .local v15, "key":Landroid/util/Rational;
    nop

    .line 161
    invoke-interface {v13, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v1, v17

    check-cast v1, Ljava/util/List;

    .line 160
    move-object/from16 v17, v3

    const/4 v3, 0x1

    .end local v3    # "filteredSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .local v17, "filteredSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-static {v1, v6, v3}, Landroidx/camera/core/internal/SupportedOutputSizesSorter;->sortSupportedSizesByFallbackRuleClosestHigherThenLower(Ljava/util/List;Landroid/util/Size;Z)V

    .line 162
    .end local v15    # "key":Landroid/util/Rational;
    move-object/from16 v1, p1

    move-object/from16 v3, v17

    goto :goto_3

    .line 159
    .end local v17    # "filteredSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .restart local v3    # "filteredSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :cond_a
    move-object/from16 v17, v3

    .end local v3    # "filteredSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .restart local v17    # "filteredSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    goto :goto_4

    .line 158
    .end local v17    # "filteredSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .restart local v3    # "filteredSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :cond_b
    move-object/from16 v17, v3

    .line 166
    .end local v3    # "filteredSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .restart local v17    # "filteredSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    :goto_4
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {v13}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 167
    .local v1, "aspectRatios":Ljava/util/List;, "Ljava/util/List<Landroid/util/Rational;>;"
    new-instance v3, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;

    iget-object v14, v0, Landroidx/camera/core/internal/SupportedOutputSizesSorterLegacy;->mFullFovRatio:Landroid/util/Rational;

    invoke-direct {v3, v4, v14}, Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;-><init>(Landroid/util/Rational;Landroid/util/Rational;)V

    invoke-static {v1, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 172
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_5
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_e

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/util/Rational;

    .line 173
    .local v14, "rational":Landroid/util/Rational;
    invoke-interface {v13, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/util/List;

    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_6
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_d

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v0, v16

    check-cast v0, Landroid/util/Size;

    .line 176
    .local v0, "size":Landroid/util/Size;
    invoke-interface {v9, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_c

    .line 177
    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 179
    .end local v0    # "size":Landroid/util/Size;
    :cond_c
    move-object/from16 v0, p0

    goto :goto_6

    .line 180
    .end local v14    # "rational":Landroid/util/Rational;
    :cond_d
    move-object/from16 v0, p0

    goto :goto_5

    .line 183
    .end local v1    # "aspectRatios":Ljava/util/List;, "Ljava/util/List<Landroid/util/Rational;>;"
    :cond_e
    :goto_7
    return-object v9

    .line 124
    .end local v4    # "aspectRatio":Landroid/util/Rational;
    .end local v6    # "targetSize":Landroid/util/Size;
    .end local v13    # "aspectRatioSizeListMap":Ljava/util/Map;, "Ljava/util/Map<Landroid/util/Rational;Ljava/util/List<Landroid/util/Size;>;>;"
    .end local v17    # "filteredSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .restart local v3    # "filteredSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .local v9, "targetSize":Landroid/util/Size;
    :cond_f
    move-object/from16 v17, v3

    .end local v3    # "filteredSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .restart local v17    # "filteredSizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "All supported output sizes are filtered out according to current resolution selection settings. \nminSize = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "\nmaxSize = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "\ninitial size list: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
