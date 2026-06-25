.class public Lcom/itextpdf/kernel/colors/PatternColor;
.super Lcom/itextpdf/kernel/colors/Color;
.source "PatternColor.java"


# instance fields
.field private pattern:Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern;

.field private underlyingColor:Lcom/itextpdf/kernel/colors/Color;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;Lcom/itextpdf/kernel/colors/Color;)V
    .locals 2
    .param p1, "uncoloredPattern"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;
    .param p2, "color"    # Lcom/itextpdf/kernel/colors/Color;

    .line 55
    invoke-virtual {p2}, Lcom/itextpdf/kernel/colors/Color;->getColorSpace()Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;

    move-result-object v0

    invoke-virtual {p2}, Lcom/itextpdf/kernel/colors/Color;->getColorValue()[F

    move-result-object v1

    invoke-direct {p0, p1, v0, v1}, Lcom/itextpdf/kernel/colors/PatternColor;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[F)V

    .line 56
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[F)V
    .locals 2
    .param p1, "uncoloredPattern"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;
    .param p2, "underlyingCS"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
    .param p3, "colorValue"    # [F

    .line 66
    new-instance v0, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$UncoloredTilingPattern;

    invoke-static {p2}, Lcom/itextpdf/kernel/colors/PatternColor;->ensureNotPatternCs(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;)Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$UncoloredTilingPattern;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;)V

    invoke-direct {p0, p1, v0, p3}, Lcom/itextpdf/kernel/colors/PatternColor;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$UncoloredTilingPattern;[F)V

    .line 67
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$UncoloredTilingPattern;[F)V
    .locals 1
    .param p1, "uncoloredPattern"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Tiling;
    .param p2, "uncoloredTilingCS"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$UncoloredTilingPattern;
    .param p3, "colorValue"    # [F

    .line 77
    invoke-direct {p0, p2, p3}, Lcom/itextpdf/kernel/colors/Color;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[F)V

    .line 78
    iput-object p1, p0, Lcom/itextpdf/kernel/colors/PatternColor;->pattern:Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern;

    .line 79
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$UncoloredTilingPattern;->getUnderlyingColorSpace()Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;

    move-result-object v0

    invoke-static {v0, p3}, Lcom/itextpdf/kernel/colors/PatternColor;->makeColor(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[F)Lcom/itextpdf/kernel/colors/Color;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/colors/PatternColor;->underlyingColor:Lcom/itextpdf/kernel/colors/Color;

    .line 80
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern;)V
    .locals 2
    .param p1, "coloredPattern"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern;

    .line 44
    new-instance v0, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Pattern;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Pattern;-><init>()V

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/itextpdf/kernel/colors/Color;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[F)V

    .line 45
    iput-object p1, p0, Lcom/itextpdf/kernel/colors/PatternColor;->pattern:Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern;

    .line 46
    return-void
.end method

.method private static ensureNotPatternCs(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;)Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
    .locals 2
    .param p0, "underlyingCS"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;

    .line 108
    instance-of v0, p0, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Pattern;

    if-nez v0, :cond_0

    .line 110
    return-object p0

    .line 109
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "underlyingCS"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "o"    # Ljava/lang/Object;

    .line 99
    invoke-super {p0, p1}, Lcom/itextpdf/kernel/colors/Color;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 100
    return v1

    .line 102
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/colors/PatternColor;

    .line 103
    .local v0, "color":Lcom/itextpdf/kernel/colors/PatternColor;
    iget-object v2, p0, Lcom/itextpdf/kernel/colors/PatternColor;->pattern:Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern;

    iget-object v3, v0, Lcom/itextpdf/kernel/colors/PatternColor;->pattern:Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/itextpdf/kernel/colors/PatternColor;->underlyingColor:Lcom/itextpdf/kernel/colors/Color;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/itextpdf/kernel/colors/PatternColor;->underlyingColor:Lcom/itextpdf/kernel/colors/Color;

    iget-object v3, v0, Lcom/itextpdf/kernel/colors/PatternColor;->underlyingColor:Lcom/itextpdf/kernel/colors/Color;

    .line 104
    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/colors/Color;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_0

    :cond_1
    iget-object v2, v0, Lcom/itextpdf/kernel/colors/PatternColor;->underlyingColor:Lcom/itextpdf/kernel/colors/Color;

    if-nez v2, :cond_2

    :goto_0
    const/4 v1, 0x1

    goto :goto_1

    :cond_2
    nop

    .line 103
    :goto_1
    return v1
.end method

.method public getPattern()Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern;
    .locals 1

    .line 88
    iget-object v0, p0, Lcom/itextpdf/kernel/colors/PatternColor;->pattern:Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern;

    return-object v0
.end method

.method public setColorValue([F)V
    .locals 1
    .param p1, "value"    # [F

    .line 93
    invoke-super {p0, p1}, Lcom/itextpdf/kernel/colors/Color;->setColorValue([F)V

    .line 94
    iget-object v0, p0, Lcom/itextpdf/kernel/colors/PatternColor;->underlyingColor:Lcom/itextpdf/kernel/colors/Color;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/colors/Color;->setColorValue([F)V

    .line 95
    return-void
.end method
