.class public Lcom/itextpdf/kernel/utils/annotationsflattening/UnderlineTextMarkupAnnotationFlattener;
.super Lcom/itextpdf/kernel/utils/annotationsflattening/AbstractTextMarkupAnnotationFlattener;
.source "UnderlineTextMarkupAnnotationFlattener.java"


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
    .locals 9
    .param p1, "annotation"    # Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .param p2, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 46
    invoke-virtual {p0, p2}, Lcom/itextpdf/kernel/utils/annotationsflattening/UnderlineTextMarkupAnnotationFlattener;->createCanvas(Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 47
    .local v0, "under":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    invoke-static {p1}, Lcom/itextpdf/kernel/utils/annotationsflattening/UnderlineTextMarkupAnnotationFlattener;->getQuadPointsAsFloatArray(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;)[F

    move-result-object v1

    .line 48
    .local v1, "quadPoints":[F
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 49
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/utils/annotationsflattening/UnderlineTextMarkupAnnotationFlattener;->getColor(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;)Lcom/itextpdf/kernel/colors/Color;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setStrokeColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 50
    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineWidth(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    const/4 v3, 0x4

    aget v3, v1, v3

    float-to-double v3, v3

    const/4 v5, 0x5

    aget v5, v1, v5

    float-to-double v5, v5

    const-wide/high16 v7, 0x3ff4000000000000L    # 1.25

    add-double/2addr v5, v7

    .line 51
    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    const/4 v3, 0x6

    aget v3, v1, v3

    float-to-double v3, v3

    const/4 v5, 0x7

    aget v5, v1, v5

    float-to-double v5, v5

    add-double/2addr v5, v7

    .line 52
    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 53
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->stroke()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v2

    .line 54
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 55
    const/4 v2, 0x1

    return v2
.end method
