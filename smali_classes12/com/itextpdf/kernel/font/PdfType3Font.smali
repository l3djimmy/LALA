.class public Lcom/itextpdf/kernel/font/PdfType3Font;
.super Lcom/itextpdf/kernel/font/PdfSimpleFont;
.source "PdfType3Font.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/font/PdfSimpleFont<",
        "Lcom/itextpdf/kernel/font/Type3Font;",
        ">;"
    }
.end annotation


# static fields
.field private static final DEFAULT_FONT_MATRIX:[D

.field private static final FONT_BBOX_LLX:I = 0x0

.field private static final FONT_BBOX_LLY:I = 0x1

.field private static final FONT_BBOX_URX:I = 0x2

.field private static final FONT_BBOX_URY:I = 0x3


# instance fields
.field private fontMatrix:[D

.field private glyphSpaceNormalizationFactor:D


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 89
    const/4 v0, 0x6

    new-array v0, v0, [D

    fill-array-data v0, :array_0

    sput-object v0, Lcom/itextpdf/kernel/font/PdfType3Font;->DEFAULT_FONT_MATRIX:[D

    return-void

    nop

    :array_0
    .array-data 8
        0x3f50624dd2f1a9fcL    # 0.001
        0x0
        0x0
        0x3f50624dd2f1a9fcL    # 0.001
        0x0
        0x0
    .end array-data
.end method

.method constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 13
    .param p1, "fontDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 143
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/font/PdfSimpleFont;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 91
    sget-object v0, Lcom/itextpdf/kernel/font/PdfType3Font;->DEFAULT_FONT_MATRIX:[D

    iput-object v0, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontMatrix:[D

    .line 144
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->subset:Z

    .line 145
    iput-boolean v0, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->embedded:Z

    .line 146
    new-instance v0, Lcom/itextpdf/kernel/font/Type3Font;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/font/Type3Font;-><init>(Z)V

    iput-object v0, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    .line 147
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Encoding:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    iget-object v2, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->toUnicode:Lcom/itextpdf/io/font/cmap/CMapToUnicode;

    invoke-static {v0, v2}, Lcom/itextpdf/kernel/font/DocFontEncoding;->createDocFontEncoding(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/io/font/cmap/CMapToUnicode;)Lcom/itextpdf/io/font/FontEncoding;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    .line 149
    invoke-direct {p0}, Lcom/itextpdf/kernel/font/PdfType3Font;->readFontMatrix()[D

    move-result-object v0

    .line 150
    .local v0, "fontMatrixArray":[D
    invoke-direct {p0}, Lcom/itextpdf/kernel/font/PdfType3Font;->readFontBBox()[D

    move-result-object v2

    .line 151
    .local v2, "fontBBoxRect":[D
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/font/PdfType3Font;->readWidths(Lcom/itextpdf/kernel/pdf/PdfDictionary;)[D

    move-result-object v3

    .line 153
    .local v3, "widthsArray":[D
    aget-wide v4, v0, v1

    invoke-static {v4, v5}, Lcom/itextpdf/io/font/FontProgram;->convertGlyphSpaceToTextSpace(D)D

    move-result-wide v4

    invoke-virtual {p0, v4, v5}, Lcom/itextpdf/kernel/font/PdfType3Font;->setGlyphSpaceNormalizationFactor(D)V

    .line 155
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->CharProcs:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    .line 156
    .local v1, "charProcsDic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Encoding:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v4

    .line 157
    .local v4, "encoding":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v4, :cond_0

    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->Differences:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v5

    goto :goto_0

    :cond_0
    const/4 v5, 0x0

    .line 158
    .local v5, "differences":Lcom/itextpdf/kernel/pdf/PdfArray;
    :goto_0
    if-eqz v1, :cond_1

    if-nez v5, :cond_2

    .line 159
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-static {v6}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v6

    const-string v7, "Type 3 font issue. Font cannot be initialized correctly."

    invoke-interface {v6, v7}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 161
    :cond_2
    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->FontDescriptor:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/itextpdf/kernel/font/PdfType3Font;->fillFontDescriptor(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 163
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/font/PdfType3Font;->normalize1000UnitsToGlyphSpaceUnits([D)V

    .line 164
    invoke-direct {p0, v2}, Lcom/itextpdf/kernel/font/PdfType3Font;->normalizeGlyphSpaceUnitsTo1000Units([D)V

    .line 165
    invoke-direct {p0, v3}, Lcom/itextpdf/kernel/font/PdfType3Font;->normalizeGlyphSpaceUnitsTo1000Units([D)V

    .line 167
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/font/PdfType3Font;->initializeUsedGlyphs(Lcom/itextpdf/kernel/pdf/PdfDictionary;)I

    move-result v6

    .line 168
    .local v6, "firstChar":I
    iput-object v0, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontMatrix:[D

    .line 169
    invoke-direct {p0, v2}, Lcom/itextpdf/kernel/font/PdfType3Font;->initializeFontBBox([D)V

    .line 170
    invoke-direct {p0, v2}, Lcom/itextpdf/kernel/font/PdfType3Font;->initializeTypoAscenderDescender([D)V

    .line 172
    const/16 v7, 0x100

    new-array v8, v7, [I

    .line 173
    .local v8, "widths":[I
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_1
    array-length v10, v3

    if-ge v9, v10, :cond_3

    add-int v10, v6, v9

    if-ge v10, v7, :cond_3

    .line 174
    add-int v10, v6, v9

    aget-wide v11, v3, v9

    double-to-int v11, v11

    aput v11, v8, v10

    .line 173
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 176
    .end local v9    # "i":I
    :cond_3
    invoke-direct {p0, v5, v1, v8}, Lcom/itextpdf/kernel/font/PdfType3Font;->addGlyphsFromDifferences(Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/PdfDictionary;[I)V

    .line 177
    invoke-direct {p0, v1, v8}, Lcom/itextpdf/kernel/font/PdfType3Font;->addGlyphsFromCharProcs(Lcom/itextpdf/kernel/pdf/PdfDictionary;[I)V

    .line 178
    return-void
.end method

.method constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 2
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "fontName"    # Ljava/lang/String;
    .param p3, "fontFamily"    # Ljava/lang/String;
    .param p4, "colorized"    # Z

    .line 131
    invoke-direct {p0, p1, p4}, Lcom/itextpdf/kernel/font/PdfType3Font;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Z)V

    .line 132
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    check-cast v0, Lcom/itextpdf/kernel/font/Type3Font;

    invoke-virtual {v0, p2}, Lcom/itextpdf/kernel/font/Type3Font;->setFontName(Ljava/lang/String;)V

    .line 133
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    check-cast v0, Lcom/itextpdf/kernel/font/Type3Font;

    invoke-virtual {v0, p3}, Lcom/itextpdf/kernel/font/Type3Font;->setFontFamily(Ljava/lang/String;)V

    .line 134
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/font/PdfType3Font;->setGlyphSpaceNormalizationFactor(D)V

    .line 135
    return-void
.end method

.method constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Z)V
    .locals 2
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "colorized"    # Z

    .line 113
    invoke-direct {p0}, Lcom/itextpdf/kernel/font/PdfSimpleFont;-><init>()V

    .line 91
    sget-object v0, Lcom/itextpdf/kernel/font/PdfType3Font;->DEFAULT_FONT_MATRIX:[D

    iput-object v0, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontMatrix:[D

    .line 114
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/font/PdfType3Font;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 115
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->subset:Z

    .line 116
    iput-boolean v0, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->embedded:Z

    .line 117
    new-instance v0, Lcom/itextpdf/kernel/font/Type3Font;

    invoke-direct {v0, p2}, Lcom/itextpdf/kernel/font/Type3Font;-><init>(Z)V

    iput-object v0, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    .line 118
    invoke-static {}, Lcom/itextpdf/io/font/FontEncoding;->createEmptyFontEncoding()Lcom/itextpdf/io/font/FontEncoding;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    .line 119
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/font/PdfType3Font;->setGlyphSpaceNormalizationFactor(D)V

    .line 120
    return-void
.end method

.method private addGlyphsFromCharProcs(Lcom/itextpdf/kernel/pdf/PdfDictionary;[I)V
    .locals 10
    .param p1, "charProcsDic"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "widths"    # [I

    .line 458
    if-nez p1, :cond_0

    .line 459
    return-void

    .line 461
    :cond_0
    const/4 v1, 0x0

    .line 462
    .local v1, "unicodeToCode":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getToUnicode()Lcom/itextpdf/io/font/cmap/CMapToUnicode;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 463
    :try_start_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getToUnicode()Lcom/itextpdf/io/font/cmap/CMapToUnicode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/io/font/cmap/CMapToUnicode;->createReverseMapping()Ljava/util/Map;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v1, v0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 466
    :cond_1
    :goto_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfName;

    .line 467
    .local v2, "glyphName":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/itextpdf/io/font/AdobeGlyphList;->nameToUnicode(Ljava/lang/String;)I

    move-result v6

    .line 468
    .local v6, "unicode":I
    const/4 v3, -0x1

    .line 469
    .local v3, "code":I
    iget-object v4, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v4, v6}, Lcom/itextpdf/io/font/FontEncoding;->canEncode(I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 470
    iget-object v4, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v4, v6}, Lcom/itextpdf/io/font/FontEncoding;->convertToByte(I)I

    move-result v3

    move v5, v3

    goto :goto_2

    .line 471
    :cond_2
    if-eqz v1, :cond_3

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 472
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v3

    move v5, v3

    goto :goto_2

    .line 474
    :cond_3
    move v5, v3

    .end local v3    # "code":I
    .local v5, "code":I
    :goto_2
    const/4 v3, -0x1

    if-eq v5, v3, :cond_4

    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v3

    invoke-virtual {v3, v5}, Lcom/itextpdf/io/font/FontProgram;->getGlyphByCode(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v3

    if-nez v3, :cond_4

    .line 475
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Lcom/itextpdf/kernel/font/Type3Font;

    aget v7, p2, v5

    new-instance v9, Lcom/itextpdf/kernel/font/Type3Glyph;

    .line 476
    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsStream(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v3

    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v8

    invoke-direct {v9, v3, v8}, Lcom/itextpdf/kernel/font/Type3Glyph;-><init>(Lcom/itextpdf/kernel/pdf/PdfStream;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 475
    const/4 v8, 0x0

    invoke-virtual/range {v4 .. v9}, Lcom/itextpdf/kernel/font/Type3Font;->addGlyph(III[ILcom/itextpdf/kernel/font/Type3Glyph;)V

    .line 478
    .end local v2    # "glyphName":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local v5    # "code":I
    .end local v6    # "unicode":I
    :cond_4
    goto :goto_1

    .line 479
    :cond_5
    return-void
.end method

.method private addGlyphsFromDifferences(Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/PdfDictionary;[I)V
    .locals 10
    .param p1, "differences"    # Lcom/itextpdf/kernel/pdf/PdfArray;
    .param p2, "charProcsDic"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p3, "widths"    # [I

    .line 417
    if-eqz p1, :cond_5

    if-nez p2, :cond_0

    goto :goto_2

    .line 421
    :cond_0
    const/4 v0, 0x0

    .line 422
    .local v0, "currentNumber":I
    const/4 v1, 0x0

    move v3, v0

    .end local v0    # "currentNumber":I
    .local v1, "k":I
    .local v3, "currentNumber":I
    :goto_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v0

    if-ge v1, v0, :cond_4

    .line 423
    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 424
    .local v0, "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isNumber()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 425
    move-object v2, v0

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v2

    move v3, v2

    .end local v3    # "currentNumber":I
    .local v2, "currentNumber":I
    goto :goto_1

    .line 426
    .end local v2    # "currentNumber":I
    .restart local v3    # "currentNumber":I
    :cond_1
    const/16 v2, 0xff

    if-le v3, v2, :cond_2

    goto :goto_1

    .line 429
    :cond_2
    move-object v2, v0

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v8

    .line 430
    .local v8, "glyphName":Ljava/lang/String;
    iget-object v2, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v2, v3}, Lcom/itextpdf/io/font/FontEncoding;->getUnicode(I)I

    move-result v4

    .line 431
    .local v4, "unicode":I
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v2

    invoke-virtual {v2, v3}, Lcom/itextpdf/io/font/FontProgram;->getGlyphByCode(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v2

    if-nez v2, :cond_3

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {v2, v8}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    .line 432
    invoke-virtual {p2, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 433
    iget-object v2, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v2, v3, v8}, Lcom/itextpdf/io/font/FontEncoding;->setDifference(ILjava/lang/String;)V

    .line 434
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/font/Type3Font;

    aget v5, p3, v3

    new-instance v7, Lcom/itextpdf/kernel/font/Type3Glyph;

    new-instance v6, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {v6, v8}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    .line 435
    invoke-virtual {p2, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsStream(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v6

    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v9

    invoke-direct {v7, v6, v9}, Lcom/itextpdf/kernel/font/Type3Glyph;-><init>(Lcom/itextpdf/kernel/pdf/PdfStream;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 434
    const/4 v6, 0x0

    invoke-virtual/range {v2 .. v7}, Lcom/itextpdf/kernel/font/Type3Font;->addGlyph(III[ILcom/itextpdf/kernel/font/Type3Glyph;)V

    .line 437
    :cond_3
    add-int/lit8 v3, v3, 0x1

    .line 422
    .end local v0    # "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v4    # "unicode":I
    .end local v8    # "glyphName":Ljava/lang/String;
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 440
    .end local v1    # "k":I
    :cond_4
    return-void

    .line 418
    .end local v3    # "currentNumber":I
    :cond_5
    :goto_2
    return-void
.end method

.method private fillFontDescriptor(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 5
    .param p1, "fontDesc"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 609
    if-nez p1, :cond_0

    .line 610
    return-void

    .line 612
    :cond_0
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->CapHeight:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 613
    .local v0, "v":Lcom/itextpdf/kernel/pdf/PdfNumber;
    if-eqz v0, :cond_1

    .line 614
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->doubleValue()D

    move-result-wide v1

    .line 615
    .local v1, "capHeight":D
    invoke-direct {p0, v1, v2}, Lcom/itextpdf/kernel/font/PdfType3Font;->normalizeGlyphSpaceUnitsTo1000Units(D)D

    move-result-wide v3

    double-to-int v3, v3

    invoke-virtual {p0, v3}, Lcom/itextpdf/kernel/font/PdfType3Font;->setCapHeight(I)V

    .line 617
    .end local v1    # "capHeight":D
    :cond_1
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ItalicAngle:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 618
    if-eqz v0, :cond_2

    .line 619
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/font/PdfType3Font;->setItalicAngle(I)V

    .line 621
    :cond_2
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->FontWeight:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 622
    if-eqz v0, :cond_3

    .line 623
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/font/PdfType3Font;->setFontWeight(I)V

    .line 626
    :cond_3
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->FontStretch:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    .line 627
    .local v1, "fontStretch":Lcom/itextpdf/kernel/pdf/PdfName;
    if-eqz v1, :cond_4

    .line 628
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/font/PdfType3Font;->setFontStretch(Ljava/lang/String;)V

    .line 631
    :cond_4
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->FontName:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v2

    .line 632
    .local v2, "fontName":Lcom/itextpdf/kernel/pdf/PdfName;
    if-eqz v2, :cond_5

    .line 633
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/itextpdf/kernel/font/PdfType3Font;->setFontName(Ljava/lang/String;)V

    .line 636
    :cond_5
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->FontFamily:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v3

    .line 637
    .local v3, "fontFamily":Lcom/itextpdf/kernel/pdf/PdfString;
    if-eqz v3, :cond_6

    .line 638
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfString;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/itextpdf/kernel/font/PdfType3Font;->setFontFamily(Ljava/lang/String;)V

    .line 640
    :cond_6
    return-void
.end method

.method private flushFontData()V
    .locals 17

    .line 482
    move-object/from16 v0, p0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/font/Type3Font;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/font/Type3Font;->getNumberOfGlyphs()I

    move-result v1

    const/4 v2, 0x1

    if-lt v1, v2, :cond_4

    .line 485
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 486
    .local v1, "charProcs":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    const/16 v4, 0xff

    if-gt v3, v4, :cond_3

    .line 487
    const/4 v4, 0x0

    .line 488
    .local v4, "glyph":Lcom/itextpdf/kernel/font/Type3Glyph;
    iget-object v5, v0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v5, v3}, Lcom/itextpdf/io/font/FontEncoding;->canDecode(I)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 489
    iget-object v5, v0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v5, v3}, Lcom/itextpdf/io/font/FontEncoding;->getUnicode(I)I

    move-result v5

    invoke-virtual {v0, v5}, Lcom/itextpdf/kernel/font/PdfType3Font;->getType3Glyph(I)Lcom/itextpdf/kernel/font/Type3Glyph;

    move-result-object v4

    .line 491
    :cond_0
    if-nez v4, :cond_1

    .line 492
    invoke-virtual {v0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/font/Type3Font;

    invoke-virtual {v5, v3}, Lcom/itextpdf/kernel/font/Type3Font;->getType3GlyphByCode(I)Lcom/itextpdf/kernel/font/Type3Glyph;

    move-result-object v4

    .line 494
    :cond_1
    if-eqz v4, :cond_2

    .line 495
    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfName;

    iget-object v6, v0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v6, v3}, Lcom/itextpdf/io/font/FontEncoding;->getDifference(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Lcom/itextpdf/kernel/font/Type3Glyph;->getContentStream()Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 496
    invoke-virtual {v4}, Lcom/itextpdf/kernel/font/Type3Glyph;->getContentStream()Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfStream;->flush()V

    .line 486
    .end local v4    # "glyph":Lcom/itextpdf/kernel/font/Type3Glyph;
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 499
    .end local v3    # "i":I
    :cond_3
    invoke-virtual {v0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->CharProcs:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v4, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 501
    invoke-direct {v0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getFontMatrix()[D

    move-result-object v3

    .line 502
    .local v3, "fontMatrixDouble":[D
    invoke-virtual {v0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/io/font/FontProgram;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/io/font/FontMetrics;->getBbox()[I

    move-result-object v4

    .line 503
    .local v4, "fontBBoxInt":[I
    const/4 v5, 0x0

    aget v6, v4, v5

    int-to-double v6, v6

    aget v8, v4, v2

    int-to-double v8, v8

    const/4 v10, 0x2

    aget v11, v4, v10

    int-to-double v11, v11

    const/4 v13, 0x3

    aget v14, v4, v13

    int-to-double v14, v14

    move/from16 v16, v2

    const/4 v2, 0x4

    new-array v2, v2, [D

    aput-wide v6, v2, v5

    aput-wide v8, v2, v16

    aput-wide v11, v2, v10

    aput-wide v14, v2, v13

    .line 507
    .local v2, "fontBBoxDouble":[D
    invoke-direct {v0, v3}, Lcom/itextpdf/kernel/font/PdfType3Font;->normalizeGlyphSpaceUnitsTo1000Units([D)V

    .line 508
    invoke-direct {v0, v2}, Lcom/itextpdf/kernel/font/PdfType3Font;->normalize1000UnitsToGlyphSpaceUnits([D)V

    .line 510
    invoke-virtual {v0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->FontMatrix:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v7, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v7, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([D)V

    invoke-virtual {v5, v6, v7}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 511
    invoke-virtual {v0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->FontBBox:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v7, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v7, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([D)V

    invoke-virtual {v5, v6, v7}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 512
    iget-object v5, v0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v5}, Lcom/itextpdf/io/font/FontProgram;->getFontNames()Lcom/itextpdf/io/font/FontNames;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/io/font/FontNames;->getFontName()Ljava/lang/String;

    move-result-object v5

    .line 513
    .local v5, "fontName":Ljava/lang/String;
    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->Type3:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-super {v0, v5, v6}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->flushFontData(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 514
    invoke-virtual {v0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v7, Lcom/itextpdf/kernel/pdf/PdfName;->Widths:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v6, v7}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/itextpdf/kernel/font/PdfType3Font;->makeObjectIndirect(Lcom/itextpdf/kernel/pdf/PdfObject;)Z

    .line 516
    invoke-virtual {v0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v7, Lcom/itextpdf/kernel/pdf/PdfName;->BaseFont:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v6, v7}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 517
    return-void

    .line 483
    .end local v1    # "charProcs":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v2    # "fontBBoxDouble":[D
    .end local v3    # "fontMatrixDouble":[D
    .end local v4    # "fontBBoxInt":[I
    .end local v5    # "fontName":Ljava/lang/String;
    :cond_4
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "No glyphs defined for type3 font."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private getFirstEmptyCode()I
    .locals 3

    .line 448
    const/4 v0, 0x1

    .line 449
    .local v0, "startFrom":I
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    const/16 v2, 0xff

    if-gt v1, v2, :cond_1

    .line 450
    iget-object v2, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v2, v1}, Lcom/itextpdf/io/font/FontEncoding;->canDecode(I)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v2, v1}, Lcom/itextpdf/io/font/FontProgram;->getGlyphByCode(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v2

    if-nez v2, :cond_0

    .line 451
    return v1

    .line 449
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 454
    .end local v1    # "i":I
    :cond_1
    const/4 v1, -0x1

    return v1
.end method

.method private getFontMatrix()[D
    .locals 1

    .line 104
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontMatrix:[D

    return-object v0
.end method

.method private initializeFontBBox([D)V
    .locals 6
    .param p1, "fontBBoxRect"    # [D

    .line 580
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontProgram;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v0

    const/4 v1, 0x0

    aget-wide v1, p1, v1

    double-to-int v1, v1

    const/4 v2, 0x1

    aget-wide v2, p1, v2

    double-to-int v2, v2

    const/4 v3, 0x2

    aget-wide v3, p1, v3

    double-to-int v3, v3

    const/4 v4, 0x3

    aget-wide v4, p1, v4

    double-to-int v4, v4

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/itextpdf/io/font/FontMetrics;->setBbox(IIII)V

    .line 586
    return-void
.end method

.method private initializeTypoAscenderDescender([D)V
    .locals 3
    .param p1, "fontBBoxRect"    # [D

    .line 575
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    check-cast v0, Lcom/itextpdf/kernel/font/Type3Font;

    const/4 v1, 0x3

    aget-wide v1, p1, v1

    double-to-int v1, v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/font/Type3Font;->setTypoAscender(I)V

    .line 576
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    check-cast v0, Lcom/itextpdf/kernel/font/Type3Font;

    const/4 v1, 0x1

    aget-wide v1, p1, v1

    double-to-int v1, v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/font/Type3Font;->setTypoDescender(I)V

    .line 577
    return-void
.end method

.method private initializeUsedGlyphs(Lcom/itextpdf/kernel/pdf/PdfDictionary;)I
    .locals 5
    .param p1, "fontDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 536
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->FirstChar:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/itextpdf/kernel/font/PdfType3Font;->normalizeFirstLastChar(Lcom/itextpdf/kernel/pdf/PdfNumber;I)I

    move-result v0

    .line 537
    .local v0, "firstChar":I
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->LastChar:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v1

    const/16 v2, 0xff

    invoke-direct {p0, v1, v2}, Lcom/itextpdf/kernel/font/PdfType3Font;->normalizeFirstLastChar(Lcom/itextpdf/kernel/pdf/PdfNumber;I)I

    move-result v1

    .line 539
    .local v1, "lastChar":I
    move v2, v0

    .local v2, "i":I
    :goto_0
    if-gt v2, v1, :cond_0

    .line 540
    iget-object v3, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->usedGlyphs:[B

    const/4 v4, 0x1

    aput-byte v4, v3, v2

    .line 539
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 542
    .end local v2    # "i":I
    :cond_0
    return v0
.end method

.method private normalize1000UnitsToGlyphSpaceUnits(D)D
    .locals 2
    .param p1, "value"    # D

    .line 605
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getGlyphSpaceNormalizationFactor()D

    move-result-wide v0

    div-double v0, p1, v0

    return-wide v0
.end method

.method private normalize1000UnitsToGlyphSpaceUnits([D)V
    .locals 3
    .param p1, "array"    # [D

    .line 599
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 600
    aget-wide v1, p1, v0

    invoke-direct {p0, v1, v2}, Lcom/itextpdf/kernel/font/PdfType3Font;->normalize1000UnitsToGlyphSpaceUnits(D)D

    move-result-wide v1

    aput-wide v1, p1, v0

    .line 599
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 602
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method private normalizeFirstLastChar(Lcom/itextpdf/kernel/pdf/PdfNumber;I)I
    .locals 2
    .param p1, "firstLast"    # Lcom/itextpdf/kernel/pdf/PdfNumber;
    .param p2, "defaultValue"    # I

    .line 643
    if-nez p1, :cond_0

    return p2

    .line 644
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v0

    .line 645
    .local v0, "result":I
    if-ltz v0, :cond_2

    const/16 v1, 0xff

    if-le v0, v1, :cond_1

    goto :goto_0

    :cond_1
    move v1, v0

    goto :goto_1

    :cond_2
    :goto_0
    move v1, p2

    :goto_1
    return v1
.end method

.method private normalizeGlyphSpaceUnitsTo1000Units(D)D
    .locals 2
    .param p1, "value"    # D

    .line 595
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getGlyphSpaceNormalizationFactor()D

    move-result-wide v0

    mul-double/2addr v0, p1

    return-wide v0
.end method

.method private normalizeGlyphSpaceUnitsTo1000Units([D)V
    .locals 3
    .param p1, "array"    # [D

    .line 589
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 590
    aget-wide v1, p1, v0

    invoke-direct {p0, v1, v2}, Lcom/itextpdf/kernel/font/PdfType3Font;->normalizeGlyphSpaceUnitsTo1000Units(D)D

    move-result-wide v1

    aput-wide v1, p1, v0

    .line 589
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 592
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method private readFontBBox()[D
    .locals 14

    .line 546
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->FontBBox:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 547
    .local v0, "fontBBox":Lcom/itextpdf/kernel/pdf/PdfArray;
    const/4 v1, 0x4

    if-eqz v0, :cond_0

    .line 548
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;->doubleValue()D

    move-result-wide v3

    .line 549
    .local v3, "llx":D
    const/4 v5, 0x1

    invoke-virtual {v0, v5}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfNumber;->doubleValue()D

    move-result-wide v6

    .line 550
    .local v6, "lly":D
    const/4 v8, 0x2

    invoke-virtual {v0, v8}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfNumber;->doubleValue()D

    move-result-wide v9

    .line 551
    .local v9, "urx":D
    const/4 v11, 0x3

    invoke-virtual {v0, v11}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v12

    invoke-virtual {v12}, Lcom/itextpdf/kernel/pdf/PdfNumber;->doubleValue()D

    move-result-wide v12

    .line 553
    .local v12, "ury":D
    new-array v1, v1, [D

    aput-wide v3, v1, v2

    aput-wide v6, v1, v5

    aput-wide v9, v1, v8

    aput-wide v12, v1, v11

    return-object v1

    .line 556
    .end local v3    # "llx":D
    .end local v6    # "lly":D
    .end local v9    # "urx":D
    .end local v12    # "ury":D
    :cond_0
    new-array v1, v1, [D

    fill-array-data v1, :array_0

    return-object v1

    :array_0
    .array-data 8
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method private readFontMatrix()[D
    .locals 5

    .line 560
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->FontMatrix:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 561
    .local v0, "fontMatrixArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-eqz v0, :cond_1

    .line 565
    const/4 v1, 0x6

    new-array v1, v1, [D

    .line 566
    .local v1, "fontMatrix":[D
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 567
    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;->getValue()D

    move-result-wide v3

    aput-wide v3, v1, v2

    .line 566
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 569
    .end local v2    # "i":I
    :cond_0
    return-object v1

    .line 562
    .end local v1    # "fontMatrix":[D
    :cond_1
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Missing required field {0} in font dictionary."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->FontMatrix:Lcom/itextpdf/kernel/pdf/PdfName;

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    .line 563
    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/kernel/exceptions/PdfException;

    move-result-object v1

    throw v1
.end method

.method private readWidths(Lcom/itextpdf/kernel/pdf/PdfDictionary;)[D
    .locals 6
    .param p1, "fontDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 520
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Widths:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 521
    .local v0, "pdfWidths":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-eqz v0, :cond_2

    .line 526
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v1

    new-array v1, v1, [D

    .line 527
    .local v1, "widths":[D
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 528
    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v3

    .line 529
    .local v3, "n":Lcom/itextpdf/kernel/pdf/PdfNumber;
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;->doubleValue()D

    move-result-wide v4

    goto :goto_1

    :cond_0
    const-wide/16 v4, 0x0

    :goto_1
    aput-wide v4, v1, v2

    .line 527
    .end local v3    # "n":Lcom/itextpdf/kernel/pdf/PdfNumber;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 532
    .end local v2    # "i":I
    :cond_1
    return-object v1

    .line 522
    .end local v1    # "widths":[D
    :cond_2
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Missing required field {0} in font dictionary."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Widths:Lcom/itextpdf/kernel/pdf/PdfName;

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    .line 523
    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/kernel/exceptions/PdfException;

    move-result-object v1

    throw v1
.end method


# virtual methods
.method protected addFontStream(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 0
    .param p1, "fontDescriptor"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 402
    return-void
.end method

.method public addGlyph(CIIIII)Lcom/itextpdf/kernel/font/Type3Glyph;
    .locals 16
    .param p1, "c"    # C
    .param p2, "wx"    # I
    .param p3, "llx"    # I
    .param p4, "lly"    # I
    .param p5, "urx"    # I
    .param p6, "ury"    # I

    .line 293
    move-object/from16 v0, p0

    move/from16 v1, p3

    move/from16 v2, p4

    move/from16 v3, p5

    move/from16 v4, p6

    invoke-virtual/range {p0 .. p1}, Lcom/itextpdf/kernel/font/PdfType3Font;->getType3Glyph(I)Lcom/itextpdf/kernel/font/Type3Glyph;

    move-result-object v5

    .line 294
    .local v5, "glyph":Lcom/itextpdf/kernel/font/Type3Glyph;
    if-eqz v5, :cond_0

    .line 295
    return-object v5

    .line 297
    :cond_0
    invoke-direct {v0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getFirstEmptyCode()I

    move-result v7

    .line 298
    .local v7, "code":I
    new-instance v11, Lcom/itextpdf/kernel/font/Type3Glyph;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v9

    move/from16 v6, p2

    int-to-float v10, v6

    move-object v8, v11

    int-to-float v11, v1

    int-to-float v12, v2

    int-to-float v13, v3

    int-to-float v14, v4

    invoke-virtual {v0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v15

    check-cast v15, Lcom/itextpdf/kernel/font/Type3Font;

    invoke-virtual {v15}, Lcom/itextpdf/kernel/font/Type3Font;->isColorized()Z

    move-result v15

    invoke-direct/range {v8 .. v15}, Lcom/itextpdf/kernel/font/Type3Glyph;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;FFFFFZ)V

    move-object v11, v8

    .line 299
    .end local v5    # "glyph":Lcom/itextpdf/kernel/font/Type3Glyph;
    .local v11, "glyph":Lcom/itextpdf/kernel/font/Type3Glyph;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/font/Type3Font;

    filled-new-array/range {p3 .. p6}, [I

    move-result-object v10

    move/from16 v8, p1

    move v9, v6

    move-object v6, v5

    invoke-virtual/range {v6 .. v11}, Lcom/itextpdf/kernel/font/Type3Font;->addGlyph(III[ILcom/itextpdf/kernel/font/Type3Glyph;)V

    .line 300
    iget-object v5, v0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v5, v7, v8}, Lcom/itextpdf/io/font/FontEncoding;->addSymbol(II)Z

    .line 302
    invoke-virtual {v0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/font/Type3Font;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/font/Type3Font;->isColorized()Z

    move-result v5

    if-nez v5, :cond_2

    .line 303
    iget-object v5, v0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v5}, Lcom/itextpdf/io/font/FontProgram;->countOfGlyphs()I

    move-result v5

    if-nez v5, :cond_1

    .line 304
    iget-object v5, v0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v5}, Lcom/itextpdf/io/font/FontProgram;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v5

    invoke-virtual {v5, v1, v2, v3, v4}, Lcom/itextpdf/io/font/FontMetrics;->setBbox(IIII)V

    goto :goto_0

    .line 306
    :cond_1
    iget-object v5, v0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v5}, Lcom/itextpdf/io/font/FontProgram;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/io/font/FontMetrics;->getBbox()[I

    move-result-object v5

    .line 307
    .local v5, "bbox":[I
    const/4 v6, 0x0

    aget v6, v5, v6

    invoke-static {v6, v1}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 308
    .local v6, "newLlx":I
    const/4 v9, 0x1

    aget v9, v5, v9

    invoke-static {v9, v2}, Ljava/lang/Math;->min(II)I

    move-result v9

    .line 309
    .local v9, "newLly":I
    const/4 v10, 0x2

    aget v10, v5, v10

    invoke-static {v10, v3}, Ljava/lang/Math;->max(II)I

    move-result v10

    .line 310
    .local v10, "newUrx":I
    const/4 v12, 0x3

    aget v12, v5, v12

    invoke-static {v12, v4}, Ljava/lang/Math;->max(II)I

    move-result v12

    .line 311
    .local v12, "newUry":I
    iget-object v13, v0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v13}, Lcom/itextpdf/io/font/FontProgram;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v13

    invoke-virtual {v13, v6, v9, v10, v12}, Lcom/itextpdf/io/font/FontMetrics;->setBbox(IIII)V

    .line 314
    .end local v5    # "bbox":[I
    .end local v6    # "newLlx":I
    .end local v9    # "newLly":I
    .end local v10    # "newUrx":I
    .end local v12    # "newUry":I
    :cond_2
    :goto_0
    return-object v11
.end method

.method protected buildWidthsArray(II)Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 7
    .param p1, "firstChar"    # I
    .param p2, "lastChar"    # I

    .line 385
    sub-int v0, p2, p1

    add-int/lit8 v0, v0, 0x1

    new-array v0, v0, [D

    .line 386
    .local v0, "widths":[D
    move v1, p1

    .local v1, "k":I
    :goto_0
    if-gt v1, p2, :cond_3

    .line 387
    sub-int v2, v1, p1

    .line 388
    .local v2, "i":I
    iget-object v3, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->usedGlyphs:[B

    aget-byte v3, v3, v1

    const-wide/16 v4, 0x0

    if-nez v3, :cond_0

    .line 389
    aput-wide v4, v0, v2

    goto :goto_2

    .line 391
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getFontEncoding()Lcom/itextpdf/io/font/FontEncoding;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/itextpdf/io/font/FontEncoding;->getUnicode(I)I

    move-result v3

    .line 392
    .local v3, "uni":I
    const/4 v6, -0x1

    if-le v3, v6, :cond_1

    invoke-virtual {p0, v3}, Lcom/itextpdf/kernel/font/PdfType3Font;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v6

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v6

    invoke-virtual {v6, v1}, Lcom/itextpdf/io/font/FontProgram;->getGlyphByCode(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v6

    .line 393
    .local v6, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    :goto_1
    if-eqz v6, :cond_2

    invoke-virtual {v6}, Lcom/itextpdf/io/font/otf/Glyph;->getWidth()I

    move-result v4

    int-to-double v4, v4

    :cond_2
    aput-wide v4, v0, v2

    .line 386
    .end local v2    # "i":I
    .end local v3    # "uni":I
    .end local v6    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 396
    .end local v1    # "k":I
    :cond_3
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/font/PdfType3Font;->normalize1000UnitsToGlyphSpaceUnits([D)V

    .line 397
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([D)V

    return-object v1
.end method

.method public containsGlyph(I)Z
    .locals 2
    .param p1, "unicode"    # I

    .line 334
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/FontEncoding;->canEncode(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/16 v0, 0x21

    if-ge p1, v0, :cond_1

    .line 335
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v1, p1}, Lcom/itextpdf/io/font/FontEncoding;->getUnicodeDifference(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/font/FontProgram;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 334
    :goto_0
    return v0
.end method

.method public flush()V
    .locals 1

    .line 340
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType3Font;->isFlushed()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 341
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType3Font;->ensureUnderlyingObjectHasIndirectReference()V

    .line 342
    invoke-direct {p0}, Lcom/itextpdf/kernel/font/PdfType3Font;->flushFontData()V

    .line 343
    invoke-super {p0}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->flush()V

    .line 344
    return-void
.end method

.method protected getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;
    .locals 1

    .line 405
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    return-object v0
.end method

.method protected getFontDescriptor(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 8
    .param p1, "fontName"    # Ljava/lang/String;

    .line 348
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_2

    .line 349
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 350
    .local v0, "fontDescriptor":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/font/PdfType3Font;->makeObjectIndirect(Lcom/itextpdf/kernel/pdf/PdfObject;)Z

    .line 351
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->FontDescriptor:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 353
    iget-object v1, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontProgram;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v1

    .line 355
    .local v1, "fontMetrics":Lcom/itextpdf/io/font/FontMetrics;
    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontMetrics;->getCapHeight()I

    move-result v2

    .line 356
    .local v2, "capHeight":I
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->CapHeight:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfNumber;

    int-to-double v5, v2

    invoke-direct {p0, v5, v6}, Lcom/itextpdf/kernel/font/PdfType3Font;->normalize1000UnitsToGlyphSpaceUnits(D)D

    move-result-wide v5

    invoke-direct {v4, v5, v6}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v0, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 357
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->ItalicAngle:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontMetrics;->getItalicAngle()F

    move-result v5

    float-to-double v5, v5

    invoke-direct {v4, v5, v6}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v0, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 359
    iget-object v3, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontProgram;->getFontNames()Lcom/itextpdf/io/font/FontNames;

    move-result-object v3

    .line 360
    .local v3, "fontNames":Lcom/itextpdf/io/font/FontNames;
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->FontWeight:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontNames;->getFontWeight()I

    move-result v6

    invoke-direct {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 361
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->FontName:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {v5, p1}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 362
    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontNames;->getFamilyName()[[Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontNames;->getFamilyName()[[Ljava/lang/String;

    move-result-object v4

    array-length v4, v4

    if-lez v4, :cond_0

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontNames;->getFamilyName()[[Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aget-object v4, v4, v5

    array-length v4, v4

    const/4 v6, 0x4

    if-lt v4, v6, :cond_0

    .line 363
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->FontFamily:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v6, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontNames;->getFamilyName()[[Ljava/lang/String;

    move-result-object v7

    aget-object v5, v7, v5

    const/4 v7, 0x3

    aget-object v5, v5, v7

    invoke-direct {v6, v5}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v4, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 366
    :cond_0
    iget-object v4, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v4}, Lcom/itextpdf/io/font/FontProgram;->getPdfFontFlags()I

    move-result v4

    .line 368
    .local v4, "flags":I
    sget v5, Lcom/itextpdf/io/font/constants/FontDescriptorFlags;->Symbolic:I

    sget v6, Lcom/itextpdf/io/font/constants/FontDescriptorFlags;->Nonsymbolic:I

    or-int/2addr v5, v6

    not-int v5, v5

    and-int/2addr v4, v5

    .line 370
    iget-object v5, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v5}, Lcom/itextpdf/io/font/FontEncoding;->isFontSpecific()Z

    move-result v5

    if-eqz v5, :cond_1

    sget v5, Lcom/itextpdf/io/font/constants/FontDescriptorFlags;->Symbolic:I

    goto :goto_0

    :cond_1
    sget v5, Lcom/itextpdf/io/font/constants/FontDescriptorFlags;->Nonsymbolic:I

    :goto_0
    or-int/2addr v4, v5

    .line 373
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->Flags:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v6, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v6, v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v5, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 374
    return-object v0

    .line 375
    .end local v0    # "fontDescriptor":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v1    # "fontMetrics":Lcom/itextpdf/io/font/FontMetrics;
    .end local v2    # "capHeight":I
    .end local v3    # "fontNames":Lcom/itextpdf/io/font/FontNames;
    .end local v4    # "flags":I
    :cond_2
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 376
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->isTagged()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 377
    const-class v0, Lcom/itextpdf/kernel/font/PdfType3Font;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 378
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v1, "Type 3 font issue. Font Descriptor is required for tagged PDF. FontName shall be specified."

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 380
    .end local v0    # "logger":Lorg/slf4j/Logger;
    :cond_3
    const/4 v0, 0x0

    return-object v0
.end method

.method public getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;
    .locals 4
    .param p1, "unicode"    # I

    .line 319
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/FontEncoding;->canEncode(I)Z

    move-result v0

    if-nez v0, :cond_1

    const/16 v0, 0x21

    if-ge p1, v0, :cond_0

    goto :goto_0

    .line 329
    :cond_0
    const/4 v0, 0x0

    return-object v0

    .line 320
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v1, p1}, Lcom/itextpdf/io/font/FontEncoding;->getUnicodeDifference(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/font/FontProgram;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    .line 321
    .local v0, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    if-nez v0, :cond_2

    iget-object v1, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->notdefGlyphs:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/io/font/otf/Glyph;

    move-object v0, v1

    if-nez v1, :cond_2

    .line 324
    new-instance v1, Lcom/itextpdf/io/font/otf/Glyph;

    const/4 v2, -0x1

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, p1}, Lcom/itextpdf/io/font/otf/Glyph;-><init>(III)V

    move-object v0, v1

    .line 325
    iget-object v1, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->notdefGlyphs:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 327
    :cond_2
    return-object v0
.end method

.method final getGlyphSpaceNormalizationFactor()D
    .locals 2

    .line 409
    iget-wide v0, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->glyphSpaceNormalizationFactor:D

    return-wide v0
.end method

.method public getNumberOfGlyphs()I
    .locals 1

    .line 273
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/font/Type3Font;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/font/Type3Font;->getNumberOfGlyphs()I

    move-result v0

    return v0
.end method

.method public getType3Glyph(I)Lcom/itextpdf/kernel/font/Type3Glyph;
    .locals 1
    .param p1, "unicode"    # I

    .line 254
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType3Font;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/font/Type3Font;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/font/Type3Font;->getType3Glyph(I)Lcom/itextpdf/kernel/font/Type3Glyph;

    move-result-object v0

    return-object v0
.end method

.method public isEmbedded()Z
    .locals 1

    .line 264
    const/4 v0, 0x1

    return v0
.end method

.method public isSubset()Z
    .locals 1

    .line 259
    const/4 v0, 0x1

    return v0
.end method

.method public setCapHeight(I)V
    .locals 1
    .param p1, "capHeight"    # I

    .line 213
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    check-cast v0, Lcom/itextpdf/kernel/font/Type3Font;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/font/Type3Font;->setCapHeight(I)V

    .line 214
    return-void
.end method

.method public setFontFamily(Ljava/lang/String;)V
    .locals 1
    .param p1, "fontFamily"    # Ljava/lang/String;

    .line 195
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    check-cast v0, Lcom/itextpdf/kernel/font/Type3Font;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/font/Type3Font;->setFontFamily(Ljava/lang/String;)V

    .line 196
    return-void
.end method

.method public setFontName(Ljava/lang/String;)V
    .locals 1
    .param p1, "fontName"    # Ljava/lang/String;

    .line 186
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    check-cast v0, Lcom/itextpdf/kernel/font/Type3Font;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/font/Type3Font;->setFontName(Ljava/lang/String;)V

    .line 187
    return-void
.end method

.method public setFontStretch(Ljava/lang/String;)V
    .locals 1
    .param p1, "fontWidth"    # Ljava/lang/String;

    .line 233
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    check-cast v0, Lcom/itextpdf/kernel/font/Type3Font;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/font/Type3Font;->setFontStretch(Ljava/lang/String;)V

    .line 234
    return-void
.end method

.method public setFontWeight(I)V
    .locals 1
    .param p1, "fontWeight"    # I

    .line 204
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    check-cast v0, Lcom/itextpdf/kernel/font/Type3Font;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/font/Type3Font;->setFontWeight(I)V

    .line 205
    return-void
.end method

.method final setGlyphSpaceNormalizationFactor(D)V
    .locals 0
    .param p1, "glyphSpaceNormalizationFactor"    # D

    .line 413
    iput-wide p1, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->glyphSpaceNormalizationFactor:D

    .line 414
    return-void
.end method

.method public setItalicAngle(I)V
    .locals 1
    .param p1, "italicAngle"    # I

    .line 224
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    check-cast v0, Lcom/itextpdf/kernel/font/Type3Font;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/font/Type3Font;->setItalicAngle(I)V

    .line 225
    return-void
.end method

.method public setPdfFontFlags(I)V
    .locals 1
    .param p1, "flags"    # I

    .line 243
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfType3Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    check-cast v0, Lcom/itextpdf/kernel/font/Type3Font;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/font/Type3Font;->setPdfFontFlags(I)V

    .line 244
    return-void
.end method
