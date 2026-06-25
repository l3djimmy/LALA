.class public Lcom/itextpdf/kernel/geom/Rectangle;
.super Ljava/lang/Object;
.source "Rectangle.java"

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field static EPS:F


# instance fields
.field protected height:F

.field protected width:F

.field protected x:F

.field protected y:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 40
    const v0, 0x38d1b717    # 1.0E-4f

    sput v0, Lcom/itextpdf/kernel/geom/Rectangle;->EPS:F

    return-void
.end method

.method public constructor <init>(FF)V
    .locals 1
    .param p1, "width"    # F
    .param p2, "height"    # F

    .line 70
    const/4 v0, 0x0

    invoke-direct {p0, v0, v0, p1, p2}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    .line 71
    return-void
.end method

.method public constructor <init>(FFFF)V
    .locals 0
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "width"    # F
    .param p4, "height"    # F

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput p1, p0, Lcom/itextpdf/kernel/geom/Rectangle;->x:F

    .line 58
    iput p2, p0, Lcom/itextpdf/kernel/geom/Rectangle;->y:F

    .line 59
    iput p3, p0, Lcom/itextpdf/kernel/geom/Rectangle;->width:F

    .line 60
    iput p4, p0, Lcom/itextpdf/kernel/geom/Rectangle;->height:F

    .line 61
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 4
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 79
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v3

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    .line 80
    return-void
.end method

