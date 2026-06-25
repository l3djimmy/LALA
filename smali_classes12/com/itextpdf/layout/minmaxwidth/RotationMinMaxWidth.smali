.class public Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth;
.super Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
.source "RotationMinMaxWidth.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;
    }
.end annotation


# instance fields
.field private maxWidthHeight:D

.field private maxWidthOrigin:D

.field private minWidthHeight:D

.field private minWidthOrigin:D


# direct methods
.method public constructor <init>(DDDDDD)V
    .locals 3
    .param p1, "minWidth"    # D
    .param p3, "maxWidth"    # D
    .param p5, "minWidthOrigin"    # D
    .param p7, "maxWidthOrigin"    # D
    .param p9, "minWidthHeight"    # D
    .param p11, "maxWidthHeight"    # D

    .line 50
    double-to-float v0, p1

    double-to-float v1, p3

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;-><init>(FFF)V

    .line 51
    iput-wide p7, p0, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth;->maxWidthOrigin:D

    .line 52
    iput-wide p5, p0, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth;->minWidthOrigin:D

    .line 53
    iput-wide p9, p0, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth;->minWidthHeight:D

    .line 54
    iput-wide p11, p0, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth;->maxWidthHeight:D

    .line 55
    return-void
.end method

.method static synthetic access$000(D)D
    .locals 2
    .param p0, "x0"    # D

    .line 32
    invoke-static {p0, p1}, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth;->sin(D)D

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$100(D)D
    .locals 2
    .param p0, "x0"    # D

    .line 32
    invoke-static {p0, p1}, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth;->cos(D)D

    move-result-wide v0

    return-wide v0
.end method

.method public static calculate(DDLcom/itextpdf/layout/minmaxwidth/MinMaxWidth;)Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth;
    .locals 5
    .param p0, "angle"    # D
    .param p2, "area"    # D
    .param p4, "elementMinMaxWidth"    # Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    .line 83
    new-instance v0, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;-><init>(DD)V

    .line 84
    .local v0, "function":Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;
    invoke-virtual {p4}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMinWidth()F

    move-result v1

    float-to-double v1, v1

    invoke-virtual {p4}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMaxWidth()F

    move-result v3

    float-to-double v3, v3

    invoke-static {v0, v1, v2, v3, v4}, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth;->calculate(Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;DD)Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth;

    move-result-object v1

    return-object v1
.end method

.method public static calculate(DDLcom/itextpdf/layout/minmaxwidth/MinMaxWidth;D)Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth;
    .locals 25
    .param p0, "angle"    # D
    .param p2, "area"    # D
    .param p4, "elementMinMaxWidth"    # Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .param p5, "availableWidth"    # D

    .line 98
    new-instance v0, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;

    move-wide/from16 v1, p0

    move-wide/from16 v3, p2

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;-><init>(DD)V

    .line 99
    .local v0, "function":Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;
    move-wide/from16 v5, p5

    invoke-virtual {v0, v5, v6}, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;->getValidOriginalWidths(D)Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction$Interval;

    move-result-object v7

    .line 100
    .local v7, "validArguments":Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction$Interval;
    if-nez v7, :cond_0

    .line 101
    const/4 v8, 0x0

    return-object v8

    .line 103
    :cond_0
    invoke-virtual/range {p4 .. p4}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMinWidth()F

    move-result v8

    float-to-double v8, v8

    invoke-virtual {v7}, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction$Interval;->getMin()D

    move-result-wide v10

    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->max(DD)D

    move-result-wide v8

    .line 104
    .local v8, "xMin":D
    invoke-virtual/range {p4 .. p4}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMaxWidth()F

    move-result v10

    float-to-double v10, v10

    invoke-virtual {v7}, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction$Interval;->getMax()D

    move-result-wide v12

    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->min(DD)D

    move-result-wide v10

    .line 106
    .local v10, "xMax":D
    cmpg-double v12, v10, v8

    if-gez v12, :cond_1

    .line 109
    invoke-virtual {v0, v8, v9}, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;->getRotatedWidth(D)D

    move-result-wide v13

    .line 110
    .local v13, "rotatedWidth":D
    invoke-virtual {v0, v8, v9}, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;->getRotatedHeight(D)D

    move-result-wide v21

    .line 111
    .local v21, "rotatedHeight":D
    new-instance v12, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth;

    move-wide v15, v13

    move-wide/from16 v19, v8

    move-wide/from16 v23, v21

    move-wide/from16 v17, v8

    .end local v8    # "xMin":D
    .local v17, "xMin":D
    invoke-direct/range {v12 .. v24}, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth;-><init>(DDDDDD)V

    .end local v17    # "xMin":D
    .restart local v8    # "xMin":D
    return-object v12

    .line 113
    .end local v13    # "rotatedWidth":D
    .end local v21    # "rotatedHeight":D
    :cond_1
    invoke-static {v0, v8, v9, v10, v11}, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth;->calculate(Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;DD)Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth;

    move-result-object v12

    return-object v12
.end method

