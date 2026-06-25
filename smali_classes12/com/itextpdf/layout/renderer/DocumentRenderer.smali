.class public Lcom/itextpdf/layout/renderer/DocumentRenderer;
.super Lcom/itextpdf/layout/renderer/RootRenderer;
.source "DocumentRenderer.java"


# instance fields
.field protected document:Lcom/itextpdf/layout/Document;

.field protected targetCounterHandler:Lcom/itextpdf/layout/renderer/TargetCounterHandler;

.field protected wrappedContentPage:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/itextpdf/layout/Document;)V
    .locals 1
    .param p1, "document"    # Lcom/itextpdf/layout/Document;

    .line 52
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/layout/renderer/DocumentRenderer;-><init>(Lcom/itextpdf/layout/Document;Z)V

    .line 53
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/layout/Document;Z)V
    .locals 1
    .param p1, "document"    # Lcom/itextpdf/layout/Document;
    .param p2, "immediateFlush"    # Z

    .line 55
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/RootRenderer;-><init>()V

    .line 48
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/DocumentRenderer;->wrappedContentPage:Ljava/util/List;

    .line 49
    new-instance v0, Lcom/itextpdf/layout/renderer/TargetCounterHandler;

    invoke-direct {v0}, Lcom/itextpdf/layout/renderer/TargetCounterHandler;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/DocumentRenderer;->targetCounterHandler:Lcom/itextpdf/layout/renderer/TargetCounterHandler;

    .line 56
    iput-object p1, p0, Lcom/itextpdf/layout/renderer/DocumentRenderer;->document:Lcom/itextpdf/layout/Document;

    .line 57
    iput-boolean p2, p0, Lcom/itextpdf/layout/renderer/DocumentRenderer;->immediateFlush:Z

    .line 58
    iput-object p1, p0, Lcom/itextpdf/layout/renderer/DocumentRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    .line 59
    return-void
.end method

.method private getCurrentPageEffectiveArea(Lcom/itextpdf/kernel/geom/PageSize;)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 9
    .param p1, "pageSize"    # Lcom/itextpdf/kernel/geom/PageSize;

    .line 193
    const/16 v0, 0x2c

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/DocumentRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 194
    .local v0, "leftMargin":F
    const/16 v1, 0x2b

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/DocumentRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    .line 195
    .local v1, "bottomMargin":F
    const/16 v2, 0x2e

    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/DocumentRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    .line 196
    .local v2, "topMargin":F
    const/16 v3, 0x2d

    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/renderer/DocumentRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    .line 197
    .local v3, "rightMargin":F
    new-instance v4, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/PageSize;->getLeft()F

    move-result v5

    add-float/2addr v5, v0

    .line 198
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/PageSize;->getBottom()F

    move-result v6

    add-float/2addr v6, v1

    .line 199
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/PageSize;->getWidth()F

    move-result v7

    sub-float/2addr v7, v0

    sub-float/2addr v7, v3

    .line 200
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/PageSize;->getHeight()F

    move-result v8

    sub-float/2addr v8, v1

    sub-float/2addr v8, v2

    invoke-direct {v4, v5, v6, v7, v8}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    .line 197
    return-object v4
.end method

.method private possiblyFlushPreviousPage(I)V
    .locals 2
    .param p1, "currentPageNumber"    # I

    .line 204
    iget-boolean v0, p0, Lcom/itextpdf/layout/renderer/DocumentRenderer;->immediateFlush:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    if-le p1, v0, :cond_0

    .line 207
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/DocumentRenderer;->document:Lcom/itextpdf/layout/Document;

    invoke-virtual {v0}, Lcom/itextpdf/layout/Document;->getPdfDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    add-int/lit8 v1, p1, -0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfPage;->flush()V

    .line 209
    :cond_0
    return-void
.end method


