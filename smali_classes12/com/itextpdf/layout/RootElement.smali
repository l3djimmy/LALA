.class public abstract Lcom/itextpdf/layout/RootElement;
.super Lcom/itextpdf/layout/ElementPropertyContainer;
.source "RootElement.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/itextpdf/layout/IPropertyContainer;",
        ">",
        "Lcom/itextpdf/layout/ElementPropertyContainer<",
        "TT;>;",
        "Ljava/io/Closeable;"
    }
.end annotation


# instance fields
.field protected childElements:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/element/IElement;",
            ">;"
        }
    .end annotation
.end field

.field protected defaultFont:Lcom/itextpdf/kernel/font/PdfFont;

.field protected defaultFontProvider:Lcom/itextpdf/layout/font/FontProvider;

.field private defaultLayoutTaggingHelper:Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;

.field protected defaultSplitCharacters:Lcom/itextpdf/layout/splitting/ISplitCharacters;

.field protected immediateFlush:Z

.field protected pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

.field protected rootRenderer:Lcom/itextpdf/layout/renderer/RootRenderer;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 62
    .local p0, "this":Lcom/itextpdf/layout/RootElement;, "Lcom/itextpdf/layout/RootElement<TT;>;"
    invoke-direct {p0}, Lcom/itextpdf/layout/ElementPropertyContainer;-><init>()V

    .line 64
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/layout/RootElement;->immediateFlush:Z

    .line 67
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/RootElement;->childElements:Ljava/util/List;

    return-void
.end method

.method private addElement(Lcom/itextpdf/layout/element/IElement;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 2
    .param p1, "element"    # Lcom/itextpdf/layout/element/IElement;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/element/IElement;",
            ")TT;"
        }
    .end annotation

    .line 356
    .local p0, "this":Lcom/itextpdf/layout/RootElement;, "Lcom/itextpdf/layout/RootElement<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/layout/RootElement;->childElements:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 357
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/RootElement;->createAndAddRendererSubTree(Lcom/itextpdf/layout/element/IElement;)V

    .line 358
    iget-boolean v0, p0, Lcom/itextpdf/layout/RootElement;->immediateFlush:Z

    if-eqz v0, :cond_0

    .line 359
    iget-object v0, p0, Lcom/itextpdf/layout/RootElement;->childElements:Ljava/util/List;

    iget-object v1, p0, Lcom/itextpdf/layout/RootElement;->childElements:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 361
    :cond_0
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v0
.end method

.method private initTaggingHelperIfNeeded()Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    .locals 3

    .line 352
    .local p0, "this":Lcom/itextpdf/layout/RootElement;, "Lcom/itextpdf/layout/RootElement<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/layout/RootElement;->defaultLayoutTaggingHelper:Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/layout/RootElement;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->isTagged()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;

    iget-object v1, p0, Lcom/itextpdf/layout/RootElement;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    iget-boolean v2, p0, Lcom/itextpdf/layout/RootElement;->immediateFlush:Z

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Z)V

    iput-object v0, p0, Lcom/itextpdf/layout/RootElement;->defaultLayoutTaggingHelper:Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/RootElement;->defaultLayoutTaggingHelper:Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;

    :goto_0
    return-object v0
.end method

