.class public abstract Lcom/itextpdf/layout/font/selectorstrategy/AbstractFontSelectorStrategy;
.super Ljava/lang/Object;
.source "AbstractFontSelectorStrategy.java"

# interfaces
.implements Lcom/itextpdf/layout/font/selectorstrategy/IFontSelectorStrategy;


# instance fields
.field private final additionalFonts:Lcom/itextpdf/layout/font/FontSet;

.field private final fontProvider:Lcom/itextpdf/layout/font/FontProvider;

.field private final fontSelector:Lcom/itextpdf/layout/font/FontSelector;


# direct methods
.method public constructor <init>(Lcom/itextpdf/layout/font/FontProvider;Lcom/itextpdf/layout/font/FontSelector;Lcom/itextpdf/layout/font/FontSet;)V
    .locals 0
    .param p1, "fontProvider"    # Lcom/itextpdf/layout/font/FontProvider;
    .param p2, "fontSelector"    # Lcom/itextpdf/layout/font/FontSelector;
    .param p3, "additionalFonts"    # Lcom/itextpdf/layout/font/FontSet;

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    iput-object p1, p0, Lcom/itextpdf/layout/font/selectorstrategy/AbstractFontSelectorStrategy;->fontProvider:Lcom/itextpdf/layout/font/FontProvider;

    .line 65
    iput-object p3, p0, Lcom/itextpdf/layout/font/selectorstrategy/AbstractFontSelectorStrategy;->additionalFonts:Lcom/itextpdf/layout/font/FontSet;

    .line 66
    iput-object p2, p0, Lcom/itextpdf/layout/font/selectorstrategy/AbstractFontSelectorStrategy;->fontSelector:Lcom/itextpdf/layout/font/FontSelector;

    .line 67
    return-void
.end method

.method private static extractCodePoint(Ljava/lang/String;I)I
    .locals 1
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "idx"    # I

    .line 219
    invoke-static {p0, p1}, Lcom/itextpdf/io/util/TextUtil;->isSurrogatePair(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0, p1}, Lcom/itextpdf/io/util/TextUtil;->convertToUtf32(Ljava/lang/String;I)I

    move-result v0

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    :goto_0
    return v0
.end method

