.class public Lcom/itextpdf/layout/renderer/ListItemRenderer;
.super Lcom/itextpdf/layout/renderer/DivRenderer;
.source "ListItemRenderer.java"


# instance fields
.field private symbolAddedInside:Z

.field protected symbolAreaWidth:F

.field protected symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;


# direct methods
.method public constructor <init>(Lcom/itextpdf/layout/element/ListItem;)V
    .locals 0
    .param p1, "modelElement"    # Lcom/itextpdf/layout/element/ListItem;

    .line 62
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/renderer/DivRenderer;-><init>(Lcom/itextpdf/layout/element/Div;)V

    .line 63
    return-void
.end method

.method private applyListSymbolPosition()V
    .locals 9

    .line 258
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    if-eqz v0, :cond_9

    .line 259
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    const/16 v1, 0x53

    invoke-static {p0, v0, v1}, Lcom/itextpdf/layout/renderer/ListRenderer;->getListItemOrListProperty(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/ListSymbolPosition;

    .line 260
    .local v0, "symbolPosition":Lcom/itextpdf/layout/properties/ListSymbolPosition;
    sget-object v1, Lcom/itextpdf/layout/properties/ListSymbolPosition;->INSIDE:Lcom/itextpdf/layout/properties/ListSymbolPosition;

    if-ne v0, v1, :cond_9

    .line 261
    sget-object v1, Lcom/itextpdf/layout/properties/BaseDirection;->RIGHT_TO_LEFT:Lcom/itextpdf/layout/properties/BaseDirection;

    const/4 v2, 0x7

    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/ListItemRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/properties/BaseDirection;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 262
    .local v1, "isRtl":Z
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-lez v2, :cond_7

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Lcom/itextpdf/layout/renderer/ParagraphRenderer;

    if-eqz v2, :cond_7

    .line 263
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/ParagraphRenderer;

    .line 265
    .local v2, "paragraphRenderer":Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    const/16 v5, 0x27

    invoke-virtual {p0, v5}, Lcom/itextpdf/layout/renderer/ListItemRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v5

    .line 266
    .local v5, "symbolIndent":Ljava/lang/Float;
    iget-object v6, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    instance-of v6, v6, Lcom/itextpdf/layout/renderer/LineRenderer;

    const/16 v7, 0x2c

    const/16 v8, 0x2d

    if-eqz v6, :cond_3

    .line 267
    if-eqz v5, :cond_1

    .line 268
    iget-object v6, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v6}, Lcom/itextpdf/layout/renderer/IRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/layout/renderer/IRenderer;

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    move v7, v8

    :goto_0
    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v8

    invoke-static {v8}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 270
    :cond_1
    iget-object v6, v2, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->childRenderers:Ljava/util/List;

    iget-object v7, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v7}, Lcom/itextpdf/layout/renderer/IRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_6

    .line 271
    iget-object v6, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v6}, Lcom/itextpdf/layout/renderer/IRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 272
    .local v7, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    iget-object v8, v2, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v8, v4, v7}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 273
    .end local v7    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_1

    :cond_2
    goto :goto_3

    .line 276
    :cond_3
    if-eqz v5, :cond_5

    .line 277
    iget-object v6, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    if-eqz v1, :cond_4

    goto :goto_2

    :cond_4
    move v7, v8

    :goto_2
    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v8

    invoke-static {v8}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 279
    :cond_5
    iget-object v6, v2, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->childRenderers:Ljava/util/List;

    iget-object v7, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v6, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_6

    .line 280
    iget-object v6, v2, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->childRenderers:Ljava/util/List;

    iget-object v7, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v6, v4, v7}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 283
    :cond_6
    :goto_3
    iput-boolean v3, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolAddedInside:Z

    .end local v2    # "paragraphRenderer":Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    .end local v5    # "symbolIndent":Ljava/lang/Float;
    goto :goto_4

    .line 284
    :cond_7
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_8

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Lcom/itextpdf/layout/renderer/ImageRenderer;

    if-eqz v2, :cond_8

    .line 285
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/ListItemRenderer;->renderSymbolInNeutralParagraph()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v2

    .line 286
    .local v2, "paragraphRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v2, v5}, Lcom/itextpdf/layout/renderer/IRenderer;->addChild(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 287
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v5, v4, v2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 288
    iput-boolean v3, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolAddedInside:Z

    goto :goto_5

    .line 284
    .end local v2    # "paragraphRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_8
    :goto_4
    nop

    .line 290
    :goto_5
    iget-boolean v2, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolAddedInside:Z

    if-nez v2, :cond_9

    .line 291
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/ListItemRenderer;->renderSymbolInNeutralParagraph()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v2

    .line 292
    .restart local v2    # "paragraphRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v5, v4, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 293
    iput-boolean v3, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolAddedInside:Z

    .line 297
    .end local v0    # "symbolPosition":Lcom/itextpdf/layout/properties/ListSymbolPosition;
    .end local v1    # "isRtl":Z
    .end local v2    # "paragraphRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_9
    return-void
