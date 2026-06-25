.class public abstract Lcom/itextpdf/layout/borders/Border;
.super Ljava/lang/Object;
.source "Border.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/layout/borders/Border$Side;
    }
.end annotation


# static fields
.field private static final ARC_BOTTOM_DEGREE:I = 0x10e

.field private static final ARC_LEFT_DEGREE:I = 0xb4

.field private static final ARC_QUARTER_CLOCKWISE_EXTENT:I = -0x5a

.field private static final ARC_RIGHT_DEGREE:I = 0x0

.field private static final ARC_TOP_DEGREE:I = 0x5a

.field public static final DASHED:I = 0x1

.field public static final DASHED_FIXED:I = 0x9

.field public static final DOTTED:I = 0x2

.field public static final DOUBLE:I = 0x3

.field public static final NO_BORDER:Lcom/itextpdf/layout/borders/Border;

.field public static final ROUND_DOTS:I = 0x4

.field public static final SOLID:I = 0x0

.field public static final _3D_GROOVE:I = 0x5

.field public static final _3D_INSET:I = 0x6

.field public static final _3D_OUTSET:I = 0x7

.field public static final _3D_RIDGE:I = 0x8


# instance fields
.field private hash:I

.field protected transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

.field protected type:I

.field protected width:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 44
    const/4 v0, 0x0

    sput-object v0, Lcom/itextpdf/layout/borders/Border;->NO_BORDER:Lcom/itextpdf/layout/borders/Border;

    return-void
.end method

.method protected constructor <init>(F)V
    .locals 1
    .param p1, "width"    # F

    .line 141
    sget-object v0, Lcom/itextpdf/kernel/colors/ColorConstants;->BLACK:Lcom/itextpdf/kernel/colors/Color;

    invoke-direct {p0, v0, p1}, Lcom/itextpdf/layout/borders/Border;-><init>(Lcom/itextpdf/kernel/colors/Color;F)V

    .line 142
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/colors/Color;F)V
    .locals 1
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/Color;
    .param p2, "width"    # F

    .line 150
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 151
    new-instance v0, Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-direct {v0, p1}, Lcom/itextpdf/layout/properties/TransparentColor;-><init>(Lcom/itextpdf/kernel/colors/Color;)V

    iput-object v0, p0, Lcom/itextpdf/layout/borders/Border;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    .line 152
    iput p2, p0, Lcom/itextpdf/layout/borders/Border;->width:F

    .line 153
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/colors/Color;FF)V
    .locals 1
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/Color;
    .param p2, "width"    # F
    .param p3, "opacity"    # F

    .line 162
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 163
    new-instance v0, Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-direct {v0, p1, p3}, Lcom/itextpdf/layout/properties/TransparentColor;-><init>(Lcom/itextpdf/kernel/colors/Color;F)V

    iput-object v0, p0, Lcom/itextpdf/layout/borders/Border;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    .line 164
    iput p2, p0, Lcom/itextpdf/layout/borders/Border;->width:F

    .line 165
    return-void
.end method


# virtual methods
.method public draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFFFFFLcom/itextpdf/layout/borders/Border$Side;FF)V
    .locals 11
    .param p1, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .param p2, "x1"    # F
    .param p3, "y1"    # F
    .param p4, "x2"    # F
    .param p5, "y2"    # F
    .param p6, "horizontalRadius1"    # F
    .param p7, "verticalRadius1"    # F
    .param p8, "horizontalRadius2"    # F
    .param p9, "verticalRadius2"    # F
    .param p10, "defaultSide"    # Lcom/itextpdf/layout/borders/Border$Side;
    .param p11, "borderWidthBefore"    # F
    .param p12, "borderWidthAfter"    # F

    .line 267
    const-class v0, Lcom/itextpdf/layout/borders/Border;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 268
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v1, "Border#draw(PdfCanvas, float, float, float, float, float, float, float, float, Side, float, float"

    const-string v2, "Border#draw(PdfCanvas, float, float, float, float, Side, float, float)"

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "Method {0} is not implemented by default: please, override and implement it. {1} will be used instead."

    invoke-static {v2, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 272
    move-object v2, p0

    move-object v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move/from16 v7, p5

    move-object/from16 v8, p10

    move/from16 v9, p11

    move/from16 v10, p12

    invoke-virtual/range {v2 .. v10}, Lcom/itextpdf/layout/borders/Border;->draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFLcom/itextpdf/layout/borders/Border$Side;FF)V

    .line 273
    return-void
.end method

.method public draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFFLcom/itextpdf/layout/borders/Border$Side;FF)V
    .locals 13
    .param p1, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .param p2, "x1"    # F
    .param p3, "y1"    # F
    .param p4, "x2"    # F
    .param p5, "y2"    # F
    .param p6, "borderRadius"    # F
    .param p7, "defaultSide"    # Lcom/itextpdf/layout/borders/Border$Side;
    .param p8, "borderWidthBefore"    # F
    .param p9, "borderWidthAfter"    # F

    .line 234
    move/from16 v7, p6

    move/from16 v8, p6

    move/from16 v9, p6

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move-object/from16 v10, p7

    move/from16 v11, p8

    move/from16 v12, p9

    invoke-virtual/range {v0 .. v12}, Lcom/itextpdf/layout/borders/Border;->draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFFFFFLcom/itextpdf/layout/borders/Border$Side;FF)V

    .line 235
    return-void
.end method

.method public abstract draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFLcom/itextpdf/layout/borders/Border$Side;FF)V
.end method

.method public draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 12
    .param p1, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .param p2, "rectangle"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 198
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v2

    .line 199
    .local v2, "left":F
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v9

    .line 200
    .local v9, "bottom":F
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v0

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    add-float v4, v0, v1

    .line 201
    .local v4, "right":F
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v0

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    add-float v3, v0, v1

    .line 202
    .local v3, "top":F
    sget-object v6, Lcom/itextpdf/layout/borders/Border$Side;->TOP:Lcom/itextpdf/layout/borders/Border$Side;

    iget v7, p0, Lcom/itextpdf/layout/borders/Border;->width:F

    iget v8, p0, Lcom/itextpdf/layout/borders/Border;->width:F

    move v5, v3

    move-object v0, p0

    move-object v1, p1

    .end local p1    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .local v1, "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    invoke-virtual/range {v0 .. v8}, Lcom/itextpdf/layout/borders/Border;->draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFLcom/itextpdf/layout/borders/Border$Side;FF)V

    .line 203
    move v8, v9

    .end local v9    # "bottom":F
    .local v8, "bottom":F
    sget-object v9, Lcom/itextpdf/layout/borders/Border$Side;->RIGHT:Lcom/itextpdf/layout/borders/Border$Side;

    iget v10, p0, Lcom/itextpdf/layout/borders/Border;->width:F

    iget v11, p0, Lcom/itextpdf/layout/borders/Border;->width:F

    move v7, v4

    move v6, v3

    move v5, v4

    move-object v3, p0

    move-object v4, v1

    .end local v1    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .end local v3    # "top":F
    .local v4, "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .local v5, "right":F
    .local v6, "top":F
    invoke-virtual/range {v3 .. v11}, Lcom/itextpdf/layout/borders/Border;->draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFLcom/itextpdf/layout/borders/Border$Side;FF)V

    .line 204
    move v4, v5

    move p1, v6

    move v3, v8

    .end local v5    # "right":F
    .end local v6    # "top":F
    .end local v8    # "bottom":F
    .restart local v1    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .local v3, "bottom":F
    .local v4, "right":F
    .local p1, "top":F
    sget-object v6, Lcom/itextpdf/layout/borders/Border$Side;->BOTTOM:Lcom/itextpdf/layout/borders/Border$Side;

    iget v7, p0, Lcom/itextpdf/layout/borders/Border;->width:F

    iget v8, p0, Lcom/itextpdf/layout/borders/Border;->width:F

    move v5, v3

    move v0, v4

    move v4, v2

    move v2, v0

    move-object v0, p0

    .local v2, "right":F
    .local v4, "left":F
    invoke-virtual/range {v0 .. v8}, Lcom/itextpdf/layout/borders/Border;->draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFLcom/itextpdf/layout/borders/Border$Side;FF)V

    .line 205
    move v9, v2

    move v2, v4

    .end local v4    # "left":F
    .local v2, "left":F
    .local v9, "right":F
    sget-object v6, Lcom/itextpdf/layout/borders/Border$Side;->LEFT:Lcom/itextpdf/layout/borders/Border$Side;

    iget v7, p0, Lcom/itextpdf/layout/borders/Border;->width:F

    iget v8, p0, Lcom/itextpdf/layout/borders/Border;->width:F

    move v5, p1

    .end local p1    # "top":F
    .local v5, "top":F
    invoke-virtual/range {v0 .. v8}, Lcom/itextpdf/layout/borders/Border;->draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFLcom/itextpdf/layout/borders/Border$Side;FF)V

    .line 206
    .end local v5    # "top":F
    .restart local p1    # "top":F
    return-void
