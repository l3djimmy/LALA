.class public Lcom/itextpdf/kernel/pdf/canvas/parser/data/ClippingPathInfo;
.super Lcom/itextpdf/kernel/pdf/canvas/parser/data/AbstractRenderInfo;
.source "ClippingPathInfo.java"


# instance fields
.field private ctm:Lcom/itextpdf/kernel/geom/Matrix;

.field private path:Lcom/itextpdf/kernel/geom/Path;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;Lcom/itextpdf/kernel/geom/Path;Lcom/itextpdf/kernel/geom/Matrix;)V
    .locals 0
    .param p1, "gs"    # Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;
    .param p2, "path"    # Lcom/itextpdf/kernel/geom/Path;
    .param p3, "ctm"    # Lcom/itextpdf/kernel/geom/Matrix;

    .line 44
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/AbstractRenderInfo;-><init>(Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;)V

    .line 45
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/ClippingPathInfo;->path:Lcom/itextpdf/kernel/geom/Path;

    .line 46
    iput-object p3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/ClippingPathInfo;->ctm:Lcom/itextpdf/kernel/geom/Matrix;

    .line 47
    return-void
.end method


# virtual methods
.method public getClippingPath()Lcom/itextpdf/kernel/geom/Path;
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/ClippingPathInfo;->path:Lcom/itextpdf/kernel/geom/Path;

    return-object v0
.end method

.method public getCtm()Lcom/itextpdf/kernel/geom/Matrix;
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/ClippingPathInfo;->ctm:Lcom/itextpdf/kernel/geom/Matrix;

    return-object v0
.end method
