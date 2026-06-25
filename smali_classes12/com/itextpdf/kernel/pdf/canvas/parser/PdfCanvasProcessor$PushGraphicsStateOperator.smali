.class Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$PushGraphicsStateOperator;
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
    name = "PushGraphicsStateOperator"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 933
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$1;

    .line 933
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$PushGraphicsStateOperator;-><init>()V

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

    .line 938
    .local p3, "operands":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->access$5100(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;)Ljava/util/Stack;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;

    .line 939
    .local v0, "gs":Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;
    new-instance v1, Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;)V

    .line 940
    .local v1, "copy":Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->access$5100(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;)Ljava/util/Stack;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 941
    return-void
.end method
