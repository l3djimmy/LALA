.class public Lcom/itextpdf/layout/properties/BackgroundRepeat;
.super Ljava/lang/Object;
.source "BackgroundRepeat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;
    }
.end annotation


# instance fields
.field private final xAxisRepeat:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

.field private final yAxisRepeat:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 40
    sget-object v0, Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;->REPEAT:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    invoke-direct {p0, v0}, Lcom/itextpdf/layout/properties/BackgroundRepeat;-><init>(Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;)V

    .line 41
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;)V
    .locals 0
    .param p1, "repeat"    # Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    .line 49
    invoke-direct {p0, p1, p1}, Lcom/itextpdf/layout/properties/BackgroundRepeat;-><init>(Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;)V

    .line 50
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;)V
    .locals 0
    .param p1, "xAxisRepeat"    # Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;
    .param p2, "yAxisRepeat"    # Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput-object p1, p0, Lcom/itextpdf/layout/properties/BackgroundRepeat;->xAxisRepeat:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    .line 60
    iput-object p2, p0, Lcom/itextpdf/layout/properties/BackgroundRepeat;->yAxisRepeat:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    .line 61
    return-void
.end method

.method private static calculateRatio(FF)I
    .locals 3
    .param p0, "areaSize"    # F
    .param p1, "backgroundSize"    # F

    .line 162
    div-float v0, p0, p1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v0, v0

    .line 163
    .local v0, "ratio":I
    int-to-float v1, v0

    mul-float/2addr v1, p1

    sub-float v1, p0, v1

    .line 164
    .local v1, "remainSpace":F
    const/high16 v2, 0x40000000    # 2.0f

    div-float v2, p1, v2

    cmpl-float v2, v1, v2

    if-ltz v2, :cond_0

    .line 165
    add-int/lit8 v0, v0, 0x1

    .line 167
    :cond_0
    if-nez v0, :cond_1

    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    move v2, v0

    :goto_0
    return v2
.end method

.method private static calculateWhitespace(FF)F
    .locals 3
    .param p0, "areaSize"    # F
    .param p1, "backgroundSize"    # F

    .line 171
    const/4 v0, 0x0

    .line 172
    .local v0, "whitespace":F
    div-float v1, p0, p1

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->floor(D)D

    move-result-wide v1

    double-to-int v1, v1

    .line 173
    .local v1, "ratio":I
    if-lez v1, :cond_0

    .line 174
    int-to-float v2, v1

    mul-float/2addr v2, p1

    sub-float v0, p0, v2

    .line 175
    const/4 v2, 0x1

    if-le v1, v2, :cond_0

    .line 176
    add-int/lit8 v2, v1, -0x1

    int-to-float v2, v2

    div-float/2addr v0, v2

    .line 179
    :cond_0
    return v0
.end method

