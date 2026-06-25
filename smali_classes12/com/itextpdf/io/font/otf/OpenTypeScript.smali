.class public Lcom/itextpdf/io/font/otf/OpenTypeScript;
.super Ljava/lang/Object;
.source "OpenTypeScript.java"


# static fields
.field public static final DEFAULT_SCRIPT:Ljava/lang/String; = "DFLT"


# instance fields
.field private openTypeReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

.field private records:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/ScriptRecord;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)V
    .locals 4
    .param p1, "openTypeReader"    # Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;
    .param p2, "locationScriptTable"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/itextpdf/io/font/otf/OpenTypeScript;->openTypeReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    .line 37
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeScript;->records:Ljava/util/List;

    .line 38
    iget-object v0, p1, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    int-to-long v1, p2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 39
    invoke-virtual {p1, p2}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readTagAndLocations(I)[Lcom/itextpdf/io/font/otf/TagAndLocation;

    move-result-object v0

    .line 40
    .local v0, "tagsLocs":[Lcom/itextpdf/io/font/otf/TagAndLocation;
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 41
    .local v3, "tagLoc":Lcom/itextpdf/io/font/otf/TagAndLocation;
    invoke-direct {p0, v3}, Lcom/itextpdf/io/font/otf/OpenTypeScript;->readScriptRecord(Lcom/itextpdf/io/font/otf/TagAndLocation;)V

    .line 40
    .end local v3    # "tagLoc":Lcom/itextpdf/io/font/otf/TagAndLocation;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 43
    :cond_0
    return-void
.end method

.method private readLanguageRecord(Lcom/itextpdf/io/font/otf/TagAndLocation;)Lcom/itextpdf/io/font/otf/LanguageRecord;
    .locals 4
    .param p1, "tagLoc"    # Lcom/itextpdf/io/font/otf/TagAndLocation;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 114
    new-instance v0, Lcom/itextpdf/io/font/otf/LanguageRecord;

    invoke-direct {v0}, Lcom/itextpdf/io/font/otf/LanguageRecord;-><init>()V

    .line 116
    .local v0, "rec":Lcom/itextpdf/io/font/otf/LanguageRecord;
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/OpenTypeScript;->openTypeReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v1, v1, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget v2, p1, Lcom/itextpdf/io/font/otf/TagAndLocation;->location:I

    add-int/lit8 v2, v2, 0x2

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 117
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/OpenTypeScript;->openTypeReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v1, v1, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v1

    iput v1, v0, Lcom/itextpdf/io/font/otf/LanguageRecord;->featureRequired:I

    .line 118
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/OpenTypeScript;->openTypeReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v1, v1, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v1

    .line 119
    .local v1, "count":I
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/OpenTypeScript;->openTypeReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-virtual {v2, v1}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readUShortArray(I)[I

    move-result-object v2

    iput-object v2, v0, Lcom/itextpdf/io/font/otf/LanguageRecord;->features:[I

    .line 120
    iget-object v2, p1, Lcom/itextpdf/io/font/otf/TagAndLocation;->tag:Ljava/lang/String;

    iput-object v2, v0, Lcom/itextpdf/io/font/otf/LanguageRecord;->tag:Ljava/lang/String;

    .line 121
    return-object v0
.end method

.method private readScriptRecord(Lcom/itextpdf/io/font/otf/TagAndLocation;)V
    .locals 6
    .param p1, "tagLoc"    # Lcom/itextpdf/io/font/otf/TagAndLocation;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 92
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeScript;->openTypeReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v0, v0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget v1, p1, Lcom/itextpdf/io/font/otf/TagAndLocation;->location:I

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 93
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeScript;->openTypeReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v0, v0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v0

    .line 94
    .local v0, "locationDefaultLanguage":I
    if-lez v0, :cond_0

    .line 95
    iget v1, p1, Lcom/itextpdf/io/font/otf/TagAndLocation;->location:I

    add-int/2addr v0, v1

    .line 97
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/OpenTypeScript;->openTypeReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget v2, p1, Lcom/itextpdf/io/font/otf/TagAndLocation;->location:I

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readTagAndLocations(I)[Lcom/itextpdf/io/font/otf/TagAndLocation;

    move-result-object v1

    .line 98
    .local v1, "tagsLocs":[Lcom/itextpdf/io/font/otf/TagAndLocation;
    new-instance v2, Lcom/itextpdf/io/font/otf/ScriptRecord;

    invoke-direct {v2}, Lcom/itextpdf/io/font/otf/ScriptRecord;-><init>()V

    .line 99
    .local v2, "srec":Lcom/itextpdf/io/font/otf/ScriptRecord;
    iget-object v3, p1, Lcom/itextpdf/io/font/otf/TagAndLocation;->tag:Ljava/lang/String;

    iput-object v3, v2, Lcom/itextpdf/io/font/otf/ScriptRecord;->tag:Ljava/lang/String;

    .line 100
    array-length v3, v1

    new-array v3, v3, [Lcom/itextpdf/io/font/otf/LanguageRecord;

    iput-object v3, v2, Lcom/itextpdf/io/font/otf/ScriptRecord;->languages:[Lcom/itextpdf/io/font/otf/LanguageRecord;

    .line 101
    const/4 v3, 0x0

    .local v3, "k":I
    :goto_0
    array-length v4, v1

    if-ge v3, v4, :cond_1

    .line 102
    iget-object v4, v2, Lcom/itextpdf/io/font/otf/ScriptRecord;->languages:[Lcom/itextpdf/io/font/otf/LanguageRecord;

    aget-object v5, v1, v3

    invoke-direct {p0, v5}, Lcom/itextpdf/io/font/otf/OpenTypeScript;->readLanguageRecord(Lcom/itextpdf/io/font/otf/TagAndLocation;)Lcom/itextpdf/io/font/otf/LanguageRecord;

    move-result-object v5

    aput-object v5, v4, v3

    .line 101
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 104
    .end local v3    # "k":I
    :cond_1
    if-lez v0, :cond_2

    .line 105
    new-instance v3, Lcom/itextpdf/io/font/otf/TagAndLocation;

    invoke-direct {v3}, Lcom/itextpdf/io/font/otf/TagAndLocation;-><init>()V

    .line 106
    .local v3, "t":Lcom/itextpdf/io/font/otf/TagAndLocation;
    const-string v4, ""

    iput-object v4, v3, Lcom/itextpdf/io/font/otf/TagAndLocation;->tag:Ljava/lang/String;

    .line 107
    iput v0, v3, Lcom/itextpdf/io/font/otf/TagAndLocation;->location:I

    .line 108
    invoke-direct {p0, v3}, Lcom/itextpdf/io/font/otf/OpenTypeScript;->readLanguageRecord(Lcom/itextpdf/io/font/otf/TagAndLocation;)Lcom/itextpdf/io/font/otf/LanguageRecord;

    move-result-object v4

    iput-object v4, v2, Lcom/itextpdf/io/font/otf/ScriptRecord;->defaultLanguage:Lcom/itextpdf/io/font/otf/LanguageRecord;

    .line 110
    .end local v3    # "t":Lcom/itextpdf/io/font/otf/TagAndLocation;
    :cond_2
    iget-object v3, p0, Lcom/itextpdf/io/font/otf/OpenTypeScript;->records:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 111
    return-void
.end method


# virtual methods
.method public getLanguageRecord([Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/io/font/otf/LanguageRecord;
    .locals 10
    .param p1, "scripts"    # [Ljava/lang/String;
    .param p2, "language"    # Ljava/lang/String;

    .line 50
    const/4 v0, 0x0

    .line 51
    .local v0, "scriptFound":Lcom/itextpdf/io/font/otf/ScriptRecord;
    const/4 v1, 0x0

    .line 52
    .local v1, "scriptDefault":Lcom/itextpdf/io/font/otf/ScriptRecord;
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/OpenTypeScript;->records:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const-string v4, "DFLT"

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/io/font/otf/ScriptRecord;

    .line 53
    .local v3, "sr":Lcom/itextpdf/io/font/otf/ScriptRecord;
    iget-object v5, v3, Lcom/itextpdf/io/font/otf/ScriptRecord;->tag:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 54
    move-object v1, v3

    .line 55
    goto :goto_1

    .line 57
    .end local v3    # "sr":Lcom/itextpdf/io/font/otf/ScriptRecord;
    :cond_0
    goto :goto_0

    .line 58
    :cond_1
    :goto_1
    array-length v2, p1

    const/4 v3, 0x0

    move v5, v3

    :goto_2
    if-ge v5, v2, :cond_6

    aget-object v6, p1, v5

    .line 59
    .local v6, "script":Ljava/lang/String;
    iget-object v7, p0, Lcom/itextpdf/io/font/otf/OpenTypeScript;->records:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/io/font/otf/ScriptRecord;

    .line 60
    .local v8, "sr":Lcom/itextpdf/io/font/otf/ScriptRecord;
    iget-object v9, v8, Lcom/itextpdf/io/font/otf/ScriptRecord;->tag:Ljava/lang/String;

    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 61
    move-object v0, v8

    .line 62
    goto :goto_4

    .line 64
    :cond_2
    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 65
    move-object v1, v8

    .line 67
    .end local v8    # "sr":Lcom/itextpdf/io/font/otf/ScriptRecord;
    :cond_3
    goto :goto_3

    .line 68
    :cond_4
    :goto_4
    if-eqz v0, :cond_5

    .line 69
    goto :goto_5

    .line 58
    .end local v6    # "script":Ljava/lang/String;
    :cond_5
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 72
    :cond_6
    :goto_5
    if-nez v0, :cond_7

    .line 73
    move-object v0, v1

    .line 75
    :cond_7
    if-nez v0, :cond_8

    .line 76
    const/4 v2, 0x0

    return-object v2

    .line 78
    :cond_8
    const/4 v2, 0x0

    .line 79
    .local v2, "lang":Lcom/itextpdf/io/font/otf/LanguageRecord;
    iget-object v4, v0, Lcom/itextpdf/io/font/otf/ScriptRecord;->languages:[Lcom/itextpdf/io/font/otf/LanguageRecord;

    array-length v5, v4

    :goto_6
    if-ge v3, v5, :cond_a

    aget-object v6, v4, v3

    .line 80
    .local v6, "lr":Lcom/itextpdf/io/font/otf/LanguageRecord;
    iget-object v7, v6, Lcom/itextpdf/io/font/otf/LanguageRecord;->tag:Ljava/lang/String;

    invoke-virtual {v7, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 81
    move-object v2, v6

    .line 82
    goto :goto_7

    .line 79
    .end local v6    # "lr":Lcom/itextpdf/io/font/otf/LanguageRecord;
    :cond_9
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 85
    :cond_a
    :goto_7
    if-nez v2, :cond_b

    .line 86
    iget-object v2, v0, Lcom/itextpdf/io/font/otf/ScriptRecord;->defaultLanguage:Lcom/itextpdf/io/font/otf/LanguageRecord;

    .line 88
    :cond_b
    return-object v2
.end method

.method public getScriptRecords()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/ScriptRecord;",
            ">;"
        }
    .end annotation

    .line 46
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeScript;->records:Ljava/util/List;

    return-object v0
.end method
