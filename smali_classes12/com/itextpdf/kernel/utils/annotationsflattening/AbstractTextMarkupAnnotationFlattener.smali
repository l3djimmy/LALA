.class public abstract Lcom/itextpdf/kernel/utils/annotationsflattening/AbstractTextMarkupAnnotationFlattener;
.super Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;
.source "AbstractTextMarkupAnnotationFlattener.java"


# static fields
.field private static final AMOUNT_OF_QUAD_POINTS:I = 0x8


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 41
    invoke-direct {p0}, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;-><init>()V

    return-void
.end method

.method private static convertFloatToQuadPoints(Lcom/itextpdf/kernel/geom/Rectangle;)[F
    .locals 3
    .param p0, "rectangle"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 91
    const/16 v0, 0x8

    new-array v0, v0, [F

    .line 92
    .local v0, "quadPoints":[F
    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v2

    aput v2, v0, v1

    .line 93
    const/4 v1, 0x1

    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v2

    aput v2, v0, v1

    .line 94
    const/4 v1, 0x2

    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v2

    aput v2, v0, v1

    .line 95
    const/4 v1, 0x3

    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v2

    aput v2, v0, v1

    .line 96
    const/4 v1, 0x4

    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v2

    aput v2, v0, v1

    .line 97
    const/4 v1, 0x5

    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v2

    aput v2, v0, v1

    .line 98
    const/4 v1, 0x6

    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v2

    aput v2, v0, v1

    .line 99
    const/4 v1, 0x7

    invoke-virtual {p0}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v2

    aput v2, v0, v1

    .line 100
    return-object v0
.end method

.method public static getQuadPointsAsFloatArray(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;)[F
    .locals 4
    .param p0, "annotation"    # Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 55
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->QuadPoints:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 56
    .local v0, "pdfArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v0, :cond_0

    .line 57
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getRectangle()Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->toRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-static {v1}, Lcom/itextpdf/kernel/utils/annotationsflattening/AbstractTextMarkupAnnotationFlattener;->convertFloatToQuadPoints(Lcom/itextpdf/kernel/geom/Rectangle;)[F

    move-result-object v1

    return-object v1

    .line 59
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->toFloatArray()[F

    move-result-object v1

    .line 60
    .local v1, "floats":[F
    array-length v2, v1

    const/16 v3, 0x8

    if-ne v2, v3, :cond_1

    .line 61
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->toFloatArray()[F

    move-result-object v2

    return-object v2

    .line 63
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getRectangle()Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->toRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-static {v2}, Lcom/itextpdf/kernel/utils/annotationsflattening/AbstractTextMarkupAnnotationFlattener;->convertFloatToQuadPoints(Lcom/itextpdf/kernel/geom/Rectangle;)[F

    move-result-object v2

    return-object v2
.end method


# virtual methods
.method public flatten(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;Lcom/itextpdf/kernel/pdf/PdfPage;)Z
    .locals 2
    .param p1, "annotation"    # Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .param p2, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 71
    invoke-super {p0, p1, p2}, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;->flatten(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;Lcom/itextpdf/kernel/pdf/PdfPage;)Z

    move-result v0

    .line 73
    .local v0, "flattenSucceeded":Z
    if-nez v0, :cond_0

    .line 74
    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/kernel/utils/annotationsflattening/AbstractTextMarkupAnnotationFlattener;->draw(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;Lcom/itextpdf/kernel/pdf/PdfPage;)Z

    .line 75
    invoke-virtual {p2, p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->removeAnnotation(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;)Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 77
    :cond_0
    const/4 v1, 0x1

    return v1
.end method

.method protected getColor(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;)Lcom/itextpdf/kernel/colors/Color;
    .locals 1
    .param p1, "annotation"    # Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 86
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getColorObject()Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->toFloatArray()[F

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/kernel/colors/Color;->createColorWithColorSpace([F)Lcom/itextpdf/kernel/colors/Color;

    move-result-object v0

    return-object v0
.end method
