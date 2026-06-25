.class public final Lcom/itextpdf/io/font/FontProgramFactory;
.super Ljava/lang/Object;
.source "FontProgramFactory.java"


# static fields
.field private static DEFAULT_CACHED:Z

.field private static fontRegisterProvider:Lcom/itextpdf/io/font/FontRegisterProvider;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 45
    const/4 v0, 0x1

    sput-boolean v0, Lcom/itextpdf/io/font/FontProgramFactory;->DEFAULT_CACHED:Z

    .line 47
    new-instance v0, Lcom/itextpdf/io/font/FontRegisterProvider;

    invoke-direct {v0}, Lcom/itextpdf/io/font/FontRegisterProvider;-><init>()V

    sput-object v0, Lcom/itextpdf/io/font/FontProgramFactory;->fontRegisterProvider:Lcom/itextpdf/io/font/FontRegisterProvider;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    return-void
.end method

.method public static clearRegisteredFontFamilies()V
    .locals 1

    .line 514
    sget-object v0, Lcom/itextpdf/io/font/FontProgramFactory;->fontRegisterProvider:Lcom/itextpdf/io/font/FontRegisterProvider;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontRegisterProvider;->clearRegisteredFontFamilies()V

    return-void
.end method

.method public static clearRegisteredFonts()V
    .locals 1

    .line 509
    sget-object v0, Lcom/itextpdf/io/font/FontProgramFactory;->fontRegisterProvider:Lcom/itextpdf/io/font/FontRegisterProvider;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontRegisterProvider;->clearRegisteredFonts()V

    return-void
.end method

.method public static createFont()Lcom/itextpdf/io/font/FontProgram;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 59
    const-string v0, "Helvetica"

    invoke-static {v0}, Lcom/itextpdf/io/font/FontProgramFactory;->createFont(Ljava/lang/String;)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    return-object v0
.end method

.method public static createFont(Ljava/lang/String;)Lcom/itextpdf/io/font/FontProgram;
    .locals 2
    .param p0, "fontProgram"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 78
    const/4 v0, 0x0

    sget-boolean v1, Lcom/itextpdf/io/font/FontProgramFactory;->DEFAULT_CACHED:Z

    invoke-static {p0, v0, v1}, Lcom/itextpdf/io/font/FontProgramFactory;->createFont(Ljava/lang/String;Ljava/lang/String;Z)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    return-object v0
.end method

.method public static createFont(Ljava/lang/String;IZ)Lcom/itextpdf/io/font/FontProgram;
    .locals 3
    .param p0, "ttc"    # Ljava/lang/String;
    .param p1, "ttcIndex"    # I
    .param p2, "cached"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 327
    invoke-static {p0, p1}, Lcom/itextpdf/io/font/FontCacheKey;->create(Ljava/lang/String;I)Lcom/itextpdf/io/font/FontCacheKey;

    move-result-object v0

    .line 328
    .local v0, "fontCacheKey":Lcom/itextpdf/io/font/FontCacheKey;
    if-eqz p2, :cond_0

    .line 329
    invoke-static {v0}, Lcom/itextpdf/io/font/FontCache;->getFont(Lcom/itextpdf/io/font/FontCacheKey;)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v1

    .line 330
    .local v1, "fontFound":Lcom/itextpdf/io/font/FontProgram;
    if-eqz v1, :cond_0

    .line 331
    return-object v1

    .line 334
    .end local v1    # "fontFound":Lcom/itextpdf/io/font/FontProgram;
    :cond_0
    new-instance v1, Lcom/itextpdf/io/font/TrueTypeFont;

    invoke-direct {v1, p0, p1}, Lcom/itextpdf/io/font/TrueTypeFont;-><init>(Ljava/lang/String;I)V

    .line 335
    .local v1, "fontBuilt":Lcom/itextpdf/io/font/FontProgram;
    if-eqz p2, :cond_1

    invoke-static {v1, v0}, Lcom/itextpdf/io/font/FontCache;->saveFont(Lcom/itextpdf/io/font/FontProgram;Lcom/itextpdf/io/font/FontCacheKey;)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v2

    goto :goto_0

    :cond_1
    move-object v2, v1

    :goto_0
    return-object v2
.end method

