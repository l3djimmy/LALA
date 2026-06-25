.class public Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;
.super Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;
.source "ParserGraphicsState.java"


# instance fields
.field private clippingPath:Lcom/itextpdf/kernel/geom/Path;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 47
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;-><init>()V

    .line 49
    return-void
.end method

.method constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;)V
    .locals 2
    .param p1, "source"    # Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;

    .line 57
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;-><init>(Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;)V

    .line 59
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;->clippingPath:Lcom/itextpdf/kernel/geom/Path;

    if-eqz v0, :cond_0

    .line 60
    new-instance v0, Lcom/itextpdf/kernel/geom/Path;

    iget-object v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;->clippingPath:Lcom/itextpdf/kernel/geom/Path;

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/geom/Path;-><init>(Lcom/itextpdf/kernel/geom/Path;)V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;->clippingPath:Lcom/itextpdf/kernel/geom/Path;

    .line 62
    :cond_0
    return-void
.end method

.method private transformClippingPath(Lcom/itextpdf/kernel/geom/Matrix;)V
    .locals 1
    .param p1, "newCtm"    # Lcom/itextpdf/kernel/geom/Matrix;

    .line 128
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;->clippingPath:Lcom/itextpdf/kernel/geom/Path;

    invoke-static {v0, p1}, Lcom/itextpdf/kernel/geom/ShapeTransformUtil;->transformPath(Lcom/itextpdf/kernel/geom/Path;Lcom/itextpdf/kernel/geom/Matrix;)Lcom/itextpdf/kernel/geom/Path;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;->clippingPath:Lcom/itextpdf/kernel/geom/Path;

    .line 129
    return-void
.end method


# virtual methods
.method public clip(Lcom/itextpdf/kernel/geom/Path;I)V
    .locals 6
    .param p1, "path"    # Lcom/itextpdf/kernel/geom/Path;
    .param p2, "fillingRule"    # I

    .line 84
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;->clippingPath:Lcom/itextpdf/kernel/geom/Path;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;->clippingPath:Lcom/itextpdf/kernel/geom/Path;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Path;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 88
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/geom/Path;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/geom/Path;-><init>(Lcom/itextpdf/kernel/geom/Path;)V

    .line 89
    .local v0, "pathCopy":Lcom/itextpdf/kernel/geom/Path;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Path;->closeAllSubpaths()V

    .line 91
    new-instance v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;-><init>()V

    .line 92
    .local v1, "clipper":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper;
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;->clippingPath:Lcom/itextpdf/kernel/geom/Path;

    sget-object v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;->SUBJECT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    invoke-static {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBridge;->addPath(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper;Lcom/itextpdf/kernel/geom/Path;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;)V

    .line 93
    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;->CLIP:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    invoke-static {v1, v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBridge;->addPath(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper;Lcom/itextpdf/kernel/geom/Path;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;)V

    .line 95
    new-instance v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;-><init>()V

    .line 96
    .local v2, "resultTree":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;
    sget-object v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;->INTERSECTION:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    sget-object v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->NON_ZERO:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    invoke-static {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBridge;->getFillType(I)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    move-result-object v5

    invoke-interface {v1, v3, v2, v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper;->execute(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;)Z

    .line 98
    invoke-static {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBridge;->convertToPath(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;)Lcom/itextpdf/kernel/geom/Path;

    move-result-object v3

    iput-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;->clippingPath:Lcom/itextpdf/kernel/geom/Path;

    .line 99
    return-void

    .line 85
    .end local v0    # "pathCopy":Lcom/itextpdf/kernel/geom/Path;
    .end local v1    # "clipper":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper;
    .end local v2    # "resultTree":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;
    :cond_1
    :goto_0
    return-void
.end method

.method public getClippingPath()Lcom/itextpdf/kernel/geom/Path;
    .locals 1

    .line 110
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;->clippingPath:Lcom/itextpdf/kernel/geom/Path;

    return-object v0
.end method

.method public setClippingPath(Lcom/itextpdf/kernel/geom/Path;)V
    .locals 1
    .param p1, "clippingPath"    # Lcom/itextpdf/kernel/geom/Path;

    .line 122
    new-instance v0, Lcom/itextpdf/kernel/geom/Path;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/geom/Path;-><init>(Lcom/itextpdf/kernel/geom/Path;)V

    .line 123
    .local v0, "pathCopy":Lcom/itextpdf/kernel/geom/Path;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Path;->closeAllSubpaths()V

    .line 124
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;->clippingPath:Lcom/itextpdf/kernel/geom/Path;

    .line 125
    return-void
.end method

.method public updateCtm(Lcom/itextpdf/kernel/geom/Matrix;)V
    .locals 1
    .param p1, "newCtm"    # Lcom/itextpdf/kernel/geom/Matrix;

    .line 66
    invoke-super {p0, p1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->updateCtm(Lcom/itextpdf/kernel/geom/Matrix;)V

    .line 67
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;->clippingPath:Lcom/itextpdf/kernel/geom/Path;

    if-eqz v0, :cond_0

    .line 68
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/ParserGraphicsState;->transformClippingPath(Lcom/itextpdf/kernel/geom/Matrix;)V

    .line 70
    :cond_0
    return-void
.end method
