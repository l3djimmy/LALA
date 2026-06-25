.class Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$BeginMarkedContentDictionaryOperator;
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
    name = "BeginMarkedContentDictionaryOperator"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1261
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$1;

    .line 1261
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$BeginMarkedContentDictionaryOperator;-><init>()V

    return-void
.end method


# virtual methods
.method getPropertiesDictionary(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfResources;)Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 7
    .param p1, "operand1"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p2, "resources"    # Lcom/itextpdf/kernel/pdf/PdfResources;

    .line 1274
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isDictionary()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1275
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    return-object v0

    .line 1277
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfName;

    .line 1278
    .local v0, "dictionaryName":Lcom/itextpdf/kernel/pdf/PdfName;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Properties:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p2, v1}, Lcom/itextpdf/kernel/pdf/PdfResources;->getResource(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    .line 1279
    .local v1, "properties":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    const/4 v2, 0x0

    const-string v3, "The PDF contains a BDC operator which refers to a not existing Property dictionary: {0}."

    if-nez v1, :cond_1

    .line 1280
    const-class v4, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;

    invoke-static {v4}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v4

    .line 1281
    .local v4, "logger":Lorg/slf4j/Logger;
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->Properties:Lcom/itextpdf/kernel/pdf/PdfName;

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    .line 1282
    invoke-static {v3, v5}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 1281
    invoke-interface {v4, v3}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 1284
    return-object v2

    .line 1286
    .end local v4    # "logger":Lorg/slf4j/Logger;
    :cond_1
    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v4

    .line 1287
    .local v4, "propertiesDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-nez v4, :cond_2

    .line 1288
    const-class v5, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;

    invoke-static {v5}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v5

    .line 1289
    .local v5, "logger":Lorg/slf4j/Logger;
    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v6

    .line 1290
    invoke-static {v3, v6}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 1289
    invoke-interface {v5, v3}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 1292
    return-object v2

    .line 1294
    .end local v5    # "logger":Lorg/slf4j/Logger;
    :cond_2
    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    return-object v2
.end method

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

    .line 1268
    .local p3, "operands":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    const/4 v0, 0x1

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1270
    .local v0, "properties":Lcom/itextpdf/kernel/pdf/PdfObject;
    const/4 v1, 0x0

    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->getResources()Lcom/itextpdf/kernel/pdf/PdfResources;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$BeginMarkedContentDictionaryOperator;->getPropertiesDictionary(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfResources;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->beginMarkedContent(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 1271
    return-void
.end method
