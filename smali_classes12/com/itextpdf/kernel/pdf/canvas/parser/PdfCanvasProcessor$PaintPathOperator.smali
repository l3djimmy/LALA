.class Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$PaintPathOperator;
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
    name = "PaintPathOperator"
.end annotation


# instance fields
.field private close:Z

.field private operation:I

.field private rule:I


# direct methods
.method public constructor <init>(IIZ)V
    .locals 0
    .param p1, "operation"    # I
    .param p2, "rule"    # I
    .param p3, "close"    # Z

    .line 1600
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1601
    iput p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$PaintPathOperator;->operation:I

    .line 1602
    iput p2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$PaintPathOperator;->rule:I

    .line 1603
    iput-boolean p3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$PaintPathOperator;->close:Z

    .line 1604
    return-void
.end method


# virtual methods
.method public invoke(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;Lcom/itextpdf/kernel/pdf/PdfLiteral;Ljava/util/List;)V
    .locals 2
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

    .line 1610
    .local p3, "operands":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$PaintPathOperator;->close:Z

    if-eqz v0, :cond_0

    .line 1611
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->currentPath:Lcom/itextpdf/kernel/geom/Path;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Path;->closeSubpath()V

    .line 1614
    :cond_0
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$PaintPathOperator;->operation:I

    iget v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$PaintPathOperator;->rule:I

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->paintPath(II)V

    .line 1615
    return-void
.end method
