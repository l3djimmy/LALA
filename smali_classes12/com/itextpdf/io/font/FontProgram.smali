.class public abstract Lcom/itextpdf/io/font/FontProgram;
.super Ljava/lang/Object;
.source "FontProgram.java"


# static fields
.field public static final DEFAULT_WIDTH:I = 0x3e8

.field public static final HORIZONTAL_SCALING_FACTOR:I = 0x64

.field public static final UNITS_NORMALIZATION:I = 0x3e8


# instance fields
.field protected avgWidth:I

.field protected codeToGlyph:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/io/font/otf/Glyph;",
            ">;"
        }
    .end annotation
.end field

.field protected encodingScheme:Ljava/lang/String;

.field protected fontIdentification:Lcom/itextpdf/io/font/FontIdentification;

.field protected fontMetrics:Lcom/itextpdf/io/font/FontMetrics;

.field protected fontNames:Lcom/itextpdf/io/font/FontNames;

.field protected isFontSpecific:Z

.field protected registry:Ljava/lang/String;

.field protected unicodeToGlyph:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/io/font/otf/Glyph;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/FontProgram;->codeToGlyph:Ljava/util/Map;

    .line 60
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/FontProgram;->unicodeToGlyph:Ljava/util/Map;

    .line 64
    new-instance v0, Lcom/itextpdf/io/font/FontMetrics;

    invoke-direct {v0}, Lcom/itextpdf/io/font/FontMetrics;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/FontProgram;->fontMetrics:Lcom/itextpdf/io/font/FontMetrics;

    .line 65
    new-instance v0, Lcom/itextpdf/io/font/FontIdentification;

    invoke-direct {v0}, Lcom/itextpdf/io/font/FontIdentification;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/FontProgram;->fontIdentification:Lcom/itextpdf/io/font/FontIdentification;

    .line 74
    const-string v0, "FontSpecific"

    iput-object v0, p0, Lcom/itextpdf/io/font/FontProgram;->encodingScheme:Ljava/lang/String;

    return-void
.end method

.method public static convertGlyphSpaceToTextSpace(D)D
    .locals 2
    .param p0, "value"    # D

    .line 50
    const-wide v0, 0x408f400000000000L    # 1000.0

    mul-double/2addr v0, p0

    return-wide v0
.end method

.method public static convertGlyphSpaceToTextSpace(F)F
    .locals 1
    .param p0, "value"    # F

    .line 46
    const/high16 v0, 0x447a0000    # 1000.0f

    mul-float/2addr v0, p0

    return v0
.end method

.method public static convertGlyphSpaceToTextSpace(I)I
    .locals 1
    .param p0, "value"    # I

    .line 54
    mul-int/lit16 v0, p0, 0x3e8

    return v0
.end method

.method public static convertTextSpaceToGlyphSpace(F)F
    .locals 1
    .param p0, "value"    # F

    .line 42
    const/high16 v0, 0x447a0000    # 1000.0f

    div-float v0, p0, v0

    return v0
.end method

