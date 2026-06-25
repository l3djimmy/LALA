.class public Lcom/itextpdf/layout/renderer/ListRenderer;
.super Lcom/itextpdf/layout/renderer/BlockRenderer;
.source "ListRenderer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/layout/renderer/ListRenderer$ConstantFontTextRenderer;
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/itextpdf/layout/element/List;)V
    .locals 0
    .param p1, "modelElement"    # Lcom/itextpdf/layout/element/List;

    .line 65
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/renderer/BlockRenderer;-><init>(Lcom/itextpdf/layout/element/IElement;)V

    .line 66
    return-void
.end method

.method private correctListSplitting(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/layout/LayoutArea;)Lcom/itextpdf/layout/layout/LayoutResult;
    .locals 14
    .param p1, "splitRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p2, "overflowRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p3, "causeOfNothing"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p4, "occupiedArea"    # Lcom/itextpdf/layout/layout/LayoutArea;

    .line 256
    invoke-interface {p1}, Lcom/itextpdf/layout/renderer/IRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v0}, Lcom/itextpdf/layout/renderer/IRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v0

    move-object/from16 v2, p3

    invoke-interface {v0, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 258
    .local v0, "firstNotRendered":I
    const/4 v3, -0x1

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-ne v3, v0, :cond_1

    .line 259
    new-instance v6, Lcom/itextpdf/layout/layout/LayoutResult;

    if-nez p2, :cond_0

    move v7, v5

    goto :goto_0

    :cond_0
    move v7, v4

    :goto_0
    move-object v11, p0

    move-object v9, p1

    move-object/from16 v10, p2

    move-object/from16 v8, p4

    invoke-direct/range {v6 .. v11}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    return-object v6

    .line 265
    :cond_1
    invoke-interface {p1}, Lcom/itextpdf/layout/renderer/IRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 267
    .local v3, "firstListItemRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-virtual {p0, v4}, Lcom/itextpdf/layout/renderer/ListRenderer;->createOverflowRenderer(I)Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v6

    move-object v12, v6

    check-cast v12, Lcom/itextpdf/layout/renderer/ListRenderer;

    .line 268
    .local v12, "newOverflowRenderer":Lcom/itextpdf/layout/renderer/ListRenderer;
    const/16 v6, 0x1a

    invoke-virtual {v12, v6}, Lcom/itextpdf/layout/renderer/ListRenderer;->deleteOwnProperty(I)V

    .line 270
    iget-object v6, v12, Lcom/itextpdf/layout/renderer/ListRenderer;->childRenderers:Ljava/util/List;

    move-object v7, v3

    check-cast v7, Lcom/itextpdf/layout/renderer/ListItemRenderer;

    .line 271
    invoke-virtual {v7, v4}, Lcom/itextpdf/layout/renderer/ListItemRenderer;->createOverflowRenderer(I)Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v4

    invoke-interface {v6, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 272
    iget-object v4, v12, Lcom/itextpdf/layout/renderer/ListRenderer;->childRenderers:Ljava/util/List;

    .line 273
    invoke-interface {p1}, Lcom/itextpdf/layout/renderer/IRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v6

    invoke-interface {p1}, Lcom/itextpdf/layout/renderer/IRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    invoke-interface {v6, v5, v7}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v6

    invoke-interface {v4, v6}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 275
    new-instance v4, Ljava/util/ArrayList;

    .line 276
    invoke-interface {v3}, Lcom/itextpdf/layout/renderer/IRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v6

    add-int/lit8 v7, v0, 0x1

    .line 277
    invoke-interface {v3}, Lcom/itextpdf/layout/renderer/IRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    invoke-interface {v6, v7, v8}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v6

    invoke-direct {v4, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 280
    .local v4, "childrenStillRemainingToRender":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    invoke-interface {p1}, Lcom/itextpdf/layout/renderer/IRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v6

    invoke-interface {p1}, Lcom/itextpdf/layout/renderer/IRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v7

    .line 281
    invoke-interface {p1}, Lcom/itextpdf/layout/renderer/IRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    invoke-interface {v7, v5, v8}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v5

    .line 280
    invoke-interface {v6, v5}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 283
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    if-eqz v5, :cond_2

    .line 284
    invoke-virtual {v12}, Lcom/itextpdf/layout/renderer/ListRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v5}, Lcom/itextpdf/layout/renderer/IRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 285
    invoke-interface {p1}, Lcom/itextpdf/layout/renderer/IRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v5}, Lcom/itextpdf/layout/renderer/IRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v4}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 286
    invoke-virtual {v12}, Lcom/itextpdf/layout/renderer/ListRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 287
    invoke-interface {p1}, Lcom/itextpdf/layout/renderer/IRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/renderer/IRenderer;

    const/16 v6, 0x2c

    invoke-interface {v1, v6}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    .line 286
    invoke-interface {v5, v6, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    goto :goto_1

    .line 289
    :cond_2
    iget-object v5, v12, Lcom/itextpdf/layout/renderer/ListRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v5, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 292
    :goto_1
    if-eqz p2, :cond_3

    .line 293
    iget-object v1, v12, Lcom/itextpdf/layout/renderer/ListRenderer;->childRenderers:Ljava/util/List;

    invoke-interface/range {p2 .. p2}, Lcom/itextpdf/layout/renderer/IRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 296
    :cond_3
    iget-object v1, v12, Lcom/itextpdf/layout/renderer/ListRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-eqz v1, :cond_4

    .line 297
    new-instance v8, Lcom/itextpdf/layout/layout/LayoutResult;

    const/4 v9, 0x2

    move-object v13, p0

    move-object v11, p1

    move-object/from16 v10, p4

    invoke-direct/range {v8 .. v13}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    move-object v1, v12

    .end local v12    # "newOverflowRenderer":Lcom/itextpdf/layout/renderer/ListRenderer;
    .local v1, "newOverflowRenderer":Lcom/itextpdf/layout/renderer/ListRenderer;
    return-object v8

    .line 299
    .end local v1    # "newOverflowRenderer":Lcom/itextpdf/layout/renderer/ListRenderer;
    .restart local v12    # "newOverflowRenderer":Lcom/itextpdf/layout/renderer/ListRenderer;
    :cond_4
    move-object v1, v12

    .end local v12    # "newOverflowRenderer":Lcom/itextpdf/layout/renderer/ListRenderer;
    .restart local v1    # "newOverflowRenderer":Lcom/itextpdf/layout/renderer/ListRenderer;
    new-instance v8, Lcom/itextpdf/layout/layout/LayoutResult;

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v9, 0x1

    move-object v13, p0

    move-object/from16 v10, p4

    invoke-direct/range {v8 .. v13}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    return-object v8
.end method

.method private createListSymbolRenderer(ILcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 8
    .param p1, "index"    # I
    .param p2, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 142
    const/16 v0, 0x25

    invoke-static {p2, p0, v0}, Lcom/itextpdf/layout/renderer/ListRenderer;->getListItemOrListProperty(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;I)Ljava/lang/Object;

    move-result-object v0

    .line 143
    .local v0, "defaultListSymbol":Ljava/lang/Object;
    instance-of v1, v0, Lcom/itextpdf/layout/element/Text;

    if-eqz v1, :cond_0

    .line 144
    new-instance v1, Lcom/itextpdf/layout/renderer/TextRenderer;

    move-object v2, v0

    check-cast v2, Lcom/itextpdf/layout/element/Text;

    invoke-direct {v1, v2}, Lcom/itextpdf/layout/renderer/TextRenderer;-><init>(Lcom/itextpdf/layout/element/Text;)V

    invoke-direct {p0, v1}, Lcom/itextpdf/layout/renderer/ListRenderer;->surroundTextBullet(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/LineRenderer;

    move-result-object v1

    return-object v1

    .line 145
    :cond_0
    instance-of v1, v0, Lcom/itextpdf/layout/element/Image;

    if-eqz v1, :cond_1

    .line 146
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/layout/element/Image;

    invoke-virtual {v1}, Lcom/itextpdf/layout/element/Image;->getRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    return-object v1

    .line 147
    :cond_1
    instance-of v1, v0, Lcom/itextpdf/layout/properties/ListNumberingType;

    if-eqz v1, :cond_7

    .line 148
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/layout/properties/ListNumberingType;

    .line 150
    .local v1, "numberingType":Lcom/itextpdf/layout/properties/ListNumberingType;
    sget-object v2, Lcom/itextpdf/layout/renderer/ListRenderer$1;->$SwitchMap$com$itextpdf$layout$properties$ListNumberingType:[I

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/ListNumberingType;->ordinal()I

    move-result v3

    aget v2, v2, v3

    const/4 v3, 0x1

    packed-switch v2, :pswitch_data_0

    .line 188
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2}, Ljava/lang/IllegalStateException;-><init>()V

    throw v2

    .line 185
    :pswitch_0
    add-int/lit16 v2, p1, 0xc9

    int-to-char v2, v2

    invoke-static {v2}, Lcom/itextpdf/io/util/TextUtil;->charToString(C)Ljava/lang/String;

    move-result-object v2

    .line 186
    .local v2, "numberText":Ljava/lang/String;
    goto :goto_1

    .line 182
    .end local v2    # "numberText":Ljava/lang/String;
    :pswitch_1
    add-int/lit16 v2, p1, 0xbf

    int-to-char v2, v2

    invoke-static {v2}, Lcom/itextpdf/io/util/TextUtil;->charToString(C)Ljava/lang/String;

    move-result-object v2

    .line 183
    .restart local v2    # "numberText":Ljava/lang/String;
    goto :goto_1

    .line 179
    .end local v2    # "numberText":Ljava/lang/String;
    :pswitch_2
    add-int/lit16 v2, p1, 0xb5

    int-to-char v2, v2

    invoke-static {v2}, Lcom/itextpdf/io/util/TextUtil;->charToString(C)Ljava/lang/String;

    move-result-object v2

    .line 180
    .restart local v2    # "numberText":Ljava/lang/String;
    goto :goto_1

    .line 176
    .end local v2    # "numberText":Ljava/lang/String;
    :pswitch_3
    add-int/lit16 v2, p1, 0xab

    int-to-char v2, v2

    invoke-static {v2}, Lcom/itextpdf/io/util/TextUtil;->charToString(C)Ljava/lang/String;

    move-result-object v2

    .line 177
    .restart local v2    # "numberText":Ljava/lang/String;
    goto :goto_1

    .line 173
    .end local v2    # "numberText":Ljava/lang/String;
    :pswitch_4
    invoke-static {p1, v3, v3}, Lcom/itextpdf/kernel/numbering/GreekAlphabetNumbering;->toGreekAlphabetNumber(IZZ)Ljava/lang/String;

    move-result-object v2

    .line 174
    .restart local v2    # "numberText":Ljava/lang/String;
    goto :goto_1

    .line 170
    .end local v2    # "numberText":Ljava/lang/String;
    :pswitch_5
    const/4 v2, 0x0

    invoke-static {p1, v2, v3}, Lcom/itextpdf/kernel/numbering/GreekAlphabetNumbering;->toGreekAlphabetNumber(IZZ)Ljava/lang/String;

    move-result-object v2

    .line 171
    .restart local v2    # "numberText":Ljava/lang/String;
    goto :goto_1

    .line 167
    .end local v2    # "numberText":Ljava/lang/String;
    :pswitch_6
    invoke-static {p1}, Lcom/itextpdf/kernel/numbering/EnglishAlphabetNumbering;->toLatinAlphabetNumberUpperCase(I)Ljava/lang/String;

    move-result-object v2

    .line 168
    .restart local v2    # "numberText":Ljava/lang/String;
    goto :goto_1

    .line 164
    .end local v2    # "numberText":Ljava/lang/String;
    :pswitch_7
    invoke-static {p1}, Lcom/itextpdf/kernel/numbering/EnglishAlphabetNumbering;->toLatinAlphabetNumberLowerCase(I)Ljava/lang/String;

    move-result-object v2

    .line 165
    .restart local v2    # "numberText":Ljava/lang/String;
    goto :goto_1

    .line 161
    .end local v2    # "numberText":Ljava/lang/String;
    :pswitch_8
    invoke-static {p1}, Lcom/itextpdf/kernel/numbering/RomanNumbering;->toRomanUpperCase(I)Ljava/lang/String;

    move-result-object v2

    .line 162
    .restart local v2    # "numberText":Ljava/lang/String;
    goto :goto_1

    .line 158
    .end local v2    # "numberText":Ljava/lang/String;
    :pswitch_9
    invoke-static {p1}, Lcom/itextpdf/kernel/numbering/RomanNumbering;->toRomanLowerCase(I)Ljava/lang/String;

    move-result-object v2

    .line 159
    .restart local v2    # "numberText":Ljava/lang/String;
    goto :goto_1

    .line 155
    .end local v2    # "numberText":Ljava/lang/String;
    :pswitch_a
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v3, 0xa

    if-ge p1, v3, :cond_2

    const-string v3, "0"

    goto :goto_0

    :cond_2
    const-string v3, ""

    :goto_0
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 156
    .restart local v2    # "numberText":Ljava/lang/String;
    goto :goto_1

    .line 152
    .end local v2    # "numberText":Ljava/lang/String;
    :pswitch_b
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    .line 153
    .restart local v2    # "numberText":Ljava/lang/String;
    nop

    .line 190
    :goto_1
    new-instance v3, Lcom/itextpdf/layout/element/Text;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v5, 0x29

    invoke-static {p2, p0, v5}, Lcom/itextpdf/layout/renderer/ListRenderer;->getListItemOrListProperty(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x2a

    invoke-static {p2, p0, v5}, Lcom/itextpdf/layout/renderer/ListRenderer;->getListItemOrListProperty(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/itextpdf/layout/element/Text;-><init>(Ljava/lang/String;)V

    .line 195
    .local v3, "textElement":Lcom/itextpdf/layout/element/Text;
    sget-object v4, Lcom/itextpdf/layout/properties/ListNumberingType;->GREEK_LOWER:Lcom/itextpdf/layout/properties/ListNumberingType;

    if-eq v1, v4, :cond_4

    sget-object v4, Lcom/itextpdf/layout/properties/ListNumberingType;->GREEK_UPPER:Lcom/itextpdf/layout/properties/ListNumberingType;

    if-eq v1, v4, :cond_4

    sget-object v4, Lcom/itextpdf/layout/properties/ListNumberingType;->ZAPF_DINGBATS_1:Lcom/itextpdf/layout/properties/ListNumberingType;

    if-eq v1, v4, :cond_4

    sget-object v4, Lcom/itextpdf/layout/properties/ListNumberingType;->ZAPF_DINGBATS_2:Lcom/itextpdf/layout/properties/ListNumberingType;

    if-eq v1, v4, :cond_4

    sget-object v4, Lcom/itextpdf/layout/properties/ListNumberingType;->ZAPF_DINGBATS_3:Lcom/itextpdf/layout/properties/ListNumberingType;

    if-eq v1, v4, :cond_4

    sget-object v4, Lcom/itextpdf/layout/properties/ListNumberingType;->ZAPF_DINGBATS_4:Lcom/itextpdf/layout/properties/ListNumberingType;

    if-ne v1, v4, :cond_3

    goto :goto_2

    .line 208
    :cond_3
    new-instance v4, Lcom/itextpdf/layout/renderer/TextRenderer;

    invoke-direct {v4, v3}, Lcom/itextpdf/layout/renderer/TextRenderer;-><init>(Lcom/itextpdf/layout/element/Text;)V

    .local v4, "textRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_6

    .line 199
    .end local v4    # "textRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_4
    :goto_2
    sget-object v4, Lcom/itextpdf/layout/properties/ListNumberingType;->GREEK_LOWER:Lcom/itextpdf/layout/properties/ListNumberingType;

    if-eq v1, v4, :cond_6

    sget-object v4, Lcom/itextpdf/layout/properties/ListNumberingType;->GREEK_UPPER:Lcom/itextpdf/layout/properties/ListNumberingType;

    if-ne v1, v4, :cond_5

    goto :goto_3

    :cond_5
    const-string v4, "ZapfDingbats"

    goto :goto_4

    :cond_6
    :goto_3
    const-string v4, "Symbol"

    .line 202
    .local v4, "constantFont":Ljava/lang/String;
    :goto_4
    new-instance v5, Lcom/itextpdf/layout/renderer/ListRenderer$ConstantFontTextRenderer;

    invoke-direct {v5, v3, v4}, Lcom/itextpdf/layout/renderer/ListRenderer$ConstantFontTextRenderer;-><init>(Lcom/itextpdf/layout/element/Text;Ljava/lang/String;)V

    .line 204
    .local v5, "textRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    :try_start_0
    invoke-static {v4}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createFont(Ljava/lang/String;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v6

    const/16 v7, 0x14

    invoke-interface {v5, v7, v6}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 206
    goto :goto_5

    .line 205
    :catch_0
    move-exception v6

    .line 207
    .end local v4    # "constantFont":Ljava/lang/String;
    :goto_5
    move-object v4, v5

    .line 210
    .end local v5    # "textRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v4, "textRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    :goto_6
    invoke-direct {p0, v4}, Lcom/itextpdf/layout/renderer/ListRenderer;->surroundTextBullet(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/LineRenderer;

    move-result-object v5

    return-object v5

    .line 211
    .end local v1    # "numberingType":Lcom/itextpdf/layout/properties/ListNumberingType;
    .end local v2    # "numberText":Ljava/lang/String;
    .end local v3    # "textElement":Lcom/itextpdf/layout/element/Text;
    .end local v4    # "textRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_7
    instance-of v1, v0, Lcom/itextpdf/layout/properties/IListSymbolFactory;

    if-eqz v1, :cond_8

    .line 212
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/layout/properties/IListSymbolFactory;

    invoke-interface {v1, p1, p0, p2}, Lcom/itextpdf/layout/properties/IListSymbolFactory;->createSymbol(ILcom/itextpdf/layout/IPropertyContainer;Lcom/itextpdf/layout/IPropertyContainer;)Lcom/itextpdf/layout/element/IElement;

    move-result-object v1

    invoke-interface {v1}, Lcom/itextpdf/layout/element/IElement;->createRendererSubTree()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/itextpdf/layout/renderer/ListRenderer;->surroundTextBullet(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/LineRenderer;

    move-result-object v1

    return-object v1

    .line 213
    :cond_8
    if-nez v0, :cond_9

    .line 215
    const/4 v1, 0x0

    return-object v1

    .line 217
    :cond_9
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method static getListItemOrListProperty(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;I)Ljava/lang/Object;
    .locals 1
    .param p0, "listItem"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p1, "list"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p2, "propertyId"    # I

    .line 138
    invoke-interface {p0, p2}, Lcom/itextpdf/layout/renderer/IRenderer;->hasProperty(I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p0, p2}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-interface {p1, p2}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method private initializeListSymbols(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;
    .locals 19
    .param p1, "layoutContext"    # Lcom/itextpdf/layout/layout/LayoutContext;

    .line 304
    move-object/from16 v4, p0

    const/16 v0, 0x28

    invoke-virtual {v4, v0}, Lcom/itextpdf/layout/renderer/ListRenderer;->hasOwnProperty(I)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_12

    .line 305
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v6, v0

    .line 306
    .local v6, "symbolRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    const/16 v0, 0x24

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v4, v0, v3}, Lcom/itextpdf/layout/renderer/ListRenderer;->getProperty(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 307
    .local v0, "listItemNum":I
    const/4 v3, 0x0

    move v7, v3

    .local v7, "i":I
    :goto_0
    iget-object v3, v4, Lcom/itextpdf/layout/renderer/ListRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    const/4 v8, 0x7

    if-ge v7, v3, :cond_6

    .line 308
    iget-object v3, v4, Lcom/itextpdf/layout/renderer/ListRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v3, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v3, v4}, Lcom/itextpdf/layout/renderer/IRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    .line 309
    iget-object v3, v4, Lcom/itextpdf/layout/renderer/ListRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v3, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/renderer/IRenderer;

    const/16 v9, 0x78

    invoke-interface {v3, v9}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_0

    iget-object v3, v4, Lcom/itextpdf/layout/renderer/ListRenderer;->childRenderers:Ljava/util/List;

    .line 310
    invoke-interface {v3, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v3, v9}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    goto :goto_1

    :cond_0
    move v3, v0

    .line 312
    .end local v0    # "listItemNum":I
    .local v3, "listItemNum":I
    :goto_1
    iget-object v0, v4, Lcom/itextpdf/layout/renderer/ListRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-virtual {v4, v3, v0}, Lcom/itextpdf/layout/renderer/ListRenderer;->makeListSymbolRenderer(ILcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    .line 313
    .local v0, "currentSymbolRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    if-eqz v0, :cond_1

    sget-object v9, Lcom/itextpdf/layout/properties/BaseDirection;->RIGHT_TO_LEFT:Lcom/itextpdf/layout/properties/BaseDirection;

    .line 314
    invoke-virtual {v4, v8}, Lcom/itextpdf/layout/renderer/ListRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v10

    if-ne v9, v10, :cond_1

    .line 315
    sget-object v9, Lcom/itextpdf/layout/properties/BaseDirection;->RIGHT_TO_LEFT:Lcom/itextpdf/layout/properties/BaseDirection;

    invoke-interface {v0, v8, v9}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 317
    :cond_1
    const/4 v8, 0x0

    .line 318
    .local v8, "listSymbolLayoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    if-eqz v0, :cond_2

    .line 319
    add-int/lit8 v3, v3, 0x1

    .line 320
    iget-object v9, v4, Lcom/itextpdf/layout/renderer/ListRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v9, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v0, v9}, Lcom/itextpdf/layout/renderer/IRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    .line 321
    move-object/from16 v9, p1

    invoke-interface {v0, v9}, Lcom/itextpdf/layout/renderer/IRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v8

    .line 322
    invoke-interface {v0, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->setParent(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    move-object v10, v8

    move v8, v3

    goto :goto_2

    .line 318
    :cond_2
    move-object/from16 v9, p1

    move-object v10, v8

    move v8, v3

    .line 324
    .end local v3    # "listItemNum":I
    .local v8, "listItemNum":I
    .local v10, "listSymbolLayoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    :goto_2
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v11, 0x1a

    invoke-virtual {v4, v11}, Lcom/itextpdf/layout/renderer/ListRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v11

    invoke-virtual {v3, v11}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v11

    .line 325
    .local v11, "isForcedPlacement":Z
    if-eqz v10, :cond_3

    .line 326
    invoke-virtual {v10}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v3

    if-eq v3, v2, :cond_3

    move v5, v2

    goto :goto_3

    :cond_3
    const/4 v5, 0x0

    :goto_3
    move v12, v5

    .line 328
    .local v12, "listSymbolNotFit":Z
    if-eqz v12, :cond_4

    if-eqz v11, :cond_4

    .line 329
    const/4 v0, 0x0

    move-object v13, v0

    goto :goto_4

    .line 331
    :cond_4
    move-object v13, v0

    .end local v0    # "currentSymbolRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .local v13, "currentSymbolRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    :goto_4
    invoke-interface {v6, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 332
    if-eqz v12, :cond_5

    if-nez v11, :cond_5

    .line 333
    new-instance v0, Lcom/itextpdf/layout/layout/LayoutResult;

    .line 334
    invoke-virtual {v10}, Lcom/itextpdf/layout/layout/LayoutResult;->getCauseOfNothing()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v5

    const/4 v1, 0x3

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/layout/layout/LayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 333
    return-object v0

    .line 307
    .end local v10    # "listSymbolLayoutResult":Lcom/itextpdf/layout/layout/LayoutResult;
    .end local v11    # "isForcedPlacement":Z
    .end local v12    # "listSymbolNotFit":Z
    .end local v13    # "currentSymbolRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_5
    add-int/lit8 v7, v7, 0x1

    move v0, v8

    goto/16 :goto_0

    .end local v8    # "listItemNum":I
    .local v0, "listItemNum":I
    :cond_6
    move-object/from16 v9, p1

    .line 338
    .end local v7    # "i":I
    const/4 v3, 0x0

    .line 339
    .local v3, "maxSymbolWidth":F
    const/4 v7, 0x0

    .restart local v7    # "i":I
    :goto_5
    iget-object v10, v4, Lcom/itextpdf/layout/renderer/ListRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    const/16 v11, 0x53

    if-ge v7, v10, :cond_8

    .line 340
    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 341
    .local v10, "symbolRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    if-eqz v10, :cond_7

    .line 342
    iget-object v12, v4, Lcom/itextpdf/layout/renderer/ListRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v12, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 343
    .local v12, "listItemRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-static {v12, v4, v11}, Lcom/itextpdf/layout/renderer/ListRenderer;->getListItemOrListProperty(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/itextpdf/layout/properties/ListSymbolPosition;

    sget-object v13, Lcom/itextpdf/layout/properties/ListSymbolPosition;->INSIDE:Lcom/itextpdf/layout/properties/ListSymbolPosition;

    if-eq v11, v13, :cond_7

    .line 345
    nop

    .line 346
    invoke-interface {v10}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v11

    invoke-virtual {v11}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v11

    invoke-virtual {v11}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v11

    .line 345
    invoke-static {v3, v11}, Ljava/lang/Math;->max(FF)F

    move-result v3

    .line 339
    .end local v10    # "symbolRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v12    # "listItemRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    :cond_7
    add-int/lit8 v7, v7, 0x1

    goto :goto_5

    .line 351
    .end local v7    # "i":I
    :cond_8
    const/16 v7, 0x27

    invoke-virtual {v4, v7}, Lcom/itextpdf/layout/renderer/ListRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v7

    .line 352
    .local v7, "symbolIndent":Ljava/lang/Float;
    const/4 v0, 0x0

    .line 353
    iget-object v10, v4, Lcom/itextpdf/layout/renderer/ListRenderer;->childRenderers:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_6
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_11

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 355
    .local v12, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    sget-object v13, Lcom/itextpdf/layout/properties/BaseDirection;->RIGHT_TO_LEFT:Lcom/itextpdf/layout/properties/BaseDirection;

    .line 356
    invoke-interface {v12, v8}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v14

    if-ne v13, v14, :cond_9

    move v13, v2

    goto :goto_7

    :cond_9
    const/4 v13, 0x0

    .line 357
    .local v13, "isRtl":Z
    :goto_7
    if-eqz v13, :cond_a

    const/16 v14, 0x2d

    goto :goto_8

    :cond_a
    const/16 v14, 0x2c

    .line 358
    .local v14, "marginToSet":I
    :goto_8
    invoke-interface {v12, v14}, Lcom/itextpdf/layout/renderer/IRenderer;->deleteOwnProperty(I)V

    .line 359
    nop

    .line 360
    const/4 v15, 0x0

    move-object/from16 v16, v1

    invoke-static {v15}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v1

    invoke-interface {v12, v14, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/UnitValue;

    .line 361
    .local v1, "marginToSetUV":Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v17

    if-nez v17, :cond_b

    .line 362
    const-class v17, Lcom/itextpdf/layout/renderer/ListRenderer;

    invoke-static/range {v17 .. v17}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v5

    .line 363
    .local v5, "logger":Lorg/slf4j/Logger;
    nop

    .line 365
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    filled-new-array/range {v17 .. v17}, [Ljava/lang/Object;

    move-result-object v8

    .line 363
    const-string v15, "Property {0} in percents is not supported"

    invoke-static {v15, v8}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v5, v8}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 367
    .end local v5    # "logger":Lorg/slf4j/Logger;
    :cond_b
    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v5

    .line 368
    .local v5, "calculatedMargin":F
    invoke-static {v12, v4, v11}, Lcom/itextpdf/layout/renderer/ListRenderer;->getListItemOrListProperty(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/layout/properties/ListSymbolPosition;

    sget-object v15, Lcom/itextpdf/layout/properties/ListSymbolPosition;->DEFAULT:Lcom/itextpdf/layout/properties/ListSymbolPosition;

    if-ne v8, v15, :cond_d

    .line 370
    if-eqz v7, :cond_c

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v15

    goto :goto_9

    :cond_c
    const/4 v15, 0x0

    :goto_9
    add-float/2addr v15, v3

    add-float/2addr v5, v15

    .line 372
    :cond_d
    invoke-static {v5}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v8

    invoke-interface {v12, v14, v8}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 374
    add-int/lit8 v8, v0, 0x1

    .end local v0    # "listItemNum":I
    .restart local v8    # "listItemNum":I
    invoke-interface {v6, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 375
    .local v0, "symbolRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    move-object v15, v12

    check-cast v15, Lcom/itextpdf/layout/renderer/ListItemRenderer;

    invoke-virtual {v15, v0, v3}, Lcom/itextpdf/layout/renderer/ListItemRenderer;->addSymbolRenderer(Lcom/itextpdf/layout/renderer/IRenderer;F)V

    .line 376
    if-eqz v0, :cond_10

    .line 377
    const/16 v15, 0x6c

    invoke-virtual {v4, v15}, Lcom/itextpdf/layout/renderer/ListRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;

    .line 378
    .local v15, "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    if-eqz v15, :cond_f

    .line 379
    instance-of v11, v0, Lcom/itextpdf/layout/renderer/LineRenderer;

    const-string v2, "Lbl"

    if-eqz v11, :cond_e

    .line 380
    invoke-interface {v0}, Lcom/itextpdf/layout/renderer/IRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v11

    move-object/from16 v18, v1

    const/4 v1, 0x1

    .end local v1    # "marginToSetUV":Lcom/itextpdf/layout/properties/UnitValue;
    .local v18, "marginToSetUV":Lcom/itextpdf/layout/properties/UnitValue;
    invoke-interface {v11, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/itextpdf/layout/IPropertyContainer;

    invoke-virtual {v15, v11, v2}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->setRoleHint(Lcom/itextpdf/layout/IPropertyContainer;Ljava/lang/String;)V

    goto :goto_a

    .line 382
    .end local v18    # "marginToSetUV":Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v1    # "marginToSetUV":Lcom/itextpdf/layout/properties/UnitValue;
    :cond_e
    move-object/from16 v18, v1

    const/4 v1, 0x1

    .end local v1    # "marginToSetUV":Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v18    # "marginToSetUV":Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {v15, v0, v2}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->setRoleHint(Lcom/itextpdf/layout/IPropertyContainer;Ljava/lang/String;)V

    goto :goto_a

    .line 378
    .end local v18    # "marginToSetUV":Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v1    # "marginToSetUV":Lcom/itextpdf/layout/properties/UnitValue;
    :cond_f
    move-object/from16 v18, v1

    move v1, v2

    .end local v1    # "marginToSetUV":Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v18    # "marginToSetUV":Lcom/itextpdf/layout/properties/UnitValue;
    goto :goto_a

    .line 376
    .end local v15    # "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    .end local v18    # "marginToSetUV":Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v1    # "marginToSetUV":Lcom/itextpdf/layout/properties/UnitValue;
    :cond_10
    move-object/from16 v18, v1

    move v1, v2

    .line 386
    .end local v0    # "symbolRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v1    # "marginToSetUV":Lcom/itextpdf/layout/properties/UnitValue;
    .end local v5    # "calculatedMargin":F
    .end local v12    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    .end local v13    # "isRtl":Z
    .end local v14    # "marginToSet":I
    :goto_a
    move v2, v1

    move v0, v8

    move-object/from16 v1, v16

    const/4 v8, 0x7

    const/16 v11, 0x53

    goto/16 :goto_6

    .line 353
    .end local v8    # "listItemNum":I
    .local v0, "listItemNum":I
    :cond_11
    move-object/from16 v16, v1

    goto :goto_b

    .line 304
    .end local v0    # "listItemNum":I
    .end local v3    # "maxSymbolWidth":F
    .end local v6    # "symbolRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    .end local v7    # "symbolIndent":Ljava/lang/Float;
    :cond_12
    move-object/from16 v9, p1

    move-object/from16 v16, v1

    .line 388
    :goto_b
    return-object v16
.end method

.method private surroundTextBullet(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/LineRenderer;
    .locals 4
    .param p1, "bulletRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 224
    new-instance v0, Lcom/itextpdf/layout/renderer/LineRenderer;

    invoke-direct {v0}, Lcom/itextpdf/layout/renderer/LineRenderer;-><init>()V

    .line 225
    .local v0, "lineRenderer":Lcom/itextpdf/layout/renderer/LineRenderer;
    new-instance v1, Lcom/itextpdf/layout/element/Text;

    const-string/jumbo v2, "\u200d"

    invoke-direct {v1, v2}, Lcom/itextpdf/layout/element/Text;-><init>(Ljava/lang/String;)V

    .line 226
    .local v1, "zeroWidthJoiner":Lcom/itextpdf/layout/element/Text;
    invoke-virtual {v1}, Lcom/itextpdf/layout/element/Text;->getAccessibilityProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    move-result-object v2

    const-string v3, "Artifact"

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->setRole(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    .line 227
    new-instance v2, Lcom/itextpdf/layout/renderer/TextRenderer;

    invoke-direct {v2, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;-><init>(Lcom/itextpdf/layout/element/Text;)V

    .line 228
    .local v2, "zeroWidthJoinerRenderer":Lcom/itextpdf/layout/renderer/TextRenderer;
    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/LineRenderer;->addChild(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 229
    invoke-virtual {v0, p1}, Lcom/itextpdf/layout/renderer/LineRenderer;->addChild(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 230
    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/LineRenderer;->addChild(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 231
    return-object v0
.end method


# virtual methods
.method protected createOverflowRenderer(I)Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .locals 3
    .param p1, "layoutResult"    # I

    .line 113
    invoke-super {p0, p1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->createOverflowRenderer(I)Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v0

    .line 114
    .local v0, "overflowRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/ListRenderer;->getOwnProperties()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->addAllProperties(Ljava/util/Map;)V

    .line 115
    const/16 v1, 0x28

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    .line 116
    return-object v0
.end method

.method protected createSplitRenderer(I)Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .locals 3
    .param p1, "layoutResult"    # I

    .line 105
    invoke-super {p0, p1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->createSplitRenderer(I)Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-result-object v0

    .line 106
    .local v0, "splitRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/ListRenderer;->getOwnProperties()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->addAllProperties(Ljava/util/Map;)V

    .line 107
    const/16 v1, 0x28

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    .line 108
    return-object v0
.end method

.method public getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .locals 5

    .line 121
    new-instance v0, Lcom/itextpdf/layout/layout/LayoutContext;

    new-instance v1, Lcom/itextpdf/layout/layout/LayoutArea;

    new-instance v2, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-static {}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidthUtils;->getInfWidth()F

    move-result v3

    const v4, 0x49742400    # 1000000.0f

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FF)V

    const/4 v3, 0x1

    invoke-direct {v1, v3, v2}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;)V

    invoke-direct {p0, v0}, Lcom/itextpdf/layout/renderer/ListRenderer;->initializeListSymbols(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v0

    .line 122
    .local v0, "errorResult":Lcom/itextpdf/layout/layout/LayoutResult;
    if-eqz v0, :cond_0

    .line 123
    invoke-static {p0}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidthUtils;->countDefaultMinMaxWidth(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v1

    return-object v1

    .line 125
    :cond_0
    invoke-super {p0}, Lcom/itextpdf/layout/renderer/BlockRenderer;->getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v1

    return-object v1
.end method

.method public getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 2

    .line 99
    const-class v0, Lcom/itextpdf/layout/renderer/ListRenderer;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/ListRenderer;->logWarningIfGetNextRendererNotOverridden(Ljava/lang/Class;Ljava/lang/Class;)Z

    .line 100
    new-instance v0, Lcom/itextpdf/layout/renderer/ListRenderer;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/ListRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    check-cast v1, Lcom/itextpdf/layout/element/List;

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/renderer/ListRenderer;-><init>(Lcom/itextpdf/layout/element/List;)V

    return-object v0
.end method

.method public layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;
    .locals 6
    .param p1, "layoutContext"    # Lcom/itextpdf/layout/layout/LayoutContext;

    .line 70
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/renderer/ListRenderer;->initializeListSymbols(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v0

    .line 71
    .local v0, "errorResult":Lcom/itextpdf/layout/layout/LayoutResult;
    if-eqz v0, :cond_0

    .line 72
    return-object v0

    .line 74
    :cond_0
    invoke-super {p0, p1}, Lcom/itextpdf/layout/renderer/BlockRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v1

    .line 76
    .local v1, "result":Lcom/itextpdf/layout/layout/LayoutResult;
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v3, 0x1a

    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/renderer/ListRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutResult;->getCauseOfNothing()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 77
    const/4 v2, 0x1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v3

    if-ne v2, v3, :cond_1

    .line 78
    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutResult;->getCauseOfNothing()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v2

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutResult;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v3

    const/4 v4, 0x0

    invoke-direct {p0, p0, v4, v2, v3}, Lcom/itextpdf/layout/renderer/ListRenderer;->correctListSplitting(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/layout/LayoutArea;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v1

    goto :goto_0

    .line 79
    :cond_1
    const/4 v2, 0x2

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v3

    if-ne v2, v3, :cond_2

    .line 80
    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v2

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutResult;->getOverflowRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v3

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutResult;->getCauseOfNothing()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v4

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutResult;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v5

    invoke-direct {p0, v2, v3, v4, v5}, Lcom/itextpdf/layout/renderer/ListRenderer;->correctListSplitting(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/layout/LayoutArea;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v1

    .line 83
    :cond_2
    :goto_0
    return-object v1
.end method

.method protected makeListSymbolRenderer(ILcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 3
    .param p1, "index"    # I
    .param p2, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 129
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/layout/renderer/ListRenderer;->createListSymbolRenderer(ILcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    .line 131
    .local v0, "symbolRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    if-eqz v0, :cond_0

    .line 132
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const/16 v2, 0x4a

    invoke-interface {v0, v2, v1}, Lcom/itextpdf/layout/renderer/IRenderer;->setProperty(ILjava/lang/Object;)V

    .line 134
    :cond_0
    return-object v0
.end method
