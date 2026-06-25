.class Lcom/itextpdf/layout/font/FontSelector$PdfFontComparator;
.super Ljava/lang/Object;
.source "FontSelector.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/font/FontSelector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PdfFontComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/itextpdf/layout/font/FontInfo;",
        ">;"
    }
.end annotation


# instance fields
.field fontFamilies:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field fontStyles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/font/FontCharacteristics;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/List;Lcom/itextpdf/layout/font/FontCharacteristics;)V
    .locals 5
    .param p2, "fc"    # Lcom/itextpdf/layout/font/FontCharacteristics;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/itextpdf/layout/font/FontCharacteristics;",
            ")V"
        }
    .end annotation

    .line 93
    .local p1, "fontFamilies":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 94
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/font/FontSelector$PdfFontComparator;->fontFamilies:Ljava/util/List;

    .line 95
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/font/FontSelector$PdfFontComparator;->fontStyles:Ljava/util/List;

    .line 96
    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 97
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 98
    .local v1, "fontFamily":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 99
    .local v2, "lowercaseFontFamily":Ljava/lang/String;
    iget-object v3, p0, Lcom/itextpdf/layout/font/FontSelector$PdfFontComparator;->fontFamilies:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    iget-object v3, p0, Lcom/itextpdf/layout/font/FontSelector$PdfFontComparator;->fontStyles:Ljava/util/List;

    invoke-static {v2, p2}, Lcom/itextpdf/layout/font/FontSelector$PdfFontComparator;->parseFontStyle(Ljava/lang/String;Lcom/itextpdf/layout/font/FontCharacteristics;)Lcom/itextpdf/layout/font/FontCharacteristics;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    .end local v1    # "fontFamily":Ljava/lang/String;
    .end local v2    # "lowercaseFontFamily":Ljava/lang/String;
    goto :goto_0

    :cond_0
    goto :goto_1

    .line 103
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/layout/font/FontSelector$PdfFontComparator;->fontStyles:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 105
    :goto_1
    return-void
.end method