.end method

.method private calculateAscenderDescender()[F
    .locals 9

    .line 321
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/ListItemRenderer;->resolveFirstPdfFont()Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    .line 322
    .local v0, "listItemFont":Lcom/itextpdf/kernel/font/PdfFont;
    const/16 v1, 0x18

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/ListItemRenderer;->getPropertyAsUnitValue(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v2

    .line 323
    .local v2, "fontSize":Lcom/itextpdf/layout/properties/UnitValue;
    const/4 v3, 0x2

    if-eqz v0, :cond_1

    if-eqz v2, :cond_1

    .line 324
    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v4

    if-nez v4, :cond_0

    .line 325
    const-class v4, Lcom/itextpdf/layout/renderer/ListItemRenderer;

    invoke-static {v4}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v4

    .line 326
    .local v4, "logger":Lorg/slf4j/Logger;
    nop

    .line 327
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    .line 326
    const-string v5, "Property {0} in percents is not supported"

    invoke-static {v5, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v4, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 329
    .end local v4    # "logger":Lorg/slf4j/Logger;
    :cond_0
    invoke-static {v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->calculateAscenderDescender(Lcom/itextpdf/kernel/font/PdfFont;)[F

    move-result-object v1

    .line 330
    .local v1, "ascenderDescender":[F
    nop

    .line 331
    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v4

    const/4 v5, 0x0

    aget v6, v1, v5

    invoke-static {v6}, Lcom/itextpdf/io/font/FontProgram;->convertTextSpaceToGlyphSpace(F)F

    move-result v6

    mul-float/2addr v4, v6

    .line 332
    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v6

    const/4 v7, 0x1

    aget v8, v1, v7

    invoke-static {v8}, Lcom/itextpdf/io/font/FontProgram;->convertTextSpaceToGlyphSpace(F)F

    move-result v8

    mul-float/2addr v6, v8

    new-array v3, v3, [F

    aput v4, v3, v5

    aput v6, v3, v7

    .line 330
    return-object v3

    .line 335
    .end local v1    # "ascenderDescender":[F
    :cond_1
    new-array v1, v3, [F

    fill-array-data v1, :array_0

    return-object v1

    nop

    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method private isListSymbolEmpty(Lcom/itextpdf/layout/renderer/IRenderer;)Z
    .locals 3
    .param p1, "listSymbolRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 312
    instance-of v0, p1, Lcom/itextpdf/layout/renderer/TextRenderer;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 313
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/layout/renderer/TextRenderer;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->getText()Lcom/itextpdf/io/font/otf/GlyphLine;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/GlyphLine;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    return v1

    .line 314
    :cond_1
    instance-of v0, p1, Lcom/itextpdf/layout/renderer/LineRenderer;

    if-eqz v0, :cond_3

    .line 315
    invoke-interface {p1}, Lcom/itextpdf/layout/renderer/IRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/TextRenderer;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->getText()Lcom/itextpdf/io/font/otf/GlyphLine;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/GlyphLine;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_2

    goto :goto_1

    :cond_2
    move v1, v2

    :goto_1
    return v1

    .line 317
    :cond_3
    return v2
.end method

.method private renderSymbolInNeutralParagraph()Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 6

    .line 300
    new-instance v0, Lcom/itextpdf/layout/element/Paragraph;

    invoke-direct {v0}, Lcom/itextpdf/layout/element/Paragraph;-><init>()V

    invoke-virtual {v0}, Lcom/itextpdf/layout/element/Paragraph;->setNeutralRole()Lcom/itextpdf/layout/element/IElement;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/element/Paragraph;

    .line 301
    .local v0, "p":Lcom/itextpdf/layout/element/Paragraph;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/element/Paragraph;->setMargin(F)Lcom/itextpdf/layout/element/IElement;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/element/Paragraph;

    invoke-virtual {v1}, Lcom/itextpdf/layout/element/Paragraph;->createRendererSubTree()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    .line 302
    .local v1, "paragraphRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    const/16 v3, 0x27

    invoke-static {p0, v2, v3}, Lcom/itextpdf/layout/renderer/ListRenderer;->getListItemOrListProperty(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    .line 303
    .local v2, "symbolIndent":Ljava/lang/Float;
    if-eqz v2, :cond_0

    .line 305
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v4

    invoke-static {v4}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v4

    const/16 v5, 0x2d

    invoke-interface {v3, v5, v4}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 307
    :cond_0
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v1, v3}, Lcom/itextpdf/layout/renderer/IRenderer;->addChild(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 308
    return-object v1
.end method


# virtual methods
.method public addSymbolRenderer(Lcom/itextpdf/layout/renderer/IRenderer;F)V
    .locals 0
    .param p1, "symbolRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p2, "symbolAreaWidth"    # F

    .line 66
    iput-object p1, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 67
    iput p2, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolAreaWidth:F

    .line 68
    return-void
.end method

.method protected createOverflowRenderer(I)Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .locals 2
    .param p1, "layoutResult"    # I

    .line 246
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/ListItemRenderer;->getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/ListItemRenderer;

    .line 247
    .local v0, "overflowRenderer":Lcom/itextpdf/layout/renderer/ListItemRenderer;
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 248
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    .line 249
    const/4 v1, 0x3

    if-ne p1, v1, :cond_0

    .line 250
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 251
    iget v1, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolAreaWidth:F

    iput v1, v0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolAreaWidth:F

    .line 253
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/ListItemRenderer;->getOwnProperties()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/ListItemRenderer;->addAllProperties(Ljava/util/Map;)V

    .line 254
    return-object v0
.end method

.method protected createSplitRenderer(I)Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .locals 2
    .param p1, "layoutResult"    # I

    .line 230
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/ListItemRenderer;->getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/ListItemRenderer;

    .line 231
    .local v0, "splitRenderer":Lcom/itextpdf/layout/renderer/ListItemRenderer;
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 232
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    .line 233
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 234
    iget-boolean v1, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolAddedInside:Z

    iput-boolean v1, v0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolAddedInside:Z

    .line 235
    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->isLastRendererForModelElement:Z

    .line 236
    const/4 v1, 0x2

    if-ne p1, v1, :cond_0

    .line 237
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 238
    iget v1, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolAreaWidth:F

    iput v1, v0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolAreaWidth:F

    .line 240
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/ListItemRenderer;->getOwnProperties()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/ListItemRenderer;->addAllProperties(Ljava/util/Map;)V

    .line 241
    return-object v0
.end method

.method public draw(Lcom/itextpdf/layout/renderer/DrawContext;)V
    .locals 12
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;

    .line 87
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    const-class v1, Lcom/itextpdf/layout/renderer/ListItemRenderer;

    if-nez v0, :cond_0

    .line 88
    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 89
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v1, "Drawing won\'t be performed."

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "Occupied area has not been initialized. {0}"

    invoke-static {v2, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 91
    return-void

    .line 93
    .end local v0    # "logger":Lorg/slf4j/Logger;
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/DrawContext;->isTaggingEnabled()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 94
    const/16 v0, 0x6c

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/ListItemRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;

    .line 95
    .local v0, "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    if-eqz v0, :cond_4

    .line 96
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    if-eqz v2, :cond_1

    .line 97
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-static {v0, v2}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->addTreeHints(Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 99
    :cond_1
    invoke-virtual {v0, p0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->isArtifact(Lcom/itextpdf/layout/IPropertyContainer;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 100
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->markArtifactHint(Lcom/itextpdf/layout/IPropertyContainer;)V

    goto :goto_0

    .line 102
    :cond_2
    invoke-static {p0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getHintKey(Lcom/itextpdf/layout/IPropertyContainer;)Lcom/itextpdf/layout/tagging/TaggingHintKey;

    move-result-object v2

    .line 103
    .local v2, "hintKey":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getAccessibleParentHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Lcom/itextpdf/layout/tagging/TaggingHintKey;

    move-result-object v3

    .line 104
    .local v3, "parentHint":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    if-eqz v3, :cond_4

    invoke-virtual {v3}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->getAccessibleElement()Lcom/itextpdf/layout/tagging/IAccessibleElement;

    move-result-object v4

    invoke-interface {v4}, Lcom/itextpdf/layout/tagging/IAccessibleElement;->getAccessibilityProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->getRole()Ljava/lang/String;

    move-result-object v4

    const-string v5, "LI"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 105
    new-instance v4, Lcom/itextpdf/layout/tagging/TaggingDummyElement;

    invoke-direct {v4, v5}, Lcom/itextpdf/layout/tagging/TaggingDummyElement;-><init>(Ljava/lang/String;)V

    .line 106
    .local v4, "listItemIntermediate":Lcom/itextpdf/layout/tagging/TaggingDummyElement;
    invoke-static {v4}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getOrCreateHintKey(Lcom/itextpdf/layout/IPropertyContainer;)Lcom/itextpdf/layout/tagging/TaggingHintKey;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    .line 107
    .local v5, "intermediateKid":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    invoke-virtual {v0, v2, v5}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->replaceKidHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;Ljava/util/Collection;)I

    .line 108
    iget-object v6, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    if-eqz v6, :cond_3

    .line 109
    iget-object v6, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-static {v6}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    invoke-virtual {v0, v4, v6}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->addKidsHint(Lcom/itextpdf/layout/IPropertyContainer;Ljava/lang/Iterable;)V

    .line 111
    :cond_3
    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    invoke-virtual {v0, v4, v6}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->addKidsHint(Lcom/itextpdf/layout/IPropertyContainer;Ljava/lang/Iterable;)V

    .line 117
    .end local v0    # "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    .end local v2    # "hintKey":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .end local v3    # "parentHint":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .end local v4    # "listItemIntermediate":Lcom/itextpdf/layout/tagging/TaggingDummyElement;
    .end local v5    # "intermediateKid":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    :cond_4
    :goto_0
    invoke-super {p0, p1}, Lcom/itextpdf/layout/renderer/DivRenderer;->draw(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 120
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    if-eqz v0, :cond_1b

    iget-boolean v0, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolAddedInside:Z

    if-nez v0, :cond_1b

    .line 121
    sget-object v0, Lcom/itextpdf/layout/properties/BaseDirection;->RIGHT_TO_LEFT:Lcom/itextpdf/layout/properties/BaseDirection;

    const/4 v2, 0x7

    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/ListItemRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-ne v0, v2, :cond_5

    move v0, v3

    goto :goto_1

    :cond_5
    move v0, v4

    .line 122
    .local v0, "isRtl":Z
    :goto_1
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v2, p0}, Lcom/itextpdf/layout/renderer/IRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    .line 123
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    if-eqz v0, :cond_6

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v2

    goto :goto_2

    :cond_6
    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v2

    .line 124
    .local v2, "x":F
    :goto_2
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    const/16 v6, 0x53

    invoke-static {p0, v5, v6}, Lcom/itextpdf/layout/renderer/ListRenderer;->getListItemOrListProperty(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/layout/properties/ListSymbolPosition;

    .line 125
    .local v5, "symbolPosition":Lcom/itextpdf/layout/properties/ListSymbolPosition;
    sget-object v6, Lcom/itextpdf/layout/properties/ListSymbolPosition;->DEFAULT:Lcom/itextpdf/layout/properties/ListSymbolPosition;

    const/4 v7, 0x0

    if-eq v5, v6, :cond_d

    .line 126
    const/16 v6, 0x27

    invoke-virtual {p0, v6}, Lcom/itextpdf/layout/renderer/ListItemRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v6

    .line 127
    .local v6, "symbolIndent":Ljava/lang/Float;
    nop

    .line 130
    iget v8, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolAreaWidth:F

    .line 127
    if-eqz v0, :cond_8

    .line 128
    if-nez v6, :cond_7

    move v9, v7

    goto :goto_3

    :cond_7
    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v9

    :goto_3
    add-float/2addr v8, v9

    add-float/2addr v2, v8

    goto :goto_5

    .line 130
    :cond_8
    if-nez v6, :cond_9

    move v9, v7

    goto :goto_4

    :cond_9
    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v9

    :goto_4
    add-float/2addr v8, v9

    sub-float/2addr v2, v8

    .line 132
    :goto_5
    sget-object v8, Lcom/itextpdf/layout/properties/ListSymbolPosition;->OUTSIDE:Lcom/itextpdf/layout/properties/ListSymbolPosition;

    if-ne v5, v8, :cond_d

    .line 133
    const-string v8, "Property {0} in percents is not supported"

    if-eqz v0, :cond_b

    .line 134
    const/16 v9, 0x2d

    invoke-virtual {p0, v9}, Lcom/itextpdf/layout/renderer/ListItemRenderer;->getPropertyAsUnitValue(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v10

    .line 135
    .local v10, "marginRightUV":Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {v10}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v11

    if-nez v11, :cond_a

    .line 136
    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 137
    .local v1, "logger":Lorg/slf4j/Logger;
    nop

    .line 139
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    filled-new-array {v9}, [Ljava/lang/Object;

    move-result-object v9

    .line 138
    invoke-static {v8, v9}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 137
    invoke-interface {v1, v8}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 141
    .end local v1    # "logger":Lorg/slf4j/Logger;
    :cond_a
    invoke-virtual {v10}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v1

    sub-float/2addr v2, v1

    .line 142
    .end local v10    # "marginRightUV":Lcom/itextpdf/layout/properties/UnitValue;
    goto :goto_6

    .line 143
    :cond_b
    const/16 v9, 0x2c

    invoke-virtual {p0, v9}, Lcom/itextpdf/layout/renderer/ListItemRenderer;->getPropertyAsUnitValue(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v10

    .line 144
    .local v10, "marginLeftUV":Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {v10}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v11

    if-nez v11, :cond_c

    .line 145
    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 146
    .restart local v1    # "logger":Lorg/slf4j/Logger;
    nop

    .line 148
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    filled-new-array {v9}, [Ljava/lang/Object;

    move-result-object v9

    .line 147
    invoke-static {v8, v9}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 146
    invoke-interface {v1, v8}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 150
    .end local v1    # "logger":Lorg/slf4j/Logger;
    :cond_c
    invoke-virtual {v10}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v1

    add-float/2addr v2, v1

    .line 154
    .end local v6    # "symbolIndent":Ljava/lang/Float;
    .end local v10    # "marginLeftUV":Lcom/itextpdf/layout/properties/UnitValue;
    :cond_d
    :goto_6
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {p0, v1, v4}, Lcom/itextpdf/layout/renderer/ListItemRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 155
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {p0, v1, v4}, Lcom/itextpdf/layout/renderer/ListItemRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 156
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_12

    .line 157
    const/4 v1, 0x0

    .line 158
    .local v1, "yLine":Ljava/lang/Float;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_7
    iget-object v6, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ge v4, v6, :cond_f

    .line 159
    iget-object v6, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v6, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v6}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v6

    cmpl-float v6, v6, v7

    if-lez v6, :cond_e

    .line 160
    iget-object v6, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v6, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v6}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getFirstYLineRecursively()Ljava/lang/Float;

    move-result-object v1

    .line 161
    if-eqz v1, :cond_e

    .line 162
    goto :goto_8

    .line 158
    :cond_e
    add-int/lit8 v4, v4, 0x1

    goto :goto_7

    .line 166
    .end local v4    # "i":I
    :cond_f
    :goto_8
    nop

    .line 173
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 166
    if-eqz v1, :cond_11

    .line 167
    instance-of v4, v4, Lcom/itextpdf/layout/renderer/LineRenderer;

    .line 170
    iget-object v6, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 167
    if-eqz v4, :cond_10

    .line 168
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v4

    iget-object v8, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    check-cast v8, Lcom/itextpdf/layout/renderer/LineRenderer;

    invoke-virtual {v8}, Lcom/itextpdf/layout/renderer/LineRenderer;->getYLine()F

    move-result v8

    sub-float/2addr v4, v8

    invoke-interface {v6, v7, v4}, Lcom/itextpdf/layout/renderer/IRenderer;->move(FF)V

    goto :goto_9

    .line 170
    :cond_10
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v4

    iget-object v8, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v8}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v8

    sub-float/2addr v4, v8

    invoke-interface {v6, v7, v4}, Lcom/itextpdf/layout/renderer/IRenderer;->move(FF)V

    goto :goto_9

    .line 173
    :cond_11
    iget-object v6, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v6

    iget-object v8, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v8}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v8

    add-float/2addr v6, v8

    iget-object v8, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 174
    invoke-interface {v8}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v8

    iget-object v9, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v9}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v9

    add-float/2addr v8, v9

    sub-float/2addr v6, v8

    .line 173
    invoke-interface {v4, v7, v6}, Lcom/itextpdf/layout/renderer/IRenderer;->move(FF)V

    .line 176
    .end local v1    # "yLine":Ljava/lang/Float;
    :goto_9
    goto :goto_a

    .line 177
    :cond_12
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    instance-of v1, v1, Lcom/itextpdf/layout/renderer/TextRenderer;

    .line 180
    iget-object v6, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 177
    if-eqz v1, :cond_13

    .line 178
    check-cast v6, Lcom/itextpdf/layout/renderer/TextRenderer;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v1

    iget-object v8, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v8}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v8

    add-float/2addr v1, v8

    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/ListItemRenderer;->calculateAscenderDescender()[F

    move-result-object v8

    aget v4, v8, v4

    sub-float/2addr v1, v4

    invoke-virtual {v6, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->moveYLineTo(F)V

    goto :goto_a

    .line 180
    :cond_13
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v1

    iget-object v4, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v4

    add-float/2addr v1, v4

    iget-object v4, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 181
    invoke-interface {v4}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v4

    sub-float/2addr v1, v4

    iget-object v4, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v4}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v4

    sub-float/2addr v1, v4

    .line 180
    invoke-interface {v6, v7, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->move(FF)V

    .line 184
    :goto_a
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {p0, v1, v3}, Lcom/itextpdf/layout/renderer/ListItemRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 185
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {p0, v1, v3}, Lcom/itextpdf/layout/renderer/ListItemRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 187
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    if-eqz v0, :cond_14

    sget-object v3, Lcom/itextpdf/layout/properties/ListSymbolAlignment;->LEFT:Lcom/itextpdf/layout/properties/ListSymbolAlignment;

    goto :goto_b

    :cond_14
    sget-object v3, Lcom/itextpdf/layout/properties/ListSymbolAlignment;->RIGHT:Lcom/itextpdf/layout/properties/ListSymbolAlignment;

    :goto_b
    const/16 v4, 0x26

    invoke-interface {v1, v4, v3}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/ListSymbolAlignment;

    .line 189
    .local v1, "listSymbolAlignment":Lcom/itextpdf/layout/properties/ListSymbolAlignment;
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v3}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v3

    sub-float v3, v2, v3

    .line 190
    .local v3, "dxPosition":F
    sget-object v4, Lcom/itextpdf/layout/properties/ListSymbolAlignment;->RIGHT:Lcom/itextpdf/layout/properties/ListSymbolAlignment;

    if-ne v1, v4, :cond_15

    .line 191
    if-nez v0, :cond_16

    .line 192
    iget v4, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolAreaWidth:F

    iget-object v6, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v6}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v6

    sub-float/2addr v4, v6

    add-float/2addr v3, v4

    goto :goto_c

    .line 194
    :cond_15
    sget-object v4, Lcom/itextpdf/layout/properties/ListSymbolAlignment;->LEFT:Lcom/itextpdf/layout/properties/ListSymbolAlignment;

    if-ne v1, v4, :cond_16

    .line 195
    if-eqz v0, :cond_16

    .line 196
    iget v4, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolAreaWidth:F

    iget-object v6, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v6}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v6

    sub-float/2addr v4, v6

    sub-float/2addr v3, v4

    .line 199
    :cond_16
    :goto_c
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    instance-of v4, v4, Lcom/itextpdf/layout/renderer/LineRenderer;

    if-eqz v4, :cond_18

    .line 200
    nop

    .line 203
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 200
    if-eqz v0, :cond_17

    .line 201
    iget-object v6, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v6}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v6

    sub-float v6, v3, v6

    invoke-interface {v4, v6, v7}, Lcom/itextpdf/layout/renderer/IRenderer;->move(FF)V

    goto :goto_d

    .line 203
    :cond_17
    invoke-interface {v4, v3, v7}, Lcom/itextpdf/layout/renderer/IRenderer;->move(FF)V

    goto :goto_d

    .line 206
    :cond_18
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v4, v3, v7}, Lcom/itextpdf/layout/renderer/IRenderer;->move(FF)V

    .line 210
    :goto_d
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/ListItemRenderer;->getRootRenderer()Lcom/itextpdf/layout/renderer/RootRenderer;

    move-result-object v4

    .line 211
    .local v4, "root":Lcom/itextpdf/layout/renderer/RootRenderer;
    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/RootRenderer;->getCurrentArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v6

    .line 214
    .local v6, "effectiveArea":Lcom/itextpdf/kernel/geom/Rectangle;
    if-nez v0, :cond_19

    iget-object v7, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v7}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v7

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v8

    cmpl-float v7, v7, v8

    if-gtz v7, :cond_1a

    :cond_19
    if-eqz v0, :cond_1b

    iget-object v7, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 215
    invoke-interface {v7}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v7

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v8

    cmpg-float v7, v7, v8

    if-gez v7, :cond_1b

    .line 216
    :cond_1a
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/ListItemRenderer;->beginElementOpacityApplying(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 217
    iget-object v7, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v7, p1}, Lcom/itextpdf/layout/renderer/IRenderer;->draw(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 218
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/ListItemRenderer;->endElementOpacityApplying(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 221
    .end local v0    # "isRtl":Z
    .end local v1    # "listSymbolAlignment":Lcom/itextpdf/layout/properties/ListSymbolAlignment;
    .end local v2    # "x":F
    .end local v3    # "dxPosition":F
    .end local v4    # "root":Lcom/itextpdf/layout/renderer/RootRenderer;
    .end local v5    # "symbolPosition":Lcom/itextpdf/layout/properties/ListSymbolPosition;
    .end local v6    # "effectiveArea":Lcom/itextpdf/kernel/geom/Rectangle;
    :cond_1b
    return-void
.end method

.method public getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 2

    .line 225
    new-instance v0, Lcom/itextpdf/layout/renderer/ListItemRenderer;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    check-cast v1, Lcom/itextpdf/layout/element/ListItem;

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/renderer/ListItemRenderer;-><init>(Lcom/itextpdf/layout/element/ListItem;)V

    return-object v0
.end method

.method public layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;
    .locals 4
    .param p1, "layoutContext"    # Lcom/itextpdf/layout/layout/LayoutContext;

    .line 72
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    if-eqz v0, :cond_0

    const/16 v0, 0x1b

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/ListItemRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-direct {p0, v0}, Lcom/itextpdf/layout/renderer/ListItemRenderer;->isListSymbolEmpty(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 73
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/ListItemRenderer;->calculateAscenderDescender()[F

    move-result-object v0

    .line 74
    .local v0, "ascenderDescender":[F
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ListItemRenderer;->symbolRenderer:Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v1}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    const/4 v2, 0x0

    aget v2, v0, v2

    const/4 v3, 0x1

    aget v3, v0, v3

    sub-float/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    .line 75
    .local v1, "minHeight":F
    invoke-static {v1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/ListItemRenderer;->updateMinHeight(Lcom/itextpdf/layout/properties/UnitValue;)V

    .line 77
    .end local v0    # "ascenderDescender":[F
    .end local v1    # "minHeight":F
    :cond_0
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/ListItemRenderer;->applyListSymbolPosition()V

    .line 78
    invoke-super {p0, p1}, Lcom/itextpdf/layout/renderer/DivRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v0

    .line 79
    .local v0, "result":Lcom/itextpdf/layout/layout/LayoutResult;
    const/4 v1, 0x2

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v2

    if-ne v1, v2, :cond_1

    .line 80
    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    const/16 v2, 0x55

    invoke-interface {v1, v2}, Lcom/itextpdf/layout/renderer/IRenderer;->deleteOwnProperty(I)V

    .line 82
    :cond_1
    return-object v0
.end method
