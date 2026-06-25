.class public final Lcom/itextpdf/io/font/FontProgramDescriptorFactory;
.super Ljava/lang/Object;
.source "FontProgramDescriptorFactory.java"


# static fields
.field private static FETCH_CACHED_FIRST:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 30
    const/4 v0, 0x1

    sput-boolean v0, Lcom/itextpdf/io/font/FontProgramDescriptorFactory;->FETCH_CACHED_FIRST:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static fetchCachedDescriptor(Ljava/lang/String;[B)Lcom/itextpdf/io/font/FontProgramDescriptor;
    .locals 3
    .param p0, "fontName"    # Ljava/lang/String;
    .param p1, "fontProgram"    # [B

    .line 109
    if-eqz p0, :cond_0

    .line 110
    invoke-static {p0}, Lcom/itextpdf/io/font/FontCacheKey;->create(Ljava/lang/String;)Lcom/itextpdf/io/font/FontCacheKey;

    move-result-object v0

    .local v0, "key":Lcom/itextpdf/io/font/FontCacheKey;
    goto :goto_0

    .line 112
    .end local v0    # "key":Lcom/itextpdf/io/font/FontCacheKey;
    :cond_0
    invoke-static {p1}, Lcom/itextpdf/io/font/FontCacheKey;->create([B)Lcom/itextpdf/io/font/FontCacheKey;

    move-result-object v0

    .line 114
    .restart local v0    # "key":Lcom/itextpdf/io/font/FontCacheKey;
    :goto_0
    invoke-static {v0}, Lcom/itextpdf/io/font/FontCache;->getFont(Lcom/itextpdf/io/font/FontCacheKey;)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v1

    .line 115
    .local v1, "fontFound":Lcom/itextpdf/io/font/FontProgram;
    if-eqz v1, :cond_1

    invoke-static {v1}, Lcom/itextpdf/io/font/FontProgramDescriptorFactory;->fetchDescriptorFromFontProgram(Lcom/itextpdf/io/font/FontProgram;)Lcom/itextpdf/io/font/FontProgramDescriptor;

    move-result-object v2

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    :goto_1
    return-object v2
.end method

.method private static fetchCidFontDescriptor(Ljava/lang/String;)Lcom/itextpdf/io/font/FontProgramDescriptor;
    .locals 4
    .param p0, "fontName"    # Ljava/lang/String;

    .line 164
    new-instance v0, Lcom/itextpdf/io/font/CidFont;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1, v1}, Lcom/itextpdf/io/font/CidFont;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;)V

    .line 165
    .local v0, "font":Lcom/itextpdf/io/font/CidFont;
    new-instance v1, Lcom/itextpdf/io/font/FontProgramDescriptor;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/CidFont;->getFontNames()Lcom/itextpdf/io/font/FontNames;

    move-result-object v2

    invoke-virtual {v0}, Lcom/itextpdf/io/font/CidFont;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/io/font/FontProgramDescriptor;-><init>(Lcom/itextpdf/io/font/FontNames;Lcom/itextpdf/io/font/FontMetrics;)V

    return-object v1
.end method

.method public static fetchDescriptor(Lcom/itextpdf/io/font/FontProgram;)Lcom/itextpdf/io/font/FontProgramDescriptor;
    .locals 1
    .param p0, "fontProgram"    # Lcom/itextpdf/io/font/FontProgram;

    .line 103
    invoke-static {p0}, Lcom/itextpdf/io/font/FontProgramDescriptorFactory;->fetchDescriptorFromFontProgram(Lcom/itextpdf/io/font/FontProgram;)Lcom/itextpdf/io/font/FontProgramDescriptor;

    move-result-object v0

    return-object v0
.end method

