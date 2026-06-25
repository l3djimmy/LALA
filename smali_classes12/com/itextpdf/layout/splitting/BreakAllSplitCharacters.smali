.class public Lcom/itextpdf/layout/splitting/BreakAllSplitCharacters;
.super Ljava/lang/Object;
.source "BreakAllSplitCharacters.java"

# interfaces
.implements Lcom/itextpdf/layout/splitting/ISplitCharacters;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isSplitCharacter(Lcom/itextpdf/io/font/otf/GlyphLine;I)Z
    .locals 9
    .param p1, "text"    # Lcom/itextpdf/io/font/otf/GlyphLine;
    .param p2, "glyphPos"    # I

    .line 36
    invoke-virtual {p1}, Lcom/itextpdf/io/font/otf/GlyphLine;->size()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    if-ne v0, p2, :cond_0

    .line 37
    return v1

    .line 40
    :cond_0
    invoke-virtual {p1, p2}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    .line 41
    .local v0, "glyphToCheck":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/Glyph;->hasValidUnicode()Z

    move-result v2

    if-nez v2, :cond_1

    .line 42
    return v1

    .line 44
    :cond_1
    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v2

    .line 46
    .local v2, "charCode":I
    add-int/lit8 v3, p2, 0x1

    invoke-virtual {p1, v3}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v3

    .line 47
    .local v3, "nextGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-virtual {v3}, Lcom/itextpdf/io/font/otf/Glyph;->hasValidUnicode()Z

    move-result v4

    if-nez v4, :cond_2

    .line 48
    return v1

    .line 51
    :cond_2
    invoke-static {v3}, Lcom/itextpdf/io/util/TextUtil;->isLetterOrDigit(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v4

    .line 52
    .local v4, "nextGlyphIsLetterOrDigit":Z
    invoke-static {v3}, Lcom/itextpdf/io/util/TextUtil;->isMark(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v5

    .line 54
    .local v5, "nextGlyphIsMark":Z
    const/16 v6, 0x20

    const/4 v7, 0x0

    if-le v2, v6, :cond_4

    const/16 v6, 0x2d

    if-eq v2, v6, :cond_4

    const/16 v6, 0x2010

    if-eq v2, v6, :cond_4

    const/16 v6, 0x2002

    if-lt v2, v6, :cond_3

    const/16 v6, 0x200b

    if-gt v2, v6, :cond_3

    goto :goto_0

    :cond_3
    move v6, v7

    goto :goto_1

    :cond_4
    :goto_0
    move v6, v1

    .line 58
    .local v6, "currentGlyphIsDefaultSplitCharacter":Z
    :goto_1
    if-nez v6, :cond_5

    if-nez v4, :cond_5

    if-eqz v5, :cond_6

    .line 59
    :cond_5
    invoke-static {v0}, Lcom/itextpdf/io/util/TextUtil;->isNonBreakingHyphen(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v8

    if-nez v8, :cond_6

    goto :goto_2

    :cond_6
    move v1, v7

    .line 58
    :goto_2
    return v1
.end method