.method private static characteristicsSimilarity(Ljava/lang/String;Lcom/itextpdf/layout/font/FontCharacteristics;Lcom/itextpdf/layout/font/FontInfo;Z)I
    .locals 10
    .param p0, "fontFamily"    # Ljava/lang/String;
    .param p1, "fc"    # Lcom/itextpdf/layout/font/FontCharacteristics;
    .param p2, "fontInfo"    # Lcom/itextpdf/layout/font/FontInfo;
    .param p3, "isLastFontFamilyToBeProcessed"    # Z

    .line 166
    invoke-virtual {p2}, Lcom/itextpdf/layout/font/FontInfo;->getDescriptor()Lcom/itextpdf/io/font/FontProgramDescriptor;

    move-result-object v0

    .line 167
    .local v0, "fontDescriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontProgramDescriptor;->isBold()Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_1

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontProgramDescriptor;->getFontWeight()I

    move-result v1

    const/16 v4, 0x1f4

    if-le v1, v4, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    goto :goto_1

    :cond_1
    :goto_0
    move v1, v3

    .line 168
    .local v1, "isFontBold":Z
    :goto_1
    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontProgramDescriptor;->isItalic()Z

    move-result v4

    if-nez v4, :cond_2

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontProgramDescriptor;->getItalicAngle()F

    move-result v4

    const/4 v5, 0x0

    cmpg-float v4, v4, v5

    if-gez v4, :cond_3

    :cond_2
    move v2, v3

    .line 169
    .local v2, "isFontItalic":Z
    :cond_3
    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontProgramDescriptor;->isMonospace()Z

    move-result v3

    .line 170
    .local v3, "isFontMonospace":Z
    const/4 v4, 0x0

    .line 173
    .local v4, "score":I
    const/4 v5, 0x0

    .line 176
    .local v5, "fontFamilySetByCharacteristics":Z
    invoke-virtual {p1}, Lcom/itextpdf/layout/font/FontCharacteristics;->isMonospace()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 177
    const/4 v5, 0x1

    .line 178
    if-eqz v3, :cond_4

    .line 179
    add-int/lit8 v4, v4, 0x5

    goto :goto_2

    .line 181
    :cond_4
    add-int/lit8 v4, v4, -0x5

    goto :goto_2

    .line 184
    :cond_5
    if-eqz v3, :cond_6

    .line 185
    add-int/lit8 v4, v4, -0x1

    .line 189
    :cond_6
    :goto_2
    if-nez v5, :cond_a

    .line 191
    const-string v6, ""

    invoke-virtual {v6, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_9

    .line 192
    invoke-virtual {p2}, Lcom/itextpdf/layout/font/FontInfo;->getAlias()Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_7

    .line 193
    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontProgramDescriptor;->getFamilyNameLowerCase()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_7

    .line 194
    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontProgramDescriptor;->getFamilyNameLowerCase()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_8

    :cond_7
    nop

    .line 195
    invoke-virtual {p2}, Lcom/itextpdf/layout/font/FontInfo;->getAlias()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_9

    invoke-virtual {p2}, Lcom/itextpdf/layout/font/FontInfo;->getAlias()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_9

    .line 196
    :cond_8
    add-int/lit8 v4, v4, 0xd

    goto :goto_3

    .line 198
    :cond_9
    if-nez p3, :cond_a

    .line 199
    return v4

    .line 205
    :cond_a
    :goto_3
    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontProgramDescriptor;->getFontWeight()I

    move-result v6

    invoke-virtual {p1}, Lcom/itextpdf/layout/font/FontCharacteristics;->getFontWeight()S

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 206
    .local v6, "maxWeight":I
    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontProgramDescriptor;->getFontWeight()I

    move-result v7

    invoke-virtual {p1}, Lcom/itextpdf/layout/font/FontCharacteristics;->getFontWeight()S

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 207
    .local v7, "minWeight":I
    if-ne v6, v7, :cond_b

    .line 208
    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .line 209
    :cond_b
    sub-int v8, v6, v7

    const/16 v9, 0x12c

    if-lt v8, v9, :cond_c

    .line 210
    add-int/lit8 v4, v4, -0x1

    .line 212
    :cond_c
    :goto_4
    invoke-virtual {p1}, Lcom/itextpdf/layout/font/FontCharacteristics;->isBold()Z

    move-result v8

    if-eqz v8, :cond_e

    .line 213
    if-eqz v1, :cond_d

    .line 214
    add-int/lit8 v4, v4, 0x5

    goto :goto_5

    .line 216
    :cond_d
    add-int/lit8 v4, v4, -0x5

    goto :goto_5

    .line 219
    :cond_e
    if-eqz v1, :cond_f

    .line 220
    add-int/lit8 v4, v4, -0x3

    .line 224
    :cond_f
    :goto_5
    invoke-virtual {p1}, Lcom/itextpdf/layout/font/FontCharacteristics;->isItalic()Z

    move-result v8

    if-eqz v8, :cond_11

    .line 225
    if-eqz v2, :cond_10

    .line 226
    add-int/lit8 v4, v4, 0x5

    goto :goto_6

    .line 228
    :cond_10
    add-int/lit8 v4, v4, -0x5

    goto :goto_6

    .line 231
    :cond_11
    if-eqz v2, :cond_12

    .line 232
    add-int/lit8 v4, v4, -0x3

    .line 236
    :cond_12
    :goto_6
    return v4
.end method

.method private static family2Similarity(Ljava/lang/String;Lcom/itextpdf/layout/font/FontCharacteristics;Lcom/itextpdf/layout/font/FontInfo;)I
    .locals 2
    .param p0, "fontFamily"    # Ljava/lang/String;
    .param p1, "fc"    # Lcom/itextpdf/layout/font/FontCharacteristics;
    .param p2, "fontInfo"    # Lcom/itextpdf/layout/font/FontInfo;

    .line 243
    invoke-virtual {p2}, Lcom/itextpdf/layout/font/FontInfo;->getDescriptor()Lcom/itextpdf/io/font/FontProgramDescriptor;

    move-result-object v0

    .line 244
    .local v0, "fontDescriptor":Lcom/itextpdf/io/font/FontProgramDescriptor;
    invoke-virtual {p1}, Lcom/itextpdf/layout/font/FontCharacteristics;->isMonospace()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p2}, Lcom/itextpdf/layout/font/FontInfo;->getAlias()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    .line 245
    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontProgramDescriptor;->getFamilyName2LowerCase()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 246
    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontProgramDescriptor;->getFamilyName2LowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 247
    const/4 v1, 0x1

    return v1

    .line 250
    :cond_0
    const/4 v1, 0x0

    return v1
.end method

.method private static parseFontStyle(Ljava/lang/String;Lcom/itextpdf/layout/font/FontCharacteristics;)Lcom/itextpdf/layout/font/FontCharacteristics;
    .locals 2
    .param p0, "fontFamily"    # Ljava/lang/String;
    .param p1, "fc"    # Lcom/itextpdf/layout/font/FontCharacteristics;

    .line 134
    if-nez p1, :cond_0

    .line 135
    new-instance v0, Lcom/itextpdf/layout/font/FontCharacteristics;

    invoke-direct {v0}, Lcom/itextpdf/layout/font/FontCharacteristics;-><init>()V

    move-object p1, v0

    .line 137
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/layout/font/FontCharacteristics;->isUndefined()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 138
    const-string v0, "bold"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    .line 139
    invoke-virtual {p1, v1}, Lcom/itextpdf/layout/font/FontCharacteristics;->setBoldFlag(Z)Lcom/itextpdf/layout/font/FontCharacteristics;

    .line 141
    :cond_1
    const-string v0, "italic"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string/jumbo v0, "oblique"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 142
    :cond_2
    invoke-virtual {p1, v1}, Lcom/itextpdf/layout/font/FontCharacteristics;->setItalicFlag(Z)Lcom/itextpdf/layout/font/FontCharacteristics;

    .line 145
    :cond_3
    return-object p1
