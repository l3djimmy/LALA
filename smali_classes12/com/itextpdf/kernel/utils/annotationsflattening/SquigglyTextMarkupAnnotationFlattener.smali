.class public Lcom/itextpdf/kernel/utils/annotationsflattening/SquigglyTextMarkupAnnotationFlattener;
.super Lcom/itextpdf/kernel/utils/annotationsflattening/AbstractTextMarkupAnnotationFlattener;
.source "SquigglyTextMarkupAnnotationFlattener.java"


# static fields
.field private static final ADVANCE:D = 1.0

.field private static final HEIGHT:D = 1.0


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Lcom/itextpdf/kernel/utils/annotationsflattening/AbstractTextMarkupAnnotationFlattener;-><init>()V

    .line 41
    return-void
.end method


# virtual methods
.method protected draw(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;Lcom/itextpdf/kernel/pdf/PdfPage;)Z
    .locals 19
    .param p1, "annotation"    # Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .param p2, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 48
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/utils/annotationsflattening/SquigglyTextMarkupAnnotationFlattener;->createCanvas(Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 49
    .local v2, "under":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    invoke-static/range {p1 .. p1}, Lcom/itextpdf/kernel/utils/annotationsflattening/SquigglyTextMarkupAnnotationFlattener;->getQuadPointsAsFloatArray(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;)[F

    move-result-object v3

    .line 51
    .local v3, "quadPoints":[F
    const/4 v4, 0x7

    aget v4, v3, v4

    float-to-double v4, v4

    const-wide/high16 v6, 0x3ff4000000000000L    # 1.25

    add-double/2addr v4, v6

    .line 52
    .local v4, "baseLineHeight":D
    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    add-double v8, v4, v6

    .line 53
    .local v8, "maxHeight":D
    sub-double v10, v4, v6

    .line 54
    .local v10, "minHeight":D
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPageSize()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v12

    invoke-virtual {v12}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v12

    float-to-double v12, v12

    .line 55
    .local v12, "maxWidth":D
    const/4 v14, 0x4

    aget v14, v3, v14

    float-to-double v14, v14

    .line 56
    .local v14, "xCoordinate":D
    const/16 v16, 0x6

    move-wide/from16 v17, v6

    aget v6, v3, v16

    float-to-double v6, v6

    .line 58
    .local v6, "endX":D
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 59
    invoke-virtual/range {p0 .. p1}, Lcom/itextpdf/kernel/utils/annotationsflattening/SquigglyTextMarkupAnnotationFlattener;->getColor(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;)Lcom/itextpdf/kernel/colors/Color;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setStrokeColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 60
    :goto_0
    cmpg-double v0, v14, v6

    if-gtz v0, :cond_1

    .line 61
    cmpl-double v0, v14, v12

    if-ltz v0, :cond_0

    .line 63
    goto :goto_1

    .line 65
    :cond_0
    invoke-virtual {v2, v14, v15, v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 66
    add-double v14, v14, v17

    .line 67
    invoke-virtual {v2, v14, v15, v8, v9}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 68
    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    add-double/2addr v14, v0

    .line 69
    invoke-virtual {v2, v14, v15, v10, v11}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 70
    add-double v14, v14, v17

    .line 71
    invoke-virtual {v2, v14, v15, v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 72
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->stroke()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    goto :goto_0

    .line 74
    :cond_1
    :goto_1
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 75
    const/4 v0, 0x1

    return v0
.end method
