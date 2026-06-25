.class public Lcom/itextpdf/io/font/otf/GlyphPositioningTableReader;
.super Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;
.source "GlyphPositioningTableReader.java"


# direct methods
.method public constructor <init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;ILcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;Ljava/util/Map;I)V
    .locals 0
    .param p1, "rf"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .param p2, "gposTableLocation"    # I
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

    .line 39
    .local p4, "indexGlyphMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/itextpdf/io/font/otf/Glyph;>;"
    invoke-direct/range {p0 .. p5}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;-><init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;ILcom/itextpdf/io/font/otf/OpenTypeGdefTableReader;Ljava/util/Map;I)V

    .line 40
    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/GlyphPositioningTableReader;->startReadingTable()V

    .line 41
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

    .line 45
    const/16 v0, 0x9

    if-ne p1, v0, :cond_0

    .line 46
    const/4 v0, 0x0

    .local v0, "k":I
    :goto_0
    array-length v1, p3

    if-ge v0, v1, :cond_0

    .line 47
    aget v1, p3, v0

    .line 48
    .local v1, "location":I
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GlyphPositioningTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    int-to-long v3, v1

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 49
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GlyphPositioningTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    .line 50
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GlyphPositioningTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result p1

    .line 51
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GlyphPositioningTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readInt()I

    move-result v2

    add-int/2addr v1, v2

    .line 52
    aput v1, p3, v0

    .line 46
    .end local v1    # "location":I
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 55
    .end local v0    # "k":I
    :cond_0
    packed-switch p1, :pswitch_data_0

    .line 71
    :pswitch_0
    const/4 v0, 0x0

    return-object v0

    .line 69
    :pswitch_1
    new-instance v0, Lcom/itextpdf/io/font/otf/GposLookupType8;

    invoke-direct {v0, p0, p2, p3}, Lcom/itextpdf/io/font/otf/GposLookupType8;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I[I)V

    return-object v0

    .line 67
    :pswitch_2
    new-instance v0, Lcom/itextpdf/io/font/otf/GposLookupType7;

    invoke-direct {v0, p0, p2, p3}, Lcom/itextpdf/io/font/otf/GposLookupType7;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I[I)V

    return-object v0

    .line 65
    :pswitch_3
    new-instance v0, Lcom/itextpdf/io/font/otf/GposLookupType6;

    invoke-direct {v0, p0, p2, p3}, Lcom/itextpdf/io/font/otf/GposLookupType6;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I[I)V

    return-object v0

    .line 63
    :pswitch_4
    new-instance v0, Lcom/itextpdf/io/font/otf/GposLookupType5;

    invoke-direct {v0, p0, p2, p3}, Lcom/itextpdf/io/font/otf/GposLookupType5;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I[I)V

    return-object v0

    .line 61
    :pswitch_5
    new-instance v0, Lcom/itextpdf/io/font/otf/GposLookupType4;

    invoke-direct {v0, p0, p2, p3}, Lcom/itextpdf/io/font/otf/GposLookupType4;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I[I)V

    return-object v0

    .line 59
    :pswitch_6
    new-instance v0, Lcom/itextpdf/io/font/otf/GposLookupType2;

    invoke-direct {v0, p0, p2, p3}, Lcom/itextpdf/io/font/otf/GposLookupType2;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I[I)V

    return-object v0

    .line 57
    :pswitch_7
    new-instance v0, Lcom/itextpdf/io/font/otf/GposLookupType1;

    invoke-direct {v0, p0, p2, p3}, Lcom/itextpdf/io/font/otf/GposLookupType1;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I[I)V

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
