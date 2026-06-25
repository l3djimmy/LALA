.class public abstract Lcom/itextpdf/layout/renderer/AbstractRenderer;
.super Ljava/lang/Object;
.source "AbstractRenderer.java"

# interfaces
.implements Lcom/itextpdf/layout/renderer/IRenderer;


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final ARC_BOTTOM_DEGREE:I = 0x10e

.field private static final ARC_LEFT_DEGREE:I = 0xb4

.field private static final ARC_QUARTER_CLOCKWISE_EXTENT:I = -0x5a

.field private static final ARC_RIGHT_DEGREE:I = 0x0

.field private static final ARC_TOP_DEGREE:I = 0x5a

.field static final BOTTOM_SIDE:I = 0x2

.field private static final CHECK_TUPLE2_TYPE:Lcom/itextpdf/commons/datastructures/Tuple2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/itextpdf/commons/datastructures/Tuple2<",
            "Ljava/lang/String;",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            ">;"
        }
    .end annotation
.end field

.field protected static final EPS:F = 1.0E-4f

.field protected static final INF:F = 1000000.0f

.field static final LEFT_SIDE:I = 0x3

.field public static final OVERLAP_EPSILON:F = 1.0E-4f

.field static final RIGHT_SIDE:I = 0x1

.field static final TOP_SIDE:I


# instance fields
.field protected childRenderers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;"
        }
    .end annotation
.end field

.field protected flushed:Z

.field protected isLastRendererForModelElement:Z

.field protected modelElement:Lcom/itextpdf/layout/IPropertyContainer;

.field protected occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

.field protected parent:Lcom/itextpdf/layout/renderer/IRenderer;

.field protected positionedRenderers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;"
        }
    .end annotation
.end field

.field protected properties:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 99
    nop

    .line 145
    new-instance v0, Lcom/itextpdf/commons/datastructures/Tuple2;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    const-string v2, ""

    invoke-direct {v0, v2, v1}, Lcom/itextpdf/commons/datastructures/Tuple2;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    sput-object v0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->CHECK_TUPLE2_TYPE:Lcom/itextpdf/commons/datastructures/Tuple2;

    return-void
.end method

.method protected constructor <init>()V
    .locals 1

    .line 160
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 148
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->childRenderers:Ljava/util/List;

    .line 149
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->positionedRenderers:Ljava/util/List;

    .line 151
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->flushed:Z

    .line 154
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->properties:Ljava/util/Map;

    .line 155
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isLastRendererForModelElement:Z

    .line 161
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/layout/element/IElement;)V
    .locals 1
    .param p1, "modelElement"    # Lcom/itextpdf/layout/element/IElement;

    .line 168
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 148
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->childRenderers:Ljava/util/List;

    .line 149
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->positionedRenderers:Ljava/util/List;

    .line 151
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->flushed:Z

    .line 154
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->properties:Ljava/util/Map;

    .line 155
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isLastRendererForModelElement:Z

    .line 169
    iput-object p1, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    .line 170
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/layout/renderer/AbstractRenderer;)V
    .locals 2
    .param p1, "other"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 172
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 148
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->childRenderers:Ljava/util/List;

    .line 149
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->positionedRenderers:Ljava/util/List;

    .line 151
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->flushed:Z

    .line 154
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->properties:Ljava/util/Map;

    .line 155
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isLastRendererForModelElement:Z

    .line 173
    iget-object v0, p1, Lcom/itextpdf/layout/renderer/AbstractRenderer;->childRenderers:Ljava/util/List;

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->childRenderers:Ljava/util/List;

    .line 174
    iget-object v0, p1, Lcom/itextpdf/layout/renderer/AbstractRenderer;->positionedRenderers:Ljava/util/List;

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->positionedRenderers:Ljava/util/List;

    .line 175
    iget-object v0, p1, Lcom/itextpdf/layout/renderer/AbstractRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    .line 176
    iget-boolean v0, p1, Lcom/itextpdf/layout/renderer/AbstractRenderer;->flushed:Z

    iput-boolean v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->flushed:Z

    .line 177
    iget-object v0, p1, Lcom/itextpdf/layout/renderer/AbstractRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/itextpdf/layout/renderer/AbstractRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->clone()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 178
    iget-object v0, p1, Lcom/itextpdf/layout/renderer/AbstractRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 179
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->properties:Ljava/util/Map;

    iget-object v1, p1, Lcom/itextpdf/layout/renderer/AbstractRenderer;->properties:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 180
    iget-boolean v0, p1, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isLastRendererForModelElement:Z

    iput-boolean v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isLastRendererForModelElement:Z

    .line 181
    return-void
.end method

