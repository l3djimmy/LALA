.class public Lcom/itextpdf/kernel/font/FontUtil;
.super Ljava/lang/Object;
.source "FontUtil.java"


# static fields
.field private static final LOGGER:Lorg/slf4j/Logger;

.field private static final NUMBER_GENERATOR:Ljava/security/SecureRandom;

.field private static final UNIVERSAL_CMAP_DIR:Ljava/lang/String; = "toUnicode/"

.field private static final UNIVERSAL_CMAP_ORDERINGS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final uniMaps:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/itextpdf/io/font/cmap/CMapToUnicode;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 50
    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    sput-object v0, Lcom/itextpdf/kernel/font/FontUtil;->NUMBER_GENERATOR:Ljava/security/SecureRandom;

    .line 52
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/itextpdf/kernel/font/FontUtil;->uniMaps:Ljava/util/HashMap;

    .line 54
    const-class v0, Lcom/itextpdf/kernel/font/FontUtil;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/font/FontUtil;->LOGGER:Lorg/slf4j/Logger;

    .line 58
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "CNS1"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "GB1"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Japan1"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Korea1"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "KR"

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/itextpdf/kernel/font/FontUtil;->UNIVERSAL_CMAP_ORDERINGS:Ljava/util/Set;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addRandomSubsetPrefixForFontName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "fontName"    # Ljava/lang/String;

    .line 64
    const/4 v0, 0x6

    invoke-static {v0}, Lcom/itextpdf/kernel/font/FontUtil;->getRandomFontPrefix(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 65
    .local v0, "newFontName":Ljava/lang/StringBuilder;
    const/16 v1, 0x2b

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method static convertCompositeWidthsArray(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/io/util/IntHashtable;
    .locals 8
    .param p0, "widthsArray"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 142
    new-instance v0, Lcom/itextpdf/io/util/IntHashtable;

    invoke-direct {v0}, Lcom/itextpdf/io/util/IntHashtable;-><init>()V

    .line 143
    .local v0, "res":Lcom/itextpdf/io/util/IntHashtable;
    if-nez p0, :cond_0

    .line 144
    return-object v0

    .line 147
    :cond_0
    const/4 v1, 0x0

    .local v1, "k":I
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_4

    .line 148
    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v2

    .line 149
    .local v2, "c1":I
    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    .line 150
    .local v3, "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfObject;->isArray()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 151
    move-object v4, v3

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 152
    .local v4, "subWidths":Lcom/itextpdf/kernel/pdf/PdfArray;
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_1
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v6

    if-ge v5, v6, :cond_1

    .line 153
    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v6

    .line 154
    .local v6, "c2":I
    add-int/lit8 v7, v2, 0x1

    .end local v2    # "c1":I
    .local v7, "c1":I
    invoke-virtual {v0, v2, v6}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 152
    .end local v6    # "c2":I
    add-int/lit8 v5, v5, 0x1

    move v2, v7

    goto :goto_1

    .line 156
    .end local v4    # "subWidths":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v5    # "j":I
    .end local v7    # "c1":I
    .restart local v2    # "c1":I
    :cond_1
    goto :goto_3

    .line 157
    :cond_2
    move-object v4, v3

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v4

    .line 158
    .local v4, "c2":I
    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v5

    .line 159
    .local v5, "w":I
    :goto_2
    if-gt v2, v4, :cond_3

    .line 160
    invoke-virtual {v0, v2, v5}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 159
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 147
    .end local v2    # "c1":I
    .end local v3    # "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v4    # "c2":I
    .end local v5    # "w":I
    :cond_3
    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 164
    .end local v1    # "k":I
    :cond_4
    return-object v0
.end method

.method static convertSimpleWidthsArray(Lcom/itextpdf/kernel/pdf/PdfArray;II)[I
    .locals 6
    .param p0, "widthsArray"    # Lcom/itextpdf/kernel/pdf/PdfArray;
    .param p1, "first"    # I
    .param p2, "missingWidth"    # I

    .line 126
    const/16 v0, 0x100

    new-array v1, v0, [I

    .line 127
    .local v1, "res":[I
    invoke-static {v1, p2}, Ljava/util/Arrays;->fill([II)V

    .line 128
    if-nez p0, :cond_0

    .line 129
    const-class v0, Lcom/itextpdf/kernel/font/FontUtil;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 130
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v2, "Font dictionary does not contain required /Widths entry."

    invoke-interface {v0, v2}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 131
    return-object v1

    .line 134
    .end local v0    # "logger":Lorg/slf4j/Logger;
    :cond_0
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v3

    if-ge v2, v3, :cond_2

    add-int v3, p1, v2

    if-ge v3, v0, :cond_2

    .line 135
    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v3

    .line 136
    .local v3, "number":Lcom/itextpdf/kernel/pdf/PdfNumber;
    add-int v4, p1, v2

    if-eqz v3, :cond_1

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v5

    goto :goto_1

    :cond_1
    move v5, p2

    :goto_1
    aput v5, v1, v4

    .line 134
    .end local v3    # "number":Lcom/itextpdf/kernel/pdf/PdfNumber;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 138
    .end local v2    # "i":I
    :cond_2
    return-object v1
.end method

.method static createRandomFontName()Ljava/lang/String;
    .locals 1

    .line 122
    const/4 v0, 0x7

    invoke-static {v0}, Lcom/itextpdf/kernel/font/FontUtil;->getRandomFontPrefix(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getRandomFontPrefix(I)Ljava/lang/StringBuilder;
    .locals 4
    .param p0, "length"    # I

    .line 168
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 169
    .local v0, "stringBuilder":Ljava/lang/StringBuilder;
    new-array v1, p0, [B

    .line 170
    .local v1, "randomByte":[B
    sget-object v2, Lcom/itextpdf/kernel/font/FontUtil;->NUMBER_GENERATOR:Ljava/security/SecureRandom;

    invoke-virtual {v2, v1}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 171
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_0
    if-ge v2, p0, :cond_0

    .line 172
    aget-byte v3, v1, v2

    rem-int/lit8 v3, v3, 0x1a

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    add-int/lit8 v3, v3, 0x41

    int-to-char v3, v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 171
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 174
    .end local v2    # "k":I
    :cond_0
    return-object v0
.end method

.method static getToUnicodeFromUniMap(Ljava/lang/String;)Lcom/itextpdf/io/font/cmap/CMapToUnicode;
    .locals 3
    .param p0, "uniMap"    # Ljava/lang/String;

    .line 103
    if-nez p0, :cond_0

    .line 104
    const/4 v0, 0x0

    return-object v0

    .line 105
    :cond_0
    sget-object v0, Lcom/itextpdf/kernel/font/FontUtil;->uniMaps:Ljava/util/HashMap;

    monitor-enter v0

    .line 106
    :try_start_0
    sget-object v1, Lcom/itextpdf/kernel/font/FontUtil;->uniMaps:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 107
    sget-object v1, Lcom/itextpdf/kernel/font/FontUtil;->uniMaps:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/io/font/cmap/CMapToUnicode;

    monitor-exit v0

    return-object v1

    .line 110
    :cond_1
    const-string v1, "Identity-H"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 111
    invoke-static {}, Lcom/itextpdf/io/font/cmap/CMapToUnicode;->getIdentity()Lcom/itextpdf/io/font/cmap/CMapToUnicode;

    move-result-object v1

    .local v1, "toUnicode":Lcom/itextpdf/io/font/cmap/CMapToUnicode;
    goto :goto_0

    .line 113
    .end local v1    # "toUnicode":Lcom/itextpdf/io/font/cmap/CMapToUnicode;
    :cond_2
    invoke-static {p0}, Lcom/itextpdf/io/font/CjkResourceLoader;->getUni2CidCmap(Ljava/lang/String;)Lcom/itextpdf/io/font/cmap/CMapUniCid;

    move-result-object v1

    .line 114
    .local v1, "uni":Lcom/itextpdf/io/font/cmap/CMapUniCid;
    invoke-virtual {v1}, Lcom/itextpdf/io/font/cmap/CMapUniCid;->exportToUnicode()Lcom/itextpdf/io/font/cmap/CMapToUnicode;

    move-result-object v2

    move-object v1, v2

    .line 116
    .local v1, "toUnicode":Lcom/itextpdf/io/font/cmap/CMapToUnicode;
    :goto_0
    sget-object v2, Lcom/itextpdf/kernel/font/FontUtil;->uniMaps:Ljava/util/HashMap;

    invoke-virtual {v2, p0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    monitor-exit v0

    return-object v1

    .line 118
    .end local v1    # "toUnicode":Lcom/itextpdf/io/font/cmap/CMapToUnicode;
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method static parseUniversalToUnicodeCMap(Ljava/lang/String;)Lcom/itextpdf/io/font/cmap/CMapToUnicode;
    .locals 6
    .param p0, "ordering"    # Ljava/lang/String;

    .line 88
    sget-object v0, Lcom/itextpdf/kernel/font/FontUtil;->UNIVERSAL_CMAP_ORDERINGS:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 89
    return-object v1

    .line 91
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "toUnicode/Adobe-"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "-UCS2"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 92
    .local v0, "cmapRelPath":Ljava/lang/String;
    new-instance v2, Lcom/itextpdf/io/font/cmap/CMapToUnicode;

    invoke-direct {v2}, Lcom/itextpdf/io/font/cmap/CMapToUnicode;-><init>()V

    .line 94
    .local v2, "cMapToUnicode":Lcom/itextpdf/io/font/cmap/CMapToUnicode;
    :try_start_0
    new-instance v3, Lcom/itextpdf/io/font/cmap/CMapLocationResource;

    invoke-direct {v3}, Lcom/itextpdf/io/font/cmap/CMapLocationResource;-><init>()V

    invoke-static {v0, v2, v3}, Lcom/itextpdf/io/font/cmap/CMapParser;->parseCid(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/AbstractCMap;Lcom/itextpdf/io/font/cmap/ICMapLocation;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    nop

    .line 99
    return-object v2

    .line 95
    :catch_0
    move-exception v3

    .line 96
    .local v3, "e":Ljava/lang/Exception;
    sget-object v4, Lcom/itextpdf/kernel/font/FontUtil;->LOGGER:Lorg/slf4j/Logger;

    const-string v5, "Unknown error while processing CMap."

    invoke-interface {v4, v5, v3}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 97
    return-object v1
.end method

.method static processToUnicode(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/io/font/cmap/CMapToUnicode;
    .locals 4
    .param p0, "toUnicode"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 70
    const/4 v0, 0x0

    .line 71
    .local v0, "cMapToUnicode":Lcom/itextpdf/io/font/cmap/CMapToUnicode;
    instance-of v1, p0, Lcom/itextpdf/kernel/pdf/PdfStream;

    if-eqz v1, :cond_0

    .line 73
    :try_start_0
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getBytes()[B

    move-result-object v1

    .line 74
    .local v1, "uniBytes":[B
    new-instance v2, Lcom/itextpdf/io/font/cmap/CMapLocationFromBytes;

    invoke-direct {v2, v1}, Lcom/itextpdf/io/font/cmap/CMapLocationFromBytes;-><init>([B)V

    .line 75
    .local v2, "lb":Lcom/itextpdf/io/font/cmap/ICMapLocation;
    new-instance v3, Lcom/itextpdf/io/font/cmap/CMapToUnicode;

    invoke-direct {v3}, Lcom/itextpdf/io/font/cmap/CMapToUnicode;-><init>()V

    move-object v0, v3

    .line 76
    const-string v3, ""

    invoke-static {v3, v0, v2}, Lcom/itextpdf/io/font/cmap/CMapParser;->parseCid(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/AbstractCMap;Lcom/itextpdf/io/font/cmap/ICMapLocation;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v1    # "uniBytes":[B
    .end local v2    # "lb":Lcom/itextpdf/io/font/cmap/ICMapLocation;
    goto :goto_0

    .line 77
    :catch_0
    move-exception v1

    .line 78
    .local v1, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/itextpdf/kernel/font/FontUtil;->LOGGER:Lorg/slf4j/Logger;

    const-string v3, "Unknown error while processing CMap."

    invoke-interface {v2, v3, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 79
    sget-object v0, Lcom/itextpdf/io/font/cmap/CMapToUnicode;->EmptyCMapToUnicodeMap:Lcom/itextpdf/io/font/cmap/CMapToUnicode;

    .line 80
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_0
    goto :goto_1

    .line 81
    :cond_0
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->IdentityH:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, p0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 82
    invoke-static {}, Lcom/itextpdf/io/font/cmap/CMapToUnicode;->getIdentity()Lcom/itextpdf/io/font/cmap/CMapToUnicode;

    move-result-object v0

    .line 84
    :cond_1
    :goto_1
    return-object v0
.end method
