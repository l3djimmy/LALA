.class Lcom/itextpdf/io/font/FontRegisterProvider;
.super Ljava/lang/Object;
.source "FontRegisterProvider.java"


# static fields
.field private static final LOGGER:Lorg/slf4j/Logger;


# instance fields
.field private final fontFamilies:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private final fontNames:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 47
    const-class v0, Lcom/itextpdf/io/font/FontRegisterProvider;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/io/font/FontRegisterProvider;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontNames:Ljava/util/Map;

    .line 56
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontFamilies:Ljava/util/Map;

    .line 62
    invoke-virtual {p0}, Lcom/itextpdf/io/font/FontRegisterProvider;->registerStandardFonts()V

    .line 63
    invoke-virtual {p0}, Lcom/itextpdf/io/font/FontRegisterProvider;->registerStandardFontFamilies()V

    .line 64
    return-void
.end method


# virtual methods
.method public clearRegisteredFontFamilies()V
    .locals 1

    .line 400
    iget-object v0, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontFamilies:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 401
    invoke-virtual {p0}, Lcom/itextpdf/io/font/FontRegisterProvider;->registerStandardFontFamilies()V

    .line 402
    return-void
.end method

.method public clearRegisteredFonts()V
    .locals 1

    .line 395
    iget-object v0, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontNames:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 396
    invoke-virtual {p0}, Lcom/itextpdf/io/font/FontRegisterProvider;->registerStandardFonts()V

    .line 397
    return-void
.end method

.method getFont(Ljava/lang/String;I)Lcom/itextpdf/io/font/FontProgram;
    .locals 1
    .param p1, "fontName"    # Ljava/lang/String;
    .param p2, "style"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 74
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/io/font/FontRegisterProvider;->getFont(Ljava/lang/String;IZ)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    return-object v0
.end method

