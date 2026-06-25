.class public final Lcom/itextpdf/kernel/pdf/canvas/parser/PdfTextExtractor;
.super Ljava/lang/Object;
.source "PdfTextExtractor.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    return-void
.end method

.method public static getTextFromPage(Lcom/itextpdf/kernel/pdf/PdfPage;)Ljava/lang/String;
    .locals 1
    .param p0, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 75
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;-><init>()V

    invoke-static {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfTextExtractor;->getTextFromPage(Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextExtractionStrategy;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getTextFromPage(Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextExtractionStrategy;)Ljava/lang/String;
    .locals 1
    .param p0, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;
    .param p1, "strategy"    # Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextExtractionStrategy;

    .line 63
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfTextExtractor;->getTextFromPage(Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextExtractionStrategy;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getTextFromPage(Lcom/itextpdf/kernel/pdf/PdfPage;Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextExtractionStrategy;Ljava/util/Map;)Ljava/lang/String;
    .locals 2
    .param p0, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;
    .param p1, "strategy"    # Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextExtractionStrategy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfPage;",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextExtractionStrategy;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/IContentOperator;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 49
    .local p2, "additionalContentOperators":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/itextpdf/kernel/pdf/canvas/parser/IContentOperator;>;"
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;

    invoke-direct {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;Ljava/util/Map;)V

    .line 50
    .local v0, "parser":Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;
    invoke-virtual {v0, p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->processPageContent(Lcom/itextpdf/kernel/pdf/PdfPage;)V

    .line 51
    invoke-interface {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextExtractionStrategy;->getResultantText()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
