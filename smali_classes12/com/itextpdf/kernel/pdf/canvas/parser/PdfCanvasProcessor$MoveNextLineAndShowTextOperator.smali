.class Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$MoveNextLineAndShowTextOperator;
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
    name = "MoveNextLineAndShowTextOperator"
.end annotation


# instance fields
.field private final showText:Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$ShowTextOperator;

.field private final textMoveNextLine:Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$TextMoveNextLineOperator;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$TextMoveNextLineOperator;Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$ShowTextOperator;)V
    .locals 0
    .param p1, "textMoveNextLine"    # Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$TextMoveNextLineOperator;
    .param p2, "showText"    # Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$ShowTextOperator;

    .line 684
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 685
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$MoveNextLineAndShowTextOperator;->textMoveNextLine:Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$TextMoveNextLineOperator;

    .line 686
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$MoveNextLineAndShowTextOperator;->showText:Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$ShowTextOperator;

    .line 687
    return-void
.end method


# virtual methods
.method public invoke(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;Lcom/itextpdf/kernel/pdf/PdfLiteral;Ljava/util/List;)V
    .locals 3
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

    .line 693
    .local p3, "operands":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$MoveNextLineAndShowTextOperator;->textMoveNextLine:Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$TextMoveNextLineOperator;

    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v2, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$TextMoveNextLineOperator;->invoke(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;Lcom/itextpdf/kernel/pdf/PdfLiteral;Ljava/util/List;)V

    .line 694
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$MoveNextLineAndShowTextOperator;->showText:Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$ShowTextOperator;

    invoke-virtual {v0, p1, v2, p3}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$ShowTextOperator;->invoke(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;Lcom/itextpdf/kernel/pdf/PdfLiteral;Ljava/util/List;)V

    .line 695
    return-void
.end method
