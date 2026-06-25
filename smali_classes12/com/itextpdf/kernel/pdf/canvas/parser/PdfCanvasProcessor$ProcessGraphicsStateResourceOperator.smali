.class Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$ProcessGraphicsStateResourceOperator;
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
    name = "ProcessGraphicsStateResourceOperator"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 899
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$1;

    .line 899
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$ProcessGraphicsStateResourceOperator;-><init>()V

    return-void
.end method


# virtual methods
.method public invoke(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;Lcom/itextpdf/kernel/pdf/PdfLiteral;Ljava/util/List;)V
    .locals 7
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

    .line 904
    .local p3, "operands":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    const/4 v0, 0x0

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfName;

    .line 905
    .local v1, "dictionaryName":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->getResources()Lcom/itextpdf/kernel/pdf/PdfResources;

    move-result-object v2

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->ExtGState:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfResources;->getResource(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    .line 906
    .local v2, "extGState":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v2, :cond_3

    .line 910
    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v3

    .line 911
    .local v3, "gsDic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-nez v3, :cond_1

    .line 912
    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsStream(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v3

    .line 913
    if-eqz v3, :cond_0

    goto :goto_0

    .line 914
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string/jumbo v4, "{0} is an unknown graphics state dictionary."

    invoke-direct {v0, v4}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v4

    .line 915
    invoke-virtual {v0, v4}, Lcom/itextpdf/kernel/exceptions/PdfException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/kernel/exceptions/PdfException;

    move-result-object v0

    throw v0

    .line 917
    :cond_1
    :goto_0
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Font:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v4

    .line 918
    .local v4, "fontParameter":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-eqz v4, :cond_2

    .line 919
    invoke-virtual {v4, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsDictionary(I)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->getFont(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    .line 920
    .local v0, "font":Lcom/itextpdf/kernel/font/PdfFont;
    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v5

    .line 922
    .local v5, "size":F
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->getGraphicsState()Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;

    move-result-object v6

    invoke-virtual {v6, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;->setFont(Lcom/itextpdf/kernel/font/PdfFont;)V

    .line 923
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->getGraphicsState()Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;

    move-result-object v6

    invoke-virtual {v6, v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;->setFontSize(F)V

    .line 925
    .end local v0    # "font":Lcom/itextpdf/kernel/font/PdfFont;
    .end local v5    # "size":F
    :cond_2
    new-instance v0, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->Font:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v5}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->clone(Ljava/util/List;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v5

    invoke-direct {v0, v5}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 926
    .local v0, "pdfExtGState":Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->getGraphicsState()Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;

    move-result-object v5

    invoke-virtual {v5, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;->updateFromExtGState(Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;)V

    .line 927
    return-void

    .line 907
    .end local v0    # "pdfExtGState":Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    .end local v3    # "gsDic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v4    # "fontParameter":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_3
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v3, "Resources do not contain ExtGState entry. Unable to process operator {0}."

    invoke-direct {v0, v3}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object v3

    .line 909
    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/exceptions/PdfException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/kernel/exceptions/PdfException;

    move-result-object v0

    throw v0
.end method