.method private static calculate(Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;DD)Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth;
    .locals 22
    .param p0, "func"    # Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;
    .param p1, "xMin"    # D
    .param p3, "xMax"    # D

    .line 141
    move-object/from16 v0, p0

    move-wide/from16 v1, p3

    invoke-virtual {v0}, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;->getWidthDerivativeZeroPoint()D

    move-result-wide v3

    .line 144
    .local v3, "x0":D
    cmpg-double v5, v3, p1

    if-gez v5, :cond_0

    .line 146
    move-wide/from16 v5, p1

    .line 147
    .local v5, "minWidthOrigin":D
    move-wide/from16 v7, p3

    move-wide v14, v5

    .local v7, "maxWidthOrigin":D
    goto :goto_1

    .line 149
    .end local v5    # "minWidthOrigin":D
    .end local v7    # "maxWidthOrigin":D
    :cond_0
    cmpl-double v5, v3, v1

    if-lez v5, :cond_1

    .line 151
    move-wide/from16 v5, p3

    .line 152
    .restart local v5    # "minWidthOrigin":D
    move-wide/from16 v7, p1

    move-wide v14, v5

    .restart local v7    # "maxWidthOrigin":D
    goto :goto_1

    .line 157
    .end local v5    # "minWidthOrigin":D
    .end local v7    # "maxWidthOrigin":D
    :cond_1
    move-wide v5, v3

    .line 158
    .restart local v5    # "minWidthOrigin":D
    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;->getRotatedWidth(D)D

    move-result-wide v7

    invoke-virtual/range {p0 .. p2}, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;->getRotatedWidth(D)D

    move-result-wide v9

    cmpl-double v7, v7, v9

    if-lez v7, :cond_2

    move-wide v7, v1

    goto :goto_0

    :cond_2
    move-wide/from16 v7, p1

    :goto_0
    move-wide v14, v5

    .line 161
    .end local v5    # "minWidthOrigin":D
    .restart local v7    # "maxWidthOrigin":D
    .local v14, "minWidthOrigin":D
    :goto_1
    new-instance v9, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth;

    invoke-virtual {v0, v14, v15}, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;->getRotatedWidth(D)D

    move-result-wide v10

    invoke-virtual {v0, v7, v8}, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;->getRotatedWidth(D)D

    move-result-wide v12

    .line 162
    invoke-virtual {v0, v14, v15}, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;->getRotatedHeight(D)D

    move-result-wide v18

    invoke-virtual {v0, v7, v8}, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;->getRotatedHeight(D)D

    move-result-wide v20

    move-wide/from16 v16, v7

    .end local v7    # "maxWidthOrigin":D
    .local v16, "maxWidthOrigin":D
    invoke-direct/range {v9 .. v21}, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth;-><init>(DDDDDD)V

    .line 161
    return-object v9
.end method

.method public static calculateRotatedWidth(Lcom/itextpdf/kernel/geom/Rectangle;D)D
    .locals 6
    .param p0, "area"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p1, "angle"    # D

    .line 124
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v0

    float-to-double v0, v0

    invoke-static {p1, p2}, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth;->cos(D)D

    move-result-wide v2

    mul-double/2addr v0, v2

    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v2

    float-to-double v2, v2

    invoke-static {p1, p2}, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth;->sin(D)D

    move-result-wide v4

    mul-double/2addr v2, v4

    add-double/2addr v0, v2

    return-wide v0
.end method

.method private static correctSinCos(D)D
    .locals 3
    .param p0, "value"    # D

    .line 174
    const-wide/16 v0, 0x0

    invoke-static {p0, p1, v0, v1}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidthUtils;->isEqual(DD)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 175
    return-wide v0

    .line 176
    :cond_0
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    invoke-static {p0, p1, v0, v1}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidthUtils;->isEqual(DD)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 177
    return-wide v0

    .line 179
    :cond_1
    return-wide p0
.end method

.method private static cos(D)D
    .locals 2
    .param p0, "angle"    # D

    .line 170
    invoke-static {p0, p1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth;->correctSinCos(D)D

    move-result-wide v0

    return-wide v0
.end method

.method private static sin(D)D
    .locals 2
    .param p0, "angle"    # D

    .line 166
    invoke-static {p0, p1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth;->correctSinCos(D)D

    move-result-wide v0

    return-wide v0
.end method


# virtual methods
.method public getMaxWidthHeight()D
    .locals 2

    .line 70
    iget-wide v0, p0, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth;->maxWidthHeight:D

    return-wide v0
.end method

.method public getMaxWidthOrigin()D
    .locals 2

    .line 62
    iget-wide v0, p0, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth;->maxWidthOrigin:D

    return-wide v0
.end method

.method public getMinWidthHeight()D
    .locals 2

    .line 66
    iget-wide v0, p0, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth;->minWidthHeight:D

    return-wide v0
.end method

.method public getMinWidthOrigin()D
    .locals 2

    .line 58
    iget-wide v0, p0, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth;->minWidthOrigin:D

    return-wide v0
.end method
