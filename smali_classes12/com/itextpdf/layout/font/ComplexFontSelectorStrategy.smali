.class public Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;
.super Lcom/itextpdf/layout/font/FontSelectorStrategy;
.source "ComplexFontSelectorStrategy.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private font:Lcom/itextpdf/kernel/font/PdfFont;

.field private selector:Lcom/itextpdf/layout/font/FontSelector;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 39
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/itextpdf/layout/font/FontSelector;Lcom/itextpdf/layout/font/FontProvider;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "selector"    # Lcom/itextpdf/layout/font/FontSelector;
    .param p3, "provider"    # Lcom/itextpdf/layout/font/FontProvider;

    .line 53
    const/4 v0, 0x0

    invoke-direct {p0, p1, p3, v0}, Lcom/itextpdf/layout/font/FontSelectorStrategy;-><init>(Ljava/lang/String;Lcom/itextpdf/layout/font/FontProvider;Lcom/itextpdf/layout/font/FontSet;)V

    .line 54
    iput-object v0, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->font:Lcom/itextpdf/kernel/font/PdfFont;

    .line 55
    iput-object p2, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->selector:Lcom/itextpdf/layout/font/FontSelector;

    .line 56
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/itextpdf/layout/font/FontSelector;Lcom/itextpdf/layout/font/FontProvider;Lcom/itextpdf/layout/font/FontSet;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "selector"    # Lcom/itextpdf/layout/font/FontSelector;
    .param p3, "provider"    # Lcom/itextpdf/layout/font/FontProvider;
    .param p4, "additionalFonts"    # Lcom/itextpdf/layout/font/FontSet;

    .line 47
    invoke-direct {p0, p1, p3, p4}, Lcom/itextpdf/layout/font/FontSelectorStrategy;-><init>(Ljava/lang/String;Lcom/itextpdf/layout/font/FontProvider;Lcom/itextpdf/layout/font/FontSet;)V

    .line 48
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->font:Lcom/itextpdf/kernel/font/PdfFont;

    .line 49
    iput-object p2, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->selector:Lcom/itextpdf/layout/font/FontSelector;

    .line 50
    return-void
.end method

.method private static isSignificantUnicodeScript(Ljava/lang/Character$UnicodeScript;)Z
    .locals 1
    .param p0, "unicodeScript"    # Ljava/lang/Character$UnicodeScript;

    .line 144
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

.method private static isSurrogatePair(Ljava/lang/String;I)Z
    .locals 2
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "idx"    # I

    .line 149
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Lcom/itextpdf/io/util/TextUtil;->isSurrogateHigh(C)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    if-ge p1, v0, :cond_0

    add-int/lit8 v0, p1, 0x1

    .line 150
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Lcom/itextpdf/io/util/TextUtil;->isSurrogateLow(C)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 149
    :goto_0
    return v1
.end method

