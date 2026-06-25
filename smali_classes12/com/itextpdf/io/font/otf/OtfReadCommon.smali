.class public Lcom/itextpdf/io/font/otf/OtfReadCommon;
.super Ljava/lang/Object;
.source "OtfReadCommon.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static readAnchorArray(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;[III)[Lcom/itextpdf/io/font/otf/GposAnchor;
    .locals 4
    .param p0, "tableReader"    # Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;
    .param p1, "locations"    # [I
    .param p2, "left"    # I
    .param p3, "right"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 196
    sub-int v0, p3, p2

    new-array v0, v0, [Lcom/itextpdf/io/font/otf/GposAnchor;

    .line 197
    .local v0, "anchors":[Lcom/itextpdf/io/font/otf/GposAnchor;
    move v1, p2

    .local v1, "i":I
    :goto_0
    if-ge v1, p3, :cond_0

    .line 198
    sub-int v2, v1, p2

    aget v3, p1, v1

    invoke-static {p0, v3}, Lcom/itextpdf/io/font/otf/OtfReadCommon;->readGposAnchor(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)Lcom/itextpdf/io/font/otf/GposAnchor;

    move-result-object v3

    aput-object v3, v0, v2

    .line 197
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 200
    .end local v1    # "i":I
    :cond_0
    return-object v0
.end method

.method public static readBaseArray(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;II)Ljava/util/List;
    .locals 6
    .param p0, "tableReader"    # Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;
    .param p1, "classCount"    # I
    .param p2, "location"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;",
            "II)",
            "Ljava/util/List<",
            "[",
            "Lcom/itextpdf/io/font/otf/GposAnchor;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 205
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 206
    .local v0, "baseArray":Ljava/util/List;, "Ljava/util/List<[Lcom/itextpdf/io/font/otf/GposAnchor;>;"
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    int-to-long v2, p2

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 207
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v1

    .line 208
    .local v1, "baseCount":I
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    mul-int v3, v1, p1

    invoke-static {v2, v3, p2}, Lcom/itextpdf/io/font/otf/OtfReadCommon;->readUShortArray(Lcom/itextpdf/io/source/RandomAccessFileOrArray;II)[I

    move-result-object v2

    .line 209
    .local v2, "anchorLocations":[I
    const/4 v3, 0x0

    .line 210
    .local v3, "idx":I
    const/4 v4, 0x0

    .local v4, "k":I
    :goto_0
    if-ge v4, v1, :cond_0

    .line 211
    add-int v5, v3, p1

    invoke-static {p0, v2, v3, v5}, Lcom/itextpdf/io/font/otf/OtfReadCommon;->readAnchorArray(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;[III)[Lcom/itextpdf/io/font/otf/GposAnchor;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 212
    add-int/2addr v3, p1

    .line 210
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 214
    .end local v4    # "k":I
    :cond_0
    return-object v0
.end method

.method public static readCoverageFormat(Lcom/itextpdf/io/source/RandomAccessFileOrArray;I)Ljava/util/List;
    .locals 6
    .param p0, "rf"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .param p1, "coverageLocation"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/io/source/RandomAccessFileOrArray;",
            "I)",
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

    .line 58
    int-to-long v0, p1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 59
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v0

    .line 61
    .local v0, "coverageFormat":I
    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 62
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v1

    .line 63
    .local v1, "glyphCount":I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 64
    .local v2, "glyphIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v1, :cond_0

    .line 65
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v4

    .line 66
    .local v4, "coverageGlyphId":I
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    .end local v4    # "coverageGlyphId":I
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 68
    .end local v1    # "glyphCount":I
    .end local v3    # "i":I
    :cond_0
    goto :goto_2

    .end local v2    # "glyphIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_1
    const/4 v1, 0x2

    if-ne v0, v1, :cond_3

    .line 69
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v1

    .line 70
    .local v1, "rangeCount":I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 71
    .restart local v2    # "glyphIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_1
    if-ge v3, v1, :cond_2

    .line 72
    invoke-static {p0, v2}, Lcom/itextpdf/io/font/otf/OtfReadCommon;->readRangeRecord(Lcom/itextpdf/io/source/RandomAccessFileOrArray;Ljava/util/List;)V

    .line 71
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 75
    .end local v1    # "rangeCount":I
    .end local v3    # "i":I
    :cond_2
    nop

    .line 80
    :goto_2
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    return-object v1

    .line 76
    .end local v2    # "glyphIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_3
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    .line 77
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const-string v3, "Invalid coverage format: {0}"

    invoke-static {v3, v2}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static readCoverages(Lcom/itextpdf/io/source/RandomAccessFileOrArray;[ILjava/util/List;)V
    .locals 5
    .param p0, "rf"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .param p1, "locations"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/io/source/RandomAccessFileOrArray;",
            "[I",
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

    .line 51
    .local p2, "coverage":Ljava/util/List;, "Ljava/util/List<Ljava/util/Set<Ljava/lang/Integer;>;>;"
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget v2, p1, v1

    .line 52
    .local v2, "location":I
    new-instance v3, Ljava/util/HashSet;

    invoke-static {p0, v2}, Lcom/itextpdf/io/font/otf/OtfReadCommon;->readCoverageFormat(Lcom/itextpdf/io/source/RandomAccessFileOrArray;I)Ljava/util/List;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-interface {p2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    .end local v2    # "location":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 54
    :cond_0
    return-void
.end method

.method public static readGposAnchor(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)Lcom/itextpdf/io/font/otf/GposAnchor;
    .locals 4
    .param p0, "tableReader"    # Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;
    .param p1, "location"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 129
    if-nez p1, :cond_0

    .line 130
    const/4 v0, 0x0

    return-object v0

    .line 132
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 133
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v0

    .line 134
    .local v0, "format":I
    const/4 v1, 0x0

    .line 136
    .local v1, "t":Lcom/itextpdf/io/font/otf/GposAnchor;
    nop

    .line 138
    new-instance v2, Lcom/itextpdf/io/font/otf/GposAnchor;

    invoke-direct {v2}, Lcom/itextpdf/io/font/otf/GposAnchor;-><init>()V

    .line 139
    .end local v1    # "t":Lcom/itextpdf/io/font/otf/GposAnchor;
    .local v2, "t":Lcom/itextpdf/io/font/otf/GposAnchor;
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v1

    invoke-static {v1}, Lcom/itextpdf/io/font/FontProgram;->convertGlyphSpaceToTextSpace(I)I

    move-result v1

    .line 140
    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->getUnitsPerEm()I

    move-result v3

    div-int/2addr v1, v3

    iput v1, v2, Lcom/itextpdf/io/font/otf/GposAnchor;->XCoordinate:I

    .line 141
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v1

    invoke-static {v1}, Lcom/itextpdf/io/font/FontProgram;->convertGlyphSpaceToTextSpace(I)I

    move-result v1

    .line 142
    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->getUnitsPerEm()I

    move-result v3

    div-int/2addr v1, v3

    iput v1, v2, Lcom/itextpdf/io/font/otf/GposAnchor;->YCoordinate:I

    .line 146
    return-object v2
.end method

.method public static readGposValueRecord(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)Lcom/itextpdf/io/font/otf/GposValueRecord;
    .locals 4
    .param p0, "tableReader"    # Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;
    .param p1, "mask"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 95
    new-instance v0, Lcom/itextpdf/io/font/otf/GposValueRecord;

    invoke-direct {v0}, Lcom/itextpdf/io/font/otf/GposValueRecord;-><init>()V

    .line 96
    .local v0, "vr":Lcom/itextpdf/io/font/otf/GposValueRecord;
    and-int/lit8 v1, p1, 0x1

    if-eqz v1, :cond_0

    .line 97
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    .line 98
    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v1

    invoke-static {v1}, Lcom/itextpdf/io/font/FontProgram;->convertGlyphSpaceToTextSpace(I)I

    move-result v1

    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->getUnitsPerEm()I

    move-result v2

    div-int/2addr v1, v2

    iput v1, v0, Lcom/itextpdf/io/font/otf/GposValueRecord;->XPlacement:I

    .line 100
    :cond_0
    and-int/lit8 v1, p1, 0x2

    if-eqz v1, :cond_1

    .line 101
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    .line 102
    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v1

    invoke-static {v1}, Lcom/itextpdf/io/font/FontProgram;->convertGlyphSpaceToTextSpace(I)I

    move-result v1

    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->getUnitsPerEm()I

    move-result v2

    div-int/2addr v1, v2

    iput v1, v0, Lcom/itextpdf/io/font/otf/GposValueRecord;->YPlacement:I

    .line 104
    :cond_1
    and-int/lit8 v1, p1, 0x4

    if-eqz v1, :cond_2

    .line 105
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    .line 106
    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v1

    invoke-static {v1}, Lcom/itextpdf/io/font/FontProgram;->convertGlyphSpaceToTextSpace(I)I

    move-result v1

    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->getUnitsPerEm()I

    move-result v2

    div-int/2addr v1, v2

    iput v1, v0, Lcom/itextpdf/io/font/otf/GposValueRecord;->XAdvance:I

    .line 108
    :cond_2
    and-int/lit8 v1, p1, 0x8

    if-eqz v1, :cond_3

    .line 109
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    .line 110
    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v1

    invoke-static {v1}, Lcom/itextpdf/io/font/FontProgram;->convertGlyphSpaceToTextSpace(I)I

    move-result v1

    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->getUnitsPerEm()I

    move-result v2

    div-int/2addr v1, v2

    iput v1, v0, Lcom/itextpdf/io/font/otf/GposValueRecord;->YAdvance:I

    .line 112
    :cond_3
    and-int/lit8 v1, p1, 0x10

    const-wide/16 v2, 0x2

    if-eqz v1, :cond_4

    .line 113
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->skip(J)J

    .line 115
    :cond_4
    and-int/lit8 v1, p1, 0x20

    if-eqz v1, :cond_5

    .line 116
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->skip(J)J

    .line 118
    :cond_5
    and-int/lit8 v1, p1, 0x40

    if-eqz v1, :cond_6

    .line 119
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->skip(J)J

    .line 121
    :cond_6
    and-int/lit16 v1, p1, 0x80

    if-eqz v1, :cond_7

    .line 122
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->skip(J)J

    .line 124
    :cond_7
    return-object v0
.end method

.method public static readLigatureArray(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;II)Ljava/util/List;
    .locals 11
    .param p0, "tableReader"    # Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;
    .param p1, "classCount"    # I
    .param p2, "location"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;",
            "II)",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "[",
            "Lcom/itextpdf/io/font/otf/GposAnchor;",
            ">;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 219
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 220
    .local v0, "ligatureArray":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<[Lcom/itextpdf/io/font/otf/GposAnchor;>;>;"
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    int-to-long v2, p2

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 221
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v1

    .line 222
    .local v1, "ligatureCount":I
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-static {v2, v1, p2}, Lcom/itextpdf/io/font/otf/OtfReadCommon;->readUShortArray(Lcom/itextpdf/io/source/RandomAccessFileOrArray;II)[I

    move-result-object v2

    .line 223
    .local v2, "ligatureAttachLocations":[I
    const/4 v3, 0x0

    .local v3, "liga":I
    :goto_0
    if-ge v3, v1, :cond_1

    .line 224
    aget v4, v2, v3

    .line 225
    .local v4, "ligatureAttachLocation":I
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 226
    .local v5, "ligatureAttach":Ljava/util/List;, "Ljava/util/List<[Lcom/itextpdf/io/font/otf/GposAnchor;>;"
    iget-object v6, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    int-to-long v7, v4

    invoke-virtual {v6, v7, v8}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 227
    iget-object v6, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v6}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v6

    .line 228
    .local v6, "componentCount":I
    iget-object v7, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    mul-int v8, p1, v6

    invoke-static {v7, v8, v4}, Lcom/itextpdf/io/font/otf/OtfReadCommon;->readUShortArray(Lcom/itextpdf/io/source/RandomAccessFileOrArray;II)[I

    move-result-object v7

    .line 230
    .local v7, "componentRecordsLocation":[I
    const/4 v8, 0x0

    .line 231
    .local v8, "idx":I
    const/4 v9, 0x0

    .local v9, "k":I
    :goto_1
    if-ge v9, v6, :cond_0

    .line 232
    add-int v10, v8, p1

    invoke-static {p0, v7, v8, v10}, Lcom/itextpdf/io/font/otf/OtfReadCommon;->readAnchorArray(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;[III)[Lcom/itextpdf/io/font/otf/GposAnchor;

    move-result-object v10

    invoke-interface {v5, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 233
    add-int/2addr v8, p1

    .line 231
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 235
    .end local v9    # "k":I
    :cond_0
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 223
    .end local v4    # "ligatureAttachLocation":I
    .end local v5    # "ligatureAttach":Ljava/util/List;, "Ljava/util/List<[Lcom/itextpdf/io/font/otf/GposAnchor;>;"
    .end local v6    # "componentCount":I
    .end local v7    # "componentRecordsLocation":[I
    .end local v8    # "idx":I
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 237
    .end local v3    # "liga":I
    :cond_1
    return-object v0
.end method

.method public static readMarkArray(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)Ljava/util/List;
    .locals 7
    .param p0, "tableReader"    # Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;
    .param p1, "location"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;",
            "I)",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/OtfMarkRecord;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 151
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 152
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v0

    .line 153
    .local v0, "markCount":I
    new-array v1, v0, [I

    .line 154
    .local v1, "classes":[I
    new-array v2, v0, [I

    .line 155
    .local v2, "locations":[I
    const/4 v3, 0x0

    .local v3, "k":I
    :goto_0
    if-ge v3, v0, :cond_0

    .line 156
    iget-object v4, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v4

    aput v4, v1, v3

    .line 157
    iget-object v4, p0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v4

    .line 158
    .local v4, "offset":I
    add-int v5, p1, v4

    aput v5, v2, v3

    .line 155
    .end local v4    # "offset":I
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 160
    .end local v3    # "k":I
    :cond_0
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 161
    .local v3, "marks":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/OtfMarkRecord;>;"
    const/4 v4, 0x0

    .local v4, "k":I
    :goto_1
    if-ge v4, v0, :cond_1

    .line 162
    new-instance v5, Lcom/itextpdf/io/font/otf/OtfMarkRecord;

    invoke-direct {v5}, Lcom/itextpdf/io/font/otf/OtfMarkRecord;-><init>()V

    .line 163
    .local v5, "rec":Lcom/itextpdf/io/font/otf/OtfMarkRecord;
    aget v6, v1, v4

    iput v6, v5, Lcom/itextpdf/io/font/otf/OtfMarkRecord;->markClass:I

    .line 164
    aget v6, v2, v4

    invoke-static {p0, v6}, Lcom/itextpdf/io/font/otf/OtfReadCommon;->readGposAnchor(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)Lcom/itextpdf/io/font/otf/GposAnchor;

    move-result-object v6

    iput-object v6, v5, Lcom/itextpdf/io/font/otf/OtfMarkRecord;->anchor:Lcom/itextpdf/io/font/otf/GposAnchor;

    .line 165
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 161
    .end local v5    # "rec":Lcom/itextpdf/io/font/otf/OtfMarkRecord;
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 167
    .end local v4    # "k":I
    :cond_1
    return-object v3
.end method

.method public static readPosLookupRecords(Lcom/itextpdf/io/source/RandomAccessFileOrArray;I)[Lcom/itextpdf/io/font/otf/PosLookupRecord;
    .locals 4
    .param p0, "rf"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .param p1, "recordCount"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 184
    new-array v0, p1, [Lcom/itextpdf/io/font/otf/PosLookupRecord;

    .line 185
    .local v0, "posLookUpRecords":[Lcom/itextpdf/io/font/otf/PosLookupRecord;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, p1, :cond_0

    .line 186
    new-instance v2, Lcom/itextpdf/io/font/otf/PosLookupRecord;

    invoke-direct {v2}, Lcom/itextpdf/io/font/otf/PosLookupRecord;-><init>()V

    .line 187
    .local v2, "lookupRecord":Lcom/itextpdf/io/font/otf/PosLookupRecord;
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v3

    iput v3, v2, Lcom/itextpdf/io/font/otf/PosLookupRecord;->sequenceIndex:I

    .line 188
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v3

    iput v3, v2, Lcom/itextpdf/io/font/otf/PosLookupRecord;->lookupListIndex:I

    .line 189
    aput-object v2, v0, v1

    .line 185
    .end local v2    # "lookupRecord":Lcom/itextpdf/io/font/otf/PosLookupRecord;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 191
    .end local v1    # "i":I
    :cond_0
    return-object v0
.end method

.method private static readRangeRecord(Lcom/itextpdf/io/source/RandomAccessFileOrArray;Ljava/util/List;)V
    .locals 5
    .param p0, "rf"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/io/source/RandomAccessFileOrArray;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 84
    .local p1, "glyphIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v0

    .line 85
    .local v0, "startGlyphId":I
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v1

    .line 87
    .local v1, "endGlyphId":I
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v2

    .line 88
    .local v2, "startCoverageIndex":I
    move v3, v0

    .local v3, "glyphId":I
    :goto_0
    if-gt v3, v1, :cond_0

    .line 89
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {p1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 91
    .end local v3    # "glyphId":I
    :cond_0
    return-void
.end method

.method public static readSubstLookupRecords(Lcom/itextpdf/io/source/RandomAccessFileOrArray;I)[Lcom/itextpdf/io/font/otf/SubstLookupRecord;
    .locals 4
    .param p0, "rf"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .param p1, "substCount"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 172
    new-array v0, p1, [Lcom/itextpdf/io/font/otf/SubstLookupRecord;

    .line 173
    .local v0, "substLookUpRecords":[Lcom/itextpdf/io/font/otf/SubstLookupRecord;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, p1, :cond_0

    .line 174
    new-instance v2, Lcom/itextpdf/io/font/otf/SubstLookupRecord;

    invoke-direct {v2}, Lcom/itextpdf/io/font/otf/SubstLookupRecord;-><init>()V

    .line 175
    .local v2, "slr":Lcom/itextpdf/io/font/otf/SubstLookupRecord;
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v3

    iput v3, v2, Lcom/itextpdf/io/font/otf/SubstLookupRecord;->sequenceIndex:I

    .line 176
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v3

    iput v3, v2, Lcom/itextpdf/io/font/otf/SubstLookupRecord;->lookupListIndex:I

    .line 177
    aput-object v2, v0, v1

    .line 173
    .end local v2    # "slr":Lcom/itextpdf/io/font/otf/SubstLookupRecord;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 179
    .end local v1    # "i":I
    :cond_0
    return-object v0
.end method

.method public static readUShortArray(Lcom/itextpdf/io/source/RandomAccessFileOrArray;I)[I
    .locals 1
    .param p0, "rf"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .param p1, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 46
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/itextpdf/io/font/otf/OtfReadCommon;->readUShortArray(Lcom/itextpdf/io/source/RandomAccessFileOrArray;II)[I

    move-result-object v0

    return-object v0
.end method

.method public static readUShortArray(Lcom/itextpdf/io/source/RandomAccessFileOrArray;II)[I
    .locals 4
    .param p0, "rf"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .param p1, "size"    # I
    .param p2, "location"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 37
    new-array v0, p1, [I

    .line 38
    .local v0, "ret":[I
    const/4 v1, 0x0

    .local v1, "k":I
    :goto_0
    if-ge v1, p1, :cond_1

    .line 39
    invoke-virtual {p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readUnsignedShort()I

    move-result v2

    .line 40
    .local v2, "offset":I
    if-nez v2, :cond_0

    move v3, v2

    goto :goto_1

    :cond_0
    add-int v3, v2, p2

    :goto_1
    aput v3, v0, v1

    .line 38
    .end local v2    # "offset":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 42
    .end local v1    # "k":I
    :cond_1
    return-object v0
.end method
