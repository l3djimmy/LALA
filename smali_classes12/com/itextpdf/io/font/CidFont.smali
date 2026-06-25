.class public Lcom/itextpdf/io/font/CidFont;
.super Lcom/itextpdf/io/font/FontProgram;
.source "CidFont.java"


# instance fields
.field private compatibleCmaps:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private fontName:Ljava/lang/String;

.field private pdfFontFlags:I


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;)V
    .locals 3
    .param p1, "fontName"    # Ljava/lang/String;
    .param p2, "cmap"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 41
    .local p3, "compatibleCmaps":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-direct {p0}, Lcom/itextpdf/io/font/FontProgram;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/itextpdf/io/font/CidFont;->fontName:Ljava/lang/String;

    .line 43
    iput-object p3, p0, Lcom/itextpdf/io/font/CidFont;->compatibleCmaps:Ljava/util/Set;

    .line 44
    new-instance v0, Lcom/itextpdf/io/font/FontNames;

    invoke-direct {v0}, Lcom/itextpdf/io/font/FontNames;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/CidFont;->fontNames:Lcom/itextpdf/io/font/FontNames;

    .line 45
    invoke-direct {p0, p1}, Lcom/itextpdf/io/font/CidFont;->initializeCidFontNameAndStyle(Ljava/lang/String;)V

    .line 46
    invoke-static {}, Lcom/itextpdf/io/font/CidFontProperties;->getAllFonts()Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/io/font/CidFont;->fontNames:Lcom/itextpdf/io/font/FontNames;

    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontNames;->getFontName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 47
    .local v0, "fontDesc":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v0, :cond_0

    .line 50
    invoke-direct {p0, v0, p2}, Lcom/itextpdf/io/font/CidFont;->initializeCidFontProperties(Ljava/util/Map;Ljava/lang/String;)V

    .line 51
    return-void

    .line 48
    :cond_0
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v2, "There is no such predefined font: {0}"

    invoke-direct {v1, v2}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v1

    throw v1
.end method

