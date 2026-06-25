.class public Lcom/itextpdf/layout/Document;
.super Lcom/itextpdf/layout/RootElement;
.source "Document.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/layout/RootElement<",
        "Lcom/itextpdf/layout/Document;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 1
    .param p1, "pdfDoc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 58
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDefaultPageSize()Lcom/itextpdf/kernel/geom/PageSize;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/layout/Document;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/geom/PageSize;)V

    .line 59
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/geom/PageSize;)V
    .locals 1
    .param p1, "pdfDoc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "pageSize"    # Lcom/itextpdf/kernel/geom/PageSize;

    .line 69
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lcom/itextpdf/layout/Document;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/geom/PageSize;Z)V

    .line 70
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/geom/PageSize;Z)V
    .locals 1
    .param p1, "pdfDoc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "pageSize"    # Lcom/itextpdf/kernel/geom/PageSize;
    .param p3, "immediateFlush"    # Z

    .line 82
    invoke-direct {p0}, Lcom/itextpdf/layout/RootElement;-><init>()V

    .line 83
    iput-object p1, p0, Lcom/itextpdf/layout/Document;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 84
    iget-object v0, p0, Lcom/itextpdf/layout/Document;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0, p2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->setDefaultPageSize(Lcom/itextpdf/kernel/geom/PageSize;)V

    .line 85
    iput-boolean p3, p0, Lcom/itextpdf/layout/Document;->immediateFlush:Z

    .line 86
    return-void
.end method


