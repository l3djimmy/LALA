.class Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$TextMoveStartNextLineWithLeadingOperator;
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
    name = "TextMoveStartNextLineWithLeadingOperator"
.end annotation


# instance fields
.field private final moveStartNextLine:Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$TextMoveStartNextLineOperator;

.field private final setTextLeading:Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$SetTextLeadingOperator;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$TextMoveStartNextLineOperator;Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$SetTextLeadingOperator;)V
    .locals 0
    .param p1, "moveStartNextLine"    # Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$TextMoveStartNextLineOperator;
    .param p2, "setTextLeading"    # Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$SetTextLeadingOperator;

    .line 761
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 762
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$TextMoveStartNextLineWithLeadingOperator;->moveStartNextLine:Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$TextMoveStartNextLineOperator;

    .line 763
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$TextMoveStartNextLineWithLeadingOperator;->setTextLeading:Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$SetTextLeadingOperator;

    .line 764
    return-void
.end method


# virtual methods
.method public invoke(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;Lcom/itextpdf/kernel/pdf/PdfLiteral;Ljava/util/List;)V
    .locals 5
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

    .line 770
    .local p3, "operands":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    const/4 v0, 0x1

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v1

    .line 772
    .local v1, "ty":F
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 773
    .local v2, "tlOperands":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfNumber;

    neg-float v3, v1

    float-to-double v3, v3

    invoke-direct {v0, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    const/4 v3, 0x0

    invoke-interface {v2, v3, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 774
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$TextMoveStartNextLineWithLeadingOperator;->setTextLeading:Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$SetTextLeadingOperator;

    const/4 v3, 0x0

    invoke-virtual {v0, p1, v3, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$SetTextLeadingOperator;->invoke(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;Lcom/itextpdf/kernel/pdf/PdfLiteral;Ljava/util/List;)V

    .line 775
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$TextMoveStartNextLineWithLeadingOperator;->moveStartNextLine:Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$TextMoveStartNextLineOperator;

    invoke-virtual {v0, p1, v3, p3}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$TextMoveStartNextLineOperator;->invoke(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;Lcom/itextpdf/kernel/pdf/PdfLiteral;Ljava/util/List;)V

    .line 776
    return-void
.end method
