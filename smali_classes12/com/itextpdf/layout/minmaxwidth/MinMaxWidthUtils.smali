.class public final Lcom/itextpdf/layout/minmaxwidth/MinMaxWidthUtils;
.super Ljava/lang/Object;
.source "MinMaxWidthUtils.java"


# static fields
.field private static final eps:F = 0.01f

.field private static final max:F = 32760.0f


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static countDefaultMinMaxWidth(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .locals 5
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 59
    new-instance v0, Lcom/itextpdf/layout/layout/LayoutContext;

    new-instance v1, Lcom/itextpdf/layout/layout/LayoutArea;

    new-instance v2, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-static {}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidthUtils;->getInfWidth()F

    move-result v3

    invoke-static {}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidthUtils;->getInfHeight()F

    move-result v4

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FF)V

    const/4 v3, 0x1

    invoke-direct {v1, v3, v2}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;)V

    invoke-interface {p0, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v0

    .line 60
    .local v0, "result":Lcom/itextpdf/layout/layout/LayoutResult;
    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_0

    new-instance v1, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    invoke-direct {v1}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;-><init>()V

    goto :goto_0

    :cond_0
    new-instance v1, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    .line 61
    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutResult;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    const/4 v3, 0x0

    invoke-direct {v1, v3, v2, v3}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;-><init>(FFF)V

    .line 60
    :goto_0
    return-object v1
.end method

.method public static getBorderWidth(Lcom/itextpdf/layout/IPropertyContainer;)F
    .locals 6
    .param p0, "element"    # Lcom/itextpdf/layout/IPropertyContainer;

    .line 65
    const/16 v0, 0x9

    invoke-interface {p0, v0}, Lcom/itextpdf/layout/IPropertyContainer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/borders/Border;

    .line 66
    .local v0, "border":Lcom/itextpdf/layout/borders/Border;
    const/16 v1, 0xc

    invoke-interface {p0, v1}, Lcom/itextpdf/layout/IPropertyContainer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/borders/Border;

    .line 67
    .local v2, "rightBorder":Lcom/itextpdf/layout/borders/Border;
    const/16 v3, 0xb

    invoke-interface {p0, v3}, Lcom/itextpdf/layout/IPropertyContainer;->getProperty(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/borders/Border;

    .line 69
    .local v4, "leftBorder":Lcom/itextpdf/layout/borders/Border;
    invoke-interface {p0, v1}, Lcom/itextpdf/layout/IPropertyContainer;->hasOwnProperty(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 70
    move-object v2, v0

    .line 72
    :cond_0
    invoke-interface {p0, v3}, Lcom/itextpdf/layout/IPropertyContainer;->hasOwnProperty(I)Z

    move-result v1

    if-nez v1, :cond_1

    .line 73
    move-object v4, v0

    .line 76
    :cond_1
    const/4 v1, 0x0

    if-eqz v2, :cond_2

    invoke-virtual {v2}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v3

    goto :goto_0

    :cond_2
    move v3, v1

    .line 77
    .local v3, "rightBorderWidth":F
    :goto_0
    if-eqz v4, :cond_3

    invoke-virtual {v4}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v1

    .line 78
    .local v1, "leftBorderWidth":F
    :cond_3
    add-float v5, v3, v1

    return v5
.end method

.method public static getEps()F
    .locals 1

    .line 45
    const v0, 0x3c23d70a    # 0.01f

    return v0
.end method

.method public static getInfHeight()F
    .locals 1

    .line 52
    const v0, 0x49742400    # 1000000.0f

    return v0
.end method

.method public static getInfWidth()F
    .locals 1

    .line 49
    const v0, 0x46fff000    # 32760.0f

    return v0
.end method

.method public static getMarginsWidth(Lcom/itextpdf/layout/IPropertyContainer;)F
    .locals 6
    .param p0, "element"    # Lcom/itextpdf/layout/IPropertyContainer;

    .line 82
    const/16 v0, 0x2d

    invoke-interface {p0, v0}, Lcom/itextpdf/layout/IPropertyContainer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/UnitValue;

    .line 83
    .local v1, "rightMargin":Lcom/itextpdf/layout/properties/UnitValue;
    const-string v2, "Property {0} in percents is not supported"

    const-class v3, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidthUtils;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v4

    if-nez v4, :cond_0

    .line 84
    invoke-static {v3}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v4

    .line 85
    .local v4, "logger":Lorg/slf4j/Logger;
    nop

    .line 86
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    .line 85
    invoke-static {v2, v0}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v4, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 88
    .end local v4    # "logger":Lorg/slf4j/Logger;
    :cond_0
    const/16 v0, 0x2c

    invoke-interface {p0, v0}, Lcom/itextpdf/layout/IPropertyContainer;->getProperty(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/properties/UnitValue;

    .line 89
    .local v4, "leftMargin":Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v4, :cond_1

    invoke-virtual {v4}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v5

    if-nez v5, :cond_1

    .line 90
    invoke-static {v3}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v3

    .line 91
    .local v3, "logger":Lorg/slf4j/Logger;
    nop

    .line 92
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    .line 91
    invoke-static {v2, v0}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v3, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 95
    .end local v3    # "logger":Lorg/slf4j/Logger;
    :cond_1
    const/4 v0, 0x0

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v2

    goto :goto_0

    :cond_2
    move v2, v0

    .line 96
    .local v2, "rightMarginWidth":F
    :goto_0
    if-eqz v4, :cond_3

    invoke-virtual {v4}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v0

    .line 98
    .local v0, "leftMarginWidth":F
    :cond_3
    add-float v3, v2, v0

    return v3
.end method

.method public static getPaddingWidth(Lcom/itextpdf/layout/IPropertyContainer;)F
    .locals 6
    .param p0, "element"    # Lcom/itextpdf/layout/IPropertyContainer;

    .line 102
    const/16 v0, 0x31

    invoke-interface {p0, v0}, Lcom/itextpdf/layout/IPropertyContainer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/UnitValue;

    .line 103
    .local v1, "rightPadding":Lcom/itextpdf/layout/properties/UnitValue;
    const-string v2, "Property {0} in percents is not supported"

    const-class v3, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidthUtils;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v4

    if-nez v4, :cond_0

    .line 104
    invoke-static {v3}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v4

    .line 105
    .local v4, "logger":Lorg/slf4j/Logger;
    nop

    .line 106
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    .line 105
    invoke-static {v2, v0}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v4, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 108
    .end local v4    # "logger":Lorg/slf4j/Logger;
    :cond_0
    const/16 v0, 0x30

    invoke-interface {p0, v0}, Lcom/itextpdf/layout/IPropertyContainer;->getProperty(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/properties/UnitValue;

    .line 109
    .local v4, "leftPadding":Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v4, :cond_1

    invoke-virtual {v4}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v5

    if-nez v5, :cond_1

    .line 110
    invoke-static {v3}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v3

    .line 111
    .local v3, "logger":Lorg/slf4j/Logger;
    nop

    .line 112
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    .line 111
    invoke-static {v2, v0}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v3, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 115
    .end local v3    # "logger":Lorg/slf4j/Logger;
    :cond_1
    const/4 v0, 0x0

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v2

    goto :goto_0

    :cond_2
    move v2, v0

    .line 116
    .local v2, "rightPaddingWidth":F
    :goto_0
    if-eqz v4, :cond_3

    invoke-virtual {v4}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v0

    .line 118
    .local v0, "leftPaddingWidth":F
    :cond_3
    add-float v3, v2, v0

    return v3
.end method

.method public static isEqual(DD)Z
    .locals 4
    .param p0, "x"    # D
    .param p2, "y"    # D

    .line 55
    sub-double v0, p0, p2

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v0

    const-wide v2, 0x3f847ae140000000L    # 0.009999999776482582

    cmpg-double v0, v0, v2

    if-gez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
