.class public Lcom/itextpdf/kernel/pdf/canvas/draw/DashedLine;
.super Ljava/lang/Object;
.source "DashedLine.java"

# interfaces
.implements Lcom/itextpdf/kernel/pdf/canvas/draw/ILineDrawer;


# instance fields
.field private color:Lcom/itextpdf/kernel/colors/Color;

.field private lineWidth:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DashedLine;->lineWidth:F

    .line 38
    sget-object v0, Lcom/itextpdf/kernel/colors/ColorConstants;->BLACK:Lcom/itextpdf/kernel/colors/Color;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DashedLine;->color:Lcom/itextpdf/kernel/colors/Color;

    .line 41
    return-void
.end method

.method public constructor <init>(F)V
    .locals 1
    .param p1, "lineWidth"    # F

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DashedLine;->lineWidth:F

    .line 38
    sget-object v0, Lcom/itextpdf/kernel/colors/ColorConstants;->BLACK:Lcom/itextpdf/kernel/colors/Color;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DashedLine;->color:Lcom/itextpdf/kernel/colors/Color;

    .line 49
    iput p1, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DashedLine;->lineWidth:F

    .line 50
    return-void
.end method


# virtual methods
.method public draw(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 6
    .param p1, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .param p2, "drawArea"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 54
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    iget v1, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DashedLine;->lineWidth:F

    .line 55
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineWidth(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DashedLine;->color:Lcom/itextpdf/kernel/colors/Color;

    .line 56
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setStrokeColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 57
    const/high16 v1, 0x40000000    # 2.0f

    invoke-virtual {v0, v1, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineDash(FF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 58
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v2

    float-to-double v2, v2

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v4

    iget v5, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DashedLine;->lineWidth:F

    div-float/2addr v5, v1

    add-float/2addr v4, v5

    float-to-double v4, v4

    invoke-virtual {v0, v2, v3, v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 59
    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v2

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v3

    add-float/2addr v2, v3

    float-to-double v2, v2

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v4

    iget v5, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DashedLine;->lineWidth:F

    div-float/2addr v5, v1

    add-float/2addr v4, v5

    float-to-double v4, v4

    invoke-virtual {v0, v2, v3, v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 60
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->stroke()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v0

    .line 61
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 62
    return-void
.end method

.method public getColor()Lcom/itextpdf/kernel/colors/Color;
    .locals 1

    .line 86
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DashedLine;->color:Lcom/itextpdf/kernel/colors/Color;

    return-object v0
.end method

.method public getLineWidth()F
    .locals 1

    .line 71
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DashedLine;->lineWidth:F

    return v0
.end method

.method public setColor(Lcom/itextpdf/kernel/colors/Color;)V
    .locals 0
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/Color;

    .line 91
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DashedLine;->color:Lcom/itextpdf/kernel/colors/Color;

    .line 92
    return-void
.end method

.method public setLineWidth(F)V
    .locals 0
    .param p1, "lineWidth"    # F

    .line 81
    iput p1, p0, Lcom/itextpdf/kernel/pdf/canvas/draw/DashedLine;->lineWidth:F

    .line 82
    return-void
.end method