.method private processSpaceValueAndCalculateWhitespace(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/geom/Point;
    .locals 11
    .param p1, "imageRectangle"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "backgroundArea"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 133
    new-instance v0, Lcom/itextpdf/kernel/geom/Point;

    invoke-direct {v0}, Lcom/itextpdf/kernel/geom/Point;-><init>()V

    .line 134
    .local v0, "whitespace":Lcom/itextpdf/kernel/geom/Point;
    sget-object v1, Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;->SPACE:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    iget-object v2, p0, Lcom/itextpdf/layout/properties/BackgroundRepeat;->xAxisRepeat:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    const/high16 v3, 0x40000000    # 2.0f

    const/4 v4, 0x0

    if-ne v1, v2, :cond_2

    .line 135
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    mul-float/2addr v1, v3

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    cmpg-float v1, v1, v2

    const-wide/16 v5, 0x0

    if-gtz v1, :cond_0

    .line 136
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v1

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->setX(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 137
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    invoke-static {v1, v2}, Lcom/itextpdf/layout/properties/BackgroundRepeat;->calculateWhitespace(FF)F

    move-result v1

    float-to-double v1, v1

    invoke-virtual {v0, v1, v2, v5, v6}, Lcom/itextpdf/kernel/geom/Point;->setLocation(DD)V

    goto :goto_1

    .line 139
    :cond_0
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v2

    sub-float/2addr v1, v2

    .line 140
    .local v1, "rightSpace":F
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v2

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v7

    sub-float/2addr v2, v7

    .line 141
    .local v2, "leftSpace":F
    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v7

    .line 142
    .local v7, "xWhitespace":F
    cmpl-float v8, v7, v4

    if-lez v8, :cond_1

    move v8, v7

    goto :goto_0

    :cond_1
    move v8, v4

    .line 143
    .end local v7    # "xWhitespace":F
    .local v8, "xWhitespace":F
    :goto_0
    float-to-double v9, v8

    invoke-virtual {v0, v9, v10, v5, v6}, Lcom/itextpdf/kernel/geom/Point;->setLocation(DD)V

    .line 146
    .end local v1    # "rightSpace":F
    .end local v2    # "leftSpace":F
    .end local v8    # "xWhitespace":F
    :cond_2
    :goto_1
    sget-object v1, Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;->SPACE:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    iget-object v2, p0, Lcom/itextpdf/layout/properties/BackgroundRepeat;->yAxisRepeat:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    if-ne v1, v2, :cond_5

    .line 147
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    mul-float/2addr v1, v3

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v2

    cmpg-float v1, v1, v2

    if-gtz v1, :cond_3

    .line 148
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v1

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v2

    add-float/2addr v1, v2

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v2

    sub-float/2addr v1, v2

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->setY(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 149
    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v1

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v3

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v4

    invoke-static {v3, v4}, Lcom/itextpdf/layout/properties/BackgroundRepeat;->calculateWhitespace(FF)F

    move-result v3

    float-to-double v3, v3

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/itextpdf/kernel/geom/Point;->setLocation(DD)V

    goto :goto_2

    .line 151
    :cond_3
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v2

    sub-float/2addr v1, v2

    .line 152
    .local v1, "topSpace":F
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v2

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v3

    sub-float/2addr v2, v3

    .line 153
    .local v2, "bottomSpace":F
    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v3

    .line 154
    .local v3, "yWhitespace":F
    cmpl-float v5, v3, v4

    if-lez v5, :cond_4

    move v4, v3

    .line 155
    .end local v3    # "yWhitespace":F
    .local v4, "yWhitespace":F
    :cond_4
    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v5

    float-to-double v7, v4

    invoke-virtual {v0, v5, v6, v7, v8}, Lcom/itextpdf/kernel/geom/Point;->setLocation(DD)V

    .line 158
    .end local v1    # "topSpace":F
    .end local v2    # "bottomSpace":F
    .end local v4    # "yWhitespace":F
    :cond_5
    :goto_2
    return-object v0
.end method


# virtual methods
.method public getXAxisRepeat()Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundRepeat;->xAxisRepeat:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    return-object v0
.end method

.method public getYAxisRepeat()Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundRepeat;->yAxisRepeat:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    return-object v0
.end method

.method public isNoRepeatOnXAxis()Z
    .locals 2

    .line 87
    iget-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundRepeat;->xAxisRepeat:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    sget-object v1, Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;->NO_REPEAT:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isNoRepeatOnYAxis()Z
    .locals 2

    .line 96
    iget-object v0, p0, Lcom/itextpdf/layout/properties/BackgroundRepeat;->yAxisRepeat:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    sget-object v1, Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;->NO_REPEAT:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public prepareRectangleToDrawingAndGetWhitespace(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/layout/properties/BackgroundSize;)Lcom/itextpdf/kernel/geom/Point;
    .locals 5
    .param p1, "imageRectangle"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "backgroundArea"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p3, "backgroundSize"    # Lcom/itextpdf/layout/properties/BackgroundSize;

    .line 110
    sget-object v0, Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;->ROUND:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    iget-object v1, p0, Lcom/itextpdf/layout/properties/BackgroundRepeat;->xAxisRepeat:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    if-ne v0, v1, :cond_0

    .line 111
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    invoke-static {v0, v1}, Lcom/itextpdf/layout/properties/BackgroundRepeat;->calculateRatio(FF)I

    move-result v0

    .line 112
    .local v0, "ratio":I
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    div-float/2addr v1, v2

    .line 113
    .local v1, "initialImageRatio":F
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    int-to-float v3, v0

    div-float/2addr v2, v3

    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 114
    sget-object v2, Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;->ROUND:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    iget-object v3, p0, Lcom/itextpdf/layout/properties/BackgroundRepeat;->yAxisRepeat:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    if-eq v2, v3, :cond_0

    invoke-virtual {p3}, Lcom/itextpdf/layout/properties/BackgroundSize;->getBackgroundHeightSize()Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v2

    if-nez v2, :cond_0

    .line 115
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v2

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v3

    mul-float/2addr v3, v1

    sub-float/2addr v2, v3

    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 116
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    mul-float/2addr v2, v1

    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 119
    .end local v0    # "ratio":I
    .end local v1    # "initialImageRatio":F
    :cond_0
    sget-object v0, Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;->ROUND:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    iget-object v1, p0, Lcom/itextpdf/layout/properties/BackgroundRepeat;->yAxisRepeat:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    if-ne v0, v1, :cond_1

    .line 120
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    invoke-static {v0, v1}, Lcom/itextpdf/layout/properties/BackgroundRepeat;->calculateRatio(FF)I

    move-result v0

    .line 121
    .restart local v0    # "ratio":I
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v2

    div-float/2addr v1, v2

    .line 122
    .restart local v1    # "initialImageRatio":F
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v2

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v3

    int-to-float v4, v0

    div-float/2addr v3, v4

    sub-float/2addr v2, v3

    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 123
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v2

    int-to-float v3, v0

    div-float/2addr v2, v3

    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 124
    sget-object v2, Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;->ROUND:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    iget-object v3, p0, Lcom/itextpdf/layout/properties/BackgroundRepeat;->xAxisRepeat:Lcom/itextpdf/layout/properties/BackgroundRepeat$BackgroundRepeatValue;

    if-eq v2, v3, :cond_1

    invoke-virtual {p3}, Lcom/itextpdf/layout/properties/BackgroundSize;->getBackgroundWidthSize()Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v2

    if-nez v2, :cond_1

    .line 125
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v2

    mul-float/2addr v2, v1

    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 129
    .end local v0    # "ratio":I
    .end local v1    # "initialImageRatio":F
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/layout/properties/BackgroundRepeat;->processSpaceValueAndCalculateWhitespace(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v0

    return-object v0
.end method
