.class public Lcom/itextpdf/kernel/font/PdfTrueTypeFont;
.super Lcom/itextpdf/kernel/font/PdfSimpleFont;
.source "PdfTrueTypeFont.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/font/PdfSimpleFont<",
        "Lcom/itextpdf/io/font/TrueTypeFont;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Lcom/itextpdf/io/font/TrueTypeFont;Ljava/lang/String;Z)V
    .locals 3
    .param p1, "ttf"    # Lcom/itextpdf/io/font/TrueTypeFont;
    .param p2, "encoding"    # Ljava/lang/String;
    .param p3, "embedded"    # Z

    .line 51
    invoke-direct {p0}, Lcom/itextpdf/kernel/font/PdfSimpleFont;-><init>()V

    .line 52
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->setFontProgram(Lcom/itextpdf/io/font/FontProgram;)V

    .line 53
    iput-boolean p3, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->embedded:Z

    .line 54
    invoke-virtual {p1}, Lcom/itextpdf/io/font/TrueTypeFont;->getFontNames()Lcom/itextpdf/io/font/FontNames;

    move-result-object v0

    .line 55
    .local v0, "fontNames":Lcom/itextpdf/io/font/FontNames;
    if-eqz p3, :cond_1

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontNames;->allowEmbedding()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 56
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string/jumbo v2, "{0} cannot be embedded due to licensing restrictions."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    .line 57
    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontNames;->getFontName()Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/kernel/exceptions/PdfException;

    move-result-object v1

    throw v1

    .line 59
    :cond_1
    :goto_0
    if-eqz p2, :cond_2

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_3

    :cond_2
    invoke-virtual {p1}, Lcom/itextpdf/io/font/TrueTypeFont;->isFontSpecific()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 60
    const-string p2, "FontSpecific"

    .line 62
    :cond_3
    if-eqz p2, :cond_4

    const-string v1, "FontSpecific"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 63
    invoke-static {}, Lcom/itextpdf/io/font/FontEncoding;->createFontSpecificEncoding()Lcom/itextpdf/io/font/FontEncoding;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    goto :goto_1

    .line 65
    :cond_4
    invoke-static {p2}, Lcom/itextpdf/io/font/FontEncoding;->createFontEncoding(Ljava/lang/String;)Lcom/itextpdf/io/font/FontEncoding;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    .line 67
    :goto_1
    return-void
.end method

