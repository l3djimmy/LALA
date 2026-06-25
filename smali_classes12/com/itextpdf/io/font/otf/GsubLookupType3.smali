.class public Lcom/itextpdf/io/font/otf/GsubLookupType3;
.super Lcom/itextpdf/io/font/otf/OpenTableLookup;
.source "GsubLookupType3.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private substMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "[I>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 32
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I[I)V
    .locals 1
    .param p1, "openReader"    # Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;
    .param p2, "lookupFlag"    # I
    .param p3, "subTableLocations"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 37
    invoke-direct {p0, p1, p2, p3}, Lcom/itextpdf/io/font/otf/OpenTableLookup;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I[I)V

    .line 38
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/GsubLookupType3;->substMap:Ljava/util/Map;

    .line 39
    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/GsubLookupType3;->readSubTables()V

    .line 40
    return-void
.end method


# virtual methods
.method public hasSubstitution(I)Z
    .locals 2
    .param p1, "index"    # I

    .line 84
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GsubLookupType3;->substMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected readSubTable(I)V
    .locals 10
    .param p1, "subTableLocation"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 64
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GsubLookupType3;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v0, v0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 65
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GsubLookupType3;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v0, v0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v0

    .line 66
    .local v0, "substFormat":I
    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    .line 67
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/GsubLookupType3;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v1, v1, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v1

    .line 68
    .local v1, "coverage":I
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GsubLookupType3;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v2, v2, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v2

    .line 69
    .local v2, "alternateSetCount":I
    new-array v3, v2, [[I

    .line 70
    .local v3, "substitute":[[I
    iget-object v4, p0, Lcom/itextpdf/io/font/otf/GsubLookupType3;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-virtual {v4, v2, p1}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readUShortArray(II)[I

    move-result-object v4

    .line 71
    .local v4, "alternateLocations":[I
    const/4 v5, 0x0

    .local v5, "k":I
    :goto_0
    if-ge v5, v2, :cond_0

    .line 72
    iget-object v6, p0, Lcom/itextpdf/io/font/otf/GsubLookupType3;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v6, v6, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    aget v7, v4, v5

    int-to-long v7, v7

    invoke-virtual {v6, v7, v8}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 73
    iget-object v6, p0, Lcom/itextpdf/io/font/otf/GsubLookupType3;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v6, v6, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v6}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v6

    .line 74
    .local v6, "glyphCount":I
    iget-object v7, p0, Lcom/itextpdf/io/font/otf/GsubLookupType3;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-virtual {v7, v6}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readUShortArray(I)[I

    move-result-object v7

    aput-object v7, v3, v5

    .line 71
    .end local v6    # "glyphCount":I
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 76
    .end local v5    # "k":I
    :cond_0
    iget-object v5, p0, Lcom/itextpdf/io/font/otf/GsubLookupType3;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    add-int v6, p1, v1

    invoke-virtual {v5, v6}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->readCoverageFormat(I)Ljava/util/List;

    move-result-object v5

    .line 77
    .local v5, "coverageGlyphIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v6, 0x0

    .local v6, "k":I
    :goto_1
    if-ge v6, v2, :cond_1

    .line 78
    iget-object v7, p0, Lcom/itextpdf/io/font/otf/GsubLookupType3;->substMap:Ljava/util/Map;

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    aget-object v9, v3, v6

    invoke-interface {v7, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 80
    .end local v6    # "k":I
    :cond_1
    return-void

    .line 66
    .end local v1    # "coverage":I
    .end local v2    # "alternateSetCount":I
    .end local v3    # "substitute":[[I
    .end local v4    # "alternateLocations":[I
    .end local v5    # "coverageGlyphIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_2
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
.end method

.method public transformOne(Lcom/itextpdf/io/font/otf/GlyphLine;)Z
    .locals 6
    .param p1, "line"    # Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 44
    iget v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    iget v1, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    const/4 v2, 0x0

    if-lt v0, v1, :cond_0

    .line 45
    return v2

    .line 47
    :cond_0
    iget v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    invoke-virtual {p1, v0}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    .line 48
    .local v0, "g":Lcom/itextpdf/io/font/otf/Glyph;
    const/4 v1, 0x0

    .line 49
    .local v1, "changed":Z
    iget-object v3, p0, Lcom/itextpdf/io/font/otf/GsubLookupType3;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v4

    iget v5, p0, Lcom/itextpdf/io/font/otf/GsubLookupType3;->lookupFlag:I

    invoke-virtual {v3, v4, v5}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->isSkip(II)Z

    move-result v3

    if-nez v3, :cond_1

    .line 50
    iget-object v3, p0, Lcom/itextpdf/io/font/otf/GsubLookupType3;->substMap:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [I

    .line 53
    .local v3, "substCode":[I
    if-eqz v3, :cond_1

    aget v4, v3, v2

    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v5

    if-eq v4, v5, :cond_1

    .line 54
    iget-object v4, p0, Lcom/itextpdf/io/font/otf/GsubLookupType3;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    aget v2, v3, v2

    invoke-virtual {p1, v4, v2}, Lcom/itextpdf/io/font/otf/GlyphLine;->substituteOneToOne(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)V

    .line 55
    const/4 v1, 0x1

    .line 58
    .end local v3    # "substCode":[I
    :cond_1
    iget v2, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    .line 59
    return v1
.end method