.method private adjustPositionedRendererLayoutBoxWidth(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/geom/Rectangle;Ljava/lang/Float;Ljava/lang/Float;)V
    .locals 3
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p2, "fullBbox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p3, "left"    # Ljava/lang/Float;
    .param p4, "right"    # Ljava/lang/Float;

    .line 2611
    if-eqz p3, :cond_0

    .line 2612
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v0

    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    move-result v1

    sub-float/2addr v0, v1

    invoke-virtual {p2, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v1

    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    move-result v2

    add-float/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->setX(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 2614
    :cond_0
    if-eqz p4, :cond_1

    .line 2615
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v0

    invoke-virtual {p4}, Ljava/lang/Float;->floatValue()F

    move-result v1

    sub-float/2addr v0, v1

    invoke-virtual {p2, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 2618
    :cond_1
    if-nez p3, :cond_3

    if-nez p4, :cond_3

    const/16 v0, 0x4d

    invoke-interface {p1, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->hasProperty(I)Z

    move-result v0

    if-nez v0, :cond_3

    .line 2620
    instance-of v0, p1, Lcom/itextpdf/layout/renderer/BlockRenderer;

    if-eqz v0, :cond_2

    move-object v0, p1

    check-cast v0, Lcom/itextpdf/layout/renderer/BlockRenderer;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v0

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    .line 2621
    .local v0, "minMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    :goto_0
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMaxWidth()F

    move-result v1

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    cmpg-float v1, v1, v2

    if-gez v1, :cond_3

    .line 2622
    invoke-virtual {v0}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMaxWidth()F

    move-result v1

    const v2, 0x38d1b717    # 1.0E-4f

    add-float/2addr v1, v2

    invoke-virtual {p2, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 2625
    .end local v0    # "minMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    :cond_3
    return-void
.end method

.method private applyBackgroundBoxProperty(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/layout/properties/BackgroundBox;)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 2
    .param p1, "rectangle"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "clip"    # Lcom/itextpdf/layout/properties/BackgroundBox;

    .line 574
    sget-object v0, Lcom/itextpdf/layout/properties/BackgroundBox;->PADDING_BOX:Lcom/itextpdf/layout/properties/BackgroundBox;

    const/4 v1, 0x0

    if-ne v0, p2, :cond_0

    .line 575
    invoke-virtual {p0, p1, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    goto :goto_0

    .line 576
    :cond_0
    sget-object v0, Lcom/itextpdf/layout/properties/BackgroundBox;->CONTENT_BOX:Lcom/itextpdf/layout/properties/BackgroundBox;

    if-ne v0, p2, :cond_1

    .line 577
    invoke-virtual {p0, p1, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 578
    invoke-virtual {p0, p1, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 580
    :cond_1
    :goto_0
    return-object p1
.end method

.method static calculateAdditionalWidth(Lcom/itextpdf/layout/renderer/AbstractRenderer;)F
    .locals 2
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 2437
    new-instance v0, Lcom/itextpdf/kernel/geom/Rectangle;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FF)V

    .line 2438
    .local v0, "dummy":Lcom/itextpdf/kernel/geom/Rectangle;
    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 2439
    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 2440
    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 2441
    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    return v1
.end method

.method static calculatePaddingBorderHeight(Lcom/itextpdf/layout/renderer/AbstractRenderer;)F
    .locals 2
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 2635
    new-instance v0, Lcom/itextpdf/kernel/geom/Rectangle;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FF)V

    .line 2636
    .local v0, "dummy":Lcom/itextpdf/kernel/geom/Rectangle;
    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 2637
    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 2638
    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    return v1
.end method

.method static calculatePaddingBorderWidth(Lcom/itextpdf/layout/renderer/AbstractRenderer;)F
    .locals 2
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 2628
    new-instance v0, Lcom/itextpdf/kernel/geom/Rectangle;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FF)V

    .line 2629
    .local v0, "dummy":Lcom/itextpdf/kernel/geom/Rectangle;
    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 2630
    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 2631
    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    return v1
.end method

.method private calculateRadii([Lcom/itextpdf/layout/properties/BorderRadius;Lcom/itextpdf/kernel/geom/Rectangle;Z)[F
    .locals 6
    .param p1, "radii"    # [Lcom/itextpdf/layout/properties/BorderRadius;
    .param p2, "area"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p3, "horizontal"    # Z

    .line 1561
    const/4 v0, 0x4

    new-array v1, v0, [F

    .line 1563
    .local v1, "results":[F
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_6

    .line 1564
    aget-object v3, p1, v2

    const/4 v4, 0x0

    if-eqz v3, :cond_5

    .line 1565
    if-eqz p3, :cond_0

    aget-object v3, p1, v2

    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/BorderRadius;->getHorizontalRadius()Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v3

    goto :goto_1

    :cond_0
    aget-object v3, p1, v2

    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/BorderRadius;->getVerticalRadius()Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v3

    .line 1566
    .local v3, "value":Lcom/itextpdf/layout/properties/UnitValue;
    :goto_1
    if-eqz v3, :cond_4

    .line 1567
    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/UnitValue;->getUnitType()I

    move-result v4

    const/4 v5, 0x2

    if-ne v4, v5, :cond_2

    .line 1568
    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v4

    if-eqz p3, :cond_1

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v5

    goto :goto_2

    :cond_1
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v5

    :goto_2
    mul-float/2addr v4, v5

    const/high16 v5, 0x42c80000    # 100.0f

    div-float/2addr v4, v5

    aput v4, v1, v2

    goto :goto_3

    .line 1570
    :cond_2
    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/UnitValue;->getUnitType()I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_3

    .line 1571
    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v4

    aput v4, v1, v2

    goto :goto_3

    .line 1570
    :cond_3
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 1574
    :cond_4
    aput v4, v1, v2

    goto :goto_3

    .line 1577
    .end local v3    # "value":Lcom/itextpdf/layout/properties/UnitValue;
    :cond_5
    aput v4, v1, v2

    .line 1563
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1580
    .end local v2    # "i":I
    :cond_6
    return-object v1
.end method

.method private clipArea(Lcom/itextpdf/layout/renderer/DrawContext;Lcom/itextpdf/kernel/geom/Rectangle;ZZZZ)Z
    .locals 20
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;
    .param p2, "outerBorderBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p3, "clipOuter"    # Z
    .param p4, "clipInner"    # Z
    .param p5, "considerBordersBeforeOuterClipping"    # Z
    .param p6, "considerBordersBeforeInnerClipping"    # Z

    .line 757
    move-object/from16 v0, p0

    move-object/from16 v8, p2

    if-eqz p5, :cond_1

    if-nez p6, :cond_0

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 760
    :cond_1
    :goto_0
    const/4 v1, 0x4

    new-array v2, v1, [F

    fill-array-data v2, :array_0

    move-object v6, v2

    .line 762
    .local v6, "borderWidths":[F
    nop

    .line 763
    invoke-virtual {v8}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v2

    .line 764
    invoke-virtual {v8}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v3

    .line 765
    invoke-virtual {v8}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v4

    .line 766
    invoke-virtual {v8}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v5

    new-array v7, v1, [F

    const/4 v9, 0x0

    aput v2, v7, v9

    const/4 v2, 0x1

    aput v3, v7, v2

    const/4 v3, 0x2

    aput v4, v7, v3

    const/4 v4, 0x3

    aput v5, v7, v4

    .line 770
    .local v7, "outerBox":[F
    const/4 v5, 0x0

    .line 771
    .local v5, "hasNotNullRadius":Z
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getBorderRadii()[Lcom/itextpdf/layout/properties/BorderRadius;

    move-result-object v10

    .line 772
    .local v10, "borderRadii":[Lcom/itextpdf/layout/properties/BorderRadius;
    invoke-direct {v0, v10, v8, v9}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->calculateRadii([Lcom/itextpdf/layout/properties/BorderRadius;Lcom/itextpdf/kernel/geom/Rectangle;Z)[F

    move-result-object v11

    .line 773
    .local v11, "verticalRadii":[F
    invoke-direct {v0, v10, v8, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->calculateRadii([Lcom/itextpdf/layout/properties/BorderRadius;Lcom/itextpdf/kernel/geom/Rectangle;Z)[F

    move-result-object v12

    .line 774
    .local v12, "horizontalRadii":[F
    const/4 v13, 0x0

    move/from16 v19, v13

    move v13, v5

    move/from16 v5, v19

    .local v5, "i":I
    .local v13, "hasNotNullRadius":Z
    :goto_1
    if-ge v5, v1, :cond_4

    .line 775
    aget v14, v11, v5

    invoke-virtual {v8}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v15

    const/high16 v16, 0x40000000    # 2.0f

    div-float v15, v15, v16

    invoke-static {v14, v15}, Ljava/lang/Math;->min(FF)F

    move-result v14

    aput v14, v11, v5

    .line 776
    aget v14, v12, v5

    invoke-virtual {v8}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v15

    div-float v15, v15, v16

    invoke-static {v14, v15}, Ljava/lang/Math;->min(FF)F

    move-result v14

    aput v14, v12, v5

    .line 777
    if-nez v13, :cond_3

    aget v14, v11, v5

    const/4 v15, 0x0

    cmpl-float v14, v15, v14

    if-nez v14, :cond_2

    aget v14, v12, v5

    cmpl-float v14, v15, v14

    if-eqz v14, :cond_3

    .line 778
    :cond_2
    const/4 v13, 0x1

    .line 774
    :cond_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 781
    .end local v5    # "i":I
    :cond_4
    if-eqz v13, :cond_9

    .line 783
    aget v5, v7, v4

    aget v14, v12, v9

    add-float/2addr v5, v14

    aget v14, v7, v2

    aget v15, v12, v2

    sub-float/2addr v14, v15

    aget v15, v7, v2

    aget v16, v12, v3

    sub-float v15, v15, v16

    aget v16, v7, v4

    aget v17, v12, v4

    add-float v16, v16, v17

    move/from16 v17, v2

    new-array v2, v1, [F

    aput v5, v2, v9

    aput v14, v2, v17

    aput v15, v2, v3

    aput v16, v2, v4

    move-object v5, v2

    .line 784
    .local v5, "cornersX":[F
    aget v2, v7, v9

    aget v14, v11, v9

    sub-float/2addr v2, v14

    aget v14, v7, v9

    aget v15, v11, v17

    sub-float/2addr v14, v15

    aget v15, v7, v3

    aget v16, v11, v3

    add-float v15, v15, v16

    aget v16, v7, v3

    aget v18, v11, v4

    add-float v16, v16, v18

    new-array v1, v1, [F

    aput v2, v1, v9

    aput v14, v1, v17

    aput v15, v1, v3

    aput v16, v1, v4

    .line 786
    .local v1, "cornersY":[F
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v9

    .line 787
    .local v9, "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 789
    if-eqz p5, :cond_5

    .line 790
    move-object v4, v5

    move-object v3, v7

    move-object v2, v11

    move-object v5, v1

    move-object v1, v12

    .end local v7    # "outerBox":[F
    .end local v11    # "verticalRadii":[F
    .end local v12    # "horizontalRadii":[F
    .local v1, "horizontalRadii":[F
    .local v2, "verticalRadii":[F
    .local v3, "outerBox":[F
    .local v4, "cornersX":[F
    .local v5, "cornersY":[F
    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->decreaseBorderRadiiWithBorders([F[F[F[F[F)[F

    move-result-object v6

    move-object v7, v6

    goto :goto_2

    .line 789
    .end local v2    # "verticalRadii":[F
    .end local v3    # "outerBox":[F
    .end local v4    # "cornersX":[F
    .local v1, "cornersY":[F
    .local v5, "cornersX":[F
    .restart local v7    # "outerBox":[F
    .restart local v11    # "verticalRadii":[F
    .restart local v12    # "horizontalRadii":[F
    :cond_5
    move-object v4, v5

    move-object v3, v7

    move-object v2, v11

    move-object v5, v1

    move-object v1, v12

    .end local v7    # "outerBox":[F
    .end local v11    # "verticalRadii":[F
    .end local v12    # "horizontalRadii":[F
    .local v1, "horizontalRadii":[F
    .restart local v2    # "verticalRadii":[F
    .restart local v3    # "outerBox":[F
    .restart local v4    # "cornersX":[F
    .local v5, "cornersY":[F
    move-object v7, v6

    .line 794
    .end local v6    # "borderWidths":[F
    .local v7, "borderWidths":[F
    :goto_2
    if-eqz p3, :cond_6

    .line 795
    move-object/from16 v0, p0

    move-object v6, v5

    move-object v5, v4

    move-object v4, v3

    move-object v3, v2

    move-object v2, v1

    move-object v1, v9

    .end local v9    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .local v1, "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .local v2, "horizontalRadii":[F
    .local v3, "verticalRadii":[F
    .local v4, "outerBox":[F
    .local v5, "cornersX":[F
    .local v6, "cornersY":[F
    invoke-direct/range {v0 .. v6}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->clipOuterArea(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;[F[F[F[F[F)V

    move-object/from16 v19, v6

    move-object v6, v1

    move-object v1, v2

    move-object v2, v3

    move-object v3, v4

    move-object v4, v5

    move-object/from16 v5, v19

    .local v1, "horizontalRadii":[F
    .local v2, "verticalRadii":[F
    .local v3, "outerBox":[F
    .local v4, "cornersX":[F
    .local v5, "cornersY":[F
    .local v6, "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    goto :goto_3

    .line 794
    .end local v6    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .restart local v9    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    :cond_6
    move-object v6, v9

    .line 798
    .end local v9    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .restart local v6    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    :goto_3
    if-eqz p6, :cond_7

    .line 799
    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->decreaseBorderRadiiWithBorders([F[F[F[F[F)[F

    move-result-object v7

    .line 803
    :cond_7
    if-eqz p4, :cond_8

    .line 804
    move-object v0, v2

    move-object v2, v1

    move-object v1, v6

    move-object v6, v5

    move-object v5, v4

    move-object v4, v3

    move-object v3, v0

    move-object/from16 v0, p0

    .local v1, "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .local v2, "horizontalRadii":[F
    .local v3, "verticalRadii":[F
    .local v4, "outerBox":[F
    .local v5, "cornersX":[F
    .local v6, "cornersY":[F
    invoke-direct/range {v0 .. v7}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->clipInnerArea(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;[F[F[F[F[F[F)V

    move-object/from16 v19, v6

    move-object v6, v1

    move-object v1, v2

    move-object v2, v3

    move-object v3, v4

    move-object v4, v5

    move-object/from16 v5, v19

    .line 807
    .end local v4    # "outerBox":[F
    .end local v5    # "cornersX":[F
    .end local v6    # "cornersY":[F
    .local v1, "horizontalRadii":[F
    .local v2, "verticalRadii":[F
    .local v3, "outerBox":[F
    :cond_8
    move-object v6, v7

    goto :goto_4

    .line 781
    .end local v1    # "horizontalRadii":[F
    .end local v2    # "verticalRadii":[F
    .end local v3    # "outerBox":[F
    .local v6, "borderWidths":[F
    .local v7, "outerBox":[F
    .restart local v11    # "verticalRadii":[F
    .restart local v12    # "horizontalRadii":[F
    :cond_9
    move-object v3, v7

    move-object v2, v11

    move-object v1, v12

    .line 807
    .end local v7    # "outerBox":[F
    .end local v11    # "verticalRadii":[F
    .end local v12    # "horizontalRadii":[F
    .restart local v1    # "horizontalRadii":[F
    .restart local v2    # "verticalRadii":[F
    .restart local v3    # "outerBox":[F
    :goto_4
    return v13

    nop

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method private clipInnerArea(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;[F[F[F[F[F[F)V
    .locals 78
    .param p1, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .param p2, "horizontalRadii"    # [F
    .param p3, "verticalRadii"    # [F
    .param p4, "outerBox"    # [F
    .param p5, "cornersX"    # [F
    .param p6, "cornersY"    # [F
    .param p7, "borderWidths"    # [F

    .line 873
    const/4 v0, 0x0

    aget v1, p4, v0

    float-to-double v9, v1

    .line 874
    .local v9, "top":D
    const/4 v1, 0x1

    aget v2, p4, v1

    float-to-double v2, v2

    .line 875
    .local v2, "right":D
    const/4 v15, 0x2

    aget v4, p4, v15

    float-to-double v4, v4

    .line 876
    .local v4, "bottom":D
    const/16 v24, 0x3

    aget v6, p4, v24

    float-to-double v6, v6

    .line 878
    .local v6, "left":D
    aget v8, p5, v0

    float-to-double v11, v8

    .line 879
    .local v11, "x1":D
    aget v8, p6, v0

    float-to-double v13, v8

    .line 880
    .local v13, "y1":D
    aget v8, p5, v1

    move/from16 v16, v0

    move/from16 v17, v1

    float-to-double v0, v8

    .line 881
    .local v0, "x2":D
    aget v8, p6, v17

    move-wide/from16 v18, v11

    .end local v11    # "x1":D
    .local v18, "x1":D
    float-to-double v11, v8

    .line 882
    .local v11, "y2":D
    aget v8, p5, v15

    move-wide/from16 v20, v11

    .end local v11    # "y2":D
    .local v20, "y2":D
    float-to-double v11, v8

    .line 883
    .local v11, "x3":D
    aget v8, p6, v15

    move-wide/from16 v22, v11

    .end local v11    # "x3":D
    .local v22, "x3":D
    float-to-double v11, v8

    .line 884
    .local v11, "y3":D
    aget v8, p5, v24

    move-wide/from16 v25, v11

    .end local v11    # "y3":D
    .local v25, "y3":D
    float-to-double v11, v8

    .line 885
    .local v11, "x4":D
    aget v8, p6, v24

    move-wide/from16 v27, v11

    .end local v11    # "x4":D
    .local v27, "x4":D
    float-to-double v11, v8

    .line 886
    .local v11, "y4":D
    aget v8, p7, v16

    move-wide/from16 v29, v11

    .end local v11    # "y4":D
    .local v29, "y4":D
    float-to-double v11, v8

    .line 887
    .local v11, "topBorderWidth":D
    aget v8, p7, v17

    move-wide/from16 v31, v11

    .end local v11    # "topBorderWidth":D
    .local v31, "topBorderWidth":D
    float-to-double v11, v8

    .line 888
    .local v11, "rightBorderWidth":D
    aget v8, p7, v15

    move-wide/from16 v33, v11

    .end local v11    # "rightBorderWidth":D
    .local v33, "rightBorderWidth":D
    float-to-double v11, v8

    .line 889
    .local v11, "bottomBorderWidth":D
    aget v8, p7, v24

    move-wide/from16 v35, v11

    .end local v11    # "bottomBorderWidth":D
    .local v35, "bottomBorderWidth":D
    float-to-double v11, v8

    .line 892
    .local v11, "leftBorderWidth":D
    aget v8, p2, v16

    const/16 v37, 0x0

    cmpl-float v8, v37, v8

    if-nez v8, :cond_1

    aget v8, p3, v16

    cmpl-float v8, v37, v8

    if-eqz v8, :cond_0

    goto :goto_0

    :cond_0
    move-wide/from16 v38, v2

    move-wide/from16 v48, v4

    move-wide/from16 v42, v11

    move-wide v11, v13

    move-wide/from16 v50, v18

    move-wide/from16 v13, v27

    move-wide/from16 v18, v6

    move-wide/from16 v7, v25

    goto/16 :goto_1

    .line 893
    :cond_1
    :goto_0
    aget v8, p3, v16

    move-wide/from16 v38, v2

    .end local v2    # "right":D
    .local v38, "right":D
    float-to-double v2, v8

    sub-double v2, v13, v2

    aget v8, p2, v16

    move-wide/from16 v40, v2

    float-to-double v2, v8

    add-double v2, v18, v2

    .line 894
    move-wide/from16 v42, v11

    .end local v11    # "leftBorderWidth":D
    .local v42, "leftBorderWidth":D
    const-wide v11, 0x4066800000000000L    # 180.0

    move-wide/from16 v44, v13

    .end local v13    # "y1":D
    .local v44, "y1":D
    const-wide v13, -0x3fa9800000000000L    # -90.0

    move-wide/from16 v48, v4

    move-wide/from16 v50, v18

    move-wide/from16 v54, v20

    move-wide/from16 v56, v22

    move-wide/from16 v58, v25

    move-wide/from16 v60, v27

    move-wide/from16 v62, v29

    move-wide/from16 v46, v38

    move-wide/from16 v52, v44

    move-wide/from16 v76, v2

    move-object/from16 v2, p1

    move-wide v3, v6

    move-wide/from16 v5, v40

    move-wide/from16 v7, v76

    .end local v4    # "bottom":D
    .end local v6    # "left":D
    .end local v18    # "x1":D
    .end local v20    # "y2":D
    .end local v22    # "x3":D
    .end local v25    # "y3":D
    .end local v27    # "x4":D
    .end local v29    # "y4":D
    .end local v38    # "right":D
    .end local v44    # "y1":D
    .local v3, "left":D
    .local v46, "right":D
    .local v48, "bottom":D
    .local v50, "x1":D
    .local v52, "y1":D
    .local v54, "y2":D
    .local v56, "x3":D
    .local v58, "y3":D
    .local v60, "x4":D
    .local v62, "y4":D
    invoke-virtual/range {v2 .. v14}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->arc(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v5

    .line 897
    move-wide v2, v3

    .end local v3    # "left":D
    .local v2, "left":D
    invoke-virtual {v5, v0, v1, v9, v10}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v4

    .line 898
    move-wide/from16 v12, v46

    move-wide/from16 v5, v54

    .end local v46    # "right":D
    .end local v54    # "y2":D
    .local v5, "y2":D
    .local v12, "right":D
    invoke-virtual {v4, v12, v13, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v4

    .line 899
    move-wide/from16 v7, v58

    .end local v58    # "y3":D
    .local v7, "y3":D
    invoke-virtual {v4, v12, v13, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v4

    .line 900
    move-wide/from16 v38, v12

    move-wide/from16 v11, v48

    move-wide/from16 v13, v56

    .end local v12    # "right":D
    .end local v48    # "bottom":D
    .end local v56    # "x3":D
    .local v11, "bottom":D
    .local v13, "x3":D
    .restart local v38    # "right":D
    invoke-virtual {v4, v13, v14, v11, v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v4

    .line 901
    move-wide/from16 v22, v13

    move-wide/from16 v13, v60

    .end local v60    # "x4":D
    .local v13, "x4":D
    .restart local v22    # "x3":D
    invoke-virtual {v4, v13, v14, v11, v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v4

    .line 902
    move-wide/from16 v11, v62

    .end local v62    # "y4":D
    .local v11, "y4":D
    .restart local v48    # "bottom":D
    invoke-virtual {v4, v2, v3, v11, v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v4

    .line 903
    move-wide/from16 v29, v11

    move-wide/from16 v11, v52

    .end local v52    # "y1":D
    .local v11, "y1":D
    .restart local v29    # "y4":D
    invoke-virtual {v4, v2, v3, v11, v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v4

    move-wide/from16 v18, v2

    .end local v2    # "left":D
    .local v18, "left":D
    sub-double v2, v18, v42

    .line 904
    invoke-virtual {v4, v2, v3, v11, v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    sub-double v3, v18, v42

    move-wide/from16 v20, v5

    .end local v5    # "y2":D
    .restart local v20    # "y2":D
    sub-double v5, v48, v35

    .line 905
    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    add-double v3, v38, v33

    sub-double v5, v48, v35

    .line 906
    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    add-double v3, v38, v33

    add-double v5, v9, v31

    .line 907
    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    sub-double v3, v18, v42

    add-double v5, v9, v31

    .line 908
    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    sub-double v3, v18, v42

    .line 909
    invoke-virtual {v2, v3, v4, v11, v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 910
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->clip()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->endPath()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 913
    :goto_1
    aget v2, p2, v17

    cmpl-float v2, v37, v2

    if-nez v2, :cond_3

    aget v2, p3, v17

    cmpl-float v2, v37, v2

    if-eqz v2, :cond_2

    goto :goto_2

    :cond_2
    move-wide/from16 v58, v7

    move-wide/from16 v44, v11

    move-wide v7, v13

    move-wide/from16 v3, v18

    move-wide/from16 v68, v20

    move-wide/from16 v56, v22

    move-wide/from16 v5, v29

    goto/16 :goto_3

    .line 914
    :cond_3
    :goto_2
    aget v2, p2, v17

    float-to-double v2, v2

    sub-double v3, v0, v2

    aget v2, p3, v17

    float-to-double v5, v2

    sub-double v5, v20, v5

    .line 915
    move-wide/from16 v44, v11

    .end local v11    # "y1":D
    .restart local v44    # "y1":D
    const-wide v11, 0x4056800000000000L    # 90.0

    move-wide/from16 v27, v13

    .end local v13    # "x4":D
    .restart local v27    # "x4":D
    const-wide v13, -0x3fa9800000000000L    # -90.0

    move-wide/from16 v40, v9

    move-wide v9, v5

    move-wide/from16 v5, v40

    move-object/from16 v2, p1

    move-wide/from16 v40, v0

    move-wide v0, v7

    move-wide/from16 v64, v18

    move-wide/from16 v68, v20

    move-wide/from16 v70, v22

    move-wide/from16 v72, v27

    move-wide/from16 v74, v29

    move-wide/from16 v7, v38

    move-wide/from16 v66, v44

    .end local v9    # "top":D
    .end local v18    # "left":D
    .end local v20    # "y2":D
    .end local v22    # "x3":D
    .end local v27    # "x4":D
    .end local v29    # "y4":D
    .end local v38    # "right":D
    .end local v44    # "y1":D
    .local v0, "y3":D
    .local v5, "top":D
    .local v7, "right":D
    .local v40, "x2":D
    .local v64, "left":D
    .local v66, "y1":D
    .local v68, "y2":D
    .local v70, "x3":D
    .local v72, "x4":D
    .local v74, "y4":D
    invoke-virtual/range {v2 .. v14}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->arc(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    .line 918
    move-wide v9, v5

    move-wide v12, v7

    .end local v5    # "top":D
    .end local v7    # "right":D
    .restart local v9    # "top":D
    .restart local v12    # "right":D
    invoke-virtual {v3, v12, v13, v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 919
    move-wide/from16 v3, v48

    move-wide/from16 v5, v70

    .end local v48    # "bottom":D
    .end local v70    # "x3":D
    .local v3, "bottom":D
    .local v5, "x3":D
    invoke-virtual {v2, v5, v6, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 920
    move-wide/from16 v7, v72

    .end local v72    # "x4":D
    .local v7, "x4":D
    invoke-virtual {v2, v7, v8, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 921
    move-wide/from16 v56, v5

    move-wide/from16 v3, v64

    move-wide/from16 v5, v74

    .end local v64    # "left":D
    .end local v74    # "y4":D
    .local v3, "left":D
    .local v5, "y4":D
    .restart local v48    # "bottom":D
    .restart local v56    # "x3":D
    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 922
    move-wide/from16 v58, v0

    move-wide/from16 v0, v66

    .end local v66    # "y1":D
    .local v0, "y1":D
    .restart local v58    # "y3":D
    invoke-virtual {v2, v3, v4, v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 923
    move-wide/from16 v44, v0

    move-wide/from16 v0, v50

    .end local v50    # "x1":D
    .local v0, "x1":D
    .restart local v44    # "y1":D
    invoke-virtual {v2, v0, v1, v9, v10}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 924
    move-wide/from16 v0, v40

    .end local v40    # "x2":D
    .local v0, "x2":D
    .restart local v50    # "x1":D
    invoke-virtual {v2, v0, v1, v9, v10}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    move-wide/from16 v38, v12

    .end local v12    # "right":D
    .restart local v38    # "right":D
    add-double v11, v9, v31

    .line 925
    invoke-virtual {v2, v0, v1, v11, v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    sub-double v11, v3, v42

    add-double v13, v9, v31

    .line 926
    invoke-virtual {v2, v11, v12, v13, v14}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    sub-double v11, v3, v42

    sub-double v13, v48, v35

    .line 927
    invoke-virtual {v2, v11, v12, v13, v14}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    add-double v11, v38, v33

    sub-double v13, v48, v35

    .line 928
    invoke-virtual {v2, v11, v12, v13, v14}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    add-double v11, v38, v33

    add-double v13, v9, v31

    .line 929
    invoke-virtual {v2, v11, v12, v13, v14}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    add-double v11, v9, v31

    .line 930
    invoke-virtual {v2, v0, v1, v11, v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 931
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->clip()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->endPath()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 934
    :goto_3
    aget v2, p2, v15

    cmpl-float v2, v37, v2

    if-nez v2, :cond_5

    aget v2, p3, v15

    cmpl-float v2, v37, v2

    if-eqz v2, :cond_4

    goto :goto_4

    :cond_4
    move-wide/from16 v18, v3

    move-wide/from16 v29, v5

    move-wide/from16 v60, v7

    move-wide/from16 v5, v44

    move-wide/from16 v3, v50

    move-wide/from16 v7, v58

    move-wide/from16 v54, v68

    goto/16 :goto_5

    .line 935
    :cond_5
    :goto_4
    aget v2, p3, v15

    float-to-double v11, v2

    add-double v11, v58, v11

    aget v2, p2, v15

    float-to-double v13, v2

    sub-double v16, v56, v13

    .line 936
    const-wide/16 v20, 0x0

    const-wide v22, -0x3fa9800000000000L    # -90.0

    move-wide v14, v11

    move-wide/from16 v12, v38

    move-wide/from16 v18, v48

    move-object/from16 v11, p1

    .end local v38    # "right":D
    .end local v48    # "bottom":D
    .restart local v12    # "right":D
    .local v18, "bottom":D
    invoke-virtual/range {v11 .. v23}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->arc(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 939
    move-wide/from16 v14, v18

    .end local v18    # "bottom":D
    .local v14, "bottom":D
    invoke-virtual {v2, v7, v8, v14, v15}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 940
    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 941
    move-wide/from16 v29, v5

    move-wide/from16 v5, v44

    .end local v44    # "y1":D
    .local v5, "y1":D
    .restart local v29    # "y4":D
    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 942
    move-wide/from16 v18, v3

    move-wide/from16 v3, v50

    .end local v50    # "x1":D
    .local v3, "x1":D
    .local v18, "left":D
    invoke-virtual {v2, v3, v4, v9, v10}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 943
    invoke-virtual {v2, v0, v1, v9, v10}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 944
    move-wide/from16 v48, v14

    move-wide/from16 v14, v68

    .end local v68    # "y2":D
    .local v14, "y2":D
    .restart local v48    # "bottom":D
    invoke-virtual {v2, v12, v13, v14, v15}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 945
    move-wide/from16 v60, v7

    move-wide/from16 v7, v58

    .end local v58    # "y3":D
    .local v7, "y3":D
    .restart local v60    # "x4":D
    invoke-virtual {v2, v12, v13, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .end local v12    # "right":D
    .restart local v38    # "right":D
    add-double v11, v38, v33

    .line 946
    invoke-virtual {v2, v11, v12, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    add-double v11, v38, v33

    move-wide/from16 v54, v14

    .end local v14    # "y2":D
    .restart local v54    # "y2":D
    add-double v13, v9, v31

    .line 947
    invoke-virtual {v2, v11, v12, v13, v14}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    sub-double v11, v18, v42

    add-double v13, v9, v31

    .line 948
    invoke-virtual {v2, v11, v12, v13, v14}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    sub-double v11, v18, v42

    sub-double v13, v48, v35

    .line 949
    invoke-virtual {v2, v11, v12, v13, v14}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    add-double v11, v38, v33

    sub-double v13, v48, v35

    .line 950
    invoke-virtual {v2, v11, v12, v13, v14}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    add-double v11, v38, v33

    .line 951
    invoke-virtual {v2, v11, v12, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 952
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->clip()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->endPath()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 955
    :goto_5
    aget v2, p2, v24

    cmpl-float v2, v37, v2

    if-nez v2, :cond_7

    aget v2, p3, v24

    cmpl-float v2, v37, v2

    if-eqz v2, :cond_6

    goto :goto_6

    :cond_6
    move-wide/from16 v40, v0

    move-wide/from16 v44, v5

    move-wide/from16 v13, v18

    move-wide/from16 v11, v48

    move-wide/from16 v20, v54

    move-wide/from16 v22, v56

    move-wide/from16 v0, v60

    move-wide/from16 v18, v3

    goto/16 :goto_7

    .line 956
    :cond_7
    :goto_6
    aget v2, p2, v24

    float-to-double v11, v2

    add-double v11, v60, v11

    aget v2, p3, v24

    float-to-double v13, v2

    add-double v23, v29, v13

    .line 957
    const-wide v25, 0x4070e00000000000L    # 270.0

    const-wide v27, -0x3fa9800000000000L    # -90.0

    move-object/from16 v16, p1

    move-wide/from16 v21, v18

    move-wide/from16 v19, v48

    move-wide/from16 v17, v11

    .end local v18    # "left":D
    .end local v48    # "bottom":D
    .local v19, "bottom":D
    .local v21, "left":D
    invoke-virtual/range {v16 .. v28}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->arc(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 960
    move-wide/from16 v11, v19

    move-wide/from16 v13, v21

    .end local v19    # "bottom":D
    .end local v21    # "left":D
    .local v11, "bottom":D
    .local v13, "left":D
    invoke-virtual {v2, v13, v14, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 961
    invoke-virtual {v2, v3, v4, v9, v10}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 962
    invoke-virtual {v2, v0, v1, v9, v10}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 963
    move-wide/from16 v40, v0

    move-wide/from16 v18, v3

    move-wide/from16 v0, v38

    move-wide/from16 v3, v54

    .end local v38    # "right":D
    .end local v54    # "y2":D
    .local v0, "right":D
    .local v3, "y2":D
    .local v18, "x1":D
    .restart local v40    # "x2":D
    invoke-virtual {v2, v0, v1, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 964
    invoke-virtual {v2, v0, v1, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 965
    move-wide/from16 v0, v56

    .end local v56    # "x3":D
    .local v0, "x3":D
    .restart local v38    # "right":D
    invoke-virtual {v2, v0, v1, v11, v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 966
    move-wide/from16 v22, v0

    move-wide/from16 v0, v60

    .end local v60    # "x4":D
    .local v0, "x4":D
    .restart local v22    # "x3":D
    invoke-virtual {v2, v0, v1, v11, v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    move-wide/from16 v20, v3

    .end local v3    # "y2":D
    .restart local v20    # "y2":D
    sub-double v3, v11, v35

    .line 967
    invoke-virtual {v2, v0, v1, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    add-double v3, v38, v33

    move-wide/from16 v44, v5

    .end local v5    # "y1":D
    .restart local v44    # "y1":D
    sub-double v5, v11, v35

    .line 968
    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    add-double v3, v38, v33

    add-double v5, v9, v31

    .line 969
    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    sub-double v3, v13, v42

    add-double v5, v9, v31

    .line 970
    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    sub-double v3, v13, v42

    sub-double v5, v11, v35

    .line 971
    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    sub-double v4, v11, v35

    .line 972
    invoke-virtual {v2, v0, v1, v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 973
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->clip()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->endPath()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 975
    :goto_7
    return-void
.end method

.method private clipOuterArea(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;[F[F[F[F[F)V
    .locals 34
    .param p1, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .param p2, "horizontalRadii"    # [F
    .param p3, "verticalRadii"    # [F
    .param p4, "outerBox"    # [F
    .param p5, "cornersX"    # [F
    .param p6, "cornersY"    # [F

    .line 812
    move-object/from16 v0, p1

    const/4 v1, 0x0

    aget v2, p4, v1

    float-to-double v10, v2

    .line 813
    .local v10, "top":D
    const/4 v2, 0x1

    aget v3, p4, v2

    float-to-double v3, v3

    .line 814
    .local v3, "right":D
    const/16 v16, 0x2

    aget v5, p4, v16

    float-to-double v5, v5

    .line 815
    .local v5, "bottom":D
    const/16 v25, 0x3

    aget v7, p4, v25

    float-to-double v7, v7

    .line 818
    .local v7, "left":D
    aget v9, p2, v1

    const/16 v26, 0x0

    cmpl-float v9, v26, v9

    if-nez v9, :cond_1

    aget v9, p3, v1

    cmpl-float v9, v26, v9

    if-eqz v9, :cond_0

    goto :goto_0

    :cond_0
    move/from16 v17, v2

    move-wide v1, v3

    move-wide v12, v5

    move-wide v4, v7

    goto :goto_1

    .line 819
    :cond_1
    :goto_0
    aget v9, p6, v1

    float-to-double v12, v9

    aget v9, p3, v1

    float-to-double v14, v9

    sub-double/2addr v12, v14

    .line 820
    .local v12, "arcBottom":D
    aget v9, p5, v1

    float-to-double v14, v9

    aget v1, p2, v1

    move/from16 v17, v2

    move-wide/from16 v18, v3

    .end local v3    # "right":D
    .local v18, "right":D
    float-to-double v2, v1

    add-double/2addr v14, v2

    .line 821
    .local v14, "arcRight":D
    nop

    .line 822
    invoke-virtual {v0, v7, v8, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    .line 823
    move-wide/from16 v20, v5

    move-wide v4, v7

    move-wide v6, v12

    .end local v5    # "bottom":D
    .end local v7    # "left":D
    .end local v12    # "arcBottom":D
    .local v4, "left":D
    .local v6, "arcBottom":D
    .local v20, "bottom":D
    const-wide v12, 0x4066800000000000L    # 180.0

    move-wide v8, v14

    .end local v14    # "arcRight":D
    .local v8, "arcRight":D
    const-wide v14, -0x3fa9800000000000L    # -90.0

    move-wide/from16 v1, v18

    move-wide/from16 v30, v20

    .end local v18    # "right":D
    .end local v20    # "bottom":D
    .local v1, "right":D
    .local v30, "bottom":D
    invoke-virtual/range {v3 .. v15}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->arcContinuous(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    .line 825
    invoke-virtual {v3, v1, v2, v10, v11}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    .line 826
    move-wide/from16 v12, v30

    .end local v30    # "bottom":D
    .local v12, "bottom":D
    invoke-virtual {v3, v1, v2, v12, v13}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    .line 827
    invoke-virtual {v3, v4, v5, v12, v13}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 828
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->clip()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->endPath()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 831
    .end local v6    # "arcBottom":D
    .end local v8    # "arcRight":D
    :goto_1
    aget v3, p2, v17

    cmpl-float v3, v26, v3

    if-nez v3, :cond_3

    aget v3, p3, v17

    cmpl-float v3, v26, v3

    if-eqz v3, :cond_2

    goto :goto_2

    :cond_2
    move-wide v6, v12

    move-wide v13, v1

    move-wide v1, v6

    move-wide v6, v4

    goto :goto_3

    .line 832
    :cond_3
    :goto_2
    aget v3, p5, v17

    float-to-double v6, v3

    aget v3, p2, v17

    float-to-double v8, v3

    sub-double/2addr v6, v8

    .line 833
    .local v6, "arcLeft":D
    aget v3, p6, v17

    float-to-double v8, v3

    aget v3, p3, v17

    float-to-double v14, v3

    sub-double/2addr v8, v14

    .line 834
    .local v8, "arcBottom":D
    nop

    .line 835
    invoke-virtual {v0, v4, v5, v10, v11}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    .line 836
    move-wide/from16 v20, v12

    .end local v12    # "bottom":D
    .restart local v20    # "bottom":D
    const-wide v12, 0x4056800000000000L    # 90.0

    const-wide v14, -0x3fa9800000000000L    # -90.0

    move-wide/from16 v32, v4

    move-wide v4, v6

    move-wide v6, v10

    move-wide v10, v8

    move-wide v8, v1

    move-wide/from16 v1, v20

    .end local v20    # "bottom":D
    .local v1, "bottom":D
    .local v4, "arcLeft":D
    .local v6, "top":D
    .local v8, "right":D
    .local v10, "arcBottom":D
    .local v32, "left":D
    invoke-virtual/range {v3 .. v15}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->arcContinuous(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    .line 838
    move-wide v13, v8

    move-wide v8, v10

    move-wide v10, v6

    .end local v6    # "top":D
    .local v8, "arcBottom":D
    .local v10, "top":D
    .local v13, "right":D
    invoke-virtual {v3, v13, v14, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    .line 839
    move-wide/from16 v6, v32

    .end local v32    # "left":D
    .local v6, "left":D
    invoke-virtual {v3, v6, v7, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    .line 840
    invoke-virtual {v3, v6, v7, v10, v11}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 841
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->clip()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->endPath()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 844
    .end local v4    # "arcLeft":D
    .end local v8    # "arcBottom":D
    :goto_3
    aget v3, p2, v16

    cmpl-float v3, v26, v3

    if-nez v3, :cond_5

    aget v3, p3, v16

    cmpl-float v3, v26, v3

    if-eqz v3, :cond_4

    goto :goto_4

    :cond_4
    move-wide v2, v1

    goto :goto_5

    .line 845
    :cond_5
    :goto_4
    aget v3, p6, v16

    float-to-double v3, v3

    aget v5, p3, v16

    float-to-double v8, v5

    add-double/2addr v3, v8

    .line 846
    .local v3, "arcTop":D
    aget v5, p5, v16

    float-to-double v8, v5

    aget v5, p2, v16

    move-wide/from16 v20, v1

    .end local v1    # "bottom":D
    .restart local v20    # "bottom":D
    float-to-double v1, v5

    sub-double v17, v8, v1

    .line 847
    .local v17, "arcLeft":D
    nop

    .line 848
    invoke-virtual {v0, v13, v14, v10, v11}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v12

    .line 849
    move-wide/from16 v30, v20

    .end local v20    # "bottom":D
    .restart local v30    # "bottom":D
    const-wide/16 v21, 0x0

    const-wide v23, -0x3fa9800000000000L    # -90.0

    move-wide v15, v3

    move-wide/from16 v19, v30

    .end local v3    # "arcTop":D
    .end local v30    # "bottom":D
    .local v15, "arcTop":D
    .local v19, "bottom":D
    invoke-virtual/range {v12 .. v24}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->arcContinuous(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    .line 851
    move-wide/from16 v2, v19

    .end local v19    # "bottom":D
    .local v2, "bottom":D
    invoke-virtual {v1, v6, v7, v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    .line 852
    invoke-virtual {v1, v6, v7, v10, v11}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    .line 853
    invoke-virtual {v1, v13, v14, v10, v11}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 854
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->clip()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->endPath()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 857
    .end local v15    # "arcTop":D
    .end local v17    # "arcLeft":D
    :goto_5
    aget v1, p2, v25

    cmpl-float v1, v26, v1

    if-nez v1, :cond_7

    aget v1, p3, v25

    cmpl-float v1, v26, v1

    if-eqz v1, :cond_6

    goto :goto_6

    :cond_6
    move-wide v4, v6

    goto :goto_7

    .line 858
    :cond_7
    :goto_6
    aget v1, p5, v25

    float-to-double v4, v1

    aget v1, p2, v25

    float-to-double v8, v1

    add-double v18, v4, v8

    .line 859
    .local v18, "arcRight":D
    aget v1, p6, v25

    float-to-double v4, v1

    aget v1, p3, v25

    float-to-double v8, v1

    add-double v24, v4, v8

    .line 860
    .local v24, "arcTop":D
    nop

    .line 861
    invoke-virtual {v0, v13, v14, v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v17

    .line 862
    const-wide v26, 0x4070e00000000000L    # 270.0

    const-wide v28, -0x3fa9800000000000L    # -90.0

    move-wide/from16 v20, v2

    move-wide/from16 v22, v6

    .end local v2    # "bottom":D
    .end local v6    # "left":D
    .restart local v20    # "bottom":D
    .local v22, "left":D
    invoke-virtual/range {v17 .. v29}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->arcContinuous(DDDDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    .line 864
    move-wide/from16 v4, v22

    .end local v20    # "bottom":D
    .end local v22    # "left":D
    .restart local v2    # "bottom":D
    .local v4, "left":D
    invoke-virtual {v1, v4, v5, v10, v11}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    .line 865
    invoke-virtual {v1, v13, v14, v10, v11}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    .line 866
    invoke-virtual {v1, v13, v14, v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 867
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->clip()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->endPath()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 869
    .end local v18    # "arcRight":D
    .end local v24    # "arcTop":D
    :goto_7
    return-void
.end method

.method private createTransformationInsideOccupiedArea()Lcom/itextpdf/kernel/geom/AffineTransform;
    .locals 11

    .line 2649
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->clone()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    .line 2650
    .local v0, "backgroundArea":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v1

    .line 2651
    .local v1, "x":F
    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v2

    .line 2652
    .local v2, "y":F
    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v3

    .line 2653
    .local v3, "height":F
    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v4

    .line 2655
    .local v4, "width":F
    const/high16 v5, 0x40000000    # 2.0f

    div-float v6, v4, v5

    add-float/2addr v6, v1

    const/high16 v7, -0x40800000    # -1.0f

    mul-float/2addr v6, v7

    float-to-double v8, v6

    div-float v6, v3, v5

    add-float/2addr v6, v2

    mul-float/2addr v6, v7

    float-to-double v6, v6

    invoke-static {v8, v9, v6, v7}, Lcom/itextpdf/kernel/geom/AffineTransform;->getTranslateInstance(DD)Lcom/itextpdf/kernel/geom/AffineTransform;

    move-result-object v6

    .line 2656
    .local v6, "transform":Lcom/itextpdf/kernel/geom/AffineTransform;
    const/16 v7, 0x35

    invoke-virtual {p0, v7}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/layout/properties/Transform;

    invoke-static {v7, v4, v3}, Lcom/itextpdf/layout/properties/Transform;->getAffineTransform(Lcom/itextpdf/layout/properties/Transform;FF)Lcom/itextpdf/kernel/geom/AffineTransform;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/itextpdf/kernel/geom/AffineTransform;->preConcatenate(Lcom/itextpdf/kernel/geom/AffineTransform;)V

    .line 2657
    div-float v7, v4, v5

    add-float/2addr v7, v1

    float-to-double v7, v7

    div-float v5, v3, v5

    add-float/2addr v5, v2

    float-to-double v9, v5

    invoke-static {v7, v8, v9, v10}, Lcom/itextpdf/kernel/geom/AffineTransform;->getTranslateInstance(DD)Lcom/itextpdf/kernel/geom/AffineTransform;

    move-result-object v5

    invoke-virtual {v6, v5}, Lcom/itextpdf/kernel/geom/AffineTransform;->preConcatenate(Lcom/itextpdf/kernel/geom/AffineTransform;)V

    .line 2659
    return-object v6
.end method

.method public static createXObject(Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;
    .locals 5
    .param p0, "linearGradientBuilder"    # Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;
    .param p1, "xObjectArea"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 719
    new-instance v0, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v2

    const/4 v3, 0x0

    invoke-direct {v0, v3, v3, v1, v2}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    .line 720
    .local v0, "formBBox":Lcom/itextpdf/kernel/geom/Rectangle;
    new-instance v1, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 721
    .local v1, "xObject":Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;
    if-eqz p0, :cond_0

    .line 722
    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2, p2}, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;->buildColor(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/AffineTransform;Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/colors/Color;

    move-result-object v2

    .line 723
    .local v2, "gradientColor":Lcom/itextpdf/kernel/colors/Color;
    if-eqz v2, :cond_0

    .line 724
    new-instance v3, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-direct {v3, v1, p2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;-><init>(Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 725
    const/4 v4, 0x1

    invoke-virtual {v3, v2, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setColor(Lcom/itextpdf/kernel/colors/Color;Z)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    .line 726
    invoke-virtual {v3, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->rectangle(Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    .line 727
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->fill()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 730
    .end local v2    # "gradientColor":Lcom/itextpdf/kernel/colors/Color;
    :cond_0
    return-object v1
.end method

.method private decreaseBorderRadiiWithBorders([F[F[F[F[F)[F
    .locals 8
    .param p1, "horizontalRadii"    # [F
    .param p2, "verticalRadii"    # [F
    .param p3, "outerBox"    # [F
    .param p4, "cornersX"    # [F
    .param p5, "cornersY"    # [F

    .line 978
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getBorders()[Lcom/itextpdf/layout/borders/Border;

    move-result-object v0

    .line 979
    .local v0, "borders":[Lcom/itextpdf/layout/borders/Border;
    const/4 v1, 0x4

    new-array v1, v1, [F

    fill-array-data v1, :array_0

    .line 981
    .local v1, "borderWidths":[F
    const/4 v2, 0x0

    aget-object v3, v0, v2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v3, :cond_2

    .line 982
    aget-object v3, v0, v2

    invoke-virtual {v3}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v3

    aput v3, v1, v2

    .line 983
    aget v3, p3, v2

    aget-object v6, v0, v2

    invoke-virtual {v6}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v6

    sub-float/2addr v3, v6

    aput v3, p3, v2

    .line 984
    aget v3, p5, v4

    aget v6, p3, v2

    cmpl-float v3, v3, v6

    if-lez v3, :cond_0

    .line 985
    aget v3, p3, v2

    aput v3, p5, v4

    .line 987
    :cond_0
    aget v3, p5, v2

    aget v6, p3, v2

    cmpl-float v3, v3, v6

    if-lez v3, :cond_1

    .line 988
    aget v3, p3, v2

    aput v3, p5, v2

    .line 990
    :cond_1
    aget v3, p2, v2

    aget-object v6, v0, v2

    invoke-virtual {v6}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v6

    sub-float/2addr v3, v6

    invoke-static {v5, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    aput v3, p2, v2

    .line 991
    aget v3, p2, v4

    aget-object v6, v0, v2

    invoke-virtual {v6}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v6

    sub-float/2addr v3, v6

    invoke-static {v5, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    aput v3, p2, v4

    .line 993
    :cond_2
    aget-object v3, v0, v4

    const/4 v6, 0x2

    if-eqz v3, :cond_5

    .line 994
    aget-object v3, v0, v4

    invoke-virtual {v3}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v3

    aput v3, v1, v4

    .line 995
    aget v3, p3, v4

    aget-object v7, v0, v4

    invoke-virtual {v7}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v7

    sub-float/2addr v3, v7

    aput v3, p3, v4

    .line 996
    aget v3, p4, v4

    aget v7, p3, v4

    cmpl-float v3, v3, v7

    if-lez v3, :cond_3

    .line 997
    aget v3, p3, v4

    aput v3, p4, v4

    .line 999
    :cond_3
    aget v3, p4, v6

    aget v7, p3, v4

    cmpl-float v3, v3, v7

    if-lez v3, :cond_4

    .line 1000
    aget v3, p3, v4

    aput v3, p4, v6

    .line 1002
    :cond_4
    aget v3, p1, v4

    aget-object v7, v0, v4

    invoke-virtual {v7}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v7

    sub-float/2addr v3, v7

    invoke-static {v5, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    aput v3, p1, v4

    .line 1003
    aget v3, p1, v6

    aget-object v4, v0, v4

    invoke-virtual {v4}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v4

    sub-float/2addr v3, v4

    invoke-static {v5, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    aput v3, p1, v6

    .line 1005
    :cond_5
    aget-object v3, v0, v6

    const/4 v4, 0x3

    if-eqz v3, :cond_8

    .line 1006
    aget-object v3, v0, v6

    invoke-virtual {v3}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v3

    aput v3, v1, v6

    .line 1007
    aget v3, p3, v6

    aget-object v7, v0, v6

    invoke-virtual {v7}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v7

    add-float/2addr v3, v7

    aput v3, p3, v6

    .line 1008
    aget v3, p5, v6

    aget v7, p3, v6

    cmpg-float v3, v3, v7

    if-gez v3, :cond_6

    .line 1009
    aget v3, p3, v6

    aput v3, p5, v6

    .line 1011
    :cond_6
    aget v3, p5, v4

    aget v7, p3, v6

    cmpg-float v3, v3, v7

    if-gez v3, :cond_7

    .line 1012
    aget v3, p3, v6

    aput v3, p5, v4

    .line 1014
    :cond_7
    aget v3, p2, v6

    aget-object v7, v0, v6

    invoke-virtual {v7}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v7

    sub-float/2addr v3, v7

    invoke-static {v5, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    aput v3, p2, v6

    .line 1015
    aget v3, p2, v4

    aget-object v6, v0, v6

    invoke-virtual {v6}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v6

    sub-float/2addr v3, v6

    invoke-static {v5, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    aput v3, p2, v4

    .line 1017
    :cond_8
    aget-object v3, v0, v4

    if-eqz v3, :cond_b

    .line 1018
    aget-object v3, v0, v4

    invoke-virtual {v3}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v3

    aput v3, v1, v4

    .line 1019
    aget v3, p3, v4

    aget-object v6, v0, v4

    invoke-virtual {v6}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v6

    add-float/2addr v3, v6

    aput v3, p3, v4

    .line 1020
    aget v3, p4, v4

    aget v6, p3, v4

    cmpg-float v3, v3, v6

    if-gez v3, :cond_9

    .line 1021
    aget v3, p3, v4

    aput v3, p4, v4

    .line 1023
    :cond_9
    aget v3, p4, v2

    aget v6, p3, v4

    cmpg-float v3, v3, v6

    if-gez v3, :cond_a

    .line 1024
    aget v3, p3, v4

    aput v3, p4, v2

    .line 1026
    :cond_a
    aget v3, p1, v4

    aget-object v6, v0, v4

    invoke-virtual {v6}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v6

    sub-float/2addr v3, v6

    invoke-static {v5, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    aput v3, p1, v4

    .line 1027
    aget v3, p1, v2

    aget-object v4, v0, v4

    invoke-virtual {v4}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v4

    sub-float/2addr v3, v4

    invoke-static {v5, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    aput v3, p1, v2

    .line 1029
    :cond_b
    return-object v1

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method private drawBackgroundImage(Lcom/itextpdf/layout/properties/BackgroundImage;Lcom/itextpdf/layout/renderer/DrawContext;Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 13
    .param p1, "backgroundImage"    # Lcom/itextpdf/layout/properties/BackgroundImage;
    .param p2, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;
    .param p3, "backgroundArea"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 601
    invoke-virtual/range {p3 .. p3}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    .line 602
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/BackgroundImage;->getBackgroundOrigin()Lcom/itextpdf/layout/properties/BackgroundBox;

    move-result-object v1

    .line 601
    invoke-direct {p0, v0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyBackgroundBoxProperty(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/layout/properties/BackgroundBox;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v7

    .line 603
    .local v7, "originBackgroundArea":Lcom/itextpdf/kernel/geom/Rectangle;
    nop

    .line 604
    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v0

    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    .line 603
    invoke-static {p1, v0, v1}, Lcom/itextpdf/layout/renderer/BackgroundSizeCalculationUtil;->calculateBackgroundImageSize(Lcom/itextpdf/layout/properties/BackgroundImage;FF)[F

    move-result-object v0

    .line 605
    .local v0, "imageWidthAndHeight":[F
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/BackgroundImage;->getImage()Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    move-result-object v1

    .line 606
    .local v1, "backgroundXObject":Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
    if-nez v1, :cond_0

    .line 607
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/BackgroundImage;->getForm()Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    move-result-object v1

    .line 610
    :cond_0
    const/4 v2, 0x0

    invoke-static {v2}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v8

    .line 611
    .local v8, "xPosition":Lcom/itextpdf/layout/properties/UnitValue;
    invoke-static {v2}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v9

    .line 612
    .local v9, "yPosition":Lcom/itextpdf/layout/properties/UnitValue;
    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez v1, :cond_2

    .line 613
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/BackgroundImage;->getLinearGradientBuilder()Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;

    move-result-object v5

    .line 614
    .local v5, "gradientBuilder":Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;
    if-nez v5, :cond_1

    .line 615
    return-void

    .line 618
    :cond_1
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/BackgroundImage;->getBackgroundPosition()Lcom/itextpdf/layout/properties/BackgroundPosition;

    move-result-object v6

    invoke-virtual {v6, v2, v2, v8, v9}, Lcom/itextpdf/layout/properties/BackgroundPosition;->calculatePositionValues(FFLcom/itextpdf/layout/properties/UnitValue;Lcom/itextpdf/layout/properties/UnitValue;)V

    .line 619
    invoke-virtual {p2}, Lcom/itextpdf/layout/renderer/DrawContext;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v6

    invoke-static {v5, v7, v6}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->createXObject(Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    move-result-object v1

    .line 620
    new-instance v6, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v10

    invoke-virtual {v8}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v11

    add-float/2addr v10, v11

    .line 621
    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v11

    aget v12, v0, v4

    sub-float/2addr v11, v12

    invoke-virtual {v9}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v12

    sub-float/2addr v11, v12

    aget v3, v0, v3

    aget v4, v0, v4

    invoke-direct {v6, v10, v11, v3, v4}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    .line 623
    .end local v5    # "gradientBuilder":Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;
    .local v6, "imageRectangle":Lcom/itextpdf/kernel/geom/Rectangle;
    move-object v5, v1

    goto :goto_0

    .line 624
    .end local v6    # "imageRectangle":Lcom/itextpdf/kernel/geom/Rectangle;
    :cond_2
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/BackgroundImage;->getBackgroundPosition()Lcom/itextpdf/layout/properties/BackgroundPosition;

    move-result-object v5

    .line 625
    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v6

    aget v10, v0, v3

    sub-float/2addr v6, v10

    .line 626
    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v10

    aget v11, v0, v4

    sub-float/2addr v10, v11

    .line 624
    invoke-virtual {v5, v6, v10, v8, v9}, Lcom/itextpdf/layout/properties/BackgroundPosition;->calculatePositionValues(FFLcom/itextpdf/layout/properties/UnitValue;Lcom/itextpdf/layout/properties/UnitValue;)V

    .line 627
    new-instance v5, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v6

    invoke-virtual {v8}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v10

    add-float/2addr v6, v10

    .line 628
    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v10

    aget v11, v0, v4

    sub-float/2addr v10, v11

    invoke-virtual {v9}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v11

    sub-float/2addr v10, v11

    aget v3, v0, v3

    aget v4, v0, v4

    invoke-direct {v5, v6, v10, v3, v4}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    move-object v6, v5

    move-object v5, v1

    .line 631
    .end local v1    # "backgroundXObject":Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
    .local v5, "backgroundXObject":Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
    .restart local v6    # "imageRectangle":Lcom/itextpdf/kernel/geom/Rectangle;
    :goto_0
    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    cmpg-float v1, v1, v2

    if-lez v1, :cond_4

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    cmpg-float v1, v1, v2

    if-gtz v1, :cond_3

    move-object v2, v6

    goto :goto_1

    .line 637
    :cond_3
    invoke-virtual/range {p3 .. p3}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    .line 638
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/BackgroundImage;->getBackgroundClip()Lcom/itextpdf/layout/properties/BackgroundBox;

    move-result-object v2

    .line 637
    invoke-direct {p0, v1, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyBackgroundBoxProperty(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/layout/properties/BackgroundBox;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    .line 639
    .local v1, "clippedBackgroundArea":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {p2}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 640
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 641
    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->rectangle(Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 642
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->clip()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 643
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->endPath()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 644
    move-object v3, p1

    move-object v4, p2

    move-object v2, v6

    move-object/from16 v6, p3

    .end local v6    # "imageRectangle":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v2, "imageRectangle":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-static/range {v2 .. v7}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->drawPdfXObject(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/layout/properties/BackgroundImage;Lcom/itextpdf/layout/renderer/DrawContext;Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 646
    invoke-virtual {p2}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    goto :goto_2

    .line 631
    .end local v1    # "clippedBackgroundArea":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v2    # "imageRectangle":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local v6    # "imageRectangle":Lcom/itextpdf/kernel/geom/Rectangle;
    :cond_4
    move-object v2, v6

    .line 632
    .end local v6    # "imageRectangle":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local v2    # "imageRectangle":Lcom/itextpdf/kernel/geom/Rectangle;
    :goto_1
    const-class v1, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 633
    .local v1, "logger":Lorg/slf4j/Logger;
    const-string v3, "background-image"

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const-string v4, "The {0} rectangle has negative or zero sizes. It will not be displayed."

    invoke-static {v4, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 636
    .end local v1    # "logger":Lorg/slf4j/Logger;
    nop

    .line 648
    :goto_2
    return-void
.end method

.method private drawBackgroundImagesList(Ljava/util/List;ZLcom/itextpdf/layout/renderer/DrawContext;Lcom/itextpdf/kernel/geom/Rectangle;)Z
    .locals 3
    .param p2, "backgroundAreaIsClipped"    # Z
    .param p3, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;
    .param p4, "backgroundArea"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/properties/BackgroundImage;",
            ">;Z",
            "Lcom/itextpdf/layout/renderer/DrawContext;",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ")Z"
        }
    .end annotation

    .line 586
    .local p1, "backgroundImagesList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/properties/BackgroundImage;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_2

    .line 587
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/BackgroundImage;

    .line 588
    .local v1, "backgroundImage":Lcom/itextpdf/layout/properties/BackgroundImage;
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/BackgroundImage;->isBackgroundSpecified()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 590
    if-nez p2, :cond_0

    .line 591
    invoke-virtual {p0, p3, p4}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->clipBackgroundArea(Lcom/itextpdf/layout/renderer/DrawContext;Lcom/itextpdf/kernel/geom/Rectangle;)Z

    move-result p2

    .line 593
    :cond_0
    invoke-direct {p0, v1, p3, p4}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->drawBackgroundImage(Lcom/itextpdf/layout/properties/BackgroundImage;Lcom/itextpdf/layout/renderer/DrawContext;Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 586
    .end local v1    # "backgroundImage":Lcom/itextpdf/layout/properties/BackgroundImage;
    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 596
    .end local v0    # "i":I
    :cond_2
    return p2
.end method

.method private drawColorBackground(Lcom/itextpdf/layout/properties/Background;Lcom/itextpdf/layout/renderer/DrawContext;Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 13
    .param p1, "background"    # Lcom/itextpdf/layout/properties/Background;
    .param p2, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;
    .param p3, "colorBackgroundArea"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 561
    new-instance v0, Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/Background;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v1

    .line 562
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/Background;->getOpacity()F

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/TransparentColor;-><init>(Lcom/itextpdf/kernel/colors/Color;F)V

    .line 563
    .local v0, "backgroundColor":Lcom/itextpdf/layout/properties/TransparentColor;
    invoke-virtual {p2}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/TransparentColor;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setFillColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 564
    invoke-virtual {p2}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/properties/TransparentColor;->applyFillTransparency(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 565
    invoke-virtual {p2}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    invoke-virtual/range {p3 .. p3}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v1

    float-to-double v3, v1

    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/Background;->getExtraLeft()F

    move-result v1

    float-to-double v5, v1

    sub-double/2addr v3, v5

    .line 566
    invoke-virtual/range {p3 .. p3}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v1

    float-to-double v5, v1

    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/Background;->getExtraBottom()F

    move-result v1

    float-to-double v7, v1

    sub-double/2addr v5, v7

    .line 567
    invoke-virtual/range {p3 .. p3}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    float-to-double v7, v1

    .line 568
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/Background;->getExtraLeft()F

    move-result v1

    float-to-double v9, v1

    add-double/2addr v7, v9

    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/Background;->getExtraRight()F

    move-result v1

    float-to-double v9, v1

    add-double/2addr v7, v9

    .line 569
    invoke-virtual/range {p3 .. p3}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    float-to-double v9, v1

    .line 570
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/Background;->getExtraTop()F

    move-result v1

    float-to-double v11, v1

    add-double/2addr v9, v11

    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/Background;->getExtraBottom()F

    move-result v1

    float-to-double v11, v1

    add-double/2addr v9, v11

    .line 565
    invoke-virtual/range {v2 .. v10}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->rectangle(DDDD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    .line 570
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->fill()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 571
    return-void
.end method

.method private static drawPdfXObject(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/layout/properties/BackgroundImage;Lcom/itextpdf/layout/renderer/DrawContext;Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 14
    .param p0, "imageRectangle"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p1, "backgroundImage"    # Lcom/itextpdf/layout/properties/BackgroundImage;
    .param p2, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;
    .param p3, "backgroundXObject"    # Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
    .param p4, "backgroundArea"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p5, "originBackgroundArea"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 653
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/BackgroundImage;->getBlendMode()Lcom/itextpdf/layout/properties/BlendMode;

    move-result-object v7

    .line 654
    .local v7, "blendMode":Lcom/itextpdf/layout/properties/BlendMode;
    sget-object v0, Lcom/itextpdf/layout/properties/BlendMode;->NORMAL:Lcom/itextpdf/layout/properties/BlendMode;

    if-eq v7, v0, :cond_0

    .line 655
    invoke-virtual/range {p2 .. p2}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    new-instance v1, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;-><init>()V

    invoke-virtual {v7}, Lcom/itextpdf/layout/properties/BlendMode;->getPdfRepresentation()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->setBlendMode(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setExtGState(Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 657
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/BackgroundImage;->getRepeat()Lcom/itextpdf/layout/properties/BackgroundRepeat;

    move-result-object v0

    .line 659
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/BackgroundImage;->getBackgroundSize()Lcom/itextpdf/layout/properties/BackgroundSize;

    move-result-object v1

    .line 658
    move-object/from16 v8, p5

    invoke-virtual {v0, p0, v8, v1}, Lcom/itextpdf/layout/properties/BackgroundRepeat;->prepareRectangleToDrawingAndGetWhitespace(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/layout/properties/BackgroundSize;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v9

    .line 660
    .local v9, "whitespace":Lcom/itextpdf/kernel/geom/Point;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v10

    .line 661
    .local v10, "initialX":F
    const/4 v0, 0x1

    .line 662
    .local v0, "counterY":I
    const/4 v1, 0x1

    move v11, v0

    move v5, v1

    .line 666
    .end local v0    # "counterY":I
    .local v5, "firstDraw":Z
    .local v11, "counterY":I
    :cond_1
    nop

    .line 667
    invoke-virtual {v9}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v0

    double-to-float v6, v0

    .line 666
    move-object v0, p0

    move-object v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    invoke-static/range {v0 .. v6}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->drawPdfXObjectHorizontally(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/layout/properties/BackgroundImage;Lcom/itextpdf/layout/renderer/DrawContext;Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;Lcom/itextpdf/kernel/geom/Rectangle;ZF)V

    .line 668
    const/4 v5, 0x0

    .line 669
    invoke-virtual {p0, v10}, Lcom/itextpdf/kernel/geom/Rectangle;->setX(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 670
    const v1, 0x38d1b717    # 1.0E-4f

    invoke-virtual {p0, v4, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->overlaps(Lcom/itextpdf/kernel/geom/Rectangle;F)Z

    move-result v2

    .line 671
    .local v2, "isCurrentOverlaps":Z
    rem-int/lit8 v3, v11, 0x2

    const/4 v6, 0x1

    if-ne v3, v6, :cond_2

    .line 672
    nop

    .line 673
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v3

    invoke-virtual {v9}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v12

    double-to-float v6, v12

    add-float/2addr v3, v6

    int-to-float v6, v11

    mul-float/2addr v3, v6

    invoke-virtual {p0, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    .line 674
    invoke-virtual {v3, v4, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->overlaps(Lcom/itextpdf/kernel/geom/Rectangle;F)Z

    move-result v1

    .local v1, "isNextOverlaps":Z
    goto :goto_0

    .line 676
    .end local v1    # "isNextOverlaps":Z
    :cond_2
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v3

    invoke-virtual {v9}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v12

    double-to-float v6, v12

    add-float/2addr v3, v6

    int-to-float v6, v11

    mul-float/2addr v3, v6

    invoke-virtual {p0, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    .line 677
    invoke-virtual {v3, v4, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->overlaps(Lcom/itextpdf/kernel/geom/Rectangle;F)Z

    move-result v1

    .line 679
    .restart local v1    # "isNextOverlaps":Z
    :goto_0
    add-int/lit8 v11, v11, 0x1

    .line 680
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/BackgroundImage;->getRepeat()Lcom/itextpdf/layout/properties/BackgroundRepeat;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/BackgroundRepeat;->isNoRepeatOnYAxis()Z

    move-result v3

    if-nez v3, :cond_3

    if-nez v2, :cond_1

    if-nez v1, :cond_1

    .line 681
    :cond_3
    return-void
.end method

.method private static drawPdfXObjectHorizontally(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/layout/properties/BackgroundImage;Lcom/itextpdf/layout/renderer/DrawContext;Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;Lcom/itextpdf/kernel/geom/Rectangle;ZF)V
    .locals 6
    .param p0, "imageRectangle"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p1, "backgroundImage"    # Lcom/itextpdf/layout/properties/BackgroundImage;
    .param p2, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;
    .param p3, "backgroundXObject"    # Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
    .param p4, "backgroundArea"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p5, "firstDraw"    # Z
    .param p6, "xWhitespace"    # F

    .line 686
    move v0, p5

    .line 687
    .local v0, "isItFirstDraw":Z
    const/4 v1, 0x1

    .line 691
    .local v1, "counterX":I
    :cond_0
    const v2, 0x38d1b717    # 1.0E-4f

    invoke-virtual {p0, p4, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->overlaps(Lcom/itextpdf/kernel/geom/Rectangle;F)Z

    move-result v3

    if-nez v3, :cond_1

    if-eqz v0, :cond_2

    .line 692
    :cond_1
    invoke-virtual {p2}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    invoke-virtual {v3, p3, p0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->addXObjectFittedIntoRectangle(Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 693
    const/4 v0, 0x0

    .line 695
    :cond_2
    invoke-virtual {p0, p4, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->overlaps(Lcom/itextpdf/kernel/geom/Rectangle;F)Z

    move-result v3

    .line 696
    .local v3, "isCurrentOverlaps":Z
    rem-int/lit8 v4, v1, 0x2

    const/4 v5, 0x1

    if-ne v4, v5, :cond_3

    .line 697
    nop

    .line 698
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v4

    add-float/2addr v4, p6

    int-to-float v5, v1

    mul-float/2addr v4, v5

    invoke-virtual {p0, v4}, Lcom/itextpdf/kernel/geom/Rectangle;->moveRight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    .line 699
    invoke-virtual {v4, p4, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->overlaps(Lcom/itextpdf/kernel/geom/Rectangle;F)Z

    move-result v2

    .local v2, "isNextOverlaps":Z
    goto :goto_0

    .line 701
    .end local v2    # "isNextOverlaps":Z
    :cond_3
    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v4

    add-float/2addr v4, p6

    int-to-float v5, v1

    mul-float/2addr v4, v5

    invoke-virtual {p0, v4}, Lcom/itextpdf/kernel/geom/Rectangle;->moveLeft(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    .line 702
    invoke-virtual {v4, p4, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->overlaps(Lcom/itextpdf/kernel/geom/Rectangle;F)Z

    move-result v2

    .line 704
    .restart local v2    # "isNextOverlaps":Z
    :goto_0
    add-int/lit8 v1, v1, 0x1

    .line 706
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/BackgroundImage;->getRepeat()Lcom/itextpdf/layout/properties/BackgroundRepeat;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/layout/properties/BackgroundRepeat;->isNoRepeatOnXAxis()Z

    move-result v4

    if-nez v4, :cond_4

    if-nez v3, :cond_0

    if-nez v2, :cond_0

    .line 707
    :cond_4
    return-void
.end method

.method private static getBorderRadii(Lcom/itextpdf/layout/renderer/IRenderer;)[Lcom/itextpdf/layout/properties/BorderRadius;
    .locals 14
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 2813
    const/16 v0, 0x65

    invoke-interface {p0, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/BorderRadius;

    .line 2814
    .local v0, "radius":Lcom/itextpdf/layout/properties/BorderRadius;
    const/16 v1, 0x6e

    invoke-interface {p0, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/properties/BorderRadius;

    .line 2815
    .local v2, "topLeftRadius":Lcom/itextpdf/layout/properties/BorderRadius;
    const/16 v3, 0x6f

    invoke-interface {p0, v3}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/properties/BorderRadius;

    .line 2816
    .local v4, "topRightRadius":Lcom/itextpdf/layout/properties/BorderRadius;
    const/16 v5, 0x70

    invoke-interface {p0, v5}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/layout/properties/BorderRadius;

    .line 2817
    .local v6, "bottomRightRadius":Lcom/itextpdf/layout/properties/BorderRadius;
    const/16 v7, 0x71

    invoke-interface {p0, v7}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/layout/properties/BorderRadius;

    .line 2819
    .local v8, "bottomLeftRadius":Lcom/itextpdf/layout/properties/BorderRadius;
    const/4 v9, 0x4

    new-array v9, v9, [Lcom/itextpdf/layout/properties/BorderRadius;

    const/4 v10, 0x0

    aput-object v2, v9, v10

    const/4 v11, 0x1

    aput-object v4, v9, v11

    const/4 v12, 0x2

    aput-object v6, v9, v12

    const/4 v13, 0x3

    aput-object v8, v9, v13

    .line 2821
    .local v9, "borderRadii":[Lcom/itextpdf/layout/properties/BorderRadius;
    invoke-static {p0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->hasOwnOrModelProperty(Lcom/itextpdf/layout/renderer/IRenderer;I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 2822
    aput-object v0, v9, v10

    .line 2824
    :cond_0
    invoke-static {p0, v3}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->hasOwnOrModelProperty(Lcom/itextpdf/layout/renderer/IRenderer;I)Z

    move-result v1

    if-nez v1, :cond_1

    .line 2825
    aput-object v0, v9, v11

    .line 2827
    :cond_1
    invoke-static {p0, v5}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->hasOwnOrModelProperty(Lcom/itextpdf/layout/renderer/IRenderer;I)Z

    move-result v1

    if-nez v1, :cond_2

    .line 2828
    aput-object v0, v9, v12

    .line 2830
    :cond_2
    invoke-static {p0, v7}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->hasOwnOrModelProperty(Lcom/itextpdf/layout/renderer/IRenderer;I)Z

    move-result v1

    if-nez v1, :cond_3

    .line 2831
    aput-object v0, v9, v13

    .line 2834
    :cond_3
    return-object v9
.end method

.method static getBorders(Lcom/itextpdf/layout/renderer/IRenderer;)[Lcom/itextpdf/layout/borders/Border;
    .locals 14
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 2542
    const/16 v0, 0x9

    invoke-interface {p0, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/borders/Border;

    .line 2543
    .local v0, "border":Lcom/itextpdf/layout/borders/Border;
    const/16 v1, 0xd

    invoke-interface {p0, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/borders/Border;

    .line 2544
    .local v2, "topBorder":Lcom/itextpdf/layout/borders/Border;
    const/16 v3, 0xc

    invoke-interface {p0, v3}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/borders/Border;

    .line 2545
    .local v4, "rightBorder":Lcom/itextpdf/layout/borders/Border;
    const/16 v5, 0xa

    invoke-interface {p0, v5}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/layout/borders/Border;

    .line 2546
    .local v6, "bottomBorder":Lcom/itextpdf/layout/borders/Border;
    const/16 v7, 0xb

    invoke-interface {p0, v7}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/layout/borders/Border;

    .line 2548
    .local v8, "leftBorder":Lcom/itextpdf/layout/borders/Border;
    const/4 v9, 0x4

    new-array v9, v9, [Lcom/itextpdf/layout/borders/Border;

    const/4 v10, 0x0

    aput-object v2, v9, v10

    const/4 v11, 0x1

    aput-object v4, v9, v11

    const/4 v12, 0x2

    aput-object v6, v9, v12

    const/4 v13, 0x3

    aput-object v8, v9, v13

    .line 2550
    .local v9, "borders":[Lcom/itextpdf/layout/borders/Border;
    invoke-static {p0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->hasOwnOrModelProperty(Lcom/itextpdf/layout/renderer/IRenderer;I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 2551
    aput-object v0, v9, v10

    .line 2553
    :cond_0
    invoke-static {p0, v3}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->hasOwnOrModelProperty(Lcom/itextpdf/layout/renderer/IRenderer;I)Z

    move-result v1

    if-nez v1, :cond_1

    .line 2554
    aput-object v0, v9, v11

    .line 2556
    :cond_1
    invoke-static {p0, v5}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->hasOwnOrModelProperty(Lcom/itextpdf/layout/renderer/IRenderer;I)Z

    move-result v1

    if-nez v1, :cond_2

    .line 2557
    aput-object v0, v9, v12

    .line 2559
    :cond_2
    invoke-static {p0, v7}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->hasOwnOrModelProperty(Lcom/itextpdf/layout/renderer/IRenderer;I)Z

    move-result v1

    if-nez v1, :cond_3

    .line 2560
    aput-object v0, v9, v13

    .line 2563
    :cond_3
    return-object v9
.end method

.method private static getCurrentStructElem(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    .locals 3
    .param p0, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 2847
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getTagStructureContext()Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    move-result-object v0

    .line 2848
    .local v0, "context":Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getAutoTaggingPointer()Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    move-result-object v1

    .line 2849
    .local v1, "tagPointer":Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getPointerStructElem(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v2

    return-object v2
.end method

.method private static getMargins(Lcom/itextpdf/layout/renderer/IRenderer;)[Lcom/itextpdf/layout/properties/UnitValue;
    .locals 3
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 2808
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/itextpdf/layout/properties/UnitValue;

    const/16 v1, 0x2e

    invoke-interface {p0, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/UnitValue;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const/16 v1, 0x2d

    invoke-interface {p0, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/UnitValue;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    .line 2809
    const/16 v1, 0x2b

    invoke-interface {p0, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/UnitValue;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    const/16 v1, 0x2c

    invoke-interface {p0, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/UnitValue;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    .line 2808
    return-object v0
.end method

.method private static getPaddings(Lcom/itextpdf/layout/renderer/IRenderer;)[Lcom/itextpdf/layout/properties/UnitValue;
    .locals 3
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 2838
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/itextpdf/layout/properties/UnitValue;

    const/16 v1, 0x32

    invoke-interface {p0, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/UnitValue;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const/16 v1, 0x31

    invoke-interface {p0, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/UnitValue;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    .line 2839
    const/16 v1, 0x2f

    invoke-interface {p0, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/UnitValue;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    const/16 v1, 0x30

    invoke-interface {p0, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/UnitValue;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    .line 2838
    return-object v0
.end method

.method static getPropertyAsFloat(Lcom/itextpdf/layout/renderer/IRenderer;I)Ljava/lang/Float;
    .locals 1
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p1, "property"    # I

    .line 2449
    invoke-interface {p0, p1}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/io/util/NumberUtil;->asFloat(Ljava/lang/Object;)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method static getPropertyAsUnitValue(Lcom/itextpdf/layout/renderer/IRenderer;I)Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p1, "property"    # I

    .line 2460
    invoke-interface {p0, p1}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    .line 2461
    .local v0, "result":Lcom/itextpdf/layout/properties/UnitValue;
    return-object v0
.end method

.method private static hasOwnOrModelProperty(Lcom/itextpdf/layout/renderer/IRenderer;I)Z
    .locals 1
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p1, "property"    # I

    .line 2843
    invoke-interface {p0, p1}, Lcom/itextpdf/layout/renderer/IRenderer;->hasOwnProperty(I)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-interface {p0}, Lcom/itextpdf/layout/renderer/IRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {p0}, Lcom/itextpdf/layout/renderer/IRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/itextpdf/layout/IPropertyContainer;->hasProperty(I)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method protected static isBorderBoxSizing(Lcom/itextpdf/layout/renderer/IRenderer;)Z
    .locals 2
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1298
    const/16 v0, 0x69

    invoke-interface {p0, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/BoxSizingPropertyValue;

    .line 1299
    .local v0, "boxSizing":Lcom/itextpdf/layout/properties/BoxSizingPropertyValue;
    if-eqz v0, :cond_0

    sget-object v1, Lcom/itextpdf/layout/properties/BoxSizingPropertyValue;->BORDER_BOX:Lcom/itextpdf/layout/properties/BoxSizingPropertyValue;

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/properties/BoxSizingPropertyValue;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method protected static isOverflowFit(Lcom/itextpdf/layout/properties/OverflowPropertyValue;)Z
    .locals 1
    .param p0, "rendererOverflowProperty"    # Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    .line 1315
    if-eqz p0, :cond_1

    sget-object v0, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->FIT:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    invoke-virtual {v0, p0}, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method protected static isOverflowProperty(Lcom/itextpdf/layout/properties/OverflowPropertyValue;Lcom/itextpdf/layout/properties/OverflowPropertyValue;)Z
    .locals 1
    .param p0, "equalsTo"    # Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .param p1, "rendererOverflowProperty"    # Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    .line 1311
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->FIT:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method protected static isOverflowProperty(Lcom/itextpdf/layout/properties/OverflowPropertyValue;Lcom/itextpdf/layout/renderer/IRenderer;I)Z
    .locals 1
    .param p0, "equalsTo"    # Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p2, "overflowProperty"    # I

    .line 1307
    invoke-interface {p1, p2}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    invoke-static {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isOverflowProperty(Lcom/itextpdf/layout/properties/OverflowPropertyValue;Lcom/itextpdf/layout/properties/OverflowPropertyValue;)Z

    move-result v0

    return v0
.end method

.method static noAbsolutePositionInfo(Lcom/itextpdf/layout/renderer/IRenderer;)Z
    .locals 1
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 2445
    const/16 v0, 0x49

    invoke-interface {p0, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->hasProperty(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/16 v0, 0xe

    invoke-interface {p0, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->hasProperty(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/16 v0, 0x22

    invoke-interface {p0, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->hasProperty(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/16 v0, 0x36

    invoke-interface {p0, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->hasProperty(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method static processWaitingDrawing(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/properties/Transform;Ljava/util/List;)V
    .locals 11
    .param p0, "child"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p1, "transformProp"    # Lcom/itextpdf/layout/properties/Transform;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            "Lcom/itextpdf/layout/properties/Transform;",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;)V"
        }
    .end annotation

    .line 1368
    .local p2, "waitingDrawing":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-nez v0, :cond_0

    if-eqz p1, :cond_1

    .line 1369
    :cond_0
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1371
    :cond_1
    const/16 v0, 0x6a

    invoke-interface {p0, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/borders/Border;

    .line 1372
    .local v0, "outlineProp":Lcom/itextpdf/layout/borders/Border;
    if-eqz v0, :cond_6

    instance-of v1, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    if-eqz v1, :cond_6

    .line 1373
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 1374
    .local v1, "abstractChild":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isRelativePosition()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_2

    .line 1375
    invoke-virtual {v1, v3}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyRelativePositioningTranslation(Z)V

    .line 1376
    :cond_2
    new-instance v2, Lcom/itextpdf/layout/element/Div;

    invoke-direct {v2}, Lcom/itextpdf/layout/element/Div;-><init>()V

    invoke-virtual {v2}, Lcom/itextpdf/layout/element/Div;->setNeutralRole()Lcom/itextpdf/layout/element/IElement;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/element/Div;

    .line 1377
    .local v2, "outlines":Lcom/itextpdf/layout/element/Div;
    if-eqz p1, :cond_3

    .line 1378
    const/16 v4, 0x35

    invoke-virtual {v2, v4, p1}, Lcom/itextpdf/layout/element/Div;->setProperty(ILjava/lang/Object;)V

    .line 1379
    :cond_3
    const/16 v4, 0x9

    invoke-virtual {v2, v4, v0}, Lcom/itextpdf/layout/element/Div;->setProperty(ILjava/lang/Object;)V

    .line 1380
    invoke-virtual {v2, v4}, Lcom/itextpdf/layout/element/Div;->getProperty(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/layout/borders/Border;

    invoke-virtual {v5}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v5

    .line 1381
    .local v5, "offset":F
    const/16 v6, 0x6b

    invoke-virtual {v1, v6}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v7

    if-eqz v7, :cond_4

    .line 1382
    invoke-virtual {v1, v6}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v6

    add-float/2addr v5, v6

    .line 1383
    :cond_4
    new-instance v6, Lcom/itextpdf/layout/renderer/DivRenderer;

    invoke-direct {v6, v2}, Lcom/itextpdf/layout/renderer/DivRenderer;-><init>(Lcom/itextpdf/layout/element/Div;)V

    .line 1384
    .local v6, "div":Lcom/itextpdf/layout/renderer/DivRenderer;
    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getParent()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/itextpdf/layout/renderer/DivRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1385
    iget-object v7, v1, Lcom/itextpdf/layout/renderer/AbstractRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v7}, Lcom/itextpdf/layout/layout/LayoutArea;->clone()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v7

    invoke-virtual {v1, v7, v3}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3, v5}, Lcom/itextpdf/kernel/geom/Rectangle;->moveLeft(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3, v5}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    .line 1386
    .local v3, "divOccupiedArea":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v7

    const/high16 v8, 0x40000000    # 2.0f

    mul-float v9, v5, v8

    add-float/2addr v7, v9

    invoke-virtual {v3, v7}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v7

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v9

    mul-float v10, v5, v8

    add-float/2addr v9, v10

    invoke-virtual {v7, v9}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1387
    new-instance v7, Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v9

    invoke-direct {v7, v9, v3}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    iput-object v7, v6, Lcom/itextpdf/layout/renderer/DivRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 1388
    invoke-virtual {v6, v4}, Lcom/itextpdf/layout/renderer/DivRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/borders/Border;

    invoke-virtual {v4}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v4

    .line 1389
    .local v4, "outlineWidth":F
    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v7

    mul-float v9, v4, v8

    cmpl-float v7, v7, v9

    if-ltz v7, :cond_5

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v7

    mul-float/2addr v8, v4

    cmpl-float v7, v7, v8

    if-ltz v7, :cond_5

    .line 1390
    invoke-interface {p2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1392
    :cond_5
    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isRelativePosition()Z

    move-result v7

    if-eqz v7, :cond_6

    .line 1393
    const/4 v7, 0x1

    invoke-virtual {v1, v7}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyRelativePositioningTranslation(Z)V

    .line 1395
    .end local v1    # "abstractChild":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .end local v2    # "outlines":Lcom/itextpdf/layout/element/Div;
    .end local v3    # "divOccupiedArea":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v4    # "outlineWidth":F
    .end local v5    # "offset":F
    .end local v6    # "div":Lcom/itextpdf/layout/renderer/DivRenderer;
    :cond_6
    return-void
.end method

.method private removeThisFromParent(Lcom/itextpdf/layout/renderer/IRenderer;)V
    .locals 1
    .param p1, "toRemove"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 2794
    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/itextpdf/layout/renderer/IRenderer;->getParent()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    if-ne p0, v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2795
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    .line 2797
    :cond_0
    return-void
.end method

.method private removeThisFromParents(Ljava/util/Collection;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;)V"
        }
    .end annotation

    .line 2800
    .local p1, "children":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 2801
    .local v1, "child":Lcom/itextpdf/layout/renderer/IRenderer;
    if-eqz v1, :cond_0

    invoke-interface {v1}, Lcom/itextpdf/layout/renderer/IRenderer;->getParent()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v2

    if-ne p0, v2, :cond_0

    .line 2802
    const/4 v2, 0x0

    invoke-interface {v1, v2}, Lcom/itextpdf/layout/renderer/IRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    .line 2804
    .end local v1    # "child":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_0
    goto :goto_0

    .line 2805
    :cond_1
    return-void
.end method

.method private retrieveDirectParentDeclaredHeight()Ljava/lang/Float;
    .locals 2

    .line 2056
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    const/16 v1, 0x1b

    invoke-interface {v0, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2057
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-static {v0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsUnitValue(Lcom/itextpdf/layout/renderer/IRenderer;I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 2058
    .local v0, "parentHeightUV":Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2059
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    return-object v1

    .line 2062
    .end local v0    # "parentHeightUV":Lcom/itextpdf/layout/properties/UnitValue;
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method private retrieveResolvedParentDeclaredHeight()Ljava/lang/Float;
    .locals 2

    .line 2038
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    const/16 v1, 0x1b

    invoke-interface {v0, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 2039
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-static {v0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsUnitValue(Lcom/itextpdf/layout/renderer/IRenderer;I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 2040
    .local v0, "parentHeightUV":Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2041
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    return-object v1

    .line 2043
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    check-cast v1, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveHeight()Ljava/lang/Float;

    move-result-object v1

    return-object v1

    .line 2046
    .end local v0    # "parentHeightUV":Lcom/itextpdf/layout/properties/UnitValue;
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private updateMinHeightForAbsolutelyPositionedRenderer(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/geom/Rectangle;Ljava/lang/Float;Ljava/lang/Float;)V
    .locals 7
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p2, "parentRendererBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p3, "top"    # Ljava/lang/Float;
    .param p4, "bottom"    # Ljava/lang/Float;

    .line 2586
    if-eqz p3, :cond_3

    if-eqz p4, :cond_3

    const/16 v0, 0x1b

    invoke-interface {p1, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->hasProperty(I)Z

    move-result v0

    if-nez v0, :cond_3

    .line 2587
    const/16 v0, 0x54

    invoke-static {p1, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsUnitValue(Lcom/itextpdf/layout/renderer/IRenderer;I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 2588
    .local v0, "currentMaxHeight":Lcom/itextpdf/layout/properties/UnitValue;
    const/16 v1, 0x55

    invoke-static {p1, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsUnitValue(Lcom/itextpdf/layout/renderer/IRenderer;I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v2

    .line 2589
    .local v2, "currentMinHeight":Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v3

    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    move-result v4

    sub-float/2addr v3, v4

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v4

    sub-float/2addr v3, v4

    invoke-virtual {p4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    sub-float/2addr v3, v4

    const/4 v4, 0x0

    invoke-static {v4, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    .line 2591
    .local v3, "resolvedMinHeight":F
    new-instance v5, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-direct {v5, v4, v4}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FF)V

    .line 2592
    .local v5, "dummy":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-static {p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isBorderBoxSizing(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v4

    const/4 v6, 0x1

    if-nez v4, :cond_0

    .line 2593
    invoke-static {p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPaddings(Lcom/itextpdf/layout/renderer/IRenderer;)[Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v4

    invoke-virtual {p0, v5, v4, v6}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/properties/UnitValue;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 2594
    invoke-static {p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getBorders(Lcom/itextpdf/layout/renderer/IRenderer;)[Lcom/itextpdf/layout/borders/Border;

    move-result-object v4

    invoke-virtual {p0, v5, v4, v6}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/borders/Border;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 2596
    :cond_0
    invoke-static {p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getMargins(Lcom/itextpdf/layout/renderer/IRenderer;)[Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v4

    invoke-virtual {p0, v5, v4, v6}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/properties/UnitValue;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 2597
    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v4

    sub-float/2addr v3, v4

    .line 2599
    if-eqz v2, :cond_1

    .line 2600
    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v3

    .line 2602
    :cond_1
    if-eqz v0, :cond_2

    .line 2603
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    .line 2606
    :cond_2
    invoke-static {v3}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v4

    invoke-interface {p1, v1, v4}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 2608
    .end local v0    # "currentMaxHeight":Lcom/itextpdf/layout/properties/UnitValue;
    .end local v2    # "currentMinHeight":Lcom/itextpdf/layout/properties/UnitValue;
    .end local v3    # "resolvedMinHeight":F
    .end local v5    # "dummy":Lcom/itextpdf/kernel/geom/Rectangle;
    :cond_3
    return-void
.end method


# virtual methods
.method addAllChildRenderers(ILjava/util/List;)V
    .locals 1
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;)V"
        }
    .end annotation

    .line 2708
    .local p2, "children":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    invoke-virtual {p0, p2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setThisAsParent(Ljava/util/Collection;)V

    .line 2709
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    .line 2710
    return-void
.end method

.method addAllChildRenderers(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;)V"
        }
    .end annotation

    .line 2693
    .local p1, "children":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    if-nez p1, :cond_0

    .line 2694
    return-void

    .line 2696
    :cond_0
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setThisAsParent(Ljava/util/Collection;)V

    .line 2697
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 2698
    return-void
.end method

.method protected addAllProperties(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1729
    .local p1, "properties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Object;>;"
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->properties:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 1730
    return-void
.end method

.method public addChild(Lcom/itextpdf/layout/renderer/IRenderer;)V
    .locals 5
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 190
    const/16 v0, 0x34

    invoke-interface {p1, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 191
    .local v0, "positioning":Ljava/lang/Integer;
    if-eqz v0, :cond_7

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, 0x2

    if-eq v1, v2, :cond_7

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    goto :goto_3

    .line 193
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, 0x4

    if-ne v1, v2, :cond_3

    .line 194
    move-object v1, p0

    .line 195
    .local v1, "root":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    :goto_0
    iget-object v2, v1, Lcom/itextpdf/layout/renderer/AbstractRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    instance-of v2, v2, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    if-eqz v2, :cond_1

    .line 196
    iget-object v2, v1, Lcom/itextpdf/layout/renderer/AbstractRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    move-object v1, v2

    check-cast v1, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    goto :goto_0

    .line 198
    :cond_1
    if-ne v1, p0, :cond_2

    .line 199
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->positionedRenderers:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 201
    :cond_2
    invoke-virtual {v1, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->addChild(Lcom/itextpdf/layout/renderer/IRenderer;)V

    goto :goto_2

    .line 203
    .end local v1    # "root":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_6

    .line 207
    move-object v1, p0

    .line 208
    .local v1, "positionedParent":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    invoke-static {p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->noAbsolutePositionInfo(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v2

    .line 209
    .local v2, "noPositionInfo":Z
    :goto_1
    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isPositioned()Z

    move-result v3

    if-nez v3, :cond_4

    if-nez v2, :cond_4

    .line 210
    iget-object v3, v1, Lcom/itextpdf/layout/renderer/AbstractRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 211
    .local v3, "parent":Lcom/itextpdf/layout/renderer/IRenderer;
    instance-of v4, v3, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    if-eqz v4, :cond_4

    .line 212
    move-object v1, v3

    check-cast v1, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 216
    .end local v3    # "parent":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_1

    .line 217
    :cond_4
    if-ne v1, p0, :cond_5

    .line 218
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->positionedRenderers:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 220
    :cond_5
    invoke-virtual {v1, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->addChild(Lcom/itextpdf/layout/renderer/IRenderer;)V

    goto :goto_4

    .line 203
    .end local v1    # "positionedParent":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .end local v2    # "noPositionInfo":Z
    :cond_6
    :goto_2
    goto :goto_4

    .line 192
    :cond_7
    :goto_3
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 225
    :goto_4
    instance-of v1, p1, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    if-eqz v1, :cond_9

    move-object v1, p1

    check-cast v1, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isPositioned()Z

    move-result v1

    if-nez v1, :cond_9

    move-object v1, p1

    check-cast v1, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    iget-object v1, v1, Lcom/itextpdf/layout/renderer/AbstractRenderer;->positionedRenderers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_9

    .line 229
    const/4 v1, 0x0

    .line 230
    .local v1, "pos":I
    move-object v2, p1

    check-cast v2, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    iget-object v2, v2, Lcom/itextpdf/layout/renderer/AbstractRenderer;->positionedRenderers:Ljava/util/List;

    .line 231
    .local v2, "childPositionedRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    :goto_5
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_9

    .line 232
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-static {v3}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->noAbsolutePositionInfo(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 233
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 235
    :cond_8
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->positionedRenderers:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 236
    invoke-interface {v2, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_5

    .line 240
    .end local v1    # "pos":I
    .end local v2    # "childPositionedRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    :cond_9
    return-void
.end method

.method addChildRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)V
    .locals 1
    .param p1, "child"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 2682
    invoke-interface {p1, p0}, Lcom/itextpdf/layout/renderer/IRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    .line 2683
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2684
    return-void
.end method

.method protected alignChildHorizontally(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 7
    .param p1, "childRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p2, "currentArea"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 2224
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v0

    .line 2225
    .local v0, "availableWidth":F
    const/16 v1, 0x1c

    invoke-interface {p1, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/HorizontalAlignment;

    .line 2226
    .local v1, "horizontalAlignment":Lcom/itextpdf/layout/properties/HorizontalAlignment;
    if-eqz v1, :cond_0

    sget-object v2, Lcom/itextpdf/layout/properties/HorizontalAlignment;->LEFT:Lcom/itextpdf/layout/properties/HorizontalAlignment;

    if-eq v1, v2, :cond_0

    .line 2227
    invoke-interface {p1}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    sub-float v2, v0, v2

    .line 2228
    .local v2, "freeSpace":F
    const/4 v3, 0x0

    cmpl-float v4, v2, v3

    if-lez v4, :cond_0

    .line 2230
    :try_start_0
    sget-object v4, Lcom/itextpdf/layout/renderer/AbstractRenderer$1;->$SwitchMap$com$itextpdf$layout$properties$HorizontalAlignment:[I

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/HorizontalAlignment;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_0

    goto :goto_0

    .line 2235
    :pswitch_0
    const/high16 v4, 0x40000000    # 2.0f

    div-float v4, v2, v4

    invoke-interface {p1, v4, v3}, Lcom/itextpdf/layout/renderer/IRenderer;->move(FF)V

    goto :goto_0

    .line 2232
    :pswitch_1
    invoke-interface {p1, v2, v3}, Lcom/itextpdf/layout/renderer/IRenderer;->move(FF)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2233
    nop

    .line 2242
    :goto_0
    goto :goto_1

    .line 2238
    :catch_0
    move-exception v3

    .line 2239
    .local v3, "e":Ljava/lang/NullPointerException;
    const-class v4, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-static {v4}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v4

    .line 2240
    .local v4, "logger":Lorg/slf4j/Logger;
    const-string v5, "Some of the children might not end up aligned horizontally."

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    const-string v6, "Occupied area has not been initialized. {0}"

    invoke-static {v6, v5}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 2245
    .end local v2    # "freeSpace":F
    .end local v3    # "e":Ljava/lang/NullPointerException;
    .end local v4    # "logger":Lorg/slf4j/Logger;
    :cond_0
    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected allowLastYLineRecursiveExtraction()Z
    .locals 2

    .line 1763
    sget-object v0, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->HIDDEN:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    const/16 v1, 0x67

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isOverflowProperty(Lcom/itextpdf/layout/properties/OverflowPropertyValue;I)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->HIDDEN:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    .line 1764
    const/16 v1, 0x68

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isOverflowProperty(Lcom/itextpdf/layout/properties/OverflowPropertyValue;I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1763
    :goto_0
    return v0
.end method

.method protected applyAbsolutePosition(Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 8
    .param p1, "parentRect"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1879
    const/16 v0, 0x49

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v0

    .line 1880
    .local v0, "top":Ljava/lang/Float;
    const/16 v1, 0xe

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v1

    .line 1881
    .local v1, "bottom":Ljava/lang/Float;
    const/16 v2, 0x22

    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v2

    .line 1882
    .local v2, "left":Ljava/lang/Float;
    const/16 v3, 0x36

    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v3

    .line 1884
    .local v3, "right":Ljava/lang/Float;
    const/4 v4, 0x0

    if-nez v2, :cond_0

    if-nez v3, :cond_0

    sget-object v5, Lcom/itextpdf/layout/properties/BaseDirection;->RIGHT_TO_LEFT:Lcom/itextpdf/layout/properties/BaseDirection;

    const/4 v6, 0x7

    invoke-virtual {p0, v6}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/itextpdf/layout/properties/BaseDirection;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1885
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    .line 1888
    :cond_0
    if-nez v0, :cond_1

    if-nez v1, :cond_1

    .line 1889
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    .line 1893
    :cond_1
    if-eqz v3, :cond_2

    .line 1894
    :try_start_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v5

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v6

    sub-float/2addr v5, v6

    iget-object v6, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v6

    sub-float/2addr v5, v6

    invoke-virtual {p0, v5, v4}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->move(FF)V

    goto :goto_0

    .line 1908
    :catch_0
    move-exception v4

    goto :goto_1

    .line 1897
    :cond_2
    :goto_0
    if-eqz v2, :cond_3

    .line 1898
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v5

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v6

    add-float/2addr v5, v6

    iget-object v6, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v6

    sub-float/2addr v5, v6

    invoke-virtual {p0, v5, v4}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->move(FF)V

    .line 1901
    :cond_3
    if-eqz v0, :cond_4

    .line 1902
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v5

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v6

    sub-float/2addr v5, v6

    iget-object v6, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v6

    sub-float/2addr v5, v6

    invoke-virtual {p0, v4, v5}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->move(FF)V

    .line 1905
    :cond_4
    if-eqz v1, :cond_5

    .line 1906
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v5

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v6

    add-float/2addr v5, v6

    iget-object v6, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v6

    sub-float/2addr v5, v6

    invoke-virtual {p0, v4, v5}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->move(FF)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 1909
    .local v4, "exc":Ljava/lang/Exception;
    :goto_1
    const-class v5, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-static {v5}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v5

    .line 1910
    .local v5, "logger":Lorg/slf4j/Logger;
    const-string v6, "Absolute positioning might be applied incorrectly."

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    const-string v7, "Occupied area has not been initialized. {0}"

    invoke-static {v7, v6}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    goto :goto_3

    .line 1912
    .end local v4    # "exc":Ljava/lang/Exception;
    .end local v5    # "logger":Lorg/slf4j/Logger;
    :cond_5
    :goto_2
    nop

    .line 1913
    :goto_3
    return-void
.end method

.method applyAbsolutePositionIfNeeded(Lcom/itextpdf/layout/layout/LayoutContext;)V
    .locals 1
    .param p1, "layoutContext"    # Lcom/itextpdf/layout/layout/LayoutContext;

    .line 2567
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isAbsolutePosition()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2568
    instance-of v0, p1, Lcom/itextpdf/layout/layout/PositionedLayoutContext;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/itextpdf/layout/layout/PositionedLayoutContext;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/PositionedLayoutContext;->getParentOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    :goto_0
    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyAbsolutePosition(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 2570
    :cond_1
    return-void
.end method

.method protected applyAction(Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 10
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 1978
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 1979
    .local v1, "action":Lcom/itextpdf/kernel/pdf/action/PdfAction;
    if-eqz v1, :cond_2

    .line 1980
    const/16 v2, 0x58

    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;

    .line 1981
    .local v3, "link":Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;
    if-nez v3, :cond_1

    .line 1982
    new-instance v4, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;

    new-instance v5, Lcom/itextpdf/kernel/geom/Rectangle;

    const/4 v6, 0x0

    invoke-direct {v5, v6, v6, v6, v6}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    invoke-direct {v4, v5}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    const/4 v5, 0x4

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->setFlags(I)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v4

    move-object v3, v4

    check-cast v3, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;

    .line 1983
    const/16 v4, 0x9

    invoke-virtual {p0, v4}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/borders/Border;

    .line 1984
    .local v4, "border":Lcom/itextpdf/layout/borders/Border;
    const/4 v5, 0x3

    if-eqz v4, :cond_0

    .line 1985
    new-instance v7, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v4}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v8

    new-array v5, v5, [F

    const/4 v9, 0x0

    aput v6, v5, v9

    aput v6, v5, v0

    const/4 v0, 0x2

    aput v8, v5, v0

    invoke-direct {v7, v5}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([F)V

    invoke-virtual {v3, v7}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->setBorder(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    goto :goto_0

    .line 1987
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    new-array v5, v5, [F

    fill-array-data v5, :array_0

    invoke-direct {v0, v5}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([F)V

    invoke-virtual {v3, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->setBorder(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 1989
    :goto_0
    invoke-virtual {p0, v2, v3}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    .line 1991
    .end local v4    # "border":Lcom/itextpdf/layout/borders/Border;
    :cond_1
    invoke-virtual {v3, v1}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->setAction(Lcom/itextpdf/kernel/pdf/action/PdfAction;)Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;

    .line 1993
    .end local v3    # "link":Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;
    :cond_2
    return-void

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
    .end array-data
.end method

.method public applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 2
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "reverse"    # Z

    .line 1270
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getBorders()[Lcom/itextpdf/layout/borders/Border;

    move-result-object v0

    .line 1271
    .local v0, "borders":[Lcom/itextpdf/layout/borders/Border;
    invoke-virtual {p0, p1, v0, p2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/borders/Border;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    return-object v1
.end method

.method protected applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/borders/Border;Z)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 9
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "borders"    # [Lcom/itextpdf/layout/borders/Border;
    .param p3, "reverse"    # Z

    .line 1871
    const/4 v0, 0x0

    aget-object v1, p2, v0

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    aget-object v0, p2, v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v0

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    move v4, v0

    .line 1872
    .local v4, "topWidth":F
    const/4 v0, 0x1

    aget-object v1, p2, v0

    if-eqz v1, :cond_1

    aget-object v0, p2, v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v0

    move v5, v0

    goto :goto_1

    :cond_1
    move v5, v2

    .line 1873
    .local v5, "rightWidth":F
    :goto_1
    const/4 v0, 0x2

    aget-object v1, p2, v0

    if-eqz v1, :cond_2

    aget-object v0, p2, v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v0

    move v6, v0

    goto :goto_2

    :cond_2
    move v6, v2

    .line 1874
    .local v6, "bottomWidth":F
    :goto_2
    const/4 v0, 0x3

    aget-object v1, p2, v0

    if-eqz v1, :cond_3

    aget-object v0, p2, v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v2

    :cond_3
    move v7, v2

    .line 1875
    .local v7, "leftWidth":F
    move-object v3, p1

    move v8, p3

    .end local p1    # "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local p3    # "reverse":Z
    .local v3, "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v8, "reverse":Z
    invoke-virtual/range {v3 .. v8}, Lcom/itextpdf/kernel/geom/Rectangle;->applyMargins(FFFFZ)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object p1

    return-object p1
.end method

.method protected applyDestination(Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 11
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 1931
    const/16 v0, 0x11

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    .line 1932
    .local v1, "destination":Ljava/lang/Object;
    if-nez v1, :cond_0

    .line 1933
    return-void

    .line 1935
    :cond_0
    const/4 v2, 0x0

    .line 1936
    .local v2, "destinationName":Ljava/lang/String;
    const/4 v3, 0x0

    .line 1937
    .local v3, "linkActionDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    instance-of v4, v1, Ljava/lang/String;

    if-eqz v4, :cond_1

    .line 1938
    move-object v2, v1

    check-cast v2, Ljava/lang/String;

    goto :goto_0

    .line 1939
    :cond_1
    sget-object v4, Lcom/itextpdf/layout/renderer/AbstractRenderer;->CHECK_TUPLE2_TYPE:Lcom/itextpdf/commons/datastructures/Tuple2;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1941
    move-object v4, v1

    check-cast v4, Lcom/itextpdf/commons/datastructures/Tuple2;

    .line 1942
    .local v4, "destTuple":Lcom/itextpdf/commons/datastructures/Tuple2;, "Lcom/itextpdf/commons/datastructures/Tuple2<Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfDictionary;>;"
    invoke-virtual {v4}, Lcom/itextpdf/commons/datastructures/Tuple2;->getFirst()Ljava/lang/Object;

    move-result-object v5

    move-object v2, v5

    check-cast v2, Ljava/lang/String;

    .line 1943
    invoke-virtual {v4}, Lcom/itextpdf/commons/datastructures/Tuple2;->getSecond()Ljava/lang/Object;

    move-result-object v5

    move-object v3, v5

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 1946
    .end local v4    # "destTuple":Lcom/itextpdf/commons/datastructures/Tuple2;, "Lcom/itextpdf/commons/datastructures/Tuple2<Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfDictionary;>;"
    :cond_2
    :goto_0
    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v2, :cond_5

    .line 1947
    iget-object v6, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v6

    .line 1948
    .local v6, "pageNumber":I
    if-lt v6, v5, :cond_4

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v7

    if-le v6, v7, :cond_3

    goto :goto_1

    .line 1957
    :cond_3
    new-instance v7, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v7}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 1958
    .local v7, "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-virtual {p1, v6}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 1959
    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->XYZ:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v7, v8}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 1960
    new-instance v8, Lcom/itextpdf/kernel/pdf/PdfNumber;

    iget-object v9, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v9}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v9

    float-to-double v9, v9

    invoke-direct {v8, v9, v10}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v7, v8}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 1961
    new-instance v8, Lcom/itextpdf/kernel/pdf/PdfNumber;

    iget-object v9, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v9}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v9

    iget-object v10, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v10}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v10

    invoke-virtual {v10}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v10

    add-float/2addr v9, v10

    float-to-double v9, v9

    invoke-direct {v8, v9, v10}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v7, v8}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 1962
    new-instance v8, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v8, v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v7, v8}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 1963
    invoke-virtual {v7, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v8

    invoke-virtual {p1, v2, v8}, Lcom/itextpdf/kernel/pdf/PdfDocument;->addNamedDestination(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfObject;)V

    goto :goto_2

    .line 1949
    .end local v7    # "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_4
    :goto_1
    const-class v0, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 1950
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v4, "Property.DESTINATION, which specifies this element location as destination, see ElementPropertyContainer.setDestination."

    .line 1951
    .local v4, "logMessageArg":Ljava/lang/String;
    const-string v5, "Unable to apply page dependent property, because the page on which element is drawn is unknown. Usually this means that element was added to the Canvas instance that was created not with constructor taking PdfPage as argument. Not processed property: {0}"

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v7

    invoke-static {v5, v7}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v5}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 1954
    return-void

    .line 1966
    .end local v0    # "logger":Lorg/slf4j/Logger;
    .end local v4    # "logMessageArg":Ljava/lang/String;
    .end local v6    # "pageNumber":I
    :cond_5
    :goto_2
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPdfVersion()Lcom/itextpdf/kernel/pdf/PdfVersion;

    move-result-object v6

    sget-object v7, Lcom/itextpdf/kernel/pdf/PdfVersion;->PDF_2_0:Lcom/itextpdf/kernel/pdf/PdfVersion;

    invoke-virtual {v6, v7}, Lcom/itextpdf/kernel/pdf/PdfVersion;->compareTo(Lcom/itextpdf/kernel/pdf/PdfVersion;)I

    move-result v6

    if-ltz v6, :cond_6

    move v4, v5

    .line 1967
    .local v4, "isPdf20":Z
    :cond_6
    if-eqz v3, :cond_7

    if-eqz v4, :cond_7

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->isTagged()Z

    move-result v5

    if-eqz v5, :cond_7

    .line 1969
    invoke-static {p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getCurrentStructElem(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v5

    .line 1970
    .local v5, "structElem":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    invoke-static {v5}, Lcom/itextpdf/kernel/pdf/navigation/PdfStructureDestination;->createFit(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/navigation/PdfStructureDestination;

    move-result-object v6

    .line 1971
    .local v6, "dest":Lcom/itextpdf/kernel/pdf/navigation/PdfStructureDestination;
    sget-object v7, Lcom/itextpdf/kernel/pdf/PdfName;->SD:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/navigation/PdfStructureDestination;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v8

    invoke-virtual {v3, v7, v8}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1974
    .end local v5    # "structElem":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    .end local v6    # "dest":Lcom/itextpdf/kernel/pdf/navigation/PdfStructureDestination;
    :cond_7
    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->deleteProperty(I)V

    .line 1975
    return-void
.end method

.method protected applyDestinationsAndAnnotation(Lcom/itextpdf/layout/renderer/DrawContext;)V
    .locals 1
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;

    .line 1292
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/DrawContext;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyDestination(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 1293
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/DrawContext;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyAction(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 1294
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/DrawContext;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyLinkAnnotation(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 1295
    return-void
.end method

.method protected applyLinkAnnotation(Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 8
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 1996
    const-class v0, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 1997
    .local v0, "logger":Lorg/slf4j/Logger;
    const/16 v1, 0x58

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;

    .line 1998
    .local v1, "linkAnnotation":Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;
    if-nez v1, :cond_0

    .line 1999
    return-void

    .line 2002
    :cond_0
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v2

    .line 2003
    .local v2, "pageNumber":I
    const/4 v3, 0x1

    if-lt v2, v3, :cond_3

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v3

    if-le v2, v3, :cond_1

    goto :goto_1

    .line 2014
    :cond_1
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->clone()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 2015
    .local v3, "newAnnotation":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-static {v3}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->makeAnnotation(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v4

    move-object v1, v4

    check-cast v1, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;

    .line 2016
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->calculateAbsolutePdfBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    .line 2017
    .local v4, "pdfBBox":Lcom/itextpdf/kernel/geom/Rectangle;
    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v5, v4}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-virtual {v1, v5}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->setRectangle(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 2019
    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v5

    .line 2022
    .local v5, "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfPage;->isFlushed()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 2023
    const-string v6, "link annotation applying"

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    const-string v7, "Page was flushed. {0} will not be performed."

    invoke-static {v7, v6}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v6}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    goto :goto_0

    .line 2026
    :cond_2
    invoke-virtual {v5, v1}, Lcom/itextpdf/kernel/pdf/PdfPage;->addAnnotation(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;)Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 2028
    :goto_0
    return-void

    .line 2004
    .end local v3    # "newAnnotation":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v4    # "pdfBBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v5    # "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    :cond_3
    :goto_1
    const-string v3, "Property.LINK_ANNOTATION, which specifies a link associated with this element content area, see com.itextpdf.layout.element.Link."

    .line 2005
    .local v3, "logMessageArg":Ljava/lang/String;
    const-string v4, "Unable to apply page dependent property, because the page on which element is drawn is unknown. Usually this means that element was added to the Canvas instance that was created not with constructor taking PdfPage as argument. Not processed property: {0}"

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 2008
    return-void
.end method

.method public applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 1
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "reverse"    # Z

    .line 1256
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getMargins()[Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    invoke-virtual {p0, p1, v0, p2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/properties/UnitValue;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    return-object v0
.end method

.method protected applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/properties/UnitValue;Z)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 12
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "margins"    # [Lcom/itextpdf/layout/properties/UnitValue;
    .param p3, "reverse"    # Z

    .line 1777
    const/4 v0, 0x0

    aget-object v1, p2, v0

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v1

    const-string v2, "Property {0} in percents is not supported"

    const-class v3, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    if-nez v1, :cond_0

    .line 1778
    invoke-static {v3}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 1779
    .local v1, "logger":Lorg/slf4j/Logger;
    nop

    .line 1780
    const/16 v4, 0x2e

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    .line 1779
    invoke-static {v2, v4}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1782
    .end local v1    # "logger":Lorg/slf4j/Logger;
    :cond_0
    const/4 v1, 0x1

    aget-object v4, p2, v1

    invoke-virtual {v4}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v4

    if-nez v4, :cond_1

    .line 1783
    invoke-static {v3}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v4

    .line 1784
    .local v4, "logger":Lorg/slf4j/Logger;
    nop

    .line 1785
    const/16 v5, 0x2d

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    .line 1784
    invoke-static {v2, v5}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1787
    .end local v4    # "logger":Lorg/slf4j/Logger;
    :cond_1
    const/4 v4, 0x2

    aget-object v5, p2, v4

    invoke-virtual {v5}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v5

    if-nez v5, :cond_2

    .line 1788
    invoke-static {v3}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v5

    .line 1789
    .local v5, "logger":Lorg/slf4j/Logger;
    nop

    .line 1790
    const/16 v6, 0x2b

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    .line 1789
    invoke-static {v2, v6}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1792
    .end local v5    # "logger":Lorg/slf4j/Logger;
    :cond_2
    const/4 v5, 0x3

    aget-object v6, p2, v5

    invoke-virtual {v6}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v6

    if-nez v6, :cond_3

    .line 1793
    invoke-static {v3}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v3

    .line 1794
    .local v3, "logger":Lorg/slf4j/Logger;
    nop

    .line 1795
    const/16 v6, 0x2c

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    .line 1794
    invoke-static {v2, v6}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v3, v2}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1797
    .end local v3    # "logger":Lorg/slf4j/Logger;
    :cond_3
    aget-object v0, p2, v0

    .line 1798
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v7

    aget-object v0, p2, v1

    .line 1799
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v8

    aget-object v0, p2, v4

    .line 1800
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v9

    aget-object v0, p2, v5

    .line 1801
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v10

    .line 1797
    move-object v6, p1

    move v11, p3

    .end local p1    # "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local p3    # "reverse":Z
    .local v6, "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v11, "reverse":Z
    invoke-virtual/range {v6 .. v11}, Lcom/itextpdf/kernel/geom/Rectangle;->applyMargins(FFFFZ)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object p1

    return-object p1
.end method

.method applyMarginsBordersPaddings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 0
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "reverse"    # Z

    .line 1240
    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1241
    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1242
    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1243
    return-object p1
.end method

.method public applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 1
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "reverse"    # Z

    .line 1284
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPaddings()[Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    invoke-virtual {p0, p1, v0, p2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/properties/UnitValue;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    return-object v0
.end method

.method protected applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/properties/UnitValue;Z)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 12
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "paddings"    # [Lcom/itextpdf/layout/properties/UnitValue;
    .param p3, "reverse"    # Z

    .line 1834
    const/4 v0, 0x0

    aget-object v1, p2, v0

    const-string v2, "Property {0} in percents is not supported"

    const-class v3, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    if-eqz v1, :cond_0

    aget-object v1, p2, v0

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1835
    invoke-static {v3}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 1836
    .local v1, "logger":Lorg/slf4j/Logger;
    nop

    .line 1837
    const/16 v4, 0x32

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    .line 1836
    invoke-static {v2, v4}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1839
    .end local v1    # "logger":Lorg/slf4j/Logger;
    :cond_0
    const/4 v1, 0x1

    aget-object v4, p2, v1

    if-eqz v4, :cond_1

    aget-object v4, p2, v1

    invoke-virtual {v4}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v4

    if-nez v4, :cond_1

    .line 1840
    invoke-static {v3}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v4

    .line 1841
    .local v4, "logger":Lorg/slf4j/Logger;
    nop

    .line 1842
    const/16 v5, 0x31

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    .line 1841
    invoke-static {v2, v5}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1844
    .end local v4    # "logger":Lorg/slf4j/Logger;
    :cond_1
    const/4 v4, 0x2

    aget-object v5, p2, v4

    if-eqz v5, :cond_2

    aget-object v5, p2, v4

    invoke-virtual {v5}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v5

    if-nez v5, :cond_2

    .line 1845
    invoke-static {v3}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v5

    .line 1846
    .local v5, "logger":Lorg/slf4j/Logger;
    nop

    .line 1847
    const/16 v6, 0x2f

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    .line 1846
    invoke-static {v2, v6}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1849
    .end local v5    # "logger":Lorg/slf4j/Logger;
    :cond_2
    const/4 v5, 0x3

    aget-object v6, p2, v5

    if-eqz v6, :cond_3

    aget-object v6, p2, v5

    invoke-virtual {v6}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v6

    if-nez v6, :cond_3

    .line 1850
    invoke-static {v3}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v3

    .line 1851
    .local v3, "logger":Lorg/slf4j/Logger;
    nop

    .line 1852
    const/16 v6, 0x30

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    .line 1851
    invoke-static {v2, v6}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v3, v2}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1854
    .end local v3    # "logger":Lorg/slf4j/Logger;
    :cond_3
    aget-object v2, p2, v0

    const/4 v3, 0x0

    if-eqz v2, :cond_4

    aget-object v0, p2, v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v0

    move v7, v0

    goto :goto_0

    :cond_4
    move v7, v3

    :goto_0
    aget-object v0, p2, v1

    if-eqz v0, :cond_5

    aget-object v0, p2, v1

    .line 1855
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v0

    move v8, v0

    goto :goto_1

    :cond_5
    move v8, v3

    :goto_1
    aget-object v0, p2, v4

    if-eqz v0, :cond_6

    aget-object v0, p2, v4

    .line 1856
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v0

    move v9, v0

    goto :goto_2

    :cond_6
    move v9, v3

    :goto_2
    aget-object v0, p2, v5

    if-eqz v0, :cond_7

    aget-object v0, p2, v5

    .line 1857
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v3

    goto :goto_3

    :cond_7
    nop

    :goto_3
    move v10, v3

    .line 1854
    move-object v6, p1

    move v11, p3

    .end local p1    # "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local p3    # "reverse":Z
    .local v6, "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v11, "reverse":Z
    invoke-virtual/range {v6 .. v11}, Lcom/itextpdf/kernel/geom/Rectangle;->applyMargins(FFFFZ)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object p1

    return-object p1
.end method

.method protected applyRelativePositioningTranslation(Z)V
    .locals 9
    .param p1, "reverse"    # Z

    .line 1916
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/16 v2, 0x49

    invoke-virtual {p0, v2, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsFloat(ILjava/lang/Float;)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    .line 1917
    .local v2, "top":F
    const/16 v3, 0xe

    invoke-virtual {p0, v3, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsFloat(ILjava/lang/Float;)Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    .line 1918
    .local v3, "bottom":F
    const/16 v4, 0x22

    invoke-virtual {p0, v4, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsFloat(ILjava/lang/Float;)Ljava/lang/Float;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    .line 1919
    .local v4, "left":F
    const/16 v5, 0x36

    invoke-virtual {p0, v5, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsFloat(ILjava/lang/Float;)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    .line 1921
    .local v1, "right":F
    if-eqz p1, :cond_0

    const/4 v5, -0x1

    goto :goto_0

    :cond_0
    const/4 v5, 0x1

    .line 1923
    .local v5, "reverseMultiplier":I
    :goto_0
    cmpl-float v6, v4, v0

    if-eqz v6, :cond_1

    int-to-float v6, v5

    mul-float/2addr v6, v4

    goto :goto_1

    :cond_1
    neg-float v6, v1

    int-to-float v7, v5

    mul-float/2addr v6, v7

    .line 1924
    .local v6, "dxRight":F
    :goto_1
    cmpl-float v7, v2, v0

    if-eqz v7, :cond_2

    neg-float v7, v2

    int-to-float v8, v5

    mul-float/2addr v7, v8

    goto :goto_2

    :cond_2
    int-to-float v7, v5

    mul-float/2addr v7, v3

    .line 1926
    .local v7, "dyUp":F
    :goto_2
    cmpl-float v8, v6, v0

    if-nez v8, :cond_3

    cmpl-float v0, v7, v0

    if-eqz v0, :cond_4

    .line 1927
    :cond_3
    invoke-virtual {p0, v6, v7}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->move(FF)V

    .line 1928
    :cond_4
    return-void
.end method

.method protected beginElementOpacityApplying(Lcom/itextpdf/layout/renderer/DrawContext;)V
    .locals 4
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;

    .line 497
    const/16 v0, 0x5c

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v0

    .line 498
    .local v0, "opacity":Ljava/lang/Float;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v1

    const/high16 v2, 0x3f800000    # 1.0f

    cmpg-float v1, v1, v2

    if-gez v1, :cond_0

    .line 499
    new-instance v1, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;-><init>()V

    .line 500
    .local v1, "extGState":Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    nop

    .line 501
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->setStrokeOpacity(F)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    move-result-object v2

    .line 502
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->setFillOpacity(F)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    .line 503
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 504
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 505
    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setExtGState(Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 507
    .end local v1    # "extGState":Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    :cond_0
    return-void
.end method

.method protected beginTransformationIfApplied(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V
    .locals 2
    .param p1, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 2663
    const/16 v0, 0x35

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2664
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->createTransformationInsideOccupiedArea()Lcom/itextpdf/kernel/geom/AffineTransform;

    move-result-object v0

    .line 2665
    .local v0, "transform":Lcom/itextpdf/kernel/geom/AffineTransform;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->concatMatrix(Lcom/itextpdf/kernel/geom/AffineTransform;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 2667
    .end local v0    # "transform":Lcom/itextpdf/kernel/geom/AffineTransform;
    :cond_0
    return-void
.end method

.method protected calculateAbsolutePdfBBox()Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 6

    .line 2299
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getOccupiedAreaBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    .line 2300
    .local v0, "contentBox":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->rectangleToPointsList(Lcom/itextpdf/kernel/geom/Rectangle;)Ljava/util/List;

    move-result-object v1

    .line 2301
    .local v1, "contentBoxPoints":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Point;>;"
    move-object v2, p0

    .line 2302
    .local v2, "renderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    :goto_0
    iget-object v3, v2, Lcom/itextpdf/layout/renderer/AbstractRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    if-eqz v3, :cond_3

    .line 2303
    instance-of v3, v2, Lcom/itextpdf/layout/renderer/BlockRenderer;

    if-eqz v3, :cond_0

    .line 2304
    const/16 v3, 0x37

    invoke-virtual {v2, v3}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    .line 2305
    .local v3, "angle":Ljava/lang/Float;
    if-eqz v3, :cond_0

    .line 2306
    move-object v4, v2

    check-cast v4, Lcom/itextpdf/layout/renderer/BlockRenderer;

    .line 2307
    .local v4, "blockRenderer":Lcom/itextpdf/layout/renderer/BlockRenderer;
    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/BlockRenderer;->createRotationTransformInsideOccupiedArea()Lcom/itextpdf/kernel/geom/AffineTransform;

    move-result-object v5

    .line 2308
    .local v5, "rotationTransform":Lcom/itextpdf/kernel/geom/AffineTransform;
    invoke-virtual {p0, v1, v5}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->transformPoints(Ljava/util/List;Lcom/itextpdf/kernel/geom/AffineTransform;)Ljava/util/List;

    .line 2312
    .end local v3    # "angle":Ljava/lang/Float;
    .end local v4    # "blockRenderer":Lcom/itextpdf/layout/renderer/BlockRenderer;
    .end local v5    # "rotationTransform":Lcom/itextpdf/kernel/geom/AffineTransform;
    :cond_0
    const/16 v3, 0x35

    invoke-virtual {v2, v3}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 2313
    instance-of v3, v2, Lcom/itextpdf/layout/renderer/BlockRenderer;

    if-nez v3, :cond_1

    instance-of v3, v2, Lcom/itextpdf/layout/renderer/ImageRenderer;

    if-nez v3, :cond_1

    instance-of v3, v2, Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v3, :cond_2

    .line 2314
    :cond_1
    invoke-direct {v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->createTransformationInsideOccupiedArea()Lcom/itextpdf/kernel/geom/AffineTransform;

    move-result-object v3

    .line 2315
    .local v3, "rotationTransform":Lcom/itextpdf/kernel/geom/AffineTransform;
    invoke-virtual {p0, v1, v3}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->transformPoints(Ljava/util/List;Lcom/itextpdf/kernel/geom/AffineTransform;)Ljava/util/List;

    .line 2318
    .end local v3    # "rotationTransform":Lcom/itextpdf/kernel/geom/AffineTransform;
    :cond_2
    iget-object v3, v2, Lcom/itextpdf/layout/renderer/AbstractRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    move-object v2, v3

    check-cast v2, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    goto :goto_0

    .line 2321
    :cond_3
    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->calculateBBox(Ljava/util/List;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    return-object v3
.end method

.method protected calculateBBox(Ljava/util/List;)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Point;",
            ">;)",
            "Lcom/itextpdf/kernel/geom/Rectangle;"
        }
    .end annotation

    .line 2331
    .local p1, "points":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Point;>;"
    invoke-static {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->calculateBBox(Ljava/util/List;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    return-object v0
.end method

.method protected calculateShiftToPositionBBoxOfPointsAt(FFLjava/util/List;)[F
    .locals 8
    .param p1, "left"    # F
    .param p2, "top"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FF",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Point;",
            ">;)[F"
        }
    .end annotation

    .line 2357
    .local p3, "points":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Point;>;"
    const-wide v0, 0x7fefffffffffffffL    # Double.MAX_VALUE

    .line 2358
    .local v0, "minX":D
    const-wide v2, -0x10000000000001L

    .line 2359
    .local v2, "maxY":D
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/geom/Point;

    .line 2360
    .local v5, "point":Lcom/itextpdf/kernel/geom/Point;
    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v6

    invoke-static {v6, v7, v0, v1}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    .line 2361
    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v6

    invoke-static {v6, v7, v2, v3}, Ljava/lang/Math;->max(DD)D

    move-result-wide v2

    .line 2362
    .end local v5    # "point":Lcom/itextpdf/kernel/geom/Point;
    goto :goto_0

    .line 2364
    :cond_0
    float-to-double v4, p1

    sub-double/2addr v4, v0

    double-to-float v4, v4

    .line 2365
    .local v4, "dx":F
    float-to-double v5, p2

    sub-double/2addr v5, v2

    double-to-float v5, v5

    .line 2366
    .local v5, "dy":F
    const/4 v6, 0x2

    new-array v6, v6, [F

    const/4 v7, 0x0

    aput v4, v6, v7

    const/4 v7, 0x1

    aput v5, v6, v7

    return-object v6
.end method

.method protected clipBackgroundArea(Lcom/itextpdf/layout/renderer/DrawContext;Lcom/itextpdf/kernel/geom/Rectangle;)Z
    .locals 7
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;
    .param p2, "outerBorderBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 748
    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    .end local p1    # "drawContext":Lcom/itextpdf/layout/renderer/DrawContext;
    .end local p2    # "outerBorderBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v1, "drawContext":Lcom/itextpdf/layout/renderer/DrawContext;
    .local v2, "outerBorderBox":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-direct/range {v0 .. v6}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->clipArea(Lcom/itextpdf/layout/renderer/DrawContext;Lcom/itextpdf/kernel/geom/Rectangle;ZZZZ)Z

    move-result p1

    return p1
.end method

.method protected clipBackgroundArea(Lcom/itextpdf/layout/renderer/DrawContext;Lcom/itextpdf/kernel/geom/Rectangle;Z)Z
    .locals 7
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;
    .param p2, "outerBorderBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p3, "considerBordersBeforeClipping"    # Z

    .line 752
    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v3, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v5, p3

    .end local p1    # "drawContext":Lcom/itextpdf/layout/renderer/DrawContext;
    .end local p2    # "outerBorderBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local p3    # "considerBordersBeforeClipping":Z
    .local v1, "drawContext":Lcom/itextpdf/layout/renderer/DrawContext;
    .local v2, "outerBorderBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v5, "considerBordersBeforeClipping":Z
    invoke-direct/range {v0 .. v6}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->clipArea(Lcom/itextpdf/layout/renderer/DrawContext;Lcom/itextpdf/kernel/geom/Rectangle;ZZZZ)Z

    move-result p1

    return p1
.end method

.method protected clipBorderArea(Lcom/itextpdf/layout/renderer/DrawContext;Lcom/itextpdf/kernel/geom/Rectangle;)Z
    .locals 7
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;
    .param p2, "outerBorderBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 744
    const/4 v5, 0x0

    const/4 v6, 0x1

    const/4 v3, 0x1

    const/4 v4, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    .end local p1    # "drawContext":Lcom/itextpdf/layout/renderer/DrawContext;
    .end local p2    # "outerBorderBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v1, "drawContext":Lcom/itextpdf/layout/renderer/DrawContext;
    .local v2, "outerBorderBox":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-direct/range {v0 .. v6}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->clipArea(Lcom/itextpdf/layout/renderer/DrawContext;Lcom/itextpdf/kernel/geom/Rectangle;ZZZZ)Z

    move-result p1

    return p1
.end method

.method createFontCharacteristics()Lcom/itextpdf/layout/font/FontCharacteristics;
    .locals 3

    .line 2485
    new-instance v0, Lcom/itextpdf/layout/font/FontCharacteristics;

    invoke-direct {v0}, Lcom/itextpdf/layout/font/FontCharacteristics;-><init>()V

    .line 2486
    .local v0, "fc":Lcom/itextpdf/layout/font/FontCharacteristics;
    const/16 v1, 0x5f

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->hasProperty(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2487
    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/font/FontCharacteristics;->setFontWeight(Ljava/lang/String;)Lcom/itextpdf/layout/font/FontCharacteristics;

    .line 2489
    :cond_0
    const/16 v1, 0x5e

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->hasProperty(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2490
    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/font/FontCharacteristics;->setFontStyle(Ljava/lang/String;)Lcom/itextpdf/layout/font/FontCharacteristics;

    .line 2492
    :cond_1
    return-object v0
.end method

.method public deleteOwnProperty(I)V
    .locals 2
    .param p1, "property"    # I

    .line 292
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->properties:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 293
    return-void
.end method

.method public deleteProperty(I)V
    .locals 2
    .param p1, "property"    # I

    .line 302
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->properties:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 303
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->properties:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 305
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    if-eqz v0, :cond_1

    .line 306
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    invoke-interface {v0, p1}, Lcom/itextpdf/layout/IPropertyContainer;->deleteOwnProperty(I)V

    .line 309
    :cond_1
    :goto_0
    return-void
.end method

.method public draw(Lcom/itextpdf/layout/renderer/DrawContext;)V
    .locals 2
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;

    .line 475
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyDestinationsAndAnnotation(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 477
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isRelativePosition()Z

    move-result v0

    .line 478
    .local v0, "relativePosition":Z
    if-eqz v0, :cond_0

    .line 479
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyRelativePositioningTranslation(Z)V

    .line 482
    :cond_0
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->beginElementOpacityApplying(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 483
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->drawBackground(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 484
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->drawBorder(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 485
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->drawChildren(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 486
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->drawPositionedChildren(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 487
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->endElementOpacityApplying(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 489
    const/4 v1, 0x1

    if-eqz v0, :cond_1

    .line 490
    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyRelativePositioningTranslation(Z)V

    .line 493
    :cond_1
    iput-boolean v1, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->flushed:Z

    .line 494
    return-void
.end method

.method public drawBackground(Lcom/itextpdf/layout/renderer/DrawContext;)V
    .locals 8
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;

    .line 523
    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/Background;

    .line 524
    .local v0, "background":Lcom/itextpdf/layout/properties/Background;
    const/16 v1, 0x5a

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 526
    .local v1, "backgroundImagesList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/properties/BackgroundImage;>;"
    if-nez v0, :cond_0

    if-eqz v1, :cond_7

    .line 527
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getOccupiedAreaBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    .line 528
    .local v2, "bBox":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/DrawContext;->isTaggingEnabled()Z

    move-result v3

    .line 529
    .local v3, "isTagged":Z
    if-eqz v3, :cond_1

    .line 530
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v4

    new-instance v5, Lcom/itextpdf/kernel/pdf/canvas/CanvasArtifact;

    invoke-direct {v5}, Lcom/itextpdf/kernel/pdf/canvas/CanvasArtifact;-><init>()V

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->openTag(Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 532
    :cond_1
    const/4 v4, 0x0

    invoke-virtual {p0, v2, v4}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getBackgroundArea(Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    .line 533
    .local v4, "backgroundArea":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v5

    const/4 v6, 0x0

    cmpg-float v5, v5, v6

    if-lez v5, :cond_5

    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v5

    cmpg-float v5, v5, v6

    if-gtz v5, :cond_2

    goto :goto_0

    .line 538
    :cond_2
    const/4 v5, 0x0

    .line 539
    .local v5, "backgroundAreaIsClipped":Z
    if-eqz v0, :cond_3

    .line 541
    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v6

    .line 542
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/Background;->getBackgroundClip()Lcom/itextpdf/layout/properties/BackgroundBox;

    move-result-object v7

    .line 541
    invoke-direct {p0, v6, v7}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyBackgroundBoxProperty(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/layout/properties/BackgroundBox;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v6

    .line 543
    .local v6, "clippedBackgroundArea":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {p0, p1, v6}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->clipBackgroundArea(Lcom/itextpdf/layout/renderer/DrawContext;Lcom/itextpdf/kernel/geom/Rectangle;)Z

    move-result v5

    .line 544
    invoke-direct {p0, v0, p1, v6}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->drawColorBackground(Lcom/itextpdf/layout/properties/Background;Lcom/itextpdf/layout/renderer/DrawContext;Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 546
    .end local v6    # "clippedBackgroundArea":Lcom/itextpdf/kernel/geom/Rectangle;
    :cond_3
    if-eqz v1, :cond_4

    .line 547
    invoke-direct {p0, v1, v5, p1, v4}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->drawBackgroundImagesList(Ljava/util/List;ZLcom/itextpdf/layout/renderer/DrawContext;Lcom/itextpdf/kernel/geom/Rectangle;)Z

    move-result v5

    .line 550
    :cond_4
    if-eqz v5, :cond_6

    .line 551
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    goto :goto_1

    .line 534
    .end local v5    # "backgroundAreaIsClipped":Z
    :cond_5
    :goto_0
    const-class v5, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-static {v5}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v5

    .line 535
    .local v5, "logger":Lorg/slf4j/Logger;
    const-string v6, "background"

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    const-string v7, "The {0} rectangle has negative or zero sizes. It will not be displayed."

    invoke-static {v7, v6}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 537
    .end local v5    # "logger":Lorg/slf4j/Logger;
    nop

    .line 554
    :cond_6
    :goto_1
    if-eqz v3, :cond_7

    .line 555
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->closeTag()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 558
    .end local v2    # "bBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v3    # "isTagged":Z
    .end local v4    # "backgroundArea":Lcom/itextpdf/kernel/geom/Rectangle;
    :cond_7
    return-void
.end method

.method public drawBorder(Lcom/itextpdf/layout/renderer/DrawContext;)V
    .locals 38
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;

    .line 1062
    move-object/from16 v0, p0

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getBorders()[Lcom/itextpdf/layout/borders/Border;

    move-result-object v1

    .line 1063
    .local v1, "borders":[Lcom/itextpdf/layout/borders/Border;
    const/4 v2, 0x0

    .line 1065
    .local v2, "gotBorders":Z
    array-length v3, v1

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    const/4 v6, 0x1

    if-ge v5, v3, :cond_2

    aget-object v7, v1, v5

    .line 1066
    .local v7, "border":Lcom/itextpdf/layout/borders/Border;
    if-nez v2, :cond_1

    if-eqz v7, :cond_0

    goto :goto_1

    :cond_0
    move v6, v4

    :cond_1
    :goto_1
    move v2, v6

    .line 1065
    .end local v7    # "border":Lcom/itextpdf/layout/borders/Border;
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 1068
    :cond_2
    if-eqz v2, :cond_18

    .line 1069
    aget-object v3, v1, v4

    const/4 v5, 0x0

    if-eqz v3, :cond_3

    aget-object v3, v1, v4

    invoke-virtual {v3}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v3

    goto :goto_2

    :cond_3
    move v3, v5

    :goto_2
    move v14, v3

    .line 1070
    .local v14, "topWidth":F
    aget-object v3, v1, v6

    if-eqz v3, :cond_4

    aget-object v3, v1, v6

    invoke-virtual {v3}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v3

    goto :goto_3

    :cond_4
    move v3, v5

    :goto_3
    move/from16 v22, v3

    .line 1071
    .local v22, "rightWidth":F
    const/4 v3, 0x2

    aget-object v7, v1, v3

    if-eqz v7, :cond_5

    aget-object v7, v1, v3

    invoke-virtual {v7}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v7

    move v15, v7

    goto :goto_4

    :cond_5
    move v15, v5

    :goto_4
    move v7, v15

    .line 1072
    .local v7, "bottomWidth":F
    const/16 v28, 0x3

    aget-object v8, v1, v28

    if-eqz v8, :cond_6

    aget-object v8, v1, v28

    invoke-virtual {v8}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v8

    move/from16 v23, v8

    goto :goto_5

    :cond_6
    move/from16 v23, v5

    .line 1074
    .local v23, "leftWidth":F
    :goto_5
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getBorderAreaBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v29

    .line 1075
    .local v29, "bBox":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual/range {v29 .. v29}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v8

    cmpg-float v8, v8, v5

    if-ltz v8, :cond_17

    invoke-virtual/range {v29 .. v29}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v8

    cmpg-float v8, v8, v5

    if-gez v8, :cond_7

    move v15, v7

    goto/16 :goto_f

    .line 1080
    :cond_7
    invoke-virtual/range {v29 .. v29}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v17

    .line 1081
    .local v17, "x1":F
    invoke-virtual/range {v29 .. v29}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v10

    .line 1082
    .local v10, "y1":F
    invoke-virtual/range {v29 .. v29}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v8

    invoke-virtual/range {v29 .. v29}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v9

    add-float v19, v8, v9

    .line 1083
    .local v19, "x2":F
    invoke-virtual/range {v29 .. v29}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v8

    invoke-virtual/range {v29 .. v29}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v9

    add-float v18, v8, v9

    .line 1085
    .local v18, "y2":F
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/renderer/DrawContext;->isTaggingEnabled()Z

    move-result v30

    .line 1086
    .local v30, "isTagged":Z
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v8

    .line 1087
    .local v8, "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    if-eqz v30, :cond_8

    .line 1088
    new-instance v9, Lcom/itextpdf/kernel/pdf/canvas/CanvasArtifact;

    invoke-direct {v9}, Lcom/itextpdf/kernel/pdf/canvas/CanvasArtifact;-><init>()V

    invoke-virtual {v8, v9}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->openTag(Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1091
    :cond_8
    iget-object v9, v0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v9}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v9

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getMargins()[Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v11

    invoke-virtual {v0, v9, v11, v4}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/properties/UnitValue;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v9

    .line 1092
    .local v9, "borderRect":Lcom/itextpdf/kernel/geom/Rectangle;
    move-object/from16 v11, p1

    invoke-virtual {v0, v11, v9}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->clipBorderArea(Lcom/itextpdf/layout/renderer/DrawContext;Lcom/itextpdf/kernel/geom/Rectangle;)Z

    move-result v31

    .line 1093
    .local v31, "isAreaClipped":Z
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getBorderRadii()[Lcom/itextpdf/layout/properties/BorderRadius;

    move-result-object v12

    .line 1094
    .local v12, "borderRadii":[Lcom/itextpdf/layout/properties/BorderRadius;
    invoke-direct {v0, v12, v9, v4}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->calculateRadii([Lcom/itextpdf/layout/properties/BorderRadius;Lcom/itextpdf/kernel/geom/Rectangle;Z)[F

    move-result-object v32

    .line 1095
    .local v32, "verticalRadii":[F
    invoke-direct {v0, v12, v9, v6}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->calculateRadii([Lcom/itextpdf/layout/properties/BorderRadius;Lcom/itextpdf/kernel/geom/Rectangle;Z)[F

    move-result-object v33

    .line 1096
    .local v33, "horizontalRadii":[F
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_6
    const/4 v15, 0x4

    if-ge v13, v15, :cond_9

    .line 1097
    aget v15, v32, v13

    invoke-virtual {v9}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v16

    const/high16 v20, 0x40000000    # 2.0f

    move/from16 v34, v3

    div-float v3, v16, v20

    invoke-static {v15, v3}, Ljava/lang/Math;->min(FF)F

    move-result v3

    aput v3, v32, v13

    .line 1098
    aget v3, v33, v13

    invoke-virtual {v9}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v15

    div-float v15, v15, v20

    invoke-static {v3, v15}, Ljava/lang/Math;->min(FF)F

    move-result v3

    aput v3, v33, v13

    .line 1096
    add-int/lit8 v13, v13, 0x1

    move/from16 v3, v34

    goto :goto_6

    :cond_9
    move/from16 v34, v3

    .line 1100
    .end local v13    # "i":I
    aget-object v3, v1, v4

    if-eqz v3, :cond_c

    .line 1101
    aget v3, v33, v4

    cmpl-float v3, v5, v3

    if-nez v3, :cond_b

    aget v3, v32, v4

    cmpl-float v3, v5, v3

    if-nez v3, :cond_b

    aget v3, v33, v6

    cmpl-float v3, v5, v3

    if-nez v3, :cond_b

    aget v3, v32, v6

    cmpl-float v3, v5, v3

    if-eqz v3, :cond_a

    move-object/from16 v16, v8

    goto :goto_7

    .line 1104
    :cond_a
    aget-object v15, v1, v4

    sget-object v21, Lcom/itextpdf/layout/borders/Border$Side;->TOP:Lcom/itextpdf/layout/borders/Border$Side;

    move/from16 v20, v18

    move/from16 v16, v23

    move/from16 v23, v22

    move/from16 v22, v16

    move-object/from16 v16, v8

    .end local v8    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .local v16, "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .local v22, "leftWidth":F
    .local v23, "rightWidth":F
    invoke-virtual/range {v15 .. v23}, Lcom/itextpdf/layout/borders/Border;->draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFLcom/itextpdf/layout/borders/Border$Side;FF)V

    move/from16 v37, v23

    move/from16 v23, v22

    move/from16 v22, v37

    move/from16 v3, v17

    .local v22, "rightWidth":F
    .local v23, "leftWidth":F
    goto :goto_8

    .line 1101
    .end local v16    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .restart local v8    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    :cond_b
    move-object/from16 v16, v8

    .line 1102
    .end local v8    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .restart local v16    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    :goto_7
    aget-object v15, v1, v4

    aget v21, v33, v4

    move/from16 v26, v22

    .end local v22    # "rightWidth":F
    .local v26, "rightWidth":F
    aget v22, v32, v4

    move/from16 v27, v23

    .end local v23    # "leftWidth":F
    .local v27, "leftWidth":F
    aget v23, v33, v6

    aget v24, v32, v6

    sget-object v25, Lcom/itextpdf/layout/borders/Border$Side;->TOP:Lcom/itextpdf/layout/borders/Border$Side;

    move/from16 v20, v18

    move/from16 v37, v27

    move/from16 v27, v26

    move/from16 v26, v37

    .local v26, "leftWidth":F
    .local v27, "rightWidth":F
    invoke-virtual/range {v15 .. v27}, Lcom/itextpdf/layout/borders/Border;->draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFFFFFLcom/itextpdf/layout/borders/Border$Side;FF)V

    move/from16 v3, v17

    move/from16 v23, v26

    move/from16 v22, v27

    .end local v17    # "x1":F
    .end local v26    # "leftWidth":F
    .end local v27    # "rightWidth":F
    .local v3, "x1":F
    .restart local v22    # "rightWidth":F
    .restart local v23    # "leftWidth":F
    goto :goto_8

    .line 1100
    .end local v3    # "x1":F
    .end local v16    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .restart local v8    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .restart local v17    # "x1":F
    :cond_c
    move-object/from16 v16, v8

    move/from16 v3, v17

    .line 1107
    .end local v8    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .end local v17    # "x1":F
    .restart local v3    # "x1":F
    .restart local v16    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    :goto_8
    aget-object v8, v1, v6

    if-eqz v8, :cond_f

    .line 1108
    aget v8, v33, v6

    cmpl-float v8, v5, v8

    if-nez v8, :cond_e

    aget v8, v32, v6

    cmpl-float v8, v5, v8

    if-nez v8, :cond_e

    aget v8, v33, v34

    cmpl-float v8, v5, v8

    if-nez v8, :cond_e

    aget v8, v32, v34

    cmpl-float v8, v5, v8

    if-eqz v8, :cond_d

    move/from16 v15, v18

    move/from16 v18, v10

    move v10, v15

    move v15, v7

    move-object/from16 v35, v9

    move-object/from16 v36, v12

    goto :goto_9

    .line 1111
    :cond_d
    move v15, v7

    .end local v7    # "bottomWidth":F
    .local v15, "bottomWidth":F
    aget-object v7, v1, v6

    sget-object v13, Lcom/itextpdf/layout/borders/Border$Side;->RIGHT:Lcom/itextpdf/layout/borders/Border$Side;

    move/from16 v11, v19

    move-object/from16 v35, v9

    move-object/from16 v36, v12

    move-object/from16 v8, v16

    move/from16 v9, v19

    move v12, v10

    move/from16 v10, v18

    .end local v16    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .end local v18    # "y2":F
    .end local v19    # "x2":F
    .restart local v8    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .local v9, "x2":F
    .local v10, "y2":F
    .local v12, "y1":F
    .local v35, "borderRect":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v36, "borderRadii":[Lcom/itextpdf/layout/properties/BorderRadius;
    invoke-virtual/range {v7 .. v15}, Lcom/itextpdf/layout/borders/Border;->draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFLcom/itextpdf/layout/borders/Border$Side;FF)V

    move/from16 v18, v12

    move v6, v15

    .end local v8    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .end local v9    # "x2":F
    .end local v12    # "y1":F
    .restart local v16    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .local v18, "y1":F
    .restart local v19    # "x2":F
    goto :goto_a

    .line 1108
    .end local v15    # "bottomWidth":F
    .end local v35    # "borderRect":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v36    # "borderRadii":[Lcom/itextpdf/layout/properties/BorderRadius;
    .restart local v7    # "bottomWidth":F
    .local v9, "borderRect":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v10, "y1":F
    .local v12, "borderRadii":[Lcom/itextpdf/layout/properties/BorderRadius;
    .local v18, "y2":F
    :cond_e
    move/from16 v15, v18

    move/from16 v18, v10

    move v10, v15

    move v15, v7

    move-object/from16 v35, v9

    move-object/from16 v36, v12

    .line 1109
    .end local v7    # "bottomWidth":F
    .end local v9    # "borderRect":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v12    # "borderRadii":[Lcom/itextpdf/layout/properties/BorderRadius;
    .local v10, "y2":F
    .restart local v15    # "bottomWidth":F
    .local v18, "y1":F
    .restart local v35    # "borderRect":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local v36    # "borderRadii":[Lcom/itextpdf/layout/properties/BorderRadius;
    :goto_9
    aget-object v7, v1, v6

    aget v13, v33, v6

    aget v6, v32, v6

    move/from16 v17, v19

    move/from16 v19, v15

    .end local v15    # "bottomWidth":F
    .local v17, "x2":F
    .local v19, "bottomWidth":F
    aget v15, v33, v34

    move-object/from16 v8, v16

    .end local v16    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .restart local v8    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    aget v16, v32, v34

    move/from16 v9, v17

    .end local v17    # "x2":F
    .local v9, "x2":F
    sget-object v17, Lcom/itextpdf/layout/borders/Border$Side;->RIGHT:Lcom/itextpdf/layout/borders/Border$Side;

    move v11, v9

    move/from16 v12, v18

    move/from16 v18, v14

    move v14, v6

    .end local v14    # "topWidth":F
    .local v12, "y1":F
    .local v18, "topWidth":F
    invoke-virtual/range {v7 .. v19}, Lcom/itextpdf/layout/borders/Border;->draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFFFFFLcom/itextpdf/layout/borders/Border$Side;FF)V

    move-object/from16 v16, v8

    move/from16 v14, v18

    move/from16 v6, v19

    move/from16 v19, v9

    move/from16 v18, v12

    .end local v8    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .end local v9    # "x2":F
    .end local v12    # "y1":F
    .local v6, "bottomWidth":F
    .restart local v14    # "topWidth":F
    .restart local v16    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .local v18, "y1":F
    .local v19, "x2":F
    goto :goto_a

    .line 1107
    .end local v6    # "bottomWidth":F
    .end local v35    # "borderRect":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v36    # "borderRadii":[Lcom/itextpdf/layout/properties/BorderRadius;
    .restart local v7    # "bottomWidth":F
    .local v9, "borderRect":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v10, "y1":F
    .local v12, "borderRadii":[Lcom/itextpdf/layout/properties/BorderRadius;
    .local v18, "y2":F
    :cond_f
    move/from16 v6, v18

    move/from16 v18, v10

    move v10, v6

    move v6, v7

    move-object/from16 v35, v9

    move-object/from16 v36, v12

    .line 1114
    .end local v7    # "bottomWidth":F
    .end local v9    # "borderRect":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v12    # "borderRadii":[Lcom/itextpdf/layout/properties/BorderRadius;
    .restart local v6    # "bottomWidth":F
    .local v10, "y2":F
    .local v18, "y1":F
    .restart local v35    # "borderRect":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local v36    # "borderRadii":[Lcom/itextpdf/layout/properties/BorderRadius;
    :goto_a
    aget-object v7, v1, v34

    if-eqz v7, :cond_12

    .line 1115
    aget v7, v33, v34

    cmpl-float v7, v5, v7

    if-nez v7, :cond_11

    aget v7, v32, v34

    cmpl-float v7, v5, v7

    if-nez v7, :cond_11

    aget v7, v33, v28

    cmpl-float v7, v5, v7

    if-nez v7, :cond_11

    aget v7, v32, v28

    cmpl-float v7, v5, v7

    if-eqz v7, :cond_10

    move/from16 v17, v3

    goto :goto_b

    .line 1118
    :cond_10
    aget-object v15, v1, v34

    sget-object v21, Lcom/itextpdf/layout/borders/Border$Side;->BOTTOM:Lcom/itextpdf/layout/borders/Border$Side;

    move/from16 v20, v18

    move/from16 v17, v19

    move/from16 v19, v3

    .end local v3    # "x1":F
    .restart local v17    # "x2":F
    .local v19, "x1":F
    invoke-virtual/range {v15 .. v23}, Lcom/itextpdf/layout/borders/Border;->draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFLcom/itextpdf/layout/borders/Border$Side;FF)V

    move/from16 v37, v19

    move/from16 v19, v17

    move/from16 v17, v37

    move/from16 v3, v19

    .local v17, "x1":F
    .local v19, "x2":F
    goto :goto_c

    .line 1115
    .end local v17    # "x1":F
    .restart local v3    # "x1":F
    :cond_11
    move/from16 v17, v3

    .line 1116
    .end local v3    # "x1":F
    .restart local v17    # "x1":F
    :goto_b
    aget-object v15, v1, v34

    aget v21, v33, v34

    aget v3, v32, v34

    move/from16 v27, v23

    .end local v23    # "leftWidth":F
    .local v27, "leftWidth":F
    aget v23, v33, v28

    aget v24, v32, v28

    sget-object v25, Lcom/itextpdf/layout/borders/Border$Side;->BOTTOM:Lcom/itextpdf/layout/borders/Border$Side;

    move/from16 v20, v18

    move/from16 v26, v19

    move/from16 v19, v17

    move/from16 v17, v26

    move/from16 v26, v22

    move/from16 v22, v3

    .end local v22    # "rightWidth":F
    .local v17, "x2":F
    .local v19, "x1":F
    .local v26, "rightWidth":F
    invoke-virtual/range {v15 .. v27}, Lcom/itextpdf/layout/borders/Border;->draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFFFFFLcom/itextpdf/layout/borders/Border$Side;FF)V

    move/from16 v3, v17

    move/from16 v17, v19

    move/from16 v22, v26

    move/from16 v23, v27

    .end local v19    # "x1":F
    .end local v26    # "rightWidth":F
    .end local v27    # "leftWidth":F
    .local v3, "x2":F
    .local v17, "x1":F
    .restart local v22    # "rightWidth":F
    .restart local v23    # "leftWidth":F
    goto :goto_c

    .line 1114
    .end local v17    # "x1":F
    .local v3, "x1":F
    .local v19, "x2":F
    :cond_12
    move/from16 v17, v3

    move/from16 v3, v19

    .line 1121
    .end local v19    # "x2":F
    .local v3, "x2":F
    .restart local v17    # "x1":F
    :goto_c
    aget-object v7, v1, v28

    if-eqz v7, :cond_15

    .line 1122
    aget v7, v33, v28

    cmpl-float v7, v5, v7

    if-nez v7, :cond_14

    aget v7, v32, v28

    cmpl-float v7, v5, v7

    if-nez v7, :cond_14

    aget v7, v33, v4

    cmpl-float v7, v5, v7

    if-nez v7, :cond_14

    aget v7, v32, v4

    cmpl-float v5, v5, v7

    if-eqz v5, :cond_13

    move v15, v6

    goto :goto_d

    .line 1125
    :cond_13
    aget-object v7, v1, v28

    sget-object v13, Lcom/itextpdf/layout/borders/Border$Side;->LEFT:Lcom/itextpdf/layout/borders/Border$Side;

    move/from16 v11, v17

    move v12, v10

    move v15, v14

    move-object/from16 v8, v16

    move/from16 v9, v17

    move/from16 v10, v18

    move v14, v6

    .end local v6    # "bottomWidth":F
    .end local v16    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .end local v17    # "x1":F
    .end local v18    # "y1":F
    .restart local v8    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .local v9, "x1":F
    .local v10, "y1":F
    .local v12, "y2":F
    .local v14, "bottomWidth":F
    .local v15, "topWidth":F
    invoke-virtual/range {v7 .. v15}, Lcom/itextpdf/layout/borders/Border;->draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFLcom/itextpdf/layout/borders/Border$Side;FF)V

    move/from16 v18, v15

    move v15, v14

    move/from16 v14, v18

    move/from16 v18, v10

    move v10, v12

    .end local v8    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .end local v9    # "x1":F
    .end local v12    # "y2":F
    .local v10, "y2":F
    .local v14, "topWidth":F
    .local v15, "bottomWidth":F
    .restart local v16    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .restart local v17    # "x1":F
    .restart local v18    # "y1":F
    goto :goto_e

    .line 1122
    .end local v15    # "bottomWidth":F
    .restart local v6    # "bottomWidth":F
    :cond_14
    move v15, v6

    .line 1123
    .end local v6    # "bottomWidth":F
    .restart local v15    # "bottomWidth":F
    :goto_d
    aget-object v7, v1, v28

    aget v13, v33, v28

    aget v5, v32, v28

    move/from16 v19, v15

    .end local v15    # "bottomWidth":F
    .local v19, "bottomWidth":F
    aget v15, v33, v4

    aget v4, v32, v4

    move/from16 v9, v17

    .end local v17    # "x1":F
    .restart local v9    # "x1":F
    sget-object v17, Lcom/itextpdf/layout/borders/Border$Side;->LEFT:Lcom/itextpdf/layout/borders/Border$Side;

    move v11, v9

    move v12, v10

    move-object/from16 v8, v16

    move/from16 v10, v18

    move/from16 v18, v19

    move/from16 v16, v4

    move/from16 v19, v14

    move v14, v5

    .end local v14    # "topWidth":F
    .end local v16    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .restart local v8    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .local v10, "y1":F
    .restart local v12    # "y2":F
    .local v18, "bottomWidth":F
    .local v19, "topWidth":F
    invoke-virtual/range {v7 .. v19}, Lcom/itextpdf/layout/borders/Border;->draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FFFFFFFFLcom/itextpdf/layout/borders/Border$Side;FF)V

    move-object/from16 v16, v8

    move/from16 v17, v9

    move/from16 v15, v18

    move/from16 v14, v19

    move/from16 v18, v10

    move v10, v12

    .end local v8    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .end local v9    # "x1":F
    .end local v12    # "y2":F
    .end local v19    # "topWidth":F
    .local v10, "y2":F
    .restart local v14    # "topWidth":F
    .restart local v15    # "bottomWidth":F
    .restart local v16    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .restart local v17    # "x1":F
    .local v18, "y1":F
    goto :goto_e

    .line 1121
    .end local v15    # "bottomWidth":F
    .restart local v6    # "bottomWidth":F
    :cond_15
    move v15, v6

    .line 1129
    .end local v6    # "bottomWidth":F
    .restart local v15    # "bottomWidth":F
    :goto_e
    if-eqz v31, :cond_16

    .line 1130
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1133
    :cond_16
    if-eqz v30, :cond_18

    .line 1134
    invoke-virtual/range {v16 .. v16}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->closeTag()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    goto :goto_10

    .line 1075
    .end local v3    # "x2":F
    .end local v10    # "y2":F
    .end local v15    # "bottomWidth":F
    .end local v16    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .end local v17    # "x1":F
    .end local v18    # "y1":F
    .end local v30    # "isTagged":Z
    .end local v31    # "isAreaClipped":Z
    .end local v32    # "verticalRadii":[F
    .end local v33    # "horizontalRadii":[F
    .end local v35    # "borderRect":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v36    # "borderRadii":[Lcom/itextpdf/layout/properties/BorderRadius;
    .restart local v7    # "bottomWidth":F
    :cond_17
    move v15, v7

    .line 1076
    .end local v7    # "bottomWidth":F
    .restart local v15    # "bottomWidth":F
    :goto_f
    const-class v3, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-static {v3}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v3

    .line 1077
    .local v3, "logger":Lorg/slf4j/Logger;
    const-string v4, "border"

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    const-string v5, "The {0} rectangle has negative size. It will not be displayed."

    invoke-static {v5, v4}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1078
    return-void

    .line 1138
    .end local v3    # "logger":Lorg/slf4j/Logger;
    .end local v14    # "topWidth":F
    .end local v15    # "bottomWidth":F
    .end local v22    # "rightWidth":F
    .end local v23    # "leftWidth":F
    .end local v29    # "bBox":Lcom/itextpdf/kernel/geom/Rectangle;
    :cond_18
    :goto_10
    return-void
.end method

.method public drawChildren(Lcom/itextpdf/layout/renderer/DrawContext;)V
    .locals 7
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;

    .line 1039
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1040
    .local v0, "waitingRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1041
    .local v2, "child":Lcom/itextpdf/layout/renderer/IRenderer;
    const/16 v3, 0x35

    invoke-interface {v2, v3}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/properties/Transform;

    .line 1042
    .local v3, "transformProp":Lcom/itextpdf/layout/properties/Transform;
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getRootRenderer()Lcom/itextpdf/layout/renderer/RootRenderer;

    move-result-object v4

    .line 1043
    .local v4, "rootRenderer":Lcom/itextpdf/layout/renderer/RootRenderer;
    if-eqz v4, :cond_0

    iget-object v5, v4, Lcom/itextpdf/layout/renderer/RootRenderer;->waitingDrawingElements:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    iget-object v5, v4, Lcom/itextpdf/layout/renderer/RootRenderer;->waitingDrawingElements:Ljava/util/List;

    goto :goto_1

    :cond_0
    move-object v5, v0

    .line 1044
    .local v5, "waiting":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    :goto_1
    invoke-static {v2, v3, v5}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->processWaitingDrawing(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/properties/Transform;Ljava/util/List;)V

    .line 1045
    invoke-static {v2}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v6

    if-nez v6, :cond_1

    if-nez v3, :cond_1

    .line 1046
    invoke-interface {v2, p1}, Lcom/itextpdf/layout/renderer/IRenderer;->draw(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 1048
    .end local v2    # "child":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v3    # "transformProp":Lcom/itextpdf/layout/properties/Transform;
    .end local v4    # "rootRenderer":Lcom/itextpdf/layout/renderer/RootRenderer;
    .end local v5    # "waiting":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    :cond_1
    goto :goto_0

    .line 1049
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1050
    .local v2, "waitingRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-interface {v2, p1}, Lcom/itextpdf/layout/renderer/IRenderer;->draw(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 1051
    .end local v2    # "waitingRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_2

    .line 1052
    :cond_3
    return-void
.end method

.method drawPositionedChildren(Lcom/itextpdf/layout/renderer/DrawContext;)V
    .locals 2
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;

    .line 2479
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->positionedRenderers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 2480
    .local v1, "positionedChild":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-interface {v1, p1}, Lcom/itextpdf/layout/renderer/IRenderer;->draw(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 2481
    .end local v1    # "positionedChild":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_0

    .line 2482
    :cond_0
    return-void
.end method

.method protected endElementOpacityApplying(Lcom/itextpdf/layout/renderer/DrawContext;)V
    .locals 3
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;

    .line 510
    const/16 v0, 0x5c

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v0

    .line 511
    .local v0, "opacity":Ljava/lang/Float;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v1

    const/high16 v2, 0x3f800000    # 1.0f

    cmpg-float v1, v1, v2

    if-gez v1, :cond_0

    .line 512
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 514
    :cond_0
    return-void
.end method

.method protected endTransformationIfApplied(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V
    .locals 1
    .param p1, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 2670
    const/16 v0, 0x35

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2671
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 2673
    :cond_0
    return-void
.end method

.method getAspectRatio()Ljava/lang/Float;
    .locals 1

    .line 1364
    const/4 v0, 0x0

    return-object v0
.end method

.method protected getBackgroundArea(Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 0
    .param p1, "occupiedAreaWithMargins"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 740
    return-object p1
.end method

.method public getBorderAreaBBox()Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 2

    .line 1217
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getOccupiedAreaBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    .line 1218
    .local v0, "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1219
    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1220
    return-object v0
.end method

.method protected getBorderRadii()[Lcom/itextpdf/layout/properties/BorderRadius;
    .locals 1

    .line 2268
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getBorderRadii(Lcom/itextpdf/layout/renderer/IRenderer;)[Lcom/itextpdf/layout/properties/BorderRadius;

    move-result-object v0

    return-object v0
.end method

.method protected getBorders()[Lcom/itextpdf/layout/borders/Border;
    .locals 1

    .line 2256
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getBorders(Lcom/itextpdf/layout/renderer/IRenderer;)[Lcom/itextpdf/layout/borders/Border;

    move-result-object v0

    return-object v0
.end method

.method public getChildRenderers()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;"
        }
    .end annotation

    .line 255
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->childRenderers:Ljava/util/List;

    return-object v0
.end method

.method public getDefaultProperty(I)Ljava/lang/Object;
    .locals 1
    .param p1, "property"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            ">(I)TT1;"
        }
    .end annotation

    .line 363
    const/4 v0, 0x0

    return-object v0
.end method

.method protected getFirstYLineRecursively()Ljava/lang/Float;
    .locals 2

    .line 1740
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 1741
    const/4 v0, 0x0

    return-object v0

    .line 1743
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->childRenderers:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getFirstYLineRecursively()Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method public getInnerAreaBBox()Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 2

    .line 1224
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getOccupiedAreaBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    .line 1225
    .local v0, "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1226
    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1227
    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1228
    return-object v0
.end method

.method protected getLastYLineRecursively()Ljava/lang/Float;
    .locals 4

    .line 1747
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->allowLastYLineRecursiveExtraction()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 1748
    return-object v1

    .line 1750
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_2

    .line 1751
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1752
    .local v2, "child":Lcom/itextpdf/layout/renderer/IRenderer;
    instance-of v3, v2, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    if-eqz v3, :cond_1

    .line 1753
    move-object v3, v2

    check-cast v3, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getLastYLineRecursively()Ljava/lang/Float;

    move-result-object v3

    .line 1754
    .local v3, "lastYLine":Ljava/lang/Float;
    if-eqz v3, :cond_1

    .line 1755
    return-object v3

    .line 1750
    .end local v2    # "child":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v3    # "lastYLine":Ljava/lang/Float;
    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 1759
    .end local v0    # "i":I
    :cond_2
    return-object v1
.end method

.method protected getMargins()[Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 1811
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getMargins(Lcom/itextpdf/layout/renderer/IRenderer;)[Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    return-object v0
.end method

.method public getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .locals 1

    .line 2148
    invoke-static {p0}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidthUtils;->countDefaultMinMaxWidth(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v0

    return-object v0
.end method

.method public getModelElement()Lcom/itextpdf/layout/IPropertyContainer;
    .locals 1

    .line 247
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method public getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;
    .locals 1

    .line 467
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    return-object v0
.end method

.method public getOccupiedAreaBBox()Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 1

    .line 1207
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    return-object v0
.end method

.method protected getOwnProperties()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1725
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->properties:Ljava/util/Map;

    return-object v0
.end method

.method public getOwnProperty(I)Ljava/lang/Object;
    .locals 2
    .param p1, "property"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            ">(I)TT1;"
        }
    .end annotation

    .line 338
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->properties:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected getPaddings()[Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 1821
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPaddings(Lcom/itextpdf/layout/renderer/IRenderer;)[Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    return-object v0
.end method

.method public getParent()Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 1

    .line 1166
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    return-object v0
.end method

.method getPdfDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;
    .locals 3

    .line 2414
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getRootRenderer()Lcom/itextpdf/layout/renderer/RootRenderer;

    move-result-object v0

    .line 2415
    .local v0, "renderer":Lcom/itextpdf/layout/renderer/RootRenderer;
    instance-of v1, v0, Lcom/itextpdf/layout/renderer/DocumentRenderer;

    if-eqz v1, :cond_0

    .line 2416
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/layout/renderer/DocumentRenderer;

    iget-object v1, v1, Lcom/itextpdf/layout/renderer/DocumentRenderer;->document:Lcom/itextpdf/layout/Document;

    .line 2417
    .local v1, "document":Lcom/itextpdf/layout/Document;
    invoke-virtual {v1}, Lcom/itextpdf/layout/Document;->getPdfDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v2

    return-object v2

    .line 2418
    .end local v1    # "document":Lcom/itextpdf/layout/Document;
    :cond_0
    instance-of v1, v0, Lcom/itextpdf/layout/renderer/CanvasRenderer;

    if-eqz v1, :cond_1

    .line 2419
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/layout/renderer/CanvasRenderer;

    iget-object v1, v1, Lcom/itextpdf/layout/renderer/CanvasRenderer;->canvas:Lcom/itextpdf/layout/Canvas;

    invoke-virtual {v1}, Lcom/itextpdf/layout/Canvas;->getPdfDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v1

    return-object v1

    .line 2421
    :cond_1
    const/4 v1, 0x0

    return-object v1
.end method

.method public getProperty(I)Ljava/lang/Object;
    .locals 3
    .param p1, "key"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            ">(I)TT1;"
        }
    .end annotation

    .line 317
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->properties:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    .local v1, "property":Ljava/lang/Object;
    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->properties:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 320
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    invoke-interface {v0, p1}, Lcom/itextpdf/layout/IPropertyContainer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    invoke-interface {v0, p1}, Lcom/itextpdf/layout/IPropertyContainer;->hasProperty(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 321
    :cond_1
    return-object v1

    .line 323
    :cond_2
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    if-eqz v0, :cond_3

    invoke-static {p1}, Lcom/itextpdf/layout/properties/Property;->isPropertyInherited(I)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v0, p1}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    if-eqz v0, :cond_3

    .line 324
    return-object v1

    .line 326
    :cond_3
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getDefaultProperty(I)Ljava/lang/Object;

    move-result-object v0

    .line 327
    .end local v1    # "property":Ljava/lang/Object;
    .local v0, "property":Ljava/lang/Object;
    if-eqz v0, :cond_4

    .line 328
    return-object v0

    .line 330
    :cond_4
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    invoke-interface {v1, p1}, Lcom/itextpdf/layout/IPropertyContainer;->getDefaultProperty(I)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0

    :cond_5
    const/4 v1, 0x0

    :goto_0
    return-object v1

    .line 318
    .end local v0    # "property":Ljava/lang/Object;
    .restart local v1    # "property":Ljava/lang/Object;
    :cond_6
    :goto_1
    return-object v1
.end method

.method public getProperty(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "property"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            ">(ITT1;)TT1;"
        }
    .end annotation

    .line 346
    .local p2, "defaultValue":Ljava/lang/Object;, "TT1;"
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    .line 347
    .local v0, "result":Ljava/lang/Object;, "TT1;"
    if-eqz v0, :cond_0

    move-object v1, v0

    goto :goto_0

    :cond_0
    move-object v1, p2

    :goto_0
    return-object v1
.end method

.method public getPropertyAsBoolean(I)Ljava/lang/Boolean;
    .locals 1
    .param p1, "property"    # I

    .line 424
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    return-object v0
.end method

.method public getPropertyAsColor(I)Lcom/itextpdf/kernel/colors/Color;
    .locals 1
    .param p1, "property"    # I

    .line 383
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/colors/Color;

    return-object v0
.end method

.method public getPropertyAsFloat(I)Ljava/lang/Float;
    .locals 1
    .param p1, "property"    # I

    .line 403
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/io/util/NumberUtil;->asFloat(Ljava/lang/Object;)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method public getPropertyAsFloat(ILjava/lang/Float;)Ljava/lang/Float;
    .locals 1
    .param p1, "property"    # I
    .param p2, "defaultValue"    # Ljava/lang/Float;

    .line 414
    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/io/util/NumberUtil;->asFloat(Ljava/lang/Object;)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method public getPropertyAsFont(I)Lcom/itextpdf/kernel/font/PdfFont;
    .locals 1
    .param p1, "property"    # I

    .line 373
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/font/PdfFont;

    return-object v0
.end method

.method public getPropertyAsInteger(I)Ljava/lang/Integer;
    .locals 1
    .param p1, "property"    # I

    .line 444
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/io/util/NumberUtil;->asInteger(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getPropertyAsTransparentColor(I)Lcom/itextpdf/layout/properties/TransparentColor;
    .locals 1
    .param p1, "property"    # I

    .line 393
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/TransparentColor;

    return-object v0
.end method

.method public getPropertyAsUnitValue(I)Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1
    .param p1, "property"    # I

    .line 434
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method getRootRenderer()Lcom/itextpdf/layout/renderer/RootRenderer;
    .locals 2

    .line 2426
    move-object v0, p0

    .line 2427
    .local v0, "currentRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    :goto_0
    instance-of v1, v0, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    if-eqz v1, :cond_1

    .line 2428
    instance-of v1, v0, Lcom/itextpdf/layout/renderer/RootRenderer;

    if-eqz v1, :cond_0

    .line 2429
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/layout/renderer/RootRenderer;

    return-object v1

    .line 2431
    :cond_0
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getParent()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    goto :goto_0

    .line 2433
    :cond_1
    const/4 v1, 0x0

    return-object v1
.end method

.method protected hasAbsoluteUnitValue(I)Z
    .locals 2
    .param p1, "property"    # I

    .line 2376
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    .line 2377
    .local v0, "value":Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method hasAspectRatio()Z
    .locals 1

    .line 1354
    const/4 v0, 0x0

    return v0
.end method

.method public hasOwnOrModelProperty(I)Z
    .locals 1
    .param p1, "property"    # I

    .line 284
    invoke-static {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->hasOwnOrModelProperty(Lcom/itextpdf/layout/renderer/IRenderer;I)Z

    move-result v0

    return v0
.end method

.method public hasOwnProperty(I)Z
    .locals 2
    .param p1, "property"    # I

    .line 273
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->properties:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public hasProperty(I)Z
    .locals 1
    .param p1, "property"    # I

    .line 263
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->hasOwnProperty(I)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    .line 264
    invoke-interface {v0, p1}, Lcom/itextpdf/layout/IPropertyContainer;->hasProperty(I)Z

    move-result v0

    if-nez v0, :cond_2

    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    if-eqz v0, :cond_1

    .line 265
    invoke-static {p1}, Lcom/itextpdf/layout/properties/Property;->isPropertyInherited(I)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v0, p1}, Lcom/itextpdf/layout/renderer/IRenderer;->hasProperty(I)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v0, 0x1

    .line 263
    :goto_1
    return v0
.end method

.method protected hasRelativeUnitValue(I)Z
    .locals 2
    .param p1, "property"    # I

    .line 2387
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    .line 2388
    .local v0, "value":Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->isPercentValue()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public initElementAreas(Lcom/itextpdf/layout/layout/LayoutArea;)Ljava/util/List;
    .locals 1
    .param p1, "area"    # Lcom/itextpdf/layout/layout/LayoutArea;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/layout/LayoutArea;",
            ")",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;"
        }
    .end annotation

    .line 1197
    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected isAbsolutePosition()Z
    .locals 2

    .line 2207
    const/16 v0, 0x34

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 2208
    .local v0, "positioning":Ljava/lang/Integer;
    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public isFirstOnRootArea()Z
    .locals 1

    .line 1288
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isFirstOnRootArea(Z)Z

    move-result v0

    return v0
.end method

.method isFirstOnRootArea(Z)Z
    .locals 5
    .param p1, "checkRootAreaOnly"    # Z

    .line 2392
    const/4 v0, 0x1

    .line 2393
    .local v0, "isFirstOnRootArea":Z
    move-object v1, p0

    .line 2394
    .local v1, "ancestor":Lcom/itextpdf/layout/renderer/IRenderer;
    :goto_0
    if-eqz v0, :cond_4

    invoke-interface {v1}, Lcom/itextpdf/layout/renderer/IRenderer;->getParent()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 2395
    invoke-interface {v1}, Lcom/itextpdf/layout/renderer/IRenderer;->getParent()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v2

    .line 2396
    .local v2, "parent":Lcom/itextpdf/layout/renderer/IRenderer;
    instance-of v3, v2, Lcom/itextpdf/layout/renderer/RootRenderer;

    if-eqz v3, :cond_0

    .line 2397
    move-object v3, v2

    check-cast v3, Lcom/itextpdf/layout/renderer/RootRenderer;

    iget-object v3, v3, Lcom/itextpdf/layout/renderer/RootRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/RootLayoutArea;->isEmptyArea()Z

    move-result v0

    goto :goto_2

    .line 2398
    :cond_0
    invoke-interface {v2}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v3

    if-nez v3, :cond_1

    .line 2399
    goto :goto_3

    .line 2400
    :cond_1
    if-nez p1, :cond_3

    .line 2401
    invoke-interface {v2}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v3

    const v4, 0x38d1b717    # 1.0E-4f

    cmpg-float v3, v3, v4

    if-gez v3, :cond_2

    const/4 v3, 0x1

    goto :goto_1

    :cond_2
    const/4 v3, 0x0

    :goto_1
    move v0, v3

    .line 2403
    :cond_3
    :goto_2
    move-object v1, v2

    .line 2404
    .end local v2    # "parent":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_0

    .line 2405
    :cond_4
    :goto_3
    return v0
.end method

.method protected isFixedLayout()Z
    .locals 2

    .line 2192
    const/16 v0, 0x34

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    .line 2193
    .local v0, "positioning":Ljava/lang/Object;
    const/4 v1, 0x4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public isFlushed()Z
    .locals 1

    .line 1149
    iget-boolean v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->flushed:Z

    return v0
.end method

.method protected isKeepTogether()Z
    .locals 1

    .line 2212
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isKeepTogether(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    return v0
.end method

.method isKeepTogether(Lcom/itextpdf/layout/renderer/IRenderer;)Z
    .locals 2
    .param p1, "causeOfNothing"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 2216
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v1, 0x20

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    instance-of v0, p1, Lcom/itextpdf/layout/renderer/AreaBreakRenderer;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected isNotFittingHeight(Lcom/itextpdf/layout/layout/LayoutArea;)Z
    .locals 2
    .param p1, "layoutArea"    # Lcom/itextpdf/layout/layout/LayoutArea;

    .line 2166
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isPositioned()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v0

    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected isNotFittingLayoutArea(Lcom/itextpdf/layout/layout/LayoutArea;)Z
    .locals 1
    .param p1, "layoutArea"    # Lcom/itextpdf/layout/layout/LayoutArea;

    .line 2174
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isNotFittingHeight(Lcom/itextpdf/layout/layout/LayoutArea;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isNotFittingWidth(Lcom/itextpdf/layout/layout/LayoutArea;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method protected isNotFittingWidth(Lcom/itextpdf/layout/layout/LayoutArea;)Z
    .locals 2
    .param p1, "layoutArea"    # Lcom/itextpdf/layout/layout/LayoutArea;

    .line 2170
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isPositioned()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v0

    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected isOverflowProperty(Lcom/itextpdf/layout/properties/OverflowPropertyValue;I)Z
    .locals 1
    .param p1, "equalsTo"    # Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .param p2, "overflowProperty"    # I

    .line 1303
    invoke-virtual {p0, p2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    invoke-static {p1, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isOverflowProperty(Lcom/itextpdf/layout/properties/OverflowPropertyValue;Lcom/itextpdf/layout/properties/OverflowPropertyValue;)Z

    move-result v0

    return v0
.end method

.method protected isPositioned()Z
    .locals 1

    .line 2183
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isStaticLayout()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method protected isRelativePosition()Z
    .locals 2

    .line 2202
    const/16 v0, 0x34

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsInteger(I)Ljava/lang/Integer;

    move-result-object v0

    .line 2203
    .local v0, "positioning":Ljava/lang/Integer;
    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method protected isStaticLayout()Z
    .locals 3

    .line 2197
    const/16 v0, 0x34

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    .line 2198
    .local v0, "positioning":Ljava/lang/Object;
    const/4 v1, 0x1

    if-eqz v0, :cond_1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :cond_1
    :goto_0
    return v1
.end method

.method logWarningIfGetNextRendererNotOverridden(Ljava/lang/Class;Ljava/lang/Class;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Class<",
            "*>;)Z"
        }
    .end annotation

    .line 2783
    .local p1, "baseClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "rendererClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eq p1, p2, :cond_0

    .line 2784
    invoke-static {p1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 2785
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v1, "If a renderer overflows, iText uses this method to create another renderer for the overflow part. So if one wants to extend the renderer, one should override this method: otherwise the default method will be used and thus the default rather than the custom renderer will be created."

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {v1, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 2786
    return v2

    .line 2788
    .end local v0    # "logger":Lorg/slf4j/Logger;
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public move(FF)V
    .locals 3
    .param p1, "dxRight"    # F
    .param p2, "dyUp"    # F

    .line 1174
    const-class v0, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 1175
    .local v0, "logger":Lorg/slf4j/Logger;
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    if-nez v1, :cond_0

    .line 1176
    const-string v1, "Moving won\'t be performed."

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "Occupied area has not been initialized. {0}"

    invoke-static {v2, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1178
    return-void

    .line 1180
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/itextpdf/kernel/geom/Rectangle;->moveRight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1181
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/itextpdf/kernel/geom/Rectangle;->moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1182
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1183
    .local v2, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-interface {v2, p1, p2}, Lcom/itextpdf/layout/renderer/IRenderer;->move(FF)V

    .line 1184
    .end local v2    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_0

    .line 1185
    :cond_1
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->positionedRenderers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1186
    .restart local v2    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-interface {v2, p1, p2}, Lcom/itextpdf/layout/renderer/IRenderer;->move(FF)V

    .line 1187
    .end local v2    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_1

    .line 1188
    :cond_2
    return-void
.end method

.method preparePositionedRendererAndAreaForLayout(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 6
    .param p1, "childPositionedRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p2, "fullBbox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p3, "parentBbox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 2573
    const/16 v0, 0x22

    invoke-static {p1, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsFloat(Lcom/itextpdf/layout/renderer/IRenderer;I)Ljava/lang/Float;

    move-result-object v0

    .line 2574
    .local v0, "left":Ljava/lang/Float;
    const/16 v1, 0x36

    invoke-static {p1, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsFloat(Lcom/itextpdf/layout/renderer/IRenderer;I)Ljava/lang/Float;

    move-result-object v1

    .line 2575
    .local v1, "right":Ljava/lang/Float;
    const/16 v2, 0x49

    invoke-static {p1, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsFloat(Lcom/itextpdf/layout/renderer/IRenderer;I)Ljava/lang/Float;

    move-result-object v2

    .line 2576
    .local v2, "top":Ljava/lang/Float;
    const/16 v3, 0xe

    invoke-static {p1, v3}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsFloat(Lcom/itextpdf/layout/renderer/IRenderer;I)Ljava/lang/Float;

    move-result-object v3

    .line 2577
    .local v3, "bottom":Ljava/lang/Float;
    invoke-interface {p1, p0}, Lcom/itextpdf/layout/renderer/IRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    .line 2578
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->adjustPositionedRendererLayoutBoxWidth(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/geom/Rectangle;Ljava/lang/Float;Ljava/lang/Float;)V

    .line 2580
    const/4 v4, 0x3

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/16 v5, 0x34

    invoke-interface {p1, v5}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 2581
    invoke-direct {p0, p1, p3, v2, v3}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->updateMinHeightForAbsolutelyPositionedRenderer(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/geom/Rectangle;Ljava/lang/Float;Ljava/lang/Float;)V

    .line 2583
    :cond_0
    return-void
.end method

.method protected rectangleToPointsList(Lcom/itextpdf/kernel/geom/Rectangle;)Ljava/util/List;
    .locals 1
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ")",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Point;",
            ">;"
        }
    .end annotation

    .line 2335
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->toPointsArray()[Lcom/itextpdf/kernel/geom/Point;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method removeAllChildRenderers(Ljava/util/Collection;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;)Z"
        }
    .end annotation

    .line 2750
    .local p1, "children":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->removeThisFromParents(Ljava/util/Collection;)V

    .line 2751
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method removeChildRenderer(I)Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 1
    .param p1, "index"    # I

    .line 2736
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 2737
    .local v0, "removed":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-direct {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->removeThisFromParent(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 2738
    return-object v0
.end method

.method replaceOwnProperty(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "property"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(ITT;)TT;"
        }
    .end annotation

    .line 1327
    .local p2, "replacementValue":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getOwnProperty(I)Ljava/lang/Object;

    move-result-object v0

    .line 1328
    .local v0, "ownProperty":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    .line 1329
    return-object v0
.end method

.method resolveFirstPdfFont()Lcom/itextpdf/kernel/font/PdfFont;
    .locals 5

    .line 2506
    const/16 v0, 0x14

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    .line 2507
    .local v0, "font":Ljava/lang/Object;
    instance-of v1, v0, Lcom/itextpdf/kernel/font/PdfFont;

    if-eqz v1, :cond_0

    .line 2508
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/font/PdfFont;

    return-object v1

    .line 2509
    :cond_0
    instance-of v1, v0, [Ljava/lang/String;

    if-eqz v1, :cond_4

    .line 2510
    const/16 v1, 0x5b

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/font/FontProvider;

    .line 2511
    .local v1, "provider":Lcom/itextpdf/layout/font/FontProvider;
    const-string v2, "FontProvider and FontSet are empty. Cannot resolve font family name (see ElementPropertyContainer#setFontFamily) without initialized FontProvider (see RootElement#setFontProvider)."

    if-eqz v1, :cond_3

    .line 2515
    const/16 v3, 0x62

    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/font/FontSet;

    .line 2516
    .local v3, "fontSet":Lcom/itextpdf/layout/font/FontSet;
    invoke-virtual {v1}, Lcom/itextpdf/layout/font/FontProvider;->getFontSet()Lcom/itextpdf/layout/font/FontSet;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/layout/font/FontSet;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_2

    if-eqz v3, :cond_1

    invoke-virtual {v3}, Lcom/itextpdf/layout/font/FontSet;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1

    goto :goto_0

    .line 2517
    :cond_1
    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-direct {v4, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 2520
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->createFontCharacteristics()Lcom/itextpdf/layout/font/FontCharacteristics;

    move-result-object v2

    .line 2521
    .local v2, "fc":Lcom/itextpdf/layout/font/FontCharacteristics;
    move-object v4, v0

    check-cast v4, [Ljava/lang/String;

    check-cast v4, [Ljava/lang/String;

    invoke-virtual {p0, v4, v1, v2, v3}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->resolveFirstPdfFont([Ljava/lang/String;Lcom/itextpdf/layout/font/FontProvider;Lcom/itextpdf/layout/font/FontCharacteristics;Lcom/itextpdf/layout/font/FontSet;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v4

    return-object v4

    .line 2512
    .end local v2    # "fc":Lcom/itextpdf/layout/font/FontCharacteristics;
    .end local v3    # "fontSet":Lcom/itextpdf/layout/font/FontSet;
    :cond_3
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 2523
    .end local v1    # "provider":Lcom/itextpdf/layout/font/FontProvider;
    :cond_4
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "String[] or PdfFont expected as value of FONT property"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method resolveFirstPdfFont([Ljava/lang/String;Lcom/itextpdf/layout/font/FontProvider;Lcom/itextpdf/layout/font/FontCharacteristics;Lcom/itextpdf/layout/font/FontSet;)Lcom/itextpdf/kernel/font/PdfFont;
    .locals 2
    .param p1, "font"    # [Ljava/lang/String;
    .param p2, "provider"    # Lcom/itextpdf/layout/font/FontProvider;
    .param p3, "fc"    # Lcom/itextpdf/layout/font/FontCharacteristics;
    .param p4, "additionalFonts"    # Lcom/itextpdf/layout/font/FontSet;

    .line 2537
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p2, v0, p3, p4}, Lcom/itextpdf/layout/font/FontProvider;->getFontSelector(Ljava/util/List;Lcom/itextpdf/layout/font/FontCharacteristics;Lcom/itextpdf/layout/font/FontSet;)Lcom/itextpdf/layout/font/FontSelector;

    move-result-object v0

    .line 2538
    .local v0, "fontSelector":Lcom/itextpdf/layout/font/FontSelector;
    invoke-virtual {v0}, Lcom/itextpdf/layout/font/FontSelector;->bestMatch()Lcom/itextpdf/layout/font/FontInfo;

    move-result-object v1

    invoke-virtual {p2, v1, p4}, Lcom/itextpdf/layout/font/FontProvider;->getPdfFont(Lcom/itextpdf/layout/font/FontInfo;Lcom/itextpdf/layout/font/FontSet;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v1

    return-object v1
.end method

.method protected retrieveHeight()Ljava/lang/Float;
    .locals 9

    .line 1505
    const/4 v0, 0x0

    .line 1506
    .local v0, "height":Ljava/lang/Float;
    const/16 v1, 0x1b

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsUnitValue(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v2

    .line 1507
    .local v2, "heightUV":Lcom/itextpdf/layout/properties/UnitValue;
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveResolvedParentDeclaredHeight()Ljava/lang/Float;

    move-result-object v3

    .line 1508
    .local v3, "parentResolvedHeight":Ljava/lang/Float;
    const/4 v4, 0x0

    .line 1509
    .local v4, "minHeight":Ljava/lang/Float;
    const/4 v5, 0x0

    .line 1510
    .local v5, "maxHeight":Ljava/lang/Float;
    if-eqz v2, :cond_9

    .line 1511
    const/16 v6, 0x54

    const/16 v7, 0x55

    if-nez v3, :cond_3

    .line 1512
    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/UnitValue;->isPercentValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1514
    const/4 v0, 0x0

    goto :goto_0

    .line 1517
    :cond_0
    invoke-virtual {p0, v7}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsUnitValue(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v1

    .line 1518
    .local v1, "minHeightUV":Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 1519
    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v7

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    .line 1521
    :cond_1
    invoke-virtual {p0, v6}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsUnitValue(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v6

    .line 1522
    .local v6, "maxHeightUV":Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v6, :cond_2

    invoke-virtual {v6}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 1523
    invoke-virtual {v6}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v7

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    .line 1526
    :cond_2
    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v7

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    .line 1527
    .end local v1    # "minHeightUV":Lcom/itextpdf/layout/properties/UnitValue;
    .end local v6    # "maxHeightUV":Lcom/itextpdf/layout/properties/UnitValue;
    goto :goto_0

    .line 1529
    :cond_3
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v8

    invoke-virtual {p0, v8, v7}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveUnitValue(FI)Ljava/lang/Float;

    move-result-object v4

    .line 1530
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v7

    invoke-virtual {p0, v7, v6}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveUnitValue(FI)Ljava/lang/Float;

    move-result-object v5

    .line 1531
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v6

    invoke-virtual {p0, v6, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveUnitValue(FI)Ljava/lang/Float;

    move-result-object v0

    .line 1533
    :goto_0
    if-eqz v5, :cond_4

    if-eqz v4, :cond_4

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v6

    cmpl-float v1, v1, v6

    if-lez v1, :cond_4

    .line 1534
    move-object v1, v4

    move-object v5, v1

    .line 1536
    :cond_4
    if-eqz v0, :cond_8

    .line 1537
    if-eqz v5, :cond_6

    .line 1538
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v6

    cmpl-float v1, v1, v6

    if-lez v1, :cond_5

    move-object v1, v5

    goto :goto_1

    :cond_5
    move-object v1, v0

    :goto_1
    move-object v0, v1

    .line 1540
    :cond_6
    if-eqz v4, :cond_8

    .line 1541
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v6

    cmpg-float v1, v1, v6

    if-gez v1, :cond_7

    move-object v1, v4

    goto :goto_2

    :cond_7
    move-object v1, v0

    :goto_2
    move-object v0, v1

    .line 1544
    :cond_8
    if-eqz v0, :cond_9

    invoke-static {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isBorderBoxSizing(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 1545
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-static {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->calculatePaddingBorderHeight(Lcom/itextpdf/layout/renderer/AbstractRenderer;)F

    move-result v6

    sub-float/2addr v1, v6

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    .line 1548
    :cond_9
    if-eqz v0, :cond_a

    const/4 v1, 0x0

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v6

    invoke-static {v1, v6}, Ljava/lang/Math;->max(FF)F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    goto :goto_3

    :cond_a
    const/4 v1, 0x0

    :goto_3
    return-object v1
.end method

.method protected retrieveMaxHeight()Ljava/lang/Float;
    .locals 6

    .line 1604
    const/4 v0, 0x0

    .local v0, "maxHeight":Ljava/lang/Float;
    const/4 v1, 0x0

    .line 1605
    .local v1, "minHeight":Ljava/lang/Float;
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveDirectParentDeclaredHeight()Ljava/lang/Float;

    move-result-object v2

    .line 1606
    .local v2, "directParentDeclaredHeight":Ljava/lang/Float;
    const/16 v3, 0x54

    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsUnitValue(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v4

    .line 1607
    .local v4, "maxHeightAsUV":Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v4, :cond_6

    .line 1608
    if-nez v2, :cond_2

    .line 1609
    invoke-virtual {v4}, Lcom/itextpdf/layout/properties/UnitValue;->isPercentValue()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1610
    const/4 v0, 0x0

    goto :goto_0

    .line 1612
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveMinHeight()Ljava/lang/Float;

    move-result-object v1

    .line 1614
    const/16 v3, 0x55

    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsUnitValue(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v3

    .line 1615
    .local v3, "minHeightUV":Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1616
    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v5

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    .line 1619
    :cond_1
    invoke-virtual {v4}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v5

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    .line 1620
    .end local v3    # "minHeightUV":Lcom/itextpdf/layout/properties/UnitValue;
    goto :goto_0

    .line 1622
    :cond_2
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-virtual {p0, v5, v3}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveUnitValue(FI)Ljava/lang/Float;

    move-result-object v0

    .line 1624
    :goto_0
    if-eqz v0, :cond_6

    .line 1625
    if-eqz v1, :cond_3

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v5

    cmpl-float v3, v3, v5

    if-lez v3, :cond_3

    .line 1626
    move-object v0, v1

    .line 1628
    :cond_3
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isBorderBoxSizing(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 1629
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-static {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->calculatePaddingBorderHeight(Lcom/itextpdf/layout/renderer/AbstractRenderer;)F

    move-result v5

    sub-float/2addr v3, v5

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    .line 1631
    :cond_4
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v3

    const/4 v5, 0x0

    cmpl-float v3, v3, v5

    if-lez v3, :cond_5

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v5

    :cond_5
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    return-object v3

    .line 1635
    :cond_6
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveHeight()Ljava/lang/Float;

    move-result-object v3

    return-object v3
.end method

.method protected retrieveMaxWidth(F)Ljava/lang/Float;
    .locals 4
    .param p1, "parentBoxWidth"    # F

    .line 1446
    const/16 v0, 0x4f

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveUnitValue(FI)Ljava/lang/Float;

    move-result-object v0

    .line 1447
    .local v0, "maxWidth":Ljava/lang/Float;
    if-eqz v0, :cond_3

    .line 1448
    const/16 v1, 0x50

    invoke-virtual {p0, p1, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveUnitValue(FI)Ljava/lang/Float;

    move-result-object v1

    .line 1449
    .local v1, "minWidth":Ljava/lang/Float;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v3

    cmpl-float v2, v2, v3

    if-lez v2, :cond_0

    .line 1450
    move-object v0, v1

    .line 1453
    :cond_0
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isBorderBoxSizing(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1454
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-static {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->calculatePaddingBorderWidth(Lcom/itextpdf/layout/renderer/AbstractRenderer;)F

    move-result v3

    sub-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    .line 1456
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v2

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-lez v2, :cond_2

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v3

    :cond_2
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    return-object v2

    .line 1458
    .end local v1    # "minWidth":Ljava/lang/Float;
    :cond_3
    const/4 v1, 0x0

    return-object v1
.end method

.method protected retrieveMinHeight()Ljava/lang/Float;
    .locals 5

    .line 1661
    const/4 v0, 0x0

    .line 1662
    .local v0, "minHeight":Ljava/lang/Float;
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveDirectParentDeclaredHeight()Ljava/lang/Float;

    move-result-object v1

    .line 1663
    .local v1, "directParentDeclaredHeight":Ljava/lang/Float;
    const/16 v2, 0x55

    invoke-static {p0, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsUnitValue(Lcom/itextpdf/layout/renderer/IRenderer;I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v3

    .line 1664
    .local v3, "minHeightUV":Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v3, :cond_4

    .line 1665
    if-nez v1, :cond_1

    .line 1666
    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/UnitValue;->isPercentValue()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1668
    const/4 v0, 0x0

    goto :goto_0

    .line 1671
    :cond_0
    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    goto :goto_0

    .line 1674
    :cond_1
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v4

    invoke-virtual {p0, v4, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveUnitValue(FI)Ljava/lang/Float;

    move-result-object v0

    .line 1676
    :goto_0
    if-eqz v0, :cond_4

    .line 1677
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isBorderBoxSizing(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1678
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-static {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->calculatePaddingBorderHeight(Lcom/itextpdf/layout/renderer/AbstractRenderer;)F

    move-result v4

    sub-float/2addr v2, v4

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    .line 1680
    :cond_2
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v2

    const/4 v4, 0x0

    cmpl-float v2, v2, v4

    if-lez v2, :cond_3

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v4

    :cond_3
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    return-object v2

    .line 1684
    :cond_4
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveHeight()Ljava/lang/Float;

    move-result-object v2

    return-object v2
.end method

.method protected retrieveMinWidth(F)Ljava/lang/Float;
    .locals 3
    .param p1, "parentBoxWidth"    # F

    .line 1473
    const/16 v0, 0x50

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveUnitValue(FI)Ljava/lang/Float;

    move-result-object v0

    .line 1474
    .local v0, "minWidth":Ljava/lang/Float;
    if-eqz v0, :cond_2

    .line 1475
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isBorderBoxSizing(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1476
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-static {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->calculatePaddingBorderWidth(Lcom/itextpdf/layout/renderer/AbstractRenderer;)F

    move-result v2

    sub-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    .line 1478
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v1

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-lez v1, :cond_1

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v2

    :cond_1
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    return-object v1

    .line 1480
    :cond_2
    const/4 v1, 0x0

    return-object v1
.end method

.method protected retrieveUnitValue(FI)Ljava/lang/Float;
    .locals 1
    .param p1, "baseValue"    # F
    .param p2, "property"    # I

    .line 1702
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveUnitValue(FIZ)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method protected retrieveUnitValue(FIZ)Ljava/lang/Float;
    .locals 5
    .param p1, "baseValue"    # F
    .param p2, "property"    # I
    .param p3, "pointOnly"    # Z

    .line 1706
    invoke-virtual {p0, p2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    .line 1707
    .local v0, "value":Lcom/itextpdf/layout/properties/UnitValue;
    const/4 v1, 0x1

    if-eqz p3, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getUnitType()I

    move-result v2

    if-ne v2, v1, :cond_0

    .line 1708
    const-class v2, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-static {v2}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v2

    .line 1709
    .local v2, "logger":Lorg/slf4j/Logger;
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const-string v4, "Property {0} in percents is not supported"

    invoke-static {v4, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1711
    .end local v2    # "logger":Lorg/slf4j/Logger;
    :cond_0
    if-eqz v0, :cond_4

    .line 1712
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getUnitType()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_2

    .line 1714
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v1

    const/high16 v2, 0x42c80000    # 100.0f

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v1

    mul-float/2addr v1, p1

    div-float/2addr v1, v2

    goto :goto_0

    :cond_1
    move v1, p1

    :goto_0
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    return-object v1

    .line 1716
    :cond_2
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getUnitType()I

    move-result v2

    if-ne v2, v1, :cond_3

    .line 1717
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    return-object v1

    .line 1716
    :cond_3
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 1720
    :cond_4
    const/4 v1, 0x0

    return-object v1
.end method

.method protected retrieveWidth(F)Ljava/lang/Float;
    .locals 6
    .param p1, "parentBoxWidth"    # F

    .line 1409
    const/16 v0, 0x50

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveUnitValue(FI)Ljava/lang/Float;

    move-result-object v0

    .line 1411
    .local v0, "minWidth":Ljava/lang/Float;
    const/16 v1, 0x4f

    invoke-virtual {p0, p1, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveUnitValue(FI)Ljava/lang/Float;

    move-result-object v1

    .line 1412
    .local v1, "maxWidth":Ljava/lang/Float;
    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v3

    cmpl-float v2, v2, v3

    if-lez v2, :cond_0

    .line 1413
    move-object v1, v0

    .line 1416
    :cond_0
    const/16 v2, 0x4d

    invoke-virtual {p0, p1, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveUnitValue(FI)Ljava/lang/Float;

    move-result-object v2

    .line 1417
    .local v2, "width":Ljava/lang/Float;
    const/4 v3, 0x0

    if-eqz v2, :cond_4

    .line 1418
    if-eqz v1, :cond_2

    .line 1419
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v4

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v5

    cmpl-float v4, v4, v5

    if-lez v4, :cond_1

    move-object v4, v1

    goto :goto_0

    :cond_1
    move-object v4, v2

    :goto_0
    move-object v2, v4

    .line 1421
    :cond_2
    if-eqz v0, :cond_6

    .line 1422
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v4

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v5

    cmpg-float v4, v4, v5

    if-gez v4, :cond_3

    move-object v4, v0

    goto :goto_1

    :cond_3
    move-object v4, v2

    :goto_1
    move-object v2, v4

    goto :goto_3

    .line 1424
    :cond_4
    if-eqz v1, :cond_6

    .line 1425
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v4

    cmpg-float v4, v4, p1

    if-gez v4, :cond_5

    move-object v4, v1

    goto :goto_2

    :cond_5
    move-object v4, v3

    :goto_2
    move-object v2, v4

    .line 1428
    :cond_6
    :goto_3
    if-eqz v2, :cond_7

    invoke-static {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isBorderBoxSizing(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 1429
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v4

    invoke-static {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->calculatePaddingBorderWidth(Lcom/itextpdf/layout/renderer/AbstractRenderer;)F

    move-result v5

    sub-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    .line 1432
    :cond_7
    if-eqz v2, :cond_8

    const/4 v3, 0x0

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    :cond_8
    return-object v3
.end method

.method returnBackOwnProperty(ILjava/lang/Object;)V
    .locals 0
    .param p1, "property"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(ITT;)V"
        }
    .end annotation

    .line 1340
    .local p2, "prevValue":Ljava/lang/Object;, "TT;"
    if-nez p2, :cond_0

    .line 1341
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->deleteOwnProperty(I)V

    goto :goto_0

    .line 1343
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    .line 1345
    :goto_0
    return-void
.end method

.method protected setBorders(Lcom/itextpdf/layout/borders/Border;I)Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .locals 1
    .param p1, "border"    # Lcom/itextpdf/layout/borders/Border;
    .param p2, "borderNumber"    # I

    .line 2272
    packed-switch p2, :pswitch_data_0

    goto :goto_0

    .line 2283
    :pswitch_0
    const/16 v0, 0xb

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    goto :goto_0

    .line 2280
    :pswitch_1
    const/16 v0, 0xa

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    .line 2281
    goto :goto_0

    .line 2277
    :pswitch_2
    const/16 v0, 0xc

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    .line 2278
    goto :goto_0

    .line 2274
    :pswitch_3
    const/16 v0, 0xd

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    .line 2275
    nop

    .line 2287
    :goto_0
    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method setChildRenderer(ILcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 1
    .param p1, "index"    # I
    .param p2, "child"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 2764
    if-eqz p2, :cond_0

    .line 2765
    invoke-interface {p2, p0}, Lcom/itextpdf/layout/renderer/IRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    .line 2767
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 2768
    .local v0, "removedElement":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-direct {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->removeThisFromParent(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 2769
    return-object v0
.end method

.method setChildRenderers(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;)V"
        }
    .end annotation

    .line 2722
    .local p1, "children":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->childRenderers:Ljava/util/List;

    invoke-direct {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->removeThisFromParents(Ljava/util/Collection;)V

    .line 2723
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 2724
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->addAllChildRenderers(Ljava/util/List;)V

    .line 2725
    return-void
.end method

.method protected setMinMaxWidthBasedOnFixedWidth(Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;)Z
    .locals 2
    .param p1, "minMaxWidth"    # Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    .line 2153
    const/16 v0, 0x4d

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->hasAbsoluteUnitValue(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2155
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveWidth(F)Ljava/lang/Float;

    move-result-object v0

    .line 2156
    .local v0, "width":Ljava/lang/Float;
    if-eqz v0, :cond_0

    .line 2157
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {p1, v1}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->setChildrenMaxWidth(F)V

    .line 2158
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {p1, v1}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->setChildrenMinWidth(F)V

    .line 2159
    const/4 v1, 0x1

    return v1

    .line 2162
    .end local v0    # "width":Ljava/lang/Float;
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 0
    .param p1, "parent"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1157
    iput-object p1, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1158
    return-object p0
.end method

.method public setProperty(ILjava/lang/Object;)V
    .locals 2
    .param p1, "property"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .line 355
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->properties:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 356
    return-void
.end method

.method setThisAsParent(Ljava/util/Collection;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;)V"
        }
    .end annotation

    .line 2777
    .local p1, "children":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 2778
    .local v1, "child":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-interface {v1, p0}, Lcom/itextpdf/layout/renderer/IRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    .line 2779
    .end local v1    # "child":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_0

    .line 2780
    :cond_0
    return-void
.end method

.method shrinkOccupiedAreaForAbsolutePosition()V
    .locals 5

    .line 2468
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isAbsolutePosition()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2469
    const/16 v0, 0x22

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v0

    .line 2470
    .local v0, "left":Ljava/lang/Float;
    const/16 v1, 0x36

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v1

    .line 2471
    .local v1, "right":Ljava/lang/Float;
    const/16 v2, 0x4d

    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/properties/UnitValue;

    .line 2472
    .local v2, "width":Lcom/itextpdf/layout/properties/UnitValue;
    if-nez v0, :cond_0

    if-nez v1, :cond_0

    if-nez v2, :cond_0

    .line 2473
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 2476
    .end local v0    # "left":Ljava/lang/Float;
    .end local v1    # "right":Ljava/lang/Float;
    .end local v2    # "width":Lcom/itextpdf/layout/properties/UnitValue;
    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 455
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 456
    .local v0, "sb":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 457
    .local v2, "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 458
    .end local v2    # "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_0

    .line 459
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method protected transformPoints(Ljava/util/List;Lcom/itextpdf/kernel/geom/AffineTransform;)Ljava/util/List;
    .locals 2
    .param p2, "transform"    # Lcom/itextpdf/kernel/geom/AffineTransform;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Point;",
            ">;",
            "Lcom/itextpdf/kernel/geom/AffineTransform;",
            ")",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Point;",
            ">;"
        }
    .end annotation

    .line 2339
    .local p1, "points":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Point;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/geom/Point;

    .line 2340
    .local v1, "point":Lcom/itextpdf/kernel/geom/Point;
    invoke-virtual {p2, v1, v1}, Lcom/itextpdf/kernel/geom/AffineTransform;->transform(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    .line 2341
    .end local v1    # "point":Lcom/itextpdf/kernel/geom/Point;
    goto :goto_0

    .line 2343
    :cond_0
    return-object p1
.end method

.method protected updateHeight(Lcom/itextpdf/layout/properties/UnitValue;)V
    .locals 2
    .param p1, "updatedHeight"    # Lcom/itextpdf/layout/properties/UnitValue;

    .line 1590
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isBorderBoxSizing(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1591
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v0

    invoke-static {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->calculatePaddingBorderHeight(Lcom/itextpdf/layout/renderer/AbstractRenderer;)F

    move-result v1

    add-float/2addr v0, v1

    invoke-virtual {p1, v0}, Lcom/itextpdf/layout/properties/UnitValue;->setValue(F)V

    .line 1594
    :cond_0
    const/16 v0, 0x1b

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    .line 1595
    return-void
.end method

.method updateHeightsOnSplit(FZLcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/layout/renderer/AbstractRenderer;Z)V
    .locals 7
    .param p1, "usedHeight"    # F
    .param p2, "wasHeightClipped"    # Z
    .param p3, "splitRenderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .param p4, "overflowRenderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .param p5, "enlargeOccupiedAreaOnHeightWasClipped"    # Z

    .line 2070
    if-eqz p2, :cond_0

    .line 2072
    const-class v0, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 2073
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v1, "Element content was clipped because some height properties are set."

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 2075
    if-eqz p5, :cond_0

    .line 2076
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveMaxHeight()Ljava/lang/Float;

    move-result-object v1

    .line 2077
    .local v1, "maxHeight":Ljava/lang/Float;
    iget-object v2, p3, Lcom/itextpdf/layout/renderer/AbstractRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    .line 2078
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v3

    sub-float/2addr v3, p1

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    .line 2079
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 2080
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    .line 2084
    .end local v0    # "logger":Lorg/slf4j/Logger;
    .end local v1    # "maxHeight":Ljava/lang/Float;
    :cond_0
    if-eqz p4, :cond_b

    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isKeepTogether()Z

    move-result v0

    if-eqz v0, :cond_1

    goto/16 :goto_6

    .line 2090
    :cond_1
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveResolvedParentDeclaredHeight()Ljava/lang/Float;

    move-result-object v0

    .line 2091
    .local v0, "parentResolvedHeightPropertyValue":Ljava/lang/Float;
    const/16 v1, 0x54

    invoke-static {p0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsUnitValue(Lcom/itextpdf/layout/renderer/IRenderer;I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v1

    .line 2092
    .local v1, "maxHeightUV":Lcom/itextpdf/layout/properties/UnitValue;
    const/high16 v2, 0x42c80000    # 100.0f

    if-eqz v1, :cond_4

    .line 2093
    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 2094
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveMaxHeight()Ljava/lang/Float;

    move-result-object v3

    .line 2095
    .local v3, "maxHeight":Ljava/lang/Float;
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v4

    sub-float/2addr v4, p1

    invoke-static {v4}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v4

    .line 2096
    .local v4, "updateMaxHeight":Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {p4, v4}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->updateMaxHeight(Lcom/itextpdf/layout/properties/UnitValue;)V

    .end local v3    # "maxHeight":Ljava/lang/Float;
    .end local v4    # "updateMaxHeight":Lcom/itextpdf/layout/properties/UnitValue;
    goto :goto_0

    .line 2097
    :cond_2
    if-eqz v0, :cond_3

    .line 2099
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v3

    div-float v3, p1, v3

    mul-float/2addr v3, v2

    .line 2101
    .local v3, "currentOccupiedFraction":F
    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v4

    sub-float/2addr v4, v3

    .line 2103
    .local v4, "newFraction":F
    invoke-static {v4}, Lcom/itextpdf/layout/properties/UnitValue;->createPercentValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v5

    invoke-virtual {p4, v5}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->updateMinHeight(Lcom/itextpdf/layout/properties/UnitValue;)V

    goto :goto_1

    .line 2097
    .end local v3    # "currentOccupiedFraction":F
    .end local v4    # "newFraction":F
    :cond_3
    :goto_0
    nop

    .line 2107
    :cond_4
    :goto_1
    const/16 v3, 0x55

    invoke-static {p0, v3}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsUnitValue(Lcom/itextpdf/layout/renderer/IRenderer;I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v3

    .line 2108
    .local v3, "minHeightUV":Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v3, :cond_7

    .line 2109
    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 2110
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveMinHeight()Ljava/lang/Float;

    move-result-object v4

    .line 2111
    .local v4, "minHeight":Ljava/lang/Float;
    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v5

    sub-float/2addr v5, p1

    invoke-static {v5}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v5

    .line 2112
    .local v5, "updateminHeight":Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {p4, v5}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->updateMinHeight(Lcom/itextpdf/layout/properties/UnitValue;)V

    .end local v4    # "minHeight":Ljava/lang/Float;
    .end local v5    # "updateminHeight":Lcom/itextpdf/layout/properties/UnitValue;
    goto :goto_2

    .line 2113
    :cond_5
    if-eqz v0, :cond_6

    .line 2115
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v4

    div-float v4, p1, v4

    mul-float/2addr v4, v2

    .line 2117
    .local v4, "currentOccupiedFraction":F
    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v5

    sub-float/2addr v5, v4

    .line 2119
    .local v5, "newFraction":F
    invoke-static {v5}, Lcom/itextpdf/layout/properties/UnitValue;->createPercentValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v6

    invoke-virtual {p4, v6}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->updateMinHeight(Lcom/itextpdf/layout/properties/UnitValue;)V

    goto :goto_3

    .line 2113
    .end local v4    # "currentOccupiedFraction":F
    .end local v5    # "newFraction":F
    :cond_6
    :goto_2
    nop

    .line 2124
    :cond_7
    :goto_3
    const/16 v4, 0x1b

    invoke-static {p0, v4}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsUnitValue(Lcom/itextpdf/layout/renderer/IRenderer;I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v4

    .line 2125
    .local v4, "heightUV":Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v4, :cond_a

    .line 2126
    invoke-virtual {v4}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v5

    if-eqz v5, :cond_8

    .line 2127
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveHeight()Ljava/lang/Float;

    move-result-object v2

    .line 2128
    .local v2, "height":Ljava/lang/Float;
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v5

    sub-float/2addr v5, p1

    invoke-static {v5}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v5

    .line 2129
    .local v5, "updateHeight":Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {p4, v5}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->updateHeight(Lcom/itextpdf/layout/properties/UnitValue;)V

    .end local v2    # "height":Ljava/lang/Float;
    .end local v5    # "updateHeight":Lcom/itextpdf/layout/properties/UnitValue;
    goto :goto_4

    .line 2130
    :cond_8
    if-eqz v0, :cond_9

    .line 2132
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v5

    div-float v5, p1, v5

    mul-float/2addr v5, v2

    .line 2134
    .local v5, "currentOccupiedFraction":F
    invoke-virtual {v4}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v2

    sub-float/2addr v2, v5

    .line 2136
    .local v2, "newFraction":F
    invoke-static {v2}, Lcom/itextpdf/layout/properties/UnitValue;->createPercentValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v6

    invoke-virtual {p4, v6}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->updateMinHeight(Lcom/itextpdf/layout/properties/UnitValue;)V

    goto :goto_5

    .line 2130
    .end local v2    # "newFraction":F
    .end local v5    # "currentOccupiedFraction":F
    :cond_9
    :goto_4
    nop

    .line 2140
    :cond_a
    :goto_5
    return-void

    .line 2085
    .end local v0    # "parentResolvedHeightPropertyValue":Ljava/lang/Float;
    .end local v1    # "maxHeightUV":Lcom/itextpdf/layout/properties/UnitValue;
    .end local v3    # "minHeightUV":Lcom/itextpdf/layout/properties/UnitValue;
    .end local v4    # "heightUV":Lcom/itextpdf/layout/properties/UnitValue;
    :cond_b
    :goto_6
    return-void
.end method

.method protected updateHeightsOnSplit(ZLcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/layout/renderer/AbstractRenderer;)V
    .locals 7
    .param p1, "wasHeightClipped"    # Z
    .param p2, "splitRenderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .param p3, "overflowRenderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 2066
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v2

    const/4 v6, 0x1

    move-object v1, p0

    move v3, p1

    move-object v4, p2

    move-object v5, p3

    .end local p1    # "wasHeightClipped":Z
    .end local p2    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .end local p3    # "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .local v3, "wasHeightClipped":Z
    .local v4, "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .local v5, "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    invoke-virtual/range {v1 .. v6}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->updateHeightsOnSplit(FZLcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/layout/renderer/AbstractRenderer;Z)V

    .line 2067
    return-void
.end method

.method protected updateMaxHeight(Lcom/itextpdf/layout/properties/UnitValue;)V
    .locals 2
    .param p1, "updatedMaxHeight"    # Lcom/itextpdf/layout/properties/UnitValue;

    .line 1646
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isBorderBoxSizing(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1647
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v0

    invoke-static {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->calculatePaddingBorderHeight(Lcom/itextpdf/layout/renderer/AbstractRenderer;)F

    move-result v1

    add-float/2addr v0, v1

    invoke-virtual {p1, v0}, Lcom/itextpdf/layout/properties/UnitValue;->setValue(F)V

    .line 1650
    :cond_0
    const/16 v0, 0x54

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    .line 1651
    return-void
.end method

.method protected updateMinHeight(Lcom/itextpdf/layout/properties/UnitValue;)V
    .locals 2
    .param p1, "updatedMinHeight"    # Lcom/itextpdf/layout/properties/UnitValue;

    .line 1695
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isBorderBoxSizing(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1696
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v0

    invoke-static {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->calculatePaddingBorderHeight(Lcom/itextpdf/layout/renderer/AbstractRenderer;)F

    move-result v1

    add-float/2addr v0, v1

    invoke-virtual {p1, v0}, Lcom/itextpdf/layout/properties/UnitValue;->setValue(F)V

    .line 1698
    :cond_0
    const/16 v0, 0x55

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    .line 1699
    return-void
.end method

.method protected updateWidth(Lcom/itextpdf/layout/properties/UnitValue;)V
    .locals 2
    .param p1, "updatedWidthValue"    # Lcom/itextpdf/layout/properties/UnitValue;

    .line 1491
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isBorderBoxSizing(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1492
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v0

    invoke-static {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->calculatePaddingBorderWidth(Lcom/itextpdf/layout/renderer/AbstractRenderer;)F

    move-result v1

    add-float/2addr v0, v1

    invoke-virtual {p1, v0}, Lcom/itextpdf/layout/properties/UnitValue;->setValue(F)V

    .line 1494
    :cond_0
    const/16 v0, 0x4d

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    .line 1495
    return-void
.end method
