.class Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$MoveNextLineAndShowTextWithSpacingOperator;
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
    name = "MoveNextLineAndShowTextWithSpacingOperator"
.end annotation


# instance fields
.field private final moveNextLineAndShowText:Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$MoveNextLineAndShowTextOperator;

.field private final setTextCharacterSpacing:Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$SetTextCharacterSpacingOperator;

.field private final setTextWordSpacing:Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$SetTextWordSpacingOperator;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$SetTextWordSpacingOperator;Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$SetTextCharacterSpacingOperator;Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$MoveNextLineAndShowTextOperator;)V
    .locals 0
    .param p1, "setTextWordSpacing"    # Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$SetTextWordSpacingOperator;
    .param p2, "setTextCharacterSpacing"    # Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$SetTextCharacterSpacingOperator;
    .param p3, "moveNextLineAndShowText"    # Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$MoveNextLineAndShowTextOperator;

    .line 643
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 644
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$MoveNextLineAndShowTextWithSpacingOperator;->setTextWordSpacing:Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$SetTextWordSpacingOperator;

    .line 645
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$MoveNextLineAndShowTextWithSpacingOperator;->setTextCharacterSpacing:Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$SetTextCharacterSpacingOperator;

    .line 646
    iput-object p3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$MoveNextLineAndShowTextWithSpacingOperator;->moveNextLineAndShowText:Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$MoveNextLineAndShowTextOperator;

    .line 647
    return-void
.end method


# virtual methods
.method public invoke(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;Lcom/itextpdf/kernel/pdf/PdfLiteral;Ljava/util/List;)V
    .locals 9
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

    .line 653
    .local p3, "operands":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    const/4 v0, 0x0

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    .line 654
    .local v1, "aw":Lcom/itextpdf/kernel/pdf/PdfNumber;
    const/4 v2, 0x1

    invoke-interface {p3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfNumber;

    .line 655
    .local v3, "ac":Lcom/itextpdf/kernel/pdf/PdfNumber;
    const/4 v4, 0x2

    invoke-interface {p3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfString;

    .line 657
    .local v4, "string":Lcom/itextpdf/kernel/pdf/PdfString;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 658
    .local v5, "twOperands":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    invoke-interface {v5, v0, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 659
    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$MoveNextLineAndShowTextWithSpacingOperator;->setTextWordSpacing:Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$SetTextWordSpacingOperator;

    const/4 v7, 0x0

    invoke-virtual {v6, p1, v7, v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$SetTextWordSpacingOperator;->invoke(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;Lcom/itextpdf/kernel/pdf/PdfLiteral;Ljava/util/List;)V

    .line 661
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 662
    .local v6, "tcOperands":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    invoke-interface {v6, v0, v3}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 663
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$MoveNextLineAndShowTextWithSpacingOperator;->setTextCharacterSpacing:Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$SetTextCharacterSpacingOperator;

    invoke-virtual {v8, p1, v7, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$SetTextCharacterSpacingOperator;->invoke(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;Lcom/itextpdf/kernel/pdf/PdfLiteral;Ljava/util/List;)V

    .line 665
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 666
    .local v8, "tickOperands":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    invoke-interface {v8, v0, v4}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 667
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$MoveNextLineAndShowTextWithSpacingOperator;->moveNextLineAndShowText:Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$MoveNextLineAndShowTextOperator;

    invoke-virtual {v0, p1, v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$MoveNextLineAndShowTextOperator;->invoke(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;Lcom/itextpdf/kernel/pdf/PdfLiteral;Ljava/util/List;)V

    .line 668
    return-void
.end method