.method private static traverseAndCallIso(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/layout/renderer/IRenderer;)V
    .locals 3
    .param p0, "pdfDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 365
    if-nez p1, :cond_0

    .line 366
    return-void

    .line 368
    :cond_0
    sget-object v0, Lcom/itextpdf/kernel/pdf/IsoKey;->LAYOUT:Lcom/itextpdf/kernel/pdf/IsoKey;

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkIsoConformance(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/IsoKey;)V

    .line 369
    invoke-interface {p1}, Lcom/itextpdf/layout/renderer/IRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v0

    .line 370
    .local v0, "renderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    if-nez v0, :cond_1

    .line 371
    return-void

    .line 373
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 374
    .local v2, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-static {p0, v2}, Lcom/itextpdf/layout/RootElement;->traverseAndCallIso(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 375
    .end local v2    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_0

    .line 376
    :cond_2
    return-void
.end method


# virtual methods
.method public add(Lcom/itextpdf/layout/element/IBlockElement;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 1
    .param p1, "element"    # Lcom/itextpdf/layout/element/IBlockElement;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/element/IBlockElement;",
            ")TT;"
        }
    .end annotation

    .line 85
    .local p0, "this":Lcom/itextpdf/layout/RootElement;, "Lcom/itextpdf/layout/RootElement<TT;>;"
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/RootElement;->addElement(Lcom/itextpdf/layout/element/IElement;)Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v0

    return-object v0
.end method

.method public add(Lcom/itextpdf/layout/element/Image;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 1
    .param p1, "image"    # Lcom/itextpdf/layout/element/Image;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/element/Image;",
            ")TT;"
        }
    .end annotation

    .line 96
    .local p0, "this":Lcom/itextpdf/layout/RootElement;, "Lcom/itextpdf/layout/RootElement<TT;>;"
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/RootElement;->addElement(Lcom/itextpdf/layout/element/IElement;)Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v0

    return-object v0
.end method

.method protected createAndAddRendererSubTree(Lcom/itextpdf/layout/element/IElement;)V
    .locals 4
    .param p1, "element"    # Lcom/itextpdf/layout/element/IElement;

    .line 342
    .local p0, "this":Lcom/itextpdf/layout/RootElement;, "Lcom/itextpdf/layout/RootElement<TT;>;"
    invoke-interface {p1}, Lcom/itextpdf/layout/element/IElement;->createRendererSubTree()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    .line 343
    .local v0, "rendererSubTreeRoot":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-direct {p0}, Lcom/itextpdf/layout/RootElement;->initTaggingHelperIfNeeded()Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;

    move-result-object v1

    .line 344
    .local v1, "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    if-eqz v1, :cond_0

    .line 345
    iget-object v2, p0, Lcom/itextpdf/layout/RootElement;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getTagStructureContext()Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getAutoTaggingPointer()Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    move-result-object v2

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->addKidsHint(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;Ljava/lang/Iterable;)V

    .line 347
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/layout/RootElement;->ensureRootRendererNotNull()Lcom/itextpdf/layout/renderer/RootRenderer;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/itextpdf/layout/renderer/RootRenderer;->addChild(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 348
    iget-object v2, p0, Lcom/itextpdf/layout/RootElement;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-static {v2, v0}, Lcom/itextpdf/layout/RootElement;->traverseAndCallIso(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 349
    return-void
.end method

.method public deleteOwnProperty(I)V
    .locals 2
    .param p1, "property"    # I

    .line 181
    .local p0, "this":Lcom/itextpdf/layout/RootElement;, "Lcom/itextpdf/layout/RootElement<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/layout/RootElement;->properties:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    return-void
.end method

.method protected abstract ensureRootRendererNotNull()Lcom/itextpdf/layout/renderer/RootRenderer;
.end method

.method public getDefaultProperty(I)Ljava/lang/Object;
    .locals 3
    .param p1, "property"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            ">(I)TT1;"
        }
    .end annotation

    .line 145
    .local p0, "this":Lcom/itextpdf/layout/RootElement;, "Lcom/itextpdf/layout/RootElement<TT;>;"
    sparse-switch p1, :sswitch_data_0

    .line 172
    const/4 v0, 0x0

    return-object v0

    .line 164
    :sswitch_0
    :try_start_0
    invoke-direct {p0}, Lcom/itextpdf/layout/RootElement;->initTaggingHelperIfNeeded()Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;

    move-result-object v0

    return-object v0

    .line 152
    :sswitch_1
    iget-object v0, p0, Lcom/itextpdf/layout/RootElement;->defaultFontProvider:Lcom/itextpdf/layout/font/FontProvider;

    if-nez v0, :cond_0

    .line 153
    new-instance v0, Lcom/itextpdf/layout/font/FontProvider;

    invoke-direct {v0}, Lcom/itextpdf/layout/font/FontProvider;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/RootElement;->defaultFontProvider:Lcom/itextpdf/layout/font/FontProvider;

    .line 155
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/RootElement;->defaultFontProvider:Lcom/itextpdf/layout/font/FontProvider;

    return-object v0

    .line 168
    :sswitch_2
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    return-object v0

    .line 166
    :sswitch_3
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    .line 157
    :sswitch_4
    iget-object v0, p0, Lcom/itextpdf/layout/RootElement;->defaultSplitCharacters:Lcom/itextpdf/layout/splitting/ISplitCharacters;

    if-nez v0, :cond_1

    .line 158
    new-instance v0, Lcom/itextpdf/layout/splitting/DefaultSplitCharacters;

    invoke-direct {v0}, Lcom/itextpdf/layout/splitting/DefaultSplitCharacters;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/RootElement;->defaultSplitCharacters:Lcom/itextpdf/layout/splitting/ISplitCharacters;

    .line 160
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/layout/RootElement;->defaultSplitCharacters:Lcom/itextpdf/layout/splitting/ISplitCharacters;

    return-object v0

    .line 170
    :sswitch_5
    const/high16 v0, 0x3f400000    # 0.75f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    return-object v0

    .line 162
    :sswitch_6
    const/high16 v0, 0x41400000    # 12.0f

    invoke-static {v0}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    return-object v0

    .line 147
    :sswitch_7
    iget-object v0, p0, Lcom/itextpdf/layout/RootElement;->defaultFont:Lcom/itextpdf/kernel/font/PdfFont;

    if-nez v0, :cond_2

    .line 148
    invoke-static {}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createFont()Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/layout/RootElement;->defaultFont:Lcom/itextpdf/kernel/font/PdfFont;

    .line 150
    :cond_2
    iget-object v0, p0, Lcom/itextpdf/layout/RootElement;->defaultFont:Lcom/itextpdf/kernel/font/PdfFont;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 174
    :catch_0
    move-exception v0

    .line 175
    .local v0, "exc":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :sswitch_data_0
    .sparse-switch
        0x14 -> :sswitch_7
        0x18 -> :sswitch_6
        0x3d -> :sswitch_5
        0x3e -> :sswitch_4
        0x47 -> :sswitch_3
        0x48 -> :sswitch_2
        0x5b -> :sswitch_1
        0x6c -> :sswitch_0
    .end sparse-switch
.end method

.method public getFontProvider()Lcom/itextpdf/layout/font/FontProvider;
    .locals 2

    .line 105
    .local p0, "this":Lcom/itextpdf/layout/RootElement;, "Lcom/itextpdf/layout/RootElement<TT;>;"
    const/16 v0, 0x5b

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/RootElement;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    .line 106
    .local v0, "fontProvider":Ljava/lang/Object;
    instance-of v1, v0, Lcom/itextpdf/layout/font/FontProvider;

    if-eqz v1, :cond_0

    .line 107
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/layout/font/FontProvider;

    return-object v1

    .line 109
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public getOwnProperty(I)Ljava/lang/Object;
    .locals 2
    .param p1, "property"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            ">(I)TT1;"
        }
    .end annotation

    .line 139
    .local p0, "this":Lcom/itextpdf/layout/RootElement;, "Lcom/itextpdf/layout/RootElement<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/layout/RootElement;->properties:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getProperty(I)Ljava/lang/Object;
    .locals 1
    .param p1, "property"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            ">(I)TT1;"
        }
    .end annotation

    .line 134
    .local p0, "this":Lcom/itextpdf/layout/RootElement;, "Lcom/itextpdf/layout/RootElement<TT;>;"
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/RootElement;->getOwnProperty(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getRenderer()Lcom/itextpdf/layout/renderer/RootRenderer;
    .locals 1

    .line 197
    .local p0, "this":Lcom/itextpdf/layout/RootElement;, "Lcom/itextpdf/layout/RootElement<TT;>;"
    invoke-virtual {p0}, Lcom/itextpdf/layout/RootElement;->ensureRootRendererNotNull()Lcom/itextpdf/layout/renderer/RootRenderer;

    move-result-object v0

    return-object v0
.end method

.method public hasOwnProperty(I)Z
    .locals 2
    .param p1, "property"    # I

    .line 129
    .local p0, "this":Lcom/itextpdf/layout/RootElement;, "Lcom/itextpdf/layout/RootElement<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/layout/RootElement;->properties:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public hasProperty(I)Z
    .locals 1
    .param p1, "property"    # I

    .line 124
    .local p0, "this":Lcom/itextpdf/layout/RootElement;, "Lcom/itextpdf/layout/RootElement<TT;>;"
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/RootElement;->hasOwnProperty(I)Z

    move-result v0

    return v0
.end method

.method public setFontProvider(Lcom/itextpdf/layout/font/FontProvider;)V
    .locals 1
    .param p1, "fontProvider"    # Lcom/itextpdf/layout/font/FontProvider;

    .line 119
    .local p0, "this":Lcom/itextpdf/layout/RootElement;, "Lcom/itextpdf/layout/RootElement<TT;>;"
    const/16 v0, 0x5b

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/RootElement;->setProperty(ILjava/lang/Object;)V

    .line 120
    return-void
.end method

.method public setProperty(ILjava/lang/Object;)V
    .locals 2
    .param p1, "property"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .line 186
    .local p0, "this":Lcom/itextpdf/layout/RootElement;, "Lcom/itextpdf/layout/RootElement<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/layout/RootElement;->properties:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    return-void
.end method

.method public showTextAligned(Lcom/itextpdf/layout/element/Paragraph;FFILcom/itextpdf/layout/properties/TextAlignment;Lcom/itextpdf/layout/properties/VerticalAlignment;F)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 7
    .param p1, "p"    # Lcom/itextpdf/layout/element/Paragraph;
    .param p2, "x"    # F
    .param p3, "y"    # F
    .param p4, "pageNumber"    # I
    .param p5, "textAlign"    # Lcom/itextpdf/layout/properties/TextAlignment;
    .param p6, "vertAlign"    # Lcom/itextpdf/layout/properties/VerticalAlignment;
    .param p7, "radAngle"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/element/Paragraph;",
            "FFI",
            "Lcom/itextpdf/layout/properties/TextAlignment;",
            "Lcom/itextpdf/layout/properties/VerticalAlignment;",
            "F)TT;"
        }
    .end annotation

    .line 302
    .local p0, "this":Lcom/itextpdf/layout/RootElement;, "Lcom/itextpdf/layout/RootElement<TT;>;"
    new-instance v0, Lcom/itextpdf/layout/element/Div;

    invoke-direct {v0}, Lcom/itextpdf/layout/element/Div;-><init>()V

    .line 303
    .local v0, "div":Lcom/itextpdf/layout/element/Div;
    invoke-virtual {v0, p5}, Lcom/itextpdf/layout/element/Div;->setTextAlignment(Lcom/itextpdf/layout/properties/TextAlignment;)Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/element/Div;

    invoke-virtual {v1, p6}, Lcom/itextpdf/layout/element/Div;->setVerticalAlignment(Lcom/itextpdf/layout/properties/VerticalAlignment;)Lcom/itextpdf/layout/element/IElement;

    .line 304
    const/4 v1, 0x0

    cmpl-float v2, p7, v1

    if-eqz v2, :cond_0

    .line 305
    invoke-virtual {v0, p7}, Lcom/itextpdf/layout/element/Div;->setRotationAngle(F)Lcom/itextpdf/layout/element/IElement;

    .line 307
    :cond_0
    const/16 v2, 0x3a

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/itextpdf/layout/element/Div;->setProperty(ILjava/lang/Object;)V

    .line 308
    const/16 v2, 0x3b

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/itextpdf/layout/element/Div;->setProperty(ILjava/lang/Object;)V

    .line 310
    const v2, 0x459c4000    # 5000.0f

    .line 311
    .local v2, "divSize":F
    move v3, p2

    .local v3, "divX":F
    move v4, p3

    .line 312
    .local v4, "divY":F
    sget-object v5, Lcom/itextpdf/layout/properties/TextAlignment;->CENTER:Lcom/itextpdf/layout/properties/TextAlignment;

    const/high16 v6, 0x40000000    # 2.0f

    if-ne p5, v5, :cond_1

    .line 313
    div-float v5, v2, v6

    sub-float v3, p2, v5

    .line 314
    sget-object v5, Lcom/itextpdf/layout/properties/HorizontalAlignment;->CENTER:Lcom/itextpdf/layout/properties/HorizontalAlignment;

    invoke-virtual {p1, v5}, Lcom/itextpdf/layout/element/Paragraph;->setHorizontalAlignment(Lcom/itextpdf/layout/properties/HorizontalAlignment;)Lcom/itextpdf/layout/IPropertyContainer;

    goto :goto_0

    .line 315
    :cond_1
    sget-object v5, Lcom/itextpdf/layout/properties/TextAlignment;->RIGHT:Lcom/itextpdf/layout/properties/TextAlignment;

    if-ne p5, v5, :cond_2

    .line 316
    sub-float v3, p2, v2

    .line 317
    sget-object v5, Lcom/itextpdf/layout/properties/HorizontalAlignment;->RIGHT:Lcom/itextpdf/layout/properties/HorizontalAlignment;

    invoke-virtual {p1, v5}, Lcom/itextpdf/layout/element/Paragraph;->setHorizontalAlignment(Lcom/itextpdf/layout/properties/HorizontalAlignment;)Lcom/itextpdf/layout/IPropertyContainer;

    .line 320
    :cond_2
    :goto_0
    sget-object v5, Lcom/itextpdf/layout/properties/VerticalAlignment;->MIDDLE:Lcom/itextpdf/layout/properties/VerticalAlignment;

    if-ne p6, v5, :cond_3

    .line 321
    div-float v5, v2, v6

    sub-float v4, p3, v5

    goto :goto_1

    .line 322
    :cond_3
    sget-object v5, Lcom/itextpdf/layout/properties/VerticalAlignment;->TOP:Lcom/itextpdf/layout/properties/VerticalAlignment;

    if-ne p6, v5, :cond_4

    .line 323
    sub-float v4, p3, v2

    .line 326
    :cond_4
    :goto_1
    if-nez p4, :cond_5

    .line 327
    const/4 p4, 0x1

    .line 328
    :cond_5
    invoke-virtual {v0, p4, v3, v4, v2}, Lcom/itextpdf/layout/element/Div;->setFixedPosition(IFFF)Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/layout/element/Div;

    invoke-virtual {v5, v2}, Lcom/itextpdf/layout/element/Div;->setMinHeight(F)Lcom/itextpdf/layout/element/IElement;

    .line 329
    const/16 v5, 0x21

    invoke-virtual {p1, v5}, Lcom/itextpdf/layout/element/Paragraph;->getProperty(I)Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_6

    .line 330
    const/high16 v5, 0x3f800000    # 1.0f

    invoke-virtual {p1, v5}, Lcom/itextpdf/layout/element/Paragraph;->setMultipliedLeading(F)Lcom/itextpdf/layout/element/Paragraph;

    .line 332
    :cond_6
    invoke-virtual {p1, v1, v1, v1, v1}, Lcom/itextpdf/layout/element/Paragraph;->setMargins(FFFF)Lcom/itextpdf/layout/element/IElement;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/element/IBlockElement;

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/element/Div;->add(Lcom/itextpdf/layout/element/IBlockElement;)Lcom/itextpdf/layout/element/Div;

    .line 333
    invoke-virtual {v0}, Lcom/itextpdf/layout/element/Div;->getAccessibilityProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    move-result-object v1

    const-string v5, "Artifact"

    invoke-virtual {v1, v5}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->setRole(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    .line 334
    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/RootElement;->add(Lcom/itextpdf/layout/element/IBlockElement;)Lcom/itextpdf/layout/IPropertyContainer;

    .line 336
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/IPropertyContainer;

    return-object v1
.end method

.method public showTextAligned(Lcom/itextpdf/layout/element/Paragraph;FFLcom/itextpdf/layout/properties/TextAlignment;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 9
    .param p1, "p"    # Lcom/itextpdf/layout/element/Paragraph;
    .param p2, "x"    # F
    .param p3, "y"    # F
    .param p4, "textAlign"    # Lcom/itextpdf/layout/properties/TextAlignment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/element/Paragraph;",
            "FF",
            "Lcom/itextpdf/layout/properties/TextAlignment;",
            ")TT;"
        }
    .end annotation

    .line 270
    .local p0, "this":Lcom/itextpdf/layout/RootElement;, "Lcom/itextpdf/layout/RootElement<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/layout/RootElement;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v5

    sget-object v7, Lcom/itextpdf/layout/properties/VerticalAlignment;->BOTTOM:Lcom/itextpdf/layout/properties/VerticalAlignment;

    const/4 v8, 0x0

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move-object v6, p4

    .end local p1    # "p":Lcom/itextpdf/layout/element/Paragraph;
    .end local p2    # "x":F
    .end local p3    # "y":F
    .end local p4    # "textAlign":Lcom/itextpdf/layout/properties/TextAlignment;
    .local v2, "p":Lcom/itextpdf/layout/element/Paragraph;
    .local v3, "x":F
    .local v4, "y":F
    .local v6, "textAlign":Lcom/itextpdf/layout/properties/TextAlignment;
    invoke-virtual/range {v1 .. v8}, Lcom/itextpdf/layout/RootElement;->showTextAligned(Lcom/itextpdf/layout/element/Paragraph;FFILcom/itextpdf/layout/properties/TextAlignment;Lcom/itextpdf/layout/properties/VerticalAlignment;F)Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object p1

    return-object p1
.end method

.method public showTextAligned(Lcom/itextpdf/layout/element/Paragraph;FFLcom/itextpdf/layout/properties/TextAlignment;Lcom/itextpdf/layout/properties/VerticalAlignment;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 9
    .param p1, "p"    # Lcom/itextpdf/layout/element/Paragraph;
    .param p2, "x"    # F
    .param p3, "y"    # F
    .param p4, "textAlign"    # Lcom/itextpdf/layout/properties/TextAlignment;
    .param p5, "vertAlign"    # Lcom/itextpdf/layout/properties/VerticalAlignment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/element/Paragraph;",
            "FF",
            "Lcom/itextpdf/layout/properties/TextAlignment;",
            "Lcom/itextpdf/layout/properties/VerticalAlignment;",
            ")TT;"
        }
    .end annotation

    .line 285
    .local p0, "this":Lcom/itextpdf/layout/RootElement;, "Lcom/itextpdf/layout/RootElement<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/layout/RootElement;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v5

    const/4 v8, 0x0

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move-object v6, p4

    move-object v7, p5

    .end local p1    # "p":Lcom/itextpdf/layout/element/Paragraph;
    .end local p2    # "x":F
    .end local p3    # "y":F
    .end local p4    # "textAlign":Lcom/itextpdf/layout/properties/TextAlignment;
    .end local p5    # "vertAlign":Lcom/itextpdf/layout/properties/VerticalAlignment;
    .local v2, "p":Lcom/itextpdf/layout/element/Paragraph;
    .local v3, "x":F
    .local v4, "y":F
    .local v6, "textAlign":Lcom/itextpdf/layout/properties/TextAlignment;
    .local v7, "vertAlign":Lcom/itextpdf/layout/properties/VerticalAlignment;
    invoke-virtual/range {v1 .. v8}, Lcom/itextpdf/layout/RootElement;->showTextAligned(Lcom/itextpdf/layout/element/Paragraph;FFILcom/itextpdf/layout/properties/TextAlignment;Lcom/itextpdf/layout/properties/VerticalAlignment;F)Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object p1

    return-object p1
.end method

.method public showTextAligned(Ljava/lang/String;FFLcom/itextpdf/layout/properties/TextAlignment;)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 6
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "x"    # F
    .param p3, "y"    # F
    .param p4, "textAlign"    # Lcom/itextpdf/layout/properties/TextAlignment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "FF",
            "Lcom/itextpdf/layout/properties/TextAlignment;",
            ")TT;"
        }
    .end annotation

    .line 210
    .local p0, "this":Lcom/itextpdf/layout/RootElement;, "Lcom/itextpdf/layout/RootElement<TT;>;"
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    .end local p1    # "text":Ljava/lang/String;
    .end local p2    # "x":F
    .end local p3    # "y":F
    .end local p4    # "textAlign":Lcom/itextpdf/layout/properties/TextAlignment;
    .local v1, "text":Ljava/lang/String;
    .local v2, "x":F
    .local v3, "y":F
    .local v4, "textAlign":Lcom/itextpdf/layout/properties/TextAlignment;
    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/layout/RootElement;->showTextAligned(Ljava/lang/String;FFLcom/itextpdf/layout/properties/TextAlignment;F)Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object p1

    return-object p1
