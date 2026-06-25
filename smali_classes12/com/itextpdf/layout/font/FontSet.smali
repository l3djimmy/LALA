.class public final Lcom/itextpdf/layout/font/FontSet;
.super Ljava/lang/Object;
.source "FontSet.java"


# static fields
.field private static final lastId:Ljava/util/concurrent/atomic/AtomicLong;


# instance fields
.field private final fontPrograms:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/itextpdf/layout/font/FontInfo;",
            "Lcom/itextpdf/io/font/FontProgram;",
            ">;"
        }
    .end annotation
.end field

.field private final fonts:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/itextpdf/layout/font/FontInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final id:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 54
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    sput-object v0, Lcom/itextpdf/layout/font/FontSet;->lastId:Ljava/util/concurrent/atomic/AtomicLong;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/font/FontSet;->fonts:Ljava/util/Set;

    .line 59
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/font/FontSet;->fontPrograms:Ljava/util/Map;

    .line 66
    sget-object v0, Lcom/itextpdf/layout/font/FontSet;->lastId:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/itextpdf/layout/font/FontSet;->id:J

    .line 67
    return-void
.end method


# virtual methods
.method public addDirectory(Ljava/lang/String;)I
    .locals 1
    .param p1, "dir"    # Ljava/lang/String;

    .line 107
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/layout/font/FontSet;->addDirectory(Ljava/lang/String;Z)I

    move-result v0

    return v0
.end method