.method public static calculateBBox(Ljava/util/List;)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Point;",
            ">;)",
            "Lcom/itextpdf/kernel/geom/Rectangle;"
        }
    .end annotation

    .line 151
    .local p0, "points":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Point;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 152
    .local v0, "xs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 153
    .local v1, "ys":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    invoke-interface/range {p0 .. p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/geom/Point;

    .line 154
    .local v3, "point":Lcom/itextpdf/kernel/geom/Point;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 155
    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 156
    .end local v3    # "point":Lcom/itextpdf/kernel/geom/Point;
    goto :goto_0

    .line 158
    :cond_0
    invoke-static {v0}, Ljava/util/Collections;->min(Ljava/util/Collection;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    .line 159
    .local v2, "left":D
    invoke-static {v1}, Ljava/util/Collections;->min(Ljava/util/Collection;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Double;

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    .line 160
    .local v4, "bottom":D
    invoke-static {v0}, Ljava/util/Collections;->max(Ljava/util/Collection;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Double;

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    .line 161
    .local v6, "right":D
    invoke-static {v1}, Ljava/util/Collections;->max(Ljava/util/Collection;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Double;

    invoke-virtual {v8}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v8

    .line 163
    .local v8, "top":D
    new-instance v10, Lcom/itextpdf/kernel/geom/Rectangle;

    double-to-float v11, v2

    double-to-float v12, v4

    sub-double v13, v6, v2

    double-to-float v13, v13

    sub-double v14, v8, v4

    double-to-float v14, v14

    invoke-direct {v10, v11, v12, v13, v14}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    return-object v10
.end method

.method public static createBoundingRectangleFromQuadPoint(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 9
    .param p0, "quadPoints"    # Lcom/itextpdf/kernel/pdf/PdfArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/exceptions/PdfException;
        }
    .end annotation

    .line 687
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v0

    const/16 v1, 0x8

    rem-int/2addr v0, v1

    if-nez v0, :cond_5

    .line 690
    const v0, 0x7f7fffff    # Float.MAX_VALUE

    .line 691
    .local v0, "llx":F
    const v2, 0x7f7fffff    # Float.MAX_VALUE

    .line 692
    .local v2, "lly":F
    const v3, -0x800001

    .line 693
    .local v3, "urx":F
    const v4, -0x800001

    .line 696
    .local v4, "ury":F
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_0
    if-ge v5, v1, :cond_4

    .line 697
    invoke-virtual {p0, v5}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v6

    .line 698
    .local v6, "x":F
    add-int/lit8 v7, v5, 0x1

    invoke-virtual {p0, v7}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v7

    .line 700
    .local v7, "y":F
    cmpg-float v8, v6, v0

    if-gez v8, :cond_0

    move v0, v6

    .line 701
    :cond_0
    cmpl-float v8, v6, v3

    if-lez v8, :cond_1

    move v3, v6

    .line 702
    :cond_1
    cmpg-float v8, v7, v2

    if-gez v8, :cond_2

    move v2, v7

    .line 703
    :cond_2
    cmpl-float v8, v7, v4

    if-lez v8, :cond_3

    move v4, v7

    .line 696
    .end local v6    # "x":F
    .end local v7    # "y":F
    :cond_3
    add-int/lit8 v5, v5, 0x2

    goto :goto_0

    .line 705
    .end local v5    # "j":I
    :cond_4
    new-instance v1, Lcom/itextpdf/kernel/geom/Rectangle;

    sub-float v5, v3, v0

    sub-float v6, v4, v2

    invoke-direct {v1, v0, v2, v5, v6}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    return-object v1

    .line 688
    .end local v0    # "llx":F
    .end local v2    # "lly":F
    .end local v3    # "urx":F
    .end local v4    # "ury":F
    :cond_5
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "The QuadPoint Array length is not a multiple of 8."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static createBoundingRectanglesFromQuadPoint(Lcom/itextpdf/kernel/pdf/PdfArray;)Ljava/util/List;
    .locals 5
    .param p0, "quadPoints"    # Lcom/itextpdf/kernel/pdf/PdfArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfArray;",
            ")",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/exceptions/PdfException;
        }
    .end annotation

    .line 666
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 667
    .local v0, "boundingRectangles":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v1

    rem-int/lit8 v1, v1, 0x8

    if-nez v1, :cond_1

    .line 670
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 671
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfArray;->toFloatArray()[F

    move-result-object v2

    add-int/lit8 v3, v1, 0x8

    invoke-static {v2, v1, v3}, Ljava/util/Arrays;->copyOfRange([FII)[F

    move-result-object v2

    .line 672
    .local v2, "quadPointEntry":[F
    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([F)V

    .line 673
    .local v3, "quadPointEntryFA":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-static {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->createBoundingRectangleFromQuadPoint(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 670
    .end local v2    # "quadPointEntry":[F
    .end local v3    # "quadPointEntryFA":Lcom/itextpdf/kernel/pdf/PdfArray;
    add-int/lit8 v1, v1, 0x8

    goto :goto_0

    .line 675
    .end local v1    # "i":I
    :cond_0
    return-object v0

    .line 668
    :cond_1
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "The QuadPoint Array length is not a multiple of 8."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static varargs getCommonRectangle([Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 10
    .param p0, "rectangles"    # [Lcom/itextpdf/kernel/geom/Rectangle;

    .line 89
    const v0, -0x800001

    .line 90
    .local v0, "ury":F
    const v1, 0x7f7fffff    # Float.MAX_VALUE

    .line 91
    .local v1, "llx":F
    const v2, 0x7f7fffff    # Float.MAX_VALUE

    .line 92
    .local v2, "lly":F
    const v3, -0x800001

    .line 93
    .local v3, "urx":F
    array-length v4, p0

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_5

    aget-object v6, p0, v5

    .line 94
    .local v6, "rectangle":Lcom/itextpdf/kernel/geom/Rectangle;
    if-nez v6, :cond_0

    .line 95
    goto :goto_1

    .line 96
    :cond_0
    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v7

    .line 97
    .local v7, "rec":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v8

    cmpg-float v8, v8, v2

    if-gez v8, :cond_1

    .line 98
    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v2

    .line 99
    :cond_1
    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v8

    cmpg-float v8, v8, v1

    if-gez v8, :cond_2

    .line 100
    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v1

    .line 101
    :cond_2
    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v8

    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v9

    add-float/2addr v8, v9

    cmpl-float v8, v8, v0

    if-lez v8, :cond_3

    .line 102
    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v8

    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v9

    add-float v0, v8, v9

    .line 103
    :cond_3
    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v8

    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v9

    add-float/2addr v8, v9

    cmpl-float v8, v8, v3

    if-lez v8, :cond_4

    .line 104
    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v8

    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v9

    add-float/2addr v8, v9

    move v3, v8

    .line 93
    .end local v6    # "rectangle":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v7    # "rec":Lcom/itextpdf/kernel/geom/Rectangle;
    :cond_4
    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 107
    :cond_5
    new-instance v4, Lcom/itextpdf/kernel/geom/Rectangle;

    sub-float v5, v3, v1

    sub-float v6, v0, v2

    invoke-direct {v4, v1, v2, v5, v6}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    return-object v4
.end method

.method public static getRectangleOnRotatedPage(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 8
    .param p0, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p1, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 121
    move-object v0, p0

    .line 122
    .local v0, "resultRect":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getRotation()I

    move-result v1

    .line 123
    .local v1, "rotation":I
    if-eqz v1, :cond_0

    .line 124
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPageSize()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    .line 125
    .local v2, "pageSize":Lcom/itextpdf/kernel/geom/Rectangle;
    div-int/lit8 v3, v1, 0x5a

    rem-int/lit8 v3, v3, 0x4

    packed-switch v3, :pswitch_data_0

    goto :goto_0

    .line 133
    :pswitch_0
    new-instance v3, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v4

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v5

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v6

    sub-float/2addr v5, v6

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v6

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v7

    invoke-direct {v3, v4, v5, v6, v7}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    move-object v0, v3

    .line 134
    goto :goto_0

    .line 130
    :pswitch_1
    new-instance v3, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v4

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v5

    sub-float/2addr v4, v5

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v5

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v6

    sub-float/2addr v5, v6

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v6

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v7

    invoke-direct {v3, v4, v5, v6, v7}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    move-object v0, v3

    .line 131
    goto :goto_0

    .line 127
    :pswitch_2
    new-instance v3, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v4

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v5

    sub-float/2addr v4, v5

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v5

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v6

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v7

    invoke-direct {v3, v4, v5, v6, v7}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    move-object v0, v3

    .line 128
    nop

    .line 140
    .end local v2    # "pageSize":Lcom/itextpdf/kernel/geom/Rectangle;
    :cond_0
    :goto_0
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static linesIntersect(DDDDDDDD)Z
    .locals 25
    .param p0, "x1"    # D
    .param p2, "y1"    # D
    .param p4, "x2"    # D
    .param p6, "y2"    # D
    .param p8, "x3"    # D
    .param p10, "y3"    # D
    .param p12, "x4"    # D
    .param p14, "y4"    # D

    .line 625
    sub-double v0, p4, p0

    .line 626
    .end local p4    # "x2":D
    .local v0, "x2":D
    sub-double v2, p6, p2

    .line 628
    .end local p6    # "y2":D
    .local v2, "y2":D
    sub-double v4, p8, p0

    .line 629
    .end local p8    # "x3":D
    .local v4, "x3":D
    sub-double v6, p10, p2

    .line 631
    .end local p10    # "y3":D
    .local v6, "y3":D
    sub-double v8, p12, p0

    .line 632
    .end local p12    # "x4":D
    .local v8, "x4":D
    sub-double v10, p14, p2

    .line 634
    .end local p14    # "y4":D
    .local v10, "y4":D
    mul-double v12, v0, v6

    mul-double v14, v4, v2

    sub-double/2addr v12, v14

    .line 635
    .local v12, "AvB":D
    mul-double v14, v0, v10

    mul-double v16, v8, v2

    sub-double v14, v14, v16

    .line 638
    .local v14, "AvC":D
    const-wide/16 v16, 0x0

    cmpl-double v18, v12, v16

    const/16 v19, 0x1

    const/16 v20, 0x0

    if-nez v18, :cond_8

    cmpl-double v18, v14, v16

    if-nez v18, :cond_8

    .line 639
    cmpl-double v18, v0, v16

    if-eqz v18, :cond_3

    .line 640
    mul-double v21, v8, v4

    cmpg-double v18, v21, v16

    if-lez v18, :cond_2

    mul-double v21, v4, v0

    cmpl-double v18, v21, v16

    if-ltz v18, :cond_1

    cmpl-double v16, v0, v16

    if-lez v16, :cond_0

    cmpg-double v16, v4, v0

    if-lez v16, :cond_2

    cmpg-double v16, v8, v0

    if-gtz v16, :cond_1

    goto :goto_0

    :cond_0
    cmpl-double v16, v4, v0

    if-gez v16, :cond_2

    cmpl-double v16, v8, v0

    if-ltz v16, :cond_1

    goto :goto_0

    :cond_1
    move/from16 v19, v20

    :cond_2
    :goto_0
    return v19

    .line 645
    :cond_3
    cmpl-double v18, v2, v16

    if-eqz v18, :cond_7

    .line 646
    mul-double v21, v10, v6

    cmpg-double v18, v21, v16

    if-lez v18, :cond_6

    mul-double v21, v6, v2

    cmpl-double v18, v21, v16

    if-ltz v18, :cond_5

    cmpl-double v16, v2, v16

    if-lez v16, :cond_4

    cmpg-double v16, v6, v2

    if-lez v16, :cond_6

    cmpg-double v16, v10, v2

    if-gtz v16, :cond_5

    goto :goto_1

    :cond_4
    cmpl-double v16, v6, v2

    if-gez v16, :cond_6

    cmpl-double v16, v10, v2

    if-ltz v16, :cond_5

    goto :goto_1

    :cond_5
    move/from16 v19, v20

    :cond_6
    :goto_1
    return v19

    .line 651
    :cond_7
    return v20

    .line 654
    :cond_8
    mul-double v21, v4, v10

    mul-double v23, v8, v6

    sub-double v21, v21, v23

    .line 656
    .local v21, "BvC":D
    mul-double v23, v12, v14

    cmpg-double v18, v23, v16

    if-gtz v18, :cond_9

    add-double v23, v12, v21

    sub-double v23, v23, v14

    mul-double v23, v23, v21

    cmpg-double v16, v23, v16

    if-gtz v16, :cond_9

    goto :goto_2

    :cond_9
    move/from16 v19, v20

    :goto_2
    return v19
.end method


# virtual methods
.method public applyMargins(FFFFZ)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 5
    .param p1, "topIndent"    # F
    .param p2, "rightIndent"    # F
    .param p3, "bottomIndent"    # F
    .param p4, "leftIndent"    # F
    .param p5, "reverse"    # Z

    .line 530
    iget v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->x:F

    const/4 v1, -0x1

    const/4 v2, 0x1

    if-eqz p5, :cond_0

    move v3, v1

    goto :goto_0

    :cond_0
    move v3, v2

    :goto_0
    int-to-float v3, v3

    mul-float/2addr v3, p4

    add-float/2addr v0, v3

    iput v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->x:F

    .line 531
    iget v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->width:F

    add-float v3, p4, p2

    if-eqz p5, :cond_1

    move v4, v1

    goto :goto_1

    :cond_1
    move v4, v2

    :goto_1
    int-to-float v4, v4

    mul-float/2addr v3, v4

    sub-float/2addr v0, v3

    iput v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->width:F

    .line 532
    iget v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->y:F

    if-eqz p5, :cond_2

    move v3, v1

    goto :goto_2

    :cond_2
    move v3, v2

    :goto_2
    int-to-float v3, v3

    mul-float/2addr v3, p3

    add-float/2addr v0, v3

    iput v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->y:F

    .line 533
    iget v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->height:F

    add-float v3, p1, p3

    if-eqz p5, :cond_3

    goto :goto_3

    :cond_3
    move v1, v2

    :goto_3
    int-to-float v1, v1

    mul-float/2addr v3, v1

    sub-float/2addr v0, v3

    iput v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->height:F

    .line 534
    return-object p0
.end method

.method public clone()Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 2

    .line 580
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/geom/Rectangle;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 581
    :catch_0
    move-exception v0

    .line 583
    .local v0, "e":Ljava/lang/CloneNotSupportedException;
    const/4 v1, 0x0

    return-object v1
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 38
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    return-object v0
.end method

.method public contains(Lcom/itextpdf/kernel/geom/Rectangle;)Z
    .locals 9
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 224
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v0

    .line 225
    .local v0, "llx":F
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v1

    .line 226
    .local v1, "lly":F
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    add-float/2addr v2, v0

    .line 227
    .local v2, "urx":F
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v3

    add-float/2addr v3, v1

    .line 229
    .local v3, "ury":F
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v4

    .line 230
    .local v4, "rllx":F
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v5

    .line 231
    .local v5, "rlly":F
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v6

    add-float/2addr v6, v4

    .line 232
    .local v6, "rurx":F
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v7

    add-float/2addr v7, v5

    .line 234
    .local v7, "rury":F
    sget v8, Lcom/itextpdf/kernel/geom/Rectangle;->EPS:F

    sub-float v8, v0, v8

    cmpg-float v8, v8, v4

    if-gtz v8, :cond_0

    sget v8, Lcom/itextpdf/kernel/geom/Rectangle;->EPS:F

    sub-float v8, v1, v8

    cmpg-float v8, v8, v5

    if-gtz v8, :cond_0

    sget v8, Lcom/itextpdf/kernel/geom/Rectangle;->EPS:F

    add-float/2addr v8, v2

    cmpg-float v8, v6, v8

    if-gtz v8, :cond_0

    sget v8, Lcom/itextpdf/kernel/geom/Rectangle;->EPS:F

    add-float/2addr v8, v3

    cmpg-float v8, v7, v8

    if-gtz v8, :cond_0

    const/4 v8, 0x1

    goto :goto_0

    :cond_0
    const/4 v8, 0x0

    :goto_0
    return v8
.end method

.method public decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 1
    .param p1, "extra"    # F

    .line 412
    iget v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->height:F

    sub-float/2addr v0, p1

    iput v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->height:F

    .line 413
    return-object p0
.end method

.method public decreaseWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 1
    .param p1, "extra"    # F

    .line 434
    iget v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->width:F

    sub-float/2addr v0, p1

    iput v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->width:F

    .line 435
    return-object p0
.end method

.method public equalsWithEpsilon(Lcom/itextpdf/kernel/geom/Rectangle;)Z
    .locals 1
    .param p1, "that"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 594
    sget v0, Lcom/itextpdf/kernel/geom/Rectangle;->EPS:F

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->equalsWithEpsilon(Lcom/itextpdf/kernel/geom/Rectangle;F)Z

    move-result v0

    return v0
.end method

.method public equalsWithEpsilon(Lcom/itextpdf/kernel/geom/Rectangle;F)Z
    .locals 5
    .param p1, "that"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "eps"    # F

    .line 605
    iget v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->x:F

    iget v1, p1, Lcom/itextpdf/kernel/geom/Rectangle;->x:F

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    .line 606
    .local v0, "dx":F
    iget v1, p0, Lcom/itextpdf/kernel/geom/Rectangle;->y:F

    iget v2, p1, Lcom/itextpdf/kernel/geom/Rectangle;->y:F

    sub-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    .line 607
    .local v1, "dy":F
    iget v2, p0, Lcom/itextpdf/kernel/geom/Rectangle;->width:F

    iget v3, p1, Lcom/itextpdf/kernel/geom/Rectangle;->width:F

    sub-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    .line 608
    .local v2, "dw":F
    iget v3, p0, Lcom/itextpdf/kernel/geom/Rectangle;->height:F

    iget v4, p1, Lcom/itextpdf/kernel/geom/Rectangle;->height:F

    sub-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    .line 609
    .local v3, "dh":F
    cmpg-float v4, v0, p2

    if-gez v4, :cond_0

    cmpg-float v4, v1, p2

    if-gez v4, :cond_0

    cmpg-float v4, v2, p2

    if-gez v4, :cond_0

    cmpg-float v4, v3, p2

    if-gez v4, :cond_0

    const/4 v4, 0x1

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    :goto_0
    return v4
.end method

.method public getBottom()F
    .locals 1

    .line 471
    iget v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->y:F

    return v0
.end method

.method public getHeight()F
    .locals 1

    .line 380
    iget v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->height:F

    return v0
.end method

.method public getIntersection(Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 9
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 186
    const/4 v0, 0x0

    .line 189
    .local v0, "result":Lcom/itextpdf/kernel/geom/Rectangle;
    iget v1, p0, Lcom/itextpdf/kernel/geom/Rectangle;->x:F

    iget v2, p1, Lcom/itextpdf/kernel/geom/Rectangle;->x:F

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    .line 190
    .local v1, "llx":F
    iget v2, p0, Lcom/itextpdf/kernel/geom/Rectangle;->y:F

    iget v3, p1, Lcom/itextpdf/kernel/geom/Rectangle;->y:F

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v2

    .line 191
    .local v2, "lly":F
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v3

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    .line 192
    .local v3, "urx":F
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v4

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(FF)F

    move-result v4

    .line 195
    .local v4, "ury":F
    sub-float v5, v3, v1

    .line 196
    .local v5, "width":F
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v6

    sget v7, Lcom/itextpdf/kernel/geom/Rectangle;->EPS:F

    cmpg-float v6, v6, v7

    if-gez v6, :cond_0

    .line 197
    const/4 v5, 0x0

    .line 200
    :cond_0
    sub-float v6, v4, v2

    .line 201
    .local v6, "height":F
    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v7

    sget v8, Lcom/itextpdf/kernel/geom/Rectangle;->EPS:F

    cmpg-float v7, v7, v8

    if-gez v7, :cond_1

    .line 202
    const/4 v6, 0x0

    .line 205
    :cond_1
    const/4 v7, 0x0

    invoke-static {v5, v7}, Ljava/lang/Float;->compare(FF)I

    move-result v8

    if-ltz v8, :cond_4

    .line 206
    invoke-static {v6, v7}, Ljava/lang/Float;->compare(FF)I

    move-result v8

    if-ltz v8, :cond_4

    .line 207
    invoke-static {v5, v7}, Ljava/lang/Float;->compare(FF)I

    move-result v8

    if-gez v8, :cond_2

    const/4 v5, 0x0

    .line 208
    :cond_2
    invoke-static {v6, v7}, Ljava/lang/Float;->compare(FF)I

    move-result v7

    if-gez v7, :cond_3

    const/4 v6, 0x0

    .line 209
    :cond_3
    new-instance v7, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-direct {v7, v1, v2, v5, v6}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    move-object v0, v7

    .line 212
    :cond_4
    return-object v0
.end method

.method public getLeft()F
    .locals 1

    .line 444
    iget v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->x:F

    return v0
.end method

.method public getRight()F
    .locals 2

    .line 453
    iget v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->x:F

    iget v1, p0, Lcom/itextpdf/kernel/geom/Rectangle;->width:F

    add-float/2addr v0, v1

    return v0
.end method

.method public getTop()F
    .locals 2

    .line 462
    iget v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->y:F

    iget v1, p0, Lcom/itextpdf/kernel/geom/Rectangle;->height:F

    add-float/2addr v0, v1

    return v0
.end method

.method public getWidth()F
    .locals 1

    .line 360
    iget v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->width:F

    return v0
.end method

.method public getX()F
    .locals 1

    .line 320
    iget v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->x:F

    return v0
.end method

.method public getY()F
    .locals 1

    .line 340
    iget v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->y:F

    return v0
.end method

.method public increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 1
    .param p1, "extra"    # F

    .line 401
    iget v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->height:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->height:F

    .line 402
    return-object p0
.end method

.method public increaseWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 1
    .param p1, "extra"    # F

    .line 423
    iget v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->width:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->width:F

    .line 424
    return-object p0
.end method

.method public intersectsLine(FFFF)Z
    .locals 23
    .param p1, "x1"    # F
    .param p2, "y1"    # F
    .param p3, "x2"    # F
    .param p4, "y2"    # F

    .line 547
    move/from16 v0, p1

    move/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    invoke-virtual/range {p0 .. p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v4

    float-to-double v5, v4

    .line 548
    .local v5, "rx1":D
    invoke-virtual/range {p0 .. p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v4

    float-to-double v7, v4

    .line 549
    .local v7, "ry1":D
    invoke-virtual/range {p0 .. p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v4

    float-to-double v9, v4

    add-double/2addr v9, v5

    .line 550
    .local v9, "rx2":D
    invoke-virtual/range {p0 .. p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v4

    float-to-double v11, v4

    add-double/2addr v11, v7

    .line 551
    .local v11, "ry2":D
    float-to-double v13, v0

    cmpg-double v4, v5, v13

    if-gtz v4, :cond_1

    float-to-double v13, v0

    cmpg-double v4, v13, v9

    if-gtz v4, :cond_1

    float-to-double v13, v1

    cmpg-double v4, v7, v13

    if-gtz v4, :cond_1

    float-to-double v13, v1

    cmpg-double v4, v13, v11

    if-lez v4, :cond_0

    goto :goto_0

    :cond_0
    move-wide v15, v5

    move-wide v5, v9

    goto :goto_1

    :cond_1
    :goto_0
    float-to-double v13, v2

    cmpg-double v4, v5, v13

    if-gtz v4, :cond_2

    float-to-double v13, v2

    cmpg-double v4, v13, v9

    if-gtz v4, :cond_2

    float-to-double v13, v3

    cmpg-double v4, v7, v13

    if-gtz v4, :cond_2

    float-to-double v13, v3

    cmpg-double v4, v13, v11

    if-lez v4, :cond_0

    :cond_2
    float-to-double v13, v0

    move-wide v15, v5

    .end local v5    # "rx1":D
    .local v15, "rx1":D
    float-to-double v4, v1

    move-wide/from16 v17, v4

    float-to-double v4, v2

    move-wide/from16 v19, v4

    float-to-double v4, v3

    .line 554
    move-wide/from16 v21, v19

    move-wide/from16 v19, v4

    move-wide v5, v15

    move-wide/from16 v15, v17

    move-wide/from16 v17, v21

    .end local v15    # "rx1":D
    .restart local v5    # "rx1":D
    invoke-static/range {v5 .. v20}, Lcom/itextpdf/kernel/geom/Rectangle;->linesIntersect(DDDDDDDD)Z

    move-result v4

    move-wide v15, v5

    move-wide v5, v9

    .end local v9    # "rx2":D
    .local v5, "rx2":D
    .restart local v15    # "rx1":D
    if-nez v4, :cond_4

    float-to-double v13, v0

    float-to-double v9, v1

    float-to-double v0, v2

    move-wide/from16 v17, v0

    float-to-double v0, v3

    .line 555
    move-wide/from16 v19, v15

    move-wide v15, v9

    move-wide/from16 v9, v19

    move-wide/from16 v19, v0

    .end local v15    # "rx1":D
    .local v9, "rx1":D
    invoke-static/range {v5 .. v20}, Lcom/itextpdf/kernel/geom/Rectangle;->linesIntersect(DDDDDDDD)Z

    move-result v0

    move-wide v15, v9

    .end local v9    # "rx1":D
    .restart local v15    # "rx1":D
    if-eqz v0, :cond_3

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    goto :goto_2

    :cond_4
    :goto_1
    const/4 v0, 0x1

    .line 551
    :goto_2
    return v0
.end method

.method public moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 1
    .param p1, "move"    # F

    .line 481
    iget v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->y:F

    sub-float/2addr v0, p1

    iput v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->y:F

    .line 482
    return-object p0
.end method

.method public moveLeft(F)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 1
    .param p1, "move"    # F

    .line 515
    iget v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->x:F

    sub-float/2addr v0, p1

    iput v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->x:F

    .line 516
    return-object p0
.end method

.method public moveRight(F)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 1
    .param p1, "move"    # F

    .line 504
    iget v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->x:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->x:F

    .line 505
    return-object p0
.end method

.method public moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 1
    .param p1, "move"    # F

    .line 493
    iget v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->y:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->y:F

    .line 494
    return-object p0
.end method

.method public overlaps(Lcom/itextpdf/kernel/geom/Rectangle;)Z
    .locals 1
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 245
    sget v0, Lcom/itextpdf/kernel/geom/Rectangle;->EPS:F

    neg-float v0, v0

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->overlaps(Lcom/itextpdf/kernel/geom/Rectangle;F)Z

    move-result v0

    return v0
.end method

.method public overlaps(Lcom/itextpdf/kernel/geom/Rectangle;F)Z
    .locals 4
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "epsilon"    # F

    .line 261
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    add-float/2addr v0, v1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v1

    add-float/2addr v1, p2

    cmpg-float v0, v0, v1

    const/4 v1, 0x0

    if-gez v0, :cond_0

    .line 262
    return v1

    .line 265
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v0

    add-float/2addr v0, p2

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v2

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v3

    add-float/2addr v2, v3

    cmpl-float v0, v0, v2

    if-lez v0, :cond_1

    .line 266
    return v1

    .line 270
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v2

    add-float/2addr v0, v2

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v2

    add-float/2addr v2, p2

    cmpg-float v0, v0, v2

    if-gez v0, :cond_2

    .line 271
    return v1

    .line 274
    :cond_2
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v0

    add-float/2addr v0, p2

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v2

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v3

    add-float/2addr v2, v3

    cmpl-float v0, v0, v2

    if-lez v0, :cond_3

    .line 275
    return v1

    .line 278
    :cond_3
    const/4 v0, 0x1

    return v0
.end method

.method public setBbox(FFFF)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 1
    .param p1, "llx"    # F
    .param p2, "lly"    # F
    .param p3, "urx"    # F
    .param p4, "ury"    # F

    .line 296
    cmpl-float v0, p1, p3

    if-lez v0, :cond_0

    .line 297
    move v0, p1

    .line 298
    .local v0, "temp":F
    move p1, p3

    .line 299
    move p3, v0

    .line 302
    .end local v0    # "temp":F
    :cond_0
    cmpl-float v0, p2, p4

    if-lez v0, :cond_1

    .line 303
    move v0, p2

    .line 304
    .restart local v0    # "temp":F
    move p2, p4

    .line 305
    move p4, v0

    .line 307
    .end local v0    # "temp":F
    :cond_1
    iput p1, p0, Lcom/itextpdf/kernel/geom/Rectangle;->x:F

    .line 308
    iput p2, p0, Lcom/itextpdf/kernel/geom/Rectangle;->y:F

    .line 309
    sub-float v0, p3, p1

    iput v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->width:F

    .line 310
    sub-float v0, p4, p2

    iput v0, p0, Lcom/itextpdf/kernel/geom/Rectangle;->height:F

    .line 311
    return-object p0
.end method

.method public setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 0
    .param p1, "height"    # F

    .line 390
    iput p1, p0, Lcom/itextpdf/kernel/geom/Rectangle;->height:F

    .line 391
    return-object p0
.end method

.method public setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 0
    .param p1, "width"    # F

    .line 370
    iput p1, p0, Lcom/itextpdf/kernel/geom/Rectangle;->width:F

    .line 371
    return-object p0
.end method

.method public setX(F)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 0
    .param p1, "x"    # F

    .line 330
    iput p1, p0, Lcom/itextpdf/kernel/geom/Rectangle;->x:F

    .line 331
    return-object p0
.end method

.method public setY(F)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 0
    .param p1, "y"    # F

    .line 350
    iput p1, p0, Lcom/itextpdf/kernel/geom/Rectangle;->y:F

    .line 351
    return-object p0
.end method

.method public toPointsArray()[Lcom/itextpdf/kernel/geom/Point;
    .locals 6

    .line 172
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/itextpdf/kernel/geom/Point;

    new-instance v1, Lcom/itextpdf/kernel/geom/Point;

    iget v2, p0, Lcom/itextpdf/kernel/geom/Rectangle;->x:F

    float-to-double v2, v2

    iget v4, p0, Lcom/itextpdf/kernel/geom/Rectangle;->y:F

    float-to-double v4, v4

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    new-instance v1, Lcom/itextpdf/kernel/geom/Point;

    iget v2, p0, Lcom/itextpdf/kernel/geom/Rectangle;->x:F

    iget v3, p0, Lcom/itextpdf/kernel/geom/Rectangle;->width:F

    add-float/2addr v2, v3

    float-to-double v2, v2

    iget v4, p0, Lcom/itextpdf/kernel/geom/Rectangle;->y:F

    float-to-double v4, v4

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    new-instance v1, Lcom/itextpdf/kernel/geom/Point;

    iget v2, p0, Lcom/itextpdf/kernel/geom/Rectangle;->x:F

    iget v3, p0, Lcom/itextpdf/kernel/geom/Rectangle;->width:F

    add-float/2addr v2, v3

    float-to-double v2, v2

    iget v4, p0, Lcom/itextpdf/kernel/geom/Rectangle;->y:F

    iget v5, p0, Lcom/itextpdf/kernel/geom/Rectangle;->height:F

    add-float/2addr v4, v5

    float-to-double v4, v4

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    const/4 v2, 0x2

    aput-object v1, v0, v2

    new-instance v1, Lcom/itextpdf/kernel/geom/Point;

    iget v2, p0, Lcom/itextpdf/kernel/geom/Rectangle;->x:F

    float-to-double v2, v2

    iget v4, p0, Lcom/itextpdf/kernel/geom/Rectangle;->y:F

    iget v5, p0, Lcom/itextpdf/kernel/geom/Rectangle;->height:F

    add-float/2addr v4, v5

    float-to-double v4, v4

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    const/4 v2, 0x3

    aput-object v1, v0, v2

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 565
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Rectangle: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x78

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 567
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 565
    return-object v0
.end method
