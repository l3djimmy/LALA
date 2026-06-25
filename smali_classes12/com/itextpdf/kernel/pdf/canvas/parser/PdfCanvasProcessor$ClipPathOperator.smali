.class Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$ClipPathOperator;
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
    name = "ClipPathOperator"
.end annotation


# instance fields
.field private rule:I


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .param p1, "rule"    # I

    .line 1625
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1626
    iput p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$ClipPathOperator;->rule:I

    .line 1627
    return-void
.end method


# virtual methods
.method public invoke(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;Lcom/itextpdf/kernel/pdf/PdfLiteral;Ljava/util/List;)V
    .locals 1
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

    .line 1633
    .local p3, "operands":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    const/4 v0, 0x1

    iput-boolean v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->isClip:Z

    .line 1634
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$ClipPathOperator;->rule:I

    iput v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->clippingRule:I

    .line 1635
    return-void
.end method
