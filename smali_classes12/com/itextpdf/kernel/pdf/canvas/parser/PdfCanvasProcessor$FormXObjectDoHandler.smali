.class Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$FormXObjectDoHandler;
.super Ljava/lang/Object;
.source "PdfCanvasProcessor.java"

# interfaces
.implements Lcom/itextpdf/kernel/pdf/canvas/parser/IXObjectDoHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FormXObjectDoHandler"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1411
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$1;

    .line 1411
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$FormXObjectDoHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleXObject(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;Ljava/util/Stack;Lcom/itextpdf/kernel/pdf/PdfStream;Lcom/itextpdf/kernel/pdf/PdfName;)V
    .locals 15
    .param p1, "processor"    # Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;
    .param p3, "xObjectStream"    # Lcom/itextpdf/kernel/pdf/PdfStream;
    .param p4, "xObjectName"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;",
            "Ljava/util/Stack<",
            "Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/PdfStream;",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            ")V"
        }
    .end annotation

    .line 1415
    .local p2, "canvasTagHierarchy":Ljava/util/Stack;, "Ljava/util/Stack<Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;>;"
    move-object/from16 v0, p1

    move-object/from16 v1, p3

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Resources:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    .line 1417
    .local v2, "resourcesDic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-nez v2, :cond_0

    .line 1418
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->getResources()Lcom/itextpdf/kernel/pdf/PdfResources;

    move-result-object v3

    .local v3, "resources":Lcom/itextpdf/kernel/pdf/PdfResources;
    goto :goto_0

    .line 1420
    .end local v3    # "resources":Lcom/itextpdf/kernel/pdf/PdfResources;
    :cond_0
    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfResources;

    invoke-direct {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfResources;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 1427
    .restart local v3    # "resources":Lcom/itextpdf/kernel/pdf/PdfResources;
    :goto_0
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getBytes()[B

    move-result-object v4

    .line 1428
    .local v4, "contentBytes":[B
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->Matrix:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v5}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v5

    .line 1430
    .local v5, "matrix":Lcom/itextpdf/kernel/pdf/PdfArray;
    new-instance v6, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$PushGraphicsStateOperator;

    const/4 v7, 0x0

    invoke-direct {v6, v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$PushGraphicsStateOperator;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$1;)V

    invoke-virtual {v6, v0, v7, v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$PushGraphicsStateOperator;->invoke(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;Lcom/itextpdf/kernel/pdf/PdfLiteral;Ljava/util/List;)V

    .line 1432
    if-eqz v5, :cond_1

    .line 1433
    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v9

    .line 1434
    .local v9, "a":F
    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v10

    .line 1435
    .local v10, "b":F
    const/4 v6, 0x2

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v11

    .line 1436
    .local v11, "c":F
    const/4 v6, 0x3

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v12

    .line 1437
    .local v12, "d":F
    const/4 v6, 0x4

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v13

    .line 1438
    .local v13, "e":F
    const/4 v6, 0x5

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v14

    .line 1439
    .local v14, "f":F
    new-instance v8, Lcom/itextpdf/kernel/geom/Matrix;

    invoke-direct/range {v8 .. v14}, Lcom/itextpdf/kernel/geom/Matrix;-><init>(FFFFFF)V

    .line 1440
    .local v8, "formMatrix":Lcom/itextpdf/kernel/geom/Matrix;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->getGraphicsState()Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;

    move-result-object v6

    invoke-virtual {v6, v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;->updateCtm(Lcom/itextpdf/kernel/geom/Matrix;)V

    .line 1443
    .end local v8    # "formMatrix":Lcom/itextpdf/kernel/geom/Matrix;
    .end local v9    # "a":F
    .end local v10    # "b":F
    .end local v11    # "c":F
    .end local v12    # "d":F
    .end local v13    # "e":F
    .end local v14    # "f":F
    :cond_1
    invoke-virtual {v0, v4, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->processContent([BLcom/itextpdf/kernel/pdf/PdfResources;)V

    .line 1445
    new-instance v6, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$PopGraphicsStateOperator;

    invoke-direct {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$PopGraphicsStateOperator;-><init>()V

    invoke-virtual {v6, v0, v7, v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$PopGraphicsStateOperator;->invoke(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;Lcom/itextpdf/kernel/pdf/PdfLiteral;Ljava/util/List;)V

    .line 1446
    return-void
.end method
