.class public abstract Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;
.super Ljava/lang/Object;
.source "OpenTypeFontTableReader.java"


# instance fields
.field protected featuresType:Lcom/itextpdf/io/font/otf/OpenTypeFeature;

.field private final gdef:Lcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;

.field private final indexGlyphMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/io/font/otf/Glyph;",
            ">;"
        }
    .end annotation
.end field

.field protected lookupList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/OpenTableLookup;",
            ">;"
        }
    .end annotation
.end field

.field protected final rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

.field protected scriptsType:Lcom/itextpdf/io/font/otf/OpenTypeScript;

.field protected final tableLocation:I

.field private final unitsPerEm:I


# direct methods
.method protected constructor <init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;ILcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;Ljava/util/Map;I)V
    .locals 0
    .param p1, "rf"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .param p2, "tableLocation"    # I
    .param p3, "gdef"    # Lcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;
    .param p5, "unitsPerEm"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/io/source/RandomAccessFileOrArray;",
            "I",
            "Lcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/io/font/otf/Glyph;",
            ">;I)V"
        }
    .end annotation

    .line 48
    .local p4, "indexGlyphMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/io/font/otf/Glyph;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    .line 50
    iput p2, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->tableLocation:I

    .line 51
    iput-object p4, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->indexGlyphMap:Ljava/util/Map;

    .line 52
    iput-object p3, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->gdef:Lcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;

    .line 53
    iput p5, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->unitsPerEm:I

    .line 54
    return-void
.end method

