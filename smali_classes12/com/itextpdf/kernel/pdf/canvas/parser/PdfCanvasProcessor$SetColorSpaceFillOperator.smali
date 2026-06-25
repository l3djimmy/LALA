.class Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$SetColorSpaceFillOperator;
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
    name = "SetColorSpaceFillOperator"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1155
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$1;

    .line 1155
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$SetColorSpaceFillOperator;-><init>()V

    return-void
.end method

.method static determineColorSpace(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;)Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
    .locals 3
    .param p0, "colorSpace"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p1, "processor"    # Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;

    .line 1166
    sget-object v0, Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;->DIRECT_COLOR_SPACES:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1167
    invoke-static {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;->makeColorSpace(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;

    move-result-object v0

    .local v0, "pdfColorSpace":Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
    goto :goto_0

    .line 1169
    .end local v0    # "pdfColorSpace":Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->getResources()Lcom/itextpdf/kernel/pdf/PdfResources;

    move-result-object v0

    .line 1170
    .local v0, "pdfResources":Lcom/itextpdf/kernel/pdf/PdfResources;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfResources;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->ColorSpace:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    .line 1171
    .local v1, "resourceColorSpace":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-virtual {v1, p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-static {v2}, Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;->makeColorSpace(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;

    move-result-object v2

    move-object v0, v2

    .line 1174
    .end local v1    # "resourceColorSpace":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .local v0, "pdfColorSpace":Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
    :goto_0
    return-object v0
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

    .line 1160
    .local p3, "operands":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    const/4 v0, 0x0

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v0, p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$SetColorSpaceFillOperator;->determineColorSpace(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;)Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;

    move-result-object v0

    .line 1161
    .local v0, "pdfColorSpace":Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->getGraphicsState()Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;

    move-result-object v1

    invoke-static {v0}, Lcom/itextpdf/kernel/colors/Color;->makeColor(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;)Lcom/itextpdf/kernel/colors/Color;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;->setFillColor(Lcom/itextpdf/kernel/colors/Color;)V

    .line 1162
    return-void
.end method