# virtual methods
.method protected addNewPage(Lcom/itextpdf/kernel/geom/PageSize;)Lcom/itextpdf/kernel/geom/PageSize;
    .locals 1
    .param p1, "customPageSize"    # Lcom/itextpdf/kernel/geom/PageSize;

    .line 168
    nop

    .line 171
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/DocumentRenderer;->document:Lcom/itextpdf/layout/Document;

    .line 168
    if-eqz p1, :cond_0

    .line 169
    invoke-virtual {v0}, Lcom/itextpdf/layout/Document;->getPdfDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->addNewPage(Lcom/itextpdf/kernel/geom/PageSize;)Lcom/itextpdf/kernel/pdf/PdfPage;

    goto :goto_0

    .line 171
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/layout/Document;->getPdfDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->addNewPage()Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 173
    :goto_0
    if-eqz p1, :cond_1

    move-object v0, p1

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/DocumentRenderer;->document:Lcom/itextpdf/layout/Document;

    invoke-virtual {v0}, Lcom/itextpdf/layout/Document;->getPdfDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDefaultPageSize()Lcom/itextpdf/kernel/geom/PageSize;

    move-result-object v0

    :goto_1
    return-object v0
.end method

.method protected ensureDocumentHasNPages(ILcom/itextpdf/kernel/geom/PageSize;)Lcom/itextpdf/kernel/geom/PageSize;
    .locals 2
    .param p1, "n"    # I
    .param p2, "customPageSize"    # Lcom/itextpdf/kernel/geom/PageSize;

    .line 185
    const/4 v0, 0x0

    .line 186
    .local v0, "lastPageSize":Lcom/itextpdf/kernel/geom/PageSize;
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/DocumentRenderer;->document:Lcom/itextpdf/layout/Document;

    invoke-virtual {v1}, Lcom/itextpdf/layout/Document;->getPdfDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v1

    if-ge v1, p1, :cond_0

    .line 187
    invoke-virtual {p0, p2}, Lcom/itextpdf/layout/renderer/DocumentRenderer;->addNewPage(Lcom/itextpdf/kernel/geom/PageSize;)Lcom/itextpdf/kernel/geom/PageSize;

    move-result-object v0

    goto :goto_0

    .line 189
    :cond_0
    return-object v0
.end method