.method private static getPdfFont(Lcom/itextpdf/layout/font/FontInfo;Lcom/itextpdf/layout/font/FontProvider;Lcom/itextpdf/layout/font/FontSet;)Lcom/itextpdf/kernel/font/PdfFont;
    .locals 1
    .param p0, "fontInfo"    # Lcom/itextpdf/layout/font/FontInfo;
    .param p1, "fontProvider"    # Lcom/itextpdf/layout/font/FontProvider;
    .param p2, "additionalFonts"    # Lcom/itextpdf/layout/font/FontSet;

    .line 232
    invoke-virtual {p1, p0, p2}, Lcom/itextpdf/layout/font/FontProvider;->getPdfFont(Lcom/itextpdf/layout/font/FontInfo;Lcom/itextpdf/layout/font/FontSet;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    return-object v0
.end method

.method private static isSignificantUnicodeScript(Ljava/lang/Character$UnicodeScript;)Z
    .locals 1
    .param p0, "unicodeScript"    # Ljava/lang/Character$UnicodeScript;

    .line 215
    sget-object v0, Ljava/lang/Character$UnicodeScript;->COMMON:Ljava/lang/Character$UnicodeScript;

    if-eq p0, v0, :cond_0

    sget-object v0, Ljava/lang/Character$UnicodeScript;->INHERITED:Ljava/lang/Character$UnicodeScript;

    if-eq p0, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static nextSignificantIndex(ILjava/lang/String;)I
    .locals 2
    .param p0, "startIndex"    # I
    .param p1, "text"    # Ljava/lang/String;

    .line 204
    move v0, p0

    .line 205
    .local v0, "nextValidChar":I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 206
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Lcom/itextpdf/io/util/TextUtil;->isWhitespaceOrNonPrintable(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 207
    goto :goto_1

    .line 205
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 210
    :cond_1
    :goto_1
    return v0
.end method


# virtual methods
.method public getGlyphLines(Ljava/lang/String;)Ljava/util/List;
    .locals 14
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/itextpdf/commons/datastructures/Tuple2<",
            "Lcom/itextpdf/io/font/otf/GlyphLine;",
            "Lcom/itextpdf/kernel/font/PdfFont;",
            ">;>;"
        }
    .end annotation

    .line 82
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/commons/datastructures/Tuple2<Lcom/itextpdf/io/font/otf/GlyphLine;Lcom/itextpdf/kernel/font/PdfFont;>;>;"
    const/4 v1, 0x0

    .line 84
    .local v1, "index":I
    const/4 v2, -0x1

    .line 86
    .local v2, "indexDiacritic":I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_12

    .line 88
    const/4 v3, 0x0

    .line 89
    .local v3, "currentFont":Lcom/itextpdf/kernel/font/PdfFont;
    invoke-static {v1, p1}, Lcom/itextpdf/layout/font/selectorstrategy/AbstractFontSelectorStrategy;->nextSignificantIndex(ILjava/lang/String;)I

    move-result v4

    .line 90
    .local v4, "indexSignificant":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_1

    .line 91
    const/4 v5, -0x1

    if-ne v2, v5, :cond_0

    move v5, v4

    goto :goto_1

    :cond_0
    move v5, v2

    :goto_1
    invoke-static {p1, v5}, Lcom/itextpdf/layout/font/selectorstrategy/AbstractFontSelectorStrategy;->extractCodePoint(Ljava/lang/String;I)I

    move-result v5

    .line 92
    .local v5, "codePoint":I
    iget-object v6, p0, Lcom/itextpdf/layout/font/selectorstrategy/AbstractFontSelectorStrategy;->fontSelector:Lcom/itextpdf/layout/font/FontSelector;

    iget-object v7, p0, Lcom/itextpdf/layout/font/selectorstrategy/AbstractFontSelectorStrategy;->fontProvider:Lcom/itextpdf/layout/font/FontProvider;

    iget-object v8, p0, Lcom/itextpdf/layout/font/selectorstrategy/AbstractFontSelectorStrategy;->additionalFonts:Lcom/itextpdf/layout/font/FontSet;

    invoke-virtual {p0, v5, v6, v7, v8}, Lcom/itextpdf/layout/font/selectorstrategy/AbstractFontSelectorStrategy;->matchFont(ILcom/itextpdf/layout/font/FontSelector;Lcom/itextpdf/layout/font/FontProvider;Lcom/itextpdf/layout/font/FontSet;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v3

    .line 95
    .end local v5    # "codePoint":I
    :cond_1
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 97
    .local v5, "resolvedGlyphs":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/Glyph;>;"
    if-eqz v3, :cond_f

    .line 98
    const/4 v6, 0x0

    .line 99
    .local v6, "firstScript":Ljava/lang/Character$UnicodeScript;
    move v7, v4

    .line 100
    .local v7, "to":I
    const/4 v8, 0x0

    .line 101
    .local v8, "breakRequested":Z
    move v9, v4

    .local v9, "i":I
    :goto_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v10

    if-ge v9, v10, :cond_d

    .line 102
    invoke-static {p1, v9}, Lcom/itextpdf/layout/font/selectorstrategy/AbstractFontSelectorStrategy;->extractCodePoint(Ljava/lang/String;I)I

    move-result v10

    .line 103
    .local v10, "codePoint":I
    const v11, 0xffff

    if-le v10, v11, :cond_2

    .line 104
    add-int/lit8 v9, v9, 0x1

    .line 106
    :cond_2
    invoke-virtual {p0}, Lcom/itextpdf/layout/font/selectorstrategy/AbstractFontSelectorStrategy;->isCurrentFontCheckRequired()Z

    move-result v11

    if-eqz v11, :cond_3

    add-int/lit8 v11, v2, -0x1

    if-eq v9, v11, :cond_3

    .line 107
    iget-object v11, p0, Lcom/itextpdf/layout/font/selectorstrategy/AbstractFontSelectorStrategy;->fontSelector:Lcom/itextpdf/layout/font/FontSelector;

    iget-object v12, p0, Lcom/itextpdf/layout/font/selectorstrategy/AbstractFontSelectorStrategy;->fontProvider:Lcom/itextpdf/layout/font/FontProvider;

    iget-object v13, p0, Lcom/itextpdf/layout/font/selectorstrategy/AbstractFontSelectorStrategy;->additionalFonts:Lcom/itextpdf/layout/font/FontSet;

    invoke-virtual {p0, v10, v11, v12, v13}, Lcom/itextpdf/layout/font/selectorstrategy/AbstractFontSelectorStrategy;->matchFont(ILcom/itextpdf/layout/font/FontSelector;Lcom/itextpdf/layout/font/FontProvider;Lcom/itextpdf/layout/font/FontSet;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v11

    if-eq v3, v11, :cond_3

    .line 108
    const/4 v8, 0x1

    .line 112
    :cond_3
    if-le v9, v2, :cond_9

    .line 113
    invoke-static {v10}, Lcom/itextpdf/io/util/TextUtil;->isDiacritic(I)Z

    move-result v11

    if-eqz v11, :cond_8

    .line 114
    iget-object v11, p0, Lcom/itextpdf/layout/font/selectorstrategy/AbstractFontSelectorStrategy;->fontSelector:Lcom/itextpdf/layout/font/FontSelector;

    iget-object v12, p0, Lcom/itextpdf/layout/font/selectorstrategy/AbstractFontSelectorStrategy;->fontProvider:Lcom/itextpdf/layout/font/FontProvider;

    iget-object v13, p0, Lcom/itextpdf/layout/font/selectorstrategy/AbstractFontSelectorStrategy;->additionalFonts:Lcom/itextpdf/layout/font/FontSet;

    invoke-virtual {p0, v10, v11, v12, v13}, Lcom/itextpdf/layout/font/selectorstrategy/AbstractFontSelectorStrategy;->matchFont(ILcom/itextpdf/layout/font/FontSelector;Lcom/itextpdf/layout/font/FontProvider;Lcom/itextpdf/layout/font/FontSet;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v11

    .line 117
    .local v11, "diacriticFont":Lcom/itextpdf/kernel/font/PdfFont;
    if-eqz v9, :cond_5

    if-eqz v11, :cond_5

    add-int/lit8 v12, v9, -0x1

    .line 118
    invoke-static {p1, v12}, Lcom/itextpdf/layout/font/selectorstrategy/AbstractFontSelectorStrategy;->extractCodePoint(Ljava/lang/String;I)I

    move-result v12

    invoke-virtual {v11, v12}, Lcom/itextpdf/kernel/font/PdfFont;->containsGlyph(I)Z

    move-result v12

    if-eqz v12, :cond_4

    goto :goto_3

    :cond_4
    const/4 v12, 0x0

    goto :goto_4

    :cond_5
    :goto_3
    const/4 v12, 0x1

    .line 121
    .local v12, "isPreviousMatchFont":Z
    :goto_4
    if-eqz v11, :cond_7

    if-eq v11, v3, :cond_7

    if-eqz v12, :cond_7

    .line 124
    add-int/lit8 v13, v9, -0x1

    if-eq v2, v13, :cond_6

    .line 125
    const/4 v8, 0x1

    .line 127
    :cond_6
    move v2, v9

    .line 128
    if-eqz v8, :cond_7

    .line 129
    add-int/lit8 v7, v9, -0x2

    .line 132
    .end local v11    # "diacriticFont":Lcom/itextpdf/kernel/font/PdfFont;
    .end local v12    # "isPreviousMatchFont":Z
    :cond_7
    goto :goto_5

    .line 133
    :cond_8
    const/4 v2, -0x1

    .line 137
    :cond_9
    :goto_5
    invoke-static {v10}, Ljava/lang/Character$UnicodeScript;->of(I)Ljava/lang/Character$UnicodeScript;

    move-result-object v11

    .line 138
    .local v11, "currScript":Ljava/lang/Character$UnicodeScript;
    invoke-static {v11}, Lcom/itextpdf/layout/font/selectorstrategy/AbstractFontSelectorStrategy;->isSignificantUnicodeScript(Ljava/lang/Character$UnicodeScript;)Z

    move-result v12

    if-eqz v12, :cond_b

    .line 139
    if-nez v6, :cond_a

    .line 140
    move-object v6, v11

    goto :goto_6

    .line 141
    :cond_a
    if-eq v6, v11, :cond_b

    .line 142
    const/4 v8, 0x1

    .line 146
    :cond_b
    :goto_6
    if-eqz v8, :cond_c

    .line 147
    goto :goto_7

    .line 150
    :cond_c
    move v7, v9

    .line 101
    .end local v10    # "codePoint":I
    .end local v11    # "currScript":Ljava/lang/Character$UnicodeScript;
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 153
    .end local v9    # "i":I
    :cond_d
    :goto_7
    if-ge v7, v1, :cond_e

    .line 154
    goto/16 :goto_0

    .line 157
    :cond_e
    invoke-virtual {v3, p1, v1, v7, v5}, Lcom/itextpdf/kernel/font/PdfFont;->appendGlyphs(Ljava/lang/String;IILjava/util/List;)I

    move-result v9

    .line 158
    .local v9, "numOfAppendedGlyphs":I
    add-int/2addr v1, v9

    .line 161
    .end local v6    # "firstScript":Ljava/lang/Character$UnicodeScript;
    .end local v7    # "to":I
    .end local v8    # "breakRequested":Z
    .end local v9    # "numOfAppendedGlyphs":I
    :cond_f
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_11

    .line 162
    iget-object v6, p0, Lcom/itextpdf/layout/font/selectorstrategy/AbstractFontSelectorStrategy;->fontSelector:Lcom/itextpdf/layout/font/FontSelector;

    invoke-virtual {v6}, Lcom/itextpdf/layout/font/FontSelector;->bestMatch()Lcom/itextpdf/layout/font/FontInfo;

    move-result-object v6

    iget-object v7, p0, Lcom/itextpdf/layout/font/selectorstrategy/AbstractFontSelectorStrategy;->fontProvider:Lcom/itextpdf/layout/font/FontProvider;

    iget-object v8, p0, Lcom/itextpdf/layout/font/selectorstrategy/AbstractFontSelectorStrategy;->additionalFonts:Lcom/itextpdf/layout/font/FontSet;

    invoke-static {v6, v7, v8}, Lcom/itextpdf/layout/font/selectorstrategy/AbstractFontSelectorStrategy;->getPdfFont(Lcom/itextpdf/layout/font/FontInfo;Lcom/itextpdf/layout/font/FontProvider;Lcom/itextpdf/layout/font/FontSet;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v3

    .line 163
    if-eq v1, v4, :cond_10

    .line 164
    add-int/lit8 v6, v4, -0x1

    invoke-virtual {v3, p1, v1, v6, v5}, Lcom/itextpdf/kernel/font/PdfFont;->appendGlyphs(Ljava/lang/String;IILjava/util/List;)I

    move-result v6

    add-int/2addr v1, v6

    .line 166
    :cond_10
    :goto_8
    if-gt v1, v4, :cond_11

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v1, v6, :cond_11

    .line 167
    invoke-virtual {v3, p1, v1, v5}, Lcom/itextpdf/kernel/font/PdfFont;->appendAnyGlyph(Ljava/lang/String;ILjava/util/List;)I

    move-result v6

    add-int/2addr v1, v6

    goto :goto_8

    .line 171
    :cond_11
    new-instance v6, Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-direct {v6, v5}, Lcom/itextpdf/io/font/otf/GlyphLine;-><init>(Ljava/util/List;)V

    .line 172
    .local v6, "tempGlyphLine":Lcom/itextpdf/io/font/otf/GlyphLine;
    invoke-static {v6, v3}, Lcom/itextpdf/layout/renderer/TextPreprocessingUtil;->replaceSpecialWhitespaceGlyphs(Lcom/itextpdf/io/font/otf/GlyphLine;Lcom/itextpdf/kernel/font/PdfFont;)Lcom/itextpdf/io/font/otf/GlyphLine;

    move-result-object v7

    .line 173
    .local v7, "finalGlyphLine":Lcom/itextpdf/io/font/otf/GlyphLine;
    new-instance v8, Lcom/itextpdf/commons/datastructures/Tuple2;

    invoke-direct {v8, v7, v3}, Lcom/itextpdf/commons/datastructures/Tuple2;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 174
    .end local v3    # "currentFont":Lcom/itextpdf/kernel/font/PdfFont;
    .end local v4    # "indexSignificant":I
    .end local v5    # "resolvedGlyphs":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/Glyph;>;"
    .end local v6    # "tempGlyphLine":Lcom/itextpdf/io/font/otf/GlyphLine;
    .end local v7    # "finalGlyphLine":Lcom/itextpdf/io/font/otf/GlyphLine;
    goto/16 :goto_0

    .line 176
    :cond_12
    return-object v0
.end method

.method protected abstract isCurrentFontCheckRequired()Z
.end method

.method protected matchFont(ILcom/itextpdf/layout/font/FontSelector;Lcom/itextpdf/layout/font/FontProvider;Lcom/itextpdf/layout/font/FontSet;)Lcom/itextpdf/kernel/font/PdfFont;
    .locals 6
    .param p1, "codePoint"    # I
    .param p2, "fontSelector"    # Lcom/itextpdf/layout/font/FontSelector;
    .param p3, "fontProvider"    # Lcom/itextpdf/layout/font/FontProvider;
    .param p4, "additionalFonts"    # Lcom/itextpdf/layout/font/FontSet;

    .line 189
    const/4 v0, 0x0

    .line 190
    .local v0, "matchedFont":Lcom/itextpdf/kernel/font/PdfFont;
    invoke-virtual {p2}, Lcom/itextpdf/layout/font/FontSelector;->getFonts()Ljava/lang/Iterable;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/font/FontInfo;

    .line 191
    .local v2, "fontInfo":Lcom/itextpdf/layout/font/FontInfo;
    invoke-virtual {v2}, Lcom/itextpdf/layout/font/FontInfo;->getFontUnicodeRange()Lcom/itextpdf/layout/font/Range;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/itextpdf/layout/font/Range;->contains(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 192
    invoke-static {v2, p3, p4}, Lcom/itextpdf/layout/font/selectorstrategy/AbstractFontSelectorStrategy;->getPdfFont(Lcom/itextpdf/layout/font/FontInfo;Lcom/itextpdf/layout/font/FontProvider;Lcom/itextpdf/layout/font/FontSet;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v3

    .line 193
    .local v3, "temptFont":Lcom/itextpdf/kernel/font/PdfFont;
    invoke-virtual {v3, p1}, Lcom/itextpdf/kernel/font/PdfFont;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v4

    .line 194
    .local v4, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    if-eqz v4, :cond_0

    invoke-virtual {v4}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v5

    if-eqz v5, :cond_0

    .line 195
    move-object v0, v3

    .line 196
    goto :goto_1

    .line 199
    .end local v2    # "fontInfo":Lcom/itextpdf/layout/font/FontInfo;
    .end local v3    # "temptFont":Lcom/itextpdf/kernel/font/PdfFont;
    .end local v4    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_0
    goto :goto_0

    .line 200
    :cond_1
    :goto_1
    return-object v0
.end method