.method static trimFontStyle(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "name"    # Ljava/lang/String;

    .line 191
    if-nez p0, :cond_0

    .line 192
    const/4 v0, 0x0

    return-object v0

    .line 194
    :cond_0
    const-string v0, ",Bold"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 195
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x5

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 196
    :cond_1
    const-string v0, ",Italic"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 197
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x7

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 198
    :cond_2
    const-string v0, ",BoldItalic"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 199
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0xb

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 201
    :cond_3
    return-object p0
.end method


# virtual methods
.method public countOfGlyphs()I
    .locals 2

    .line 79
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgram;->codeToGlyph:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    iget-object v1, p0, Lcom/itextpdf/io/font/FontProgram;->unicodeToGlyph:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method protected fixSpaceIssue()V
    .locals 3

    .line 315
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgram;->unicodeToGlyph:Ljava/util/Map;

    const/16 v1, 0x20

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/font/otf/Glyph;

    .line 316
    .local v0, "space":Lcom/itextpdf/io/font/otf/Glyph;
    if-eqz v0, :cond_0

    .line 317
    iget-object v1, p0, Lcom/itextpdf/io/font/FontProgram;->codeToGlyph:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 319
    :cond_0
    return-void
.end method

.method public getAvgWidth()I
    .locals 1

    .line 117
    iget v0, p0, Lcom/itextpdf/io/font/FontProgram;->avgWidth:I

    return v0
.end method

.method public getCharBBox(I)[I
    .locals 2
    .param p1, "unicode"    # I

    .line 128
    invoke-virtual {p0, p1}, Lcom/itextpdf/io/font/FontProgram;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    .line 129
    .local v0, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/Glyph;->getBbox()[I

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method

.method public getFontIdentification()Lcom/itextpdf/io/font/FontIdentification;
    .locals 1

    .line 91
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgram;->fontIdentification:Lcom/itextpdf/io/font/FontIdentification;

    return-object v0
.end method

.method public getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;
    .locals 1

    .line 87
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgram;->fontMetrics:Lcom/itextpdf/io/font/FontMetrics;

    return-object v0
.end method

.method public getFontNames()Lcom/itextpdf/io/font/FontNames;
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgram;->fontNames:Lcom/itextpdf/io/font/FontNames;

    return-object v0
.end method

.method public getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;
    .locals 2
    .param p1, "unicode"    # I

    .line 133
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgram;->unicodeToGlyph:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/font/otf/Glyph;

    return-object v0
.end method

.method public getGlyphByCode(I)Lcom/itextpdf/io/font/otf/Glyph;
    .locals 2
    .param p1, "charCode"    # I

    .line 138
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgram;->codeToGlyph:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/font/otf/Glyph;

    return-object v0
.end method

.method public getKerning(II)I
    .locals 3
    .param p1, "first"    # I
    .param p2, "second"    # I

    .line 154
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgram;->unicodeToGlyph:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/font/otf/Glyph;

    iget-object v1, p0, Lcom/itextpdf/io/font/FontProgram;->unicodeToGlyph:Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/io/font/otf/Glyph;

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/io/font/FontProgram;->getKerning(Lcom/itextpdf/io/font/otf/Glyph;Lcom/itextpdf/io/font/otf/Glyph;)I

    move-result v0

    return v0
.end method

.method public abstract getKerning(Lcom/itextpdf/io/font/otf/Glyph;Lcom/itextpdf/io/font/otf/Glyph;)I
.end method

.method public abstract getPdfFontFlags()I
.end method

.method public getRegistry()Ljava/lang/String;
    .locals 1

    .line 95
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgram;->registry:Ljava/lang/String;

    return-object v0
.end method

.method public getWidth(I)I
    .locals 2
    .param p1, "unicode"    # I

    .line 112
    invoke-virtual {p0, p1}, Lcom/itextpdf/io/font/FontProgram;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    .line 113
    .local v0, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/Glyph;->getWidth()I

    move-result v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public hasKernPairs()Z
    .locals 1

    .line 142
    const/4 v0, 0x0

    return v0
.end method

.method public isBuiltWith(Ljava/lang/String;)Z
    .locals 1
    .param p1, "fontName"    # Ljava/lang/String;

    .line 176
    const/4 v0, 0x0

    return v0
.end method

.method public isFontSpecific()Z
    .locals 1

    .line 101
    iget-boolean v0, p0, Lcom/itextpdf/io/font/FontProgram;->isFontSpecific:Z

    return v0
.end method

.method protected setBbox([I)V
    .locals 5
    .param p1, "bbox"    # [I

    .line 288
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgram;->fontMetrics:Lcom/itextpdf/io/font/FontMetrics;

    const/4 v1, 0x0

    aget v1, p1, v1

    const/4 v2, 0x1

    aget v2, p1, v2

    const/4 v3, 0x2

    aget v3, p1, v3

    const/4 v4, 0x3

    aget v4, p1, v4

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/itextpdf/io/font/FontMetrics;->setBbox(IIII)V

    .line 289
    return-void
.end method

.method protected setBold(Z)V
    .locals 2
    .param p1, "isBold"    # Z

    .line 280
    nop

    .line 283
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgram;->fontNames:Lcom/itextpdf/io/font/FontNames;

    .line 280
    if-eqz p1, :cond_0

    .line 281
    iget-object v1, p0, Lcom/itextpdf/io/font/FontProgram;->fontNames:Lcom/itextpdf/io/font/FontNames;

    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontNames;->getMacStyle()I

    move-result v1

    or-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/font/FontNames;->setMacStyle(I)V

    goto :goto_0

    .line 283
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/io/font/FontProgram;->fontNames:Lcom/itextpdf/io/font/FontNames;

    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontNames;->getMacStyle()I

    move-result v1

    and-int/lit8 v1, v1, -0x2

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/font/FontNames;->setMacStyle(I)V

    .line 285
    :goto_0
    return-void
.end method

.method protected setCapHeight(I)V
    .locals 1
    .param p1, "capHeight"    # I

    .line 229
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgram;->fontMetrics:Lcom/itextpdf/io/font/FontMetrics;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/FontMetrics;->setCapHeight(I)V

    .line 230
    return-void
.end method

.method protected setFixedPitch(Z)V
    .locals 1
    .param p1, "isFixedPitch"    # Z

    .line 276
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgram;->fontMetrics:Lcom/itextpdf/io/font/FontMetrics;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/FontMetrics;->setIsFixedPitch(Z)V

    .line 277
    return-void
.end method

.method protected setFontFamily(Ljava/lang/String;)V
    .locals 1
    .param p1, "fontFamily"    # Ljava/lang/String;

    .line 297
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgram;->fontNames:Lcom/itextpdf/io/font/FontNames;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/FontNames;->setFamilyName(Ljava/lang/String;)V

    .line 298
    return-void
.end method

.method protected setFontName(Ljava/lang/String;)V
    .locals 1
    .param p1, "fontName"    # Ljava/lang/String;

    .line 308
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgram;->fontNames:Lcom/itextpdf/io/font/FontNames;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/FontNames;->setFontName(Ljava/lang/String;)V

    .line 309
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgram;->fontNames:Lcom/itextpdf/io/font/FontNames;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontNames;->getFullName()[[Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 310
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgram;->fontNames:Lcom/itextpdf/io/font/FontNames;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/FontNames;->setFullName(Ljava/lang/String;)V

    .line 312
    :cond_0
    return-void
.end method

.method protected setFontStretch(Ljava/lang/String;)V
    .locals 1
    .param p1, "fontWidth"    # Ljava/lang/String;

    .line 272
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgram;->fontNames:Lcom/itextpdf/io/font/FontNames;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/FontNames;->setFontStretch(Ljava/lang/String;)V

    .line 273
    return-void
.end method

.method protected setFontWeight(I)V
    .locals 1
    .param p1, "fontWeight"    # I

    .line 263
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgram;->fontNames:Lcom/itextpdf/io/font/FontNames;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/FontNames;->setFontWeight(I)V

    .line 264
    return-void
.end method

.method protected setItalicAngle(I)V
    .locals 2
    .param p1, "italicAngle"    # I

    .line 246
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgram;->fontMetrics:Lcom/itextpdf/io/font/FontMetrics;

    int-to-float v1, p1

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/font/FontMetrics;->setItalicAngle(F)V

    .line 247
    return-void
.end method

.method protected setRegistry(Ljava/lang/String;)V
    .locals 0
    .param p1, "registry"    # Ljava/lang/String;

    .line 180
    iput-object p1, p0, Lcom/itextpdf/io/font/FontProgram;->registry:Ljava/lang/String;

    .line 181
    return-void
.end method

.method protected setStemH(I)V
    .locals 1
    .param p1, "stemH"    # I

    .line 254
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgram;->fontMetrics:Lcom/itextpdf/io/font/FontMetrics;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/FontMetrics;->setStemH(I)V

    .line 255
    return-void
.end method

.method protected setStemV(I)V
    .locals 1
    .param p1, "stemV"    # I

    .line 250
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgram;->fontMetrics:Lcom/itextpdf/io/font/FontMetrics;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/FontMetrics;->setStemV(I)V

    .line 251
    return-void
.end method

.method protected setTypoAscender(I)V
    .locals 1
    .param p1, "ascender"    # I

    .line 211
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgram;->fontMetrics:Lcom/itextpdf/io/font/FontMetrics;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/FontMetrics;->setTypoAscender(I)V

    .line 212
    return-void
.end method

.method protected setTypoDescender(I)V
    .locals 1
    .param p1, "descender"    # I

    .line 220
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgram;->fontMetrics:Lcom/itextpdf/io/font/FontMetrics;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/FontMetrics;->setTypoDescender(I)V

    .line 221
    return-void
.end method

.method protected setXHeight(I)V
    .locals 1
    .param p1, "xHeight"    # I

    .line 233
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgram;->fontMetrics:Lcom/itextpdf/io/font/FontMetrics;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/FontMetrics;->setXHeight(I)V

    .line 234
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 323
    invoke-virtual {p0}, Lcom/itextpdf/io/font/FontProgram;->getFontNames()Lcom/itextpdf/io/font/FontNames;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontNames;->getFontName()Ljava/lang/String;

    move-result-object v0

    .line 324
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    move-object v1, v0

    goto :goto_0

    :cond_0
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1
.end method
