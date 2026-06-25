.class public Lcom/itextpdf/layout/renderer/TextRenderer;
.super Lcom/itextpdf/layout/renderer/AbstractRenderer;
.source "TextRenderer.java"

# interfaces
.implements Lcom/itextpdf/layout/renderer/ILeafElementRenderer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/layout/renderer/TextRenderer$CustomGlyphLineFilter;,
        Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;,
        Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;
    }
.end annotation


# static fields
.field private static final BOLD_SIMULATION_STROKE_COEFF:F = 0.033333335f

.field private static final ITALIC_ANGLE:F = 0.21256f

.field protected static final TEXT_SPACE_COEFF:F = 1000.0f

.field static final TYPO_ASCENDER_SCALE_COEFF:F = 1.2f

.field static final UNDEFINED_FIRST_CHAR_TO_FORCE_OVERFLOW:I = 0x7fffffff


# instance fields
.field private font:Lcom/itextpdf/kernel/font/PdfFont;

.field private indexOfFirstCharacterToBeForcedToOverflow:I

.field protected line:Lcom/itextpdf/io/font/otf/GlyphLine;

.field protected otfFeaturesApplied:Z

.field protected reversedRanges:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[I>;"
        }
    .end annotation
.end field

.field protected savedWordBreakAtLineEnding:Lcom/itextpdf/io/font/otf/GlyphLine;

.field private specialScriptFirstNotFittingIndex:I

.field private specialScriptsWordBreakPoints:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field protected strToBeConverted:Ljava/lang/String;

.field protected tabAnchorCharacterPosition:F

.field protected text:Lcom/itextpdf/io/font/otf/GlyphLine;

.field protected yLineOffset:F


# direct methods
.method public constructor <init>(Lcom/itextpdf/layout/element/Text;)V
    .locals 1
    .param p1, "textElement"    # Lcom/itextpdf/layout/element/Text;

    .line 128
    invoke-virtual {p1}, Lcom/itextpdf/layout/element/Text;->getText()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/layout/renderer/TextRenderer;-><init>(Lcom/itextpdf/layout/element/Text;Ljava/lang/String;)V

    .line 129
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/layout/element/Text;Ljava/lang/String;)V
    .locals 1
    .param p1, "textElement"    # Lcom/itextpdf/layout/element/Text;
    .param p2, "text"    # Ljava/lang/String;

    .line 139
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;-><init>(Lcom/itextpdf/layout/element/IElement;)V

    .line 105
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->otfFeaturesApplied:Z

    .line 107
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->tabAnchorCharacterPosition:F

    .line 119
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->specialScriptFirstNotFittingIndex:I

    .line 120
    const v0, 0x7fffffff

    iput v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->indexOfFirstCharacterToBeForcedToOverflow:I

    .line 140
    iput-object p2, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->strToBeConverted:Ljava/lang/String;

    .line 141
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/layout/renderer/TextRenderer;)V
    .locals 1
    .param p1, "other"    # Lcom/itextpdf/layout/renderer/TextRenderer;

    .line 144
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;-><init>(Lcom/itextpdf/layout/renderer/AbstractRenderer;)V

    .line 105
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->otfFeaturesApplied:Z

    .line 107
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->tabAnchorCharacterPosition:F

    .line 119
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->specialScriptFirstNotFittingIndex:I

    .line 120
    const v0, 0x7fffffff

    iput v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->indexOfFirstCharacterToBeForcedToOverflow:I

    .line 145
    iget-object v0, p1, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 146
    iget-object v0, p1, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 147
    iget-object v0, p1, Lcom/itextpdf/layout/renderer/TextRenderer;->font:Lcom/itextpdf/kernel/font/PdfFont;

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->font:Lcom/itextpdf/kernel/font/PdfFont;

    .line 148
    iget v0, p1, Lcom/itextpdf/layout/renderer/TextRenderer;->yLineOffset:F

    iput v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->yLineOffset:F

    .line 149
    iget-object v0, p1, Lcom/itextpdf/layout/renderer/TextRenderer;->strToBeConverted:Ljava/lang/String;

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->strToBeConverted:Ljava/lang/String;

    .line 150
    iget-boolean v0, p1, Lcom/itextpdf/layout/renderer/TextRenderer;->otfFeaturesApplied:Z

    iput-boolean v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->otfFeaturesApplied:Z

    .line 151
    iget v0, p1, Lcom/itextpdf/layout/renderer/TextRenderer;->tabAnchorCharacterPosition:F

    iput v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->tabAnchorCharacterPosition:F

    .line 152
    iget-object v0, p1, Lcom/itextpdf/layout/renderer/TextRenderer;->reversedRanges:Ljava/util/List;

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->reversedRanges:Ljava/util/List;

    .line 153
    iget-object v0, p1, Lcom/itextpdf/layout/renderer/TextRenderer;->specialScriptsWordBreakPoints:Ljava/util/List;

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->specialScriptsWordBreakPoints:Ljava/util/List;

    .line 154
    return-void
.end method

