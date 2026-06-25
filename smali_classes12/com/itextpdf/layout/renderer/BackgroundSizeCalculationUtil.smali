.class final Lcom/itextpdf/layout/renderer/BackgroundSizeCalculationUtil;
.super Ljava/lang/Object;
.source "BackgroundSizeCalculationUtil.java"


# static fields
.field private static final PERCENT_100:I = 0x64

.field private static final PERCENT_VALUE_100:Lcom/itextpdf/layout/properties/UnitValue;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 35
    const/high16 v0, 0x42c80000    # 100.0f

    invoke-static {v0}, Lcom/itextpdf/layout/properties/UnitValue;->createPercentValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/renderer/BackgroundSizeCalculationUtil;->PERCENT_VALUE_100:Lcom/itextpdf/layout/properties/UnitValue;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    return-void
.end method

.method private static calculateBackgroundHeight(Lcom/itextpdf/layout/properties/UnitValue;FZLcom/itextpdf/layout/properties/BackgroundImage;[Ljava/lang/Float;)V
    .locals 3
    .param p0, "height"    # Lcom/itextpdf/layout/properties/UnitValue;
    .param p1, "areaHeight"    # F
    .param p2, "scale"    # Z
    .param p3, "image"    # Lcom/itextpdf/layout/properties/BackgroundImage;
    .param p4, "widthAndHeight"    # [Ljava/lang/Float;

    .line 119
    const/high16 v0, 0x42c80000    # 100.0f

    if-eqz p2, :cond_1

    .line 120
    invoke-virtual {p0}, Lcom/itextpdf/layout/properties/UnitValue;->isPercentValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 121
    invoke-virtual {p0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v1

    mul-float/2addr v1, p1

    div-float/2addr v1, v0

    invoke-static {v1, p3, p4}, Lcom/itextpdf/layout/renderer/BackgroundSizeCalculationUtil;->scaleHeight(FLcom/itextpdf/layout/properties/BackgroundImage;[Ljava/lang/Float;)V

    goto :goto_0

    .line 123
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v0

    invoke-static {v0, p3, p4}, Lcom/itextpdf/layout/renderer/BackgroundSizeCalculationUtil;->scaleHeight(FLcom/itextpdf/layout/properties/BackgroundImage;[Ljava/lang/Float;)V

    goto :goto_0

    .line 126
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/layout/properties/UnitValue;->isPercentValue()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_2

    .line 127
    invoke-virtual {p0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v1

    mul-float/2addr v1, p1

    div-float/2addr v1, v0

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    aput-object v0, p4, v2

    goto :goto_0

    .line 129
    :cond_2
    invoke-virtual {p0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    aput-object v0, p4, v2

    .line 132
    :goto_0
    return-void
.end method

.method public static calculateBackgroundImageSize(Lcom/itextpdf/layout/properties/BackgroundImage;FF)[F
    .locals 10
    .param p0, "image"    # Lcom/itextpdf/layout/properties/BackgroundImage;
    .param p1, "areaWidth"    # F
    .param p2, "areaHeight"    # F

    .line 52
    invoke-virtual {p0}, Lcom/itextpdf/layout/properties/BackgroundImage;->getLinearGradientBuilder()Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    .line 55
    .local v0, "isGradient":Z
    :goto_0
    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/itextpdf/layout/properties/BackgroundImage;->getBackgroundSize()Lcom/itextpdf/layout/properties/BackgroundSize;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/BackgroundSize;->isSpecificSize()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 56
    invoke-static {p0, p1, p2}, Lcom/itextpdf/layout/renderer/BackgroundSizeCalculationUtil;->calculateBackgroundSizeForArea(Lcom/itextpdf/layout/properties/BackgroundImage;FF)Lcom/itextpdf/layout/properties/BackgroundSize;

    move-result-object v3

    .local v3, "size":Lcom/itextpdf/layout/properties/BackgroundSize;
    goto :goto_1

    .line 58
    .end local v3    # "size":Lcom/itextpdf/layout/properties/BackgroundSize;
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/layout/properties/BackgroundImage;->getBackgroundSize()Lcom/itextpdf/layout/properties/BackgroundSize;

    move-result-object v3

    .line 60
    .restart local v3    # "size":Lcom/itextpdf/layout/properties/BackgroundSize;
    :goto_1
    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/BackgroundSize;->getBackgroundWidthSize()Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v4

    .line 61
    .local v4, "width":Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/BackgroundSize;->getBackgroundHeightSize()Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v5

    .line 63
    .local v5, "height":Lcom/itextpdf/layout/properties/UnitValue;
    const/4 v6, 0x2

    new-array v7, v6, [Ljava/lang/Float;

    .line 65
    .local v7, "widthAndHeight":[Ljava/lang/Float;
    const/4 v8, 0x0

    if-eqz v4, :cond_3

    invoke-virtual {v4}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v9

    cmpl-float v9, v9, v8

    if-ltz v9, :cond_3

    .line 66
    if-nez v0, :cond_2

    if-nez v5, :cond_2

    move v9, v1

    goto :goto_2

    :cond_2
    move v9, v2

    .line 67
    .local v9, "needScale":Z
    :goto_2
    invoke-static {v4, p1, v9, p0, v7}, Lcom/itextpdf/layout/renderer/BackgroundSizeCalculationUtil;->calculateBackgroundWidth(Lcom/itextpdf/layout/properties/UnitValue;FZLcom/itextpdf/layout/properties/BackgroundImage;[Ljava/lang/Float;)V

    .line 69
    .end local v9    # "needScale":Z
    :cond_3
    if-eqz v5, :cond_5

    invoke-virtual {v5}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v9

    cmpl-float v8, v9, v8

    if-ltz v8, :cond_5

    .line 70
    if-nez v0, :cond_4

    if-nez v4, :cond_4

    move v8, v1

    goto :goto_3

    :cond_4
    move v8, v2

    .line 71
    .local v8, "needScale":Z
    :goto_3
    invoke-static {v5, p2, v8, p0, v7}, Lcom/itextpdf/layout/renderer/BackgroundSizeCalculationUtil;->calculateBackgroundHeight(Lcom/itextpdf/layout/properties/UnitValue;FZLcom/itextpdf/layout/properties/BackgroundImage;[Ljava/lang/Float;)V

    .line 73
    .end local v8    # "needScale":Z
    :cond_5
    invoke-static {v7, p1, p2, p0, v0}, Lcom/itextpdf/layout/renderer/BackgroundSizeCalculationUtil;->setDefaultSizeIfNull([Ljava/lang/Float;FFLcom/itextpdf/layout/properties/BackgroundImage;Z)V

    .line 74
    aget-object v8, v7, v2

    invoke-virtual {v8}, Ljava/lang/Float;->floatValue()F

    move-result v8

    aget-object v9, v7, v1

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v9

    new-array v6, v6, [F

    aput v8, v6, v2

    aput v9, v6, v1

    return-object v6
.end method

.method private static calculateBackgroundSizeForArea(Lcom/itextpdf/layout/properties/BackgroundImage;FF)Lcom/itextpdf/layout/properties/BackgroundSize;
    .locals 7
    .param p0, "image"    # Lcom/itextpdf/layout/properties/BackgroundImage;
    .param p1, "areaWidth"    # F
    .param p2, "areaHeight"    # F

    .line 79
    invoke-virtual {p0}, Lcom/itextpdf/layout/properties/BackgroundImage;->getImageWidth()F

    move-result v0

    div-float v0, p1, v0

    float-to-double v0, v0

    .line 80
    .local v0, "widthDifference":D
    invoke-virtual {p0}, Lcom/itextpdf/layout/properties/BackgroundImage;->getImageHeight()F

    move-result v2

    div-float v2, p2, v2

    float-to-double v2, v2

    .line 81
    .local v2, "heightDifference":D
    invoke-virtual {p0}, Lcom/itextpdf/layout/properties/BackgroundImage;->getBackgroundSize()Lcom/itextpdf/layout/properties/BackgroundSize;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/layout/properties/BackgroundSize;->isCover()Z

    move-result v4

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v4, :cond_1

    .line 82
    cmpl-double v4, v0, v2

    if-lez v4, :cond_0

    goto :goto_0

    :cond_0
    move v5, v6

    :goto_0
    invoke-static {v5}, Lcom/itextpdf/layout/renderer/BackgroundSizeCalculationUtil;->createSizeWithMaxValueSide(Z)Lcom/itextpdf/layout/properties/BackgroundSize;

    move-result-object v4

    return-object v4

    .line 83
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/layout/properties/BackgroundImage;->getBackgroundSize()Lcom/itextpdf/layout/properties/BackgroundSize;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/layout/properties/BackgroundSize;->isContain()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 84
    cmpg-double v4, v0, v2

    if-gez v4, :cond_2

    goto :goto_1

    :cond_2
    move v5, v6

    :goto_1
    invoke-static {v5}, Lcom/itextpdf/layout/renderer/BackgroundSizeCalculationUtil;->createSizeWithMaxValueSide(Z)Lcom/itextpdf/layout/properties/BackgroundSize;

    move-result-object v4

    return-object v4

    .line 86
    :cond_3
    new-instance v4, Lcom/itextpdf/layout/properties/BackgroundSize;

    invoke-direct {v4}, Lcom/itextpdf/layout/properties/BackgroundSize;-><init>()V

    return-object v4
.end method

.method private static calculateBackgroundWidth(Lcom/itextpdf/layout/properties/UnitValue;FZLcom/itextpdf/layout/properties/BackgroundImage;[Ljava/lang/Float;)V
    .locals 3
    .param p0, "width"    # Lcom/itextpdf/layout/properties/UnitValue;
    .param p1, "areaWidth"    # F
    .param p2, "scale"    # Z
    .param p3, "image"    # Lcom/itextpdf/layout/properties/BackgroundImage;
    .param p4, "widthAndHeight"    # [Ljava/lang/Float;

    .line 102
    const/high16 v0, 0x42c80000    # 100.0f

    if-eqz p2, :cond_1

    .line 103
    invoke-virtual {p0}, Lcom/itextpdf/layout/properties/UnitValue;->isPercentValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 104
    invoke-virtual {p0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v1

    mul-float/2addr v1, p1

    div-float/2addr v1, v0

    invoke-static {v1, p3, p4}, Lcom/itextpdf/layout/renderer/BackgroundSizeCalculationUtil;->scaleWidth(FLcom/itextpdf/layout/properties/BackgroundImage;[Ljava/lang/Float;)V

    goto :goto_0

    .line 106
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v0

    invoke-static {v0, p3, p4}, Lcom/itextpdf/layout/renderer/BackgroundSizeCalculationUtil;->scaleWidth(FLcom/itextpdf/layout/properties/BackgroundImage;[Ljava/lang/Float;)V

    goto :goto_0

    .line 109
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/layout/properties/UnitValue;->isPercentValue()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 110
    invoke-virtual {p0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v1

    mul-float/2addr v1, p1

    div-float/2addr v1, v0

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    aput-object v0, p4, v2

    goto :goto_0

    .line 112
    :cond_2
    invoke-virtual {p0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    aput-object v0, p4, v2

    .line 115
    :goto_0
    return-void
.end method

.method private static createSizeWithMaxValueSide(Z)Lcom/itextpdf/layout/properties/BackgroundSize;
    .locals 3
    .param p0, "maxWidth"    # Z

    .line 91
    new-instance v0, Lcom/itextpdf/layout/properties/BackgroundSize;

    invoke-direct {v0}, Lcom/itextpdf/layout/properties/BackgroundSize;-><init>()V

    .line 92
    .local v0, "size":Lcom/itextpdf/layout/properties/BackgroundSize;
    const/4 v1, 0x0

    if-eqz p0, :cond_0

    .line 93
    sget-object v2, Lcom/itextpdf/layout/renderer/BackgroundSizeCalculationUtil;->PERCENT_VALUE_100:Lcom/itextpdf/layout/properties/UnitValue;

    invoke-virtual {v0, v2, v1}, Lcom/itextpdf/layout/properties/BackgroundSize;->setBackgroundSizeToValues(Lcom/itextpdf/layout/properties/UnitValue;Lcom/itextpdf/layout/properties/UnitValue;)V

    goto :goto_0

    .line 95
    :cond_0
    sget-object v2, Lcom/itextpdf/layout/renderer/BackgroundSizeCalculationUtil;->PERCENT_VALUE_100:Lcom/itextpdf/layout/properties/UnitValue;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/layout/properties/BackgroundSize;->setBackgroundSizeToValues(Lcom/itextpdf/layout/properties/UnitValue;Lcom/itextpdf/layout/properties/UnitValue;)V

    .line 97
    :goto_0
    return-object v0
.end method

.method private static scaleHeight(FLcom/itextpdf/layout/properties/BackgroundImage;[Ljava/lang/Float;)V
    .locals 3
    .param p0, "newHeight"    # F
    .param p1, "image"    # Lcom/itextpdf/layout/properties/BackgroundImage;
    .param p2, "imageWidthAndHeight"    # [Ljava/lang/Float;

    .line 141
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/BackgroundImage;->getImageHeight()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/BackgroundImage;->getImageHeight()F

    move-result v0

    div-float v0, p0, v0

    .line 142
    .local v0, "difference":F
    :goto_0
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/BackgroundImage;->getImageWidth()F

    move-result v1

    mul-float/2addr v1, v0

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, p2, v2

    .line 143
    const/4 v1, 0x1

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    aput-object v2, p2, v1

    .line 144
    return-void
.end method

.method private static scaleWidth(FLcom/itextpdf/layout/properties/BackgroundImage;[Ljava/lang/Float;)V
    .locals 3
    .param p0, "newWidth"    # F
    .param p1, "image"    # Lcom/itextpdf/layout/properties/BackgroundImage;
    .param p2, "imageWidthAndHeight"    # [Ljava/lang/Float;

    .line 135
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/BackgroundImage;->getImageWidth()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/BackgroundImage;->getImageWidth()F

    move-result v0

    div-float v0, p0, v0

    .line 136
    .local v0, "difference":F
    :goto_0
    const/4 v1, 0x0

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    aput-object v2, p2, v1

    .line 137
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/BackgroundImage;->getImageHeight()F

    move-result v1

    mul-float/2addr v1, v0

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, p2, v2

    .line 138
    return-void
.end method

.method private static setDefaultSizeIfNull([Ljava/lang/Float;FFLcom/itextpdf/layout/properties/BackgroundImage;Z)V
    .locals 3
    .param p0, "widthAndHeight"    # [Ljava/lang/Float;
    .param p1, "areaWidth"    # F
    .param p2, "areaHeight"    # F
    .param p3, "image"    # Lcom/itextpdf/layout/properties/BackgroundImage;
    .param p4, "isGradient"    # Z

    .line 148
    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p4, :cond_2

    .line 149
    aget-object v2, p0, v1

    if-nez v2, :cond_0

    move v2, p1

    goto :goto_0

    :cond_0
    aget-object v2, p0, v1

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    :goto_0
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    aput-object v2, p0, v1

    .line 150
    aget-object v1, p0, v0

    if-nez v1, :cond_1

    move v1, p2

    goto :goto_1

    :cond_1
    aget-object v1, p0, v0

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    :goto_1
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    aput-object v1, p0, v0

    goto :goto_4

    .line 152
    :cond_2
    aget-object v2, p0, v1

    if-nez v2, :cond_3

    invoke-virtual {p3}, Lcom/itextpdf/layout/properties/BackgroundImage;->getImageWidth()F

    move-result v2

    goto :goto_2

    :cond_3
    aget-object v2, p0, v1

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    :goto_2
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    aput-object v2, p0, v1

    .line 153
    aget-object v1, p0, v0

    if-nez v1, :cond_4

    invoke-virtual {p3}, Lcom/itextpdf/layout/properties/BackgroundImage;->getImageHeight()F

    move-result v1

    goto :goto_3

    :cond_4
    aget-object v1, p0, v0

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    :goto_3
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    aput-object v1, p0, v0

    .line 155
    :goto_4
    return-void
.end method
