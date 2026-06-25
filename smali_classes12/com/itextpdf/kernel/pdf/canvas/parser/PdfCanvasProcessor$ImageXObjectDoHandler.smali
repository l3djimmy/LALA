.class Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$ImageXObjectDoHandler;
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
    name = "ImageXObjectDoHandler"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1452
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$1;

    .line 1452
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor$ImageXObjectDoHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleXObject(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;Ljava/util/Stack;Lcom/itextpdf/kernel/pdf/PdfStream;Lcom/itextpdf/kernel/pdf/PdfName;)V
    .locals 1
    .param p1, "processor"    # Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;
    .param p3, "xObjectStream"    # Lcom/itextpdf/kernel/pdf/PdfStream;
    .param p4, "resourceName"    # Lcom/itextpdf/kernel/pdf/PdfName;
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

    .line 1455
    .local p2, "canvasTagHierarchy":Ljava/util/Stack;, "Ljava/util/Stack<Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;>;"
    const/4 v0, 0x0

    invoke-static {p1, p2, p3, p4, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->access$5800(Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;Ljava/util/Stack;Lcom/itextpdf/kernel/pdf/PdfStream;Lcom/itextpdf/kernel/pdf/PdfName;Z)V

    .line 1456
    return-void
.end method
