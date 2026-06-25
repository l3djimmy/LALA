.class public Lcom/itextpdf/kernel/utils/annotationsflattening/HighLightTextMarkupAnnotationFlattener;
.super Lcom/itextpdf/kernel/utils/annotationsflattening/AbstractTextMarkupAnnotationFlattener;
.source "HighLightTextMarkupAnnotationFlattener.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Lcom/itextpdf/kernel/utils/annotationsflattening/AbstractTextMarkupAnnotationFlattener;-><init>()V

    .line 39
    return-void
.end method


# virtual methods
.method protected createCanvas(Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 4
    .param p1, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 51
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->newContentStreamBefore()Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getResources()Lcom/itextpdf/kernel/pdf/PdfResources;

    move-result-object v2

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;-><init>(Lcom/itextpdf/kernel/pdf/PdfStream;Lcom/itextpdf/kernel/pdf/PdfResources;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    return-object v0
.end method

.method protected draw(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;Lcom/itextpdf/kernel/pdf/PdfPage;)Z
    .locals 9
    .param p1, "annotation"    # Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .param p2, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 59
    invoke-virtual {p0, p2}, Lcom/itextpdf/kernel/utils/annotationsflattening/HighLightTextMarkupAnnotationFlattener;->createCanvas(Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 60
    .local v0, "under":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    invoke-static {p1}, Lcom/itextpdf/kernel/utils/annotationsflattening/HighLightTextMarkupAnnotationFlattener;->getQuadPointsAsFloatArray(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;)[F

    move-result-object v1

    .line 61
    .local v1, "values":[F
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 62
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/utils/annotationsflattening/HighLightTextMarkupAnnotationFlattener;->getColor(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;)Lcom/itextpdf/kernel/colors/Color;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setColor(Lcom/itextpdf/kernel/colors/Color;Z)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    const/4 v3, 0x0

    aget v5, v1, v3

    float-to-double v5, v5

    aget v7, v1, v4

    float-to-double v7, v7

    .line 63
    invoke-virtual {v2, v5, v6, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    const/4 v5, 0x2

    aget v5, v1, v5

    float-to-double v5, v5

    const/4 v7, 0x3

    aget v7, v1, v7

    float-to-double v7, v7

    .line 64
    invoke-virtual {v2, v5, v6, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    const/4 v5, 0x6

    aget v5, v1, v5

    float-to-double v5, v5

    const/4 v7, 0x7

    aget v7, v1, v7

    float-to-double v7, v7

    .line 65
    invoke-virtual {v2, v5, v6, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    const/4 v5, 0x4

    aget v5, v1, v5

    float-to-double v5, v5

    const/4 v7, 0x5

    aget v7, v1, v7

    float-to-double v7, v7

    .line 66
    invoke-virtual {v2, v5, v6, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    aget v3, v1, v3

    float-to-double v5, v3

    aget v3, v1, v4

    float-to-double v7, v3

    .line 67
    invoke-virtual {v2, v5, v6, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 68
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->fill()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 69
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 70
    return v4
.end method
