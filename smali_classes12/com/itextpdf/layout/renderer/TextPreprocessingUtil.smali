.class public final Lcom/itextpdf/layout/renderer/TextPreprocessingUtil;
.super Ljava/lang/Object;
.source "TextPreprocessingUtil.java"


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field static final AMOUNT_OF_SPACE_IN_TAB:I = 0x3

.field static final NON_MONO_SPACE_ENSP_WIDTH:I = 0x1f4

.field static final NON_MONO_SPACE_THINSP_WIDTH:I = 0xc8


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 30
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    return-void
.end method

.method private static calculateXAdvancement(IZLcom/itextpdf/io/font/otf/Glyph;)Ljava/lang/Integer;
    .locals 3
    .param p0, "spaceWidth"    # I
    .param p1, "isMonospaceFont"    # Z
    .param p2, "glyph"    # Lcom/itextpdf/io/font/otf/Glyph;

    .line 72
    const/4 v0, 0x0

    .line 73
    .local v0, "xAdvance":Ljava/lang/Integer;
    invoke-virtual {p2}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v1

    if-gtz v1, :cond_3

    .line 75
    invoke-virtual {p2}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v1

    const/4 v2, 0x0

    sparse-switch v1, :sswitch_data_0

    .line 92
    return-object v0

    .line 86
    :sswitch_0
    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    rsub-int v2, p0, 0xc8

    :goto_0
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 87
    goto :goto_3

    .line 82
    :sswitch_1
    if-eqz p1, :cond_1

    goto :goto_1

    :cond_1
    rsub-int v2, p0, 0x3e8

    :goto_1
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 83
    goto :goto_3

    .line 78
    :sswitch_2
    if-eqz p1, :cond_2

    goto :goto_2

    :cond_2
    rsub-int v2, p0, 0x1f4

    :goto_2
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 79
    goto :goto_3

    .line 89
    :sswitch_3
    mul-int/lit8 v1, p0, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 90
    nop

    .line 95
    :cond_3
    :goto_3
    return-object v0

    :sswitch_data_0
    .sparse-switch
        0x9 -> :sswitch_3
        0x2002 -> :sswitch_2
        0x2003 -> :sswitch_1
        0x2009 -> :sswitch_0
    .end sparse-switch
.end method

.method public static replaceSpecialWhitespaceGlyphs(Lcom/itextpdf/io/font/otf/GlyphLine;Lcom/itextpdf/kernel/font/PdfFont;)Lcom/itextpdf/io/font/otf/GlyphLine;
    .locals 11
    .param p0, "line"    # Lcom/itextpdf/io/font/otf/GlyphLine;
    .param p1, "font"    # Lcom/itextpdf/kernel/font/PdfFont;

    .line 46
    if-eqz p0, :cond_3

    .line 47
    invoke-virtual {p1}, Lcom/itextpdf/kernel/font/PdfFont;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontProgram;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontMetrics;->isFixedPitch()Z

    move-result v0

    .line 48
    .local v0, "isMonospaceFont":Z
    const/16 v1, 0x20

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/font/PdfFont;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v1

    .line 49
    .local v1, "space":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-virtual {v1}, Lcom/itextpdf/io/font/otf/Glyph;->getWidth()I

    move-result v2

    .line 50
    .local v2, "spaceWidth":I
    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/GlyphLine;->size()I

    move-result v3

    .line 51
    .local v3, "lineSize":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-ge v4, v3, :cond_3

    .line 52
    invoke-virtual {p0, v4}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v5

    .line 53
    .local v5, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-static {v2, v0, v5}, Lcom/itextpdf/layout/renderer/TextPreprocessingUtil;->calculateXAdvancement(IZLcom/itextpdf/io/font/otf/Glyph;)Ljava/lang/Integer;

    move-result-object v6

    .line 54
    .local v6, "xAdvance":Ljava/lang/Integer;
    if-eqz v6, :cond_0

    const/4 v7, 0x1

    goto :goto_1

    :cond_0
    const/4 v7, 0x0

    .line 55
    .local v7, "isSpecialWhitespaceGlyph":Z
    :goto_1
    if-eqz v7, :cond_2

    .line 56
    new-instance v8, Lcom/itextpdf/io/font/otf/Glyph;

    invoke-direct {v8, v1}, Lcom/itextpdf/io/font/otf/Glyph;-><init>(Lcom/itextpdf/io/font/otf/Glyph;)V

    .line 57
    .local v8, "newGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-virtual {v5}, Lcom/itextpdf/io/font/otf/Glyph;->getChars()[C

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/itextpdf/io/font/otf/Glyph;->setChars([C)V

    .line 58
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v9

    const/16 v10, 0x7fff

    if-gt v9, v10, :cond_1

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v9

    const/16 v10, -0x8000

    if-lt v9, v10, :cond_1

    .line 59
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v9

    int-to-short v9, v9

    invoke-virtual {v8, v9}, Lcom/itextpdf/io/font/otf/Glyph;->setXAdvance(S)V

    .line 60
    invoke-virtual {p0, v4, v8}, Lcom/itextpdf/io/font/otf/GlyphLine;->set(ILcom/itextpdf/io/font/otf/Glyph;)Lcom/itextpdf/io/font/otf/Glyph;

    goto :goto_2

    .line 58
    :cond_1
    new-instance v9, Ljava/lang/AssertionError;

    invoke-direct {v9}, Ljava/lang/AssertionError;-><init>()V

    throw v9

    .line 51
    .end local v5    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    .end local v6    # "xAdvance":Ljava/lang/Integer;
    .end local v7    # "isSpecialWhitespaceGlyph":Z
    .end local v8    # "newGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_2
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 64
    .end local v0    # "isMonospaceFont":Z
    .end local v1    # "space":Lcom/itextpdf/io/font/otf/Glyph;
    .end local v2    # "spaceWidth":I
    .end local v3    # "lineSize":I
    .end local v4    # "i":I
    :cond_3
    return-object p0
.end method