.method public static fetchDescriptor(Ljava/lang/String;)Lcom/itextpdf/io/font/FontProgramDescriptor;
    .locals 8
    .param p0, "fontName"    # Ljava/lang/String;

    .line 33
    const-string v0, ".woff"

    const/4 v1, 0x0

    if-eqz p0, :cond_b

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_0

    goto/16 :goto_7

    .line 37
    :cond_0
    invoke-static {p0}, Lcom/itextpdf/io/font/FontProgram;->trimFontStyle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 39
    .local v2, "baseName":Ljava/lang/String;
    invoke-static {p0}, Lcom/itextpdf/io/font/constants/StandardFonts;->isStandardFont(Ljava/lang/String;)Z

    move-result v3

    .line 40
    .local v3, "isBuiltinFonts14":Z
    if-nez v3, :cond_1

    invoke-static {v2}, Lcom/itextpdf/io/font/CjkResourceLoader;->isPredefinedCidFont(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    const/4 v4, 0x1

    goto :goto_0

    :cond_1
    const/4 v4, 0x0

    .line 42
    .local v4, "isCidFont":Z
    :goto_0
    const/4 v5, 0x0

    .line 43
    .local v5, "fontDescriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    sget-boolean v6, Lcom/itextpdf/io/font/FontProgramDescriptorFactory;->FETCH_CACHED_FIRST:Z

    if-eqz v6, :cond_2

    .line 44
    invoke-static {p0, v1}, Lcom/itextpdf/io/font/FontProgramDescriptorFactory;->fetchCachedDescriptor(Ljava/lang/String;[B)Lcom/itextpdf/io/font/FontProgramDescriptor;

    move-result-object v5

    .line 45
    if-eqz v5, :cond_2

    .line 46
    return-object v5

    .line 51
    :cond_2
    :try_start_0
    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    .line 52
    .local v6, "fontNameLowerCase":Ljava/lang/String;
    if-nez v3, :cond_a

    const-string v7, ".afm"

    invoke-virtual {v6, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_a

    const-string v7, ".pfm"

    invoke-virtual {v6, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    goto :goto_4

    .line 54
    :cond_3
    if-eqz v4, :cond_4

    .line 55
    invoke-static {p0}, Lcom/itextpdf/io/font/FontProgramDescriptorFactory;->fetchCidFontDescriptor(Ljava/lang/String;)Lcom/itextpdf/io/font/FontProgramDescriptor;

    move-result-object v0

    .end local v5    # "fontDescriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    .local v0, "fontDescriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    goto :goto_5

    .line 56
    .end local v0    # "fontDescriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    .restart local v5    # "fontDescriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    :cond_4
    const-string v1, ".ttf"

    invoke-virtual {v6, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_9

    const-string v1, ".otf"

    invoke-virtual {v6, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    goto :goto_3

    .line 58
    :cond_5
    invoke-virtual {v6, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_7

    const-string v1, ".woff2"

    invoke-virtual {v6, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    goto :goto_1

    .line 67
    :cond_6
    invoke-static {v2}, Lcom/itextpdf/io/font/FontProgramDescriptorFactory;->fetchTTCDescriptor(Ljava/lang/String;)Lcom/itextpdf/io/font/FontProgramDescriptor;

    move-result-object v0

    .end local v5    # "fontDescriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    .restart local v0    # "fontDescriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    goto :goto_5

    .line 60
    .end local v0    # "fontDescriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    .restart local v5    # "fontDescriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    :cond_7
    :goto_1
    invoke-virtual {v6, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 61
    invoke-static {v2}, Lcom/itextpdf/io/font/FontProgramFactory;->readFontBytesFromPath(Ljava/lang/String;)[B

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/io/font/WoffConverter;->convert([B)[B

    move-result-object v0

    .local v0, "fontProgram":[B
    goto :goto_2

    .line 63
    .end local v0    # "fontProgram":[B
    :cond_8
    invoke-static {v2}, Lcom/itextpdf/io/font/FontProgramFactory;->readFontBytesFromPath(Ljava/lang/String;)[B

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/io/font/woff2/Woff2Converter;->convert([B)[B

    move-result-object v0

    .line 65
    .restart local v0    # "fontProgram":[B
    :goto_2
    invoke-static {v0}, Lcom/itextpdf/io/font/FontProgramDescriptorFactory;->fetchTrueTypeFontDescriptor([B)Lcom/itextpdf/io/font/FontProgramDescriptor;

    move-result-object v1

    move-object v0, v1

    .line 66
    .end local v5    # "fontDescriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    .local v0, "fontDescriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    goto :goto_5

    .line 57
    .end local v0    # "fontDescriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    .restart local v5    # "fontDescriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    :cond_9
    :goto_3
    invoke-static {p0}, Lcom/itextpdf/io/font/FontProgramDescriptorFactory;->fetchTrueTypeFontDescriptor(Ljava/lang/String;)Lcom/itextpdf/io/font/FontProgramDescriptor;

    move-result-object v0

    .end local v5    # "fontDescriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    .restart local v0    # "fontDescriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    goto :goto_5

    .line 53
    .end local v0    # "fontDescriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    .restart local v5    # "fontDescriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    :cond_a
    :goto_4
    invoke-static {p0, v1}, Lcom/itextpdf/io/font/FontProgramDescriptorFactory;->fetchType1FontDescriptor(Ljava/lang/String;[B)Lcom/itextpdf/io/font/FontProgramDescriptor;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    .end local v5    # "fontDescriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    .end local v6    # "fontNameLowerCase":Ljava/lang/String;
    .restart local v0    # "fontDescriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    :goto_5
    goto :goto_6

    .line 69
    .end local v0    # "fontDescriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    .restart local v5    # "fontDescriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    :catch_0
    move-exception v0

    .line 70
    .local v0, "ignored":Ljava/lang/Exception;
    const/4 v1, 0x0

    move-object v0, v1

    .line 73
    .end local v5    # "fontDescriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    .local v0, "fontDescriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    :goto_6
    return-object v0

    .line 34
    .end local v0    # "fontDescriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    .end local v2    # "baseName":Ljava/lang/String;
    .end local v3    # "isBuiltinFonts14":Z
    .end local v4    # "isCidFont":Z
    :cond_b
    :goto_7
    return-object v1
.end method

.method public static fetchDescriptor([B)Lcom/itextpdf/io/font/FontProgramDescriptor;
    .locals 3
    .param p0, "fontProgram"    # [B

    .line 77
    const/4 v0, 0x0

    if-eqz p0, :cond_3

    array-length v1, p0

    if-nez v1, :cond_0

    goto :goto_2

    .line 81
    :cond_0
    const/4 v1, 0x0

    .line 82
    .local v1, "fontDescriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    sget-boolean v2, Lcom/itextpdf/io/font/FontProgramDescriptorFactory;->FETCH_CACHED_FIRST:Z

    if-eqz v2, :cond_1

    .line 83
    invoke-static {v0, p0}, Lcom/itextpdf/io/font/FontProgramDescriptorFactory;->fetchCachedDescriptor(Ljava/lang/String;[B)Lcom/itextpdf/io/font/FontProgramDescriptor;

    move-result-object v1

    .line 84
    if-eqz v1, :cond_1

    .line 85
    return-object v1

    .line 90
    :cond_1
    :try_start_0
    invoke-static {p0}, Lcom/itextpdf/io/font/FontProgramDescriptorFactory;->fetchTrueTypeFontDescriptor([B)Lcom/itextpdf/io/font/FontProgramDescriptor;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v1, v2

    .line 92
    goto :goto_0

    .line 91
    :catch_0
    move-exception v2

    .line 93
    :goto_0
    if-nez v1, :cond_2

    .line 95
    :try_start_1
    invoke-static {v0, p0}, Lcom/itextpdf/io/font/FontProgramDescriptorFactory;->fetchType1FontDescriptor(Ljava/lang/String;[B)Lcom/itextpdf/io/font/FontProgramDescriptor;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-object v1, v0

    .line 97
    goto :goto_1

    .line 96
    :catch_1
    move-exception v0

    .line 99
    :cond_2
    :goto_1
    return-object v1

    .line 78
    .end local v1    # "fontDescriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    :cond_3
    :goto_2
    return-object v0
.end method

.method private static fetchDescriptorFromFontProgram(Lcom/itextpdf/io/font/FontProgram;)Lcom/itextpdf/io/font/FontProgramDescriptor;
    .locals 3
    .param p0, "fontProgram"    # Lcom/itextpdf/io/font/FontProgram;

    .line 169
    new-instance v0, Lcom/itextpdf/io/font/FontProgramDescriptor;

    invoke-virtual {p0}, Lcom/itextpdf/io/font/FontProgram;->getFontNames()Lcom/itextpdf/io/font/FontNames;

    move-result-object v1

    invoke-virtual {p0}, Lcom/itextpdf/io/font/FontProgram;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/io/font/FontProgramDescriptor;-><init>(Lcom/itextpdf/io/font/FontNames;Lcom/itextpdf/io/font/FontMetrics;)V

    return-object v0
.end method

.method private static fetchOpenTypeFontDescriptor(Lcom/itextpdf/io/font/OpenTypeParser;)Lcom/itextpdf/io/font/FontProgramDescriptor;
    .locals 4
    .param p0, "fontParser"    # Lcom/itextpdf/io/font/OpenTypeParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 153
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/itextpdf/io/font/OpenTypeParser;->loadTables(Z)V

    .line 154
    new-instance v0, Lcom/itextpdf/io/font/FontProgramDescriptor;

    invoke-virtual {p0}, Lcom/itextpdf/io/font/OpenTypeParser;->getFontNames()Lcom/itextpdf/io/font/FontNames;

    move-result-object v1

    invoke-virtual {p0}, Lcom/itextpdf/io/font/OpenTypeParser;->getPostTable()Lcom/itextpdf/io/font/OpenTypeParser$PostTable;

    move-result-object v2

    iget v2, v2, Lcom/itextpdf/io/font/OpenTypeParser$PostTable;->italicAngle:F

    .line 155
    invoke-virtual {p0}, Lcom/itextpdf/io/font/OpenTypeParser;->getPostTable()Lcom/itextpdf/io/font/OpenTypeParser$PostTable;

    move-result-object v3

    iget-boolean v3, v3, Lcom/itextpdf/io/font/OpenTypeParser$PostTable;->isFixedPitch:Z

    invoke-direct {v0, v1, v2, v3}, Lcom/itextpdf/io/font/FontProgramDescriptor;-><init>(Lcom/itextpdf/io/font/FontNames;FZ)V

    .line 154
    return-object v0
.end method

.method private static fetchTTCDescriptor(Ljava/lang/String;)Lcom/itextpdf/io/font/FontProgramDescriptor;
    .locals 5
    .param p0, "baseName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 119
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, ".ttc,"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 120
    .local v0, "ttcSplit":I
    if-lez v0, :cond_0

    .line 125
    add-int/lit8 v1, v0, 0x4

    const/4 v2, 0x0

    :try_start_0
    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 127
    .local v1, "ttcName":Ljava/lang/String;
    add-int/lit8 v2, v0, 0x5

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 130
    .local v2, "ttcIndex":I
    nop

    .line 131
    new-instance v3, Lcom/itextpdf/io/font/OpenTypeParser;

    invoke-direct {v3, v1, v2}, Lcom/itextpdf/io/font/OpenTypeParser;-><init>(Ljava/lang/String;I)V

    .line 132
    .local v3, "parser":Lcom/itextpdf/io/font/OpenTypeParser;
    invoke-static {v3}, Lcom/itextpdf/io/font/FontProgramDescriptorFactory;->fetchOpenTypeFontDescriptor(Lcom/itextpdf/io/font/OpenTypeParser;)Lcom/itextpdf/io/font/FontProgramDescriptor;

    move-result-object v4

    .line 133
    .local v4, "descriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    invoke-virtual {v3}, Lcom/itextpdf/io/font/OpenTypeParser;->close()V

    .line 134
    return-object v4

    .line 128
    .end local v1    # "ttcName":Ljava/lang/String;
    .end local v2    # "ttcIndex":I
    .end local v3    # "parser":Lcom/itextpdf/io/font/OpenTypeParser;
    .end local v4    # "descriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    :catch_0
    move-exception v1

    .line 129
    .local v1, "nfe":Ljava/lang/NumberFormatException;
    new-instance v2, Lcom/itextpdf/io/exceptions/IOException;

    invoke-virtual {v1}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 136
    .end local v1    # "nfe":Ljava/lang/NumberFormatException;
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method private static fetchTrueTypeFontDescriptor(Ljava/lang/String;)Lcom/itextpdf/io/font/FontProgramDescriptor;
    .locals 4
    .param p0, "fontName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 141
    new-instance v0, Lcom/itextpdf/io/font/OpenTypeParser;

    invoke-direct {v0, p0}, Lcom/itextpdf/io/font/OpenTypeParser;-><init>(Ljava/lang/String;)V

    .line 142
    .local v0, "parser":Lcom/itextpdf/io/font/OpenTypeParser;
    :try_start_0
    invoke-static {v0}, Lcom/itextpdf/io/font/FontProgramDescriptorFactory;->fetchOpenTypeFontDescriptor(Lcom/itextpdf/io/font/OpenTypeParser;)Lcom/itextpdf/io/font/FontProgramDescriptor;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 143
    invoke-virtual {v0}, Lcom/itextpdf/io/font/OpenTypeParser;->close()V

    .line 142
    return-object v1

    .line 141
    :catchall_0
    move-exception v1

    .end local v0    # "parser":Lcom/itextpdf/io/font/OpenTypeParser;
    .end local p0    # "fontName":Ljava/lang/String;
    :try_start_1
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 143
    .restart local v0    # "parser":Lcom/itextpdf/io/font/OpenTypeParser;
    .restart local p0    # "fontName":Ljava/lang/String;
    :catchall_1
    move-exception v2

    :try_start_2
    invoke-virtual {v0}, Lcom/itextpdf/io/font/OpenTypeParser;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_0

    :catchall_2
    move-exception v3

    invoke-virtual {v1, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_0
    throw v2
.end method

.method private static fetchTrueTypeFontDescriptor([B)Lcom/itextpdf/io/font/FontProgramDescriptor;
    .locals 4
    .param p0, "fontProgram"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 147
    new-instance v0, Lcom/itextpdf/io/font/OpenTypeParser;

    invoke-direct {v0, p0}, Lcom/itextpdf/io/font/OpenTypeParser;-><init>([B)V

    .line 148
    .local v0, "parser":Lcom/itextpdf/io/font/OpenTypeParser;
    :try_start_0
    invoke-static {v0}, Lcom/itextpdf/io/font/FontProgramDescriptorFactory;->fetchOpenTypeFontDescriptor(Lcom/itextpdf/io/font/OpenTypeParser;)Lcom/itextpdf/io/font/FontProgramDescriptor;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 149
    invoke-virtual {v0}, Lcom/itextpdf/io/font/OpenTypeParser;->close()V

    .line 148
    return-object v1

    .line 147
    :catchall_0
    move-exception v1

    .end local v0    # "parser":Lcom/itextpdf/io/font/OpenTypeParser;
    .end local p0    # "fontProgram":[B
    :try_start_1
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 149
    .restart local v0    # "parser":Lcom/itextpdf/io/font/OpenTypeParser;
    .restart local p0    # "fontProgram":[B
    :catchall_1
    move-exception v2

    :try_start_2
    invoke-virtual {v0}, Lcom/itextpdf/io/font/OpenTypeParser;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_0

    :catchall_2
    move-exception v3

    invoke-virtual {v1, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_0
    throw v2
.end method

.method private static fetchType1FontDescriptor(Ljava/lang/String;[B)Lcom/itextpdf/io/font/FontProgramDescriptor;
    .locals 4
    .param p0, "fontName"    # Ljava/lang/String;
    .param p1, "afm"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 159
    new-instance v0, Lcom/itextpdf/io/font/Type1Font;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1, p1, v1}, Lcom/itextpdf/io/font/Type1Font;-><init>(Ljava/lang/String;Ljava/lang/String;[B[B)V

    .line 160
    .local v0, "fp":Lcom/itextpdf/io/font/Type1Font;
    new-instance v1, Lcom/itextpdf/io/font/FontProgramDescriptor;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/Type1Font;->getFontNames()Lcom/itextpdf/io/font/FontNames;

    move-result-object v2

    invoke-virtual {v0}, Lcom/itextpdf/io/font/Type1Font;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/io/font/FontProgramDescriptor;-><init>(Lcom/itextpdf/io/font/FontNames;Lcom/itextpdf/io/font/FontMetrics;)V

    return-object v1
.end method
