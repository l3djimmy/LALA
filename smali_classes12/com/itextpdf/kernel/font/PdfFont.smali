.class public abstract Lcom/itextpdf/kernel/font/PdfFont;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfFont.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
        ">;"
    }
.end annotation


# static fields
.field protected static final EMPTY_BYTES:[B

.field public static final SIMPLE_FONT_MAX_CHAR_CODE_VALUE:I = 0xff


# instance fields
.field protected embedded:Z

.field protected fontProgram:Lcom/itextpdf/io/font/FontProgram;

.field protected newFont:Z

.field protected notdefGlyphs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/io/font/otf/Glyph;",
            ">;"
        }
    .end annotation
.end field

.field protected subset:Z

.field protected subsetRanges:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[I>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 57
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lcom/itextpdf/kernel/font/PdfFont;->EMPTY_BYTES:[B

    return-void
.end method

.method protected constructor <init>()V
    .locals 3

    .line 82
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 59
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/font/PdfFont;->notdefGlyphs:Ljava/util/Map;

    .line 64
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/font/PdfFont;->newFont:Z

    .line 69
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/itextpdf/kernel/font/PdfFont;->embedded:Z

    .line 73
    iput-boolean v0, p0, Lcom/itextpdf/kernel/font/PdfFont;->subset:Z

    .line 83
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfFont;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Font:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 84
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 3
    .param p1, "fontDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 77
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 59
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/font/PdfFont;->notdefGlyphs:Ljava/util/Map;

    .line 64
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/font/PdfFont;->newFont:Z

    .line 69
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/itextpdf/kernel/font/PdfFont;->embedded:Z

    .line 73
    iput-boolean v0, p0, Lcom/itextpdf/kernel/font/PdfFont;->subset:Z

    .line 78
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfFont;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Font:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 79
    return-void
.end method

.method protected static updateSubsetPrefix(Ljava/lang/String;ZZ)Ljava/lang/String;
    .locals 1
    .param p0, "fontName"    # Ljava/lang/String;
    .param p1, "isSubset"    # Z
    .param p2, "isEmbedded"    # Z

    .line 502
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    .line 503
    invoke-static {p0}, Lcom/itextpdf/kernel/font/FontUtil;->addRandomSubsetPrefixForFontName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 505
    :cond_0
    return-object p0
.end method


# virtual methods
.method public addSubsetRange([I)V
    .locals 1
    .param p1, "range"    # [I

    .line 411
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfFont;->subsetRanges:Ljava/util/List;

    if-nez v0, :cond_0

    .line 412
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/font/PdfFont;->subsetRanges:Ljava/util/List;

    .line 414
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfFont;->subsetRanges:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 415
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/font/PdfFont;->setSubset(Z)V

    .line 416
    return-void
.end method

.method public abstract appendAnyGlyph(Ljava/lang/String;ILjava/util/List;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/Glyph;",
            ">;)I"
        }
    .end annotation
.end method

.method public appendDecodedCodesToGlyphsList(Ljava/util/List;Lcom/itextpdf/kernel/pdf/PdfString;)Z
    .locals 1
    .param p2, "characterCodes"    # Lcom/itextpdf/kernel/pdf/PdfString;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/Glyph;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/PdfString;",
            ")Z"
        }
    .end annotation

    .line 182
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/Glyph;>;"
    const/4 v0, 0x0

    return v0
.end method

.method public abstract appendGlyphs(Ljava/lang/String;IILjava/util/List;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "II",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/Glyph;",
            ">;)I"
        }
    .end annotation
.end method

.method public containsGlyph(I)Z
    .locals 5
    .param p1, "unicode"    # I

    .line 104
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/font/PdfFont;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    .line 105
    .local v0, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    const/4 v1, 0x0

    if-eqz v0, :cond_3

    .line 106
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfFont;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v2

    const/4 v3, 0x1

    if-eqz v2, :cond_1

    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfFont;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/io/font/FontProgram;->isFontSpecific()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 108
    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v2

    const/4 v4, -0x1

    if-le v2, v4, :cond_0

    move v1, v3

    :cond_0
    return v1

    .line 110
    :cond_1
    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v2

    if-lez v2, :cond_2

    move v1, v3

    :cond_2
    return v1

    .line 113
    :cond_3
    return v1
.end method

.method public abstract convertToBytes(Lcom/itextpdf/io/font/otf/Glyph;)[B
.end method

.method public abstract convertToBytes(Lcom/itextpdf/io/font/otf/GlyphLine;)[B
.end method

.method public abstract convertToBytes(Ljava/lang/String;)[B
.end method

.method public abstract createGlyphLine(Ljava/lang/String;)Lcom/itextpdf/io/font/otf/GlyphLine;
.end method

.method public abstract decode(Lcom/itextpdf/kernel/pdf/PdfString;)Ljava/lang/String;
.end method

.method public abstract decodeIntoGlyphLine(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/io/font/otf/GlyphLine;
.end method

.method public flush()V
    .locals 0

    .line 481
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->flush()V

    .line 482
    return-void
.end method

.method public getAscent(IF)F
    .locals 5
    .param p1, "unicode"    # I
    .param p2, "fontSize"    # F

    .line 354
    const/4 v0, 0x0

    .line 355
    .local v0, "max":I
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/font/PdfFont;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v1

    .line 356
    .local v1, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    if-nez v1, :cond_0

    .line 357
    const/4 v2, 0x0

    return v2

    .line 359
    :cond_0
    invoke-virtual {v1}, Lcom/itextpdf/io/font/otf/Glyph;->getBbox()[I

    move-result-object v2

    .line 360
    .local v2, "bbox":[I
    if-eqz v2, :cond_1

    const/4 v3, 0x3

    aget v4, v2, v3

    if-le v4, v0, :cond_1

    .line 361
    aget v0, v2, v3

    goto :goto_0

    .line 362
    :cond_1
    if-nez v2, :cond_2

    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfFont;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontProgram;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontMetrics;->getTypoAscender()I

    move-result v3

    if-le v3, v0, :cond_2

    .line 363
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfFont;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontProgram;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontMetrics;->getTypoAscender()I

    move-result v0

    .line 366
    :cond_2
    :goto_0
    int-to-float v3, v0

    mul-float/2addr v3, p2

    invoke-static {v3}, Lcom/itextpdf/io/font/FontProgram;->convertTextSpaceToGlyphSpace(F)F

    move-result v3

    return v3
.end method

.method public getAscent(Ljava/lang/String;F)F
    .locals 7
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "fontSize"    # F

    .line 321
    const/4 v0, 0x0

    .line 322
    .local v0, "max":I
    const/4 v1, 0x0

    .local v1, "k":I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 324
    invoke-static {p1, v1}, Lcom/itextpdf/io/util/TextUtil;->isSurrogatePair(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 325
    invoke-static {p1, v1}, Lcom/itextpdf/io/util/TextUtil;->convertToUtf32(Ljava/lang/String;I)I

    move-result v2

    .line 326
    .local v2, "ch":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 328
    .end local v2    # "ch":I
    :cond_0
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 330
    .restart local v2    # "ch":I
    :goto_1
    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/font/PdfFont;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v3

    .line 331
    .local v3, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    if-eqz v3, :cond_2

    .line 332
    invoke-virtual {v3}, Lcom/itextpdf/io/font/otf/Glyph;->getBbox()[I

    move-result-object v4

    .line 333
    .local v4, "bbox":[I
    if-eqz v4, :cond_1

    const/4 v5, 0x3

    aget v6, v4, v5

    if-le v6, v0, :cond_1

    .line 334
    aget v0, v4, v5

    goto :goto_2

    .line 335
    :cond_1
    if-nez v4, :cond_2

    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfFont;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/io/font/FontProgram;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/io/font/FontMetrics;->getTypoAscender()I

    move-result v5

    if-le v5, v0, :cond_2

    .line 336
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfFont;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/io/font/FontProgram;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/io/font/FontMetrics;->getTypoAscender()I

    move-result v0

    .line 322
    .end local v2    # "ch":I
    .end local v3    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    .end local v4    # "bbox":[I
    :cond_2
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 341
    .end local v1    # "k":I
    :cond_3
    int-to-float v1, v0

    mul-float/2addr v1, p2

    invoke-static {v1}, Lcom/itextpdf/io/font/FontProgram;->convertTextSpaceToGlyphSpace(F)F

    move-result v1

    return v1
.end method

.method public abstract getContentWidth(Lcom/itextpdf/kernel/pdf/PdfString;)F
.end method

.method public getDescent(IF)F
    .locals 5
    .param p1, "unicode"    # I
    .param p2, "fontSize"    # F

    .line 296
    const/4 v0, 0x0

    .line 297
    .local v0, "min":I
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/font/PdfFont;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v1

    .line 298
    .local v1, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    if-nez v1, :cond_0

    .line 299
    const/4 v2, 0x0

    return v2

    .line 301
    :cond_0
    invoke-virtual {v1}, Lcom/itextpdf/io/font/otf/Glyph;->getBbox()[I

    move-result-object v2

    .line 302
    .local v2, "bbox":[I
    if-eqz v2, :cond_1

    const/4 v3, 0x1

    aget v4, v2, v3

    if-ge v4, v0, :cond_1

    .line 303
    aget v0, v2, v3

    goto :goto_0

    .line 304
    :cond_1
    if-nez v2, :cond_2

    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfFont;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontProgram;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontMetrics;->getTypoDescender()I

    move-result v3

    if-ge v3, v0, :cond_2

    .line 305
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfFont;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontProgram;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontMetrics;->getTypoDescender()I

    move-result v0

    .line 308
    :cond_2
    :goto_0
    int-to-float v3, v0

    mul-float/2addr v3, p2

    invoke-static {v3}, Lcom/itextpdf/io/font/FontProgram;->convertTextSpaceToGlyphSpace(F)F

    move-result v3

    return v3
.end method

.method public getDescent(Ljava/lang/String;F)F
    .locals 7
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "fontSize"    # F

    .line 264
    const/4 v0, 0x0

    .line 265
    .local v0, "min":I
    const/4 v1, 0x0

    .local v1, "k":I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 267
    invoke-static {p1, v1}, Lcom/itextpdf/io/util/TextUtil;->isSurrogatePair(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 268
    invoke-static {p1, v1}, Lcom/itextpdf/io/util/TextUtil;->convertToUtf32(Ljava/lang/String;I)I

    move-result v2

    .line 269
    .local v2, "ch":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 271
    .end local v2    # "ch":I
    :cond_0
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 273
    .restart local v2    # "ch":I
    :goto_1
    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/font/PdfFont;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v3

    .line 274
    .local v3, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    const/4 v4, 0x1

    if-eqz v3, :cond_2

    .line 275
    invoke-virtual {v3}, Lcom/itextpdf/io/font/otf/Glyph;->getBbox()[I

    move-result-object v5

    .line 276
    .local v5, "bbox":[I
    if-eqz v5, :cond_1

    aget v6, v5, v4

    if-ge v6, v0, :cond_1

    .line 277
    aget v0, v5, v4

    goto :goto_2

    .line 278
    :cond_1
    if-nez v5, :cond_2

    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfFont;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/io/font/FontProgram;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/io/font/FontMetrics;->getTypoDescender()I

    move-result v6

    if-ge v6, v0, :cond_2

    .line 279
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfFont;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/io/font/FontProgram;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/io/font/FontMetrics;->getTypoDescender()I

    move-result v0

    .line 265
    .end local v2    # "ch":I
    .end local v3    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    .end local v5    # "bbox":[I
    :cond_2
    :goto_2
    add-int/2addr v1, v4

    goto :goto_0

    .line 283
    .end local v1    # "k":I
    :cond_3
    int-to-float v1, v0

    mul-float/2addr v1, p2

    invoke-static {v1}, Lcom/itextpdf/io/font/FontProgram;->convertTextSpaceToGlyphSpace(F)F

    move-result v1

    return v1
.end method

.method protected abstract getFontDescriptor(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfDictionary;
.end method

.method public getFontProgram()Lcom/itextpdf/io/font/FontProgram;
    .locals 1

    .line 370
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfFont;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    return-object v0
.end method

.method public abstract getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;
.end method

.method protected getPdfFontStream([B[I)Lcom/itextpdf/kernel/pdf/PdfStream;
    .locals 5
    .param p1, "fontStreamBytes"    # [B
    .param p2, "fontStreamLengths"    # [I

    .line 519
    if-eqz p1, :cond_1

    if-eqz p2, :cond_1

    .line 522
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfStream;-><init>([B)V

    .line 523
    .local v0, "fontStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/font/PdfFont;->makeObjectIndirect(Lcom/itextpdf/kernel/pdf/PdfObject;)Z

    .line 524
    const/4 v1, 0x0

    .local v1, "k":I
    :goto_0
    array-length v2, p2

    if-ge v1, v2, :cond_0

    .line 525
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Length"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int/lit8 v4, v1, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfNumber;

    aget v4, p2, v1

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 524
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 527
    .end local v1    # "k":I
    :cond_0
    return-object v0

    .line 520
    .end local v0    # "fontStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    :cond_1
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Font embedding issue."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getWidth(IF)F
    .locals 1
    .param p1, "unicode"    # I
    .param p2, "fontSize"    # F

    .line 214
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/font/PdfFont;->getWidth(I)I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, p2

    invoke-static {v0}, Lcom/itextpdf/io/font/FontProgram;->convertTextSpaceToGlyphSpace(F)F

    move-result v0

    return v0
.end method

.method public getWidth(Ljava/lang/String;F)F
    .locals 1
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "fontSize"    # F

    .line 251
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/font/PdfFont;->getWidth(Ljava/lang/String;)I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, p2

    invoke-static {v0}, Lcom/itextpdf/io/font/FontProgram;->convertTextSpaceToGlyphSpace(F)F

    move-result v0

    return v0
.end method

.method public getWidth(I)I
    .locals 2
    .param p1, "unicode"    # I

    .line 201
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/font/PdfFont;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    .line 202
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

.method public getWidth(Ljava/lang/String;)I
    .locals 5
    .param p1, "text"    # Ljava/lang/String;

    .line 225
    const/4 v0, 0x0

    .line 226
    .local v0, "total":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 228
    invoke-static {p1, v1}, Lcom/itextpdf/io/util/TextUtil;->isSurrogatePair(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 229
    invoke-static {p1, v1}, Lcom/itextpdf/io/util/TextUtil;->convertToUtf32(Ljava/lang/String;I)I

    move-result v2

    .line 230
    .local v2, "ch":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 232
    .end local v2    # "ch":I
    :cond_0
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 234
    .restart local v2    # "ch":I
    :goto_1
    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/font/PdfFont;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v3

    .line 235
    .local v3, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    if-eqz v3, :cond_1

    .line 236
    invoke-virtual {v3}, Lcom/itextpdf/io/font/otf/Glyph;->getWidth()I

    move-result v4

    add-int/2addr v0, v4

    .line 226
    .end local v2    # "ch":I
    .end local v3    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 239
    .end local v1    # "i":I
    :cond_2
    return v0
.end method

.method public isBuiltWith(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "fontProgram"    # Ljava/lang/String;
    .param p2, "encoding"    # Ljava/lang/String;

    .line 469
    const/4 v0, 0x0

    return v0
.end method

.method public isEmbedded()Z
    .locals 1

    .line 374
    iget-boolean v0, p0, Lcom/itextpdf/kernel/font/PdfFont;->embedded:Z

    return v0
.end method

.method public isSubset()Z
    .locals 1

    .line 384
    iget-boolean v0, p0, Lcom/itextpdf/kernel/font/PdfFont;->subset:Z

    return v0
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 488
    const/4 v0, 0x1

    return v0
.end method

.method makeObjectIndirect(Lcom/itextpdf/kernel/pdf/PdfObject;)Z
    .locals 1
    .param p1, "obj"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 540
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfFont;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 541
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfFont;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 542
    const/4 v0, 0x1

    return v0

    .line 544
    :cond_0
    invoke-static {p1}, Lcom/itextpdf/kernel/font/PdfFont;->markObjectAsIndirect(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 545
    const/4 v0, 0x0

    return v0
.end method

.method public setSubset(Z)V
    .locals 0
    .param p1, "subset"    # Z

    .line 398
    iput-boolean p1, p0, Lcom/itextpdf/kernel/font/PdfFont;->subset:Z

    .line 399
    return-void
.end method

.method public splitString(Ljava/lang/String;FF)Ljava/util/List;
    .locals 8
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "fontSize"    # F
    .param p3, "maxWidth"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "FF)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 419
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 420
    .local v0, "resultString":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .line 421
    .local v1, "lastWhiteSpace":I
    const/4 v2, 0x0

    .line 423
    .local v2, "startPos":I
    const/4 v3, 0x0

    .line 424
    .local v3, "tokenLength":F
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_5

    .line 425
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 426
    .local v5, "ch":C
    invoke-static {v5}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 427
    move v1, v4

    .line 429
    :cond_0
    invoke-virtual {p0, v5, p2}, Lcom/itextpdf/kernel/font/PdfFont;->getWidth(IF)F

    move-result v6

    .line 430
    .local v6, "currentCharWidth":F
    add-float v7, v3, v6

    cmpl-float v7, v7, p3

    if-gez v7, :cond_2

    const/16 v7, 0xa

    if-ne v5, v7, :cond_1

    goto :goto_1

    .line 446
    :cond_1
    add-float/2addr v3, v6

    goto :goto_2

    .line 431
    :cond_2
    :goto_1
    if-ge v2, v1, :cond_3

    .line 432
    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 433
    add-int/lit8 v2, v1, 0x1

    .line 434
    const/4 v3, 0x0

    .line 435
    move v4, v1

    goto :goto_2

    .line 436
    :cond_3
    if-eq v2, v4, :cond_4

    .line 437
    invoke-virtual {p1, v2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 438
    move v2, v4

    .line 439
    move v3, v6

    goto :goto_2

    .line 441
    :cond_4
    add-int/lit8 v7, v2, 0x1

    invoke-virtual {p1, v2, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 442
    add-int/lit8 v2, v4, 0x1

    .line 443
    const/4 v3, 0x0

    .line 424
    .end local v5    # "ch":C
    .end local v6    # "currentCharWidth":F
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 450
    .end local v4    # "i":I
    :cond_5
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 451
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 551
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "PdfFont{fontProgram="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/font/PdfFont;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public abstract writeText(Lcom/itextpdf/io/font/otf/GlyphLine;IILcom/itextpdf/kernel/pdf/PdfOutputStream;)V
.end method

.method public abstract writeText(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfOutputStream;)V
.end method
