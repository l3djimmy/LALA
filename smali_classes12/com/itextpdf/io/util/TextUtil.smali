.class public final Lcom/itextpdf/io/util/TextUtil;
.super Ljava/lang/Object;
.source "TextUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    return-void
.end method

.method public static charToString(C)Ljava/lang/String;
    .locals 1
    .param p0, "ch"    # C

    .line 211
    invoke-static {p0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static charsetIsSupported(Ljava/lang/String;)Z
    .locals 2
    .param p0, "charsetName"    # Ljava/lang/String;

    .line 296
    :try_start_0
    invoke-static {p0}, Ljava/nio/charset/Charset;->isSupported(Ljava/lang/String;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 297
    :catch_0
    move-exception v0

    .line 298
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    const/4 v1, 0x0

    return v1
.end method

.method public static convertFromUtf32([III)Ljava/lang/String;
    .locals 3
    .param p0, "text"    # [I
    .param p1, "startPos"    # I
    .param p2, "endPos"    # I

    .line 189
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 190
    .local v0, "sb":Ljava/lang/StringBuilder;
    move v1, p1

    .local v1, "i":I
    :goto_0
    if-ge v1, p2, :cond_0

    .line 191
    aget v2, p0, v1

    invoke-static {v2}, Lcom/itextpdf/io/util/TextUtil;->convertFromUtf32ToCharArray(I)[C

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 190
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 193
    .end local v1    # "i":I
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static convertFromUtf32(I)[C
    .locals 5
    .param p0, "codePoint"    # I

    .line 172
    const/4 v0, 0x1

    const/4 v1, 0x0

    const/high16 v2, 0x10000

    if-ge p0, v2, :cond_0

    .line 173
    int-to-char v2, p0

    new-array v0, v0, [C

    aput-char v2, v0, v1

    return-object v0

    .line 175
    :cond_0
    sub-int/2addr p0, v2

    .line 176
    div-int/lit16 v2, p0, 0x400

    const v3, 0xd800

    add-int/2addr v2, v3

    int-to-char v2, v2

    rem-int/lit16 v3, p0, 0x400

    const v4, 0xdc00

    add-int/2addr v3, v4

    int-to-char v3, v3

    const/4 v4, 0x2

    new-array v4, v4, [C

    aput-char v2, v4, v1

    aput-char v3, v4, v0

    return-object v4
.end method

.method public static convertFromUtf32ToCharArray(I)[C
    .locals 5
    .param p0, "codePoint"    # I

    .line 203
    const/4 v0, 0x1

    const/4 v1, 0x0

    const/high16 v2, 0x10000

    if-ge p0, v2, :cond_0

    .line 204
    int-to-char v2, p0

    new-array v0, v0, [C

    aput-char v2, v0, v1

    return-object v0

    .line 206
    :cond_0
    sub-int/2addr p0, v2

    .line 207
    div-int/lit16 v2, p0, 0x400

    const v3, 0xd800

    add-int/2addr v2, v3

    int-to-char v2, v2

    rem-int/lit16 v3, p0, 0x400

    const v4, 0xdc00

    add-int/2addr v3, v4

    int-to-char v3, v3

    const/4 v4, 0x2

    new-array v4, v4, [C

    aput-char v2, v4, v1

    aput-char v3, v4, v0

    return-object v4
.end method

.method public static convertToUtf32(CC)I
    .locals 2
    .param p0, "highSurrogate"    # C
    .param p1, "lowSurrogate"    # C

    .line 122
    const v0, 0xd800

    sub-int v0, p0, v0

    mul-int/lit16 v0, v0, 0x400

    add-int/2addr v0, p1

    const v1, 0xdc00

    sub-int/2addr v0, v1

    const/high16 v1, 0x10000

    add-int/2addr v0, v1

    return v0
.end method

.method public static convertToUtf32(Ljava/lang/String;I)I
    .locals 2
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "idx"    # I

    .line 144
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const v1, 0xd800

    sub-int/2addr v0, v1

    mul-int/lit16 v0, v0, 0x400

    add-int/lit8 v1, p1, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    add-int/2addr v0, v1

    const v1, 0xdc00

    sub-int/2addr v0, v1

    const/high16 v1, 0x10000

    add-int/2addr v0, v1

    return v0
.end method

.method public static convertToUtf32([CI)I
    .locals 2
    .param p0, "text"    # [C
    .param p1, "idx"    # I

    .line 133
    aget-char v0, p0, p1

    const v1, 0xd800

    sub-int/2addr v0, v1

    mul-int/lit16 v0, v0, 0x400

    add-int/lit8 v1, p1, 0x1

    aget-char v1, p0, v1

    add-int/2addr v0, v1

    const v1, 0xdc00

    sub-int/2addr v0, v1

    const/high16 v1, 0x10000

    add-int/2addr v0, v1

    return v0
.end method

.method public static convertToUtf32(Ljava/lang/String;)[I
    .locals 3
    .param p0, "text"    # Ljava/lang/String;

    .line 148
    if-nez p0, :cond_0

    .line 149
    const/4 v0, 0x0

    return-object v0

    .line 151
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 152
    .local v0, "charCodes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v1, 0x0

    .line 153
    .local v1, "pos":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 154
    invoke-static {p0, v1}, Lcom/itextpdf/io/util/TextUtil;->isSurrogatePair(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 155
    invoke-static {p0, v1}, Lcom/itextpdf/io/util/TextUtil;->convertToUtf32(Ljava/lang/String;I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 156
    add-int/lit8 v1, v1, 0x2

    goto :goto_0

    .line 158
    :cond_1
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 159
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 162
    :cond_2
    invoke-static {v0}, Lcom/itextpdf/io/util/ArrayUtil;->toIntArray(Ljava/util/Collection;)[I

    move-result-object v2

    return-object v2
.end method

.method public static highSurrogate(I)C
    .locals 2
    .param p0, "codePoint"    # I

    .line 75
    ushr-int/lit8 v0, p0, 0xa

    const v1, 0xd7c0

    add-int/2addr v0, v1

    int-to-char v0, v0

    return v0
.end method

.method public static isCarriageReturnFollowedByLineFeed(Lcom/itextpdf/io/font/otf/GlyphLine;I)Z
    .locals 3
    .param p0, "glyphLine"    # Lcom/itextpdf/io/font/otf/GlyphLine;
    .param p1, "carriageReturnPosition"    # I

    .line 247
    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/GlyphLine;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    .line 248
    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/GlyphLine;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x2

    if-gt p1, v0, :cond_0

    .line 249
    invoke-virtual {p0, p1}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v0

    const/16 v2, 0xd

    if-ne v0, v2, :cond_0

    add-int/lit8 v0, p1, 0x1

    .line 250
    invoke-virtual {p0, v0}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v0

    const/16 v2, 0xa

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 247
    :goto_0
    return v1
.end method

.method public static isDiacritic(I)Z
    .locals 1
    .param p0, "codePoint"    # I

    .line 49
    const/16 v0, 0x300

    if-le p0, v0, :cond_0

    const/16 v0, 0x36f

    if-gt p0, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isLetterOrDigit(Lcom/itextpdf/io/font/otf/Glyph;)Z
    .locals 1
    .param p0, "glyph"    # Lcom/itextpdf/io/font/otf/Glyph;

    .line 284
    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->isLetterOrDigit(I)Z

    move-result v0

    return v0
.end method

.method public static isMark(Lcom/itextpdf/io/font/otf/Glyph;)Z
    .locals 3
    .param p0, "glyph"    # Lcom/itextpdf/io/font/otf/Glyph;

    .line 288
    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v0

    .line 289
    .local v0, "unicode":I
    nop

    .line 291
    invoke-static {v0}, Ljava/lang/Character;->getType(I)I

    move-result v1

    const/16 v2, 0x1c0

    shr-int v1, v2, v1

    const/4 v2, 0x1

    and-int/2addr v1, v2

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 289
    :goto_0
    return v2
.end method

.method public static isNewLine(C)Z
    .locals 2
    .param p0, "c"    # C

    .line 232
    move v0, p0

    .line 233
    .local v0, "unicode":I
    invoke-static {v0}, Lcom/itextpdf/io/util/TextUtil;->isNewLine(I)Z

    move-result v1

    return v1
.end method

.method public static isNewLine(I)Z
    .locals 1
    .param p0, "unicode"    # I

    .line 243
    const/16 v0, 0xa

    if-eq p0, v0, :cond_1

    const/16 v0, 0xd

    if-ne p0, v0, :cond_0

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

.method public static isNewLine(Lcom/itextpdf/io/font/otf/Glyph;)Z
    .locals 2
    .param p0, "glyph"    # Lcom/itextpdf/io/font/otf/Glyph;

    .line 221
    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v0

    .line 222
    .local v0, "unicode":I
    invoke-static {v0}, Lcom/itextpdf/io/util/TextUtil;->isNewLine(I)Z

    move-result v1

    return v1
.end method

.method public static isNonBreakingHyphen(Lcom/itextpdf/io/font/otf/Glyph;)Z
    .locals 2
    .param p0, "glyph"    # Lcom/itextpdf/io/font/otf/Glyph;

    .line 264
    const/16 v0, 0x2011

    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isNonPrintable(I)Z
    .locals 1
    .param p0, "c"    # I

    .line 276
    invoke-static {p0}, Ljava/lang/Character;->isIdentifierIgnorable(I)Z

    move-result v0

    if-nez v0, :cond_1

    const/16 v0, 0xad

    if-ne p0, v0, :cond_0

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

.method public static isSpace(Lcom/itextpdf/io/font/otf/Glyph;)Z
    .locals 1
    .param p0, "glyph"    # Lcom/itextpdf/io/font/otf/Glyph;

    .line 268
    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v0

    int-to-char v0, v0

    invoke-static {v0}, Ljava/lang/Character;->isSpaceChar(C)Z

    move-result v0

    return v0
.end method

.method public static isSpaceOrWhitespace(Lcom/itextpdf/io/font/otf/Glyph;)Z
    .locals 1
    .param p0, "glyph"    # Lcom/itextpdf/io/font/otf/Glyph;

    .line 256
    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v0

    int-to-char v0, v0

    invoke-static {v0}, Ljava/lang/Character;->isSpaceChar(C)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v0

    int-to-char v0, v0

    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(C)Z

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

.method public static isSurrogateHigh(C)Z
    .locals 1
    .param p0, "c"    # C

    .line 60
    const v0, 0xd800

    if-lt p0, v0, :cond_0

    const v0, 0xdbff

    if-gt p0, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isSurrogateLow(C)Z
    .locals 1
    .param p0, "c"    # C

    .line 71
    const v0, 0xdc00

    if-lt p0, v0, :cond_0

    const v0, 0xdfff

    if-gt p0, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isSurrogatePair(Ljava/lang/String;I)Z
    .locals 1
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "idx"    # I

    .line 93
    if-ltz p1, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x2

    if-gt p1, v0, :cond_0

    .line 94
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Lcom/itextpdf/io/util/TextUtil;->isSurrogateHigh(C)Z

    move-result v0

    if-eqz v0, :cond_0

    add-int/lit8 v0, p1, 0x1

    .line 95
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Lcom/itextpdf/io/util/TextUtil;->isSurrogateLow(C)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 93
    :goto_0
    return v0
.end method

.method public static isSurrogatePair([CI)Z
    .locals 1
    .param p0, "text"    # [C
    .param p1, "idx"    # I

    .line 108
    if-ltz p1, :cond_0

    array-length v0, p0

    add-int/lit8 v0, v0, -0x2

    if-gt p1, v0, :cond_0

    aget-char v0, p0, p1

    .line 109
    invoke-static {v0}, Lcom/itextpdf/io/util/TextUtil;->isSurrogateHigh(C)Z

    move-result v0

    if-eqz v0, :cond_0

    add-int/lit8 v0, p1, 0x1

    aget-char v0, p0, v0

    .line 110
    invoke-static {v0}, Lcom/itextpdf/io/util/TextUtil;->isSurrogateLow(C)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 108
    :goto_0
    return v0
.end method

.method public static isUni0020(Lcom/itextpdf/io/font/otf/Glyph;)Z
    .locals 2
    .param p0, "g"    # Lcom/itextpdf/io/font/otf/Glyph;

    .line 272
    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v0

    const/16 v1, 0x20

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isWhitespace(Lcom/itextpdf/io/font/otf/Glyph;)Z
    .locals 1
    .param p0, "glyph"    # Lcom/itextpdf/io/font/otf/Glyph;

    .line 260
    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(I)Z

    move-result v0

    return v0
.end method

.method public static isWhitespaceOrNonPrintable(I)Z
    .locals 1
    .param p0, "code"    # I

    .line 280
    invoke-static {p0}, Ljava/lang/Character;->isWhitespace(I)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p0}, Lcom/itextpdf/io/util/TextUtil;->isNonPrintable(I)Z

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

.method public static lowSurrogate(I)C
    .locals 2
    .param p0, "codePoint"    # I

    .line 80
    and-int/lit16 v0, p0, 0x3ff

    const v1, 0xdc00

    add-int/2addr v0, v1

    int-to-char v0, v0

    return v0
.end method