.end method


# virtual methods
.method public compare(Lcom/itextpdf/layout/font/FontInfo;Lcom/itextpdf/layout/font/FontInfo;)I
    .locals 7
    .param p1, "o1"    # Lcom/itextpdf/layout/font/FontInfo;
    .param p2, "o2"    # Lcom/itextpdf/layout/font/FontInfo;

    .line 109
    const/4 v0, 0x0

    .line 112
    .local v0, "res":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/itextpdf/layout/font/FontSelector$PdfFontComparator;->fontFamilies:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_3

    if-nez v0, :cond_3

    .line 113
    iget-object v2, p0, Lcom/itextpdf/layout/font/FontSelector$PdfFontComparator;->fontStyles:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/font/FontCharacteristics;

    .line 114
    .local v2, "fc":Lcom/itextpdf/layout/font/FontCharacteristics;
    iget-object v3, p0, Lcom/itextpdf/layout/font/FontSelector$PdfFontComparator;->fontFamilies:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 116
    .local v3, "fontFamily":Ljava/lang/String;
    const-string v4, "monospace"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    const/4 v5, 0x1

    if-eqz v4, :cond_0

    .line 117
    invoke-virtual {v2, v5}, Lcom/itextpdf/layout/font/FontCharacteristics;->setMonospaceFlag(Z)Lcom/itextpdf/layout/font/FontCharacteristics;

    .line 119
    :cond_0
    iget-object v4, p0, Lcom/itextpdf/layout/font/FontSelector$PdfFontComparator;->fontFamilies:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    sub-int/2addr v4, v5

    if-ne v1, v4, :cond_1

    goto :goto_1

    :cond_1
    const/4 v5, 0x0

    .line 120
    .local v5, "isLastFontFamilyToBeProcessed":Z
    :goto_1
    invoke-static {v3, v2, p2, v5}, Lcom/itextpdf/layout/font/FontSelector$PdfFontComparator;->characteristicsSimilarity(Ljava/lang/String;Lcom/itextpdf/layout/font/FontCharacteristics;Lcom/itextpdf/layout/font/FontInfo;Z)I

    move-result v4

    .line 121
    invoke-static {v3, v2, p1, v5}, Lcom/itextpdf/layout/font/FontSelector$PdfFontComparator;->characteristicsSimilarity(Ljava/lang/String;Lcom/itextpdf/layout/font/FontCharacteristics;Lcom/itextpdf/layout/font/FontInfo;Z)I

    move-result v6

    sub-int/2addr v4, v6

    .line 125
    .end local v0    # "res":I
    .local v4, "res":I
    if-nez v4, :cond_2

    .line 126
    invoke-static {v3, v2, p2}, Lcom/itextpdf/layout/font/FontSelector$PdfFontComparator;->family2Similarity(Ljava/lang/String;Lcom/itextpdf/layout/font/FontCharacteristics;Lcom/itextpdf/layout/font/FontInfo;)I

    move-result v0

    invoke-static {v3, v2, p1}, Lcom/itextpdf/layout/font/FontSelector$PdfFontComparator;->family2Similarity(Ljava/lang/String;Lcom/itextpdf/layout/font/FontCharacteristics;Lcom/itextpdf/layout/font/FontInfo;)I

    move-result v6

    sub-int/2addr v0, v6

    .end local v4    # "res":I
    .restart local v0    # "res":I
    goto :goto_2

    .line 125
    .end local v0    # "res":I
    .restart local v4    # "res":I
    :cond_2
    move v0, v4

    .line 112
    .end local v2    # "fc":Lcom/itextpdf/layout/font/FontCharacteristics;
    .end local v3    # "fontFamily":Ljava/lang/String;
    .end local v4    # "res":I
    .end local v5    # "isLastFontFamilyToBeProcessed":Z
    .restart local v0    # "res":I
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 130
    .end local v1    # "i":I
    :cond_3
    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 89
    check-cast p1, Lcom/itextpdf/layout/font/FontInfo;

    check-cast p2, Lcom/itextpdf/layout/font/FontInfo;

    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/layout/font/FontSelector$PdfFontComparator;->compare(Lcom/itextpdf/layout/font/FontInfo;Lcom/itextpdf/layout/font/FontInfo;)I

    move-result p1

    return p1
.end method