.end method

.method public showTextAligned(Ljava/lang/String;FFLcom/itextpdf/layout/properties/TextAlignment;F)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 7
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "x"    # F
    .param p3, "y"    # F
    .param p4, "textAlign"    # Lcom/itextpdf/layout/properties/TextAlignment;
    .param p5, "angle"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "FF",
            "Lcom/itextpdf/layout/properties/TextAlignment;",
            "F)TT;"
        }
    .end annotation

    .line 224
    .local p0, "this":Lcom/itextpdf/layout/RootElement;, "Lcom/itextpdf/layout/RootElement<TT;>;"
    sget-object v5, Lcom/itextpdf/layout/properties/VerticalAlignment;->BOTTOM:Lcom/itextpdf/layout/properties/VerticalAlignment;

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move v6, p5

    .end local p1    # "text":Ljava/lang/String;
    .end local p2    # "x":F
    .end local p3    # "y":F
    .end local p4    # "textAlign":Lcom/itextpdf/layout/properties/TextAlignment;
    .end local p5    # "angle":F
    .local v1, "text":Ljava/lang/String;
    .local v2, "x":F
    .local v3, "y":F
    .local v4, "textAlign":Lcom/itextpdf/layout/properties/TextAlignment;
    .local v6, "angle":F
    invoke-virtual/range {v0 .. v6}, Lcom/itextpdf/layout/RootElement;->showTextAligned(Ljava/lang/String;FFLcom/itextpdf/layout/properties/TextAlignment;Lcom/itextpdf/layout/properties/VerticalAlignment;F)Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object p1

    return-object p1