.method private static getCompatibleUniMap(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "registry"    # Ljava/lang/String;
    .param p1, "cmap"    # Ljava/lang/String;

    .line 129
    invoke-static {}, Lcom/itextpdf/io/font/CidFontProperties;->getRegistryNames()Ljava/util/Map;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "_Uni"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 131
    .local v0, "compatibleUniMaps":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-eqz p1, :cond_0

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 132
    return-object p1

    .line 135
    :cond_0
    const-string v1, ""

    .line 136
    .local v1, "uniMap":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 137
    .local v3, "name":Ljava/lang/String;
    move-object v1, v3

    .line 138
    const-string v4, "H"

    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 139
    move-object v1, v3

    .line 140
    goto :goto_1

    .line 142
    .end local v3    # "name":Ljava/lang/String;
    :cond_1
    goto :goto_0

    .line 144
    :cond_2
    :goto_1
    return-object v1
.end method

.method private initializeCidFontNameAndStyle(Ljava/lang/String;)V
    .locals 7
    .param p1, "fontName"    # Ljava/lang/String;

    .line 82
    invoke-static {p1}, Lcom/itextpdf/io/font/CidFont;->trimFontStyle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 83
    .local v0, "nameBase":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 84
    iget-object v1, p0, Lcom/itextpdf/io/font/CidFont;->fontNames:Lcom/itextpdf/io/font/FontNames;

    invoke-virtual {v1, p1}, Lcom/itextpdf/io/font/FontNames;->setFontName(Ljava/lang/String;)V

    .line 85
    iget-object v1, p0, Lcom/itextpdf/io/font/CidFont;->fontNames:Lcom/itextpdf/io/font/FontNames;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/font/FontNames;->setStyle(Ljava/lang/String;)V

    goto :goto_0

    .line 87
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/io/font/CidFont;->fontNames:Lcom/itextpdf/io/font/FontNames;

    invoke-virtual {v1, p1}, Lcom/itextpdf/io/font/FontNames;->setFontName(Ljava/lang/String;)V

    .line 89
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/io/font/CidFont;->fontNames:Lcom/itextpdf/io/font/FontNames;

    const/4 v2, 0x1

    new-array v3, v2, [[Ljava/lang/String;

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, ""

    aput-object v6, v4, v5

    aput-object v6, v4, v2

    const/4 v2, 0x2

    aput-object v6, v4, v2

    iget-object v2, p0, Lcom/itextpdf/io/font/CidFont;->fontNames:Lcom/itextpdf/io/font/FontNames;

    invoke-virtual {v2}, Lcom/itextpdf/io/font/FontNames;->getFontName()Ljava/lang/String;

    move-result-object v2

    const/4 v6, 0x3

    aput-object v2, v4, v6

    aput-object v4, v3, v5

    invoke-virtual {v1, v3}, Lcom/itextpdf/io/font/FontNames;->setFullName([[Ljava/lang/String;)V

    .line 90
    return-void
.end method

.method private initializeCidFontProperties(Ljava/util/Map;Ljava/lang/String;)V
    .locals 20
    .param p2, "cmap"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 93
    .local p1, "fontDesc":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lcom/itextpdf/io/font/CidFont;->fontIdentification:Lcom/itextpdf/io/font/FontIdentification;

    const-string v3, "Panose"

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/itextpdf/io/font/FontIdentification;->setPanose(Ljava/lang/String;)V

    .line 94
    iget-object v2, v0, Lcom/itextpdf/io/font/CidFont;->fontMetrics:Lcom/itextpdf/io/font/FontMetrics;

    const-string v3, "ItalicAngle"

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/io/font/FontMetrics;->setItalicAngle(F)V

    .line 95
    iget-object v2, v0, Lcom/itextpdf/io/font/CidFont;->fontMetrics:Lcom/itextpdf/io/font/FontMetrics;

    const-string v3, "CapHeight"

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/io/font/FontMetrics;->setCapHeight(I)V

    .line 96
    iget-object v2, v0, Lcom/itextpdf/io/font/CidFont;->fontMetrics:Lcom/itextpdf/io/font/FontMetrics;

    const-string v3, "Ascent"

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/io/font/FontMetrics;->setTypoAscender(I)V

    .line 97
    iget-object v2, v0, Lcom/itextpdf/io/font/CidFont;->fontMetrics:Lcom/itextpdf/io/font/FontMetrics;

    const-string v3, "Descent"

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/io/font/FontMetrics;->setTypoDescender(I)V

    .line 98
    iget-object v2, v0, Lcom/itextpdf/io/font/CidFont;->fontMetrics:Lcom/itextpdf/io/font/FontMetrics;

    const-string v3, "StemV"

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/io/font/FontMetrics;->setStemV(I)V

    .line 99
    const-string v2, "Flags"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v0, Lcom/itextpdf/io/font/CidFont;->pdfFontFlags:I

    .line 100
    const-string v2, "FontBBox"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 101
    .local v2, "fontBBox":Ljava/lang/String;
    new-instance v3, Ljava/util/StringTokenizer;

    const-string v4, " []\r\n\t\u000c"

    invoke-direct {v3, v2, v4}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    .local v3, "tk":Ljava/util/StringTokenizer;
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 103
    .local v4, "llx":I
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 104
    .local v5, "lly":I
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 105
    .local v6, "urx":I
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    .line 106
    .local v7, "ury":I
    iget-object v8, v0, Lcom/itextpdf/io/font/CidFont;->fontMetrics:Lcom/itextpdf/io/font/FontMetrics;

    int-to-float v9, v4

    int-to-float v10, v5

    int-to-float v11, v6

    int-to-float v12, v7

    invoke-virtual {v8, v9, v10, v11, v12}, Lcom/itextpdf/io/font/FontMetrics;->updateBbox(FFFF)V

    .line 107
    const-string v8, "Registry"

    invoke-interface {v1, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    iput-object v8, v0, Lcom/itextpdf/io/font/CidFont;->registry:Ljava/lang/String;

    .line 108
    iget-object v8, v0, Lcom/itextpdf/io/font/CidFont;->registry:Ljava/lang/String;

    move-object/from16 v9, p2

    invoke-static {v8, v9}, Lcom/itextpdf/io/font/CidFont;->getCompatibleUniMap(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 109
    .local v8, "uniMap":Ljava/lang/String;
    if-eqz v8, :cond_2

    .line 110
    const-string v10, "W"

    invoke-interface {v1, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/io/util/IntHashtable;

    .line 111
    .local v10, "metrics":Lcom/itextpdf/io/util/IntHashtable;
    invoke-static {v8}, Lcom/itextpdf/io/font/CjkResourceLoader;->getUni2CidCmap(Ljava/lang/String;)Lcom/itextpdf/io/font/cmap/CMapUniCid;

    move-result-object v11

    .line 112
    .local v11, "uni2cid":Lcom/itextpdf/io/font/cmap/CMapUniCid;
    const/4 v12, 0x0

    iput v12, v0, Lcom/itextpdf/io/font/CidFont;->avgWidth:I

    .line 113
    invoke-virtual {v11}, Lcom/itextpdf/io/font/cmap/CMapUniCid;->getCodePoints()[I

    move-result-object v13

    array-length v14, v13

    :goto_0
    if-ge v12, v14, :cond_1

    aget v15, v13, v12

    .line 114
    .local v15, "cp":I
    invoke-virtual {v11, v15}, Lcom/itextpdf/io/font/cmap/CMapUniCid;->lookup(I)I

    move-result v1

    .line 115
    .local v1, "cid":I
    invoke-virtual {v10, v1}, Lcom/itextpdf/io/util/IntHashtable;->containsKey(I)Z

    move-result v16

    if-eqz v16, :cond_0

    invoke-virtual {v10, v1}, Lcom/itextpdf/io/util/IntHashtable;->get(I)I

    move-result v16

    goto :goto_1

    :cond_0
    const/16 v16, 0x3e8

    :goto_1
    move/from16 v17, v16

    .line 116
    .local v17, "width":I
    move-object/from16 v16, v2

    .end local v2    # "fontBBox":Ljava/lang/String;
    .local v16, "fontBBox":Ljava/lang/String;
    new-instance v2, Lcom/itextpdf/io/font/otf/Glyph;

    move-object/from16 v18, v3

    move/from16 v3, v17

    .end local v17    # "width":I
    .local v3, "width":I
    .local v18, "tk":Ljava/util/StringTokenizer;
    invoke-direct {v2, v1, v3, v15}, Lcom/itextpdf/io/font/otf/Glyph;-><init>(III)V

    .line 117
    .local v2, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    move/from16 v17, v1

    .end local v1    # "cid":I
    .local v17, "cid":I
    iget v1, v0, Lcom/itextpdf/io/font/CidFont;->avgWidth:I

    invoke-virtual {v2}, Lcom/itextpdf/io/font/otf/Glyph;->getWidth()I

    move-result v19

    add-int v1, v1, v19

    iput v1, v0, Lcom/itextpdf/io/font/CidFont;->avgWidth:I

    .line 118
    iget-object v1, v0, Lcom/itextpdf/io/font/CidFont;->codeToGlyph:Ljava/util/Map;

    move/from16 v19, v3

    .end local v3    # "width":I
    .local v19, "width":I
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    iget-object v1, v0, Lcom/itextpdf/io/font/CidFont;->unicodeToGlyph:Ljava/util/Map;

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    .end local v2    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    .end local v15    # "cp":I
    .end local v17    # "cid":I
    .end local v19    # "width":I
    add-int/lit8 v12, v12, 0x1

    move-object/from16 v1, p1

    move-object/from16 v2, v16

    move-object/from16 v3, v18

    goto :goto_0

    .line 121
    .end local v16    # "fontBBox":Ljava/lang/String;
    .end local v18    # "tk":Ljava/util/StringTokenizer;
    .local v2, "fontBBox":Ljava/lang/String;
    .local v3, "tk":Ljava/util/StringTokenizer;
    :cond_1
    move-object/from16 v16, v2

    move-object/from16 v18, v3

    .end local v2    # "fontBBox":Ljava/lang/String;
    .end local v3    # "tk":Ljava/util/StringTokenizer;
    .restart local v16    # "fontBBox":Ljava/lang/String;
    .restart local v18    # "tk":Ljava/util/StringTokenizer;
    invoke-virtual {v0}, Lcom/itextpdf/io/font/CidFont;->fixSpaceIssue()V

    .line 122
    iget-object v1, v0, Lcom/itextpdf/io/font/CidFont;->codeToGlyph:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    if-eqz v1, :cond_3

    .line 123
    iget v1, v0, Lcom/itextpdf/io/font/CidFont;->avgWidth:I

    iget-object v2, v0, Lcom/itextpdf/io/font/CidFont;->codeToGlyph:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    div-int/2addr v1, v2

    iput v1, v0, Lcom/itextpdf/io/font/CidFont;->avgWidth:I

    goto :goto_2

    .line 109
    .end local v10    # "metrics":Lcom/itextpdf/io/util/IntHashtable;
    .end local v11    # "uni2cid":Lcom/itextpdf/io/font/cmap/CMapUniCid;
    .end local v16    # "fontBBox":Ljava/lang/String;
    .end local v18    # "tk":Ljava/util/StringTokenizer;
    .restart local v2    # "fontBBox":Ljava/lang/String;
    .restart local v3    # "tk":Ljava/util/StringTokenizer;
    :cond_2
    move-object/from16 v16, v2

    move-object/from16 v18, v3

    .line 126
    .end local v2    # "fontBBox":Ljava/lang/String;
    .end local v3    # "tk":Ljava/util/StringTokenizer;
    .restart local v16    # "fontBBox":Ljava/lang/String;
    .restart local v18    # "tk":Ljava/util/StringTokenizer;
    :cond_3
    :goto_2
    return-void
.end method


# virtual methods
.method public compatibleWith(Ljava/lang/String;)Z
    .locals 2
    .param p1, "cmap"    # Ljava/lang/String;

    .line 54
    const-string v0, "Identity-H"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_2

    const-string v0, "Identity-V"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 57
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/font/CidFont;->compatibleCmaps:Ljava/util/Set;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/io/font/CidFont;->compatibleCmaps:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    return v1

    .line 55
    :cond_2
    :goto_1
    return v1
.end method

.method public getKerning(Lcom/itextpdf/io/font/otf/Glyph;Lcom/itextpdf/io/font/otf/Glyph;)I
    .locals 1
    .param p1, "glyph1"    # Lcom/itextpdf/io/font/otf/Glyph;
    .param p2, "glyph2"    # Lcom/itextpdf/io/font/otf/Glyph;

    .line 63
    const/4 v0, 0x0

    return v0
.end method

.method public getPdfFontFlags()I
    .locals 1

    .line 68
    iget v0, p0, Lcom/itextpdf/io/font/CidFont;->pdfFontFlags:I

    return v0
.end method

.method public isBuiltWith(Ljava/lang/String;)Z
    .locals 1
    .param p1, "fontName"    # Ljava/lang/String;

    .line 78
    iget-object v0, p0, Lcom/itextpdf/io/font/CidFont;->fontName:Ljava/lang/String;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isFontSpecific()Z
    .locals 1

    .line 73
    const/4 v0, 0x0

    return v0
.end method
