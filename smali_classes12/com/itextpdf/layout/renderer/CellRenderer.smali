.class public Lcom/itextpdf/layout/renderer/CellRenderer;
.super Lcom/itextpdf/layout/renderer/BlockRenderer;
.source "CellRenderer.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 43
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/layout/element/Cell;)V
    .locals 2
    .param p1, "modelElement"    # Lcom/itextpdf/layout/element/Cell;

    .line 50
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/renderer/BlockRenderer;-><init>(Lcom/itextpdf/layout/element/IElement;)V

    .line 51
    if-eqz p1, :cond_0

    .line 52
    invoke-virtual {p1}, Lcom/itextpdf/layout/element/Cell;->getRowspan()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/16 v1, 0x3c

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/renderer/CellRenderer;->setProperty(ILjava/lang/Object;)V

    .line 53
    invoke-virtual {p1}, Lcom/itextpdf/layout/element/Cell;->getColspan()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/16 v1, 0x10

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/renderer/CellRenderer;->setProperty(ILjava/lang/Object;)V

    .line 54
    return-void

    .line 51
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method


# virtual methods
.method protected applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/borders/Border;Z)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 3
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "borders"    # [Lcom/itextpdf/layout/borders/Border;
    .param p3, "reverse"    # Z

    .line 143
    sget-object v0, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;->SEPARATE:Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/CellRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    const/16 v2, 0x72

    invoke-interface {v1, v2}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 144
    invoke-super {p0, p1, p2, p3}, Lcom/itextpdf/layout/renderer/BlockRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/borders/Border;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 149
    :cond_0
    return-object p1
.end method

.method protected applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/properties/UnitValue;Z)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 3
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "margins"    # [Lcom/itextpdf/layout/properties/UnitValue;
    .param p3, "reverse"    # Z

    .line 155
    sget-object v0, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;->SEPARATE:Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/CellRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    const/16 v2, 0x72

    invoke-interface {v1, v2}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 156
    invoke-virtual {p0, p1, p3}, Lcom/itextpdf/layout/renderer/CellRenderer;->applySpacings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 158
    :cond_0
    return-object p1
.end method

