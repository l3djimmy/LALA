.class Lcom/itextpdf/layout/renderer/LineHeightHelper;
.super Ljava/lang/Object;
.source "LineHeightHelper.java"


# static fields
.field public static final ASCENDER_INDEX:I = 0x0

.field private static final DEFAULT_LINE_HEIGHT_COEFF:F = 1.15f

.field public static final DESCENDER_INDEX:I = 0x1

.field public static final LEADING_INDEX:I = 0x3

.field public static final XHEIGHT_INDEX:I = 0x2


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    return-void
.end method

.method static calculateLineHeight(Lcom/itextpdf/layout/renderer/AbstractRenderer;)F
    .locals 6
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 87
    const/16 v0, 0x7c

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/LineHeight;

    .line 88
    .local v0, "lineHeight":Lcom/itextpdf/layout/properties/LineHeight;
    const/16 v1, 0x18

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsUnitValue(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v1

    .line 90
    .local v1, "fontSize":F
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/LineHeight;->isNormalValue()Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/LineHeight;->getValue()F

    move-result v2

    const/4 v3, 0x0

    cmpg-float v2, v2, v3

    if-gez v2, :cond_0

    goto :goto_0

    .line 98
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/LineHeight;->isFixedValue()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 99
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/LineHeight;->getValue()F

    move-result v2

    .local v2, "lineHeightValue":F
    goto :goto_1

    .line 101
    .end local v2    # "lineHeightValue":F
    :cond_1
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/LineHeight;->getValue()F

    move-result v2

    mul-float/2addr v2, v1

    .restart local v2    # "lineHeightValue":F
    goto :goto_1

    .line 91
    .end local v2    # "lineHeightValue":F
    :cond_2
    :goto_0
    const v2, 0x3f933333    # 1.15f

    mul-float/2addr v2, v1

    .line 92
    .restart local v2    # "lineHeightValue":F
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/LineHeightHelper;->getFontAscenderDescenderNormalized(Lcom/itextpdf/layout/renderer/AbstractRenderer;)[F

    move-result-object v3

    .line 93
    .local v3, "fontAscenderDescender":[F
    const/4 v4, 0x0

    aget v4, v3, v4

    const/4 v5, 0x1

    aget v5, v3, v5

    sub-float/2addr v4, v5

    .line 94
    .local v4, "fontAscenderDescenderSum":F
    cmpl-float v5, v4, v2

    if-lez v5, :cond_3

    .line 95
    move v2, v4

    .line 97
    .end local v3    # "fontAscenderDescender":[F
    .end local v4    # "fontAscenderDescenderSum":F
    :cond_3
    nop

    .line 104
    :goto_1
    return v2
.end method

.method static getActualAscenderDescender(Lcom/itextpdf/layout/renderer/AbstractRenderer;)[F
    .locals 6
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 49
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/LineHeightHelper;->getActualFontInfo(Lcom/itextpdf/layout/renderer/AbstractRenderer;)[F

    move-result-object v0

    .line 50
    .local v0, "result":[F
    const/4 v1, 0x0

    aget v2, v0, v1

    const/4 v3, 0x1

    aget v4, v0, v3

    const/4 v5, 0x2

    new-array v5, v5, [F

    aput v2, v5, v1

    aput v4, v5, v3

    return-object v5
.end method

.method static getActualFontInfo(Lcom/itextpdf/layout/renderer/AbstractRenderer;)[F
    .locals 10
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 63
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/LineHeightHelper;->calculateLineHeight(Lcom/itextpdf/layout/renderer/AbstractRenderer;)F

    move-result v0

    .line 64
    .local v0, "lineHeight":F
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/LineHeightHelper;->getFontAscenderDescenderNormalized(Lcom/itextpdf/layout/renderer/AbstractRenderer;)[F

    move-result-object v1

    .line 65
    .local v1, "fontAscenderDescender":[F
    const/4 v2, 0x0

    aget v3, v1, v2

    const/4 v4, 0x1

    aget v5, v1, v4

    sub-float/2addr v3, v5

    sub-float v3, v0, v3

    .line 66
    .local v3, "leading":F
    aget v5, v1, v2

    const/high16 v6, 0x40000000    # 2.0f

    div-float v7, v3, v6

    add-float/2addr v5, v7

    .line 67
    .local v5, "ascender":F
    aget v7, v1, v4

    div-float v6, v3, v6

    sub-float/2addr v7, v6

    .line 68
    .local v7, "descender":F
    const/4 v6, 0x2

    aget v8, v1, v6

    const/4 v9, 0x4

    new-array v9, v9, [F

    aput v5, v9, v2

    aput v7, v9, v4

    aput v8, v9, v6

    const/4 v2, 0x3

    aput v3, v9, v2

    return-object v9
.end method

.method static getFontAscenderDescenderNormalized(Lcom/itextpdf/layout/renderer/AbstractRenderer;)[F
    .locals 9
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 72
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->resolveFirstPdfFont()Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    .line 73
    .local v0, "font":Lcom/itextpdf/kernel/font/PdfFont;
    const/16 v1, 0x18

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsUnitValue(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v1

    .line 74
    .local v1, "fontSize":F
    sget-object v2, Lcom/itextpdf/layout/properties/RenderingMode;->HTML_MODE:Lcom/itextpdf/layout/properties/RenderingMode;

    invoke-static {v0, v2}, Lcom/itextpdf/layout/renderer/TextRenderer;->calculateAscenderDescender(Lcom/itextpdf/kernel/font/PdfFont;Lcom/itextpdf/layout/properties/RenderingMode;)[F

    move-result-object v2

    .line 76
    .local v2, "fontAscenderDescenderFromMetrics":[F
    const/4 v3, 0x0

    aget v4, v2, v3

    .line 77
    invoke-static {v4}, Lcom/itextpdf/io/font/FontProgram;->convertTextSpaceToGlyphSpace(F)F

    move-result v4

    mul-float/2addr v4, v1

    .line 78
    .local v4, "fontAscender":F
    const/4 v5, 0x1

    aget v6, v2, v5

    .line 79
    invoke-static {v6}, Lcom/itextpdf/io/font/FontProgram;->convertTextSpaceToGlyphSpace(F)F

    move-result v6

    mul-float/2addr v6, v1

    .line 80
    .local v6, "fontDescender":F
    nop

    .line 81
    invoke-virtual {v0}, Lcom/itextpdf/kernel/font/PdfFont;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/io/font/FontProgram;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/io/font/FontMetrics;->getXHeight()I

    move-result v7

    int-to-float v7, v7

    invoke-static {v7}, Lcom/itextpdf/io/font/FontProgram;->convertTextSpaceToGlyphSpace(F)F

    move-result v7

    mul-float/2addr v7, v1

    .line 83
    .local v7, "xHeight":F
    const/4 v8, 0x3

    new-array v8, v8, [F

    aput v4, v8, v3

    aput v6, v8, v5

    const/4 v3, 0x2

    aput v7, v8, v3

    return-object v8
.end method
