.class Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$SetTextFontOperator;
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
    name = "SetTextFontOperator"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 799
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$1;

    .line 799
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$SetTextFontOperator;-><init>()V

    return-void
.end method


# virtual methods
.method public invoke(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;Lcom/itextpdf/kernel/pdf/PdfLiteral;Ljava/util/List;)V
    .locals 6
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

    .line 804
    .local p3, "operands":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    const/4 v0, 0x0

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfName;

    .line 805
    .local v0, "fontResourceName":Lcom/itextpdf/kernel/pdf/PdfName;
    const/4 v1, 0x1

    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v1

    .line 807
    .local v1, "size":F
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->getResources()Lcom/itextpdf/kernel/pdf/PdfResources;

    move-result-object v2

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Font:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfResources;->getResource(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    .line 808
    .local v2, "fontsDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-virtual {v2, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v3

    .line 809
    .local v3, "fontDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    const/4 v4, 0x0

    .line 810
    .local v4, "font":Lcom/itextpdf/kernel/font/PdfFont;
    invoke-virtual {p1, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->getFont(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v4

    .line 812
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->getGraphicsState()Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;

    move-result-object v5

    invoke-virtual {v5, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;->setFont(Lcom/itextpdf/kernel/font/PdfFont;)V

    .line 813
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->getGraphicsState()Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;

    move-result-object v5

    invoke-virtual {v5, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;->setFontSize(F)V

    .line 815
    return-void
.end method