.method protected flushSingleRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)V
    .locals 8
    .param p1, "resultRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 127
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/DocumentRenderer;->document:Lcom/itextpdf/layout/Document;

    invoke-virtual {v0}, Lcom/itextpdf/layout/Document;->getPdfDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/layout/renderer/DocumentRenderer;->linkRenderToDocument(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 129
    const/16 v0, 0x35

    invoke-interface {p1, v0}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/Transform;

    .line 130
    .local v0, "transformProp":Lcom/itextpdf/layout/properties/Transform;
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/DocumentRenderer;->waitingDrawingElements:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 131
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/DocumentRenderer;->waitingDrawingElements:Ljava/util/List;

    invoke-static {p1, v0, v1}, Lcom/itextpdf/layout/renderer/DocumentRenderer;->processWaitingDrawing(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/properties/Transform;Ljava/util/List;)V

    .line 132
    invoke-static {p1}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v1

    if-nez v1, :cond_0

    if-eqz v0, :cond_1

    .line 133
    :cond_0
    return-void

    .line 137
    :cond_1
    invoke-interface {p1}, Lcom/itextpdf/layout/renderer/IRenderer;->isFlushed()Z

    move-result v1

    if-nez v1, :cond_5

    invoke-interface {p1}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 138
    invoke-interface {p1}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v1

    .line 140
    .local v1, "pageNum":I
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/DocumentRenderer;->document:Lcom/itextpdf/layout/Document;

    invoke-virtual {v2}, Lcom/itextpdf/layout/Document;->getPdfDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v2

    .line 141
    .local v2, "pdfDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    const/4 v3, 0x0

    invoke-virtual {p0, v1, v3}, Lcom/itextpdf/layout/renderer/DocumentRenderer;->ensureDocumentHasNPages(ILcom/itextpdf/kernel/geom/PageSize;)Lcom/itextpdf/kernel/geom/PageSize;

    .line 142
    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v3

    .line 143
    .local v3, "correspondingPage":Lcom/itextpdf/kernel/pdf/PdfPage;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfPage;->isFlushed()Z

    move-result v4

    if-nez v4, :cond_4

    .line 147
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getReader()Lcom/itextpdf/kernel/pdf/PdfReader;

    move-result-object v4

    if-eqz v4, :cond_2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getWriter()Lcom/itextpdf/kernel/pdf/PdfWriter;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 148
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfPage;->getContentStreamCount()I

    move-result v4

    if-lez v4, :cond_2

    .line 149
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfPage;->getLastContentStream()Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfStream;->getLength()I

    move-result v4

    if-lez v4, :cond_2

    iget-object v4, p0, Lcom/itextpdf/layout/renderer/DocumentRenderer;->wrappedContentPage:Ljava/util/List;

    .line 150
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v4

    if-lt v4, v1, :cond_2

    const/4 v4, 0x1

    goto :goto_0

    :cond_2
    const/4 v4, 0x0

    .line 151
    .local v4, "wrapOldContent":Z
    :goto_0
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/DocumentRenderer;->wrappedContentPage:Ljava/util/List;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 153
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->isTagged()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 154
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getTagStructureContext()Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getAutoTaggingPointer()Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    move-result-object v5

    invoke-virtual {v5, v3}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->setPageForTagging(Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 156
    :cond_3
    new-instance v5, Lcom/itextpdf/layout/renderer/DrawContext;

    new-instance v6, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-direct {v6, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;-><init>(Lcom/itextpdf/kernel/pdf/PdfPage;Z)V

    .line 157
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->isTagged()Z

    move-result v7

    invoke-direct {v5, v2, v6, v7}, Lcom/itextpdf/layout/renderer/DrawContext;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;Z)V

    .line 156
    invoke-interface {p1, v5}, Lcom/itextpdf/layout/renderer/IRenderer;->draw(Lcom/itextpdf/layout/renderer/DrawContext;)V

    goto :goto_1

    .line 144
    .end local v4    # "wrapOldContent":Z
    :cond_4
    new-instance v4, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v5, "Cannot draw elements on already flushed pages."

    invoke-direct {v4, v5}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 159
    .end local v1    # "pageNum":I
    .end local v2    # "pdfDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local v3    # "correspondingPage":Lcom/itextpdf/kernel/pdf/PdfPage;
    :cond_5
    :goto_1
    return-void
.end method

.method public getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 3

    .line 91
    new-instance v0, Lcom/itextpdf/layout/renderer/DocumentRenderer;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/DocumentRenderer;->document:Lcom/itextpdf/layout/Document;

    iget-boolean v2, p0, Lcom/itextpdf/layout/renderer/DocumentRenderer;->immediateFlush:Z

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/renderer/DocumentRenderer;-><init>(Lcom/itextpdf/layout/Document;Z)V

    .line 92
    .local v0, "renderer":Lcom/itextpdf/layout/renderer/DocumentRenderer;
    new-instance v1, Lcom/itextpdf/layout/renderer/TargetCounterHandler;

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/DocumentRenderer;->targetCounterHandler:Lcom/itextpdf/layout/renderer/TargetCounterHandler;

    invoke-direct {v1, v2}, Lcom/itextpdf/layout/renderer/TargetCounterHandler;-><init>(Lcom/itextpdf/layout/renderer/TargetCounterHandler;)V

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/DocumentRenderer;->targetCounterHandler:Lcom/itextpdf/layout/renderer/TargetCounterHandler;

    .line 93
    return-object v0
.end method

.method public getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;
    .locals 2

    .line 81
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not applicable for DocumentRenderer"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getTargetCounterHandler()Lcom/itextpdf/layout/renderer/TargetCounterHandler;
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/DocumentRenderer;->targetCounterHandler:Lcom/itextpdf/layout/renderer/TargetCounterHandler;

    return-object v0
.end method

.method public isRelayoutRequired()Z
    .locals 1

    .line 76
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/DocumentRenderer;->targetCounterHandler:Lcom/itextpdf/layout/renderer/TargetCounterHandler;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TargetCounterHandler;->isRelayoutRequired()Z

    move-result v0

    return v0
.end method

.method protected updateCurrentArea(Lcom/itextpdf/layout/layout/LayoutResult;)Lcom/itextpdf/layout/layout/LayoutArea;
    .locals 7
    .param p1, "overflowResult"    # Lcom/itextpdf/layout/layout/LayoutResult;

    .line 97
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/DocumentRenderer;->flushWaitingDrawingElements(Z)V

    .line 98
    const/16 v1, 0x6c

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/DocumentRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;

    .line 99
    .local v1, "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    if-eqz v1, :cond_0

    .line 100
    invoke-virtual {v1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->releaseFinishedHints()V

    .line 102
    :cond_0
    const/4 v2, 0x0

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutResult;->getAreaBreak()Lcom/itextpdf/layout/element/AreaBreak;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 103
    invoke-virtual {p1}, Lcom/itextpdf/layout/layout/LayoutResult;->getAreaBreak()Lcom/itextpdf/layout/element/AreaBreak;

    move-result-object v3

    goto :goto_0

    :cond_1
    move-object v3, v2

    .line 104
    .local v3, "areaBreak":Lcom/itextpdf/layout/element/AreaBreak;
    :goto_0
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/DocumentRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    if-nez v4, :cond_2

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/DocumentRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/RootLayoutArea;->getPageNumber()I

    move-result v0

    .line 105
    .local v0, "currentPageNumber":I
    :goto_1
    if-eqz v3, :cond_3

    invoke-virtual {v3}, Lcom/itextpdf/layout/element/AreaBreak;->getType()Lcom/itextpdf/layout/properties/AreaBreakType;

    move-result-object v4

    sget-object v5, Lcom/itextpdf/layout/properties/AreaBreakType;->LAST_PAGE:Lcom/itextpdf/layout/properties/AreaBreakType;

    if-ne v4, v5, :cond_3

    .line 106
    :goto_2
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/DocumentRenderer;->document:Lcom/itextpdf/layout/Document;

    invoke-virtual {v4}, Lcom/itextpdf/layout/Document;->getPdfDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v4

    if-ge v0, v4, :cond_4

    .line 107
    invoke-direct {p0, v0}, Lcom/itextpdf/layout/renderer/DocumentRenderer;->possiblyFlushPreviousPage(I)V

    .line 108
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 111
    :cond_3
    invoke-direct {p0, v0}, Lcom/itextpdf/layout/renderer/DocumentRenderer;->possiblyFlushPreviousPage(I)V

    .line 112
    add-int/lit8 v0, v0, 0x1

    .line 114
    :cond_4
    if-eqz v3, :cond_5

    invoke-virtual {v3}, Lcom/itextpdf/layout/element/AreaBreak;->getPageSize()Lcom/itextpdf/kernel/geom/PageSize;

    move-result-object v2

    .line 115
    .local v2, "customPageSize":Lcom/itextpdf/kernel/geom/PageSize;
    :cond_5
    :goto_3
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/DocumentRenderer;->document:Lcom/itextpdf/layout/Document;

    invoke-virtual {v4}, Lcom/itextpdf/layout/Document;->getPdfDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v4

    if-lt v4, v0, :cond_6

    iget-object v4, p0, Lcom/itextpdf/layout/renderer/DocumentRenderer;->document:Lcom/itextpdf/layout/Document;

    .line 116
    invoke-virtual {v4}, Lcom/itextpdf/layout/Document;->getPdfDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v4

    invoke-virtual {v4, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfPage;->isFlushed()Z

    move-result v4

    if-eqz v4, :cond_6

    .line 117
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 119
    :cond_6
    invoke-virtual {p0, v0, v2}, Lcom/itextpdf/layout/renderer/DocumentRenderer;->ensureDocumentHasNPages(ILcom/itextpdf/kernel/geom/PageSize;)Lcom/itextpdf/kernel/geom/PageSize;

    move-result-object v4

    .line 120
    .local v4, "lastPageSize":Lcom/itextpdf/kernel/geom/PageSize;
    if-nez v4, :cond_7

    .line 121
    new-instance v5, Lcom/itextpdf/kernel/geom/PageSize;

    iget-object v6, p0, Lcom/itextpdf/layout/renderer/DocumentRenderer;->document:Lcom/itextpdf/layout/Document;

    invoke-virtual {v6}, Lcom/itextpdf/layout/Document;->getPdfDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v6

    invoke-virtual {v6, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfPage;->getTrimBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/itextpdf/kernel/geom/PageSize;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    move-object v4, v5

    .line 123
    :cond_7
    new-instance v5, Lcom/itextpdf/layout/layout/RootLayoutArea;

    invoke-direct {p0, v4}, Lcom/itextpdf/layout/renderer/DocumentRenderer;->getCurrentPageEffectiveArea(Lcom/itextpdf/kernel/geom/PageSize;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v6

    invoke-direct {v5, v0, v6}, Lcom/itextpdf/layout/layout/RootLayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    iput-object v5, p0, Lcom/itextpdf/layout/renderer/DocumentRenderer;->currentArea:Lcom/itextpdf/layout/layout/RootLayoutArea;

    return-object v5
.end method