.method static synthetic access$100(Lcom/itextpdf/io/font/otf/Glyph;)Z
    .locals 1
    .param p0, "x0"    # Lcom/itextpdf/io/font/otf/Glyph;

    .line 89
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/TextRenderer;->noPrint(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v0

    return v0
.end method

.method public static calculateAscenderDescender(Lcom/itextpdf/kernel/font/PdfFont;)[F
    .locals 1
    .param p0, "font"    # Lcom/itextpdf/kernel/font/PdfFont;

    .line 1212
    sget-object v0, Lcom/itextpdf/layout/properties/RenderingMode;->DEFAULT_LAYOUT_MODE:Lcom/itextpdf/layout/properties/RenderingMode;

    invoke-static {p0, v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->calculateAscenderDescender(Lcom/itextpdf/kernel/font/PdfFont;Lcom/itextpdf/layout/properties/RenderingMode;)[F

    move-result-object v0

    return-object v0
.end method

.method public static calculateAscenderDescender(Lcom/itextpdf/kernel/font/PdfFont;Lcom/itextpdf/layout/properties/RenderingMode;)[F
    .locals 6
    .param p0, "font"    # Lcom/itextpdf/kernel/font/PdfFont;
    .param p1, "mode"    # Lcom/itextpdf/layout/properties/RenderingMode;

    .line 1224
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfFont;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontProgram;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v0

    .line 1227
    .local v0, "fontMetrics":Lcom/itextpdf/io/font/FontMetrics;
    const v1, 0x3f99999a    # 1.2f

    .line 1228
    .local v1, "usedTypoAscenderScaleCoeff":F
    sget-object v2, Lcom/itextpdf/layout/properties/RenderingMode;->HTML_MODE:Lcom/itextpdf/layout/properties/RenderingMode;

    invoke-virtual {v2, p1}, Lcom/itextpdf/layout/properties/RenderingMode;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    instance-of v2, p0, Lcom/itextpdf/kernel/font/PdfType1Font;

    if-nez v2, :cond_0

    .line 1229
    const/high16 v1, 0x3f800000    # 1.0f

    .line 1231
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontMetrics;->getWinAscender()I

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontMetrics;->getWinDescender()I

    move-result v2

    if-eqz v2, :cond_2

    .line 1232
    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontMetrics;->getTypoAscender()I

    move-result v2

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontMetrics;->getWinAscender()I

    move-result v3

    if-ne v2, v3, :cond_1

    .line 1233
    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontMetrics;->getTypoDescender()I

    move-result v2

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontMetrics;->getWinDescender()I

    move-result v3

    if-ne v2, v3, :cond_1

    goto :goto_0

    .line 1237
    :cond_1
    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontMetrics;->getWinAscender()I

    move-result v2

    int-to-float v2, v2

    .line 1238
    .local v2, "ascender":F
    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontMetrics;->getWinDescender()I

    move-result v3

    int-to-float v3, v3

    .local v3, "descender":F
    goto :goto_1

    .line 1234
    .end local v2    # "ascender":F
    .end local v3    # "descender":F
    :cond_2
    :goto_0
    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontMetrics;->getTypoAscender()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, v1

    .line 1235
    .restart local v2    # "ascender":F
    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontMetrics;->getTypoDescender()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v3, v1

    .line 1240
    .restart local v3    # "descender":F
    :goto_1
    const/4 v4, 0x2

    new-array v4, v4, [F

    const/4 v5, 0x0

    aput v2, v4, v5

    const/4 v5, 0x1

    aput v3, v4, v5

    return-object v4
.end method

.method static codePointIsOfSpecialScript(I)Z
    .locals 2
    .param p0, "codePoint"    # I

    .line 1614
    invoke-static {p0}, Ljava/lang/Character$UnicodeScript;->of(I)Ljava/lang/Character$UnicodeScript;

    move-result-object v0

    .line 1615
    .local v0, "glyphScript":Ljava/lang/Character$UnicodeScript;
    sget-object v1, Ljava/lang/Character$UnicodeScript;->THAI:Ljava/lang/Character$UnicodeScript;

    if-eq v1, v0, :cond_1

    sget-object v1, Ljava/lang/Character$UnicodeScript;->KHMER:Ljava/lang/Character$UnicodeScript;

    if-eq v1, v0, :cond_1

    sget-object v1, Ljava/lang/Character$UnicodeScript;->LAO:Ljava/lang/Character$UnicodeScript;

    if-eq v1, v0, :cond_1

    sget-object v1, Ljava/lang/Character$UnicodeScript;->MYANMAR:Ljava/lang/Character$UnicodeScript;

    if-ne v1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    return v1
.end method

.method private convertToGlyphLine(Ljava/lang/String;)Lcom/itextpdf/io/font/otf/GlyphLine;
    .locals 1
    .param p1, "text"    # Ljava/lang/String;

    .line 1268
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->font:Lcom/itextpdf/kernel/font/PdfFont;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/font/PdfFont;->createGlyphLine(Ljava/lang/String;)Lcom/itextpdf/io/font/otf/GlyphLine;

    move-result-object v0

    return-object v0
.end method

.method private drawAndTagSingleUnderline(ZLcom/itextpdf/layout/properties/Underline;Lcom/itextpdf/layout/properties/TransparentColor;Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FF)V
    .locals 7
    .param p1, "isTagged"    # Z
    .param p2, "underline"    # Lcom/itextpdf/layout/properties/Underline;
    .param p3, "fontStrokeColor"    # Lcom/itextpdf/layout/properties/TransparentColor;
    .param p4, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .param p5, "fontSize"    # F
    .param p6, "italicAngleTan"    # F

    .line 1664
    if-eqz p1, :cond_0

    .line 1665
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasArtifact;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasArtifact;-><init>()V

    invoke-virtual {p4, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->openTag(Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1667
    :cond_0
    move-object v1, p0

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    move v6, p6

    .end local p2    # "underline":Lcom/itextpdf/layout/properties/Underline;
    .end local p3    # "fontStrokeColor":Lcom/itextpdf/layout/properties/TransparentColor;
    .end local p4    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .end local p5    # "fontSize":F
    .end local p6    # "italicAngleTan":F
    .local v2, "underline":Lcom/itextpdf/layout/properties/Underline;
    .local v3, "fontStrokeColor":Lcom/itextpdf/layout/properties/TransparentColor;
    .local v4, "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .local v5, "fontSize":F
    .local v6, "italicAngleTan":F
    invoke-virtual/range {v1 .. v6}, Lcom/itextpdf/layout/renderer/TextRenderer;->drawSingleUnderline(Lcom/itextpdf/layout/properties/Underline;Lcom/itextpdf/layout/properties/TransparentColor;Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FF)V

    .line 1668
    if-eqz p1, :cond_1

    .line 1669
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->closeTag()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1671
    :cond_1
    return-void
.end method

.method static findPossibleBreaksSplitPosition(Ljava/util/List;IZ)I
    .locals 5
    .param p1, "textStartBasedInitialOverflowTextPos"    # I
    .param p2, "amongPresentOnly"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;IZ)I"
        }
    .end annotation

    .line 1594
    .local p0, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v0, 0x0

    .line 1595
    .local v0, "low":I
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    .line 1597
    .local v1, "high":I
    :goto_0
    if-gt v0, v1, :cond_2

    .line 1598
    add-int v2, v0, v1

    ushr-int/lit8 v2, v2, 0x1

    .line 1599
    .local v2, "middle":I
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Integer;->compareTo(Ljava/lang/Integer;)I

    move-result v3

    if-gez v3, :cond_0

    .line 1600
    add-int/lit8 v0, v2, 0x1

    goto :goto_1

    .line 1601
    :cond_0
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Integer;->compareTo(Ljava/lang/Integer;)I

    move-result v3

    if-lez v3, :cond_1

    .line 1602
    add-int/lit8 v1, v2, -0x1

    .line 1606
    .end local v2    # "middle":I
    :goto_1
    goto :goto_0

    .line 1604
    .restart local v2    # "middle":I
    :cond_1
    return v2

    .line 1607
    .end local v2    # "middle":I
    :cond_2
    if-nez p2, :cond_3

    if-lez v0, :cond_3

    .line 1608
    add-int/lit8 v2, v0, -0x1

    return v2

    .line 1610
    :cond_3
    const/4 v2, -0x1

    return v2
.end method

.method private getCharWidth(Lcom/itextpdf/io/font/otf/Glyph;FLjava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;)F
    .locals 3
    .param p1, "g"    # Lcom/itextpdf/io/font/otf/Glyph;
    .param p2, "fontSize"    # F
    .param p3, "hScale"    # Ljava/lang/Float;
    .param p4, "characterSpacing"    # Ljava/lang/Float;
    .param p5, "wordSpacing"    # Ljava/lang/Float;

    .line 1674
    if-nez p3, :cond_0

    .line 1675
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p3

    .line 1677
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/io/font/otf/Glyph;->getWidth()I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, p2

    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    move-result v1

    mul-float/2addr v0, v1

    .line 1678
    .local v0, "resultWidth":F
    if-eqz p4, :cond_1

    .line 1679
    invoke-virtual {p4}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    move-result v2

    mul-float/2addr v1, v2

    invoke-static {v1}, Lcom/itextpdf/io/font/FontProgram;->convertGlyphSpaceToTextSpace(F)F

    move-result v1

    add-float/2addr v0, v1

    .line 1681
    :cond_1
    if-eqz p5, :cond_2

    invoke-virtual {p1}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v1

    const/16 v2, 0x20

    if-ne v1, v2, :cond_2

    .line 1682
    invoke-virtual {p5}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    move-result v2

    mul-float/2addr v1, v2

    invoke-static {v1}, Lcom/itextpdf/io/font/FontProgram;->convertGlyphSpaceToTextSpace(F)F

    move-result v1

    add-float/2addr v0, v1

    .line 1684
    :cond_2
    return v0
.end method

.method private getGlyphLineWidth(Lcom/itextpdf/io/font/otf/GlyphLine;FFLjava/lang/Float;Ljava/lang/Float;)F
    .locals 9
    .param p1, "glyphLine"    # Lcom/itextpdf/io/font/otf/GlyphLine;
    .param p2, "fontSize"    # F
    .param p3, "hScale"    # F
    .param p4, "characterSpacing"    # Ljava/lang/Float;
    .param p5, "wordSpacing"    # Ljava/lang/Float;

    .line 1692
    const/4 v0, 0x0

    .line 1693
    .local v0, "width":F
    iget v1, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .local v1, "i":I
    :goto_0
    iget v2, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-ge v1, v2, :cond_2

    .line 1694
    invoke-virtual {p1, v1}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v2

    invoke-static {v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->noPrint(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1695
    invoke-virtual {p1, v1}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v4

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    move-object v3, p0

    move v5, p2

    move-object v7, p4

    move-object v8, p5

    .end local p2    # "fontSize":F
    .end local p4    # "characterSpacing":Ljava/lang/Float;
    .end local p5    # "wordSpacing":Ljava/lang/Float;
    .local v5, "fontSize":F
    .local v7, "characterSpacing":Ljava/lang/Float;
    .local v8, "wordSpacing":Ljava/lang/Float;
    invoke-direct/range {v3 .. v8}, Lcom/itextpdf/layout/renderer/TextRenderer;->getCharWidth(Lcom/itextpdf/io/font/otf/Glyph;FLjava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;)F

    move-result p2

    .line 1696
    .local p2, "charWidth":F
    add-float/2addr v0, p2

    .line 1697
    iget p4, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    if-eq v1, p4, :cond_0

    add-int/lit8 p4, v1, -0x1

    invoke-virtual {p1, p4}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object p4

    invoke-virtual {p4}, Lcom/itextpdf/io/font/otf/Glyph;->getXAdvance()S

    move-result p4

    int-to-float p4, p4

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p5

    invoke-direct {p0, p4, v5, p5}, Lcom/itextpdf/layout/renderer/TextRenderer;->scaleXAdvance(FFLjava/lang/Float;)F

    move-result p4

    goto :goto_1

    :cond_0
    const/4 p4, 0x0

    .line 1698
    .local p4, "xAdvance":F
    :goto_1
    add-float/2addr v0, p4

    goto :goto_2

    .line 1694
    .end local v5    # "fontSize":F
    .end local v7    # "characterSpacing":Ljava/lang/Float;
    .end local v8    # "wordSpacing":Ljava/lang/Float;
    .local p2, "fontSize":F
    .local p4, "characterSpacing":Ljava/lang/Float;
    .restart local p5    # "wordSpacing":Ljava/lang/Float;
    :cond_1
    move v5, p2

    move-object v7, p4

    move-object v8, p5

    .line 1693
    .end local p2    # "fontSize":F
    .end local p4    # "characterSpacing":Ljava/lang/Float;
    .end local p5    # "wordSpacing":Ljava/lang/Float;
    .restart local v5    # "fontSize":F
    .restart local v7    # "characterSpacing":Ljava/lang/Float;
    .restart local v8    # "wordSpacing":Ljava/lang/Float;
    :goto_2
    add-int/lit8 v1, v1, 0x1

    move p2, v5

    move-object p4, v7

    move-object p5, v8

    goto :goto_0

    .end local v5    # "fontSize":F
    .end local v7    # "characterSpacing":Ljava/lang/Float;
    .end local v8    # "wordSpacing":Ljava/lang/Float;
    .restart local p2    # "fontSize":F
    .restart local p4    # "characterSpacing":Ljava/lang/Float;
    .restart local p5    # "wordSpacing":Ljava/lang/Float;
    :cond_2
    move v5, p2

    .line 1701
    .end local v1    # "i":I
    .end local p2    # "fontSize":F
    .restart local v5    # "fontSize":F
    invoke-static {v0}, Lcom/itextpdf/io/font/FontProgram;->convertTextSpaceToGlyphSpace(F)F

    move-result p2

    return p2
.end method

.method private getWordBoundsForHyphenation(Lcom/itextpdf/io/font/otf/GlyphLine;III)[I
    .locals 3
    .param p1, "text"    # Lcom/itextpdf/io/font/otf/GlyphLine;
    .param p2, "leftTextPos"    # I
    .param p3, "rightTextPos"    # I
    .param p4, "wordMiddleCharPos"    # I

    .line 1705
    nop

    :goto_0
    if-lt p4, p2, :cond_0

    invoke-virtual {p1, p4}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->isGlyphPartOfWordForHyphenation(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1706
    invoke-virtual {p1, p4}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/io/util/TextUtil;->isUni0020(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1707
    add-int/lit8 p4, p4, -0x1

    goto :goto_0

    .line 1709
    :cond_0
    if-lt p4, p2, :cond_3

    .line 1710
    move v0, p4

    .line 1711
    .local v0, "left":I
    :goto_1
    if-lt v0, p2, :cond_1

    invoke-virtual {p1, v0}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->isGlyphPartOfWordForHyphenation(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1712
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 1714
    :cond_1
    move v1, p4

    .line 1715
    .local v1, "right":I
    :goto_2
    if-ge v1, p3, :cond_2

    invoke-virtual {p1, v1}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->isGlyphPartOfWordForHyphenation(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1716
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 1718
    :cond_2
    add-int/lit8 v2, v0, 0x1

    filled-new-array {v2, v1}, [I

    move-result-object v2

    return-object v2

    .line 1720
    .end local v0    # "left":I
    .end local v1    # "right":I
    :cond_3
    const/4 v0, 0x0

    return-object v0
.end method

.method private static glyphBelongsToNonBreakingHyphenRelatedChunk(Lcom/itextpdf/io/font/otf/GlyphLine;I)Z
    .locals 2
    .param p0, "text"    # Lcom/itextpdf/io/font/otf/GlyphLine;
    .param p1, "ind"    # I

    .line 1788
    invoke-virtual {p0, p1}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/io/util/TextUtil;->isNonBreakingHyphen(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v0

    if-nez v0, :cond_2

    add-int/lit8 v0, p1, 0x1

    iget v1, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-ge v0, v1, :cond_0

    add-int/lit8 v0, p1, 0x1

    invoke-virtual {p0, v0}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/io/util/TextUtil;->isNonBreakingHyphen(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v0

    if-nez v0, :cond_2

    :cond_0
    add-int/lit8 v0, p1, -0x1

    iget v1, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    if-lt v0, v1, :cond_1

    add-int/lit8 v0, p1, -0x1

    invoke-virtual {p0, v0}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/io/util/TextUtil;->isNonBreakingHyphen(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private hasOtfFont()Z
    .locals 1

    .line 1272
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->font:Lcom/itextpdf/kernel/font/PdfFont;

    instance-of v0, v0, Lcom/itextpdf/kernel/font/PdfType0Font;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->font:Lcom/itextpdf/kernel/font/PdfFont;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/font/PdfFont;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    instance-of v0, v0, Lcom/itextpdf/io/font/TrueTypeFont;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private increaseYLineOffset([Lcom/itextpdf/layout/properties/UnitValue;[Lcom/itextpdf/layout/borders/Border;[Lcom/itextpdf/layout/properties/UnitValue;)V
    .locals 4
    .param p1, "paddings"    # [Lcom/itextpdf/layout/properties/UnitValue;
    .param p2, "borders"    # [Lcom/itextpdf/layout/borders/Border;
    .param p3, "margins"    # [Lcom/itextpdf/layout/properties/UnitValue;

    .line 731
    iget v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->yLineOffset:F

    const/4 v1, 0x0

    aget-object v2, p1, v1

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    aget-object v2, p1, v1

    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v2

    goto :goto_0

    :cond_0
    move v2, v3

    :goto_0
    add-float/2addr v0, v2

    iput v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->yLineOffset:F

    .line 732
    iget v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->yLineOffset:F

    aget-object v2, p2, v1

    if-eqz v2, :cond_1

    aget-object v2, p2, v1

    invoke-virtual {v2}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v2

    goto :goto_1

    :cond_1
    move v2, v3

    :goto_1
    add-float/2addr v0, v2

    iput v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->yLineOffset:F

    .line 733
    iget v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->yLineOffset:F

    aget-object v2, p3, v1

    if-eqz v2, :cond_2

    aget-object v1, p3, v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v3

    :cond_2
    add-float/2addr v0, v3

    iput v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->yLineOffset:F

    .line 734
    return-void
.end method

.method private isGlyphPartOfWordForHyphenation(Lcom/itextpdf/io/font/otf/Glyph;)Z
    .locals 2
    .param p1, "g"    # Lcom/itextpdf/io/font/otf/Glyph;

    .line 1725
    invoke-virtual {p1}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v0

    int-to-char v0, v0

    invoke-static {v0}, Ljava/lang/Character;->isLetter(C)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1728
    invoke-virtual {p1}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v0

    const/16 v1, 0xad

    if-ne v1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 1725
    :goto_1
    return v0
.end method

.method private static noPrint(Lcom/itextpdf/io/font/otf/Glyph;)Z
    .locals 2
    .param p0, "g"    # Lcom/itextpdf/io/font/otf/Glyph;

    .line 1780
    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/Glyph;->hasValidUnicode()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1781
    const/4 v0, 0x0

    return v0

    .line 1783
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v0

    .line 1784
    .local v0, "c":I
    invoke-static {v0}, Lcom/itextpdf/io/util/TextUtil;->isNonPrintable(I)Z

    move-result v1

    return v1
.end method

.method private static numberOfElementsLessThan(Ljava/util/ArrayList;I)I
    .locals 2
    .param p1, "n"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;I)I"
        }
    .end annotation

    .line 1762
    .local p0, "numbers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p0, v0}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;)I

    move-result v0

    .line 1763
    .local v0, "x":I
    if-ltz v0, :cond_0

    .line 1764
    return v0

    .line 1766
    :cond_0
    neg-int v1, v0

    add-int/lit8 v1, v1, -0x1

    return v1
.end method

.method private static numberOfElementsLessThanOrEqual(Ljava/util/ArrayList;I)I
    .locals 2
    .param p1, "n"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;I)I"
        }
    .end annotation

    .line 1771
    .local p0, "numbers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p0, v0}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;)I

    move-result v0

    .line 1772
    .local v0, "x":I
    if-ltz v0, :cond_0

    .line 1773
    add-int/lit8 v1, v0, 0x1

    return v1

    .line 1775
    :cond_0
    neg-int v1, v0

    add-int/lit8 v1, v1, -0x1

    return v1
.end method

.method private saveWordBreakIfNotYetSaved(Lcom/itextpdf/io/font/otf/Glyph;)V
    .locals 2
    .param p1, "wordBreak"    # Lcom/itextpdf/io/font/otf/Glyph;

    .line 1750
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->savedWordBreakAtLineEnding:Lcom/itextpdf/io/font/otf/GlyphLine;

    if-nez v0, :cond_1

    .line 1751
    invoke-static {p1}, Lcom/itextpdf/io/util/TextUtil;->isNewLine(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1754
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->font:Lcom/itextpdf/kernel/font/PdfFont;

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/font/PdfFont;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object p1

    .line 1757
    :cond_0
    new-instance v0, Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/io/font/otf/GlyphLine;-><init>(Ljava/util/List;)V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->savedWordBreakAtLineEnding:Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 1759
    :cond_1
    return-void
.end method

.method private scaleXAdvance(FFLjava/lang/Float;)F
    .locals 2
    .param p1, "xAdvance"    # F
    .param p2, "fontSize"    # F
    .param p3, "hScale"    # Ljava/lang/Float;

    .line 1688
    mul-float v0, p1, p2

    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    move-result v1

    mul-float/2addr v0, v1

    return v0
.end method

.method private splitIgnoreFirstNewLine(I)[Lcom/itextpdf/layout/renderer/TextRenderer;
    .locals 1
    .param p1, "currentTextPos"    # I

    .line 1260
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-static {v0, p1}, Lcom/itextpdf/io/util/TextUtil;->isCarriageReturnFollowedByLineFeed(Lcom/itextpdf/io/font/otf/GlyphLine;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1261
    add-int/lit8 v0, p1, 0x2

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->split(I)[Lcom/itextpdf/layout/renderer/TextRenderer;

    move-result-object v0

    return-object v0

    .line 1263
    :cond_0
    add-int/lit8 v0, p1, 0x1

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->split(I)[Lcom/itextpdf/layout/renderer/TextRenderer;

    move-result-object v0

    return-object v0
.end method

.method private updateFontAndText()V
    .locals 4

    .line 1732
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->strToBeConverted:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 1735
    const/16 v0, 0x14

    :try_start_0
    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPropertyAsFont(I)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1742
    .local v0, "newFont":Lcom/itextpdf/kernel/font/PdfFont;
    goto :goto_0

    .line 1736
    .end local v0    # "newFont":Lcom/itextpdf/kernel/font/PdfFont;
    :catch_0
    move-exception v0

    .line 1737
    .local v0, "cce":Ljava/lang/ClassCastException;
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TextRenderer;->resolveFirstPdfFont()Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v1

    .line 1738
    .local v1, "newFont":Lcom/itextpdf/kernel/font/PdfFont;
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->strToBeConverted:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 1739
    const-class v2, Lcom/itextpdf/layout/renderer/TextRenderer;

    invoke-static {v2}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v2

    .line 1740
    .local v2, "logger":Lorg/slf4j/Logger;
    const-string v3, "The \"Property.FONT\" property must be a PdfFont object in this context."

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1743
    .end local v0    # "cce":Ljava/lang/ClassCastException;
    .end local v2    # "logger":Lorg/slf4j/Logger;
    :cond_0
    move-object v0, v1

    .end local v1    # "newFont":Lcom/itextpdf/kernel/font/PdfFont;
    .local v0, "newFont":Lcom/itextpdf/kernel/font/PdfFont;
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->strToBeConverted:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/font/PdfFont;->createGlyphLine(Ljava/lang/String;)Lcom/itextpdf/io/font/otf/GlyphLine;

    move-result-object v1

    .line 1744
    .local v1, "newText":Lcom/itextpdf/io/font/otf/GlyphLine;
    invoke-static {v1, v0}, Lcom/itextpdf/layout/renderer/TextPreprocessingUtil;->replaceSpecialWhitespaceGlyphs(Lcom/itextpdf/io/font/otf/GlyphLine;Lcom/itextpdf/kernel/font/PdfFont;)Lcom/itextpdf/io/font/otf/GlyphLine;

    move-result-object v1

    .line 1745
    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->setProcessedGlyphLineAndFont(Lcom/itextpdf/io/font/otf/GlyphLine;Lcom/itextpdf/kernel/font/PdfFont;)V

    .line 1747
    .end local v0    # "newFont":Lcom/itextpdf/kernel/font/PdfFont;
    .end local v1    # "newText":Lcom/itextpdf/io/font/otf/GlyphLine;
    :cond_1
    return-void
.end method

.method static updateRangeBasedOnRemovedCharacters(Ljava/util/ArrayList;[I)V
    .locals 3
    .param p1, "range"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;[I)V"
        }
    .end annotation

    .line 1581
    .local p0, "removedIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const/4 v0, 0x0

    aget v1, p1, v0

    invoke-static {p0, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->numberOfElementsLessThan(Ljava/util/ArrayList;I)I

    move-result v1

    .line 1582
    .local v1, "shift":I
    aget v2, p1, v0

    sub-int/2addr v2, v1

    aput v2, p1, v0

    .line 1583
    const/4 v0, 0x1

    aget v2, p1, v0

    invoke-static {p0, v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->numberOfElementsLessThanOrEqual(Ljava/util/ArrayList;I)I

    move-result v1

    .line 1584
    aget v2, p1, v0

    sub-int/2addr v2, v1

    aput v2, p1, v0

    .line 1585
    return-void
.end method


# virtual methods
.method public applyOtf()V
    .locals 19

    .line 737
    move-object/from16 v0, p0

    invoke-direct {v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->updateFontAndText()V

    .line 738
    const/16 v1, 0x17

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Character$UnicodeScript;

    .line 739
    .local v1, "script":Ljava/lang/Character$UnicodeScript;
    iget-boolean v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->otfFeaturesApplied:Z

    if-nez v2, :cond_10

    invoke-static {}, Lcom/itextpdf/layout/renderer/TypographyUtils;->isPdfCalligraphAvailable()Z

    move-result v2

    if-eqz v2, :cond_10

    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v2, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v3, v3, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-ge v2, v3, :cond_10

    .line 740
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPdfDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v2

    .line 741
    .local v2, "pdfDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    const/4 v3, 0x0

    if-nez v2, :cond_0

    move-object v4, v3

    goto :goto_0

    :cond_0
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDocumentIdWrapper()Lcom/itextpdf/commons/actions/sequence/SequenceId;

    move-result-object v4

    :goto_0
    move-object v9, v4

    .line 742
    .local v9, "sequenceId":Lcom/itextpdf/commons/actions/sequence/SequenceId;
    const/16 v4, 0x87

    invoke-virtual {v0, v4}, Lcom/itextpdf/layout/renderer/TextRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/renderer/MetaInfoContainer;

    .line 743
    .local v4, "metaInfoContainer":Lcom/itextpdf/layout/renderer/MetaInfoContainer;
    if-nez v4, :cond_1

    move-object v10, v3

    goto :goto_1

    :cond_1
    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/MetaInfoContainer;->getMetaInfo()Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    move-result-object v5

    move-object v10, v5

    .line 744
    .local v10, "metaInfo":Lcom/itextpdf/commons/actions/contexts/IMetaInfo;
    :goto_1
    invoke-direct {v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->hasOtfFont()Z

    move-result v5

    if-eqz v5, :cond_e

    .line 745
    const/16 v5, 0x75

    invoke-virtual {v0, v5}, Lcom/itextpdf/layout/renderer/TextRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v8

    .line 746
    .local v8, "typographyConfig":Ljava/lang/Object;
    const/4 v5, 0x0

    .line 747
    .local v5, "supportedScripts":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Character$UnicodeScript;>;"
    if-eqz v8, :cond_2

    .line 748
    invoke-static {v8}, Lcom/itextpdf/layout/renderer/TypographyUtils;->getSupportedScripts(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v5

    .line 750
    :cond_2
    if-nez v5, :cond_3

    .line 751
    invoke-static {}, Lcom/itextpdf/layout/renderer/TypographyUtils;->getSupportedScripts()Ljava/util/Collection;

    move-result-object v5

    move-object v11, v5

    goto :goto_2

    .line 750
    :cond_3
    move-object v11, v5

    .line 753
    .end local v5    # "supportedScripts":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Character$UnicodeScript;>;"
    .local v11, "supportedScripts":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Character$UnicodeScript;>;"
    :goto_2
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    move-object v12, v5

    .line 754
    .local v12, "scriptsRanges":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;>;"
    if-eqz v1, :cond_4

    .line 755
    new-instance v3, Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;

    iget-object v5, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v5, v5, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    invoke-direct {v3, v1, v5}, Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;-><init>(Ljava/lang/Character$UnicodeScript;I)V

    invoke-interface {v12, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 758
    :cond_4
    new-instance v5, Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;

    iget-object v6, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v6, v6, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    invoke-direct {v5, v3, v6}, Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;-><init>(Ljava/lang/Character$UnicodeScript;I)V

    .line 759
    .local v5, "currRange":Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;
    invoke-interface {v12, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 760
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v3, v3, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .local v3, "i":I
    :goto_3
    iget-object v6, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v6, v6, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-ge v3, v6, :cond_8

    .line 761
    iget-object v6, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-virtual {v6, v3}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v6

    .line 762
    .local v6, "unicode":I
    const/4 v7, -0x1

    if-le v6, v7, :cond_7

    .line 763
    invoke-static {v6}, Ljava/lang/Character$UnicodeScript;->of(I)Ljava/lang/Character$UnicodeScript;

    move-result-object v7

    .line 764
    .local v7, "glyphScript":Ljava/lang/Character$UnicodeScript;
    sget-object v13, Ljava/lang/Character$UnicodeScript;->COMMON:Ljava/lang/Character$UnicodeScript;

    invoke-virtual {v13, v7}, Ljava/lang/Character$UnicodeScript;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_7

    sget-object v13, Ljava/lang/Character$UnicodeScript;->UNKNOWN:Ljava/lang/Character$UnicodeScript;

    invoke-virtual {v13, v7}, Ljava/lang/Character$UnicodeScript;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_7

    sget-object v13, Ljava/lang/Character$UnicodeScript;->INHERITED:Ljava/lang/Character$UnicodeScript;

    .line 765
    invoke-virtual {v13, v7}, Ljava/lang/Character$UnicodeScript;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_5

    .line 766
    goto :goto_4

    .line 768
    :cond_5
    iget-object v13, v5, Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;->script:Ljava/lang/Character$UnicodeScript;

    if-eq v7, v13, :cond_7

    .line 769
    iget-object v13, v5, Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;->script:Ljava/lang/Character$UnicodeScript;

    if-nez v13, :cond_6

    .line 770
    iput-object v7, v5, Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;->script:Ljava/lang/Character$UnicodeScript;

    goto :goto_4

    .line 772
    :cond_6
    iput v3, v5, Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;->rangeEnd:I

    .line 773
    new-instance v13, Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;

    iget-object v14, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v14, v14, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    invoke-direct {v13, v7, v14}, Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;-><init>(Ljava/lang/Character$UnicodeScript;I)V

    .line 774
    .end local v5    # "currRange":Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;
    .local v13, "currRange":Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;
    invoke-interface {v12, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object v5, v13

    .line 760
    .end local v6    # "unicode":I
    .end local v7    # "glyphScript":Ljava/lang/Character$UnicodeScript;
    .end local v13    # "currRange":Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;
    .restart local v5    # "currRange":Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;
    :cond_7
    :goto_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 781
    .end local v3    # "i":I
    .end local v5    # "currRange":Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;
    :cond_8
    :goto_5
    const/4 v3, 0x0

    .line 782
    .local v3, "delta":I
    iget-object v5, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v13, v5, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .line 783
    .local v13, "origTextStart":I
    iget-object v5, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v14, v5, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    .line 784
    .local v14, "origTextEnd":I
    iget-object v5, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v5, v5, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .line 785
    .local v5, "shapingRangeStart":I
    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_6
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_d

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;

    .line 786
    .local v6, "scriptsRange":Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;
    iget-object v7, v6, Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;->script:Ljava/lang/Character$UnicodeScript;

    if-eqz v7, :cond_c

    iget-object v7, v6, Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;->script:Ljava/lang/Character$UnicodeScript;

    invoke-static {v7}, Lcom/itextpdf/io/util/EnumUtil;->throwIfNull(Ljava/lang/Enum;)Ljava/lang/Enum;

    move-result-object v7

    invoke-interface {v11, v7}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_9

    .line 787
    move-object/from16 v16, v1

    move/from16 v17, v5

    goto :goto_7

    .line 789
    :cond_9
    iget v7, v6, Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;->rangeEnd:I

    add-int/2addr v7, v3

    iput v7, v6, Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;->rangeEnd:I

    .line 790
    iget-object v7, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iput v5, v7, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .line 791
    iget-object v7, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    move-object/from16 v16, v1

    .end local v1    # "script":Ljava/lang/Character$UnicodeScript;
    .local v16, "script":Ljava/lang/Character$UnicodeScript;
    iget v1, v6, Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;->rangeEnd:I

    iput v1, v7, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    .line 793
    iget-object v1, v6, Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;->script:Ljava/lang/Character$UnicodeScript;

    sget-object v7, Ljava/lang/Character$UnicodeScript;->ARABIC:Ljava/lang/Character$UnicodeScript;

    if-eq v1, v7, :cond_a

    iget-object v1, v6, Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;->script:Ljava/lang/Character$UnicodeScript;

    sget-object v7, Ljava/lang/Character$UnicodeScript;->HEBREW:Ljava/lang/Character$UnicodeScript;

    if-ne v1, v7, :cond_b

    :cond_a
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    instance-of v1, v1, Lcom/itextpdf/layout/renderer/LineRenderer;

    if-eqz v1, :cond_b

    .line 799
    const/4 v1, 0x7

    sget-object v7, Lcom/itextpdf/layout/properties/BaseDirection;->DEFAULT_BIDI:Lcom/itextpdf/layout/properties/BaseDirection;

    invoke-virtual {v0, v1, v7}, Lcom/itextpdf/layout/renderer/TextRenderer;->setProperty(ILjava/lang/Object;)V

    .line 801
    :cond_b
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->font:Lcom/itextpdf/kernel/font/PdfFont;

    .line 802
    invoke-virtual {v1}, Lcom/itextpdf/kernel/font/PdfFont;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v1

    iget-object v7, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    move-object/from16 v17, v7

    iget-object v7, v6, Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;->script:Ljava/lang/Character$UnicodeScript;

    .line 801
    move/from16 v18, v5

    move-object v5, v1

    move-object v1, v6

    move-object/from16 v6, v17

    move/from16 v17, v18

    .end local v5    # "shapingRangeStart":I
    .end local v6    # "scriptsRange":Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;
    .local v1, "scriptsRange":Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;
    .local v17, "shapingRangeStart":I
    invoke-static/range {v5 .. v10}, Lcom/itextpdf/layout/renderer/TypographyUtils;->applyOtfScript(Lcom/itextpdf/io/font/FontProgram;Lcom/itextpdf/io/font/otf/GlyphLine;Ljava/lang/Character$UnicodeScript;Ljava/lang/Object;Lcom/itextpdf/commons/actions/sequence/SequenceId;Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)V

    .line 804
    iget-object v5, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v5, v5, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    iget v6, v1, Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;->rangeEnd:I

    sub-int/2addr v5, v6

    add-int/2addr v3, v5

    .line 805
    iget-object v5, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v5, v5, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    move v6, v5

    .end local v17    # "shapingRangeStart":I
    .local v6, "shapingRangeStart":I
    iput v5, v1, Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;->rangeEnd:I

    .line 806
    .end local v1    # "scriptsRange":Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;
    move-object/from16 v1, v16

    goto :goto_6

    .line 786
    .end local v16    # "script":Ljava/lang/Character$UnicodeScript;
    .local v1, "script":Ljava/lang/Character$UnicodeScript;
    .restart local v5    # "shapingRangeStart":I
    .local v6, "scriptsRange":Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;
    :cond_c
    move-object/from16 v16, v1

    move/from16 v17, v5

    move-object v1, v6

    .line 785
    .end local v1    # "script":Ljava/lang/Character$UnicodeScript;
    .end local v5    # "shapingRangeStart":I
    .end local v6    # "scriptsRange":Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;
    .restart local v16    # "script":Ljava/lang/Character$UnicodeScript;
    .restart local v17    # "shapingRangeStart":I
    :goto_7
    move-object/from16 v1, v16

    move/from16 v5, v17

    goto :goto_6

    .line 807
    .end local v16    # "script":Ljava/lang/Character$UnicodeScript;
    .end local v17    # "shapingRangeStart":I
    .restart local v1    # "script":Ljava/lang/Character$UnicodeScript;
    .restart local v5    # "shapingRangeStart":I
    :cond_d
    move-object/from16 v16, v1

    move/from16 v17, v5

    .end local v1    # "script":Ljava/lang/Character$UnicodeScript;
    .end local v5    # "shapingRangeStart":I
    .restart local v16    # "script":Ljava/lang/Character$UnicodeScript;
    .restart local v17    # "shapingRangeStart":I
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iput v13, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .line 808
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    add-int v5, v14, v3

    iput v5, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    goto :goto_8

    .line 744
    .end local v3    # "delta":I
    .end local v8    # "typographyConfig":Ljava/lang/Object;
    .end local v11    # "supportedScripts":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Character$UnicodeScript;>;"
    .end local v12    # "scriptsRanges":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/TextRenderer$ScriptRange;>;"
    .end local v13    # "origTextStart":I
    .end local v14    # "origTextEnd":I
    .end local v16    # "script":Ljava/lang/Character$UnicodeScript;
    .end local v17    # "shapingRangeStart":I
    .restart local v1    # "script":Ljava/lang/Character$UnicodeScript;
    :cond_e
    move-object/from16 v16, v1

    .line 811
    .end local v1    # "script":Ljava/lang/Character$UnicodeScript;
    .restart local v16    # "script":Ljava/lang/Character$UnicodeScript;
    :goto_8
    const/16 v1, 0x16

    sget-object v3, Lcom/itextpdf/layout/properties/FontKerning;->NO:Lcom/itextpdf/layout/properties/FontKerning;

    invoke-virtual {v0, v1, v3}, Lcom/itextpdf/layout/renderer/TextRenderer;->getProperty(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/FontKerning;

    .line 812
    .local v1, "fontKerning":Lcom/itextpdf/layout/properties/FontKerning;
    sget-object v3, Lcom/itextpdf/layout/properties/FontKerning;->YES:Lcom/itextpdf/layout/properties/FontKerning;

    if-ne v1, v3, :cond_f

    .line 813
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->font:Lcom/itextpdf/kernel/font/PdfFont;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/font/PdfFont;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v3

    iget-object v5, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-static {v3, v5, v9, v10}, Lcom/itextpdf/layout/renderer/TypographyUtils;->applyKerning(Lcom/itextpdf/io/font/FontProgram;Lcom/itextpdf/io/font/otf/GlyphLine;Lcom/itextpdf/commons/actions/sequence/SequenceId;Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)V

    .line 816
    :cond_f
    const/4 v3, 0x1

    iput-boolean v3, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->otfFeaturesApplied:Z

    goto :goto_9

    .line 739
    .end local v2    # "pdfDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local v4    # "metaInfoContainer":Lcom/itextpdf/layout/renderer/MetaInfoContainer;
    .end local v9    # "sequenceId":Lcom/itextpdf/commons/actions/sequence/SequenceId;
    .end local v10    # "metaInfo":Lcom/itextpdf/commons/actions/contexts/IMetaInfo;
    .end local v16    # "script":Ljava/lang/Character$UnicodeScript;
    .local v1, "script":Ljava/lang/Character$UnicodeScript;
    :cond_10
    move-object/from16 v16, v1

    .line 818
    .end local v1    # "script":Ljava/lang/Character$UnicodeScript;
    .restart local v16    # "script":Ljava/lang/Character$UnicodeScript;
    :goto_9
    return-void
.end method

.method protected baseCharactersCount()I
    .locals 4

    .line 1378
    const/4 v0, 0x0

    .line 1379
    .local v0, "count":I
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v1, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v2, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-ge v1, v2, :cond_1

    .line 1380
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-virtual {v2, v1}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v2

    .line 1381
    .local v2, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-virtual {v2}, Lcom/itextpdf/io/font/otf/Glyph;->hasPlacement()Z

    move-result v3

    if-nez v3, :cond_0

    .line 1382
    add-int/lit8 v0, v0, 0x1

    .line 1379
    .end local v2    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1385
    .end local v1    # "i":I
    :cond_1
    return v0
.end method

.method protected calculateLineWidth()F
    .locals 9

    .line 1502
    const/16 v0, 0x18

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPropertyAsUnitValue(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v1

    .line 1503
    .local v1, "fontSize":Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v2

    if-nez v2, :cond_0

    .line 1504
    const-class v2, Lcom/itextpdf/layout/renderer/TextRenderer;

    invoke-static {v2}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v2

    .line 1505
    .local v2, "logger":Lorg/slf4j/Logger;
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v3, "Property {0} in percents is not supported"

    invoke-static {v3, v0}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1507
    .end local v2    # "logger":Lorg/slf4j/Logger;
    :cond_0
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v5

    .line 1508
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const/16 v2, 0x1d

    invoke-virtual {p0, v2, v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPropertyAsFloat(ILjava/lang/Float;)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v6

    .line 1509
    const/16 v0, 0xf

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v7

    const/16 v0, 0x4e

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v8

    .line 1507
    move-object v3, p0

    invoke-direct/range {v3 .. v8}, Lcom/itextpdf/layout/renderer/TextRenderer;->getGlyphLineWidth(Lcom/itextpdf/io/font/otf/GlyphLine;FFLjava/lang/Float;Ljava/lang/Float;)F

    move-result v0

    return v0
.end method

.method public charAt(I)I
    .locals 2
    .param p1, "pos"    # I

    .line 1178
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v1, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    add-int/2addr v1, p1

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v0

    return v0
.end method

.method protected createCopy(Lcom/itextpdf/io/font/otf/GlyphLine;Lcom/itextpdf/kernel/font/PdfFont;)Lcom/itextpdf/layout/renderer/TextRenderer;
    .locals 3
    .param p1, "gl"    # Lcom/itextpdf/io/font/otf/GlyphLine;
    .param p2, "font"    # Lcom/itextpdf/kernel/font/PdfFont;

    .line 1571
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcom/itextpdf/layout/renderer/TextRenderer;

    if-eq v1, v0, :cond_0

    .line 1572
    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 1573
    .local v0, "logger":Lorg/slf4j/Logger;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "While processing an instance of TextRenderer, iText uses createCopy() to create glyph lines of specific fonts, which represent its parts. So if one extends TextRenderer, one should override createCopy, otherwise if FontSelector related logic is triggered, copies of this TextRenderer will have the default behavior rather than the custom one."

    invoke-static {v2, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1575
    .end local v0    # "logger":Lorg/slf4j/Logger;
    :cond_0
    new-instance v0, Lcom/itextpdf/layout/renderer/TextRenderer;

    invoke-direct {v0, p0}, Lcom/itextpdf/layout/renderer/TextRenderer;-><init>(Lcom/itextpdf/layout/renderer/TextRenderer;)V

    .line 1576
    .local v0, "copy":Lcom/itextpdf/layout/renderer/TextRenderer;
    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/layout/renderer/TextRenderer;->setProcessedGlyphLineAndFont(Lcom/itextpdf/io/font/otf/GlyphLine;Lcom/itextpdf/kernel/font/PdfFont;)V

    .line 1577
    return-object v0
.end method

.method protected createOverflowRenderer()Lcom/itextpdf/layout/renderer/TextRenderer;
    .locals 1

    .line 1412
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TextRenderer;->getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/TextRenderer;

    return-object v0
.end method

.method protected createSplitRenderer()Lcom/itextpdf/layout/renderer/TextRenderer;
    .locals 1

    .line 1408
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TextRenderer;->getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/renderer/TextRenderer;

    return-object v0
.end method

.method public draw(Lcom/itextpdf/layout/renderer/DrawContext;)V
    .locals 32
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;

    .line 822
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    const-class v2, Lcom/itextpdf/layout/renderer/TextRenderer;

    if-nez v1, :cond_0

    .line 823
    invoke-static {v2}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 824
    .local v1, "logger":Lorg/slf4j/Logger;
    const-string v2, "Drawing won\'t be performed."

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const-string v3, "Occupied area has not been initialized. {0}"

    invoke-static {v3, v2}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 826
    return-void

    .line 830
    .end local v1    # "logger":Lorg/slf4j/Logger;
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/renderer/DrawContext;->isTaggingEnabled()Z

    move-result v7

    .line 831
    .local v7, "isTagged":Z
    const/4 v1, 0x0

    .line 832
    .local v1, "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    const/4 v3, 0x0

    .line 833
    .local v3, "isArtifact":Z
    const/4 v4, 0x0

    .line 834
    .local v4, "tagPointer":Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    const/4 v8, 0x0

    if-eqz v7, :cond_4

    .line 835
    const/16 v5, 0x6c

    invoke-virtual {v0, v5}, Lcom/itextpdf/layout/renderer/TextRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v5

    move-object v1, v5

    check-cast v1, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;

    .line 836
    if-nez v1, :cond_1

    .line 837
    const/4 v3, 0x1

    move-object v9, v1

    move v10, v3

    move-object v11, v4

    goto :goto_0

    .line 839
    :cond_1
    invoke-virtual {v1, v0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->isArtifact(Lcom/itextpdf/layout/IPropertyContainer;)Z

    move-result v3

    .line 840
    if-nez v3, :cond_3

    .line 841
    invoke-virtual {v1, v0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->useAutoTaggingPointerAndRememberItsPosition(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    move-result-object v4

    .line 842
    invoke-virtual {v1, v0, v4}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->createTag(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 843
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    move-result-object v5

    invoke-static {v0, v4}, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier;->getLayoutAttributes(Lcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;

    move-result-object v6

    invoke-virtual {v5, v8, v6}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->addAttributes(ILcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    .line 849
    :cond_2
    move-object v9, v1

    move v10, v3

    move-object v11, v4

    goto :goto_0

    .line 840
    :cond_3
    move-object v9, v1

    move v10, v3

    move-object v11, v4

    goto :goto_0

    .line 834
    :cond_4
    move-object v9, v1

    move v10, v3

    move-object v11, v4

    .line 849
    .end local v1    # "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    .end local v3    # "isArtifact":Z
    .end local v4    # "tagPointer":Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .local v9, "taggingHelper":Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    .local v10, "isArtifact":Z
    .local v11, "tagPointer":Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    :goto_0
    invoke-super/range {p0 .. p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->draw(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 851
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->isRelativePosition()Z

    move-result v12

    .line 852
    .local v12, "isRelativePosition":Z
    if-eqz v12, :cond_5

    .line 853
    invoke-virtual {v0, v8}, Lcom/itextpdf/layout/renderer/TextRenderer;->applyRelativePositioningTranslation(Z)V

    .line 856
    :cond_5
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->getInnerAreaBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v18

    .line 858
    .local v18, "leftBBoxX":F
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v1, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v3, v3, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    if-gt v1, v3, :cond_7

    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->savedWordBreakAtLineEnding:Lcom/itextpdf/io/font/otf/GlyphLine;

    if-eqz v1, :cond_6

    goto :goto_1

    :cond_6
    move/from16 v13, v18

    goto/16 :goto_10

    .line 859
    :cond_7
    :goto_1
    const/16 v1, 0x18

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPropertyAsUnitValue(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v20

    .line 860
    .local v20, "fontSize":Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual/range {v20 .. v20}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v3

    if-nez v3, :cond_8

    .line 861
    invoke-static {v2}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v2

    .line 862
    .local v2, "logger":Lorg/slf4j/Logger;
    nop

    .line 863
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    .line 862
    const-string v3, "Property {0} in percents is not supported"

    invoke-static {v3, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v2, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 865
    .end local v2    # "logger":Lorg/slf4j/Logger;
    :cond_8
    const/16 v1, 0x15

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPropertyAsTransparentColor(I)Lcom/itextpdf/layout/properties/TransparentColor;

    move-result-object v3

    .line 866
    .local v3, "fontColor":Lcom/itextpdf/layout/properties/TransparentColor;
    const/16 v1, 0x47

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 867
    .local v1, "textRenderingMode":Ljava/lang/Integer;
    const/16 v2, 0x48

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v21

    .line 868
    .local v21, "textRise":Ljava/lang/Float;
    const/16 v2, 0xf

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v22

    .line 869
    .local v22, "characterSpacing":Ljava/lang/Float;
    const/16 v2, 0x4e

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v23

    .line 870
    .local v23, "wordSpacing":Ljava/lang/Float;
    const/16 v2, 0x1d

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v24, v2

    check-cast v24, Ljava/lang/Float;

    .line 871
    .local v24, "horizontalScaling":Ljava/lang/Float;
    const/16 v2, 0x41

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [F

    .line 872
    .local v2, "skew":[F
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v5, 0x1f

    invoke-virtual {v0, v5}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v25

    .line 873
    .local v25, "italicSimulation":Z
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v5, 0x8

    invoke-virtual {v0, v5}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v26

    .line 874
    .local v26, "boldSimulation":Z
    const/4 v4, 0x0

    .line 876
    .local v4, "strokeWidth":Ljava/lang/Float;
    const/4 v5, 0x2

    if-eqz v26, :cond_9

    .line 877
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 878
    invoke-virtual/range {v20 .. v20}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v6

    const/high16 v13, 0x41f00000    # 30.0f

    div-float/2addr v6, v13

    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    move-object/from16 v27, v1

    goto :goto_2

    .line 876
    :cond_9
    move-object/from16 v27, v1

    .line 881
    .end local v1    # "textRenderingMode":Ljava/lang/Integer;
    .local v27, "textRenderingMode":Ljava/lang/Integer;
    :goto_2
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/renderer/DrawContext;->getCanvas()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v13

    .line 882
    .local v13, "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    if-eqz v7, :cond_b

    .line 883
    if-eqz v10, :cond_a

    .line 884
    new-instance v1, Lcom/itextpdf/kernel/pdf/canvas/CanvasArtifact;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasArtifact;-><init>()V

    invoke-virtual {v13, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->openTag(Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    goto :goto_3

    .line 886
    :cond_a
    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getTagReference()Lcom/itextpdf/kernel/pdf/tagutils/TagReference;

    move-result-object v1

    invoke-virtual {v13, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->openTag(Lcom/itextpdf/kernel/pdf/tagutils/TagReference;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 889
    :cond_b
    :goto_3
    invoke-virtual/range {p0 .. p1}, Lcom/itextpdf/layout/renderer/TextRenderer;->beginElementOpacityApplying(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 890
    invoke-virtual {v13}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->beginText()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    iget-object v6, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->font:Lcom/itextpdf/kernel/font/PdfFont;

    invoke-virtual/range {v20 .. v20}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v14

    invoke-virtual {v1, v6, v14}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setFontAndSize(Lcom/itextpdf/kernel/font/PdfFont;F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 892
    const/4 v1, 0x1

    if-eqz v2, :cond_c

    array-length v6, v2

    if-ne v6, v5, :cond_c

    .line 893
    aget v15, v2, v8

    aget v16, v2, v1

    const/high16 v17, 0x3f800000    # 1.0f

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->getYLine()F

    move-result v19

    const/high16 v14, 0x3f800000    # 1.0f

    invoke-virtual/range {v13 .. v19}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setTextMatrix(FFFFFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move/from16 v31, v18

    move-object/from16 v18, v4

    move-object v4, v13

    move/from16 v13, v31

    goto :goto_4

    .line 894
    :cond_c
    if-eqz v25, :cond_d

    .line 895
    const/high16 v17, 0x3f800000    # 1.0f

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->getYLine()F

    move-result v19

    const/high16 v14, 0x3f800000    # 1.0f

    const/4 v15, 0x0

    const v16, 0x3e59a954    # 0.21256f

    invoke-virtual/range {v13 .. v19}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setTextMatrix(FFFFFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-object v6, v4

    move-object v4, v13

    move/from16 v13, v18

    move-object/from16 v18, v6

    .end local v18    # "leftBBoxX":F
    .local v4, "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .local v6, "strokeWidth":Ljava/lang/Float;
    .local v13, "leftBBoxX":F
    goto :goto_4

    .line 897
    .end local v6    # "strokeWidth":Ljava/lang/Float;
    .local v4, "strokeWidth":Ljava/lang/Float;
    .local v13, "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .restart local v18    # "leftBBoxX":F
    :cond_d
    move-object v6, v4

    move-object v4, v13

    move/from16 v13, v18

    .end local v18    # "leftBBoxX":F
    .local v4, "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .restart local v6    # "strokeWidth":Ljava/lang/Float;
    .local v13, "leftBBoxX":F
    float-to-double v14, v13

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->getYLine()F

    move-result v8

    move-object/from16 v18, v6

    .end local v6    # "strokeWidth":Ljava/lang/Float;
    .local v18, "strokeWidth":Ljava/lang/Float;
    float-to-double v5, v8

    invoke-virtual {v4, v14, v15, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveText(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 900
    :goto_4
    invoke-virtual/range {v27 .. v27}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-eqz v5, :cond_e

    .line 901
    invoke-virtual/range {v27 .. v27}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setTextRenderingMode(I)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 903
    :cond_e
    invoke-virtual/range {v27 .. v27}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/high16 v6, 0x3f800000    # 1.0f

    if-eq v5, v1, :cond_f

    invoke-virtual/range {v27 .. v27}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/4 v8, 0x2

    if-ne v5, v8, :cond_13

    .line 904
    :cond_f
    if-nez v18, :cond_10

    .line 905
    const/16 v5, 0x40

    invoke-virtual {v0, v5}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v5

    move-object/from16 v18, v5

    .line 907
    :cond_10
    if-eqz v18, :cond_11

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Float;->floatValue()F

    move-result v5

    cmpl-float v5, v5, v6

    if-eqz v5, :cond_11

    .line 908
    invoke-virtual/range {v18 .. v18}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineWidth(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 910
    :cond_11
    const/16 v5, 0x3f

    invoke-virtual {v0, v5}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPropertyAsColor(I)Lcom/itextpdf/kernel/colors/Color;

    move-result-object v5

    .line 911
    .local v5, "strokeColor":Lcom/itextpdf/kernel/colors/Color;
    if-nez v5, :cond_12

    if-eqz v3, :cond_12

    .line 912
    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/TransparentColor;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v5

    .line 914
    :cond_12
    if-eqz v5, :cond_13

    .line 915
    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setStrokeColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 918
    .end local v5    # "strokeColor":Lcom/itextpdf/kernel/colors/Color;
    :cond_13
    if-eqz v3, :cond_14

    .line 919
    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/TransparentColor;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setFillColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 920
    invoke-virtual {v3, v4}, Lcom/itextpdf/layout/properties/TransparentColor;->applyFillTransparency(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 922
    :cond_14
    const/4 v8, 0x0

    if-eqz v21, :cond_15

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Float;->floatValue()F

    move-result v5

    cmpl-float v5, v5, v8

    if-eqz v5, :cond_15

    .line 923
    invoke-virtual/range {v21 .. v21}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setTextRise(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 925
    :cond_15
    if-eqz v22, :cond_16

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Float;->floatValue()F

    move-result v5

    cmpl-float v5, v5, v8

    if-eqz v5, :cond_16

    .line 926
    invoke-virtual/range {v22 .. v22}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setCharacterSpacing(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 928
    :cond_16
    if-eqz v23, :cond_1a

    invoke-virtual/range {v23 .. v23}, Ljava/lang/Float;->floatValue()F

    move-result v5

    cmpl-float v5, v5, v8

    if-eqz v5, :cond_1a

    .line 929
    iget-object v5, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->font:Lcom/itextpdf/kernel/font/PdfFont;

    instance-of v5, v5, Lcom/itextpdf/kernel/font/PdfType0Font;

    if-eqz v5, :cond_19

    .line 935
    iget-object v5, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v5, v5, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .local v5, "gInd":I
    :goto_5
    iget-object v14, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v14, v14, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-ge v5, v14, :cond_18

    .line 936
    iget-object v14, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-virtual {v14, v5}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v14

    invoke-static {v14}, Lcom/itextpdf/io/util/TextUtil;->isUni0020(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v14

    if-eqz v14, :cond_17

    .line 937
    invoke-virtual/range {v23 .. v23}, Ljava/lang/Float;->floatValue()F

    move-result v14

    invoke-static {v14}, Lcom/itextpdf/io/font/FontProgram;->convertGlyphSpaceToTextSpace(F)F

    move-result v14

    .line 938
    invoke-virtual/range {v20 .. v20}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v15

    div-float/2addr v14, v15

    float-to-int v14, v14

    int-to-short v14, v14

    .line 939
    .local v14, "advance":S
    new-instance v15, Lcom/itextpdf/io/font/otf/Glyph;

    move/from16 v17, v6

    iget-object v6, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-virtual {v6, v5}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v6

    invoke-direct {v15, v6}, Lcom/itextpdf/io/font/otf/Glyph;-><init>(Lcom/itextpdf/io/font/otf/Glyph;)V

    .line 940
    .local v15, "copy":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-virtual {v15, v14}, Lcom/itextpdf/io/font/otf/Glyph;->setXAdvance(S)V

    .line 941
    iget-object v6, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-virtual {v6, v5, v15}, Lcom/itextpdf/io/font/otf/GlyphLine;->set(ILcom/itextpdf/io/font/otf/Glyph;)Lcom/itextpdf/io/font/otf/Glyph;

    goto :goto_6

    .line 936
    .end local v14    # "advance":S
    .end local v15    # "copy":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_17
    move/from16 v17, v6

    .line 935
    :goto_6
    add-int/lit8 v5, v5, 0x1

    move/from16 v6, v17

    goto :goto_5

    :cond_18
    move/from16 v17, v6

    .end local v5    # "gInd":I
    goto :goto_7

    .line 945
    :cond_19
    move/from16 v17, v6

    invoke-virtual/range {v23 .. v23}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setWordSpacing(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    goto :goto_7

    .line 928
    :cond_1a
    move/from16 v17, v6

    .line 948
    :goto_7
    if-eqz v24, :cond_1b

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Float;->floatValue()F

    move-result v5

    cmpl-float v5, v5, v17

    if-eqz v5, :cond_1b

    .line 949
    invoke-virtual/range {v24 .. v24}, Ljava/lang/Float;->floatValue()F

    move-result v5

    const/high16 v6, 0x42c80000    # 100.0f

    mul-float/2addr v5, v6

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setHorizontalScaling(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 952
    :cond_1b
    new-instance v5, Lcom/itextpdf/layout/renderer/TextRenderer$CustomGlyphLineFilter;

    const/4 v6, 0x0

    invoke-direct {v5, v6}, Lcom/itextpdf/layout/renderer/TextRenderer$CustomGlyphLineFilter;-><init>(Lcom/itextpdf/layout/renderer/TextRenderer$1;)V

    move-object v14, v5

    .line 954
    .local v14, "filter":Lcom/itextpdf/io/font/otf/GlyphLine$IGlyphLineFilter;
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v15, 0x52

    invoke-virtual {v0, v15}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v15

    invoke-virtual {v5, v15}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v15

    .line 956
    .local v15, "appearanceStreamLayout":Z
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->getReversedRanges()Ljava/util/List;

    move-result-object v5

    if-eqz v5, :cond_20

    .line 957
    xor-int/lit8 v5, v15, 0x1

    .line 958
    .local v5, "writeReversedChars":Z
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 959
    .local v6, "removedIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    iget-object v8, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v8, v8, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .local v8, "i":I
    :goto_8
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v1, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-ge v8, v1, :cond_1d

    .line 960
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-virtual {v1, v8}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v1

    invoke-interface {v14, v1}, Lcom/itextpdf/io/font/otf/GlyphLine$IGlyphLineFilter;->accept(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v1

    if-nez v1, :cond_1c

    .line 961
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 959
    :cond_1c
    add-int/lit8 v8, v8, 0x1

    const/4 v1, 0x1

    goto :goto_8

    .line 964
    .end local v8    # "i":I
    :cond_1d
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->getReversedRanges()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [I

    .line 965
    .local v8, "range":[I
    invoke-static {v6, v8}, Lcom/itextpdf/layout/renderer/TextRenderer;->updateRangeBasedOnRemovedCharacters(Ljava/util/ArrayList;[I)V

    .line 966
    .end local v8    # "range":[I
    goto :goto_9

    .line 967
    :cond_1e
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-virtual {v1, v14}, Lcom/itextpdf/io/font/otf/GlyphLine;->filter(Lcom/itextpdf/io/font/otf/GlyphLine$IGlyphLineFilter;)Lcom/itextpdf/io/font/otf/GlyphLine;

    move-result-object v1

    iput-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 968
    nop

    .line 972
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 968
    if-eqz v5, :cond_1f

    .line 969
    new-instance v8, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;

    move-object/from16 v28, v2

    .end local v2    # "skew":[F
    .local v28, "skew":[F
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->reversedRanges:Ljava/util/List;

    move-object/from16 v29, v3

    .end local v3    # "fontColor":Lcom/itextpdf/layout/properties/TransparentColor;
    .local v29, "fontColor":Lcom/itextpdf/layout/properties/TransparentColor;
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-direct {v8, v2, v3}, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;-><init>(Ljava/util/List;Lcom/itextpdf/io/font/otf/GlyphLine;)V

    .line 970
    const/4 v2, 0x1

    invoke-virtual {v8, v2}, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->setUseReversed(Z)Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;

    move-result-object v2

    .line 969
    invoke-virtual {v4, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->showText(Lcom/itextpdf/io/font/otf/GlyphLine;Ljava/util/Iterator;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    goto :goto_a

    .line 972
    .end local v28    # "skew":[F
    .end local v29    # "fontColor":Lcom/itextpdf/layout/properties/TransparentColor;
    .restart local v2    # "skew":[F
    .restart local v3    # "fontColor":Lcom/itextpdf/layout/properties/TransparentColor;
    :cond_1f
    move-object/from16 v28, v2

    move-object/from16 v29, v3

    .end local v2    # "skew":[F
    .end local v3    # "fontColor":Lcom/itextpdf/layout/properties/TransparentColor;
    .restart local v28    # "skew":[F
    .restart local v29    # "fontColor":Lcom/itextpdf/layout/properties/TransparentColor;
    invoke-virtual {v4, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->showText(Lcom/itextpdf/io/font/otf/GlyphLine;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 974
    .end local v5    # "writeReversedChars":Z
    .end local v6    # "removedIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :goto_a
    goto :goto_b

    .line 975
    .end local v28    # "skew":[F
    .end local v29    # "fontColor":Lcom/itextpdf/layout/properties/TransparentColor;
    .restart local v2    # "skew":[F
    .restart local v3    # "fontColor":Lcom/itextpdf/layout/properties/TransparentColor;
    :cond_20
    move-object/from16 v28, v2

    move-object/from16 v29, v3

    .end local v2    # "skew":[F
    .end local v3    # "fontColor":Lcom/itextpdf/layout/properties/TransparentColor;
    .restart local v28    # "skew":[F
    .restart local v29    # "fontColor":Lcom/itextpdf/layout/properties/TransparentColor;
    if-eqz v15, :cond_21

    .line 976
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v2, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v3, v3, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    invoke-virtual {v1, v2, v3, v6}, Lcom/itextpdf/io/font/otf/GlyphLine;->setActualText(IILjava/lang/String;)V

    .line 978
    :cond_21
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-virtual {v1, v14}, Lcom/itextpdf/io/font/otf/GlyphLine;->filter(Lcom/itextpdf/io/font/otf/GlyphLine$IGlyphLineFilter;)Lcom/itextpdf/io/font/otf/GlyphLine;

    move-result-object v1

    invoke-virtual {v4, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->showText(Lcom/itextpdf/io/font/otf/GlyphLine;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 980
    :goto_b
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->savedWordBreakAtLineEnding:Lcom/itextpdf/io/font/otf/GlyphLine;

    if-eqz v1, :cond_22

    .line 981
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->savedWordBreakAtLineEnding:Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-virtual {v4, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->showText(Lcom/itextpdf/io/font/otf/GlyphLine;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 984
    :cond_22
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->endText()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 985
    invoke-virtual/range {p0 .. p1}, Lcom/itextpdf/layout/renderer/TextRenderer;->endElementOpacityApplying(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 987
    if-eqz v7, :cond_23

    .line 988
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->closeTag()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 991
    :cond_23
    const/16 v1, 0x4a

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v8

    .line 992
    .local v8, "underlines":Ljava/lang/Object;
    instance-of v1, v8, Ljava/util/List;

    const v19, 0x3e59a954    # 0.21256f

    if-eqz v1, :cond_27

    .line 993
    move-object v1, v8

    check-cast v1, Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v30

    :goto_c
    invoke-interface/range {v30 .. v30}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_26

    invoke-interface/range {v30 .. v30}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 994
    .local v1, "underline":Ljava/lang/Object;
    instance-of v2, v1, Lcom/itextpdf/layout/properties/Underline;

    if-eqz v2, :cond_25

    .line 995
    move-object v2, v1

    .end local v1    # "underline":Ljava/lang/Object;
    .local v2, "underline":Ljava/lang/Object;
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/renderer/DrawContext;->isTaggingEnabled()Z

    move-result v1

    move-object v3, v2

    .end local v2    # "underline":Ljava/lang/Object;
    .local v3, "underline":Ljava/lang/Object;
    move-object v2, v3

    check-cast v2, Lcom/itextpdf/layout/properties/Underline;

    invoke-virtual/range {v20 .. v20}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v5

    if-eqz v25, :cond_24

    move/from16 v6, v19

    goto :goto_d

    :cond_24
    const/4 v6, 0x0

    :goto_d
    move-object/from16 v31, v29

    move-object/from16 v29, v3

    move-object/from16 v3, v31

    .local v3, "fontColor":Lcom/itextpdf/layout/properties/TransparentColor;
    .local v29, "underline":Ljava/lang/Object;
    invoke-direct/range {v0 .. v6}, Lcom/itextpdf/layout/renderer/TextRenderer;->drawAndTagSingleUnderline(ZLcom/itextpdf/layout/properties/Underline;Lcom/itextpdf/layout/properties/TransparentColor;Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FF)V

    goto :goto_e

    .line 994
    .end local v3    # "fontColor":Lcom/itextpdf/layout/properties/TransparentColor;
    .restart local v1    # "underline":Ljava/lang/Object;
    .local v29, "fontColor":Lcom/itextpdf/layout/properties/TransparentColor;
    :cond_25
    move-object/from16 v3, v29

    move-object/from16 v29, v1

    .line 997
    .end local v1    # "underline":Ljava/lang/Object;
    .end local v29    # "fontColor":Lcom/itextpdf/layout/properties/TransparentColor;
    .restart local v3    # "fontColor":Lcom/itextpdf/layout/properties/TransparentColor;
    :goto_e
    move-object/from16 v0, p0

    move-object/from16 v29, v3

    goto :goto_c

    .end local v3    # "fontColor":Lcom/itextpdf/layout/properties/TransparentColor;
    .restart local v29    # "fontColor":Lcom/itextpdf/layout/properties/TransparentColor;
    :cond_26
    move-object/from16 v3, v29

    .end local v29    # "fontColor":Lcom/itextpdf/layout/properties/TransparentColor;
    .restart local v3    # "fontColor":Lcom/itextpdf/layout/properties/TransparentColor;
    move-object/from16 v0, p0

    goto :goto_10

    .line 998
    .end local v3    # "fontColor":Lcom/itextpdf/layout/properties/TransparentColor;
    .restart local v29    # "fontColor":Lcom/itextpdf/layout/properties/TransparentColor;
    :cond_27
    move-object/from16 v3, v29

    .end local v29    # "fontColor":Lcom/itextpdf/layout/properties/TransparentColor;
    .restart local v3    # "fontColor":Lcom/itextpdf/layout/properties/TransparentColor;
    instance-of v0, v8, Lcom/itextpdf/layout/properties/Underline;

    if-eqz v0, :cond_29

    .line 999
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/renderer/DrawContext;->isTaggingEnabled()Z

    move-result v1

    move-object v2, v8

    check-cast v2, Lcom/itextpdf/layout/properties/Underline;

    invoke-virtual/range {v20 .. v20}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v5

    if-eqz v25, :cond_28

    move/from16 v6, v19

    goto :goto_f

    :cond_28
    const/4 v6, 0x0

    :goto_f
    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/itextpdf/layout/renderer/TextRenderer;->drawAndTagSingleUnderline(ZLcom/itextpdf/layout/properties/Underline;Lcom/itextpdf/layout/properties/TransparentColor;Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FF)V

    goto :goto_10

    .line 998
    :cond_29
    move-object/from16 v0, p0

    .line 1003
    .end local v3    # "fontColor":Lcom/itextpdf/layout/properties/TransparentColor;
    .end local v4    # "canvas":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .end local v8    # "underlines":Ljava/lang/Object;
    .end local v14    # "filter":Lcom/itextpdf/io/font/otf/GlyphLine$IGlyphLineFilter;
    .end local v15    # "appearanceStreamLayout":Z
    .end local v18    # "strokeWidth":Ljava/lang/Float;
    .end local v20    # "fontSize":Lcom/itextpdf/layout/properties/UnitValue;
    .end local v21    # "textRise":Ljava/lang/Float;
    .end local v22    # "characterSpacing":Ljava/lang/Float;
    .end local v23    # "wordSpacing":Ljava/lang/Float;
    .end local v24    # "horizontalScaling":Ljava/lang/Float;
    .end local v25    # "italicSimulation":Z
    .end local v26    # "boldSimulation":Z
    .end local v27    # "textRenderingMode":Ljava/lang/Integer;
    .end local v28    # "skew":[F
    :goto_10
    if-eqz v12, :cond_2a

    .line 1004
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->applyRelativePositioningTranslation(Z)V

    .line 1007
    :cond_2a
    if-eqz v7, :cond_2c

    if-nez v10, :cond_2c

    .line 1008
    iget-boolean v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->isLastRendererForModelElement:Z

    if-eqz v1, :cond_2b

    .line 1009
    invoke-virtual {v9, v0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->finishTaggingHint(Lcom/itextpdf/layout/IPropertyContainer;)V

    .line 1011
    :cond_2b
    invoke-virtual {v9, v0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->restoreAutoTaggingPointerPosition(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 1013
    :cond_2c
    return-void
.end method

.method protected drawSingleUnderline(Lcom/itextpdf/layout/properties/Underline;Lcom/itextpdf/layout/properties/TransparentColor;Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;FF)V
    .locals 13
    .param p1, "underline"    # Lcom/itextpdf/layout/properties/Underline;
    .param p2, "fontStrokeColor"    # Lcom/itextpdf/layout/properties/TransparentColor;
    .param p3, "canvas"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .param p4, "fontSize"    # F
    .param p5, "italicAngleTan"    # F

    .line 1478
    move-object/from16 v0, p3

    move/from16 v1, p4

    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/Underline;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v2

    if-eqz v2, :cond_0

    new-instance v2, Lcom/itextpdf/layout/properties/TransparentColor;

    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/Underline;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v3

    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/Underline;->getOpacity()F

    move-result v4

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/layout/properties/TransparentColor;-><init>(Lcom/itextpdf/kernel/colors/Color;F)V

    goto :goto_0

    :cond_0
    move-object v2, p2

    .line 1479
    .local v2, "underlineColor":Lcom/itextpdf/layout/properties/TransparentColor;
    :goto_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1481
    if-eqz v2, :cond_1

    .line 1482
    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/TransparentColor;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setStrokeColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1483
    invoke-virtual {v2, v0}, Lcom/itextpdf/layout/properties/TransparentColor;->applyStrokeTransparency(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V

    .line 1485
    :cond_1
    invoke-virtual {p1}, Lcom/itextpdf/layout/properties/Underline;->getLineCapStyle()I

    move-result v3

    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineCapStyle(I)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1486
    invoke-virtual {p1, v1}, Lcom/itextpdf/layout/properties/Underline;->getThickness(F)F

    move-result v3

    .line 1487
    .local v3, "underlineThickness":F
    const/4 v4, 0x0

    cmpl-float v4, v3, v4

    if-eqz v4, :cond_2

    .line 1488
    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineWidth(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1489
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TextRenderer;->getYLine()F

    move-result v4

    .line 1490
    .local v4, "yLine":F
    invoke-virtual {p1, v1}, Lcom/itextpdf/layout/properties/Underline;->getYPosition(F)F

    move-result v5

    add-float/2addr v5, v4

    .line 1491
    .local v5, "underlineYPosition":F
    const/high16 v6, 0x3f000000    # 0.5f

    mul-float/2addr v6, v1

    mul-float v6, v6, p5

    .line 1492
    .local v6, "italicWidthSubstraction":F
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TextRenderer;->getInnerAreaBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v7

    .line 1493
    .local v7, "innerAreaBbox":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v8

    float-to-double v8, v8

    float-to-double v10, v5

    invoke-virtual {v0, v8, v9, v10, v11}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->moveTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v8

    .line 1494
    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v9

    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v10

    add-float/2addr v9, v10

    sub-float/2addr v9, v6

    float-to-double v9, v9

    float-to-double v11, v5

    invoke-virtual {v8, v9, v10, v11, v12}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->lineTo(DD)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v8

    .line 1495
    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->stroke()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1498
    .end local v4    # "yLine":F
    .end local v5    # "underlineYPosition":F
    .end local v6    # "italicWidthSubstraction":F
    .end local v7    # "innerAreaBbox":Lcom/itextpdf/kernel/geom/Rectangle;
    :cond_2
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 1499
    return-void
.end method

.method public getAscent()F
    .locals 1

    .line 1094
    iget v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->yLineOffset:F

    return v0
.end method

.method protected getBackgroundArea(Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 2
    .param p1, "occupiedAreaWithMargins"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1354
    const/16 v0, 0x48

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 1355
    .local v0, "textRise":F
    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->moveUp(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/geom/Rectangle;->decreaseHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    return-object v1
.end method

.method public getDescent()F
    .locals 2

    .line 1104
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TextRenderer;->getOccupiedAreaBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v0

    iget v1, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->yLineOffset:F

    sub-float/2addr v0, v1

    const/16 v1, 0x48

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    sub-float/2addr v0, v1

    neg-float v0, v0

    return v0
.end method

.method protected getFirstYLineRecursively()Ljava/lang/Float;
    .locals 1

    .line 1360
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TextRenderer;->getYLine()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method protected getLastYLineRecursively()Ljava/lang/Float;
    .locals 1

    .line 1365
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TextRenderer;->getYLine()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method public getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .locals 5

    .line 1390
    new-instance v0, Lcom/itextpdf/layout/layout/LayoutContext;

    new-instance v1, Lcom/itextpdf/layout/layout/LayoutArea;

    new-instance v2, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-static {}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidthUtils;->getInfWidth()F

    move-result v3

    const v4, 0x49742400    # 1000000.0f

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FF)V

    const/4 v3, 0x1

    invoke-direct {v1, v3, v2}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/layout/TextLayoutResult;

    .line 1391
    .local v0, "result":Lcom/itextpdf/layout/layout/TextLayoutResult;
    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/TextLayoutResult;->getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v1

    return-object v1
.end method

.method public getNextRenderer()Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 2

    .line 1200
    const-class v0, Lcom/itextpdf/layout/renderer/TextRenderer;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->logWarningIfGetNextRendererNotOverridden(Ljava/lang/Class;Ljava/lang/Class;)Z

    .line 1201
    new-instance v0, Lcom/itextpdf/layout/renderer/TextRenderer;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->modelElement:Lcom/itextpdf/layout/IPropertyContainer;

    check-cast v1, Lcom/itextpdf/layout/element/Text;

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;-><init>(Lcom/itextpdf/layout/element/Text;)V

    return-object v0
.end method

.method protected getNumberOfSpaces()I
    .locals 5

    .line 1395
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v0, v0, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-gtz v0, :cond_0

    .line 1396
    const/4 v0, 0x0

    return v0

    .line 1397
    :cond_0
    const/4 v0, 0x0

    .line 1398
    .local v0, "spaces":I
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v1, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v2, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-ge v1, v2, :cond_2

    .line 1399
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-virtual {v2, v1}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v2

    .line 1400
    .local v2, "currentGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-virtual {v2}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v3

    const/16 v4, 0x20

    if-ne v3, v4, :cond_1

    .line 1401
    add-int/lit8 v0, v0, 0x1

    .line 1398
    .end local v2    # "currentGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1404
    .end local v1    # "i":I
    :cond_2
    return v0
.end method

.method getReversedRanges()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "[I>;"
        }
    .end annotation

    .line 1244
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->reversedRanges:Ljava/util/List;

    return-object v0
.end method

.method getSpecialScriptFirstNotFittingIndex()I
    .locals 1

    .line 1345
    iget v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->specialScriptFirstNotFittingIndex:I

    return v0
.end method

.method getSpecialScriptsWordBreakPoints()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1337
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->specialScriptsWordBreakPoints:Ljava/util/List;

    return-object v0
.end method

.method public getTabAnchorCharacterPosition()F
    .locals 1

    .line 1182
    iget v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->tabAnchorCharacterPosition:F

    return v0
.end method

.method public getText()Lcom/itextpdf/io/font/otf/GlyphLine;
    .locals 1

    .line 1153
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TextRenderer;->updateFontAndText()V

    .line 1154
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    return-object v0
.end method

.method public getYLine()F
    .locals 2

    .line 1114
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v0

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    add-float/2addr v0, v1

    iget v1, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->yLineOffset:F

    sub-float/2addr v0, v1

    const/16 v1, 0x48

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    sub-float/2addr v0, v1

    return v0
.end method

.method initReversedRanges()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "[I>;"
        }
    .end annotation

    .line 1248
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->reversedRanges:Ljava/util/List;

    if-nez v0, :cond_0

    .line 1249
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->reversedRanges:Ljava/util/List;

    .line 1251
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->reversedRanges:Ljava/util/List;

    return-object v0
.end method

.method isStartsWithSplitCharWhiteSpaceAndEndsWithSplitChar(Lcom/itextpdf/layout/splitting/ISplitCharacters;)[Z
    .locals 7
    .param p1, "splitCharacters"    # Lcom/itextpdf/layout/splitting/ISplitCharacters;

    .line 1646
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v0, v0, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v1, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ge v0, v1, :cond_0

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v1, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .line 1647
    invoke-interface {p1, v0, v1}, Lcom/itextpdf/layout/splitting/ISplitCharacters;->isSplitCharacter(Lcom/itextpdf/io/font/otf/GlyphLine;I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v1, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .line 1648
    invoke-virtual {v0, v1}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/io/util/TextUtil;->isSpaceOrWhitespace(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v3

    goto :goto_0

    :cond_0
    move v0, v2

    .line 1649
    .local v0, "startsWithBreak":Z
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v1, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    iget-object v4, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v4, v4, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-ge v1, v4, :cond_1

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget-object v4, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v4, v4, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    sub-int/2addr v4, v3

    .line 1650
    invoke-interface {p1, v1, v4}, Lcom/itextpdf/layout/splitting/ISplitCharacters;->isSplitCharacter(Lcom/itextpdf/io/font/otf/GlyphLine;I)Z

    move-result v1

    if-eqz v1, :cond_1

    move v1, v3

    goto :goto_1

    :cond_1
    move v1, v2

    .line 1651
    .local v1, "endsWithBreak":Z
    :goto_1
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->specialScriptsWordBreakPoints:Ljava/util/List;

    const/4 v5, 0x2

    if-eqz v4, :cond_4

    iget-object v4, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->specialScriptsWordBreakPoints:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_2

    goto :goto_2

    .line 1654
    :cond_2
    if-nez v1, :cond_3

    .line 1655
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->specialScriptsWordBreakPoints:Ljava/util/List;

    iget-object v6, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v6, v6, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v4, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    .line 1657
    :cond_3
    new-array v4, v5, [Z

    aput-boolean v0, v4, v2

    aput-boolean v1, v4, v3

    return-object v4

    .line 1652
    :cond_4
    :goto_2
    new-array v4, v5, [Z

    aput-boolean v0, v4, v2

    aput-boolean v1, v4, v3

    return-object v4
.end method

.method public layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;
    .locals 88
    .param p1, "layoutContext"    # Lcom/itextpdf/layout/layout/LayoutContext;

    .line 158
    move-object/from16 v0, p0

    invoke-direct {v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->updateFontAndText()V

    .line 160
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v6

    .line 161
    .local v6, "area":Lcom/itextpdf/layout/layout/LayoutArea;
    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    .line 163
    .local v1, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    const/16 v4, 0x76

    invoke-interface {v3, v4}, Lcom/itextpdf/layout/renderer/IRenderer;->getOwnProperty(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v7

    .line 165
    .local v7, "noSoftWrap":Z
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    const/16 v8, 0x67

    invoke-interface {v2, v8}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    .line 167
    .local v2, "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    const/16 v3, 0x66

    invoke-virtual {v0, v3}, Lcom/itextpdf/layout/renderer/TextRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v3

    move-object v9, v3

    check-cast v9, Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;

    .line 168
    .local v9, "overflowWrap":Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;
    sget-object v3, Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;->ANYWHERE:Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;

    const/4 v10, 0x0

    if-eq v9, v3, :cond_1

    sget-object v3, Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;->BREAK_WORD:Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;

    if-ne v9, v3, :cond_0

    goto :goto_0

    :cond_0
    move v3, v10

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v3, 0x1

    :goto_1
    move v12, v3

    .line 170
    .local v12, "overflowWrapNotNormal":Z
    if-eqz v12, :cond_2

    .line 171
    sget-object v2, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->FIT:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    move-object v5, v2

    goto :goto_2

    .line 170
    :cond_2
    move-object v5, v2

    .line 174
    .end local v2    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v5, "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    :goto_2
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->getFloatRendererAreas()Ljava/util/List;

    move-result-object v3

    .line 175
    .local v3, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    const/16 v2, 0x63

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    move-object v4, v2

    check-cast v4, Lcom/itextpdf/layout/properties/FloatPropertyValue;

    .line 177
    .local v4, "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    invoke-static {v0, v4}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/properties/FloatPropertyValue;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 178
    const/4 v2, 0x0

    invoke-static/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/FloatingHelper;->adjustFloatedBlockLayoutBox(Lcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/kernel/geom/Rectangle;Ljava/lang/Float;Ljava/util/List;Lcom/itextpdf/layout/properties/FloatPropertyValue;Lcom/itextpdf/layout/properties/OverflowPropertyValue;)Ljava/lang/Float;

    move-object v13, v1

    move-object v14, v3

    move-object v15, v4

    move-object/from16 v16, v5

    .end local v1    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v3    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .end local v4    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .end local v5    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .local v13, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v14, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v15, "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .local v16, "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    goto :goto_3

    .line 177
    .end local v13    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v14    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .end local v15    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .end local v16    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .restart local v1    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local v3    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .restart local v4    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .restart local v5    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    :cond_3
    move-object v13, v1

    move-object v14, v3

    move-object v15, v4

    move-object/from16 v16, v5

    .line 181
    .end local v1    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v3    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .end local v4    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .end local v5    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .restart local v13    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local v14    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .restart local v15    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .restart local v16    # "overflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    :goto_3
    invoke-virtual {v13}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v17

    .line 182
    .local v17, "preMarginBorderPaddingWidth":F
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->getMargins()[Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v1

    .line 183
    .local v1, "margins":[Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {v0, v13, v1, v10}, Lcom/itextpdf/layout/renderer/TextRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/properties/UnitValue;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 184
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->getBorders()[Lcom/itextpdf/layout/borders/Border;

    move-result-object v2

    .line 185
    .local v2, "borders":[Lcom/itextpdf/layout/borders/Border;
    invoke-virtual {v0, v13, v2, v10}, Lcom/itextpdf/layout/renderer/TextRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/borders/Border;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 187
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPaddings()[Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v3

    .line 188
    .local v3, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {v0, v13, v3, v10}, Lcom/itextpdf/layout/renderer/TextRenderer;->applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/properties/UnitValue;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 190
    new-instance v4, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    invoke-virtual {v13}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v5

    sub-float v5, v17, v5

    invoke-direct {v4, v5}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;-><init>(F)V

    .line 192
    .local v4, "countedMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    if-eqz v7, :cond_4

    .line 193
    new-instance v5, Lcom/itextpdf/layout/renderer/SumSumWidthHandler;

    invoke-direct {v5, v4}, Lcom/itextpdf/layout/renderer/SumSumWidthHandler;-><init>(Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;)V

    .local v5, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    goto :goto_4

    .line 195
    .end local v5    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    :cond_4
    new-instance v5, Lcom/itextpdf/layout/renderer/MaxSumWidthHandler;

    invoke-direct {v5, v4}, Lcom/itextpdf/layout/renderer/MaxSumWidthHandler;-><init>(Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;)V

    .line 198
    .restart local v5    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    :goto_4
    const/high16 v18, -0x40800000    # -1.0f

    .line 199
    .local v18, "leftMinWidth":F
    move/from16 v19, v10

    const/4 v10, 0x3

    aget-object v20, v1, v10

    invoke-virtual/range {v20 .. v20}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v20

    aget-object v21, v2, v10

    const/16 v22, 0x1

    if-nez v21, :cond_5

    const/16 v21, 0x0

    goto :goto_5

    :cond_5
    aget-object v21, v2, v10

    .line 200
    invoke-virtual/range {v21 .. v21}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v21

    :goto_5
    aget-object v23, v3, v10

    .line 201
    invoke-virtual/range {v23 .. v23}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v23

    new-array v8, v10, [F

    aput v20, v8, v19

    aput v21, v8, v22

    const/4 v11, 0x2

    aput v23, v8, v11

    .line 202
    .local v8, "leftMarginBorderPadding":[F
    const/high16 v21, -0x40800000    # -1.0f

    .line 203
    .local v21, "rightMinWidth":F
    aget-object v23, v1, v22

    invoke-virtual/range {v23 .. v23}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v23

    aget-object v25, v2, v22

    if-nez v25, :cond_6

    const/16 v25, 0x0

    goto :goto_6

    :cond_6
    aget-object v25, v2, v22

    .line 204
    invoke-virtual/range {v25 .. v25}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v25

    :goto_6
    aget-object v26, v3, v22

    .line 205
    invoke-virtual/range {v26 .. v26}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v26

    new-array v10, v10, [F

    aput v23, v10, v19

    aput v25, v10, v22

    aput v26, v10, v11

    .line 207
    .local v10, "rightMarginBorderPadding":[F
    new-instance v11, Lcom/itextpdf/layout/layout/LayoutArea;

    move-object/from16 v25, v1

    .end local v1    # "margins":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v25, "margins":[Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v1

    move-object/from16 v26, v2

    .end local v2    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .local v26, "borders":[Lcom/itextpdf/layout/borders/Border;
    new-instance v2, Lcom/itextpdf/kernel/geom/Rectangle;

    move-object/from16 v27, v3

    .end local v3    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v27, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {v13}, Lcom/itextpdf/kernel/geom/Rectangle;->getX()F

    move-result v3

    invoke-virtual {v13}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v28

    invoke-virtual {v13}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v29

    move-object/from16 v30, v4

    .end local v4    # "countedMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .local v30, "countedMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    add-float v4, v28, v29

    move-object/from16 v28, v5

    const/4 v5, 0x0

    .end local v5    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v28, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    invoke-direct {v2, v3, v4, v5, v5}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    invoke-direct {v11, v1, v2}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    iput-object v11, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 209
    invoke-static {v0}, Lcom/itextpdf/layout/renderer/TargetCounterHandler;->addPageByID(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 211
    const/4 v1, 0x0

    .line 213
    .local v1, "anythingPlaced":Z
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v2, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .line 214
    .local v2, "currentTextPos":I
    const/16 v3, 0x18

    invoke-virtual {v0, v3}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPropertyAsUnitValue(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v11

    .line 215
    .local v11, "fontSize":Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {v11}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v4

    if-nez v4, :cond_7

    .line 216
    const-class v4, Lcom/itextpdf/layout/renderer/TextRenderer;

    invoke-static {v4}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v4

    .line 217
    .local v4, "logger":Lorg/slf4j/Logger;
    nop

    .line 218
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    .line 217
    const-string v5, "Property {0} in percents is not supported"

    invoke-static {v5, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4, v3}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 220
    .end local v4    # "logger":Lorg/slf4j/Logger;
    :cond_7
    const/16 v3, 0x48

    invoke-virtual {v0, v3}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v29

    .line 221
    .local v29, "textRise":F
    const/16 v3, 0xf

    invoke-virtual {v0, v3}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v4

    .line 222
    .local v4, "characterSpacing":Ljava/lang/Float;
    const/16 v3, 0x4e

    invoke-virtual {v0, v3}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v5

    .line 223
    .local v5, "wordSpacing":Ljava/lang/Float;
    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    move/from16 v31, v1

    .end local v1    # "anythingPlaced":Z
    .local v31, "anythingPlaced":Z
    const/16 v1, 0x1d

    invoke-virtual {v0, v1, v3}, Lcom/itextpdf/layout/renderer/TextRenderer;->getProperty(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v32

    .line 224
    .local v32, "hScale":F
    const/16 v1, 0x3e

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/splitting/ISplitCharacters;

    .line 225
    .local v1, "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move/from16 v33, v2

    .end local v2    # "currentTextPos":I
    .local v33, "currentTextPos":I
    const/16 v2, 0x1f

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    const v2, 0x3e59a954    # 0.21256f

    invoke-virtual {v11}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v3

    mul-float/2addr v2, v3

    goto :goto_7

    :cond_8
    const/4 v2, 0x0

    .line 226
    .local v2, "italicSkewAddition":F
    :goto_7
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    move/from16 v34, v2

    .end local v2    # "italicSkewAddition":F
    .local v34, "italicSkewAddition":F
    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    const v2, 0x3d088889

    invoke-virtual {v11}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v3

    mul-float/2addr v2, v3

    goto :goto_8

    :cond_9
    const/4 v2, 0x0

    .line 228
    .local v2, "boldSimulationAddition":F
    :goto_8
    new-instance v3, Lcom/itextpdf/io/font/otf/GlyphLine;

    move/from16 v35, v2

    .end local v2    # "boldSimulationAddition":F
    .local v35, "boldSimulationAddition":F
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-direct {v3, v2}, Lcom/itextpdf/io/font/otf/GlyphLine;-><init>(Lcom/itextpdf/io/font/otf/GlyphLine;)V

    iput-object v3, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 229
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    move-object/from16 v36, v6

    .end local v6    # "area":Lcom/itextpdf/layout/layout/LayoutArea;
    .local v36, "area":Lcom/itextpdf/layout/layout/LayoutArea;
    const/4 v6, -0x1

    iput v6, v3, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    iput v6, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .line 231
    const/4 v2, 0x0

    .line 232
    .local v2, "ascender":F
    const/4 v3, 0x0

    .line 234
    .local v3, "descender":F
    const/16 v37, 0x0

    .line 235
    .local v37, "currentLineAscender":F
    const/16 v38, 0x0

    .line 236
    .local v38, "currentLineDescender":F
    const/16 v39, 0x0

    .line 237
    .local v39, "currentLineHeight":F
    move/from16 v40, v33

    .line 238
    .local v40, "initialLineTextPos":I
    const/16 v41, 0x0

    .line 239
    .local v41, "currentLineWidth":F
    const/16 v42, -0x1

    .line 241
    .local v42, "previousCharPos":I
    const/16 v6, 0x7b

    invoke-virtual {v0, v6}, Lcom/itextpdf/layout/renderer/TextRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/layout/properties/RenderingMode;

    .line 242
    .local v6, "mode":Lcom/itextpdf/layout/properties/RenderingMode;
    move/from16 v44, v2

    .end local v2    # "ascender":F
    .local v44, "ascender":F
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->font:Lcom/itextpdf/kernel/font/PdfFont;

    invoke-static {v2, v6}, Lcom/itextpdf/layout/renderer/TextRenderer;->calculateAscenderDescender(Lcom/itextpdf/kernel/font/PdfFont;Lcom/itextpdf/layout/properties/RenderingMode;)[F

    move-result-object v45

    .line 243
    .local v45, "ascenderDescender":[F
    aget v2, v45, v19

    .line 244
    .end local v44    # "ascender":F
    .restart local v2    # "ascender":F
    aget v3, v45, v22

    .line 245
    move/from16 v44, v2

    .end local v2    # "ascender":F
    .restart local v44    # "ascender":F
    sget-object v2, Lcom/itextpdf/layout/properties/RenderingMode;->HTML_MODE:Lcom/itextpdf/layout/properties/RenderingMode;

    invoke-virtual {v2, v6}, Lcom/itextpdf/layout/properties/RenderingMode;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 246
    aget v37, v45, v19

    .line 247
    aget v38, v45, v22

    .line 248
    sub-float v2, v37, v38

    .line 249
    invoke-virtual {v11}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v46

    .line 248
    invoke-static/range {v46 .. v46}, Lcom/itextpdf/io/font/FontProgram;->convertTextSpaceToGlyphSpace(F)F

    move-result v46

    mul-float v2, v2, v46

    add-float v39, v2, v29

    .line 252
    :cond_a
    const/4 v2, 0x0

    iput-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->savedWordBreakAtLineEnding:Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 253
    const/16 v46, 0x0

    .line 255
    .local v46, "wordBreakGlyphAtLineEnding":Lcom/itextpdf/io/font/otf/Glyph;
    const/16 v2, 0x42

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Character;

    .line 257
    .local v2, "tabAnchorCharacter":Ljava/lang/Character;
    const/16 v48, 0x0

    .line 259
    .local v48, "result":Lcom/itextpdf/layout/layout/TextLayoutResult;
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/layout/layout/LayoutContext;->isClippedHeight()Z

    move-result v49

    if-nez v49, :cond_b

    sget-object v49, Lcom/itextpdf/layout/properties/OverflowPropertyValue;->FIT:Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    move-object/from16 v50, v49

    move-object/from16 v49, v2

    move-object/from16 v2, v50

    move/from16 v50, v3

    goto :goto_9

    :cond_b
    move-object/from16 v49, v2

    .end local v2    # "tabAnchorCharacter":Ljava/lang/Character;
    .local v49, "tabAnchorCharacter":Ljava/lang/Character;
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 261
    move/from16 v50, v3

    .end local v3    # "descender":F
    .local v50, "descender":F
    const/16 v3, 0x68

    invoke-interface {v2, v3}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    :goto_9
    move-object/from16 v51, v2

    .line 264
    .local v51, "overflowY":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    const/4 v2, 0x0

    .line 266
    .local v2, "isSplitForcedByNewLine":Z
    const/4 v3, 0x0

    .line 268
    .local v3, "forcePartialSplitOnFirstChar":Z
    const/16 v52, 0x0

    .line 270
    .local v52, "ignoreNewLineSymbol":Z
    const/16 v53, 0x0

    .line 272
    .local v53, "crlf":Z
    const/16 v54, 0x0

    .line 274
    .local v54, "containsPossibleBreak":Z
    move/from16 v55, v2

    .end local v2    # "isSplitForcedByNewLine":Z
    .local v55, "isSplitForcedByNewLine":Z
    const/16 v2, 0x1e

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/hyphenation/HyphenationConfig;

    .line 277
    .local v2, "hyphenationConfig":Lcom/itextpdf/layout/hyphenation/HyphenationConfig;
    move/from16 v56, v33

    move-object/from16 v57, v6

    move/from16 v6, v56

    .line 278
    .local v6, "firstPrintPos":I
    .local v57, "mode":Lcom/itextpdf/layout/properties/RenderingMode;
    :goto_a
    move-object/from16 v56, v2

    .end local v2    # "hyphenationConfig":Lcom/itextpdf/layout/hyphenation/HyphenationConfig;
    .local v56, "hyphenationConfig":Lcom/itextpdf/layout/hyphenation/HyphenationConfig;
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v2, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-ge v6, v2, :cond_c

    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-virtual {v2, v6}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v2

    invoke-static {v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->noPrint(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 279
    add-int/lit8 v6, v6, 0x1

    move-object/from16 v2, v56

    goto :goto_a

    .line 282
    :cond_c
    move/from16 v2, v18

    move/from16 v18, v3

    move v3, v2

    move/from16 v2, v33

    move/from16 v33, v7

    move/from16 v7, v37

    move-object/from16 v37, v11

    move/from16 v11, v38

    move/from16 v38, v12

    move/from16 v12, v39

    .end local v39    # "currentLineHeight":F
    .local v2, "currentTextPos":I
    .local v3, "leftMinWidth":F
    .local v7, "currentLineAscender":F
    .local v11, "currentLineDescender":F
    .local v12, "currentLineHeight":F
    .local v18, "forcePartialSplitOnFirstChar":Z
    .local v33, "noSoftWrap":Z
    .local v37, "fontSize":Lcom/itextpdf/layout/properties/UnitValue;
    .local v38, "overflowWrapNotNormal":Z
    :goto_b
    move/from16 v39, v3

    .end local v3    # "leftMinWidth":F
    .local v39, "leftMinWidth":F
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v3, v3, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    move-object/from16 v58, v10

    .end local v10    # "rightMarginBorderPadding":[F
    .local v58, "rightMarginBorderPadding":[F
    if-ge v2, v3, :cond_51

    .line 283
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-virtual {v3, v2}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v3

    invoke-static {v3}, Lcom/itextpdf/layout/renderer/TextRenderer;->noPrint(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v3

    if-eqz v3, :cond_e

    .line 284
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v3, v3, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    const/4 v10, -0x1

    if-ne v3, v10, :cond_d

    .line 285
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iput v2, v3, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .line 287
    :cond_d
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget-object v10, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v10, v10, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    move-object/from16 v59, v4

    .end local v4    # "characterSpacing":Ljava/lang/Float;
    .local v59, "characterSpacing":Ljava/lang/Float;
    add-int/lit8 v4, v2, 0x1

    invoke-static {v10, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    iput v4, v3, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    .line 288
    add-int/lit8 v2, v2, 0x1

    .line 289
    move/from16 v3, v39

    move-object/from16 v10, v58

    move-object/from16 v4, v59

    goto :goto_b

    .line 292
    .end local v59    # "characterSpacing":Ljava/lang/Float;
    .restart local v4    # "characterSpacing":Ljava/lang/Float;
    :cond_e
    move-object/from16 v59, v4

    .end local v4    # "characterSpacing":Ljava/lang/Float;
    .restart local v59    # "characterSpacing":Ljava/lang/Float;
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v3, v3, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    add-int/lit8 v60, v3, -0x1

    .line 293
    .local v60, "nonBreakablePartEnd":I
    const/4 v3, 0x0

    .line 294
    .local v3, "nonBreakablePartFullWidth":F
    const/4 v4, 0x0

    .line 295
    .local v4, "nonBreakablePartWidthWhichDoesNotExceedAllowedWidth":F
    const/16 v61, 0x0

    .line 296
    .local v61, "nonBreakablePartMaxAscender":F
    const/16 v62, 0x0

    .line 297
    .local v62, "nonBreakablePartMaxDescender":F
    const/16 v63, 0x0

    .line 298
    .local v63, "nonBreakablePartMaxHeight":F
    const/16 v64, -0x1

    .line 299
    .local v64, "firstCharacterWhichExceedsAllowedWidth":I
    const/16 v65, 0x0

    .line 300
    .local v65, "nonBreakingHyphenRelatedChunkWidth":F
    const/16 v66, -0x1

    .line 301
    .local v66, "nonBreakingHyphenRelatedChunkStart":I
    const/16 v67, 0x0

    .line 302
    .local v67, "beforeNonBreakingHyphenRelatedChunkMaxAscender":F
    const/16 v68, 0x0

    .line 304
    .local v68, "beforeNonBreakingHyphenRelatedChunkMaxDescender":F
    move/from16 v69, v2

    move/from16 v10, v21

    move/from16 v21, v3

    move/from16 v3, v42

    move/from16 v42, v4

    move-object/from16 v4, v49

    move-object/from16 v49, v46

    move/from16 v46, v10

    move/from16 v10, v66

    move-object/from16 v66, v8

    move v8, v10

    move/from16 v10, v69

    move-object/from16 v69, v14

    move v14, v10

    move/from16 v10, v64

    const/high16 v64, -0x40800000    # -1.0f

    .end local v64    # "firstCharacterWhichExceedsAllowedWidth":I
    .local v3, "previousCharPos":I
    .local v4, "tabAnchorCharacter":Ljava/lang/Character;
    .local v8, "nonBreakingHyphenRelatedChunkStart":I
    .local v10, "firstCharacterWhichExceedsAllowedWidth":I
    .local v14, "ind":I
    .local v21, "nonBreakablePartFullWidth":F
    .local v42, "nonBreakablePartWidthWhichDoesNotExceedAllowedWidth":F
    .local v46, "rightMinWidth":F
    .local v49, "wordBreakGlyphAtLineEnding":Lcom/itextpdf/io/font/otf/Glyph;
    .local v66, "leftMarginBorderPadding":[F
    .local v69, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    :goto_c
    move/from16 v70, v3

    .end local v3    # "previousCharPos":I
    .local v70, "previousCharPos":I
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v3, v3, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-ge v14, v3, :cond_33

    .line 305
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-virtual {v3, v14}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v3

    invoke-static {v3}, Lcom/itextpdf/io/util/TextUtil;->isNewLine(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v3

    .line 331
    move/from16 v71, v3

    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 305
    if-eqz v71, :cond_12

    .line 306
    const/16 v54, 0x1

    .line 307
    invoke-virtual {v3, v14}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v3

    .line 308
    .end local v49    # "wordBreakGlyphAtLineEnding":Lcom/itextpdf/io/font/otf/Glyph;
    .local v3, "wordBreakGlyphAtLineEnding":Lcom/itextpdf/io/font/otf/Glyph;
    const/16 v49, 0x1

    .line 309
    .end local v55    # "isSplitForcedByNewLine":Z
    .local v49, "isSplitForcedByNewLine":Z
    add-int/lit8 v10, v14, 0x1

    .line 310
    if-eq v14, v6, :cond_f

    .line 311
    const/16 v52, 0x1

    goto :goto_d

    .line 314
    :cond_f
    const/16 v18, 0x1

    .line 317
    :goto_d
    move-object/from16 v71, v3

    .end local v3    # "wordBreakGlyphAtLineEnding":Lcom/itextpdf/io/font/otf/Glyph;
    .local v71, "wordBreakGlyphAtLineEnding":Lcom/itextpdf/io/font/otf/Glyph;
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v3, v3, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    move-object/from16 v72, v4

    const/4 v4, -0x1

    .end local v4    # "tabAnchorCharacter":Ljava/lang/Character;
    .local v72, "tabAnchorCharacter":Ljava/lang/Character;
    if-ne v3, v4, :cond_10

    .line 318
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iput v2, v3, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .line 321
    :cond_10
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-static {v3, v2}, Lcom/itextpdf/io/util/TextUtil;->isCarriageReturnFollowedByLineFeed(Lcom/itextpdf/io/font/otf/GlyphLine;I)Z

    move-result v3

    .line 323
    .end local v53    # "crlf":Z
    .local v3, "crlf":Z
    if-eqz v3, :cond_11

    .line 324
    add-int/lit8 v2, v2, 0x1

    .line 327
    :cond_11
    iget-object v4, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    move/from16 v53, v2

    .end local v2    # "currentTextPos":I
    .local v53, "currentTextPos":I
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v2, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    move/from16 v55, v3

    .end local v3    # "crlf":Z
    .local v55, "crlf":Z
    add-int/lit8 v3, v10, -0x1

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    iput v2, v4, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    .line 328
    move-object/from16 v47, v5

    move/from16 v75, v6

    move-object/from16 v5, v28

    move-object/from16 v74, v30

    move/from16 v77, v50

    move/from16 v14, v54

    move/from16 v2, v62

    move/from16 v3, v63

    move-object v6, v1

    move-object/from16 v28, v26

    move-object/from16 v30, v27

    move/from16 v1, v61

    move-object/from16 v26, v13

    move-object/from16 v27, v25

    move/from16 v13, v42

    move/from16 v42, v70

    move-object/from16 v25, v15

    move/from16 v15, v34

    move/from16 v34, v12

    move/from16 v12, v35

    move/from16 v35, v11

    move/from16 v11, v44

    move/from16 v44, v7

    move/from16 v7, v53

    move/from16 v53, v55

    move/from16 v55, v49

    move-object/from16 v49, v71

    goto/16 :goto_1b

    .line 331
    .end local v71    # "wordBreakGlyphAtLineEnding":Lcom/itextpdf/io/font/otf/Glyph;
    .end local v72    # "tabAnchorCharacter":Ljava/lang/Character;
    .restart local v2    # "currentTextPos":I
    .restart local v4    # "tabAnchorCharacter":Ljava/lang/Character;
    .local v49, "wordBreakGlyphAtLineEnding":Lcom/itextpdf/io/font/otf/Glyph;
    .local v53, "crlf":Z
    .local v55, "isSplitForcedByNewLine":Z
    :cond_12
    move-object/from16 v72, v4

    .end local v4    # "tabAnchorCharacter":Ljava/lang/Character;
    .restart local v72    # "tabAnchorCharacter":Ljava/lang/Character;
    invoke-virtual {v3, v14}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v3

    .line 332
    .local v3, "currentGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-static {v3}, Lcom/itextpdf/layout/renderer/TextRenderer;->noPrint(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v4

    if-eqz v4, :cond_18

    .line 333
    add-int/lit8 v4, v14, 0x1

    move/from16 v71, v2

    .end local v2    # "currentTextPos":I
    .local v71, "currentTextPos":I
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v2, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-ge v4, v2, :cond_13

    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    add-int/lit8 v4, v14, 0x1

    .line 334
    invoke-interface {v1, v2, v4}, Lcom/itextpdf/layout/splitting/ISplitCharacters;->isSplitCharacter(Lcom/itextpdf/io/font/otf/GlyphLine;I)Z

    move-result v2

    if-eqz v2, :cond_13

    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    add-int/lit8 v4, v14, 0x1

    .line 335
    invoke-virtual {v2, v4}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v2

    invoke-static {v2}, Lcom/itextpdf/io/util/TextUtil;->isSpaceOrWhitespace(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v2

    if-eqz v2, :cond_13

    move/from16 v2, v22

    goto :goto_e

    :cond_13
    move/from16 v2, v19

    .line 336
    .local v2, "nextGlyphIsSpaceOrWhiteSpace":Z
    :goto_e
    if-eqz v2, :cond_14

    const/4 v4, -0x1

    if-ne v10, v4, :cond_14

    .line 337
    const/16 v54, 0x1

    .line 339
    :cond_14
    add-int/lit8 v4, v14, 0x1

    move-object/from16 v73, v1

    .end local v1    # "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    .local v73, "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v1, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-eq v4, v1, :cond_16

    if-nez v2, :cond_16

    add-int/lit8 v1, v14, 0x1

    iget v4, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->indexOfFirstCharacterToBeForcedToOverflow:I

    if-lt v1, v4, :cond_15

    goto :goto_f

    :cond_15
    move-object/from16 v47, v5

    move/from16 v75, v6

    move-object/from16 v5, v28

    move-object/from16 v74, v30

    move/from16 v77, v50

    move/from16 v3, v70

    move-object/from16 v6, v73

    move-object/from16 v28, v26

    move-object/from16 v30, v27

    move-object/from16 v26, v13

    move-object/from16 v27, v25

    move-object/from16 v25, v15

    move/from16 v15, v34

    move/from16 v34, v12

    move/from16 v12, v35

    move/from16 v35, v11

    move/from16 v11, v44

    move/from16 v44, v7

    move-object/from16 v4, v72

    goto/16 :goto_19

    .line 341
    :cond_16
    :goto_f
    add-int/lit8 v1, v14, 0x1

    iget v4, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->indexOfFirstCharacterToBeForcedToOverflow:I

    if-lt v1, v4, :cond_17

    .line 342
    move/from16 v10, v71

    .line 343
    move-object/from16 v47, v5

    move/from16 v75, v6

    move-object/from16 v5, v28

    move-object/from16 v74, v30

    move/from16 v77, v50

    move/from16 v14, v54

    move/from16 v1, v61

    move/from16 v2, v62

    move/from16 v3, v63

    move-object/from16 v6, v73

    move-object/from16 v28, v26

    move-object/from16 v30, v27

    move-object/from16 v26, v13

    move-object/from16 v27, v25

    move/from16 v13, v42

    move/from16 v42, v70

    move-object/from16 v25, v15

    move/from16 v15, v34

    move/from16 v34, v12

    move/from16 v12, v35

    move/from16 v35, v11

    move/from16 v11, v44

    move/from16 v44, v7

    move/from16 v7, v71

    goto/16 :goto_1b

    .line 345
    :cond_17
    move/from16 v60, v14

    .line 346
    move-object/from16 v47, v5

    move/from16 v75, v6

    move-object/from16 v5, v28

    move-object/from16 v74, v30

    move/from16 v77, v50

    move/from16 v14, v54

    move/from16 v1, v61

    move/from16 v2, v62

    move/from16 v3, v63

    move-object/from16 v6, v73

    move-object/from16 v28, v26

    move-object/from16 v30, v27

    move-object/from16 v26, v13

    move-object/from16 v27, v25

    move/from16 v13, v42

    move/from16 v42, v70

    move-object/from16 v25, v15

    move/from16 v15, v34

    move/from16 v34, v12

    move/from16 v12, v35

    move/from16 v35, v11

    move/from16 v11, v44

    move/from16 v44, v7

    move/from16 v7, v71

    goto/16 :goto_1b

    .line 351
    .end local v71    # "currentTextPos":I
    .end local v73    # "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    .restart local v1    # "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    .local v2, "currentTextPos":I
    :cond_18
    move-object/from16 v73, v1

    move/from16 v71, v2

    .end local v1    # "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    .end local v2    # "currentTextPos":I
    .restart local v71    # "currentTextPos":I
    .restart local v73    # "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    if-eqz v72, :cond_19

    invoke-virtual/range {v72 .. v72}, Ljava/lang/Character;->charValue()C

    move-result v1

    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-virtual {v2, v14}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v2

    if-ne v1, v2, :cond_19

    .line 352
    add-float v1, v41, v21

    iput v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->tabAnchorCharacterPosition:F

    .line 353
    const/4 v4, 0x0

    move-object/from16 v72, v4

    .line 356
    :cond_19
    nop

    .line 357
    invoke-virtual/range {v37 .. v37}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v2

    move-object v1, v3

    .end local v3    # "currentGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    .local v1, "currentGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-static/range {v32 .. v32}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    move-object/from16 v75, v28

    move-object/from16 v74, v30

    move-object/from16 v4, v59

    move-object/from16 v28, v26

    move-object/from16 v30, v27

    move-object/from16 v26, v13

    move-object/from16 v27, v25

    move/from16 v13, v70

    move-object/from16 v25, v15

    move/from16 v15, v34

    move/from16 v34, v12

    move/from16 v12, v35

    move/from16 v35, v11

    move/from16 v11, v44

    move/from16 v44, v7

    move/from16 v7, v50

    .end local v50    # "descender":F
    .end local v59    # "characterSpacing":Ljava/lang/Float;
    .end local v70    # "previousCharPos":I
    .local v4, "characterSpacing":Ljava/lang/Float;
    .local v7, "descender":F
    .local v11, "ascender":F
    .local v12, "boldSimulationAddition":F
    .local v13, "previousCharPos":I
    .local v15, "italicSkewAddition":F
    .local v25, "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .local v26, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v27, "margins":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v28, "borders":[Lcom/itextpdf/layout/borders/Border;
    .local v30, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v34, "currentLineHeight":F
    .local v35, "currentLineDescender":F
    .local v44, "currentLineAscender":F
    .local v74, "countedMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .local v75, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/TextRenderer;->getCharWidth(Lcom/itextpdf/io/font/otf/Glyph;FLjava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;)F

    move-result v2

    .line 356
    move-object/from16 v47, v5

    .end local v4    # "characterSpacing":Ljava/lang/Float;
    .end local v5    # "wordSpacing":Ljava/lang/Float;
    .local v47, "wordSpacing":Ljava/lang/Float;
    .restart local v59    # "characterSpacing":Ljava/lang/Float;
    invoke-static {v2}, Lcom/itextpdf/io/font/FontProgram;->convertTextSpaceToGlyphSpace(F)F

    move-result v2

    .line 358
    .local v2, "glyphWidth":F
    const/4 v4, -0x1

    if-eq v13, v4, :cond_1a

    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-virtual {v3, v13}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/io/font/otf/Glyph;->getXAdvance()S

    move-result v3

    int-to-float v3, v3

    goto :goto_10

    :cond_1a
    const/4 v3, 0x0

    .line 359
    .local v3, "xAdvance":F
    :goto_10
    const/16 v20, 0x0

    cmpl-float v4, v3, v20

    if-eqz v4, :cond_1b

    .line 360
    nop

    .line 361
    invoke-virtual/range {v37 .. v37}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v4

    invoke-static/range {v32 .. v32}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    invoke-direct {v0, v3, v4, v5}, Lcom/itextpdf/layout/renderer/TextRenderer;->scaleXAdvance(FFLjava/lang/Float;)F

    move-result v4

    .line 360
    invoke-static {v4}, Lcom/itextpdf/io/font/FontProgram;->convertTextSpaceToGlyphSpace(F)F

    move-result v3

    .line 364
    :cond_1b
    add-float v4, v21, v2

    add-float/2addr v4, v3

    add-float/2addr v4, v15

    add-float/2addr v4, v12

    .line 366
    .local v4, "potentialWidth":F
    invoke-virtual/range {v26 .. v26}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v5

    sub-float v5, v5, v41

    const v50, 0x38d1b717    # 1.0E-4f

    add-float v5, v5, v50

    cmpl-float v5, v4, v5

    if-lez v5, :cond_1c

    move/from16 v5, v22

    goto :goto_11

    :cond_1c
    move/from16 v5, v19

    .line 367
    .local v5, "symbolNotFitOnLine":Z
    :goto_11
    if-nez v33, :cond_1d

    if-eqz v5, :cond_1d

    move-object/from16 v50, v1

    const/4 v1, -0x1

    .end local v1    # "currentGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    .local v50, "currentGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    if-eq v10, v1, :cond_1e

    goto :goto_12

    .end local v50    # "currentGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    .restart local v1    # "currentGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_1d
    move-object/from16 v50, v1

    .end local v1    # "currentGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    .restart local v50    # "currentGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    :goto_12
    iget v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->specialScriptFirstNotFittingIndex:I

    if-ne v14, v1, :cond_21

    .line 369
    :cond_1e
    move v10, v14

    .line 370
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-virtual {v1, v14}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v1

    invoke-static {v1}, Lcom/itextpdf/io/util/TextUtil;->isSpaceOrWhitespace(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v1

    .line 371
    .local v1, "spaceOrWhitespace":Z
    move/from16 v70, v1

    .end local v1    # "spaceOrWhitespace":Z
    .local v70, "spaceOrWhitespace":Z
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    move/from16 v76, v4

    const/16 v4, 0x67

    .end local v4    # "potentialWidth":F
    .local v76, "potentialWidth":F
    invoke-interface {v1, v4}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/OverflowPropertyValue;

    .line 372
    .local v1, "parentOverflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    if-nez v70, :cond_1f

    if-eqz v38, :cond_22

    invoke-static {v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->isOverflowFit(Lcom/itextpdf/layout/properties/OverflowPropertyValue;)Z

    move-result v24

    if-nez v24, :cond_22

    .line 373
    :cond_1f
    if-eqz v70, :cond_20

    .line 374
    move-object/from16 v49, v50

    .line 376
    :cond_20
    if-ne v14, v6, :cond_22

    .line 377
    const/16 v24, 0x1

    .line 378
    .end local v54    # "containsPossibleBreak":Z
    .local v24, "containsPossibleBreak":Z
    const/16 v18, 0x1

    .line 379
    add-int/lit8 v10, v14, 0x1

    .line 380
    move/from16 v1, v42

    move/from16 v42, v13

    move v13, v1

    move/from16 v77, v7

    move/from16 v14, v24

    move/from16 v1, v61

    move/from16 v2, v62

    move/from16 v3, v63

    move/from16 v7, v71

    move-object/from16 v5, v75

    move/from16 v75, v6

    move-object/from16 v6, v73

    goto/16 :goto_1b

    .line 367
    .end local v1    # "parentOverflowX":Lcom/itextpdf/layout/properties/OverflowPropertyValue;
    .end local v24    # "containsPossibleBreak":Z
    .end local v70    # "spaceOrWhitespace":Z
    .end local v76    # "potentialWidth":F
    .restart local v4    # "potentialWidth":F
    .restart local v54    # "containsPossibleBreak":Z
    :cond_21
    move/from16 v76, v4

    const/16 v4, 0x67

    .line 385
    .end local v4    # "potentialWidth":F
    .restart local v76    # "potentialWidth":F
    :cond_22
    if-eqz v56, :cond_25

    .line 386
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-static {v1, v14}, Lcom/itextpdf/layout/renderer/TextRenderer;->glyphBelongsToNonBreakingHyphenRelatedChunk(Lcom/itextpdf/io/font/otf/GlyphLine;I)Z

    move-result v1

    if-eqz v1, :cond_24

    .line 387
    const/4 v1, -0x1

    if-ne v1, v8, :cond_23

    .line 388
    move/from16 v67, v61

    .line 389
    move/from16 v68, v62

    .line 390
    move v8, v14

    .line 392
    :cond_23
    add-float v1, v2, v3

    add-float v65, v65, v1

    goto :goto_13

    .line 394
    :cond_24
    const/4 v8, -0x1

    .line 395
    const/16 v65, 0x0

    .line 398
    :cond_25
    :goto_13
    const/4 v1, -0x1

    if-eq v10, v1, :cond_26

    invoke-static/range {v16 .. v16}, Lcom/itextpdf/layout/renderer/TextRenderer;->isOverflowFit(Lcom/itextpdf/layout/properties/OverflowPropertyValue;)Z

    move-result v1

    if-nez v1, :cond_27

    .line 399
    :cond_26
    add-float v1, v2, v3

    add-float v42, v42, v1

    .line 401
    :cond_27
    add-float v1, v2, v3

    add-float v21, v21, v1

    .line 403
    move/from16 v1, v61

    .end local v61    # "nonBreakablePartMaxAscender":F
    .local v1, "nonBreakablePartMaxAscender":F
    invoke-static {v1, v11}, Ljava/lang/Math;->max(FF)F

    move-result v61

    .line 404
    .end local v1    # "nonBreakablePartMaxAscender":F
    .restart local v61    # "nonBreakablePartMaxAscender":F
    move/from16 v1, v62

    .end local v62    # "nonBreakablePartMaxDescender":F
    .local v1, "nonBreakablePartMaxDescender":F
    invoke-static {v1, v7}, Ljava/lang/Math;->min(FF)F

    move-result v62

    .line 405
    .end local v1    # "nonBreakablePartMaxDescender":F
    .restart local v62    # "nonBreakablePartMaxDescender":F
    sub-float v1, v61, v62

    .line 406
    invoke-virtual/range {v37 .. v37}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v24

    mul-float v1, v1, v24

    .line 405
    invoke-static {v1}, Lcom/itextpdf/io/font/FontProgram;->convertTextSpaceToGlyphSpace(F)F

    move-result v1

    add-float v63, v1, v29

    .line 408
    move v1, v14

    .line 410
    .end local v13    # "previousCharPos":I
    .local v1, "previousCharPos":I
    if-nez v33, :cond_29

    if-eqz v5, :cond_29

    const/16 v20, 0x0

    cmpl-float v13, v20, v65

    if-eqz v13, :cond_28

    add-int/lit8 v13, v14, 0x1

    iget-object v4, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v4, v4, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-eq v13, v4, :cond_28

    iget-object v4, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    add-int/lit8 v13, v14, 0x1

    .line 411
    invoke-static {v4, v13}, Lcom/itextpdf/layout/renderer/TextRenderer;->glyphBelongsToNonBreakingHyphenRelatedChunk(Lcom/itextpdf/io/font/otf/GlyphLine;I)Z

    move-result v4

    if-nez v4, :cond_29

    .line 412
    :cond_28
    invoke-static/range {v16 .. v16}, Lcom/itextpdf/layout/renderer/TextRenderer;->isOverflowFit(Lcom/itextpdf/layout/properties/OverflowPropertyValue;)Z

    move-result v4

    if-eqz v4, :cond_29

    .line 415
    move/from16 v77, v7

    move/from16 v13, v42

    move/from16 v14, v54

    move/from16 v2, v62

    move/from16 v3, v63

    move/from16 v7, v71

    move-object/from16 v5, v75

    move/from16 v42, v1

    move/from16 v75, v6

    move/from16 v1, v61

    move-object/from16 v6, v73

    goto/16 :goto_1b

    .line 419
    :cond_29
    sget-object v4, Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;->ANYWHERE:Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;

    if-ne v4, v9, :cond_2b

    .line 420
    move/from16 v70, v5

    .end local v5    # "symbolNotFitOnLine":Z
    .local v70, "symbolNotFitOnLine":Z
    float-to-double v4, v2

    move-wide/from16 v77, v4

    float-to-double v4, v3

    add-double v4, v77, v4

    move-wide/from16 v77, v4

    float-to-double v4, v15

    add-double v4, v77, v4

    move-wide/from16 v77, v4

    float-to-double v4, v12

    add-double v4, v77, v4

    double-to-float v4, v4

    .line 422
    .local v4, "childMinWidth":F
    cmpl-float v5, v39, v64

    if-nez v5, :cond_2a

    .line 423
    move/from16 v39, v4

    goto :goto_14

    .line 425
    :cond_2a
    move/from16 v46, v4

    .line 427
    :goto_14
    move-object/from16 v5, v75

    .end local v75    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v5, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    invoke-virtual {v5, v4}, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->updateMinChildWidth(F)V

    .line 428
    move/from16 v75, v6

    move/from16 v77, v7

    .end local v6    # "firstPrintPos":I
    .end local v7    # "descender":F
    .local v75, "firstPrintPos":I
    .local v77, "descender":F
    float-to-double v6, v2

    move v13, v1

    move/from16 v78, v2

    .end local v1    # "previousCharPos":I
    .end local v2    # "glyphWidth":F
    .restart local v13    # "previousCharPos":I
    .local v78, "glyphWidth":F
    float-to-double v1, v3

    add-double/2addr v6, v1

    double-to-float v1, v6

    invoke-virtual {v5, v1}, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->updateMaxChildWidth(F)V

    goto :goto_15

    .line 419
    .end local v4    # "childMinWidth":F
    .end local v13    # "previousCharPos":I
    .end local v70    # "symbolNotFitOnLine":Z
    .end local v77    # "descender":F
    .end local v78    # "glyphWidth":F
    .restart local v1    # "previousCharPos":I
    .restart local v2    # "glyphWidth":F
    .local v5, "symbolNotFitOnLine":Z
    .restart local v6    # "firstPrintPos":I
    .restart local v7    # "descender":F
    .local v75, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    :cond_2b
    move v13, v1

    move/from16 v78, v2

    move/from16 v70, v5

    move/from16 v77, v7

    move-object/from16 v5, v75

    move/from16 v75, v6

    .line 431
    .end local v1    # "previousCharPos":I
    .end local v2    # "glyphWidth":F
    .end local v6    # "firstPrintPos":I
    .end local v7    # "descender":F
    .local v5, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .restart local v13    # "previousCharPos":I
    .restart local v70    # "symbolNotFitOnLine":Z
    .local v75, "firstPrintPos":I
    .restart local v77    # "descender":F
    .restart local v78    # "glyphWidth":F
    :goto_15
    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->textContainsSpecialScriptGlyphs(Z)Z

    move-result v2

    if-eqz v2, :cond_2c

    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->specialScriptsWordBreakPoints:Ljava/util/List;

    add-int/lit8 v4, v14, 0x1

    .line 432
    invoke-static {v2, v4, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->findPossibleBreaksSplitPosition(Ljava/util/List;IZ)I

    move-result v2

    if-ltz v2, :cond_2c

    const/4 v1, 0x1

    goto :goto_16

    :cond_2c
    move/from16 v1, v19

    .line 434
    .local v1, "endOfWordBelongingToSpecialScripts":Z
    :goto_16
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    move-object/from16 v6, v73

    .end local v73    # "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    .local v6, "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    invoke-interface {v6, v2, v14}, Lcom/itextpdf/layout/splitting/ISplitCharacters;->isSplitCharacter(Lcom/itextpdf/io/font/otf/GlyphLine;I)Z

    move-result v2

    if-nez v2, :cond_2e

    add-int/lit8 v2, v14, 0x1

    iget-object v4, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v4, v4, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-ge v2, v4, :cond_2d

    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    add-int/lit8 v4, v14, 0x1

    .line 436
    invoke-interface {v6, v2, v4}, Lcom/itextpdf/layout/splitting/ISplitCharacters;->isSplitCharacter(Lcom/itextpdf/io/font/otf/GlyphLine;I)Z

    move-result v2

    if-eqz v2, :cond_2d

    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    add-int/lit8 v4, v14, 0x1

    .line 437
    invoke-virtual {v2, v4}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v2

    invoke-static {v2}, Lcom/itextpdf/io/util/TextUtil;->isSpaceOrWhitespace(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v2

    if-eqz v2, :cond_2d

    goto :goto_17

    :cond_2d
    move/from16 v2, v19

    goto :goto_18

    :cond_2e
    :goto_17
    const/4 v2, 0x1

    .line 438
    .local v2, "endOfNonBreakablePartCausedBySplitCharacter":Z
    :goto_18
    if-eqz v2, :cond_2f

    const/4 v4, -0x1

    if-ne v10, v4, :cond_2f

    .line 439
    const/16 v54, 0x1

    .line 441
    :cond_2f
    add-int/lit8 v4, v14, 0x1

    iget-object v7, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v7, v7, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-eq v4, v7, :cond_31

    if-nez v2, :cond_31

    if-nez v1, :cond_31

    add-int/lit8 v4, v14, 0x1

    iget v7, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->indexOfFirstCharacterToBeForcedToOverflow:I

    if-lt v4, v7, :cond_30

    goto :goto_1a

    :cond_30
    move v3, v13

    move-object/from16 v4, v72

    .line 304
    .end local v1    # "endOfWordBelongingToSpecialScripts":Z
    .end local v2    # "endOfNonBreakablePartCausedBySplitCharacter":Z
    .end local v13    # "previousCharPos":I
    .end local v50    # "currentGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    .end local v70    # "symbolNotFitOnLine":Z
    .end local v72    # "tabAnchorCharacter":Ljava/lang/Character;
    .end local v76    # "potentialWidth":F
    .end local v78    # "glyphWidth":F
    .local v3, "previousCharPos":I
    .local v4, "tabAnchorCharacter":Ljava/lang/Character;
    :goto_19
    add-int/lit8 v14, v14, 0x1

    move-object v1, v6

    move-object/from16 v13, v26

    move-object/from16 v26, v28

    move/from16 v7, v44

    move/from16 v2, v71

    move/from16 v6, v75

    move/from16 v50, v77

    const/16 v22, 0x1

    move-object/from16 v28, v5

    move/from16 v44, v11

    move/from16 v11, v35

    move-object/from16 v5, v47

    move/from16 v35, v12

    move/from16 v12, v34

    move/from16 v34, v15

    move-object/from16 v15, v25

    move-object/from16 v25, v27

    move-object/from16 v27, v30

    move-object/from16 v30, v74

    goto/16 :goto_c

    .line 445
    .end local v4    # "tabAnchorCharacter":Ljava/lang/Character;
    .restart local v1    # "endOfWordBelongingToSpecialScripts":Z
    .restart local v2    # "endOfNonBreakablePartCausedBySplitCharacter":Z
    .local v3, "xAdvance":F
    .restart local v13    # "previousCharPos":I
    .restart local v50    # "currentGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    .restart local v70    # "symbolNotFitOnLine":Z
    .restart local v72    # "tabAnchorCharacter":Ljava/lang/Character;
    .restart local v76    # "potentialWidth":F
    .restart local v78    # "glyphWidth":F
    :cond_31
    :goto_1a
    add-int/lit8 v4, v14, 0x1

    iget v7, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->indexOfFirstCharacterToBeForcedToOverflow:I

    if-lt v4, v7, :cond_32

    if-nez v2, :cond_32

    .line 447
    move/from16 v4, v71

    move v10, v4

    .line 449
    :cond_32
    move/from16 v60, v14

    .line 450
    move/from16 v1, v42

    move/from16 v42, v13

    move v13, v1

    move/from16 v14, v54

    move/from16 v1, v61

    move/from16 v2, v62

    move/from16 v3, v63

    move/from16 v7, v71

    goto :goto_1b

    .line 304
    .end local v3    # "xAdvance":F
    .end local v47    # "wordSpacing":Ljava/lang/Float;
    .end local v71    # "currentTextPos":I
    .end local v72    # "tabAnchorCharacter":Ljava/lang/Character;
    .end local v74    # "countedMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .end local v75    # "firstPrintPos":I
    .end local v76    # "potentialWidth":F
    .end local v77    # "descender":F
    .end local v78    # "glyphWidth":F
    .local v1, "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    .local v2, "currentTextPos":I
    .restart local v4    # "tabAnchorCharacter":Ljava/lang/Character;
    .local v5, "wordSpacing":Ljava/lang/Float;
    .local v6, "firstPrintPos":I
    .local v7, "currentLineAscender":F
    .local v11, "currentLineDescender":F
    .local v12, "currentLineHeight":F
    .local v13, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v15, "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .local v25, "margins":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v26, "borders":[Lcom/itextpdf/layout/borders/Border;
    .local v27, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v28, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v30, "countedMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .local v34, "italicSkewAddition":F
    .local v35, "boldSimulationAddition":F
    .local v44, "ascender":F
    .local v50, "descender":F
    .local v70, "previousCharPos":I
    :cond_33
    move/from16 v71, v2

    move-object/from16 v72, v4

    move-object/from16 v47, v5

    move/from16 v75, v6

    move-object/from16 v5, v28

    move-object/from16 v74, v30

    move/from16 v77, v50

    move-object v6, v1

    move-object/from16 v28, v26

    move-object/from16 v30, v27

    move/from16 v1, v61

    move-object/from16 v26, v13

    move-object/from16 v27, v25

    move/from16 v13, v70

    move-object/from16 v25, v15

    move/from16 v15, v34

    move/from16 v34, v12

    move/from16 v12, v35

    move/from16 v35, v11

    move/from16 v11, v44

    move/from16 v44, v7

    .end local v2    # "currentTextPos":I
    .end local v4    # "tabAnchorCharacter":Ljava/lang/Character;
    .end local v7    # "currentLineAscender":F
    .end local v50    # "descender":F
    .end local v61    # "nonBreakablePartMaxAscender":F
    .end local v70    # "previousCharPos":I
    .local v1, "nonBreakablePartMaxAscender":F
    .local v5, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v6, "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    .local v11, "ascender":F
    .local v12, "boldSimulationAddition":F
    .local v13, "previousCharPos":I
    .local v15, "italicSkewAddition":F
    .local v25, "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .local v26, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v27, "margins":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v28, "borders":[Lcom/itextpdf/layout/borders/Border;
    .local v30, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v34, "currentLineHeight":F
    .local v35, "currentLineDescender":F
    .local v44, "currentLineAscender":F
    .restart local v47    # "wordSpacing":Ljava/lang/Float;
    .restart local v71    # "currentTextPos":I
    .restart local v72    # "tabAnchorCharacter":Ljava/lang/Character;
    .restart local v74    # "countedMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .restart local v75    # "firstPrintPos":I
    .restart local v77    # "descender":F
    move/from16 v2, v42

    move/from16 v42, v13

    move v13, v2

    move/from16 v14, v54

    move/from16 v2, v62

    move/from16 v3, v63

    move/from16 v7, v71

    .line 454
    .end local v54    # "containsPossibleBreak":Z
    .end local v62    # "nonBreakablePartMaxDescender":F
    .end local v63    # "nonBreakablePartMaxHeight":F
    .end local v71    # "currentTextPos":I
    .local v2, "nonBreakablePartMaxDescender":F
    .local v3, "nonBreakablePartMaxHeight":F
    .local v7, "currentTextPos":I
    .local v13, "nonBreakablePartWidthWhichDoesNotExceedAllowedWidth":F
    .local v14, "containsPossibleBreak":Z
    .local v42, "previousCharPos":I
    :goto_1b
    const/4 v4, -0x1

    if-ne v10, v4, :cond_37

    .line 456
    move/from16 v50, v11

    .end local v11    # "ascender":F
    .local v50, "ascender":F
    iget-object v11, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v11, v11, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    if-ne v11, v4, :cond_34

    .line 457
    iget-object v4, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iput v7, v4, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .line 459
    :cond_34
    iget-object v4, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget-object v11, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v11, v11, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    move/from16 v54, v8

    .end local v8    # "nonBreakingHyphenRelatedChunkStart":I
    .local v54, "nonBreakingHyphenRelatedChunkStart":I
    add-int/lit8 v8, v60, 0x1

    invoke-static {v11, v8}, Ljava/lang/Math;->max(II)I

    move-result v8

    iput v8, v4, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    .line 460
    move/from16 v8, v44

    .end local v44    # "currentLineAscender":F
    .local v8, "currentLineAscender":F
    invoke-static {v8, v1}, Ljava/lang/Math;->max(FF)F

    move-result v4

    .line 461
    .end local v8    # "currentLineAscender":F
    .local v4, "currentLineAscender":F
    move/from16 v11, v35

    .end local v35    # "currentLineDescender":F
    .local v11, "currentLineDescender":F
    invoke-static {v11, v2}, Ljava/lang/Math;->min(FF)F

    move-result v11

    .line 462
    move/from16 v8, v34

    .end local v34    # "currentLineHeight":F
    .local v8, "currentLineHeight":F
    invoke-static {v8, v3}, Ljava/lang/Math;->max(FF)F

    move-result v8

    .line 463
    add-int/lit8 v7, v60, 0x1

    .line 464
    add-float v41, v41, v21

    .line 465
    move/from16 v34, v1

    .end local v1    # "nonBreakablePartMaxAscender":F
    .local v34, "nonBreakablePartMaxAscender":F
    sget-object v1, Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;->ANYWHERE:Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;

    if-ne v1, v9, :cond_35

    .line 466
    move/from16 v35, v2

    .end local v2    # "nonBreakablePartMaxDescender":F
    .local v35, "nonBreakablePartMaxDescender":F
    float-to-double v1, v15

    move-wide/from16 v61, v1

    float-to-double v1, v12

    add-double v1, v61, v1

    double-to-float v1, v1

    invoke-virtual {v5, v1}, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->updateMaxChildWidth(F)V

    goto :goto_1d

    .line 469
    .end local v35    # "nonBreakablePartMaxDescender":F
    .restart local v2    # "nonBreakablePartMaxDescender":F
    :cond_35
    move/from16 v35, v2

    .end local v2    # "nonBreakablePartMaxDescender":F
    .restart local v35    # "nonBreakablePartMaxDescender":F
    float-to-double v1, v13

    move-wide/from16 v61, v1

    float-to-double v1, v15

    add-double v1, v61, v1

    move-wide/from16 v61, v1

    float-to-double v1, v12

    add-double v1, v61, v1

    double-to-float v1, v1

    .line 471
    .local v1, "childMinWidth":F
    cmpl-float v2, v39, v64

    if-nez v2, :cond_36

    .line 472
    move/from16 v39, v1

    goto :goto_1c

    .line 474
    :cond_36
    move/from16 v46, v1

    .line 476
    :goto_1c
    invoke-virtual {v5, v1}, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->updateMinChildWidth(F)V

    .line 477
    invoke-virtual {v5, v1}, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->updateMaxChildWidth(F)V

    .line 479
    .end local v1    # "childMinWidth":F
    :goto_1d
    const/16 v31, 0x1

    .line 634
    .end local v3    # "nonBreakablePartMaxHeight":F
    .end local v10    # "firstCharacterWhichExceedsAllowedWidth":I
    .end local v13    # "nonBreakablePartWidthWhichDoesNotExceedAllowedWidth":F
    .end local v21    # "nonBreakablePartFullWidth":F
    .end local v34    # "nonBreakablePartMaxAscender":F
    .end local v35    # "nonBreakablePartMaxDescender":F
    .end local v54    # "nonBreakingHyphenRelatedChunkStart":I
    .end local v60    # "nonBreakablePartEnd":I
    .end local v65    # "nonBreakingHyphenRelatedChunkWidth":F
    .end local v67    # "beforeNonBreakingHyphenRelatedChunkMaxAscender":F
    .end local v68    # "beforeNonBreakingHyphenRelatedChunkMaxDescender":F
    move-object v1, v6

    move v2, v7

    move/from16 v35, v12

    move/from16 v54, v14

    move/from16 v34, v15

    move-object/from16 v15, v25

    move-object/from16 v13, v26

    move-object/from16 v25, v27

    move-object/from16 v26, v28

    move-object/from16 v27, v30

    move/from16 v3, v39

    move/from16 v21, v46

    move-object/from16 v46, v49

    move/from16 v44, v50

    move-object/from16 v10, v58

    move-object/from16 v14, v69

    move-object/from16 v49, v72

    move-object/from16 v30, v74

    move/from16 v6, v75

    move/from16 v50, v77

    const/16 v22, 0x1

    move v7, v4

    move-object/from16 v28, v5

    move v12, v8

    move-object/from16 v5, v47

    move-object/from16 v4, v59

    move-object/from16 v8, v66

    goto/16 :goto_b

    .line 482
    .end local v4    # "currentLineAscender":F
    .end local v50    # "ascender":F
    .local v1, "nonBreakablePartMaxAscender":F
    .restart local v2    # "nonBreakablePartMaxDescender":F
    .restart local v3    # "nonBreakablePartMaxHeight":F
    .local v8, "nonBreakingHyphenRelatedChunkStart":I
    .restart local v10    # "firstCharacterWhichExceedsAllowedWidth":I
    .local v11, "ascender":F
    .restart local v13    # "nonBreakablePartWidthWhichDoesNotExceedAllowedWidth":F
    .restart local v21    # "nonBreakablePartFullWidth":F
    .local v34, "currentLineHeight":F
    .local v35, "currentLineDescender":F
    .restart local v44    # "currentLineAscender":F
    .restart local v60    # "nonBreakablePartEnd":I
    .restart local v65    # "nonBreakingHyphenRelatedChunkWidth":F
    .restart local v67    # "beforeNonBreakingHyphenRelatedChunkMaxAscender":F
    .restart local v68    # "beforeNonBreakingHyphenRelatedChunkMaxDescender":F
    :cond_37
    move/from16 v50, v34

    move/from16 v34, v1

    move/from16 v1, v50

    move/from16 v54, v8

    move/from16 v50, v11

    move/from16 v11, v35

    move/from16 v8, v44

    move/from16 v35, v2

    .end local v2    # "nonBreakablePartMaxDescender":F
    .end local v44    # "currentLineAscender":F
    .local v1, "currentLineHeight":F
    .local v8, "currentLineAscender":F
    .local v11, "currentLineDescender":F
    .local v34, "nonBreakablePartMaxAscender":F
    .local v35, "nonBreakablePartMaxDescender":F
    .restart local v50    # "ascender":F
    .restart local v54    # "nonBreakingHyphenRelatedChunkStart":I
    invoke-static {v1, v3}, Ljava/lang/Math;->max(FF)F

    move-result v2

    invoke-virtual/range {v26 .. v26}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v4

    cmpl-float v2, v2, v4

    if-lez v2, :cond_39

    invoke-static/range {v51 .. v51}, Lcom/itextpdf/layout/renderer/TextRenderer;->isOverflowFit(Lcom/itextpdf/layout/properties/OverflowPropertyValue;)Z

    move-result v2

    if-eqz v2, :cond_39

    .line 483
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    move/from16 v24, v1

    move-object/from16 v4, v30

    const/4 v1, 0x1

    .end local v1    # "currentLineHeight":F
    .end local v30    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v4, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v24, "currentLineHeight":F
    invoke-virtual {v0, v2, v4, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/properties/UnitValue;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 484
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    move/from16 v30, v13

    move-object/from16 v13, v28

    .end local v28    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .local v13, "borders":[Lcom/itextpdf/layout/borders/Border;
    .local v30, "nonBreakablePartWidthWhichDoesNotExceedAllowedWidth":F
    invoke-virtual {v0, v2, v13, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/borders/Border;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 485
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    move-object/from16 v13, v27

    .end local v27    # "margins":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v13, "margins":[Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v28    # "borders":[Lcom/itextpdf/layout/borders/Border;
    invoke-virtual {v0, v2, v13, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/properties/UnitValue;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 487
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v1, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_38

    .line 488
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iput v7, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .line 490
    :cond_38
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v2, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    invoke-static {v2, v10}, Ljava/lang/Math;->max(II)I

    move-result v2

    iput v2, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    .line 492
    move/from16 v1, v40

    .end local v40    # "initialLineTextPos":I
    .local v1, "initialLineTextPos":I
    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->split(I)[Lcom/itextpdf/layout/renderer/TextRenderer;

    move-result-object v20

    .line 494
    .local v20, "splitResult":[Lcom/itextpdf/layout/renderer/TextRenderer;
    invoke-virtual {v0, v6}, Lcom/itextpdf/layout/renderer/TextRenderer;->isStartsWithSplitCharWhiteSpaceAndEndsWithSplitChar(Lcom/itextpdf/layout/splitting/ISplitCharacters;)[Z

    move-result-object v23

    .line 495
    .local v23, "startsEnds":[Z
    new-instance v2, Lcom/itextpdf/layout/layout/TextLayoutResult;

    move-object/from16 v27, v2

    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    move/from16 v63, v3

    .end local v3    # "nonBreakablePartMaxHeight":F
    .restart local v63    # "nonBreakablePartMaxHeight":F
    aget-object v3, v20, v19

    move-object/from16 v40, v4

    const/16 v22, 0x1

    .end local v4    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v40, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    aget-object v4, v20, v22

    move/from16 v43, v1

    .end local v1    # "initialLineTextPos":I
    .local v43, "initialLineTextPos":I
    const/4 v1, 0x3

    move-object/from16 v80, v5

    move-object/from16 v73, v6

    move/from16 v44, v10

    move/from16 v10, v34

    move-object/from16 v79, v40

    move/from16 v6, v63

    move-object v5, v0

    move-object/from16 v0, v27

    move-object/from16 v27, v13

    move/from16 v13, v35

    move/from16 v35, v12

    move/from16 v12, v24

    move/from16 v24, v43

    .end local v5    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .end local v34    # "nonBreakablePartMaxAscender":F
    .end local v40    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .end local v43    # "initialLineTextPos":I
    .end local v63    # "nonBreakablePartMaxHeight":F
    .local v6, "nonBreakablePartMaxHeight":F
    .local v10, "nonBreakablePartMaxAscender":F
    .local v12, "currentLineHeight":F
    .local v13, "nonBreakablePartMaxDescender":F
    .local v24, "initialLineTextPos":I
    .restart local v27    # "margins":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v35, "boldSimulationAddition":F
    .local v44, "firstCharacterWhichExceedsAllowedWidth":I
    .restart local v73    # "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    .local v79, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v80, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/layout/layout/TextLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 497
    move-object v1, v0

    move-object v0, v5

    invoke-virtual {v1, v14}, Lcom/itextpdf/layout/layout/TextLayoutResult;->setContainsPossibleBreak(Z)Lcom/itextpdf/layout/layout/TextLayoutResult;

    move-result-object v1

    aget-boolean v2, v23, v19

    .line 498
    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/layout/TextLayoutResult;->setStartsWithSplitCharacterWhiteSpace(Z)Lcom/itextpdf/layout/layout/TextLayoutResult;

    move-result-object v1

    aget-boolean v2, v23, v22

    .line 499
    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/layout/TextLayoutResult;->setEndsWithSplitCharacter(Z)Lcom/itextpdf/layout/layout/TextLayoutResult;

    move-result-object v1

    .line 495
    return-object v1

    .line 482
    .end local v20    # "splitResult":[Lcom/itextpdf/layout/renderer/TextRenderer;
    .end local v23    # "startsEnds":[Z
    .end local v24    # "initialLineTextPos":I
    .end local v44    # "firstCharacterWhichExceedsAllowedWidth":I
    .end local v73    # "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    .end local v79    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .end local v80    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v1, "currentLineHeight":F
    .restart local v3    # "nonBreakablePartMaxHeight":F
    .restart local v5    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v6, "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    .local v10, "firstCharacterWhichExceedsAllowedWidth":I
    .local v12, "boldSimulationAddition":F
    .local v13, "nonBreakablePartWidthWhichDoesNotExceedAllowedWidth":F
    .local v30, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v34    # "nonBreakablePartMaxAscender":F
    .local v35, "nonBreakablePartMaxDescender":F
    .local v40, "initialLineTextPos":I
    :cond_39
    move-object/from16 v80, v5

    move-object/from16 v73, v6

    move/from16 v44, v10

    move-object/from16 v79, v30

    move/from16 v10, v34

    move/from16 v24, v40

    move v6, v3

    move/from16 v30, v13

    move/from16 v13, v35

    move/from16 v35, v12

    move v12, v1

    .line 503
    .end local v1    # "currentLineHeight":F
    .end local v3    # "nonBreakablePartMaxHeight":F
    .end local v5    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .end local v34    # "nonBreakablePartMaxAscender":F
    .end local v40    # "initialLineTextPos":I
    .local v6, "nonBreakablePartMaxHeight":F
    .local v10, "nonBreakablePartMaxAscender":F
    .local v12, "currentLineHeight":F
    .local v13, "nonBreakablePartMaxDescender":F
    .restart local v24    # "initialLineTextPos":I
    .local v30, "nonBreakablePartWidthWhichDoesNotExceedAllowedWidth":F
    .local v35, "boldSimulationAddition":F
    .restart local v44    # "firstCharacterWhichExceedsAllowedWidth":I
    .restart local v73    # "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    .restart local v79    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v80    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    const/16 v34, 0x0

    .line 504
    .local v34, "wordSplit":Z
    const/16 v40, 0x0

    .line 506
    .local v40, "hyphenationApplied":Z
    if-eqz v56, :cond_42

    iget v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->indexOfFirstCharacterToBeForcedToOverflow:I

    const v2, 0x7fffffff

    if-ne v1, v2, :cond_42

    .line 507
    nop

    .line 557
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 507
    move/from16 v2, v54

    const/4 v4, -0x1

    .end local v54    # "nonBreakingHyphenRelatedChunkStart":I
    .local v2, "nonBreakingHyphenRelatedChunkStart":I
    if-ne v4, v2, :cond_40

    .line 508
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v3, v3, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    add-int/lit8 v4, v44, -0x1

    invoke-static {v7, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-direct {v0, v1, v7, v3, v4}, Lcom/itextpdf/layout/renderer/TextRenderer;->getWordBoundsForHyphenation(Lcom/itextpdf/io/font/otf/GlyphLine;III)[I

    move-result-object v54

    .line 509
    .local v54, "wordBounds":[I
    if-eqz v54, :cond_3f

    .line 510
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    aget v3, v54, v19

    const/16 v22, 0x1

    aget v4, v54, v22

    invoke-virtual {v1, v3, v4}, Lcom/itextpdf/io/font/otf/GlyphLine;->toUnicodeString(II)Ljava/lang/String;

    move-result-object v1

    .line 511
    .local v1, "word":Ljava/lang/String;
    move-object/from16 v3, v56

    .end local v56    # "hyphenationConfig":Lcom/itextpdf/layout/hyphenation/HyphenationConfig;
    .local v3, "hyphenationConfig":Lcom/itextpdf/layout/hyphenation/HyphenationConfig;
    invoke-virtual {v3, v1}, Lcom/itextpdf/layout/hyphenation/HyphenationConfig;->hyphenate(Ljava/lang/String;)Lcom/itextpdf/layout/hyphenation/Hyphenation;

    move-result-object v4

    .line 512
    .local v4, "hyph":Lcom/itextpdf/layout/hyphenation/Hyphenation;
    if-eqz v4, :cond_3e

    .line 513
    invoke-virtual {v4}, Lcom/itextpdf/layout/hyphenation/Hyphenation;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    .local v5, "i":I
    :goto_1e
    if-ltz v5, :cond_3d

    .line 514
    move/from16 v56, v14

    .end local v14    # "containsPossibleBreak":Z
    .local v56, "containsPossibleBreak":Z
    invoke-virtual {v4, v5}, Lcom/itextpdf/layout/hyphenation/Hyphenation;->getPreHyphenText(I)Ljava/lang/String;

    move-result-object v14

    .line 515
    .local v14, "pre":Ljava/lang/String;
    invoke-virtual {v4, v5}, Lcom/itextpdf/layout/hyphenation/Hyphenation;->getPostHyphenText(I)Ljava/lang/String;

    move-result-object v61

    .line 516
    .local v61, "pos":Ljava/lang/String;
    move-object/from16 v62, v1

    .end local v1    # "word":Ljava/lang/String;
    .local v62, "word":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v63, v2

    .end local v2    # "nonBreakingHyphenRelatedChunkStart":I
    .local v63, "nonBreakingHyphenRelatedChunkStart":I
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    move-object/from16 v70, v3

    .end local v3    # "hyphenationConfig":Lcom/itextpdf/layout/hyphenation/HyphenationConfig;
    .local v70, "hyphenationConfig":Lcom/itextpdf/layout/hyphenation/HyphenationConfig;
    aget v3, v54, v19

    .line 517
    invoke-virtual {v2, v7, v3}, Lcom/itextpdf/io/font/otf/GlyphLine;->toUnicodeString(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual/range {v70 .. v70}, Lcom/itextpdf/layout/hyphenation/HyphenationConfig;->getHyphenSymbol()C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->convertToGlyphLine(Ljava/lang/String;)Lcom/itextpdf/io/font/otf/GlyphLine;

    move-result-object v1

    invoke-virtual/range {v37 .. v37}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v2

    move-object/from16 v3, v47

    move-object/from16 v47, v4

    move-object/from16 v4, v59

    move/from16 v59, v5

    move-object v5, v3

    move/from16 v3, v32

    move-object/from16 v32, v14

    move/from16 v14, v63

    .end local v63    # "nonBreakingHyphenRelatedChunkStart":I
    .local v3, "hScale":F
    .local v4, "characterSpacing":Ljava/lang/Float;
    .local v5, "wordSpacing":Ljava/lang/Float;
    .local v14, "nonBreakingHyphenRelatedChunkStart":I
    .local v32, "pre":Ljava/lang/String;
    .local v47, "hyph":Lcom/itextpdf/layout/hyphenation/Hyphenation;
    .local v59, "i":I
    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/TextRenderer;->getGlyphLineWidth(Lcom/itextpdf/io/font/otf/GlyphLine;FFLjava/lang/Float;Ljava/lang/Float;)F

    move-result v1

    .line 518
    move/from16 v63, v3

    .end local v3    # "hScale":F
    .local v1, "currentHyphenationChoicePreTextWidth":F
    .local v63, "hScale":F
    add-float v2, v41, v1

    add-float/2addr v2, v15

    add-float v2, v2, v35

    invoke-virtual/range {v26 .. v26}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v3

    cmpg-float v2, v2, v3

    if-gtz v2, :cond_3c

    .line 519
    const/4 v2, 0x1

    .line 521
    .end local v40    # "hyphenationApplied":Z
    .local v2, "hyphenationApplied":Z
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v3, v3, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    move/from16 v40, v2

    const/4 v2, -0x1

    .end local v2    # "hyphenationApplied":Z
    .restart local v40    # "hyphenationApplied":Z
    if-ne v3, v2, :cond_3a

    .line 522
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iput v7, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .line 524
    :cond_3a
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v3, v3, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    aget v71, v54, v19

    invoke-virtual/range {v32 .. v32}, Ljava/lang/String;->length()I

    move-result v76

    move-object/from16 v78, v4

    .end local v4    # "characterSpacing":Ljava/lang/Float;
    .local v78, "characterSpacing":Ljava/lang/Float;
    add-int v4, v71, v76

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    iput v3, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    .line 525
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v3, v3, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    iget-object v4, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v4, v4, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/io/font/otf/GlyphLine;->copy(II)Lcom/itextpdf/io/font/otf/GlyphLine;

    move-result-object v2

    .line 526
    .local v2, "lineCopy":Lcom/itextpdf/io/font/otf/GlyphLine;
    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->font:Lcom/itextpdf/kernel/font/PdfFont;

    invoke-virtual/range {v70 .. v70}, Lcom/itextpdf/layout/hyphenation/HyphenationConfig;->getHyphenSymbol()C

    move-result v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/font/PdfFont;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/io/font/otf/GlyphLine;->add(Lcom/itextpdf/io/font/otf/Glyph;)V

    .line 527
    iget v3, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    const/16 v22, 0x1

    add-int/lit8 v3, v3, 0x1

    iput v3, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    .line 528
    iput-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 532
    invoke-static {v8, v10}, Ljava/lang/Math;->max(FF)F

    move-result v3

    .line 533
    .end local v8    # "currentLineAscender":F
    .local v3, "currentLineAscender":F
    invoke-static {v11, v13}, Ljava/lang/Math;->min(FF)F

    move-result v11

    .line 534
    invoke-static {v12, v6}, Ljava/lang/Math;->max(FF)F

    move-result v12

    .line 536
    add-float v41, v41, v1

    .line 537
    sget-object v4, Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;->ANYWHERE:Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;

    if-ne v4, v9, :cond_3b

    .line 538
    move-object v4, v2

    move v8, v3

    .end local v2    # "lineCopy":Lcom/itextpdf/io/font/otf/GlyphLine;
    .end local v3    # "currentLineAscender":F
    .local v4, "lineCopy":Lcom/itextpdf/io/font/otf/GlyphLine;
    .restart local v8    # "currentLineAscender":F
    float-to-double v2, v15

    move-wide/from16 v81, v2

    move/from16 v71, v7

    move/from16 v7, v35

    .end local v35    # "boldSimulationAddition":F
    .local v7, "boldSimulationAddition":F
    .restart local v71    # "currentTextPos":I
    float-to-double v2, v7

    add-double v2, v81, v2

    double-to-float v2, v2

    move-object/from16 v3, v80

    .end local v80    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v3, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    invoke-virtual {v3, v2}, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->updateMaxChildWidth(F)V

    move/from16 v76, v1

    move-object/from16 v35, v4

    move-object/from16 v80, v5

    goto :goto_1f

    .line 541
    .end local v4    # "lineCopy":Lcom/itextpdf/io/font/otf/GlyphLine;
    .end local v8    # "currentLineAscender":F
    .end local v71    # "currentTextPos":I
    .restart local v2    # "lineCopy":Lcom/itextpdf/io/font/otf/GlyphLine;
    .local v3, "currentLineAscender":F
    .local v7, "currentTextPos":I
    .restart local v35    # "boldSimulationAddition":F
    .restart local v80    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    :cond_3b
    move-object v4, v2

    move v8, v3

    move/from16 v71, v7

    move/from16 v7, v35

    move-object/from16 v3, v80

    .end local v2    # "lineCopy":Lcom/itextpdf/io/font/otf/GlyphLine;
    .end local v35    # "boldSimulationAddition":F
    .end local v80    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v3, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .restart local v4    # "lineCopy":Lcom/itextpdf/io/font/otf/GlyphLine;
    .local v7, "boldSimulationAddition":F
    .restart local v8    # "currentLineAscender":F
    .restart local v71    # "currentTextPos":I
    move-object/from16 v35, v4

    move-object v2, v5

    .end local v4    # "lineCopy":Lcom/itextpdf/io/font/otf/GlyphLine;
    .end local v5    # "wordSpacing":Ljava/lang/Float;
    .local v2, "wordSpacing":Ljava/lang/Float;
    .local v35, "lineCopy":Lcom/itextpdf/io/font/otf/GlyphLine;
    float-to-double v4, v1

    move-wide/from16 v80, v4

    float-to-double v4, v15

    add-double v4, v80, v4

    move-wide/from16 v80, v4

    float-to-double v4, v7

    add-double v4, v80, v4

    double-to-float v4, v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->updateMinChildWidth(F)V

    .line 545
    float-to-double v4, v1

    move/from16 v76, v1

    move-object/from16 v80, v2

    .end local v1    # "currentHyphenationChoicePreTextWidth":F
    .end local v2    # "wordSpacing":Ljava/lang/Float;
    .local v76, "currentHyphenationChoicePreTextWidth":F
    .local v80, "wordSpacing":Ljava/lang/Float;
    float-to-double v1, v15

    add-double/2addr v4, v1

    float-to-double v1, v7

    add-double/2addr v4, v1

    double-to-float v1, v4

    invoke-virtual {v3, v1}, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->updateMaxChildWidth(F)V

    .line 550
    :goto_1f
    aget v1, v54, v19

    invoke-virtual/range {v32 .. v32}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v1, v2

    .line 551
    .end local v71    # "currentTextPos":I
    .local v1, "currentTextPos":I
    goto/16 :goto_21

    .line 518
    .end local v3    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .end local v76    # "currentHyphenationChoicePreTextWidth":F
    .end local v78    # "characterSpacing":Ljava/lang/Float;
    .local v1, "currentHyphenationChoicePreTextWidth":F
    .local v4, "characterSpacing":Ljava/lang/Float;
    .restart local v5    # "wordSpacing":Ljava/lang/Float;
    .local v7, "currentTextPos":I
    .local v35, "boldSimulationAddition":F
    .local v80, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    :cond_3c
    move/from16 v76, v1

    move-object/from16 v78, v4

    move/from16 v71, v7

    move/from16 v7, v35

    move-object/from16 v3, v80

    move-object/from16 v80, v5

    .line 513
    .end local v1    # "currentHyphenationChoicePreTextWidth":F
    .end local v4    # "characterSpacing":Ljava/lang/Float;
    .end local v5    # "wordSpacing":Ljava/lang/Float;
    .end local v32    # "pre":Ljava/lang/String;
    .end local v35    # "boldSimulationAddition":F
    .end local v61    # "pos":Ljava/lang/String;
    .restart local v3    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v7, "boldSimulationAddition":F
    .restart local v71    # "currentTextPos":I
    .restart local v78    # "characterSpacing":Ljava/lang/Float;
    .local v80, "wordSpacing":Ljava/lang/Float;
    add-int/lit8 v5, v59, -0x1

    move v2, v14

    move-object/from16 v4, v47

    move/from16 v14, v56

    move-object/from16 v1, v62

    move/from16 v32, v63

    move/from16 v7, v71

    move-object/from16 v59, v78

    move-object/from16 v47, v80

    move-object/from16 v80, v3

    move-object/from16 v3, v70

    .end local v59    # "i":I
    .local v5, "i":I
    goto/16 :goto_1e

    .end local v56    # "containsPossibleBreak":Z
    .end local v62    # "word":Ljava/lang/String;
    .end local v63    # "hScale":F
    .end local v70    # "hyphenationConfig":Lcom/itextpdf/layout/hyphenation/HyphenationConfig;
    .end local v71    # "currentTextPos":I
    .end local v78    # "characterSpacing":Ljava/lang/Float;
    .local v1, "word":Ljava/lang/String;
    .local v2, "nonBreakingHyphenRelatedChunkStart":I
    .local v3, "hyphenationConfig":Lcom/itextpdf/layout/hyphenation/HyphenationConfig;
    .local v4, "hyph":Lcom/itextpdf/layout/hyphenation/Hyphenation;
    .local v7, "currentTextPos":I
    .local v14, "containsPossibleBreak":Z
    .local v32, "hScale":F
    .restart local v35    # "boldSimulationAddition":F
    .local v47, "wordSpacing":Ljava/lang/Float;
    .local v59, "characterSpacing":Ljava/lang/Float;
    .local v80, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    :cond_3d
    move-object/from16 v62, v1

    move-object/from16 v70, v3

    move/from16 v71, v7

    move/from16 v56, v14

    move/from16 v63, v32

    move/from16 v7, v35

    move-object/from16 v78, v59

    move-object/from16 v3, v80

    move v14, v2

    move/from16 v59, v5

    move-object/from16 v80, v47

    move-object/from16 v47, v4

    .end local v1    # "word":Ljava/lang/String;
    .end local v2    # "nonBreakingHyphenRelatedChunkStart":I
    .end local v4    # "hyph":Lcom/itextpdf/layout/hyphenation/Hyphenation;
    .end local v5    # "i":I
    .end local v32    # "hScale":F
    .end local v35    # "boldSimulationAddition":F
    .local v3, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v7, "boldSimulationAddition":F
    .local v14, "nonBreakingHyphenRelatedChunkStart":I
    .local v47, "hyph":Lcom/itextpdf/layout/hyphenation/Hyphenation;
    .restart local v56    # "containsPossibleBreak":Z
    .local v59, "i":I
    .restart local v62    # "word":Ljava/lang/String;
    .restart local v63    # "hScale":F
    .restart local v70    # "hyphenationConfig":Lcom/itextpdf/layout/hyphenation/HyphenationConfig;
    .restart local v71    # "currentTextPos":I
    .restart local v78    # "characterSpacing":Ljava/lang/Float;
    .local v80, "wordSpacing":Ljava/lang/Float;
    goto :goto_20

    .line 512
    .end local v56    # "containsPossibleBreak":Z
    .end local v62    # "word":Ljava/lang/String;
    .end local v63    # "hScale":F
    .end local v70    # "hyphenationConfig":Lcom/itextpdf/layout/hyphenation/HyphenationConfig;
    .end local v71    # "currentTextPos":I
    .end local v78    # "characterSpacing":Ljava/lang/Float;
    .restart local v1    # "word":Ljava/lang/String;
    .restart local v2    # "nonBreakingHyphenRelatedChunkStart":I
    .local v3, "hyphenationConfig":Lcom/itextpdf/layout/hyphenation/HyphenationConfig;
    .restart local v4    # "hyph":Lcom/itextpdf/layout/hyphenation/Hyphenation;
    .local v7, "currentTextPos":I
    .local v14, "containsPossibleBreak":Z
    .restart local v32    # "hScale":F
    .restart local v35    # "boldSimulationAddition":F
    .local v47, "wordSpacing":Ljava/lang/Float;
    .local v59, "characterSpacing":Ljava/lang/Float;
    .local v80, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    :cond_3e
    move-object/from16 v62, v1

    move-object/from16 v70, v3

    move/from16 v71, v7

    move/from16 v56, v14

    move/from16 v63, v32

    move/from16 v7, v35

    move-object/from16 v78, v59

    move-object/from16 v3, v80

    move v14, v2

    move-object/from16 v80, v47

    move-object/from16 v47, v4

    .end local v1    # "word":Ljava/lang/String;
    .end local v2    # "nonBreakingHyphenRelatedChunkStart":I
    .end local v4    # "hyph":Lcom/itextpdf/layout/hyphenation/Hyphenation;
    .end local v32    # "hScale":F
    .end local v35    # "boldSimulationAddition":F
    .end local v59    # "characterSpacing":Ljava/lang/Float;
    .local v3, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v7, "boldSimulationAddition":F
    .local v14, "nonBreakingHyphenRelatedChunkStart":I
    .local v47, "hyph":Lcom/itextpdf/layout/hyphenation/Hyphenation;
    .restart local v56    # "containsPossibleBreak":Z
    .restart local v62    # "word":Ljava/lang/String;
    .restart local v63    # "hScale":F
    .restart local v70    # "hyphenationConfig":Lcom/itextpdf/layout/hyphenation/HyphenationConfig;
    .restart local v71    # "currentTextPos":I
    .restart local v78    # "characterSpacing":Ljava/lang/Float;
    .local v80, "wordSpacing":Ljava/lang/Float;
    goto :goto_20

    .line 509
    .end local v3    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .end local v62    # "word":Ljava/lang/String;
    .end local v63    # "hScale":F
    .end local v70    # "hyphenationConfig":Lcom/itextpdf/layout/hyphenation/HyphenationConfig;
    .end local v71    # "currentTextPos":I
    .end local v78    # "characterSpacing":Ljava/lang/Float;
    .restart local v2    # "nonBreakingHyphenRelatedChunkStart":I
    .local v7, "currentTextPos":I
    .local v14, "containsPossibleBreak":Z
    .restart local v32    # "hScale":F
    .restart local v35    # "boldSimulationAddition":F
    .local v47, "wordSpacing":Ljava/lang/Float;
    .local v56, "hyphenationConfig":Lcom/itextpdf/layout/hyphenation/HyphenationConfig;
    .restart local v59    # "characterSpacing":Ljava/lang/Float;
    .local v80, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    :cond_3f
    move/from16 v71, v7

    move/from16 v63, v32

    move/from16 v7, v35

    move-object/from16 v70, v56

    move-object/from16 v78, v59

    move-object/from16 v3, v80

    move/from16 v56, v14

    move-object/from16 v80, v47

    move v14, v2

    .line 556
    .end local v2    # "nonBreakingHyphenRelatedChunkStart":I
    .end local v32    # "hScale":F
    .end local v35    # "boldSimulationAddition":F
    .end local v47    # "wordSpacing":Ljava/lang/Float;
    .end local v54    # "wordBounds":[I
    .end local v59    # "characterSpacing":Ljava/lang/Float;
    .restart local v3    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v7, "boldSimulationAddition":F
    .local v14, "nonBreakingHyphenRelatedChunkStart":I
    .local v56, "containsPossibleBreak":Z
    .restart local v63    # "hScale":F
    .restart local v70    # "hyphenationConfig":Lcom/itextpdf/layout/hyphenation/HyphenationConfig;
    .restart local v71    # "currentTextPos":I
    .restart local v78    # "characterSpacing":Ljava/lang/Float;
    .local v80, "wordSpacing":Ljava/lang/Float;
    :goto_20
    move/from16 v1, v71

    .end local v71    # "currentTextPos":I
    .local v1, "currentTextPos":I
    :goto_21
    goto :goto_22

    .line 557
    .end local v1    # "currentTextPos":I
    .end local v3    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .end local v63    # "hScale":F
    .end local v70    # "hyphenationConfig":Lcom/itextpdf/layout/hyphenation/HyphenationConfig;
    .end local v78    # "characterSpacing":Ljava/lang/Float;
    .restart local v2    # "nonBreakingHyphenRelatedChunkStart":I
    .local v7, "currentTextPos":I
    .local v14, "containsPossibleBreak":Z
    .restart local v32    # "hScale":F
    .restart local v35    # "boldSimulationAddition":F
    .restart local v47    # "wordSpacing":Ljava/lang/Float;
    .local v56, "hyphenationConfig":Lcom/itextpdf/layout/hyphenation/HyphenationConfig;
    .restart local v59    # "characterSpacing":Ljava/lang/Float;
    .local v80, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    :cond_40
    move/from16 v71, v7

    move/from16 v63, v32

    move/from16 v7, v35

    move-object/from16 v70, v56

    move-object/from16 v78, v59

    move-object/from16 v3, v80

    move/from16 v56, v14

    move-object/from16 v80, v47

    move v14, v2

    .end local v2    # "nonBreakingHyphenRelatedChunkStart":I
    .end local v32    # "hScale":F
    .end local v35    # "boldSimulationAddition":F
    .end local v47    # "wordSpacing":Ljava/lang/Float;
    .end local v59    # "characterSpacing":Ljava/lang/Float;
    .restart local v3    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v7, "boldSimulationAddition":F
    .local v14, "nonBreakingHyphenRelatedChunkStart":I
    .local v56, "containsPossibleBreak":Z
    .restart local v63    # "hScale":F
    .restart local v70    # "hyphenationConfig":Lcom/itextpdf/layout/hyphenation/HyphenationConfig;
    .restart local v71    # "currentTextPos":I
    .restart local v78    # "characterSpacing":Ljava/lang/Float;
    .local v80, "wordSpacing":Ljava/lang/Float;
    iget v1, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    if-ne v1, v14, :cond_41

    .line 558
    const/16 v65, 0x0

    .line 559
    add-int/lit8 v1, v42, 0x1

    move/from16 v44, v1

    move/from16 v1, v71

    .end local v44    # "firstCharacterWhichExceedsAllowedWidth":I
    .local v1, "firstCharacterWhichExceedsAllowedWidth":I
    goto :goto_22

    .line 561
    .end local v1    # "firstCharacterWhichExceedsAllowedWidth":I
    .restart local v44    # "firstCharacterWhichExceedsAllowedWidth":I
    :cond_41
    move v1, v14

    .line 562
    .end local v44    # "firstCharacterWhichExceedsAllowedWidth":I
    .restart local v1    # "firstCharacterWhichExceedsAllowedWidth":I
    sub-float v21, v21, v65

    .line 563
    move/from16 v2, v67

    .line 564
    .end local v10    # "nonBreakablePartMaxAscender":F
    .local v2, "nonBreakablePartMaxAscender":F
    move/from16 v4, v68

    move/from16 v44, v1

    move v10, v2

    move v13, v4

    move/from16 v1, v71

    .end local v13    # "nonBreakablePartMaxDescender":F
    .local v4, "nonBreakablePartMaxDescender":F
    goto :goto_22

    .line 506
    .end local v1    # "firstCharacterWhichExceedsAllowedWidth":I
    .end local v2    # "nonBreakablePartMaxAscender":F
    .end local v3    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .end local v4    # "nonBreakablePartMaxDescender":F
    .end local v63    # "hScale":F
    .end local v70    # "hyphenationConfig":Lcom/itextpdf/layout/hyphenation/HyphenationConfig;
    .end local v71    # "currentTextPos":I
    .end local v78    # "characterSpacing":Ljava/lang/Float;
    .local v7, "currentTextPos":I
    .restart local v10    # "nonBreakablePartMaxAscender":F
    .restart local v13    # "nonBreakablePartMaxDescender":F
    .local v14, "containsPossibleBreak":Z
    .restart local v32    # "hScale":F
    .restart local v35    # "boldSimulationAddition":F
    .restart local v44    # "firstCharacterWhichExceedsAllowedWidth":I
    .restart local v47    # "wordSpacing":Ljava/lang/Float;
    .local v54, "nonBreakingHyphenRelatedChunkStart":I
    .local v56, "hyphenationConfig":Lcom/itextpdf/layout/hyphenation/HyphenationConfig;
    .restart local v59    # "characterSpacing":Ljava/lang/Float;
    .local v80, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    :cond_42
    move/from16 v71, v7

    move/from16 v63, v32

    move/from16 v7, v35

    move-object/from16 v70, v56

    move-object/from16 v78, v59

    move-object/from16 v3, v80

    move/from16 v56, v14

    move-object/from16 v80, v47

    move/from16 v14, v54

    .line 569
    .end local v32    # "hScale":F
    .end local v35    # "boldSimulationAddition":F
    .end local v47    # "wordSpacing":Ljava/lang/Float;
    .end local v54    # "nonBreakingHyphenRelatedChunkStart":I
    .end local v59    # "characterSpacing":Ljava/lang/Float;
    .restart local v3    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v7, "boldSimulationAddition":F
    .local v14, "nonBreakingHyphenRelatedChunkStart":I
    .local v56, "containsPossibleBreak":Z
    .restart local v63    # "hScale":F
    .restart local v70    # "hyphenationConfig":Lcom/itextpdf/layout/hyphenation/HyphenationConfig;
    .restart local v71    # "currentTextPos":I
    .restart local v78    # "characterSpacing":Ljava/lang/Float;
    .local v80, "wordSpacing":Ljava/lang/Float;
    move/from16 v1, v71

    .end local v71    # "currentTextPos":I
    .local v1, "currentTextPos":I
    :goto_22
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->textContainsSpecialScriptGlyphs(Z)Z

    move-result v4

    if-eqz v4, :cond_43

    if-nez v55, :cond_43

    .line 570
    invoke-static/range {v16 .. v16}, Lcom/itextpdf/layout/renderer/TextRenderer;->isOverflowFit(Lcom/itextpdf/layout/properties/OverflowPropertyValue;)Z

    move-result v2

    if-eqz v2, :cond_43

    const/4 v2, 0x1

    goto :goto_23

    :cond_43
    move/from16 v2, v19

    :goto_23
    move/from16 v32, v2

    .line 571
    .local v32, "specialScriptWordSplit":Z
    invoke-virtual/range {v26 .. v26}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    cmpl-float v2, v21, v2

    if-lez v2, :cond_44

    if-nez v31, :cond_44

    if-eqz v40, :cond_46

    :cond_44
    if-nez v18, :cond_46

    const/4 v4, -0x1

    if-ne v4, v14, :cond_46

    if-eqz v32, :cond_45

    goto :goto_24

    :cond_45
    move/from16 v35, v11

    move v11, v8

    move/from16 v8, v30

    move/from16 v30, v12

    move/from16 v12, v35

    move/from16 v35, v1

    move/from16 v54, v14

    move-object/from16 v59, v78

    move-object/from16 v47, v80

    move-object v14, v3

    goto/16 :goto_2a

    .line 578
    :cond_46
    :goto_24
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v2, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    const/4 v4, -0x1

    if-ne v2, v4, :cond_47

    .line 579
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iput v1, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .line 581
    :cond_47
    if-nez v53, :cond_4a

    .line 582
    if-nez v18, :cond_49

    invoke-static/range {v16 .. v16}, Lcom/itextpdf/layout/renderer/TextRenderer;->isOverflowFit(Lcom/itextpdf/layout/properties/OverflowPropertyValue;)Z

    move-result v2

    if-nez v2, :cond_49

    if-eqz v32, :cond_48

    goto :goto_25

    :cond_48
    add-int/lit8 v2, v60, 0x1

    goto :goto_26

    :cond_49
    :goto_25
    move/from16 v2, v44

    :goto_26
    move v1, v2

    .line 584
    :cond_4a
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget-object v4, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v4, v4, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v4

    iput v4, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    .line 585
    if-nez v18, :cond_4b

    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v2, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-eq v2, v1, :cond_4b

    const/4 v2, 0x1

    goto :goto_27

    :cond_4b
    move/from16 v2, v19

    :goto_27
    move/from16 v34, v2

    .line 586
    if-nez v34, :cond_4d

    if-nez v18, :cond_4c

    invoke-static/range {v16 .. v16}, Lcom/itextpdf/layout/renderer/TextRenderer;->isOverflowFit(Lcom/itextpdf/layout/properties/OverflowPropertyValue;)Z

    move-result v2

    if-nez v2, :cond_4c

    move/from16 v35, v1

    move/from16 v54, v14

    move-object/from16 v59, v78

    move-object/from16 v47, v80

    move-object v14, v3

    goto :goto_28

    .line 608
    :cond_4c
    move/from16 v8, v50

    .line 609
    move/from16 v11, v77

    .line 610
    sub-float v2, v8, v11

    .line 611
    invoke-virtual/range {v37 .. v37}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v4

    mul-float/2addr v2, v4

    .line 610
    invoke-static {v2}, Lcom/itextpdf/io/font/FontProgram;->convertTextSpaceToGlyphSpace(F)F

    move-result v2

    add-float v12, v2, v29

    .line 612
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget-object v4, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v4, v4, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .line 613
    invoke-virtual {v2, v4}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v2

    move v4, v1

    move-object v1, v2

    .end local v1    # "currentTextPos":I
    .local v4, "currentTextPos":I
    invoke-virtual/range {v37 .. v37}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v2

    move-object v5, v3

    .end local v3    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v5, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    invoke-static/range {v63 .. v63}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    move/from16 v35, v4

    move/from16 v54, v14

    move-object/from16 v4, v78

    move-object v14, v5

    move-object/from16 v5, v80

    .end local v78    # "characterSpacing":Ljava/lang/Float;
    .end local v80    # "wordSpacing":Ljava/lang/Float;
    .local v4, "characterSpacing":Ljava/lang/Float;
    .local v5, "wordSpacing":Ljava/lang/Float;
    .local v14, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v35, "currentTextPos":I
    .restart local v54    # "nonBreakingHyphenRelatedChunkStart":I
    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/layout/renderer/TextRenderer;->getCharWidth(Lcom/itextpdf/io/font/otf/Glyph;FLjava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;)F

    move-result v1

    .line 612
    move-object/from16 v59, v4

    move-object/from16 v47, v5

    .end local v4    # "characterSpacing":Ljava/lang/Float;
    .end local v5    # "wordSpacing":Ljava/lang/Float;
    .restart local v47    # "wordSpacing":Ljava/lang/Float;
    .restart local v59    # "characterSpacing":Ljava/lang/Float;
    invoke-static {v1}, Lcom/itextpdf/io/font/FontProgram;->convertTextSpaceToGlyphSpace(F)F

    move-result v1

    add-float v41, v41, v1

    move/from16 v87, v11

    move v11, v8

    move/from16 v8, v30

    move/from16 v30, v12

    move/from16 v12, v87

    goto :goto_2a

    .line 586
    .end local v35    # "currentTextPos":I
    .end local v47    # "wordSpacing":Ljava/lang/Float;
    .end local v54    # "nonBreakingHyphenRelatedChunkStart":I
    .end local v59    # "characterSpacing":Ljava/lang/Float;
    .restart local v1    # "currentTextPos":I
    .restart local v3    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v14, "nonBreakingHyphenRelatedChunkStart":I
    .restart local v78    # "characterSpacing":Ljava/lang/Float;
    .restart local v80    # "wordSpacing":Ljava/lang/Float;
    :cond_4d
    move/from16 v35, v1

    move/from16 v54, v14

    move-object/from16 v59, v78

    move-object/from16 v47, v80

    move-object v14, v3

    .line 587
    .end local v1    # "currentTextPos":I
    .end local v3    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .end local v78    # "characterSpacing":Ljava/lang/Float;
    .end local v80    # "wordSpacing":Ljava/lang/Float;
    .local v14, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .restart local v35    # "currentTextPos":I
    .restart local v47    # "wordSpacing":Ljava/lang/Float;
    .restart local v54    # "nonBreakingHyphenRelatedChunkStart":I
    .restart local v59    # "characterSpacing":Ljava/lang/Float;
    :goto_28
    invoke-static {v8, v10}, Ljava/lang/Math;->max(FF)F

    move-result v1

    .line 588
    .end local v8    # "currentLineAscender":F
    .local v1, "currentLineAscender":F
    invoke-static {v11, v13}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 589
    .end local v11    # "currentLineDescender":F
    .local v2, "currentLineDescender":F
    invoke-static {v12, v6}, Ljava/lang/Math;->max(FF)F

    move-result v3

    .line 590
    .end local v12    # "currentLineHeight":F
    .local v3, "currentLineHeight":F
    add-float v41, v41, v30

    .line 591
    sget-object v4, Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;->ANYWHERE:Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;

    if-ne v4, v9, :cond_4e

    .line 592
    float-to-double v4, v15

    float-to-double v11, v7

    add-double/2addr v4, v11

    double-to-float v4, v4

    invoke-virtual {v14, v4}, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->updateMaxChildWidth(F)V

    move v11, v1

    move v12, v2

    move/from16 v8, v30

    move/from16 v30, v3

    goto :goto_2a

    .line 595
    :cond_4e
    move/from16 v8, v30

    .end local v30    # "nonBreakablePartWidthWhichDoesNotExceedAllowedWidth":F
    .local v8, "nonBreakablePartWidthWhichDoesNotExceedAllowedWidth":F
    float-to-double v4, v8

    float-to-double v11, v15

    add-double/2addr v4, v11

    float-to-double v11, v7

    add-double/2addr v4, v11

    double-to-float v4, v4

    .line 598
    .local v4, "childMinWidth":F
    cmpl-float v5, v39, v64

    if-nez v5, :cond_4f

    .line 599
    move/from16 v39, v4

    goto :goto_29

    .line 601
    :cond_4f
    move/from16 v46, v4

    .line 603
    :goto_29
    invoke-virtual {v14, v4}, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->updateMinChildWidth(F)V

    .line 604
    invoke-virtual {v14, v4}, Lcom/itextpdf/layout/renderer/AbstractWidthHandler;->updateMaxChildWidth(F)V

    .line 605
    .end local v4    # "childMinWidth":F
    move v11, v1

    move v12, v2

    move/from16 v30, v3

    .line 617
    .end local v1    # "currentLineAscender":F
    .end local v2    # "currentLineDescender":F
    .end local v3    # "currentLineHeight":F
    .local v11, "currentLineAscender":F
    .local v12, "currentLineDescender":F
    .local v30, "currentLineHeight":F
    :goto_2a
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v1, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v2, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    if-gt v1, v2, :cond_50

    .line 618
    move-object/from16 v1, v73

    .end local v73    # "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    .local v1, "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->isStartsWithSplitCharWhiteSpaceAndEndsWithSplitChar(Lcom/itextpdf/layout/splitting/ISplitCharacters;)[Z

    move-result-object v20

    .line 619
    .local v20, "startsEnds":[Z
    new-instance v2, Lcom/itextpdf/layout/layout/TextLayoutResult;

    move-object v3, v2

    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    move-object v0, v3

    const/4 v3, 0x0

    .end local v1    # "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    .restart local v73    # "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    const/4 v1, 0x3

    move-object/from16 v5, p0

    move/from16 v4, v34

    move/from16 v34, v7

    move v7, v4

    move-object/from16 v4, p0

    move/from16 v43, v6

    move-object/from16 v6, v73

    .end local v73    # "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    .local v6, "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    .local v7, "wordSplit":Z
    .local v34, "boldSimulationAddition":F
    .local v43, "nonBreakablePartMaxHeight":F
    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/layout/layout/TextLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 621
    move-object v3, v0

    move-object v0, v4

    move/from16 v1, v56

    .end local v56    # "containsPossibleBreak":Z
    .local v1, "containsPossibleBreak":Z
    invoke-virtual {v3, v1}, Lcom/itextpdf/layout/layout/TextLayoutResult;->setContainsPossibleBreak(Z)Lcom/itextpdf/layout/layout/TextLayoutResult;

    move-result-object v2

    aget-boolean v3, v20, v19

    .line 622
    invoke-virtual {v2, v3}, Lcom/itextpdf/layout/layout/TextLayoutResult;->setStartsWithSplitCharacterWhiteSpace(Z)Lcom/itextpdf/layout/layout/TextLayoutResult;

    move-result-object v2

    const/16 v22, 0x1

    aget-boolean v3, v20, v22

    .line 623
    invoke-virtual {v2, v3}, Lcom/itextpdf/layout/layout/TextLayoutResult;->setEndsWithSplitCharacter(Z)Lcom/itextpdf/layout/layout/TextLayoutResult;

    move-result-object v2

    .line 619
    return-object v2

    .line 625
    .end local v1    # "containsPossibleBreak":Z
    .end local v20    # "startsEnds":[Z
    .end local v43    # "nonBreakablePartMaxHeight":F
    .local v6, "nonBreakablePartMaxHeight":F
    .local v7, "boldSimulationAddition":F
    .local v34, "wordSplit":Z
    .restart local v56    # "containsPossibleBreak":Z
    .restart local v73    # "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    :cond_50
    move/from16 v1, v34

    move/from16 v34, v7

    move v7, v1

    move/from16 v43, v6

    move/from16 v1, v56

    move-object/from16 v6, v73

    .end local v56    # "containsPossibleBreak":Z
    .end local v73    # "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    .restart local v1    # "containsPossibleBreak":Z
    .local v6, "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    .local v7, "wordSplit":Z
    .local v34, "boldSimulationAddition":F
    .restart local v43    # "nonBreakablePartMaxHeight":F
    new-instance v2, Lcom/itextpdf/layout/layout/TextLayoutResult;

    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    const/4 v4, 0x0

    const/4 v5, 0x2

    invoke-direct {v2, v5, v3, v4, v4}, Lcom/itextpdf/layout/layout/TextLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 627
    invoke-virtual {v2, v7}, Lcom/itextpdf/layout/layout/TextLayoutResult;->setWordHasBeenSplit(Z)Lcom/itextpdf/layout/layout/TextLayoutResult;

    move-result-object v2

    .line 628
    invoke-virtual {v2, v1}, Lcom/itextpdf/layout/layout/TextLayoutResult;->setContainsPossibleBreak(Z)Lcom/itextpdf/layout/layout/TextLayoutResult;

    move-result-object v48

    .line 631
    move/from16 v54, v1

    move v8, v11

    move v11, v12

    move/from16 v12, v30

    move/from16 v7, v35

    move/from16 v21, v46

    move-object/from16 v13, v49

    move-object/from16 v49, v72

    move/from16 v10, v41

    goto :goto_2b

    .line 282
    .end local v10    # "nonBreakablePartMaxAscender":F
    .end local v24    # "initialLineTextPos":I
    .end local v43    # "nonBreakablePartMaxHeight":F
    .end local v47    # "wordSpacing":Ljava/lang/Float;
    .end local v59    # "characterSpacing":Ljava/lang/Float;
    .end local v60    # "nonBreakablePartEnd":I
    .end local v63    # "hScale":F
    .end local v65    # "nonBreakingHyphenRelatedChunkWidth":F
    .end local v66    # "leftMarginBorderPadding":[F
    .end local v67    # "beforeNonBreakingHyphenRelatedChunkMaxAscender":F
    .end local v68    # "beforeNonBreakingHyphenRelatedChunkMaxDescender":F
    .end local v69    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .end local v70    # "hyphenationConfig":Lcom/itextpdf/layout/hyphenation/HyphenationConfig;
    .end local v72    # "tabAnchorCharacter":Ljava/lang/Character;
    .end local v74    # "countedMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .end local v75    # "firstPrintPos":I
    .end local v77    # "descender":F
    .end local v79    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v1, "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    .local v2, "currentTextPos":I
    .local v4, "characterSpacing":Ljava/lang/Float;
    .restart local v5    # "wordSpacing":Ljava/lang/Float;
    .local v6, "firstPrintPos":I
    .local v7, "currentLineAscender":F
    .local v8, "leftMarginBorderPadding":[F
    .local v11, "currentLineDescender":F
    .local v12, "currentLineHeight":F
    .local v13, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v14, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v15, "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .local v21, "rightMinWidth":F
    .local v25, "margins":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v26, "borders":[Lcom/itextpdf/layout/borders/Border;
    .local v27, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v28, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v30, "countedMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .local v32, "hScale":F
    .local v34, "italicSkewAddition":F
    .local v35, "boldSimulationAddition":F
    .local v40, "initialLineTextPos":I
    .local v44, "ascender":F
    .local v46, "wordBreakGlyphAtLineEnding":Lcom/itextpdf/io/font/otf/Glyph;
    .local v49, "tabAnchorCharacter":Ljava/lang/Character;
    .local v50, "descender":F
    .local v54, "containsPossibleBreak":Z
    .local v56, "hyphenationConfig":Lcom/itextpdf/layout/hyphenation/HyphenationConfig;
    :cond_51
    move/from16 v71, v2

    move-object/from16 v59, v4

    move-object/from16 v47, v5

    move/from16 v75, v6

    move-object/from16 v66, v8

    move-object/from16 v69, v14

    move-object/from16 v79, v27

    move-object/from16 v14, v28

    move-object/from16 v74, v30

    move/from16 v63, v32

    move/from16 v24, v40

    move/from16 v77, v50

    move-object/from16 v70, v56

    const/4 v4, 0x0

    const/high16 v64, -0x40800000    # -1.0f

    move-object v6, v1

    move v8, v7

    move-object/from16 v27, v25

    move-object/from16 v28, v26

    move/from16 v50, v44

    move-object/from16 v26, v13

    move-object/from16 v25, v15

    move/from16 v15, v34

    move/from16 v34, v35

    .end local v1    # "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    .end local v2    # "currentTextPos":I
    .end local v4    # "characterSpacing":Ljava/lang/Float;
    .end local v5    # "wordSpacing":Ljava/lang/Float;
    .end local v7    # "currentLineAscender":F
    .end local v13    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v30    # "countedMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .end local v32    # "hScale":F
    .end local v35    # "boldSimulationAddition":F
    .end local v40    # "initialLineTextPos":I
    .end local v44    # "ascender":F
    .end local v56    # "hyphenationConfig":Lcom/itextpdf/layout/hyphenation/HyphenationConfig;
    .local v6, "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    .local v8, "currentLineAscender":F
    .local v14, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v15, "italicSkewAddition":F
    .restart local v24    # "initialLineTextPos":I
    .local v25, "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .local v26, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v27, "margins":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v28, "borders":[Lcom/itextpdf/layout/borders/Border;
    .local v34, "boldSimulationAddition":F
    .restart local v47    # "wordSpacing":Ljava/lang/Float;
    .local v50, "ascender":F
    .restart local v59    # "characterSpacing":Ljava/lang/Float;
    .restart local v63    # "hScale":F
    .restart local v66    # "leftMarginBorderPadding":[F
    .restart local v69    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .restart local v70    # "hyphenationConfig":Lcom/itextpdf/layout/hyphenation/HyphenationConfig;
    .restart local v71    # "currentTextPos":I
    .restart local v74    # "countedMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .restart local v75    # "firstPrintPos":I
    .restart local v77    # "descender":F
    .restart local v79    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    move-object/from16 v13, v46

    move/from16 v7, v71

    move/from16 v10, v41

    .line 636
    .end local v41    # "currentLineWidth":F
    .end local v46    # "wordBreakGlyphAtLineEnding":Lcom/itextpdf/io/font/otf/Glyph;
    .end local v71    # "currentTextPos":I
    .local v7, "currentTextPos":I
    .local v10, "currentLineWidth":F
    .local v13, "wordBreakGlyphAtLineEnding":Lcom/itextpdf/io/font/otf/Glyph;
    :goto_2b
    const/16 v30, 0x0

    .line 637
    .local v30, "isPlacingForcedWhileNothing":Z
    invoke-virtual/range {v26 .. v26}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    cmpl-float v1, v12, v1

    if-lez v1, :cond_53

    .line 638
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v2, 0x1a

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPropertyAsBoolean(I)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_52

    invoke-static/range {v51 .. v51}, Lcom/itextpdf/layout/renderer/TextRenderer;->isOverflowFit(Lcom/itextpdf/layout/properties/OverflowPropertyValue;)Z

    move-result v1

    if-eqz v1, :cond_52

    .line 639
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    move-object/from16 v2, v79

    const/4 v3, 0x1

    .end local v79    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v2, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {v0, v1, v2, v3}, Lcom/itextpdf/layout/renderer/TextRenderer;->applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/properties/UnitValue;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 640
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    move-object/from16 v4, v28

    .end local v28    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .local v4, "borders":[Lcom/itextpdf/layout/borders/Border;
    invoke-virtual {v0, v1, v4, v3}, Lcom/itextpdf/layout/renderer/TextRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/borders/Border;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 641
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    move-object/from16 v5, v27

    .end local v27    # "margins":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v5, "margins":[Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {v0, v1, v5, v3}, Lcom/itextpdf/layout/renderer/TextRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/properties/UnitValue;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 642
    invoke-virtual {v0, v6}, Lcom/itextpdf/layout/renderer/TextRenderer;->isStartsWithSplitCharWhiteSpaceAndEndsWithSplitChar(Lcom/itextpdf/layout/splitting/ISplitCharacters;)[Z

    move-result-object v20

    .line 643
    .restart local v20    # "startsEnds":[Z
    new-instance v1, Lcom/itextpdf/layout/layout/TextLayoutResult;

    .end local v2    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v79    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    const/4 v3, 0x0

    move-object v0, v1

    const/4 v1, 0x3

    .end local v5    # "margins":[Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v27    # "margins":[Lcom/itextpdf/layout/properties/UnitValue;
    move-object/from16 v5, p0

    move-object/from16 v28, v27

    move-object/from16 v27, v9

    move-object/from16 v9, v28

    move-object/from16 v73, v6

    move/from16 v28, v8

    move/from16 v32, v11

    move-object/from16 v80, v14

    move/from16 v35, v15

    move-object/from16 v8, v48

    move/from16 v15, v54

    move/from16 v6, v55

    move-object/from16 v14, v79

    move-object v11, v4

    move-object/from16 v4, p0

    .end local v4    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .end local v48    # "result":Lcom/itextpdf/layout/layout/TextLayoutResult;
    .end local v54    # "containsPossibleBreak":Z
    .end local v55    # "isSplitForcedByNewLine":Z
    .end local v79    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v6, "isSplitForcedByNewLine":Z
    .local v8, "result":Lcom/itextpdf/layout/layout/TextLayoutResult;
    .local v9, "margins":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v11, "borders":[Lcom/itextpdf/layout/borders/Border;
    .local v14, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v15, "containsPossibleBreak":Z
    .local v27, "overflowWrap":Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;
    .local v28, "currentLineAscender":F
    .local v32, "currentLineDescender":F
    .local v35, "italicSkewAddition":F
    .restart local v73    # "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    .local v80, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/layout/layout/TextLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 645
    move-object v1, v0

    move-object v0, v4

    invoke-virtual {v1, v15}, Lcom/itextpdf/layout/layout/TextLayoutResult;->setContainsPossibleBreak(Z)Lcom/itextpdf/layout/layout/TextLayoutResult;

    move-result-object v1

    aget-boolean v2, v20, v19

    .line 646
    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/layout/TextLayoutResult;->setStartsWithSplitCharacterWhiteSpace(Z)Lcom/itextpdf/layout/layout/TextLayoutResult;

    move-result-object v1

    const/16 v22, 0x1

    aget-boolean v2, v20, v22

    .line 647
    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/layout/TextLayoutResult;->setEndsWithSplitCharacter(Z)Lcom/itextpdf/layout/layout/TextLayoutResult;

    move-result-object v1

    .line 643
    return-object v1

    .line 638
    .end local v20    # "startsEnds":[Z
    .end local v32    # "currentLineDescender":F
    .end local v35    # "italicSkewAddition":F
    .end local v73    # "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    .end local v80    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v6, "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    .local v8, "currentLineAscender":F
    .local v9, "overflowWrap":Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;
    .local v11, "currentLineDescender":F
    .local v14, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v15, "italicSkewAddition":F
    .local v27, "margins":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v28, "borders":[Lcom/itextpdf/layout/borders/Border;
    .restart local v48    # "result":Lcom/itextpdf/layout/layout/TextLayoutResult;
    .restart local v54    # "containsPossibleBreak":Z
    .restart local v55    # "isSplitForcedByNewLine":Z
    .restart local v79    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    :cond_52
    move-object/from16 v32, v27

    move-object/from16 v27, v9

    move-object/from16 v9, v32

    move-object/from16 v73, v6

    move/from16 v32, v11

    move-object/from16 v80, v14

    move/from16 v35, v15

    move-object/from16 v11, v28

    move/from16 v15, v54

    move/from16 v6, v55

    move-object/from16 v14, v79

    move/from16 v28, v8

    move-object/from16 v8, v48

    .line 649
    .end local v48    # "result":Lcom/itextpdf/layout/layout/TextLayoutResult;
    .end local v54    # "containsPossibleBreak":Z
    .end local v55    # "isSplitForcedByNewLine":Z
    .end local v79    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v6, "isSplitForcedByNewLine":Z
    .local v8, "result":Lcom/itextpdf/layout/layout/TextLayoutResult;
    .local v9, "margins":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v11, "borders":[Lcom/itextpdf/layout/borders/Border;
    .local v14, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v15, "containsPossibleBreak":Z
    .local v27, "overflowWrap":Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;
    .local v28, "currentLineAscender":F
    .restart local v32    # "currentLineDescender":F
    .restart local v35    # "italicSkewAddition":F
    .restart local v73    # "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    .restart local v80    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    const/16 v30, 0x1

    goto :goto_2c

    .line 637
    .end local v32    # "currentLineDescender":F
    .end local v35    # "italicSkewAddition":F
    .end local v73    # "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    .end local v80    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v6, "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    .local v8, "currentLineAscender":F
    .local v9, "overflowWrap":Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;
    .local v11, "currentLineDescender":F
    .local v14, "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    .local v15, "italicSkewAddition":F
    .local v27, "margins":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v28, "borders":[Lcom/itextpdf/layout/borders/Border;
    .restart local v48    # "result":Lcom/itextpdf/layout/layout/TextLayoutResult;
    .restart local v54    # "containsPossibleBreak":Z
    .restart local v55    # "isSplitForcedByNewLine":Z
    .restart local v79    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    :cond_53
    move-object/from16 v32, v27

    move-object/from16 v27, v9

    move-object/from16 v9, v32

    move-object/from16 v73, v6

    move/from16 v32, v11

    move-object/from16 v80, v14

    move/from16 v35, v15

    move-object/from16 v11, v28

    move/from16 v15, v54

    move/from16 v6, v55

    move-object/from16 v14, v79

    move/from16 v28, v8

    move-object/from16 v8, v48

    .line 653
    .end local v48    # "result":Lcom/itextpdf/layout/layout/TextLayoutResult;
    .end local v54    # "containsPossibleBreak":Z
    .end local v55    # "isSplitForcedByNewLine":Z
    .end local v79    # "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v6, "isSplitForcedByNewLine":Z
    .local v8, "result":Lcom/itextpdf/layout/layout/TextLayoutResult;
    .local v9, "margins":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v11, "borders":[Lcom/itextpdf/layout/borders/Border;
    .local v14, "paddings":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v15, "containsPossibleBreak":Z
    .local v27, "overflowWrap":Lcom/itextpdf/layout/properties/OverflowWrapPropertyValue;
    .local v28, "currentLineAscender":F
    .restart local v32    # "currentLineDescender":F
    .restart local v35    # "italicSkewAddition":F
    .restart local v73    # "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    .restart local v80    # "widthHandler":Lcom/itextpdf/layout/renderer/AbstractWidthHandler;
    :goto_2c
    invoke-virtual/range {v37 .. v37}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v1

    mul-float v1, v1, v28

    invoke-static {v1}, Lcom/itextpdf/io/font/FontProgram;->convertTextSpaceToGlyphSpace(F)F

    move-result v1

    iput v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->yLineOffset:F

    .line 655
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1, v12}, Lcom/itextpdf/kernel/geom/Rectangle;->moveDown(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 656
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v2

    add-float/2addr v2, v12

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 658
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    iget-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    invoke-static {v2, v10}, Ljava/lang/Math;->max(FF)F

    move-result v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 659
    invoke-virtual/range {v36 .. v36}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    sub-float/2addr v1, v12

    move-object/from16 v2, v26

    .end local v26    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v2, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/geom/Rectangle;->setHeight(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 661
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    iget-object v3, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v3

    add-float v3, v3, v35

    add-float v3, v3, v34

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 663
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v14, v3}, Lcom/itextpdf/layout/renderer/TextRenderer;->applyPaddings(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/properties/UnitValue;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 664
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v0, v1, v11, v3}, Lcom/itextpdf/layout/renderer/TextRenderer;->applyBorderBox(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/borders/Border;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 665
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v0, v1, v9, v3}, Lcom/itextpdf/layout/renderer/TextRenderer;->applyMargins(Lcom/itextpdf/kernel/geom/Rectangle;[Lcom/itextpdf/layout/properties/UnitValue;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 667
    invoke-direct {v0, v14, v11, v9}, Lcom/itextpdf/layout/renderer/TextRenderer;->increaseYLineOffset([Lcom/itextpdf/layout/properties/UnitValue;[Lcom/itextpdf/layout/borders/Border;[Lcom/itextpdf/layout/properties/UnitValue;)V

    .line 669
    if-nez v8, :cond_55

    .line 670
    new-instance v81, Lcom/itextpdf/layout/layout/TextLayoutResult;

    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    if-eqz v30, :cond_54

    move-object/from16 v86, v0

    goto :goto_2d

    :cond_54
    move-object/from16 v86, v4

    :goto_2d
    const/16 v82, 0x1

    const/16 v84, 0x0

    const/16 v85, 0x0

    move-object/from16 v83, v1

    invoke-direct/range {v81 .. v86}, Lcom/itextpdf/layout/layout/TextLayoutResult;-><init>(ILcom/itextpdf/layout/layout/LayoutArea;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 672
    move-object/from16 v1, v81

    invoke-virtual {v1, v15}, Lcom/itextpdf/layout/layout/TextLayoutResult;->setContainsPossibleBreak(Z)Lcom/itextpdf/layout/layout/TextLayoutResult;

    move-result-object v48

    move-object/from16 v8, v48

    const/4 v3, 0x1

    .end local v8    # "result":Lcom/itextpdf/layout/layout/TextLayoutResult;
    .restart local v48    # "result":Lcom/itextpdf/layout/layout/TextLayoutResult;
    goto :goto_30

    .line 675
    .end local v48    # "result":Lcom/itextpdf/layout/layout/TextLayoutResult;
    .restart local v8    # "result":Lcom/itextpdf/layout/layout/TextLayoutResult;
    :cond_55
    if-nez v52, :cond_57

    if-eqz v53, :cond_56

    goto :goto_2e

    .line 679
    :cond_56
    invoke-virtual {v0, v7}, Lcom/itextpdf/layout/renderer/TextRenderer;->split(I)[Lcom/itextpdf/layout/renderer/TextRenderer;

    move-result-object v1

    .local v1, "split":[Lcom/itextpdf/layout/renderer/TextRenderer;
    goto :goto_2f

    .line 677
    .end local v1    # "split":[Lcom/itextpdf/layout/renderer/TextRenderer;
    :cond_57
    :goto_2e
    invoke-direct {v0, v7}, Lcom/itextpdf/layout/renderer/TextRenderer;->splitIgnoreFirstNewLine(I)[Lcom/itextpdf/layout/renderer/TextRenderer;

    move-result-object v1

    .line 681
    .restart local v1    # "split":[Lcom/itextpdf/layout/renderer/TextRenderer;
    :goto_2f
    invoke-virtual {v8, v6}, Lcom/itextpdf/layout/layout/TextLayoutResult;->setSplitForcedByNewline(Z)Lcom/itextpdf/layout/layout/TextLayoutResult;

    .line 682
    aget-object v3, v1, v19

    invoke-virtual {v8, v3}, Lcom/itextpdf/layout/layout/TextLayoutResult;->setSplitRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 683
    if-eqz v13, :cond_58

    .line 684
    aget-object v3, v1, v19

    invoke-direct {v3, v13}, Lcom/itextpdf/layout/renderer/TextRenderer;->saveWordBreakIfNotYetSaved(Lcom/itextpdf/io/font/otf/Glyph;)V

    .line 688
    :cond_58
    const/4 v3, 0x1

    aget-object v4, v1, v3

    iget-object v4, v4, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v4, v4, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    aget-object v5, v1, v3

    iget-object v5, v5, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v5, v5, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-eq v4, v5, :cond_59

    .line 689
    aget-object v4, v1, v3

    invoke-virtual {v8, v4}, Lcom/itextpdf/layout/layout/TextLayoutResult;->setOverflowRenderer(Lcom/itextpdf/layout/renderer/IRenderer;)V

    goto :goto_30

    .line 692
    :cond_59
    invoke-virtual {v8, v3}, Lcom/itextpdf/layout/layout/TextLayoutResult;->setStatus(I)V

    .line 696
    .end local v1    # "split":[Lcom/itextpdf/layout/renderer/TextRenderer;
    :goto_30
    move-object/from16 v4, v25

    .end local v25    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .local v4, "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    invoke-static {v0, v4}, Lcom/itextpdf/layout/renderer/FloatingHelper;->isRendererFloating(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/layout/properties/FloatPropertyValue;)Z

    move-result v1

    if-eqz v1, :cond_5c

    .line 697
    invoke-virtual {v8}, Lcom/itextpdf/layout/layout/TextLayoutResult;->getStatus()I

    move-result v1

    if-ne v1, v3, :cond_5b

    .line 698
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    const/16 v20, 0x0

    cmpl-float v1, v1, v20

    if-lez v1, :cond_5a

    .line 699
    iget-object v1, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    move-object/from16 v3, v69

    .end local v69    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .local v3, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_31

    .line 698
    .end local v3    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .restart local v69    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    :cond_5a
    move-object/from16 v3, v69

    .end local v69    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .restart local v3    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    goto :goto_31

    .line 701
    .end local v3    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .restart local v69    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    :cond_5b
    move-object/from16 v3, v69

    .end local v69    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .restart local v3    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    invoke-virtual {v8}, Lcom/itextpdf/layout/layout/TextLayoutResult;->getStatus()I

    move-result v1

    const/4 v5, 0x2

    if-ne v1, v5, :cond_5d

    .line 702
    invoke-virtual {v8}, Lcom/itextpdf/layout/layout/TextLayoutResult;->getSplitRenderer()Lcom/itextpdf/layout/renderer/IRenderer;

    move-result-object v1

    invoke-interface {v1}, Lcom/itextpdf/layout/renderer/IRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_31

    .line 696
    .end local v3    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .restart local v69    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    :cond_5c
    move-object/from16 v3, v69

    .line 706
    .end local v69    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .restart local v3    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    :cond_5d
    :goto_31
    move-object/from16 v1, v74

    .end local v74    # "countedMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .local v1, "countedMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    invoke-virtual {v8, v1}, Lcom/itextpdf/layout/layout/TextLayoutResult;->setMinMaxWidth(Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;)Lcom/itextpdf/layout/layout/MinMaxWidthLayoutResult;

    .line 707
    if-nez v33, :cond_61

    .line 708
    move-object/from16 v74, v1

    move-object/from16 v5, v66

    .end local v1    # "countedMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .end local v66    # "leftMarginBorderPadding":[F
    .local v5, "leftMarginBorderPadding":[F
    .restart local v74    # "countedMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    array-length v1, v5

    move-object/from16 v26, v2

    move/from16 v2, v19

    .end local v2    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local v26    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    :goto_32
    if-ge v2, v1, :cond_5e

    aget v23, v5, v2

    .line 709
    .local v23, "dimension":F
    add-float v39, v39, v23

    .line 708
    .end local v23    # "dimension":F
    add-int/lit8 v2, v2, 0x1

    goto :goto_32

    .line 711
    :cond_5e
    move-object/from16 v1, v58

    .end local v58    # "rightMarginBorderPadding":[F
    .local v1, "rightMarginBorderPadding":[F
    array-length v2, v1

    move-object/from16 v69, v3

    move-object/from16 v25, v4

    move/from16 v4, v19

    move/from16 v1, v21

    move/from16 v3, v39

    .end local v4    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .end local v21    # "rightMinWidth":F
    .end local v39    # "leftMinWidth":F
    .local v1, "rightMinWidth":F
    .local v3, "leftMinWidth":F
    .restart local v25    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .restart local v58    # "rightMarginBorderPadding":[F
    .restart local v69    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    :goto_33
    if-ge v4, v2, :cond_60

    aget v21, v58, v4

    .line 712
    .local v21, "dimension":F
    const/16 v20, 0x0

    cmpg-float v23, v1, v20

    if-gez v23, :cond_5f

    .line 713
    add-float v3, v3, v21

    goto :goto_34

    .line 715
    :cond_5f
    add-float v1, v1, v21

    .line 711
    .end local v21    # "dimension":F
    :goto_34
    add-int/lit8 v4, v4, 0x1

    goto :goto_33

    .line 718
    :cond_60
    invoke-virtual {v8, v3}, Lcom/itextpdf/layout/layout/TextLayoutResult;->setLeftMinWidth(F)Lcom/itextpdf/layout/layout/TextLayoutResult;

    .line 719
    invoke-virtual {v8, v1}, Lcom/itextpdf/layout/layout/TextLayoutResult;->setRightMinWidth(F)Lcom/itextpdf/layout/layout/TextLayoutResult;

    move/from16 v21, v1

    move/from16 v39, v3

    goto :goto_35

    .line 721
    .end local v5    # "leftMarginBorderPadding":[F
    .end local v25    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .end local v26    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v69    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .end local v74    # "countedMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .local v1, "countedMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .restart local v2    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v3, "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .restart local v4    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .local v21, "rightMinWidth":F
    .restart local v39    # "leftMinWidth":F
    .restart local v66    # "leftMarginBorderPadding":[F
    :cond_61
    move-object/from16 v74, v1

    move-object/from16 v26, v2

    move-object/from16 v69, v3

    move-object/from16 v25, v4

    move-object/from16 v5, v66

    .end local v1    # "countedMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    .end local v2    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v3    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .end local v4    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .end local v66    # "leftMarginBorderPadding":[F
    .restart local v5    # "leftMarginBorderPadding":[F
    .restart local v25    # "floatPropertyValue":Lcom/itextpdf/layout/properties/FloatPropertyValue;
    .restart local v26    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local v69    # "floatRendererAreas":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    .restart local v74    # "countedMinMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    invoke-virtual/range {v74 .. v74}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMinWidth()F

    move-result v1

    invoke-virtual {v8, v1}, Lcom/itextpdf/layout/layout/TextLayoutResult;->setLeftMinWidth(F)Lcom/itextpdf/layout/layout/TextLayoutResult;

    .line 722
    move/from16 v1, v64

    invoke-virtual {v8, v1}, Lcom/itextpdf/layout/layout/TextLayoutResult;->setRightMinWidth(F)Lcom/itextpdf/layout/layout/TextLayoutResult;

    .line 724
    :goto_35
    move-object/from16 v1, v73

    .end local v73    # "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    .local v1, "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->isStartsWithSplitCharWhiteSpaceAndEndsWithSplitChar(Lcom/itextpdf/layout/splitting/ISplitCharacters;)[Z

    move-result-object v2

    .line 725
    .local v2, "startsEnds":[Z
    aget-boolean v3, v2, v19

    invoke-virtual {v8, v3}, Lcom/itextpdf/layout/layout/TextLayoutResult;->setStartsWithSplitCharacterWhiteSpace(Z)Lcom/itextpdf/layout/layout/TextLayoutResult;

    move-result-object v3

    const/16 v22, 0x1

    aget-boolean v4, v2, v22

    .line 726
    invoke-virtual {v3, v4}, Lcom/itextpdf/layout/layout/TextLayoutResult;->setEndsWithSplitCharacter(Z)Lcom/itextpdf/layout/layout/TextLayoutResult;

    .line 727
    return-object v8
.end method

.method public length()I
    .locals 2

    .line 1163
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v0, v0, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v1, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    sub-int/2addr v0, v1

    :goto_0
    return v0
.end method

.method protected lineLength()I
    .locals 2

    .line 1374
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v0, v0, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v0, v0, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v1, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    sub-int/2addr v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public moveYLineTo(F)V
    .locals 4
    .param p1, "y"    # F

    .line 1123
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TextRenderer;->getYLine()F

    move-result v0

    .line 1124
    .local v0, "curYLine":F
    sub-float v1, p1, v0

    .line 1125
    .local v1, "delta":F
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Rectangle;->getY()F

    move-result v3

    add-float/2addr v3, v1

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->setY(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1126
    return-void
.end method

.method removeReversedRanges()Lcom/itextpdf/layout/renderer/TextRenderer;
    .locals 1

    .line 1255
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->reversedRanges:Ljava/util/List;

    .line 1256
    return-object p0
.end method

.method resolveFirstPdfFont([Ljava/lang/String;Lcom/itextpdf/layout/font/FontProvider;Lcom/itextpdf/layout/font/FontCharacteristics;Lcom/itextpdf/layout/font/FontSet;)Lcom/itextpdf/kernel/font/PdfFont;
    .locals 3
    .param p1, "font"    # [Ljava/lang/String;
    .param p2, "provider"    # Lcom/itextpdf/layout/font/FontProvider;
    .param p3, "fc"    # Lcom/itextpdf/layout/font/FontCharacteristics;
    .param p4, "additionalFonts"    # Lcom/itextpdf/layout/font/FontSet;

    .line 1623
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p2, v0, p3, p4}, Lcom/itextpdf/layout/font/FontProvider;->createFontSelectorStrategy(Ljava/util/List;Lcom/itextpdf/layout/font/FontCharacteristics;Lcom/itextpdf/layout/font/FontSet;)Lcom/itextpdf/layout/font/selectorstrategy/IFontSelectorStrategy;

    move-result-object v0

    .line 1625
    .local v0, "strategy":Lcom/itextpdf/layout/font/selectorstrategy/IFontSelectorStrategy;
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->strToBeConverted:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/itextpdf/layout/font/selectorstrategy/IFontSelectorStrategy;->getGlyphLines(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 1626
    .local v1, "glyphLines":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/commons/datastructures/Tuple2<Lcom/itextpdf/io/font/otf/GlyphLine;Lcom/itextpdf/kernel/font/PdfFont;>;>;"
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 1627
    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/commons/datastructures/Tuple2;

    invoke-virtual {v2}, Lcom/itextpdf/commons/datastructures/Tuple2;->getSecond()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/font/PdfFont;

    return-object v2

    .line 1629
    :cond_0
    invoke-super {p0, p1, p2, p3, p4}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->resolveFirstPdfFont([Ljava/lang/String;Lcom/itextpdf/layout/font/FontProvider;Lcom/itextpdf/layout/font/FontCharacteristics;Lcom/itextpdf/layout/font/FontSet;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v2

    return-object v2
.end method

.method protected resolveFonts(Ljava/util/List;)Z
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            ">;)Z"
        }
    .end annotation

    .line 1519
    .local p1, "addTo":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    const/16 v0, 0x14

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/TextRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    .line 1520
    .local v0, "font":Ljava/lang/Object;
    instance-of v1, v0, Lcom/itextpdf/kernel/font/PdfFont;

    if-eqz v1, :cond_0

    .line 1521
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1522
    const/4 v1, 0x0

    return v1

    .line 1523
    :cond_0
    instance-of v1, v0, [Ljava/lang/String;

    if-eqz v1, :cond_6

    .line 1524
    const/16 v1, 0x5b

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/font/FontProvider;

    .line 1525
    .local v1, "provider":Lcom/itextpdf/layout/font/FontProvider;
    const/16 v2, 0x62

    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/font/FontSet;

    .line 1526
    .local v2, "fontSet":Lcom/itextpdf/layout/font/FontSet;
    invoke-virtual {v1}, Lcom/itextpdf/layout/font/FontProvider;->getFontSet()Lcom/itextpdf/layout/font/FontSet;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/layout/font/FontSet;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lcom/itextpdf/layout/font/FontSet;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    goto :goto_0

    .line 1527
    :cond_1
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "FontProvider and FontSet are empty. Cannot resolve font family name (see ElementPropertyContainer#setFontFamily) without initialized FontProvider (see RootElement#setFontProvider)."

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1531
    :cond_2
    :goto_0
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->strToBeConverted:Ljava/lang/String;

    if-eqz v3, :cond_4

    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->strToBeConverted:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_3

    goto :goto_2

    .line 1534
    :cond_3
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TextRenderer;->createFontCharacteristics()Lcom/itextpdf/layout/font/FontCharacteristics;

    move-result-object v3

    .line 1535
    .local v3, "fc":Lcom/itextpdf/layout/font/FontCharacteristics;
    move-object v4, v0

    check-cast v4, [Ljava/lang/String;

    check-cast v4, [Ljava/lang/String;

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v1, v4, v3, v2}, Lcom/itextpdf/layout/font/FontProvider;->createFontSelectorStrategy(Ljava/util/List;Lcom/itextpdf/layout/font/FontCharacteristics;Lcom/itextpdf/layout/font/FontSet;)Lcom/itextpdf/layout/font/selectorstrategy/IFontSelectorStrategy;

    move-result-object v4

    .line 1536
    .local v4, "strategy":Lcom/itextpdf/layout/font/selectorstrategy/IFontSelectorStrategy;
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->strToBeConverted:Ljava/lang/String;

    invoke-interface {v4, v5}, Lcom/itextpdf/layout/font/selectorstrategy/IFontSelectorStrategy;->getGlyphLines(Ljava/lang/String;)Ljava/util/List;

    move-result-object v5

    .line 1537
    .local v5, "subTextWithFont":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/commons/datastructures/Tuple2<Lcom/itextpdf/io/font/otf/GlyphLine;Lcom/itextpdf/kernel/font/PdfFont;>;>;"
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_5

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/commons/datastructures/Tuple2;

    .line 1538
    .local v7, "subText":Lcom/itextpdf/commons/datastructures/Tuple2;, "Lcom/itextpdf/commons/datastructures/Tuple2<Lcom/itextpdf/io/font/otf/GlyphLine;Lcom/itextpdf/kernel/font/PdfFont;>;"
    invoke-virtual {v7}, Lcom/itextpdf/commons/datastructures/Tuple2;->getFirst()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-virtual {v7}, Lcom/itextpdf/commons/datastructures/Tuple2;->getSecond()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/kernel/font/PdfFont;

    invoke-virtual {p0, v8, v9}, Lcom/itextpdf/layout/renderer/TextRenderer;->createCopy(Lcom/itextpdf/io/font/otf/GlyphLine;Lcom/itextpdf/kernel/font/PdfFont;)Lcom/itextpdf/layout/renderer/TextRenderer;

    move-result-object v8

    .line 1539
    .local v8, "textRenderer":Lcom/itextpdf/layout/renderer/TextRenderer;
    invoke-interface {p1, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1540
    .end local v7    # "subText":Lcom/itextpdf/commons/datastructures/Tuple2;, "Lcom/itextpdf/commons/datastructures/Tuple2<Lcom/itextpdf/io/font/otf/GlyphLine;Lcom/itextpdf/kernel/font/PdfFont;>;"
    .end local v8    # "textRenderer":Lcom/itextpdf/layout/renderer/TextRenderer;
    goto :goto_1

    .line 1532
    .end local v3    # "fc":Lcom/itextpdf/layout/font/FontCharacteristics;
    .end local v4    # "strategy":Lcom/itextpdf/layout/font/selectorstrategy/IFontSelectorStrategy;
    .end local v5    # "subTextWithFont":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/commons/datastructures/Tuple2<Lcom/itextpdf/io/font/otf/GlyphLine;Lcom/itextpdf/kernel/font/PdfFont;>;>;"
    :cond_4
    :goto_2
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1542
    :cond_5
    const/4 v3, 0x1

    return v3

    .line 1544
    .end local v1    # "provider":Lcom/itextpdf/layout/font/FontProvider;
    .end local v2    # "fontSet":Lcom/itextpdf/layout/font/FontSet;
    :cond_6
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Invalid FONT property value type."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method setIndexOfFirstCharacterToBeForcedToOverflow(I)V
    .locals 0
    .param p1, "indexOfFirstCharacterToBeForcedToOverflow"    # I

    .line 1349
    iput p1, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->indexOfFirstCharacterToBeForcedToOverflow:I

    .line 1350
    return-void
.end method

.method protected setProcessedGlyphLineAndFont(Lcom/itextpdf/io/font/otf/GlyphLine;Lcom/itextpdf/kernel/font/PdfFont;)V
    .locals 1
    .param p1, "gl"    # Lcom/itextpdf/io/font/otf/GlyphLine;
    .param p2, "font"    # Lcom/itextpdf/kernel/font/PdfFont;

    .line 1549
    iput-object p1, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 1550
    iput-object p2, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->font:Lcom/itextpdf/kernel/font/PdfFont;

    .line 1551
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->otfFeaturesApplied:Z

    .line 1552
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->strToBeConverted:Ljava/lang/String;

    .line 1553
    iput-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->specialScriptsWordBreakPoints:Ljava/util/List;

    .line 1554
    const/16 v0, 0x14

    invoke-virtual {p0, v0, p2}, Lcom/itextpdf/layout/renderer/TextRenderer;->setProperty(ILjava/lang/Object;)V

    .line 1555
    return-void
.end method

.method setSpecialScriptFirstNotFittingIndex(I)V
    .locals 0
    .param p1, "lastFittingIndex"    # I

    .line 1341
    iput p1, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->specialScriptFirstNotFittingIndex:I

    .line 1342
    return-void
.end method

.method setSpecialScriptsWordBreakPoints(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1333
    .local p1, "specialScriptsWordBreakPoints":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    iput-object p1, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->specialScriptsWordBreakPoints:Ljava/util/List;

    .line 1334
    return-void
.end method

.method public setText(Lcom/itextpdf/io/font/otf/GlyphLine;Lcom/itextpdf/kernel/font/PdfFont;)V
    .locals 1
    .param p1, "text"    # Lcom/itextpdf/io/font/otf/GlyphLine;
    .param p2, "font"    # Lcom/itextpdf/kernel/font/PdfFont;

    .line 1147
    new-instance v0, Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-direct {v0, p1}, Lcom/itextpdf/io/font/otf/GlyphLine;-><init>(Lcom/itextpdf/io/font/otf/GlyphLine;)V

    .line 1148
    .local v0, "newText":Lcom/itextpdf/io/font/otf/GlyphLine;
    invoke-static {v0, p2}, Lcom/itextpdf/layout/renderer/TextPreprocessingUtil;->replaceSpecialWhitespaceGlyphs(Lcom/itextpdf/io/font/otf/GlyphLine;Lcom/itextpdf/kernel/font/PdfFont;)Lcom/itextpdf/io/font/otf/GlyphLine;

    move-result-object v0

    .line 1149
    invoke-virtual {p0, v0, p2}, Lcom/itextpdf/layout/renderer/TextRenderer;->setProcessedGlyphLineAndFont(Lcom/itextpdf/io/font/otf/GlyphLine;Lcom/itextpdf/kernel/font/PdfFont;)V

    .line 1150
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 0
    .param p1, "text"    # Ljava/lang/String;

    .line 1135
    iput-object p1, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->strToBeConverted:Ljava/lang/String;

    .line 1137
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TextRenderer;->updateFontAndText()V

    .line 1138
    return-void
.end method

.method protected split(I)[Lcom/itextpdf/layout/renderer/TextRenderer;
    .locals 9
    .param p1, "initialOverflowTextPos"    # I

    .line 1416
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TextRenderer;->createSplitRenderer()Lcom/itextpdf/layout/renderer/TextRenderer;

    move-result-object v0

    .line 1417
    .local v0, "splitRenderer":Lcom/itextpdf/layout/renderer/TextRenderer;
    new-instance v1, Lcom/itextpdf/io/font/otf/GlyphLine;

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-direct {v1, v2}, Lcom/itextpdf/io/font/otf/GlyphLine;-><init>(Lcom/itextpdf/io/font/otf/GlyphLine;)V

    .line 1418
    .local v1, "newText":Lcom/itextpdf/io/font/otf/GlyphLine;
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v2, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    iput v2, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .line 1419
    iput p1, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    .line 1420
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->font:Lcom/itextpdf/kernel/font/PdfFont;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->setProcessedGlyphLineAndFont(Lcom/itextpdf/io/font/otf/GlyphLine;Lcom/itextpdf/kernel/font/PdfFont;)V

    .line 1421
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iput-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 1422
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->clone()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v2

    iput-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    .line 1423
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    iput-object v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1424
    iget v2, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->yLineOffset:F

    iput v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->yLineOffset:F

    .line 1425
    iget-boolean v2, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->otfFeaturesApplied:Z

    iput-boolean v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->otfFeaturesApplied:Z

    .line 1426
    const/4 v2, 0x0

    iput-boolean v2, v0, Lcom/itextpdf/layout/renderer/TextRenderer;->isLastRendererForModelElement:Z

    .line 1427
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TextRenderer;->getOwnProperties()Ljava/util/Map;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/itextpdf/layout/renderer/TextRenderer;->addAllProperties(Ljava/util/Map;)V

    .line 1429
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TextRenderer;->createOverflowRenderer()Lcom/itextpdf/layout/renderer/TextRenderer;

    move-result-object v3

    .line 1430
    .local v3, "overflowRenderer":Lcom/itextpdf/layout/renderer/TextRenderer;
    new-instance v4, Lcom/itextpdf/io/font/otf/GlyphLine;

    iget-object v5, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-direct {v4, v5}, Lcom/itextpdf/io/font/otf/GlyphLine;-><init>(Lcom/itextpdf/io/font/otf/GlyphLine;)V

    .line 1431
    .end local v1    # "newText":Lcom/itextpdf/io/font/otf/GlyphLine;
    .local v4, "newText":Lcom/itextpdf/io/font/otf/GlyphLine;
    iput p1, v4, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .line 1432
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v1, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    iput v1, v4, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    .line 1433
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->font:Lcom/itextpdf/kernel/font/PdfFont;

    invoke-virtual {v3, v4, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->setProcessedGlyphLineAndFont(Lcom/itextpdf/io/font/otf/GlyphLine;Lcom/itextpdf/kernel/font/PdfFont;)V

    .line 1434
    iget-boolean v1, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->otfFeaturesApplied:Z

    iput-boolean v1, v3, Lcom/itextpdf/layout/renderer/TextRenderer;->otfFeaturesApplied:Z

    .line 1435
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    iput-object v1, v3, Lcom/itextpdf/layout/renderer/TextRenderer;->parent:Lcom/itextpdf/layout/renderer/IRenderer;

    .line 1436
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TextRenderer;->getOwnProperties()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v3, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->addAllProperties(Ljava/util/Map;)V

    .line 1438
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->specialScriptsWordBreakPoints:Ljava/util/List;

    if-eqz v1, :cond_4

    .line 1439
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->specialScriptsWordBreakPoints:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1440
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->setSpecialScriptsWordBreakPoints(Ljava/util/List;)V

    .line 1441
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v3, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->setSpecialScriptsWordBreakPoints(Ljava/util/List;)V

    goto/16 :goto_1

    .line 1442
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->specialScriptsWordBreakPoints:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v5, -0x1

    const/4 v6, 0x1

    if-ne v1, v5, :cond_1

    .line 1443
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 1444
    .local v1, "split":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1445
    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->setSpecialScriptsWordBreakPoints(Ljava/util/List;)V

    .line 1447
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 1448
    .local v2, "overflow":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1449
    invoke-virtual {v3, v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->setSpecialScriptsWordBreakPoints(Ljava/util/List;)V

    .line 1450
    .end local v1    # "split":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v2    # "overflow":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    goto :goto_1

    .line 1451
    :cond_1
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->specialScriptsWordBreakPoints:Ljava/util/List;

    invoke-static {v1, p1, v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->findPossibleBreaksSplitPosition(Ljava/util/List;IZ)I

    move-result v1

    .line 1454
    .local v1, "splitIndex":I
    if-le v1, v5, :cond_2

    .line 1455
    iget-object v7, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->specialScriptsWordBreakPoints:Ljava/util/List;

    add-int/lit8 v8, v1, 0x1

    .line 1456
    invoke-interface {v7, v2, v8}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v2

    .line 1455
    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->setSpecialScriptsWordBreakPoints(Ljava/util/List;)V

    goto :goto_0

    .line 1458
    :cond_2
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 1459
    .local v2, "split":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1460
    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->setSpecialScriptsWordBreakPoints(Ljava/util/List;)V

    .line 1463
    .end local v2    # "split":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :goto_0
    add-int/lit8 v2, v1, 0x1

    iget-object v7, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->specialScriptsWordBreakPoints:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    if-ge v2, v7, :cond_3

    .line 1464
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->specialScriptsWordBreakPoints:Ljava/util/List;

    add-int/lit8 v5, v1, 0x1

    iget-object v6, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->specialScriptsWordBreakPoints:Ljava/util/List;

    .line 1465
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    invoke-interface {v2, v5, v6}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v2

    .line 1464
    invoke-virtual {v3, v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->setSpecialScriptsWordBreakPoints(Ljava/util/List;)V

    goto :goto_1

    .line 1467
    :cond_3
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 1468
    .restart local v2    # "split":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1469
    invoke-virtual {v3, v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->setSpecialScriptsWordBreakPoints(Ljava/util/List;)V

    .line 1474
    .end local v1    # "splitIndex":I
    .end local v2    # "split":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_4
    :goto_1
    filled-new-array {v0, v3}, [Lcom/itextpdf/layout/renderer/TextRenderer;

    move-result-object v1

    return-object v1
.end method

.method textContainsSpecialScriptGlyphs(Z)Z
    .locals 10
    .param p1, "analyzeSpecialScriptsWordBreakPointsOnly"    # Z

    .line 1293
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->specialScriptsWordBreakPoints:Ljava/util/List;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 1294
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->specialScriptsWordBreakPoints:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    xor-int/2addr v0, v1

    return v0

    .line 1297
    :cond_0
    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 1298
    return v0

    .line 1301
    :cond_1
    const/16 v2, 0x3e

    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/splitting/ISplitCharacters;

    .line 1303
    .local v2, "splitCharacters":Lcom/itextpdf/layout/splitting/ISplitCharacters;
    instance-of v3, v2, Lcom/itextpdf/layout/splitting/BreakAllSplitCharacters;

    if-eqz v3, :cond_2

    .line 1304
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->specialScriptsWordBreakPoints:Ljava/util/List;

    .line 1307
    :cond_2
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v3, v3, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .local v3, "i":I
    :goto_0
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v4, v4, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-ge v3, v4, :cond_6

    .line 1308
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-virtual {v4, v3}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v4

    .line 1309
    .local v4, "unicode":I
    const/4 v5, -0x1

    if-le v4, v5, :cond_3

    .line 1310
    invoke-static {v4}, Lcom/itextpdf/layout/renderer/TextRenderer;->codePointIsOfSpecialScript(I)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 1311
    return v1

    .line 1314
    :cond_3
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-virtual {v5, v3}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/io/font/otf/Glyph;->getChars()[C

    move-result-object v5

    .line 1315
    .local v5, "chars":[C
    if-eqz v5, :cond_5

    .line 1316
    array-length v6, v5

    move v7, v0

    :goto_1
    if-ge v7, v6, :cond_5

    aget-char v8, v5, v7

    .line 1317
    .local v8, "ch":C
    invoke-static {v8}, Lcom/itextpdf/layout/renderer/TextRenderer;->codePointIsOfSpecialScript(I)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 1318
    return v1

    .line 1316
    .end local v8    # "ch":C
    :cond_4
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 1307
    .end local v4    # "unicode":I
    .end local v5    # "chars":[C
    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1327
    .end local v3    # "i":I
    :cond_6
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->specialScriptsWordBreakPoints:Ljava/util/List;

    .line 1329
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 1168
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/GlyphLine;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public trimFirst()V
    .locals 4

    .line 1020
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TextRenderer;->updateFontAndText()V

    .line 1022
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 1024
    :goto_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v0, v0, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v2, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-ge v0, v2, :cond_0

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v2, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .line 1025
    invoke-virtual {v0, v2}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    move-object v2, v0

    .local v2, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-static {v0}, Lcom/itextpdf/io/util/TextUtil;->isWhitespace(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {v2}, Lcom/itextpdf/io/util/TextUtil;->isNewLine(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1026
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v3, v0, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    add-int/2addr v3, v1

    iput v3, v0, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    goto :goto_0

    .line 1038
    .end local v2    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_0
    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->textContainsSpecialScriptGlyphs(Z)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->specialScriptsWordBreakPoints:Ljava/util/List;

    .line 1039
    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->text:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v3, v3, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    if-ne v0, v3, :cond_2

    .line 1040
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->specialScriptsWordBreakPoints:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 1043
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->specialScriptsWordBreakPoints:Ljava/util/List;

    .line 1040
    if-ne v0, v1, :cond_1

    .line 1041
    const/4 v0, -0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v3, v2, v0}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 1043
    :cond_1
    invoke-interface {v3, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 1046
    :cond_2
    :goto_1
    return-void
.end method

.method trimLast()F
    .locals 11

    .line 1049
    const/4 v0, 0x0

    .line 1051
    .local v0, "trimmedSpace":F
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v1, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-gtz v1, :cond_0

    .line 1052
    return v0

    .line 1054
    :cond_0
    const/16 v1, 0x18

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPropertyAsUnitValue(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v2

    .line 1055
    .local v2, "fontSize":Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v3

    if-nez v3, :cond_1

    .line 1056
    const-class v3, Lcom/itextpdf/layout/renderer/TextRenderer;

    invoke-static {v3}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v3

    .line 1057
    .local v3, "logger":Lorg/slf4j/Logger;
    nop

    .line 1058
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    .line 1057
    const-string v4, "Property {0} in percents is not supported"

    invoke-static {v4, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v3, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1060
    .end local v3    # "logger":Lorg/slf4j/Logger;
    :cond_1
    const/16 v1, 0xf

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v7

    .line 1061
    .local v7, "characterSpacing":Ljava/lang/Float;
    const/16 v1, 0x4e

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v8

    .line 1062
    .local v8, "wordSpacing":Ljava/lang/Float;
    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/16 v3, 0x1d

    invoke-virtual {p0, v3, v1}, Lcom/itextpdf/layout/renderer/TextRenderer;->getPropertyAsFloat(ILjava/lang/Float;)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    .line 1064
    .local v1, "hScale":F
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v3, v3, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    add-int/lit8 v3, v3, -0x1

    move v9, v3

    .line 1065
    .local v9, "firstNonSpaceCharIndex":I
    :goto_0
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v3, v3, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    if-lt v9, v3, :cond_4

    .line 1066
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-virtual {v3, v9}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v4

    .line 1067
    .local v4, "currentGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-static {v4}, Lcom/itextpdf/io/util/TextUtil;->isWhitespace(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 1068
    goto :goto_2

    .line 1070
    :cond_2
    invoke-direct {p0, v4}, Lcom/itextpdf/layout/renderer/TextRenderer;->saveWordBreakIfNotYetSaved(Lcom/itextpdf/io/font/otf/Glyph;)V

    .line 1072
    nop

    .line 1073
    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v5

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    move-object v3, p0

    invoke-direct/range {v3 .. v8}, Lcom/itextpdf/layout/renderer/TextRenderer;->getCharWidth(Lcom/itextpdf/io/font/otf/Glyph;FLjava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;)F

    move-result v5

    .line 1072
    invoke-static {v5}, Lcom/itextpdf/io/font/FontProgram;->convertTextSpaceToGlyphSpace(F)F

    move-result v3

    .line 1074
    .local v3, "currentCharWidth":F
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v5, v5, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    if-le v9, v5, :cond_3

    iget-object v5, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    add-int/lit8 v6, v9, -0x1

    .line 1075
    invoke-virtual {v5, v6}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/io/font/otf/Glyph;->getXAdvance()S

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v6

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    invoke-direct {p0, v5, v6, v10}, Lcom/itextpdf/layout/renderer/TextRenderer;->scaleXAdvance(FFLjava/lang/Float;)F

    move-result v5

    .line 1074
    invoke-static {v5}, Lcom/itextpdf/io/font/FontProgram;->convertTextSpaceToGlyphSpace(F)F

    move-result v5

    goto :goto_1

    :cond_3
    const/4 v5, 0x0

    .line 1076
    .local v5, "xAdvance":F
    :goto_1
    sub-float v6, v3, v5

    add-float/2addr v0, v6

    .line 1077
    iget-object v6, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v6}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v6

    iget-object v10, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->occupiedArea:Lcom/itextpdf/layout/layout/LayoutArea;

    invoke-virtual {v10}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v10

    invoke-virtual {v10}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v10

    sub-float/2addr v10, v3

    invoke-virtual {v6, v10}, Lcom/itextpdf/kernel/geom/Rectangle;->setWidth(F)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 1079
    nop

    .end local v3    # "currentCharWidth":F
    .end local v4    # "currentGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    .end local v5    # "xAdvance":F
    add-int/lit8 v9, v9, -0x1

    .line 1080
    goto :goto_0

    .line 1082
    :cond_4
    :goto_2
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/TextRenderer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    add-int/lit8 v4, v9, 0x1

    iput v4, v3, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    .line 1084
    return v0
.end method
