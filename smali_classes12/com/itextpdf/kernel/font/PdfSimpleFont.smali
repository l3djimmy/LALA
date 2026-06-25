.class public abstract Lcom/itextpdf/kernel/font/PdfSimpleFont;
.super Lcom/itextpdf/kernel/font/PdfFont;
.source "PdfSimpleFont.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/itextpdf/io/font/FontProgram;",
        ">",
        "Lcom/itextpdf/kernel/font/PdfFont;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field protected fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

.field protected forceWidthsOutput:Z

.field protected toUnicode:Lcom/itextpdf/io/font/cmap/CMapToUnicode;

.field protected usedGlyphs:[B


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 52
    return-void
.end method

.method protected constructor <init>()V
    .locals 1

    .line 78
    .local p0, "this":Lcom/itextpdf/kernel/font/PdfSimpleFont;, "Lcom/itextpdf/kernel/font/PdfSimpleFont<TT;>;"
    invoke-direct {p0}, Lcom/itextpdf/kernel/font/PdfFont;-><init>()V

    .line 60
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->forceWidthsOutput:Z

    .line 64
    const/16 v0, 0x100

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->usedGlyphs:[B

    .line 79
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 1
    .param p1, "fontDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 73
    .local p0, "this":Lcom/itextpdf/kernel/font/PdfSimpleFont;, "Lcom/itextpdf/kernel/font/PdfSimpleFont<TT;>;"
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/font/PdfFont;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 60
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->forceWidthsOutput:Z

    .line 64
    const/16 v0, 0x100

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->usedGlyphs:[B

    .line 74
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->ToUnicode:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/kernel/font/FontUtil;->processToUnicode(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/io/font/cmap/CMapToUnicode;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->toUnicode:Lcom/itextpdf/io/font/cmap/CMapToUnicode;

    .line 75
    return-void
.end method

.method private isAppendableGlyph(Lcom/itextpdf/io/font/otf/Glyph;)Z
    .locals 1
    .param p1, "glyph"    # Lcom/itextpdf/io/font/otf/Glyph;

    .line 162
    .local p0, "this":Lcom/itextpdf/kernel/font/PdfSimpleFont;, "Lcom/itextpdf/kernel/font/PdfSimpleFont<TT;>;"
    invoke-virtual {p1}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v0

    if-gtz v0, :cond_1

    invoke-virtual {p1}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v0

    invoke-static {v0}, Lcom/itextpdf/io/util/TextUtil;->isWhitespaceOrNonPrintable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method


# virtual methods
.method protected abstract addFontStream(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
.end method

.method public appendAnyGlyph(Ljava/lang/String;ILjava/util/List;)I
    .locals 2
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "from"    # I
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

    .line 142
    .local p0, "this":Lcom/itextpdf/kernel/font/PdfSimpleFont;, "Lcom/itextpdf/kernel/font/PdfSimpleFont<TT;>;"
    .local p3, "glyphs":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/Glyph;>;"
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontEncoding;->isFontSpecific()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 143
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/font/FontProgram;->getGlyphByCode(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    .local v0, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    goto :goto_0

    .line 145
    .end local v0    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_0
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    .line 148
    .restart local v0    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    :goto_0
    if-eqz v0, :cond_1

    .line 149
    invoke-interface {p3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 151
    :cond_1
    const/4 v1, 0x1

    return v1
.end method

.method public appendDecodedCodesToGlyphsList(Ljava/util/List;Lcom/itextpdf/kernel/pdf/PdfString;)Z
    .locals 12
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

    .line 283
    .local p0, "this":Lcom/itextpdf/kernel/font/PdfSimpleFont;, "Lcom/itextpdf/kernel/font/PdfSimpleFont<TT;>;"
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/Glyph;>;"
    const/4 v0, 0x1

    .line 285
    .local v0, "allCodesDecoded":Z
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->getFontEncoding()Lcom/itextpdf/io/font/FontEncoding;

    move-result-object v1

    .line 286
    .local v1, "enc":Lcom/itextpdf/io/font/FontEncoding;
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfString;->getValueBytes()[B

    move-result-object v2

    .line 287
    .local v2, "contentBytes":[B
    array-length v3, v2

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_4

    aget-byte v5, v2, v4

    .line 288
    .local v5, "b":B
    and-int/lit16 v6, v5, 0xff

    .line 289
    .local v6, "code":I
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v7

    invoke-virtual {v7, v6}, Lcom/itextpdf/io/font/FontProgram;->getGlyphByCode(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v7

    .line 290
    .local v7, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-virtual {v1, v6}, Lcom/itextpdf/io/font/FontEncoding;->getUnicode(I)I

    move-result v8

    .line 291
    .local v8, "uni":I
    if-nez v7, :cond_0

    const/4 v9, -0x1

    if-le v8, v9, :cond_0

    .line 292
    invoke-virtual {p0, v8}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v7

    .line 295
    :cond_0
    if-eqz v7, :cond_2

    .line 297
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->getToUnicode()Lcom/itextpdf/io/font/cmap/CMapToUnicode;

    move-result-object v9

    .line 298
    .local v9, "toUnicodeCMap":Lcom/itextpdf/io/font/cmap/CMapToUnicode;
    if-eqz v9, :cond_1

    invoke-virtual {v9, v6}, Lcom/itextpdf/io/font/cmap/CMapToUnicode;->lookup(I)[C

    move-result-object v10

    move-object v11, v10

    .local v11, "chars":[C
    if-eqz v10, :cond_1

    .line 299
    invoke-virtual {v7}, Lcom/itextpdf/io/font/otf/Glyph;->getChars()[C

    move-result-object v10

    invoke-static {v11, v10}, Ljava/util/Arrays;->equals([C[C)Z

    move-result v10

    if-nez v10, :cond_1

    .line 301
    new-instance v10, Lcom/itextpdf/io/font/otf/Glyph;

    invoke-direct {v10, v7}, Lcom/itextpdf/io/font/otf/Glyph;-><init>(Lcom/itextpdf/io/font/otf/Glyph;)V

    move-object v7, v10

    .line 302
    invoke-virtual {v7, v11}, Lcom/itextpdf/io/font/otf/Glyph;->setChars([C)V

    .line 304
    .end local v11    # "chars":[C
    :cond_1
    invoke-interface {p1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 305
    .end local v9    # "toUnicodeCMap":Lcom/itextpdf/io/font/cmap/CMapToUnicode;
    goto :goto_1

    .line 306
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-static {v9}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v9

    .line 307
    .local v9, "logger":Lorg/slf4j/Logger;
    invoke-interface {v9}, Lorg/slf4j/Logger;->isWarnEnabled()Z

    move-result v10

    if-eqz v10, :cond_3

    .line 308
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    filled-new-array {v10}, [Ljava/lang/Object;

    move-result-object v10

    const-string v11, "Could not find glyph with the following code: {0}"

    invoke-static {v11, v10}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 310
    :cond_3
    const/4 v0, 0x0

    .line 287
    .end local v5    # "b":B
    .end local v6    # "code":I
    .end local v7    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    .end local v8    # "uni":I
    .end local v9    # "logger":Lorg/slf4j/Logger;
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 313
    :cond_4
    return v0
.end method

.method public appendGlyphs(Ljava/lang/String;IILjava/util/List;)I
    .locals 4
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "from"    # I
    .param p3, "to"    # I
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

    .line 110
    .local p0, "this":Lcom/itextpdf/kernel/font/PdfSimpleFont;, "Lcom/itextpdf/kernel/font/PdfSimpleFont<TT;>;"
    .local p4, "glyphs":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/Glyph;>;"
    const/4 v0, 0x0

    .line 112
    .local v0, "processed":I
    iget-object v1, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontEncoding;->isFontSpecific()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 113
    move v1, p2

    .local v1, "i":I
    :goto_0
    if-gt v1, p3, :cond_0

    .line 114
    iget-object v2, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    and-int/lit16 v3, v3, 0xff

    invoke-virtual {v2, v3}, Lcom/itextpdf/io/font/FontProgram;->getGlyphByCode(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v2

    .line 115
    .local v2, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    if-eqz v2, :cond_0

    .line 116
    invoke-interface {p4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 117
    nop

    .end local v2    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    add-int/lit8 v0, v0, 0x1

    .line 113
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .end local v1    # "i":I
    :cond_0
    goto :goto_3

    .line 123
    :cond_1
    move v1, p2

    .restart local v1    # "i":I
    :goto_1
    if-gt v1, p3, :cond_4

    .line 124
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v2

    .line 125
    .restart local v2    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    if-eqz v2, :cond_3

    invoke-virtual {v2}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->containsGlyph(I)Z

    move-result v3

    if-nez v3, :cond_2

    invoke-direct {p0, v2}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->isAppendableGlyph(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 126
    :cond_2
    invoke-interface {p4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 127
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 128
    :cond_3
    if-nez v2, :cond_4

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Lcom/itextpdf/io/util/TextUtil;->isWhitespaceOrNonPrintable(I)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 129
    add-int/lit8 v0, v0, 0x1

    .line 123
    .end local v2    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 136
    .end local v1    # "i":I
    :cond_4
    :goto_3
    return v0
.end method

.method protected buildWidthsArray(II)Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 6
    .param p1, "firstChar"    # I
    .param p2, "lastChar"    # I

    .line 483
    .local p0, "this":Lcom/itextpdf/kernel/font/PdfSimpleFont;, "Lcom/itextpdf/kernel/font/PdfSimpleFont<TT;>;"
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 484
    .local v0, "wd":Lcom/itextpdf/kernel/pdf/PdfArray;
    move v1, p1

    .local v1, "k":I
    :goto_0
    if-gt v1, p2, :cond_3

    .line 485
    iget-object v2, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->usedGlyphs:[B

    aget-byte v2, v2, v1

    const/4 v3, 0x0

    if-nez v2, :cond_0

    .line 486
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    goto :goto_2

    .line 488
    :cond_0
    iget-object v2, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v2, v1}, Lcom/itextpdf/io/font/FontEncoding;->getUnicode(I)I

    move-result v2

    .line 489
    .local v2, "uni":I
    const/4 v4, -0x1

    if-le v2, v4, :cond_1

    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v4

    goto :goto_1

    :cond_1
    iget-object v4, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v4, v1}, Lcom/itextpdf/io/font/FontProgram;->getGlyphByCode(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v4

    .line 490
    .local v4, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    :goto_1
    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfNumber;

    if-eqz v4, :cond_2

    invoke-virtual {v4}, Lcom/itextpdf/io/font/otf/Glyph;->getWidth()I

    move-result v3

    :cond_2
    invoke-direct {v5, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v5}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 484
    .end local v2    # "uni":I
    .end local v4    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 493
    .end local v1    # "k":I
    :cond_3
    return-object v0
.end method

.method public convertToBytes(Lcom/itextpdf/io/font/otf/Glyph;)[B
    .locals 5
    .param p1, "glyph"    # Lcom/itextpdf/io/font/otf/Glyph;

    .line 220
    .local p0, "this":Lcom/itextpdf/kernel/font/PdfSimpleFont;, "Lcom/itextpdf/kernel/font/PdfSimpleFont<TT;>;"
    const/4 v0, 0x1

    new-array v1, v0, [B

    .line 221
    .local v1, "bytes":[B
    iget-object v2, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v2}, Lcom/itextpdf/io/font/FontEncoding;->isFontSpecific()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    .line 222
    invoke-virtual {p1}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v2

    int-to-byte v2, v2

    aput-byte v2, v1, v3

    goto :goto_0

    .line 224
    :cond_0
    iget-object v2, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {p1}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v4

    invoke-virtual {v2, v4}, Lcom/itextpdf/io/font/FontEncoding;->canEncode(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 225
    iget-object v2, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {p1}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v4

    invoke-virtual {v2, v4}, Lcom/itextpdf/io/font/FontEncoding;->convertToByte(I)I

    move-result v2

    int-to-byte v2, v2

    aput-byte v2, v1, v3

    .line 230
    :goto_0
    iget-object v2, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->usedGlyphs:[B

    aget-byte v3, v1, v3

    and-int/lit16 v3, v3, 0xff

    aput-byte v0, v2, v3

    .line 231
    return-object v1

    .line 227
    :cond_1
    sget-object v0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->EMPTY_BYTES:[B

    return-object v0
.end method

.method public convertToBytes(Lcom/itextpdf/io/font/otf/GlyphLine;)[B
    .locals 8
    .param p1, "glyphLine"    # Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 194
    .local p0, "this":Lcom/itextpdf/kernel/font/PdfSimpleFont;, "Lcom/itextpdf/kernel/font/PdfSimpleFont<TT;>;"
    if-eqz p1, :cond_5

    .line 195
    invoke-virtual {p1}, Lcom/itextpdf/io/font/otf/GlyphLine;->size()I

    move-result v0

    new-array v0, v0, [B

    .line 196
    .local v0, "bytes":[B
    const/4 v1, 0x0

    .line 197
    .local v1, "ptr":I
    iget-object v2, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v2}, Lcom/itextpdf/io/font/FontEncoding;->isFontSpecific()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 198
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p1}, Lcom/itextpdf/io/font/otf/GlyphLine;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 199
    add-int/lit8 v3, v1, 0x1

    .end local v1    # "ptr":I
    .local v3, "ptr":I
    invoke-virtual {p1, v2}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v4

    int-to-byte v4, v4

    aput-byte v4, v0, v1

    .line 198
    add-int/lit8 v2, v2, 0x1

    move v1, v3

    goto :goto_0

    .end local v2    # "i":I
    .end local v3    # "ptr":I
    .restart local v1    # "ptr":I
    :cond_0
    goto :goto_2

    .line 202
    :cond_1
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_1
    invoke-virtual {p1}, Lcom/itextpdf/io/font/otf/GlyphLine;->size()I

    move-result v3

    if-ge v2, v3, :cond_3

    .line 203
    iget-object v3, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {p1, v2}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/font/FontEncoding;->canEncode(I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 204
    add-int/lit8 v3, v1, 0x1

    .end local v1    # "ptr":I
    .restart local v3    # "ptr":I
    iget-object v4, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {p1, v2}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/io/font/FontEncoding;->convertToByte(I)I

    move-result v4

    int-to-byte v4, v4

    aput-byte v4, v0, v1

    move v1, v3

    .line 202
    .end local v3    # "ptr":I
    .restart local v1    # "ptr":I
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 208
    .end local v2    # "i":I
    :cond_3
    :goto_2
    invoke-static {v0, v1}, Lcom/itextpdf/io/util/ArrayUtil;->shortenArray([BI)[B

    move-result-object v0

    .line 209
    array-length v2, v0

    const/4 v3, 0x0

    :goto_3
    if-ge v3, v2, :cond_4

    aget-byte v4, v0, v3

    .line 210
    .local v4, "b":B
    iget-object v5, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->usedGlyphs:[B

    and-int/lit16 v6, v4, 0xff

    const/4 v7, 0x1

    aput-byte v7, v5, v6

    .line 209
    .end local v4    # "b":B
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 212
    :cond_4
    return-object v0

    .line 214
    .end local v0    # "bytes":[B
    .end local v1    # "ptr":I
    :cond_5
    sget-object v0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->EMPTY_BYTES:[B

    return-object v0
.end method

.method public convertToBytes(Ljava/lang/String;)[B
    .locals 7
    .param p1, "text"    # Ljava/lang/String;

    .line 185
    .local p0, "this":Lcom/itextpdf/kernel/font/PdfSimpleFont;, "Lcom/itextpdf/kernel/font/PdfSimpleFont<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/FontEncoding;->convertToBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 186
    .local v0, "bytes":[B
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-byte v3, v0, v2

    .line 187
    .local v3, "b":B
    iget-object v4, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->usedGlyphs:[B

    and-int/lit16 v5, v3, 0xff

    const/4 v6, 0x1

    aput-byte v6, v4, v5

    .line 186
    .end local v3    # "b":B
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 189
    :cond_0
    return-object v0
.end method

.method public createGlyphLine(Ljava/lang/String;)Lcom/itextpdf/io/font/otf/GlyphLine;
    .locals 4
    .param p1, "content"    # Ljava/lang/String;

    .line 89
    .local p0, "this":Lcom/itextpdf/kernel/font/PdfSimpleFont;, "Lcom/itextpdf/kernel/font/PdfSimpleFont<TT;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 90
    .local v0, "glyphs":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/Glyph;>;"
    iget-object v1, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontEncoding;->isFontSpecific()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 91
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 92
    iget-object v2, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/io/font/FontProgram;->getGlyphByCode(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v2

    .line 93
    .local v2, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    if-eqz v2, :cond_0

    .line 94
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 91
    .end local v2    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .end local v1    # "i":I
    :cond_1
    goto :goto_2

    .line 98
    :cond_2
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_4

    .line 99
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v2

    .line 100
    .restart local v2    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    if-eqz v2, :cond_3

    .line 101
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    .end local v2    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 105
    .end local v1    # "i":I
    :cond_4
    :goto_2
    new-instance v1, Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-direct {v1, v0}, Lcom/itextpdf/io/font/otf/GlyphLine;-><init>(Ljava/util/List;)V

    return-object v1
.end method

.method public decode(Lcom/itextpdf/kernel/pdf/PdfString;)Ljava/lang/String;
    .locals 1
    .param p1, "content"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 265
    .local p0, "this":Lcom/itextpdf/kernel/font/PdfSimpleFont;, "Lcom/itextpdf/kernel/font/PdfSimpleFont<TT;>;"
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->decodeIntoGlyphLine(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/io/font/otf/GlyphLine;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/GlyphLine;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public decodeIntoGlyphLine(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/io/font/otf/GlyphLine;
    .locals 2
    .param p1, "content"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 273
    .local p0, "this":Lcom/itextpdf/kernel/font/PdfSimpleFont;, "Lcom/itextpdf/kernel/font/PdfSimpleFont<TT;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfString;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 274
    .local v0, "glyphs":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/Glyph;>;"
    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->appendDecodedCodesToGlyphsList(Ljava/util/List;Lcom/itextpdf/kernel/pdf/PdfString;)Z

    .line 275
    new-instance v1, Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-direct {v1, v0}, Lcom/itextpdf/io/font/otf/GlyphLine;-><init>(Ljava/util/List;)V

    return-object v1
.end method

.method protected flushFontData(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;)V
    .locals 8
    .param p1, "fontName"    # Ljava/lang/String;
    .param p2, "subtype"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 346
    .local p0, "this":Lcom/itextpdf/kernel/font/PdfSimpleFont;, "Lcom/itextpdf/kernel/font/PdfSimpleFont<TT;>;"
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, p2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 347
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 348
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BaseFont:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 352
    :cond_0
    const/4 v0, 0x0

    .local v0, "firstChar":I
    :goto_0
    const/16 v1, 0xff

    if-gt v0, v1, :cond_2

    .line 353
    iget-object v2, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->usedGlyphs:[B

    aget-byte v2, v2, v0

    if-eqz v2, :cond_1

    goto :goto_1

    .line 352
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 355
    :cond_2
    :goto_1
    const/16 v2, 0xff

    .local v2, "lastChar":I
    :goto_2
    if-lt v2, v0, :cond_4

    .line 356
    iget-object v3, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->usedGlyphs:[B

    aget-byte v3, v3, v2

    if-eqz v3, :cond_3

    goto :goto_3

    .line 355
    :cond_3
    add-int/lit8 v2, v2, -0x1

    goto :goto_2

    .line 358
    :cond_4
    :goto_3
    if-le v0, v1, :cond_5

    .line 359
    const/16 v0, 0xff

    .line 360
    const/16 v2, 0xff

    .line 362
    :cond_5
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->isSubset()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->isEmbedded()Z

    move-result v1

    if-nez v1, :cond_9

    .line 363
    :cond_6
    const/4 v0, 0x0

    .line 364
    iget-object v1, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->usedGlyphs:[B

    array-length v1, v1

    const/4 v3, 0x1

    add-int/lit8 v2, v1, -0x1

    .line 365
    const/4 v1, 0x0

    .local v1, "k":I
    :goto_4
    iget-object v4, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->usedGlyphs:[B

    array-length v4, v4

    if-ge v1, v4, :cond_9

    .line 368
    iget-object v4, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v4, v1}, Lcom/itextpdf/io/font/FontEncoding;->canDecode(I)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 369
    iget-object v4, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->usedGlyphs:[B

    aput-byte v3, v4, v1

    goto :goto_5

    .line 370
    :cond_7
    iget-object v4, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v4}, Lcom/itextpdf/io/font/FontEncoding;->hasDifferences()Z

    move-result v4

    if-nez v4, :cond_8

    iget-object v4, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v4, v1}, Lcom/itextpdf/io/font/FontProgram;->getGlyphByCode(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v4

    if-eqz v4, :cond_8

    .line 371
    iget-object v4, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->usedGlyphs:[B

    aput-byte v3, v4, v1

    goto :goto_5

    .line 373
    :cond_8
    iget-object v4, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->usedGlyphs:[B

    const/4 v5, 0x0

    aput-byte v5, v4, v1

    .line 365
    :goto_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 377
    .end local v1    # "k":I
    :cond_9
    iget-object v1, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontEncoding;->hasDifferences()Z

    move-result v1

    if-eqz v1, :cond_12

    .line 379
    move v1, v0

    .restart local v1    # "k":I
    :goto_6
    const-string v3, ".notdef"

    if-gt v1, v2, :cond_b

    .line 380
    iget-object v4, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v4, v1}, Lcom/itextpdf/io/font/FontEncoding;->getDifference(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_a

    .line 381
    move v0, v1

    .line 382
    goto :goto_7

    .line 379
    :cond_a
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 385
    .end local v1    # "k":I
    :cond_b
    :goto_7
    move v1, v2

    .restart local v1    # "k":I
    :goto_8
    if-lt v1, v0, :cond_d

    .line 386
    iget-object v4, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v4, v1}, Lcom/itextpdf/io/font/FontEncoding;->getDifference(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_c

    .line 387
    move v2, v1

    .line 388
    goto :goto_9

    .line 385
    :cond_c
    add-int/lit8 v1, v1, -0x1

    goto :goto_8

    .line 391
    .end local v1    # "k":I
    :cond_d
    :goto_9
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 392
    .local v1, "enc":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Encoding:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 393
    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v3}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 394
    .local v3, "diff":Lcom/itextpdf/kernel/pdf/PdfArray;
    const/4 v4, 0x1

    .line 395
    .local v4, "gap":Z
    move v5, v0

    .local v5, "k":I
    :goto_a
    if-gt v5, v2, :cond_10

    .line 396
    iget-object v6, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->usedGlyphs:[B

    aget-byte v6, v6, v5

    if-eqz v6, :cond_f

    .line 397
    if-eqz v4, :cond_e

    .line 398
    new-instance v6, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v6, v5}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v3, v6}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 399
    const/4 v4, 0x0

    .line 401
    :cond_e
    new-instance v6, Lcom/itextpdf/kernel/pdf/PdfName;

    iget-object v7, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v7, v5}, Lcom/itextpdf/io/font/FontEncoding;->getDifference(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v6}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    goto :goto_b

    .line 403
    :cond_f
    const/4 v4, 0x1

    .line 395
    :goto_b
    add-int/lit8 v5, v5, 0x1

    goto :goto_a

    .line 406
    .end local v5    # "k":I
    :cond_10
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->Differences:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v5, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 407
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->Encoding:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v5, v6, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 408
    .end local v1    # "enc":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v3    # "diff":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v4    # "gap":Z
    :cond_11
    goto :goto_d

    :cond_12
    iget-object v1, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontEncoding;->isFontSpecific()Z

    move-result v1

    if-nez v1, :cond_11

    .line 409
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Encoding:Lcom/itextpdf/kernel/pdf/PdfName;

    iget-object v4, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v4}, Lcom/itextpdf/io/font/FontEncoding;->getBaseEncoding()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Cp1252"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_13

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->WinAnsiEncoding:Lcom/itextpdf/kernel/pdf/PdfName;

    goto :goto_c

    :cond_13
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->MacRomanEncoding:Lcom/itextpdf/kernel/pdf/PdfName;

    :goto_c
    invoke-virtual {v1, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 414
    :goto_d
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->isForceWidthsOutput()Z

    move-result v1

    if-nez v1, :cond_14

    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->isBuiltInFont()Z

    move-result v1

    if-eqz v1, :cond_14

    iget-object v1, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontEncoding;->hasDifferences()Z

    move-result v1

    if-eqz v1, :cond_15

    .line 415
    :cond_14
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->FirstChar:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v4, v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v1, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 416
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->LastChar:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v4, v2}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v1, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 417
    invoke-virtual {p0, v0, v2}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->buildWidthsArray(II)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v1

    .line 418
    .local v1, "wd":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Widths:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v4, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 420
    .end local v1    # "wd":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_15
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->isBuiltInFont()Z

    move-result v1

    if-nez v1, :cond_16

    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->getFontDescriptor(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    goto :goto_e

    :cond_16
    const/4 v1, 0x0

    .line 421
    .local v1, "fontDescriptor":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :goto_e
    if-eqz v1, :cond_17

    .line 422
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->FontDescriptor:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v4, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 423
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v3

    if-eqz v3, :cond_17

    .line 424
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->flush()V

    .line 427
    :cond_17
    return-void
.end method

.method public getContentWidth(Lcom/itextpdf/kernel/pdf/PdfString;)F
    .locals 4
    .param p1, "content"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 319
    .local p0, "this":Lcom/itextpdf/kernel/font/PdfSimpleFont;, "Lcom/itextpdf/kernel/font/PdfSimpleFont<TT;>;"
    const/4 v0, 0x0

    .line 320
    .local v0, "width":F
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->decodeIntoGlyphLine(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/io/font/otf/GlyphLine;

    move-result-object v1

    .line 321
    .local v1, "glyphLine":Lcom/itextpdf/io/font/otf/GlyphLine;
    iget v2, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .local v2, "i":I
    :goto_0
    iget v3, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-ge v2, v3, :cond_0

    .line 322
    invoke-virtual {v1, v2}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/io/font/otf/Glyph;->getWidth()I

    move-result v3

    int-to-float v3, v3

    add-float/2addr v0, v3

    .line 321
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 324
    .end local v2    # "i":I
    :cond_0
    return v0
.end method

.method protected getFontDescriptor(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 7
    .param p1, "fontName"    # Ljava/lang/String;

    .line 444
    .local p0, "this":Lcom/itextpdf/kernel/font/PdfSimpleFont;, "Lcom/itextpdf/kernel/font/PdfSimpleFont<TT;>;"
    if-eqz p1, :cond_5

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_5

    .line 445
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontProgram;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v0

    .line 446
    .local v0, "fontMetrics":Lcom/itextpdf/io/font/FontMetrics;
    iget-object v1, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontProgram;->getFontNames()Lcom/itextpdf/io/font/FontNames;

    move-result-object v1

    .line 447
    .local v1, "fontNames":Lcom/itextpdf/io/font/FontNames;
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 448
    .local v2, "fontDescriptor":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->makeObjectIndirect(Lcom/itextpdf/kernel/pdf/PdfObject;)Z

    .line 449
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->FontDescriptor:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 450
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->FontName:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {v4, p1}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 451
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Ascent:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontMetrics;->getTypoAscender()I

    move-result v5

    invoke-direct {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 452
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->CapHeight:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontMetrics;->getCapHeight()I

    move-result v5

    invoke-direct {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 453
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Descent:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontMetrics;->getTypoDescender()I

    move-result v5

    invoke-direct {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 454
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->FontBBox:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontMetrics;->getBbox()[I

    move-result-object v5

    invoke-static {v5}, Lcom/itextpdf/io/util/ArrayUtil;->cloneArray([I)[I

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([I)V

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 455
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->ItalicAngle:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontMetrics;->getItalicAngle()F

    move-result v5

    float-to-double v5, v5

    invoke-direct {v4, v5, v6}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 456
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->StemV:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontMetrics;->getStemV()I

    move-result v5

    invoke-direct {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 457
    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontMetrics;->getXHeight()I

    move-result v3

    if-lez v3, :cond_0

    .line 458
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->XHeight:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontMetrics;->getXHeight()I

    move-result v5

    invoke-direct {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 460
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontMetrics;->getStemH()I

    move-result v3

    if-lez v3, :cond_1

    .line 461
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->StemH:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontMetrics;->getStemH()I

    move-result v5

    invoke-direct {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 463
    :cond_1
    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontNames;->getFontWeight()I

    move-result v3

    if-lez v3, :cond_2

    .line 464
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->FontWeight:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontNames;->getFontWeight()I

    move-result v5

    invoke-direct {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 466
    :cond_2
    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontNames;->getFamilyName()[[Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_3

    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontNames;->getFamilyName()[[Ljava/lang/String;

    move-result-object v3

    array-length v3, v3

    if-lez v3, :cond_3

    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontNames;->getFamilyName()[[Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aget-object v3, v3, v4

    array-length v3, v3

    const/4 v5, 0x4

    if-lt v3, v5, :cond_3

    .line 467
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->FontFamily:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontNames;->getFamilyName()[[Ljava/lang/String;

    move-result-object v6

    aget-object v4, v6, v4

    const/4 v6, 0x3

    aget-object v4, v4, v6

    invoke-direct {v5, v4}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 470
    :cond_3
    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->addFontStream(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 471
    iget-object v3, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontProgram;->getPdfFontFlags()I

    move-result v3

    .line 473
    .local v3, "flags":I
    sget v4, Lcom/itextpdf/io/font/constants/FontDescriptorFlags;->Symbolic:I

    sget v5, Lcom/itextpdf/io/font/constants/FontDescriptorFlags;->Nonsymbolic:I

    or-int/2addr v4, v5

    not-int v4, v4

    and-int/2addr v3, v4

    .line 475
    iget-object v4, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v4}, Lcom/itextpdf/io/font/FontEncoding;->isFontSpecific()Z

    move-result v4

    if-eqz v4, :cond_4

    sget v4, Lcom/itextpdf/io/font/constants/FontDescriptorFlags;->Symbolic:I

    goto :goto_0

    :cond_4
    sget v4, Lcom/itextpdf/io/font/constants/FontDescriptorFlags;->Nonsymbolic:I

    :goto_0
    or-int/2addr v3, v4

    .line 478
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Flags:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v5, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v2, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 479
    return-object v2

    .line 444
    .end local v0    # "fontMetrics":Lcom/itextpdf/io/font/FontMetrics;
    .end local v1    # "fontNames":Lcom/itextpdf/io/font/FontNames;
    .end local v2    # "fontDescriptor":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v3    # "flags":I
    :cond_5
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public getFontEncoding()Lcom/itextpdf/io/font/FontEncoding;
    .locals 1

    .line 171
    .local p0, "this":Lcom/itextpdf/kernel/font/PdfSimpleFont;, "Lcom/itextpdf/kernel/font/PdfSimpleFont<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    return-object v0
.end method

.method public getToUnicode()Lcom/itextpdf/io/font/cmap/CMapToUnicode;
    .locals 1

    .line 180
    .local p0, "this":Lcom/itextpdf/kernel/font/PdfSimpleFont;, "Lcom/itextpdf/kernel/font/PdfSimpleFont<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->toUnicode:Lcom/itextpdf/io/font/cmap/CMapToUnicode;

    return-object v0
.end method

.method protected isBuiltInFont()Z
    .locals 1

    .line 434
    .local p0, "this":Lcom/itextpdf/kernel/font/PdfSimpleFont;, "Lcom/itextpdf/kernel/font/PdfSimpleFont<TT;>;"
    const/4 v0, 0x0

    return v0
.end method

.method public isBuiltWith(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "fontProgram"    # Ljava/lang/String;
    .param p2, "encoding"    # Ljava/lang/String;

    .line 83
    .local p0, "this":Lcom/itextpdf/kernel/font/PdfSimpleFont;, "Lcom/itextpdf/kernel/font/PdfSimpleFont<TT;>;"
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/FontProgram;->isBuiltWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    .line 84
    invoke-virtual {v0, p2}, Lcom/itextpdf/io/font/FontEncoding;->isBuiltWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 83
    :goto_0
    return v0
.end method

.method public isForceWidthsOutput()Z
    .locals 1

    .line 333
    .local p0, "this":Lcom/itextpdf/kernel/font/PdfSimpleFont;, "Lcom/itextpdf/kernel/font/PdfSimpleFont<TT;>;"
    iget-boolean v0, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->forceWidthsOutput:Z

    return v0
.end method

.method protected setFontProgram(Lcom/itextpdf/io/font/FontProgram;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 499
    .local p0, "this":Lcom/itextpdf/kernel/font/PdfSimpleFont;, "Lcom/itextpdf/kernel/font/PdfSimpleFont<TT;>;"
    .local p1, "fontProgram":Lcom/itextpdf/io/font/FontProgram;, "TT;"
    iput-object p1, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    .line 500
    return-void
.end method

.method public setForceWidthsOutput(Z)V
    .locals 0
    .param p1, "forceWidthsOutput"    # Z

    .line 342
    .local p0, "this":Lcom/itextpdf/kernel/font/PdfSimpleFont;, "Lcom/itextpdf/kernel/font/PdfSimpleFont<TT;>;"
    iput-boolean p1, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->forceWidthsOutput:Z

    .line 343
    return-void
.end method

.method public writeText(Lcom/itextpdf/io/font/otf/GlyphLine;IILcom/itextpdf/kernel/pdf/PdfOutputStream;)V
    .locals 8
    .param p1, "text"    # Lcom/itextpdf/io/font/otf/GlyphLine;
    .param p2, "from"    # I
    .param p3, "to"    # I
    .param p4, "stream"    # Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 236
    .local p0, "this":Lcom/itextpdf/kernel/font/PdfSimpleFont;, "Lcom/itextpdf/kernel/font/PdfSimpleFont<TT;>;"
    sub-int v0, p3, p2

    const/4 v1, 0x1

    add-int/2addr v0, v1

    new-array v0, v0, [B

    .line 237
    .local v0, "bytes":[B
    const/4 v2, 0x0

    .line 239
    .local v2, "ptr":I
    iget-object v3, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontEncoding;->isFontSpecific()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 240
    move v3, p2

    .local v3, "i":I
    :goto_0
    if-gt v3, p3, :cond_0

    .line 241
    add-int/lit8 v4, v2, 0x1

    .end local v2    # "ptr":I
    .local v4, "ptr":I
    invoke-virtual {p1, v3}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v5

    int-to-byte v5, v5

    aput-byte v5, v0, v2

    .line 240
    add-int/lit8 v3, v3, 0x1

    move v2, v4

    goto :goto_0

    .end local v3    # "i":I
    .end local v4    # "ptr":I
    .restart local v2    # "ptr":I
    :cond_0
    goto :goto_2

    .line 244
    :cond_1
    move v3, p2

    .restart local v3    # "i":I
    :goto_1
    if-gt v3, p3, :cond_3

    .line 245
    invoke-virtual {p1, v3}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v4

    .line 246
    .local v4, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    iget-object v5, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v4}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/itextpdf/io/font/FontEncoding;->canEncode(I)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 247
    add-int/lit8 v5, v2, 0x1

    .end local v2    # "ptr":I
    .local v5, "ptr":I
    iget-object v6, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v4}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v7

    invoke-virtual {v6, v7}, Lcom/itextpdf/io/font/FontEncoding;->convertToByte(I)I

    move-result v6

    int-to-byte v6, v6

    aput-byte v6, v0, v2

    move v2, v5

    .line 244
    .end local v4    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    .end local v5    # "ptr":I
    .restart local v2    # "ptr":I
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 251
    .end local v3    # "i":I
    :cond_3
    :goto_2
    invoke-static {v0, v2}, Lcom/itextpdf/io/util/ArrayUtil;->shortenArray([BI)[B

    move-result-object v0

    .line 252
    array-length v3, v0

    const/4 v4, 0x0

    :goto_3
    if-ge v4, v3, :cond_4

    aget-byte v5, v0, v4

    .line 253
    .local v5, "b":B
    iget-object v6, p0, Lcom/itextpdf/kernel/font/PdfSimpleFont;->usedGlyphs:[B

    and-int/lit16 v7, v5, 0xff

    aput-byte v1, v6, v7

    .line 252
    .end local v5    # "b":B
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 255
    :cond_4
    invoke-static {p4, v0}, Lcom/itextpdf/io/util/StreamUtil;->writeEscapedString(Ljava/io/OutputStream;[B)V

    .line 256
    return-void
.end method

.method public writeText(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfOutputStream;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "stream"    # Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 260
    .local p0, "this":Lcom/itextpdf/kernel/font/PdfSimpleFont;, "Lcom/itextpdf/kernel/font/PdfSimpleFont<TT;>;"
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->convertToBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-static {p2, v0}, Lcom/itextpdf/io/util/StreamUtil;->writeEscapedString(Ljava/io/OutputStream;[B)V

    .line 261
    return-void
.end method
