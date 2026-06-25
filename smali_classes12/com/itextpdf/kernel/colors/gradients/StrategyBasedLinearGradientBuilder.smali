.class public Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder;
.super Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;
.source "StrategyBasedLinearGradientBuilder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;
    }
.end annotation


# instance fields
.field private gradientStrategy:Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

.field private isCentralRotationAngleStrategy:Z

.field private rotateVectorAngle:D


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 42
    invoke-direct {p0}, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;-><init>()V

    .line 35
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder;->rotateVectorAngle:D

    .line 36
    sget-object v0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;->TO_BOTTOM:Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    iput-object v0, p0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder;->gradientStrategy:Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    .line 37
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder;->isCentralRotationAngleStrategy:Z

    .line 43
    return-void
.end method

.method private static buildCentralRotationCoordinates(Lcom/itextpdf/kernel/geom/Rectangle;D)[Lcom/itextpdf/kernel/geom/Point;
    .locals 9
    .param p0, "targetBoundingBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p1, "angle"    # D

    .line 143
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    add-float/2addr v0, v1

    float-to-double v5, v0

    .line 144
    .local v5, "xCenter":D
    nop

    .line 145
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    div-float/2addr v1, v2

    add-float/2addr v0, v1

    float-to-double v7, v0

    .line 144
    move-wide v3, p1

    .end local p1    # "angle":D
    .local v3, "angle":D
    invoke-static/range {v3 .. v8}, Lcom/itextpdf/kernel/geom/AffineTransform;->getRotateInstance(DDD)Lcom/itextpdf/kernel/geom/AffineTransform;

    move-result-object p1

    .line 146
    .local p1, "rotateInstance":Lcom/itextpdf/kernel/geom/AffineTransform;
    invoke-static {p0, p1}, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder;->buildCoordinates(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/AffineTransform;)[Lcom/itextpdf/kernel/geom/Point;

    move-result-object p2

    return-object p2
.end method

.method private static buildCoordinates(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/AffineTransform;)[Lcom/itextpdf/kernel/geom/Point;
    .locals 7
    .param p0, "targetBoundingBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p1, "transformation"    # Lcom/itextpdf/kernel/geom/AffineTransform;

    .line 174
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    add-float/2addr v0, v1

    float-to-double v0, v0

    .line 175
    .local v0, "xCenter":D
    new-instance v2, Lcom/itextpdf/kernel/geom/Point;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v3

    float-to-double v3, v3

    invoke-direct {v2, v0, v1, v3, v4}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3}, Lcom/itextpdf/kernel/geom/AffineTransform;->transform(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v2

    .line 176
    .local v2, "start":Lcom/itextpdf/kernel/geom/Point;
    new-instance v4, Lcom/itextpdf/kernel/geom/Point;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v5

    float-to-double v5, v5

    invoke-direct {v4, v0, v1, v5, v6}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-virtual {p1, v4, v3}, Lcom/itextpdf/kernel/geom/AffineTransform;->transform(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v3

    .line 177
    .local v3, "end":Lcom/itextpdf/kernel/geom/Point;
    const/4 v4, 0x2

    new-array v4, v4, [Lcom/itextpdf/kernel/geom/Point;

    const/4 v5, 0x0

    aput-object v2, v4, v5

    const/4 v5, 0x1

    aput-object v3, v4, v5

    .line 178
    .local v4, "baseVector":[Lcom/itextpdf/kernel/geom/Point;
    invoke-static {v4, p0}, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder;->evaluateCoveringDomain([Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Rectangle;)[D

    move-result-object v5

    .line 179
    .local v5, "targetDomain":[D
    invoke-static {v5, v4}, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder;->createCoordinatesForNewDomain([D[Lcom/itextpdf/kernel/geom/Point;)[Lcom/itextpdf/kernel/geom/Point;

    move-result-object v6

    return-object v6
.end method

.method private static buildCoordinatesWithGradientStrategy(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;)[Lcom/itextpdf/kernel/geom/Point;
    .locals 13
    .param p0, "targetBoundingBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p1, "gradientStrategy"    # Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    .line 110
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    add-float/2addr v0, v1

    float-to-double v3, v0

    .line 111
    .local v3, "xCenter":D
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    div-float/2addr v1, v2

    add-float/2addr v0, v1

    float-to-double v7, v0

    .line 112
    .local v7, "yCenter":D
    sget-object v0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$1;->$SwitchMap$com$itextpdf$kernel$colors$gradients$StrategyBasedLinearGradientBuilder$GradientStrategy:[I

    invoke-virtual {p1}, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 137
    move-wide v1, v7

    .end local v7    # "yCenter":D
    .local v1, "yCenter":D
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v0

    float-to-double v5, v0

    .line 138
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v0

    float-to-double v9, v0

    .line 137
    move-wide v7, v3

    invoke-static/range {v3 .. v10}, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder;->createCoordinates(DDDD)[Lcom/itextpdf/kernel/geom/Point;

    move-result-object v0

    return-object v0

    .line 132
    .end local v1    # "yCenter":D
    .restart local v7    # "yCenter":D
    :pswitch_0
    new-instance v0, Lcom/itextpdf/kernel/geom/Point;

    .line 133
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v1

    float-to-double v1, v1

    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v5

    float-to-double v5, v5

    invoke-direct {v0, v1, v2, v5, v6}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    .line 132
    invoke-static {p0, v0}, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder;->buildToCornerCoordinates(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Point;)[Lcom/itextpdf/kernel/geom/Point;

    move-result-object v0

    return-object v0

    .line 129
    :pswitch_1
    new-instance v0, Lcom/itextpdf/kernel/geom/Point;

    .line 130
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v1

    float-to-double v1, v1

    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v5

    float-to-double v5, v5

    invoke-direct {v0, v1, v2, v5, v6}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    .line 129
    invoke-static {p0, v0}, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder;->buildToCornerCoordinates(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Point;)[Lcom/itextpdf/kernel/geom/Point;

    move-result-object v0

    return-object v0

    .line 126
    :pswitch_2
    new-instance v0, Lcom/itextpdf/kernel/geom/Point;

    .line 127
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v1

    float-to-double v1, v1

    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v5

    float-to-double v5, v5

    invoke-direct {v0, v1, v2, v5, v6}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    .line 126
    invoke-static {p0, v0}, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder;->buildToCornerCoordinates(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Point;)[Lcom/itextpdf/kernel/geom/Point;

    move-result-object v0

    return-object v0

    .line 123
    :pswitch_3
    new-instance v0, Lcom/itextpdf/kernel/geom/Point;

    .line 124
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v1

    float-to-double v1, v1

    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v5

    float-to-double v5, v5

    invoke-direct {v0, v1, v2, v5, v6}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    .line 123
    invoke-static {p0, v0}, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder;->buildToCornerCoordinates(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Point;)[Lcom/itextpdf/kernel/geom/Point;

    move-result-object v0

    return-object v0

    .line 120
    :pswitch_4
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v0

    float-to-double v5, v0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v0

    float-to-double v9, v0

    move-wide v11, v7

    invoke-static/range {v5 .. v12}, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder;->createCoordinates(DDDD)[Lcom/itextpdf/kernel/geom/Point;

    move-result-object v0

    return-object v0

    .line 117
    :pswitch_5
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v0

    float-to-double v5, v0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v0

    float-to-double v9, v0

    move-wide v11, v7

    invoke-static/range {v5 .. v12}, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder;->createCoordinates(DDDD)[Lcom/itextpdf/kernel/geom/Point;

    move-result-object v0

    move-wide v1, v7

    .end local v7    # "yCenter":D
    .restart local v1    # "yCenter":D
    return-object v0

    .line 114
    .end local v1    # "yCenter":D
    .restart local v7    # "yCenter":D
    :pswitch_6
    move-wide v1, v7

    .end local v7    # "yCenter":D
    .restart local v1    # "yCenter":D
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v0

    float-to-double v5, v0

    .line 115
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v0

    float-to-double v9, v0

    .line 114
    move-wide v7, v3

    invoke-static/range {v3 .. v10}, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder;->createCoordinates(DDDD)[Lcom/itextpdf/kernel/geom/Point;

    move-result-object v0

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static buildToCornerCoordinates(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Point;)[Lcom/itextpdf/kernel/geom/Point;
    .locals 6
    .param p0, "targetBoundingBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p1, "gradientCenterLineRightCorner"    # Lcom/itextpdf/kernel/geom/Point;

    .line 150
    new-instance v0, Lcom/itextpdf/kernel/geom/Point;

    .line 151
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v1

    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    add-float/2addr v1, v2

    float-to-double v1, v1

    .line 152
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v4

    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v5

    div-float/2addr v5, v3

    add-float/2addr v4, v5

    float-to-double v3, v4

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    .line 150
    invoke-static {v0, p1}, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder;->buildToCornerTransform(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/AffineTransform;

    move-result-object v0

    .line 154
    .local v0, "transform":Lcom/itextpdf/kernel/geom/AffineTransform;
    invoke-static {p0, v0}, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder;->buildCoordinates(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/AffineTransform;)[Lcom/itextpdf/kernel/geom/Point;

    move-result-object v1

    return-object v1
.end method

.method private static buildToCornerTransform(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/AffineTransform;
    .locals 21
    .param p0, "center"    # Lcom/itextpdf/kernel/geom/Point;
    .param p1, "gradientCenterLineRightCorner"    # Lcom/itextpdf/kernel/geom/Point;

    .line 158
    invoke-virtual/range {p0 .. p1}, Lcom/itextpdf/kernel/geom/Point;->distance(Lcom/itextpdf/kernel/geom/Point;)D

    move-result-wide v0

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    div-double v0, v2, v0

    .line 159
    .local v0, "scale":D
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v4

    invoke-virtual/range {p0 .. p0}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v6

    sub-double/2addr v4, v6

    mul-double/2addr v4, v0

    .line 160
    .local v4, "sin":D
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v6

    invoke-virtual/range {p0 .. p0}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v8

    sub-double/2addr v6, v8

    mul-double/2addr v6, v0

    .line 161
    .local v6, "cos":D
    invoke-static {v6, v7}, Ljava/lang/Math;->abs(D)D

    move-result-wide v8

    const-wide v10, 0x3ddb7cdfd9d7bdbbL    # 1.0E-10

    cmpg-double v8, v8, v10

    const-wide/high16 v12, -0x4010000000000000L    # -1.0

    const-wide/16 v14, 0x0

    if-gez v8, :cond_1

    .line 162
    const-wide/16 v6, 0x0

    .line 163
    cmpl-double v8, v4, v14

    if-lez v8, :cond_0

    move-wide v12, v2

    :cond_0
    move-wide v4, v12

    move-wide v11, v4

    move-wide v9, v6

    goto :goto_0

    .line 164
    :cond_1
    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    move-result-wide v8

    cmpg-double v8, v8, v10

    if-gez v8, :cond_3

    .line 165
    const-wide/16 v4, 0x0

    .line 166
    cmpl-double v8, v6, v14

    if-lez v8, :cond_2

    move-wide v12, v2

    :cond_2
    move-wide v6, v12

    move-wide v11, v4

    move-wide v9, v6

    goto :goto_0

    .line 164
    :cond_3
    move-wide v11, v4

    move-wide v9, v6

    .line 168
    .end local v4    # "sin":D
    .end local v6    # "cos":D
    .local v9, "cos":D
    .local v11, "sin":D
    :goto_0
    invoke-virtual/range {p0 .. p0}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v4

    sub-double v6, v2, v9

    mul-double/2addr v4, v6

    invoke-virtual/range {p0 .. p0}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v6

    mul-double/2addr v6, v11

    add-double v17, v4, v6

    .line 169
    .local v17, "m02":D
    invoke-virtual/range {p0 .. p0}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v4

    sub-double/2addr v2, v9

    mul-double/2addr v4, v2

    invoke-virtual/range {p0 .. p0}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v2

    mul-double/2addr v2, v11

    sub-double v19, v4, v2

    .line 170
    .local v19, "m12":D
    new-instance v8, Lcom/itextpdf/kernel/geom/AffineTransform;

    neg-double v13, v11

    move-wide v15, v9

    invoke-direct/range {v8 .. v20}, Lcom/itextpdf/kernel/geom/AffineTransform;-><init>(DDDDDD)V

    return-object v8
.end method

.method private static createCoordinates(DDDD)[Lcom/itextpdf/kernel/geom/Point;
    .locals 3
    .param p0, "x1"    # D
    .param p2, "y1"    # D
    .param p4, "x2"    # D
    .param p6, "y2"    # D

    .line 183
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/itextpdf/kernel/geom/Point;

    new-instance v1, Lcom/itextpdf/kernel/geom/Point;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    new-instance v1, Lcom/itextpdf/kernel/geom/Point;

    invoke-direct {v1, p4, p5, p6, p7}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    return-object v0
.end method


# virtual methods
.method public getGradientStrategy()Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;
    .locals 1

    .line 86
    iget-object v0, p0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder;->gradientStrategy:Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    return-object v0
.end method

.method protected getGradientVector(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/AffineTransform;)[Lcom/itextpdf/kernel/geom/Point;
    .locals 2
    .param p1, "targetBoundingBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "contextTransform"    # Lcom/itextpdf/kernel/geom/AffineTransform;

    .line 100
    if-nez p1, :cond_0

    .line 101
    const/4 v0, 0x0

    return-object v0

    .line 103
    :cond_0
    iget-boolean v0, p0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder;->isCentralRotationAngleStrategy:Z

    if-eqz v0, :cond_1

    iget-wide v0, p0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder;->rotateVectorAngle:D

    .line 104
    invoke-static {p1, v0, v1}, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder;->buildCentralRotationCoordinates(Lcom/itextpdf/kernel/geom/Rectangle;D)[Lcom/itextpdf/kernel/geom/Point;

    move-result-object v0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder;->gradientStrategy:Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    .line 105
    invoke-static {p1, v0}, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder;->buildCoordinatesWithGradientStrategy(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;)[Lcom/itextpdf/kernel/geom/Point;

    move-result-object v0

    .line 103
    :goto_0
    return-object v0
.end method

.method public getRotateVectorAngle()D
    .locals 2

    .line 77
    iget-wide v0, p0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder;->rotateVectorAngle:D

    return-wide v0
.end method

.method public isCentralRotationAngleStrategy()Z
    .locals 1

    .line 95
    iget-boolean v0, p0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder;->isCentralRotationAngleStrategy:Z

    return v0
.end method

.method public setGradientDirectionAsCentralRotationAngle(D)Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder;
    .locals 1
    .param p1, "radians"    # D

    .line 54
    iput-wide p1, p0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder;->rotateVectorAngle:D

    .line 55
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder;->isCentralRotationAngleStrategy:Z

    .line 56
    return-object p0
.end method

.method public setGradientDirectionAsStrategy(Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;)Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder;
    .locals 1
    .param p1, "gradientStrategy"    # Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    .line 66
    if-eqz p1, :cond_0

    move-object v0, p1

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;->TO_BOTTOM:Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    :goto_0
    iput-object v0, p0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder;->gradientStrategy:Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder$GradientStrategy;

    .line 67
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/colors/gradients/StrategyBasedLinearGradientBuilder;->isCentralRotationAngleStrategy:Z

    .line 68
    return-object p0
.end method
