.class public final Lcom/itextpdf/layout/renderer/objectfit/ObjectFitCalculator;
.super Ljava/lang/Object;
.source "ObjectFitCalculator.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static calculateRenderedImageSize(Lcom/itextpdf/layout/properties/ObjectFit;DDDD)Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;
    .locals 2
    .param p0, "objectFit"    # Lcom/itextpdf/layout/properties/ObjectFit;
    .param p1, "absoluteImageWidth"    # D
    .param p3, "absoluteImageHeight"    # D
    .param p5, "imageContainerWidth"    # D
    .param p7, "imageContainerHeight"    # D

    .line 51
    sget-object v0, Lcom/itextpdf/layout/renderer/objectfit/ObjectFitCalculator$1;->$SwitchMap$com$itextpdf$layout$properties$ObjectFit:[I

    invoke-virtual {p0}, Lcom/itextpdf/layout/properties/ObjectFit;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 67
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Object fit parameter cannot be null!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 64
    :pswitch_0
    invoke-static/range {p1 .. p8}, Lcom/itextpdf/layout/renderer/objectfit/ObjectFitCalculator;->processNone(DDDD)Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;

    move-result-object v0

    return-object v0

    .line 61
    :pswitch_1
    invoke-static/range {p1 .. p8}, Lcom/itextpdf/layout/renderer/objectfit/ObjectFitCalculator;->processScaleDown(DDDD)Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;

    move-result-object v0

    return-object v0

    .line 58
    :pswitch_2
    invoke-static/range {p1 .. p8}, Lcom/itextpdf/layout/renderer/objectfit/ObjectFitCalculator;->processCover(DDDD)Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;

    move-result-object v0

    return-object v0

    .line 55
    :pswitch_3
    invoke-static/range {p1 .. p8}, Lcom/itextpdf/layout/renderer/objectfit/ObjectFitCalculator;->processContain(DDDD)Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;

    move-result-object v0

    return-object v0

    .line 53
    :pswitch_4
    invoke-static {p5, p6, p7, p8}, Lcom/itextpdf/layout/renderer/objectfit/ObjectFitCalculator;->processFill(DD)Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;

    move-result-object v0

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static processContain(DDDD)Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;
    .locals 9
    .param p0, "absoluteImageWidth"    # D
    .param p2, "absoluteImageHeight"    # D
    .param p4, "imageContainerWidth"    # D
    .param p6, "imageContainerHeight"    # D

    .line 78
    const/4 v8, 0x0

    move-wide v0, p0

    move-wide v2, p2

    move-wide v4, p4

    move-wide v6, p6

    invoke-static/range {v0 .. v8}, Lcom/itextpdf/layout/renderer/objectfit/ObjectFitCalculator;->processToFitSide(DDDDZ)Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;

    move-result-object v8

    return-object v8
.end method

.method private static processCover(DDDD)Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;
    .locals 9
    .param p0, "absoluteImageWidth"    # D
    .param p2, "absoluteImageHeight"    # D
    .param p4, "imageContainerWidth"    # D
    .param p6, "imageContainerHeight"    # D

    .line 84
    const/4 v8, 0x1

    move-wide v0, p0

    move-wide v2, p2

    move-wide v4, p4

    move-wide v6, p6

    invoke-static/range {v0 .. v8}, Lcom/itextpdf/layout/renderer/objectfit/ObjectFitCalculator;->processToFitSide(DDDDZ)Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;

    move-result-object v8

    return-object v8
.end method

.method private static processFill(DD)Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;
    .locals 6
    .param p0, "imageContainerWidth"    # D
    .param p2, "imageContainerHeight"    # D

    .line 73
    new-instance v0, Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;

    const/4 v5, 0x0

    move-wide v1, p0

    move-wide v3, p2

    .end local p0    # "imageContainerWidth":D
    .end local p2    # "imageContainerHeight":D
    .local v1, "imageContainerWidth":D
    .local v3, "imageContainerHeight":D
    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;-><init>(DDZ)V

    return-object v0
.end method

.method private static processNone(DDDD)Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;
    .locals 7
    .param p0, "absoluteImageWidth"    # D
    .param p2, "absoluteImageHeight"    # D
    .param p4, "imageContainerWidth"    # D
    .param p6, "imageContainerHeight"    # D

    .line 101
    cmpg-double v0, p4, p0

    if-lez v0, :cond_1

    cmpg-double v0, p6, p2

    if-gtz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    move v6, v0

    .line 103
    .local v6, "doesObjectFitRequireCutting":Z
    new-instance v1, Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;

    move-wide v2, p0

    move-wide v4, p2

    .end local p0    # "absoluteImageWidth":D
    .end local p2    # "absoluteImageHeight":D
    .local v2, "absoluteImageWidth":D
    .local v4, "absoluteImageHeight":D
    invoke-direct/range {v1 .. v6}, Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;-><init>(DDZ)V

    return-object v1
.end method

.method private static processScaleDown(DDDD)Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;
    .locals 16
    .param p0, "absoluteImageWidth"    # D
    .param p2, "absoluteImageHeight"    # D
    .param p4, "imageContainerWidth"    # D
    .param p6, "imageContainerHeight"    # D

    .line 90
    cmpl-double v0, p4, p0

    if-ltz v0, :cond_0

    cmpl-double v0, p6, p2

    if-ltz v0, :cond_0

    .line 92
    new-instance v1, Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;

    const/4 v6, 0x0

    move-wide/from16 v2, p0

    move-wide/from16 v4, p2

    invoke-direct/range {v1 .. v6}, Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;-><init>(DDZ)V

    return-object v1

    .line 94
    :cond_0
    const/4 v15, 0x0

    move-wide/from16 v7, p0

    move-wide/from16 v9, p2

    move-wide/from16 v11, p4

    move-wide/from16 v13, p6

    invoke-static/range {v7 .. v15}, Lcom/itextpdf/layout/renderer/objectfit/ObjectFitCalculator;->processToFitSide(DDDDZ)Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;

    move-result-object v0

    return-object v0
.end method

.method private static processToFitSide(DDDDZ)Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;
    .locals 15
    .param p0, "absoluteImageWidth"    # D
    .param p2, "absoluteImageHeight"    # D
    .param p4, "imageContainerWidth"    # D
    .param p6, "imageContainerHeight"    # D
    .param p8, "clipToFit"    # Z

    .line 110
    div-double v0, p4, p0

    .line 111
    .local v0, "widthCoeff":D
    div-double v2, p6, p2

    .line 116
    .local v2, "heightCoeff":D
    cmpl-double v4, v2, v0

    if-lez v4, :cond_0

    const/4 v4, 0x1

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    :goto_0
    xor-int v4, v4, p8

    .line 118
    .local v4, "isWidthFitted":Z
    if-eqz v4, :cond_1

    .line 119
    move-wide/from16 v5, p4

    .line 120
    .local v5, "renderedImageWidth":D
    mul-double v7, p2, p4

    div-double/2addr v7, p0

    move-wide v10, v5

    move-wide v12, v7

    .local v7, "renderedImageHeight":D
    goto :goto_1

    .line 122
    .end local v5    # "renderedImageWidth":D
    .end local v7    # "renderedImageHeight":D
    :cond_1
    move-wide/from16 v7, p6

    .line 123
    .restart local v7    # "renderedImageHeight":D
    mul-double v5, p0, p6

    div-double v5, v5, p2

    move-wide v10, v5

    move-wide v12, v7

    .line 126
    .end local v7    # "renderedImageHeight":D
    .local v10, "renderedImageWidth":D
    .local v12, "renderedImageHeight":D
    :goto_1
    new-instance v9, Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;

    move/from16 v14, p8

    invoke-direct/range {v9 .. v14}, Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;-><init>(DDZ)V

    return-object v9
.end method