.method private readLookupListTable(I)V
    .locals 5
    .param p1, "lookupListTableLocation"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 241
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->lookupList:Ljava/util/List;

    .line 242
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 243
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v0

    .line 244
    .local v0, "lookupCount":I
    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readUShortArray(II)[I

    move-result-object v1

    .line 246
    .local v1, "lookupTableLocations":[I
    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget v4, v1, v3

    .line 249
    .local v4, "lookupLocation":I
    if-nez v4, :cond_0

    .line 250
    goto :goto_1

    .line 252
    :cond_0
    invoke-direct {p0, v4}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readLookupTable(I)V

    .line 246
    .end local v4    # "lookupLocation":I
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 254
    :cond_1
    return-void
.end method

.method private readLookupTable(I)V
    .locals 6
    .param p1, "lookupTableLocation"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 257
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 258
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v0

    .line 259
    .local v0, "lookupType":I
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v1

    .line 260
    .local v1, "lookupFlag":I
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v2

    .line 261
    .local v2, "subTableCount":I
    invoke-virtual {p0, v2, p1}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readUShortArray(II)[I

    move-result-object v3

    .line 262
    .local v3, "subTableLocations":[I
    iget-object v4, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->lookupList:Ljava/util/List;

    invoke-virtual {p0, v0, v1, v3}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readLookupTable(II[I)Lcom/itextpdf/io/font/otf/OpenTableLookup;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 263
    return-void
.end method


# virtual methods
.method public getFeatureRecords()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/FeatureRecord;",
            ">;"
        }
    .end annotation

    .line 72
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->featuresType:Lcom/itextpdf/io/font/otf/OpenTypeFeature;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/OpenTypeFeature;->getRecords()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getFeatures([Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 7
    .param p1, "scripts"    # [Ljava/lang/String;
    .param p2, "language"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/FeatureRecord;",
            ">;"
        }
    .end annotation

    .line 76
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->scriptsType:Lcom/itextpdf/io/font/otf/OpenTypeScript;

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/io/font/otf/OpenTypeScript;->getLanguageRecord([Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/io/font/otf/LanguageRecord;

    move-result-object v0

    .line 77
    .local v0, "rec":Lcom/itextpdf/io/font/otf/LanguageRecord;
    if-nez v0, :cond_0

    .line 78
    const/4 v1, 0x0

    return-object v1

    .line 80
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 81
    .local v1, "ret":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/FeatureRecord;>;"
    iget-object v2, v0, Lcom/itextpdf/io/font/otf/LanguageRecord;->features:[I

    array-length v3, v2

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_1

    aget v5, v2, v4

    .line 82
    .local v5, "f":I
    iget-object v6, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->featuresType:Lcom/itextpdf/io/font/otf/OpenTypeFeature;

    invoke-virtual {v6, v5}, Lcom/itextpdf/io/font/otf/OpenTypeFeature;->getRecord(I)Lcom/itextpdf/io/font/otf/FeatureRecord;

    move-result-object v6

    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 81
    .end local v5    # "f":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 84
    :cond_1
    return-object v1
.end method

.method public getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;
    .locals 2
    .param p1, "index"    # I

    .line 57
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->indexGlyphMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/font/otf/Glyph;

    return-object v0
.end method

.method public getGlyphClass(I)I
    .locals 1
    .param p1, "glyphCode"    # I

    .line 139
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->gdef:Lcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;->getGlyphClassTable()Lcom/itextpdf/io/font/otf/OtfClass;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/otf/OtfClass;->getOtfClass(I)I

    move-result v0

    return v0
.end method

.method public getLanguageRecord(Ljava/lang/String;)Lcom/itextpdf/io/font/otf/LanguageRecord;
    .locals 1
    .param p1, "otfScriptTag"    # Ljava/lang/String;

    .line 147
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->getLanguageRecord(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/io/font/otf/LanguageRecord;

    move-result-object v0

    return-object v0
.end method

.method public getLanguageRecord(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/io/font/otf/LanguageRecord;
    .locals 8
    .param p1, "otfScriptTag"    # Ljava/lang/String;
    .param p2, "langTag"    # Ljava/lang/String;

    .line 151
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 152
    return-object v0

    .line 154
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->getScriptRecords()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/io/font/otf/ScriptRecord;

    .line 155
    .local v2, "record":Lcom/itextpdf/io/font/otf/ScriptRecord;
    iget-object v3, v2, Lcom/itextpdf/io/font/otf/ScriptRecord;->tag:Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 156
    goto :goto_0

    .line 158
    :cond_1
    if-nez p2, :cond_2

    .line 159
    iget-object v0, v2, Lcom/itextpdf/io/font/otf/ScriptRecord;->defaultLanguage:Lcom/itextpdf/io/font/otf/LanguageRecord;

    return-object v0

    .line 161
    :cond_2
    iget-object v3, v2, Lcom/itextpdf/io/font/otf/ScriptRecord;->languages:[Lcom/itextpdf/io/font/otf/LanguageRecord;

    array-length v4, v3

    const/4 v5, 0x0

    :goto_1
    if-ge v5, v4, :cond_4

    aget-object v6, v3, v5

    .line 162
    .local v6, "lang":Lcom/itextpdf/io/font/otf/LanguageRecord;
    iget-object v7, v6, Lcom/itextpdf/io/font/otf/LanguageRecord;->tag:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 163
    return-object v6

    .line 161
    .end local v6    # "lang":Lcom/itextpdf/io/font/otf/LanguageRecord;
    :cond_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 166
    .end local v2    # "record":Lcom/itextpdf/io/font/otf/ScriptRecord;
    :cond_4
    goto :goto_0

    .line 167
    :cond_5
    return-object v0
.end method

.method public getLookupTable(I)Lcom/itextpdf/io/font/otf/OpenTableLookup;
    .locals 1
    .param p1, "idx"    # I

    .line 61
    if-ltz p1, :cond_1

    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->lookupList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lt p1, v0, :cond_0

    goto :goto_0

    .line 64
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->lookupList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/font/otf/OpenTableLookup;

    return-object v0

    .line 62
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getLookups(Lcom/itextpdf/io/font/otf/FeatureRecord;)Ljava/util/List;
    .locals 6
    .param p1, "feature"    # Lcom/itextpdf/io/font/otf/FeatureRecord;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/io/font/otf/FeatureRecord;",
            ")",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/OpenTableLookup;",
            ">;"
        }
    .end annotation

    .line 127
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p1, Lcom/itextpdf/io/font/otf/FeatureRecord;->lookups:[I

    array-length v1, v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 128
    .local v0, "ret":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/OpenTableLookup;>;"
    iget-object v1, p1, Lcom/itextpdf/io/font/otf/FeatureRecord;->lookups:[I

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget v4, v1, v3

    .line 129
    .local v4, "idx":I
    iget-object v5, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->lookupList:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 128
    .end local v4    # "idx":I
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 131
    :cond_0
    return-object v0
.end method

.method public getLookups([Lcom/itextpdf/io/font/otf/FeatureRecord;)Ljava/util/List;
    .locals 10
    .param p1, "features"    # [Lcom/itextpdf/io/font/otf/FeatureRecord;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/itextpdf/io/font/otf/FeatureRecord;",
            ")",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/OpenTableLookup;",
            ">;"
        }
    .end annotation

    .line 113
    new-instance v0, Lcom/itextpdf/io/util/IntHashtable;

    invoke-direct {v0}, Lcom/itextpdf/io/util/IntHashtable;-><init>()V

    .line 114
    .local v0, "hash":Lcom/itextpdf/io/util/IntHashtable;
    array-length v1, p1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_1

    aget-object v4, p1, v3

    .line 115
    .local v4, "rec":Lcom/itextpdf/io/font/otf/FeatureRecord;
    iget-object v5, v4, Lcom/itextpdf/io/font/otf/FeatureRecord;->lookups:[I

    array-length v6, v5

    move v7, v2

    :goto_1
    if-ge v7, v6, :cond_0

    aget v8, v5, v7

    .line 116
    .local v8, "idx":I
    const/4 v9, 0x1

    invoke-virtual {v0, v8, v9}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 115
    .end local v8    # "idx":I
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 114
    .end local v4    # "rec":Lcom/itextpdf/io/font/otf/FeatureRecord;
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 119
    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 120
    .local v1, "ret":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/OpenTableLookup;>;"
    invoke-virtual {v0}, Lcom/itextpdf/io/util/IntHashtable;->toOrderedKeys()[I

    move-result-object v3

    array-length v4, v3

    :goto_2
    if-ge v2, v4, :cond_2

    aget v5, v3, v2

    .line 121
    .local v5, "idx":I
    iget-object v6, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->lookupList:Ljava/util/List;

    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 120
    .end local v5    # "idx":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 123
    :cond_2
    return-object v1
.end method

.method public getRequiredFeature([Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/io/font/otf/FeatureRecord;
    .locals 3
    .param p1, "scripts"    # [Ljava/lang/String;
    .param p2, "language"    # Ljava/lang/String;

    .line 106
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->scriptsType:Lcom/itextpdf/io/font/otf/OpenTypeScript;

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/io/font/otf/OpenTypeScript;->getLanguageRecord([Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/io/font/otf/LanguageRecord;

    move-result-object v0

    .line 107
    .local v0, "rec":Lcom/itextpdf/io/font/otf/LanguageRecord;
    if-nez v0, :cond_0

    .line 108
    const/4 v1, 0x0

    return-object v1

    .line 109
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->featuresType:Lcom/itextpdf/io/font/otf/OpenTypeFeature;

    iget v2, v0, Lcom/itextpdf/io/font/otf/LanguageRecord;->featureRequired:I

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/font/otf/OpenTypeFeature;->getRecord(I)Lcom/itextpdf/io/font/otf/FeatureRecord;

    move-result-object v1

    return-object v1
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

    .line 68
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->scriptsType:Lcom/itextpdf/io/font/otf/OpenTypeScript;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/OpenTypeScript;->getScriptRecords()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getSpecificFeatures(Ljava/util/List;[Ljava/lang/String;)Ljava/util/List;
    .locals 5
    .param p2, "specific"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/FeatureRecord;",
            ">;[",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/FeatureRecord;",
            ">;"
        }
    .end annotation

    .line 88
    .local p1, "features":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/FeatureRecord;>;"
    if-nez p2, :cond_0

    .line 89
    return-object p1

    .line 91
    :cond_0
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 93
    .local v0, "hs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    array-length v1, p2

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, p2, v2

    .line 94
    .local v3, "s":Ljava/lang/String;
    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 93
    .end local v3    # "s":Ljava/lang/String;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 96
    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 97
    .local v1, "recs":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/FeatureRecord;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/io/font/otf/FeatureRecord;

    .line 98
    .local v3, "rec":Lcom/itextpdf/io/font/otf/FeatureRecord;
    iget-object v4, v3, Lcom/itextpdf/io/font/otf/FeatureRecord;->tag:Ljava/lang/String;

    invoke-interface {v0, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 99
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    .end local v3    # "rec":Lcom/itextpdf/io/font/otf/FeatureRecord;
    :cond_2
    goto :goto_1

    .line 102
    :cond_3
    return-object v1
.end method

.method public getUnitsPerEm()I
    .locals 1

    .line 143
    iget v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->unitsPerEm:I

    return v0
.end method

.method public isSkip(II)Z
    .locals 1
    .param p1, "glyph"    # I
    .param p2, "flag"    # I

    .line 135
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->gdef:Lcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;->isSkip(II)Z

    move-result v0

    return v0
.end method

.method protected final readClassDefinition(I)Lcom/itextpdf/io/font/otf/OtfClass;
    .locals 1
    .param p1, "classLocation"    # I

    .line 174
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-static {v0, p1}, Lcom/itextpdf/io/font/otf/OtfClass;->create(Lcom/itextpdf/io/source/RandomAccessFileOrArray;I)Lcom/itextpdf/io/font/otf/OtfClass;

    move-result-object v0

    return-object v0
.end method

.method protected final readCoverageFormat(I)Ljava/util/List;
    .locals 1
    .param p1, "coverageLocation"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 191
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-static {v0, p1}, Lcom/itextpdf/io/font/otf/OtfReadCommon;->readCoverageFormat(Lcom/itextpdf/io/source/RandomAccessFileOrArray;I)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected readCoverages([ILjava/util/List;)V
    .locals 1
    .param p1, "locations"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I",
            "Ljava/util/List<",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 186
    .local p2, "coverage":Ljava/util/List;, "Ljava/util/List<Ljava/util/Set<Ljava/lang/Integer;>;>;"
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-static {v0, p1, p2}, Lcom/itextpdf/io/font/otf/OtfReadCommon;->readCoverages(Lcom/itextpdf/io/source/RandomAccessFileOrArray;[ILjava/util/List;)V

    .line 187
    return-void
.end method

.method protected abstract readLookupTable(II[I)Lcom/itextpdf/io/font/otf/OpenTableLookup;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected readPosLookupRecords(I)[Lcom/itextpdf/io/font/otf/PosLookupRecord;
    .locals 1
    .param p1, "substCount"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 199
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-static {v0, p1}, Lcom/itextpdf/io/font/otf/OtfReadCommon;->readPosLookupRecords(Lcom/itextpdf/io/source/RandomAccessFileOrArray;I)[Lcom/itextpdf/io/font/otf/PosLookupRecord;

    move-result-object v0

    return-object v0
.end method

.method protected readSubstLookupRecords(I)[Lcom/itextpdf/io/font/otf/SubstLookupRecord;
    .locals 1
    .param p1, "substCount"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 195
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-static {v0, p1}, Lcom/itextpdf/io/font/otf/OtfReadCommon;->readSubstLookupRecords(Lcom/itextpdf/io/source/RandomAccessFileOrArray;I)[Lcom/itextpdf/io/font/otf/SubstLookupRecord;

    move-result-object v0

    return-object v0
.end method

.method protected readTagAndLocations(I)[Lcom/itextpdf/io/font/otf/TagAndLocation;
    .locals 7
    .param p1, "baseLocation"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 203
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v0

    .line 204
    .local v0, "count":I
    new-array v1, v0, [Lcom/itextpdf/io/font/otf/TagAndLocation;

    .line 205
    .local v1, "tagslLocs":[Lcom/itextpdf/io/font/otf/TagAndLocation;
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_0
    if-ge v2, v0, :cond_0

    .line 206
    new-instance v3, Lcom/itextpdf/io/font/otf/TagAndLocation;

    invoke-direct {v3}, Lcom/itextpdf/io/font/otf/TagAndLocation;-><init>()V

    .line 207
    .local v3, "tl":Lcom/itextpdf/io/font/otf/TagAndLocation;
    iget-object v4, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    const/4 v5, 0x4

    const-string/jumbo v6, "utf-8"

    invoke-virtual {v4, v5, v6}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readString(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/itextpdf/io/font/otf/TagAndLocation;->tag:Ljava/lang/String;

    .line 208
    iget-object v4, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v4

    add-int/2addr v4, p1

    iput v4, v3, Lcom/itextpdf/io/font/otf/TagAndLocation;->location:I

    .line 209
    aput-object v3, v1, v2

    .line 205
    .end local v3    # "tl":Lcom/itextpdf/io/font/otf/TagAndLocation;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 211
    .end local v2    # "k":I
    :cond_0
    return-object v1
.end method

.method protected final readUShortArray(I)[I
    .locals 1
    .param p1, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 182
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-static {v0, p1}, Lcom/itextpdf/io/font/otf/OtfReadCommon;->readUShortArray(Lcom/itextpdf/io/source/RandomAccessFileOrArray;I)[I

    move-result-object v0

    return-object v0
.end method

.method protected final readUShortArray(II)[I
    .locals 1
    .param p1, "size"    # I
    .param p2, "location"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 178
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-static {v0, p1, p2}, Lcom/itextpdf/io/font/otf/OtfReadCommon;->readUShortArray(Lcom/itextpdf/io/source/RandomAccessFileOrArray;II)[I

    move-result-object v0

    return-object v0
.end method

.method final startReadingTable()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/io/font/otf/FontReadingException;
        }
    .end annotation

    .line 222
    :try_start_0
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget v1, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->tableLocation:I

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 225
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    .line 226
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v0

    .line 227
    .local v0, "scriptListOffset":I
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v1

    .line 228
    .local v1, "featureListOffset":I
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v2

    .line 230
    .local v2, "lookupListOffset":I
    new-instance v3, Lcom/itextpdf/io/font/otf/OpenTypeScript;

    iget v4, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->tableLocation:I

    add-int/2addr v4, v0

    invoke-direct {v3, p0, v4}, Lcom/itextpdf/io/font/otf/OpenTypeScript;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)V

    iput-object v3, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->scriptsType:Lcom/itextpdf/io/font/otf/OpenTypeScript;

    .line 232
    new-instance v3, Lcom/itextpdf/io/font/otf/OpenTypeFeature;

    iget v4, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->tableLocation:I

    add-int/2addr v4, v1

    invoke-direct {v3, p0, v4}, Lcom/itextpdf/io/font/otf/OpenTypeFeature;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)V

    iput-object v3, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->featuresType:Lcom/itextpdf/io/font/otf/OpenTypeFeature;

    .line 234
    iget v3, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->tableLocation:I

    add-int/2addr v3, v2

    invoke-direct {p0, v3}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readLookupListTable(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 237
    .end local v0    # "scriptListOffset":I
    .end local v1    # "featureListOffset":I
    .end local v2    # "lookupListOffset":I
    nop

    .line 238
    return-void

    .line 235
    :catch_0
    move-exception v0

    .line 236
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/itextpdf/io/font/otf/FontReadingException;

    const-string v2, "Error reading font file"

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/io/font/otf/FontReadingException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v1
.end method