.method getFont(Ljava/lang/String;IZ)Lcom/itextpdf/io/font/FontProgram;
    .locals 8
    .param p1, "fontName"    # Ljava/lang/String;
    .param p2, "style"    # I
    .param p3, "cached"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 88
    if-nez p1, :cond_0

    .line 89
    const/4 v0, 0x0

    return-object v0

    .line 90
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 91
    .local v0, "lowerCaseFontName":Ljava/lang/String;
    const-string v1, "Times-Roman"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    .line 92
    iget-object v2, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontFamilies:Ljava/util/Map;

    .line 91
    if-nez v1, :cond_1

    .line 92
    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0

    :cond_1
    const-string v1, "Times"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    :goto_0
    check-cast v1, Ljava/util/List;

    .line 93
    .local v1, "family":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v1, :cond_8

    .line 94
    monitor-enter v1

    .line 96
    const/4 v2, -0x1

    if-ne p2, v2, :cond_2

    const/4 v2, 0x0

    goto :goto_1

    :cond_2
    move v2, p2

    .line 97
    .local v2, "s":I
    :goto_1
    :try_start_0
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 98
    .local v4, "f":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    .line 99
    .local v5, "lcf":Ljava/lang/String;
    const/4 v6, 0x0

    .line 100
    .local v6, "fs":I
    const-string v7, "bold"

    invoke-virtual {v5, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_3

    or-int/lit8 v6, v6, 0x1

    .line 101
    :cond_3
    const-string v7, "italic"

    invoke-virtual {v5, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_4

    const-string/jumbo v7, "oblique"

    invoke-virtual {v5, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_5

    :cond_4
    or-int/lit8 v6, v6, 0x2

    .line 102
    :cond_5
    and-int/lit8 v7, v2, 0x3

    if-ne v7, v6, :cond_6

    .line 103
    move-object p1, v4

    .line 104
    goto :goto_3

    .line 106
    .end local v4    # "f":Ljava/lang/String;
    .end local v5    # "lcf":Ljava/lang/String;
    .end local v6    # "fs":I
    :cond_6
    goto :goto_2

    .line 107
    .end local v2    # "s":I
    :cond_7
    :goto_3
    monitor-exit v1

    goto :goto_4

    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 109
    :cond_8
    :goto_4
    invoke-virtual {p0, p1, p3}, Lcom/itextpdf/io/font/FontRegisterProvider;->getFontProgram(Ljava/lang/String;Z)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v2

    return-object v2
.end method

.method protected getFontProgram(Ljava/lang/String;Z)Lcom/itextpdf/io/font/FontProgram;
    .locals 3
    .param p1, "fontName"    # Ljava/lang/String;
    .param p2, "cached"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 158
    const/4 v0, 0x0

    .line 159
    .local v0, "fontProgram":Lcom/itextpdf/io/font/FontProgram;
    iget-object v1, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontNames:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object p1, v1

    check-cast p1, Ljava/lang/String;

    .line 160
    if-eqz p1, :cond_0

    .line 161
    invoke-static {p1, p2}, Lcom/itextpdf/io/font/FontProgramFactory;->createFont(Ljava/lang/String;Z)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    .line 163
    :cond_0
    return-object v0
.end method

.method getRegisteredFontFamilies()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 381
    iget-object v0, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontFamilies:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method getRegisteredFonts()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 372
    iget-object v0, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontNames:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method isRegisteredFont(Ljava/lang/String;)Z
    .locals 2
    .param p1, "fontname"    # Ljava/lang/String;

    .line 391
    iget-object v0, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontNames:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method registerFont(Ljava/lang/String;)V
    .locals 1
    .param p1, "path"    # Ljava/lang/String;

    .line 216
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/io/font/FontRegisterProvider;->registerFont(Ljava/lang/String;Ljava/lang/String;)V

    .line 217
    return-void
.end method

.method registerFont(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "alias"    # Ljava/lang/String;

    .line 227
    const-string v0, ","

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string v2, ".ttf"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_5

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string v3, ".otf"

    invoke-virtual {v1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_5

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string v3, ".ttc,"

    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-lez v1, :cond_0

    goto/16 :goto_2

    .line 252
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string v3, ".ttc"

    invoke-virtual {v1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 253
    new-instance v1, Lcom/itextpdf/io/font/TrueTypeCollection;

    invoke-direct {v1, p1}, Lcom/itextpdf/io/font/TrueTypeCollection;-><init>(Ljava/lang/String;)V

    .line 254
    .local v1, "ttc":Lcom/itextpdf/io/font/TrueTypeCollection;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v1}, Lcom/itextpdf/io/font/TrueTypeCollection;->getTTCSize()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 255
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 256
    .local v3, "fullPath":Ljava/lang/String;
    if-eqz p2, :cond_1

    .line 257
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lcom/itextpdf/io/font/FontRegisterProvider;->registerFont(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 259
    :cond_1
    invoke-virtual {p0, v3}, Lcom/itextpdf/io/font/FontRegisterProvider;->registerFont(Ljava/lang/String;)V

    .line 254
    .end local v3    # "fullPath":Ljava/lang/String;
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 262
    .end local v1    # "ttc":Lcom/itextpdf/io/font/TrueTypeCollection;
    .end local v2    # "i":I
    :cond_2
    goto/16 :goto_5

    :cond_3
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, ".afm"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, ".pfm"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 263
    :cond_4
    invoke-static {p1}, Lcom/itextpdf/io/font/FontProgramDescriptorFactory;->fetchDescriptor(Ljava/lang/String;)Lcom/itextpdf/io/font/FontProgramDescriptor;

    move-result-object v0

    .line 264
    .local v0, "descriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontProgramDescriptor;->getFamilyNameLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontProgramDescriptor;->getFullNameLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v1, v3, v2}, Lcom/itextpdf/io/font/FontRegisterProvider;->registerFontFamily(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 265
    iget-object v1, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontNames:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontProgramDescriptor;->getFontNameLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    iget-object v1, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontNames:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontProgramDescriptor;->getFullNameLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_5

    .line 228
    .end local v0    # "descriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    :cond_5
    :goto_2
    invoke-static {p1}, Lcom/itextpdf/io/font/FontProgramDescriptorFactory;->fetchDescriptor(Ljava/lang/String;)Lcom/itextpdf/io/font/FontProgramDescriptor;

    move-result-object v0

    .line 229
    .restart local v0    # "descriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    iget-object v1, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontNames:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontProgramDescriptor;->getFontNameLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 230
    const-string/jumbo v1, "regular"

    if-eqz p2, :cond_6

    .line 231
    :try_start_1
    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    .line 232
    .local v3, "lcAlias":Ljava/lang/String;
    iget-object v4, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontNames:Ljava/util/Map;

    invoke-interface {v4, v3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 233
    invoke-virtual {v3, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 235
    invoke-virtual {p0, v3, p1}, Lcom/itextpdf/io/font/FontRegisterProvider;->saveCopyOfRegularFont(Ljava/lang/String;Ljava/lang/String;)Z

    .line 239
    .end local v3    # "lcAlias":Ljava/lang/String;
    :cond_6
    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontProgramDescriptor;->getFullNameAllLangs()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 240
    .local v4, "name":Ljava/lang/String;
    iget-object v5, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontNames:Ljava/util/Map;

    invoke-interface {v5, v4, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    invoke-virtual {v4, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 243
    invoke-virtual {p0, v4, p1}, Lcom/itextpdf/io/font/FontRegisterProvider;->saveCopyOfRegularFont(Ljava/lang/String;Ljava/lang/String;)Z

    .line 245
    .end local v4    # "name":Ljava/lang/String;
    :cond_7
    goto :goto_3

    .line 247
    :cond_8
    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontProgramDescriptor;->getFamilyNameEnglishOpenType()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_9

    .line 248
    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontProgramDescriptor;->getFullNamesEnglishOpenType()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_9

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 249
    .local v3, "fullName":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontProgramDescriptor;->getFamilyNameEnglishOpenType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, v3, v2}, Lcom/itextpdf/io/font/FontRegisterProvider;->registerFontFamily(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .end local v3    # "fullName":Ljava/lang/String;
    goto :goto_4

    .line 252
    .end local v0    # "descriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    :cond_9
    nop

    .line 268
    :goto_5
    sget-object v0, Lcom/itextpdf/io/font/FontRegisterProvider;->LOGGER:Lorg/slf4j/Logger;

    const-string v1, "Registered {0}"

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->trace(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 271
    nop

    .line 272
    return-void

    .line 269
    :catch_0
    move-exception v0

    .line 270
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    invoke-direct {v1, v0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method registerFontDirectory(Ljava/lang/String;)I
    .locals 1
    .param p1, "dir"    # Ljava/lang/String;

    .line 294
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/io/font/FontRegisterProvider;->registerFontDirectory(Ljava/lang/String;Z)I

    move-result v0

    return v0
.end method

.method registerFontDirectory(Ljava/lang/String;Z)I
    .locals 11
    .param p1, "dir"    # Ljava/lang/String;
    .param p2, "scanSubdirectories"    # Z

    .line 305
    sget-object v0, Lcom/itextpdf/io/font/FontRegisterProvider;->LOGGER:Lorg/slf4j/Logger;

    const-string v1, "Registering directory {0}, looking for fonts"

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    .line 306
    const/4 v0, 0x0

    .line 308
    .local v0, "count":I
    :try_start_0
    invoke-static {p1, p2}, Lcom/itextpdf/commons/utils/FileUtil;->listFilesInDirectory(Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v1

    .line 309
    .local v1, "files":[Ljava/lang/String;
    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 310
    return v2

    .line 311
    :cond_0
    array-length v3, v1

    move v4, v2

    :goto_0
    if-ge v4, v3, :cond_6

    aget-object v5, v1, v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 313
    .local v5, "file":Ljava/lang/String;
    :try_start_1
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    const/4 v7, 0x0

    const/4 v8, 0x4

    if-ge v6, v8, :cond_1

    move-object v6, v7

    goto :goto_1

    :cond_1
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    sub-int/2addr v6, v8

    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    .line 314
    .local v6, "suffix":Ljava/lang/String;
    :goto_1
    const-string v9, ".afm"

    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_4

    const-string v9, ".pfm"

    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    goto :goto_2

    .line 321
    :cond_2
    const-string v8, ".ttf"

    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_3

    const-string v8, ".otf"

    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_3

    const-string v8, ".ttc"

    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 322
    :cond_3
    invoke-virtual {p0, v5, v7}, Lcom/itextpdf/io/font/FontRegisterProvider;->registerFont(Ljava/lang/String;Ljava/lang/String;)V

    .line 323
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 316
    :cond_4
    :goto_2
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v10

    sub-int/2addr v10, v8

    invoke-virtual {v5, v2, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ".pfb"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 317
    .local v8, "pfb":Ljava/lang/String;
    invoke-static {v8}, Lcom/itextpdf/commons/utils/FileUtil;->fileExists(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 318
    invoke-virtual {p0, v5, v7}, Lcom/itextpdf/io/font/FontRegisterProvider;->registerFont(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 319
    add-int/lit8 v0, v0, 0x1

    .line 321
    .end local v8    # "pfb":Ljava/lang/String;
    :cond_5
    nop

    .line 327
    .end local v6    # "suffix":Ljava/lang/String;
    :goto_3
    goto :goto_4

    .line 325
    :catch_0
    move-exception v6

    .line 311
    .end local v5    # "file":Ljava/lang/String;
    :goto_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 331
    .end local v1    # "files":[Ljava/lang/String;
    :cond_6
    goto :goto_5

    .line 329
    :catch_1
    move-exception v1

    .line 332
    :goto_5
    return v0
.end method

.method registerFontFamily(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "familyName"    # Ljava/lang/String;
    .param p2, "fullName"    # Ljava/lang/String;
    .param p3, "path"    # Ljava/lang/String;

    .line 174
    if-eqz p3, :cond_0

    .line 175
    iget-object v0, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontNames:Ljava/util/Map;

    invoke-interface {v0, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontFamilies:Ljava/util/Map;

    monitor-enter v0

    .line 178
    :try_start_0
    iget-object v1, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontFamilies:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 179
    .local v1, "family":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez v1, :cond_1

    .line 180
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    move-object v1, v2

    .line 181
    iget-object v2, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontFamilies:Ljava/util/Map;

    invoke-interface {v2, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 184
    monitor-enter v1

    .line 185
    :try_start_1
    invoke-interface {v1, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 186
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    .line 187
    .local v0, "fullNameLength":I
    const/4 v2, 0x0

    .line 188
    .local v2, "inserted":Z
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_3

    .line 189
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lt v4, v0, :cond_2

    .line 190
    invoke-interface {v1, v3, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 191
    const/4 v2, 0x1

    .line 192
    goto :goto_1

    .line 188
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 195
    .end local v3    # "j":I
    :cond_3
    :goto_1
    if-nez v2, :cond_4

    .line 196
    invoke-interface {v1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 197
    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    .line 198
    .local v3, "newFullName":Ljava/lang/String;
    const-string/jumbo v4, "regular"

    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 200
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x7

    const/4 v5, 0x0

    invoke-virtual {v3, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 202
    .end local v3    # "newFullName":Ljava/lang/String;
    .local v4, "newFullName":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p2, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v5, v3}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 206
    .end local v0    # "fullNameLength":I
    .end local v2    # "inserted":Z
    .end local v4    # "newFullName":Ljava/lang/String;
    :cond_4
    monitor-exit v1

    .line 207
    return-void

    .line 206
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 183
    .end local v1    # "family":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catchall_1
    move-exception v1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v1
.end method

.method protected registerStandardFontFamilies()V
    .locals 3

    .line 131
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 132
    .local v0, "family":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v1, "Courier"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 133
    const-string v2, "Courier-Bold"

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 134
    const-string v2, "Courier-Oblique"

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 135
    const-string v2, "Courier-BoldOblique"

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 136
    iget-object v2, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontFamilies:Ljava/util/Map;

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 138
    .end local v0    # "family":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local v1, "family":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v0, "Helvetica"

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 139
    const-string v2, "Helvetica-Bold"

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 140
    const-string v2, "Helvetica-Oblique"

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 141
    const-string v2, "Helvetica-BoldOblique"

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 142
    iget-object v2, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontFamilies:Ljava/util/Map;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 144
    .end local v1    # "family":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v0    # "family":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v1, "Symbol"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 145
    iget-object v2, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontFamilies:Ljava/util/Map;

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 147
    .end local v0    # "family":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v1    # "family":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v0, "Times-Roman"

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 148
    const-string v0, "Times-Bold"

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 149
    const-string v0, "Times-Italic"

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 150
    const-string v0, "Times-BoldItalic"

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 151
    iget-object v0, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontFamilies:Ljava/util/Map;

    const-string v2, "Times"

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 153
    .end local v1    # "family":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v0    # "family":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v1, "ZapfDingbats"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 154
    iget-object v2, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontFamilies:Ljava/util/Map;

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    return-void
.end method

.method protected registerStandardFonts()V
    .locals 3

    .line 113
    iget-object v0, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontNames:Ljava/util/Map;

    const-string v1, "Courier"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    iget-object v0, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontNames:Ljava/util/Map;

    const-string v1, "Courier-Bold"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    iget-object v0, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontNames:Ljava/util/Map;

    const-string v1, "Courier-Oblique"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    iget-object v0, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontNames:Ljava/util/Map;

    const-string v1, "Courier-BoldOblique"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    iget-object v0, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontNames:Ljava/util/Map;

    const-string v1, "Helvetica"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    iget-object v0, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontNames:Ljava/util/Map;

    const-string v1, "Helvetica-Bold"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    iget-object v0, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontNames:Ljava/util/Map;

    const-string v1, "Helvetica-Oblique"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    iget-object v0, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontNames:Ljava/util/Map;

    const-string v1, "Helvetica-BoldOblique"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    iget-object v0, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontNames:Ljava/util/Map;

    const-string v1, "Symbol"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    iget-object v0, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontNames:Ljava/util/Map;

    const-string v1, "Times-Roman"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    iget-object v0, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontNames:Ljava/util/Map;

    const-string v1, "Times-Bold"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    iget-object v0, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontNames:Ljava/util/Map;

    const-string v1, "Times-Italic"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    iget-object v0, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontNames:Ljava/util/Map;

    const-string v1, "Times-BoldItalic"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    iget-object v0, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontNames:Ljava/util/Map;

    const-string v1, "ZapfDingbats"

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    return-void
.end method

.method registerSystemFontDirectories()I
    .locals 9

    .line 342
    const/4 v0, 0x0

    .line 343
    .local v0, "count":I
    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/String;

    .line 344
    invoke-static {}, Lcom/itextpdf/commons/utils/FileUtil;->getFontsDir()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "/usr/share/X11/fonts"

    const/4 v4, 0x1

    aput-object v2, v1, v4

    const-string v2, "/usr/X/lib/X11/fonts"

    const/4 v5, 0x2

    aput-object v2, v1, v5

    const/4 v2, 0x3

    const-string v6, "/usr/openwin/lib/X11/fonts"

    aput-object v6, v1, v2

    const/4 v2, 0x4

    const-string v6, "/usr/share/fonts"

    aput-object v6, v1, v2

    const/4 v2, 0x5

    const-string v6, "/usr/X11R6/lib/X11/fonts"

    aput-object v6, v1, v2

    .line 351
    .local v1, "withSubDirs":[Ljava/lang/String;
    array-length v2, v1

    move v6, v3

    :goto_0
    if-ge v6, v2, :cond_0

    aget-object v7, v1, v6

    .line 352
    .local v7, "directory":Ljava/lang/String;
    invoke-virtual {p0, v7, v4}, Lcom/itextpdf/io/font/FontRegisterProvider;->registerFontDirectory(Ljava/lang/String;Z)I

    move-result v8

    add-int/2addr v0, v8

    .line 351
    .end local v7    # "directory":Ljava/lang/String;
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 355
    :cond_0
    new-array v2, v5, [Ljava/lang/String;

    const-string v5, "/Library/Fonts"

    aput-object v5, v2, v3

    const-string v5, "/System/Library/Fonts"

    aput-object v5, v2, v4

    .line 359
    .local v2, "withoutSubDirs":[Ljava/lang/String;
    array-length v4, v2

    move v5, v3

    :goto_1
    if-ge v5, v4, :cond_1

    aget-object v6, v2, v5

    .line 360
    .local v6, "directory":Ljava/lang/String;
    invoke-virtual {p0, v6, v3}, Lcom/itextpdf/io/font/FontRegisterProvider;->registerFontDirectory(Ljava/lang/String;Z)I

    move-result v7

    add-int/2addr v0, v7

    .line 359
    .end local v6    # "directory":Ljava/lang/String;
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 363
    :cond_1
    return v0
.end method

.method saveCopyOfRegularFont(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3
    .param p1, "regularFontName"    # Ljava/lang/String;
    .param p2, "path"    # Ljava/lang/String;

    .line 279
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x7

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 280
    .local v0, "alias":Ljava/lang/String;
    iget-object v2, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontNames:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 281
    iget-object v1, p0, Lcom/itextpdf/io/font/FontRegisterProvider;->fontNames:Ljava/util/Map;

    invoke-interface {v1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 282
    const/4 v1, 0x1

    return v1

    .line 284
    :cond_0
    return v1
.end method