.end method

.method public showTextAligned(Ljava/lang/String;FFLcom/itextpdf/layout/properties/TextAlignment;Lcom/itextpdf/layout/properties/VerticalAlignment;F)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 9
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "x"    # F
    .param p3, "y"    # F
    .param p4, "textAlign"    # Lcom/itextpdf/layout/properties/TextAlignment;
    .param p5, "vertAlign"    # Lcom/itextpdf/layout/properties/VerticalAlignment;
    .param p6, "angle"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "FF",
            "Lcom/itextpdf/layout/properties/TextAlignment;",
            "Lcom/itextpdf/layout/properties/VerticalAlignment;",
            "F)TT;"
        }
    .end annotation

    .line 239
    .local p0, "this":Lcom/itextpdf/layout/RootElement;, "Lcom/itextpdf/layout/RootElement<TT;>;"
    new-instance v0, Lcom/itextpdf/layout/element/Paragraph;

    invoke-direct {v0, p1}, Lcom/itextpdf/layout/element/Paragraph;-><init>(Ljava/lang/String;)V

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/element/Paragraph;->setMultipliedLeading(F)Lcom/itextpdf/layout/element/Paragraph;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/element/Paragraph;->setMargin(F)Lcom/itextpdf/layout/element/IElement;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lcom/itextpdf/layout/element/Paragraph;

    .line 240
    .local v2, "p":Lcom/itextpdf/layout/element/Paragraph;
    iget-object v0, p0, Lcom/itextpdf/layout/RootElement;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v5

    move-object v1, p0

    move v3, p2

    move v4, p3

    move-object v6, p4

    move-object v7, p5

    move v8, p6

    .end local p2    # "x":F
    .end local p3    # "y":F
    .end local p4    # "textAlign":Lcom/itextpdf/layout/properties/TextAlignment;
    .end local p5    # "vertAlign":Lcom/itextpdf/layout/properties/VerticalAlignment;
    .end local p6    # "angle":F
    .local v3, "x":F
    .local v4, "y":F
    .local v6, "textAlign":Lcom/itextpdf/layout/properties/TextAlignment;
    .local v7, "vertAlign":Lcom/itextpdf/layout/properties/VerticalAlignment;
    .local v8, "angle":F
    invoke-virtual/range {v1 .. v8}, Lcom/itextpdf/layout/RootElement;->showTextAligned(Lcom/itextpdf/layout/element/Paragraph;FFILcom/itextpdf/layout/properties/TextAlignment;Lcom/itextpdf/layout/properties/VerticalAlignment;F)Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object p2

    return-object p2