.method public static createFont(Ljava/lang/String;Ljava/lang/String;Z)Lcom/itextpdf/io/font/FontProgram;
    .locals 1
    .param p0, "fontProgram"    # Ljava/lang/String;
    .param p1, "cmap"    # Ljava/lang/String;
    .param p2, "cached"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 119
    const/4 v0, 0x0

    invoke-static {p0, p1, v0, p2}, Lcom/itextpdf/io/font/FontProgramFactory;->createFont(Ljava/lang/String;Ljava/lang/String;[BZ)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    return-object v0
.end method

.method private static createFont(Ljava/lang/String;Ljava/lang/String;[BZ)Lcom/itextpdf/io/font/FontProgram;
    .locals 11
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "cmap"    # Ljava/lang/String;
    .param p2, "fontProgram"    # [B
    .param p3, "cached"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 163
    invoke-static {p0}, Lcom/itextpdf/io/font/FontProgram;->trimFontStyle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 166
    .local v0, "baseName":Ljava/lang/String;
    invoke-static {p0}, Lcom/itextpdf/io/font/constants/StandardFonts;->isStandardFont(Ljava/lang/String;)Z

    move-result v1

    .line 167
    .local v1, "isBuiltinFonts14":Z
    const/4 v2, 0x0

    if-nez v1, :cond_0

    invoke-static {v0}, Lcom/itextpdf/io/font/CjkResourceLoader;->isPredefinedCidFont(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    move v3, v2

    .line 170
    .local v3, "isCidFont":Z
    :goto_0
    const/4 v4, 0x0

    .line 171
    .local v4, "fontKey":Lcom/itextpdf/io/font/FontCacheKey;
    if-eqz p3, :cond_2

    .line 172
    if-eqz v3, :cond_1

    if-eqz p1, :cond_1

    .line 173
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, p2}, Lcom/itextpdf/io/font/FontProgramFactory;->createFontCacheKey(Ljava/lang/String;[B)Lcom/itextpdf/io/font/FontCacheKey;

    move-result-object v4

    goto :goto_1

    .line 175
    :cond_1
    invoke-static {p0, p2}, Lcom/itextpdf/io/font/FontProgramFactory;->createFontCacheKey(Ljava/lang/String;[B)Lcom/itextpdf/io/font/FontCacheKey;

    move-result-object v4

    .line 177
    :goto_1
    invoke-static {v4}, Lcom/itextpdf/io/font/FontCache;->getFont(Lcom/itextpdf/io/font/FontCacheKey;)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v5

    .line 178
    .local v5, "fontFound":Lcom/itextpdf/io/font/FontProgram;
    if-eqz v5, :cond_2

    .line 179
    return-object v5

    .line 183
    .end local v5    # "fontFound":Lcom/itextpdf/io/font/FontProgram;
    :cond_2
    const/4 v5, 0x0

    .line 184
    .local v5, "fontBuilt":Lcom/itextpdf/io/font/FontProgram;
    const/4 v6, 0x0

    if-nez p0, :cond_5

    .line 185
    if-eqz p2, :cond_11

    .line 187
    :try_start_0
    invoke-static {p2}, Lcom/itextpdf/io/font/WoffConverter;->isWoffFont([B)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 188
    invoke-static {p2}, Lcom/itextpdf/io/font/WoffConverter;->convert([B)[B

    move-result-object v2

    move-object p2, v2

    goto :goto_2

    .line 189
    :cond_3
    invoke-static {p2}, Lcom/itextpdf/io/font/woff2/Woff2Converter;->isWoff2Font([B)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 190
    invoke-static {p2}, Lcom/itextpdf/io/font/woff2/Woff2Converter;->convert([B)[B

    move-result-object v2

    move-object p2, v2

    .line 192
    :cond_4
    :goto_2
    new-instance v2, Lcom/itextpdf/io/font/TrueTypeFont;

    invoke-direct {v2, p2}, Lcom/itextpdf/io/font/TrueTypeFont;-><init>([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v5, v2

    .line 194
    goto :goto_3

    .line 193
    :catch_0
    move-exception v2

    .line 195
    :goto_3
    if-nez v5, :cond_11

    .line 197
    :try_start_1
    new-instance v2, Lcom/itextpdf/io/font/Type1Font;

    invoke-direct {v2, v6, v6, p2, v6}, Lcom/itextpdf/io/font/Type1Font;-><init>(Ljava/lang/String;Ljava/lang/String;[B[B)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-object v5, v2

    .line 199
    :goto_4
    goto/16 :goto_9

    .line 198
    :catch_1
    move-exception v2

    goto :goto_4

    .line 203
    :cond_5
    const/4 v7, 0x0

    .line 204
    .local v7, "fontFileExtension":Ljava/lang/String;
    const/16 v8, 0x2e

    invoke-virtual {v0, v8}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v8

    .line 205
    .local v8, "extensionBeginIndex":I
    if-lez v8, :cond_6

    .line 206
    invoke-virtual {v0, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    .line 208
    :cond_6
    if-nez v1, :cond_10

    const-string v9, ".afm"

    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_10

    const-string v9, ".pfm"

    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_7

    goto/16 :goto_8

    .line 210
    :cond_7
    if-eqz v3, :cond_8

    .line 211
    new-instance v2, Lcom/itextpdf/io/font/CidFont;

    invoke-static {v0}, Lcom/itextpdf/io/font/CjkResourceLoader;->getCompatibleCmaps(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v6

    invoke-direct {v2, p0, p1, v6}, Lcom/itextpdf/io/font/CidFont;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;)V

    move-object v5, v2

    goto/16 :goto_9

    .line 212
    :cond_8
    const-string v6, ".ttf"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_e

    const-string v6, ".otf"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_9

    goto/16 :goto_7

    .line 218
    :cond_9
    const-string v6, ".woff"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_b

    const-string v9, ".woff2"

    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_a

    goto :goto_5

    .line 239
    :cond_a
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    const-string v9, ".ttc,"

    invoke-virtual {v6, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    .line 240
    .local v6, "ttcSplit":I
    if-lez v6, :cond_11

    .line 244
    add-int/lit8 v9, v6, 0x4

    :try_start_2
    invoke-virtual {v0, v2, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 247
    .local v2, "ttcName":Ljava/lang/String;
    add-int/lit8 v9, v6, 0x5

    invoke-virtual {v0, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    .line 248
    .local v9, "ttcIndex":I
    new-instance v10, Lcom/itextpdf/io/font/TrueTypeFont;

    invoke-direct {v10, v2, v9}, Lcom/itextpdf/io/font/TrueTypeFont;-><init>(Ljava/lang/String;I)V
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_2

    move-object v5, v10

    .line 251
    .end local v2    # "ttcName":Ljava/lang/String;
    .end local v9    # "ttcIndex":I
    goto :goto_9

    .line 249
    :catch_2
    move-exception v2

    .line 250
    .local v2, "nfe":Ljava/lang/NumberFormatException;
    new-instance v9, Lcom/itextpdf/io/exceptions/IOException;

    invoke-virtual {v2}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10, v2}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9

    .line 219
    .end local v2    # "nfe":Ljava/lang/NumberFormatException;
    .end local v6    # "ttcSplit":I
    :cond_b
    :goto_5
    if-nez p2, :cond_c

    .line 220
    invoke-static {v0}, Lcom/itextpdf/io/font/FontProgramFactory;->readFontBytesFromPath(Ljava/lang/String;)[B

    move-result-object p2

    .line 222
    :cond_c
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 224
    :try_start_3
    invoke-static {p2}, Lcom/itextpdf/io/font/WoffConverter;->convert([B)[B

    move-result-object v2
    :try_end_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_3

    .line 227
    .end local p2    # "fontProgram":[B
    .local v2, "fontProgram":[B
    move-object p2, v2

    goto :goto_6

    .line 225
    .end local v2    # "fontProgram":[B
    .restart local p2    # "fontProgram":[B
    :catch_3
    move-exception v2

    .line 226
    .local v2, "woffException":Ljava/lang/IllegalArgumentException;
    new-instance v6, Lcom/itextpdf/io/exceptions/IOException;

    const-string v9, "Invalid WOFF font file."

    invoke-direct {v6, v9, v2}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 232
    .end local v2    # "woffException":Ljava/lang/IllegalArgumentException;
    :cond_d
    :try_start_4
    invoke-static {p2}, Lcom/itextpdf/io/font/woff2/Woff2Converter;->convert([B)[B

    move-result-object v2
    :try_end_4
    .catch Lcom/itextpdf/io/exceptions/FontCompressionException; {:try_start_4 .. :try_end_4} :catch_4

    .line 235
    .end local p2    # "fontProgram":[B
    .local v2, "fontProgram":[B
    move-object p2, v2

    .line 237
    .end local v2    # "fontProgram":[B
    .restart local p2    # "fontProgram":[B
    :goto_6
    new-instance v2, Lcom/itextpdf/io/font/TrueTypeFont;

    invoke-direct {v2, p2}, Lcom/itextpdf/io/font/TrueTypeFont;-><init>([B)V

    move-object v5, v2

    goto :goto_9

    .line 233
    :catch_4
    move-exception v2

    .line 234
    .local v2, "woff2Exception":Lcom/itextpdf/io/exceptions/FontCompressionException;
    new-instance v6, Lcom/itextpdf/io/exceptions/IOException;

    const-string v9, "Invalid WOFF2 font file."

    invoke-direct {v6, v9, v2}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 213
    .end local v2    # "woff2Exception":Lcom/itextpdf/io/exceptions/FontCompressionException;
    :cond_e
    :goto_7
    if-eqz p2, :cond_f

    .line 214
    new-instance v2, Lcom/itextpdf/io/font/TrueTypeFont;

    invoke-direct {v2, p2}, Lcom/itextpdf/io/font/TrueTypeFont;-><init>([B)V

    move-object v5, v2

    goto :goto_9

    .line 216
    :cond_f
    new-instance v2, Lcom/itextpdf/io/font/TrueTypeFont;

    invoke-direct {v2, p0}, Lcom/itextpdf/io/font/TrueTypeFont;-><init>(Ljava/lang/String;)V

    move-object v5, v2

    goto :goto_9

    .line 209
    :cond_10
    :goto_8
    new-instance v2, Lcom/itextpdf/io/font/Type1Font;

    invoke-direct {v2, p0, v6, v6, v6}, Lcom/itextpdf/io/font/Type1Font;-><init>(Ljava/lang/String;Ljava/lang/String;[B[B)V

    move-object v5, v2

    .line 255
    .end local v7    # "fontFileExtension":Ljava/lang/String;
    .end local v8    # "extensionBeginIndex":I
    :cond_11
    :goto_9
    if-nez v5, :cond_13

    .line 256
    if-eqz p0, :cond_12

    .line 257
    new-instance v2, Lcom/itextpdf/io/exceptions/IOException;

    const-string v6, "Type of font {0} is not recognized."

    invoke-direct {v2, v6}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v2, v6}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v2

    throw v2

    .line 259
    :cond_12
    new-instance v2, Lcom/itextpdf/io/exceptions/IOException;

    const-string v6, "Type of font is not recognized."

    invoke-direct {v2, v6}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 262
    :cond_13
    if-eqz p3, :cond_14

    invoke-static {v5, v4}, Lcom/itextpdf/io/font/FontCache;->saveFont(Lcom/itextpdf/io/font/FontProgram;Lcom/itextpdf/io/font/FontCacheKey;)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v2

    goto :goto_a

    :cond_14
    move-object v2, v5

    :goto_a
    return-object v2
.end method

.method public static createFont(Ljava/lang/String;Z)Lcom/itextpdf/io/font/FontProgram;
    .locals 1
    .param p0, "fontProgram"    # Ljava/lang/String;
    .param p1, "cached"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 98
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lcom/itextpdf/io/font/FontProgramFactory;->createFont(Ljava/lang/String;Ljava/lang/String;Z)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    return-object v0
.end method

.method public static createFont([B)Lcom/itextpdf/io/font/FontProgram;
    .locals 2
    .param p0, "fontProgram"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 138
    const/4 v0, 0x0

    sget-boolean v1, Lcom/itextpdf/io/font/FontProgramFactory;->DEFAULT_CACHED:Z

    invoke-static {v0, v0, p0, v1}, Lcom/itextpdf/io/font/FontProgramFactory;->createFont(Ljava/lang/String;Ljava/lang/String;[BZ)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    return-object v0
.end method

.method public static createFont([BIZ)Lcom/itextpdf/io/font/FontProgram;
    .locals 3
    .param p0, "ttc"    # [B
    .param p1, "ttcIndex"    # I
    .param p2, "cached"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 350
    invoke-static {p0, p1}, Lcom/itextpdf/io/font/FontCacheKey;->create([BI)Lcom/itextpdf/io/font/FontCacheKey;

    move-result-object v0

    .line 351
    .local v0, "fontKey":Lcom/itextpdf/io/font/FontCacheKey;
    if-eqz p2, :cond_0

    .line 352
    invoke-static {v0}, Lcom/itextpdf/io/font/FontCache;->getFont(Lcom/itextpdf/io/font/FontCacheKey;)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v1

    .line 353
    .local v1, "fontFound":Lcom/itextpdf/io/font/FontProgram;
    if-eqz v1, :cond_0

    .line 354
    return-object v1

    .line 357
    .end local v1    # "fontFound":Lcom/itextpdf/io/font/FontProgram;
    :cond_0
    new-instance v1, Lcom/itextpdf/io/font/TrueTypeFont;

    invoke-direct {v1, p0, p1}, Lcom/itextpdf/io/font/TrueTypeFont;-><init>([BI)V

    .line 358
    .local v1, "fontBuilt":Lcom/itextpdf/io/font/FontProgram;
    if-eqz p2, :cond_1

    invoke-static {v1, v0}, Lcom/itextpdf/io/font/FontCache;->saveFont(Lcom/itextpdf/io/font/FontProgram;Lcom/itextpdf/io/font/FontCacheKey;)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v2

    goto :goto_0

    :cond_1
    move-object v2, v1

    :goto_0
    return-object v2
.end method

.method public static createFont([BZ)Lcom/itextpdf/io/font/FontProgram;
    .locals 1
    .param p0, "fontProgram"    # [B
    .param p1, "cached"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 158
    const/4 v0, 0x0

    invoke-static {v0, v0, p0, p1}, Lcom/itextpdf/io/font/FontProgramFactory;->createFont(Ljava/lang/String;Ljava/lang/String;[BZ)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    return-object v0
.end method

.method private static createFontCacheKey(Ljava/lang/String;[B)Lcom/itextpdf/io/font/FontCacheKey;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "fontProgram"    # [B

    .line 501
    if-eqz p0, :cond_0

    .line 502
    invoke-static {p0}, Lcom/itextpdf/io/font/FontCacheKey;->create(Ljava/lang/String;)Lcom/itextpdf/io/font/FontCacheKey;

    move-result-object v0

    .local v0, "key":Lcom/itextpdf/io/font/FontCacheKey;
    goto :goto_0

    .line 504
    .end local v0    # "key":Lcom/itextpdf/io/font/FontCacheKey;
    :cond_0
    invoke-static {p1}, Lcom/itextpdf/io/font/FontCacheKey;->create([B)Lcom/itextpdf/io/font/FontCacheKey;

    move-result-object v0

    .line 506
    .restart local v0    # "key":Lcom/itextpdf/io/font/FontCacheKey;
    :goto_0
    return-object v0
.end method

.method public static createRegisteredFont(Ljava/lang/String;)Lcom/itextpdf/io/font/FontProgram;
    .locals 2
    .param p0, "fontName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 401
    sget-object v0, Lcom/itextpdf/io/font/FontProgramFactory;->fontRegisterProvider:Lcom/itextpdf/io/font/FontRegisterProvider;

    const/4 v1, -0x1

    invoke-virtual {v0, p0, v1}, Lcom/itextpdf/io/font/FontRegisterProvider;->getFont(Ljava/lang/String;I)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    return-object v0
.end method

.method public static createRegisteredFont(Ljava/lang/String;I)Lcom/itextpdf/io/font/FontProgram;
    .locals 1
    .param p0, "fontName"    # Ljava/lang/String;
    .param p1, "style"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 389
    sget-object v0, Lcom/itextpdf/io/font/FontProgramFactory;->fontRegisterProvider:Lcom/itextpdf/io/font/FontRegisterProvider;

    invoke-virtual {v0, p0, p1}, Lcom/itextpdf/io/font/FontRegisterProvider;->getFont(Ljava/lang/String;I)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    return-object v0
.end method

.method public static createRegisteredFont(Ljava/lang/String;IZ)Lcom/itextpdf/io/font/FontProgram;
    .locals 1
    .param p0, "fontName"    # Ljava/lang/String;
    .param p1, "style"    # I
    .param p2, "cached"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 374
    sget-object v0, Lcom/itextpdf/io/font/FontProgramFactory;->fontRegisterProvider:Lcom/itextpdf/io/font/FontRegisterProvider;

    invoke-virtual {v0, p0, p1, p2}, Lcom/itextpdf/io/font/FontRegisterProvider;->getFont(Ljava/lang/String;IZ)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    return-object v0
.end method

.method public static createType1Font(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/io/font/FontProgram;
    .locals 1
    .param p0, "metricsPath"    # Ljava/lang/String;
    .param p1, "binaryPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 299
    sget-boolean v0, Lcom/itextpdf/io/font/FontProgramFactory;->DEFAULT_CACHED:Z

    invoke-static {p0, p1, v0}, Lcom/itextpdf/io/font/FontProgramFactory;->createType1Font(Ljava/lang/String;Ljava/lang/String;Z)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    return-object v0
.end method

.method public static createType1Font(Ljava/lang/String;Ljava/lang/String;Z)Lcom/itextpdf/io/font/FontProgram;
    .locals 1
    .param p0, "metricsPath"    # Ljava/lang/String;
    .param p1, "binaryPath"    # Ljava/lang/String;
    .param p2, "cached"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 312
    const/4 v0, 0x0

    invoke-static {p0, p1, v0, v0, p2}, Lcom/itextpdf/io/font/FontProgramFactory;->createType1Font(Ljava/lang/String;Ljava/lang/String;[B[BZ)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    return-object v0
.end method

.method private static createType1Font(Ljava/lang/String;Ljava/lang/String;[B[BZ)Lcom/itextpdf/io/font/FontProgram;
    .locals 3
    .param p0, "metricsPath"    # Ljava/lang/String;
    .param p1, "binaryPath"    # Ljava/lang/String;
    .param p2, "afm"    # [B
    .param p3, "pfb"    # [B
    .param p4, "cached"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 486
    const/4 v0, 0x0

    .line 487
    .local v0, "fontKey":Lcom/itextpdf/io/font/FontCacheKey;
    if-eqz p4, :cond_0

    .line 488
    invoke-static {p0, p2}, Lcom/itextpdf/io/font/FontProgramFactory;->createFontCacheKey(Ljava/lang/String;[B)Lcom/itextpdf/io/font/FontCacheKey;

    move-result-object v0

    .line 489
    invoke-static {v0}, Lcom/itextpdf/io/font/FontCache;->getFont(Lcom/itextpdf/io/font/FontCacheKey;)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v1

    .line 490
    .local v1, "fontProgram":Lcom/itextpdf/io/font/FontProgram;
    if-eqz v1, :cond_0

    .line 491
    return-object v1

    .line 495
    .end local v1    # "fontProgram":Lcom/itextpdf/io/font/FontProgram;
    :cond_0
    new-instance v1, Lcom/itextpdf/io/font/Type1Font;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/itextpdf/io/font/Type1Font;-><init>(Ljava/lang/String;Ljava/lang/String;[B[B)V

    .line 496
    .restart local v1    # "fontProgram":Lcom/itextpdf/io/font/FontProgram;
    if-eqz p4, :cond_1

    invoke-static {v1, v0}, Lcom/itextpdf/io/font/FontCache;->saveFont(Lcom/itextpdf/io/font/FontProgram;Lcom/itextpdf/io/font/FontCacheKey;)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v2

    goto :goto_0

    :cond_1
    move-object v2, v1

    :goto_0
    return-object v2
.end method

.method public static createType1Font([B[B)Lcom/itextpdf/io/font/FontProgram;
    .locals 1
    .param p0, "afm"    # [B
    .param p1, "pfb"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 274
    sget-boolean v0, Lcom/itextpdf/io/font/FontProgramFactory;->DEFAULT_CACHED:Z

    invoke-static {p0, p1, v0}, Lcom/itextpdf/io/font/FontProgramFactory;->createType1Font([B[BZ)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    return-object v0
.end method

.method public static createType1Font([B[BZ)Lcom/itextpdf/io/font/FontProgram;
    .locals 1
    .param p0, "afm"    # [B
    .param p1, "pfb"    # [B
    .param p2, "cached"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 287
    const/4 v0, 0x0

    invoke-static {v0, v0, p0, p1, p2}, Lcom/itextpdf/io/font/FontProgramFactory;->createType1Font(Ljava/lang/String;Ljava/lang/String;[B[BZ)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    return-object v0
.end method

.method public static getRegisteredFontFamilies()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 471
    sget-object v0, Lcom/itextpdf/io/font/FontProgramFactory;->fontRegisterProvider:Lcom/itextpdf/io/font/FontRegisterProvider;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontRegisterProvider;->getRegisteredFontFamilies()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public static getRegisteredFonts()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 462
    sget-object v0, Lcom/itextpdf/io/font/FontProgramFactory;->fontRegisterProvider:Lcom/itextpdf/io/font/FontRegisterProvider;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontRegisterProvider;->getRegisteredFonts()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public static isRegisteredFont(Ljava/lang/String;)Z
    .locals 1
    .param p0, "fontName"    # Ljava/lang/String;

    .line 481
    sget-object v0, Lcom/itextpdf/io/font/FontProgramFactory;->fontRegisterProvider:Lcom/itextpdf/io/font/FontRegisterProvider;

    invoke-virtual {v0, p0}, Lcom/itextpdf/io/font/FontRegisterProvider;->isRegisteredFont(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static readFontBytesFromPath(Ljava/lang/String;)[B
    .locals 6
    .param p0, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 517
    new-instance v0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    new-instance v1, Lcom/itextpdf/io/source/RandomAccessSourceFactory;

    invoke-direct {v1}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;-><init>()V

    invoke-virtual {v1, p0}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createBestSource(Ljava/lang/String;)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    .line 518
    .local v0, "raf":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->length()J

    move-result-wide v1

    long-to-int v1, v1

    .line 519
    .local v1, "bufLen":I
    int-to-long v2, v1

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->length()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-ltz v2, :cond_0

    .line 522
    new-array v2, v1, [B

    .line 523
    .local v2, "buf":[B
    invoke-virtual {v0, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readFully([B)V

    .line 524
    return-object v2

    .line 520
    .end local v2    # "buf":[B
    :cond_0
    new-instance v2, Lcom/itextpdf/io/exceptions/IOException;

    const-string v3, "Source data from \"{0}\" is bigger than byte array can hold."

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static registerFont(Ljava/lang/String;)V
    .locals 1
    .param p0, "path"    # Ljava/lang/String;

    .line 423
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/itextpdf/io/font/FontProgramFactory;->registerFont(Ljava/lang/String;Ljava/lang/String;)V

    .line 424
    return-void
.end method

.method public static registerFont(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "path"    # Ljava/lang/String;
    .param p1, "alias"    # Ljava/lang/String;

    .line 433
    sget-object v0, Lcom/itextpdf/io/font/FontProgramFactory;->fontRegisterProvider:Lcom/itextpdf/io/font/FontRegisterProvider;

    invoke-virtual {v0, p0, p1}, Lcom/itextpdf/io/font/FontRegisterProvider;->registerFont(Ljava/lang/String;Ljava/lang/String;)V

    .line 434
    return-void
.end method

.method public static registerFontDirectory(Ljava/lang/String;)I
    .locals 1
    .param p0, "dir"    # Ljava/lang/String;

    .line 443
    sget-object v0, Lcom/itextpdf/io/font/FontProgramFactory;->fontRegisterProvider:Lcom/itextpdf/io/font/FontRegisterProvider;

    invoke-virtual {v0, p0}, Lcom/itextpdf/io/font/FontRegisterProvider;->registerFontDirectory(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static registerFontFamily(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "familyName"    # Ljava/lang/String;
    .param p1, "fullName"    # Ljava/lang/String;
    .param p2, "path"    # Ljava/lang/String;

    .line 412
    sget-object v0, Lcom/itextpdf/io/font/FontProgramFactory;->fontRegisterProvider:Lcom/itextpdf/io/font/FontRegisterProvider;

    invoke-virtual {v0, p0, p1, p2}, Lcom/itextpdf/io/font/FontRegisterProvider;->registerFontFamily(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 413
    return-void
.end method

.method public static registerSystemFontDirectories()I
    .locals 1

    .line 453
    sget-object v0, Lcom/itextpdf/io/font/FontProgramFactory;->fontRegisterProvider:Lcom/itextpdf/io/font/FontRegisterProvider;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontRegisterProvider;->registerSystemFontDirectories()I

    move-result v0

    return v0
.end method
