.class Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$ModifyCurrentTransformationMatrixOperator;
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
    name = "ModifyCurrentTransformationMatrixOperator"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 947
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$1;

    .line 947
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$ModifyCurrentTransformationMatrixOperator;-><init>()V

    return-void
.end method


# virtual methods
.method public invoke(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;Lcom/itextpdf/kernel/pdf/PdfLiteral;Ljava/util/List;)V
    .locals 11
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

    .line 952
    .local p3, "operands":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    const/4 v1, 0x0

    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v3

    .line 953
    .local v3, "a":F
    const/4 v0, 0x1

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v4

    .line 954
    .local v4, "b":F
    const/4 v0, 0x2

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v5

    .line 955
    .local v5, "c":F
    const/4 v0, 0x3

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v6

    .line 956
    .local v6, "d":F
    const/4 v0, 0x4

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v7

    .line 957
    .local v7, "e":F
    const/4 v0, 0x5

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v8

    .line 958
    .local v8, "f":F
    new-instance v2, Lcom/itextpdf/kernel/geom/Matrix;

    invoke-direct/range {v2 .. v8}, Lcom/itextpdf/kernel/geom/Matrix;-><init>(FFFFFF)V

    .line 960
    .local v2, "matrix":Lcom/itextpdf/kernel/geom/Matrix;
    :try_start_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->getGraphicsState()Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;->updateCtm(Lcom/itextpdf/kernel/geom/Matrix;)V
    :try_end_0
    .catch Lcom/itextpdf/kernel/exceptions/PdfException; {:try_start_0 .. :try_end_0} :catch_0

    .line 968
    goto :goto_0

    .line 961
    :catch_0
    move-exception v0

    .line 962
    .local v0, "exception":Lcom/itextpdf/kernel/exceptions/PdfException;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/exceptions/PdfException;->getCause()Ljava/lang/Throwable;

    move-result-object v9

    instance-of v9, v9, Lcom/itextpdf/kernel/geom/NoninvertibleTransformException;

    if-eqz v9, :cond_0

    .line 965
    const-class v9, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;

    invoke-static {v9}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v9

    .line 966
    .local v9, "logger":Lorg/slf4j/Logger;
    const-string v10, "Failed to process a transformation matrix which is noninvertible. Some content may be placed not as expected."

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v10, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v9, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 969
    .end local v0    # "exception":Lcom/itextpdf/kernel/exceptions/PdfException;
    .end local v9    # "logger":Lorg/slf4j/Logger;
    :goto_0
    return-void

    .line 963
    .restart local v0    # "exception":Lcom/itextpdf/kernel/exceptions/PdfException;
    :cond_0
    throw v0
.end method