.end method

.method public showTextAlignedKerned(Ljava/lang/String;FFLcom/itextpdf/layout/properties/TextAlignment;Lcom/itextpdf/layout/properties/VerticalAlignment;F)Lcom/itextpdf/layout/IPropertyContainer;
    .locals 9
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "x"    # F
    .param p3, "y"    # F
    .param p4, "textAlign"    # Lcom/itextpdf/layout/properties/TextAlignment;
    .param p5, "vertAlign"    # Lcom/itextpdf/layout/properties/VerticalAlignment;
    .param p6, "radAngle"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "FF",
            "Lcom/itextpdf/layout/properties/TextAlignment;",
            "Lcom/itextpdf/layout/properties/VerticalAlignment;",
            "F)TT;"
        }
    .end annotation

    .line 255
    .local p0, "this":Lcom/itextpdf/layout/RootElement;, "Lcom/itextpdf/layout/RootElement<TT;>;"
    new-instance v0, Lcom/itextpdf/layout/element/Paragraph;

    invoke-direct {v0, p1}, Lcom/itextpdf/layout/element/Paragraph;-><init>(Ljava/lang/String;)V

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/element/Paragraph;->setMultipliedLeading(F)Lcom/itextpdf/layout/element/Paragraph;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/element/Paragraph;->setMargin(F)Lcom/itextpdf/layout/element/IElement;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/element/Paragraph;

    sget-object v1, Lcom/itextpdf/layout/properties/FontKerning;->YES:Lcom/itextpdf/layout/properties/FontKerning;

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/element/Paragraph;->setFontKerning(Lcom/itextpdf/layout/properties/FontKerning;)Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lcom/itextpdf/layout/element/Paragraph;

    .line 256
    .local v2, "p":Lcom/itextpdf/layout/element/Paragraph;
    iget-object v0, p0, Lcom/itextpdf/layout/RootElement;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v5

    move-object v1, p0

    move v3, p2

    move v4, p3

    move-object v6, p4

    move-object v7, p5

    move v8, p6

    .end local p2    # "x":F
    .end local p3    # "y":F
    .end local p4    # "textAlign":Lcom/itextpdf/layout/properties/TextAlignment;
    .end local p5    # "vertAlign":Lcom/itextpdf/layout/properties/VerticalAlignment;
    .end local p6    # "radAngle":F
    .local v3, "x":F
    .local v4, "y":F
    .local v6, "textAlign":Lcom/itextpdf/layout/properties/TextAlignment;
    .local v7, "vertAlign":Lcom/itextpdf/layout/properties/VerticalAlignment;
    .local v8, "radAngle":F
    invoke-virtual/range {v1 .. v8}, Lcom/itextpdf/layout/RootElement;->showTextAligned(Lcom/itextpdf/layout/element/Paragraph;FFILcom/itextpdf/layout/properties/TextAlignment;Lcom/itextpdf/layout/properties/VerticalAlignment;F)Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object p2

    return-object p2
.end method