.method constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 5
    .param p1, "fontDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 70
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/font/PdfSimpleFont;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 71
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->newFont:Z

    .line 72
    iput-boolean v0, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->subset:Z

    .line 73
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Encoding:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    iget-object v2, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->toUnicode:Lcom/itextpdf/io/font/cmap/CMapToUnicode;

    invoke-static {v1, v2}, Lcom/itextpdf/kernel/font/DocFontEncoding;->createDocFontEncoding(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/io/font/cmap/CMapToUnicode;)Lcom/itextpdf/io/font/FontEncoding;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    .line 75
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BaseFont:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    .line 82
    .local v1, "baseFontName":Lcom/itextpdf/kernel/pdf/PdfName;
    const/4 v2, 0x1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/itextpdf/io/font/constants/StandardFonts;->isStandardFont(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->FontDescriptor:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 83
    invoke-virtual {p1, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v3

    if-nez v3, :cond_0

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Widths:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 85
    :try_start_0
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v2}, Lcom/itextpdf/io/font/FontProgramFactory;->createFont(Ljava/lang/String;Z)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v3

    iput-object v3, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->fontProgram:Lcom/itextpdf/io/font/FontProgram;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 88
    goto :goto_0

    .line 86
    :catch_0
    move-exception v0

    .line 87
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v3, "I/O exception while creating Font"

    invoke-direct {v2, v3, v0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 90
    .end local v0    # "e":Ljava/io/IOException;
    :cond_0
    iget-object v3, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    iget-object v4, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->toUnicode:Lcom/itextpdf/io/font/cmap/CMapToUnicode;

    invoke-static {p1, v3, v4}, Lcom/itextpdf/kernel/font/DocTrueTypeFont;->createFontProgram(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/io/font/FontEncoding;Lcom/itextpdf/io/font/cmap/CMapToUnicode;)Lcom/itextpdf/io/font/TrueTypeFont;

    move-result-object v3

    iput-object v3, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    .line 93
    :goto_0
    iget-object v3, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    instance-of v3, v3, Lcom/itextpdf/kernel/font/IDocFontProgram;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    check-cast v3, Lcom/itextpdf/kernel/font/IDocFontProgram;

    invoke-interface {v3}, Lcom/itextpdf/kernel/font/IDocFontProgram;->getFontFile()Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v3

    if-eqz v3, :cond_1

    move v0, v2

    :cond_1
    iput-boolean v0, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->embedded:Z

    .line 94
    return-void
.end method


# virtual methods
.method protected addFontStream(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 7
    .param p1, "fontDescriptor"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 152
    iget-boolean v0, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->embedded:Z

    if-eqz v0, :cond_7

    .line 155
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    instance-of v0, v0, Lcom/itextpdf/kernel/font/IDocFontProgram;

    if-eqz v0, :cond_0

    .line 156
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    check-cast v0, Lcom/itextpdf/kernel/font/IDocFontProgram;

    invoke-interface {v0}, Lcom/itextpdf/kernel/font/IDocFontProgram;->getFontFileName()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    .line 157
    .local v0, "fontFileName":Lcom/itextpdf/kernel/pdf/PdfName;
    iget-object v1, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    check-cast v1, Lcom/itextpdf/kernel/font/IDocFontProgram;

    invoke-interface {v1}, Lcom/itextpdf/kernel/font/IDocFontProgram;->getFontFile()Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v1

    .local v1, "fontStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    goto/16 :goto_4

    .line 158
    .end local v0    # "fontFileName":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local v1    # "fontStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/font/TrueTypeFont;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/TrueTypeFont;->isCff()Z

    move-result v0

    const-class v1, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;

    if-eqz v0, :cond_1

    .line 159
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->FontFile3:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 161
    .restart local v0    # "fontFileName":Lcom/itextpdf/kernel/pdf/PdfName;
    :try_start_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/io/font/TrueTypeFont;

    invoke-virtual {v2}, Lcom/itextpdf/io/font/TrueTypeFont;->getFontStreamBytes()[B

    move-result-object v2

    .line 162
    .local v2, "fontStreamBytes":[B
    array-length v3, v2

    filled-new-array {v3}, [I

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->getPdfFontStream([B[I)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v3

    .line 163
    .local v3, "fontStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v6, "Type1C"

    invoke-direct {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;
    :try_end_0
    .catch Lcom/itextpdf/kernel/exceptions/PdfException; {:try_start_0 .. :try_end_0} :catch_0

    .line 168
    move-object v1, v3

    .end local v2    # "fontStreamBytes":[B
    goto/16 :goto_4

    .line 164
    .end local v3    # "fontStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    :catch_0
    move-exception v2

    .line 165
    .local v2, "e":Lcom/itextpdf/kernel/exceptions/PdfException;
    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 166
    .local v1, "logger":Lorg/slf4j/Logger;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/exceptions/PdfException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 167
    const/4 v1, 0x0

    .line 168
    .end local v2    # "e":Lcom/itextpdf/kernel/exceptions/PdfException;
    .local v1, "fontStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    goto/16 :goto_4

    .line 170
    .end local v0    # "fontFileName":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local v1    # "fontStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    :cond_1
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->FontFile2:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 171
    .restart local v0    # "fontFileName":Lcom/itextpdf/kernel/pdf/PdfName;
    new-instance v2, Ljava/util/TreeSet;

    invoke-direct {v2}, Ljava/util/TreeSet;-><init>()V

    .line 172
    .local v2, "glyphs":Ljava/util/SortedSet;, "Ljava/util/SortedSet<Ljava/lang/Integer;>;"
    const/4 v3, 0x0

    .local v3, "k":I
    :goto_0
    iget-object v4, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->usedGlyphs:[B

    array-length v4, v4

    if-ge v3, v4, :cond_4

    .line 173
    iget-object v4, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->usedGlyphs:[B

    aget-byte v4, v4, v3

    if-eqz v4, :cond_3

    .line 174
    iget-object v4, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v4, v3}, Lcom/itextpdf/io/font/FontEncoding;->getUnicode(I)I

    move-result v4

    .line 175
    .local v4, "uni":I
    const/4 v5, -0x1

    if-le v4, v5, :cond_2

    iget-object v5, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v5, v4}, Lcom/itextpdf/io/font/FontProgram;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v5

    goto :goto_1

    :cond_2
    iget-object v5, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v5, v3}, Lcom/itextpdf/io/font/FontProgram;->getGlyphByCode(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v5

    .line 176
    .local v5, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    :goto_1
    if-eqz v5, :cond_3

    .line 177
    invoke-virtual {v5}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v2, v6}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    .line 172
    .end local v4    # "uni":I
    .end local v5    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 181
    .end local v3    # "k":I
    :cond_4
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/io/font/TrueTypeFont;

    iget-boolean v4, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->subset:Z

    iget-object v5, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->subsetRanges:Ljava/util/List;

    invoke-virtual {v3, v2, v4, v5}, Lcom/itextpdf/io/font/TrueTypeFont;->updateUsedGlyphs(Ljava/util/SortedSet;ZLjava/util/List;)V

    .line 185
    :try_start_1
    iget-boolean v3, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->subset:Z

    if-nez v3, :cond_6

    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/io/font/TrueTypeFont;

    invoke-virtual {v3}, Lcom/itextpdf/io/font/TrueTypeFont;->getDirectoryOffset()I

    move-result v3

    if-lez v3, :cond_5

    goto :goto_2

    .line 188
    :cond_5
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/io/font/TrueTypeFont;

    invoke-virtual {v3}, Lcom/itextpdf/io/font/TrueTypeFont;->getFontStreamBytes()[B

    move-result-object v3

    .local v3, "fontStreamBytes":[B
    goto :goto_3

    .line 186
    .end local v3    # "fontStreamBytes":[B
    :cond_6
    :goto_2
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/io/font/TrueTypeFont;

    iget-boolean v4, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->subset:Z

    invoke-virtual {v3, v2, v4}, Lcom/itextpdf/io/font/TrueTypeFont;->getSubset(Ljava/util/Set;Z)[B

    move-result-object v3

    .line 190
    .restart local v3    # "fontStreamBytes":[B
    :goto_3
    array-length v4, v3

    filled-new-array {v4}, [I

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->getPdfFontStream([B[I)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v1
    :try_end_1
    .catch Lcom/itextpdf/kernel/exceptions/PdfException; {:try_start_1 .. :try_end_1} :catch_1

    .line 195
    .end local v3    # "fontStreamBytes":[B
    .restart local v1    # "fontStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    goto :goto_4

    .line 191
    .end local v1    # "fontStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    :catch_1
    move-exception v3

    .line 192
    .local v3, "e":Lcom/itextpdf/kernel/exceptions/PdfException;
    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 193
    .local v1, "logger":Lorg/slf4j/Logger;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/exceptions/PdfException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 194
    const/4 v4, 0x0

    move-object v1, v4

    .line 197
    .end local v2    # "glyphs":Ljava/util/SortedSet;, "Ljava/util/SortedSet<Ljava/lang/Integer;>;"
    .end local v3    # "e":Lcom/itextpdf/kernel/exceptions/PdfException;
    .local v1, "fontStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    :goto_4
    if-eqz v1, :cond_7

    .line 198
    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 199
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    if-eqz v2, :cond_7

    .line 200
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->flush()V

    .line 204
    .end local v0    # "fontFileName":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local v1    # "fontStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    :cond_7
    return-void
.end method

.method public containsGlyph(I)Z
    .locals 4
    .param p1, "unicode"    # I

    .line 114
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontEncoding;->isFontSpecific()Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 115
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/FontProgram;->getGlyphByCode(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    return v1

    .line 117
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/FontEncoding;->canEncode(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 118
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    iget-object v3, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v3, p1}, Lcom/itextpdf/io/font/FontEncoding;->getUnicodeDifference(I)I

    move-result v3

    invoke-virtual {v0, v3}, Lcom/itextpdf/io/font/FontProgram;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    if-eqz v0, :cond_2

    goto :goto_1

    :cond_2
    move v1, v2

    .line 117
    :goto_1
    return v1
.end method

.method public flush()V
    .locals 4

    .line 124
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->isFlushed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 125
    return-void

    .line 127
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->ensureUnderlyingObjectHasIndirectReference()V

    .line 128
    iget-boolean v0, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->newFont:Z

    if-eqz v0, :cond_2

    .line 131
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/font/TrueTypeFont;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/TrueTypeFont;->isCff()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 132
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Type1:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 133
    .local v0, "subtype":Lcom/itextpdf/kernel/pdf/PdfName;
    iget-object v1, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontProgram;->getFontNames()Lcom/itextpdf/io/font/FontNames;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontNames;->getFontName()Ljava/lang/String;

    move-result-object v1

    .local v1, "fontName":Ljava/lang/String;
    goto :goto_0

    .line 135
    .end local v0    # "subtype":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local v1    # "fontName":Ljava/lang/String;
    :cond_1
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->TrueType:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 136
    .restart local v0    # "subtype":Lcom/itextpdf/kernel/pdf/PdfName;
    iget-object v1, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontProgram;->getFontNames()Lcom/itextpdf/io/font/FontNames;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontNames;->getFontName()Ljava/lang/String;

    move-result-object v1

    iget-boolean v2, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->subset:Z

    iget-boolean v3, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->embedded:Z

    invoke-static {v1, v2, v3}, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->updateSubsetPrefix(Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v1

    .line 138
    .restart local v1    # "fontName":Ljava/lang/String;
    :goto_0
    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->flushFontData(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 140
    .end local v0    # "subtype":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local v1    # "fontName":Ljava/lang/String;
    :cond_2
    invoke-super {p0}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->flush()V

    .line 141
    return-void
.end method

.method public getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;
    .locals 4
    .param p1, "unicode"    # I

    .line 98
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/FontEncoding;->canEncode(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 99
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->fontEncoding:Lcom/itextpdf/io/font/FontEncoding;

    invoke-virtual {v1, p1}, Lcom/itextpdf/io/font/FontEncoding;->getUnicodeDifference(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/font/FontProgram;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    .line 100
    .local v0, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    if-nez v0, :cond_0

    iget-object v1, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->notdefGlyphs:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/io/font/otf/Glyph;

    move-object v0, v1

    if-nez v1, :cond_0

    .line 101
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/font/FontProgram;->getGlyphByCode(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v1

    .line 102
    .local v1, "notdef":Lcom/itextpdf/io/font/otf/Glyph;
    if-eqz v1, :cond_0

    .line 103
    new-instance v2, Lcom/itextpdf/io/font/otf/Glyph;

    invoke-direct {v2, v1, p1}, Lcom/itextpdf/io/font/otf/Glyph;-><init>(Lcom/itextpdf/io/font/otf/Glyph;I)V

    move-object v0, v2

    .line 104
    iget-object v2, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->notdefGlyphs:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    .end local v1    # "notdef":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_0
    return-object v0

    .line 109
    .end local v0    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method protected isBuiltInFont()Z
    .locals 1

    .line 211
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    instance-of v0, v0, Lcom/itextpdf/io/font/Type1Font;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    check-cast v0, Lcom/itextpdf/io/font/Type1Font;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/Type1Font;->isBuiltInFont()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isBuiltWith(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "fontProgram"    # Ljava/lang/String;
    .param p2, "encoding"    # Ljava/lang/String;

    .line 147
    if-eqz p2, :cond_0

    const-string v0, ""

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0, p1, p2}, Lcom/itextpdf/kernel/font/PdfSimpleFont;->isBuiltWith(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
