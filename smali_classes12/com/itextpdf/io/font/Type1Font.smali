.class public Lcom/itextpdf/io/font/Type1Font;
.super Lcom/itextpdf/io/font/FontProgram;
.source "Type1Font.java"


# static fields
.field private static final PFB_TYPES:[I


# instance fields
.field private characterSet:Ljava/lang/String;

.field private fontParser:Lcom/itextpdf/io/font/Type1Parser;

.field private fontStreamBytes:[B

.field private fontStreamLengths:[I

.field private kernPairs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 55
    const/4 v0, 0x1

    const/4 v1, 0x2

    filled-new-array {v0, v1, v0}, [I

    move-result-object v0

    sput-object v0, Lcom/itextpdf/io/font/Type1Font;->PFB_TYPES:[I

    return-void
.end method

.method protected constructor <init>()V
    .locals 1

    .line 68
    invoke-direct {p0}, Lcom/itextpdf/io/font/FontProgram;-><init>()V

    .line 50
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/Type1Font;->kernPairs:Ljava/util/Map;

    .line 69
    new-instance v0, Lcom/itextpdf/io/font/FontNames;

    invoke-direct {v0}, Lcom/itextpdf/io/font/FontNames;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/Type1Font;->fontNames:Lcom/itextpdf/io/font/FontNames;

    .line 70
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "baseFont"    # Ljava/lang/String;

    .line 80
    invoke-direct {p0}, Lcom/itextpdf/io/font/Type1Font;-><init>()V

    .line 81
    invoke-virtual {p0}, Lcom/itextpdf/io/font/Type1Font;->getFontNames()Lcom/itextpdf/io/font/FontNames;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/FontNames;->setFontName(Ljava/lang/String;)V

    .line 82
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;[B[B)V
    .locals 1
    .param p1, "metricsPath"    # Ljava/lang/String;
    .param p2, "binaryPath"    # Ljava/lang/String;
    .param p3, "afm"    # [B
    .param p4, "pfb"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 73
    invoke-direct {p0}, Lcom/itextpdf/io/font/Type1Font;-><init>()V

    .line 75
    new-instance v0, Lcom/itextpdf/io/font/Type1Parser;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/itextpdf/io/font/Type1Parser;-><init>(Ljava/lang/String;Ljava/lang/String;[B[B)V

    iput-object v0, p0, Lcom/itextpdf/io/font/Type1Font;->fontParser:Lcom/itextpdf/io/font/Type1Parser;

    .line 76
    invoke-virtual {p0}, Lcom/itextpdf/io/font/Type1Font;->process()V

    .line 77
    return-void
.end method

.method protected static createStandardFont(Ljava/lang/String;)Lcom/itextpdf/io/font/Type1Font;
    .locals 2
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 61
    invoke-static {p0}, Lcom/itextpdf/io/font/constants/StandardFonts;->isStandardFont(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 62
    new-instance v0, Lcom/itextpdf/io/font/Type1Font;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1, v1, v1}, Lcom/itextpdf/io/font/Type1Font;-><init>(Ljava/lang/String;Ljava/lang/String;[B[B)V

    return-object v0

    .line 64
    :cond_0
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    const-string/jumbo v1, "{0} is not a standard type1 font."

    invoke-direct {v0, v1}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v0

    throw v0
.end method


# virtual methods
.method public getCharacterSet()Ljava/lang/String;
    .locals 1

    .line 128
    iget-object v0, p0, Lcom/itextpdf/io/font/Type1Font;->characterSet:Ljava/lang/String;

    return-object v0
.end method

.method public getFontStreamBytes()[B
    .locals 10

    .line 183
    const-class v0, Lcom/itextpdf/io/font/Type1Font;

    iget-object v1, p0, Lcom/itextpdf/io/font/Type1Font;->fontParser:Lcom/itextpdf/io/font/Type1Parser;

    invoke-virtual {v1}, Lcom/itextpdf/io/font/Type1Parser;->isBuiltInFont()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 184
    return-object v2

    .line 185
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/io/font/Type1Font;->fontStreamBytes:[B

    if-eqz v1, :cond_1

    .line 186
    iget-object v0, p0, Lcom/itextpdf/io/font/Type1Font;->fontStreamBytes:[B

    return-object v0

    .line 187
    :cond_1
    const/4 v1, 0x0

    .line 189
    .local v1, "raf":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    :try_start_0
    iget-object v3, p0, Lcom/itextpdf/io/font/Type1Font;->fontParser:Lcom/itextpdf/io/font/Type1Parser;

    invoke-virtual {v3}, Lcom/itextpdf/io/font/Type1Parser;->getPostscriptBinary()Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    move-result-object v3

    move-object v1, v3

    .line 190
    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->length()J

    move-result-wide v3

    long-to-int v3, v3

    .line 191
    .local v3, "fileLength":I
    add-int/lit8 v4, v3, -0x12

    new-array v4, v4, [B

    iput-object v4, p0, Lcom/itextpdf/io/font/Type1Font;->fontStreamBytes:[B

    .line 192
    const/4 v4, 0x3

    new-array v5, v4, [I

    iput-object v5, p0, Lcom/itextpdf/io/font/Type1Font;->fontStreamLengths:[I

    .line 193
    const/4 v5, 0x0

    .line 194
    .local v5, "bytePtr":I
    const/4 v6, 0x0

    .local v6, "k":I
    :goto_0
    if-ge v6, v4, :cond_9

    .line 195
    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v7

    const/16 v8, 0x80

    if-eq v7, v8, :cond_3

    .line 196
    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v4

    .line 197
    .local v4, "logger":Lorg/slf4j/Logger;
    const-string v7, "Start marker is missing in the pfb file"

    invoke-interface {v4, v7}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 198
    nop

    .line 227
    if-eqz v1, :cond_2

    .line 229
    :try_start_1
    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 231
    goto :goto_1

    .line 230
    :catch_0
    move-exception v0

    .line 198
    :cond_2
    :goto_1
    return-object v2

    .line 200
    .end local v4    # "logger":Lorg/slf4j/Logger;
    :cond_3
    :try_start_2
    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v7

    sget-object v8, Lcom/itextpdf/io/font/Type1Font;->PFB_TYPES:[I

    aget v8, v8, v6

    if-eq v7, v8, :cond_5

    .line 201
    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v4

    .line 202
    .restart local v4    # "logger":Lorg/slf4j/Logger;
    const-string v7, "incorrect.segment.type.in.pfb.file"

    invoke-interface {v4, v7}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 203
    nop

    .line 227
    if-eqz v1, :cond_4

    .line 229
    :try_start_3
    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 231
    goto :goto_2

    .line 230
    :catch_1
    move-exception v0

    .line 203
    :cond_4
    :goto_2
    return-object v2

    .line 205
    .end local v4    # "logger":Lorg/slf4j/Logger;
    :cond_5
    :try_start_4
    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v7

    .line 206
    .local v7, "size":I
    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v8

    shl-int/lit8 v8, v8, 0x8

    add-int/2addr v7, v8

    .line 207
    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v8

    shl-int/lit8 v8, v8, 0x10

    add-int/2addr v7, v8

    .line 208
    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read()I

    move-result v8

    shl-int/lit8 v8, v8, 0x18

    add-int/2addr v7, v8

    .line 209
    iget-object v8, p0, Lcom/itextpdf/io/font/Type1Font;->fontStreamLengths:[I

    aput v7, v8, v6

    .line 210
    :goto_3
    if-eqz v7, :cond_8

    .line 211
    iget-object v8, p0, Lcom/itextpdf/io/font/Type1Font;->fontStreamBytes:[B

    invoke-virtual {v1, v8, v5, v7}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->read([BII)I

    move-result v8

    .line 212
    .local v8, "got":I
    if-gez v8, :cond_7

    .line 213
    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v4

    .line 214
    .restart local v4    # "logger":Lorg/slf4j/Logger;
    const-string/jumbo v9, "premature.end.in.pfb.file"

    invoke-interface {v4, v9}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 215
    nop

    .line 227
    if-eqz v1, :cond_6

    .line 229
    :try_start_5
    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    .line 231
    goto :goto_4

    .line 230
    :catch_2
    move-exception v0

    .line 215
    :cond_6
    :goto_4
    return-object v2

    .line 217
    .end local v4    # "logger":Lorg/slf4j/Logger;
    :cond_7
    add-int/2addr v5, v8

    .line 218
    sub-int/2addr v7, v8

    .line 219
    .end local v8    # "got":I
    goto :goto_3

    .line 194
    .end local v7    # "size":I
    :cond_8
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 221
    .end local v6    # "k":I
    :cond_9
    :try_start_6
    iget-object v0, p0, Lcom/itextpdf/io/font/Type1Font;->fontStreamBytes:[B
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 227
    if-eqz v1, :cond_a

    .line 229
    :try_start_7
    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3

    .line 231
    goto :goto_5

    .line 230
    :catch_3
    move-exception v2

    .line 221
    :cond_a
    :goto_5
    return-object v0

    .line 227
    .end local v3    # "fileLength":I
    .end local v5    # "bytePtr":I
    :catchall_0
    move-exception v0

    goto :goto_7

    .line 222
    :catch_4
    move-exception v3

    .line 223
    .local v3, "e":Ljava/lang/Exception;
    :try_start_8
    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 224
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string/jumbo v4, "type1.font.file.exception"

    invoke-interface {v0, v4}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 225
    nop

    .line 227
    if-eqz v1, :cond_b

    .line 229
    :try_start_9
    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->close()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_5

    .line 231
    goto :goto_6

    .line 230
    :catch_5
    move-exception v4

    .line 225
    :cond_b
    :goto_6
    return-object v2

    .line 227
    .end local v0    # "logger":Lorg/slf4j/Logger;
    .end local v3    # "e":Ljava/lang/Exception;
    :goto_7
    if-eqz v1, :cond_c

    .line 229
    :try_start_a
    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->close()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_6

    .line 231
    goto :goto_8

    .line 230
    :catch_6
    move-exception v2

    .line 233
    :cond_c
    :goto_8
    throw v0
.end method

.method public getFontStreamLengths()[I
    .locals 1

    .line 237
    iget-object v0, p0, Lcom/itextpdf/io/font/Type1Font;->fontStreamLengths:[I

    return-object v0
.end method

.method public getGlyph(Ljava/lang/String;)Lcom/itextpdf/io/font/otf/Glyph;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .line 174
    invoke-static {p1}, Lcom/itextpdf/io/font/AdobeGlyphList;->nameToUnicode(Ljava/lang/String;)I

    move-result v0

    .line 175
    .local v0, "unicode":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 176
    invoke-virtual {p0, v0}, Lcom/itextpdf/io/font/Type1Font;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v1

    return-object v1

    .line 178
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public getKerning(Lcom/itextpdf/io/font/otf/Glyph;Lcom/itextpdf/io/font/otf/Glyph;)I
    .locals 6
    .param p1, "first"    # Lcom/itextpdf/io/font/otf/Glyph;
    .param p2, "second"    # Lcom/itextpdf/io/font/otf/Glyph;

    .line 143
    invoke-virtual {p1}, Lcom/itextpdf/io/font/otf/Glyph;->hasValidUnicode()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {p2}, Lcom/itextpdf/io/font/otf/Glyph;->hasValidUnicode()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 144
    invoke-virtual {p1}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v0

    int-to-long v2, v0

    const/16 v0, 0x20

    shl-long/2addr v2, v0

    invoke-virtual {p2}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v0

    int-to-long v4, v0

    add-long/2addr v2, v4

    .line 145
    .local v2, "record":J
    iget-object v0, p0, Lcom/itextpdf/io/font/Type1Font;->kernPairs:Ljava/util/Map;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 146
    iget-object v0, p0, Lcom/itextpdf/io/font/Type1Font;->kernPairs:Ljava/util/Map;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0

    .line 148
    :cond_0
    return v1

    .line 151
    .end local v2    # "record":J
    :cond_1
    return v1
.end method

.method public getPdfFontFlags()I
    .locals 3

    .line 110
    const/4 v0, 0x0

    .line 111
    .local v0, "flags":I
    iget-object v1, p0, Lcom/itextpdf/io/font/Type1Font;->fontMetrics:Lcom/itextpdf/io/font/FontMetrics;

    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontMetrics;->isFixedPitch()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 112
    or-int/lit8 v0, v0, 0x1

    .line 114
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/io/font/Type1Font;->isFontSpecific()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x4

    goto :goto_0

    :cond_1
    const/16 v1, 0x20

    :goto_0
    or-int/2addr v0, v1

    .line 115
    iget-object v1, p0, Lcom/itextpdf/io/font/Type1Font;->fontMetrics:Lcom/itextpdf/io/font/FontMetrics;

    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontMetrics;->getItalicAngle()F

    move-result v1

    const/4 v2, 0x0

    cmpg-float v1, v1, v2

    if-gez v1, :cond_2

    .line 116
    or-int/lit8 v0, v0, 0x40

    .line 118
    :cond_2
    iget-object v1, p0, Lcom/itextpdf/io/font/Type1Font;->fontNames:Lcom/itextpdf/io/font/FontNames;

    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontNames;->getFontName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Caps"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/itextpdf/io/font/Type1Font;->fontNames:Lcom/itextpdf/io/font/FontNames;

    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontNames;->getFontName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "SC"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 119
    :cond_3
    const/high16 v1, 0x20000

    or-int/2addr v0, v1

    .line 121
    :cond_4
    iget-object v1, p0, Lcom/itextpdf/io/font/Type1Font;->fontNames:Lcom/itextpdf/io/font/FontNames;

    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontNames;->isBold()Z

    move-result v1

    if-nez v1, :cond_5

    iget-object v1, p0, Lcom/itextpdf/io/font/Type1Font;->fontNames:Lcom/itextpdf/io/font/FontNames;

    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontNames;->getFontWeight()I

    move-result v1

    const/16 v2, 0x1f4

    if-le v1, v2, :cond_6

    .line 122
    :cond_5
    const/high16 v1, 0x40000

    or-int/2addr v0, v1

    .line 124
    :cond_6
    return v0
.end method

.method public hasKernPairs()Z
    .locals 1

    .line 138
    iget-object v0, p0, Lcom/itextpdf/io/font/Type1Font;->kernPairs:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public initializeGlyphs(Lcom/itextpdf/io/font/FontEncoding;)V
    .locals 7
    .param p1, "fontEncoding"    # Lcom/itextpdf/io/font/FontEncoding;

    .line 90
    const/4 v0, 0x0

    move v2, v0

    .local v2, "i":I
    :goto_0
    const/16 v0, 0x100

    if-ge v2, v0, :cond_1

    .line 91
    invoke-virtual {p1, v2}, Lcom/itextpdf/io/font/FontEncoding;->getUnicode(I)I

    move-result v4

    .line 93
    .local v4, "unicode":I
    iget-object v0, p0, Lcom/itextpdf/io/font/Type1Font;->unicodeToGlyph:Ljava/util/Map;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/font/otf/Glyph;

    .line 94
    .local v0, "fontGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    if-nez v0, :cond_0

    .line 95
    goto :goto_1

    .line 98
    :cond_0
    new-instance v1, Lcom/itextpdf/io/font/otf/Glyph;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/Glyph;->getWidth()I

    move-result v3

    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/Glyph;->getChars()[C

    move-result-object v5

    const/4 v6, 0x0

    invoke-direct/range {v1 .. v6}, Lcom/itextpdf/io/font/otf/Glyph;-><init>(III[CZ)V

    .line 99
    .local v1, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    iget-object v3, p0, Lcom/itextpdf/io/font/Type1Font;->codeToGlyph:Ljava/util/Map;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v3, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    iget-object v3, p0, Lcom/itextpdf/io/font/Type1Font;->unicodeToGlyph:Ljava/util/Map;

    invoke-virtual {v1}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v3, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    .end local v0    # "fontGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    .end local v1    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    .end local v4    # "unicode":I
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 102
    .end local v2    # "i":I
    :cond_1
    return-void
.end method

.method public isBuiltInFont()Z
    .locals 1

    .line 105
    iget-object v0, p0, Lcom/itextpdf/io/font/Type1Font;->fontParser:Lcom/itextpdf/io/font/Type1Parser;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/io/font/Type1Font;->fontParser:Lcom/itextpdf/io/font/Type1Parser;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/Type1Parser;->isBuiltInFont()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isBuiltWith(Ljava/lang/String;)Z
    .locals 1
    .param p1, "fontProgram"    # Ljava/lang/String;

    .line 241
    iget-object v0, p0, Lcom/itextpdf/io/font/Type1Font;->fontParser:Lcom/itextpdf/io/font/Type1Parser;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/Type1Parser;->getAfmPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected process()V
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 245
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/itextpdf/io/font/Type1Font;->fontParser:Lcom/itextpdf/io/font/Type1Parser;

    invoke-virtual {v1}, Lcom/itextpdf/io/font/Type1Parser;->getMetricsFile()Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    move-result-object v1

    .line 247
    .local v1, "raf":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    const/4 v2, 0x0

    .line 248
    .local v2, "startKernPairs":Z
    :goto_0
    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-nez v2, :cond_2

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readLine()Ljava/lang/String;

    move-result-object v8

    move-object v9, v8

    .local v9, "line":Ljava/lang/String;
    if-eqz v8, :cond_2

    .line 249
    new-instance v8, Ljava/util/StringTokenizer;

    const-string v10, " ,\n\r\t\u000c"

    invoke-direct {v8, v9, v10}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 250
    .local v8, "tok":Ljava/util/StringTokenizer;
    invoke-virtual {v8}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v10

    if-nez v10, :cond_0

    .line 251
    goto :goto_0

    .line 252
    :cond_0
    invoke-virtual {v8}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v10

    .line 253
    .local v10, "ident":Ljava/lang/String;
    invoke-virtual {v10}, Ljava/lang/String;->hashCode()I

    move-result v11

    const/4 v12, 0x4

    sparse-switch v11, :sswitch_data_0

    :cond_1
    goto/16 :goto_1

    :sswitch_0
    const-string v11, "UnderlineThickness"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    const/16 v5, 0x9

    goto/16 :goto_2

    :sswitch_1
    const-string v11, "StartCharMetrics"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    const/16 v5, 0x11

    goto/16 :goto_2

    :sswitch_2
    const-string v11, "FullName"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    move v5, v7

    goto/16 :goto_2

    :sswitch_3
    const-string v11, "FontName"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    move v5, v6

    goto/16 :goto_2

    :sswitch_4
    const-string v11, "FontBBox"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    const/4 v5, 0x7

    goto/16 :goto_2

    :sswitch_5
    const-string v11, "UnderlinePosition"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    const/16 v5, 0x8

    goto/16 :goto_2

    :sswitch_6
    const-string v11, "StdVW"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    const/16 v5, 0x10

    goto/16 :goto_2

    :sswitch_7
    const-string v11, "StdHW"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    const/16 v5, 0xf

    goto/16 :goto_2

    :sswitch_8
    const-string v11, "IsFixedPitch"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    const/4 v5, 0x5

    goto/16 :goto_2

    :sswitch_9
    const-string v11, "Ascender"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    const/16 v5, 0xd

    goto :goto_2

    :sswitch_a
    const-string v11, "Descender"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    const/16 v5, 0xe

    goto :goto_2

    :sswitch_b
    const-string v11, "CapHeight"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    const/16 v5, 0xb

    goto :goto_2

    :sswitch_c
    const-string v11, "CharacterSet"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    const/4 v5, 0x6

    goto :goto_2

    :sswitch_d
    const-string v11, "XHeight"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    const/16 v5, 0xc

    goto :goto_2

    :sswitch_e
    const-string v11, "FamilyName"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    move v5, v4

    goto :goto_2

    :sswitch_f
    const-string v11, "EncodingScheme"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    const/16 v5, 0xa

    goto :goto_2

    :sswitch_10
    const-string v11, "Weight"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    move v5, v3

    goto :goto_2

    :sswitch_11
    const-string v11, "ItalicAngle"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    move v5, v12

    goto :goto_2

    :goto_1
    const/4 v5, -0x1

    :goto_2
    const-string v11, ""

    const-string/jumbo v13, "\u00ff"

    packed-switch v5, :pswitch_data_0

    goto/16 :goto_3

    .line 312
    :pswitch_0
    const/4 v2, 0x1

    goto/16 :goto_3

    .line 309
    :pswitch_1
    iget-object v3, v0, Lcom/itextpdf/io/font/Type1Font;->fontMetrics:Lcom/itextpdf/io/font/FontMetrics;

    invoke-virtual {v8}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    float-to-int v4, v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/font/FontMetrics;->setStemV(I)V

    .line 310
    goto/16 :goto_3

    .line 306
    :pswitch_2
    iget-object v3, v0, Lcom/itextpdf/io/font/Type1Font;->fontMetrics:Lcom/itextpdf/io/font/FontMetrics;

    invoke-virtual {v8}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    float-to-int v4, v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/font/FontMetrics;->setStemH(I)V

    .line 307
    goto/16 :goto_3

    .line 303
    :pswitch_3
    iget-object v3, v0, Lcom/itextpdf/io/font/Type1Font;->fontMetrics:Lcom/itextpdf/io/font/FontMetrics;

    invoke-virtual {v8}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    float-to-int v4, v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/font/FontMetrics;->setTypoDescender(I)V

    .line 304
    goto/16 :goto_3

    .line 300
    :pswitch_4
    iget-object v3, v0, Lcom/itextpdf/io/font/Type1Font;->fontMetrics:Lcom/itextpdf/io/font/FontMetrics;

    invoke-virtual {v8}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    float-to-int v4, v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/font/FontMetrics;->setTypoAscender(I)V

    .line 301
    goto/16 :goto_3

    .line 297
    :pswitch_5
    iget-object v3, v0, Lcom/itextpdf/io/font/Type1Font;->fontMetrics:Lcom/itextpdf/io/font/FontMetrics;

    invoke-virtual {v8}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    float-to-int v4, v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/font/FontMetrics;->setXHeight(I)V

    .line 298
    goto/16 :goto_3

    .line 294
    :pswitch_6
    iget-object v3, v0, Lcom/itextpdf/io/font/Type1Font;->fontMetrics:Lcom/itextpdf/io/font/FontMetrics;

    invoke-virtual {v8}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    float-to-int v4, v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/font/FontMetrics;->setCapHeight(I)V

    .line 295
    goto/16 :goto_3

    .line 291
    :pswitch_7
    invoke-virtual {v8, v13}, Ljava/util/StringTokenizer;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lcom/itextpdf/io/font/Type1Font;->encodingScheme:Ljava/lang/String;

    .line 292
    goto/16 :goto_3

    .line 288
    :pswitch_8
    iget-object v3, v0, Lcom/itextpdf/io/font/Type1Font;->fontMetrics:Lcom/itextpdf/io/font/FontMetrics;

    invoke-virtual {v8}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    float-to-int v4, v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/font/FontMetrics;->setUnderlineThickness(I)V

    .line 289
    goto/16 :goto_3

    .line 285
    :pswitch_9
    iget-object v3, v0, Lcom/itextpdf/io/font/Type1Font;->fontMetrics:Lcom/itextpdf/io/font/FontMetrics;

    invoke-virtual {v8}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    float-to-int v4, v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/font/FontMetrics;->setUnderlinePosition(I)V

    .line 286
    goto/16 :goto_3

    .line 278
    :pswitch_a
    invoke-virtual {v8}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v3

    float-to-int v3, v3

    .line 279
    .local v3, "llx":I
    invoke-virtual {v8}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    float-to-int v4, v4

    .line 280
    .local v4, "lly":I
    invoke-virtual {v8}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v5

    float-to-int v5, v5

    .line 281
    .local v5, "urx":I
    invoke-virtual {v8}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v6

    float-to-int v6, v6

    .line 282
    .local v6, "ury":I
    iget-object v7, v0, Lcom/itextpdf/io/font/Type1Font;->fontMetrics:Lcom/itextpdf/io/font/FontMetrics;

    invoke-virtual {v7, v3, v4, v5, v6}, Lcom/itextpdf/io/font/FontMetrics;->setBbox(IIII)V

    .line 283
    goto/16 :goto_3

    .line 275
    .end local v3    # "llx":I
    .end local v4    # "lly":I
    .end local v5    # "urx":I
    .end local v6    # "ury":I
    :pswitch_b
    invoke-virtual {v8, v13}, Ljava/util/StringTokenizer;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v0, Lcom/itextpdf/io/font/Type1Font;->characterSet:Ljava/lang/String;

    .line 276
    goto/16 :goto_3

    .line 272
    :pswitch_c
    iget-object v3, v0, Lcom/itextpdf/io/font/Type1Font;->fontMetrics:Lcom/itextpdf/io/font/FontMetrics;

    invoke-virtual {v8}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "true"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/font/FontMetrics;->setIsFixedPitch(Z)V

    .line 273
    goto :goto_3

    .line 269
    :pswitch_d
    iget-object v3, v0, Lcom/itextpdf/io/font/Type1Font;->fontMetrics:Lcom/itextpdf/io/font/FontMetrics;

    invoke-virtual {v8}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/font/FontMetrics;->setItalicAngle(F)V

    .line 270
    goto :goto_3

    .line 266
    :pswitch_e
    iget-object v3, v0, Lcom/itextpdf/io/font/Type1Font;->fontNames:Lcom/itextpdf/io/font/FontNames;

    invoke-virtual {v8, v13}, Ljava/util/StringTokenizer;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/itextpdf/io/font/constants/FontWeights;->fromType1FontWeight(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/font/FontNames;->setFontWeight(I)V

    .line 267
    goto :goto_3

    .line 262
    :pswitch_f
    invoke-virtual {v8, v13}, Ljava/util/StringTokenizer;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 263
    .local v5, "familyName":Ljava/lang/String;
    iget-object v13, v0, Lcom/itextpdf/io/font/Type1Font;->fontNames:Lcom/itextpdf/io/font/FontNames;

    new-array v14, v7, [[Ljava/lang/String;

    new-array v12, v12, [Ljava/lang/String;

    aput-object v11, v12, v6

    aput-object v11, v12, v7

    aput-object v11, v12, v4

    aput-object v5, v12, v3

    aput-object v12, v14, v6

    invoke-virtual {v13, v14}, Lcom/itextpdf/io/font/FontNames;->setFamilyName([[Ljava/lang/String;)V

    .line 264
    goto :goto_3

    .line 258
    .end local v5    # "familyName":Ljava/lang/String;
    :pswitch_10
    invoke-virtual {v8, v13}, Ljava/util/StringTokenizer;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 259
    .local v5, "fullName":Ljava/lang/String;
    iget-object v13, v0, Lcom/itextpdf/io/font/Type1Font;->fontNames:Lcom/itextpdf/io/font/FontNames;

    new-array v14, v7, [[Ljava/lang/String;

    new-array v12, v12, [Ljava/lang/String;

    aput-object v11, v12, v6

    aput-object v11, v12, v7

    aput-object v11, v12, v4

    aput-object v5, v12, v3

    aput-object v12, v14, v6

    invoke-virtual {v13, v14}, Lcom/itextpdf/io/font/FontNames;->setFullName([[Ljava/lang/String;)V

    .line 260
    goto :goto_3

    .line 255
    .end local v5    # "fullName":Ljava/lang/String;
    :pswitch_11
    iget-object v3, v0, Lcom/itextpdf/io/font/Type1Font;->fontNames:Lcom/itextpdf/io/font/FontNames;

    invoke-virtual {v8, v13}, Ljava/util/StringTokenizer;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/font/FontNames;->setFontName(Ljava/lang/String;)V

    .line 256
    nop

    .line 315
    .end local v8    # "tok":Ljava/util/StringTokenizer;
    .end local v10    # "ident":Ljava/lang/String;
    :goto_3
    goto/16 :goto_0

    .line 316
    .end local v9    # "line":Ljava/lang/String;
    :cond_2
    if-nez v2, :cond_4

    .line 317
    iget-object v3, v0, Lcom/itextpdf/io/font/Type1Font;->fontParser:Lcom/itextpdf/io/font/Type1Parser;

    invoke-virtual {v3}, Lcom/itextpdf/io/font/Type1Parser;->getAfmPath()Ljava/lang/String;

    move-result-object v3

    .line 318
    .local v3, "metricsPath":Ljava/lang/String;
    if-eqz v3, :cond_3

    .line 319
    new-instance v4, Lcom/itextpdf/io/exceptions/IOException;

    const-string/jumbo v5, "startcharmetrics is missing in {0}."

    invoke-direct {v4, v5}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v4

    throw v4

    .line 321
    :cond_3
    new-instance v4, Lcom/itextpdf/io/exceptions/IOException;

    const-string/jumbo v5, "startcharmetrics is missing in the metrics file."

    invoke-direct {v4, v5}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 324
    .end local v3    # "metricsPath":Ljava/lang/String;
    :cond_4
    iput v6, v0, Lcom/itextpdf/io/font/Type1Font;->avgWidth:I

    .line 325
    const/4 v8, 0x0

    .line 326
    .local v8, "widthCount":I
    :goto_4
    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readLine()Ljava/lang/String;

    move-result-object v9

    move-object v10, v9

    .local v10, "line":Ljava/lang/String;
    if-eqz v9, :cond_c

    .line 327
    new-instance v9, Ljava/util/StringTokenizer;

    invoke-direct {v9, v10}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 328
    .local v9, "tok":Ljava/util/StringTokenizer;
    invoke-virtual {v9}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v11

    if-nez v11, :cond_5

    .line 329
    goto :goto_4

    .line 331
    :cond_5
    invoke-virtual {v9}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v11

    .line 332
    .local v11, "ident":Ljava/lang/String;
    const-string v12, "EndCharMetrics"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_6

    .line 333
    const/4 v2, 0x0

    .line 334
    goto/16 :goto_9

    .line 336
    :cond_6
    const/4 v12, -0x1

    .line 337
    .local v12, "C":I
    const/16 v13, 0xfa

    .line 338
    .local v13, "WX":I
    const-string v14, ""

    .line 339
    .local v14, "N":Ljava/lang/String;
    const/4 v15, 0x0

    .line 340
    .local v15, "B":[I
    new-instance v3, Ljava/util/StringTokenizer;

    const-string v4, ";"

    invoke-direct {v3, v10, v4}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 341
    .end local v9    # "tok":Ljava/util/StringTokenizer;
    .local v3, "tok":Ljava/util/StringTokenizer;
    :goto_5
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v4

    if-eqz v4, :cond_9

    .line 342
    new-instance v4, Ljava/util/StringTokenizer;

    invoke-virtual {v3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v4, v9}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 343
    .local v4, "tokc":Ljava/util/StringTokenizer;
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v9

    if-nez v9, :cond_7

    .line 344
    goto :goto_5

    .line 346
    :cond_7
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v11

    .line 347
    invoke-virtual {v11}, Ljava/lang/String;->hashCode()I

    move-result v9

    sparse-switch v9, :sswitch_data_1

    :cond_8
    goto :goto_6

    :sswitch_12
    const-string v9, "WX"

    invoke-virtual {v11, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_8

    move v9, v7

    goto :goto_7

    :sswitch_13
    const-string v9, "N"

    invoke-virtual {v11, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_8

    const/4 v9, 0x2

    goto :goto_7

    :sswitch_14
    const-string v9, "C"

    invoke-virtual {v11, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_8

    move v9, v6

    goto :goto_7

    :sswitch_15
    const-string v9, "B"

    invoke-virtual {v11, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_8

    const/4 v9, 0x3

    goto :goto_7

    :goto_6
    const/4 v9, -0x1

    :goto_7
    packed-switch v9, :pswitch_data_1

    goto :goto_8

    .line 358
    :pswitch_12
    nop

    .line 359
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    .line 360
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 361
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    .line 362
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    filled-new-array {v9, v6, v7, v5}, [I

    move-result-object v5

    move-object v15, v5

    .end local v15    # "B":[I
    .local v5, "B":[I
    goto :goto_8

    .line 355
    .end local v5    # "B":[I
    .restart local v15    # "B":[I
    :pswitch_13
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v5

    .line 356
    .end local v14    # "N":Ljava/lang/String;
    .local v5, "N":Ljava/lang/String;
    move-object v14, v5

    goto :goto_8

    .line 352
    .end local v5    # "N":Ljava/lang/String;
    .restart local v14    # "N":Ljava/lang/String;
    :pswitch_14
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v5

    float-to-int v5, v5

    .line 353
    .end local v13    # "WX":I
    .local v5, "WX":I
    move v13, v5

    goto :goto_8

    .line 349
    .end local v5    # "WX":I
    .restart local v13    # "WX":I
    :pswitch_15
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 350
    .end local v12    # "C":I
    .local v5, "C":I
    move v12, v5

    .line 366
    .end local v4    # "tokc":Ljava/util/StringTokenizer;
    .end local v5    # "C":I
    .restart local v12    # "C":I
    :goto_8
    const/4 v6, 0x0

    const/4 v7, 0x1

    goto/16 :goto_5

    .line 367
    :cond_9
    invoke-static {v14}, Lcom/itextpdf/io/font/AdobeGlyphList;->nameToUnicode(Ljava/lang/String;)I

    move-result v4

    .line 368
    .local v4, "unicode":I
    new-instance v5, Lcom/itextpdf/io/font/otf/Glyph;

    invoke-direct {v5, v12, v13, v4, v15}, Lcom/itextpdf/io/font/otf/Glyph;-><init>(III[I)V

    .line 369
    .local v5, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    if-ltz v12, :cond_a

    .line 370
    iget-object v6, v0, Lcom/itextpdf/io/font/Type1Font;->codeToGlyph:Ljava/util/Map;

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v6, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 372
    :cond_a
    const/4 v6, -0x1

    if-eq v4, v6, :cond_b

    .line 373
    iget-object v6, v0, Lcom/itextpdf/io/font/Type1Font;->unicodeToGlyph:Ljava/util/Map;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v6, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 375
    :cond_b
    iget v6, v0, Lcom/itextpdf/io/font/Type1Font;->avgWidth:I

    add-int/2addr v6, v13

    iput v6, v0, Lcom/itextpdf/io/font/Type1Font;->avgWidth:I

    .line 376
    nop

    .end local v3    # "tok":Ljava/util/StringTokenizer;
    .end local v4    # "unicode":I
    .end local v5    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    .end local v11    # "ident":Ljava/lang/String;
    .end local v12    # "C":I
    .end local v13    # "WX":I
    .end local v14    # "N":Ljava/lang/String;
    .end local v15    # "B":[I
    add-int/lit8 v8, v8, 0x1

    .line 377
    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v6, 0x0

    const/4 v7, 0x1

    goto/16 :goto_4

    .line 378
    :cond_c
    :goto_9
    if-eqz v8, :cond_d

    .line 379
    iget v3, v0, Lcom/itextpdf/io/font/Type1Font;->avgWidth:I

    div-int/2addr v3, v8

    iput v3, v0, Lcom/itextpdf/io/font/Type1Font;->avgWidth:I

    .line 381
    :cond_d
    if-eqz v2, :cond_f

    .line 382
    iget-object v3, v0, Lcom/itextpdf/io/font/Type1Font;->fontParser:Lcom/itextpdf/io/font/Type1Parser;

    invoke-virtual {v3}, Lcom/itextpdf/io/font/Type1Parser;->getAfmPath()Ljava/lang/String;

    move-result-object v3

    .line 383
    .local v3, "metricsPath":Ljava/lang/String;
    if-eqz v3, :cond_e

    .line 384
    new-instance v4, Lcom/itextpdf/io/exceptions/IOException;

    const-string v5, "endcharmetrics is missing in {0}."

    invoke-direct {v4, v5}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v4

    throw v4

    .line 386
    :cond_e
    new-instance v4, Lcom/itextpdf/io/exceptions/IOException;

    const-string v5, "endcharmetrics is missing in the metrics file."

    invoke-direct {v4, v5}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 393
    .end local v3    # "metricsPath":Ljava/lang/String;
    :cond_f
    iget-object v3, v0, Lcom/itextpdf/io/font/Type1Font;->unicodeToGlyph:Ljava/util/Map;

    const/16 v4, 0xa0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    const/16 v5, 0x20

    if-nez v3, :cond_10

    .line 394
    iget-object v3, v0, Lcom/itextpdf/io/font/Type1Font;->unicodeToGlyph:Ljava/util/Map;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/io/font/otf/Glyph;

    .line 395
    .local v3, "space":Lcom/itextpdf/io/font/otf/Glyph;
    if-eqz v3, :cond_10

    .line 396
    iget-object v6, v0, Lcom/itextpdf/io/font/Type1Font;->unicodeToGlyph:Ljava/util/Map;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    new-instance v9, Lcom/itextpdf/io/font/otf/Glyph;

    invoke-virtual {v3}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v11

    invoke-virtual {v3}, Lcom/itextpdf/io/font/otf/Glyph;->getWidth()I

    move-result v12

    invoke-virtual {v3}, Lcom/itextpdf/io/font/otf/Glyph;->getBbox()[I

    move-result-object v13

    invoke-direct {v9, v11, v12, v4, v13}, Lcom/itextpdf/io/font/otf/Glyph;-><init>(III[I)V

    invoke-interface {v6, v7, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 399
    .end local v3    # "space":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_10
    const/4 v3, 0x0

    .line 400
    .local v3, "endOfMetrics":Z
    :goto_a
    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readLine()Ljava/lang/String;

    move-result-object v4

    move-object v10, v4

    if-eqz v4, :cond_14

    .line 401
    new-instance v4, Ljava/util/StringTokenizer;

    invoke-direct {v4, v10}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 402
    .local v4, "tok":Ljava/util/StringTokenizer;
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v6

    if-nez v6, :cond_11

    .line 403
    goto :goto_a

    .line 405
    :cond_11
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v6

    .line 406
    .local v6, "ident":Ljava/lang/String;
    const-string v7, "EndFontMetrics"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_12

    .line 407
    const/4 v3, 0x1

    .line 408
    goto :goto_b

    .line 409
    :cond_12
    const-string v7, "StartKernPairs"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_13

    .line 410
    const/4 v2, 0x1

    .line 411
    goto :goto_b

    .line 413
    .end local v4    # "tok":Ljava/util/StringTokenizer;
    .end local v6    # "ident":Ljava/lang/String;
    :cond_13
    goto :goto_a

    .line 414
    :cond_14
    :goto_b
    if-eqz v2, :cond_19

    .line 415
    :goto_c
    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readLine()Ljava/lang/String;

    move-result-object v4

    move-object v10, v4

    if-eqz v4, :cond_1b

    .line 416
    new-instance v4, Ljava/util/StringTokenizer;

    invoke-direct {v4, v10}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 417
    .restart local v4    # "tok":Ljava/util/StringTokenizer;
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v6

    if-nez v6, :cond_15

    .line 418
    goto :goto_f

    .line 420
    :cond_15
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v6

    .line 421
    .restart local v6    # "ident":Ljava/lang/String;
    const-string v7, "KPX"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_17

    .line 422
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v7

    .line 423
    .local v7, "first":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v9

    .line 424
    .local v9, "second":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v11

    float-to-int v11, v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    .line 426
    .local v11, "width":Ljava/lang/Integer;
    invoke-static {v7}, Lcom/itextpdf/io/font/AdobeGlyphList;->nameToUnicode(Ljava/lang/String;)I

    move-result v12

    .line 427
    .local v12, "firstUni":I
    invoke-static {v9}, Lcom/itextpdf/io/font/AdobeGlyphList;->nameToUnicode(Ljava/lang/String;)I

    move-result v13

    .line 429
    .local v13, "secondUni":I
    const/4 v14, -0x1

    if-eq v12, v14, :cond_16

    if-eq v13, v14, :cond_16

    .line 430
    int-to-long v14, v12

    shl-long/2addr v14, v5

    move-object/from16 v16, v6

    .end local v6    # "ident":Ljava/lang/String;
    .local v16, "ident":Ljava/lang/String;
    int-to-long v5, v13

    add-long/2addr v14, v5

    .line 431
    .local v14, "record":J
    iget-object v5, v0, Lcom/itextpdf/io/font/Type1Font;->kernPairs:Ljava/util/Map;

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-interface {v5, v6, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_d

    .line 429
    .end local v14    # "record":J
    .end local v16    # "ident":Ljava/lang/String;
    .restart local v6    # "ident":Ljava/lang/String;
    :cond_16
    move-object/from16 v16, v6

    .line 433
    .end local v6    # "ident":Ljava/lang/String;
    .end local v7    # "first":Ljava/lang/String;
    .end local v9    # "second":Ljava/lang/String;
    .end local v11    # "width":Ljava/lang/Integer;
    .end local v12    # "firstUni":I
    .end local v13    # "secondUni":I
    .restart local v16    # "ident":Ljava/lang/String;
    :goto_d
    goto :goto_e

    .end local v16    # "ident":Ljava/lang/String;
    .restart local v6    # "ident":Ljava/lang/String;
    :cond_17
    move-object/from16 v16, v6

    .end local v6    # "ident":Ljava/lang/String;
    .restart local v16    # "ident":Ljava/lang/String;
    const-string v5, "EndKernPairs"

    .end local v16    # "ident":Ljava/lang/String;
    .restart local v6    # "ident":Ljava/lang/String;
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_18

    .line 434
    const/4 v2, 0x0

    .line 435
    goto :goto_10

    .line 437
    .end local v4    # "tok":Ljava/util/StringTokenizer;
    .end local v6    # "ident":Ljava/lang/String;
    :cond_18
    :goto_e
    nop

    .line 415
    :goto_f
    const/16 v5, 0x20

    goto :goto_c

    .line 438
    :cond_19
    if-nez v3, :cond_1b

    .line 439
    iget-object v4, v0, Lcom/itextpdf/io/font/Type1Font;->fontParser:Lcom/itextpdf/io/font/Type1Parser;

    invoke-virtual {v4}, Lcom/itextpdf/io/font/Type1Parser;->getAfmPath()Ljava/lang/String;

    move-result-object v4

    .line 440
    .local v4, "metricsPath":Ljava/lang/String;
    if-eqz v4, :cond_1a

    .line 441
    new-instance v5, Lcom/itextpdf/io/exceptions/IOException;

    const-string v6, "endfontmetrics is missing in {0}."

    invoke-direct {v5, v6}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v5

    throw v5

    .line 443
    :cond_1a
    new-instance v5, Lcom/itextpdf/io/exceptions/IOException;

    const-string v6, "endfontmetrics is missing in the metrics file."

    invoke-direct {v5, v6}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 447
    .end local v4    # "metricsPath":Ljava/lang/String;
    :cond_1b
    :goto_10
    if-eqz v2, :cond_1d

    .line 448
    iget-object v4, v0, Lcom/itextpdf/io/font/Type1Font;->fontParser:Lcom/itextpdf/io/font/Type1Parser;

    invoke-virtual {v4}, Lcom/itextpdf/io/font/Type1Parser;->getAfmPath()Ljava/lang/String;

    move-result-object v4

    .line 449
    .restart local v4    # "metricsPath":Ljava/lang/String;
    if-eqz v4, :cond_1c

    .line 450
    new-instance v5, Lcom/itextpdf/io/exceptions/IOException;

    const-string v6, "endkernpairs is missing in {0}."

    invoke-direct {v5, v6}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v5

    throw v5

    .line 452
    :cond_1c
    new-instance v5, Lcom/itextpdf/io/exceptions/IOException;

    const-string v6, "endkernpairs is missing in the metrics file."

    invoke-direct {v5, v6}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 455
    .end local v4    # "metricsPath":Ljava/lang/String;
    :cond_1d
    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->close()V

    .line 457
    iget-object v4, v0, Lcom/itextpdf/io/font/Type1Font;->encodingScheme:Ljava/lang/String;

    const-string v5, "AdobeStandardEncoding"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1e

    iget-object v4, v0, Lcom/itextpdf/io/font/Type1Font;->encodingScheme:Ljava/lang/String;

    const-string v5, "StandardEncoding"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1e

    const/4 v6, 0x1

    goto :goto_11

    :cond_1e
    const/4 v6, 0x0

    :goto_11
    iput-boolean v6, v0, Lcom/itextpdf/io/font/Type1Font;->isFontSpecific:Z

    .line 458
    return-void

    :sswitch_data_0
    .sparse-switch
        -0x796f2b9d -> :sswitch_11
        -0x65c9d168 -> :sswitch_10
        -0x5ea46f08 -> :sswitch_f
        -0x59952bd1 -> :sswitch_e
        -0x503e2461 -> :sswitch_d
        -0x4c3a5f67 -> :sswitch_c
        -0x306d8887 -> :sswitch_b
        -0x2fdca149 -> :sswitch_a
        -0x2db46ce9 -> :sswitch_9
        -0xfd53aea -> :sswitch_8
        0x4c7da52 -> :sswitch_7
        0x4c7dc04 -> :sswitch_6
        0x195d77f5 -> :sswitch_5
        0x199cb718 -> :sswitch_4
        0x19a29f9a -> :sswitch_3
        0x532d95da -> :sswitch_2
        0x63ae6eeb -> :sswitch_1
        0x7082f228 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
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

    :sswitch_data_1
    .sparse-switch
        0x42 -> :sswitch_15
        0x43 -> :sswitch_14
        0x4e -> :sswitch_13
        0xae1 -> :sswitch_12
    .end sparse-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
    .end packed-switch
.end method

.method public setKerning(III)Z
    .locals 5
    .param p1, "first"    # I
    .param p2, "second"    # I
    .param p3, "kern"    # I

    .line 163
    int-to-long v0, p1

    const/16 v2, 0x20

    shl-long/2addr v0, v2

    int-to-long v2, p2

    add-long/2addr v0, v2

    .line 164
    .local v0, "record":J
    iget-object v2, p0, Lcom/itextpdf/io/font/Type1Font;->kernPairs:Ljava/util/Map;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    const/4 v2, 0x1

    return v2
.end method
