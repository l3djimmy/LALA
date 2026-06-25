.class public Lcom/itextpdf/kernel/pdf/canvas/PdfPatternCanvas;
.super Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
.source "PdfPatternCanvas.java"


# instance fields
.field private final tilingPattern:Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfStream;Lcom/itextpdf/kernel/pdf/PdfResources;Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 1
    .param p1, "contentStream"    # Lcom/itextpdf/kernel/pdf/PdfStream;
    .param p2, "resources"    # Lcom/itextpdf/kernel/pdf/PdfResources;
    .param p3, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 48
    invoke-direct {p0, p1, p2, p3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;-><init>(Lcom/itextpdf/kernel/pdf/PdfStream;Lcom/itextpdf/kernel/pdf/PdfResources;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 49
    new-instance v0, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;-><init>(Lcom/itextpdf/kernel/pdf/PdfStream;)V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfPatternCanvas;->tilingPattern:Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;

    .line 50
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 2
    .param p1, "pattern"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;
    .param p2, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 58
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->getResources()Lcom/itextpdf/kernel/pdf/PdfResources;

    move-result-object v1

    invoke-direct {p0, v0, v1, p2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;-><init>(Lcom/itextpdf/kernel/pdf/PdfStream;Lcom/itextpdf/kernel/pdf/PdfResources;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 59
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfPatternCanvas;->tilingPattern:Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;

    .line 60
    return-void
.end method

.method private checkNoColor()V
    .locals 2

    .line 69
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/PdfPatternCanvas;->tilingPattern:Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;->isColored()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 73
    return-void

    .line 70
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Content stream must not invoke operators that specify colors or other color related parameters in the graphics state."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public setColor(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[FLcom/itextpdf/kernel/pdf/colorspace/PdfPattern;Z)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 1
    .param p1, "colorSpace"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
    .param p2, "colorValue"    # [F
    .param p3, "pattern"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern;
    .param p4, "fill"    # Z

    .line 64
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/PdfPatternCanvas;->checkNoColor()V

    .line 65
    invoke-super {p0, p1, p2, p3, p4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setColor(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[FLcom/itextpdf/kernel/pdf/colorspace/PdfPattern;Z)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    return-object v0
.end method
