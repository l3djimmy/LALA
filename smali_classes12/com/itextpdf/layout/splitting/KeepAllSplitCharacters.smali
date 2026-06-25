.class public Lcom/itextpdf/layout/splitting/KeepAllSplitCharacters;
.super Ljava/lang/Object;
.source "KeepAllSplitCharacters.java"

# interfaces
.implements Lcom/itextpdf/layout/splitting/ISplitCharacters;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static isADigitChar(Lcom/itextpdf/io/font/otf/GlyphLine;I)Z
    .locals 2
    .param p0, "text"    # Lcom/itextpdf/io/font/otf/GlyphLine;
    .param p1, "glyphPos"    # I

    .line 50
    invoke-virtual {p0, p1}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/Glyph;->getChars()[C

    move-result-object v0

    const/4 v1, 0x0

    aget-char v0, v0, v1

    invoke-static {v0}, Ljava/lang/Character;->isDigit(C)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public isSplitCharacter(Lcom/itextpdf/io/font/otf/GlyphLine;I)Z
    .locals 5
    .param p1, "text"    # Lcom/itextpdf/io/font/otf/GlyphLine;
    .param p2, "glyphPos"    # I

    .line 34
    invoke-virtual {p1, p2}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/Glyph;->hasValidUnicode()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 35
    return v1

    .line 37
    :cond_0
    invoke-virtual {p1, p2}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v0

    .line 40
    .local v0, "charCode":I
    const/16 v2, 0x2d

    const/4 v3, 0x1

    if-nez p2, :cond_1

    if-ne v0, v2, :cond_1

    invoke-virtual {p1}, Lcom/itextpdf/io/font/otf/GlyphLine;->size()I

    move-result v4

    sub-int/2addr v4, v3

    if-le v4, p2, :cond_1

    add-int/lit8 v4, p2, 0x1

    invoke-static {p1, v4}, Lcom/itextpdf/layout/splitting/KeepAllSplitCharacters;->isADigitChar(Lcom/itextpdf/io/font/otf/GlyphLine;I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 41
    return v1

    .line 44
    :cond_1
    const/16 v4, 0x20

    if-le v0, v4, :cond_2

    if-eq v0, v2, :cond_2

    const/16 v2, 0x2010

    if-eq v0, v2, :cond_2

    const/16 v2, 0x2002

    if-lt v0, v2, :cond_3

    const/16 v2, 0x200b

    if-gt v0, v2, :cond_3

    :cond_2
    move v1, v3

    :cond_3
    return v1
.end method