.method private nextSignificantIndex()I
    .locals 2

    .line 116
    iget v0, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->index:I

    .line 117
    .local v0, "nextValidChar":I
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->text:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 118
    iget-object v1, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->text:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Lcom/itextpdf/io/util/TextUtil;->isWhitespaceOrNonPrintable(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 119
    goto :goto_1

    .line 117
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 122
    :cond_1
    :goto_1
    return v0
.end method

.method private nextSignificantUnicodeScript(I)Ljava/lang/Character$UnicodeScript;
    .locals 4
    .param p1, "from"    # I

    .line 126
    move v0, p1

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->text:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 128
    iget-object v1, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->text:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->isSurrogatePair(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 129
    iget-object v1, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->text:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/itextpdf/io/util/TextUtil;->convertToUtf32(Ljava/lang/String;I)I

    move-result v1

    .line 130
    .local v1, "codePoint":I
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 132
    .end local v1    # "codePoint":I
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->text:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 134
    .restart local v1    # "codePoint":I
    :goto_1
    invoke-static {v1}, Ljava/lang/Character$UnicodeScript;->of(I)Ljava/lang/Character$UnicodeScript;

    move-result-object v2

    .line 135
    .local v2, "unicodeScript":Ljava/lang/Character$UnicodeScript;
    invoke-static {v2}, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->isSignificantUnicodeScript(Ljava/lang/Character$UnicodeScript;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 136
    return-object v2

    .line 126
    .end local v1    # "codePoint":I
    .end local v2    # "unicodeScript":Ljava/lang/Character$UnicodeScript;
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 139
    .end local v0    # "i":I
    :cond_2
    sget-object v0, Ljava/lang/Character$UnicodeScript;->COMMON:Ljava/lang/Character$UnicodeScript;

    return-object v0
.end method


# virtual methods
.method public getCurrentFont()Lcom/itextpdf/kernel/font/PdfFont;
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->font:Lcom/itextpdf/kernel/font/PdfFont;

    return-object v0
.end method

.method public nextGlyphs()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/Glyph;",
            ">;"
        }
    .end annotation

    .line 65
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->font:Lcom/itextpdf/kernel/font/PdfFont;

    .line 66
    invoke-direct {p0}, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->nextSignificantIndex()I

    move-result v0

    .line 67
    .local v0, "nextUnignorable":I
    iget-object v1, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->text:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 68
    iget-object v1, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->selector:Lcom/itextpdf/layout/font/FontSelector;

    invoke-virtual {v1}, Lcom/itextpdf/layout/font/FontSelector;->getFonts()Ljava/lang/Iterable;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/font/FontInfo;

    .line 69
    .local v2, "f":Lcom/itextpdf/layout/font/FontInfo;
    iget-object v3, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->text:Ljava/lang/String;

    invoke-static {v3, v0}, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->isSurrogatePair(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->text:Ljava/lang/String;

    .line 70
    invoke-static {v3, v0}, Lcom/itextpdf/io/util/TextUtil;->convertToUtf32(Ljava/lang/String;I)I

    move-result v3

    goto :goto_1

    :cond_0
    iget-object v3, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->text:Ljava/lang/String;

    .line 71
    invoke-virtual {v3, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    :goto_1
    nop

    .line 73
    .local v3, "codePoint":I
    invoke-virtual {v2}, Lcom/itextpdf/layout/font/FontInfo;->getFontUnicodeRange()Lcom/itextpdf/layout/font/Range;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/itextpdf/layout/font/Range;->contains(I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 74
    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->getPdfFont(Lcom/itextpdf/layout/font/FontInfo;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v4

    .line 75
    .local v4, "currentFont":Lcom/itextpdf/kernel/font/PdfFont;
    invoke-virtual {v4, v3}, Lcom/itextpdf/kernel/font/PdfFont;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v5

    .line 76
    .local v5, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    if-eqz v5, :cond_1

    invoke-virtual {v5}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v6

    if-eqz v6, :cond_1

    .line 77
    iput-object v4, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->font:Lcom/itextpdf/kernel/font/PdfFont;

    .line 78
    goto :goto_2

    .line 81
    .end local v2    # "f":Lcom/itextpdf/layout/font/FontInfo;
    .end local v3    # "codePoint":I
    .end local v4    # "currentFont":Lcom/itextpdf/kernel/font/PdfFont;
    .end local v5    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_1
    goto :goto_0

    .line 83
    :cond_2
    :goto_2
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 84
    .local v1, "glyphs":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/Glyph;>;"
    const/4 v2, 0x0

    .line 85
    .local v2, "anyGlyphsAppended":Z
    iget-object v3, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->font:Lcom/itextpdf/kernel/font/PdfFont;

    if-eqz v3, :cond_9

    .line 86
    invoke-direct {p0, v0}, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->nextSignificantUnicodeScript(I)Ljava/lang/Character$UnicodeScript;

    move-result-object v3

    .line 87
    .local v3, "unicodeScript":Ljava/lang/Character$UnicodeScript;
    move v4, v0

    .line 88
    .local v4, "to":I
    move v5, v0

    .local v5, "i":I
    :goto_3
    iget-object v6, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->text:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    const/4 v7, 0x1

    if-ge v5, v6, :cond_6

    .line 89
    iget-object v6, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->text:Ljava/lang/String;

    invoke-static {v6, v5}, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->isSurrogatePair(Ljava/lang/String;I)Z

    move-result v6

    if-eqz v6, :cond_3

    iget-object v6, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->text:Ljava/lang/String;

    invoke-static {v6, v5}, Lcom/itextpdf/io/util/TextUtil;->convertToUtf32(Ljava/lang/String;I)I

    move-result v6

    goto :goto_4

    :cond_3
    iget-object v6, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->text:Ljava/lang/String;

    invoke-virtual {v6, v5}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 90
    .local v6, "codePoint":I
    :goto_4
    invoke-static {v6}, Ljava/lang/Character$UnicodeScript;->of(I)Ljava/lang/Character$UnicodeScript;

    move-result-object v8

    .line 91
    .local v8, "currScript":Ljava/lang/Character$UnicodeScript;
    invoke-static {v8}, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->isSignificantUnicodeScript(Ljava/lang/Character$UnicodeScript;)Z

    move-result v9

    if-eqz v9, :cond_4

    if-eq v8, v3, :cond_4

    .line 92
    goto :goto_5

    .line 94
    :cond_4
    const v9, 0xffff

    if-le v6, v9, :cond_5

    add-int/lit8 v5, v5, 0x1

    .line 95
    :cond_5
    move v4, v5

    .line 88
    .end local v6    # "codePoint":I
    .end local v8    # "currScript":Ljava/lang/Character$UnicodeScript;
    add-int/2addr v5, v7

    goto :goto_3

    .line 98
    .end local v5    # "i":I
    :cond_6
    :goto_5
    iget-object v5, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->font:Lcom/itextpdf/kernel/font/PdfFont;

    iget-object v6, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->text:Ljava/lang/String;

    iget v8, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->index:I

    invoke-virtual {v5, v6, v8, v4, v1}, Lcom/itextpdf/kernel/font/PdfFont;->appendGlyphs(Ljava/lang/String;IILjava/util/List;)I

    move-result v5

    .line 99
    .local v5, "numOfAppendedGlyphs":I
    if-lez v5, :cond_7

    goto :goto_6

    :cond_7
    const/4 v7, 0x0

    :goto_6
    move v2, v7

    .line 100
    if-eqz v2, :cond_8

    .line 101
    iget v6, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->index:I

    add-int/2addr v6, v5

    iput v6, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->index:I

    goto :goto_7

    .line 100
    :cond_8
    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6

    .line 103
    .end local v3    # "unicodeScript":Ljava/lang/Character$UnicodeScript;
    .end local v4    # "to":I
    .end local v5    # "numOfAppendedGlyphs":I
    :cond_9
    :goto_7
    if-nez v2, :cond_b

    .line 104
    iget-object v3, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->selector:Lcom/itextpdf/layout/font/FontSelector;

    invoke-virtual {v3}, Lcom/itextpdf/layout/font/FontSelector;->bestMatch()Lcom/itextpdf/layout/font/FontInfo;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->getPdfFont(Lcom/itextpdf/layout/font/FontInfo;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v3

    iput-object v3, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->font:Lcom/itextpdf/kernel/font/PdfFont;

    .line 105
    iget v3, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->index:I

    if-eq v3, v0, :cond_a

    .line 106
    iget v3, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->index:I

    iget-object v4, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->font:Lcom/itextpdf/kernel/font/PdfFont;

    iget-object v5, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->text:Ljava/lang/String;

    iget v6, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->index:I

    add-int/lit8 v7, v0, -0x1

    invoke-virtual {v4, v5, v6, v7, v1}, Lcom/itextpdf/kernel/font/PdfFont;->appendGlyphs(Ljava/lang/String;IILjava/util/List;)I

    move-result v4

    add-int/2addr v3, v4

    iput v3, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->index:I

    .line 108
    :cond_a
    :goto_8
    iget v3, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->index:I

    if-gt v3, v0, :cond_b

    iget v3, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->index:I

    iget-object v4, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->text:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v3, v4, :cond_b

    .line 109
    iget v3, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->index:I

    iget-object v4, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->font:Lcom/itextpdf/kernel/font/PdfFont;

    iget-object v5, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->text:Ljava/lang/String;

    iget v6, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->index:I

    invoke-virtual {v4, v5, v6, v1}, Lcom/itextpdf/kernel/font/PdfFont;->appendAnyGlyph(Ljava/lang/String;ILjava/util/List;)I

    move-result v4

    add-int/2addr v3, v4

    iput v3, p0, Lcom/itextpdf/layout/font/ComplexFontSelectorStrategy;->index:I

    goto :goto_8

    .line 112
    :cond_b
    return-object v1
.end method
