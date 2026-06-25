.class public Lcom/itextpdf/kernel/font/Type3Font;
.super Lcom/itextpdf/io/font/FontProgram;
.source "Type3Font.java"


# instance fields
.field private colorized:Z

.field private flags:I

.field private final type3Glyphs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/kernel/font/Type3Glyph;",
            ">;"
        }
    .end annotation
.end field

.field private final type3GlyphsWithoutUnicode:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/kernel/font/Type3Glyph;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Z)V
    .locals 2
    .param p1, "colorized"    # Z

    .line 55
    invoke-direct {p0}, Lcom/itextpdf/io/font/FontProgram;-><init>()V

    .line 42
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/font/Type3Font;->type3Glyphs:Ljava/util/Map;

    .line 46
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/font/Type3Font;->type3GlyphsWithoutUnicode:Ljava/util/Map;

    .line 47
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/font/Type3Font;->colorized:Z

    .line 48
    iput v0, p0, Lcom/itextpdf/kernel/font/Type3Font;->flags:I

    .line 56
    iput-boolean p1, p0, Lcom/itextpdf/kernel/font/Type3Font;->colorized:Z

    .line 57
    new-instance v1, Lcom/itextpdf/io/font/FontNames;

    invoke-direct {v1}, Lcom/itextpdf/io/font/FontNames;-><init>()V

    iput-object v1, p0, Lcom/itextpdf/kernel/font/Type3Font;->fontNames:Lcom/itextpdf/io/font/FontNames;

    .line 58
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/Type3Font;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v1

    invoke-virtual {v1, v0, v0, v0, v0}, Lcom/itextpdf/io/font/FontMetrics;->setBbox(IIII)V

    .line 59
    return-void
.end method

.method private recalculateAverageWidth()V
    .locals 5

    .line 240
    const/4 v0, 0x0

    .line 241
    .local v0, "widthSum":I
    iget-object v1, p0, Lcom/itextpdf/kernel/font/Type3Font;->codeToGlyph:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    .line 242
    .local v1, "glyphsNumber":I
    iget-object v2, p0, Lcom/itextpdf/kernel/font/Type3Font;->codeToGlyph:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/io/font/otf/Glyph;

    .line 243
    .local v3, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-virtual {v3}, Lcom/itextpdf/io/font/otf/Glyph;->getWidth()I

    move-result v4

    if-nez v4, :cond_0

    .line 244
    add-int/lit8 v1, v1, -0x1

    .line 245
    goto :goto_0

    .line 247
    :cond_0
    invoke-virtual {v3}, Lcom/itextpdf/io/font/otf/Glyph;->getWidth()I

    move-result v4

    add-int/2addr v0, v4

    .line 248
    .end local v3    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    goto :goto_0

    .line 249
    :cond_1
    if-nez v1, :cond_2

    const/4 v2, 0x0

    goto :goto_1

    :cond_2
    div-int v2, v0, v1

    :goto_1
    iput v2, p0, Lcom/itextpdf/kernel/font/Type3Font;->avgWidth:I

    .line 250
    return-void
.end method

.method private removeGlyphFromMappings(I)V
    .locals 4
    .param p1, "glyphCode"    # I

    .line 226
    iget-object v0, p0, Lcom/itextpdf/kernel/font/Type3Font;->codeToGlyph:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/font/otf/Glyph;

    .line 227
    .local v0, "removed":Lcom/itextpdf/io/font/otf/Glyph;
    if-nez v0, :cond_0

    .line 228
    return-void

    .line 230
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v1

    .line 231
    .local v1, "unicode":I
    if-gez v1, :cond_1

    .line 232
    iget-object v2, p0, Lcom/itextpdf/kernel/font/Type3Font;->type3GlyphsWithoutUnicode:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 234
    :cond_1
    iget-object v2, p0, Lcom/itextpdf/kernel/font/Type3Font;->unicodeToGlyph:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 235
    iget-object v2, p0, Lcom/itextpdf/kernel/font/Type3Font;->type3Glyphs:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 237
    :goto_0
    return-void
.end method


