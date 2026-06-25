.class Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$SetColorSpaceStrokeOperator;
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
    name = "SetColorSpaceStrokeOperator"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1182
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$1;

    .line 1182
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$SetColorSpaceStrokeOperator;-><init>()V

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

    .line 1187
    .local p3, "operands":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    const/4 v0, 0x0

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v0, p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$SetColorSpaceFillOperator;->determineColorSpace(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;)Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;

    move-result-object v0

    .line 1188
    .local v0, "pdfColorSpace":Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->getGraphicsState()Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;

    move-result-object v1

    invoke-static {v0}, Lcom/itextpdf/kernel/colors/Color;->makeColor(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;)Lcom/itextpdf/kernel/colors/Color;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;->setStrokeColor(Lcom/itextpdf/kernel/colors/Color;)V

    .line 1189
    return-void
.end method
