.class Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$TextMoveNextLineOperator;
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
    name = "TextMoveNextLineOperator"
.end annotation


# instance fields
.field private final moveStartNextLine:Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$TextMoveStartNextLineOperator;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$TextMoveStartNextLineOperator;)V
    .locals 0
    .param p1, "moveStartNextLine"    # Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$TextMoveStartNextLineOperator;

    .line 719
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 720
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$TextMoveNextLineOperator;->moveStartNextLine:Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$TextMoveStartNextLineOperator;

    .line 721
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

    .line 727
    .local p3, "operands":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 728
    .local v0, "tdoperands":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-interface {v0, v2, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 729
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->getGraphicsState()Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;->getLeading()F

    move-result v2

    neg-float v2, v2

    float-to-double v2, v2

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    const/4 v2, 0x1

    invoke-interface {v0, v2, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 730
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$TextMoveNextLineOperator;->moveStartNextLine:Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$TextMoveStartNextLineOperator;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$TextMoveStartNextLineOperator;->invoke(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;Lcom/itextpdf/kernel/pdf/PdfLiteral;Ljava/util/List;)V

    .line 731
    return-void
.end method
