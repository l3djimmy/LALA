.class public Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$PopGraphicsStateOperator;
.super Ljava/lang/Object;
.source "PdfCanvasProcessor.java"

# interfaces
.implements Lcom/itextpdf/kernel/pdf/canvas/parser/IContentOperator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "PopGraphicsStateOperator"
.end annotation


# direct methods
.method protected constructor <init>()V
    .locals 0

    .line 1069
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

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

    .line 1074
    .local p3, "operands":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->access$5100(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;)Ljava/util/Stack;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 1075
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->getGraphicsState()Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;

    move-result-object v0

    .line 1076
    .local v0, "gs":Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;
    new-instance v1, Lcom/itextpdf/kernel/pdf/canvas/parser/data/ClippingPathInfo;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;->getClippingPath()Lcom/itextpdf/kernel/geom/Path;

    move-result-object v2

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;->getCtm()Lcom/itextpdf/kernel/geom/Matrix;

    move-result-object v3

    invoke-direct {v1, v0, v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/ClippingPathInfo;-><init>(Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;Lcom/itextpdf/kernel/geom/Path;Lcom/itextpdf/kernel/geom/Matrix;)V

    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;->CLIP_PATH_CHANGED:Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;

    invoke-virtual {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->eventOccurred(Lcom/itextpdf/kernel/pdf/canvas/parser/data/IEventData;Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;)V

    .line 1077
    return-void
.end method