.method public addDirectory(Ljava/lang/String;Z)I
    .locals 10
    .param p1, "dir"    # Ljava/lang/String;
    .param p2, "scanSubdirectories"    # Z

    .line 77
    const/4 v0, 0x0

    .line 78
    .local v0, "count":I
    invoke-static {p1, p2}, Lcom/itextpdf/commons/utils/FileUtil;->listFilesInDirectory(Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v1

    .line 79
    .local v1, "files":[Ljava/lang/String;
    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 80
    return v2

    .line 81
    :cond_0
    array-length v3, v1

    move v4, v2

    :goto_0
    if-ge v4, v3, :cond_7

    aget-object v5, v1, v4

    .line 83
    .local v5, "file":Ljava/lang/String;
    :try_start_0
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    const/4 v7, 0x4

    if-ge v6, v7, :cond_1

    const/4 v6, 0x0

    goto :goto_1

    :cond_1
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    sub-int/2addr v6, v7

    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    .line 84
    .local v6, "suffix":Ljava/lang/String;
    :goto_1
    const-string v8, ".afm"

    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_4

    const-string v8, ".pfm"

    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    goto :goto_2

    .line 90
    :cond_2
    const-string v7, ".ttf"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3

    const-string v7, ".otf"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3

    const-string v7, ".ttc"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 91
    :cond_3
    invoke-virtual {p0, v5}, Lcom/itextpdf/layout/font/FontSet;->addFont(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 92
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 86
    :cond_4
    :goto_2
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v9

    sub-int/2addr v9, v7

    invoke-virtual {v5, v2, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".pfb"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 87
    .local v7, "pfb":Ljava/lang/String;
    invoke-static {v7}, Lcom/itextpdf/commons/utils/FileUtil;->fileExists(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_5

    invoke-virtual {p0, v5}, Lcom/itextpdf/layout/font/FontSet;->addFont(Ljava/lang/String;)Z

    move-result v8
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v8, :cond_5

    .line 88
    add-int/lit8 v0, v0, 0x1

    .line 90
    .end local v7    # "pfb":Ljava/lang/String;
    :cond_5
    nop

    .line 95
    .end local v6    # "suffix":Ljava/lang/String;
    :cond_6
    :goto_3
    goto :goto_4

    .line 94
    :catch_0
    move-exception v6

    .line 81
    .end local v5    # "file":Ljava/lang/String;
    :goto_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 97
    :cond_7
    return v0
.end method

.method public addFont(Lcom/itextpdf/io/font/FontProgram;Ljava/lang/String;)Z
    .locals 1
    .param p1, "fontProgram"    # Lcom/itextpdf/io/font/FontProgram;
    .param p2, "encoding"    # Ljava/lang/String;

    .line 165
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/layout/font/FontSet;->addFont(Lcom/itextpdf/io/font/FontProgram;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public addFont(Lcom/itextpdf/io/font/FontProgram;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "fontProgram"    # Lcom/itextpdf/io/font/FontProgram;
    .param p2, "encoding"    # Ljava/lang/String;
    .param p3, "alias"    # Ljava/lang/String;

    .line 154
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/itextpdf/layout/font/FontSet;->addFont(Lcom/itextpdf/io/font/FontProgram;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/layout/font/Range;)Z

    move-result v0

    return v0
.end method

.method public addFont(Lcom/itextpdf/io/font/FontProgram;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/layout/font/Range;)Z
    .locals 3
    .param p1, "fontProgram"    # Lcom/itextpdf/io/font/FontProgram;
    .param p2, "encoding"    # Ljava/lang/String;
    .param p3, "alias"    # Ljava/lang/String;
    .param p4, "unicodeRange"    # Lcom/itextpdf/layout/font/Range;

    .line 124
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 125
    return v0

    .line 127
    :cond_0
    instance-of v1, p1, Lcom/itextpdf/kernel/font/Type3Font;

    if-eqz v1, :cond_1

    .line 128
    const-class v1, Lcom/itextpdf/layout/font/FontSet;

    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 129
    .local v1, "logger":Lorg/slf4j/Logger;
    const-string v2, "Type 3 font cannot be added to FontSet. Custom FontProvider class may be created for this purpose."

    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 130
    return v0

    .line 132
    .end local v1    # "logger":Lorg/slf4j/Logger;
    :cond_1
    invoke-static {p1, p2, p3, p4}, Lcom/itextpdf/layout/font/FontInfo;->create(Lcom/itextpdf/io/font/FontProgram;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/layout/font/Range;)Lcom/itextpdf/layout/font/FontInfo;

    move-result-object v1

    .line 133
    .local v1, "fi":Lcom/itextpdf/layout/font/FontInfo;
    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/font/FontSet;->addFont(Lcom/itextpdf/layout/font/FontInfo;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 134
    iget-object v0, p0, Lcom/itextpdf/layout/font/FontSet;->fontPrograms:Ljava/util/Map;

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    const/4 v0, 0x1

    return v0

    .line 137
    :cond_2
    return v0
.end method

.method public final addFont(Lcom/itextpdf/layout/font/FontInfo;)Z
    .locals 1
    .param p1, "fontInfo"    # Lcom/itextpdf/layout/font/FontInfo;

    .line 335
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/itextpdf/layout/font/FontSet;->fonts:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 339
    iget-object v0, p0, Lcom/itextpdf/layout/font/FontSet;->fonts:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 340
    const/4 v0, 0x1

    return v0

    .line 342
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public addFont(Lcom/itextpdf/layout/font/FontInfo;Ljava/lang/String;)Z
    .locals 1
    .param p1, "fontInfo"    # Lcom/itextpdf/layout/font/FontInfo;
    .param p2, "alias"    # Ljava/lang/String;

    .line 320
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/layout/font/FontSet;->addFont(Lcom/itextpdf/layout/font/FontInfo;Ljava/lang/String;Lcom/itextpdf/layout/font/Range;)Z

    move-result v0

    return v0
.end method

.method public addFont(Lcom/itextpdf/layout/font/FontInfo;Ljava/lang/String;Lcom/itextpdf/layout/font/Range;)Z
    .locals 1
    .param p1, "fontInfo"    # Lcom/itextpdf/layout/font/FontInfo;
    .param p2, "alias"    # Ljava/lang/String;
    .param p3, "unicodeRange"    # Lcom/itextpdf/layout/font/Range;

    .line 305
    invoke-static {p1, p2, p3}, Lcom/itextpdf/layout/font/FontInfo;->create(Lcom/itextpdf/layout/font/FontInfo;Ljava/lang/String;Lcom/itextpdf/layout/font/Range;)Lcom/itextpdf/layout/font/FontInfo;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/font/FontSet;->addFont(Lcom/itextpdf/layout/font/FontInfo;)Z

    move-result v0

    return v0
.end method

.method public addFont(Ljava/lang/String;)Z
    .locals 1
    .param p1, "fontPath"    # Ljava/lang/String;

    .line 277
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v0}, Lcom/itextpdf/layout/font/FontSet;->addFont(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public addFont(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "fontPath"    # Ljava/lang/String;
    .param p2, "encoding"    # Ljava/lang/String;

    .line 215
    const/4 v0, 0x0

    invoke-static {p1, p2, v0, v0}, Lcom/itextpdf/layout/font/FontInfo;->create(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/layout/font/Range;)Lcom/itextpdf/layout/font/FontInfo;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/font/FontSet;->addFont(Lcom/itextpdf/layout/font/FontInfo;)Z

    move-result v0

    return v0
.end method

.method public addFont(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "fontPath"    # Ljava/lang/String;
    .param p2, "encoding"    # Ljava/lang/String;
    .param p3, "alias"    # Ljava/lang/String;

    .line 202
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/itextpdf/layout/font/FontSet;->addFont(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/layout/font/Range;)Z

    move-result v0

    return v0
.end method

.method public addFont(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/layout/font/Range;)Z
    .locals 1
    .param p1, "fontPath"    # Ljava/lang/String;
    .param p2, "encoding"    # Ljava/lang/String;
    .param p3, "alias"    # Ljava/lang/String;
    .param p4, "unicodeRange"    # Lcom/itextpdf/layout/font/Range;

    .line 184
    invoke-static {p1, p2, p3, p4}, Lcom/itextpdf/layout/font/FontInfo;->create(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/layout/font/Range;)Lcom/itextpdf/layout/font/FontInfo;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/font/FontSet;->addFont(Lcom/itextpdf/layout/font/FontInfo;)Z

    move-result v0

    return v0
.end method

.method public addFont([B)Z
    .locals 1
    .param p1, "fontData"    # [B

    .line 289
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v0}, Lcom/itextpdf/layout/font/FontSet;->addFont([BLjava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public addFont([BLjava/lang/String;)Z
    .locals 1
    .param p1, "fontData"    # [B
    .param p2, "encoding"    # Ljava/lang/String;

    .line 265
    const/4 v0, 0x0

    invoke-static {p1, p2, v0, v0}, Lcom/itextpdf/layout/font/FontInfo;->create([BLjava/lang/String;Ljava/lang/String;Lcom/itextpdf/layout/font/Range;)Lcom/itextpdf/layout/font/FontInfo;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/font/FontSet;->addFont(Lcom/itextpdf/layout/font/FontInfo;)Z

    move-result v0

    return v0
.end method

.method public addFont([BLjava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "fontData"    # [B
    .param p2, "encoding"    # Ljava/lang/String;
    .param p3, "alias"    # Ljava/lang/String;

    .line 252
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/itextpdf/layout/font/FontSet;->addFont([BLjava/lang/String;Ljava/lang/String;Lcom/itextpdf/layout/font/Range;)Z

    move-result v0

    return v0
.end method

.method public addFont([BLjava/lang/String;Ljava/lang/String;Lcom/itextpdf/layout/font/Range;)Z
    .locals 1
    .param p1, "fontData"    # [B
    .param p2, "encoding"    # Ljava/lang/String;
    .param p3, "alias"    # Ljava/lang/String;
    .param p4, "unicodeRange"    # Lcom/itextpdf/layout/font/Range;

    .line 234
    invoke-static {p1, p2, p3, p4}, Lcom/itextpdf/layout/font/FontInfo;->create([BLjava/lang/String;Ljava/lang/String;Lcom/itextpdf/layout/font/Range;)Lcom/itextpdf/layout/font/FontInfo;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/font/FontSet;->addFont(Lcom/itextpdf/layout/font/FontInfo;)Z

    move-result v0

    return v0
.end method

.method public contains(Ljava/lang/String;)Z
    .locals 4
    .param p1, "fontName"    # Ljava/lang/String;

    .line 354
    const/4 v0, 0x0

    if-eqz p1, :cond_4

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_2

    .line 357
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 359
    invoke-virtual {p0}, Lcom/itextpdf/layout/font/FontSet;->getFonts()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/font/FontInfo;

    .line 360
    .local v2, "fi":Lcom/itextpdf/layout/font/FontInfo;
    invoke-virtual {v2}, Lcom/itextpdf/layout/font/FontInfo;->getDescriptor()Lcom/itextpdf/io/font/FontProgramDescriptor;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontProgramDescriptor;->getFullNameLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 361
    invoke-virtual {v2}, Lcom/itextpdf/layout/font/FontInfo;->getDescriptor()Lcom/itextpdf/io/font/FontProgramDescriptor;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontProgramDescriptor;->getFontNameLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_1

    .line 364
    .end local v2    # "fi":Lcom/itextpdf/layout/font/FontInfo;
    :cond_1
    goto :goto_0

    .line 362
    .restart local v2    # "fi":Lcom/itextpdf/layout/font/FontInfo;
    :cond_2
    :goto_1
    const/4 v0, 0x1

    return v0

    .line 365
    .end local v2    # "fi":Lcom/itextpdf/layout/font/FontInfo;
    :cond_3
    return v0

    .line 355
    :cond_4
    :goto_2
    return v0
.end method

.method public get(Ljava/lang/String;)Ljava/util/Collection;
    .locals 4
    .param p1, "fontName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Collection<",
            "Lcom/itextpdf/layout/font/FontInfo;",
            ">;"
        }
    .end annotation

    .line 377
    if-eqz p1, :cond_4

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 380
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 381
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 382
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/font/FontInfo;>;"
    invoke-virtual {p0}, Lcom/itextpdf/layout/font/FontSet;->getFonts()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/font/FontInfo;

    .line 383
    .local v2, "fi":Lcom/itextpdf/layout/font/FontInfo;
    invoke-virtual {v2}, Lcom/itextpdf/layout/font/FontInfo;->getDescriptor()Lcom/itextpdf/io/font/FontProgramDescriptor;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontProgramDescriptor;->getFullNameLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 384
    invoke-virtual {v2}, Lcom/itextpdf/layout/font/FontInfo;->getDescriptor()Lcom/itextpdf/io/font/FontProgramDescriptor;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontProgramDescriptor;->getFontNameLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 385
    :cond_1
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 387
    .end local v2    # "fi":Lcom/itextpdf/layout/font/FontInfo;
    :cond_2
    goto :goto_0

    .line 388
    :cond_3
    return-object v0

    .line 378
    .end local v0    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/font/FontInfo;>;"
    :cond_4
    :goto_1
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method getFontProgram(Lcom/itextpdf/layout/font/FontInfo;)Lcom/itextpdf/io/font/FontProgram;
    .locals 1
    .param p1, "fontInfo"    # Lcom/itextpdf/layout/font/FontInfo;

    .line 439
    iget-object v0, p0, Lcom/itextpdf/layout/font/FontSet;->fontPrograms:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/font/FontProgram;

    return-object v0
.end method

.method public getFonts()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/itextpdf/layout/font/FontInfo;",
            ">;"
        }
    .end annotation

    .line 399
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/font/FontSet;->getFonts(Lcom/itextpdf/layout/font/FontSet;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getFonts(Lcom/itextpdf/layout/font/FontSet;)Ljava/util/Collection;
    .locals 3
    .param p1, "additionalFonts"    # Lcom/itextpdf/layout/font/FontSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/font/FontSet;",
            ")",
            "Ljava/util/Collection<",
            "Lcom/itextpdf/layout/font/FontInfo;",
            ">;"
        }
    .end annotation

    .line 411
    new-instance v0, Lcom/itextpdf/layout/font/FontSetCollection;

    iget-object v1, p0, Lcom/itextpdf/layout/font/FontSet;->fonts:Ljava/util/Set;

    if-eqz p1, :cond_0

    iget-object v2, p1, Lcom/itextpdf/layout/font/FontSet;->fonts:Ljava/util/Set;

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/font/FontSetCollection;-><init>(Ljava/util/Collection;Ljava/util/Collection;)V

    return-object v0
.end method

.method getId()J
    .locals 2

    .line 435
    iget-wide v0, p0, Lcom/itextpdf/layout/font/FontSet;->id:J

    return-wide v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 420
    invoke-virtual {p0}, Lcom/itextpdf/layout/font/FontSet;->size()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public size()I
    .locals 1

    .line 429
    iget-object v0, p0, Lcom/itextpdf/layout/font/FontSet;->fonts:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    return v0
.end method
