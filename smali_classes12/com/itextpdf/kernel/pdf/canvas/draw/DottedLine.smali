.class public Lcom/itextpdf/kernel/pdf/canvas/draw/DottedLine;
.super Ljava/lang/Object;
.source "DottedLine.java"

# interfaces
.implements Lcom/itextpdf/kernel/pdf/canvas/draw/ILineDrawer;


# instance fields
.field private color:Lcom/itextpdf/kernel/colors/Color;

.field protected gap:F

.field private lineWidth:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    const/high16 v0, 0x40800000    # 4.0f

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DottedLine;->gap:F

    .line 42
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DottedLine;->lineWidth:F

    .line 44
    sget-object v0, Lcom/itextpdf/kernel/colors/ColorConstants;->BLACK:Lcom/itextpdf/kernel/colors/Color;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DottedLine;->color:Lcom/itextpdf/kernel/colors/Color;

    .line 50
    return-void
.end method

.method public constructor <init>(F)V
    .locals 1
    .param p1, "lineWidth"    # F

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    const/high16 v0, 0x40800000    # 4.0f

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DottedLine;->gap:F

    .line 42
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DottedLine;->lineWidth:F

    .line 44
    sget-object v0, Lcom/itextpdf/kernel/colors/ColorConstants;->BLACK:Lcom/itextpdf/kernel/colors/Color;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DottedLine;->color:Lcom/itextpdf/kernel/colors/Color;

    .line 69
    iput p1, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DottedLine;->lineWidth:F

    .line 70
    return-void
.end method

.method public constructor <init>(FF)V
    .locals 1
    .param p1, "lineWidth"    # F
    .param p2, "gap"    # F

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    const/high16 v0, 0x40800000    # 4.0f

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DottedLine;->gap:F

    .line 42
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DottedLine;->lineWidth:F

    .line 44
    sget-object v0, Lcom/itextpdf/kernel/colors/ColorConstants;->BLACK:Lcom/itextpdf/kernel/colors/Color;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DottedLine;->color:Lcom/itextpdf/kernel/colors/Color;

    .line 59
    iput p1, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DottedLine;->lineWidth:F

    .line 60
    iput p2, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DottedLine;->gap:F

    .line 61
    return-void
.end method


# virtual methods
.method public draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 6
    .param p1, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .param p2, "drawArea"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 74
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    iget v1, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DottedLine;->lineWidth:F

    .line 75
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineWidth(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DottedLine;->color:Lcom/itextpdf/kernel/colors/Color;

    .line 76
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setStrokeColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    iget v1, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DottedLine;->gap:F

    iget v2, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DottedLine;->gap:F

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    .line 77
    const/4 v4, 0x0

    invoke-virtual {v0, v4, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineDash(FFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 78
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineCapStyle(I)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 79
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v1

    float-to-double v1, v1

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v4

    iget v5, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DottedLine;->lineWidth:F

    div-float/2addr v5, v3

    add-float/2addr v4, v5

    float-to-double v4, v4

    invoke-virtual {v0, v1, v2, v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 80
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v1

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    add-float/2addr v1, v2

    float-to-double v1, v1

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v4

    iget v5, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DottedLine;->lineWidth:F

    div-float/2addr v5, v3

    add-float/2addr v4, v5

    float-to-double v3, v4

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 81
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->stroke()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 82
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 83
    return-void
.end method

.method public getColor()Lcom/itextpdf/kernel/colors/Color;
    .locals 1

    .line 123
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DottedLine;->color:Lcom/itextpdf/kernel/colors/Color;

    return-object v0
.end method

.method public getGap()F
    .locals 1

    .line 91
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DottedLine;->gap:F

    return v0
.end method

.method public getLineWidth()F
    .locals 1

    .line 109
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DottedLine;->lineWidth:F

    return v0
.end method

.method public setColor(Lcom/itextpdf/kernel/colors/Color;)V
    .locals 0
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/Color;

    .line 128
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DottedLine;->color:Lcom/itextpdf/kernel/colors/Color;

    .line 129
    return-void
.end method

.method public setGap(F)V
    .locals 0
    .param p1, "gap"    # F

    .line 100
    iput p1, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DottedLine;->gap:F

    .line 101
    return-void
.end method

.method public setLineWidth(F)V
    .locals 0
    .param p1, "lineWidth"    # F

    .line 118
    iput p1, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DottedLine;->lineWidth:F

    .line 119
    return-void
.end method