# virtual methods
.method public add(Lcom/itextpdf/layout/element/AreaBreak;)Lcom/itextpdf/layout/Document;
    .locals 2
    .param p1, "areaBreak"    # Lcom/itextpdf/layout/element/AreaBreak;

    .line 107
    invoke-virtual {p0}, Lcom/itextpdf/layout/Document;->checkClosingStatus()V

    .line 108
    iget-object v0, p0, Lcom/itextpdf/layout/Document;->childElements:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    invoke-virtual {p0}, Lcom/itextpdf/layout/Document;->ensureRootRendererNotNull()Lcom/itextpdf/layout/renderer/RootRenderer;

    move-result-object v0

    invoke-virtual {p1}, Lcom/itextpdf/layout/element/AreaBreak;->createRendererSubTree()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/RootRenderer;->addChild(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 110
    iget-boolean v0, p0, Lcom/itextpdf/layout/Document;->immediateFlush:Z

    if-eqz v0, :cond_0

    .line 111
    iget-object v0, p0, Lcom/itextpdf/layout/Document;->childElements:Ljava/util/List;

    iget-object v1, p0, Lcom/itextpdf/layout/Document;->childElements:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 113
    :cond_0
    return-object p0
.end method

.method public add(Lcom/itextpdf/layout/element/IBlockElement;)Lcom/itextpdf/layout/Document;
    .locals 1
    .param p1, "element"    # Lcom/itextpdf/layout/element/IBlockElement;

    .line 118
    invoke-virtual {p0}, Lcom/itextpdf/layout/Document;->checkClosingStatus()V

    .line 119
    invoke-super {p0, p1}, Lcom/itextpdf/layout/RootElement;->add(Lcom/itextpdf/layout/element/IBlockElement;)Lcom/itextpdf/layout/IPropertyContainer;

    .line 120
    instance-of v0, p1, Lcom/itextpdf/layout/element/ILargeElement;

    if-eqz v0, :cond_0

    .line 121
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/layout/element/ILargeElement;

    invoke-interface {v0, p0}, Lcom/itextpdf/layout/element/ILargeElement;->setDocument(Lcom/itextpdf/layout/Document;)V

    .line 122
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/layout/element/ILargeElement;

    invoke-interface {v0}, Lcom/itextpdf/layout/element/ILargeElement;->flushContent()V

    .line 124
    :cond_0
    return-object p0
.end method

.method public bridge synthetic add(Lcom/itextpdf/layout/element/IBlockElement;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 0

    .line 49
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/Document;->add(Lcom/itextpdf/layout/element/IBlockElement;)Lcom/itextpdf/layout/Document;

    move-result-object p1

    return-object p1
.end method

.method protected checkClosingStatus()V
    .locals 2

    .line 326
    invoke-virtual {p0}, Lcom/itextpdf/layout/Document;->getPdfDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 329
    return-void

    .line 327
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Document was closed. It is impossible to execute action."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public close()V
    .locals 1

    .line 93
    iget-object v0, p0, Lcom/itextpdf/layout/Document;->rootRenderer:Lcom/itextpdf/layout/renderer/RootRenderer;

    if-eqz v0, :cond_0

    .line 94
    iget-object v0, p0, Lcom/itextpdf/layout/Document;->rootRenderer:Lcom/itextpdf/layout/renderer/RootRenderer;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/RootRenderer;->close()V

    .line 96
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/Document;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V

    .line 97
    return-void
.end method

.method protected ensureRootRendererNotNull()Lcom/itextpdf/layout/renderer/RootRenderer;
    .locals 2

    .line 317
    iget-object v0, p0, Lcom/itextpdf/layout/Document;->rootRenderer:Lcom/itextpdf/layout/renderer/RootRenderer;

    if-nez v0, :cond_0

    .line 318
    new-instance v0, Lcom/itextpdf/layout/renderer/DocumentRenderer;

    iget-boolean v1, p0, Lcom/itextpdf/layout/Document;->immediateFlush:Z

    invoke-direct {v0, p0, v1}, Lcom/itextpdf/layout/renderer/DocumentRenderer;-><init>(Lcom/itextpdf/layout/Document;Z)V

    iput-object v0, p0, Lcom/itextpdf/layout/Document;->rootRenderer:Lcom/itextpdf/layout/renderer/RootRenderer;

    .line 319
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/Document;->rootRenderer:Lcom/itextpdf/layout/renderer/RootRenderer;

    return-object v0
.end method

.method public flush()V
    .locals 1

    .line 151
    iget-object v0, p0, Lcom/itextpdf/layout/Document;->rootRenderer:Lcom/itextpdf/layout/renderer/RootRenderer;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/RootRenderer;->flush()V

    .line 152
    return-void
.end method

.method public getBottomMargin()F
    .locals 2

    .line 252
    const/16 v0, 0x2b

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/Document;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    .line 253
    .local v1, "property":Ljava/lang/Float;
    if-eqz v1, :cond_0

    move-object v0, v1

    goto :goto_0

    :cond_0
    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/Document;->getDefaultProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    :goto_0
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    return v0
.end method

.method public getDefaultProperty(I)Ljava/lang/Object;
    .locals 1
    .param p1, "property"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            ">(I)TT1;"
        }
    .end annotation

    .line 298
    sparse-switch p1, :sswitch_data_0

    .line 310
    invoke-super {p0, p1}, Lcom/itextpdf/layout/RootElement;->getDefaultProperty(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 308
    :sswitch_0
    const/high16 v0, 0x42100000    # 36.0f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    return-object v0

    .line 300
    :sswitch_1
    invoke-virtual {p0}, Lcom/itextpdf/layout/Document;->getPdfDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getConformanceLevel()Lcom/itextpdf/kernel/pdf/IConformanceLevel;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 301
    invoke-virtual {p0}, Lcom/itextpdf/layout/Document;->getPdfDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDefaultFont()Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    return-object v0

    .line 303
    :cond_0
    invoke-super {p0, p1}, Lcom/itextpdf/layout/RootElement;->getDefaultProperty(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x14 -> :sswitch_1
        0x2b -> :sswitch_0
        0x2c -> :sswitch_0
        0x2d -> :sswitch_0
        0x2e -> :sswitch_0
    .end sparse-switch
.end method

.method public getLeftMargin()F
    .locals 2

    .line 195
    const/16 v0, 0x2c

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/Document;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    .line 196
    .local v1, "property":Ljava/lang/Float;
    if-eqz v1, :cond_0

    move-object v0, v1

    goto :goto_0

    :cond_0
    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/Document;->getDefaultProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    :goto_0
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    return v0
.end method

.method public getPageEffectiveArea(Lcom/itextpdf/kernel/geom/PageSize;)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 5
    .param p1, "pageSize"    # Lcom/itextpdf/kernel/geom/PageSize;

    .line 288
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/PageSize;->getLeft()F

    move-result v0

    invoke-virtual {p0}, Lcom/itextpdf/layout/Document;->getLeftMargin()F

    move-result v1

    add-float/2addr v0, v1

    .line 289
    .local v0, "x":F
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/PageSize;->getBottom()F

    move-result v1

    invoke-virtual {p0}, Lcom/itextpdf/layout/Document;->getBottomMargin()F

    move-result v2

    add-float/2addr v1, v2

    .line 290
    .local v1, "y":F
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/PageSize;->getWidth()F

    move-result v2

    invoke-virtual {p0}, Lcom/itextpdf/layout/Document;->getLeftMargin()F

    move-result v3

    sub-float/2addr v2, v3

    invoke-virtual {p0}, Lcom/itextpdf/layout/Document;->getRightMargin()F

    move-result v3

    sub-float/2addr v2, v3

    .line 291
    .local v2, "width":F
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/PageSize;->getHeight()F

    move-result v3

    invoke-virtual {p0}, Lcom/itextpdf/layout/Document;->getBottomMargin()F

    move-result v4

    sub-float/2addr v3, v4

    invoke-virtual {p0}, Lcom/itextpdf/layout/Document;->getTopMargin()F

    move-result v4

    sub-float/2addr v3, v4

    .line 292
    .local v3, "height":F
    new-instance v4, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-direct {v4, v0, v1, v2, v3}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    return-object v4
.end method

.method public getPdfDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;
    .locals 1

    .line 133
    iget-object v0, p0, Lcom/itextpdf/layout/Document;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    return-object v0
.end method

.method public getRightMargin()F
    .locals 2

    .line 214
    const/16 v0, 0x2d

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/Document;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    .line 215
    .local v1, "property":Ljava/lang/Float;
    if-eqz v1, :cond_0

    move-object v0, v1

    goto :goto_0

    :cond_0
    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/Document;->getDefaultProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    :goto_0
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    return v0
.end method

.method public getTopMargin()F
    .locals 2

    .line 233
    const/16 v0, 0x2e

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/Document;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    .line 234
    .local v1, "property":Ljava/lang/Float;
    if-eqz v1, :cond_0

    move-object v0, v1

    goto :goto_0

    :cond_0
    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/Document;->getDefaultProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    :goto_0
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    return v0
.end method

.method public relayout()V
    .locals 3

    .line 162
    iget-boolean v0, p0, Lcom/itextpdf/layout/Document;->immediateFlush:Z

    if-nez v0, :cond_6

    .line 166
    iget-object v0, p0, Lcom/itextpdf/layout/Document;->rootRenderer:Lcom/itextpdf/layout/renderer/RootRenderer;

    instance-of v0, v0, Lcom/itextpdf/layout/renderer/DocumentRenderer;

    if-eqz v0, :cond_0

    .line 167
    iget-object v0, p0, Lcom/itextpdf/layout/Document;->rootRenderer:Lcom/itextpdf/layout/renderer/RootRenderer;

    check-cast v0, Lcom/itextpdf/layout/renderer/DocumentRenderer;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/DocumentRenderer;->getTargetCounterHandler()Lcom/itextpdf/layout/renderer/TargetCounterHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TargetCounterHandler;->prepareHandlerToRelayout()V

    .line 170
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/Document;->rootRenderer:Lcom/itextpdf/layout/renderer/RootRenderer;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/layout/Document;->rootRenderer:Lcom/itextpdf/layout/renderer/RootRenderer;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/RootRenderer;->getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 171
    .local v0, "nextRelayoutRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    :goto_0
    if-eqz v0, :cond_2

    instance-of v1, v0, Lcom/itextpdf/layout/renderer/RootRenderer;

    if-nez v1, :cond_3

    .line 172
    :cond_2
    new-instance v1, Lcom/itextpdf/layout/renderer/DocumentRenderer;

    iget-boolean v2, p0, Lcom/itextpdf/layout/Document;->immediateFlush:Z

    invoke-direct {v1, p0, v2}, Lcom/itextpdf/layout/renderer/DocumentRenderer;-><init>(Lcom/itextpdf/layout/Document;Z)V

    move-object v0, v1

    .line 179
    :cond_3
    :goto_1
    iget-object v1, p0, Lcom/itextpdf/layout/Document;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v1

    if-lez v1, :cond_4

    .line 180
    iget-object v1, p0, Lcom/itextpdf/layout/Document;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    iget-object v2, p0, Lcom/itextpdf/layout/Document;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->removePage(I)V

    goto :goto_1

    .line 183
    :cond_4
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/layout/renderer/RootRenderer;

    iput-object v1, p0, Lcom/itextpdf/layout/Document;->rootRenderer:Lcom/itextpdf/layout/renderer/RootRenderer;

    .line 184
    iget-object v1, p0, Lcom/itextpdf/layout/Document;->childElements:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/element/IElement;

    .line 185
    .local v2, "element":Lcom/itextpdf/layout/element/IElement;
    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/Document;->createAndAddRendererSubTree(Lcom/itextpdf/layout/element/IElement;)V

    .line 186
    .end local v2    # "element":Lcom/itextpdf/layout/element/IElement;
    goto :goto_2

    .line 187
    :cond_5
    return-void

    .line 163
    .end local v0    # "nextRelayoutRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_6
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Operation not supported with immediate flush"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setBottomMargin(F)V
    .locals 2
    .param p1, "bottomMargin"    # F

    .line 262
    const/16 v0, 0x2b

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/Document;->setProperty(ILjava/lang/Object;)V

    .line 263
    return-void
.end method

.method public setLeftMargin(F)V
    .locals 2
    .param p1, "leftMargin"    # F

    .line 205
    const/16 v0, 0x2c

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/Document;->setProperty(ILjava/lang/Object;)V

    .line 206
    return-void
.end method

.method public setMargins(FFFF)V
    .locals 0
    .param p1, "topMargin"    # F
    .param p2, "rightMargin"    # F
    .param p3, "bottomMargin"    # F
    .param p4, "leftMargin"    # F

    .line 274
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/Document;->setTopMargin(F)V

    .line 275
    invoke-virtual {p0, p2}, Lcom/itextpdf/layout/Document;->setRightMargin(F)V

    .line 276
    invoke-virtual {p0, p3}, Lcom/itextpdf/layout/Document;->setBottomMargin(F)V

    .line 277
    invoke-virtual {p0, p4}, Lcom/itextpdf/layout/Document;->setLeftMargin(F)V

    .line 278
    return-void
.end method

.method public setRenderer(Lcom/itextpdf/layout/renderer/DocumentRenderer;)V
    .locals 0
    .param p1, "documentRenderer"    # Lcom/itextpdf/layout/renderer/DocumentRenderer;

    .line 143
    iput-object p1, p0, Lcom/itextpdf/layout/Document;->rootRenderer:Lcom/itextpdf/layout/renderer/RootRenderer;

    .line 144
    return-void
.end method

.method public setRightMargin(F)V
    .locals 2
    .param p1, "rightMargin"    # F

    .line 224
    const/16 v0, 0x2d

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/Document;->setProperty(ILjava/lang/Object;)V

    .line 225
    return-void
.end method

.method public setTopMargin(F)V
    .locals 2
    .param p1, "topMargin"    # F

    .line 243
    const/16 v0, 0x2e

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/Document;->setProperty(ILjava/lang/Object;)V

    .line 244
    return-void
.end method
