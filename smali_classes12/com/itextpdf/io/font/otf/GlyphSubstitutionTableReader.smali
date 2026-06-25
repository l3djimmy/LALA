.class public Lcom/itextpdf/io/font/otf/GlyphSubstitutionTableReader;
.super Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;
.source "GlyphSubstitutionTableReader.java"


# direct methods
.method public constructor <init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;ILcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;Ljava/util/Map;I)V
    .locals 0
    .param p1, "rf"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .param p2, "gsubTableLocation"    # I
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

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 40
    .local p4, "indexGlyphMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/io/font/otf/Glyph;>;"
    invoke-direct/range {p0 .. p5}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;-><init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;ILcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;Ljava/util/Map;I)V

    .line 41
    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/GlyphSubstitutionTableReader;->startReadingTable()V

    .line 42
    return-void
.end method


# virtual methods
.method protected readLookupTable(II[I)Lcom/itextpdf/io/font/otf/OpenTableLookup;
    .locals 5
    .param p1, "lookupType"    # I
    .param p2, "lookupFlag"    # I
    .param p3, "subTableLocations"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 46
    const/4 v0, 0x7

    if-ne p1, v0, :cond_0

    .line 47
    const/4 v0, 0x0

    .local v0, "k":I
    :goto_0
    array-length v1, p3

    if-ge v0, v1, :cond_0

    .line 48
    aget v1, p3, v0

    .line 49
    .local v1, "location":I
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GlyphSubstitutionTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    int-to-long v3, v1

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 50
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GlyphSubstitutionTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    .line 51
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GlyphSubstitutionTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result p1

    .line 52
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GlyphSubstitutionTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v2

    add-int/2addr v1, v2

    .line 53
    aput v1, p3, v0

    .line 47
    .end local v1    # "location":I
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 56
    .end local v0    # "k":I
    :cond_0
    packed-switch p1, :pswitch_data_0

    .line 70
    const/4 v0, 0x0

    return-object v0

    .line 68
    :pswitch_0
    new-instance v0, Lcom/itextpdf/io/font/otf/GsubLookupType6;

    invoke-direct {v0, p0, p2, p3}, Lcom/itextpdf/io/font/otf/GsubLookupType6;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I[I)V

    return-object v0

    .line 66
    :pswitch_1
    new-instance v0, Lcom/itextpdf/io/font/otf/GsubLookupType5;

    invoke-direct {v0, p0, p2, p3}, Lcom/itextpdf/io/font/otf/GsubLookupType5;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I[I)V

    return-object v0

    .line 64
    :pswitch_2
    new-instance v0, Lcom/itextpdf/io/font/otf/GsubLookupType4;

    invoke-direct {v0, p0, p2, p3}, Lcom/itextpdf/io/font/otf/GsubLookupType4;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I[I)V

    return-object v0

    .line 62
    :pswitch_3
    new-instance v0, Lcom/itextpdf/io/font/otf/GsubLookupType3;

    invoke-direct {v0, p0, p2, p3}, Lcom/itextpdf/io/font/otf/GsubLookupType3;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I[I)V

    return-object v0

    .line 60
    :pswitch_4
    new-instance v0, Lcom/itextpdf/io/font/otf/GsubLookupType2;

    invoke-direct {v0, p0, p2, p3}, Lcom/itextpdf/io/font/otf/GsubLookupType2;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I[I)V

    return-object v0

    .line 58
    :pswitch_5
    new-instance v0, Lcom/itextpdf/io/font/otf/GsubLookupType1;

    invoke-direct {v0, p0, p2, p3}, Lcom/itextpdf/io/font/otf/GsubLookupType1;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I[I)V

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
