.class public Lcom/itextpdf/kernel/geom/BezierCurve;
.super Ljava/lang/Object;
.source "BezierCurve.java"

# interfaces
.implements Lcom/itextpdf/kernel/geom/IShape;


# static fields
.field public static curveCollinearityEpsilon:D

.field public static distanceToleranceManhattan:D

.field public static distanceToleranceSquare:D


# instance fields
.field private final controlPoints:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Point;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 37
    const-wide v0, 0x39b4484bfeebc2a0L    # 1.0E-30

    sput-wide v0, Lcom/itextpdf/kernel/geom/BezierCurve;->curveCollinearityEpsilon:D

    .line 47
    const-wide v0, 0x3f9999999999999aL    # 0.025

    sput-wide v0, Lcom/itextpdf/kernel/geom/BezierCurve;->distanceToleranceSquare:D

    .line 59
    const-wide v0, 0x3fd999999999999aL    # 0.4

    sput-wide v0, Lcom/itextpdf/kernel/geom/BezierCurve;->distanceToleranceManhattan:D

    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Point;",
            ">;)V"
        }
    .end annotation

    .line 68
    .local p1, "controlPoints":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Point;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/itextpdf/kernel/geom/BezierCurve;->controlPoints:Ljava/util/List;

    .line 70
    return-void
.end method

