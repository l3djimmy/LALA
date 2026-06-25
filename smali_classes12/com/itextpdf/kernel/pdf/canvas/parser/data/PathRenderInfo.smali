.class public Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;
.super Lcom/itextpdf/kernel/pdf/canvas/parser/data/AbstractRenderInfo;
.source "PathRenderInfo.java"


# static fields
.field public static final FILL:I = 0x2

.field public static final NO_OP:I = 0x0

.field public static final STROKE:I = 0x1


# instance fields
.field private canvasTagHierarchy:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;",
            ">;"
        }
    .end annotation
.end field

.field private clippingRule:I

.field private isClip:Z

.field private operation:I

.field private path:Lcom/itextpdf/kernel/geom/Path;

.field private rule:I


# direct methods
.method public constructor <init>(Ljava/util/Stack;Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;Lcom/itextpdf/kernel/geom/Path;I)V
    .locals 8
    .param p2, "gs"    # Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;
    .param p3, "path"    # Lcom/itextpdf/kernel/geom/Path;
    .param p4, "operation"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Stack<",
            "Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;",
            "Lcom/itextpdf/kernel/geom/Path;",
            "I)V"
        }
    .end annotation

    .line 107
    .local p1, "canvasTagHierarchy":Ljava/util/Stack;, "Ljava/util/Stack<Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;>;"
    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    .end local p1    # "canvasTagHierarchy":Ljava/util/Stack;, "Ljava/util/Stack<Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;>;"
    .end local p2    # "gs":Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;
    .end local p3    # "path":Lcom/itextpdf/kernel/geom/Path;
    .end local p4    # "operation":I
    .local v1, "canvasTagHierarchy":Ljava/util/Stack;, "Ljava/util/Stack<Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;>;"
    .local v2, "gs":Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;
    .local v3, "path":Lcom/itextpdf/kernel/geom/Path;
    .local v4, "operation":I
    invoke-direct/range {v0 .. v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;-><init>(Ljava/util/Stack;Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;Lcom/itextpdf/kernel/geom/Path;IIZI)V

    .line 108
    return-void
.end method

.method public constructor <init>(Ljava/util/Stack;Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;Lcom/itextpdf/kernel/geom/Path;IIZI)V
    .locals 1
    .param p2, "gs"    # Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;
    .param p3, "path"    # Lcom/itextpdf/kernel/geom/Path;
    .param p4, "operation"    # I
    .param p5, "rule"    # I
    .param p6, "isClip"    # Z
    .param p7, "clipRule"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Stack<",
            "Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;",
            "Lcom/itextpdf/kernel/geom/Path;",
            "IIZI)V"
        }
    .end annotation

    .line 84
    .local p1, "canvasTagHierarchy":Ljava/util/Stack;, "Ljava/util/Stack<Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;>;"
    invoke-direct {p0, p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/AbstractRenderInfo;-><init>(Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;)V

    .line 85
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;->canvasTagHierarchy:Ljava/util/List;

    .line 86
    iput-object p3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;->path:Lcom/itextpdf/kernel/geom/Path;

    .line 87
    iput p4, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;->operation:I

    .line 88
    iput p5, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;->rule:I

    .line 89
    iput-boolean p6, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;->isClip:Z

    .line 90
    iput p7, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;->clippingRule:I

    .line 91
    return-void
.end method


# virtual methods
.method public getCanvasTagHierarchy()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;",
            ">;"
        }
    .end annotation

    .line 242
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;->canvasTagHierarchy:Ljava/util/List;

    return-object v0
.end method

.method public getClippingRule()I
    .locals 1

    .line 153
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;->clippingRule:I

    return v0
.end method

.method public getCtm()Lcom/itextpdf/kernel/geom/Matrix;
    .locals 1

    .line 162
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;->checkGraphicsState()V

    .line 163
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getCtm()Lcom/itextpdf/kernel/geom/Matrix;

    move-result-object v0

    return-object v0
.end method

.method public getFillColor()Lcom/itextpdf/kernel/colors/Color;
    .locals 1

    .line 232
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;->checkGraphicsState()V

    .line 233
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getFillColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v0

    return-object v0
.end method

.method public getLineCapStyle()I
    .locals 1

    .line 182
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;->checkGraphicsState()V

    .line 183
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getLineCapStyle()I

    move-result v0

    return v0
.end method

.method public getLineDashPattern()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 1

    .line 212
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;->checkGraphicsState()V

    .line 213
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getDashPattern()Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    return-object v0
.end method

.method public getLineJoinStyle()I
    .locals 1

    .line 192
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;->checkGraphicsState()V

    .line 193
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getLineJoinStyle()I

    move-result v0

    return v0
.end method

.method public getLineWidth()F
    .locals 1

    .line 172
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;->checkGraphicsState()V

    .line 173
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getLineWidth()F

    move-result v0

    return v0
.end method

.method public getMcid()I
    .locals 3

    .line 251
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;->canvasTagHierarchy:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;

    .line 252
    .local v1, "tag":Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->hasMcid()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 253
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->getMcid()I

    move-result v0

    return v0

    .line 255
    .end local v1    # "tag":Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;
    :cond_0
    goto :goto_0

    .line 256
    :cond_1
    const/4 v0, -0x1

    return v0
.end method

.method public getMiterLimit()F
    .locals 1

    .line 202
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;->checkGraphicsState()V

    .line 203
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getMiterLimit()F

    move-result v0

    return v0
.end method

.method public getOperation()I
    .locals 1

    .line 126
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;->operation:I

    return v0
.end method

.method public getPath()Lcom/itextpdf/kernel/geom/Path;
    .locals 1

    .line 116
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;->path:Lcom/itextpdf/kernel/geom/Path;

    return-object v0
.end method

.method public getRule()I
    .locals 1

    .line 135
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;->rule:I

    return v0
.end method

.method public getStrokeColor()Lcom/itextpdf/kernel/colors/Color;
    .locals 1

    .line 222
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;->checkGraphicsState()V

    .line 223
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getStrokeColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v0

    return-object v0
.end method

.method public hasMcid(I)Z
    .locals 1
    .param p1, "mcid"    # I

    .line 267
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;->hasMcid(IZ)Z

    move-result v0

    return v0
.end method

.method public hasMcid(IZ)Z
    .locals 5
    .param p1, "mcid"    # I
    .param p2, "checkTheTopmostLevelOnly"    # Z

    .line 279
    nop

    .line 285
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;->canvasTagHierarchy:Ljava/util/List;

    .line 279
    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz p2, :cond_1

    .line 280
    if-eqz v0, :cond_3

    .line 281
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;->getMcid()I

    move-result v0

    .line 282
    .local v0, "infoMcid":I
    const/4 v3, -0x1

    if-eq v0, v3, :cond_0

    if-ne v0, p1, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    return v1

    .line 285
    .end local v0    # "infoMcid":I
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;

    .line 286
    .local v3, "tag":Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->hasMcid()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 287
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->getMcid()I

    move-result v4

    if-ne v4, p1, :cond_2

    .line 288
    return v1

    .line 289
    .end local v3    # "tag":Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;
    :cond_2
    goto :goto_1

    .line 291
    :cond_3
    return v2
.end method

.method public isPathModifiesClippingPath()Z
    .locals 1

    .line 144
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/PathRenderInfo;->isClip:Z

    return v0
.end method
