.class public abstract Lcom/itextpdf/layout/renderer/BlockRenderer;
.super Lcom/itextpdf/layout/renderer/AbstractRenderer;
.source "BlockRenderer.java"


# direct methods
.method protected constructor <init>(Lcom/itextpdf/layout/element/IElement;)V
    .locals 0
    .param p1, "modelElement"    # Lcom/itextpdf/layout/element/IElement;

    .line 79
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;-><init>(Lcom/itextpdf/layout/element/IElement;)V

    .line 80
    return-void
.end method

.method private addMarkedContent(Lcom/itextpdf/layout/renderer/DrawContext;Z)V
    .locals 2
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;
    .param p2, "isBegin"    # Z

    .line 1158
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v1, 0x89

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1159
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 1160
    .local v0, "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    if-eqz p2, :cond_0

    .line 1161
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->beginVariableText()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->endPath()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    goto :goto_0

    .line 1163
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->endVariableText()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1166
    .end local v0    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    :cond_1
    :goto_0
    return-void
.end method

.method private checkPointSide(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)I
    .locals 14
    .param p1, "filteredPoint"    # Lcom/itextpdf/kernel/geom/Point;
    .param p2, "clipLineBeg"    # Lcom/itextpdf/kernel/geom/Point;
    .param p3, "clipLineEnd"    # Lcom/itextpdf/kernel/geom/Point;

    .line 1199
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v0

    invoke-virtual/range {p2 .. p2}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v2

    sub-double/2addr v0, v2

    .line 1200
    .local v0, "x1":D
    invoke-virtual/range {p3 .. p3}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v2

    invoke-virtual/range {p2 .. p2}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v4

    sub-double/2addr v2, v4

    .line 1202
    .local v2, "y2":D
    invoke-virtual/range {p3 .. p3}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v4

    invoke-virtual/range {p2 .. p2}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v6

    sub-double/2addr v4, v6

    .line 1203
    .local v4, "x2":D
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v6

    invoke-virtual/range {p2 .. p2}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v8

    sub-double/2addr v6, v8

    .line 1205
    .local v6, "y1":D
    mul-double v8, v0, v2

    mul-double v10, v4, v6

    sub-double/2addr v8, v10

    .line 1207
    .local v8, "sgn":D
    invoke-static {v8, v9}, Ljava/lang/Math;->abs(D)D

    move-result-wide v10

    const-wide v12, 0x3f50624dd2f1a9fcL    # 0.001

    cmpg-double v10, v10, v12

    const/4 v11, 0x0

    if-gez v10, :cond_0

    return v11

    .line 1208
    :cond_0
    const-wide/16 v12, 0x0

    cmpl-double v10, v8, v12

    if-lez v10, :cond_1

    const/4 v10, 0x1

    return v10

    .line 1209
    :cond_1
    cmpg-double v10, v8, v12

    if-gez v10, :cond_2

    const/4 v10, -0x1

    return v10

    .line 1211
    :cond_2
    return v11
.end method

