.class public Lcom/itextpdf/kernel/pdf/canvas/parser/PdfDocumentContentParser;
.super Ljava/lang/Object;
.source "PdfDocumentContentParser.java"


# instance fields
.field private final pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 0
    .param p1, "pdfDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfDocumentContentParser;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 41
    return-void
.end method


# virtual methods
.method public processContent(ILcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;)Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;
    .locals 1
    .param p1, "pageNumber"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E::",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;",
            ">(ITE;)TE;"
        }
    .end annotation

    .line 69
    .local p2, "renderListener":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;, "TE;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfDocumentContentParser;->processContent(ILcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;Ljava/util/Map;)Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;

    move-result-object v0

    return-object v0
.end method

.method public processContent(ILcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;Ljava/util/Map;)Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;
    .locals 2
    .param p1, "pageNumber"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E::",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;",
            ">(ITE;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/IContentOperator;",
            ">;)TE;"
        }
    .end annotation

    .line 55
    .local p2, "renderListener":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;, "TE;"
    .local p3, "additionalContentOperators":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/itextpdf/kernel/pdf/canvas/parser/IContentOperator;>;"
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;

    invoke-direct {v0, p2, p3}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;Ljava/util/Map;)V

    .line 56
    .local v0, "processor":Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfDocumentContentParser;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->processPageContent(Lcom/itextpdf/kernel/pdf/PdfPage;)V

    .line 57
    return-object p2
.end method