.end method

.method public abstract drawCellBorder(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFLcom/itextpdf/layout/borders/Border$Side;)V
.end method

.method protected drawDiscontinuousBorders(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;Lcom/itextpdf/kernel/geom/Rectangle;[F[FLcom/itextpdf/layout/borders/Border$Side;FF)V
    .locals 68
    .param p1, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .param p2, "boundingRectangle"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p3, "horizontalRadii"    # [F
    .param p4, "verticalRadii"    # [F
    .param p5, "defaultSide"    # Lcom/itextpdf/layout/borders/Border$Side;
    .param p6, "borderWidthBefore"    # F
    .param p7, "borderWidthAfter"    # F

    .line 482
    move-object/from16 v0, p0

    move/from16 v13, p6

    invoke-virtual/range {p2 .. p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v1

    float-to-double v7, v1

    .line 483
    .local v7, "x1":D
    invoke-virtual/range {p2 .. p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v1

    float-to-double v9, v1

    .line 484
    .local v9, "y1":D
    invoke-virtual/range {p2 .. p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v1

    float-to-double v11, v1

    .line 485
    .local v11, "x2":D
    invoke-virtual/range {p2 .. p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v1

    float-to-double v1, v1

    .line 487
    .local v1, "y2":D
    const/4 v3, 0x0

    aget v4, p3, v3

    float-to-double v4, v4

    .line 488
    .local v4, "horizontalRadius1":D
    const/4 v15, 0x1

    move/from16 v16, v3

    aget v3, p3, v15

    move/from16 v17, v15

    float-to-double v14, v3

    .line 490
    .local v14, "horizontalRadius2":D
    aget v3, p4, v16

    move-wide/from16 v18, v14

    .end local v14    # "horizontalRadius2":D
    .local v18, "horizontalRadius2":D
    float-to-double v14, v3

    .line 491
    .local v14, "verticalRadius1":D
    aget v3, p4, v17

    move-wide/from16 v16, v14

    .end local v14    # "verticalRadius1":D
    .local v16, "verticalRadius1":D
    float-to-double v14, v3

    .line 494
    .local v14, "verticalRadius2":D
    invoke-virtual/range {p2 .. p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v3

    move-wide/from16 v20, v14

    .end local v14    # "verticalRadius2":D
    .local v20, "verticalRadius2":D
    float-to-double v14, v3

    .line 495
    .local v14, "x0":D
    invoke-virtual/range {p2 .. p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v3

    move-wide/from16 v22, v14

    .end local v14    # "x0":D
    .local v22, "x0":D
    float-to-double v14, v3

    .line 496
    .local v14, "y0":D
    invoke-virtual/range {p2 .. p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v3

    move-wide/from16 v24, v14

    .end local v14    # "y0":D
    .local v24, "y0":D
    float-to-double v14, v3

    .line 497
    .local v14, "x3":D
    invoke-virtual/range {p2 .. p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v3

    move-wide/from16 v26, v14

    .end local v14    # "x3":D
    .local v26, "x3":D
    float-to-double v14, v3

    .line 504
    .local v14, "y3":D
    iget v3, v0, Lcom/itextpdf/layout/borders/Border;->width:F

    move-wide/from16 v28, v4

    .end local v4    # "horizontalRadius1":D
    .local v28, "horizontalRadius1":D
    float-to-double v3, v3

    const-wide/high16 v30, 0x4000000000000000L    # 2.0

    div-double v30, v3, v30

    .line 509
    .local v30, "widthHalf":D
    double-to-float v3, v7

    double-to-float v4, v9

    move v5, v3

    double-to-float v3, v11

    move/from16 v32, v4

    double-to-float v4, v1

    move-wide/from16 v33, v14

    move-wide v14, v1

    move v1, v5

    move/from16 v2, v32

    move-object/from16 v5, p5

    .end local v1    # "y2":D
    .local v14, "y2":D
    .local v33, "y3":D
    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/layout/borders/Border;->getBorderSide(FFFFLcom/itextpdf/layout/borders/Border$Side;)Lcom/itextpdf/layout/borders/Border$Side;

    move-result-object v32

    .line 510
    .local v32, "borderSide":Lcom/itextpdf/layout/borders/Border$Side;
    sget-object v1, Lcom/itextpdf/layout/borders/Border$1;->$SwitchMap$com$itextpdf$layout$borders$Border$Side:[I

    invoke-virtual/range {v32 .. v32}, Lcom/itextpdf/layout/borders/Border$Side;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const-wide/high16 v35, 0x4024000000000000L    # 10.0

    const-wide/16 v2, 0x0

    packed-switch v1, :pswitch_data_0

    move-wide/from16 v49, v11

    move-wide/from16 v47, v14

    move/from16 v15, p7

    move-object v14, v0

    move-wide v11, v7

    .end local v7    # "x1":D
    .end local v14    # "y2":D
    .local v11, "x1":D
    .local v47, "y2":D
    .local v49, "x2":D
    move-wide/from16 v45, v22

    move-wide/from16 v56, v26

    move-wide/from16 v22, v33

    move-wide/from16 v1, v47

    move-wide/from16 v11, v49

    goto/16 :goto_4

    .line 622
    .end local v47    # "y2":D
    .end local v49    # "x2":D
    .restart local v7    # "x1":D
    .local v11, "x2":D
    .restart local v14    # "y2":D
    :pswitch_0
    const/high16 v1, 0x40000000    # 2.0f

    float-to-double v4, v13

    sub-double v4, v16, v4

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(DD)D

    move-result-wide v37

    .line 623
    .local v37, "innerRadiusBefore":D
    iget v4, v0, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v4, v4

    sub-double v4, v28, v4

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(DD)D

    move-result-wide v39

    .line 624
    .local v39, "innerRadiusFirst":D
    iget v4, v0, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v4, v4

    sub-double v4, v18, v4

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(DD)D

    move-result-wide v41

    .line 625
    .local v41, "innerRadiusSecond":D
    move/from16 v4, p7

    float-to-double v5, v4

    sub-double v5, v20, v5

    invoke-static {v2, v3, v5, v6}, Ljava/lang/Math;->max(DD)D

    move-result-wide v43

    .line 627
    .local v43, "innerRadiusAfter":D
    add-double v2, v22, v39

    .line 628
    .end local v22    # "x0":D
    .local v2, "x0":D
    div-float v5, v13, v1

    float-to-double v5, v5

    sub-double v5, v24, v5

    .line 630
    .end local v24    # "y0":D
    .local v5, "y0":D
    move-wide/from16 v45, v11

    .end local v11    # "x2":D
    .local v45, "x2":D
    add-double v11, v26, v41

    .line 631
    .end local v26    # "x3":D
    .local v11, "x3":D
    div-float v1, v4, v1

    move-wide/from16 v22, v11

    .end local v11    # "x3":D
    .local v22, "x3":D
    float-to-double v11, v1

    add-double v11, v33, v11

    .line 633
    .end local v33    # "y3":D
    .local v11, "y3":D
    new-instance v1, Lcom/itextpdf/kernel/geom/Point;

    move-wide/from16 v54, v11

    .end local v11    # "y3":D
    .local v54, "y3":D
    iget v11, v0, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v11, v11

    sub-double v11, v7, v11

    move-wide/from16 v47, v14

    .end local v14    # "y2":D
    .restart local v47    # "y2":D
    float-to-double v14, v13

    sub-double v14, v9, v14

    invoke-direct {v1, v11, v12, v14, v15}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v11, Lcom/itextpdf/kernel/geom/Point;

    invoke-direct {v11, v7, v8, v9, v10}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v12, Lcom/itextpdf/kernel/geom/Point;

    invoke-direct {v12, v2, v3, v5, v6}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v14, Lcom/itextpdf/kernel/geom/Point;

    move-wide/from16 v24, v5

    .end local v5    # "y0":D
    .restart local v24    # "y0":D
    add-double v5, v24, v35

    invoke-direct {v14, v2, v3, v5, v6}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-virtual {v0, v1, v11, v12, v14}, Lcom/itextpdf/layout/borders/Border;->getIntersectionPoint(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v14

    .line 634
    .local v14, "clipPoint1":Lcom/itextpdf/kernel/geom/Point;
    new-instance v1, Lcom/itextpdf/kernel/geom/Point;

    iget v5, v0, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v5, v5

    sub-double v11, v45, v5

    float-to-double v5, v4

    add-double v5, v47, v5

    invoke-direct {v1, v11, v12, v5, v6}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v5, Lcom/itextpdf/kernel/geom/Point;

    move-wide/from16 v11, v45

    move-wide/from16 v45, v2

    move-wide/from16 v2, v47

    .end local v47    # "y2":D
    .local v2, "y2":D
    .local v11, "x2":D
    .local v45, "x0":D
    invoke-direct {v5, v11, v12, v2, v3}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v6, Lcom/itextpdf/kernel/geom/Point;

    move-wide/from16 v49, v11

    move-wide/from16 v2, v22

    move-wide/from16 v11, v54

    .end local v22    # "x3":D
    .end local v54    # "y3":D
    .local v2, "x3":D
    .local v11, "y3":D
    .restart local v47    # "y2":D
    .restart local v49    # "x2":D
    invoke-direct {v6, v2, v3, v11, v12}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v15, Lcom/itextpdf/kernel/geom/Point;

    .end local v11    # "y3":D
    .restart local v54    # "y3":D
    add-double v11, v54, v35

    invoke-direct {v15, v2, v3, v11, v12}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-virtual {v0, v1, v5, v6, v15}, Lcom/itextpdf/layout/borders/Border;->getIntersectionPoint(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v15

    .line 635
    .local v15, "clipPoint2":Lcom/itextpdf/kernel/geom/Point;
    iget-wide v5, v14, Lcom/itextpdf/kernel/geom/Point;->y:D

    iget-wide v11, v15, Lcom/itextpdf/kernel/geom/Point;->y:D

    cmpl-double v1, v5, v11

    if-lez v1, :cond_0

    .line 636
    new-instance v1, Lcom/itextpdf/kernel/geom/Point;

    iget v5, v0, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v5, v5

    sub-double v5, v7, v5

    float-to-double v11, v13

    sub-double v11, v9, v11

    invoke-direct {v1, v5, v6, v11, v12}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v5, Lcom/itextpdf/kernel/geom/Point;

    iget v6, v0, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v11, v6

    sub-double v11, v49, v11

    move-wide/from16 v22, v2

    .end local v2    # "x3":D
    .restart local v22    # "x3":D
    float-to-double v2, v4

    add-double v2, v47, v2

    invoke-direct {v5, v11, v12, v2, v3}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-virtual {v0, v1, v14, v15, v5}, Lcom/itextpdf/layout/borders/Border;->getIntersectionPoint(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v1

    .line 637
    .local v1, "clipPoint":Lcom/itextpdf/kernel/geom/Point;
    iget v2, v0, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v2, v2

    sub-double v2, v7, v2

    float-to-double v5, v13

    sub-double v5, v9, v5

    move-object/from16 v11, p1

    invoke-virtual {v11, v2, v3, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    iget-wide v5, v1, Lcom/itextpdf/kernel/geom/Point;->x:D

    move-wide/from16 v51, v7

    .end local v7    # "x1":D
    .local v51, "x1":D
    iget-wide v7, v1, Lcom/itextpdf/kernel/geom/Point;->y:D

    invoke-virtual {v2, v5, v6, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    iget v3, v0, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v5, v3

    sub-double v5, v49, v5

    float-to-double v7, v4

    add-double v7, v47, v7

    invoke-virtual {v2, v5, v6, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    iget v3, v0, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v5, v3

    sub-double v7, v51, v5

    float-to-double v5, v13

    sub-double v5, v9, v5

    invoke-virtual {v2, v7, v8, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    goto :goto_0

    .line 639
    .end local v1    # "clipPoint":Lcom/itextpdf/kernel/geom/Point;
    .end local v22    # "x3":D
    .end local v51    # "x1":D
    .restart local v2    # "x3":D
    .restart local v7    # "x1":D
    :cond_0
    move-object/from16 v11, p1

    move-wide/from16 v22, v2

    move-wide/from16 v51, v7

    .end local v2    # "x3":D
    .end local v7    # "x1":D
    .restart local v22    # "x3":D
    .restart local v51    # "x1":D
    iget v1, v0, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v1, v1

    sub-double v7, v51, v1

    float-to-double v1, v13

    sub-double v1, v9, v1

    invoke-virtual {v11, v7, v8, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    iget-wide v2, v14, Lcom/itextpdf/kernel/geom/Point;->x:D

    iget-wide v5, v14, Lcom/itextpdf/kernel/geom/Point;->y:D

    invoke-virtual {v1, v2, v3, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    iget-wide v2, v15, Lcom/itextpdf/kernel/geom/Point;->x:D

    iget-wide v5, v15, Lcom/itextpdf/kernel/geom/Point;->y:D

    invoke-virtual {v1, v2, v3, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    iget v2, v0, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v2, v2

    sub-double v2, v49, v2

    float-to-double v5, v4

    add-double v5, v47, v5

    invoke-virtual {v1, v2, v3, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    iget v2, v0, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v2, v2

    sub-double v7, v51, v2

    float-to-double v2, v13

    sub-double v2, v9, v2

    invoke-virtual {v1, v7, v8, v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 641
    :goto_0
    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->clip()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->endPath()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 643
    sub-double v5, v51, v30

    .line 644
    .end local v51    # "x1":D
    .local v5, "x1":D
    add-double v26, v9, v37

    .line 646
    .end local v9    # "y1":D
    .local v26, "y1":D
    move-wide/from16 v2, v47

    .end local v47    # "y2":D
    .local v2, "y2":D
    sub-double v48, v49, v30

    .line 647
    .end local v49    # "x2":D
    .local v48, "x2":D
    sub-double v33, v2, v43

    .line 649
    .end local v2    # "y2":D
    .local v33, "y2":D
    add-double v1, v45, v39

    add-double v7, v26, v37

    .line 650
    const-wide v9, 0x4070e00000000000L    # 270.0

    const-wide v11, -0x3fa9800000000000L    # -90.0

    move-object/from16 v60, v15

    move v15, v4

    move-wide/from16 v3, v24

    move-wide/from16 v23, v22

    move-object/from16 v22, v60

    move-object/from16 v60, v14

    move-object v14, v0

    move-object/from16 v0, p1

    .end local v14    # "clipPoint1":Lcom/itextpdf/kernel/geom/Point;
    .end local v15    # "clipPoint2":Lcom/itextpdf/kernel/geom/Point;
    .end local v24    # "y0":D
    .local v3, "y0":D
    .local v22, "clipPoint2":Lcom/itextpdf/kernel/geom/Point;
    .local v23, "x3":D
    .local v60, "clipPoint1":Lcom/itextpdf/kernel/geom/Point;
    invoke-virtual/range {v0 .. v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->arc(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v47

    sub-double v50, v33, v43

    add-double v52, v23, v41

    .line 653
    const-wide v56, 0x4066800000000000L    # 180.0

    const-wide v58, -0x3fa9800000000000L    # -90.0

    invoke-virtual/range {v47 .. v59}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->arcContinuous(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 656
    move-wide v7, v5

    move-wide/from16 v56, v23

    move-wide/from16 v9, v26

    move-wide/from16 v1, v33

    move-wide/from16 v11, v48

    move-wide/from16 v22, v54

    move-wide/from16 v24, v3

    goto/16 :goto_4

    .line 586
    .end local v3    # "y0":D
    .end local v5    # "x1":D
    .end local v23    # "x3":D
    .end local v37    # "innerRadiusBefore":D
    .end local v39    # "innerRadiusFirst":D
    .end local v41    # "innerRadiusSecond":D
    .end local v43    # "innerRadiusAfter":D
    .end local v45    # "x0":D
    .end local v48    # "x2":D
    .end local v54    # "y3":D
    .end local v60    # "clipPoint1":Lcom/itextpdf/kernel/geom/Point;
    .restart local v7    # "x1":D
    .restart local v9    # "y1":D
    .local v11, "x2":D
    .local v14, "y2":D
    .local v22, "x0":D
    .restart local v24    # "y0":D
    .local v26, "x3":D
    .local v33, "y3":D
    :pswitch_1
    move-wide v4, v2

    move-wide/from16 v51, v7

    move-wide/from16 v49, v11

    move-wide v2, v14

    const/high16 v1, 0x40000000    # 2.0f

    move/from16 v15, p7

    move-object v14, v0

    .end local v7    # "x1":D
    .end local v11    # "x2":D
    .end local v14    # "y2":D
    .restart local v2    # "y2":D
    .restart local v49    # "x2":D
    .restart local v51    # "x1":D
    float-to-double v6, v13

    sub-double v6, v28, v6

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(DD)D

    move-result-wide v37

    .line 587
    .restart local v37    # "innerRadiusBefore":D
    iget v6, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v6, v6

    sub-double v6, v16, v6

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(DD)D

    move-result-wide v39

    .line 588
    .restart local v39    # "innerRadiusFirst":D
    iget v6, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v6, v6

    sub-double v6, v20, v6

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(DD)D

    move-result-wide v41

    .line 589
    .restart local v41    # "innerRadiusSecond":D
    float-to-double v6, v15

    sub-double v6, v18, v6

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(DD)D

    move-result-wide v43

    .line 591
    .restart local v43    # "innerRadiusAfter":D
    div-float v4, v13, v1

    float-to-double v4, v4

    add-double v4, v22, v4

    .line 592
    .end local v22    # "x0":D
    .local v4, "x0":D
    add-double v6, v24, v39

    .line 594
    .end local v24    # "y0":D
    .local v6, "y0":D
    div-float v1, v15, v1

    float-to-double v11, v1

    sub-double v11, v26, v11

    .line 595
    .end local v26    # "x3":D
    .local v11, "x3":D
    move-wide/from16 v47, v2

    .end local v2    # "y2":D
    .restart local v47    # "y2":D
    add-double v1, v33, v41

    .line 597
    .end local v33    # "y3":D
    .local v1, "y3":D
    new-instance v3, Lcom/itextpdf/kernel/geom/Point;

    move-wide/from16 v22, v1

    .end local v1    # "y3":D
    .local v22, "y3":D
    float-to-double v0, v13

    add-double v0, v51, v0

    iget v2, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    move-wide/from16 v58, v11

    .end local v11    # "x3":D
    .local v58, "x3":D
    float-to-double v11, v2

    sub-double v11, v9, v11

    invoke-direct {v3, v0, v1, v11, v12}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v0, Lcom/itextpdf/kernel/geom/Point;

    move-wide/from16 v11, v51

    .end local v51    # "x1":D
    .local v11, "x1":D
    invoke-direct {v0, v11, v12, v9, v10}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v1, Lcom/itextpdf/kernel/geom/Point;

    invoke-direct {v1, v4, v5, v6, v7}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v2, Lcom/itextpdf/kernel/geom/Point;

    move-wide/from16 v45, v4

    .end local v4    # "x0":D
    .restart local v45    # "x0":D
    sub-double v4, v45, v35

    invoke-direct {v2, v4, v5, v6, v7}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-virtual {v14, v3, v0, v1, v2}, Lcom/itextpdf/layout/borders/Border;->getIntersectionPoint(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v0

    .line 598
    .local v0, "clipPoint1":Lcom/itextpdf/kernel/geom/Point;
    new-instance v1, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v2, v15

    sub-double v2, v49, v2

    iget v4, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v4, v4

    sub-double v4, v47, v4

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v2, Lcom/itextpdf/kernel/geom/Point;

    move-wide/from16 v24, v6

    move-wide/from16 v5, v47

    move-wide/from16 v3, v49

    .end local v6    # "y0":D
    .end local v47    # "y2":D
    .end local v49    # "x2":D
    .local v3, "x2":D
    .local v5, "y2":D
    .restart local v24    # "y0":D
    invoke-direct {v2, v3, v4, v5, v6}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v7, Lcom/itextpdf/kernel/geom/Point;

    move-wide/from16 v5, v22

    move-wide/from16 v3, v58

    .end local v22    # "y3":D
    .end local v58    # "x3":D
    .local v3, "x3":D
    .local v5, "y3":D
    .restart local v47    # "y2":D
    .restart local v49    # "x2":D
    invoke-direct {v7, v3, v4, v5, v6}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v8, Lcom/itextpdf/kernel/geom/Point;

    .end local v3    # "x3":D
    .restart local v58    # "x3":D
    add-double v3, v58, v35

    invoke-direct {v8, v3, v4, v5, v6}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-virtual {v14, v1, v2, v7, v8}, Lcom/itextpdf/layout/borders/Border;->getIntersectionPoint(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v1

    .line 599
    .local v1, "clipPoint2":Lcom/itextpdf/kernel/geom/Point;
    iget-wide v2, v0, Lcom/itextpdf/kernel/geom/Point;->x:D

    iget-wide v7, v1, Lcom/itextpdf/kernel/geom/Point;->x:D

    cmpg-double v2, v2, v7

    if-gez v2, :cond_1

    .line 600
    new-instance v2, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v3, v13

    add-double v7, v11, v3

    iget v3, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v3, v3

    sub-double v3, v9, v3

    invoke-direct {v2, v7, v8, v3, v4}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v3, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v7, v15

    sub-double v7, v49, v7

    iget v4, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    move-wide/from16 v22, v5

    .end local v5    # "y3":D
    .restart local v22    # "y3":D
    float-to-double v4, v4

    sub-double v4, v47, v4

    invoke-direct {v3, v7, v8, v4, v5}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-virtual {v14, v2, v0, v1, v3}, Lcom/itextpdf/layout/borders/Border;->getIntersectionPoint(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v2

    .line 601
    .local v2, "clipPoint":Lcom/itextpdf/kernel/geom/Point;
    float-to-double v3, v13

    add-double v7, v11, v3

    iget v3, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v3, v3

    sub-double v3, v9, v3

    move-object/from16 v6, p1

    invoke-virtual {v6, v7, v8, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    iget-wide v4, v2, Lcom/itextpdf/kernel/geom/Point;->x:D

    iget-wide v7, v2, Lcom/itextpdf/kernel/geom/Point;->y:D

    invoke-virtual {v3, v4, v5, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    float-to-double v4, v15

    sub-double v4, v49, v4

    iget v7, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v7, v7

    sub-double v7, v47, v7

    invoke-virtual {v3, v4, v5, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    float-to-double v4, v13

    add-double v7, v11, v4

    iget v4, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v4, v4

    sub-double v4, v9, v4

    invoke-virtual {v3, v7, v8, v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    goto :goto_1

    .line 603
    .end local v2    # "clipPoint":Lcom/itextpdf/kernel/geom/Point;
    .end local v22    # "y3":D
    .restart local v5    # "y3":D
    :cond_1
    move-wide/from16 v22, v5

    move-object/from16 v6, p1

    .end local v5    # "y3":D
    .restart local v22    # "y3":D
    float-to-double v2, v13

    add-double v7, v11, v2

    iget v2, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v2, v2

    sub-double v2, v9, v2

    invoke-virtual {v6, v7, v8, v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    iget-wide v3, v0, Lcom/itextpdf/kernel/geom/Point;->x:D

    iget-wide v7, v0, Lcom/itextpdf/kernel/geom/Point;->y:D

    invoke-virtual {v2, v3, v4, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    iget-wide v3, v1, Lcom/itextpdf/kernel/geom/Point;->x:D

    iget-wide v7, v1, Lcom/itextpdf/kernel/geom/Point;->y:D

    invoke-virtual {v2, v3, v4, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    float-to-double v3, v15

    sub-double v3, v49, v3

    iget v5, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v7, v5

    sub-double v7, v47, v7

    invoke-virtual {v2, v3, v4, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    float-to-double v3, v13

    add-double v7, v11, v3

    iget v3, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v3, v3

    sub-double v3, v9, v3

    invoke-virtual {v2, v7, v8, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 605
    :goto_1
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->clip()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->endPath()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 607
    sub-double v26, v11, v37

    .line 608
    .end local v11    # "x1":D
    .local v26, "x1":D
    sub-double v7, v9, v30

    .line 610
    .end local v9    # "y1":D
    .local v7, "y1":D
    add-double v33, v49, v43

    .line 611
    .end local v49    # "x2":D
    .local v33, "x2":D
    sub-double v56, v47, v30

    .line 613
    .end local v47    # "y2":D
    .local v56, "y2":D
    add-double v3, v24, v39

    sub-double v5, v26, v37

    .line 614
    const-wide/16 v9, 0x0

    const-wide v11, -0x3fa9800000000000L    # -90.0

    move-object/from16 v35, v0

    move-object/from16 v36, v1

    move-wide/from16 v1, v45

    move-object/from16 v0, p1

    .end local v0    # "clipPoint1":Lcom/itextpdf/kernel/geom/Point;
    .end local v45    # "x0":D
    .local v1, "x0":D
    .local v35, "clipPoint1":Lcom/itextpdf/kernel/geom/Point;
    .local v36, "clipPoint2":Lcom/itextpdf/kernel/geom/Point;
    invoke-virtual/range {v0 .. v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->arc(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v53

    .end local v1    # "x0":D
    .restart local v45    # "x0":D
    add-double v54, v33, v43

    add-double v60, v22, v41

    .line 617
    const-wide v62, 0x4070e00000000000L    # 270.0

    const-wide v64, -0x3fa9800000000000L    # -90.0

    invoke-virtual/range {v53 .. v65}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->arcContinuous(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 620
    move-wide v9, v7

    move-wide/from16 v7, v26

    move-wide/from16 v11, v33

    move-wide/from16 v1, v56

    move-wide/from16 v56, v58

    goto/16 :goto_4

    .line 550
    .end local v35    # "clipPoint1":Lcom/itextpdf/kernel/geom/Point;
    .end local v36    # "clipPoint2":Lcom/itextpdf/kernel/geom/Point;
    .end local v37    # "innerRadiusBefore":D
    .end local v39    # "innerRadiusFirst":D
    .end local v41    # "innerRadiusSecond":D
    .end local v43    # "innerRadiusAfter":D
    .end local v45    # "x0":D
    .end local v56    # "y2":D
    .end local v58    # "x3":D
    .local v7, "x1":D
    .restart local v9    # "y1":D
    .local v11, "x2":D
    .restart local v14    # "y2":D
    .local v22, "x0":D
    .local v26, "x3":D
    .local v33, "y3":D
    :pswitch_2
    move-wide v5, v2

    move-wide v3, v11

    move-wide/from16 v47, v14

    const/high16 v1, 0x40000000    # 2.0f

    move/from16 v15, p7

    move-object v14, v0

    move-wide v11, v7

    .end local v7    # "x1":D
    .end local v14    # "y2":D
    .local v3, "x2":D
    .local v11, "x1":D
    .restart local v47    # "y2":D
    float-to-double v7, v13

    sub-double v7, v16, v7

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->max(DD)D

    move-result-wide v37

    .line 551
    .restart local v37    # "innerRadiusBefore":D
    iget v2, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v7, v2

    sub-double v7, v28, v7

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->max(DD)D

    move-result-wide v39

    .line 552
    .restart local v39    # "innerRadiusFirst":D
    iget v2, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v7, v2

    sub-double v7, v18, v7

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->max(DD)D

    move-result-wide v41

    .line 553
    .restart local v41    # "innerRadiusSecond":D
    float-to-double v7, v15

    sub-double v7, v20, v7

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->max(DD)D

    move-result-wide v43

    .line 555
    .restart local v43    # "innerRadiusAfter":D
    sub-double v5, v22, v39

    .line 556
    .end local v22    # "x0":D
    .local v5, "x0":D
    div-float v2, v13, v1

    float-to-double v7, v2

    add-double v7, v24, v7

    .line 558
    .end local v24    # "y0":D
    .local v7, "y0":D
    move/from16 v45, v1

    sub-double v1, v26, v41

    .line 559
    .end local v26    # "x3":D
    .local v1, "x3":D
    div-float v0, v15, v45

    move-wide/from16 v22, v1

    .end local v1    # "x3":D
    .local v22, "x3":D
    float-to-double v0, v0

    sub-double v0, v33, v0

    .line 561
    .end local v33    # "y3":D
    .local v0, "y3":D
    new-instance v2, Lcom/itextpdf/kernel/geom/Point;

    move-wide/from16 v56, v0

    .end local v0    # "y3":D
    .local v56, "y3":D
    iget v0, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v0, v0

    add-double/2addr v0, v11

    move-wide/from16 v49, v3

    .end local v3    # "x2":D
    .restart local v49    # "x2":D
    float-to-double v3, v13

    add-double/2addr v3, v9

    invoke-direct {v2, v0, v1, v3, v4}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v0, Lcom/itextpdf/kernel/geom/Point;

    invoke-direct {v0, v11, v12, v9, v10}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v1, Lcom/itextpdf/kernel/geom/Point;

    invoke-direct {v1, v5, v6, v7, v8}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v3, Lcom/itextpdf/kernel/geom/Point;

    move-wide/from16 v24, v7

    .end local v7    # "y0":D
    .restart local v24    # "y0":D
    sub-double v7, v24, v35

    invoke-direct {v3, v5, v6, v7, v8}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-virtual {v14, v2, v0, v1, v3}, Lcom/itextpdf/layout/borders/Border;->getIntersectionPoint(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v0

    .line 562
    .local v0, "clipPoint1":Lcom/itextpdf/kernel/geom/Point;
    new-instance v1, Lcom/itextpdf/kernel/geom/Point;

    iget v2, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v2, v2

    add-double v2, v49, v2

    float-to-double v7, v15

    sub-double v7, v47, v7

    invoke-direct {v1, v2, v3, v7, v8}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v2, Lcom/itextpdf/kernel/geom/Point;

    move-wide/from16 v7, v47

    move-wide/from16 v3, v49

    .end local v47    # "y2":D
    .end local v49    # "x2":D
    .restart local v3    # "x2":D
    .local v7, "y2":D
    invoke-direct {v2, v3, v4, v7, v8}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    move-wide/from16 v46, v5

    .end local v5    # "x0":D
    .local v46, "x0":D
    new-instance v5, Lcom/itextpdf/kernel/geom/Point;

    move-wide/from16 v51, v7

    move-wide/from16 v3, v22

    move-wide/from16 v6, v56

    .end local v7    # "y2":D
    .end local v22    # "x3":D
    .end local v56    # "y3":D
    .local v3, "x3":D
    .local v6, "y3":D
    .restart local v49    # "x2":D
    .local v51, "y2":D
    invoke-direct {v5, v3, v4, v6, v7}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v8, Lcom/itextpdf/kernel/geom/Point;

    .end local v6    # "y3":D
    .restart local v56    # "y3":D
    sub-double v6, v56, v35

    invoke-direct {v8, v3, v4, v6, v7}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-virtual {v14, v1, v2, v5, v8}, Lcom/itextpdf/layout/borders/Border;->getIntersectionPoint(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v1

    .line 563
    .local v1, "clipPoint2":Lcom/itextpdf/kernel/geom/Point;
    iget-wide v5, v0, Lcom/itextpdf/kernel/geom/Point;->y:D

    iget-wide v7, v1, Lcom/itextpdf/kernel/geom/Point;->y:D

    cmpg-double v2, v5, v7

    if-gez v2, :cond_2

    .line 564
    new-instance v2, Lcom/itextpdf/kernel/geom/Point;

    iget v5, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v5, v5

    add-double v7, v11, v5

    float-to-double v5, v13

    add-double/2addr v5, v9

    invoke-direct {v2, v7, v8, v5, v6}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v5, Lcom/itextpdf/kernel/geom/Point;

    iget v6, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v6, v6

    add-double v6, v49, v6

    move-wide/from16 v22, v3

    .end local v3    # "x3":D
    .restart local v22    # "x3":D
    float-to-double v3, v15

    sub-double v3, v51, v3

    invoke-direct {v5, v6, v7, v3, v4}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-virtual {v14, v2, v0, v1, v5}, Lcom/itextpdf/layout/borders/Border;->getIntersectionPoint(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v2

    .line 565
    .restart local v2    # "clipPoint":Lcom/itextpdf/kernel/geom/Point;
    iget v3, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v3, v3

    add-double v7, v11, v3

    float-to-double v3, v13

    add-double/2addr v3, v9

    move-object/from16 v6, p1

    invoke-virtual {v6, v7, v8, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    iget-wide v4, v2, Lcom/itextpdf/kernel/geom/Point;->x:D

    iget-wide v7, v2, Lcom/itextpdf/kernel/geom/Point;->y:D

    invoke-virtual {v3, v4, v5, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    iget v4, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v4, v4

    add-double v4, v49, v4

    float-to-double v7, v15

    sub-double v7, v51, v7

    invoke-virtual {v3, v4, v5, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    iget v4, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v4, v4

    add-double v7, v11, v4

    float-to-double v4, v13

    add-double/2addr v4, v9

    invoke-virtual {v3, v7, v8, v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->clip()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->endPath()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    goto :goto_2

    .line 567
    .end local v2    # "clipPoint":Lcom/itextpdf/kernel/geom/Point;
    .end local v22    # "x3":D
    .restart local v3    # "x3":D
    :cond_2
    move-object/from16 v6, p1

    move-wide/from16 v22, v3

    .end local v3    # "x3":D
    .restart local v22    # "x3":D
    iget v2, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v2, v2

    add-double v7, v11, v2

    float-to-double v2, v13

    add-double/2addr v2, v9

    invoke-virtual {v6, v7, v8, v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    iget-wide v3, v0, Lcom/itextpdf/kernel/geom/Point;->x:D

    iget-wide v7, v0, Lcom/itextpdf/kernel/geom/Point;->y:D

    invoke-virtual {v2, v3, v4, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    iget-wide v3, v1, Lcom/itextpdf/kernel/geom/Point;->x:D

    iget-wide v7, v1, Lcom/itextpdf/kernel/geom/Point;->y:D

    invoke-virtual {v2, v3, v4, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    iget v3, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v3, v3

    add-double v3, v49, v3

    float-to-double v7, v15

    sub-double v7, v51, v7

    invoke-virtual {v2, v3, v4, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    iget v3, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v3, v3

    add-double v7, v11, v3

    float-to-double v3, v13

    add-double/2addr v3, v9

    invoke-virtual {v2, v7, v8, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->clip()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->endPath()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 569
    :goto_2
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->clip()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->endPath()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 571
    add-double v7, v11, v30

    .line 572
    .end local v11    # "x1":D
    .local v7, "x1":D
    sub-double v26, v9, v37

    .line 574
    .end local v9    # "y1":D
    .local v26, "y1":D
    move-wide/from16 v2, v51

    .end local v51    # "y2":D
    .local v2, "y2":D
    add-double v50, v49, v30

    .line 575
    .end local v49    # "x2":D
    .local v50, "x2":D
    add-double v33, v2, v43

    .line 577
    .end local v2    # "y2":D
    .local v33, "y2":D
    move-object v3, v1

    .end local v1    # "clipPoint2":Lcom/itextpdf/kernel/geom/Point;
    .local v3, "clipPoint2":Lcom/itextpdf/kernel/geom/Point;
    sub-double v1, v46, v39

    move-wide v5, v7

    .end local v7    # "x1":D
    .local v5, "x1":D
    sub-double v7, v26, v37

    .line 578
    const-wide v9, 0x4056800000000000L    # 90.0

    const-wide v11, -0x3fa9800000000000L    # -90.0

    move-wide/from16 v66, v24

    move-object/from16 v25, v3

    move-wide/from16 v3, v66

    move-object/from16 v24, v0

    move-object/from16 v0, p1

    .end local v0    # "clipPoint1":Lcom/itextpdf/kernel/geom/Point;
    .local v3, "y0":D
    .local v24, "clipPoint1":Lcom/itextpdf/kernel/geom/Point;
    .local v25, "clipPoint2":Lcom/itextpdf/kernel/geom/Point;
    invoke-virtual/range {v0 .. v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->arc(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v49

    add-double v52, v33, v43

    sub-double v54, v22, v41

    .line 581
    const-wide/16 v58, 0x0

    const-wide v60, -0x3fa9800000000000L    # -90.0

    invoke-virtual/range {v49 .. v61}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->arcContinuous(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 584
    move-wide/from16 v1, v56

    move-wide/from16 v56, v22

    move-wide/from16 v22, v1

    move-wide/from16 v24, v3

    move-wide v7, v5

    move-wide/from16 v9, v26

    move-wide/from16 v1, v33

    move-wide/from16 v45, v46

    move-wide/from16 v11, v50

    goto/16 :goto_4

    .line 513
    .end local v3    # "y0":D
    .end local v5    # "x1":D
    .end local v25    # "clipPoint2":Lcom/itextpdf/kernel/geom/Point;
    .end local v37    # "innerRadiusBefore":D
    .end local v39    # "innerRadiusFirst":D
    .end local v41    # "innerRadiusSecond":D
    .end local v43    # "innerRadiusAfter":D
    .end local v46    # "x0":D
    .end local v50    # "x2":D
    .end local v56    # "y3":D
    .restart local v7    # "x1":D
    .restart local v9    # "y1":D
    .local v11, "x2":D
    .restart local v14    # "y2":D
    .local v22, "x0":D
    .local v24, "y0":D
    .local v26, "x3":D
    .local v33, "y3":D
    :pswitch_3
    move-wide v5, v2

    move-wide/from16 v49, v11

    move-wide v2, v14

    const/high16 v45, 0x40000000    # 2.0f

    move/from16 v15, p7

    move-object v14, v0

    move-wide v11, v7

    .end local v7    # "x1":D
    .end local v14    # "y2":D
    .restart local v2    # "y2":D
    .local v11, "x1":D
    .restart local v49    # "x2":D
    float-to-double v7, v13

    sub-double v7, v28, v7

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->max(DD)D

    move-result-wide v37

    .line 514
    .restart local v37    # "innerRadiusBefore":D
    iget v1, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v7, v1

    sub-double v7, v16, v7

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->max(DD)D

    move-result-wide v39

    .line 515
    .restart local v39    # "innerRadiusFirst":D
    iget v1, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v7, v1

    sub-double v7, v20, v7

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->max(DD)D

    move-result-wide v41

    .line 516
    .restart local v41    # "innerRadiusSecond":D
    float-to-double v7, v15

    sub-double v7, v18, v7

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->max(DD)D

    move-result-wide v43

    .line 519
    .restart local v43    # "innerRadiusAfter":D
    div-float v1, v13, v45

    float-to-double v4, v1

    sub-double v4, v22, v4

    .line 520
    .end local v22    # "x0":D
    .restart local v4    # "x0":D
    sub-double v6, v24, v39

    .line 522
    .end local v24    # "y0":D
    .local v6, "y0":D
    div-float v1, v15, v45

    move-wide/from16 v47, v2

    .end local v2    # "y2":D
    .restart local v47    # "y2":D
    float-to-double v1, v1

    add-double v1, v26, v1

    .line 523
    .end local v26    # "x3":D
    .local v1, "x3":D
    move-wide/from16 v56, v1

    .end local v1    # "x3":D
    .local v56, "x3":D
    sub-double v0, v33, v41

    .line 525
    .end local v33    # "y3":D
    .local v0, "y3":D
    new-instance v2, Lcom/itextpdf/kernel/geom/Point;

    move-wide/from16 v22, v0

    .end local v0    # "y3":D
    .local v22, "y3":D
    float-to-double v0, v13

    sub-double v0, v11, v0

    iget v3, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v13, v3

    add-double/2addr v13, v9

    invoke-direct {v2, v0, v1, v13, v14}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v0, Lcom/itextpdf/kernel/geom/Point;

    invoke-direct {v0, v11, v12, v9, v10}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v1, Lcom/itextpdf/kernel/geom/Point;

    invoke-direct {v1, v4, v5, v6, v7}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v3, Lcom/itextpdf/kernel/geom/Point;

    add-double v13, v4, v35

    invoke-direct {v3, v13, v14, v6, v7}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    move-object/from16 v14, p0

    invoke-virtual {v14, v2, v0, v1, v3}, Lcom/itextpdf/layout/borders/Border;->getIntersectionPoint(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v13

    .line 526
    .local v13, "clipPoint1":Lcom/itextpdf/kernel/geom/Point;
    new-instance v0, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v1, v15

    add-double v1, v49, v1

    iget v3, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    move-wide/from16 v45, v4

    .end local v4    # "x0":D
    .restart local v45    # "x0":D
    float-to-double v3, v3

    add-double v3, v47, v3

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v1, Lcom/itextpdf/kernel/geom/Point;

    move-wide/from16 v24, v6

    move-wide/from16 v5, v47

    move-wide/from16 v3, v49

    .end local v6    # "y0":D
    .end local v47    # "y2":D
    .end local v49    # "x2":D
    .local v3, "x2":D
    .local v5, "y2":D
    .restart local v24    # "y0":D
    invoke-direct {v1, v3, v4, v5, v6}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v2, Lcom/itextpdf/kernel/geom/Point;

    move-wide/from16 v3, v22

    move-wide/from16 v7, v56

    .end local v22    # "y3":D
    .end local v56    # "x3":D
    .local v3, "y3":D
    .local v7, "x3":D
    .restart local v49    # "x2":D
    invoke-direct {v2, v7, v8, v3, v4}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    .end local v5    # "y2":D
    .restart local v47    # "y2":D
    new-instance v5, Lcom/itextpdf/kernel/geom/Point;

    .end local v7    # "x3":D
    .restart local v56    # "x3":D
    sub-double v6, v56, v35

    invoke-direct {v5, v6, v7, v3, v4}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-virtual {v14, v0, v1, v2, v5}, Lcom/itextpdf/layout/borders/Border;->getIntersectionPoint(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v0

    .line 527
    .local v0, "clipPoint2":Lcom/itextpdf/kernel/geom/Point;
    iget-wide v1, v13, Lcom/itextpdf/kernel/geom/Point;->x:D

    iget-wide v5, v0, Lcom/itextpdf/kernel/geom/Point;->x:D

    cmpl-double v1, v1, v5

    if-lez v1, :cond_3

    .line 528
    new-instance v1, Lcom/itextpdf/kernel/geom/Point;

    move/from16 v2, p6

    float-to-double v5, v2

    sub-double v7, v11, v5

    iget v5, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v5, v5

    add-double/2addr v5, v9

    invoke-direct {v1, v7, v8, v5, v6}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    new-instance v5, Lcom/itextpdf/kernel/geom/Point;

    float-to-double v6, v15

    add-double v6, v49, v6

    iget v8, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    move-wide/from16 v22, v3

    .end local v3    # "y3":D
    .restart local v22    # "y3":D
    float-to-double v3, v8

    add-double v3, v47, v3

    invoke-direct {v5, v6, v7, v3, v4}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-virtual {v14, v1, v13, v0, v5}, Lcom/itextpdf/layout/borders/Border;->getIntersectionPoint(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v1

    .line 529
    .local v1, "clipPoint":Lcom/itextpdf/kernel/geom/Point;
    float-to-double v3, v2

    sub-double v7, v11, v3

    iget v3, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v3, v3

    add-double/2addr v3, v9

    move-object/from16 v6, p1

    invoke-virtual {v6, v7, v8, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    iget-wide v4, v1, Lcom/itextpdf/kernel/geom/Point;->x:D

    iget-wide v7, v1, Lcom/itextpdf/kernel/geom/Point;->y:D

    invoke-virtual {v3, v4, v5, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    float-to-double v4, v15

    add-double v4, v49, v4

    iget v7, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v7, v7

    add-double v7, v47, v7

    invoke-virtual {v3, v4, v5, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    float-to-double v4, v2

    sub-double v7, v11, v4

    iget v4, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v4, v4

    add-double/2addr v4, v9

    invoke-virtual {v3, v7, v8, v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    goto :goto_3

    .line 531
    .end local v1    # "clipPoint":Lcom/itextpdf/kernel/geom/Point;
    .end local v22    # "y3":D
    .restart local v3    # "y3":D
    :cond_3
    move-object/from16 v6, p1

    move/from16 v2, p6

    move-wide/from16 v22, v3

    .end local v3    # "y3":D
    .restart local v22    # "y3":D
    float-to-double v3, v2

    sub-double v7, v11, v3

    iget v1, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v3, v1

    add-double/2addr v3, v9

    invoke-virtual {v6, v7, v8, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    iget-wide v3, v13, Lcom/itextpdf/kernel/geom/Point;->x:D

    iget-wide v7, v13, Lcom/itextpdf/kernel/geom/Point;->y:D

    invoke-virtual {v1, v3, v4, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    iget-wide v3, v0, Lcom/itextpdf/kernel/geom/Point;->x:D

    iget-wide v7, v0, Lcom/itextpdf/kernel/geom/Point;->y:D

    invoke-virtual {v1, v3, v4, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    float-to-double v3, v15

    add-double v3, v49, v3

    iget v5, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v7, v5

    add-double v7, v47, v7

    invoke-virtual {v1, v3, v4, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    float-to-double v3, v2

    sub-double v7, v11, v3

    iget v3, v14, Lcom/itextpdf/layout/borders/Border;->width:F

    float-to-double v3, v3

    add-double/2addr v3, v9

    invoke-virtual {v1, v7, v8, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 533
    :goto_3
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->clip()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->endPath()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 535
    add-double v26, v11, v37

    .line 536
    .end local v11    # "x1":D
    .local v26, "x1":D
    add-double v7, v9, v30

    .line 538
    .end local v9    # "y1":D
    .local v7, "y1":D
    sub-double v33, v49, v43

    .line 539
    .end local v49    # "x2":D
    .local v33, "x2":D
    add-double v54, v47, v30

    .line 541
    .end local v47    # "y2":D
    .local v54, "y2":D
    sub-double v3, v24, v39

    add-double v5, v26, v37

    .line 542
    const-wide v9, 0x4066800000000000L    # 180.0

    const-wide v11, -0x3fa9800000000000L    # -90.0

    move-object/from16 v35, v0

    move-wide/from16 v1, v45

    move-object/from16 v0, p1

    .end local v0    # "clipPoint2":Lcom/itextpdf/kernel/geom/Point;
    .end local v45    # "x0":D
    .local v1, "x0":D
    .local v35, "clipPoint2":Lcom/itextpdf/kernel/geom/Point;
    invoke-virtual/range {v0 .. v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->arc(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v51

    .end local v1    # "x0":D
    .restart local v45    # "x0":D
    sub-double v52, v33, v43

    sub-double v58, v22, v41

    .line 545
    const-wide v60, 0x4056800000000000L    # 90.0

    const-wide v62, -0x3fa9800000000000L    # -90.0

    invoke-virtual/range {v51 .. v63}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->arcContinuous(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 548
    move-wide v9, v7

    move-wide/from16 v7, v26

    move-wide/from16 v11, v33

    move-wide/from16 v1, v54

    .line 660
    .end local v13    # "clipPoint1":Lcom/itextpdf/kernel/geom/Point;
    .end local v26    # "x1":D
    .end local v33    # "x2":D
    .end local v35    # "clipPoint2":Lcom/itextpdf/kernel/geom/Point;
    .end local v37    # "innerRadiusBefore":D
    .end local v39    # "innerRadiusFirst":D
    .end local v41    # "innerRadiusSecond":D
    .end local v43    # "innerRadiusAfter":D
    .end local v54    # "y2":D
    .local v1, "y2":D
    .local v7, "x1":D
    .restart local v9    # "y1":D
    .local v11, "x2":D
    :goto_4
    nop

    .line 661
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->stroke()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 662
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 663
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "anObject"    # Ljava/lang/Object;

    .line 345
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    .line 346
    return v0

    .line 348
    :cond_0
    instance-of v1, p1, Lcom/itextpdf/layout/borders/Border;

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    .line 349
    move-object v1, p1

    check-cast v1, Lcom/itextpdf/layout/borders/Border;

    .line 350
    .local v1, "anotherBorder":Lcom/itextpdf/layout/borders/Border;
    invoke-virtual {v1}, Lcom/itextpdf/layout/borders/Border;->getType()I

    move-result v3

    invoke-virtual {p0}, Lcom/itextpdf/layout/borders/Border;->getType()I

    move-result v4

    if-ne v3, v4, :cond_2

    .line 351
    invoke-virtual {v1}, Lcom/itextpdf/layout/borders/Border;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v3

    invoke-virtual {p0}, Lcom/itextpdf/layout/borders/Border;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/colors/Color;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 352
    invoke-virtual {v1}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v3

    invoke-virtual {p0}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v4

    cmpl-float v3, v3, v4

    if-nez v3, :cond_2

    iget-object v3, v1, Lcom/itextpdf/layout/borders/Border;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    .line 353
    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/TransparentColor;->getOpacity()F

    move-result v3

    iget-object v4, p0, Lcom/itextpdf/layout/borders/Border;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-virtual {v4}, Lcom/itextpdf/layout/properties/TransparentColor;->getOpacity()F

    move-result v4

    cmpl-float v3, v3, v4

    if-eqz v3, :cond_1

    goto :goto_0

    .line 356
    .end local v1    # "anotherBorder":Lcom/itextpdf/layout/borders/Border;
    :cond_1
    nop

    .line 359
    return v0

    .line 354
    .restart local v1    # "anotherBorder":Lcom/itextpdf/layout/borders/Border;
    :cond_2
    :goto_0
    return v2

    .line 357
    .end local v1    # "anotherBorder":Lcom/itextpdf/layout/borders/Border;
    :cond_3
    return v2
.end method

.method protected getBorderSide(FFFFLcom/itextpdf/layout/borders/Border$Side;)Lcom/itextpdf/layout/borders/Border$Side;
    .locals 9
    .param p1, "x1"    # F
    .param p2, "y1"    # F
    .param p3, "x2"    # F
    .param p4, "y2"    # F
    .param p5, "defaultSide"    # Lcom/itextpdf/layout/borders/Border$Side;

    .line 391
    const/4 v0, 0x0

    .line 392
    .local v0, "isLeft":Z
    const/4 v1, 0x0

    .line 393
    .local v1, "isRight":Z
    sub-float v2, p4, p2

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    const v3, 0x3a03126f    # 5.0E-4f

    cmpl-float v2, v2, v3

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    if-lez v2, :cond_2

    .line 394
    sub-float v2, p4, p2

    cmpl-float v2, v2, v6

    if-lez v2, :cond_0

    move v2, v4

    goto :goto_0

    :cond_0
    move v2, v5

    :goto_0
    move v0, v2

    .line 395
    sub-float v2, p4, p2

    cmpg-float v2, v2, v6

    if-gez v2, :cond_1

    move v2, v4

    goto :goto_1

    :cond_1
    move v2, v5

    :goto_1
    move v1, v2

    .line 398
    :cond_2
    const/4 v2, 0x0

    .line 399
    .local v2, "isTop":Z
    const/4 v7, 0x0

    .line 400
    .local v7, "isBottom":Z
    sub-float v8, p3, p1

    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    move-result v8

    cmpl-float v3, v8, v3

    if-lez v3, :cond_5

    .line 401
    sub-float v3, p3, p1

    cmpl-float v3, v3, v6

    if-lez v3, :cond_3

    move v3, v4

    goto :goto_2

    :cond_3
    move v3, v5

    :goto_2
    move v2, v3

    .line 402
    sub-float v3, p3, p1

    cmpg-float v3, v3, v6

    if-gez v3, :cond_4

    goto :goto_3

    :cond_4
    move v4, v5

    :goto_3
    move v7, v4

    .line 405
    :cond_5
    if-eqz v2, :cond_7

    .line 406
    if-eqz v0, :cond_6

    sget-object v3, Lcom/itextpdf/layout/borders/Border$Side;->LEFT:Lcom/itextpdf/layout/borders/Border$Side;

    goto :goto_4

    :cond_6
    sget-object v3, Lcom/itextpdf/layout/borders/Border$Side;->TOP:Lcom/itextpdf/layout/borders/Border$Side;

    :goto_4
    return-object v3

    .line 407
    :cond_7
    if-eqz v1, :cond_8

    .line 408
    sget-object v3, Lcom/itextpdf/layout/borders/Border$Side;->RIGHT:Lcom/itextpdf/layout/borders/Border$Side;

    return-object v3

    .line 409
    :cond_8
    if-eqz v7, :cond_9

    .line 410
    sget-object v3, Lcom/itextpdf/layout/borders/Border$Side;->BOTTOM:Lcom/itextpdf/layout/borders/Border$Side;

    return-object v3

    .line 411
    :cond_9
    if-eqz v0, :cond_a

    .line 412
    sget-object v3, Lcom/itextpdf/layout/borders/Border$Side;->LEFT:Lcom/itextpdf/layout/borders/Border$Side;

    return-object v3

    .line 415
    :cond_a
    return-object p5
.end method

.method public getColor()Lcom/itextpdf/kernel/colors/Color;
    .locals 1

    .line 300
    iget-object v0, p0, Lcom/itextpdf/layout/borders/Border;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/TransparentColor;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v0

    return-object v0
.end method

.method protected getDotsGap(DF)F
    .locals 4
    .param p1, "distance"    # D
    .param p3, "initialGap"    # F

    .line 455
    float-to-double v0, p3

    div-double v0, p1, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    .line 456
    .local v0, "gapsNum":D
    const-wide/16 v2, 0x0

    cmpl-double v2, v0, v2

    if-nez v2, :cond_0

    .line 457
    return p3

    .line 459
    :cond_0
    div-double v2, p1, v0

    double-to-float v2, v2

    return v2
.end method

.method protected getIntersectionPoint(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;
    .locals 21
    .param p1, "lineBeg"    # Lcom/itextpdf/kernel/geom/Point;
    .param p2, "lineEnd"    # Lcom/itextpdf/kernel/geom/Point;
    .param p3, "clipLineBeg"    # Lcom/itextpdf/kernel/geom/Point;
    .param p4, "clipLineEnd"    # Lcom/itextpdf/kernel/geom/Point;

    .line 437
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v0

    invoke-virtual/range {p2 .. p2}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v2

    sub-double/2addr v0, v2

    .local v0, "A1":D
    invoke-virtual/range {p3 .. p3}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v2

    invoke-virtual/range {p4 .. p4}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v4

    sub-double/2addr v2, v4

    .line 438
    .local v2, "A2":D
    invoke-virtual/range {p2 .. p2}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v4

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v6

    sub-double/2addr v4, v6

    .local v4, "B1":D
    invoke-virtual/range {p4 .. p4}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v6

    invoke-virtual/range {p3 .. p3}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v8

    sub-double/2addr v6, v8

    .line 439
    .local v6, "B2":D
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v8

    invoke-virtual/range {p2 .. p2}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v10

    mul-double/2addr v8, v10

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v10

    invoke-virtual/range {p2 .. p2}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v12

    mul-double/2addr v10, v12

    sub-double/2addr v8, v10

    .line 440
    .local v8, "C1":D
    invoke-virtual/range {p3 .. p3}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v10

    invoke-virtual/range {p4 .. p4}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v12

    mul-double/2addr v10, v12

    invoke-virtual/range {p3 .. p3}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v12

    invoke-virtual/range {p4 .. p4}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v14

    mul-double/2addr v12, v14

    sub-double/2addr v10, v12

    .line 442
    .local v10, "C2":D
    mul-double v12, v4, v2

    mul-double v14, v6, v0

    sub-double/2addr v12, v14

    .line 444
    .local v12, "M":D
    new-instance v14, Lcom/itextpdf/kernel/geom/Point;

    mul-double v15, v6, v8

    mul-double v17, v4, v10

    sub-double v15, v15, v17

    move-wide/from16 v17, v0

    .end local v0    # "A1":D
    .local v17, "A1":D
    div-double v0, v15, v12

    mul-double v15, v10, v17

    mul-double v19, v8, v2

    sub-double v15, v15, v19

    move-wide/from16 v19, v2

    .end local v2    # "A2":D
    .local v19, "A2":D
    div-double v2, v15, v12

    invoke-direct {v14, v0, v1, v2, v3}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    return-object v14
.end method

.method public getOpacity()F
    .locals 1

    .line 309
    iget-object v0, p0, Lcom/itextpdf/layout/borders/Border;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/TransparentColor;->getOpacity()F

    move-result v0

    return v0
.end method

.method protected getStartingPointsForBorderSide(FFFFLcom/itextpdf/layout/borders/Border$Side;)[F
    .locals 4
    .param p1, "x1"    # F
    .param p2, "y1"    # F
    .param p3, "x2"    # F
    .param p4, "y2"    # F
    .param p5, "defaultSide"    # Lcom/itextpdf/layout/borders/Border$Side;

    .line 676
    iget v0, p0, Lcom/itextpdf/layout/borders/Border;->width:F

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    .line 678
    .local v0, "widthHalf":F
    invoke-virtual/range {p0 .. p5}, Lcom/itextpdf/layout/borders/Border;->getBorderSide(FFFFLcom/itextpdf/layout/borders/Border$Side;)Lcom/itextpdf/layout/borders/Border$Side;

    move-result-object v1

    .line 679
    .local v1, "borderSide":Lcom/itextpdf/layout/borders/Border$Side;
    sget-object v2, Lcom/itextpdf/layout/borders/Border$1;->$SwitchMap$com$itextpdf$layout$borders$Border$Side:[I

    invoke-virtual {v1}, Lcom/itextpdf/layout/borders/Border$Side;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    goto :goto_0

    .line 693
    :pswitch_0
    sub-float/2addr p1, v0

    .line 694
    sub-float/2addr p3, v0

    .line 695
    goto :goto_0

    .line 689
    :pswitch_1
    sub-float/2addr p2, v0

    .line 690
    sub-float/2addr p4, v0

    .line 691
    goto :goto_0

    .line 685
    :pswitch_2
    add-float/2addr p1, v0

    .line 686
    add-float/2addr p3, v0

    .line 687
    goto :goto_0

    .line 681
    :pswitch_3
    add-float/2addr p2, v0

    .line 682
    add-float/2addr p4, v0

    .line 683
    nop

    .line 699
    :goto_0
    const/4 v2, 0x4

    new-array v2, v2, [F

    const/4 v3, 0x0

    aput p1, v2, v3

    const/4 v3, 0x1

    aput p2, v2, v3

    const/4 v3, 0x2

    aput p3, v2, v3

    const/4 v3, 0x3

    aput p4, v2, v3

    return-object v2

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public abstract getType()I
.end method

.method public getWidth()F
    .locals 1

    .line 318
    iget v0, p0, Lcom/itextpdf/layout/borders/Border;->width:F

    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 367
    iget v0, p0, Lcom/itextpdf/layout/borders/Border;->hash:I

    .line 369
    .local v0, "h":I
    if-nez v0, :cond_0

    .line 370
    invoke-virtual {p0}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v1

    float-to-int v1, v1

    mul-int/lit8 v1, v1, 0x1f

    invoke-virtual {p0}, Lcom/itextpdf/layout/borders/Border;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/colors/Color;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    .line 371
    .end local v0    # "h":I
    .local v1, "h":I
    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lcom/itextpdf/layout/borders/Border;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/TransparentColor;->getOpacity()F

    move-result v2

    float-to-int v2, v2

    add-int/2addr v0, v2

    .line 372
    .end local v1    # "h":I
    .restart local v0    # "h":I
    iput v0, p0, Lcom/itextpdf/layout/borders/Border;->hash:I

    .line 375
    :cond_0
    return v0
.end method

.method public setColor(Lcom/itextpdf/kernel/colors/Color;)V
    .locals 2
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/Color;

    .line 327
    new-instance v0, Lcom/itextpdf/layout/properties/TransparentColor;

    iget-object v1, p0, Lcom/itextpdf/layout/borders/Border;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/TransparentColor;->getOpacity()F

    move-result v1

    invoke-direct {v0, p1, v1}, Lcom/itextpdf/layout/properties/TransparentColor;-><init>(Lcom/itextpdf/kernel/colors/Color;F)V

    iput-object v0, p0, Lcom/itextpdf/layout/borders/Border;->transparentColor:Lcom/itextpdf/layout/properties/TransparentColor;

    .line 328
    return-void
.end method

.method public setWidth(F)V
    .locals 0
    .param p1, "width"    # F

    .line 336
    iput p1, p0, Lcom/itextpdf/layout/borders/Border;->width:F

    .line 337
    return-void
.end method
