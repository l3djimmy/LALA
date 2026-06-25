.class Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$CurveOperator;
.super Ljava/lang/Object;
.source "PdfCanvasProcessor.java"

# interfaces
.implements Lcom/itextpdf/kernel/pdf/canvas/parser/IContentOperator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CurveOperator"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1501
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$1;

    .line 1501
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$CurveOperator;-><init>()V

    return-void
.end method


# virtual methods
.method public invoke(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;Lcom/itextpdf/kernel/pdf/PdfLiteral;Ljava/util/List;)V
    .locals 8
    .param p1, "processor"    # Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;
    .param p2, "operator"    # Lcom/itextpdf/kernel/pdf/PdfLiteral;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;",
            "Lcom/itextpdf/kernel/pdf/PdfLiteral;",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            ">;)V"
        }
    .end annotation

    .line 1507
    .local p3, "operands":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    const/4 v0, 0x0

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v2

    .line 1508
    .local v2, "x1":F
    const/4 v0, 0x1

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v3

    .line 1509
    .local v3, "y1":F
    const/4 v0, 0x2

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v4

    .line 1510
    .local v4, "x2":F
    const/4 v0, 0x3

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v5

    .line 1511
    .local v5, "y2":F
    const/4 v0, 0x4

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v6

    .line 1512
    .local v6, "x3":F
    const/4 v0, 0x5

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v7

    .line 1513
    .local v7, "y3":F
    iget-object v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->currentPath:Lcom/itextpdf/kernel/geom/Path;

    invoke-virtual/range {v1 .. v7}, Lcom/itextpdf/kernel/geom/Path;->curveTo(FFFFFF)V

    .line 1514
    return-void
.end method
