.class Lcom/itextpdf/kernel/font/DocFontEncoding;
.super Lcom/itextpdf/io/font/FontEncoding;
.source "DocFontEncoding.java"


# direct methods
.method protected constructor <init>()V
    .locals 0

    .line 47
    invoke-direct {p0}, Lcom/itextpdf/io/font/FontEncoding;-><init>()V

    .line 48
    return-void
.end method

.method public static createDocFontEncoding(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/io/font/cmap/CMapToUnicode;)Lcom/itextpdf/io/font/FontEncoding;
    .locals 3
    .param p0, "encoding"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p1, "toUnicode"    # Lcom/itextpdf/io/font/cmap/CMapToUnicode;

    .line 51
    const/16 v0, 0x100

    if-eqz p0, :cond_1

    .line 52
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isName()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 53
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/io/font/FontEncoding;->createFontEncoding(Ljava/lang/String;)Lcom/itextpdf/io/font/FontEncoding;

    move-result-object v0

    return-object v0

    .line 54
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isDictionary()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 55
    new-instance v1, Lcom/itextpdf/kernel/font/DocFontEncoding;

    invoke-direct {v1}, Lcom/itextpdf/kernel/font/DocFontEncoding;-><init>()V

    .line 56
    .local v1, "fontEncoding":Lcom/itextpdf/kernel/font/DocFontEncoding;
    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, v1, Lcom/itextpdf/kernel/font/DocFontEncoding;->differences:[Ljava/lang/String;

    .line 57
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->BaseEncoding:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/itextpdf/kernel/font/DocFontEncoding;->fillBaseEncoding(Lcom/itextpdf/kernel/font/DocFontEncoding;Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 58
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Differences:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    invoke-static {v1, v0, p1}, Lcom/itextpdf/kernel/font/DocFontEncoding;->fillDifferences(Lcom/itextpdf/kernel/font/DocFontEncoding;Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/io/font/cmap/CMapToUnicode;)V

    .line 59
    return-object v1

    .line 62
    .end local v1    # "fontEncoding":Lcom/itextpdf/kernel/font/DocFontEncoding;
    :cond_1
    if-eqz p1, :cond_2

    .line 63
    new-instance v1, Lcom/itextpdf/kernel/font/DocFontEncoding;

    invoke-direct {v1}, Lcom/itextpdf/kernel/font/DocFontEncoding;-><init>()V

    .line 64
    .restart local v1    # "fontEncoding":Lcom/itextpdf/kernel/font/DocFontEncoding;
    invoke-static {v1}, Lcom/itextpdf/io/font/FontEncoding;->fillFontEncoding(Lcom/itextpdf/io/font/FontEncoding;)V

    .line 66
    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, v1, Lcom/itextpdf/kernel/font/DocFontEncoding;->differences:[Ljava/lang/String;

    .line 67
    invoke-static {v1, p1}, Lcom/itextpdf/kernel/font/DocFontEncoding;->fillDifferences(Lcom/itextpdf/kernel/font/DocFontEncoding;Lcom/itextpdf/io/font/cmap/CMapToUnicode;)V

    .line 68
    return-object v1

    .line 70
    .end local v1    # "fontEncoding":Lcom/itextpdf/kernel/font/DocFontEncoding;
    :cond_2
    invoke-static {}, Lcom/itextpdf/io/font/FontEncoding;->createFontSpecificEncoding()Lcom/itextpdf/io/font/FontEncoding;

    move-result-object v0

    return-object v0
.end method

.method private static fillBaseEncoding(Lcom/itextpdf/kernel/font/DocFontEncoding;Lcom/itextpdf/kernel/pdf/PdfName;)V
    .locals 2
    .param p0, "fontEncoding"    # Lcom/itextpdf/kernel/font/DocFontEncoding;
    .param p1, "baseEncodingName"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 75
    if-eqz p1, :cond_0

    .line 76
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/font/DocFontEncoding;->baseEncoding:Ljava/lang/String;

    .line 78
    :cond_0
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->MacRomanEncoding:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->WinAnsiEncoding:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Symbol:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 79
    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->ZapfDingbats:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 93
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/DocFontEncoding;->fillStandardEncoding()V

    goto :goto_2

    .line 80
    :cond_2
    :goto_0
    const-string v0, "Cp1252"

    .line 81
    .local v0, "enc":Ljava/lang/String;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->MacRomanEncoding:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 82
    const-string v0, "MacRoman"

    goto :goto_1

    .line 83
    :cond_3
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Symbol:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 84
    const-string v0, "Symbol"

    goto :goto_1

    .line 85
    :cond_4
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ZapfDingbats:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 86
    const-string v0, "ZapfDingbats"

    .line 88
    :cond_5
    :goto_1
    iput-object v0, p0, Lcom/itextpdf/kernel/font/DocFontEncoding;->baseEncoding:Ljava/lang/String;

    .line 89
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/DocFontEncoding;->fillNamedEncoding()V

    .line 90
    .end local v0    # "enc":Ljava/lang/String;
    nop

    .line 95
    :goto_2
    return-void
.end method

.method private static fillDifferences(Lcom/itextpdf/kernel/font/DocFontEncoding;Lcom/itextpdf/io/font/cmap/CMapToUnicode;)V
    .locals 9
    .param p0, "fontEncoding"    # Lcom/itextpdf/kernel/font/DocFontEncoding;
    .param p1, "toUnicode"    # Lcom/itextpdf/io/font/cmap/CMapToUnicode;

    .line 138
    invoke-virtual {p1}, Lcom/itextpdf/io/font/cmap/CMapToUnicode;->createDirectMapping()Lcom/itextpdf/io/util/IntHashtable;

    move-result-object v0

    .line 139
    .local v0, "byte2uni":Lcom/itextpdf/io/util/IntHashtable;
    invoke-virtual {v0}, Lcom/itextpdf/io/util/IntHashtable;->getKeys()[I

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget v4, v1, v3

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 140
    .local v4, "code":Ljava/lang/Integer;
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v0, v5}, Lcom/itextpdf/io/util/IntHashtable;->get(I)I

    move-result v5

    .line 141
    .local v5, "unicode":I
    invoke-static {v5}, Lcom/itextpdf/io/font/AdobeGlyphList;->unicodeToName(I)Ljava/lang/String;

    move-result-object v6

    .line 142
    .local v6, "glyphName":Ljava/lang/String;
    iget-object v7, p0, Lcom/itextpdf/kernel/font/DocFontEncoding;->codeToUnicode:[I

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v8

    aput v5, v7, v8

    .line 143
    iget-object v7, p0, Lcom/itextpdf/kernel/font/DocFontEncoding;->unicodeToCode:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-virtual {v7, v5, v8}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 144
    iget-object v7, p0, Lcom/itextpdf/kernel/font/DocFontEncoding;->differences:[Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v8

    aput-object v6, v7, v8

    .line 145
    iget-object v7, p0, Lcom/itextpdf/kernel/font/DocFontEncoding;->unicodeDifferences:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v7, v5, v5}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 139
    .end local v4    # "code":Ljava/lang/Integer;
    .end local v5    # "unicode":I
    .end local v6    # "glyphName":Ljava/lang/String;
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 147
    :cond_0
    return-void
.end method

.method private static fillDifferences(Lcom/itextpdf/kernel/font/DocFontEncoding;Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/io/font/cmap/CMapToUnicode;)V
    .locals 7
    .param p0, "fontEncoding"    # Lcom/itextpdf/kernel/font/DocFontEncoding;
    .param p1, "diffs"    # Lcom/itextpdf/kernel/pdf/PdfArray;
    .param p2, "toUnicode"    # Lcom/itextpdf/io/font/cmap/CMapToUnicode;

    .line 98
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lcom/itextpdf/io/font/cmap/CMapToUnicode;->createDirectMapping()Lcom/itextpdf/io/util/IntHashtable;

    move-result-object v0

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/itextpdf/io/util/IntHashtable;

    invoke-direct {v0}, Lcom/itextpdf/io/util/IntHashtable;-><init>()V

    .line 99
    .local v0, "byte2uni":Lcom/itextpdf/io/util/IntHashtable;
    :goto_0
    if-eqz p1, :cond_5

    .line 100
    const/4 v1, 0x0

    .line 101
    .local v1, "currentNumber":I
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_1
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v3

    if-ge v2, v3, :cond_5

    .line 102
    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    .line 103
    .local v3, "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfObject;->isNumber()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 104
    move-object v4, v3

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v1

    goto :goto_3

    .line 105
    :cond_1
    const/16 v4, 0xff

    if-le v1, v4, :cond_2

    .line 106
    const-class v4, Lcom/itextpdf/kernel/font/DocFontEncoding;

    invoke-static {v4}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v4

    .line 107
    .local v4, "LOGGER":Lorg/slf4j/Logger;
    move-object v5, v3

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfName;

    .line 108
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    .line 107
    const-string v6, "Document Font has illegal differences array. Entry {0} references a glyph ID over 255 and will be ignored."

    invoke-static {v6, v5}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 114
    .end local v4    # "LOGGER":Lorg/slf4j/Logger;
    goto :goto_3

    .line 115
    :cond_2
    move-object v4, v3

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v4

    .line 116
    .local v4, "glyphName":Ljava/lang/String;
    invoke-static {v4}, Lcom/itextpdf/io/font/AdobeGlyphList;->nameToUnicode(Ljava/lang/String;)I

    move-result v5

    .line 117
    .local v5, "unicode":I
    const/4 v6, -0x1

    if-eq v5, v6, :cond_3

    .line 118
    iget-object v6, p0, Lcom/itextpdf/kernel/font/DocFontEncoding;->codeToUnicode:[I

    aput v5, v6, v1

    .line 119
    iget-object v6, p0, Lcom/itextpdf/kernel/font/DocFontEncoding;->unicodeToCode:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v6, v5, v1}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 120
    iget-object v6, p0, Lcom/itextpdf/kernel/font/DocFontEncoding;->differences:[Ljava/lang/String;

    aput-object v4, v6, v1

    .line 121
    iget-object v6, p0, Lcom/itextpdf/kernel/font/DocFontEncoding;->unicodeDifferences:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v6, v5, v5}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    goto :goto_2

    .line 123
    :cond_3
    invoke-virtual {v0, v1}, Lcom/itextpdf/io/util/IntHashtable;->containsKey(I)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 124
    invoke-virtual {v0, v1}, Lcom/itextpdf/io/util/IntHashtable;->get(I)I

    move-result v5

    .line 125
    iget-object v6, p0, Lcom/itextpdf/kernel/font/DocFontEncoding;->codeToUnicode:[I

    aput v5, v6, v1

    .line 126
    iget-object v6, p0, Lcom/itextpdf/kernel/font/DocFontEncoding;->unicodeToCode:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v6, v5, v1}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 127
    iget-object v6, p0, Lcom/itextpdf/kernel/font/DocFontEncoding;->differences:[Ljava/lang/String;

    aput-object v4, v6, v1

    .line 128
    iget-object v6, p0, Lcom/itextpdf/kernel/font/DocFontEncoding;->unicodeDifferences:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v6, v5, v5}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 131
    :cond_4
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 101
    .end local v3    # "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v4    # "glyphName":Ljava/lang/String;
    .end local v5    # "unicode":I
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 135
    .end local v1    # "currentNumber":I
    .end local v2    # "k":I
    :cond_5
    return-void
.end method