# virtual methods
.method addGlyph(III[ILcom/itextpdf/kernel/font/Type3Glyph;)V
    .locals 3
    .param p1, "code"    # I
    .param p2, "unicode"    # I
    .param p3, "width"    # I
    .param p4, "bbox"    # [I
    .param p5, "type3Glyph"    # Lcom/itextpdf/kernel/font/Type3Glyph;

    .line 211
    iget-object v0, p0, Lcom/itextpdf/kernel/font/Type3Font;->codeToGlyph:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 212
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/font/Type3Font;->removeGlyphFromMappings(I)V

    .line 214
    :cond_0
    new-instance v0, Lcom/itextpdf/io/font/otf/Glyph;

    invoke-direct {v0, p1, p3, p2, p4}, Lcom/itextpdf/io/font/otf/Glyph;-><init>(III[I)V

    .line 215
    .local v0, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    iget-object v1, p0, Lcom/itextpdf/kernel/font/Type3Font;->codeToGlyph:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    if-gez p2, :cond_1

    .line 217
    iget-object v1, p0, Lcom/itextpdf/kernel/font/Type3Font;->type3GlyphsWithoutUnicode:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2, p5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 219
    :cond_1
    iget-object v1, p0, Lcom/itextpdf/kernel/font/Type3Font;->unicodeToGlyph:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    iget-object v1, p0, Lcom/itextpdf/kernel/font/Type3Font;->type3Glyphs:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2, p5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 222
    :goto_0
    invoke-direct {p0}, Lcom/itextpdf/kernel/font/Type3Font;->recalculateAverageWidth()V

    .line 223
    return-void
.end method

.method public getKerning(Lcom/itextpdf/io/font/otf/Glyph;Lcom/itextpdf/io/font/otf/Glyph;)I
    .locals 1
    .param p1, "glyph1"    # Lcom/itextpdf/io/font/otf/Glyph;
    .param p2, "glyph2"    # Lcom/itextpdf/io/font/otf/Glyph;

    .line 103
    const/4 v0, 0x0

    return v0
.end method

.method public getNumberOfGlyphs()I
    .locals 2

    .line 115
    iget-object v0, p0, Lcom/itextpdf/kernel/font/Type3Font;->type3Glyphs:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    iget-object v1, p0, Lcom/itextpdf/kernel/font/Type3Font;->type3GlyphsWithoutUnicode:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getPdfFontFlags()I
    .locals 1

    .line 89
    iget v0, p0, Lcom/itextpdf/kernel/font/Type3Font;->flags:I

    return v0
.end method

.method public getType3Glyph(I)Lcom/itextpdf/kernel/font/Type3Glyph;
    .locals 2
    .param p1, "unicode"    # I

    .line 69
    iget-object v0, p0, Lcom/itextpdf/kernel/font/Type3Font;->type3Glyphs:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/font/Type3Glyph;

    return-object v0
.end method

.method public getType3GlyphByCode(I)Lcom/itextpdf/kernel/font/Type3Glyph;
    .locals 4
    .param p1, "code"    # I

    .line 80
    iget-object v0, p0, Lcom/itextpdf/kernel/font/Type3Font;->type3GlyphsWithoutUnicode:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/font/Type3Glyph;

    .line 81
    .local v0, "glyph":Lcom/itextpdf/kernel/font/Type3Glyph;
    if-nez v0, :cond_0

    iget-object v1, p0, Lcom/itextpdf/kernel/font/Type3Font;->codeToGlyph:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 82
    iget-object v1, p0, Lcom/itextpdf/kernel/font/Type3Font;->type3Glyphs:Ljava/util/Map;

    iget-object v2, p0, Lcom/itextpdf/kernel/font/Type3Font;->codeToGlyph:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/io/font/otf/Glyph;

    invoke-virtual {v2}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Lcom/itextpdf/kernel/font/Type3Glyph;

    .line 84
    :cond_0
    return-object v0
.end method

.method public isColorized()Z
    .locals 1

    .line 98
    iget-boolean v0, p0, Lcom/itextpdf/kernel/font/Type3Font;->colorized:Z

    return v0
.end method

.method public isFontSpecific()Z
    .locals 1

    .line 94
    const/4 v0, 0x0

    return v0
.end method

.method protected setCapHeight(I)V
    .locals 0
    .param p1, "capHeight"    # I

    .line 170
    invoke-super {p0, p1}, Lcom/itextpdf/io/font/FontProgram;->setCapHeight(I)V

    .line 171
    return-void
.end method

.method protected setFontFamily(Ljava/lang/String;)V
    .locals 0
    .param p1, "fontFamily"    # Ljava/lang/String;

    .line 139
    invoke-super {p0, p1}, Lcom/itextpdf/io/font/FontProgram;->setFontFamily(Ljava/lang/String;)V

    .line 140
    return-void
.end method

.method protected setFontName(Ljava/lang/String;)V
    .locals 0
    .param p1, "fontName"    # Ljava/lang/String;

    .line 128
    invoke-super {p0, p1}, Lcom/itextpdf/io/font/FontProgram;->setFontName(Ljava/lang/String;)V

    .line 129
    return-void
.end method

.method protected setFontStretch(Ljava/lang/String;)V
    .locals 0
    .param p1, "fontWidth"    # Ljava/lang/String;

    .line 161
    invoke-super {p0, p1}, Lcom/itextpdf/io/font/FontProgram;->setFontStretch(Ljava/lang/String;)V

    .line 162
    return-void
.end method

.method protected setFontWeight(I)V
    .locals 0
    .param p1, "fontWeight"    # I

    .line 150
    invoke-super {p0, p1}, Lcom/itextpdf/io/font/FontProgram;->setFontWeight(I)V

    .line 151
    return-void
.end method

.method protected setItalicAngle(I)V
    .locals 0
    .param p1, "italicAngle"    # I

    .line 179
    invoke-super {p0, p1}, Lcom/itextpdf/io/font/FontProgram;->setItalicAngle(I)V

    .line 180
    return-void
.end method

.method setPdfFontFlags(I)V
    .locals 0
    .param p1, "flags"    # I

    .line 207
    iput p1, p0, Lcom/itextpdf/kernel/font/Type3Font;->flags:I

    .line 208
    return-void
.end method

.method protected setTypoAscender(I)V
    .locals 0
    .param p1, "ascender"    # I

    .line 188
    invoke-super {p0, p1}, Lcom/itextpdf/io/font/FontProgram;->setTypoAscender(I)V

    .line 189
    return-void
.end method

.method protected setTypoDescender(I)V
    .locals 0
    .param p1, "descender"    # I

    .line 197
    invoke-super {p0, p1}, Lcom/itextpdf/io/font/FontProgram;->setTypoDescender(I)V

    .line 198
    return-void
.end method
