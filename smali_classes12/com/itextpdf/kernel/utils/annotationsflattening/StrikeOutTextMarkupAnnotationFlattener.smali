.class public Lcom/itextpdf/kernel/utils/annotationsflattening/StrikeOutTextMarkupAnnotationFlattener;
.super Lcom/itextpdf/kernel/utils/annotationsflattening/AbstractTextMarkupAnnotationFlattener;
.source "StrikeOutTextMarkupAnnotationFlattener.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Lcom/itextpdf/kernel/utils/annotationsflattening/AbstractTextMarkupAnnotationFlattener;-><init>()V

    .line 39
    return-void
.end method


# virtual methods
.method protected draw(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;Lcom/itextpdf/kernel/pdf/PdfPage;)Z
    .locals 8
    .param p1, "annotation"    # Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .param p2, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 46
    invoke-virtual {p0, p2}, Lcom/itextpdf/kernel/utils/annotationsflattening/StrikeOutTextMarkupAnnotationFlattener;->createCanvas(Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 47
    .local v0, "under":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    invoke-static {p1}, Lcom/itextpdf/kernel/utils/annotationsflattening/StrikeOutTextMarkupAnnotationFlattener;->getQuadPointsAsFloatArray(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;)[F

    move-result-object v1

    .line 48
    .local v1, "quadPoints":[F
    const/4 v2, 0x7

    aget v3, v1, v2

    const/4 v4, 0x1

    aget v5, v1, v4

    aget v2, v1, v2

    sub-float/2addr v5, v2

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v5, v2

    add-float/2addr v3, v5

    float-to-double v2, v3

    .line 49
    .local v2, "height":D
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v5

    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/utils/annotationsflattening/StrikeOutTextMarkupAnnotationFlattener;->getColor(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;)Lcom/itextpdf/kernel/colors/Color;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setStrokeColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v5

    const/4 v6, 0x4

    aget v6, v1, v6

    float-to-double v6, v6

    invoke-virtual {v5, v6, v7, v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v5

    const/4 v6, 0x6

    aget v6, v1, v6

    float-to-double v6, v6

    .line 50
    invoke-virtual {v5, v6, v7, v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->stroke()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 51
    return v4
.end method
