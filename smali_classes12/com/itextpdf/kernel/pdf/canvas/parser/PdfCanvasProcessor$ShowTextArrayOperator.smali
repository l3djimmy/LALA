.class Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$ShowTextArrayOperator;
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
    name = "ShowTextArrayOperator"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 609
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$1;

    .line 609
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$ShowTextArrayOperator;-><init>()V

    return-void
.end method


# virtual methods
.method public invoke(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;Lcom/itextpdf/kernel/pdf/PdfLiteral;Ljava/util/List;)V
    .locals 5
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

    .line 614
    .local p3, "operands":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    const/4 v0, 0x0

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 615
    .local v0, "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    const/4 v1, 0x0

    .line 616
    .local v1, "tj":F
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 617
    .local v3, "entryObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    instance-of v4, v3, Lcom/itextpdf/kernel/pdf/PdfString;

    if-eqz v4, :cond_0

    .line 618
    move-object v4, v3

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-static {p1, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->access$4700(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;Lcom/itextpdf/kernel/pdf/PdfString;)V

    .line 619
    const/4 v1, 0x0

    goto :goto_1

    .line 621
    :cond_0
    move-object v4, v3

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v1

    .line 622
    invoke-static {p1, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->access$4800(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;F)V

    .line 624
    .end local v3    # "entryObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    :goto_1
    goto :goto_0

    .line 625
    :cond_1
    return-void
.end method
