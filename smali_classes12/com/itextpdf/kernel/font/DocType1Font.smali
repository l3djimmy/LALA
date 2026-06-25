.class Lcom/itextpdf/kernel/font/DocType1Font;
.super Lcom/itextpdf/io/font/Type1Font;
.source "DocType1Font.java"

# interfaces
.implements Lcom/itextpdf/kernel/font/IDocFontProgram;


# instance fields
.field private fontFile:Lcom/itextpdf/kernel/pdf/PdfStream;

.field private fontFileName:Lcom/itextpdf/kernel/pdf/PdfName;

.field private missingWidth:I

.field private subtype:Lcom/itextpdf/kernel/pdf/PdfName;


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "fontName"    # Ljava/lang/String;

    .line 51
    invoke-direct {p0, p1}, Lcom/itextpdf/io/font/Type1Font;-><init>(Ljava/lang/String;)V

    .line 48
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/font/DocType1Font;->missingWidth:I

    .line 52
    return-void
.end method

.method static createFontProgram(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/io/font/FontEncoding;Lcom/itextpdf/io/font/cmap/CMapToUnicode;)Lcom/itextpdf/io/font/Type1Font;
    .locals 4
    .param p0, "fontDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p1, "fontEncoding"    # Lcom/itextpdf/io/font/FontEncoding;
    .param p2, "toUnicode"    # Lcom/itextpdf/io/font/cmap/CMapToUnicode;

    .line 56
    invoke-static {p0}, Lcom/itextpdf/kernel/font/DocType1Font;->getBaseFont(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Ljava/lang/String;

    move-result-object v0

    .line 57
    .local v0, "baseFont":Ljava/lang/String;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->FontDescriptor:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 58
    invoke-static {v0}, Lcom/itextpdf/kernel/font/DocType1Font;->getType1Font(Ljava/lang/String;)Lcom/itextpdf/io/font/Type1Font;

    move-result-object v1

    .line 59
    .local v1, "type1StdFont":Lcom/itextpdf/io/font/Type1Font;
    if-eqz v1, :cond_0

    .line 60
    invoke-virtual {v1, p1}, Lcom/itextpdf/io/font/Type1Font;->initializeGlyphs(Lcom/itextpdf/io/font/FontEncoding;)V

    .line 61
    return-object v1

    .line 64
    .end local v1    # "type1StdFont":Lcom/itextpdf/io/font/Type1Font;
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/font/DocType1Font;

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/font/DocType1Font;-><init>(Ljava/lang/String;)V

    .line 65
    .local v1, "fontProgram":Lcom/itextpdf/kernel/font/DocType1Font;
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->FontDescriptor:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    .line 66
    .local v2, "fontDesc":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v2, :cond_1

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v3

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    :goto_0
    iput-object v3, v1, Lcom/itextpdf/kernel/font/DocType1Font;->subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 67
    invoke-static {v1, v2}, Lcom/itextpdf/kernel/font/DocType1Font;->fillFontDescriptor(Lcom/itextpdf/kernel/font/DocType1Font;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 68
    invoke-static {p0, p1, p2, v1}, Lcom/itextpdf/kernel/font/DocType1Font;->initializeGlyphs(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/io/font/FontEncoding;Lcom/itextpdf/io/font/cmap/CMapToUnicode;Lcom/itextpdf/kernel/font/DocType1Font;)V

    .line 70
    return-object v1
.end method

.method static fillFontDescriptor(Lcom/itextpdf/kernel/font/DocType1Font;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 12
    .param p0, "font"    # Lcom/itextpdf/kernel/font/DocType1Font;
    .param p1, "fontDesc"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 153
    if-nez p1, :cond_0

    .line 154
    const-class v0, Lcom/itextpdf/kernel/font/FontUtil;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 155
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v1, "Font dictionary does not contain required /FontDescriptor entry."

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 156
    return-void

    .line 158
    .end local v0    # "logger":Lorg/slf4j/Logger;
    :cond_0
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Ascent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 159
    .local v0, "v":Lcom/itextpdf/kernel/pdf/PdfNumber;
    if-eqz v0, :cond_1

    .line 160
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/font/DocType1Font;->setTypoAscender(I)V

    .line 162
    :cond_1
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Descent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 163
    if-eqz v0, :cond_2

    .line 164
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/font/DocType1Font;->setTypoDescender(I)V

    .line 166
    :cond_2
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->CapHeight:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 167
    if-eqz v0, :cond_3

    .line 168
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/font/DocType1Font;->setCapHeight(I)V

    .line 170
    :cond_3
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->XHeight:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 171
    if-eqz v0, :cond_4

    .line 172
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/font/DocType1Font;->setXHeight(I)V

    .line 174
    :cond_4
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ItalicAngle:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 175
    if-eqz v0, :cond_5

    .line 176
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/font/DocType1Font;->setItalicAngle(I)V

    .line 178
    :cond_5
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->StemV:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 179
    if-eqz v0, :cond_6

    .line 180
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/font/DocType1Font;->setStemV(I)V

    .line 182
    :cond_6
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->StemH:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 183
    if-eqz v0, :cond_7

    .line 184
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/font/DocType1Font;->setStemH(I)V

    .line 186
    :cond_7
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->FontWeight:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 187
    if-eqz v0, :cond_8

    .line 188
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/font/DocType1Font;->setFontWeight(I)V

    .line 190
    :cond_8
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->MissingWidth:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 191
    if-eqz v0, :cond_9

    .line 192
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v1

    iput v1, p0, Lcom/itextpdf/kernel/font/DocType1Font;->missingWidth:I

    .line 195
    :cond_9
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->FontStretch:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    .line 196
    .local v1, "fontStretch":Lcom/itextpdf/kernel/pdf/PdfName;
    if-eqz v1, :cond_a

    .line 197
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/font/DocType1Font;->setFontStretch(Ljava/lang/String;)V

    .line 200
    :cond_a
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->FontBBox:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v2

    .line 202
    .local v2, "bboxValue":Lcom/itextpdf/kernel/pdf/PdfArray;
    const/4 v3, 0x2

    const/4 v4, 0x3

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eqz v2, :cond_d

    .line 203
    const/4 v7, 0x4

    new-array v7, v7, [I

    .line 205
    .local v7, "bbox":[I
    invoke-virtual {v2, v5}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v8

    aput v8, v7, v5

    .line 207
    invoke-virtual {v2, v6}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v8

    aput v8, v7, v6

    .line 209
    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v8

    aput v8, v7, v3

    .line 211
    invoke-virtual {v2, v4}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v8

    aput v8, v7, v4

    .line 213
    aget v8, v7, v5

    aget v9, v7, v3

    if-le v8, v9, :cond_b

    .line 214
    aget v8, v7, v5

    .line 215
    .local v8, "t":I
    aget v9, v7, v3

    aput v9, v7, v5

    .line 216
    aput v8, v7, v3

    .line 218
    .end local v8    # "t":I
    :cond_b
    aget v8, v7, v6

    aget v9, v7, v4

    if-le v8, v9, :cond_c

    .line 219
    aget v8, v7, v6

    .line 220
    .restart local v8    # "t":I
    aget v9, v7, v4

    aput v9, v7, v6

    .line 221
    aput v8, v7, v4

    .line 223
    .end local v8    # "t":I
    :cond_c
    invoke-virtual {p0, v7}, Lcom/itextpdf/kernel/font/DocType1Font;->setBbox([I)V

    .line 228
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/DocType1Font;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/io/font/FontMetrics;->getTypoAscender()I

    move-result v8

    if-nez v8, :cond_d

    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/DocType1Font;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/io/font/FontMetrics;->getTypoDescender()I

    move-result v8

    if-nez v8, :cond_d

    .line 229
    aget v8, v7, v4

    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/DocType1Font;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/io/font/FontMetrics;->getTypoAscender()I

    move-result v9

    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    move-result v8

    int-to-float v8, v8

    .line 230
    .local v8, "maxAscent":F
    aget v9, v7, v6

    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/DocType1Font;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v10

    invoke-virtual {v10}, Lcom/itextpdf/io/font/FontMetrics;->getTypoDescender()I

    move-result v10

    invoke-static {v9, v10}, Ljava/lang/Math;->min(II)I

    move-result v9

    int-to-float v9, v9

    .line 231
    .local v9, "minDescent":F
    nop

    .line 232
    invoke-static {v8}, Lcom/itextpdf/io/font/FontProgram;->convertGlyphSpaceToTextSpace(F)F

    move-result v10

    sub-float v11, v8, v9

    div-float/2addr v10, v11

    float-to-int v10, v10

    .line 231
    invoke-virtual {p0, v10}, Lcom/itextpdf/kernel/font/DocType1Font;->setTypoAscender(I)V

    .line 233
    nop

    .line 234
    invoke-static {v9}, Lcom/itextpdf/io/font/FontProgram;->convertGlyphSpaceToTextSpace(F)F

    move-result v10

    sub-float v11, v8, v9

    div-float/2addr v10, v11

    float-to-int v10, v10

    .line 233
    invoke-virtual {p0, v10}, Lcom/itextpdf/kernel/font/DocType1Font;->setTypoDescender(I)V

    .line 238
    .end local v7    # "bbox":[I
    .end local v8    # "maxAscent":F
    .end local v9    # "minDescent":F
    :cond_d
    sget-object v7, Lcom/itextpdf/kernel/pdf/PdfName;->FontFamily:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v7}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v7

    .line 239
    .local v7, "fontFamily":Lcom/itextpdf/kernel/pdf/PdfString;
    if-eqz v7, :cond_e

    .line 240
    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfString;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/itextpdf/kernel/font/DocType1Font;->setFontFamily(Ljava/lang/String;)V

    .line 243
    :cond_e
    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->Flags:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v8}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v8

    .line 244
    .local v8, "flagsValue":Lcom/itextpdf/kernel/pdf/PdfNumber;
    if-eqz v8, :cond_10

    .line 245
    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v9

    .line 246
    .local v9, "flags":I
    and-int/lit8 v10, v9, 0x1

    if-eqz v10, :cond_f

    .line 247
    invoke-virtual {p0, v6}, Lcom/itextpdf/kernel/font/DocType1Font;->setFixedPitch(Z)V

    .line 249
    :cond_f
    const/high16 v10, 0x40000

    and-int/2addr v10, v9

    if-eqz v10, :cond_10

    .line 250
    invoke-virtual {p0, v6}, Lcom/itextpdf/kernel/font/DocType1Font;->setBold(Z)V

    .line 254
    .end local v9    # "flags":I
    :cond_10
    new-array v4, v4, [Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v9, Lcom/itextpdf/kernel/pdf/PdfName;->FontFile:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v9, v4, v5

    sget-object v9, Lcom/itextpdf/kernel/pdf/PdfName;->FontFile2:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v9, v4, v6

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->FontFile3:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v6, v4, v3

    .line 255
    .local v4, "fontFileNames":[Lcom/itextpdf/kernel/pdf/PdfName;
    array-length v3, v4

    :goto_0
    if-ge v5, v3, :cond_12

    aget-object v6, v4, v5

    .line 256
    .local v6, "fontFile":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-virtual {p1, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v9

    if-eqz v9, :cond_11

    .line 257
    iput-object v6, p0, Lcom/itextpdf/kernel/font/DocType1Font;->fontFileName:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 258
    invoke-virtual {p1, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsStream(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v3

    iput-object v3, p0, Lcom/itextpdf/kernel/font/DocType1Font;->fontFile:Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 259
    goto :goto_1

    .line 255
    .end local v6    # "fontFile":Lcom/itextpdf/kernel/pdf/PdfName;
    :cond_11
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 262
    :cond_12
    :goto_1
    return-void
.end method

.method static getBaseFont(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Ljava/lang/String;
    .locals 2
    .param p0, "fontDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 103
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->BaseFont:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    .line 104
    .local v0, "baseFontName":Lcom/itextpdf/kernel/pdf/PdfName;
    if-nez v0, :cond_0

    .line 105
    invoke-static {}, Lcom/itextpdf/kernel/font/FontUtil;->createRandomFontName()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 107
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method static getType1Font(Ljava/lang/String;)Lcom/itextpdf/io/font/Type1Font;
    .locals 2
    .param p0, "baseFont"    # Ljava/lang/String;

    .line 114
    const/4 v0, 0x0

    :try_start_0
    invoke-static {p0, v0}, Lcom/itextpdf/io/font/FontProgramFactory;->createFont(Ljava/lang/String;Z)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/font/Type1Font;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 115
    :catch_0
    move-exception v0

    .line 116
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    return-object v1
.end method

.method static initializeGlyphs(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/io/font/FontEncoding;Lcom/itextpdf/io/font/cmap/CMapToUnicode;Lcom/itextpdf/kernel/font/DocType1Font;)V
    .locals 8
    .param p0, "fontDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p1, "fontEncoding"    # Lcom/itextpdf/io/font/FontEncoding;
    .param p2, "toUnicode"    # Lcom/itextpdf/io/font/cmap/CMapToUnicode;
    .param p3, "fontProgram"    # Lcom/itextpdf/kernel/font/DocType1Font;

    .line 75
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->FirstChar:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 76
    .local v0, "firstCharNumber":Lcom/itextpdf/kernel/pdf/PdfNumber;
    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v2

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v2

    goto :goto_0

    :cond_0
    move v2, v1

    .line 77
    .local v2, "firstChar":I
    :goto_0
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Widths:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v3

    .line 78
    invoke-virtual {p3}, Lcom/itextpdf/kernel/font/DocType1Font;->getMissingWidth()I

    move-result v4

    .line 77
    invoke-static {v3, v2, v4}, Lcom/itextpdf/kernel/font/FontUtil;->convertSimpleWidthsArray(Lcom/itextpdf/kernel/pdf/PdfArray;II)[I

    move-result-object v3

    .line 79
    .local v3, "widths":[I
    iput v1, p3, Lcom/itextpdf/kernel/font/DocType1Font;->avgWidth:I

    .line 80
    const/4 v1, 0x0

    .line 81
    .local v1, "glyphsWithWidths":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    const/16 v5, 0x100

    if-ge v4, v5, :cond_4

    .line 82
    new-instance v5, Lcom/itextpdf/io/font/otf/Glyph;

    aget v6, v3, v4

    invoke-virtual {p1, v4}, Lcom/itextpdf/io/font/FontEncoding;->getUnicode(I)I

    move-result v7

    invoke-direct {v5, v4, v6, v7}, Lcom/itextpdf/io/font/otf/Glyph;-><init>(III)V

    .line 83
    .local v5, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    iget-object v6, p3, Lcom/itextpdf/kernel/font/DocType1Font;->codeToGlyph:Ljava/util/Map;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v6, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    invoke-virtual {v5}, Lcom/itextpdf/io/font/otf/Glyph;->hasValidUnicode()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 86
    invoke-virtual {v5}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v6

    invoke-virtual {p1, v6}, Lcom/itextpdf/io/font/FontEncoding;->convertToByte(I)I

    move-result v6

    if-ne v6, v4, :cond_2

    .line 87
    iget-object v6, p3, Lcom/itextpdf/kernel/font/DocType1Font;->unicodeToGlyph:Ljava/util/Map;

    invoke-virtual {v5}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v6, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 89
    :cond_1
    if-eqz p2, :cond_2

    .line 90
    invoke-virtual {p2, v4}, Lcom/itextpdf/io/font/cmap/CMapToUnicode;->lookup(I)[C

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/itextpdf/io/font/otf/Glyph;->setChars([C)V

    .line 92
    :cond_2
    :goto_2
    aget v6, v3, v4

    if-lez v6, :cond_3

    .line 93
    add-int/lit8 v1, v1, 0x1

    .line 94
    iget v6, p3, Lcom/itextpdf/kernel/font/DocType1Font;->avgWidth:I

    aget v7, v3, v4

    add-int/2addr v6, v7

    iput v6, p3, Lcom/itextpdf/kernel/font/DocType1Font;->avgWidth:I

    .line 81
    .end local v5    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 97
    .end local v4    # "i":I
    :cond_4
    if-eqz v1, :cond_5

    .line 98
    iget v4, p3, Lcom/itextpdf/kernel/font/DocType1Font;->avgWidth:I

    div-int/2addr v4, v1

    iput v4, p3, Lcom/itextpdf/kernel/font/DocType1Font;->avgWidth:I

    .line 100
    :cond_5
    return-void
.end method


# virtual methods
.method public getFontFile()Lcom/itextpdf/kernel/pdf/PdfStream;
    .locals 1

    .line 123
    iget-object v0, p0, Lcom/itextpdf/kernel/font/DocType1Font;->fontFile:Lcom/itextpdf/kernel/pdf/PdfStream;

    return-object v0
.end method

.method public getFontFileName()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 1

    .line 128
    iget-object v0, p0, Lcom/itextpdf/kernel/font/DocType1Font;->fontFileName:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0
.end method

.method public getMissingWidth()I
    .locals 1

    .line 149
    iget v0, p0, Lcom/itextpdf/kernel/font/DocType1Font;->missingWidth:I

    return v0
.end method

.method public getSubtype()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 1

    .line 133
    iget-object v0, p0, Lcom/itextpdf/kernel/font/DocType1Font;->subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0
.end method

.method public isBuiltWith(Ljava/lang/String;)Z
    .locals 1
    .param p1, "fontName"    # Ljava/lang/String;

    .line 145
    const/4 v0, 0x0

    return v0
.end method
