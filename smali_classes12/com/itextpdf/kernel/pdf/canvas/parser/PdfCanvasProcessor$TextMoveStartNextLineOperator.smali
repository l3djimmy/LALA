.class Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$TextMoveStartNextLineOperator;
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
    name = "TextMoveStartNextLineOperator"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 782
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$1;

    .line 782
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$TextMoveStartNextLineOperator;-><init>()V

    return-void
.end method


# virtual methods
.method public invoke(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;Lcom/itextpdf/kernel/pdf/PdfLiteral;Ljava/util/List;)V
    .locals 4
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

    .line 787
    .local p3, "operands":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    const/4 v0, 0x0

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v0

    .line 788
    .local v0, "tx":F
    const/4 v1, 0x1

    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v1

    .line 790
    .local v1, "ty":F
    new-instance v2, Lcom/itextpdf/kernel/geom/Matrix;

    invoke-direct {v2, v0, v1}, Lcom/itextpdf/kernel/geom/Matrix;-><init>(FF)V

    .line 791
    .local v2, "translationMatrix":Lcom/itextpdf/kernel/geom/Matrix;
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->access$4900(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;)Lcom/itextpdf/kernel/geom/Matrix;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/geom/Matrix;->multiply(Lcom/itextpdf/kernel/geom/Matrix;)Lcom/itextpdf/kernel/geom/Matrix;

    move-result-object v3

    invoke-static {p1, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->access$5002(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;Lcom/itextpdf/kernel/geom/Matrix;)Lcom/itextpdf/kernel/geom/Matrix;

    .line 792
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->access$5000(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;)Lcom/itextpdf/kernel/geom/Matrix;

    move-result-object v3

    invoke-static {p1, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->access$4902(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;Lcom/itextpdf/kernel/geom/Matrix;)Lcom/itextpdf/kernel/geom/Matrix;

    .line 793
    return-void
.end method
