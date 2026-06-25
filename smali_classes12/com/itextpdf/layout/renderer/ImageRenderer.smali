.class public Lcom/itextpdf/layout/renderer/ImageRenderer;
.super Lcom/itextpdf/layout/renderer/AbstractRenderer;
.source "ImageRenderer.java"

# interfaces
.implements Lcom/itextpdf/layout/renderer/ILeafElementRenderer;


# instance fields
.field protected deltaX:F

.field private doesObjectFitRequireCutting:Z

.field protected fixedXPosition:Ljava/lang/Float;

.field protected fixedYPosition:Ljava/lang/Float;

.field private height:Ljava/lang/Float;

.field protected imageHeight:F

.field protected imageWidth:F

.field private initialOccupiedAreaBBox:Lcom/itextpdf/kernel/geom/Rectangle;

.field matrix:[F

.field protected pivotY:F

.field private renderedImageHeight:F

.field private renderedImageWidth:F

.field private rotatedDeltaX:F

.field private rotatedDeltaY:F

.field private width:Ljava/lang/Float;


# direct methods
.method public constructor <init>(Lcom/itextpdf/layout/element/Image;)V
    .locals 1
    .param p1, "image"    # Lcom/itextpdf/layout/element/Image;

    .line 81
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;-><init>(Lcom/itextpdf/layout/element/IElement;)V

    .line 65
    const/4 v0, 0x6

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->matrix:[F

    .line 82
    invoke-virtual {p1}, Lcom/itextpdf/layout/element/Image;->getImageWidth()F

    move-result v0

    iput v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->imageWidth:F

    .line 83
    invoke-virtual {p1}, Lcom/itextpdf/layout/element/Image;->getImageHeight()F

    move-result v0

    iput v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->imageHeight:F

    .line 84
    return-void
.end method

.method private adjustPositionAfterRotation(FFF)F
    .locals 23
    .param p1, "angle"    # F
    .param p2, "maxWidth"    # F
    .param p3, "maxHeight"    # F

    .line 557
    move-object/from16 v0, p0

    move/from16 v1, p1

    const/4 v2, 0x0

    cmpl-float v2, v1, v2

    const/4 v3, 0x3

    if-eqz v2, :cond_2

    .line 558
    float-to-double v4, v1

    invoke-static {v4, v5}, Lcom/itextpdf/kernel/geom/AffineTransform;->getRotateInstance(D)Lcom/itextpdf/kernel/geom/AffineTransform;

    move-result-object v2

    .line 559
    .local v2, "t":Lcom/itextpdf/kernel/geom/AffineTransform;
    new-instance v4, Lcom/itextpdf/kernel/geom/Point;

    const/4 v5, 0x0

    invoke-direct {v4, v5, v5}, Lcom/itextpdf/kernel/geom/Point;-><init>(II)V

    new-instance v6, Lcom/itextpdf/kernel/geom/Point;

    invoke-direct {v6}, Lcom/itextpdf/kernel/geom/Point;-><init>()V

    invoke-virtual {v2, v4, v6}, Lcom/itextpdf/kernel/geom/AffineTransform;->transform(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v4

    .line 560
    .local v4, "p00":Lcom/itextpdf/kernel/geom/Point;
    new-instance v6, Lcom/itextpdf/kernel/geom/Point;

    iget-object v7, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    float-to-double v7, v7

    const-wide/16 v9, 0x0

    invoke-direct {v6, v9, v10, v7, v8}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v7, Lcom/itextpdf/kernel/geom/Point;

    invoke-direct {v7}, Lcom/itextpdf/kernel/geom/Point;-><init>()V

    invoke-virtual {v2, v6, v7}, Lcom/itextpdf/kernel/geom/AffineTransform;->transform(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v6

    .line 561
    .local v6, "p01":Lcom/itextpdf/kernel/geom/Point;
    new-instance v7, Lcom/itextpdf/kernel/geom/Point;

    iget-object v8, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    invoke-virtual {v8}, Ljava/lang/Float;->floatValue()F

    move-result v8

    float-to-double v11, v8

    invoke-direct {v7, v11, v12, v9, v10}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v8, Lcom/itextpdf/kernel/geom/Point;

    invoke-direct {v8}, Lcom/itextpdf/kernel/geom/Point;-><init>()V

    invoke-virtual {v2, v7, v8}, Lcom/itextpdf/kernel/geom/AffineTransform;->transform(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v7

    .line 562
    .local v7, "p10":Lcom/itextpdf/kernel/geom/Point;
    new-instance v8, Lcom/itextpdf/kernel/geom/Point;

    iget-object v9, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v9

    float-to-double v9, v9

    iget-object v11, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    invoke-virtual {v11}, Ljava/lang/Float;->floatValue()F

    move-result v11

    float-to-double v11, v11

    invoke-direct {v8, v9, v10, v11, v12}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v9, Lcom/itextpdf/kernel/geom/Point;

    invoke-direct {v9}, Lcom/itextpdf/kernel/geom/Point;-><init>()V

    invoke-virtual {v2, v8, v9}, Lcom/itextpdf/kernel/geom/AffineTransform;->transform(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v8

    .line 564
    .local v8, "p11":Lcom/itextpdf/kernel/geom/Point;
    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v9

    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v11

    invoke-virtual {v8}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v13

    new-array v15, v3, [D

    aput-wide v9, v15, v5

    const/4 v9, 0x1

    aput-wide v11, v15, v9

    const/4 v10, 0x2

    aput-wide v13, v15, v10

    .line 565
    .local v15, "xValues":[D
    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v11

    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v13

    invoke-virtual {v8}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v16

    move/from16 v18, v5

    new-array v5, v3, [D

    aput-wide v11, v5, v18

    aput-wide v13, v5, v9

    aput-wide v16, v5, v10

    .line 567
    .local v5, "yValues":[D
    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v9

    .line 568
    .local v9, "minX":D
    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v11

    .line 569
    .local v11, "minY":D
    move-wide v13, v9

    .line 570
    .local v13, "maxX":D
    move-wide/from16 v16, v11

    .line 572
    .local v16, "maxY":D
    array-length v3, v15

    move/from16 v1, v18

    :goto_0
    if-ge v1, v3, :cond_0

    move/from16 v20, v1

    move-object/from16 v19, v2

    .end local v2    # "t":Lcom/itextpdf/kernel/geom/AffineTransform;
    .local v19, "t":Lcom/itextpdf/kernel/geom/AffineTransform;
    aget-wide v1, v15, v20

    .line 573
    .local v1, "x":D
    invoke-static {v9, v10, v1, v2}, Ljava/lang/Math;->min(DD)D

    move-result-wide v9

    .line 574
    invoke-static {v13, v14, v1, v2}, Ljava/lang/Math;->max(DD)D

    move-result-wide v13

    .line 572
    .end local v1    # "x":D
    add-int/lit8 v1, v20, 0x1

    move-object/from16 v2, v19

    goto :goto_0

    .line 576
    .end local v19    # "t":Lcom/itextpdf/kernel/geom/AffineTransform;
    .restart local v2    # "t":Lcom/itextpdf/kernel/geom/AffineTransform;
    :cond_0
    move-object/from16 v19, v2

    .end local v2    # "t":Lcom/itextpdf/kernel/geom/AffineTransform;
    .restart local v19    # "t":Lcom/itextpdf/kernel/geom/AffineTransform;
    array-length v1, v5

    move-wide/from16 v21, v16

    move-object/from16 v16, v4

    move-wide/from16 v3, v21

    move/from16 v2, v18

    .end local v4    # "p00":Lcom/itextpdf/kernel/geom/Point;
    .local v3, "maxY":D
    .local v16, "p00":Lcom/itextpdf/kernel/geom/Point;
    :goto_1
    if-ge v2, v1, :cond_1

    move/from16 v17, v1

    move/from16 v18, v2

    aget-wide v1, v5, v18

    .line 577
    .local v1, "y":D
    invoke-static {v11, v12, v1, v2}, Ljava/lang/Math;->min(DD)D

    move-result-wide v11

    .line 578
    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->max(DD)D

    move-result-wide v3

    .line 576
    .end local v1    # "y":D
    add-int/lit8 v2, v18, 0x1

    move/from16 v1, v17

    goto :goto_1

    .line 581
    :cond_1
    sub-double v1, v3, v11

    double-to-float v1, v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    .line 582
    sub-double v1, v13, v9

    double-to-float v1, v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    .line 583
    invoke-virtual/range {v16 .. v16}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v1

    sub-double/2addr v1, v11

    double-to-float v1, v1

    iput v1, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->pivotY:F

    .line 585
    double-to-float v1, v9

    neg-float v1, v1

    iput v1, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->deltaX:F

    .line 589
    .end local v3    # "maxY":D
    .end local v5    # "yValues":[D
    .end local v6    # "p01":Lcom/itextpdf/kernel/geom/Point;
    .end local v7    # "p10":Lcom/itextpdf/kernel/geom/Point;
    .end local v8    # "p11":Lcom/itextpdf/kernel/geom/Point;
    .end local v9    # "minX":D
    .end local v11    # "minY":D
    .end local v13    # "maxX":D
    .end local v15    # "xValues":[D
    .end local v16    # "p00":Lcom/itextpdf/kernel/geom/Point;
    .end local v19    # "t":Lcom/itextpdf/kernel/geom/AffineTransform;
    :cond_2
    const/high16 v1, 0x3f800000    # 1.0f

    .line 590
    .local v1, "scaleCoeff":F
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/4 v3, 0x3

    invoke-virtual {v0, v3}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 591
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    div-float v2, p2, v2

    iget-object v3, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    div-float v3, p3, v3

    cmpg-float v2, v2, v3

    if-gez v2, :cond_3

    .line 592
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    div-float v1, p2, v2

    .line 593
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    iget-object v3, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    div-float v3, p2, v3

    mul-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    iput-object v2, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    .line 594
    invoke-static/range {p2 .. p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    iput-object v2, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    goto :goto_2

    .line 596
    :cond_3
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    div-float v1, p3, v2

    .line 597
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    iget-object v3, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    div-float v3, p3, v3

    mul-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    iput-object v2, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    .line 598
    invoke-static/range {p3 .. p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    iput-object v2, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    goto :goto_2

    .line 600
    :cond_4
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/4 v3, 0x5

    invoke-virtual {v0, v3}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 601
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    div-float v1, p2, v2

    .line 602
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    mul-float/2addr v2, v1

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    iput-object v2, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    .line 603
    invoke-static/range {p2 .. p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    iput-object v2, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    goto :goto_2

    .line 604
    :cond_5
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/4 v3, 0x4

    invoke-virtual {v0, v3}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 605
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    div-float v1, p3, v2

    .line 606
    invoke-static/range {p3 .. p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    iput-object v2, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    .line 607
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    mul-float/2addr v2, v1

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    iput-object v2, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    .line 609
    :cond_6
    :goto_2
    iget v2, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->pivotY:F

    mul-float/2addr v2, v1

    iput v2, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->pivotY:F

    .line 610
    iget v2, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->deltaX:F

    mul-float/2addr v2, v1

    iput v2, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->deltaX:F

    .line 611
    return v1
.end method

.method private applyConcatMatrix(Lcom/itextpdf/layout/renderer/DrawContext;Ljava/lang/Float;)V
    .locals 23
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;
    .param p2, "angle"    # Ljava/lang/Float;

    .line 626
    move-object/from16 v0, p0

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Float;->floatValue()F

    move-result v1

    float-to-double v1, v1

    invoke-static {v1, v2}, Lcom/itextpdf/kernel/geom/AffineTransform;->getRotateInstance(D)Lcom/itextpdf/kernel/geom/AffineTransform;

    move-result-object v1

    .line 627
    .local v1, "rotationTransform":Lcom/itextpdf/kernel/geom/AffineTransform;
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getBorderAreaBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    .line 629
    .local v2, "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/ImageRenderer;->rectangleToPointsList(Lcom/itextpdf/kernel/geom/Rectangle;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v0, v3, v1}, Lcom/itextpdf/layout/renderer/ImageRenderer;->transformPoints(Ljava/util/List;Lcom/itextpdf/kernel/geom/AffineTransform;)Ljava/util/List;

    move-result-object v3

    .line 631
    .local v3, "rotatedPoints":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Point;>;"
    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v4

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v5

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v6

    add-float/2addr v5, v6

    invoke-virtual {v0, v4, v5, v3}, Lcom/itextpdf/layout/renderer/ImageRenderer;->calculateShiftToPositionBBoxOfPointsAt(FFLjava/util/List;)[F

    move-result-object v4

    .line 633
    .local v4, "shift":[F
    const/4 v5, 0x6

    new-array v5, v5, [D

    .line 634
    .local v5, "matrix":[D
    invoke-virtual {v1, v5}, Lcom/itextpdf/kernel/geom/AffineTransform;->getMatrix([D)V

    .line 636
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v6

    const/4 v7, 0x0

    aget-wide v8, v5, v7

    const/4 v10, 0x1

    aget-wide v11, v5, v10

    const/4 v13, 0x2

    aget-wide v13, v5, v13

    const/4 v15, 0x3

    aget-wide v15, v5, v15

    aget v7, v4, v7

    move/from16 v17, v10

    move-wide/from16 v18, v11

    float-to-double v10, v7

    aget v7, v4, v17

    move-object/from16 v20, v1

    .end local v1    # "rotationTransform":Lcom/itextpdf/kernel/geom/AffineTransform;
    .local v20, "rotationTransform":Lcom/itextpdf/kernel/geom/AffineTransform;
    float-to-double v0, v7

    move-wide/from16 v21, v15

    move-wide v15, v10

    move-wide v11, v13

    move-wide/from16 v13, v21

    move-wide v7, v8

    move-wide/from16 v9, v18

    move-wide/from16 v17, v0

    invoke-virtual/range {v6 .. v18}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->concatMatrix(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 637
    return-void
.end method

.method private applyObjectFit(Lcom/itextpdf/layout/properties/ObjectFit;FF)V
    .locals 9
    .param p1, "objectFit"    # Lcom/itextpdf/layout/properties/ObjectFit;
    .param p2, "imageWidth"    # F
    .param p3, "imageHeight"    # F

    .line 458
    float-to-double v1, p2

    float-to-double v3, p3

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    .line 459
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    float-to-double v5, v0

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    float-to-double v7, v0

    .line 458
    move-object v0, p1

    .end local p1    # "objectFit":Lcom/itextpdf/layout/properties/ObjectFit;
    .local v0, "objectFit":Lcom/itextpdf/layout/properties/ObjectFit;
    invoke-static/range {v0 .. v8}, Lcom/itextpdf/layout/renderer/objectfit/ObjectFitCalculator;->calculateRenderedImageSize(Lcom/itextpdf/layout/properties/ObjectFit;DDDD)Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;

    move-result-object p1

    .line 460
    .local p1, "result":Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;->getRenderedImageWidth()D

    move-result-wide v1

    double-to-float v1, v1

    iput v1, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->renderedImageWidth:F

    .line 461
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;->getRenderedImageHeight()D

    move-result-wide v1

    double-to-float v1, v1

    iput v1, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->renderedImageHeight:F

    .line 462
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/objectfit/ObjectFitApplyingResult;->isImageCuttingRequired()Z

    move-result v1

    iput-boolean v1, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->doesObjectFitRequireCutting:Z

    .line 463
    return-void
.end method

.method private applyRotationLayout(F)V
    .locals 14
    .param p1, "angle"    # F

    .line 640
    move v0, p1

    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getBorders()[Lcom/itextpdf/layout/borders/Border;

    move-result-object v1

    .line 641
    .local v1, "borders":[Lcom/itextpdf/layout/borders/Border;
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getBorderAreaBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    .line 643
    .local v2, "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    const/4 v3, 0x3

    aget-object v4, v1, v3

    const/4 v5, 0x0

    if-nez v4, :cond_0

    move v3, v5

    goto :goto_0

    :cond_0
    aget-object v3, v1, v3

    invoke-virtual {v3}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v3

    .line 644
    .local v3, "leftBorderWidth":F
    :goto_0
    const/4 v4, 0x1

    aget-object v6, v1, v4

    if-nez v6, :cond_1

    move v4, v5

    goto :goto_1

    :cond_1
    aget-object v4, v1, v4

    invoke-virtual {v4}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v4

    .line 645
    .local v4, "rightBorderWidth":F
    :goto_1
    const/4 v6, 0x0

    aget-object v7, v1, v6

    if-nez v7, :cond_2

    move v6, v5

    goto :goto_2

    :cond_2
    aget-object v6, v1, v6

    invoke-virtual {v6}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v6

    .line 646
    .local v6, "topBorderWidth":F
    :goto_2
    cmpl-float v7, v3, v5

    const-wide/high16 v8, 0x4000000000000000L    # 2.0

    if-eqz v7, :cond_4

    .line 647
    float-to-double v10, v6

    invoke-static {v10, v11, v8, v9}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v10

    float-to-double v12, v3

    invoke-static {v12, v13, v8, v9}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v12

    add-double/2addr v10, v12

    invoke-static {v10, v11}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v10

    double-to-float v7, v10

    .line 648
    .local v7, "gip":F
    div-float v10, v6, v3

    float-to-double v10, v10

    invoke-static {v10, v11}, Ljava/lang/Math;->atan(D)D

    move-result-wide v10

    .line 649
    .local v10, "atan":D
    cmpg-float v12, v0, v5

    if-gez v12, :cond_3

    .line 650
    neg-double v10, v10

    .line 652
    :cond_3
    float-to-double v12, v7

    float-to-double v8, v0

    sub-double/2addr v8, v10

    invoke-static {v8, v9}, Ljava/lang/Math;->cos(D)D

    move-result-wide v8

    mul-double/2addr v12, v8

    float-to-double v8, v3

    sub-double/2addr v12, v8

    double-to-float v8, v12

    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    move-result v8

    iput v8, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->rotatedDeltaX:F

    .line 653
    .end local v7    # "gip":F
    .end local v10    # "atan":D
    goto :goto_3

    .line 654
    :cond_4
    iput v5, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->rotatedDeltaX:F

    .line 657
    :goto_3
    iget v7, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->rotatedDeltaX:F

    invoke-virtual {v2, v7}, Lcom/itextpdf/kernel/geom/Rectangle;->moveRight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 658
    iget-object v7, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v7}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v7

    iget-object v8, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v8}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v8

    iget v9, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->rotatedDeltaX:F

    add-float/2addr v8, v9

    invoke-virtual {v7, v8}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 660
    cmpl-float v7, v4, v5

    if-eqz v7, :cond_6

    .line 661
    float-to-double v7, v6

    const-wide/high16 v9, 0x4000000000000000L    # 2.0

    invoke-static {v7, v8, v9, v10}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v7

    float-to-double v11, v3

    invoke-static {v11, v12, v9, v10}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v9

    add-double/2addr v7, v9

    invoke-static {v7, v8}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v7

    double-to-float v7, v7

    .line 662
    .restart local v7    # "gip":F
    div-float v8, v4, v6

    float-to-double v8, v8

    invoke-static {v8, v9}, Ljava/lang/Math;->atan(D)D

    move-result-wide v8

    .line 663
    .local v8, "atan":D
    cmpg-float v10, v0, v5

    if-gez v10, :cond_5

    .line 664
    neg-double v8, v8

    .line 666
    :cond_5
    float-to-double v10, v7

    float-to-double v12, v0

    sub-double/2addr v12, v8

    invoke-static {v12, v13}, Ljava/lang/Math;->cos(D)D

    move-result-wide v12

    mul-double/2addr v10, v12

    float-to-double v12, v6

    sub-double/2addr v10, v12

    double-to-float v10, v10

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v10

    iput v10, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->rotatedDeltaY:F

    .line 667
    .end local v7    # "gip":F
    .end local v8    # "atan":D
    goto :goto_4

    .line 668
    :cond_6
    iput v5, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->rotatedDeltaY:F

    .line 671
    :goto_4
    iget v7, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->rotatedDeltaY:F

    invoke-virtual {v2, v7}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 672
    cmpg-float v5, v0, v5

    if-gez v5, :cond_7

    .line 673
    iget v5, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->rotatedDeltaY:F

    add-float/2addr v5, v4

    iput v5, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->rotatedDeltaY:F

    .line 675
    :cond_7
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    iget v7, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->rotatedDeltaY:F

    invoke-virtual {v5, v7}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 676
    return-void
.end method

.method private beginObjectFitImageClipping(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V
    .locals 5
    .param p1, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 466
    iget-boolean v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->doesObjectFitRequireCutting:Z

    if-eqz v0, :cond_0

    .line 467
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 468
    new-instance v0, Lcom/itextpdf/kernel/geom/Rectangle;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->fixedXPosition:Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->fixedYPosition:Ljava/lang/Float;

    .line 469
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    iget-object v3, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    iget-object v4, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    .line 470
    .local v0, "clippedArea":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->rectangle(Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->clip()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->endPath()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 472
    .end local v0    # "clippedArea":Lcom/itextpdf/kernel/geom/Rectangle;
    :cond_0
    return-void
.end method

.method private calculateImageDimensions(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/AffineTransform;Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;)V
    .locals 10
    .param p1, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "t"    # Lcom/itextpdf/kernel/geom/AffineTransform;
    .param p3, "xObject"    # Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    .line 481
    const/16 v0, 0x4d

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/ImageRenderer;->retrieveWidth(F)Ljava/lang/Float;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    .line 482
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/ImageRenderer;->retrieveHeight()Ljava/lang/Float;

    move-result-object v0

    .line 483
    .local v0, "declaredHeight":Ljava/lang/Float;
    iput-object v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    .line 484
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    if-nez v1, :cond_1

    .line 485
    iget v1, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->imageWidth:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    .line 486
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    iget v2, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->imageWidth:F

    div-float/2addr v1, v2

    iget v2, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->imageHeight:F

    mul-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    goto :goto_1

    .line 487
    :cond_1
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    .line 489
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    .line 487
    if-nez v1, :cond_2

    .line 488
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v1

    iget v2, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->imageHeight:F

    div-float/2addr v1, v2

    iget v2, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->imageWidth:F

    mul-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    goto :goto_1

    .line 489
    :cond_2
    if-nez v2, :cond_3

    .line 490
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    iget v2, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->imageWidth:F

    div-float/2addr v1, v2

    iget v2, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->imageHeight:F

    mul-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    .line 493
    :cond_3
    :goto_1
    const/16 v1, 0x1d

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {p0, v1, v3}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getPropertyAsFloat(ILjava/lang/Float;)Ljava/lang/Float;

    move-result-object v1

    .line 494
    .local v1, "horizontalScaling":Ljava/lang/Float;
    const/16 v3, 0x4c

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getPropertyAsFloat(ILjava/lang/Float;)Ljava/lang/Float;

    move-result-object v3

    .line 497
    .local v3, "verticalScaling":Ljava/lang/Float;
    instance-of v4, p3, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    if-eqz v4, :cond_4

    iget-object v4, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    iget v5, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->imageWidth:F

    cmpl-float v4, v4, v5

    if-eqz v4, :cond_4

    .line 498
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v4

    iget-object v5, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    iget v6, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->imageWidth:F

    div-float/2addr v5, v6

    mul-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    .line 499
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v4

    iget-object v5, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    iget v6, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->imageHeight:F

    div-float/2addr v5, v6

    mul-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    .line 502
    :cond_4
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v4

    cmpl-float v4, v4, v2

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    if-eqz v4, :cond_6

    .line 503
    instance-of v4, p3, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    if-eqz v4, :cond_5

    .line 504
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v4

    float-to-double v7, v4

    invoke-virtual {p2, v7, v8, v5, v6}, Lcom/itextpdf/kernel/geom/AffineTransform;->scale(DD)V

    .line 505
    iget v4, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->imageWidth:F

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v7

    mul-float/2addr v4, v7

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    iput-object v4, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    goto :goto_2

    .line 507
    :cond_5
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v7

    mul-float/2addr v4, v7

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    iput-object v4, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    .line 510
    :cond_6
    :goto_2
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v4

    cmpl-float v2, v4, v2

    if-eqz v2, :cond_8

    .line 511
    instance-of v2, p3, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    if-eqz v2, :cond_7

    .line 512
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v2

    float-to-double v7, v2

    invoke-virtual {p2, v5, v6, v7, v8}, Lcom/itextpdf/kernel/geom/AffineTransform;->scale(DD)V

    .line 513
    iget v2, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->imageHeight:F

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v4

    mul-float/2addr v2, v4

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    iput-object v2, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    goto :goto_3

    .line 515
    :cond_7
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v4

    mul-float/2addr v2, v4

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    iput-object v2, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    .line 520
    :cond_8
    :goto_3
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/ImageRenderer;->retrieveMinWidth(F)Ljava/lang/Float;

    move-result-object v2

    .line 521
    .local v2, "minWidth":Ljava/lang/Float;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v4

    invoke-virtual {p0, v4}, Lcom/itextpdf/layout/renderer/ImageRenderer;->retrieveMaxWidth(F)Ljava/lang/Float;

    move-result-object v4

    .line 522
    .local v4, "maxWidth":Ljava/lang/Float;
    if-eqz v2, :cond_9

    iget-object v5, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v6

    cmpg-float v5, v5, v6

    if-gez v5, :cond_9

    .line 523
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v6

    iget-object v7, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    div-float/2addr v6, v7

    mul-float/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    iput-object v5, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    .line 524
    iput-object v2, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    goto :goto_4

    .line 525
    :cond_9
    if-eqz v4, :cond_a

    iget-object v5, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v6

    cmpl-float v5, v5, v6

    if-lez v5, :cond_a

    .line 526
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v6

    iget-object v7, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    div-float/2addr v6, v7

    mul-float/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    iput-object v5, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    .line 527
    iput-object v4, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    .line 531
    :cond_a
    :goto_4
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/ImageRenderer;->retrieveMinHeight()Ljava/lang/Float;

    move-result-object v5

    .line 532
    .local v5, "minHeight":Ljava/lang/Float;
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/ImageRenderer;->retrieveMaxHeight()Ljava/lang/Float;

    move-result-object v6

    .line 533
    .local v6, "maxHeight":Ljava/lang/Float;
    if-eqz v5, :cond_b

    iget-object v7, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v8

    cmpg-float v7, v7, v8

    if-gez v7, :cond_b

    .line 534
    iget-object v7, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v8

    iget-object v9, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v9

    div-float/2addr v8, v9

    mul-float/2addr v7, v8

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    iput-object v7, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    .line 535
    iput-object v5, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    goto :goto_5

    .line 536
    :cond_b
    if-eqz v6, :cond_c

    iget-object v7, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v8

    cmpl-float v7, v7, v8

    if-lez v7, :cond_c

    .line 537
    iget-object v7, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v8

    iget-object v9, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v9

    div-float/2addr v8, v9

    mul-float/2addr v7, v8

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    iput-object v7, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    .line 538
    iput-object v6, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    goto :goto_5

    .line 539
    :cond_c
    if-eqz v0, :cond_d

    iget-object v7, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    invoke-virtual {v7, v0}, Ljava/lang/Float;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_d

    .line 540
    iget-object v7, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v8

    iget-object v9, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v9

    div-float/2addr v8, v9

    mul-float/2addr v7, v8

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    iput-object v7, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    .line 541
    iput-object v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    .line 543
    :cond_d
    :goto_5
    return-void
.end method

.method private endObjectFitImageClipping(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V
    .locals 1
    .param p1, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 475
    iget-boolean v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->doesObjectFitRequireCutting:Z

    if-eqz v0, :cond_0

    .line 476
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 478
    :cond_0
    return-void
.end method

.method private getMatrix(Lcom/itextpdf/kernel/geom/AffineTransform;FF)V
    .locals 4
    .param p1, "t"    # Lcom/itextpdf/kernel/geom/AffineTransform;
    .param p2, "imageItselfScaledWidth"    # F
    .param p3, "imageItselfScaledHeight"    # F

    .line 546
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->matrix:[F

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/geom/AffineTransform;->getMatrix([F)V

    .line 547
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/element/Image;

    move-object v1, v0

    check-cast v1, Lcom/itextpdf/layout/element/Image;

    invoke-virtual {v0}, Lcom/itextpdf/layout/element/Image;->getXObject()Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    move-result-object v0

    .line 548
    .local v0, "xObject":Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
    instance-of v1, v0, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    if-eqz v1, :cond_0

    .line 549
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->matrix:[F

    const/4 v2, 0x0

    aget v3, v1, v2

    mul-float/2addr v3, p2

    aput v3, v1, v2

    .line 550
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->matrix:[F

    const/4 v2, 0x1

    aget v3, v1, v2

    mul-float/2addr v3, p2

    aput v3, v1, v2

    .line 551
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->matrix:[F

    const/4 v2, 0x2

    aget v3, v1, v2

    mul-float/2addr v3, p3

    aput v3, v1, v2

    .line 552
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->matrix:[F

    const/4 v2, 0x3

    aget v3, v1, v2

    mul-float/2addr v3, p3

    aput v3, v1, v2

    .line 554
    :cond_0
    return-void
.end method

.method private translateImage(FFLcom/itextpdf/kernel/geom/AffineTransform;)V
    .locals 4
    .param p1, "xDistance"    # F
    .param p2, "yDistance"    # F
    .param p3, "t"    # Lcom/itextpdf/kernel/geom/AffineTransform;

    .line 615
    float-to-double v0, p1

    float-to-double v2, p2

    invoke-virtual {p3, v0, v1, v2, v3}, Lcom/itextpdf/kernel/geom/AffineTransform;->translate(DD)V

    .line 616
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->matrix:[F

    invoke-virtual {p3, v0}, Lcom/itextpdf/kernel/geom/AffineTransform;->getMatrix([F)V

    .line 617
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->fixedXPosition:Ljava/lang/Float;

    if-eqz v0, :cond_0

    .line 618
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->fixedXPosition:Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual {p3}, Lcom/itextpdf/kernel/geom/AffineTransform;->getTranslateX()D

    move-result-wide v1

    double-to-float v1, v1

    add-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->fixedXPosition:Ljava/lang/Float;

    .line 620
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->fixedYPosition:Ljava/lang/Float;

    if-eqz v0, :cond_1

    .line 621
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->fixedYPosition:Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual {p3}, Lcom/itextpdf/kernel/geom/AffineTransform;->getTranslateY()D

    move-result-wide v1

    double-to-float v1, v1

    add-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->fixedYPosition:Ljava/lang/Float;

    .line 623
    :cond_1
    return-void
.end method


# virtual methods
.method protected applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/properties/UnitValue;Z)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 0
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "paddings"    # [Lcom/itextpdf/layout/properties/UnitValue;
    .param p3, "reverse"    # Z

    .line 420
    return-object p1
.end method

.method protected autoScale(Lcom/itextpdf/layout/layout/LayoutArea;)Lcom/itextpdf/layout/renderer/ImageRenderer;
    .locals 4
    .param p1, "layoutArea"    # Lcom/itextpdf/layout/layout/LayoutArea;

    .line 444
    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    .line 445
    .local v0, "area":Lcom/itextpdf/kernel/geom/Rectangle;
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/ImageRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 446
    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/ImageRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 448
    iget v1, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->imageWidth:F

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    div-float/2addr v1, v2

    .line 449
    .local v1, "angleScaleCoef":F
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v3

    mul-float/2addr v3, v1

    cmpl-float v2, v2, v3

    if-lez v2, :cond_0

    .line 450
    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    iget-object v3, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    div-float/2addr v2, v3

    iget v3, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->imageHeight:F

    mul-float/2addr v2, v3

    invoke-static {v2}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/ImageRenderer;->updateHeight(Lcom/itextpdf/layout/properties/UnitValue;)V

    .line 451
    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    mul-float/2addr v2, v1

    invoke-static {v2}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/ImageRenderer;->updateWidth(Lcom/itextpdf/layout/properties/UnitValue;)V

    .line 454
    :cond_0
    return-object p0
.end method

.method public draw(Lcom/itextpdf/layout/renderer/DrawContext;)V
    .locals 20
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;

    .line 260
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    if-nez v2, :cond_0

    .line 261
    const-class v2, Lcom/itextpdf/layout/renderer/ImageRenderer;

    invoke-static {v2}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v2

    .line 262
    .local v2, "logger":Lorg/slf4j/Logger;
    const-string v3, "Drawing won\'t be performed."

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const-string v4, "Occupied area has not been initialized. {0}"

    invoke-static {v4, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 264
    return-void

    .line 267
    .end local v2    # "logger":Lorg/slf4j/Logger;
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/ImageRenderer;->isRelativePosition()Z

    move-result v2

    .line 268
    .local v2, "isRelativePosition":Z
    const/4 v3, 0x0

    if-eqz v2, :cond_1

    .line 269
    invoke-virtual {v0, v3}, Lcom/itextpdf/layout/renderer/ImageRenderer;->applyRelativePositioningTranslation(Z)V

    .line 272
    :cond_1
    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/DrawContext;->isTaggingEnabled()Z

    move-result v4

    .line 273
    .local v4, "isTagged":Z
    const/4 v5, 0x0

    .line 274
    .local v5, "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    const/4 v6, 0x0

    .line 275
    .local v6, "isArtifact":Z
    const/4 v7, 0x0

    .line 276
    .local v7, "tagPointer":Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    if-eqz v4, :cond_3

    .line 277
    const/16 v8, 0x6c

    invoke-virtual {v0, v8}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v8

    move-object v5, v8

    check-cast v5, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;

    .line 278
    if-nez v5, :cond_2

    .line 279
    const/4 v6, 0x1

    goto :goto_0

    .line 281
    :cond_2
    invoke-virtual {v5, v0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->isArtifact(Lcom/itextpdf/layout/IPropertyContainer;)Z

    move-result v6

    .line 282
    if-nez v6, :cond_3

    .line 283
    invoke-virtual {v5, v0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->useAutoTaggingPointerAndRememberItsPosition(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    move-result-object v7

    .line 284
    invoke-virtual {v5, v0, v7}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->createTag(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 285
    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    move-result-object v8

    invoke-static {v0, v7}, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier;->getLayoutAttributes(Lcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;

    move-result-object v9

    invoke-virtual {v8, v3, v9}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->addAttributes(ILcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    .line 291
    :cond_3
    :goto_0
    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v8

    invoke-virtual {v0, v8}, Lcom/itextpdf/layout/renderer/ImageRenderer;->beginTransformationIfApplied(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 293
    const/16 v8, 0x37

    invoke-virtual {v0, v8}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v8

    .line 294
    .local v8, "angle":Ljava/lang/Float;
    if-eqz v8, :cond_4

    .line 295
    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 296
    invoke-direct {v0, v1, v8}, Lcom/itextpdf/layout/renderer/ImageRenderer;->applyConcatMatrix(Lcom/itextpdf/layout/renderer/DrawContext;Ljava/lang/Float;)V

    .line 299
    :cond_4
    invoke-super/range {p0 .. p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->draw(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 301
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getOccupiedAreaBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v9

    invoke-virtual {v0, v9, v3}, Lcom/itextpdf/layout/renderer/ImageRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v0, v1, v9, v10}, Lcom/itextpdf/layout/renderer/ImageRenderer;->clipBackgroundArea(Lcom/itextpdf/layout/renderer/DrawContext;Lcom/itextpdf/kernel/geom/Rectangle;Z)Z

    move-result v9

    .line 302
    .local v9, "clipImageInAViewOfBorderRadius":Z
    iget-object v11, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v11}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v11

    invoke-virtual {v0, v11, v3}, Lcom/itextpdf/layout/renderer/ImageRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 303
    iget-object v11, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v11}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v11

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getBorders()[Lcom/itextpdf/layout/borders/Border;

    move-result-object v12

    invoke-virtual {v0, v11, v12, v3}, Lcom/itextpdf/layout/renderer/ImageRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/borders/Border;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 305
    iget-object v11, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->fixedYPosition:Ljava/lang/Float;

    if-nez v11, :cond_5

    .line 306
    iget-object v11, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v11}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v11

    invoke-virtual {v11}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v11

    iget v12, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->pivotY:F

    add-float/2addr v11, v12

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    iput-object v11, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->fixedYPosition:Ljava/lang/Float;

    .line 308
    :cond_5
    iget-object v11, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->fixedXPosition:Ljava/lang/Float;

    if-nez v11, :cond_6

    .line 309
    iget-object v11, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v11}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v11

    invoke-virtual {v11}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v11

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    iput-object v11, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->fixedXPosition:Ljava/lang/Float;

    .line 312
    :cond_6
    if-eqz v8, :cond_7

    .line 313
    iget-object v11, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->fixedXPosition:Ljava/lang/Float;

    invoke-virtual {v11}, Ljava/lang/Float;->floatValue()F

    move-result v11

    iget v12, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->rotatedDeltaX:F

    add-float/2addr v11, v12

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    iput-object v11, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->fixedXPosition:Ljava/lang/Float;

    .line 314
    iget-object v11, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->fixedYPosition:Ljava/lang/Float;

    invoke-virtual {v11}, Ljava/lang/Float;->floatValue()F

    move-result v11

    iget v12, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->rotatedDeltaY:F

    sub-float/2addr v11, v12

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    iput-object v11, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->fixedYPosition:Ljava/lang/Float;

    .line 315
    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v11

    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 317
    :cond_7
    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v12

    .line 318
    .local v12, "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    if-eqz v4, :cond_9

    .line 319
    if-eqz v6, :cond_8

    .line 320
    new-instance v11, Lcom/itextpdf/kernel/pdf/canvas/CanvasArtifact;

    invoke-direct {v11}, Lcom/itextpdf/kernel/pdf/canvas/CanvasArtifact;-><init>()V

    invoke-virtual {v12, v11}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->openTag(Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    goto :goto_1

    .line 322
    :cond_8
    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getTagReference()Lcom/itextpdf/kernel/pdf/tagutils/TagReference;

    move-result-object v11

    invoke-virtual {v12, v11}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->openTag(Lcom/itextpdf/kernel/pdf/tagutils/TagReference;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 327
    :cond_9
    :goto_1
    invoke-direct {v0, v12}, Lcom/itextpdf/layout/renderer/ImageRenderer;->beginObjectFitImageClipping(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 329
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v11

    check-cast v11, Lcom/itextpdf/layout/element/Image;

    move-object v13, v11

    check-cast v13, Lcom/itextpdf/layout/element/Image;

    invoke-virtual {v11}, Lcom/itextpdf/layout/element/Image;->getXObject()Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    move-result-object v13

    .line 330
    .local v13, "xObject":Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
    invoke-virtual/range {p0 .. p1}, Lcom/itextpdf/layout/renderer/ImageRenderer;->beginElementOpacityApplying(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 332
    iget-object v11, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    invoke-virtual {v11}, Ljava/lang/Float;->floatValue()F

    move-result v11

    iget v14, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->renderedImageWidth:F

    sub-float/2addr v11, v14

    const/high16 v14, 0x40000000    # 2.0f

    div-float/2addr v11, v14

    .line 333
    .local v11, "renderedImageShiftX":F
    iget-object v15, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    invoke-virtual {v15}, Ljava/lang/Float;->floatValue()F

    move-result v15

    move/from16 v16, v3

    iget v3, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->renderedImageHeight:F

    sub-float/2addr v15, v3

    div-float v3, v15, v14

    .line 334
    .local v3, "renderedImageShiftY":F
    iget-object v14, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->matrix:[F

    aget v14, v14, v16

    iget-object v15, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->matrix:[F

    aget v15, v15, v10

    iget-object v10, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->matrix:[F

    const/16 v16, 0x2

    aget v16, v10, v16

    iget-object v10, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->matrix:[F

    const/16 v17, 0x3

    aget v17, v10, v17

    iget-object v10, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->fixedXPosition:Ljava/lang/Float;

    invoke-virtual {v10}, Ljava/lang/Float;->floatValue()F

    move-result v10

    iget v1, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->deltaX:F

    add-float/2addr v10, v1

    add-float v18, v10, v11

    iget-object v1, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->fixedYPosition:Ljava/lang/Float;

    .line 335
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    add-float v19, v1, v3

    .line 334
    invoke-virtual/range {v12 .. v19}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->addXObjectWithTransformationMatrix(Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;FFFFFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 337
    invoke-virtual/range {p0 .. p1}, Lcom/itextpdf/layout/renderer/ImageRenderer;->endElementOpacityApplying(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 338
    invoke-direct {v0, v12}, Lcom/itextpdf/layout/renderer/ImageRenderer;->endObjectFitImageClipping(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 339
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/ImageRenderer;->endTransformationIfApplied(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 341
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v10, 0x13

    invoke-virtual {v0, v10}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v10

    invoke-virtual {v1, v10}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 342
    invoke-virtual {v13}, Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;->flush()V

    .line 345
    :cond_a
    if-eqz v4, :cond_b

    .line 346
    invoke-virtual {v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->closeTag()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 349
    :cond_b
    if-eqz v9, :cond_c

    .line 350
    invoke-virtual {v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 353
    :cond_c
    if-eqz v2, :cond_d

    .line 354
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/ImageRenderer;->applyRelativePositioningTranslation(Z)V

    goto :goto_2

    .line 353
    :cond_d
    const/4 v1, 0x1

    .line 356
    :goto_2
    iget-object v10, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v10}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v10

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getBorders()[Lcom/itextpdf/layout/borders/Border;

    move-result-object v14

    invoke-virtual {v0, v10, v14, v1}, Lcom/itextpdf/layout/renderer/ImageRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/borders/Border;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 357
    iget-object v10, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v10}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v10

    invoke-virtual {v0, v10, v1}, Lcom/itextpdf/layout/renderer/ImageRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 359
    if-eqz v4, :cond_e

    if-nez v6, :cond_e

    .line 360
    invoke-virtual {v5, v0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->finishTaggingHint(Lcom/itextpdf/layout/IPropertyContainer;)V

    .line 361
    invoke-virtual {v5, v0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->restoreAutoTaggingPointerPosition(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 363
    :cond_e
    return-void
.end method

.method public getAscent()F
    .locals 1

    .line 680
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v0

    return v0
.end method

.method getAspectRatio()Ljava/lang/Float;
    .locals 2

    .line 397
    iget v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->imageWidth:F

    iget v1, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->imageHeight:F

    div-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method public getBorderAreaBBox()Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 3

    .line 372
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->initialOccupiedAreaBBox:Lcom/itextpdf/kernel/geom/Rectangle;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/ImageRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 373
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->initialOccupiedAreaBBox:Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getBorders()[Lcom/itextpdf/layout/borders/Border;

    move-result-object v2

    invoke-virtual {p0, v0, v2, v1}, Lcom/itextpdf/layout/renderer/ImageRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/borders/Border;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 375
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/ImageRenderer;->isRelativePosition()Z

    move-result v0

    .line 376
    .local v0, "isRelativePosition":Z
    if-eqz v0, :cond_0

    .line 377
    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/ImageRenderer;->applyRelativePositioningTranslation(Z)V

    .line 379
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->initialOccupiedAreaBBox:Lcom/itextpdf/kernel/geom/Rectangle;

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Lcom/itextpdf/layout/renderer/ImageRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 380
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->initialOccupiedAreaBBox:Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {p0, v1, v2}, Lcom/itextpdf/layout/renderer/ImageRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 381
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->initialOccupiedAreaBBox:Lcom/itextpdf/kernel/geom/Rectangle;

    return-object v1
.end method

.method public getDescent()F
    .locals 1

    .line 685
    const/4 v0, 0x0

    return v0
.end method

.method public getImageHeight()F
    .locals 1

    .line 415
    iget v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->imageHeight:F

    return v0
.end method

.method public getImageWidth()F
    .locals 1

    .line 406
    iget v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->imageWidth:F

    return v0
.end method

.method public getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .locals 5

    .line 440
    new-instance v0, Lcom/itextpdf/layout/layout/LayoutContext;

    new-instance v1, Lcom/itextpdf/layout/layout/LayoutArea;

    new-instance v2, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-static {}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidthUtils;->getInfWidth()F

    move-result v3

    const v4, 0x49742400    # 1000000.0f

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FF)V

    const/4 v3, 0x1

    invoke-direct {v1, v3, v2}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/ImageRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;->getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v0

    return-object v0
.end method

.method public getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 1

    .line 367
    const/4 v0, 0x0

    return-object v0
.end method

.method hasAspectRatio()Z
    .locals 1

    .line 389
    const/4 v0, 0x1

    return v0
.end method

.method public layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;
    .locals 38
    .param p1, "layoutContext"    # Lcom/itextpdf/layout/layout/LayoutContext;

    .line 88
    move-object/from16 v0, p0

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->clone()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v6

    .line 89
    .local v6, "area":Lcom/itextpdf/layout/layout/LayoutArea;
    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    .line 91
    .local v1, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    new-instance v2, Lcom/itextpdf/kernel/geom/AffineTransform;

    invoke-direct {v2}, Lcom/itextpdf/kernel/geom/AffineTransform;-><init>()V

    move-object v7, v2

    .line 92
    .local v7, "t":Lcom/itextpdf/kernel/geom/AffineTransform;
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/element/Image;

    move-object v8, v2

    check-cast v8, Lcom/itextpdf/layout/element/Image;

    .line 93
    .local v8, "modelElement":Lcom/itextpdf/layout/element/Image;
    invoke-virtual {v8}, Lcom/itextpdf/layout/element/Image;->getXObject()Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    move-result-object v9

    .line 95
    .local v9, "xObject":Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
    invoke-direct {v0, v1, v7, v9}, Lcom/itextpdf/layout/renderer/ImageRenderer;->calculateImageDimensions(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/AffineTransform;Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;)V

    .line 97
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    if-eqz v2, :cond_0

    iget-object v2, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 98
    const/16 v3, 0x67

    invoke-interface {v2, v3}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    goto :goto_0

    :cond_0
    sget-object v2, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->FIT:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    :goto_0
    move-object v5, v2

    .line 101
    .local v5, "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    const/4 v2, 0x0

    .line 102
    .local v2, "nowrap":Z
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    instance-of v3, v3, Lcom/itextpdf/layout/renderer/LineRenderer;

    if-eqz v3, :cond_1

    .line 103
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object v4, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    const/16 v10, 0x76

    invoke-interface {v4, v10}, Lcom/itextpdf/layout/renderer/IRenderer;->getOwnProperty(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    move v10, v2

    goto :goto_1

    .line 102
    :cond_1
    move v10, v2

    .line 106
    .end local v2    # "nowrap":Z
    .local v10, "nowrap":Z
    :goto_1
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getFloatRendererAreas()Ljava/util/List;

    move-result-object v3

    .line 107
    .local v3, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    invoke-static {v0, v3, v1}, Lcom/itextpdf/layout/renderer/FloatingHelper;->calculateClearHeightCorrection(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;)F

    move-result v11

    .line 108
    .local v11, "clearHeightCorrection":F
    const/16 v2, 0x63

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    move-object v4, v2

    check-cast v4, Lcom/itextpdf/layout/properties/FloatPropertyValue;

    .line 109
    .local v4, "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    invoke-static {v0, v4}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/properties/FloatPropertyValue;)Z

    move-result v2

    const/4 v12, 0x0

    if-eqz v2, :cond_2

    .line 110
    invoke-virtual {v1, v11}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 111
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    invoke-static/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/FloatingHelper;->adjustFloatedBlockLayoutBox(Lcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/kernel/geom/Rectangle;Ljava/lang/Float;Ljava/util/List;Lcom/itextpdf/layout/properties/FloatPropertyValue;Lcom/itextpdf/layout/properties/OverflowPropertyValue;)Ljava/lang/Float;

    move-object v13, v1

    move-object v15, v3

    move-object/from16 v16, v4

    move-object v14, v5

    .end local v1    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v3    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .end local v4    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .end local v5    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v13, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v14, "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v15, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v16, "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    goto :goto_2

    .line 113
    .end local v13    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v14    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .end local v15    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .end local v16    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .restart local v1    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local v3    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .restart local v4    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .restart local v5    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    :cond_2
    move-object v13, v1

    move-object v15, v3

    move-object/from16 v16, v4

    move-object v14, v5

    .end local v1    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v3    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .end local v4    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .end local v5    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .restart local v13    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local v14    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .restart local v15    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .restart local v16    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    invoke-static {v15, v13, v1, v11, v12}, Lcom/itextpdf/layout/renderer/FloatingHelper;->adjustLayoutBoxAccordingToFloats(Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;Ljava/lang/Float;FLcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;)F

    move-result v11

    .line 116
    :goto_2
    const/4 v1, 0x0

    invoke-virtual {v0, v13, v1}, Lcom/itextpdf/layout/renderer/ImageRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 117
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getBorders()[Lcom/itextpdf/layout/borders/Border;

    move-result-object v2

    .line 118
    .local v2, "borders":[Lcom/itextpdf/layout/borders/Border;
    invoke-virtual {v0, v13, v2, v1}, Lcom/itextpdf/layout/renderer/ImageRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/borders/Border;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 120
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/ImageRenderer;->retrieveMaxHeight()Ljava/lang/Float;

    move-result-object v17

    .line 121
    .local v17, "declaredMaxHeight":Ljava/lang/Float;
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    if-eqz v3, :cond_5

    if-eqz v17, :cond_3

    .line 122
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-virtual {v13}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v4

    cmpl-float v3, v3, v4

    if-lez v3, :cond_4

    .line 123
    :cond_3
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->isClippedHeight()Z

    move-result v3

    if-nez v3, :cond_4

    goto :goto_3

    :cond_4
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 125
    const/16 v4, 0x68

    invoke-interface {v3, v4}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    goto :goto_4

    .line 123
    :cond_5
    :goto_3
    sget-object v3, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->FIT:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    .line 125
    :goto_4
    move-object/from16 v18, v3

    .line 126
    .local v18, "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    invoke-static {v14}, Lcom/itextpdf/layout/renderer/ImageRenderer;->isOverflowFit(Lcom/itextpdf/layout/properties/OverflowPropertyValue;)Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_7

    if-eqz v10, :cond_6

    goto :goto_5

    :cond_6
    move v3, v1

    goto :goto_6

    :cond_7
    :goto_5
    move v3, v4

    :goto_6
    move/from16 v19, v3

    .line 127
    .local v19, "processOverflowX":Z
    invoke-static/range {v18 .. v18}, Lcom/itextpdf/layout/renderer/ImageRenderer;->isOverflowFit(Lcom/itextpdf/layout/properties/OverflowPropertyValue;)Z

    move-result v3

    xor-int/2addr v3, v4

    move/from16 v20, v3

    .line 128
    .local v20, "processOverflowY":Z
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/ImageRenderer;->isAbsolutePosition()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 129
    invoke-virtual {v0, v13}, Lcom/itextpdf/layout/renderer/ImageRenderer;->applyAbsolutePosition(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 131
    :cond_8
    new-instance v3, Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v5

    new-instance v12, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v13}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v1

    invoke-virtual {v13}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v22

    invoke-virtual {v13}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v23

    add-float v4, v22, v23

    move-object/from16 v22, v2

    .end local v2    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .local v22, "borders":[Lcom/itextpdf/layout/borders/Border;
    const/4 v2, 0x0

    invoke-direct {v12, v1, v4, v2, v2}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    invoke-direct {v3, v5, v12}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    iput-object v3, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 133
    invoke-static {v0}, Lcom/itextpdf/layout/renderer/TargetCounterHandler;->addPageByID(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 135
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    .line 136
    .local v1, "imageContainerWidth":F
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    .line 138
    .local v3, "imageContainerHeight":F
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/ImageRenderer;->isFixedLayout()Z

    move-result v4

    if-eqz v4, :cond_9

    .line 139
    const/16 v4, 0x22

    invoke-virtual {v0, v4}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v4

    iput-object v4, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->fixedXPosition:Ljava/lang/Float;

    .line 140
    const/16 v4, 0xe

    invoke-virtual {v0, v4}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v4

    iput-object v4, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->fixedYPosition:Ljava/lang/Float;

    .line 143
    :cond_9
    const/16 v4, 0x37

    invoke-virtual {v0, v4}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v4

    .line 145
    .local v4, "angle":Ljava/lang/Float;
    if-nez v4, :cond_a

    .line 146
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    move-object v12, v4

    goto :goto_7

    .line 145
    :cond_a
    move-object v12, v4

    .line 148
    .end local v4    # "angle":Ljava/lang/Float;
    .local v12, "angle":Ljava/lang/Float;
    :goto_7
    invoke-virtual {v12}, Ljava/lang/Float;->floatValue()F

    move-result v4

    float-to-double v4, v4

    invoke-virtual {v7, v4, v5}, Lcom/itextpdf/kernel/geom/AffineTransform;->rotate(D)V

    .line 149
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getOccupiedAreaBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    iput-object v4, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->initialOccupiedAreaBBox:Lcom/itextpdf/kernel/geom/Rectangle;

    .line 150
    invoke-virtual {v12}, Ljava/lang/Float;->floatValue()F

    move-result v4

    invoke-virtual {v13}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v5

    move/from16 v23, v2

    invoke-virtual {v13}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v2

    invoke-direct {v0, v4, v5, v2}, Lcom/itextpdf/layout/renderer/ImageRenderer;->adjustPositionAfterRotation(FFF)F

    move-result v2

    .line 152
    .local v2, "scaleCoef":F
    mul-float/2addr v3, v2

    .line 153
    mul-float/2addr v1, v2

    .line 155
    iget-object v4, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->initialOccupiedAreaBBox:Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v4, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 156
    iget-object v4, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->initialOccupiedAreaBBox:Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v4, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 157
    iget-object v4, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->initialOccupiedAreaBBox:Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v4, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 158
    instance-of v4, v9, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    if-eqz v4, :cond_b

    .line 159
    float-to-double v4, v2

    move-object/from16 v25, v8

    move-object/from16 v26, v9

    .end local v8    # "modelElement":Lcom/itextpdf/layout/element/Image;
    .end local v9    # "xObject":Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
    .local v25, "modelElement":Lcom/itextpdf/layout/element/Image;
    .local v26, "xObject":Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
    float-to-double v8, v2

    invoke-virtual {v7, v4, v5, v8, v9}, Lcom/itextpdf/kernel/geom/AffineTransform;->scale(DD)V

    goto :goto_8

    .line 158
    .end local v25    # "modelElement":Lcom/itextpdf/layout/element/Image;
    .end local v26    # "xObject":Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
    .restart local v8    # "modelElement":Lcom/itextpdf/layout/element/Image;
    .restart local v9    # "xObject":Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
    :cond_b
    move-object/from16 v25, v8

    move-object/from16 v26, v9

    .line 165
    .end local v8    # "modelElement":Lcom/itextpdf/layout/element/Image;
    .end local v9    # "xObject":Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
    .restart local v25    # "modelElement":Lcom/itextpdf/layout/element/Image;
    .restart local v26    # "xObject":Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
    :goto_8
    invoke-virtual/range {v25 .. v25}, Lcom/itextpdf/layout/element/Image;->getObjectFit()Lcom/itextpdf/layout/properties/ObjectFit;

    move-result-object v4

    iget v5, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->imageWidth:F

    iget v8, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->imageHeight:F

    invoke-direct {v0, v4, v5, v8}, Lcom/itextpdf/layout/renderer/ImageRenderer;->applyObjectFit(Lcom/itextpdf/layout/properties/ObjectFit;FF)V

    .line 166
    invoke-virtual/range {v25 .. v25}, Lcom/itextpdf/layout/element/Image;->getObjectFit()Lcom/itextpdf/layout/properties/ObjectFit;

    move-result-object v4

    sget-object v5, Lcom/itextpdf/layout/properties/ObjectFit;->FILL:Lcom/itextpdf/layout/properties/ObjectFit;

    if-ne v4, v5, :cond_c

    .line 167
    move v4, v1

    .line 168
    .local v4, "imageItselfWidth":F
    move v5, v3

    move v8, v4

    move v9, v5

    .local v5, "imageItselfHeight":F
    goto :goto_9

    .line 170
    .end local v4    # "imageItselfWidth":F
    .end local v5    # "imageItselfHeight":F
    :cond_c
    iget v4, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->renderedImageWidth:F

    .line 171
    .restart local v4    # "imageItselfWidth":F
    iget v5, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->renderedImageHeight:F

    move v8, v4

    move v9, v5

    .line 173
    .end local v4    # "imageItselfWidth":F
    .local v8, "imageItselfWidth":F
    .local v9, "imageItselfHeight":F
    :goto_9
    invoke-direct {v0, v7, v8, v9}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getMatrix(Lcom/itextpdf/kernel/geom/AffineTransform;FF)V

    .line 176
    const/4 v4, 0x0

    .line 177
    .local v4, "isPlacingForced":Z
    iget-object v5, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-virtual {v13}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v27

    const v28, 0x38d1b717    # 1.0E-4f

    add-float v27, v27, v28

    cmpl-float v5, v5, v27

    if-gtz v5, :cond_e

    iget-object v5, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-virtual {v13}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v27

    add-float v27, v27, v28

    cmpl-float v5, v5, v27

    if-lez v5, :cond_d

    goto :goto_a

    :cond_d
    move-object/from16 v29, v6

    move/from16 v27, v8

    move/from16 v30, v9

    move-object/from16 v6, v22

    move v9, v1

    move/from16 v22, v2

    move v8, v3

    goto/16 :goto_c

    .line 178
    :cond_e
    :goto_a
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move/from16 v27, v1

    .end local v1    # "imageContainerWidth":F
    .local v27, "imageContainerWidth":F
    const/16 v1, 0x1a

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v5, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_f

    .line 179
    const/4 v1, 0x1

    move/from16 v28, v1

    .end local v4    # "isPlacingForced":Z
    .local v1, "isPlacingForced":Z
    goto :goto_b

    .line 181
    .end local v1    # "isPlacingForced":Z
    .restart local v4    # "isPlacingForced":Z
    :cond_f
    const/4 v1, 0x1

    .line 182
    .end local v4    # "isPlacingForced":Z
    .restart local v1    # "isPlacingForced":Z
    iget-object v4, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    invoke-virtual {v13}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v5

    add-float v5, v5, v28

    cmpl-float v4, v4, v5

    if-lez v4, :cond_10

    .line 183
    and-int v1, v1, v19

    .line 185
    :cond_10
    iget-object v4, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    invoke-virtual {v13}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v5

    add-float v5, v5, v28

    cmpl-float v4, v4, v5

    if-lez v4, :cond_11

    .line 186
    and-int v1, v1, v20

    move/from16 v28, v1

    goto :goto_b

    .line 185
    :cond_11
    move/from16 v28, v1

    .line 190
    .end local v1    # "isPlacingForced":Z
    .local v28, "isPlacingForced":Z
    :goto_b
    if-nez v28, :cond_12

    .line 191
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->initialOccupiedAreaBBox:Lcom/itextpdf/kernel/geom/Rectangle;

    const/4 v4, 0x1

    invoke-virtual {v0, v1, v4}, Lcom/itextpdf/layout/renderer/ImageRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 192
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->initialOccupiedAreaBBox:Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v0, v1, v4}, Lcom/itextpdf/layout/renderer/ImageRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 193
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    iget-object v4, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->initialOccupiedAreaBBox:Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v4

    invoke-virtual {v1, v4}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 194
    new-instance v1, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    move v4, v2

    .end local v2    # "scaleCoef":F
    .local v4, "scaleCoef":F
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    move v5, v3

    .end local v3    # "imageContainerHeight":F
    .local v5, "imageContainerHeight":F
    const/4 v3, 0x0

    move-object v0, v1

    const/4 v1, 0x3

    move/from16 v21, v5

    .end local v5    # "imageContainerHeight":F
    .local v21, "imageContainerHeight":F
    move-object/from16 v5, p0

    move-object/from16 v29, v6

    move/from16 v30, v9

    move-object/from16 v6, v22

    move/from16 v9, v27

    move/from16 v22, v4

    move/from16 v27, v8

    move/from16 v8, v21

    move-object/from16 v4, p0

    .end local v4    # "scaleCoef":F
    .end local v21    # "imageContainerHeight":F
    .local v6, "borders":[Lcom/itextpdf/layout/borders/Border;
    .local v8, "imageContainerHeight":F
    .local v9, "imageContainerWidth":F
    .local v22, "scaleCoef":F
    .local v27, "imageItselfWidth":F
    .local v29, "area":Lcom/itextpdf/layout/layout/LayoutArea;
    .local v30, "imageItselfHeight":F
    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    move-object v1, v0

    move-object v0, v4

    return-object v1

    .line 190
    .end local v29    # "area":Lcom/itextpdf/layout/layout/LayoutArea;
    .end local v30    # "imageItselfHeight":F
    .restart local v2    # "scaleCoef":F
    .restart local v3    # "imageContainerHeight":F
    .local v6, "area":Lcom/itextpdf/layout/layout/LayoutArea;
    .local v8, "imageItselfWidth":F
    .local v9, "imageItselfHeight":F
    .local v22, "borders":[Lcom/itextpdf/layout/borders/Border;
    .local v27, "imageContainerWidth":F
    :cond_12
    move-object/from16 v29, v6

    move/from16 v30, v9

    move-object/from16 v6, v22

    move/from16 v9, v27

    move/from16 v22, v2

    move/from16 v27, v8

    move v8, v3

    .end local v2    # "scaleCoef":F
    .end local v3    # "imageContainerHeight":F
    .local v6, "borders":[Lcom/itextpdf/layout/borders/Border;
    .local v8, "imageContainerHeight":F
    .local v9, "imageContainerWidth":F
    .local v22, "scaleCoef":F
    .local v27, "imageItselfWidth":F
    .restart local v29    # "area":Lcom/itextpdf/layout/layout/LayoutArea;
    .restart local v30    # "imageItselfHeight":F
    move/from16 v4, v28

    .line 198
    .end local v28    # "isPlacingForced":Z
    .local v4, "isPlacingForced":Z
    :goto_c
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    iget-object v2, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 199
    const/4 v1, 0x3

    aget-object v2, v6, v1

    if-eqz v2, :cond_13

    .line 200
    invoke-virtual {v12}, Ljava/lang/Float;->floatValue()F

    move-result v2

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    move-result-wide v2

    double-to-float v2, v2

    aget-object v3, v6, v1

    invoke-virtual {v3}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v3

    mul-float/2addr v2, v3

    .line 201
    .local v2, "delta":F
    iget v3, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->renderedImageHeight:F

    iget-object v5, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    div-float/2addr v3, v5

    .line 202
    .local v3, "renderScaling":F
    iget-object v5, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    add-float/2addr v5, v2

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    iput-object v5, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    .line 203
    iget v5, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->renderedImageHeight:F

    mul-float v28, v2, v3

    add-float v5, v5, v28

    iput v5, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->renderedImageHeight:F

    .line 205
    .end local v2    # "delta":F
    .end local v3    # "renderScaling":F
    :cond_13
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    iget-object v3, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->height:Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 206
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    iget-object v3, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->width:Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 208
    const/16 v2, 0x2c

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getPropertyAsUnitValue(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v3

    .line 209
    .local v3, "leftMargin":Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v5

    move/from16 v28, v2

    const-string v2, "Property {0} in percents is not supported"

    const-class v31, Lcom/itextpdf/layout/renderer/ImageRenderer;

    if-nez v5, :cond_14

    .line 210
    invoke-static/range {v31 .. v31}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v5

    .line 211
    .local v5, "logger":Lorg/slf4j/Logger;
    nop

    .line 212
    invoke-static/range {v28 .. v28}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v28

    filled-new-array/range {v28 .. v28}, [Ljava/lang/Object;

    move-result-object v1

    .line 211
    invoke-static {v2, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v5, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 214
    .end local v5    # "logger":Lorg/slf4j/Logger;
    :cond_14
    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getPropertyAsUnitValue(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v5

    .line 215
    .local v5, "topMargin":Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {v5}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v28

    if-nez v28, :cond_15

    .line 216
    move/from16 v28, v1

    invoke-static/range {v31 .. v31}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 217
    .local v1, "logger":Lorg/slf4j/Logger;
    nop

    .line 218
    invoke-static/range {v28 .. v28}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v28

    move-object/from16 v31, v3

    .end local v3    # "leftMargin":Lcom/itextpdf/layout/properties/UnitValue;
    .local v31, "leftMargin":Lcom/itextpdf/layout/properties/UnitValue;
    filled-new-array/range {v28 .. v28}, [Ljava/lang/Object;

    move-result-object v3

    .line 217
    invoke-static {v2, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    goto :goto_d

    .line 215
    .end local v1    # "logger":Lorg/slf4j/Logger;
    .end local v31    # "leftMargin":Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v3    # "leftMargin":Lcom/itextpdf/layout/properties/UnitValue;
    :cond_15
    move-object/from16 v31, v3

    .line 221
    .end local v3    # "leftMargin":Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v31    # "leftMargin":Lcom/itextpdf/layout/properties/UnitValue;
    :goto_d
    invoke-virtual/range {v31 .. v31}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v1

    cmpl-float v1, v23, v1

    if-nez v1, :cond_16

    invoke-virtual {v5}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v1

    cmpl-float v1, v23, v1

    if-eqz v1, :cond_17

    .line 222
    :cond_16
    invoke-virtual/range {v31 .. v31}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v1

    invoke-virtual {v5}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v2

    invoke-direct {v0, v1, v2, v7}, Lcom/itextpdf/layout/renderer/ImageRenderer;->translateImage(FFLcom/itextpdf/kernel/geom/AffineTransform;)V

    .line 223
    invoke-direct {v0, v7, v9, v8}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getMatrix(Lcom/itextpdf/kernel/geom/AffineTransform;FF)V

    .line 226
    :cond_17
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v6, v2}, Lcom/itextpdf/layout/renderer/ImageRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/borders/Border;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 227
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/layout/renderer/ImageRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 229
    invoke-virtual {v12}, Ljava/lang/Float;->floatValue()F

    move-result v1

    cmpl-float v1, v1, v23

    if-eqz v1, :cond_18

    .line 230
    invoke-virtual {v12}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/renderer/ImageRenderer;->applyRotationLayout(F)V

    .line 233
    :cond_18
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    div-float v1, v1, v22

    .line 234
    .local v1, "unscaledWidth":F
    new-instance v3, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move/from16 v2, v23

    invoke-direct {v3, v1, v1, v2}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;-><init>(FFF)V

    .line 235
    .local v3, "minMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    const/16 v2, 0x4d

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/properties/UnitValue;

    .line 237
    .local v2, "rendererWidth":Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v2, :cond_19

    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/UnitValue;->isPercentValue()Z

    move-result v28

    if-eqz v28, :cond_19

    .line 238
    move/from16 v28, v1

    const/4 v1, 0x0

    .end local v1    # "unscaledWidth":F
    .local v28, "unscaledWidth":F
    invoke-virtual {v3, v1}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->setChildrenMinWidth(F)V

    .line 239
    iget v1, v0, Lcom/itextpdf/layout/renderer/ImageRenderer;->imageWidth:F

    invoke-virtual/range {v29 .. v29}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v23

    move/from16 v24, v1

    invoke-virtual/range {v23 .. v23}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/ImageRenderer;->retrieveWidth(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    div-float v1, v24, v1

    .line 240
    .local v1, "coeff":F
    move/from16 v23, v1

    .end local v1    # "coeff":F
    .local v23, "coeff":F
    mul-float v1, v28, v23

    invoke-virtual {v3, v1}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->setChildrenMaxWidth(F)V

    .line 241
    .end local v23    # "coeff":F
    goto :goto_10

    .line 237
    .end local v28    # "unscaledWidth":F
    .local v1, "unscaledWidth":F
    :cond_19
    move/from16 v28, v1

    .line 242
    .end local v1    # "unscaledWidth":F
    .restart local v28    # "unscaledWidth":F
    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/ImageRenderer;->hasProperty(I)Z

    move-result v32

    if-eqz v32, :cond_1a

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_1a

    const/4 v1, 0x1

    goto :goto_e

    :cond_1a
    const/4 v1, 0x0

    .line 243
    .local v1, "autoScale":Z
    :goto_e
    move/from16 v32, v1

    .end local v1    # "autoScale":Z
    .local v32, "autoScale":Z
    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/ImageRenderer;->hasProperty(I)Z

    move-result v33

    if-eqz v33, :cond_1b

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_1b

    const/16 v24, 0x1

    goto :goto_f

    :cond_1b
    const/16 v24, 0x0

    .line 244
    .local v24, "autoScaleWidth":Z
    :goto_f
    if-nez v32, :cond_1c

    if-eqz v24, :cond_1d

    .line 245
    :cond_1c
    const/4 v1, 0x0

    invoke-virtual {v3, v1}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->setChildrenMinWidth(F)V

    .line 249
    .end local v24    # "autoScaleWidth":Z
    .end local v32    # "autoScale":Z
    :cond_1d
    :goto_10
    invoke-static {v15, v0}, Lcom/itextpdf/layout/renderer/FloatingHelper;->removeFloatsAboveRendererBottom(Ljava/util/List;Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 250
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    move-object/from16 v23, v2

    const/4 v2, 0x0

    .end local v2    # "rendererWidth":Lcom/itextpdf/layout/properties/UnitValue;
    .local v23, "rendererWidth":Lcom/itextpdf/layout/properties/UnitValue;
    invoke-static {v0, v15, v1, v11, v2}, Lcom/itextpdf/layout/renderer/FloatingHelper;->adjustResultOccupiedAreaForFloatAndClear(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;FZ)Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v34

    .line 252
    .local v34, "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    invoke-virtual/range {p0 .. p1}, Lcom/itextpdf/layout/renderer/ImageRenderer;->applyAbsolutePositionIfNeeded(Lcom/itextpdf/layout/layout/LayoutContext;)V

    .line 254
    new-instance v32, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    if-eqz v4, :cond_1e

    move-object/from16 v37, v0

    goto :goto_11

    :cond_1e
    const/16 v37, 0x0

    :goto_11
    const/16 v33, 0x1

    const/16 v35, 0x0

    const/16 v36, 0x0

    invoke-direct/range {v32 .. v37}, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 255
    move-object/from16 v1, v32

    invoke-virtual {v1, v3}, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;->setMinMaxWidth(Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;)Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    move-result-object v1

    .line 254
    return-object v1
.end method

.method public move(FF)V
    .locals 1
    .param p1, "dxRight"    # F
    .param p2, "dyUp"    # F

    .line 425
    invoke-super {p0, p1, p2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->move(FF)V

    .line 426
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->initialOccupiedAreaBBox:Lcom/itextpdf/kernel/geom/Rectangle;

    if-eqz v0, :cond_0

    .line 427
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->initialOccupiedAreaBBox:Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/geom/Rectangle;->moveRight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 428
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->initialOccupiedAreaBBox:Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v0, p2}, Lcom/itextpdf/kernel/geom/Rectangle;->moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 430
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->fixedXPosition:Ljava/lang/Float;

    if-eqz v0, :cond_1

    .line 431
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->fixedXPosition:Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    add-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->fixedXPosition:Ljava/lang/Float;

    .line 433
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->fixedYPosition:Ljava/lang/Float;

    if-eqz v0, :cond_2

    .line 434
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->fixedYPosition:Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    add-float/2addr v0, p2

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;->fixedYPosition:Ljava/lang/Float;

    .line 436
    :cond_2
    return-void
.end method