.method protected applySpacings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 6
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "reverse"    # Z

    .line 171
    sget-object v0, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;->SEPARATE:Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/CellRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    const/16 v2, 0x72

    invoke-interface {v1, v2}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 172
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/CellRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    const/16 v1, 0x74

    invoke-interface {v0, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    .line 173
    .local v0, "verticalBorderSpacing":Ljava/lang/Float;
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/CellRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    const/16 v2, 0x73

    invoke-interface {v1, v2}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    .line 174
    .local v1, "horizontalBorderSpacing":Ljava/lang/Float;
    const/4 v2, 0x4

    new-array v2, v2, [F

    .line 175
    .local v2, "cellSpacings":[F
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v2

    if-ge v3, v4, :cond_3

    .line 176
    rem-int/lit8 v4, v3, 0x2

    const/4 v5, 0x0

    if-nez v4, :cond_1

    if-eqz v0, :cond_0

    .line 177
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v5

    goto :goto_1

    :cond_0
    goto :goto_1

    :cond_1
    if-eqz v1, :cond_2

    .line 178
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v5

    goto :goto_1

    :cond_2
    nop

    :goto_1
    aput v5, v2, v3

    .line 175
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 180
    .end local v3    # "i":I
    :cond_3
    invoke-virtual {p0, p1, v2, p2}, Lcom/itextpdf/layout/renderer/CellRenderer;->applySpacings(Lcom/itextpdf/kernel/geom/Rectangle;[FZ)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 184
    .end local v0    # "verticalBorderSpacing":Ljava/lang/Float;
    .end local v1    # "horizontalBorderSpacing":Ljava/lang/Float;
    .end local v2    # "cellSpacings":[F
    :cond_4
    return-object p1
.end method

.method protected applySpacings(Lcom/itextpdf/kernel/geom/Rectangle;[FZ)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 8
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "spacings"    # [F
    .param p3, "reverse"    # Z

    .line 198
    sget-object v0, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;->SEPARATE:Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/CellRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    const/16 v2, 0x72

    invoke-interface {v1, v2}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 199
    const/4 v0, 0x0

    aget v0, p2, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float v3, v0, v1

    const/4 v0, 0x1

    aget v0, p2, v0

    div-float v4, v0, v1

    const/4 v0, 0x2

    aget v0, p2, v0

    div-float v5, v0, v1

    const/4 v0, 0x3

    aget v0, p2, v0

    div-float v6, v0, v1

    move-object v2, p1

    move v7, p3

    .end local p1    # "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local p3    # "reverse":Z
    .local v2, "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v7, "reverse":Z
    invoke-virtual/range {v2 .. v7}, Lcom/itextpdf/kernel/geom/Rectangle;->applyMargins(FFFFZ)Lcom/itextpdf/kernel/geom/Rectangle;

    goto :goto_0

    .line 198
    .end local v2    # "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v7    # "reverse":Z
    .restart local p1    # "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local p3    # "reverse":Z
    :cond_0
    move-object v2, p1

    move v7, p3

    .line 203
    .end local p1    # "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local p3    # "reverse":Z
    .restart local v2    # "rect":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local v7    # "reverse":Z
    :goto_0
    return-object v2
.end method

.method protected createOverflowRenderer(I)Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .locals 2
    .param p1, "layoutResult"    # I

    .line 88
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/CellRenderer;->getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/CellRenderer;

    .line 89
    .local v0, "overflowRenderer":Lcom/itextpdf/layout/renderer/CellRenderer;
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/CellRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/CellRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 90
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/CellRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/CellRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    .line 91
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/CellRenderer;->getOwnProperties()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/CellRenderer;->addAllProperties(Ljava/util/Map;)V

    .line 92
    return-object v0
.end method

.method protected createSplitRenderer(I)Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .locals 2
    .param p1, "layoutResult"    # I

    .line 74
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/CellRenderer;->getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/CellRenderer;

    .line 75
    .local v0, "splitRenderer":Lcom/itextpdf/layout/renderer/CellRenderer;
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/CellRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/CellRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 76
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/CellRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/CellRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    .line 77
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/CellRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/CellRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 78
    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/itextpdf/layout/renderer/CellRenderer;->isLastRendererForModelElement:Z

    .line 79
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/CellRenderer;->getOwnProperties()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/CellRenderer;->addAllProperties(Ljava/util/Map;)V

    .line 80
    return-object v0
.end method

.method public drawBackground(Lcom/itextpdf/layout/renderer/DrawContext;)V
    .locals 26
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;

    .line 97
    move-object/from16 v1, p0

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 98
    .local v2, "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->getGraphicsState()Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getCtm()Lcom/itextpdf/kernel/geom/Matrix;

    move-result-object v3

    .line 101
    .local v3, "ctm":Lcom/itextpdf/kernel/geom/Matrix;
    const/16 v0, 0x37

    invoke-virtual {v1, v0}, Lcom/itextpdf/layout/renderer/CellRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v4

    .line 102
    .local v4, "angle":Ljava/lang/Float;
    const/4 v5, 0x1

    const/4 v6, 0x6

    const/4 v7, 0x0

    if-eqz v4, :cond_0

    invoke-virtual {v1, v6}, Lcom/itextpdf/layout/renderer/CellRenderer;->hasProperty(I)Z

    move-result v8

    if-eqz v8, :cond_0

    move v8, v5

    goto :goto_0

    :cond_0
    move v8, v7

    .line 103
    .local v8, "avoidRotation":Z
    :goto_0
    invoke-virtual {v1, v0}, Lcom/itextpdf/layout/renderer/CellRenderer;->hasOwnProperty(I)Z

    move-result v9

    .line 104
    .local v9, "restoreRotation":Z
    const/4 v10, 0x7

    const/4 v11, 0x4

    const/4 v12, 0x3

    if-eqz v8, :cond_1

    .line 105
    new-instance v13, Lcom/itextpdf/kernel/geom/AffineTransform;

    invoke-virtual {v3, v7}, Lcom/itextpdf/kernel/geom/Matrix;->get(I)F

    move-result v14

    float-to-double v14, v14

    invoke-virtual {v3, v5}, Lcom/itextpdf/kernel/geom/Matrix;->get(I)F

    move-result v7

    float-to-double v0, v7

    invoke-virtual {v3, v12}, Lcom/itextpdf/kernel/geom/Matrix;->get(I)F

    move-result v7

    move-object/from16 v16, v13

    float-to-double v12, v7

    invoke-virtual {v3, v11}, Lcom/itextpdf/kernel/geom/Matrix;->get(I)F

    move-result v7

    move-wide/from16 v18, v12

    float-to-double v11, v7

    invoke-virtual {v3, v6}, Lcom/itextpdf/kernel/geom/Matrix;->get(I)F

    move-result v7

    float-to-double v6, v7

    invoke-virtual {v3, v10}, Lcom/itextpdf/kernel/geom/Matrix;->get(I)F

    move-result v13

    move-wide/from16 v20, v11

    float-to-double v10, v13

    move-wide/from16 v22, v6

    move-wide/from16 v24, v10

    move-object/from16 v13, v16

    move-wide/from16 v16, v0

    invoke-direct/range {v13 .. v25}, Lcom/itextpdf/kernel/geom/AffineTransform;-><init>(DDDDDD)V

    move-object/from16 v16, v13

    .line 107
    .local v16, "transform":Lcom/itextpdf/kernel/geom/AffineTransform;
    :try_start_0
    invoke-virtual/range {v16 .. v16}, Lcom/itextpdf/kernel/geom/AffineTransform;->createInverse()Lcom/itextpdf/kernel/geom/AffineTransform;

    move-result-object v0
    :try_end_0
    .catch Lcom/itextpdf/kernel/geom/NoninvertibleTransformException; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    .end local v16    # "transform":Lcom/itextpdf/kernel/geom/AffineTransform;
    .local v0, "transform":Lcom/itextpdf/kernel/geom/AffineTransform;
    nop

    .line 111
    new-instance v1, Lcom/itextpdf/kernel/geom/AffineTransform;

    invoke-direct {v1}, Lcom/itextpdf/kernel/geom/AffineTransform;-><init>()V

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/geom/AffineTransform;->concatenate(Lcom/itextpdf/kernel/geom/AffineTransform;)V

    .line 112
    invoke-virtual {v2, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->concatMatrix(Lcom/itextpdf/kernel/geom/AffineTransform;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 113
    const/4 v1, 0x0

    const/16 v7, 0x37

    move-object/from16 v6, p0

    invoke-virtual {v6, v7, v1}, Lcom/itextpdf/layout/renderer/CellRenderer;->setProperty(ILjava/lang/Object;)V

    goto :goto_1

    .line 108
    .end local v0    # "transform":Lcom/itextpdf/kernel/geom/AffineTransform;
    .restart local v16    # "transform":Lcom/itextpdf/kernel/geom/AffineTransform;
    :catch_0
    move-exception v0

    move-object/from16 v6, p0

    .line 109
    .local v0, "e":Lcom/itextpdf/kernel/geom/NoninvertibleTransformException;
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v5, "A noninvertible matrix has been parsed. The behaviour is unpredictable."

    invoke-direct {v1, v5, v0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 104
    .end local v0    # "e":Lcom/itextpdf/kernel/geom/NoninvertibleTransformException;
    .end local v16    # "transform":Lcom/itextpdf/kernel/geom/AffineTransform;
    :cond_1
    move-object v6, v1

    .line 116
    :goto_1
    invoke-super/range {p0 .. p1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->drawBackground(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 119
    if-eqz v8, :cond_3

    .line 120
    if-eqz v9, :cond_2

    .line 121
    const/16 v7, 0x37

    invoke-virtual {v6, v7, v4}, Lcom/itextpdf/layout/renderer/CellRenderer;->setProperty(ILjava/lang/Object;)V

    goto :goto_2

    .line 123
    :cond_2
    const/16 v7, 0x37

    invoke-virtual {v6, v7}, Lcom/itextpdf/layout/renderer/CellRenderer;->deleteOwnProperty(I)V

    .line 125
    :goto_2
    new-instance v10, Lcom/itextpdf/kernel/geom/AffineTransform;

    const/4 v0, 0x0

    invoke-virtual {v3, v0}, Lcom/itextpdf/kernel/geom/Matrix;->get(I)F

    move-result v0

    float-to-double v11, v0

    invoke-virtual {v3, v5}, Lcom/itextpdf/kernel/geom/Matrix;->get(I)F

    move-result v0

    float-to-double v13, v0

    const/4 v0, 0x3

    invoke-virtual {v3, v0}, Lcom/itextpdf/kernel/geom/Matrix;->get(I)F

    move-result v0

    float-to-double v0, v0

    const/4 v5, 0x4

    invoke-virtual {v3, v5}, Lcom/itextpdf/kernel/geom/Matrix;->get(I)F

    move-result v5

    move-wide v15, v0

    float-to-double v0, v5

    const/4 v5, 0x6

    invoke-virtual {v3, v5}, Lcom/itextpdf/kernel/geom/Matrix;->get(I)F

    move-result v5

    move-wide/from16 v17, v0

    float-to-double v0, v5

    const/4 v5, 0x7

    invoke-virtual {v3, v5}, Lcom/itextpdf/kernel/geom/Matrix;->get(I)F

    move-result v5

    move-wide/from16 v19, v0

    float-to-double v0, v5

    move-wide/from16 v21, v0

    invoke-direct/range {v10 .. v22}, Lcom/itextpdf/kernel/geom/AffineTransform;-><init>(DDDDDD)V

    invoke-virtual {v2, v10}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->concatMatrix(Lcom/itextpdf/kernel/geom/AffineTransform;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 127
    :cond_3
    return-void
.end method

.method public drawBorder(Lcom/itextpdf/layout/renderer/DrawContext;)V
    .locals 3
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;

    .line 134
    sget-object v0, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;->SEPARATE:Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/CellRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    const/16 v2, 0x72

    invoke-interface {v1, v2}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/properties/BorderCollapsePropertyValue;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 135
    invoke-super {p0, p1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->drawBorder(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 139
    :cond_0
    return-void
.end method

.method public getModelElement()Lcom/itextpdf/layout/IPropertyContainer;
    .locals 1

    .line 61
    invoke-super {p0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v0

    return-object v0
.end method

.method public getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 2

    .line 219
    const-class v0, Lcom/itextpdf/layout/renderer/CellRenderer;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/CellRenderer;->logWarningIfGetNextRendererNotOverridden(Ljava/lang/Class;Ljava/lang/Class;)Z

    .line 220
    new-instance v0, Lcom/itextpdf/layout/renderer/CellRenderer;

    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/CellRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/element/Cell;

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/renderer/CellRenderer;-><init>(Lcom/itextpdf/layout/element/Cell;)V

    return-object v0
.end method

.method protected retrieveWidth(F)Ljava/lang/Float;
    .locals 1
    .param p1, "parentBoxWidth"    # F

    .line 66
    const/4 v0, 0x0

    return-object v0
.end method