.method private clipPolygon(Ljava/util/List;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Ljava/util/List;
    .locals 6
    .param p2, "clipLineBeg"    # Lcom/itextpdf/kernel/geom/Point;
    .param p3, "clipLineEnd"    # Lcom/itextpdf/kernel/geom/Point;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Point;",
            ">;",
            "Lcom/itextpdf/kernel/geom/Point;",
            "Lcom/itextpdf/kernel/geom/Point;",
            ")",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Point;",
            ">;"
        }
    .end annotation

    .line 1169
    .local p1, "points":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Point;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1171
    .local v0, "filteredPoints":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Point;>;"
    const/4 v1, 0x0

    .line 1172
    .local v1, "prevOnRightSide":Z
    const/4 v2, 0x0

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/geom/Point;

    .line 1173
    .local v2, "filteringPoint":Lcom/itextpdf/kernel/geom/Point;
    invoke-direct {p0, v2, p2, p3}, Lcom/itextpdf/layout/renderer/BlockRenderer;->checkPointSide(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)I

    move-result v3

    if-ltz v3, :cond_0

    .line 1174
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1175
    const/4 v1, 0x1

    .line 1178
    :cond_0
    move-object v3, v2

    .line 1179
    .local v3, "prevPoint":Lcom/itextpdf/kernel/geom/Point;
    const/4 v4, 0x1

    .local v4, "i":I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    if-ge v4, v5, :cond_4

    .line 1180
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    rem-int v5, v4, v5

    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    move-object v2, v5

    check-cast v2, Lcom/itextpdf/kernel/geom/Point;

    .line 1181
    invoke-direct {p0, v2, p2, p3}, Lcom/itextpdf/layout/renderer/BlockRenderer;->checkPointSide(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)I

    move-result v5

    if-ltz v5, :cond_2

    .line 1182
    if-nez v1, :cond_1

    .line 1183
    invoke-direct {p0, v3, v2, p2, p3}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getIntersectionPoint(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1185
    :cond_1
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1186
    const/4 v1, 0x1

    goto :goto_1

    .line 1187
    :cond_2
    if-eqz v1, :cond_3

    .line 1188
    invoke-direct {p0, v3, v2, p2, p3}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getIntersectionPoint(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1191
    :cond_3
    :goto_1
    move-object v3, v2

    .line 1179
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1194
    .end local v4    # "i":I
    :cond_4
    return-object v0
.end method

.method private getIntersectionPoint(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;
    .locals 21
    .param p1, "lineBeg"    # Lcom/itextpdf/kernel/geom/Point;
    .param p2, "lineEnd"    # Lcom/itextpdf/kernel/geom/Point;
    .param p3, "clipLineBeg"    # Lcom/itextpdf/kernel/geom/Point;
    .param p4, "clipLineEnd"    # Lcom/itextpdf/kernel/geom/Point;

    .line 1215
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

    .line 1216
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

    .line 1217
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

    .line 1218
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

    .line 1220
    .local v10, "C2":D
    mul-double v12, v4, v2

    mul-double v14, v6, v0

    sub-double/2addr v12, v14

    .line 1222
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

.method private isAnythingOccupied()Z
    .locals 2

    .line 1139
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v0

    const v1, 0x38d1b717    # 1.0E-4f

    cmpg-float v0, v0, v1

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private replaceSplitRendererKidFloats(Ljava/util/Map;Lcom/itextpdf/layout/renderer/IRenderer;)V
    .locals 5
    .param p2, "splitRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ")V"
        }
    .end annotation

    .line 1143
    .local p1, "waitingFloatsSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 1144
    .local v1, "waitingSplitRenderer":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 1145
    invoke-interface {p2}, Lcom/itextpdf/layout/renderer/IRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v2

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 1147
    :cond_0
    invoke-interface {p2}, Lcom/itextpdf/layout/renderer/IRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v2

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1149
    .end local v1    # "waitingSplitRenderer":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    :goto_1
    goto :goto_0

    .line 1150
    :cond_1
    invoke-interface {p2}, Lcom/itextpdf/layout/renderer/IRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .local v0, "i":I
    :goto_2
    if-ltz v0, :cond_3

    .line 1151
    invoke-interface {p2}, Lcom/itextpdf/layout/renderer/IRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_2

    .line 1152
    invoke-interface {p2}, Lcom/itextpdf/layout/renderer/IRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 1150
    :cond_2
    add-int/lit8 v0, v0, -0x1

    goto :goto_2

    .line 1155
    .end local v0    # "i":I
    :cond_3
    return-void
.end method


# virtual methods
.method applyMaxHeight(Lcom/itextpdf/kernel/geom/Rectangle;Ljava/lang/Float;Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;ZZLcom/itextpdf/layout/properties/OverflowPropertyValue;)Z
    .locals 4
    .param p1, "parentBBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "blockMaxHeight"    # Ljava/lang/Float;
    .param p3, "marginsCollapseHandler"    # Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .param p4, "isCellRenderer"    # Z
    .param p5, "wasParentsHeightClipped"    # Z
    .param p6, "overflowY"    # Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    .line 1003
    if-eqz p2, :cond_3

    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_0

    invoke-static {p6}, Lcom/itextpdf/layout/renderer/BlockRenderer;->isOverflowFit(Lcom/itextpdf/layout/properties/OverflowPropertyValue;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1006
    :cond_0
    const/4 v0, 0x0

    .line 1007
    .local v0, "wasHeightClipped":Z
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v2

    cmpg-float v1, v1, v2

    if-gtz v1, :cond_1

    .line 1008
    const/4 v0, 0x1

    .line 1010
    :cond_1
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    sub-float/2addr v1, v2

    .line 1011
    .local v1, "heightDelta":F
    if-eqz p3, :cond_2

    if-nez p4, :cond_2

    .line 1012
    invoke-virtual {p3, v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->processFixedHeightAdjustment(F)V

    .line 1014
    :cond_2
    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1015
    return v0

    .line 1004
    .end local v0    # "wasHeightClipped":Z
    .end local v1    # "heightDelta":F
    :cond_3
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method applyMinHeight(Lcom/itextpdf/layout/properties/OverflowPropertyValue;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .locals 6
    .param p1, "overflowY"    # Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .param p2, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1019
    const/4 v0, 0x0

    .line 1020
    .local v0, "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->retrieveMinHeight()Ljava/lang/Float;

    move-result-object v1

    .line 1021
    .local v1, "blockMinHeight":Ljava/lang/Float;
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v3, 0x1a

    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    if-eqz v1, :cond_4

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v2

    iget-object v3, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v3

    cmpl-float v2, v2, v3

    if-lez v2, :cond_4

    .line 1022
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v2

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v3

    iget-object v4, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v4

    sub-float/2addr v3, v4

    sub-float/2addr v2, v3

    .line 1023
    .local v2, "blockBottom":F
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->isFixedLayout()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1024
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->setY(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    goto/16 :goto_0

    .line 1029
    :cond_0
    invoke-static {p1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->isOverflowFit(Lcom/itextpdf/layout/properties/OverflowPropertyValue;)Z

    move-result v3

    if-eqz v3, :cond_3

    const v3, 0x38d1b717    # 1.0E-4f

    add-float/2addr v3, v2

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v4

    cmpg-float v3, v3, v4

    if-gez v3, :cond_3

    .line 1030
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v3

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v4

    sub-float/2addr v3, v4

    .line 1031
    .local v3, "hDelta":F
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    .line 1032
    invoke-virtual {v4, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->increaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    .line 1033
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/geom/Rectangle;->setY(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1035
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v4

    const/4 v5, 0x0

    cmpg-float v4, v4, v5

    if-gez v4, :cond_1

    .line 1036
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1039
    :cond_1
    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->isLastRendererForModelElement:Z

    .line 1040
    const/4 v4, 0x2

    invoke-virtual {p0, v4}, Lcom/itextpdf/layout/renderer/BlockRenderer;->createOverflowRenderer(I)Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v0

    .line 1041
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v4

    iget-object v5, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v5

    sub-float/2addr v4, v5

    invoke-static {v4}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->updateMinHeight(Lcom/itextpdf/layout/properties/UnitValue;)V

    .line 1042
    const/16 v4, 0x1b

    invoke-virtual {p0, v4}, Lcom/itextpdf/layout/renderer/BlockRenderer;->hasProperty(I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1043
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->retrieveHeight()Ljava/lang/Float;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    iget-object v5, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v5

    sub-float/2addr v4, v5

    invoke-static {v4}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->updateHeight(Lcom/itextpdf/layout/properties/UnitValue;)V

    .line 1045
    .end local v3    # "hDelta":F
    :cond_2
    goto :goto_0

    .line 1046
    :cond_3
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->setY(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1050
    .end local v2    # "blockBottom":F
    :cond_4
    :goto_0
    return-object v0
.end method

.method protected applyRotationLayout(Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 18
    .param p1, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 748
    move-object/from16 v0, p0

    const/16 v1, 0x37

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    .line 750
    .local v1, "angle":F
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v2

    .line 751
    .local v2, "x":F
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v3

    .line 752
    .local v3, "y":F
    iget-object v4, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v4

    .line 753
    .local v4, "height":F
    iget-object v5, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v5

    .line 755
    .local v5, "width":F
    const/16 v6, 0x39

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    invoke-virtual {v0, v6, v7}, Lcom/itextpdf/layout/renderer/BlockRenderer;->setProperty(ILjava/lang/Object;)V

    .line 756
    const/16 v6, 0x38

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    invoke-virtual {v0, v6, v7}, Lcom/itextpdf/layout/renderer/BlockRenderer;->setProperty(ILjava/lang/Object;)V

    .line 758
    new-instance v6, Lcom/itextpdf/kernel/geom/AffineTransform;

    invoke-direct {v6}, Lcom/itextpdf/kernel/geom/AffineTransform;-><init>()V

    .line 761
    .local v6, "rotationTransform":Lcom/itextpdf/kernel/geom/AffineTransform;
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->isPositioned()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 762
    const/16 v7, 0x3a

    invoke-virtual {v0, v7}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v7

    .line 763
    .local v7, "rotationPointX":Ljava/lang/Float;
    const/16 v8, 0x3b

    invoke-virtual {v0, v8}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v8

    .line 765
    .local v8, "rotationPointY":Ljava/lang/Float;
    if-eqz v7, :cond_0

    if-nez v8, :cond_1

    .line 767
    :cond_0
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    .line 768
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    .line 773
    :cond_1
    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v9

    float-to-double v9, v9

    invoke-virtual {v8}, Ljava/lang/Float;->floatValue()F

    move-result v11

    float-to-double v11, v11

    invoke-virtual {v6, v9, v10, v11, v12}, Lcom/itextpdf/kernel/geom/AffineTransform;->translate(DD)V

    .line 776
    float-to-double v9, v1

    invoke-virtual {v6, v9, v10}, Lcom/itextpdf/kernel/geom/AffineTransform;->rotate(D)V

    .line 779
    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v9

    neg-float v9, v9

    float-to-double v9, v9

    invoke-virtual {v8}, Ljava/lang/Float;->floatValue()F

    move-result v11

    neg-float v11, v11

    float-to-double v11, v11

    invoke-virtual {v6, v9, v10, v11, v12}, Lcom/itextpdf/kernel/geom/AffineTransform;->translate(DD)V

    .line 781
    iget-object v9, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v9}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v9

    invoke-virtual {v0, v9}, Lcom/itextpdf/layout/renderer/BlockRenderer;->rectangleToPointsList(Lcom/itextpdf/kernel/geom/Rectangle;)Ljava/util/List;

    move-result-object v9

    invoke-virtual {v0, v9, v6}, Lcom/itextpdf/layout/renderer/BlockRenderer;->transformPoints(Ljava/util/List;Lcom/itextpdf/kernel/geom/AffineTransform;)Ljava/util/List;

    move-result-object v9

    .line 782
    .local v9, "rotatedPoints":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Point;>;"
    invoke-virtual {v0, v9}, Lcom/itextpdf/layout/renderer/BlockRenderer;->calculateBBox(Ljava/util/List;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v10

    .line 785
    .local v10, "newBBox":Lcom/itextpdf/kernel/geom/Rectangle;
    iget-object v11, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v11}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v11

    invoke-virtual {v10}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v12

    invoke-virtual {v11, v12}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 786
    iget-object v11, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v11}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v11

    invoke-virtual {v10}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v12

    invoke-virtual {v11, v12}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 787
    invoke-virtual {v10}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v11

    sub-float/2addr v11, v2

    .line 788
    .local v11, "occupiedAreaShiftX":F
    invoke-virtual {v10}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v12

    sub-float/2addr v12, v3

    .line 789
    .local v12, "occupiedAreaShiftY":F
    invoke-virtual {v0, v11, v12}, Lcom/itextpdf/layout/renderer/BlockRenderer;->move(FF)V

    .line 790
    .end local v7    # "rotationPointX":Ljava/lang/Float;
    .end local v8    # "rotationPointY":Ljava/lang/Float;
    .end local v9    # "rotatedPoints":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Point;>;"
    .end local v10    # "newBBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v11    # "occupiedAreaShiftX":F
    .end local v12    # "occupiedAreaShiftY":F
    move/from16 v16, v1

    move/from16 v17, v2

    goto :goto_1

    .line 791
    :cond_2
    float-to-double v7, v1

    invoke-static {v7, v8}, Lcom/itextpdf/kernel/geom/AffineTransform;->getRotateInstance(D)Lcom/itextpdf/kernel/geom/AffineTransform;

    move-result-object v6

    .line 792
    iget-object v7, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v7}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/itextpdf/layout/renderer/BlockRenderer;->rectangleToPointsList(Lcom/itextpdf/kernel/geom/Rectangle;)Ljava/util/List;

    move-result-object v7

    invoke-virtual {v0, v7, v6}, Lcom/itextpdf/layout/renderer/BlockRenderer;->transformPoints(Ljava/util/List;Lcom/itextpdf/kernel/geom/AffineTransform;)Ljava/util/List;

    move-result-object v7

    .line 793
    .local v7, "rotatedPoints":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Point;>;"
    add-float v8, v3, v4

    invoke-virtual {v0, v2, v8, v7}, Lcom/itextpdf/layout/renderer/BlockRenderer;->calculateShiftToPositionBBoxOfPointsAt(FFLjava/util/List;)[F

    move-result-object v8

    .line 795
    .local v8, "shift":[F
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_3

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/kernel/geom/Point;

    .line 796
    .local v10, "point":Lcom/itextpdf/kernel/geom/Point;
    invoke-virtual {v10}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v11

    const/4 v13, 0x0

    aget v13, v8, v13

    float-to-double v13, v13

    add-double/2addr v11, v13

    invoke-virtual {v10}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v13

    const/4 v15, 0x1

    aget v15, v8, v15

    move/from16 v16, v1

    move/from16 v17, v2

    .end local v1    # "angle":F
    .end local v2    # "x":F
    .local v16, "angle":F
    .local v17, "x":F
    float-to-double v1, v15

    add-double/2addr v13, v1

    invoke-virtual {v10, v11, v12, v13, v14}, Lcom/itextpdf/kernel/geom/Point;->setLocation(DD)V

    .line 797
    .end local v10    # "point":Lcom/itextpdf/kernel/geom/Point;
    move/from16 v1, v16

    move/from16 v2, v17

    goto :goto_0

    .line 799
    .end local v16    # "angle":F
    .end local v17    # "x":F
    .restart local v1    # "angle":F
    .restart local v2    # "x":F
    :cond_3
    move/from16 v16, v1

    move/from16 v17, v2

    .end local v1    # "angle":F
    .end local v2    # "x":F
    .restart local v16    # "angle":F
    .restart local v17    # "x":F
    invoke-virtual {v0, v7}, Lcom/itextpdf/layout/renderer/BlockRenderer;->calculateBBox(Ljava/util/List;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    .line 801
    .local v1, "newBBox":Lcom/itextpdf/kernel/geom/Rectangle;
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v9

    invoke-virtual {v2, v9}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 802
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v9

    invoke-virtual {v2, v9}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 804
    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v2

    sub-float v2, v4, v2

    .line 805
    .local v2, "heightDiff":F
    const/4 v9, 0x0

    invoke-virtual {v0, v9, v2}, Lcom/itextpdf/layout/renderer/BlockRenderer;->move(FF)V

    .line 807
    .end local v1    # "newBBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v2    # "heightDiff":F
    .end local v7    # "rotatedPoints":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Point;>;"
    .end local v8    # "shift":[F
    :goto_1
    return-void
.end method

.method protected applyVerticalAlignment()V
    .locals 8

    .line 694
    const/16 v0, 0x4b

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/VerticalAlignment;

    .line 695
    .local v0, "verticalAlignment":Lcom/itextpdf/layout/properties/VerticalAlignment;
    if-eqz v0, :cond_b

    sget-object v1, Lcom/itextpdf/layout/properties/VerticalAlignment;->TOP:Lcom/itextpdf/layout/properties/VerticalAlignment;

    if-eq v0, v1, :cond_b

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto/16 :goto_7

    .line 699
    :cond_0
    const v1, 0x7f7fffff    # Float.MAX_VALUE

    .line 700
    .local v1, "lowestChildBottom":F
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v2

    if-nez v2, :cond_3

    instance-of v2, p0, Lcom/itextpdf/layout/renderer/CellRenderer;

    if-eqz v2, :cond_1

    goto :goto_1

    .line 709
    :cond_1
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    .line 710
    .local v2, "lastChildIndex":I
    :goto_0
    if-ltz v2, :cond_6

    .line 711
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->childRenderers:Ljava/util/List;

    add-int/lit8 v4, v2, -0x1

    .end local v2    # "lastChildIndex":I
    .local v4, "lastChildIndex":I
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 712
    .local v2, "child":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-static {v2}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v3

    if-nez v3, :cond_2

    invoke-interface {v2}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 713
    invoke-interface {v2}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v1

    .line 714
    goto :goto_3

    .line 716
    .end local v2    # "child":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_2
    move v2, v4

    goto :goto_0

    .line 702
    .end local v4    # "lastChildIndex":I
    :cond_3
    :goto_1
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 703
    .local v3, "child":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-interface {v3}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v4

    if-eqz v4, :cond_4

    .line 704
    invoke-interface {v3}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v4

    cmpg-float v4, v4, v1

    if-gez v4, :cond_4

    .line 705
    invoke-interface {v3}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v1

    .line 707
    .end local v3    # "child":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_4
    goto :goto_2

    :cond_5
    nop

    .line 719
    :cond_6
    :goto_3
    const v2, 0x7f7fffff    # Float.MAX_VALUE

    cmpl-float v2, v1, v2

    if-nez v2, :cond_7

    .line 720
    return-void

    .line 723
    :cond_7
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getInnerAreaBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v2

    sub-float v2, v1, v2

    .line 724
    .local v2, "deltaY":F
    const/4 v3, 0x0

    cmpg-float v4, v2, v3

    if-gez v4, :cond_8

    .line 725
    return-void

    .line 727
    :cond_8
    sget-object v4, Lcom/itextpdf/layout/renderer/BlockRenderer$1;->$SwitchMap$com$itextpdf$layout$properties$VerticalAlignment:[I

    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/VerticalAlignment;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_0

    goto :goto_6

    .line 734
    :pswitch_0
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_4
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_a

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 735
    .local v5, "child":Lcom/itextpdf/layout/renderer/IRenderer;
    neg-float v6, v2

    const/high16 v7, 0x40000000    # 2.0f

    div-float/2addr v6, v7

    invoke-interface {v5, v3, v6}, Lcom/itextpdf/layout/renderer/IRenderer;->move(FF)V

    .line 736
    .end local v5    # "child":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_4

    .line 729
    :pswitch_1
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_5
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_9

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 730
    .restart local v5    # "child":Lcom/itextpdf/layout/renderer/IRenderer;
    neg-float v6, v2

    invoke-interface {v5, v3, v6}, Lcom/itextpdf/layout/renderer/IRenderer;->move(FF)V

    .line 731
    .end local v5    # "child":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_5

    .line 732
    :cond_9
    nop

    .line 739
    :cond_a
    :goto_6
    return-void

    .line 696
    .end local v1    # "lowestChildBottom":F
    .end local v2    # "deltaY":F
    :cond_b
    :goto_7
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method applyWidth(Lcom/itextpdf/kernel/geom/Rectangle;Ljava/lang/Float;Lcom/itextpdf/layout/properties/OverflowPropertyValue;)V
    .locals 4
    .param p1, "parentBBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "blockWidth"    # Ljava/lang/Float;
    .param p3, "overflowX"    # Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    .line 984
    const/16 v0, 0x37

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v0

    .line 986
    .local v0, "rotation":Ljava/lang/Float;
    if-eqz p2, :cond_1

    .line 987
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    cmpg-float v1, v1, v2

    if-ltz v1, :cond_0

    .line 988
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->isPositioned()Z

    move-result v1

    if-nez v1, :cond_0

    if-nez v0, :cond_0

    .line 990
    invoke-static {p3}, Lcom/itextpdf/layout/renderer/BlockRenderer;->isOverflowFit(Lcom/itextpdf/layout/properties/OverflowPropertyValue;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 991
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    goto :goto_0

    .line 993
    :cond_1
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->retrieveMinWidth(F)Ljava/lang/Float;

    move-result-object v1

    .line 995
    .local v1, "minWidth":Ljava/lang/Float;
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v3

    cmpl-float v2, v2, v3

    if-lez v2, :cond_2

    .line 996
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 999
    .end local v1    # "minWidth":Ljava/lang/Float;
    :cond_2
    :goto_0
    return-void
.end method

.method protected beginRotationIfApplied(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V
    .locals 4
    .param p1, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 836
    const/16 v0, 0x37

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v0

    .line 837
    .local v0, "angle":Ljava/lang/Float;
    if-eqz v0, :cond_1

    .line 838
    const/16 v1, 0x38

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->hasOwnProperty(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 839
    const-class v1, Lcom/itextpdf/layout/renderer/BlockRenderer;

    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 840
    .local v1, "logger":Lorg/slf4j/Logger;
    nop

    .line 842
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    .line 841
    const-string v3, "Rotation was not correctly processed for {0}"

    invoke-static {v3, v2}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 840
    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 843
    .end local v1    # "logger":Lorg/slf4j/Logger;
    goto :goto_0

    .line 844
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->createRotationTransformInsideOccupiedArea()Lcom/itextpdf/kernel/geom/AffineTransform;

    move-result-object v1

    .line 845
    .local v1, "transform":Lcom/itextpdf/kernel/geom/AffineTransform;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->concatMatrix(Lcom/itextpdf/kernel/geom/AffineTransform;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 848
    .end local v1    # "transform":Lcom/itextpdf/kernel/geom/AffineTransform;
    :cond_1
    :goto_0
    return-void
.end method

.method correctFixedLayout(Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 3
    .param p1, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 975
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->isFixedLayout()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 976
    const/16 v0, 0xe

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 977
    .local v0, "y":F
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v1

    sub-float v1, v0, v1

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->move(FF)V

    .line 979
    .end local v0    # "y":F
    :cond_0
    return-void
.end method

.method protected createOverflowRenderer(I)Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .locals 2
    .param p1, "layoutResult"    # I

    .line 637
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 638
    .local v0, "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 639
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    .line 640
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getOwnProperties()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->addAllProperties(Ljava/util/Map;)V

    .line 641
    return-object v0
.end method

.method protected createRotationTransformInsideOccupiedArea()Lcom/itextpdf/kernel/geom/AffineTransform;
    .locals 9

    .line 817
    const/16 v0, 0x37

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    .line 818
    .local v0, "angle":Ljava/lang/Float;
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v1

    float-to-double v1, v1

    invoke-static {v1, v2}, Lcom/itextpdf/kernel/geom/AffineTransform;->getRotateInstance(D)Lcom/itextpdf/kernel/geom/AffineTransform;

    move-result-object v1

    .line 820
    .local v1, "rotationTransform":Lcom/itextpdf/kernel/geom/AffineTransform;
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getOccupiedAreaBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    .line 821
    .local v2, "contentBox":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/BlockRenderer;->rectangleToPointsList(Lcom/itextpdf/kernel/geom/Rectangle;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {p0, v3, v1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->transformPoints(Ljava/util/List;Lcom/itextpdf/kernel/geom/AffineTransform;)Ljava/util/List;

    move-result-object v3

    .line 824
    .local v3, "rotatedContentBoxPoints":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Point;>;"
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v4

    iget-object v5, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v5

    invoke-virtual {p0, v4, v5, v3}, Lcom/itextpdf/layout/renderer/BlockRenderer;->calculateShiftToPositionBBoxOfPointsAt(FFLjava/util/List;)[F

    move-result-object v4

    .line 825
    .local v4, "shift":[F
    const/4 v5, 0x0

    aget v5, v4, v5

    float-to-double v5, v5

    const/4 v7, 0x1

    aget v7, v4, v7

    float-to-double v7, v7

    invoke-static {v5, v6, v7, v8}, Lcom/itextpdf/kernel/geom/AffineTransform;->getTranslateInstance(DD)Lcom/itextpdf/kernel/geom/AffineTransform;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/itextpdf/kernel/geom/AffineTransform;->preConcatenate(Lcom/itextpdf/kernel/geom/AffineTransform;)V

    .line 827
    return-object v1
.end method

.method createSplitAndOverflowRenderers(IILcom/itextpdf/layout/layout/LayoutResult;Ljava/util/Map;Ljava/util/List;)[Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .locals 7
    .param p1, "childPos"    # I
    .param p2, "layoutStatus"    # I
    .param p3, "childResult"    # Lcom/itextpdf/layout/layout/LayoutResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lcom/itextpdf/layout/layout/LayoutResult;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;)[",
            "Lcom/itextpdf/layout/renderer/AbstractRenderer;"
        }
    .end annotation

    .line 661
    .local p4, "waitingFloatsSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local p5, "waitingOverflowFloatRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    invoke-virtual {p0, p2}, Lcom/itextpdf/layout/renderer/BlockRenderer;->createSplitRenderer(I)Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v0

    .line 662
    .local v0, "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->childRenderers:Ljava/util/List;

    const/4 v3, 0x0

    invoke-interface {v2, v3, p1}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->childRenderers:Ljava/util/List;

    .line 663
    invoke-virtual {p3}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    invoke-virtual {p3}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 664
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->childRenderers:Ljava/util/List;

    invoke-virtual {p3}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 667
    :cond_0
    invoke-direct {p0, p4, v0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->replaceSplitRendererKidFloats(Ljava/util/Map;Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 668
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 669
    .local v3, "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-interface {v3, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    .line 670
    .end local v3    # "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_0

    .line 672
    :cond_1
    invoke-virtual {p0, p2}, Lcom/itextpdf/layout/renderer/BlockRenderer;->createOverflowRenderer(I)Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v1

    .line 673
    .local v1, "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    iget-object v3, v1, Lcom/itextpdf/layout/renderer/AbstractRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v3, p5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 674
    invoke-virtual {p3}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 675
    invoke-virtual {p3}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->addChildRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 677
    :cond_2
    iget-object v3, v1, Lcom/itextpdf/layout/renderer/AbstractRenderer;->childRenderers:Ljava/util/List;

    iget-object v4, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->childRenderers:Ljava/util/List;

    add-int/lit8 v5, p1, 0x1

    iget-object v6, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    invoke-interface {v4, v5, v6}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 679
    invoke-static {v1}, Lcom/itextpdf/layout/properties/ContinuousContainer;->clearPropertiesFromOverFlowRenderer(Lcom/itextpdf/layout/IPropertyContainer;)V

    .line 681
    invoke-virtual {p3}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v3

    if-ne v3, v2, :cond_3

    .line 683
    const/16 v2, 0x1a

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->deleteOwnProperty(I)V

    .line 686
    :cond_3
    filled-new-array {v0, v1}, [Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v2

    return-object v2
.end method

.method protected createSplitRenderer(I)Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .locals 2
    .param p1, "layoutResult"    # I

    .line 620
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 621
    .local v0, "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 622
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    .line 623
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 624
    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isLastRendererForModelElement:Z

    .line 625
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getOwnProperties()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->addAllProperties(Ljava/util/Map;)V

    .line 626
    return-object v0
.end method

.method decreaseLayoutBoxAfterChildPlacement(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/layout/layout/LayoutResult;Lcom/itextpdf/layout/renderer/IRenderer;)V
    .locals 2
    .param p1, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "result"    # Lcom/itextpdf/layout/layout/LayoutResult;
    .param p3, "childRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 971
    invoke-virtual {p2}, Lcom/itextpdf/layout/layout/LayoutResult;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v1

    sub-float/2addr v0, v1

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 972
    return-void
.end method

.method public draw(Lcom/itextpdf/layout/renderer/DrawContext;)V
    .locals 16
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;

    .line 496
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-class v2, Lcom/itextpdf/layout/renderer/BlockRenderer;

    invoke-static {v2}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v2

    .line 497
    .local v2, "logger":Lorg/slf4j/Logger;
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    if-nez v3, :cond_0

    .line 498
    const-string v3, "Drawing won\'t be performed."

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const-string v4, "Occupied area has not been initialized. {0}"

    invoke-static {v4, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 500
    return-void

    .line 503
    :cond_0
    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/DrawContext;->isTaggingEnabled()Z

    move-result v3

    .line 504
    .local v3, "isTagged":Z
    const/4 v4, 0x0

    .line 505
    .local v4, "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    const/4 v5, 0x0

    if-eqz v3, :cond_2

    .line 506
    const/16 v6, 0x6c

    invoke-virtual {v0, v6}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v6

    move-object v4, v6

    check-cast v4, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;

    .line 507
    if-nez v4, :cond_1

    .line 508
    const/4 v3, 0x0

    goto :goto_0

    .line 510
    :cond_1
    invoke-virtual {v4, v0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->useAutoTaggingPointerAndRememberItsPosition(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    move-result-object v6

    .line 511
    .local v6, "tagPointer":Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    invoke-virtual {v4, v0, v6}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->createTag(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 512
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    move-result-object v7

    .line 513
    invoke-static {v0, v6}, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier;->getListAttributes(Lcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;

    move-result-object v8

    invoke-virtual {v7, v5, v8}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->addAttributes(ILcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    move-result-object v7

    .line 514
    invoke-static {v0, v6}, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier;->getTableAttributes(Lcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;

    move-result-object v8

    invoke-virtual {v7, v5, v8}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->addAttributes(ILcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    move-result-object v7

    .line 515
    invoke-static {v0, v6}, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier;->getLayoutAttributes(Lcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;

    move-result-object v8

    invoke-virtual {v7, v5, v8}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->addAttributes(ILcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    .line 520
    .end local v6    # "tagPointer":Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    :cond_2
    :goto_0
    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/itextpdf/layout/renderer/BlockRenderer;->beginTransformationIfApplied(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 521
    invoke-virtual/range {p0 .. p1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->applyDestinationsAndAnnotation(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 523
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->isRelativePosition()Z

    move-result v6

    .line 524
    .local v6, "isRelativePosition":Z
    if-eqz v6, :cond_3

    .line 525
    invoke-virtual {v0, v5}, Lcom/itextpdf/layout/renderer/BlockRenderer;->applyRelativePositioningTranslation(Z)V

    .line 528
    :cond_3
    invoke-virtual/range {p0 .. p1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->beginElementOpacityApplying(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 529
    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/itextpdf/layout/renderer/BlockRenderer;->beginRotationIfApplied(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 531
    sget-object v7, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->HIDDEN:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    const/16 v8, 0x67

    invoke-virtual {v0, v7, v8}, Lcom/itextpdf/layout/renderer/BlockRenderer;->isOverflowProperty(Lcom/itextpdf/layout/properties/OverflowPropertyValue;I)Z

    move-result v7

    .line 532
    .local v7, "overflowXHidden":Z
    sget-object v8, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->HIDDEN:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    const/16 v9, 0x68

    invoke-virtual {v0, v8, v9}, Lcom/itextpdf/layout/renderer/BlockRenderer;->isOverflowProperty(Lcom/itextpdf/layout/properties/OverflowPropertyValue;I)Z

    move-result v8

    .line 533
    .local v8, "overflowYHidden":Z
    const/4 v9, 0x1

    if-nez v7, :cond_5

    if-eqz v8, :cond_4

    goto :goto_1

    :cond_4
    move v10, v5

    goto :goto_2

    :cond_5
    :goto_1
    move v10, v9

    .line 535
    .local v10, "processOverflow":Z
    :goto_2
    invoke-virtual/range {p0 .. p1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->drawBackground(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 536
    invoke-virtual/range {p0 .. p1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->drawBorder(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 538
    invoke-direct {v0, v1, v9}, Lcom/itextpdf/layout/renderer/BlockRenderer;->addMarkedContent(Lcom/itextpdf/layout/renderer/DrawContext;Z)V

    .line 539
    if-eqz v10, :cond_b

    .line 540
    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v11

    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 541
    iget-object v11, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v11}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v11

    .line 543
    .local v11, "pageNumber":I
    const v12, 0x49742400    # 1000000.0f

    const v13, -0x370bdc00    # -500000.0f

    if-lt v11, v9, :cond_8

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/DrawContext;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v14

    invoke-virtual {v14}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v14

    if-le v11, v14, :cond_6

    goto :goto_3

    .line 546
    :cond_6
    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/DrawContext;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v14

    invoke-virtual {v14, v11}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v14

    .line 549
    .local v14, "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    invoke-virtual {v14}, Lcom/itextpdf/kernel/pdf/PdfPage;->isFlushed()Z

    move-result v15

    if-eqz v15, :cond_7

    .line 550
    const-string v15, "area clipping"

    filled-new-array {v15}, [Ljava/lang/Object;

    move-result-object v15

    const-string v9, "Page was flushed. {0} will not be performed."

    invoke-static {v9, v15}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v2, v9}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 553
    new-instance v9, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-direct {v9, v13, v13, v12, v12}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    .local v9, "clippedArea":Lcom/itextpdf/kernel/geom/Rectangle;
    goto :goto_4

    .line 555
    .end local v9    # "clippedArea":Lcom/itextpdf/kernel/geom/Rectangle;
    :cond_7
    invoke-virtual {v14}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPageSize()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v9

    .restart local v9    # "clippedArea":Lcom/itextpdf/kernel/geom/Rectangle;
    goto :goto_4

    .line 544
    .end local v9    # "clippedArea":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v14    # "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    :cond_8
    :goto_3
    new-instance v9, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-direct {v9, v13, v13, v12, v12}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    .line 558
    .restart local v9    # "clippedArea":Lcom/itextpdf/kernel/geom/Rectangle;
    :goto_4
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getBorderAreaBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v12

    .line 559
    .local v12, "area":Lcom/itextpdf/kernel/geom/Rectangle;
    if-eqz v7, :cond_9

    .line 560
    invoke-virtual {v12}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v13

    invoke-virtual {v9, v13}, Lcom/itextpdf/kernel/geom/Rectangle;->setX(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v13

    invoke-virtual {v12}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v14

    invoke-virtual {v13, v14}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 562
    :cond_9
    if-eqz v8, :cond_a

    .line 563
    invoke-virtual {v12}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v13

    invoke-virtual {v9, v13}, Lcom/itextpdf/kernel/geom/Rectangle;->setY(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v13

    invoke-virtual {v12}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v14

    invoke-virtual {v13, v14}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 565
    :cond_a
    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v13

    invoke-virtual {v13, v9}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->rectangle(Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v13

    invoke-virtual {v13}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->clip()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v13

    invoke-virtual {v13}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->endPath()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 568
    .end local v9    # "clippedArea":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v11    # "pageNumber":I
    .end local v12    # "area":Lcom/itextpdf/kernel/geom/Rectangle;
    :cond_b
    invoke-virtual/range {p0 .. p1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->drawChildren(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 569
    invoke-direct {v0, v1, v5}, Lcom/itextpdf/layout/renderer/BlockRenderer;->addMarkedContent(Lcom/itextpdf/layout/renderer/DrawContext;Z)V

    .line 570
    invoke-virtual/range {p0 .. p1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->drawPositionedChildren(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 572
    if-eqz v10, :cond_c

    .line 573
    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 576
    :cond_c
    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/itextpdf/layout/renderer/BlockRenderer;->endRotationIfApplied(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 577
    invoke-virtual/range {p0 .. p1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->endElementOpacityApplying(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 579
    if-eqz v6, :cond_d

    .line 580
    const/4 v5, 0x1

    invoke-virtual {v0, v5}, Lcom/itextpdf/layout/renderer/BlockRenderer;->applyRelativePositioningTranslation(Z)V

    .line 583
    :cond_d
    if-eqz v3, :cond_f

    .line 584
    iget-boolean v5, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->isLastRendererForModelElement:Z

    if-eqz v5, :cond_e

    .line 585
    invoke-virtual {v4, v0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->finishTaggingHint(Lcom/itextpdf/layout/IPropertyContainer;)V

    .line 587
    :cond_e
    invoke-virtual {v4, v0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->restoreAutoTaggingPointerPosition(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 590
    :cond_f
    const/4 v5, 0x1

    iput-boolean v5, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->flushed:Z

    .line 591
    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/itextpdf/layout/renderer/BlockRenderer;->endTransformationIfApplied(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 592
    return-void
.end method

.method protected endRotationIfApplied(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V
    .locals 2
    .param p1, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 856
    const/16 v0, 0x37

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v0

    .line 857
    .local v0, "angle":Ljava/lang/Float;
    if-eqz v0, :cond_0

    const/16 v1, 0x38

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->hasOwnProperty(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 858
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 860
    :cond_0
    return-void
.end method

.method fixOccupiedAreaIfOverflowedX(Lcom/itextpdf/layout/properties/OverflowPropertyValue;Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 2
    .param p1, "overflowX"    # Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .param p2, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1054
    invoke-static {p1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->isOverflowFit(Lcom/itextpdf/layout/properties/OverflowPropertyValue;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1055
    return-void

    .line 1058
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v0

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    cmpl-float v0, v0, v1

    if-gtz v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v0

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v1

    cmpg-float v0, v0, v1

    if-gez v0, :cond_2

    .line 1059
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->setX(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1061
    :cond_2
    return-void
.end method

.method fixOccupiedAreaIfOverflowedY(Lcom/itextpdf/layout/properties/OverflowPropertyValue;Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 2
    .param p1, "overflowY"    # Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .param p2, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1064
    invoke-static {p1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->isOverflowFit(Lcom/itextpdf/layout/properties/OverflowPropertyValue;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1065
    return-void

    .line 1067
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v0

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v1

    cmpg-float v0, v0, v1

    if-gez v0, :cond_1

    .line 1068
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v0

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v1

    sub-float/2addr v0, v1

    .line 1069
    .local v0, "difference":F
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1071
    .end local v0    # "difference":F
    :cond_1
    return-void
.end method

.method public getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .locals 13

    .line 1078
    new-instance v0, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    invoke-static {p0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->calculateAdditionalWidth(Lcom/itextpdf/layout/renderer/AbstractRenderer;)F

    move-result v1

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;-><init>(F)V

    .line 1079
    .local v0, "minMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->setMinMaxWidthBasedOnFixedWidth(Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;)Z

    move-result v1

    if-nez v1, :cond_b

    .line 1080
    const/16 v1, 0x50

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->hasAbsoluteUnitValue(I)Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/renderer/BlockRenderer;->retrieveMinWidth(F)Ljava/lang/Float;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v2

    .line 1081
    .local v1, "minWidth":Ljava/lang/Float;
    :goto_0
    const/16 v4, 0x4f

    invoke-virtual {p0, v4}, Lcom/itextpdf/layout/renderer/BlockRenderer;->hasAbsoluteUnitValue(I)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/renderer/BlockRenderer;->retrieveMaxWidth(F)Ljava/lang/Float;

    move-result-object v2

    .line 1082
    .local v2, "maxWidth":Ljava/lang/Float;
    :cond_1
    if-eqz v1, :cond_2

    if-nez v2, :cond_8

    .line 1083
    :cond_2
    new-instance v4, Lcom/itextpdf/layout/renderer/MaxMaxWidthHandler;

    invoke-direct {v4, v0}, Lcom/itextpdf/layout/renderer/MaxMaxWidthHandler;-><init>(Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;)V

    .line 1084
    .local v4, "handler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    const/4 v5, 0x0

    .line 1085
    .local v5, "epsilonNum":I
    const/4 v6, 0x0

    .line 1086
    .local v6, "curEpsNum":I
    const/4 v7, 0x0

    .line 1087
    .local v7, "previousFloatingChildWidth":F
    iget-object v8, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_7

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1089
    .local v9, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-interface {v9, p0}, Lcom/itextpdf/layout/renderer/IRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1090
    instance-of v10, v9, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    if-eqz v10, :cond_3

    .line 1091
    move-object v10, v9

    check-cast v10, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v10}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v10

    .local v10, "childMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    goto :goto_2

    .line 1093
    .end local v10    # "childMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    :cond_3
    invoke-static {v9}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidthUtils;->countDefaultMinMaxWidth(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v10

    .line 1095
    .restart local v10    # "childMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    :goto_2
    invoke-virtual {v10}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMaxWidth()F

    move-result v11

    invoke-static {v9}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v12

    if-eqz v12, :cond_4

    move v12, v7

    goto :goto_3

    :cond_4
    move v12, v3

    :goto_3
    add-float/2addr v11, v12

    invoke-virtual {v4, v11}, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->updateMaxChildWidth(F)V

    .line 1096
    invoke-virtual {v10}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMinWidth()F

    move-result v11

    invoke-virtual {v4, v11}, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->updateMinChildWidth(F)V

    .line 1097
    invoke-static {v9}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v11

    if-eqz v11, :cond_5

    invoke-virtual {v10}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMaxWidth()F

    move-result v11

    add-float/2addr v11, v7

    goto :goto_4

    :cond_5
    move v11, v3

    :goto_4
    move v7, v11

    .line 1098
    invoke-static {v9}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v11

    if-eqz v11, :cond_6

    .line 1099
    add-int/lit8 v6, v6, 0x1

    goto :goto_5

    .line 1101
    :cond_6
    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 1102
    const/4 v6, 0x0

    .line 1104
    .end local v9    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v10    # "childMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    :goto_5
    goto :goto_1

    .line 1105
    :cond_7
    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 1106
    .end local v5    # "epsilonNum":I
    .local v3, "epsilonNum":I
    iget-object v5, v4, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->minMaxWidth:Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    iget-object v8, v4, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->minMaxWidth:Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    invoke-virtual {v8}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getChildrenMaxWidth()F

    move-result v8

    int-to-float v9, v3

    const v10, 0x38d1b717    # 1.0E-4f

    mul-float/2addr v9, v10

    add-float/2addr v8, v9

    invoke-virtual {v5, v8}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->setChildrenMaxWidth(F)V

    .line 1107
    iget-object v5, v4, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->minMaxWidth:Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    iget-object v8, v4, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->minMaxWidth:Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    invoke-virtual {v8}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getChildrenMinWidth()F

    move-result v8

    int-to-float v9, v3

    mul-float/2addr v9, v10

    add-float/2addr v8, v9

    invoke-virtual {v5, v8}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->setChildrenMinWidth(F)V

    .line 1109
    .end local v3    # "epsilonNum":I
    .end local v4    # "handler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .end local v6    # "curEpsNum":I
    .end local v7    # "previousFloatingChildWidth":F
    :cond_8
    if-eqz v1, :cond_9

    .line 1110
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-virtual {v0, v3}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->setChildrenMinWidth(F)V

    .line 1114
    :cond_9
    if-eqz v2, :cond_a

    .line 1115
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-virtual {v0, v3}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->setChildrenMaxWidth(F)V

    goto :goto_6

    .line 1117
    :cond_a
    invoke-virtual {v0}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getChildrenMinWidth()F

    move-result v3

    invoke-virtual {v0}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getChildrenMaxWidth()F

    move-result v4

    cmpl-float v3, v3, v4

    if-lez v3, :cond_b

    .line 1118
    invoke-virtual {v0}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getChildrenMinWidth()F

    move-result v3

    invoke-virtual {v0, v3}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->setChildrenMaxWidth(F)V

    .line 1123
    .end local v1    # "minWidth":Ljava/lang/Float;
    .end local v2    # "maxWidth":Ljava/lang/Float;
    :cond_b
    :goto_6
    const/16 v1, 0x37

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v1

    if-eqz v1, :cond_c

    .line 1124
    invoke-static {v0, p0}, Lcom/itextpdf/layout/renderer/RotationUtils;->countRotationMinMaxWidth(Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;Lcom/itextpdf/layout/renderer/AbstractRenderer;)Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v1

    return-object v1

    .line 1127
    :cond_c
    return-object v0
.end method

.method public getOccupiedAreaBBox()Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 5

    .line 596
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    .line 597
    .local v0, "bBox":Lcom/itextpdf/kernel/geom/Rectangle;
    const/16 v1, 0x37

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    .line 598
    .local v1, "rotationAngle":Ljava/lang/Float;
    if-eqz v1, :cond_2

    .line 599
    const/16 v2, 0x39

    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/BlockRenderer;->hasOwnProperty(I)Z

    move-result v3

    if-eqz v3, :cond_1

    const/16 v3, 0x38

    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/renderer/BlockRenderer;->hasOwnProperty(I)Z

    move-result v4

    if-nez v4, :cond_0

    goto :goto_0

    .line 605
    :cond_0
    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 606
    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    goto :goto_1

    .line 600
    :cond_1
    :goto_0
    const-class v2, Lcom/itextpdf/layout/renderer/BlockRenderer;

    invoke-static {v2}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v2

    .line 601
    .local v2, "logger":Lorg/slf4j/Logger;
    nop

    .line 603
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    .line 602
    const-string v4, "Rotation was not correctly processed for {0}"

    invoke-static {v4, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 601
    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 604
    .end local v2    # "logger":Lorg/slf4j/Logger;
    nop

    .line 609
    :cond_2
    :goto_1
    return-object v0
.end method

.method protected getResolvedFont(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/font/PdfFont;
    .locals 2
    .param p1, "pdfDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 872
    const/16 v0, 0x14

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    .line 873
    .local v0, "retrievedFont":Ljava/lang/Object;
    instance-of v1, v0, Lcom/itextpdf/kernel/font/PdfFont;

    if-eqz v1, :cond_0

    .line 874
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/font/PdfFont;

    return-object v1

    .line 876
    :cond_0
    const/16 v1, 0x5b

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1

    if-eqz v0, :cond_1

    .line 877
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->resolveFirstPdfFont()Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v1

    return-object v1

    .line 879
    :cond_1
    if-eqz p1, :cond_2

    .line 880
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDefaultFont()Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v1

    return-object v1

    .line 882
    :cond_2
    const/4 v1, 0x0

    return-object v1
.end method

.method handleForcedPlacement(Z)V
    .locals 2
    .param p1, "anythingPlaced"    # Z

    .line 1133
    if-eqz p1, :cond_0

    const/16 v0, 0x1a

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->hasOwnProperty(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1134
    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->deleteOwnProperty(I)V

    .line 1136
    :cond_0
    return-void
.end method

.method public layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;
    .locals 63
    .param p1, "layoutContext"    # Lcom/itextpdf/layout/layout/LayoutContext;

    .line 87
    move-object/from16 v0, p0

    const/4 v7, 0x1

    iput-boolean v7, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->isLastRendererForModelElement:Z

    .line 88
    new-instance v3, Ljava/util/LinkedHashMap;

    invoke-direct {v3}, Ljava/util/LinkedHashMap;-><init>()V

    move-object v8, v3

    .line 89
    .local v8, "waitingFloatsSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    move-object v9, v4

    .line 90
    .local v9, "waitingOverflowFloatRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    const/4 v10, 0x0

    .line 91
    .local v10, "floatOverflowedCompletely":Z
    const/4 v11, 0x0

    .line 92
    .local v11, "wasHeightClipped":Z
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->isClippedHeight()Z

    move-result v6

    .line 93
    .local v6, "wasParentsHeightClipped":Z
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v12

    .line 95
    .local v12, "pageNumber":I
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->isPositioned()Z

    move-result v19

    .line 97
    .local v19, "isPositioned":Z
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    .line 99
    .local v1, "parentBBox":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getFloatRendererAreas()Ljava/util/List;

    move-result-object v3

    .line 100
    .local v3, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    const/16 v2, 0x63

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    move-object v4, v2

    check-cast v4, Lcom/itextpdf/layout/properties/FloatPropertyValue;

    .line 101
    .local v4, "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    const/16 v2, 0x37

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v20

    .line 103
    .local v20, "rotation":Ljava/lang/Float;
    const/16 v2, 0x67

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    .line 105
    .local v5, "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    const/4 v2, 0x0

    .line 106
    .local v2, "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    sget-object v13, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v14, 0x59

    invoke-virtual {v0, v14}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v13

    .line 107
    .local v13, "marginsCollapsingEnabled":Z
    if-eqz v13, :cond_0

    .line 108
    new-instance v14, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getMarginsCollapseInfo()Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    move-result-object v15

    invoke-direct {v14, v0, v15}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;-><init>(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;)V

    move-object v2, v14

    goto :goto_0

    .line 107
    :cond_0
    move-object v14, v2

    .line 110
    .end local v2    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .local v14, "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    :goto_0
    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/BlockRenderer;->retrieveWidth(F)Ljava/lang/Float;

    move-result-object v2

    .line 111
    .local v2, "blockWidth":Ljava/lang/Float;
    if-nez v20, :cond_2

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->isFixedLayout()Z

    move-result v15

    if-eqz v15, :cond_1

    goto :goto_1

    :cond_1
    move/from16 v16, v7

    goto :goto_2

    .line 112
    :cond_2
    :goto_1
    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v15

    move/from16 v16, v7

    const v7, 0x49742400    # 1000000.0f

    sub-float v15, v7, v15

    invoke-virtual {v1, v15}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v15

    invoke-virtual {v15, v7}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 114
    :goto_2
    if-eqz v20, :cond_3

    invoke-static {v0, v4}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/properties/FloatPropertyValue;)Z

    move-result v7

    if-nez v7, :cond_3

    instance-of v7, v0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;

    if-nez v7, :cond_3

    .line 116
    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v7

    invoke-static {v7, v0}, Lcom/itextpdf/layout/renderer/RotationUtils;->retrieveRotatedLayoutWidth(FLcom/itextpdf/layout/renderer/AbstractRenderer;)Ljava/lang/Float;

    move-result-object v2

    .line 118
    :cond_3
    invoke-static {v0}, Lcom/itextpdf/layout/renderer/BlockFormattingContextUtil;->isRendererCreateBfc(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v21

    .line 119
    .local v21, "includeFloatsInOccupiedArea":Z
    invoke-static {v0, v3, v1}, Lcom/itextpdf/layout/renderer/FloatingHelper;->calculateClearHeightCorrection(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;)F

    move-result v7

    .line 121
    .local v7, "clearHeightCorrection":F
    nop

    .line 122
    invoke-static {v0}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v15

    .line 121
    invoke-static {v1, v14, v7, v15}, Lcom/itextpdf/layout/renderer/FloatingHelper;->applyClearance(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;FZ)V

    .line 123
    invoke-static {v0, v4}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/properties/FloatPropertyValue;)Z

    move-result v15

    if-eqz v15, :cond_4

    .line 124
    invoke-static/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/FloatingHelper;->adjustFloatedBlockLayoutBox(Lcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/kernel/geom/Rectangle;Ljava/lang/Float;Ljava/util/List;Lcom/itextpdf/layout/properties/FloatPropertyValue;Lcom/itextpdf/layout/properties/OverflowPropertyValue;)Ljava/lang/Float;

    move-result-object v2

    .line 126
    move-object/from16 v22, v4

    move-object v15, v5

    .end local v4    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .end local v5    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v15, "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v22, "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    move-object v3, v4

    goto :goto_3

    .line 123
    .end local v15    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .end local v22    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .restart local v4    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .restart local v5    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    :cond_4
    move-object/from16 v22, v4

    move-object v15, v5

    .line 128
    .end local v4    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .end local v5    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .restart local v15    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .restart local v22    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    :goto_3
    const/4 v4, 0x0

    cmpl-float v5, v7, v4

    move/from16 v17, v7

    .end local v7    # "clearHeightCorrection":F
    .local v17, "clearHeightCorrection":F
    const/4 v7, 0x0

    if-lez v5, :cond_6

    if-eqz v14, :cond_5

    .line 129
    invoke-static {v0}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v5

    if-eqz v5, :cond_6

    :cond_5
    move/from16 v5, v16

    goto :goto_4

    :cond_6
    move v5, v7

    :goto_4
    move/from16 v23, v5

    .line 130
    .local v23, "wasHeightDecreased":Z
    if-nez v2, :cond_7

    move v5, v4

    goto :goto_5

    .line 132
    :cond_7
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v5

    :goto_5
    if-eqz v23, :cond_8

    goto :goto_6

    :cond_8
    move/from16 v4, v17

    .line 130
    :goto_6
    invoke-static {v0, v3, v1, v5, v4}, Lcom/itextpdf/layout/renderer/FloatingHelper;->adjustBlockFormattingContextLayoutBox(Lcom/itextpdf/layout/renderer/BlockRenderer;Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;FF)F

    move-result v24

    .line 133
    .local v24, "bfcHeightCorrection":F
    instance-of v4, v0, Lcom/itextpdf/layout/renderer/CellRenderer;

    .line 134
    .local v4, "isCellRenderer":Z
    if-eqz v13, :cond_9

    .line 135
    invoke-virtual {v14, v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->startMarginsCollapse(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 138
    :cond_9
    invoke-static {v0}, Lcom/itextpdf/layout/properties/ContinuousContainer;->setupContinuousContainerIfNeeded(Lcom/itextpdf/layout/renderer/AbstractRenderer;)V

    .line 140
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getBorders()[Lcom/itextpdf/layout/borders/Border;

    move-result-object v5

    .line 141
    .local v5, "borders":[Lcom/itextpdf/layout/borders/Border;
    move/from16 v25, v10

    .end local v10    # "floatOverflowedCompletely":Z
    .local v25, "floatOverflowedCompletely":Z
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getPaddings()[Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v10

    .line 143
    .local v10, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {v0, v1, v7}, Lcom/itextpdf/layout/renderer/BlockRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 144
    invoke-virtual {v0, v1, v5, v7}, Lcom/itextpdf/layout/renderer/BlockRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/borders/Border;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 145
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->isFixedLayout()Z

    move-result v26

    if-eqz v26, :cond_a

    .line 146
    const/16 v7, 0x22

    invoke-virtual {v0, v7}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    invoke-virtual {v1, v7}, Lcom/itextpdf/kernel/geom/Rectangle;->setX(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 148
    :cond_a
    const/4 v7, 0x0

    invoke-virtual {v0, v1, v10, v7}, Lcom/itextpdf/layout/renderer/BlockRenderer;->applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/properties/UnitValue;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 149
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->retrieveMaxHeight()Ljava/lang/Float;

    move-result-object v7

    .line 150
    .local v7, "blockMaxHeight":Ljava/lang/Float;
    if-eqz v7, :cond_b

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v27

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v28

    cmpl-float v27, v27, v28

    if-lez v27, :cond_c

    :cond_b
    if-nez v6, :cond_c

    sget-object v27, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->FIT:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    move-object/from16 v62, v27

    move-object/from16 v27, v3

    move-object/from16 v3, v62

    goto :goto_7

    .line 153
    :cond_c
    move-object/from16 v27, v3

    .end local v3    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v27, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    const/16 v3, 0x68

    invoke-virtual {v0, v3}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    :goto_7
    nop

    .line 154
    .local v3, "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    invoke-virtual {v0, v1, v2, v15}, Lcom/itextpdf/layout/renderer/BlockRenderer;->applyWidth(Lcom/itextpdf/kernel/geom/Rectangle;Ljava/lang/Float;Lcom/itextpdf/layout/properties/OverflowPropertyValue;)V

    .line 155
    move-object/from16 v18, v27

    move-object/from16 v27, v2

    move-object v2, v7

    move-object/from16 v7, v18

    move/from16 v18, v6

    move-object v6, v3

    move-object v3, v14

    move-object v14, v5

    move/from16 v5, v18

    move/from16 v18, v11

    .end local v11    # "wasHeightClipped":Z
    .local v2, "blockMaxHeight":Ljava/lang/Float;
    .local v3, "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .local v5, "wasParentsHeightClipped":Z
    .local v6, "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v7, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v14, "borders":[Lcom/itextpdf/layout/borders/Border;
    .local v18, "wasHeightClipped":Z
    .local v27, "blockWidth":Ljava/lang/Float;
    invoke-virtual/range {v0 .. v6}, Lcom/itextpdf/layout/renderer/BlockRenderer;->applyMaxHeight(Lcom/itextpdf/kernel/geom/Rectangle;Ljava/lang/Float;Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;ZZLcom/itextpdf/layout/properties/OverflowPropertyValue;)Z

    move-result v11

    .line 158
    move-object/from16 v29, v6

    move-object v6, v1

    move-object v1, v3

    move-object/from16 v3, v29

    move/from16 v30, v4

    move/from16 v29, v5

    .end local v4    # "isCellRenderer":Z
    .end local v5    # "wasParentsHeightClipped":Z
    .end local v18    # "wasHeightClipped":Z
    .local v1, "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .local v3, "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v6, "parentBBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local v11    # "wasHeightClipped":Z
    .local v29, "wasParentsHeightClipped":Z
    .local v30, "isCellRenderer":Z
    if-eqz v19, :cond_d

    .line 159
    invoke-static {v6}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    .local v4, "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    goto :goto_8

    .line 161
    .end local v4    # "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    :cond_d
    new-instance v4, Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-direct {v4, v12, v6}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-virtual {v0, v4}, Lcom/itextpdf/layout/renderer/BlockRenderer;->initElementAreas(Lcom/itextpdf/layout/layout/LayoutArea;)Ljava/util/List;

    move-result-object v4

    .line 164
    .restart local v4    # "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    :goto_8
    new-instance v5, Lcom/itextpdf/layout/layout/LayoutArea;

    move-object/from16 v18, v2

    .end local v2    # "blockMaxHeight":Ljava/lang/Float;
    .local v18, "blockMaxHeight":Ljava/lang/Float;
    new-instance v2, Lcom/itextpdf/kernel/geom/Rectangle;

    move-object/from16 v31, v3

    .end local v3    # "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v31, "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v3

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v32

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v33

    move-object/from16 v34, v6

    .end local v6    # "parentBBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v34, "parentBBox":Lcom/itextpdf/kernel/geom/Rectangle;
    add-float v6, v32, v33

    move/from16 v32, v13

    .end local v13    # "marginsCollapsingEnabled":Z
    .local v32, "marginsCollapsingEnabled":Z
    invoke-virtual/range {v34 .. v34}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v13

    move-object/from16 v33, v14

    const/4 v14, 0x0

    .end local v14    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .local v33, "borders":[Lcom/itextpdf/layout/borders/Border;
    invoke-direct {v2, v3, v6, v13, v14}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    invoke-direct {v5, v12, v2}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    iput-object v5, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 165
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->shrinkOccupiedAreaForAbsolutePosition()V

    .line 167
    invoke-static {v0}, Lcom/itextpdf/layout/renderer/TargetCounterHandler;->addPageByID(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 169
    const/4 v2, 0x0

    .line 171
    .local v2, "currentAreaPos":I
    const/4 v3, 0x0

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    .line 174
    .local v3, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    new-instance v14, Ljava/util/HashSet;

    invoke-direct {v14, v7}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 177
    .local v14, "nonChildFloatingRendererAreas":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    const/4 v5, 0x0

    .line 178
    .local v5, "causeOfNothing":Lcom/itextpdf/layout/renderer/IRenderer;
    const/4 v6, 0x0

    .line 181
    .local v6, "anythingPlaced":Z
    sget-object v13, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 182
    move/from16 v28, v6

    .end local v6    # "anythingPlaced":Z
    .local v28, "anythingPlaced":Z
    const/16 v6, 0x1a

    move/from16 v35, v2

    .end local v2    # "currentAreaPos":I
    .local v35, "currentAreaPos":I
    invoke-virtual {v0, v6}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v13, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v36

    .line 183
    .local v36, "initialForcePlacementForRotationAdjustments":Z
    const/4 v2, 0x0

    move-object v13, v3

    move-object/from16 v42, v5

    .end local v3    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v5    # "causeOfNothing":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v2, "childPos":I
    .local v13, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v42, "causeOfNothing":Lcom/itextpdf/layout/renderer/IRenderer;
    :goto_9
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_37

    .line 184
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 186
    .local v3, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-interface {v3, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    .line 187
    const/16 v39, 0x0

    .line 189
    .local v39, "childMarginsInfo":Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;
    const/4 v5, 0x0

    if-eqz v25, :cond_e

    invoke-static {v3}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v41

    if-eqz v41, :cond_e

    .line 190
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v8, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    invoke-interface {v9, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 192
    move-object v5, v1

    move-object v6, v9

    move-object v3, v15

    move/from16 v57, v16

    move-object/from16 v15, v18

    move/from16 v38, v24

    move/from16 v1, v28

    move-object/from16 v61, v31

    const/16 v28, 0x0

    move/from16 v18, v11

    move/from16 v24, v12

    move-object v11, v4

    move-object v4, v0

    goto/16 :goto_21

    .line 195
    :cond_e
    invoke-interface {v9}, Ljava/util/List;->isEmpty()Z

    move-result v41

    if-nez v41, :cond_16

    const/16 v6, 0x64

    invoke-interface {v3, v6}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/layout/properties/ClearPropertyValue;

    invoke-static {v9, v6}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isClearanceApplied(Ljava/util/List;Lcom/itextpdf/layout/properties/ClearPropertyValue;)Z

    move-result v6

    if-eqz v6, :cond_16

    .line 196
    invoke-static {v3}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v6

    if-eqz v6, :cond_f

    .line 197
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v8, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    invoke-interface {v9, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 199
    const/4 v5, 0x1

    .line 200
    .end local v25    # "floatOverflowedCompletely":Z
    .local v5, "floatOverflowedCompletely":Z
    move/from16 v25, v5

    move-object v6, v9

    move-object v3, v15

    move/from16 v57, v16

    move-object/from16 v15, v18

    move/from16 v38, v24

    move-object/from16 v61, v31

    move-object v5, v1

    move/from16 v18, v11

    move/from16 v24, v12

    move/from16 v1, v28

    const/16 v28, 0x0

    move-object v11, v4

    move-object v4, v0

    goto/16 :goto_21

    .line 202
    .end local v5    # "floatOverflowedCompletely":Z
    .restart local v25    # "floatOverflowedCompletely":Z
    :cond_f
    if-eqz v32, :cond_10

    if-nez v30, :cond_10

    .line 203
    invoke-virtual {v1, v13}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->endMarginsCollapse(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 206
    :cond_10
    invoke-static {v7, v0, v14}, Lcom/itextpdf/layout/renderer/FloatingHelper;->includeChildFloatsInOccupiedArea(Ljava/util/List;Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/Set;)V

    .line 207
    invoke-virtual {v0, v15, v13}, Lcom/itextpdf/layout/renderer/BlockRenderer;->fixOccupiedAreaIfOverflowedX(Lcom/itextpdf/layout/properties/OverflowPropertyValue;Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 209
    new-instance v6, Lcom/itextpdf/layout/layout/LayoutResult;

    move-object/from16 v43, v1

    const/4 v1, 0x3

    .end local v1    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .local v43, "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    invoke-direct {v6, v1, v5, v5, v3}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 210
    .local v6, "result":Lcom/itextpdf/layout/layout/LayoutResult;
    invoke-virtual {v0, v3}, Lcom/itextpdf/layout/renderer/BlockRenderer;->isKeepTogether(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v37

    .line 211
    .local v37, "isKeepTogether":Z
    if-eqz v28, :cond_11

    if-nez v37, :cond_11

    const/4 v5, 0x2

    goto :goto_a

    :cond_11
    const/4 v5, 0x3

    :goto_a
    move/from16 v45, v5

    .line 212
    .local v45, "layoutResult":I
    move v1, v2

    move-object v5, v9

    move/from16 v2, v45

    move-object v9, v4

    move-object v4, v8

    move-object/from16 v8, v18

    move-object/from16 v18, v15

    move-object v15, v3

    move-object v3, v6

    move-object/from16 v6, v43

    .end local v43    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .end local v45    # "layoutResult":I
    .local v1, "childPos":I
    .local v2, "layoutResult":I
    .local v3, "result":Lcom/itextpdf/layout/layout/LayoutResult;
    .local v4, "waitingFloatsSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v5, "waitingOverflowFloatRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v6, "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .local v8, "blockMaxHeight":Ljava/lang/Float;
    .local v9, "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v15, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v18, "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/BlockRenderer;->createSplitAndOverflowRenderers(IILcom/itextpdf/layout/layout/LayoutResult;Ljava/util/Map;Ljava/util/List;)[Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v40

    .line 214
    move-object/from16 v43, v3

    move-object v3, v4

    move-object v4, v5

    .end local v5    # "waitingOverflowFloatRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v3, "waitingFloatsSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v4, "waitingOverflowFloatRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v40, "splitAndOverflowRenderers":[Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .local v43, "result":Lcom/itextpdf/layout/layout/LayoutResult;
    const/16 v26, 0x0

    aget-object v5, v40, v26

    .line 215
    .local v5, "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    move-object/from16 v50, v8

    .end local v8    # "blockMaxHeight":Ljava/lang/Float;
    .local v50, "blockMaxHeight":Ljava/lang/Float;
    aget-object v8, v40, v16

    .line 217
    .local v8, "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    if-eqz v37, :cond_12

    .line 218
    const/4 v5, 0x0

    .line 219
    move/from16 v26, v1

    .end local v1    # "childPos":I
    .local v26, "childPos":I
    iget-object v1, v8, Lcom/itextpdf/layout/renderer/AbstractRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 220
    new-instance v1, Ljava/util/ArrayList;

    move-object/from16 v44, v3

    .end local v3    # "waitingFloatsSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v44, "waitingFloatsSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->childRenderers:Ljava/util/List;

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v1, v8, Lcom/itextpdf/layout/renderer/AbstractRenderer;->childRenderers:Ljava/util/List;

    move-object v1, v5

    goto :goto_b

    .line 217
    .end local v26    # "childPos":I
    .end local v44    # "waitingFloatsSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v1    # "childPos":I
    .restart local v3    # "waitingFloatsSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    :cond_12
    move/from16 v26, v1

    move-object/from16 v44, v3

    .end local v1    # "childPos":I
    .end local v3    # "waitingFloatsSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v26    # "childPos":I
    .restart local v44    # "waitingFloatsSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    move-object v1, v5

    .line 223
    .end local v5    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .local v1, "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    :goto_b
    invoke-virtual {v0, v11, v1, v8}, Lcom/itextpdf/layout/renderer/BlockRenderer;->updateHeightsOnSplit(ZLcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/layout/renderer/AbstractRenderer;)V

    .line 224
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    move/from16 v5, v16

    invoke-virtual {v0, v3, v10, v5}, Lcom/itextpdf/layout/renderer/BlockRenderer;->applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/properties/UnitValue;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 225
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    move-object/from16 v48, v8

    move-object/from16 v8, v33

    .end local v33    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .local v8, "borders":[Lcom/itextpdf/layout/borders/Border;
    .local v48, "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    invoke-virtual {v0, v3, v8, v5}, Lcom/itextpdf/layout/renderer/BlockRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/borders/Border;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 226
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v0, v3, v5}, Lcom/itextpdf/layout/renderer/BlockRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 228
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v5, 0x1a

    invoke-virtual {v0, v5}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_15

    if-eqz v11, :cond_13

    move-object/from16 v54, v1

    move/from16 v45, v2

    move-object/from16 v33, v8

    move/from16 v3, v17

    move/from16 v5, v32

    move-object/from16 v8, v44

    move-object/from16 v17, v10

    move-object v10, v4

    move/from16 v4, v24

    move/from16 v24, v26

    goto/16 :goto_c

    .line 232
    :cond_13
    const/4 v3, 0x3

    if-eq v2, v3, :cond_14

    .line 233
    move-object/from16 v47, v1

    .end local v1    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .local v47, "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getFloatRendererAreas()Ljava/util/List;

    move-result-object v1

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    move/from16 v45, v2

    move-object v2, v3

    move-object/from16 v33, v8

    move/from16 v3, v17

    move/from16 v5, v32

    move-object/from16 v8, v44

    move-object/from16 v17, v10

    move-object v10, v4

    move/from16 v4, v24

    move/from16 v24, v26

    .end local v2    # "layoutResult":I
    .end local v26    # "childPos":I
    .end local v32    # "marginsCollapsingEnabled":Z
    .end local v44    # "waitingFloatsSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v3, "clearHeightCorrection":F
    .local v4, "bfcHeightCorrection":F
    .local v5, "marginsCollapsingEnabled":Z
    .local v8, "waitingFloatsSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v10, "waitingOverflowFloatRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v17, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v24, "childPos":I
    .restart local v33    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .restart local v45    # "layoutResult":I
    invoke-static/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/FloatingHelper;->adjustResultOccupiedAreaForFloatAndClear(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;FFZ)Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v46

    .line 234
    .local v46, "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    new-instance v44, Lcom/itextpdf/layout/layout/LayoutResult;

    const/16 v49, 0x0

    invoke-direct/range {v44 .. v49}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    move-object/from16 v0, v44

    move-object/from16 v54, v47

    .end local v47    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .local v54, "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    invoke-virtual/range {v43 .. v43}, Lcom/itextpdf/layout/layout/LayoutResult;->getAreaBreak()Lcom/itextpdf/layout/element/AreaBreak;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/layout/LayoutResult;->setAreaBreak(Lcom/itextpdf/layout/element/AreaBreak;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v0

    return-object v0

    .line 236
    .end local v3    # "clearHeightCorrection":F
    .end local v5    # "marginsCollapsingEnabled":Z
    .end local v33    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .end local v45    # "layoutResult":I
    .end local v46    # "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .end local v54    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .restart local v1    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .restart local v2    # "layoutResult":I
    .local v4, "waitingOverflowFloatRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v8, "borders":[Lcom/itextpdf/layout/borders/Border;
    .local v10, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v17, "clearHeightCorrection":F
    .local v24, "bfcHeightCorrection":F
    .restart local v26    # "childPos":I
    .restart local v32    # "marginsCollapsingEnabled":Z
    .restart local v44    # "waitingFloatsSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    :cond_14
    move-object/from16 v54, v1

    move/from16 v45, v2

    move-object/from16 v33, v8

    move-object/from16 v8, v44

    .end local v1    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .end local v2    # "layoutResult":I
    .end local v44    # "waitingFloatsSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v8, "waitingFloatsSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v33    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .restart local v45    # "layoutResult":I
    .restart local v54    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    invoke-interface {v7, v14}, Ljava/util/List;->retainAll(Ljava/util/Collection;)Z

    .line 237
    new-instance v44, Lcom/itextpdf/layout/layout/LayoutResult;

    const/16 v47, 0x0

    invoke-virtual/range {v43 .. v43}, Lcom/itextpdf/layout/layout/LayoutResult;->getCauseOfNothing()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v49

    const/16 v46, 0x0

    invoke-direct/range {v44 .. v49}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    move-object/from16 v0, v44

    invoke-virtual/range {v43 .. v43}, Lcom/itextpdf/layout/layout/LayoutResult;->getAreaBreak()Lcom/itextpdf/layout/element/AreaBreak;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/layout/LayoutResult;->setAreaBreak(Lcom/itextpdf/layout/element/AreaBreak;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v0

    return-object v0

    .line 228
    .end local v33    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .end local v45    # "layoutResult":I
    .end local v54    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .restart local v1    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .restart local v2    # "layoutResult":I
    .local v8, "borders":[Lcom/itextpdf/layout/borders/Border;
    .restart local v44    # "waitingFloatsSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    :cond_15
    move-object/from16 v54, v1

    move/from16 v45, v2

    move-object/from16 v33, v8

    move/from16 v3, v17

    move/from16 v5, v32

    move-object/from16 v8, v44

    move-object/from16 v17, v10

    move-object v10, v4

    move/from16 v4, v24

    move/from16 v24, v26

    .line 229
    .end local v1    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .end local v2    # "layoutResult":I
    .end local v26    # "childPos":I
    .end local v32    # "marginsCollapsingEnabled":Z
    .end local v44    # "waitingFloatsSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v3    # "clearHeightCorrection":F
    .local v4, "bfcHeightCorrection":F
    .restart local v5    # "marginsCollapsingEnabled":Z
    .local v8, "waitingFloatsSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v10, "waitingOverflowFloatRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v17, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v24, "childPos":I
    .restart local v33    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .restart local v45    # "layoutResult":I
    .restart local v54    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    :goto_c
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getFloatRendererAreas()Ljava/util/List;

    move-result-object v1

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-static/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/FloatingHelper;->adjustResultOccupiedAreaForFloatAndClear(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;FFZ)Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v53

    .line 230
    move/from16 v38, v4

    move/from16 v32, v5

    .end local v4    # "bfcHeightCorrection":F
    .end local v5    # "marginsCollapsingEnabled":Z
    .restart local v32    # "marginsCollapsingEnabled":Z
    .local v38, "bfcHeightCorrection":F
    .local v53, "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    new-instance v51, Lcom/itextpdf/layout/layout/LayoutResult;

    const/16 v55, 0x0

    const/16 v56, 0x0

    const/16 v52, 0x1

    invoke-direct/range {v51 .. v56}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    move-object/from16 v47, v54

    .end local v54    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .restart local v47    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    return-object v51

    .line 195
    .end local v6    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .end local v37    # "isKeepTogether":Z
    .end local v38    # "bfcHeightCorrection":F
    .end local v40    # "splitAndOverflowRenderers":[Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .end local v43    # "result":Lcom/itextpdf/layout/layout/LayoutResult;
    .end local v45    # "layoutResult":I
    .end local v47    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .end local v48    # "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .end local v50    # "blockMaxHeight":Ljava/lang/Float;
    .end local v53    # "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .local v1, "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .local v2, "childPos":I
    .local v3, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v4, "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v9, "waitingOverflowFloatRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v10, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v15, "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v17, "clearHeightCorrection":F
    .local v18, "blockMaxHeight":Ljava/lang/Float;
    .local v24, "bfcHeightCorrection":F
    :cond_16
    move-object v6, v1

    move-object/from16 v50, v18

    move/from16 v38, v24

    const/16 v1, 0x1a

    move/from16 v24, v2

    move-object/from16 v18, v15

    move-object v15, v3

    move/from16 v3, v17

    move-object/from16 v17, v10

    move-object v10, v9

    move-object v9, v4

    .line 242
    .end local v1    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .end local v2    # "childPos":I
    .end local v4    # "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v3, "clearHeightCorrection":F
    .restart local v6    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .local v9, "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v10, "waitingOverflowFloatRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v15, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v17, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v18, "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v24, "childPos":I
    .restart local v38    # "bfcHeightCorrection":F
    .restart local v50    # "blockMaxHeight":Ljava/lang/Float;
    if-eqz v32, :cond_17

    .line 243
    invoke-virtual {v0, v15, v13, v6}, Lcom/itextpdf/layout/renderer/BlockRenderer;->startChildMarginsHandling(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;)Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    move-result-object v39

    move-object/from16 v2, v39

    goto :goto_d

    .line 242
    :cond_17
    move-object/from16 v2, v39

    .line 245
    .end local v39    # "childMarginsInfo":Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;
    .local v2, "childMarginsInfo":Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;
    :goto_d
    nop

    .line 246
    const/4 v4, 0x0

    invoke-interface {v9, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v39

    check-cast v39, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual/range {v39 .. v39}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-virtual {v0, v13, v15, v4}, Lcom/itextpdf/layout/renderer/BlockRenderer;->recalculateLayoutBoxBeforeChildLayout(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    .line 247
    .local v4, "changedLayoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-interface {v15, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    new-instance v5, Lcom/itextpdf/layout/layout/LayoutContext;

    move/from16 v44, v3

    .end local v3    # "clearHeightCorrection":F
    .local v44, "clearHeightCorrection":F
    new-instance v3, Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-direct {v3, v12, v4}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    if-nez v11, :cond_19

    if-eqz v29, :cond_18

    goto :goto_e

    :cond_18
    move-object/from16 v45, v4

    const/4 v4, 0x0

    goto :goto_f

    :cond_19
    :goto_e
    move-object/from16 v45, v4

    const/4 v4, 0x1

    .end local v4    # "changedLayoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v45, "changedLayoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    :goto_f
    invoke-direct {v5, v3, v2, v7, v4}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;Ljava/util/List;Z)V

    invoke-interface {v1, v5}, Lcom/itextpdf/layout/renderer/IRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v1

    move-object/from16 v5, v18

    .end local v18    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v5, "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    move-object/from16 v18, v1

    .line 252
    .local v18, "result":Lcom/itextpdf/layout/layout/LayoutResult;
    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v1

    const/4 v3, 0x1

    if-eq v1, v3, :cond_2d

    .line 254
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v3, 0x57

    invoke-virtual {v0, v3}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1c

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 255
    const/16 v3, 0x56

    invoke-virtual {v0, v3}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1a

    move-object/from16 v3, v50

    goto :goto_10

    .line 257
    :cond_1a
    invoke-virtual/range {v18 .. v18}, Lcom/itextpdf/layout/layout/LayoutResult;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    if-eqz v1, :cond_1b

    invoke-virtual/range {v18 .. v18}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v1

    const/4 v3, 0x3

    if-eq v1, v3, :cond_1b

    .line 258
    invoke-virtual/range {v18 .. v18}, Lcom/itextpdf/layout/layout/LayoutResult;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    move-object/from16 v3, v50

    .end local v50    # "blockMaxHeight":Ljava/lang/Float;
    .local v3, "blockMaxHeight":Ljava/lang/Float;
    invoke-virtual {v0, v1, v3}, Lcom/itextpdf/layout/renderer/BlockRenderer;->recalculateOccupiedAreaAfterChildLayout(Lcom/itextpdf/kernel/geom/Rectangle;Ljava/lang/Float;)V

    .line 259
    invoke-virtual {v0, v5, v13}, Lcom/itextpdf/layout/renderer/BlockRenderer;->fixOccupiedAreaIfOverflowedX(Lcom/itextpdf/layout/properties/OverflowPropertyValue;Lcom/itextpdf/kernel/geom/Rectangle;)V

    move-object/from16 v37, v2

    const/16 v16, 0x1

    const/16 v26, 0x0

    goto :goto_11

    .line 257
    .end local v3    # "blockMaxHeight":Ljava/lang/Float;
    .restart local v50    # "blockMaxHeight":Ljava/lang/Float;
    :cond_1b
    move-object/from16 v3, v50

    .end local v50    # "blockMaxHeight":Ljava/lang/Float;
    .restart local v3    # "blockMaxHeight":Ljava/lang/Float;
    move-object/from16 v37, v2

    const/16 v16, 0x1

    const/16 v26, 0x0

    goto :goto_11

    .line 254
    .end local v3    # "blockMaxHeight":Ljava/lang/Float;
    .restart local v50    # "blockMaxHeight":Ljava/lang/Float;
    :cond_1c
    move-object/from16 v3, v50

    .line 256
    .end local v50    # "blockMaxHeight":Ljava/lang/Float;
    .restart local v3    # "blockMaxHeight":Ljava/lang/Float;
    :goto_10
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    move-object/from16 v37, v2

    const/4 v4, 0x2

    .end local v2    # "childMarginsInfo":Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;
    .local v37, "childMarginsInfo":Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;
    new-array v2, v4, [Lcom/itextpdf/kernel/geom/Rectangle;

    iget-object v4, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    const/16 v26, 0x0

    aput-object v4, v2, v26

    const/16 v16, 0x1

    aput-object v13, v2, v16

    invoke-static {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getCommonRectangle([Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/layout/LayoutArea;->setBBox(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 262
    :goto_11
    if-eqz v32, :cond_1d

    invoke-virtual/range {v18 .. v18}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v1

    const/4 v2, 0x3

    if-eq v1, v2, :cond_1d

    .line 263
    invoke-virtual {v6, v13}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->endChildMarginsHandling(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 266
    :cond_1d
    invoke-static {v15}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v1

    if-eqz v1, :cond_22

    .line 270
    invoke-virtual/range {v18 .. v18}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_1e

    if-nez v28, :cond_1e

    .line 272
    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 273
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->isFirstOnRootArea()Z

    move-result v1

    if-eqz v1, :cond_1e

    move/from16 v1, v16

    goto :goto_12

    :cond_1e
    move/from16 v1, v26

    .line 274
    .local v1, "immediatelyReturnNothing":Z
    :goto_12
    if-nez v1, :cond_21

    .line 275
    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual/range {v18 .. v18}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v4

    move/from16 v46, v1

    const/4 v1, 0x2

    .end local v1    # "immediatelyReturnNothing":Z
    .local v46, "immediatelyReturnNothing":Z
    if-ne v4, v1, :cond_1f

    invoke-virtual/range {v18 .. v18}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    goto :goto_13

    :cond_1f
    const/4 v1, 0x0

    :goto_13
    invoke-interface {v8, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 276
    invoke-virtual/range {v18 .. v18}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    invoke-interface {v10, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 277
    invoke-virtual/range {v18 .. v18}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_20

    move/from16 v1, v16

    goto :goto_14

    :cond_20
    move/from16 v1, v26

    :goto_14
    move/from16 v25, v1

    .line 278
    move v2, v11

    move-object v11, v9

    move v9, v2

    move-object v4, v0

    move-object/from16 v60, v3

    move-object/from16 v58, v5

    move-object/from16 v59, v6

    move-object v6, v10

    move-object/from16 v10, v17

    move-object/from16 v0, v18

    move/from16 v2, v24

    move/from16 v16, v28

    move-object/from16 v61, v31

    move/from16 v17, v44

    move/from16 v24, v12

    move/from16 v28, v26

    move-object/from16 v26, v15

    goto/16 :goto_1a

    .line 274
    .end local v46    # "immediatelyReturnNothing":Z
    .restart local v1    # "immediatelyReturnNothing":Z
    :cond_21
    move/from16 v46, v1

    const/4 v2, 0x3

    .end local v1    # "immediatelyReturnNothing":Z
    .restart local v46    # "immediatelyReturnNothing":Z
    goto :goto_15

    .line 266
    .end local v46    # "immediatelyReturnNothing":Z
    :cond_22
    const/4 v2, 0x3

    .line 282
    :goto_15
    if-eqz v32, :cond_23

    .line 283
    invoke-virtual {v6, v13}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->endMarginsCollapse(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 287
    :cond_23
    invoke-static {v7, v0, v14}, Lcom/itextpdf/layout/renderer/FloatingHelper;->includeChildFloatsInOccupiedArea(Ljava/util/List;Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/Set;)V

    .line 288
    invoke-virtual {v0, v5, v13}, Lcom/itextpdf/layout/renderer/BlockRenderer;->fixOccupiedAreaIfOverflowedX(Lcom/itextpdf/layout/properties/OverflowPropertyValue;Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 290
    invoke-virtual/range {v18 .. v18}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    if-eqz v1, :cond_24

    .line 292
    invoke-virtual/range {v18 .. v18}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    iget-object v4, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-virtual {v0, v1, v4}, Lcom/itextpdf/layout/renderer/BlockRenderer;->alignChildHorizontally(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 296
    :cond_24
    if-nez v42, :cond_25

    invoke-virtual/range {v18 .. v18}, Lcom/itextpdf/layout/layout/LayoutResult;->getCauseOfNothing()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    if-eqz v1, :cond_25

    .line 297
    invoke-virtual/range {v18 .. v18}, Lcom/itextpdf/layout/layout/LayoutResult;->getCauseOfNothing()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v42

    .line 301
    :cond_25
    add-int/lit8 v1, v35, 0x1

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v4

    if-ge v1, v4, :cond_2a

    invoke-virtual/range {v18 .. v18}, Lcom/itextpdf/layout/layout/LayoutResult;->getAreaBreak()Lcom/itextpdf/layout/element/AreaBreak;

    move-result-object v1

    if-eqz v1, :cond_27

    invoke-virtual/range {v18 .. v18}, Lcom/itextpdf/layout/layout/LayoutResult;->getAreaBreak()Lcom/itextpdf/layout/element/AreaBreak;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/element/AreaBreak;->getType()Lcom/itextpdf/layout/properties/AreaBreakType;

    move-result-object v1

    sget-object v4, Lcom/itextpdf/layout/properties/AreaBreakType;->NEXT_PAGE:Lcom/itextpdf/layout/properties/AreaBreakType;

    if-eq v1, v4, :cond_26

    goto :goto_16

    :cond_26
    move-object/from16 v50, v3

    move/from16 v2, v24

    goto/16 :goto_19

    .line 302
    :cond_27
    :goto_16
    invoke-virtual/range {v18 .. v18}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v1

    const/4 v4, 0x2

    if-ne v1, v4, :cond_28

    .line 303
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->childRenderers:Ljava/util/List;

    invoke-virtual/range {v18 .. v18}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v4

    move/from16 v2, v24

    .end local v24    # "childPos":I
    .local v2, "childPos":I
    invoke-interface {v1, v2, v4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 304
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->childRenderers:Ljava/util/List;

    add-int/lit8 v4, v2, 0x1

    move-object/from16 v50, v3

    .end local v3    # "blockMaxHeight":Ljava/lang/Float;
    .restart local v50    # "blockMaxHeight":Ljava/lang/Float;
    invoke-virtual/range {v18 .. v18}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v3

    invoke-interface {v1, v4, v3}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_18

    .line 306
    .end local v2    # "childPos":I
    .end local v50    # "blockMaxHeight":Ljava/lang/Float;
    .restart local v3    # "blockMaxHeight":Ljava/lang/Float;
    .restart local v24    # "childPos":I
    :cond_28
    move-object/from16 v50, v3

    move/from16 v2, v24

    .end local v3    # "blockMaxHeight":Ljava/lang/Float;
    .end local v24    # "childPos":I
    .restart local v2    # "childPos":I
    .restart local v50    # "blockMaxHeight":Ljava/lang/Float;
    invoke-virtual/range {v18 .. v18}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    if-eqz v1, :cond_29

    .line 307
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->childRenderers:Ljava/util/List;

    invoke-virtual/range {v18 .. v18}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_17

    .line 309
    :cond_29
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 311
    :goto_17
    add-int/lit8 v2, v2, -0x1

    .line 313
    :goto_18
    add-int/lit8 v1, v35, 0x1

    .end local v35    # "currentAreaPos":I
    .local v1, "currentAreaPos":I
    invoke-interface {v9, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v13

    .line 314
    move v4, v11

    move-object v11, v9

    move v9, v4

    move-object v4, v0

    move/from16 v35, v1

    move-object/from16 v58, v5

    move-object/from16 v59, v6

    move-object v6, v10

    move/from16 v24, v12

    move-object/from16 v10, v17

    move-object/from16 v0, v18

    move/from16 v16, v28

    move-object/from16 v61, v31

    move/from16 v17, v44

    move-object/from16 v60, v50

    move/from16 v28, v26

    move-object/from16 v26, v15

    goto/16 :goto_1a

    .line 301
    .end local v1    # "currentAreaPos":I
    .end local v2    # "childPos":I
    .end local v50    # "blockMaxHeight":Ljava/lang/Float;
    .restart local v3    # "blockMaxHeight":Ljava/lang/Float;
    .restart local v24    # "childPos":I
    .restart local v35    # "currentAreaPos":I
    :cond_2a
    move-object/from16 v50, v3

    move/from16 v2, v24

    .line 316
    .end local v3    # "blockMaxHeight":Ljava/lang/Float;
    .end local v24    # "childPos":I
    .restart local v2    # "childPos":I
    .restart local v50    # "blockMaxHeight":Ljava/lang/Float;
    :goto_19
    move-object v1, v0

    move-object/from16 v58, v5

    move-object/from16 v59, v6

    move-object v6, v7

    move-object v3, v8

    move-object v4, v10

    move v5, v11

    move/from16 v24, v12

    move-object/from16 v10, v17

    move/from16 v16, v28

    move-object/from16 v61, v31

    move/from16 v7, v32

    move/from16 v12, v35

    move/from16 v8, v44

    move-object/from16 v60, v50

    move/from16 v17, v2

    move-object v11, v9

    move/from16 v28, v26

    move-object/from16 v9, v33

    move-object/from16 v2, p1

    move-object/from16 v26, v15

    move-object/from16 v15, v42

    .end local v2    # "childPos":I
    .end local v28    # "anythingPlaced":Z
    .end local v31    # "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .end local v32    # "marginsCollapsingEnabled":Z
    .end local v33    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .end local v35    # "currentAreaPos":I
    .end local v42    # "causeOfNothing":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v44    # "clearHeightCorrection":F
    .end local v50    # "blockMaxHeight":Ljava/lang/Float;
    .local v3, "waitingFloatsSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v4, "waitingOverflowFloatRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v5, "wasHeightClipped":Z
    .local v6, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v7, "marginsCollapsingEnabled":Z
    .local v8, "clearHeightCorrection":F
    .local v9, "borders":[Lcom/itextpdf/layout/borders/Border;
    .local v10, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v11, "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v12, "currentAreaPos":I
    .local v15, "causeOfNothing":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v16, "anythingPlaced":Z
    .local v17, "childPos":I
    .local v24, "pageNumber":I
    .local v26, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v58, "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v59, "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .local v60, "blockMaxHeight":Ljava/lang/Float;
    .local v61, "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    invoke-virtual/range {v1 .. v18}, Lcom/itextpdf/layout/renderer/BlockRenderer;->processNotFullChildResult(Lcom/itextpdf/layout/layout/LayoutContext;Ljava/util/Map;Ljava/util/List;ZLjava/util/List;ZF[Lcom/itextpdf/layout/borders/Border;[Lcom/itextpdf/layout/properties/UnitValue;Ljava/util/List;ILcom/itextpdf/kernel/geom/Rectangle;Ljava/util/Set;Lcom/itextpdf/layout/renderer/IRenderer;ZILcom/itextpdf/layout/layout/LayoutResult;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v0

    .line 321
    move v9, v5

    move-object v7, v6

    move-object v6, v4

    move-object v4, v1

    move/from16 v1, v17

    move/from16 v17, v8

    move-object v8, v3

    .end local v3    # "waitingFloatsSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v4    # "waitingOverflowFloatRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v5    # "wasHeightClipped":Z
    .local v0, "layoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .local v1, "childPos":I
    .local v6, "waitingOverflowFloatRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v7, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v8, "waitingFloatsSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v9, "wasHeightClipped":Z
    .local v17, "clearHeightCorrection":F
    .restart local v32    # "marginsCollapsingEnabled":Z
    .restart local v33    # "borders":[Lcom/itextpdf/layout/borders/Border;
    if-nez v0, :cond_2b

    .line 322
    add-int/lit8 v2, v12, 0x1

    .end local v12    # "currentAreaPos":I
    .local v2, "currentAreaPos":I
    invoke-interface {v11, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v13

    .line 323
    move/from16 v35, v2

    move-object/from16 v42, v15

    move-object/from16 v0, v18

    move v2, v1

    goto :goto_1a

    .line 325
    .end local v2    # "currentAreaPos":I
    .restart local v12    # "currentAreaPos":I
    :cond_2b
    invoke-virtual {v4, v0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->stopLayoutingChildrenIfChildResultNotFull(Lcom/itextpdf/layout/layout/LayoutResult;)Z

    move-result v2

    if-eqz v2, :cond_2c

    .line 326
    return-object v0

    .line 328
    :cond_2c
    move-object/from16 v18, v0

    .line 329
    move v2, v1

    move/from16 v35, v12

    move-object/from16 v42, v15

    goto :goto_1a

    .line 252
    .end local v0    # "layoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .end local v1    # "childPos":I
    .end local v16    # "anythingPlaced":Z
    .end local v26    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v37    # "childMarginsInfo":Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;
    .end local v58    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .end local v59    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .end local v60    # "blockMaxHeight":Ljava/lang/Float;
    .end local v61    # "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v2, "childMarginsInfo":Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;
    .local v5, "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v6, "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .local v9, "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v10, "waitingOverflowFloatRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v11, "wasHeightClipped":Z
    .local v12, "pageNumber":I
    .local v15, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v17, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v24, "childPos":I
    .restart local v28    # "anythingPlaced":Z
    .restart local v31    # "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .restart local v35    # "currentAreaPos":I
    .restart local v42    # "causeOfNothing":Lcom/itextpdf/layout/renderer/IRenderer;
    .restart local v44    # "clearHeightCorrection":F
    .restart local v50    # "blockMaxHeight":Ljava/lang/Float;
    :cond_2d
    move v1, v11

    move-object v11, v9

    move v9, v1

    move-object v4, v0

    move-object/from16 v37, v2

    move-object/from16 v58, v5

    move-object/from16 v59, v6

    move-object v6, v10

    move-object/from16 v26, v15

    move-object/from16 v10, v17

    move/from16 v1, v24

    move/from16 v16, v28

    move-object/from16 v61, v31

    move/from16 v17, v44

    move-object/from16 v60, v50

    const/16 v28, 0x0

    move/from16 v24, v12

    move/from16 v12, v35

    .end local v2    # "childMarginsInfo":Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;
    .end local v5    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .end local v15    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v28    # "anythingPlaced":Z
    .end local v31    # "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .end local v35    # "currentAreaPos":I
    .end local v44    # "clearHeightCorrection":F
    .end local v50    # "blockMaxHeight":Ljava/lang/Float;
    .restart local v1    # "childPos":I
    .local v6, "waitingOverflowFloatRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v9, "wasHeightClipped":Z
    .local v10, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v11, "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v12, "currentAreaPos":I
    .restart local v16    # "anythingPlaced":Z
    .local v17, "clearHeightCorrection":F
    .local v24, "pageNumber":I
    .restart local v26    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .restart local v37    # "childMarginsInfo":Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;
    .restart local v58    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .restart local v59    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .restart local v60    # "blockMaxHeight":Ljava/lang/Float;
    .restart local v61    # "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    move v2, v1

    move-object/from16 v0, v18

    .line 332
    .end local v1    # "childPos":I
    .end local v12    # "currentAreaPos":I
    .end local v18    # "result":Lcom/itextpdf/layout/layout/LayoutResult;
    .local v0, "result":Lcom/itextpdf/layout/layout/LayoutResult;
    .local v2, "childPos":I
    .restart local v35    # "currentAreaPos":I
    :goto_1a
    if-nez v16, :cond_2f

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v1

    const/4 v3, 0x3

    if-eq v1, v3, :cond_2e

    goto :goto_1b

    :cond_2e
    move/from16 v1, v28

    goto :goto_1c

    :cond_2f
    :goto_1b
    const/4 v1, 0x1

    .line 333
    .end local v16    # "anythingPlaced":Z
    .local v1, "anythingPlaced":Z
    :goto_1c
    invoke-virtual {v4, v1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->handleForcedPlacement(Z)V

    .line 336
    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutResult;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v3

    if-eqz v3, :cond_32

    invoke-static/range {v26 .. v26}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v3

    if-eqz v3, :cond_31

    if-eqz v21, :cond_30

    goto :goto_1d

    :cond_30
    move-object/from16 v3, v58

    move-object/from16 v15, v60

    goto :goto_1e

    .line 337
    :cond_31
    :goto_1d
    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutResult;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    move-object/from16 v15, v60

    .end local v60    # "blockMaxHeight":Ljava/lang/Float;
    .local v15, "blockMaxHeight":Ljava/lang/Float;
    invoke-virtual {v4, v3, v15}, Lcom/itextpdf/layout/renderer/BlockRenderer;->recalculateOccupiedAreaAfterChildLayout(Lcom/itextpdf/kernel/geom/Rectangle;Ljava/lang/Float;)V

    .line 338
    move-object/from16 v3, v58

    .end local v58    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v3, "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    invoke-virtual {v4, v3, v13}, Lcom/itextpdf/layout/renderer/BlockRenderer;->fixOccupiedAreaIfOverflowedX(Lcom/itextpdf/layout/properties/OverflowPropertyValue;Lcom/itextpdf/kernel/geom/Rectangle;)V

    goto :goto_1e

    .line 336
    .end local v3    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .end local v15    # "blockMaxHeight":Ljava/lang/Float;
    .restart local v58    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .restart local v60    # "blockMaxHeight":Ljava/lang/Float;
    :cond_32
    move-object/from16 v3, v58

    move-object/from16 v15, v60

    .line 340
    .end local v58    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .end local v60    # "blockMaxHeight":Ljava/lang/Float;
    .restart local v3    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .restart local v15    # "blockMaxHeight":Ljava/lang/Float;
    :goto_1e
    if-eqz v32, :cond_33

    .line 341
    move-object/from16 v5, v59

    .end local v59    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .local v5, "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    invoke-virtual {v5, v13}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->endChildMarginsHandling(Lcom/itextpdf/kernel/geom/Rectangle;)V

    goto :goto_1f

    .line 340
    .end local v5    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .restart local v59    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    :cond_33
    move-object/from16 v5, v59

    .line 343
    .end local v59    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .restart local v5    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    :goto_1f
    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v12

    move/from16 v18, v9

    const/4 v9, 0x1

    .end local v9    # "wasHeightClipped":Z
    .local v18, "wasHeightClipped":Z
    if-ne v12, v9, :cond_35

    .line 344
    move-object/from16 v12, v26

    .end local v26    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v12, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-virtual {v4, v13, v0, v12}, Lcom/itextpdf/layout/renderer/BlockRenderer;->decreaseLayoutBoxAfterChildPlacement(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/layout/layout/LayoutResult;Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 345
    invoke-interface {v12}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v16

    if-eqz v16, :cond_34

    .line 347
    move/from16 v57, v9

    iget-object v9, v4, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v9}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v9

    invoke-virtual {v4, v12, v9}, Lcom/itextpdf/layout/renderer/BlockRenderer;->alignChildHorizontally(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/geom/Rectangle;)V

    goto :goto_20

    .line 345
    :cond_34
    move/from16 v57, v9

    goto :goto_20

    .line 343
    .end local v12    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .restart local v26    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_35
    move/from16 v57, v9

    move-object/from16 v12, v26

    .line 352
    .end local v26    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .restart local v12    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    :goto_20
    if-nez v42, :cond_36

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutResult;->getCauseOfNothing()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v9

    if-eqz v9, :cond_36

    .line 353
    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutResult;->getCauseOfNothing()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v9

    move-object/from16 v42, v9

    .line 183
    .end local v0    # "result":Lcom/itextpdf/layout/layout/LayoutResult;
    .end local v12    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v37    # "childMarginsInfo":Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;
    .end local v45    # "changedLayoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    :cond_36
    :goto_21
    add-int/lit8 v2, v2, 0x1

    move/from16 v28, v1

    move-object v0, v4

    move-object v1, v5

    move-object v9, v6

    move-object v4, v11

    move/from16 v11, v18

    move/from16 v12, v24

    move/from16 v24, v38

    move/from16 v16, v57

    move-object/from16 v31, v61

    const/16 v6, 0x1a

    move-object/from16 v18, v15

    move-object v15, v3

    goto/16 :goto_9

    .end local v3    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .end local v5    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .end local v6    # "waitingOverflowFloatRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v38    # "bfcHeightCorrection":F
    .end local v61    # "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v1, "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .local v4, "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v9, "waitingOverflowFloatRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v11, "wasHeightClipped":Z
    .local v12, "pageNumber":I
    .local v15, "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v18, "blockMaxHeight":Ljava/lang/Float;
    .local v24, "bfcHeightCorrection":F
    .restart local v28    # "anythingPlaced":Z
    .restart local v31    # "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    :cond_37
    move-object v5, v1

    move v1, v2

    move-object v6, v9

    move-object v3, v15

    move/from16 v57, v16

    move-object/from16 v15, v18

    move/from16 v38, v24

    move/from16 v16, v28

    move-object/from16 v61, v31

    const/16 v28, 0x0

    move/from16 v18, v11

    move/from16 v24, v12

    move/from16 v12, v35

    move-object v11, v4

    move-object v4, v0

    .line 359
    .end local v1    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .end local v2    # "childPos":I
    .end local v4    # "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .end local v9    # "waitingOverflowFloatRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v28    # "anythingPlaced":Z
    .end local v31    # "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .end local v35    # "currentAreaPos":I
    .restart local v3    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .restart local v5    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .restart local v6    # "waitingOverflowFloatRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v11, "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v12, "currentAreaPos":I
    .local v15, "blockMaxHeight":Ljava/lang/Float;
    .restart local v16    # "anythingPlaced":Z
    .local v18, "wasHeightClipped":Z
    .local v24, "pageNumber":I
    .restart local v38    # "bfcHeightCorrection":F
    .restart local v61    # "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    if-eqz v21, :cond_38

    .line 360
    invoke-static {v7, v4, v14}, Lcom/itextpdf/layout/renderer/FloatingHelper;->includeChildFloatsInOccupiedArea(Ljava/util/List;Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/Set;)V

    .line 361
    invoke-virtual {v4, v3, v13}, Lcom/itextpdf/layout/renderer/BlockRenderer;->fixOccupiedAreaIfOverflowedX(Lcom/itextpdf/layout/properties/OverflowPropertyValue;Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 363
    :cond_38
    if-eqz v18, :cond_39

    .line 364
    move-object/from16 v9, v61

    .end local v61    # "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v9, "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    invoke-virtual {v4, v9, v13}, Lcom/itextpdf/layout/renderer/BlockRenderer;->fixOccupiedAreaIfOverflowedY(Lcom/itextpdf/layout/properties/OverflowPropertyValue;Lcom/itextpdf/kernel/geom/Rectangle;)V

    goto :goto_22

    .line 363
    .end local v9    # "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .restart local v61    # "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    :cond_39
    move-object/from16 v9, v61

    .line 366
    .end local v61    # "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .restart local v9    # "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    :goto_22
    if-eqz v32, :cond_3a

    .line 367
    invoke-virtual {v5, v13}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->endMarginsCollapse(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 370
    :cond_3a
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v1, 0x56

    invoke-virtual {v4, v1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3b

    .line 371
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    const/4 v1, 0x2

    new-array v2, v1, [Lcom/itextpdf/kernel/geom/Rectangle;

    iget-object v1, v4, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    aput-object v1, v2, v28

    aput-object v13, v2, v57

    invoke-static {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getCommonRectangle([Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/layout/LayoutArea;->setBBox(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 374
    :cond_3b
    const/16 v26, 0x1

    .line 375
    .local v26, "layoutResult":I
    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3c

    if-nez v18, :cond_3c

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 376
    const/16 v1, 0x1a

    invoke-virtual {v4, v1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3c

    move/from16 v0, v57

    goto :goto_23

    :cond_3c
    move/from16 v0, v28

    :goto_23
    move/from16 v31, v0

    .line 378
    .local v31, "processOverflowedFloats":Z
    const/4 v0, 0x0

    .line 379
    .local v0, "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    if-eqz v21, :cond_3e

    if-nez v31, :cond_3d

    goto :goto_24

    :cond_3d
    move-object/from16 v35, v0

    goto :goto_25

    .line 380
    :cond_3e
    :goto_24
    invoke-virtual {v4, v9, v13}, Lcom/itextpdf/layout/renderer/BlockRenderer;->applyMinHeight(Lcom/itextpdf/layout/properties/OverflowPropertyValue;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v0

    move-object/from16 v35, v0

    .line 383
    .end local v0    # "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .local v35, "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    :goto_25
    if-eqz v35, :cond_3f

    move/from16 v0, v57

    goto :goto_26

    :cond_3f
    move/from16 v0, v28

    :goto_26
    move/from16 v43, v0

    .line 384
    .local v43, "minHeightOverflow":Z
    if-eqz v43, :cond_40

    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/BlockRenderer;->isKeepTogether()Z

    move-result v0

    if-eqz v0, :cond_40

    .line 385
    invoke-interface {v7, v14}, Ljava/util/List;->retainAll(Ljava/util/Collection;)Z

    .line 386
    new-instance v0, Lcom/itextpdf/layout/layout/LayoutResult;

    const/4 v2, 0x0

    move-object/from16 v58, v3

    .end local v3    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .restart local v58    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    const/4 v3, 0x0

    const/4 v1, 0x3

    move-object/from16 v59, v5

    .end local v5    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .restart local v59    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    move-object/from16 v5, p0

    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    move-object v1, v0

    move-object v0, v4

    return-object v1

    .line 384
    .end local v58    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .end local v59    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .restart local v3    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .restart local v5    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    :cond_40
    move-object/from16 v58, v3

    move-object v0, v4

    move-object/from16 v59, v5

    .line 390
    .end local v3    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .end local v5    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    .restart local v58    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .restart local v59    # "marginsCollapseHandler":Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;
    if-nez v35, :cond_42

    if-eqz v31, :cond_41

    goto :goto_27

    :cond_41
    move/from16 v1, v26

    goto :goto_29

    .line 391
    :cond_42
    :goto_27
    if-nez v16, :cond_44

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_43

    .line 392
    invoke-direct {v0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->isAnythingOccupied()Z

    move-result v1

    if-nez v1, :cond_44

    :cond_43
    const/4 v1, 0x3

    goto :goto_28

    :cond_44
    const/4 v1, 0x2

    :goto_28
    move/from16 v26, v1

    .line 399
    .end local v26    # "layoutResult":I
    .local v1, "layoutResult":I
    :goto_29
    if-eqz v31, :cond_48

    .line 400
    if-eqz v35, :cond_45

    const/4 v2, 0x3

    if-ne v1, v2, :cond_46

    .line 403
    :cond_45
    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->createOverflowRenderer(I)Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v35

    .line 405
    :cond_46
    invoke-virtual/range {v35 .. v35}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v6}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 406
    const/4 v4, 0x2

    if-ne v1, v4, :cond_47

    if-nez v43, :cond_47

    if-nez v21, :cond_47

    .line 407
    invoke-static/range {v35 .. v35}, Lcom/itextpdf/layout/renderer/FloatingHelper;->removeParentArtifactsOnPageSplitIfOnlyFloatsOverflow(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 410
    :cond_47
    move-object/from16 v4, v35

    goto :goto_2a

    .line 399
    :cond_48
    move-object/from16 v4, v35

    .line 410
    .end local v35    # "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .local v4, "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    :goto_2a
    move-object/from16 v2, p0

    .line 411
    .local v2, "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    invoke-interface {v8}, Ljava/util/Map;->size()I

    move-result v3

    if-lez v3, :cond_4b

    const/4 v3, 0x3

    if-eq v1, v3, :cond_4a

    .line 412
    move/from16 v41, v3

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->createSplitRenderer(I)Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v3

    .line 413
    .end local v2    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .local v3, "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    new-instance v2, Ljava/util/ArrayList;

    iget-object v5, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->childRenderers:Ljava/util/List;

    invoke-direct {v2, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v2, v3, Lcom/itextpdf/layout/renderer/AbstractRenderer;->childRenderers:Ljava/util/List;

    .line 414
    invoke-direct {v0, v8, v3}, Lcom/itextpdf/layout/renderer/BlockRenderer;->replaceSplitRendererKidFloats(Ljava/util/Map;Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 416
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v2

    .line 417
    .local v2, "usedHeight":F
    if-nez v21, :cond_49

    .line 418
    const/4 v5, 0x2

    new-array v5, v5, [Lcom/itextpdf/kernel/geom/Rectangle;

    aput-object v13, v5, v28

    move/from16 v26, v1

    .end local v1    # "layoutResult":I
    .restart local v26    # "layoutResult":I
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    aput-object v1, v5, v57

    invoke-static {v5}, Lcom/itextpdf/kernel/geom/Rectangle;->getCommonRectangle([Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    .line 419
    .local v1, "commonRectangle":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v2

    move v1, v2

    goto :goto_2b

    .line 417
    .end local v26    # "layoutResult":I
    .local v1, "layoutResult":I
    :cond_49
    move/from16 v26, v1

    .end local v1    # "layoutResult":I
    .restart local v26    # "layoutResult":I
    move v1, v2

    .line 422
    .end local v2    # "usedHeight":F
    .local v1, "usedHeight":F
    :goto_2b
    move-object/from16 v28, v6

    move-object/from16 v44, v8

    move/from16 v2, v18

    move/from16 v5, v21

    move/from16 v6, v26

    move/from16 v8, v41

    .end local v8    # "waitingFloatsSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v18    # "wasHeightClipped":Z
    .end local v21    # "includeFloatsInOccupiedArea":Z
    .end local v26    # "layoutResult":I
    .local v2, "wasHeightClipped":Z
    .local v5, "includeFloatsInOccupiedArea":Z
    .local v6, "layoutResult":I
    .local v28, "waitingOverflowFloatRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v44, "waitingFloatsSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/BlockRenderer;->updateHeightsOnSplit(FZLcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/layout/renderer/AbstractRenderer;Z)V

    move/from16 v21, v2

    move-object/from16 v41, v4

    move/from16 v18, v5

    move-object/from16 v40, v3

    .end local v2    # "wasHeightClipped":Z
    .end local v4    # "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .end local v5    # "includeFloatsInOccupiedArea":Z
    .local v18, "includeFloatsInOccupiedArea":Z
    .local v21, "wasHeightClipped":Z
    .local v41, "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    goto :goto_2d

    .line 411
    .end local v3    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .end local v28    # "waitingOverflowFloatRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v41    # "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .end local v44    # "waitingFloatsSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v1, "layoutResult":I
    .local v2, "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .restart local v4    # "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .local v6, "waitingOverflowFloatRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v8    # "waitingFloatsSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v18, "wasHeightClipped":Z
    .local v21, "includeFloatsInOccupiedArea":Z
    :cond_4a
    move/from16 v28, v21

    move/from16 v21, v18

    move/from16 v18, v28

    move-object/from16 v41, v4

    move-object/from16 v28, v6

    move-object/from16 v44, v8

    move v6, v1

    move v8, v3

    goto :goto_2c

    :cond_4b
    move/from16 v28, v21

    move/from16 v21, v18

    move/from16 v18, v28

    move-object/from16 v41, v4

    move-object/from16 v28, v6

    move-object/from16 v44, v8

    const/4 v8, 0x3

    move v6, v1

    .line 425
    .end local v1    # "layoutResult":I
    .end local v4    # "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .end local v8    # "waitingFloatsSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local v6, "layoutResult":I
    .local v18, "includeFloatsInOccupiedArea":Z
    .local v21, "wasHeightClipped":Z
    .restart local v28    # "waitingOverflowFloatRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .restart local v41    # "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .restart local v44    # "waitingFloatsSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    :goto_2c
    move-object/from16 v40, v2

    .end local v2    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .local v40, "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    :goto_2d
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->positionedRenderers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_4c

    .line 426
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->positionedRenderers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 427
    .local v2, "childPositionedRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    .line 431
    .local v3, "fullBbox":Lcom/itextpdf/kernel/geom/Rectangle;
    const/high16 v4, 0x447a0000    # 1000.0f

    .line 432
    .local v4, "layoutMinHeight":F
    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v26

    add-float v8, v4, v26

    invoke-virtual {v5, v8}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 433
    new-instance v5, Lcom/itextpdf/layout/layout/LayoutArea;

    iget-object v8, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v8}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v8

    move-object/from16 v26, v1

    iget-object v1, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-direct {v5, v8, v1}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    .line 434
    .local v5, "parentArea":Lcom/itextpdf/layout/layout/LayoutArea;
    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    move/from16 v8, v57

    invoke-virtual {v0, v1, v10, v8}, Lcom/itextpdf/layout/renderer/BlockRenderer;->applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/properties/UnitValue;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 436
    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v0, v2, v3, v1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->preparePositionedRendererAndAreaForLayout(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 437
    new-instance v1, Lcom/itextpdf/layout/layout/PositionedLayoutContext;

    new-instance v8, Lcom/itextpdf/layout/layout/LayoutArea;

    move/from16 v37, v4

    .end local v4    # "layoutMinHeight":F
    .local v37, "layoutMinHeight":F
    iget-object v4, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 438
    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v4

    invoke-direct {v8, v4, v3}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-direct {v1, v8, v5}, Lcom/itextpdf/layout/layout/PositionedLayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/layout/LayoutArea;)V

    .line 437
    invoke-interface {v2, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    .line 440
    .end local v2    # "childPositionedRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v3    # "fullBbox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v5    # "parentArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .end local v37    # "layoutMinHeight":F
    move-object/from16 v1, v26

    const/4 v8, 0x3

    const/16 v57, 0x1

    goto :goto_2e

    .line 443
    :cond_4c
    if-eqz v19, :cond_4d

    .line 444
    invoke-virtual {v0, v13}, Lcom/itextpdf/layout/renderer/BlockRenderer;->correctFixedLayout(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 446
    :cond_4d
    const/16 v1, 0x8d

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Lcom/itextpdf/layout/properties/ContinuousContainer;

    .line 448
    .local v8, "continuousContainer":Lcom/itextpdf/layout/properties/ContinuousContainer;
    if-eqz v8, :cond_4e

    if-nez v41, :cond_4e

    .line 449
    invoke-virtual {v8, v0}, Lcom/itextpdf/layout/properties/ContinuousContainer;->reApplyProperties(Lcom/itextpdf/layout/renderer/AbstractRenderer;)V

    .line 450
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getPaddings()[Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v10

    .line 451
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getBorders()[Lcom/itextpdf/layout/borders/Border;

    move-result-object v5

    move-object v1, v10

    move-object v10, v5

    .end local v33    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .local v5, "borders":[Lcom/itextpdf/layout/borders/Border;
    goto :goto_2f

    .line 454
    .end local v5    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .restart local v33    # "borders":[Lcom/itextpdf/layout/borders/Border;
    :cond_4e
    move-object v1, v10

    move-object/from16 v10, v33

    .end local v33    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .local v1, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v10, "borders":[Lcom/itextpdf/layout/borders/Border;
    :goto_2f
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v1, v3}, Lcom/itextpdf/layout/renderer/BlockRenderer;->applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/properties/UnitValue;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 455
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v0, v2, v10, v3}, Lcom/itextpdf/layout/renderer/BlockRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/borders/Border;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 456
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v0, v2, v3}, Lcom/itextpdf/layout/renderer/BlockRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 458
    invoke-virtual/range {p0 .. p1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->applyAbsolutePositionIfNeeded(Lcom/itextpdf/layout/layout/LayoutContext;)V

    .line 460
    if-eqz v20, :cond_52

    .line 461
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/BlockRenderer;->applyRotationLayout(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 462
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/BlockRenderer;->isNotFittingLayoutArea(Lcom/itextpdf/layout/layout/LayoutArea;)Z

    move-result v2

    if-eqz v2, :cond_51

    .line 463
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/BlockRenderer;->isNotFittingWidth(Lcom/itextpdf/layout/layout/LayoutArea;)Z

    move-result v2

    if-eqz v2, :cond_4f

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/BlockRenderer;->isNotFittingHeight(Lcom/itextpdf/layout/layout/LayoutArea;)Z

    move-result v2

    if-nez v2, :cond_4f

    .line 464
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-static {v2}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v2

    const-string v3, "It fits by height so it will be forced placed"

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    .line 465
    const-string v4, "Element does not fit current area. {0}"

    invoke-static {v4, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    move-object/from16 v26, v1

    goto :goto_30

    .line 467
    :cond_4f
    if-nez v36, :cond_50

    .line 468
    invoke-interface {v7, v14}, Ljava/util/List;->retainAll(Ljava/util/Collection;)Z

    .line 469
    new-instance v0, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v4, v1

    .end local v1    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v4, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    const/4 v1, 0x3

    move-object/from16 v5, p0

    move-object/from16 v26, v4

    move-object/from16 v4, p0

    .end local v4    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v26, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    move-object v1, v0

    move-object v0, v4

    return-object v1

    .line 467
    .end local v26    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v1    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    :cond_50
    move-object/from16 v26, v1

    .end local v1    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v26    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    goto :goto_30

    .line 462
    .end local v26    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v1    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    :cond_51
    move-object/from16 v26, v1

    .end local v1    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v26    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    goto :goto_30

    .line 460
    .end local v26    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v1    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    :cond_52
    move-object/from16 v26, v1

    .line 473
    .end local v1    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v26    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    :goto_30
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->applyVerticalAlignment()V

    .line 475
    invoke-static {v7, v0}, Lcom/itextpdf/layout/renderer/FloatingHelper;->removeFloatsAboveRendererBottom(Ljava/util/List;Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 477
    invoke-static/range {v41 .. v41}, Lcom/itextpdf/layout/properties/ContinuousContainer;->clearPropertiesFromOverFlowRenderer(Lcom/itextpdf/layout/IPropertyContainer;)V

    .line 479
    const/4 v2, 0x3

    if-eq v6, v2, :cond_53

    .line 480
    nop

    .line 481
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getFloatRendererAreas()Ljava/util/List;

    move-result-object v1

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    .line 480
    move/from16 v3, v17

    move/from16 v5, v32

    move/from16 v4, v38

    .end local v17    # "clearHeightCorrection":F
    .end local v32    # "marginsCollapsingEnabled":Z
    .end local v38    # "bfcHeightCorrection":F
    .local v3, "clearHeightCorrection":F
    .local v4, "bfcHeightCorrection":F
    .local v5, "marginsCollapsingEnabled":Z
    invoke-static/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/FloatingHelper;->adjustResultOccupiedAreaForFloatAndClear(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;FFZ)Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v39

    .line 483
    .local v39, "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    new-instance v37, Lcom/itextpdf/layout/layout/LayoutResult;

    move/from16 v38, v6

    .end local v6    # "layoutResult":I
    .local v38, "layoutResult":I
    invoke-direct/range {v37 .. v42}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    move-object/from16 v2, v40

    move-object/from16 v1, v41

    .end local v38    # "layoutResult":I
    .end local v40    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .end local v41    # "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .local v1, "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .local v2, "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .restart local v6    # "layoutResult":I
    return-object v37

    .line 485
    .end local v1    # "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .end local v2    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .end local v3    # "clearHeightCorrection":F
    .end local v4    # "bfcHeightCorrection":F
    .end local v5    # "marginsCollapsingEnabled":Z
    .end local v39    # "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .restart local v17    # "clearHeightCorrection":F
    .restart local v32    # "marginsCollapsingEnabled":Z
    .local v38, "bfcHeightCorrection":F
    .restart local v40    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .restart local v41    # "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    :cond_53
    move/from16 v3, v17

    move/from16 v5, v32

    move/from16 v4, v38

    move-object/from16 v2, v40

    move-object/from16 v1, v41

    .end local v17    # "clearHeightCorrection":F
    .end local v32    # "marginsCollapsingEnabled":Z
    .end local v38    # "bfcHeightCorrection":F
    .end local v40    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .end local v41    # "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .restart local v1    # "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .restart local v2    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .restart local v3    # "clearHeightCorrection":F
    .restart local v4    # "bfcHeightCorrection":F
    .restart local v5    # "marginsCollapsingEnabled":Z
    move-object/from16 v17, v2

    .end local v2    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .local v17, "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->positionedRenderers:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_54

    .line 486
    new-instance v2, Ljava/util/ArrayList;

    move/from16 v32, v3

    .end local v3    # "clearHeightCorrection":F
    .local v32, "clearHeightCorrection":F
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->positionedRenderers:Ljava/util/List;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v2, v1, Lcom/itextpdf/layout/renderer/AbstractRenderer;->positionedRenderers:Ljava/util/List;

    goto :goto_31

    .line 485
    .end local v32    # "clearHeightCorrection":F
    .restart local v3    # "clearHeightCorrection":F
    :cond_54
    move/from16 v32, v3

    .line 488
    .end local v3    # "clearHeightCorrection":F
    .restart local v32    # "clearHeightCorrection":F
    :goto_31
    invoke-interface {v7, v14}, Ljava/util/List;->retainAll(Ljava/util/Collection;)Z

    .line 490
    new-instance v37, Lcom/itextpdf/layout/layout/LayoutResult;

    const/16 v39, 0x0

    const/16 v40, 0x0

    const/16 v38, 0x3

    move-object/from16 v41, v1

    .end local v1    # "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .restart local v41    # "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    invoke-direct/range {v37 .. v42}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    return-object v37
.end method

.method processNotFullChildResult(Lcom/itextpdf/layout/layout/LayoutContext;Ljava/util/Map;Ljava/util/List;ZLjava/util/List;ZF[Lcom/itextpdf/layout/borders/Border;[Lcom/itextpdf/layout/properties/UnitValue;Ljava/util/List;ILcom/itextpdf/kernel/geom/Rectangle;Ljava/util/Set;Lcom/itextpdf/layout/renderer/IRenderer;ZILcom/itextpdf/layout/layout/LayoutResult;)Lcom/itextpdf/layout/layout/LayoutResult;
    .locals 24
    .param p1, "layoutContext"    # Lcom/itextpdf/layout/layout/LayoutContext;
    .param p4, "wasHeightClipped"    # Z
    .param p6, "marginsCollapsingEnabled"    # Z
    .param p7, "clearHeightCorrection"    # F
    .param p8, "borders"    # [Lcom/itextpdf/layout/borders/Border;
    .param p9, "paddings"    # [Lcom/itextpdf/layout/properties/UnitValue;
    .param p11, "currentAreaPos"    # I
    .param p12, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p14, "causeOfNothing"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p15, "anythingPlaced"    # Z
    .param p16, "childPos"    # I
    .param p17, "result"    # Lcom/itextpdf/layout/layout/LayoutResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/layout/LayoutContext;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;Z",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;ZF[",
            "Lcom/itextpdf/layout/borders/Border;",
            "[",
            "Lcom/itextpdf/layout/properties/UnitValue;",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;I",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            "ZI",
            "Lcom/itextpdf/layout/layout/LayoutResult;",
            ")",
            "Lcom/itextpdf/layout/layout/LayoutResult;"
        }
    .end annotation

    .line 897
    .local p2, "waitingFloatsSplitRenderers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local p3, "waitingOverflowFloatRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .local p5, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local p10, "areas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local p13, "nonChildFloatingRendererAreas":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    move/from16 v6, p4

    move/from16 v7, p6

    move/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v11, p12

    invoke-virtual/range {p17 .. p17}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v0

    const/16 v12, 0x1a

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x1

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    .line 898
    add-int/lit8 v0, p11, 0x1

    invoke-interface/range {p10 .. p10}, Ljava/util/List;->size()I

    move-result v1

    if-ne v0, v1, :cond_1

    .line 899
    const/4 v2, 0x2

    move-object/from16 v0, p0

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move/from16 v1, p16

    move-object/from16 v3, p17

    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/BlockRenderer;->createSplitAndOverflowRenderers(IILcom/itextpdf/layout/layout/LayoutResult;Ljava/util/Map;Ljava/util/List;)[Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v2

    .line 902
    move v3, v1

    .local v2, "splitAndOverflowRenderers":[Lcom/itextpdf/layout/renderer/AbstractRenderer;
    aget-object v1, v2, v13

    .line 903
    .local v1, "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    aget-object v4, v2, v15

    .line 904
    .local v4, "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    invoke-virtual {v4, v12}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->deleteOwnProperty(I)V

    .line 906
    invoke-virtual {v0, v6, v1, v4}, Lcom/itextpdf/layout/renderer/BlockRenderer;->updateHeightsOnSplit(ZLcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/layout/renderer/AbstractRenderer;)V

    .line 907
    iget-object v5, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    invoke-virtual {v0, v5, v10, v15}, Lcom/itextpdf/layout/renderer/BlockRenderer;->applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/properties/UnitValue;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 908
    iget-object v5, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    invoke-virtual {v0, v5, v9, v15}, Lcom/itextpdf/layout/renderer/BlockRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/borders/Border;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 909
    iget-object v5, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v5}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    invoke-virtual {v0, v5, v15}, Lcom/itextpdf/layout/renderer/BlockRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 911
    invoke-virtual {v0, v11}, Lcom/itextpdf/layout/renderer/BlockRenderer;->correctFixedLayout(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 913
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getFloatRendererAreas()Ljava/util/List;

    move-result-object v5

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v12

    invoke-virtual {v12}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v12

    invoke-static {v0, v5, v12, v8, v7}, Lcom/itextpdf/layout/renderer/FloatingHelper;->adjustResultOccupiedAreaForFloatAndClear(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;FZ)Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v5

    .line 914
    .local v5, "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    if-eqz v6, :cond_0

    .line 915
    new-instance v12, Lcom/itextpdf/layout/layout/LayoutResult;

    invoke-direct {v12, v15, v5, v1, v14}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    return-object v12

    .line 917
    :cond_0
    new-instance v16, Lcom/itextpdf/layout/layout/LayoutResult;

    const/16 v17, 0x2

    move-object/from16 v21, p14

    move-object/from16 v19, v1

    move-object/from16 v20, v4

    move-object/from16 v18, v5

    .end local v1    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .end local v4    # "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .end local v5    # "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .local v18, "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .local v19, "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .local v20, "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    invoke-direct/range {v16 .. v21}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    return-object v16

    .line 920
    .end local v2    # "splitAndOverflowRenderers":[Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .end local v18    # "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .end local v19    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .end local v20    # "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    :cond_1
    move-object/from16 v0, p0

    move/from16 v3, p16

    iget-object v1, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->childRenderers:Ljava/util/List;

    invoke-virtual/range {p17 .. p17}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v2

    invoke-interface {v1, v3, v2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 921
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->childRenderers:Ljava/util/List;

    add-int/lit8 v2, v3, 0x1

    invoke-virtual/range {p17 .. p17}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v4

    invoke-interface {v1, v2, v4}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 922
    return-object v14

    .line 924
    :cond_2
    move-object/from16 v0, p0

    move/from16 v3, p16

    invoke-virtual/range {p17 .. p17}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v2

    const/4 v4, 0x3

    if-ne v2, v4, :cond_9

    .line 925
    move-object/from16 v14, p14

    invoke-virtual {v0, v14}, Lcom/itextpdf/layout/renderer/BlockRenderer;->isKeepTogether(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v16

    .line 926
    .local v16, "keepTogether":Z
    if-eqz p15, :cond_3

    if-nez v16, :cond_3

    move v2, v1

    goto :goto_0

    :cond_3
    move v2, v4

    :goto_0
    move/from16 v18, v2

    .line 928
    .local v18, "layoutResult":I
    move-object/from16 v5, p3

    move v1, v3

    move/from16 v17, v13

    move-object/from16 v3, p17

    move v13, v4

    move-object/from16 v4, p2

    .end local v18    # "layoutResult":I
    .local v2, "layoutResult":I
    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/BlockRenderer;->createSplitAndOverflowRenderers(IILcom/itextpdf/layout/layout/LayoutResult;Ljava/util/Map;Ljava/util/List;)[Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v23

    .line 931
    .local v23, "splitAndOverflowRenderers":[Lcom/itextpdf/layout/renderer/AbstractRenderer;
    aget-object v1, v23, v17

    .line 932
    .restart local v1    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    aget-object v3, v23, v15

    .line 934
    .local v3, "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->isRelativePosition()Z

    move-result v4

    if-eqz v4, :cond_4

    iget-object v4, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->positionedRenderers:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_4

    .line 935
    new-instance v4, Ljava/util/ArrayList;

    iget-object v5, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->positionedRenderers:Ljava/util/List;

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v4, v3, Lcom/itextpdf/layout/renderer/AbstractRenderer;->positionedRenderers:Ljava/util/List;

    .line 938
    :cond_4
    invoke-virtual {v0, v6, v1, v3}, Lcom/itextpdf/layout/renderer/BlockRenderer;->updateHeightsOnSplit(ZLcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/layout/renderer/AbstractRenderer;)V

    .line 940
    if-eqz v16, :cond_5

    .line 941
    const/4 v1, 0x0

    .line 942
    iget-object v4, v3, Lcom/itextpdf/layout/renderer/AbstractRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->clear()V

    .line 943
    iget-object v4, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->childRenderers:Ljava/util/List;

    invoke-virtual {v3, v4}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->addAllChildRenderers(Ljava/util/List;)V

    move-object/from16 v20, v1

    goto :goto_1

    .line 940
    :cond_5
    move-object/from16 v20, v1

    .line 946
    .end local v1    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .local v20, "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    :goto_1
    invoke-virtual {v0, v11}, Lcom/itextpdf/layout/renderer/BlockRenderer;->correctFixedLayout(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 948
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v0, v1, v10, v15}, Lcom/itextpdf/layout/renderer/BlockRenderer;->applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/properties/UnitValue;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 949
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v0, v1, v9, v15}, Lcom/itextpdf/layout/renderer/BlockRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/borders/Border;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 950
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v0, v1, v15}, Lcom/itextpdf/layout/renderer/BlockRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 952
    invoke-virtual/range {p0 .. p1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->applyAbsolutePositionIfNeeded(Lcom/itextpdf/layout/layout/LayoutContext;)V

    .line 954
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v12}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    if-eqz v6, :cond_6

    move-object/from16 v4, p13

    move-object v5, v3

    move-object/from16 v1, v20

    move-object/from16 v3, p5

    goto :goto_2

    .line 958
    :cond_6
    if-eq v2, v13, :cond_7

    .line 959
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getFloatRendererAreas()Ljava/util/List;

    move-result-object v1

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-static {v0, v1, v4, v8, v7}, Lcom/itextpdf/layout/renderer/FloatingHelper;->adjustResultOccupiedAreaForFloatAndClear(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;FZ)Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v19

    .line 960
    .local v19, "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    new-instance v17, Lcom/itextpdf/layout/layout/LayoutResult;

    const/16 v22, 0x0

    move/from16 v18, v2

    move-object/from16 v21, v3

    .end local v2    # "layoutResult":I
    .end local v3    # "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .restart local v18    # "layoutResult":I
    .local v21, "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    invoke-direct/range {v17 .. v22}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    move-object/from16 v3, v17

    move-object/from16 v1, v20

    .end local v18    # "layoutResult":I
    .end local v20    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .restart local v1    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .restart local v2    # "layoutResult":I
    invoke-virtual/range {p17 .. p17}, Lcom/itextpdf/layout/layout/LayoutResult;->getAreaBreak()Lcom/itextpdf/layout/element/AreaBreak;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/layout/layout/LayoutResult;->setAreaBreak(Lcom/itextpdf/layout/element/AreaBreak;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v3

    return-object v3

    .line 962
    .end local v1    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .end local v19    # "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .end local v21    # "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .restart local v3    # "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .restart local v20    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    :cond_7
    move-object/from16 v21, v3

    move-object/from16 v1, v20

    .end local v3    # "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .end local v20    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .restart local v1    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .restart local v21    # "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    move-object/from16 v3, p5

    move-object/from16 v4, p13

    invoke-interface {v3, v4}, Ljava/util/List;->retainAll(Ljava/util/Collection;)Z

    .line 963
    new-instance v17, Lcom/itextpdf/layout/layout/LayoutResult;

    const/16 v20, 0x0

    invoke-virtual/range {p17 .. p17}, Lcom/itextpdf/layout/layout/LayoutResult;->getCauseOfNothing()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v22

    const/16 v19, 0x0

    move/from16 v18, v2

    .end local v2    # "layoutResult":I
    .restart local v18    # "layoutResult":I
    invoke-direct/range {v17 .. v22}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    move-object/from16 v12, v17

    move-object/from16 v5, v21

    .end local v18    # "layoutResult":I
    .end local v21    # "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .restart local v2    # "layoutResult":I
    .local v5, "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    invoke-virtual/range {p17 .. p17}, Lcom/itextpdf/layout/layout/LayoutResult;->getAreaBreak()Lcom/itextpdf/layout/element/AreaBreak;

    move-result-object v13

    invoke-virtual {v12, v13}, Lcom/itextpdf/layout/layout/LayoutResult;->setAreaBreak(Lcom/itextpdf/layout/element/AreaBreak;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v12

    return-object v12

    .line 954
    .end local v1    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .end local v5    # "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .restart local v3    # "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .restart local v20    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    :cond_8
    move-object/from16 v4, p13

    move-object v5, v3

    move-object/from16 v1, v20

    move-object/from16 v3, p5

    .line 955
    .end local v3    # "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .end local v20    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .restart local v1    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .restart local v5    # "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    :goto_2
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getFloatRendererAreas()Ljava/util/List;

    move-result-object v12

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v13

    invoke-virtual {v13}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v13

    invoke-static {v0, v12, v13, v8, v7}, Lcom/itextpdf/layout/renderer/FloatingHelper;->adjustResultOccupiedAreaForFloatAndClear(Lcom/itextpdf/layout/renderer/IRenderer;Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;FZ)Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v19

    .line 956
    .restart local v19    # "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    new-instance v17, Lcom/itextpdf/layout/layout/LayoutResult;

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v18, 0x1

    move-object/from16 v20, v1

    .end local v1    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .restart local v20    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    invoke-direct/range {v17 .. v22}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    return-object v17

    .line 967
    .end local v2    # "layoutResult":I
    .end local v5    # "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .end local v16    # "keepTogether":Z
    .end local v19    # "editedArea":Lcom/itextpdf/layout/layout/LayoutArea;
    .end local v20    # "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .end local v23    # "splitAndOverflowRenderers":[Lcom/itextpdf/layout/renderer/AbstractRenderer;
    :cond_9
    move-object/from16 v3, p5

    move-object/from16 v4, p13

    return-object v14
.end method

.method recalculateLayoutBoxBeforeChildLayout(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 0
    .param p1, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "childRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p3, "initialLayoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 655
    return-object p1
.end method

.method recalculateOccupiedAreaAfterChildLayout(Lcom/itextpdf/kernel/geom/Rectangle;Ljava/lang/Float;)V
    .locals 4
    .param p1, "resultBBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "blockMaxHeight"    # Ljava/lang/Float;

    .line 645
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    const/4 v1, 0x2

    new-array v1, v1, [Lcom/itextpdf/kernel/geom/Rectangle;

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/BlockRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/4 v2, 0x1

    aput-object p1, v1, v2

    invoke-static {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getCommonRectangle([Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/layout/LayoutArea;->setBBox(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 646
    return-void
.end method

.method startChildMarginsHandling(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;)Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;
    .locals 1
    .param p1, "childRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p2, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p3, "marginsCollapseHandler"    # Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;

    .line 650
    invoke-virtual {p3, p1, p2}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseHandler;->startChildMarginsHandling(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    move-result-object v0

    return-object v0
.end method

.method stopLayoutingChildrenIfChildResultNotFull(Lcom/itextpdf/layout/layout/LayoutResult;)Z
    .locals 1
    .param p1, "returnResult"    # Lcom/itextpdf/layout/layout/LayoutResult;

    .line 886
    const/4 v0, 0x1

    return v0
.end method