.method private recursiveApproximation(DDDDDDDDLjava/util/List;)V
    .locals 46
    .param p1, "x1"    # D
    .param p3, "y1"    # D
    .param p5, "x2"    # D
    .param p7, "y2"    # D
    .param p9, "x3"    # D
    .param p11, "y3"    # D
    .param p13, "x4"    # D
    .param p15, "y4"    # D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(DDDDDDDD",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Point;",
            ">;)V"
        }
    .end annotation

    .line 104
    .local p17, "points":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Point;>;"
    move-object/from16 v0, p17

    add-double v1, p1, p5

    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    div-double v5, v1, v3

    .line 105
    .local v5, "x12":D
    add-double v1, p3, p7

    div-double v7, v1, v3

    .line 106
    .local v7, "y12":D
    add-double v1, p5, p9

    div-double v18, v1, v3

    .line 107
    .local v18, "x23":D
    add-double v1, p7, p11

    div-double v20, v1, v3

    .line 108
    .local v20, "y23":D
    add-double v1, p9, p13

    div-double v22, v1, v3

    .line 109
    .local v22, "x34":D
    add-double v1, p11, p15

    div-double v24, v1, v3

    .line 110
    .local v24, "y34":D
    add-double v1, v5, v18

    div-double v9, v1, v3

    .line 111
    .local v9, "x123":D
    add-double v1, v7, v20

    div-double v11, v1, v3

    .line 112
    .local v11, "y123":D
    add-double v1, v18, v22

    div-double v26, v1, v3

    .line 113
    .local v26, "x234":D
    add-double v1, v20, v24

    div-double v28, v1, v3

    .line 114
    .local v28, "y234":D
    add-double v1, v9, v26

    div-double/2addr v1, v3

    .line 115
    .local v1, "x1234":D
    add-double v13, v11, v28

    div-double v3, v13, v3

    .line 117
    .local v3, "y1234":D
    sub-double v30, p13, p1

    .line 118
    .local v30, "dx":D
    sub-double v32, p15, p3

    .line 122
    .local v32, "dy":D
    sub-double v13, p5, p13

    mul-double v13, v13, v32

    sub-double v15, p7, p15

    mul-double v15, v15, v30

    sub-double/2addr v13, v15

    invoke-static {v13, v14}, Ljava/lang/Math;->abs(D)D

    move-result-wide v34

    .line 125
    .local v34, "d2":D
    sub-double v13, p9, p13

    mul-double v13, v13, v32

    sub-double v15, p11, p15

    mul-double v15, v15, v30

    sub-double/2addr v13, v15

    invoke-static {v13, v14}, Ljava/lang/Math;->abs(D)D

    move-result-wide v36

    .line 129
    .local v36, "d3":D
    sget-wide v13, Lcom/itextpdf/kernel/geom/BezierCurve;->curveCollinearityEpsilon:D

    cmpl-double v13, v34, v13

    if-gtz v13, :cond_1

    sget-wide v13, Lcom/itextpdf/kernel/geom/BezierCurve;->curveCollinearityEpsilon:D

    cmpl-double v13, v36, v13

    if-lez v13, :cond_0

    goto :goto_0

    .line 138
    :cond_0
    add-double v13, p1, p9

    sub-double v13, v13, p5

    sub-double v13, v13, p5

    invoke-static {v13, v14}, Ljava/lang/Math;->abs(D)D

    move-result-wide v13

    add-double v15, p3, p11

    sub-double v15, v15, p7

    sub-double v15, v15, p7

    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->abs(D)D

    move-result-wide v15

    add-double/2addr v13, v15

    add-double v15, p5, p13

    sub-double v15, v15, p9

    sub-double v15, v15, p9

    .line 139
    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->abs(D)D

    move-result-wide v15

    add-double/2addr v13, v15

    add-double v15, p7, p15

    sub-double v15, v15, p11

    sub-double v15, v15, p11

    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->abs(D)D

    move-result-wide v15

    add-double/2addr v13, v15

    sget-wide v15, Lcom/itextpdf/kernel/geom/BezierCurve;->distanceToleranceManhattan:D

    cmpg-double v13, v13, v15

    if-gtz v13, :cond_2

    .line 140
    new-instance v13, Lcom/itextpdf/kernel/geom/Point;

    invoke-direct {v13, v1, v2, v3, v4}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-interface {v0, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 141
    return-void

    .line 132
    :cond_1
    :goto_0
    add-double v13, v34, v36

    add-double v15, v34, v36

    mul-double/2addr v13, v15

    sget-wide v15, Lcom/itextpdf/kernel/geom/BezierCurve;->distanceToleranceSquare:D

    mul-double v38, v30, v30

    mul-double v40, v32, v32

    add-double v38, v38, v40

    mul-double v15, v15, v38

    cmpg-double v13, v13, v15

    if-gtz v13, :cond_2

    .line 133
    new-instance v13, Lcom/itextpdf/kernel/geom/Point;

    invoke-direct {v13, v1, v2, v3, v4}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-interface {v0, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 134
    return-void

    .line 145
    :cond_2
    move-object/from16 v17, v0

    move-wide v13, v1

    move-wide v15, v3

    move-object/from16 v0, p0

    move-wide/from16 v1, p1

    move-wide/from16 v3, p3

    .end local v1    # "x1234":D
    .end local v3    # "y1234":D
    .local v13, "x1234":D
    .local v15, "y1234":D
    invoke-direct/range {v0 .. v17}, Lcom/itextpdf/kernel/geom/BezierCurve;->recursiveApproximation(DDDDDDDDLjava/util/List;)V

    .line 146
    move-wide/from16 v38, v5

    move-wide/from16 v40, v7

    move-wide/from16 v42, v9

    move-wide/from16 v44, v11

    move-wide v1, v13

    .end local v5    # "x12":D
    .end local v7    # "y12":D
    .end local v9    # "x123":D
    .end local v11    # "y123":D
    .end local v13    # "x1234":D
    .restart local v1    # "x1234":D
    .local v38, "x12":D
    .local v40, "y12":D
    .local v42, "x123":D
    .local v44, "y123":D
    move-wide/from16 v13, p13

    move-object/from16 v17, p17

    move-wide v3, v15

    move-wide/from16 v9, v22

    move-wide/from16 v11, v24

    move-wide/from16 v5, v26

    move-wide/from16 v7, v28

    move-wide/from16 v15, p15

    .end local v15    # "y1234":D
    .end local v22    # "x34":D
    .end local v24    # "y34":D
    .end local v26    # "x234":D
    .end local v28    # "y234":D
    .restart local v3    # "y1234":D
    .local v5, "x234":D
    .local v7, "y234":D
    .local v9, "x34":D
    .local v11, "y34":D
    invoke-direct/range {v0 .. v17}, Lcom/itextpdf/kernel/geom/BezierCurve;->recursiveApproximation(DDDDDDDDLjava/util/List;)V

    .line 147
    move-wide v15, v3

    .end local v3    # "y1234":D
    .restart local v15    # "y1234":D
    return-void
.end method


# virtual methods
.method public getBasePoints()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Point;",
            ">;"
        }
    .end annotation

    .line 76
    iget-object v0, p0, Lcom/itextpdf/kernel/geom/BezierCurve;->controlPoints:Ljava/util/List;

    return-object v0
.end method

.method public getPiecewiseLinearApproximation()Ljava/util/List;
    .locals 25
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Point;",
            ">;"
        }
    .end annotation

    .line 88
    move-object/from16 v0, p0

    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v1, v17

    .line 89
    .local v1, "points":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Point;>;"
    iget-object v2, v0, Lcom/itextpdf/kernel/geom/BezierCurve;->controlPoints:Ljava/util/List;

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 91
    iget-object v2, v0, Lcom/itextpdf/kernel/geom/BezierCurve;->controlPoints:Ljava/util/List;

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/geom/Point;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v4

    iget-object v2, v0, Lcom/itextpdf/kernel/geom/BezierCurve;->controlPoints:Ljava/util/List;

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/geom/Point;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v2

    iget-object v6, v0, Lcom/itextpdf/kernel/geom/BezierCurve;->controlPoints:Ljava/util/List;

    .line 92
    const/4 v7, 0x1

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/geom/Point;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v8

    iget-object v6, v0, Lcom/itextpdf/kernel/geom/BezierCurve;->controlPoints:Ljava/util/List;

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/geom/Point;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v10

    iget-object v6, v0, Lcom/itextpdf/kernel/geom/BezierCurve;->controlPoints:Ljava/util/List;

    .line 93
    const/4 v12, 0x2

    invoke-interface {v6, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/geom/Point;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v13

    iget-object v6, v0, Lcom/itextpdf/kernel/geom/BezierCurve;->controlPoints:Ljava/util/List;

    invoke-interface {v6, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/geom/Point;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v15

    iget-object v6, v0, Lcom/itextpdf/kernel/geom/BezierCurve;->controlPoints:Ljava/util/List;

    .line 94
    const/4 v12, 0x3

    invoke-interface {v6, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/geom/Point;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v17

    iget-object v6, v0, Lcom/itextpdf/kernel/geom/BezierCurve;->controlPoints:Ljava/util/List;

    invoke-interface {v6, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/geom/Point;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v19

    .line 91
    move-wide/from16 v21, v17

    move-object/from16 v17, v1

    move/from16 v18, v7

    move-wide/from16 v23, v4

    move-wide v3, v2

    move-wide/from16 v1, v23

    move-wide v5, v8

    move-wide v7, v10

    move-wide v9, v13

    move-wide v11, v15

    move-wide/from16 v13, v21

    move-wide/from16 v15, v19

    .end local v1    # "points":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Point;>;"
    .local v17, "points":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Point;>;"
    invoke-direct/range {v0 .. v17}, Lcom/itextpdf/kernel/geom/BezierCurve;->recursiveApproximation(DDDDDDDDLjava/util/List;)V

    .line 96
    move-object/from16 v1, v17

    .end local v17    # "points":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Point;>;"
    .restart local v1    # "points":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Point;>;"
    iget-object v2, v0, Lcom/itextpdf/kernel/geom/BezierCurve;->controlPoints:Ljava/util/List;

    iget-object v3, v0, Lcom/itextpdf/kernel/geom/BezierCurve;->controlPoints:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 97
    return-object v1
.end method
